double StoredPhotoLayoutProto.backgroundZorder.getter()
{
  return sub_2592B86A0(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
}

double StoredPhotoLayoutProto.foregroundZorder.getter()
{
  return sub_2592B86A0(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
}

double sub_2592B86A0(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20)) + *a1;
  swift_beginAccess();
  return *(double *)v2;
}

double StoredPhotoLayoutProto.timeElementZorder.getter()
{
  return sub_2592B86A0(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
}

double StoredPhotoLayoutProto.imageAotbrightness.getter()
{
  return sub_2592B86A0(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
}

uint64_t StoredPhotoLayoutProto.userEdited.getter()
{
  uint64_t v1 = (unsigned __int8 *)(*(void *)(v0 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20))
                         + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  swift_beginAccess();
  return *v1;
}

uint64_t StoredPhotoLayoutProto.baseImage.setter(uint64_t a1)
{
  return sub_2592B8914(a1, &qword_26A37E740, type metadata accessor for StoredPhotoLayoutImageLocationProto, type metadata accessor for StoredPhotoLayoutImageLocationProto, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage);
}

uint64_t StoredPhotoLayoutProto.maskImage.setter(uint64_t a1)
{
  return sub_2592B8914(a1, &qword_26A37E740, type metadata accessor for StoredPhotoLayoutImageLocationProto, type metadata accessor for StoredPhotoLayoutImageLocationProto, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage);
}

uint64_t StoredPhotoLayoutProto.originalCrop.setter(uint64_t a1)
{
  return sub_2592B8914(a1, &qword_26A37E738, type metadata accessor for StoredPhotoLayoutRectProto, type metadata accessor for StoredPhotoLayoutRectProto, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop);
}

uint64_t StoredPhotoLayoutProto.timePosition.setter(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_2592BFA8C(v5);
    swift_release();
    *(void *)(v2 + v4) = v6;
    swift_release();
  }
  v7 = (_DWORD *)(*(void *)(v2 + v4)
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  uint64_t result = swift_beginAccess();
  _DWORD *v7 = a1;
  return result;
}

uint64_t StoredPhotoLayoutProto.timeRect.setter(uint64_t a1)
{
  return sub_2592B8914(a1, &qword_26A37E738, type metadata accessor for StoredPhotoLayoutRectProto, type metadata accessor for StoredPhotoLayoutRectProto, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect);
}

uint64_t sub_2592B8914(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void), void *a5)
{
  uint64_t v10 = v5;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v17 = (char *)&v25 - v16;
  uint64_t v18 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    v25 = a3;
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v19 = swift_retain();
    uint64_t v20 = sub_2592BFA8C(v19);
    a3 = v25;
    swift_release();
    *(void *)(v10 + v18) = v20;
    swift_release();
  }
  uint64_t v21 = *(void *)(v10 + v18);
  sub_2592BA140(a1, (uint64_t)v17, a3);
  uint64_t v22 = a4(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 0, 1, v22);
  sub_25924A404((uint64_t)v17, (uint64_t)v15, a2);
  uint64_t v23 = v21 + *a5;
  swift_beginAccess();
  swift_retain();
  sub_259299F40((uint64_t)v15, v23, a2);
  swift_endAccess();
  return swift_release();
}

uint64_t StoredPhotoLayoutProto.backgroundZorder.setter(double a1)
{
  return sub_2592B8B08(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder, a1);
}

uint64_t StoredPhotoLayoutProto.foregroundZorder.setter(double a1)
{
  return sub_2592B8B08(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder, a1);
}

uint64_t sub_2592B8B08(void *a1, double a2)
{
  uint64_t v4 = v2;
  uint64_t v6 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v7 = swift_retain();
    uint64_t v8 = sub_2592BFA8C(v7);
    swift_release();
    *(void *)(v4 + v6) = v8;
    swift_release();
  }
  v9 = (double *)(*(void *)(v4 + v6) + *a1);
  uint64_t result = swift_beginAccess();
  double *v9 = a2;
  return result;
}

uint64_t StoredPhotoLayoutProto.timeElementZorder.setter(double a1)
{
  return sub_2592B8B08(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder, a1);
}

uint64_t StoredPhotoLayoutProto.imageAotbrightness.setter(double a1)
{
  return sub_2592B8B08(&OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness, a1);
}

uint64_t StoredPhotoLayoutProto.userEdited.setter(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_2592BFA8C(v5);
    swift_release();
    *(void *)(v2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = (unsigned char *)(*(void *)(v2 + v4)
               + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  uint64_t result = swift_beginAccess();
  unsigned char *v7 = a1 & 1;
  return result;
}

BOOL StoredPhotoLayoutImageLocationProto.hasLocation.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 24) + 8) != 0;
}

uint64_t StoredPhotoLayoutImageLocationProto.location.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 24));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t StoredPhotoLayoutImageLocationProto.location.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

void StoredPhotoLayoutImageLocationTypeProto.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

unint64_t StoredPhotoLayoutImageLocationTypeProto.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result < 3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t StoredPhotoLayoutImageLocationTypeProto.rawValue.getter()
{
  return *(void *)v0;
}

unint64_t sub_2592B8DA0@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result < 3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

void *sub_2592B8DB8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result >= 3uLL;
  *(void *)a2 = *result;
  char v3 = !v2;
  *(unsigned char *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_2592B8DD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2592C00F4();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

void sub_2592B8E20()
{
  qword_26A37EBF0 = (uint64_t)&unk_270728668;
}

uint64_t static StoredPhotoLayoutImageLocationTypeProto.allCases.getter()
{
  if (qword_26A37C758 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_2592B8E90@<X0>(void *a1@<X8>)
{
  if (qword_26A37C758 != -1) {
    swift_once();
  }
  *a1 = qword_26A37EBF0;
  return swift_bridgeObjectRetain();
}

uint64_t StoredPhotoProto.localIdentifier.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_259261DE0(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t StoredPhotoProto.localIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_259261F50(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*StoredPhotoProto.localIdentifier.modify())()
{
  return nullsub_1;
}

double StoredPhotoProto.date.getter()
{
  return *(double *)(v0 + 16);
}

void StoredPhotoProto.date.setter(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*StoredPhotoProto.date.modify())()
{
  return nullsub_1;
}

double StoredPhotoProto.parallaxScale.getter()
{
  return *(double *)(v0 + 24);
}

void StoredPhotoProto.parallaxScale.setter(double a1)
{
  *(double *)(v1 + 24) = a1;
}

uint64_t (*StoredPhotoProto.parallaxScale.modify())()
{
  return nullsub_1;
}

uint64_t StoredPhotoProto.preferredLayout.getter()
{
  return *(unsigned int *)(v0 + 32);
}

uint64_t StoredPhotoProto.preferredLayout.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*StoredPhotoProto.preferredLayout.modify())()
{
  return nullsub_1;
}

uint64_t StoredPhotoProto.layouts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StoredPhotoProto.layouts.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*StoredPhotoProto.layouts.modify())()
{
  return nullsub_1;
}

uint64_t sub_2592B906C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for StoredPhotoProto(0) + 40));
  unint64_t v4 = v3[1];
  if (v4)
  {
    uint64_t v5 = *v3;
    unint64_t v6 = v4;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0xE000000000000000;
  }
  *a2 = v5;
  a2[1] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2592B90D0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for StoredPhotoProto(0) + 40));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t (*StoredPhotoProto.accessibilityDescription.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for StoredPhotoProto(0) + 40);
  *(_DWORD *)(a1 + 24) = v3;
  unint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_2592B91A0;
}

Swift::Void __swiftcall StoredPhotoProto.clearAccessibilityDescription()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for StoredPhotoProto(0) + 40));
  swift_bridgeObjectRelease();
  *uint64_t v1 = 0;
  v1[1] = 0;
}

uint64_t StoredPhotoProto.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredPhotoProto(0) + 36);
  uint64_t v4 = sub_2593095B0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t StoredPhotoProto.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredPhotoProto(0) + 36);
  uint64_t v4 = sub_2593095B0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*StoredPhotoProto.unknownFields.modify())(void, void, void, void)
{
  return nullsub_1;
}

uint64_t StoredPhotoProto.init()@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_259314C30;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = MEMORY[0x263F8EE78];
  uint64_t v2 = type metadata accessor for StoredPhotoProto(0);
  uint64_t result = sub_2593095A0();
  uint64_t v4 = (void *)(a1 + *(int *)(v2 + 40));
  *uint64_t v4 = 0;
  v4[1] = 0;
  return result;
}

void StoredPhotoLayoutImageLocationProto.type.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t StoredPhotoLayoutImageLocationProto.type.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = v2;
  return result;
}

uint64_t (*StoredPhotoLayoutImageLocationProto.type.modify())()
{
  return nullsub_1;
}

uint64_t sub_2592B93C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 24));
  unint64_t v4 = v3[1];
  if (v4)
  {
    uint64_t v5 = *v3;
    unint64_t v6 = v4;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0xE000000000000000;
  }
  *a2 = v5;
  a2[1] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2592B9424(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 24));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t (*StoredPhotoLayoutImageLocationProto.location.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  unint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_2592B91A0;
}

uint64_t sub_2592B94F4(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)(a1[2] + *((int *)a1 + 6));
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
  }
  return result;
}

Swift::Void __swiftcall StoredPhotoLayoutImageLocationProto.clearLocation()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 24));
  swift_bridgeObjectRelease();
  *uint64_t v1 = 0;
  v1[1] = 0;
}

uint64_t StoredPhotoLayoutImageLocationProto.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 20);
  uint64_t v4 = sub_2593095B0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t StoredPhotoLayoutImageLocationProto.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredPhotoLayoutImageLocationProto(0) + 20);
  uint64_t v4 = sub_2593095B0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*StoredPhotoLayoutImageLocationProto.unknownFields.modify())(void, void, void, void)
{
  return nullsub_1;
}

uint64_t StoredPhotoLayoutImageLocationProto.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  uint64_t v2 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  uint64_t result = sub_2593095A0();
  uint64_t v4 = (void *)(a1 + *(int *)(v2 + 24));
  *uint64_t v4 = 0;
  v4[1] = 0;
  return result;
}

uint64_t type metadata accessor for StoredPhotoLayoutImageLocationProto(uint64_t a1)
{
  return sub_259296DD8(a1, (uint64_t *)&unk_26A37ED68);
}

void (*StoredPhotoLayoutProto.baseImage.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E740);
  unint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  uint64_t v7 = *(void *)(v6 - 8);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  v9 = (char *)malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20))
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage;
  swift_beginAccess();
  sub_2592207A0(v10, (uint64_t)v5, &qword_26A37E740);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *(void *)v9 = 0;
    v9[8] = 1;
    sub_2593095A0();
    v11 = &v9[*(int *)(v6 + 24)];
    *(void *)v11 = 0;
    *((void *)v11 + 1) = 0;
    sub_25924A3A8((uint64_t)v5, &qword_26A37E740);
  }
  else
  {
    sub_2592BA140((uint64_t)v5, (uint64_t)v9, type metadata accessor for StoredPhotoLayoutImageLocationProto);
  }
  return sub_2592B9914;
}

void sub_2592B9914(uint64_t a1, char a2)
{
}

BOOL StoredPhotoLayoutProto.hasBaseImage.getter()
{
  return sub_2592B9968(&qword_26A37E740, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage, type metadata accessor for StoredPhotoLayoutImageLocationProto);
}

BOOL sub_2592B9968(uint64_t *a1, void *a2, uint64_t (*a3)(void))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v3 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20)) + *a2;
  swift_beginAccess();
  sub_2592207A0(v10, (uint64_t)v9, a1);
  uint64_t v11 = a3(0);
  BOOL v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_25924A3A8((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall StoredPhotoLayoutProto.clearBaseImage()()
{
}

uint64_t sub_2592B9AA4@<X0>(uint64_t a1@<X0>, void *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E740);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20)) + *a2;
  swift_beginAccess();
  sub_2592207A0(v9, (uint64_t)v8, &qword_26A37E740);
  uint64_t v10 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v8, 1, v10) != 1) {
    return sub_2592BA140((uint64_t)v8, a3, type metadata accessor for StoredPhotoLayoutImageLocationProto);
  }
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  sub_2593095A0();
  uint64_t v11 = (void *)(a3 + *(int *)(v10 + 24));
  void *v11 = 0;
  v11[1] = 0;
  return sub_25924A3A8((uint64_t)v8, &qword_26A37E740);
}

uint64_t sub_2592B9C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(char *))
{
  uint64_t v10 = a5(0);
  MEMORY[0x270FA5388](v10 - 8);
  BOOL v12 = (char *)&v14 - v11;
  sub_2592BFFE4(a1, (uint64_t)&v14 - v11, a6);
  return a7(v12);
}

void (*StoredPhotoLayoutProto.maskImage.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E740);
  unint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  uint64_t v7 = *(void *)(v6 - 8);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = (char *)malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20))
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage;
  swift_beginAccess();
  sub_2592207A0(v10, (uint64_t)v5, &qword_26A37E740);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    *(void *)uint64_t v9 = 0;
    v9[8] = 1;
    sub_2593095A0();
    uint64_t v11 = &v9[*(int *)(v6 + 24)];
    *(void *)uint64_t v11 = 0;
    *((void *)v11 + 1) = 0;
    sub_25924A3A8((uint64_t)v5, &qword_26A37E740);
  }
  else
  {
    sub_2592BA140((uint64_t)v5, (uint64_t)v9, type metadata accessor for StoredPhotoLayoutImageLocationProto);
  }
  return sub_2592B9E70;
}

void sub_2592B9E70(uint64_t a1, char a2)
{
}

void sub_2592B9E9C(uint64_t a1, char a2, void (*a3)(void *), uint64_t (*a4)(void))
{
  unint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void **)(*(void *)a1 + 40);
  uint64_t v7 = *(void **)(*(void *)a1 + 48);
  size_t v8 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    sub_2592BFFE4(*(void *)(*(void *)a1 + 48), (uint64_t)v6, a4);
    a3(v6);
    sub_2592C004C((uint64_t)v7, a4);
  }
  else
  {
    a3(*(void **)(*(void *)a1 + 48));
  }
  free(v7);
  free(v6);
  free(v8);
  free(v5);
}

Swift::Void __swiftcall StoredPhotoLayoutProto.clearMaskImage()()
{
}

uint64_t sub_2592B9F74(uint64_t *a1, uint64_t (*a2)(void), void *a3)
{
  uint64_t v7 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v12 = swift_retain();
    uint64_t v13 = sub_2592BFA8C(v12);
    swift_release();
    *(void *)(v7 + v11) = v13;
    swift_release();
  }
  uint64_t v14 = *(void *)(v7 + v11);
  uint64_t v15 = a2(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 1, 1, v15);
  uint64_t v16 = v14 + *a3;
  swift_beginAccess();
  swift_retain();
  sub_259299F40((uint64_t)v10, v16, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t StoredPhotoLayoutRectProto.init()@<X0>(_OWORD *a1@<X8>)
{
  *a1 = 0u;
  a1[1] = 0u;
  return sub_2593095A0();
}

uint64_t type metadata accessor for StoredPhotoLayoutRectProto(uint64_t a1)
{
  return sub_259296DD8(a1, (uint64_t *)&unk_26A37ED88);
}

uint64_t sub_2592BA140(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for StoredPhotoLayoutProto._StorageClass(uint64_t a1)
{
  return sub_259296DD8(a1, (uint64_t *)&unk_26A37ED98);
}

void (*StoredPhotoLayoutProto.originalCrop.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E738);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = type metadata accessor for StoredPhotoLayoutRectProto(0);
  uint64_t v7 = *(void *)(v6 - 8);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20))
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop;
  swift_beginAccess();
  sub_2592207A0(v10, (uint64_t)v5, &qword_26A37E738);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    _OWORD *v9 = 0u;
    v9[1] = 0u;
    sub_2593095A0();
    sub_25924A3A8((uint64_t)v5, &qword_26A37E738);
  }
  else
  {
    sub_2592BA140((uint64_t)v5, (uint64_t)v9, type metadata accessor for StoredPhotoLayoutRectProto);
  }
  return sub_2592BA378;
}

void sub_2592BA378(uint64_t a1, char a2)
{
}

BOOL StoredPhotoLayoutProto.hasOriginalCrop.getter()
{
  return sub_2592B9968(&qword_26A37E738, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop, type metadata accessor for StoredPhotoLayoutRectProto);
}

Swift::Void __swiftcall StoredPhotoLayoutProto.clearOriginalCrop()()
{
}

uint64_t sub_2592BA3F4(int *a1, uint64_t a2)
{
  int v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_2592BFA8C(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = (_DWORD *)(*(void *)(a2 + v4)
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  uint64_t result = swift_beginAccess();
  _DWORD *v7 = v3;
  return result;
}

void (*StoredPhotoLayoutProto.timePosition.modify(void *a1))(uint64_t *a1, char a2)
{
  int v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  *((_DWORD *)v3 + 21) = v4;
  uint64_t v5 = (_DWORD *)(*(void *)(v1 + v4)
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  swift_beginAccess();
  *((_DWORD *)v3 + 20) = *v5;
  return sub_2592BA544;
}

void sub_2592BA544(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  int v4 = *(_DWORD *)(*a1 + 80);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 84);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_2592BFA8C(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (_DWORD *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 84))
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  swift_beginAccess();
  *uint64_t v10 = v4;
  free((void *)v3);
}

uint64_t sub_2592BA63C@<X0>(uint64_t a1@<X0>, void *a2@<X3>, _OWORD *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E738);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20)) + *a2;
  swift_beginAccess();
  sub_2592207A0(v9, (uint64_t)v8, &qword_26A37E738);
  uint64_t v10 = type metadata accessor for StoredPhotoLayoutRectProto(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v8, 1, v10) != 1) {
    return sub_2592BA140((uint64_t)v8, (uint64_t)a3, type metadata accessor for StoredPhotoLayoutRectProto);
  }
  *a3 = 0u;
  a3[1] = 0u;
  sub_2593095A0();
  return sub_25924A3A8((uint64_t)v8, &qword_26A37E738);
}

void (*StoredPhotoLayoutProto.timeRect.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E738);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = type metadata accessor for StoredPhotoLayoutRectProto(0);
  uint64_t v7 = *(void *)(v6 - 8);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20))
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect;
  swift_beginAccess();
  sub_2592207A0(v10, (uint64_t)v5, &qword_26A37E738);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    _OWORD *v9 = 0u;
    v9[1] = 0u;
    sub_2593095A0();
    sub_25924A3A8((uint64_t)v5, &qword_26A37E738);
  }
  else
  {
    sub_2592BA140((uint64_t)v5, (uint64_t)v9, type metadata accessor for StoredPhotoLayoutRectProto);
  }
  return sub_2592BA944;
}

void sub_2592BA944(uint64_t a1, char a2)
{
}

BOOL StoredPhotoLayoutProto.hasTimeRect.getter()
{
  return sub_2592B9968(&qword_26A37E738, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect, type metadata accessor for StoredPhotoLayoutRectProto);
}

Swift::Void __swiftcall StoredPhotoLayoutProto.clearTimeRect()()
{
}

void (*StoredPhotoLayoutProto.backgroundZorder.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = (void *)(*(void *)(v1 + v4)
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
  swift_beginAccess();
  v3[9] = *v5;
  return sub_2592BAA54;
}

void sub_2592BAA54(uint64_t *a1, char a2)
{
}

uint64_t sub_2592BAA60(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = *a1;
  uint64_t v8 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v9 = swift_retain();
    uint64_t v10 = sub_2592BFA8C(v9);
    swift_release();
    *(void *)(a2 + v8) = v10;
    swift_release();
  }
  uint64_t v11 = (void *)(*(void *)(a2 + v8) + *a5);
  uint64_t result = swift_beginAccess();
  void *v11 = v7;
  return result;
}

void (*StoredPhotoLayoutProto.foregroundZorder.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = (void *)(*(void *)(v1 + v4)
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
  swift_beginAccess();
  v3[9] = *v5;
  return sub_2592BABB8;
}

void sub_2592BABB8(uint64_t *a1, char a2)
{
}

void sub_2592BABC4(uint64_t *a1, char a2, void *a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void *)(*a1 + 72);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v8 = *(int *)(v5 + 88);
    uint64_t v9 = *(void *)(v5 + 80);
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v10 = swift_retain();
    uint64_t v11 = sub_2592BFA8C(v10);
    swift_release();
    *(void *)(v9 + v8) = v11;
    swift_release();
  }
LABEL_4:
  uint64_t v12 = (void *)(*(void *)(*(void *)(v5 + 80) + *(int *)(v5 + 88)) + *a3);
  swift_beginAccess();
  *uint64_t v12 = v6;
  free((void *)v5);
}

void (*StoredPhotoLayoutProto.timeElementZorder.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = (void *)(*(void *)(v1 + v4)
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
  swift_beginAccess();
  v3[9] = *v5;
  return sub_2592BAD58;
}

void sub_2592BAD58(uint64_t *a1, char a2)
{
}

void (*StoredPhotoLayoutProto.imageAotbrightness.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = (void *)(*(void *)(v1 + v4)
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
  swift_beginAccess();
  v3[9] = *v5;
  return sub_2592BADF8;
}

void sub_2592BADF8(uint64_t *a1, char a2)
{
}

uint64_t sub_2592BAE04(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v5 = swift_retain();
    uint64_t v6 = sub_2592BFA8C(v5);
    swift_release();
    *(void *)(a2 + v4) = v6;
    swift_release();
  }
  uint64_t v7 = (unsigned char *)(*(void *)(a2 + v4)
               + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  uint64_t result = swift_beginAccess();
  unsigned char *v7 = v3;
  return result;
}

void (*StoredPhotoLayoutProto.userEdited.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  *((_DWORD *)v3 + 20) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(v1 + v4)
               + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  swift_beginAccess();
  *((unsigned char *)v3 + 84) = *v5;
  return sub_2592BAF54;
}

void sub_2592BAF54(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  char v4 = *(unsigned char *)(*a1 + 84);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 80);
    uint64_t v7 = *(void *)(v3 + 72);
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    uint64_t v9 = sub_2592BFA8C(v8);
    swift_release();
    *(void *)(v7 + v6) = v9;
    swift_release();
  }
LABEL_4:
  uint64_t v10 = (unsigned char *)(*(void *)(*(void *)(v3 + 72) + *(int *)(v3 + 80))
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  swift_beginAccess();
  *uint64_t v10 = v4;
  free((void *)v3);
}

uint64_t StoredPhotoLayoutProto.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2593095B0();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t StoredPhotoLayoutProto.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = sub_2593095B0();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*StoredPhotoLayoutProto.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t StoredPhotoLayoutProto.init()@<X0>(uint64_t a1@<X8>)
{
  sub_2593095A0();
  uint64_t v2 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if (qword_26A37C780 != -1) {
    swift_once();
  }
  *(void *)(a1 + v2) = qword_26A37EC58;
  return swift_retain();
}

double StoredPhotoLayoutRectProto.x.getter()
{
  return *(double *)v0;
}

void StoredPhotoLayoutRectProto.x.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*StoredPhotoLayoutRectProto.x.modify())()
{
  return nullsub_1;
}

double StoredPhotoLayoutRectProto.y.getter()
{
  return *(double *)(v0 + 8);
}

void StoredPhotoLayoutRectProto.y.setter(double a1)
{
  *(double *)(v1 + 8) = a1;
}

uint64_t (*StoredPhotoLayoutRectProto.y.modify())()
{
  return nullsub_1;
}

uint64_t (*StoredPhotoLayoutRectProto.width.modify())()
{
  return nullsub_1;
}

uint64_t (*StoredPhotoLayoutRectProto.height.modify())()
{
  return nullsub_1;
}

uint64_t StoredPhotoLayoutRectProto.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredPhotoLayoutRectProto(0) + 32);
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t StoredPhotoLayoutRectProto.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for StoredPhotoLayoutRectProto(0) + 32);
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*StoredPhotoLayoutRectProto.unknownFields.modify())(void, void, void, void)
{
  return nullsub_1;
}

uint64_t sub_2592BB38C()
{
  uint64_t v0 = sub_259309830();
  __swift_allocate_value_buffer(v0, qword_26A37EBF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A37EBF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_259313200;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 0;
  *(void *)unint64_t v6 = "unspecified";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_259309810();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)uint64_t v10 = "cache";
  *((void *)v10 + 1) = 5;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 2;
  *(void *)uint64_t v11 = "other";
  *(void *)(v11 + 8) = 5;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_259309820();
}

uint64_t static StoredPhotoLayoutImageLocationTypeProto._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AE88C(&qword_26A37C760, (uint64_t)qword_26A37EBF8, a1);
}

uint64_t sub_2592BB5AC@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AED38(&qword_26A37C760, (uint64_t)qword_26A37EBF8, a1);
}

unint64_t static StoredPhotoProto.protoMessageName.getter()
{
  return 0xD000000000000010;
}

uint64_t sub_2592BB5EC()
{
  uint64_t v0 = sub_259309830();
  __swift_allocate_value_buffer(v0, qword_26A37EC10);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A37EC10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_259313470;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "localIdentifier";
  *(void *)(v6 + 8) = 15;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_259309810();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "date";
  *(void *)(v10 + 8) = 4;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "parallaxScale";
  *((void *)v12 + 1) = 13;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "preferredLayout";
  *((void *)v14 + 1) = 15;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  void *v15 = 5;
  *(void *)uint64_t v16 = "layouts";
  *((void *)v16 + 1) = 7;
  v16[16] = 2;
  v9();
  v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  void *v17 = 6;
  *(void *)uint64_t v18 = "accessibilityDescription";
  *((void *)v18 + 1) = 24;
  v18[16] = 2;
  v9();
  return sub_259309820();
}

uint64_t static StoredPhotoProto._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AE88C(&qword_26A37C768, (uint64_t)qword_26A37EC10, a1);
}

uint64_t StoredPhotoProto.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_259309610();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          uint64_t v4 = v3;
          sub_259309660();
          goto LABEL_5;
        case 2:
        case 3:
          uint64_t v4 = v3;
          sub_259309680();
          goto LABEL_5;
        case 4:
          uint64_t v4 = v3;
          sub_2593096C0();
          goto LABEL_5;
        case 5:
          type metadata accessor for StoredPhotoLayoutProto(0);
          sub_2592C00AC(&qword_26A37E748, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
          uint64_t v4 = v3;
          sub_2593096E0();
          goto LABEL_5;
        case 6:
          type metadata accessor for StoredPhotoProto(0);
          uint64_t v4 = v3;
          sub_259309690();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_259309610();
    }
  }
  return result;
}

uint64_t StoredPhotoProto.traverse<A>(visitor:)()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v3 = *(void *)(v0 + 8);
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = sub_259309790();
      if (!v1)
      {
LABEL_8:
        if (*(double *)(v0 + 16) == 0.0 || (uint64_t result = sub_2593097B0(), !v1))
        {
          if (*(double *)(v0 + 24) == 0.0 || (uint64_t result = sub_2593097B0(), !v1))
          {
            if (!*(_DWORD *)(v0 + 32) || (uint64_t result = sub_2593097D0(), !v1))
            {
              if (!*(void *)(*(void *)(v0 + 40) + 16)
                || (type metadata accessor for StoredPhotoLayoutProto(0),
                    sub_2592C00AC(&qword_26A37E748, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto), uint64_t result = sub_2593097F0(), !v1))
              {
                uint64_t result = sub_2592BBC88(v0);
                if (!v1)
                {
                  type metadata accessor for StoredPhotoProto(0);
                  return sub_259309590();
                }
              }
            }
          }
        }
      }
      return result;
  }
}

uint64_t sub_2592BBC88(uint64_t a1)
{
  uint64_t result = type metadata accessor for StoredPhotoProto(0);
  if (*(void *)(a1 + *(int *)(result + 40) + 8)) {
    return sub_2593097C0();
  }
  return result;
}

uint64_t StoredPhotoProto.hashValue.getter()
{
  return sub_2592BEFB8((void (*)(void))type metadata accessor for StoredPhotoProto, &qword_26A37ECC8, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
}

uint64_t sub_2592BBD4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = xmmword_259314C30;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = MEMORY[0x263F8EE78];
  uint64_t result = sub_2593095A0();
  unint64_t v5 = (void *)(a2 + *(int *)(a1 + 40));
  *unint64_t v5 = 0;
  v5[1] = 0;
  return result;
}

unint64_t sub_2592BBDA8()
{
  return 0xD000000000000010;
}

uint64_t sub_2592BBDC4()
{
  return StoredPhotoProto.decodeMessage<A>(decoder:)();
}

uint64_t sub_2592BBDDC()
{
  return StoredPhotoProto.traverse<A>(visitor:)();
}

uint64_t sub_2592BBDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2592C00AC(&qword_26A37EDD0, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_2592BBE70@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AED38(&qword_26A37C768, (uint64_t)qword_26A37EC10, a1);
}

uint64_t sub_2592BBE94(uint64_t a1)
{
  uint64_t v2 = sub_2592C00AC(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_2592BBF00()
{
  sub_2592C00AC(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
  return sub_259309740();
}

unint64_t static StoredPhotoLayoutImageLocationProto.protoMessageName.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_2592BBF9C()
{
  uint64_t v0 = sub_259309830();
  __swift_allocate_value_buffer(v0, qword_26A37EC28);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A37EC28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2593131E0;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 1;
  *(void *)unint64_t v6 = "type";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_259309810();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "location";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  return sub_259309820();
}

uint64_t static StoredPhotoLayoutImageLocationProto._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AE88C(&qword_26A37C770, (uint64_t)qword_26A37EC28, a1);
}

uint64_t StoredPhotoLayoutImageLocationProto.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_259309610();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
        sub_259309690();
      }
      else if (result == 1)
      {
        sub_2592C00F4();
        sub_259309640();
      }
      uint64_t result = sub_259309610();
    }
  }
  return result;
}

uint64_t StoredPhotoLayoutImageLocationProto.traverse<A>(visitor:)()
{
  if (!*v0 || (sub_2592C00F4(), uint64_t result = sub_259309770(), !v1))
  {
    uint64_t result = sub_2592BC338((uint64_t)v0);
    if (!v1)
    {
      type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
      return sub_259309590();
    }
  }
  return result;
}

uint64_t sub_2592BC338(uint64_t a1)
{
  uint64_t result = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  if (*(void *)(a1 + *(int *)(result + 24) + 8)) {
    return sub_2593097C0();
  }
  return result;
}

uint64_t StoredPhotoLayoutImageLocationProto.hashValue.getter()
{
  return sub_2592BEFB8((void (*)(void))type metadata accessor for StoredPhotoLayoutImageLocationProto, &qword_26A37ECD8, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
}

uint64_t sub_2592BC3FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t result = sub_2593095A0();
  unint64_t v5 = (void *)(a2 + *(int *)(a1 + 24));
  *unint64_t v5 = 0;
  v5[1] = 0;
  return result;
}

unint64_t sub_2592BC444()
{
  return 0xD000000000000023;
}

uint64_t sub_2592BC460()
{
  return StoredPhotoLayoutImageLocationProto.decodeMessage<A>(decoder:)();
}

uint64_t sub_2592BC478()
{
  return StoredPhotoLayoutImageLocationProto.traverse<A>(visitor:)();
}

uint64_t sub_2592BC490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2592C00AC(&qword_26A37EDC8, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_2592BC50C@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AED38(&qword_26A37C770, (uint64_t)qword_26A37EC28, a1);
}

uint64_t sub_2592BC530(uint64_t a1)
{
  uint64_t v2 = sub_2592C00AC(&qword_26A37E768, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_2592BC59C()
{
  sub_2592C00AC(&qword_26A37E768, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
  return sub_259309740();
}

unint64_t static StoredPhotoLayoutProto.protoMessageName.getter()
{
  return 0xD000000000000016;
}

uint64_t sub_2592BC638()
{
  uint64_t v0 = sub_259309830();
  __swift_allocate_value_buffer(v0, qword_26A37EC40);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A37EC40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_259315EB0;
  unint64_t v4 = v26 + v3;
  unint64_t v5 = v26 + v3 + v1[14];
  *(void *)(v26 + v3) = 1;
  *(void *)unint64_t v5 = "baseImage";
  *(void *)(v5 + 8) = 9;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_259309810();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "maskImage";
  *(void *)(v9 + 8) = 9;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  unint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *unint64_t v10 = 3;
  *(void *)uint64_t v11 = "originalCrop";
  *((void *)v11 + 1) = 12;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "timePosition";
  *((void *)v13 + 1) = 12;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 5;
  *(void *)uint64_t v15 = "timeRect";
  *((void *)v15 + 1) = 8;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)v17 = "backgroundZorder";
  *((void *)v17 + 1) = 16;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 7;
  *(void *)uint64_t v19 = "foregroundZorder";
  *((void *)v19 + 1) = 16;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  *uint64_t v20 = 8;
  *(void *)uint64_t v21 = "timeElementZorder";
  *((void *)v21 + 1) = 17;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "imageAOTBrightness";
  *(void *)(v22 + 8) = 18;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v4 + 9 * v2);
  v24 = (char *)v23 + v1[14];
  *uint64_t v23 = 10;
  *(void *)v24 = "userEdited";
  *((void *)v24 + 1) = 10;
  v24[16] = 2;
  v8();
  return sub_259309820();
}

uint64_t static StoredPhotoLayoutProto._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AE88C(&qword_26A37C778, (uint64_t)qword_26A37EC40, a1);
}

uint64_t sub_2592BCA04()
{
  type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage;
  uint64_t v2 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  unint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
  v3(v0+ OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage, 1, 1, v2);
  uint64_t v4 = v0
     + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop;
  uint64_t v5 = type metadata accessor for StoredPhotoLayoutRectProto(0);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  *(_DWORD *)(v0
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition) = 0;
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6)(v0+ OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect, 1, 1, v5);
  *(void *)(v0
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder) = 0;
  *(void *)(v0
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder) = 0;
  *(void *)(v0
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder) = 0;
  *(void *)(v0
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness) = 0;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited) = 0;
  qword_26A37EC58 = v0;
  return result;
}

uint64_t sub_2592BCB80()
{
  sub_25924A3A8(v0+ OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage, &qword_26A37E740);
  sub_25924A3A8(v0+ OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage, &qword_26A37E740);
  sub_25924A3A8(v0+ OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop, &qword_26A37E738);
  sub_25924A3A8(v0+ OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect, &qword_26A37E738);
  return swift_deallocClassInstance();
}

uint64_t StoredPhotoLayoutProto.decodeMessage<A>(decoder:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
    swift_allocObject();
    uint64_t v3 = swift_retain();
    uint64_t v4 = sub_2592BFA8C(v3);
    swift_release();
    *(void *)(v1 + v2) = v4;
    swift_release();
  }
  swift_retain();
  sub_2592BCD0C();
  return swift_release();
}

uint64_t sub_2592BCD0C()
{
  uint64_t result = sub_259309610();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          sub_2592BCF14();
          break;
        case 3:
        case 5:
          sub_2592BCFE0();
          break;
        case 4:
          sub_2592BD0AC();
          break;
        case 6:
        case 7:
        case 8:
        case 9:
          sub_2592BD134();
          break;
        case 10:
          sub_2592BD1B8();
          break;
        default:
          break;
      }
      uint64_t result = sub_259309610();
    }
  }
  return result;
}

uint64_t sub_2592BCF14()
{
  return swift_endAccess();
}

uint64_t sub_2592BCFE0()
{
  return swift_endAccess();
}

uint64_t sub_2592BD0AC()
{
  return swift_endAccess();
}

uint64_t sub_2592BD134()
{
  return swift_endAccess();
}

uint64_t sub_2592BD1B8()
{
  return swift_endAccess();
}

uint64_t StoredPhotoLayoutProto.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for StoredPhotoLayoutProto(0);
  uint64_t v7 = swift_retain();
  sub_2592BD2D4(v7, a1, a2, a3);
  uint64_t result = swift_release();
  if (!v3) {
    return sub_259309590();
  }
  return result;
}

uint64_t sub_2592BD2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_2592BD574(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage, 1);
  if (!v4)
  {
    sub_2592BD574(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage, 2);
    sub_2592BD784(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop, 3);
    unint64_t v10 = (_DWORD *)(a1
                   + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
    swift_beginAccess();
    if (*v10) {
      sub_2593097D0();
    }
    sub_2592BD784(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect, 5);
    uint64_t v11 = (double *)(a1
                   + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
    swift_beginAccess();
    if (*v11 != 0.0) {
      sub_2593097B0();
    }
    uint64_t v12 = (double *)(a1
                   + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
    swift_beginAccess();
    if (*v12 != 0.0) {
      sub_2593097B0();
    }
    uint64_t v13 = (double *)(a1
                   + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
    swift_beginAccess();
    if (*v13 != 0.0) {
      sub_2593097B0();
    }
    uint64_t v14 = (double *)(a1
                   + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
    swift_beginAccess();
    if (*v14 != 0.0) {
      sub_2593097B0();
    }
    uint64_t v15 = (unsigned char *)(a1
                  + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
    uint64_t result = swift_beginAccess();
    if (*v15 == 1) {
      return sub_259309760();
    }
  }
  return result;
}

uint64_t sub_2592BD574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  v17[1] = a6;
  v17[2] = a3;
  v17[7] = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E740);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1 + *a5;
  swift_beginAccess();
  sub_2592207A0(v15, (uint64_t)v10, &qword_26A37E740);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    return sub_25924A3A8((uint64_t)v10, &qword_26A37E740);
  }
  sub_2592BA140((uint64_t)v10, (uint64_t)v14, type metadata accessor for StoredPhotoLayoutImageLocationProto);
  sub_2592C00AC(&qword_26A37E768, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
  sub_259309800();
  return sub_2592C004C((uint64_t)v14, type metadata accessor for StoredPhotoLayoutImageLocationProto);
}

uint64_t sub_2592BD784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  v17[1] = a6;
  v17[2] = a3;
  v17[7] = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E738);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for StoredPhotoLayoutRectProto(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1 + *a5;
  swift_beginAccess();
  sub_2592207A0(v15, (uint64_t)v10, &qword_26A37E738);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    return sub_25924A3A8((uint64_t)v10, &qword_26A37E738);
  }
  sub_2592BA140((uint64_t)v10, (uint64_t)v14, type metadata accessor for StoredPhotoLayoutRectProto);
  sub_2592C00AC(&qword_26A37E770, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
  sub_259309800();
  return sub_2592C004C((uint64_t)v14, type metadata accessor for StoredPhotoLayoutRectProto);
}

uint64_t sub_2592BD998(uint64_t a1, uint64_t a2)
{
  uint64_t v110 = type metadata accessor for StoredPhotoLayoutRectProto(0);
  uint64_t v113 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  v106 = (double *)&v101[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37EDD8);
  MEMORY[0x270FA5388](v111);
  v107 = &v101[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  v109 = &v101[-v7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E738);
  MEMORY[0x270FA5388](v8 - 8);
  v104 = (double *)&v101[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  v105 = &v101[-v11];
  MEMORY[0x270FA5388](v12);
  v108 = (double *)&v101[-v13];
  MEMORY[0x270FA5388](v14);
  v117 = &v101[-v15];
  uint64_t v16 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  uint64_t v120 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v114 = (uint64_t *)&v101[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37EDE0);
  MEMORY[0x270FA5388](v18);
  v116 = &v101[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = &v101[-v21];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E740);
  MEMORY[0x270FA5388](v23 - 8);
  v112 = &v101[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v25);
  v119 = &v101[-v26];
  MEMORY[0x270FA5388](v27);
  v118 = &v101[-v28];
  MEMORY[0x270FA5388](v29);
  v31 = &v101[-v30];
  uint64_t v32 = a1;
  uint64_t v33 = a1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage;
  swift_beginAccess();
  sub_2592207A0(v33, (uint64_t)v31, &qword_26A37E740);
  uint64_t v34 = a2
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage;
  swift_beginAccess();
  uint64_t v115 = v18;
  uint64_t v35 = (uint64_t)&v22[*(int *)(v18 + 48)];
  sub_2592207A0((uint64_t)v31, (uint64_t)v22, &qword_26A37E740);
  uint64_t v36 = v34;
  uint64_t v37 = v16;
  uint64_t v38 = v120;
  sub_2592207A0(v36, v35, &qword_26A37E740);
  v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
  if (v39((uint64_t)v22, 1, v37) == 1)
  {
    uint64_t v40 = v32;
    swift_retain();
    uint64_t v41 = a2;
    swift_retain();
    sub_25924A3A8((uint64_t)v31, &qword_26A37E740);
    uint64_t v42 = v40;
    if (v39(v35, 1, v37) != 1) {
      goto LABEL_6;
    }
    uint64_t v103 = v37;
    sub_25924A3A8((uint64_t)v22, &qword_26A37E740);
  }
  else
  {
    uint64_t v120 = a2;
    v43 = v118;
    sub_2592207A0((uint64_t)v22, (uint64_t)v118, &qword_26A37E740);
    if (v39(v35, 1, v37) == 1)
    {
      swift_retain();
      swift_retain();
      sub_25924A3A8((uint64_t)v31, &qword_26A37E740);
      sub_2592C004C((uint64_t)v43, type metadata accessor for StoredPhotoLayoutImageLocationProto);
      goto LABEL_6;
    }
    uint64_t v103 = v37;
    uint64_t v44 = v35;
    v45 = v114;
    sub_2592BA140(v44, (uint64_t)v114, type metadata accessor for StoredPhotoLayoutImageLocationProto);
    uint64_t v42 = v32;
    swift_retain();
    uint64_t v41 = v120;
    swift_retain();
    int v102 = _s10PhotosFace35StoredPhotoLayoutImageLocationProtoV2eeoiySbAC_ACtFZ_0(v43, v45);
    sub_2592C004C((uint64_t)v45, type metadata accessor for StoredPhotoLayoutImageLocationProto);
    sub_25924A3A8((uint64_t)v31, &qword_26A37E740);
    sub_2592C004C((uint64_t)v43, type metadata accessor for StoredPhotoLayoutImageLocationProto);
    sub_25924A3A8((uint64_t)v22, &qword_26A37E740);
    if ((v102 & 1) == 0) {
      goto LABEL_38;
    }
  }
  uint64_t v46 = v42
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage;
  swift_beginAccess();
  v47 = v119;
  sub_2592207A0(v46, (uint64_t)v119, &qword_26A37E740);
  uint64_t v48 = v41
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage;
  swift_beginAccess();
  uint64_t v22 = v116;
  uint64_t v49 = v41;
  uint64_t v50 = (uint64_t)&v116[*(int *)(v115 + 48)];
  sub_2592207A0((uint64_t)v47, (uint64_t)v116, &qword_26A37E740);
  sub_2592207A0(v48, v50, &qword_26A37E740);
  uint64_t v51 = v103;
  uint64_t v52 = v49;
  uint64_t v53 = v42;
  if (v39((uint64_t)v22, 1, v103) == 1)
  {
    sub_25924A3A8((uint64_t)v47, &qword_26A37E740);
    unsigned int v54 = v39(v50, 1, v51);
    v55 = v117;
    if (v54 == 1)
    {
      sub_25924A3A8((uint64_t)v22, &qword_26A37E740);
      goto LABEL_16;
    }
LABEL_6:
    sub_25924A3A8((uint64_t)v22, &qword_26A37EDE0);
    goto LABEL_38;
  }
  v56 = v112;
  sub_2592207A0((uint64_t)v22, (uint64_t)v112, &qword_26A37E740);
  unsigned int v57 = v39(v50, 1, v51);
  v55 = v117;
  if (v57 == 1)
  {
    sub_25924A3A8((uint64_t)v119, &qword_26A37E740);
    sub_2592C004C((uint64_t)v56, type metadata accessor for StoredPhotoLayoutImageLocationProto);
    goto LABEL_6;
  }
  v58 = v114;
  sub_2592BA140(v50, (uint64_t)v114, type metadata accessor for StoredPhotoLayoutImageLocationProto);
  char v59 = _s10PhotosFace35StoredPhotoLayoutImageLocationProtoV2eeoiySbAC_ACtFZ_0(v56, v58);
  sub_2592C004C((uint64_t)v58, type metadata accessor for StoredPhotoLayoutImageLocationProto);
  sub_25924A3A8((uint64_t)v119, &qword_26A37E740);
  sub_2592C004C((uint64_t)v56, type metadata accessor for StoredPhotoLayoutImageLocationProto);
  sub_25924A3A8((uint64_t)v22, &qword_26A37E740);
  if ((v59 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_16:
  uint64_t v60 = v53
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop;
  swift_beginAccess();
  sub_2592207A0(v60, (uint64_t)v55, &qword_26A37E738);
  uint64_t v61 = v52;
  uint64_t v62 = v52
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop;
  swift_beginAccess();
  v63 = v109;
  uint64_t v64 = (uint64_t)&v109[*(int *)(v111 + 48)];
  sub_2592207A0((uint64_t)v55, (uint64_t)v109, &qword_26A37E738);
  sub_2592207A0(v62, v64, &qword_26A37E738);
  uint64_t v65 = (uint64_t)v55;
  uint64_t v67 = v113 + 48;
  v66 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v113 + 48);
  uint64_t v68 = v110;
  if (v66((uint64_t)v63, 1, v110) == 1)
  {
    sub_25924A3A8(v65, &qword_26A37E738);
    if (v66(v64, 1, v68) == 1)
    {
      uint64_t v113 = v67;
      sub_25924A3A8((uint64_t)v63, &qword_26A37E738);
      goto LABEL_24;
    }
LABEL_22:
    sub_25924A3A8((uint64_t)v63, &qword_26A37EDD8);
    goto LABEL_38;
  }
  v69 = v108;
  sub_2592207A0((uint64_t)v63, (uint64_t)v108, &qword_26A37E738);
  if (v66(v64, 1, v68) == 1)
  {
    sub_25924A3A8((uint64_t)v117, &qword_26A37E738);
    sub_2592C004C((uint64_t)v69, type metadata accessor for StoredPhotoLayoutRectProto);
    goto LABEL_22;
  }
  uint64_t v113 = v67;
  v70 = v69;
  v71 = v106;
  sub_2592BA140(v64, (uint64_t)v106, type metadata accessor for StoredPhotoLayoutRectProto);
  char v72 = _s10PhotosFace26StoredPhotoLayoutRectProtoV2eeoiySbAC_ACtFZ_0(v70, v71);
  sub_2592C004C((uint64_t)v71, type metadata accessor for StoredPhotoLayoutRectProto);
  sub_25924A3A8((uint64_t)v117, &qword_26A37E738);
  sub_2592C004C((uint64_t)v70, type metadata accessor for StoredPhotoLayoutRectProto);
  sub_25924A3A8((uint64_t)v63, &qword_26A37E738);
  if ((v72 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_24:
  v73 = (int *)(v53
              + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  swift_beginAccess();
  int v74 = *v73;
  v75 = (_DWORD *)(v61
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  swift_beginAccess();
  if (v74 != *v75) {
    goto LABEL_38;
  }
  uint64_t v76 = v53
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect;
  swift_beginAccess();
  v77 = v105;
  sub_2592207A0(v76, (uint64_t)v105, &qword_26A37E738);
  uint64_t v78 = v61
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect;
  swift_beginAccess();
  v79 = v107;
  uint64_t v80 = (uint64_t)&v107[*(int *)(v111 + 48)];
  sub_2592207A0((uint64_t)v77, (uint64_t)v107, &qword_26A37E738);
  sub_2592207A0(v78, v80, &qword_26A37E738);
  if (v66((uint64_t)v79, 1, v68) != 1)
  {
    v81 = v104;
    sub_2592207A0((uint64_t)v107, (uint64_t)v104, &qword_26A37E738);
    if (v66(v80, 1, v68) == 1)
    {
      sub_25924A3A8((uint64_t)v105, &qword_26A37E738);
      sub_2592C004C((uint64_t)v81, type metadata accessor for StoredPhotoLayoutRectProto);
      goto LABEL_31;
    }
    v82 = v106;
    sub_2592BA140(v80, (uint64_t)v106, type metadata accessor for StoredPhotoLayoutRectProto);
    char v83 = _s10PhotosFace26StoredPhotoLayoutRectProtoV2eeoiySbAC_ACtFZ_0(v81, v82);
    sub_2592C004C((uint64_t)v82, type metadata accessor for StoredPhotoLayoutRectProto);
    sub_25924A3A8((uint64_t)v105, &qword_26A37E738);
    sub_2592C004C((uint64_t)v81, type metadata accessor for StoredPhotoLayoutRectProto);
    sub_25924A3A8((uint64_t)v107, &qword_26A37E738);
    if (v83) {
      goto LABEL_33;
    }
LABEL_38:
    swift_release();
    swift_release();
    char v99 = 0;
    return v99 & 1;
  }
  sub_25924A3A8((uint64_t)v77, &qword_26A37E738);
  if (v66(v80, 1, v68) != 1)
  {
LABEL_31:
    sub_25924A3A8((uint64_t)v107, &qword_26A37EDD8);
    goto LABEL_38;
  }
  sub_25924A3A8((uint64_t)v107, &qword_26A37E738);
LABEL_33:
  v84 = (double *)(v53
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
  swift_beginAccess();
  double v85 = *v84;
  v86 = (double *)(v61
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
  swift_beginAccess();
  if (v85 != *v86) {
    goto LABEL_38;
  }
  v87 = (double *)(v53
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
  swift_beginAccess();
  double v88 = *v87;
  v89 = (double *)(v61
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
  swift_beginAccess();
  if (v88 != *v89) {
    goto LABEL_38;
  }
  v90 = (double *)(v53
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
  swift_beginAccess();
  double v91 = *v90;
  v92 = (double *)(v61
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
  swift_beginAccess();
  if (v91 != *v92) {
    goto LABEL_38;
  }
  v93 = (double *)(v53
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
  swift_beginAccess();
  double v94 = *v93;
  v95 = (double *)(v61
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
  swift_beginAccess();
  if (v94 != *v95) {
    goto LABEL_38;
  }
  v96 = (char *)(v53
               + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  swift_beginAccess();
  char v97 = *v96;
  swift_release();
  v98 = (unsigned char *)(v61
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  swift_beginAccess();
  LOBYTE(v98) = *v98;
  swift_release();
  char v99 = v97 ^ v98 ^ 1;
  return v99 & 1;
}

uint64_t StoredPhotoLayoutProto.hashValue.getter()
{
  return sub_2592BEFB8((void (*)(void))type metadata accessor for StoredPhotoLayoutProto, &qword_26A37ECE0, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
}

uint64_t sub_2592BE7AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2593095A0();
  uint64_t v4 = *(int *)(a1 + 20);
  if (qword_26A37C780 != -1) {
    swift_once();
  }
  *(void *)(a2 + v4) = qword_26A37EC58;
  return swift_retain();
}

unint64_t sub_2592BE824()
{
  return 0xD000000000000016;
}

uint64_t sub_2592BE840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2593095B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_2592BE8A8(uint64_t a1)
{
  uint64_t v3 = sub_2593095B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*sub_2592BE910())()
{
  return nullsub_1;
}

uint64_t sub_2592BE930()
{
  return StoredPhotoLayoutProto.decodeMessage<A>(decoder:)();
}

uint64_t sub_2592BE948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return StoredPhotoLayoutProto.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_2592BE960(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2592C00AC(&qword_26A37EDC0, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_2592BE9DC@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AED38(&qword_26A37C778, (uint64_t)qword_26A37EC40, a1);
}

uint64_t sub_2592BEA00(uint64_t a1)
{
  uint64_t v2 = sub_2592C00AC(&qword_26A37E748, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_2592BEA6C()
{
  sub_2592C00AC(&qword_26A37E748, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
  return sub_259309740();
}

unint64_t static StoredPhotoLayoutRectProto.protoMessageName.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_2592BEB08()
{
  uint64_t v0 = sub_259309830();
  __swift_allocate_value_buffer(v0, qword_26A37EC60);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A37EC60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_259313260;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "x";
  *(void *)(v6 + 8) = 1;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_259309810();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "y";
  *(void *)(v10 + 8) = 1;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  void *v11 = 3;
  *(void *)uint64_t v12 = "width";
  *((void *)v12 + 1) = 5;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "height";
  *((void *)v14 + 1) = 6;
  v14[16] = 2;
  v9();
  return sub_259309820();
}

uint64_t static StoredPhotoLayoutRectProto._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AE88C(&qword_26A37C788, (uint64_t)qword_26A37EC60, a1);
}

uint64_t StoredPhotoLayoutRectProto.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_259309610();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          sub_259309680();
          break;
        default:
          break;
      }
      uint64_t result = sub_259309610();
    }
  }
  return result;
}

uint64_t StoredPhotoLayoutRectProto.traverse<A>(visitor:)()
{
  if (*v0 == 0.0 || (uint64_t result = sub_2593097B0(), !v1))
  {
    if (v0[1] == 0.0 || (uint64_t result = sub_2593097B0(), !v1))
    {
      if (v0[2] == 0.0 || (uint64_t result = sub_2593097B0(), !v1))
      {
        if (v0[3] == 0.0 || (uint64_t result = sub_2593097B0(), !v1))
        {
          type metadata accessor for StoredPhotoLayoutRectProto(0);
          return sub_259309590();
        }
      }
    }
  }
  return result;
}

uint64_t StoredPhotoLayoutRectProto.hashValue.getter()
{
  return sub_2592BEFB8((void (*)(void))type metadata accessor for StoredPhotoLayoutRectProto, &qword_26A37ECE8, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
}

uint64_t sub_2592BEFB8(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_25930A910();
}

uint64_t sub_2592BF040@<X0>(_OWORD *a1@<X8>)
{
  *a1 = 0u;
  a1[1] = 0u;
  return sub_2593095A0();
}

unint64_t sub_2592BF068()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_2592BF084()
{
  return StoredPhotoLayoutRectProto.decodeMessage<A>(decoder:)();
}

uint64_t sub_2592BF09C()
{
  return StoredPhotoLayoutRectProto.traverse<A>(visitor:)();
}

uint64_t sub_2592BF0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2592C00AC(&qword_26A37EDB8, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_2592BF130@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AED38(&qword_26A37C788, (uint64_t)qword_26A37EC60, a1);
}

uint64_t sub_2592BF154(uint64_t a1)
{
  uint64_t v2 = sub_2592C00AC(&qword_26A37E770, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_2592BF1C0()
{
  sub_2592C00AC(&qword_26A37E770, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
  return sub_259309740();
}

uint64_t _s10PhotosFace26StoredPhotoLayoutRectProtoV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v16 - v9;
  if (*a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3])
  {
    uint64_t v11 = type metadata accessor for StoredPhotoLayoutRectProto(0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 32), v4);
    v12(v7, (char *)a2 + *(int *)(v11 + 32), v4);
    sub_2592C00AC(&qword_26A37E3E0, MEMORY[0x263F50560]);
    char v13 = sub_259309B60();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v7, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t _s10PhotosFace22StoredPhotoLayoutProtoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20);
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a2 + v11);
  if (v12 == v13
    || (swift_retain(), swift_retain(), char v14 = sub_2592BD998(v12, v13), swift_release(), swift_release(), (v14 & 1) != 0))
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v15(v10, a1, v4);
    v15(v7, a2, v4);
    sub_2592C00AC(&qword_26A37E3E0, MEMORY[0x263F50560]);
    char v16 = sub_259309B60();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v7, v4);
    v17(v10, v4);
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

uint64_t _s10PhotosFace16StoredPhotoProtoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v22 - v9;
  if ((sub_2592C3CD0(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) == 0
    || *(double *)(a1 + 16) != *(double *)(a2 + 16)
    || *(double *)(a1 + 24) != *(double *)(a2 + 24)
    || *(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)
    || (sub_25926E2FC(*(void *)(a1 + 40), *(void *)(a2 + 40)) & 1) == 0)
  {
    goto LABEL_15;
  }
  uint64_t v11 = type metadata accessor for StoredPhotoProto(0);
  uint64_t v12 = *(int *)(v11 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (!v16)
    {
LABEL_17:
      uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v20(v10, a1 + *(int *)(v11 + 36), v4);
      v20(v7, a2 + *(int *)(v11 + 36), v4);
      sub_2592C00AC(&qword_26A37E3E0, MEMORY[0x263F50560]);
      char v18 = sub_259309B60();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
      v21(v7, v4);
      v21(v10, v4);
      return v18 & 1;
    }
LABEL_15:
    char v18 = 0;
    return v18 & 1;
  }
  if (!v16) {
    goto LABEL_15;
  }
  if (*v13 == *v15 && v14 == v16) {
    goto LABEL_17;
  }
  char v18 = 0;
  if (sub_25930A7C0()) {
    goto LABEL_17;
  }
  return v18 & 1;
}

uint64_t _s10PhotosFace35StoredPhotoLayoutImageLocationProtoV2eeoiySbAC_ACtFZ_0(char *a1, uint64_t *a2)
{
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = *(void *)a1;
  uint64_t v12 = *a2;
  if (*((unsigned char *)a2 + 8) == 1)
  {
    if (v12)
    {
      if (v12 == 1)
      {
        if (v11 != 1) {
          goto LABEL_20;
        }
      }
      else if (v11 != 2)
      {
        goto LABEL_20;
      }
    }
    else if (v11)
    {
      goto LABEL_20;
    }
  }
  else if (v11 != v12)
  {
    goto LABEL_20;
  }
  uint64_t v13 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  uint64_t v14 = *(int *)(v13 + 24);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = *(void *)&a1[v14 + 8];
  uint64_t v17 = (uint64_t *)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  if (!v16)
  {
    if (!v18)
    {
LABEL_21:
      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v21(v10, &a1[*(int *)(v13 + 20)], v4);
      v21(v7, (char *)a2 + *(int *)(v13 + 20), v4);
      sub_2592C00AC(&qword_26A37E3E0, MEMORY[0x263F50560]);
      char v20 = sub_259309B60();
      uint64_t v22 = *(void (**)(char *, uint64_t))(v5 + 8);
      v22(v7, v4);
      v22(v10, v4);
      return v20 & 1;
    }
LABEL_20:
    char v20 = 0;
    return v20 & 1;
  }
  if (!v18) {
    goto LABEL_20;
  }
  if (*(void *)v15 == *v17 && v16 == v18) {
    goto LABEL_21;
  }
  char v20 = 0;
  if (sub_25930A7C0()) {
    goto LABEL_21;
  }
  return v20 & 1;
}

uint64_t sub_2592BFA8C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E738);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v40 = (uint64_t)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E740);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1
     + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage;
  uint64_t v9 = type metadata accessor for StoredPhotoLayoutImageLocationProto(0);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v10(v8, 1, 1, v9);
  uint64_t v11 = v1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage;
  v10(v1+ OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage, 1, 1, v9);
  uint64_t v12 = v1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop;
  uint64_t v13 = type metadata accessor for StoredPhotoLayoutRectProto(0);
  uint64_t v14 = *(void (**)(void))(*(void *)(v13 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v14)(v12, 1, 1, v13);
  uint64_t v38 = (_DWORD *)(v1
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  *(_DWORD *)(v1
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition) = 0;
  uint64_t v39 = v1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect;
  v14();
  uint64_t v41 = (void *)(v1
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
  *(void *)(v1
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder) = 0;
  uint64_t v42 = (void *)(v1
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
  *(void *)(v1
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder) = 0;
  v43 = (void *)(v1
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
  *(void *)(v1
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder) = 0;
  uint64_t v44 = (void *)(v1
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
  *(void *)(v1
            + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness) = 0;
  uint64_t v15 = (unsigned char *)(v1
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  *(unsigned char *)(v1
           + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited) = 0;
  uint64_t v16 = a1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage;
  swift_beginAccess();
  sub_2592207A0(v16, (uint64_t)v7, &qword_26A37E740);
  swift_beginAccess();
  sub_259299F40((uint64_t)v7, v8, &qword_26A37E740);
  swift_endAccess();
  uint64_t v17 = a1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage;
  swift_beginAccess();
  sub_2592207A0(v17, (uint64_t)v7, &qword_26A37E740);
  swift_beginAccess();
  sub_259299F40((uint64_t)v7, v11, &qword_26A37E740);
  swift_endAccess();
  uint64_t v18 = a1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop;
  swift_beginAccess();
  uint64_t v19 = v40;
  sub_2592207A0(v18, v40, &qword_26A37E738);
  swift_beginAccess();
  sub_259299F40(v19, v12, &qword_26A37E738);
  swift_endAccess();
  char v20 = (_DWORD *)(a1
                 + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  swift_beginAccess();
  LODWORD(v20) = *v20;
  uint64_t v21 = v38;
  swift_beginAccess();
  *uint64_t v21 = v20;
  uint64_t v22 = a1
      + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect;
  swift_beginAccess();
  sub_2592207A0(v22, v19, &qword_26A37E738);
  uint64_t v23 = v39;
  swift_beginAccess();
  sub_259299F40(v19, v23, &qword_26A37E738);
  swift_endAccess();
  uint64_t v24 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
  swift_beginAccess();
  uint64_t v25 = *v24;
  uint64_t v26 = v41;
  swift_beginAccess();
  *uint64_t v26 = v25;
  uint64_t v27 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
  swift_beginAccess();
  uint64_t v28 = *v27;
  uint64_t v29 = v42;
  swift_beginAccess();
  *uint64_t v29 = v28;
  uint64_t v30 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
  swift_beginAccess();
  uint64_t v31 = *v30;
  uint64_t v32 = v43;
  swift_beginAccess();
  *uint64_t v32 = v31;
  uint64_t v33 = (uint64_t *)(a1
                  + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
  swift_beginAccess();
  uint64_t v34 = *v33;
  uint64_t v35 = v44;
  swift_beginAccess();
  *uint64_t v35 = v34;
  uint64_t v36 = (unsigned char *)(a1
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  swift_beginAccess();
  LOBYTE(v36) = *v36;
  swift_beginAccess();
  unsigned char *v15 = (_BYTE)v36;
  return v1;
}

uint64_t sub_2592BFFE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2592C004C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2592C00AC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2592C00F4()
{
  unint64_t result = qword_26A37ECD0;
  if (!qword_26A37ECD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37ECD0);
  }
  return result;
}

unint64_t sub_2592C014C()
{
  unint64_t result = qword_26A37ECF0;
  if (!qword_26A37ECF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37ECF0);
  }
  return result;
}

unint64_t sub_2592C01A4()
{
  unint64_t result = qword_26A37ECF8;
  if (!qword_26A37ECF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37ECF8);
  }
  return result;
}

unint64_t sub_2592C01FC()
{
  unint64_t result = qword_26A37ED00;
  if (!qword_26A37ED00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37ED00);
  }
  return result;
}

unint64_t sub_2592C0254()
{
  unint64_t result = qword_26A37ED08;
  if (!qword_26A37ED08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A37ED10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37ED08);
  }
  return result;
}

uint64_t sub_2592C02B0()
{
  return sub_2592C00AC(&qword_26A37ED18, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
}

uint64_t sub_2592C02F8()
{
  return sub_2592C00AC(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
}

uint64_t sub_2592C0340()
{
  return sub_2592C00AC(&qword_26A37ECC8, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
}

uint64_t sub_2592C0388()
{
  return sub_2592C00AC(&qword_26A37ED20, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
}

uint64_t sub_2592C03D0()
{
  return sub_2592C00AC(&qword_26A37ED28, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
}

uint64_t sub_2592C0418()
{
  return sub_2592C00AC(&qword_26A37E768, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
}

uint64_t sub_2592C0460()
{
  return sub_2592C00AC(&qword_26A37ECD8, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
}

uint64_t sub_2592C04A8()
{
  return sub_2592C00AC(&qword_26A37ED30, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
}

uint64_t sub_2592C04F0()
{
  return sub_2592C00AC(&qword_26A37ED38, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
}

uint64_t sub_2592C0538()
{
  return sub_2592C00AC(&qword_26A37E748, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
}

uint64_t sub_2592C0580()
{
  return sub_2592C00AC(&qword_26A37ECE0, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
}

uint64_t sub_2592C05C8()
{
  return sub_2592C00AC(&qword_26A37ED40, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutProto);
}

uint64_t sub_2592C0610()
{
  return sub_2592C00AC(&qword_26A37ED48, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
}

uint64_t sub_2592C0658()
{
  return sub_2592C00AC(&qword_26A37E770, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
}

uint64_t sub_2592C06A0()
{
  return sub_2592C00AC(&qword_26A37ECE8, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
}

uint64_t sub_2592C06E8()
{
  return sub_2592C00AC(&qword_26A37ED50, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
}

uint64_t sub_2592C0740@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2592B9AA4(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__baseImage, a2);
}

uint64_t sub_2592C0760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592B9C0C(a1, a2, a3, a4, type metadata accessor for StoredPhotoLayoutImageLocationProto, type metadata accessor for StoredPhotoLayoutImageLocationProto, (uint64_t (*)(char *))StoredPhotoLayoutProto.baseImage.setter);
}

uint64_t sub_2592C07B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2592B9AA4(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__maskImage, a2);
}

uint64_t sub_2592C07D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592B9C0C(a1, a2, a3, a4, type metadata accessor for StoredPhotoLayoutImageLocationProto, type metadata accessor for StoredPhotoLayoutImageLocationProto, (uint64_t (*)(char *))StoredPhotoLayoutProto.maskImage.setter);
}

uint64_t sub_2592C0828@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_2592BA63C(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__originalCrop, a2);
}

uint64_t sub_2592C0848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592B9C0C(a1, a2, a3, a4, type metadata accessor for StoredPhotoLayoutRectProto, type metadata accessor for StoredPhotoLayoutRectProto, (uint64_t (*)(char *))StoredPhotoLayoutProto.originalCrop.setter);
}

uint64_t sub_2592C089C@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (_DWORD *)(*(void *)(a1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20))
                + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timePosition);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2592C0904@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_2592BA63C(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeRect, a2);
}

uint64_t sub_2592C0924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592B9C0C(a1, a2, a3, a4, type metadata accessor for StoredPhotoLayoutRectProto, type metadata accessor for StoredPhotoLayoutRectProto, (uint64_t (*)(char *))StoredPhotoLayoutProto.timeRect.setter);
}

double sub_2592C0978@<D0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return keypath_get_22Tm(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder, a2);
}

uint64_t sub_2592C0984(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592BAA60(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__backgroundZorder);
}

double sub_2592C09A4@<D0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return keypath_get_22Tm(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder, a2);
}

double keypath_get_22Tm@<D0>(uint64_t a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (double *)(*(void *)(a1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20)) + *a2);
  swift_beginAccess();
  double result = *v4;
  *a3 = *(void *)v4;
  return result;
}

uint64_t sub_2592C0A1C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592BAA60(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__foregroundZorder);
}

double sub_2592C0A3C@<D0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return keypath_get_22Tm(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder, a2);
}

uint64_t sub_2592C0A48(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592BAA60(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__timeElementZorder);
}

double sub_2592C0A68@<D0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return keypath_get_22Tm(a1, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness, a2);
}

uint64_t sub_2592C0A74(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592BAA60(a1, a2, a3, a4, &OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__imageAotbrightness);
}

uint64_t sub_2592C0A94@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*(void *)(a1 + *(int *)(type metadata accessor for StoredPhotoLayoutProto(0) + 20))
               + OBJC_IVAR____TtCV10PhotosFace22StoredPhotoLayoutProtoP33_AB2BD396CE90CE0850AF56485F0C251613_StorageClass__userEdited);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

ValueMetadata *type metadata accessor for StoredPhotoLayoutImageLocationTypeProto()
{
  return &type metadata for StoredPhotoLayoutImageLocationTypeProto;
}

unint64_t initializeBufferWithCopyOfBuffer for StoredPhotoProto(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    sub_259261DE0(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = sub_2593095B0();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = *(int *)(a3 + 40);
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (void *)(a2 + v14);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for StoredPhotoProto(uint64_t a1, uint64_t a2)
{
  sub_259261F50(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredPhotoProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_259261DE0(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2593095B0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredPhotoProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_259261DE0(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  sub_259261F50(v8, v9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 40);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for StoredPhotoProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 40)) = *(_OWORD *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t assignWithTake for StoredPhotoProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_259261F50(v6, v7);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredPhotoProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2592C104C);
}

uint64_t sub_2592C104C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2593095B0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for StoredPhotoProto(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2592C1110);
}

uint64_t sub_2592C1110(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2593095B0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2592C11B8()
{
  uint64_t result = sub_2593095B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_2593095B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (void *)((char *)v4 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = v12[1];
  void *v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t)a2 + v7;
  uint64_t v10 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  void *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2592C16D8);
}

uint64_t sub_2592C16D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2593095B0();
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
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for StoredPhotoLayoutImageLocationProto(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2592C17C0);
}

uint64_t sub_2592C17C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2593095B0();
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
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t sub_2592C1884()
{
  uint64_t result = sub_2593095B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for StoredPhotoLayoutProto(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_2593095B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for StoredPhotoLayoutProto(uint64_t a1)
{
  uint64_t v2 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for StoredPhotoLayoutProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StoredPhotoLayoutProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for StoredPhotoLayoutProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for StoredPhotoLayoutProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredPhotoLayoutProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2592C1C84);
}

uint64_t sub_2592C1C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2593095B0();
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

uint64_t storeEnumTagSinglePayload for StoredPhotoLayoutProto(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2592C1D58);
}

uint64_t sub_2592C1D58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2593095B0();
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

uint64_t sub_2592C1E14()
{
  uint64_t result = sub_2593095B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for StoredPhotoLayoutRectProto(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    long long v5 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 32);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_2593095B0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for StoredPhotoLayoutRectProto(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 32);
  uint64_t v3 = sub_2593095B0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

_OWORD *initializeWithCopy for StoredPhotoLayoutRectProto(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_2593095B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

void *assignWithCopy for StoredPhotoLayoutRectProto(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_2593095B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *initializeWithTake for StoredPhotoLayoutRectProto(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_2593095B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_OWORD *assignWithTake for StoredPhotoLayoutRectProto(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_2593095B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredPhotoLayoutRectProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2592C21FC);
}

uint64_t sub_2592C21FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 32);
  uint64_t v5 = sub_2593095B0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for StoredPhotoLayoutRectProto(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2592C2280);
}

uint64_t sub_2592C2280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 32);
  uint64_t v6 = sub_2593095B0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t sub_2592C22F4()
{
  uint64_t result = sub_2593095B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2592C2394()
{
  return type metadata accessor for StoredPhotoLayoutProto._StorageClass(0);
}

void sub_2592C239C()
{
  sub_2592C24C8(319, &qword_26A37EDA8, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutImageLocationProto);
  if (v0 <= 0x3F)
  {
    sub_2592C24C8(319, &qword_26A37EDB0, (void (*)(uint64_t))type metadata accessor for StoredPhotoLayoutRectProto);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_2592C24C8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25930A240();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t SyncedPhotosFaceProto.day.getter()
{
  unint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for SyncedPhotosFaceProto(0) + 36));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t type metadata accessor for SyncedPhotosFaceProto(uint64_t a1)
{
  return sub_259296DD8(a1, (uint64_t *)&unk_26A37EE58);
}

uint64_t SyncedPhotosFaceProto.day.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for SyncedPhotosFaceProto(0);
  uint64_t v4 = v1 + *(int *)(result + 36);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t SyncFacesRequestProto.trackedFaces.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncFacesRequestProto.trackedFaces.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*SyncFacesRequestProto.trackedFaces.modify())()
{
  return nullsub_1;
}

uint64_t SyncFacesRequestProto.cachedIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncFacesRequestProto.cachedIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*SyncFacesRequestProto.cachedIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t SyncFacesRequestProto.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SyncFacesRequestProto(0) + 24);
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SyncFacesRequestProto(uint64_t a1)
{
  return sub_259296DD8(a1, (uint64_t *)&unk_26A37EE48);
}

uint64_t SyncFacesRequestProto.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SyncFacesRequestProto(0) + 24);
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*SyncFacesRequestProto.unknownFields.modify())(void, void, void, void)
{
  return nullsub_1;
}

uint64_t SyncFacesRequestProto.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v2;
  type metadata accessor for SyncFacesRequestProto(0);
  return sub_2593095A0();
}

uint64_t SyncedPhotosFaceProto.id.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_259261DE0(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t SyncedPhotosFaceProto.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_259261F50(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*SyncedPhotosFaceProto.id.modify())()
{
  return nullsub_1;
}

uint64_t (*SyncedPhotosFaceProto.day.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for SyncedPhotosFaceProto(0) + 36);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_2592C28EC;
}

uint64_t sub_2592C28EC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8) + *(int *)(result + 16);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

BOOL SyncedPhotosFaceProto.hasDay.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for SyncedPhotosFaceProto(0) + 36) + 8) & 1) == 0;
}

Swift::Void __swiftcall SyncedPhotosFaceProto.clearDay()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SyncedPhotosFaceProto(0) + 36);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

uint64_t SyncedPhotosFaceProto.photos.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncedPhotosFaceProto.photos.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*SyncedPhotosFaceProto.photos.modify())()
{
  return nullsub_1;
}

uint64_t SyncedPhotosFaceProto.cached.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SyncedPhotosFaceProto.cached.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*SyncedPhotosFaceProto.cached.modify())()
{
  return nullsub_1;
}

uint64_t SyncedPhotosFaceProto.complete.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t SyncedPhotosFaceProto.complete.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*SyncedPhotosFaceProto.complete.modify())()
{
  return nullsub_1;
}

uint64_t SyncedPhotosFaceProto.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SyncedPhotosFaceProto(0) + 32);
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SyncedPhotosFaceProto.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SyncedPhotosFaceProto(0) + 32);
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  return v5(v3, a1, v4);
}

uint64_t (*SyncedPhotosFaceProto.unknownFields.modify())(void, void, void, void)
{
  return nullsub_1;
}

uint64_t SyncedPhotosFaceProto.init()@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_259314C30;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 16) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 24) = v2;
  *(unsigned char *)(a1 + 32) = 0;
  uint64_t v3 = type metadata accessor for SyncedPhotosFaceProto(0);
  uint64_t result = sub_2593095A0();
  uint64_t v5 = a1 + *(int *)(v3 + 36);
  *(void *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 8) = 1;
  return result;
}

unint64_t static SyncFacesRequestProto.protoMessageName.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_2592C2BF8()
{
  uint64_t v0 = sub_259309830();
  __swift_allocate_value_buffer(v0, qword_26A37EDE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A37EDE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2593131E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "trackedFaces";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_259309810();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "cachedIdentifiers";
  *((void *)v10 + 1) = 17;
  v10[16] = 2;
  v9();
  return sub_259309820();
}

uint64_t static SyncFacesRequestProto._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AE88C(&qword_26A37C790, (uint64_t)qword_26A37EDE8, a1);
}

uint64_t SyncFacesRequestProto.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_259309610();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1) {
        sub_259309650();
      }
      uint64_t result = sub_259309610();
    }
  }
  return result;
}

uint64_t SyncFacesRequestProto.traverse<A>(visitor:)()
{
  if (!*(void *)(*v0 + 16) || (uint64_t result = sub_259309780(), !v1))
  {
    if (!*(void *)(v0[1] + 16) || (uint64_t result = sub_259309780(), !v1))
    {
      type metadata accessor for SyncFacesRequestProto(0);
      return sub_259309590();
    }
  }
  return result;
}

uint64_t SyncFacesRequestProto.hashValue.getter()
{
  return sub_2592C3880((void (*)(void))type metadata accessor for SyncFacesRequestProto, &qword_26A37EE18, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
}

uint64_t sub_2592C2F78@<X0>(void *a1@<X8>)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *a1 = MEMORY[0x263F8EE78];
  a1[1] = v1;
  return sub_2593095A0();
}

unint64_t sub_2592C2FA4()
{
  return 0xD000000000000015;
}

uint64_t sub_2592C2FC0()
{
  return SyncFacesRequestProto.decodeMessage<A>(decoder:)();
}

uint64_t sub_2592C2FD8()
{
  return SyncFacesRequestProto.traverse<A>(visitor:)();
}

uint64_t sub_2592C2FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2592C4130(&qword_26A37EE70, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_2592C306C@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AED38(&qword_26A37C790, (uint64_t)qword_26A37EDE8, a1);
}

uint64_t sub_2592C3090(uint64_t a1)
{
  uint64_t v2 = sub_2592C4130(&qword_26A37E320, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_2592C30FC()
{
  sub_2592C4130(&qword_26A37E320, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
  return sub_259309740();
}

unint64_t static SyncedPhotosFaceProto.protoMessageName.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_2592C3198()
{
  uint64_t v0 = sub_259309830();
  __swift_allocate_value_buffer(v0, qword_26A37EE00);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A37EE00);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37E8F8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2593157B0;
  unint64_t v4 = v16 + v3;
  unint64_t v5 = v16 + v3 + v1[14];
  *(void *)(v16 + v3) = 1;
  *(void *)unint64_t v5 = "id";
  *(void *)(v5 + 8) = 2;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_259309810();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 3;
  *(void *)unint64_t v9 = "day";
  *(void *)(v9 + 8) = 3;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 2;
  *(void *)uint64_t v11 = "photos";
  *((void *)v11 + 1) = 6;
  v11[16] = 2;
  v8();
  unint64_t v12 = (void *)(v4 + 3 * v2);
  int v13 = (char *)v12 + v1[14];
  *unint64_t v12 = 4;
  *(void *)int v13 = "cached";
  *((void *)v13 + 1) = 6;
  v13[16] = 2;
  v8();
  uint64_t v14 = v4 + 4 * v2 + v1[14];
  *(void *)(v4 + 4 * v2) = 5;
  *(void *)uint64_t v14 = "complete";
  *(void *)(v14 + 8) = 8;
  *(unsigned char *)(v14 + 16) = 2;
  v8();
  return sub_259309820();
}

uint64_t static SyncedPhotosFaceProto._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AE88C(&qword_26A37C798, (uint64_t)qword_26A37EE00, a1);
}

uint64_t SyncedPhotosFaceProto.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_259309610();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          uint64_t v4 = v3;
          sub_259309660();
          goto LABEL_5;
        case 2:
          type metadata accessor for StoredPhotoProto(0);
          sub_2592C4130(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
          uint64_t v4 = v3;
          sub_2593096E0();
          goto LABEL_5;
        case 3:
          type metadata accessor for SyncedPhotosFaceProto(0);
          uint64_t v4 = v3;
          sub_2593096D0();
          goto LABEL_5;
        case 4:
          uint64_t v4 = v3;
          sub_259309650();
          goto LABEL_5;
        case 5:
          uint64_t v4 = v3;
          sub_259309630();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_259309610();
    }
  }
  return result;
}

uint64_t SyncedPhotosFaceProto.traverse<A>(visitor:)()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v3 = *(void *)(v0 + 8);
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = sub_259309790();
      if (!v1)
      {
LABEL_8:
        if (!*(void *)(*(void *)(v0 + 16) + 16)
          || (type metadata accessor for StoredPhotoProto(0),
              sub_2592C4130(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto),
              uint64_t result = sub_2593097F0(),
              !v1))
        {
          uint64_t result = sub_2592C37BC(v0);
          if (!v1)
          {
            if (*(void *)(*(void *)(v0 + 24) + 16)) {
              sub_259309780();
            }
            if (*(unsigned char *)(v0 + 32) == 1) {
              sub_259309760();
            }
            type metadata accessor for SyncedPhotosFaceProto(0);
            return sub_259309590();
          }
        }
      }
      return result;
  }
}

uint64_t sub_2592C37BC(uint64_t a1)
{
  uint64_t result = type metadata accessor for SyncedPhotosFaceProto(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 36) + 8) & 1) == 0) {
    return sub_2593097E0();
  }
  return result;
}

uint64_t SyncedPhotosFaceProto.hashValue.getter()
{
  return sub_2592C3880((void (*)(void))type metadata accessor for SyncedPhotosFaceProto, &qword_26A37EE20, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
}

uint64_t sub_2592C3880(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_25930A910();
}

uint64_t sub_2592C3908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(_OWORD *)a2 = xmmword_259314C30;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v4;
  *(unsigned char *)(a2 + 32) = 0;
  uint64_t result = sub_2593095A0();
  uint64_t v6 = a2 + *(int *)(a1 + 36);
  *(void *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 8) = 1;
  return result;
}

unint64_t sub_2592C3968()
{
  return 0xD000000000000015;
}

uint64_t sub_2592C3984()
{
  return SyncedPhotosFaceProto.decodeMessage<A>(decoder:)();
}

uint64_t sub_2592C399C()
{
  return SyncedPhotosFaceProto.traverse<A>(visitor:)();
}

uint64_t sub_2592C39B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2592C4130(&qword_26A37EE68, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_2592C3A30@<X0>(uint64_t a1@<X8>)
{
  return sub_2592AED38(&qword_26A37C798, (uint64_t)qword_26A37EE00, a1);
}

uint64_t sub_2592C3A54(uint64_t a1)
{
  uint64_t v2 = sub_2592C4130(&qword_26A37E350, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_2592C3AC0()
{
  sub_2592C4130(&qword_26A37E350, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
  return sub_259309740();
}

uint64_t sub_2592C3B40(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_259271D8C((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_2592C3C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_2593091E0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_259309210();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_259309200();
  sub_259271D8C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_2592C3CD0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x2592C3F38);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_259261DE0(a3, a4);
                  sub_259261DE0(a1, a2);
                  char v17 = sub_2592C3C18((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_259261F50(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_259261DE0(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_2592C3C18(v21, v22, v20, a3, a4);
                  sub_259261F50(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_259261DE0(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_259261DE0(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_2592C3B40(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_259261F50(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s10PhotosFace21SyncFacesRequestProtoV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - v9;
  if (sub_25926D774(*a1, *a2) & 1) != 0 && (sub_25926D774(a1[1], a2[1]))
  {
    uint64_t v11 = type metadata accessor for SyncFacesRequestProto(0);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 24), v4);
    v12(v7, (char *)a2 + *(int *)(v11 + 24), v4);
    sub_2592C4130(&qword_26A37E3E0, MEMORY[0x263F50560]);
    char v13 = sub_259309B60();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v7, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_2592C4130(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s10PhotosFace06SyncedaB5ProtoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2593095B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v21 - v9;
  if ((sub_2592C3CD0(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v11 = type metadata accessor for SyncedPhotosFaceProto(0);
  uint64_t v12 = *(int *)(v11 + 36);
  char v13 = (void *)(a1 + v12);
  char v14 = *(unsigned char *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  int v16 = *(unsigned __int8 *)(a2 + v12 + 8);
  if (v14)
  {
    if (!v16) {
      goto LABEL_11;
    }
  }
  else
  {
    if (*v13 != *v15) {
      LOBYTE(v16) = 1;
    }
    if (v16) {
      goto LABEL_11;
    }
  }
  if ((sub_25926CF30(*(void *)(a1 + 16), *(void *)(a2 + 16)) & 1) != 0
    && (sub_25926D774(*(void *)(a1 + 24), *(void *)(a2 + 24)) & 1) != 0
    && *(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32))
  {
    unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v19(v10, a1 + *(int *)(v11 + 32), v4);
    v19(v7, a2 + *(int *)(v11 + 32), v4);
    sub_2592C4130(&qword_26A37E3E0, MEMORY[0x263F50560]);
    char v17 = sub_259309B60();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
    v20(v7, v4);
    v20(v10, v4);
    return v17 & 1;
  }
LABEL_11:
  char v17 = 0;
  return v17 & 1;
}

uint64_t sub_2592C4394()
{
  return sub_2592C4130(&qword_26A37EE28, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
}

uint64_t sub_2592C43DC()
{
  return sub_2592C4130(&qword_26A37E320, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
}

uint64_t sub_2592C4424()
{
  return sub_2592C4130(&qword_26A37EE18, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
}

uint64_t sub_2592C446C()
{
  return sub_2592C4130(&qword_26A37EE30, (void (*)(uint64_t))type metadata accessor for SyncFacesRequestProto);
}

uint64_t sub_2592C44B4()
{
  return sub_2592C4130(&qword_26A37EE38, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
}

uint64_t sub_2592C44FC()
{
  return sub_2592C4130(&qword_26A37E350, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
}

uint64_t sub_2592C4544()
{
  return sub_2592C4130(&qword_26A37EE20, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
}

uint64_t sub_2592C458C()
{
  return sub_2592C4130(&qword_26A37EE40, (void (*)(uint64_t))type metadata accessor for SyncedPhotosFaceProto);
}

uint64_t sub_2592C45D4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = type metadata accessor for SyncedPhotosFaceProto(0);
  uint64_t v5 = (uint64_t *)(a1 + *(int *)(result + 36));
  if (*((unsigned char *)v5 + 8)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *v5;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_2592C461C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t result = type metadata accessor for SyncedPhotosFaceProto(0);
  uint64_t v5 = a2 + *(int *)(result + 36);
  *(void *)uint64_t v5 = v3;
  *(unsigned char *)(v5 + 8) = 0;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SyncFacesRequestProto(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 24);
    char v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_2593095B0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for SyncFacesRequestProto(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_2593095B0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for SyncFacesRequestProto(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  char v7 = (char *)a2 + v5;
  uint64_t v8 = sub_2593095B0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for SyncFacesRequestProto(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  char v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2593095B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for SyncFacesRequestProto(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_2593095B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for SyncFacesRequestProto(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2593095B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncFacesRequestProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2592C4A44);
}

uint64_t sub_2592C4A44(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2593095B0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SyncFacesRequestProto(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2592C4B08);
}

void *sub_2592C4B08(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2593095B0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2592C4BB0()
{
  uint64_t result = sub_2593095B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t initializeBufferWithCopyOfBuffer for SyncedPhotosFaceProto(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    sub_259261DE0(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v9;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    uint64_t v10 = *(int *)(a3 + 32);
    uint64_t v11 = a1 + v10;
    uint64_t v12 = a2 + v10;
    uint64_t v13 = sub_2593095B0();
    char v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    uint64_t v15 = *(int *)(a3 + 36);
    uint64_t v16 = a1 + v15;
    uint64_t v17 = a2 + v15;
    *(void *)uint64_t v16 = *(void *)v17;
    *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  }
  return a1;
}

uint64_t destroy for SyncedPhotosFaceProto(uint64_t a1, uint64_t a2)
{
  sub_259261F50(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_2593095B0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for SyncedPhotosFaceProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_259261DE0(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v9 = *(int *)(a3 + 32);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_2593095B0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  uint64_t v14 = *(int *)(a3 + 36);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  return a1;
}

uint64_t assignWithCopy for SyncedPhotosFaceProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_259261DE0(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  sub_259261F50(v8, v9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 36);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  char v17 = *(unsigned char *)(v16 + 8);
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = v17;
  return a1;
}

uint64_t initializeWithTake for SyncedPhotosFaceProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  return a1;
}

uint64_t assignWithTake for SyncedPhotosFaceProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_259261F50(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2593095B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SyncedPhotosFaceProto(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2592C518C);
}

uint64_t sub_2592C518C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2593095B0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SyncedPhotosFaceProto(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2592C5250);
}

uint64_t sub_2592C5250(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2593095B0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2592C52F8()
{
  uint64_t result = sub_2593095B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t UUID.init(serialized:version:)(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v5) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      uint64_t v5 = (int)v5;
LABEL_6:
      if (v5 == 16)
      {
        if (!v2) {
          goto LABEL_18;
        }
        if (v2 != 1)
        {
          uint64_t v10 = *(void *)(a1 + 16);
          swift_retain();
          swift_retain();
          if (!sub_2593091E0())
          {
LABEL_26:
            sub_259309200();
            __break(1u);
            JUMPOUT(0x2592C567CLL);
          }
          if (!__OFSUB__(v10, sub_259309210()))
          {
            sub_259309200();
            swift_release();
            swift_release();
            goto LABEL_18;
          }
          goto LABEL_23;
        }
        if ((int)a1 <= a1 >> 32)
        {
          if (!sub_2593091E0())
          {
LABEL_25:
            sub_259309200();
            __break(1u);
            goto LABEL_26;
          }
          if (!__OFSUB__((int)a1, sub_259309210()))
          {
            sub_259309200();
LABEL_18:
            sub_259309410();
            return sub_259261F50(a1, a2);
          }
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
LABEL_13:
      sub_259296F0C();
      swift_allocError();
      unsigned char *v9 = 1;
      swift_willThrow();
      return sub_259261F50(a1, a2);
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      BOOL v8 = __OFSUB__(v6, v7);
      uint64_t v5 = v6 - v7;
      if (!v8) {
        goto LABEL_6;
      }
      goto LABEL_21;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v5 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t UUID.serialized(version:)()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t __src = sub_259309420();
  char v10 = v0;
  char v11 = v1;
  char v12 = v2;
  char v13 = v3;
  char v14 = v4;
  char v15 = v5;
  char v16 = v6;
  char v17 = v7;
  sub_259309420();
  return sub_259267384(&__src, 16);
}

uint64_t FixedWidthInteger.init(serialized:version:)@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v49 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  char v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_25930A550() & 7) != 0)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
  }
  unint64_t v48 = a1;
  uint64_t v11 = sub_25930A550();
  uint64_t v12 = v11 / 8;
  uint64_t v13 = v11;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v14) = HIDWORD(v48) - v48;
      if (__OFSUB__(HIDWORD(v48), v48)) {
        goto LABEL_49;
      }
      uint64_t v14 = (int)v14;
LABEL_7:
      if (v14 != v12)
      {
LABEL_13:
        sub_259296F0C();
        swift_allocError();
        *unint64_t v19 = 1;
        swift_willThrow();
        uint64_t v20 = v48;
        unint64_t v21 = a2;
        return sub_259261F50(v20, v21);
      }
      unint64_t v46 = a2;
      unint64_t v47 = a2 >> 62;
      sub_25930A590();
      if (v47)
      {
        if (v47 == 1) {
          uint64_t v18 = (int)v48;
        }
        else {
          uint64_t v18 = *(void *)(v48 + 16);
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      if (v13 < -7) {
        goto LABEL_48;
      }
      if ((unint64_t)(v13 + 7) < 0xF)
      {
LABEL_18:
        uint64_t v20 = v48;
        unint64_t v21 = v46;
        return sub_259261F50(v20, v21);
      }
      uint64_t v30 = v4;
      uint64_t v23 = v48;
      uint64_t v43 = (uint64_t)v48 >> 32;
      uint64_t v44 = BYTE6(v46);
      uint64_t v45 = (int)v48;
      unint64_t v41 = v48 >> 16;
      unint64_t v42 = v48 >> 8;
      unint64_t v39 = HIDWORD(v48);
      unint64_t v40 = v48 >> 24;
      unint64_t v37 = HIWORD(v48);
      unint64_t v38 = v48 >> 40;
      unint64_t v35 = v46 >> 8;
      unint64_t v36 = HIBYTE(v48);
      unint64_t v33 = v46 >> 24;
      unint64_t v34 = v46 >> 16;
      unint64_t v32 = HIDWORD(v46);
      unint64_t v31 = v46 >> 40;
      break;
    case 2uLL:
      uint64_t v16 = *(void *)(v48 + 16);
      uint64_t v15 = *(void *)(v48 + 24);
      BOOL v17 = __OFSUB__(v15, v16);
      uint64_t v14 = v15 - v16;
      if (!v17) {
        goto LABEL_7;
      }
      goto LABEL_50;
    case 3uLL:
      if ((unint64_t)(v11 + 7) > 0xE) {
        goto LABEL_13;
      }
      unint64_t v46 = a2;
      sub_25930A590();
      goto LABEL_18;
    default:
      uint64_t v14 = BYTE6(a2);
      goto LABEL_7;
  }
  while (1)
  {
    if (!v12)
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    uint64_t v50 = 8;
    sub_2592C7290();
    sub_25930A2E0();
    if (v47) {
      break;
    }
    if (v18 >= v44) {
      goto LABEL_43;
    }
    LOBYTE(v50) = v23;
    BYTE1(v50) = v42;
    BYTE2(v50) = v41;
    BYTE3(v50) = v40;
    BYTE4(v50) = v39;
    BYTE5(v50) = v38;
    BYTE6(v50) = v37;
    HIBYTE(v50) = v36;
    char v51 = v46;
    char v52 = v35;
    char v53 = v34;
    char v54 = v33;
    char v55 = v32;
    char v56 = v31;
    char v24 = *((unsigned char *)&v50 + v18);
LABEL_22:
    LOBYTE(v50) = v24;
    sub_2592C72E4();
    sub_25930A2F0();
    sub_25930A2D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a3);
    ++v18;
    if (!--v12) {
      return sub_259261F50(v23, v46);
    }
  }
  if (v47 == 1)
  {
    if (v18 < v45 || v18 >= v43) {
      goto LABEL_42;
    }
    uint64_t v25 = sub_2593091E0();
    if (!v25) {
      goto LABEL_51;
    }
    uint64_t v23 = v25;
    uint64_t v26 = sub_259309210();
    uint64_t v27 = v18 - v26;
    if (__OFSUB__(v18, v26)) {
      goto LABEL_45;
    }
    goto LABEL_21;
  }
  if (v18 < *(void *)(v23 + 16)) {
    goto LABEL_44;
  }
  if (v18 >= *(void *)(v23 + 24)) {
    goto LABEL_46;
  }
  uint64_t v28 = sub_2593091E0();
  if (!v28) {
    goto LABEL_52;
  }
  uint64_t v23 = v28;
  uint64_t v29 = sub_259309210();
  uint64_t v27 = v18 - v29;
  if (!__OFSUB__(v18, v29))
  {
LABEL_21:
    char v24 = *(unsigned char *)(v23 + v27);
    uint64_t v23 = v48;
    goto LABEL_22;
  }
  __break(1u);
  return sub_259261F50(v23, v46);
}

uint64_t FixedWidthInteger.serialized(version:)(uint64_t a1, uint64_t a2)
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  char v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25930A560();
  sub_2592C5E64((uint64_t)v5, (uint64_t)sub_2592C5D94, 0, a2, MEMORY[0x263F8E628], MEMORY[0x263F06F78], MEMORY[0x263F8E658], v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
  return v8[1];
}

uint64_t sub_2592C5D94@<X0>(uint64_t __src@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (__src)
  {
    uint64_t v4 = (uint64_t)&a2[-__src];
    if (a2 == (unsigned char *)__src)
    {
      uint64_t __src = 0;
      unint64_t v5 = 0xC000000000000000;
    }
    else if (v4 <= 14)
    {
      uint64_t __src = sub_2592C71CC((unsigned char *)__src, a2);
      unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      sub_259309220();
      swift_allocObject();
      uint64_t v6 = sub_2593091D0();
      if ((unint64_t)v4 >= 0x7FFFFFFF)
      {
        sub_259309330();
        uint64_t __src = swift_allocObject();
        *(void *)(__src + 16) = 0;
        *(void *)(__src + 24) = v4;
        unint64_t v5 = v6 | 0x8000000000000000;
      }
      else
      {
        uint64_t __src = v4 << 32;
        unint64_t v5 = v6 | 0x4000000000000000;
      }
    }
    *a3 = __src;
    a3[1] = v5;
  }
  else
  {
    __break(1u);
  }
  return __src;
}

uint64_t sub_2592C5E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t sub_2592C5F58@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  return sub_2592C5FF8(a1, a2, (uint64_t (*)(void))sub_2592C7760, a3);
}

uint64_t sub_2592C5F84@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _WORD *a3@<X8>)
{
  return sub_2592C60C4(a1, a2, a3);
}

uint64_t sub_2592C5F9C@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_2592C6194(a1, a2, a3);
}

uint64_t sub_2592C5FB4@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2592C6260(a1, a2, a3);
}

uint64_t sub_2592C5FCC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  return sub_2592C5FF8(a1, a2, (uint64_t (*)(void))sub_2592C75CC, a3);
}

uint64_t sub_2592C5FF8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t (*a3)(void)@<X5>, unsigned char *a4@<X8>)
{
  char v8 = a3();
  uint64_t result = sub_259261F50(a1, a2);
  if (!v4) {
    *a4 = v8;
  }
  return result;
}

uint64_t sub_2592C6058()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  char __src = *v0;
  return sub_259267384(&__src, 1);
}

uint64_t sub_2592C60C4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _WORD *a3@<X8>)
{
  __int16 v7 = sub_2592C78E8(a1, a2);
  uint64_t result = sub_259261F50(a1, a2);
  if (!v3) {
    *a3 = v7;
  }
  return result;
}

uint64_t sub_2592C6120()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  __int16 __src = bswap32(*v0) >> 16;
  return sub_259267384(&__src, 2);
}

uint64_t sub_2592C6194@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  int v7 = sub_2592C7BE8(a1, a2);
  uint64_t result = sub_259261F50(a1, a2);
  if (!v3) {
    *a3 = v7;
  }
  return result;
}

uint64_t sub_2592C61F0()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  unsigned int __src = bswap32(*v0);
  return sub_259267384(&__src, 4);
}

uint64_t sub_2592C6260@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = sub_2592C7ED8(a1, a2);
  uint64_t result = sub_259261F50(a1, a2);
  if (!v3) {
    *a3 = v7;
  }
  return result;
}

uint64_t sub_2592C62BC()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = bswap64(*v0);
  return sub_259267384(v2, 8);
}

uint64_t String.init(serialized:version:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_259309BD0();
  MEMORY[0x270FA5388](v4 - 8);
  sub_259309BC0();
  uint64_t result = sub_259309BB0();
  if (v6)
  {
    uint64_t v7 = result;
    sub_259261F50(a1, a2);
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t String.serialized(version:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  swift_bridgeObjectRetain();
  return sub_2592D8B40(a2, a3);
}

uint64_t sub_2592C6430@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_259309BD0();
  MEMORY[0x270FA5388](v6 - 8);
  sub_259309BC0();
  uint64_t result = sub_259309BB0();
  if (v8)
  {
    uint64_t v9 = result;
    uint64_t v10 = v8;
    uint64_t result = sub_259261F50(a1, a2);
    *a3 = v9;
    a3[1] = v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2592C64F0()
{
  unint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  swift_bridgeObjectRetain();
  return sub_2592D8B40(v2, v1);
}

uint64_t Array<A>.init(serialized:version:)(uint64_t a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_2593095D0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v20 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v18 - v12;
  int v19 = *a3;
  uint64_t v24 = a1;
  unint64_t v25 = a2;
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  sub_259261DE0(a1, a2);
  uint64_t v21 = a4;
  swift_getAssociatedConformanceWitness();
  sub_2592AC168();
  uint64_t v14 = AssociatedTypeWitness;
  uint64_t v15 = v26;
  sub_259309720();
  if (v15)
  {
    sub_259261F50(a1, a2);
  }
  else
  {
    uint64_t v16 = v20;
    LOBYTE(v22[0]) = v19;
    *(void *)&v22[0] = (*(uint64_t (**)(char *, _OWORD *, uint64_t, uint64_t))(a5 + 32))(v13, v22, v21, a5);
    sub_259309E70();
    swift_getWitnessTable();
    uint64_t v14 = sub_259309E80();
    sub_259261F50(a1, a2);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, AssociatedTypeWitness);
  }
  return v14;
}

uint64_t Array<A>.serialized(version:)(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  double v11 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v15 - v12;
  char v16 = *a1;
  (*(void (**)(uint64_t, char *, uint64_t, uint64_t, double))(a4 + 40))(a2, &v16, a3, a4, v11);
  if (!v4)
  {
    swift_getAssociatedConformanceWitness();
    a3 = sub_259309710();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, AssociatedTypeWitness);
  }
  return a3;
}

uint64_t Array<A>.init(serialized:version:)(uint64_t a1, unint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a4;
  uint64_t v10 = sub_2593095D0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = type metadata accessor for GenericListProto(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (void *)((char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v14 = *a3;
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  sub_259261DE0(a1, a2);
  sub_2593095C0();
  sub_2592C7338();
  uint64_t v15 = v11;
  sub_259309720();
  if (v5)
  {
    sub_259261F50(a1, a2);
  }
  else
  {
    uint64_t v16 = *v13;
    v24[1] = v24;
    *(void *)&long long v25 = v16;
    MEMORY[0x270FA5388](v16);
    uint64_t v17 = a5;
    uint64_t v18 = v29;
    v24[-4] = v29;
    v24[-3] = v17;
    LOBYTE(v24[-2]) = v14;
    swift_bridgeObjectRetain();
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37EE88);
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
    unint64_t v21 = sub_2592C73B4();
    uint64_t v22 = sub_259255A84((void (*)(char *, char *))sub_2592C7390, (uint64_t)&v24[-6], v19, v18, v20, v21, MEMORY[0x263F8E4E0], (uint64_t)v28);
    swift_bridgeObjectRelease();
    *(void *)&long long v25 = v22;
    sub_259309E70();
    swift_getWitnessTable();
    uint64_t v15 = sub_259309E80();
    sub_259261F50(a1, a2);
    sub_2592C7410((uint64_t)v13);
  }
  return v15;
}

uint64_t sub_2592C6C44(uint64_t *a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = *a1;
  unint64_t v10 = a1[1];
  char v13 = a2;
  uint64_t v11 = *(uint64_t (**)(uint64_t, unint64_t, char *, uint64_t, uint64_t))(a4 + 8);
  sub_259261DE0(v9, v10);
  uint64_t result = v11(v9, v10, &v13, a3, a4);
  if (v5) {
    *a5 = v5;
  }
  return result;
}

uint64_t Array<A>.serialized(version:)(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = type metadata accessor for GenericListProto(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  LOBYTE(v10) = *a1;
  _OWORD v22[2] = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  char v21 = v10;
  uint64_t v12 = sub_259309E70();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = sub_259255A84((void (*)(char *, char *))sub_2592C746C, (uint64_t)v18, v12, MEMORY[0x263F06F78], v13, WitnessTable, MEMORY[0x263F8E4E0], (uint64_t)v22);
  if (!v4)
  {
    MEMORY[0x270FA5388](v15);
    *(void *)&v18[-16] = v16;
    sub_2592C7338();
    sub_259309750();
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_259309710();
    sub_2592C7410((uint64_t)v11);
  }
  return v9;
}

uint64_t sub_2592C6ED0(void *a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = a2;
  return result;
}

uint64_t Array<A>.gather(attachments:version:)()
{
  return sub_259309D30();
}

uint64_t Array<A>.save(attachments:version:)()
{
  return sub_259309D30();
}

uint64_t sub_2592C7050@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v8 = *(void *)(a5 - 8);
  char v10 = *a3;
  uint64_t result = Array<A>.init(serialized:version:)(a1, a2, &v10, *(void *)(a4 + 16), v8);
  if (!v6) {
    *a6 = result;
  }
  return result;
}

uint64_t sub_2592C7090(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  return Array<A>.serialized(version:)(a1, *v3, *(void *)(a2 + 16), *(void *)(a3 - 8));
}

uint64_t sub_2592C70B8()
{
  return Array<A>.gather(attachments:version:)();
}

uint64_t sub_2592C70CC()
{
  return Array<A>.save(attachments:version:)();
}

uint64_t sub_2592C70F4(uint64_t a1, unint64_t a2)
{
  return UUID.init(serialized:version:)(a1, a2);
}

uint64_t sub_2592C710C()
{
  return UUID.serialized(version:)();
}

uint64_t Data.serialized(version:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return a2;
}

uint64_t sub_2592C7180@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_2592C7188()
{
  uint64_t v1 = *(void *)v0;
  sub_259261DE0(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t sub_2592C71CC(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

unint64_t sub_2592C7290()
{
  unint64_t result = qword_26A37EE78;
  if (!qword_26A37EE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37EE78);
  }
  return result;
}

unint64_t sub_2592C72E4()
{
  unint64_t result = qword_26A37EE80;
  if (!qword_26A37EE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37EE80);
  }
  return result;
}

unint64_t sub_2592C7338()
{
  unint64_t result = qword_26A37E958;
  if (!qword_26A37E958)
  {
    type metadata accessor for GenericListProto(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37E958);
  }
  return result;
}

uint64_t sub_2592C7390(uint64_t *a1, void *a2)
{
  return sub_2592C6C44(a1, *(unsigned char *)(v2 + 32), *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

unint64_t sub_2592C73B4()
{
  unint64_t result = qword_26A37EE90;
  if (!qword_26A37EE90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A37EE88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37EE90);
  }
  return result;
}

uint64_t sub_2592C7410(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GenericListProto(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2592C746C@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  char v10 = *(unsigned char *)(v2 + 32);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 16))(&v10, v6);
  if (v3)
  {
    *a1 = v3;
  }
  else
  {
    *a2 = result;
    a2[1] = v9;
  }
  return result;
}

uint64_t sub_2592C74D8(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_2592C7524()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 40);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v2 + 24))(v3, &v5, v1);
}

uint64_t sub_2592C7580()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  char v5 = *(unsigned char *)(v0 + 40);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v2 + 32))(v3, &v5, v1);
}

uint64_t sub_2592C75CC(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v3) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      uint64_t v3 = (int)v3;
LABEL_6:
      if (v3 != 1) {
        goto LABEL_14;
      }
      if (!v2)
      {
        if ((a2 & 0xFF000000000000) != 0)
        {
          if ((result & 0x80) != 0) {
            goto LABEL_17;
          }
          return result;
        }
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
      }
      if (v2 != 1) {
        goto LABEL_18;
      }
      uint64_t v7 = (int)result;
      if ((int)result >= result >> 32)
      {
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
      uint64_t v8 = sub_2593091E0();
      if (!v8)
      {
        __break(1u);
LABEL_30:
        __break(1u);
        JUMPOUT(0x2592C7750);
      }
      uint64_t v9 = v8;
      uint64_t v10 = sub_259309210();
      uint64_t v11 = v7 - v10;
      if (__OFSUB__(v7, v10))
      {
        __break(1u);
LABEL_14:
        sub_259296F0C();
        swift_allocError();
        *uint64_t v12 = 1;
        return swift_willThrow();
      }
      while (1)
      {
        uint64_t result = *(unsigned __int8 *)(v9 + v11);
        if ((result & 0x80) == 0) {
          return result;
        }
LABEL_17:
        __break(1u);
LABEL_18:
        uint64_t v13 = *(void *)(result + 16);
        if (v13 >= *(void *)(result + 24)) {
          goto LABEL_27;
        }
        uint64_t v14 = sub_2593091E0();
        if (!v14) {
          goto LABEL_30;
        }
        uint64_t v9 = v14;
        uint64_t v15 = sub_259309210();
        uint64_t v11 = v13 - v15;
        if (__OFSUB__(v13, v15)) {
          goto LABEL_28;
        }
      }
    case 2uLL:
      uint64_t v5 = *(void *)(result + 16);
      uint64_t v4 = *(void *)(result + 24);
      BOOL v6 = __OFSUB__(v4, v5);
      uint64_t v3 = v4 - v5;
      if (!v6) {
        goto LABEL_6;
      }
      goto LABEL_24;
    case 3uLL:
      goto LABEL_14;
    default:
      uint64_t v3 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_2592C7760(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v3) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      uint64_t v3 = (int)v3;
LABEL_6:
      if (v3 != 1) {
        goto LABEL_14;
      }
      if (v2)
      {
        if (v2 == 1)
        {
          uint64_t v7 = (int)result;
          if ((int)result < result >> 32)
          {
            uint64_t v8 = sub_2593091E0();
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = sub_259309210();
              uint64_t v11 = v7 - v10;
              if (!__OFSUB__(v7, v10)) {
                return *(unsigned __int8 *)(v9 + v11);
              }
              __break(1u);
LABEL_14:
              sub_259296F0C();
              swift_allocError();
              *uint64_t v12 = 1;
              return swift_willThrow();
            }
            __break(1u);
LABEL_28:
            __break(1u);
            JUMPOUT(0x2592C78D8);
          }
          goto LABEL_24;
        }
      }
      else
      {
        if ((a2 & 0xFF000000000000) != 0) {
          return result;
        }
        __break(1u);
      }
      uint64_t v13 = *(void *)(result + 16);
      if (v13 >= *(void *)(result + 24))
      {
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
      uint64_t v14 = sub_2593091E0();
      if (!v14) {
        goto LABEL_28;
      }
      uint64_t v9 = v14;
      uint64_t v15 = sub_259309210();
      uint64_t v11 = v13 - v15;
      if (__OFSUB__(v13, v15)) {
LABEL_26:
      }
        __break(1u);
      return *(unsigned __int8 *)(v9 + v11);
    case 2uLL:
      uint64_t v5 = *(void *)(result + 16);
      uint64_t v4 = *(void *)(result + 24);
      BOOL v6 = __OFSUB__(v4, v5);
      uint64_t v3 = v4 - v5;
      if (!v6) {
        goto LABEL_6;
      }
      goto LABEL_23;
    case 3uLL:
      goto LABEL_14;
    default:
      uint64_t v3 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_2592C78E8(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 2) {
        goto LABEL_21;
      }
      uint64_t v8 = (int)a1;
      if (!v2)
      {
        if (BYTE6(a2) && BYTE6(a2) > 1uLL) {
          return BYTE1(a1) | (a1 << 8);
        }
        goto LABEL_38;
      }
      if (v2 == 1) {
        uint64_t v9 = (int)a1;
      }
      else {
        uint64_t v9 = *(void *)(a1 + 16);
      }
      if (v2 == 1)
      {
        if (v9 >= (int)a1)
        {
          uint64_t v10 = a1 >> 32;
          if (v9 < a1 >> 32)
          {
            uint64_t v11 = sub_2593091E0();
            if (!v11)
            {
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            uint64_t v12 = v11;
            uint64_t v13 = sub_259309210();
            uint64_t v14 = v9 - v13;
            if (__OFSUB__(v9, v13))
            {
LABEL_20:
              __break(1u);
LABEL_21:
              sub_259296F0C();
              swift_allocError();
              *char v21 = 1;
              return swift_willThrow();
            }
            uint64_t v15 = v9 + 1;
            if (v15 >= v8 && v15 < v10)
            {
              int v16 = *(unsigned __int8 *)(v12 + v14);
              uint64_t v17 = sub_2593091E0();
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = sub_259309210();
                uint64_t v20 = v15 - v19;
                if (!__OFSUB__(v15, v19)) {
                  return *(unsigned __int8 *)(v18 + v20) | (v16 << 8);
                }
                goto LABEL_20;
              }
              goto LABEL_43;
            }
          }
        }
        goto LABEL_39;
      }
      if (v9 < *(void *)(a1 + 16))
      {
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      if (v9 >= *(void *)(a1 + 24)) {
        goto LABEL_41;
      }
      uint64_t v23 = sub_2593091E0();
      if (!v23)
      {
LABEL_44:
        __break(1u);
        JUMPOUT(0x2592C7BD8);
      }
      uint64_t v24 = v23;
      uint64_t v25 = sub_259309210();
      uint64_t v26 = v9 - v25;
      if (__OFSUB__(v9, v25)) {
        goto LABEL_42;
      }
      uint64_t v27 = v9 + 1;
      if (v27 < *(void *)(a1 + 16)) {
        goto LABEL_40;
      }
      if (v27 >= *(void *)(a1 + 24))
      {
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
      }
      int v16 = *(unsigned __int8 *)(v24 + v26);
      uint64_t v28 = sub_2593091E0();
      if (!v28) {
        goto LABEL_44;
      }
      uint64_t v18 = v28;
      uint64_t v29 = sub_259309210();
      uint64_t v20 = v27 - v29;
      if (__OFSUB__(v27, v29)) {
        goto LABEL_42;
      }
      return *(unsigned __int8 *)(v18 + v20) | (v16 << 8);
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_37;
    case 3uLL:
      goto LABEL_21;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_2592C7BE8(unint64_t a1, unint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unint64_t v3 = a2 >> 62;
  char v4 = a2;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_38;
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      if (v6 != 4)
      {
LABEL_10:
        sub_259296F0C();
        swift_allocError();
        unsigned char *v11 = 1;
        swift_willThrow();
        return v2;
      }
      uint64_t v36 = (int)a1;
      if (v3)
      {
        if (v3 == 1) {
          uint64_t v10 = (int)a1;
        }
        else {
          uint64_t v10 = *(void *)(a1 + 16);
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      uint64_t v12 = 0;
      uint64_t v2 = 0;
      uint64_t v34 = (uint64_t)a1 >> 32;
      uint64_t v35 = BYTE6(a2);
      unint64_t v32 = a1 >> 16;
      unint64_t v33 = a1 >> 8;
      unint64_t v31 = a1 >> 24;
      unint64_t v29 = a1 >> 40;
      unint64_t v30 = HIDWORD(a1);
      unint64_t v27 = HIBYTE(a1);
      unint64_t v28 = HIWORD(a1);
      unint64_t v25 = a2 >> 16;
      unint64_t v26 = a2 >> 8;
      unint64_t v23 = HIDWORD(a2);
      unint64_t v24 = a2 >> 24;
      unint64_t v22 = a2 >> 40;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v7 = *(void *)(a1 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_39;
    case 3uLL:
      goto LABEL_10;
    default:
      uint64_t v6 = BYTE6(a2);
      goto LABEL_6;
  }
  while (1)
  {
    uint64_t v14 = v10 + v12;
    if (v3) {
      break;
    }
    if (v14 >= v35) {
      goto LABEL_34;
    }
    v37[0] = a1;
    v37[1] = v33;
    v37[2] = v32;
    v37[3] = v31;
    v37[4] = v30;
    v37[5] = v29;
    v37[6] = v28;
    v37[7] = v27;
    v37[8] = v4;
    v37[9] = v26;
    v37[10] = v25;
    v37[11] = v24;
    v37[12] = v23;
    v37[13] = v22;
    unsigned int v13 = v37[v10 + v12];
LABEL_15:
    ++v12;
    uint64_t v2 = (v2 << 8) | v13;
    if (v12 == 4) {
      return v2;
    }
  }
  if (v3 == 1)
  {
    if (v14 < v36 || v14 >= v34)
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
    }
    uint64_t v15 = sub_2593091E0();
    if (!v15) {
      goto LABEL_40;
    }
    uint64_t v16 = v15;
    uint64_t v17 = sub_259309210();
    uint64_t v18 = v14 - v17;
    if (__OFSUB__(v14, v17)) {
      goto LABEL_36;
    }
    goto LABEL_14;
  }
  if (v14 < *(void *)(a1 + 16)) {
    goto LABEL_35;
  }
  if (v14 >= *(void *)(a1 + 24)) {
    goto LABEL_37;
  }
  uint64_t v19 = sub_2593091E0();
  if (!v19) {
    goto LABEL_41;
  }
  uint64_t v16 = v19;
  uint64_t v20 = sub_259309210();
  uint64_t v18 = v14 - v20;
  if (!__OFSUB__(v14, v20))
  {
LABEL_14:
    unsigned int v13 = *(unsigned __int8 *)(v16 + v18);
    goto LABEL_15;
  }
  __break(1u);
  return v2;
}

uint64_t sub_2592C7ED8(unint64_t a1, unint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unint64_t v3 = a2 >> 62;
  char v4 = a2;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_38;
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      if (v6 != 8)
      {
LABEL_10:
        sub_259296F0C();
        swift_allocError();
        unsigned char *v11 = 1;
        swift_willThrow();
        return v2;
      }
      uint64_t v36 = (int)a1;
      if (v3)
      {
        if (v3 == 1) {
          uint64_t v10 = (int)a1;
        }
        else {
          uint64_t v10 = *(void *)(a1 + 16);
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      uint64_t v12 = 0;
      uint64_t v2 = 0;
      uint64_t v34 = (uint64_t)a1 >> 32;
      uint64_t v35 = BYTE6(a2);
      unint64_t v32 = a1 >> 16;
      unint64_t v33 = a1 >> 8;
      unint64_t v31 = a1 >> 24;
      unint64_t v29 = a1 >> 40;
      unint64_t v30 = HIDWORD(a1);
      unint64_t v27 = HIBYTE(a1);
      unint64_t v28 = HIWORD(a1);
      unint64_t v25 = a2 >> 16;
      unint64_t v26 = a2 >> 8;
      unint64_t v23 = HIDWORD(a2);
      unint64_t v24 = a2 >> 24;
      unint64_t v22 = a2 >> 40;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v7 = *(void *)(a1 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_39;
    case 3uLL:
      goto LABEL_10;
    default:
      uint64_t v6 = BYTE6(a2);
      goto LABEL_6;
  }
  while (1)
  {
    uint64_t v14 = v10 + v12;
    if (v3) {
      break;
    }
    if (v14 >= v35) {
      goto LABEL_34;
    }
    v37[0] = a1;
    v37[1] = v33;
    v37[2] = v32;
    v37[3] = v31;
    v37[4] = v30;
    v37[5] = v29;
    v37[6] = v28;
    v37[7] = v27;
    v37[8] = v4;
    v37[9] = v26;
    v37[10] = v25;
    v37[11] = v24;
    v37[12] = v23;
    v37[13] = v22;
    uint64_t v13 = v37[v10 + v12];
LABEL_15:
    ++v12;
    uint64_t v2 = (v2 << 8) | v13;
    if (v12 == 8) {
      return v2;
    }
  }
  if (v3 == 1)
  {
    if (v14 < v36 || v14 >= v34)
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
    }
    uint64_t v15 = sub_2593091E0();
    if (!v15) {
      goto LABEL_40;
    }
    uint64_t v16 = v15;
    uint64_t v17 = sub_259309210();
    uint64_t v18 = v14 - v17;
    if (__OFSUB__(v14, v17)) {
      goto LABEL_36;
    }
    goto LABEL_14;
  }
  if (v14 < *(void *)(a1 + 16)) {
    goto LABEL_35;
  }
  if (v14 >= *(void *)(a1 + 24)) {
    goto LABEL_37;
  }
  uint64_t v19 = sub_2593091E0();
  if (!v19) {
    goto LABEL_41;
  }
  uint64_t v16 = v19;
  uint64_t v20 = sub_259309210();
  uint64_t v18 = v14 - v20;
  if (!__OFSUB__(v14, v20))
  {
LABEL_14:
    uint64_t v13 = *(unsigned __int8 *)(v16 + v18);
    goto LABEL_15;
  }
  __break(1u);
  return v2;
}

uint64_t sub_2592C81C8()
{
  return sub_2592C6058();
}

uint64_t sub_2592C8214()
{
  return sub_2592C6120();
}

uint64_t sub_2592C8260()
{
  return sub_2592C61F0();
}

uint64_t sub_2592C82AC()
{
  return sub_2592C62BC();
}

uint64_t sub_2592C82F8(uint64_t a1)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2592C83D0()
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t BroadcastSequence.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  BroadcastSequence.init()();
  return v0;
}

uint64_t BroadcastSequence.init()()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  sub_259309FF0();
  *(void *)(v0 + 16) = sub_259309A60();
  *(unsigned char *)(v0 + 24) = 0;
  return v0;
}

uint64_t sub_2592C851C(uint64_t a1)
{
  uint64_t v33 = a1;
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v31 = (char *)&v24 - v4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  uint64_t v30 = sub_259309FB0();
  uint64_t v5 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  unint64_t v29 = (char *)&v24 - v6;
  uint64_t v32 = v2;
  uint64_t v7 = sub_259309FF0();
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v34 + 64);
  MEMORY[0x270FA5388](v7);
  unint64_t v28 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v24 - v10;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = sub_2592C9280();
  uint64_t v13 = swift_bridgeObjectRetain();
  if (MEMORY[0x25A2DA6C0](v13, v7))
  {
    uint64_t v14 = 0;
    unint64_t v26 = (void (**)(char *, char *, uint64_t))(v34 + 32);
    unint64_t v27 = (void (**)(char *, uint64_t *, uint64_t))(v34 + 16);
    uint64_t v24 = v8;
    unint64_t v25 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v15 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v16 = (void (**)(char *, uint64_t))(v34 + 8);
    uint64_t v17 = v28;
    while (1)
    {
      char v18 = sub_259309E10();
      sub_259309DD0();
      if (v18)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v34 + 16))(v11, v12+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(void *)(v34 + 72) * v14, v7);
        uint64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t result = sub_25930A410();
        if (v24 != 8)
        {
          __break(1u);
          return result;
        }
        uint64_t v35 = result;
        (*v27)(v11, &v35, v7);
        swift_unknownObjectRelease();
        uint64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_14:
          __break(1u);
          return swift_bridgeObjectRelease();
        }
      }
      (*v26)(v17, v11, v7);
      (*v25)(v31, v33, v32);
      uint64_t v20 = v11;
      char v21 = v29;
      sub_259309FD0();
      unint64_t v22 = v21;
      uint64_t v11 = v20;
      (*v15)(v22, v30);
      (*v16)(v17, v7);
      ++v14;
      if (v19 == MEMORY[0x25A2DA6C0](v12, v7)) {
        return swift_bridgeObjectRelease();
      }
    }
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_2592C89A4()
{
  unint64_t result = qword_26B2F3938;
  if (!qword_26B2F3938)
  {
    type metadata accessor for CommunicationActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2F3938);
  }
  return result;
}

uint64_t sub_2592C89FC(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  uint64_t v3 = sub_259309FF0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v16 - v6;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = sub_2592C9280();
  uint64_t v9 = swift_bridgeObjectRetain();
  if (!MEMORY[0x25A2DA6C0](v9, v3))
  {
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_259309DF0();
    return sub_2592C82F8(v15);
  }
  uint64_t v17 = v5;
  uint64_t v18 = v1;
  uint64_t v10 = 0;
  while (1)
  {
    char v11 = sub_259309E10();
    sub_259309DD0();
    if (v11)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v7, v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v10, v3);
      uint64_t v12 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_14;
      }
      goto LABEL_9;
    }
    uint64_t result = sub_25930A410();
    if (v17 != 8) {
      break;
    }
    uint64_t v19 = result;
    (*(void (**)(char *, uint64_t *, uint64_t))(v4 + 16))(v7, &v19, v3);
    swift_unknownObjectRelease();
    uint64_t v12 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
LABEL_9:
    uint64_t v19 = (uint64_t)a1;
    id v13 = a1;
    sub_259309FE0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    ++v10;
    if (v12 == MEMORY[0x25A2DA6C0](v8, v3)) {
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2592C8CD4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  uint64_t v2 = sub_259309FC0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v7 - v3;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = sub_2592C83D0();
  if (v5)
  {
    MEMORY[0x270FA5388](v5);
    *(&v7 - 2) = v1;
  }
  sub_2592C8F9C((uint64_t)v4);
  return sub_25930A010();
}

uint64_t sub_2592C8EAC()
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  sub_259309FF0();
  return sub_259309FE0();
}

uint64_t sub_2592C8F9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F680];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  uint64_t v3 = sub_259309FC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_2592C9038(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  uint64_t v2 = sub_259309FF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - v4;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  sub_259309E70();
  sub_259309E40();
  return swift_endAccess();
}

uint64_t BroadcastSequence.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BroadcastSequence.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2592C9280()
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_2592C934C(uint64_t a1)
{
  return sub_2592C9038(a1);
}

uint64_t sub_2592C9354()
{
  return sub_2592C8EAC();
}

uint64_t sub_2592C935C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BroadcastSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for BroadcastSequence(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BroadcastSequence);
}

uint64_t dispatch thunk of BroadcastSequence.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of BroadcastSequence.yield(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of BroadcastSequence.finish(throwing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of BroadcastSequence.listen()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t sub_2592C945C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  sub_25930A000();
  return swift_getWitnessTable();
}

uint64_t AsyncSequence.collect()(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return MEMORY[0x270FA2498](sub_2592C94EC, 0, 0);
}

uint64_t sub_2592C94EC()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  swift_getAssociatedTypeWitness();
  v0[3] = sub_259309A60();
  uint64_t v3 = swift_task_alloc();
  v0[7] = v3;
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  uint64_t v5 = sub_259309E70();
  *uint64_t v4 = v0;
  v4[1] = sub_2592C961C;
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[4];
  return MEMORY[0x270FA20A8](v0 + 2, v0 + 3, &unk_26A37EEA8, v3, v7, v5, v6);
}

uint64_t sub_2592C961C()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_259279778;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2592C9738;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592C9738()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2592C9754(uint64_t a1, uint64_t a2)
{
  void v2[2] = a1;
  v2[3] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[4] = AssociatedTypeWitness;
  v2[5] = *(void *)(AssociatedTypeWitness - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592C982C, 0, 0);
}

uint64_t sub_2592C982C()
{
  (*(void (**)(void, void, void))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  sub_259309E70();
  sub_259309E40();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2592C98D4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25921D238;
  return sub_2592C9754(a1, a2);
}

uint64_t DestructableSequence.__allocating_init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  swift_allocObject();
  uint64_t v8 = sub_2592CA270(a1, a2, a3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v4 + 80) - 8) + 8))(a1);
  return v8;
}

uint64_t DestructableSequence.init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  uint64_t v6 = sub_2592CA270(a1, a2, a3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v5 + 80) - 8) + 8))(a1);
  return v6;
}

uint64_t DestructableSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = (uint64_t)v2;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  double v11 = MEMORY[0x270FA5388](AssociatedTypeWitness - 8);
  id v13 = (char *)&v15 - v12;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16))(v9, v3 + *(void *)(v5 + 96), v6, v11);
  sub_259309F80();
  DestructableIterator.init(_:_:)((uint64_t)v13, v3, a2);
  return swift_retain();
}

uint64_t DestructableIterator.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a3, a1, AssociatedTypeWitness);
  uint64_t result = type metadata accessor for DestructableIterator();
  *(void *)(a3 + *(int *)(result + 36)) = a2;
  return result;
}

atomic_uchar *sub_2592C9CE8()
{
  uint64_t result = (atomic_uchar *)(*(uint64_t (**)(void))(**(void **)(v0 + *(void *)(*(void *)v0 + 104)) + 136))();
  if (atomic_exchange(result, 1u)) {
    return (atomic_uchar *)(*(uint64_t (**)(void))(v0 + *(void *)(*(void *)v0 + 112)))();
  }
  return result;
}

uint64_t *DestructableSequence.deinit()
{
  uint64_t v1 = *v0;
  sub_2592C9CE8();
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(void *)(*v0 + 96));
  swift_release();
  swift_release();
  return v0;
}

uint64_t DestructableSequence.__deallocating_deinit()
{
  DestructableSequence.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2592C9E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  DestructableSequence.makeAsyncIterator()(a1, a2);
  return swift_release();
}

uint64_t DestructableIterator.next()(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = *(void *)(a2 + 24);
  v3[6] = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[7] = v7;
  void *v7 = v3;
  v7[1] = sub_2592C9FD0;
  return MEMORY[0x270FA1E80](a1, AssociatedTypeWitness, AssociatedConformanceWitness);
}

uint64_t sub_2592C9FD0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2592CA100, 0, 0);
  }
}

uint64_t sub_2592CA100()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48))(v1, 1, AssociatedTypeWitness) == 1)sub_2592C9CE8(); {
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v3();
}

uint64_t sub_2592CA1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25921D238;
  return DestructableIterator.next()(a1, a2);
}

uint64_t sub_2592CA270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v3 + 80) - 8) + 16))(v3 + *(void *)(*(void *)v3 + 96), a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37EFC8);
  uint64_t v6 = swift_allocObject();
  *(unsigned char *)(v6 + 16) = 0;
  *(void *)(v3 + *(void *)(*(void *)v3 + 104)) = v6;
  uint64_t v7 = (void *)(v3 + *(void *)(*(void *)v3 + 112));
  void *v7 = a2;
  v7[1] = a3;
  return v3;
}

uint64_t type metadata accessor for DestructableIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2592CA364()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592CA380()
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

uint64_t type metadata accessor for DestructableSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DestructableSequence(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DestructableSequence);
}

uint64_t dispatch thunk of DestructableSequence.__allocating_init(_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_2592CA474()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2592CA520(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_2592CA634(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  return swift_release();
}

uint64_t sub_2592CA6C8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 48) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 48) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_2592CA76C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 40) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 40) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2592CA81C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2592CA8BC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  *(void *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_2592CA964(_DWORD *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    uint64_t v10 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = a2 - v7 + 1;
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
        int v14 = *((unsigned __int8 *)a1 + v9);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x2592CAB04);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v9);
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
  if (v6 < 0x7FFFFFFF)
  {
    unint64_t v18 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v18 >= 0xFFFFFFFF) {
      LODWORD(v18) = -1;
    }
    return (v18 + 1);
  }
  else
  {
    uint64_t v17 = *(uint64_t (**)(_DWORD *))(v5 + 48);
    return v17(a1);
  }
}

void sub_2592CAB18(_DWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  size_t v10 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (((v8 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    unsigned int v11 = a3 - v9 + 1;
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
  if (v9 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v9)
  {
    if (((v8 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v15 = a2 - v9;
    }
    else {
      int v15 = 1;
    }
    if (((v8 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v16 = ~v9 + a2;
      bzero(a1, v10);
      *a1 = v16;
    }
    switch(v14)
    {
      case 1:
        *((unsigned char *)a1 + v10) = v15;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v10) = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)((char *)a1 + v10) = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      *((unsigned char *)a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)((char *)a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x2592CAD18);
    case 4:
      *(_DWORD *)((char *)a1 + v10) = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          unint64_t v18 = (void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v19 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v19 = (a2 - 1);
          }
          *unint64_t v18 = v19;
        }
        else
        {
          uint64_t v17 = *(void (**)(_DWORD *, uint64_t))(v6 + 56);
          v17(a1, a2);
        }
      }
      return;
  }
}

uint64_t generateElements<A>(isolation:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592CBF60(a3, a4);
}

uint64_t generateOne<A>(isolation:_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  return sub_2592CB2F4(a1, a2, a3, (uint64_t)&unk_26A37EFD8, a4);
}

uint64_t sub_2592CAD70(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = *(void *)(a5 - 8);
  uint64_t v7 = swift_task_alloc();
  v5[6] = v7;
  size_t v10 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[7] = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_2592CAEAC;
  return v10(v7);
}

uint64_t sub_2592CAEAC()
{
  uint64_t v2 = (void *)*v1;
  v2[8] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2592CB20C, 0, 0);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))(v2[2] + *(int *)v2[2]);
    uint64_t v3 = (void *)swift_task_alloc();
    v2[9] = v3;
    *uint64_t v3 = v2;
    v3[1] = sub_2592CB064;
    uint64_t v4 = v2[6];
    return v6(v4);
  }
}

uint64_t sub_2592CB064()
{
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *v1;
  *(void *)(v5 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2592CB270, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2592CB20C()
{
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592CB270()
{
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t generateArray<A>(isolation:_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  return sub_2592CB2F4(a1, a2, a3, (uint64_t)&unk_26A37EFE8, a4);
}

uint64_t sub_2592CB2F4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t *a5@<X8>)
{
  size_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a1;
  v10[4] = a2;
  uint64_t result = sub_2592CBF60(a4, (uint64_t)v10);
  *a5 = result;
  return result;
}

uint64_t sub_2592CB360(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a2;
  v5[5] = a5;
  v5[3] = a1;
  uint64_t v7 = *(void *)(a5 - 8);
  v5[6] = v7;
  v5[7] = *(void *)(v7 + 64);
  v5[8] = swift_task_alloc();
  v5[9] = swift_task_alloc();
  size_t v10 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  v5[10] = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_2592CB4A4;
  return v10();
}

uint64_t sub_2592CB4A4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 88) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2592CB5E8, 0, 0);
  }
}

uint64_t sub_2592CB5E8()
{
  if (MEMORY[0x25A2DA6C0](v0[11], v0[5]))
  {
    char v1 = sub_259309E10();
    sub_259309DD0();
    if (v1)
    {
      (*(void (**)(void, unint64_t, void))(v0[6] + 16))(v0[9], v0[11] + ((*(unsigned __int8 *)(v0[6] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[6] + 80)), v0[5]);
    }
    else
    {
      uint64_t v7 = v0[7];
      uint64_t result = sub_25930A410();
      if (v7 != 8)
      {
        __break(1u);
        return result;
      }
      uint64_t v8 = result;
      uint64_t v9 = v0[9];
      uint64_t v10 = v0[5];
      uint64_t v11 = v0[6];
      v0[2] = v8;
      (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v9, v0 + 2, v10);
      swift_unknownObjectRelease();
    }
    v0[12] = 1;
    uint64_t v2 = (int *)v0[3];
    (*(void (**)(void, void, void))(v0[6] + 32))(v0[8], v0[9], v0[5]);
    int v12 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[13] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2592CB7F4;
    uint64_t v4 = v0[8];
    return v12(v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_2592CB7F4()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2592CBB58;
  }
  else
  {
    uint64_t v2 = sub_2592CB910;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592CB910()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[5];
  (*(void (**)(void, uint64_t))(v0[6] + 8))(v0[8], v3);
  if (v2 == MEMORY[0x25A2DA6C0](v1, v3))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  uint64_t v6 = v0[12];
  char v7 = sub_259309E10();
  sub_259309DD0();
  if (v7)
  {
    uint64_t result = (*(uint64_t (**)(void, unint64_t, void))(v0[6] + 16))(v0[9], v0[11]+ ((*(unsigned __int8 *)(v0[6] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[6] + 80))+ *(void *)(v0[6] + 72) * v6, v0[5]);
  }
  else
  {
    uint64_t v11 = v0[7];
    uint64_t result = sub_25930A410();
    if (v11 != 8)
    {
LABEL_14:
      __break(1u);
      return result;
    }
    uint64_t v12 = v0[9];
    uint64_t v13 = v0[5];
    uint64_t v14 = v0[6];
    v0[2] = result;
    (*(void (**)(uint64_t, void *, uint64_t))(v14 + 16))(v12, v0 + 2, v13);
    uint64_t result = swift_unknownObjectRelease();
  }
  v0[12] = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v8 = (int *)v0[3];
  (*(void (**)(void, void, void))(v0[6] + 32))(v0[8], v0[9], v0[5]);
  int v15 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[13] = v9;
  void *v9 = v0;
  v9[1] = sub_2592CB7F4;
  uint64_t v10 = v0[8];
  return v15(v10);
}

uint64_t sub_2592CBB58()
{
  (*(void (**)(void, void))(v0[6] + 8))(v0[8], v0[5]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2592CBBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_2592CBC00, 0, 0);
}

uint64_t sub_2592CBC00()
{
  uint64_t v4 = (uint64_t (*)(void *, uint64_t))(v0[2] + *(int *)v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2592CBCE0;
  uint64_t v2 = v0[4];
  return v4(&unk_26A37F008, v2);
}

uint64_t sub_2592CBCE0()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592CBE54;
  }
  else {
    uint64_t v2 = sub_2592CBDF4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592CBDF4()
{
  AsyncThrowingChannel.finish()();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592CBE54()
{
  uint64_t v1 = *(void **)(v0 + 48);
  AsyncThrowingChannel.fail<>(_:)(v1);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2592CBEC4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2592374A4;
  return AsyncThrowingChannel.send(_:)(a1);
}

uint64_t sub_2592CBF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  type metadata accessor for AsyncThrowingChannel();
  swift_retain();
  uint64_t v7 = AsyncThrowingChannel.__allocating_init()();
  uint64_t v8 = sub_259309F20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  v9[6] = v7;
  swift_retain();
  sub_2592EBE08((uint64_t)v6, (uint64_t)&unk_26A37EFF8, (uint64_t)v9);
  swift_release();
  swift_release();
  return v7;
}

uint64_t sub_2592CC0B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592CC0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = (int *)v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  void *v9 = v3;
  v9[1] = sub_25921D238;
  return sub_2592CAD70(a1, a2, v7, v8, v6);
}

uint64_t sub_2592CC1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = (int *)v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  void *v9 = v3;
  v9[1] = sub_2592438A0;
  return sub_2592CB360(a1, a2, v7, v8, v6);
}

uint64_t sub_2592CC270()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  type metadata accessor for AsyncThrowingChannel();
  return swift_getWitnessTable();
}

uint64_t sub_2592CC2DC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592CC324()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_25921D238;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return MEMORY[0x270FA2498](sub_2592CBC00, 0, 0);
}

uint64_t sub_2592CC3D8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2592438A0;
  return sub_2592CBEC4(a1);
}

uint64_t AsyncIteratorProtocol.sequence.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t IterateOnceSequence.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t IterateOnceSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t sub_2592CC5B8(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_2592CC5C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  IterateOnceSequence.makeAsyncIterator()(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);
  return v4(v2, a1);
}

uint64_t sub_2592CC620(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_2592CC77C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x2592CC994);
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

uint64_t type metadata accessor for IterateOnceSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AsyncSequence.generic.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(boxed_opaque_existential_1, v3, a1);
  return sub_2592CCABC(&v8, a3);
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

uint64_t WrapperIterator.init(_:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2592CCABC(a1, a2);
}

uint64_t sub_2592CCABC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t WrapperIterator.next()(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2592CCAF4, 0, 0);
}

uint64_t sub_2592CCAF4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2592CCBB0;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA1E80](v5, v2, v3);
}

uint64_t sub_2592CCBB0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2592CCCF4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_25921D238;
  return MEMORY[0x270FA2498](sub_2592CCAF4, 0, 0);
}

uint64_t WrapperSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  double v4 = MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, double))(v6 + 16))((char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v9);
  sub_259309F80();
  return sub_2592CCABC(&v9, a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2592CCF20()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592CCF3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  WrapperSequence.makeAsyncIterator()(a2);
  double v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);
  return v4(v2, a1);
}

uint64_t *sub_2592CCFA4(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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
        int v11 = *(uint64_t (**)(void))(v10 + 24);
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_2592CD210(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t type metadata accessor for WrapperIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2592CD26C(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t sub_2592CD2C4(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2592CD30C(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for WrapperSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AsyncSequence<>.throwing.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t MakeThrowingIterator.next()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_25921D238;
  return MEMORY[0x270FA1E80](a1, v4, v5);
}

uint64_t sub_2592CD504(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2592438A0;
  return MakeThrowingIterator.next()(a1, a2);
}

uint64_t MakeThrowingSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  double v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))(v7, v2, v4, v10);
  sub_259309F80();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v12, AssociatedTypeWitness);
}

uint64_t sub_2592CD73C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592CD758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MakeThrowingSequence.makeAsyncIterator()(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);
  return v4(v2, a1);
}

uint64_t type metadata accessor for MakeThrowingIterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2592CD7F4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_2592CD950(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x2592CDB68);
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

uint64_t type metadata accessor for MakeThrowingSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static String.read(from:key:)(void *a1)
{
  uint64_t v2 = (void *)sub_259309B80();
  id v3 = objc_msgSend(a1, sel_stringForKey_, v2);

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_259309B90();

  return v4;
}

Swift::Void __swiftcall String.write(to:key:)(NSUserDefaults to, Swift::String key)
{
  Class isa = to.super.isa;
  id v3 = (void *)sub_259309B80();
  id v4 = (id)sub_259309B80();
  [(objc_class *)isa setObject:v3 forKey:v4];
}

void sub_2592CDCB8(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = (void *)sub_259309B80();
  id v5 = objc_msgSend(a1, sel_stringForKey_, v4);

  if (v5)
  {
    uint64_t v6 = sub_259309B90();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a2 = v6;
  a2[1] = v8;
}

void sub_2592CDD40(void *a1)
{
  uint64_t v2 = (void *)sub_259309B80();
  id v3 = (id)sub_259309B80();
  objc_msgSend(a1, sel_setObject_forKey_, v2, v3);
}

uint64_t static Int.read(from:key:)(void *a1)
{
  return sub_2592CF5E4(a1);
}

Swift::Void __swiftcall Int.write(to:key:)(NSUserDefaults to, Swift::String key)
{
  CFStringRef container = to._container_;
  Class isa = to.super.isa;
  id v4 = (id)sub_259309B80();
  [(objc_class *)isa setInteger:container forKey:v4];
}

uint64_t sub_2592CDE50@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2592CF5E4(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2592CDE88(void *a1)
{
  uint64_t v3 = *v1;
  id v4 = (id)sub_259309B80();
  objc_msgSend(a1, sel_setInteger_forKey_, v3, v4);
}

uint64_t static Duration.read(from:key:)(void *a1)
{
  uint64_t v2 = (void *)sub_259309B80();
  id v3 = objc_msgSend(a1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_25930A300();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_2592CF51C((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return sub_25930A9B0();
    }
  }
  else
  {
    sub_2592CF584((uint64_t)v6);
  }
  return 0;
}

Swift::Void __swiftcall Duration.write(to:key:)(NSUserDefaults to, Swift::String key)
{
  Class isa = to.super.isa;
  double v3 = (double)sub_25930A960();
  sub_25930A960();
  double v5 = (double)v4 / 1.0e18 + v3;
  id v6 = (id)sub_259309B80();
  [(objc_class *)isa setDouble:v6 forKey:v5];
}

uint64_t sub_2592CE08C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = static Duration.read(from:key:)(a1);
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  return result;
}

void sub_2592CE0BC(void *a1)
{
  double v2 = (double)sub_25930A960();
  sub_25930A960();
  double v4 = (double)v3 / 1.0e18 + v2;
  id v5 = (id)sub_259309B80();
  objc_msgSend(a1, sel_setDouble_forKey_, v5, v4);
}

uint64_t static UInt64.read(from:key:)(void *a1)
{
  return sub_2592CF5E4(a1);
}

Swift::Void __swiftcall UInt64.write(to:key:)(NSUserDefaults to, Swift::String key)
{
  Class isa = to.super.isa;
  uint64_t v3 = (void *)sub_25930A930();
  id v4 = (id)sub_259309B80();
  [(objc_class *)isa setObject:v3 forKey:v4];
}

uint64_t sub_2592CE21C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2592CF5E4(a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2592CE254(void *a1)
{
  double v2 = (void *)sub_25930A930();
  id v3 = (id)sub_259309B80();
  objc_msgSend(a1, sel_setObject_forKey_, v2, v3);
}

Swift::Void __swiftcall Bool.write(to:key:)(NSUserDefaults to, Swift::String key)
{
  char container = (char)to._container_;
  Class isa = to.super.isa;
  id v4 = (id)sub_259309B80();
  [(objc_class *)isa setBool:container & 1 forKey:v4];
}

uint64_t sub_2592CE344@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _sSb10PhotosFaceE4read4from3keySbSgSo14NSUserDefaultsC_SStFZ_0(a1);
  *a2 = result;
  return result;
}

void sub_2592CE36C(void *a1)
{
  uint64_t v3 = *v1;
  id v4 = (id)sub_259309B80();
  objc_msgSend(a1, sel_setBool_forKey_, v3, v4);
}

uint64_t static Double.read(from:key:)(void *a1, uint64_t a2, unint64_t a3)
{
  return sub_2592CF6CC(a1, a2, a3);
}

Swift::Void __swiftcall Double.write(to:key:)(NSUserDefaults to, Swift::String key)
{
  double v3 = v2;
  Class isa = to.super.isa;
  id v5 = (id)sub_259309B80();
  [(objc_class *)isa setDouble:v5 forKey:v3];
}

uint64_t sub_2592CE460@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_2592CF6CC(a1, a2, a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

void sub_2592CE490(void *a1)
{
  double v3 = *v1;
  id v4 = (id)sub_259309B80();
  objc_msgSend(a1, sel_setDouble_forKey_, v4, v3);
}

uint64_t static Float.read(from:key:)(void *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = sub_2592CFCBC(a1, a2, a3);
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

Swift::Void __swiftcall Float.write(to:key:)(NSUserDefaults to, Swift::String key)
{
  int v3 = v2;
  Class isa = to.super.isa;
  id v6 = (id)sub_259309B80();
  LODWORD(v5) = v3;
  [(objc_class *)isa setFloat:v6 forKey:v5];
}

unint64_t sub_2592CE59C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t result = sub_2592CFCBC(a1, a2, a3);
  *(_DWORD *)a4 = result;
  *(unsigned char *)(a4 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_2592CE5CC(void *a1)
{
  int v3 = *v1;
  id v5 = (id)sub_259309B80();
  LODWORD(v4) = v3;
  objc_msgSend(a1, sel_setFloat_forKey_, v5, v4);
}

uint64_t static Optional<A>.read(from:key:)@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  (*(void (**)(void))(a1 + 8))();
  uint64_t v3 = sub_25930A240();
  double v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 0, 1, v3);
}

uint64_t Optional<A>.write(to:key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v20, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) == 1) {
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, a4);
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v13, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 16))(a1, a2, a3, v15, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_2592CE8C0@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  return static Optional<A>.read(from:key:)(*(void *)(a1 - 8), a2);
}

uint64_t sub_2592CE8CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return Optional<A>.write(to:key:)(a1, a2, a3, a4, *(void *)(a5 - 8));
}

uint64_t static Array<A>.read(from:key:)(void *a1)
{
  int v2 = (void *)sub_259309B80();
  id v3 = objc_msgSend(a1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_25930A300();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_2592CF51C((uint64_t)v8, (uint64_t)v9);
  if (!v9[3])
  {
    sub_2592CF584((uint64_t)v9);
    return 0;
  }
  swift_getAssociatedTypeWitness();
  sub_259309E70();
  uint64_t v4 = swift_dynamicCast();
  if ((v4 & 1) == 0) {
    return 0;
  }
  v9[0] = v7;
  MEMORY[0x270FA5388](v4);
  swift_getWitnessTable();
  uint64_t v5 = sub_259309CC0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2592CEA84(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  double v3 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - v4, a1, v3);
  return sub_259309D70();
}

void Array<A>.write(to:key:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v14[7] = a4;
  v14[2] = a5;
  v14[3] = a6;
  v14[4] = a7;
  uint64_t v8 = sub_259309E70();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_259255A84((void (*)(char *, char *))sub_2592D02D8, (uint64_t)v14, v8, AssociatedTypeWitness, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v11);
  uint64_t v12 = (void *)sub_259309D80();
  swift_bridgeObjectRelease();
  int v13 = (void *)sub_259309B80();
  objc_msgSend(a1, sel_setObject_forKey_, v12, v13);
}

uint64_t sub_2592CECB8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = static Array<A>.read(from:key:)(a1);
  *a2 = result;
  return result;
}

void sub_2592CECEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  Array<A>.write(to:key:)(a1, a2, a3, *v5, *(void *)(a4 + 16), *(void *)(a5 - 8), *(void *)(a5 - 16));
}

uint64_t static DefaultsStorable<>.read(from:key:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  unint64_t v49 = a1;
  uint64_t v50 = a7;
  uint64_t v12 = sub_25930A240();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v46 = v12;
  MEMORY[0x270FA5388](v12);
  unint64_t v48 = (char *)&v43 - v13;
  uint64_t v47 = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v15 = sub_25930A240();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)&v43 - v17;
  MEMORY[0x270FA5388](v19);
  char v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v23 = MEMORY[0x270FA5388](v22);
  unint64_t v25 = (char *)&v43 - v24;
  unint64_t v26 = *(void (**)(unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, double))(a6 + 8);
  unint64_t v27 = v49;
  uint64_t v44 = a2;
  unint64_t v49 = a3;
  uint64_t v28 = a6;
  uint64_t v30 = v29;
  v26(v27, a2, a3, AssociatedTypeWitness, v28, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v18, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(v50, 1, 1, a4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v25, v18, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v21, v25, AssociatedTypeWitness);
    uint64_t v32 = v48;
    sub_259309D70();
    uint64_t v33 = *(void *)(a4 - 8);
    uint64_t v34 = v25;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v32, 1, a4) == 1)
    {
      uint64_t v47 = v30;
      (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v46);
      if (qword_26B2F3B60 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_259309860();
      __swift_project_value_buffer(v35, (uint64_t)qword_26B2F32A0);
      unint64_t v36 = v49;
      swift_bridgeObjectRetain_n();
      unint64_t v37 = sub_259309840();
      os_log_type_t v38 = sub_25930A1B0();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        unint64_t v48 = v34;
        uint64_t v41 = v40;
        *(_DWORD *)uint64_t v39 = 141558274;
        uint64_t v51 = 1752392040;
        uint64_t v52 = v40;
        sub_25930A2A0();
        *(_WORD *)(v39 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v51 = sub_25924FC14(v44, v36, &v52);
        sub_25930A2A0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25921A000, v37, v38, "Couldn't parse user default %{mask.hash}s.", (uint8_t *)v39, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25A2DBAF0](v41, -1, -1);
        MEMORY[0x25A2DBAF0](v39, -1, -1);

        (*(void (**)(char *, uint64_t))(v47 + 8))(v48, AssociatedTypeWitness);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v47 + 8))(v34, AssociatedTypeWitness);
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v50, 1, 1, a4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v30 + 8))(v25, AssociatedTypeWitness);
      uint64_t v42 = v50;
      (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v50, v32, a4);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v33 + 56))(v42, 0, 1, a4);
    }
  }
}

uint64_t DefaultsStorable<>.write(to:key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v16 - v13;
  sub_259309D60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 16))(a1, a2, a3, AssociatedTypeWitness, a7);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, AssociatedTypeWitness);
}

uint64_t sub_2592CF3D8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

uint64_t _sSb10PhotosFaceE4read4from3keySbSgSo14NSUserDefaultsC_SStFZ_0(void *a1)
{
  int v2 = (void *)sub_259309B80();
  id v3 = objc_msgSend(a1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_25930A300();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_2592CF51C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
    else {
      return 2;
    }
  }
  else
  {
    sub_2592CF584((uint64_t)v7);
    return 2;
  }
}

uint64_t sub_2592CF510(void *a1)
{
  return sub_2592CF5E4(a1);
}

uint64_t sub_2592CF51C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2F3D80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2592CF584(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2F3D80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2592CF5E4(void *a1)
{
  uint64_t v2 = (void *)sub_259309B80();
  id v3 = objc_msgSend(a1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_25930A300();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_2592CF51C((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_2592CF584((uint64_t)v7);
    return 0;
  }
}

uint64_t sub_2592CF6CC(void *a1, uint64_t a2, unint64_t a3)
{
  id v6 = (void *)sub_259309B80();
  id v7 = objc_msgSend(a1, sel_valueForKey_, v6);

  if (!v7) {
    goto LABEL_28;
  }
  sub_25930A300();
  swift_unknownObjectRelease();
  sub_2592D0334(&v37, v39);
  sub_2592510C0((uint64_t)v39, (uint64_t)&v37);
  if (swift_dynamicCast())
  {
    double v8 = v34;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
    return *(void *)&v8;
  }
  sub_2592510C0((uint64_t)v39, (uint64_t)&v37);
  uint64_t v9 = swift_dynamicCast();
  if (!v9)
  {
    sub_2592510C0((uint64_t)v39, (uint64_t)&v37);
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
      double v8 = *(float *)&v34;
      return *(void *)&v8;
    }
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_259309860();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B2F32A0);
    sub_2592510C0((uint64_t)v39, (uint64_t)&v37);
    sub_2592510C0((uint64_t)v39, (uint64_t)&v34);
    swift_bridgeObjectRetain_n();
    uint64_t v17 = sub_259309840();
    os_log_type_t v18 = sub_25930A1B0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v33 = v31;
      *(_DWORD *)uint64_t v19 = 136315650;
      swift_bridgeObjectRetain();
      sub_25924FC14(a2, a3, &v33);
      sub_25930A2A0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 12) = 2080;
      __swift_project_boxed_opaque_existential_1(&v37, v38);
      swift_getDynamicType();
      uint64_t v20 = sub_25930A9E0();
      uint64_t v32 = sub_25924FC14(v20, v21, &v33);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v37);
      *(_WORD *)(v19 + 22) = 2080;
      uint64_t v22 = __swift_project_boxed_opaque_existential_1(&v34, v36);
      double v23 = MEMORY[0x270FA5388](v22);
      (*(void (**)(char *, double))(v25 + 16))((char *)&v31 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
      uint64_t v26 = sub_259309BE0();
      uint64_t v32 = sub_25924FC14(v26, v27, &v33);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
      _os_log_impl(&dword_25921A000, v17, v18, "Couldn't parse Double at %s with type %s and value %s", (uint8_t *)v19, 0x20u);
      uint64_t v28 = v31;
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v28, -1, -1);
      MEMORY[0x25A2DBAF0](v19, -1, -1);

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
      double v8 = 0.0;
      return *(void *)&v8;
    }

    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v37);
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
LABEL_28:
    double v8 = 0.0;
    return *(void *)&v8;
  }
  double v34 = 0.0;
  MEMORY[0x270FA5388](v9);
  if ((v35 & 0x1000000000000000) != 0 || !(v35 & 0x2000000000000000 | v11 & 0x1000000000000000))
  {
    sub_25930A3D0();
    swift_bridgeObjectRelease();
    char v15 = v37;
  }
  else
  {
    MEMORY[0x270FA5388](v10);
    if ((v35 & 0x2000000000000000) != 0)
    {
      *(void *)&long long v37 = v12;
      *((void *)&v37 + 1) = v35 & 0xFFFFFFFFFFFFFFLL;
      char v15 = (v12 > 0x20u || ((0x100003E01uLL >> v12) & 1) == 0)
         && (uint64_t v29 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
         && *v29 == 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v12 & 0x1000000000000000) != 0)
      {
        uint64_t v13 = (v35 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v14 = v12 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v13 = sub_25930A480();
      }
      char v15 = sub_2592CF3D8(v13, v14, (void (*)(uint64_t *__return_ptr))sub_2592D0370);
      swift_bridgeObjectRelease();
    }
  }
  if (v15) {
    double v8 = v34;
  }
  else {
    double v8 = 0.0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
  return *(void *)&v8;
}

unint64_t sub_2592CFCBC(void *a1, uint64_t a2, unint64_t a3)
{
  id v6 = (void *)sub_259309B80();
  id v7 = objc_msgSend(a1, sel_valueForKey_, v6);

  if (!v7) {
    goto LABEL_28;
  }
  sub_25930A300();
  swift_unknownObjectRelease();
  sub_2592D0334(&v39, v41);
  sub_2592510C0((uint64_t)v41, (uint64_t)&v39);
  if (swift_dynamicCast())
  {
    float v8 = *(float *)&v36;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
    char v9 = 0;
    goto LABEL_29;
  }
  sub_2592510C0((uint64_t)v41, (uint64_t)&v39);
  uint64_t v10 = swift_dynamicCast();
  if (!v10)
  {
    sub_2592510C0((uint64_t)v41, (uint64_t)&v39);
    if (swift_dynamicCast())
    {
      float v17 = v36;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
      char v9 = 0;
      float v8 = v17;
      goto LABEL_29;
    }
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_259309860();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B2F32A0);
    sub_2592510C0((uint64_t)v41, (uint64_t)&v39);
    sub_2592510C0((uint64_t)v41, (uint64_t)&v36);
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_259309840();
    os_log_type_t v20 = sub_25930A1B0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v35 = v33;
      *(_DWORD *)uint64_t v21 = 136315650;
      swift_bridgeObjectRetain();
      sub_25924FC14(a2, a3, &v35);
      sub_25930A2A0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 12) = 2080;
      __swift_project_boxed_opaque_existential_1(&v39, v40);
      char v9 = 1;
      swift_getDynamicType();
      uint64_t v22 = sub_25930A9E0();
      uint64_t v34 = sub_25924FC14(v22, v23, &v35);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v39);
      *(_WORD *)(v21 + 22) = 2080;
      uint64_t v24 = __swift_project_boxed_opaque_existential_1(&v36, v38);
      double v25 = MEMORY[0x270FA5388](v24);
      (*(void (**)(char *, double))(v27 + 16))((char *)&v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), v25);
      uint64_t v28 = sub_259309BE0();
      uint64_t v34 = sub_25924FC14(v28, v29, &v35);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v36);
      _os_log_impl(&dword_25921A000, v19, v20, "Couldn't parse Float at %s with type %s and value %s", (uint8_t *)v21, 0x20u);
      uint64_t v30 = v33;
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v30, -1, -1);
      MEMORY[0x25A2DBAF0](v21, -1, -1);

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
      float v8 = 0.0;
      goto LABEL_29;
    }

    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v36);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v39);
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
LABEL_28:
    float v8 = 0.0;
    char v9 = 1;
    goto LABEL_29;
  }
  LODWORD(v36) = 0;
  MEMORY[0x270FA5388](v10);
  if ((v37 & 0x1000000000000000) != 0 || !(v37 & 0x2000000000000000 | v12 & 0x1000000000000000))
  {
    sub_25930A3D0();
    swift_bridgeObjectRelease();
    char v16 = v39;
  }
  else
  {
    MEMORY[0x270FA5388](v11);
    if ((v37 & 0x2000000000000000) != 0)
    {
      *(void *)&long long v39 = v13;
      *((void *)&v39 + 1) = v37 & 0xFFFFFFFFFFFFFFLL;
      char v16 = (v13 > 0x20u || ((0x100003E01uLL >> v13) & 1) == 0)
         && (uint64_t v31 = (unsigned char *)_swift_stdlib_strtof_clocale()) != 0
         && *v31 == 0;
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v13 & 0x1000000000000000) != 0)
      {
        uint64_t v14 = (v37 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v15 = v13 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v14 = sub_25930A480();
      }
      char v16 = sub_2592CF3D8(v14, v15, (void (*)(uint64_t *__return_ptr))sub_2592D0370);
      swift_bridgeObjectRelease();
    }
  }
  if (v16) {
    float v8 = *(float *)&v36;
  }
  else {
    float v8 = 0.0;
  }
  char v9 = v16 ^ 1;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
LABEL_29:
  LOBYTE(v41[0]) = v9 & 1;
  return LODWORD(v8) | ((unint64_t)(v9 & 1) << 32);
}

uint64_t sub_2592D02B8(uint64_t a1)
{
  return sub_2592CEA84(a1);
}

uint64_t sub_2592D02D8()
{
  return sub_259309D60();
}

uint64_t dispatch thunk of static DefaultsStorable.read(from:key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of DefaultsStorable.write(to:key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

_OWORD *sub_2592D0334(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unsigned char *sub_2592D0344@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_2592D03B4(a1, MEMORY[0x263F8EE98], a2);
}

void *sub_2592D0370@<X0>(unsigned char *a1@<X8>)
{
  return sub_2592D042C(a1);
}

unsigned char *sub_2592D0388@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_2592D03B4(a1, MEMORY[0x263F8EE90], a2);
}

unsigned char *sub_2592D03B4@<X0>(unsigned char *result@<X0>, uint64_t (*a2)(void)@<X1>, BOOL *a3@<X8>)
{
  unsigned int v4 = *result;
  BOOL v5 = v4 > 0x20;
  uint64_t v6 = (1 << v4) & 0x100003E01;
  BOOL v7 = v5 || v6 == 0;
  v8 = v7 && (uint64_t result = (unsigned char *)a2()) != 0 && *result == 0;
  *a3 = v8;
  return result;
}

void *sub_2592D042C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

ValueMetadata *type metadata accessor for TestProperty()
{
  return &type metadata for TestProperty;
}

void sub_2592D0480()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_259309B80();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2) {
    qword_26A37F240 = (uint64_t)v2;
  }
  else {
    __break(1u);
  }
}

uint64_t static TestProperties.debugSQL.getter()
{
  return sub_259264C04(0x4C51536775626544, 0xE800000000000000, 0);
}

uint64_t static TestProperties.requestTimeout.getter()
{
  return sub_259264E74(0xD000000000000015, 0x800000025930B4C0, 0x86AC351052600000);
}

uint64_t static TestProperties.timeoutCheckFrequency.getter()
{
  return sub_259264E74(0xD000000000000015, 0x800000025930E220, 0x94049F30F7200000);
}

uint64_t static TestProperties.albumRotationEpoch.getter()
{
  return sub_259264E74(0xD000000000000012, 0x800000025930E630, 0x28093E61EE400000);
}

uint64_t static TestProperties.watchFacePerDaySize.getter()
{
  return sub_2592650F0(0xD000000000000013, 0x800000025930E650, 16);
}

uint64_t static TestProperties.gallerySize.getter()
{
  return sub_2592650F0(0xD000000000000010, 0x800000025930E670, 1);
}

uint64_t static TestProperties.quicTimeout.getter()
{
  return sub_25926534C(0x656D695443495551, 0xEB0000000074756FLL, 0, 1);
}

uint64_t static TestProperties.fixedDay.getter()
{
  return sub_2592655F4(0x7961446465786946, 0xE800000000000000, 0, 1);
}

uint64_t static TestProperties.bufferSize.getter()
{
  return sub_2592650F0(0x6953726566667542, 0xEA0000000000657ALL, 4);
}

uint64_t static TestProperties.ignoreDuetCancellations.getter()
{
  return sub_259264C04(0xD000000000000017, 0x800000025930E690, 0);
}

uint64_t static TestProperties.ignoreSyncCache.getter()
{
  return sub_259264C04(0x795365726F6E6749, 0xEF6568636143636ELL, 0);
}

uint64_t static TestProperties.targetGalleryShuffleSize.getter()
{
  return sub_2592650F0(0xD000000000000018, 0x800000025930E6B0, 64);
}

ValueMetadata *type metadata accessor for TestProperties()
{
  return &type metadata for TestProperties;
}

uint64_t Collection<>.parallelForEach(parallelism:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  _OWORD v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_2592D0710, 0, 0);
}

uint64_t sub_2592D0710()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 64) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v1;
  swift_retain();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *(void *)uint64_t v4 = v0;
  *(void *)(v4 + 8) = sub_2592D082C;
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 16);
  *(_OWORD *)(v4 + 64) = *(_OWORD *)(v0 + 48);
  uint64_t v7 = MEMORY[0x263F8EE60] + 8;
  *(void *)(v4 + 48) = v5;
  *(void *)(v4 + 56) = v7;
  *(void *)(v4 + 32) = &unk_26A37F258;
  *(void *)(v4 + 40) = v3;
  *(void *)(v4 + 24) = v6;
  return MEMORY[0x270FA2498](sub_2592D0C4C, 0, 0);
}

uint64_t sub_2592D082C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2592D0988, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2592D0988()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592D09EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_25921D238;
  return v7(a2);
}

uint64_t sub_2592D0AC4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592D0AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(int **)(v2 + 32);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_2592438A0;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  uint64_t v7 = (void *)swift_task_alloc();
  _OWORD v6[2] = v7;
  void *v7 = v6;
  v7[1] = sub_25921D238;
  return v9(a2);
}

uint64_t Collection<>.parallelMap<A>(parallelism:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[8] = a6;
  v7[9] = v6;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = a2;
  v7[5] = a3;
  v7[3] = a1;
  return MEMORY[0x270FA2498](sub_2592D0C4C, 0, 0);
}

uint64_t sub_2592D0C4C()
{
  sub_25930A100();
  uint64_t v1 = sub_25930A270();
  uint64_t v3 = v2;
  *(void *)(v0 + 80) = v1;
  *(void *)(v0 + 88) = v2;
  uint64_t v4 = sub_25930A260();
  if (!v4) {
    return sub_25930A580();
  }
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v0 + 64);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v9 = *(void *)(v0 + 48);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v16 = *(void *)(v0 + 24);
  long long v15 = *(_OWORD *)(v0 + 32);
  uint64_t v10 = sub_25930A100();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v11 = swift_task_alloc();
  *(void *)(v0 + 96) = v11;
  *(void *)(v11 + 16) = v9;
  *(void *)(v11 + 24) = v8;
  *(void *)(v11 + 32) = v7;
  *(void *)(v11 + 40) = v6;
  *(_OWORD *)(v11 + 48) = v15;
  *(void *)(v11 + 64) = v16;
  *(void *)(v11 + 72) = v5;
  *(void *)(v11 + 80) = v10;
  *(void *)(v11 + 88) = v1;
  *(void *)(v11 + 96) = v3;
  uint64_t v12 = sub_259309E70();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_2592D0E60;
  return MEMORY[0x270FA22B8](v0 + 16, TupleTypeMetadata2, v12, 0, 0, &unk_26A37F270, v11, TupleTypeMetadata2);
}

uint64_t sub_2592D0E60()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2592D0FEC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2592D0F7C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592D0F7C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_25930A250();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2592D0FEC()
{
  swift_task_dealloc();
  sub_25930A250();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592D1070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[15] = v16;
  v8[16] = v17;
  v8[13] = v14;
  v8[14] = v15;
  v8[11] = a8;
  v8[12] = v13;
  v8[9] = a6;
  v8[10] = a7;
  v8[7] = a4;
  v8[8] = a5;
  v8[5] = a2;
  v8[6] = a3;
  void v8[4] = a1;
  v8[17] = swift_getTupleTypeMetadata2();
  uint64_t v9 = sub_25930A240();
  v8[18] = v9;
  v8[19] = *(void *)(v9 - 8);
  v8[20] = swift_task_alloc();
  uint64_t v10 = *(void *)(v16 - 8);
  v8[21] = v10;
  v8[22] = v10;
  v8[23] = swift_task_alloc();
  v8[24] = swift_task_alloc();
  v8[25] = *(void *)(v17 + 8);
  v8[26] = sub_25930A5D0();
  v8[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592D1220, 0, 0);
}

uint64_t sub_2592D1220()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[9];
  sub_25930A5C0();
  uint64_t v4 = swift_allocBox();
  v0[28] = v4;
  MEMORY[0x25A2DA540](v2, v1);
  uint64_t v5 = sub_25930A5A0();
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    if (v0[9])
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t v10 = v0[9];
        ++v9;
        sub_2592D1A00(v4, v0[5], v0[7], v0[8], v0[14], v0[15], v0[16]);
      }
      while (v9 != v10);
    }
    v0[29] = 0;
    uint64_t v11 = (void *)swift_task_alloc();
    v0[30] = (uint64_t)v11;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
    uint64_t v8 = sub_259309F70();
    void *v11 = v0;
    v11[1] = sub_2592D139C;
    uint64_t v5 = v0[20];
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  return MEMORY[0x270FA2048](v5, v6, v7, v8);
}

uint64_t sub_2592D139C()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592D1860;
  }
  else {
    uint64_t v2 = sub_2592D14B0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592D14B0()
{
  uint64_t v1 = (char *)v0[20];
  uint64_t v2 = v0[17];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) != 1)
  {
    uint64_t v9 = v0[23];
    uint64_t v8 = v0[24];
    uint64_t v10 = v0[22];
    uint64_t v20 = v0[21];
    uint64_t v21 = v0[29];
    uint64_t v11 = v0[15];
    uint64_t v12 = v0[10];
    uint64_t v13 = *(void *)v1;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v8, &v1[*(int *)(v2 + 48)], v11);
    uint64_t v14 = v12 + *(void *)(v10 + 72) * v13;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v8, v11);
    uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v14, v9, v11);
    if (!__OFADD__(v21, 1))
    {
      if ((sub_259309F40() & 1) == 0) {
        sub_2592D1A00(v0[28], v0[5], v0[7], v0[8], v0[14], v0[15], v0[16]);
      }
      (*(void (**)(void, void))(v0[22] + 8))(v0[24], v0[15]);
      v0[29] = v21 + 1;
      uint64_t v15 = (void *)swift_task_alloc();
      v0[30] = v15;
      __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
      uint64_t v6 = sub_259309F70();
      void *v15 = v0;
      v15[1] = sub_2592D139C;
      uint64_t v3 = v0[20];
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      return MEMORY[0x270FA2048](v3, v4, v5, v6);
    }
    __break(1u);
LABEL_16:
    __break(1u);
    return MEMORY[0x270FA2048](v3, v4, v5, v6);
  }
  (*(void (**)(char *, void))(v0[19] + 8))(v1, v0[18]);
  uint64_t v3 = sub_259309F40();
  if ((v3 & 1) == 0)
  {
    uint64_t v16 = v0[13];
    if (v0[11] == v16)
    {
      uint64_t v17 = (uint64_t *)v0[4];
      v0[2] = v0[12];
      v0[3] = v16;
      sub_25930A280();
      swift_getWitnessTable();
      uint64_t v18 = sub_259309E80();
      swift_release();
      uint64_t *v17 = v18;
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v7 = (uint64_t (*)(void))v0[1];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  sub_25930A230();
  sub_259309ED0();
  sub_2592D3A94();
  swift_allocError();
  sub_259309A70();
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
LABEL_12:
  return v7();
}

uint64_t sub_2592D1860()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592D18F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[5];
  uint64_t v6 = v2[6];
  uint64_t v7 = v2[7];
  uint64_t v8 = v2[8];
  uint64_t v9 = v2[9];
  uint64_t v10 = v2[10];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_2592438A0;
  return sub_2592D1070(a1, a2, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2592D1A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v42 = a4;
  uint64_t v43 = a6;
  uint64_t v40 = a3;
  uint64_t v45 = a2;
  uint64_t v46 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v44 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = a7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v37 = sub_25930A240();
  uint64_t v13 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v15 = (uint64_t *)((char *)&v37 - v14);
  uint64_t v16 = swift_getTupleTypeMetadata2();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v37 - v17);
  uint64_t v38 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v19 = *(void *)(v38 + 64);
  MEMORY[0x270FA5388](v20);
  uint64_t v21 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v47 = (char *)&v37 - v23;
  uint64_t v39 = a5;
  sub_25930A5C0();
  swift_projectBox();
  swift_beginAccess();
  sub_25930A5B0();
  swift_endAccess();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v15, 1, TupleTypeMetadata2) == 1)return (*(uint64_t (**)(uint64_t *, uint64_t))(v13 + 8))(v15, v37); {
  double v25 = (char *)v15 + *(int *)(TupleTypeMetadata2 + 48);
  }
  uint64_t v26 = (char *)v18 + *(int *)(v16 + 48);
  *uint64_t v18 = *v15;
  uint64_t v27 = v38;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
  v28(v26, v25, AssociatedTypeWitness);
  uint64_t v46 = *v18;
  unint64_t v29 = v47;
  v28(v47, (char *)v18 + *(int *)(v16 + 48), AssociatedTypeWitness);
  uint64_t v30 = sub_259309F20();
  uint64_t v31 = (uint64_t)v44;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v44, 1, 1, v30);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v21, v29, AssociatedTypeWitness);
  unint64_t v32 = (*(unsigned __int8 *)(v27 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v33 = (v19 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v34 = (char *)swift_allocObject();
  *((void *)v34 + 2) = 0;
  *((void *)v34 + 3) = 0;
  uint64_t v35 = v43;
  *((void *)v34 + 4) = v39;
  *((void *)v34 + 5) = v35;
  uint64_t v36 = v40;
  *((void *)v34 + 6) = v41;
  *((void *)v34 + 7) = v36;
  *((void *)v34 + 8) = v42;
  v28(&v34[v32], v21, AssociatedTypeWitness);
  *(void *)&v34[v33] = v46;
  swift_retain();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  sub_259309F70();
  sub_2592D21E8(v31, (uint64_t)&unk_26A37F2C8, (uint64_t)v34);
  sub_2592A8740(v31);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v47, AssociatedTypeWitness);
}

uint64_t sub_2592D1EC0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a7;
  v7[4] = v15;
  v7[2] = a1;
  v7[5] = *(void *)(v15 - 8);
  uint64_t v10 = swift_task_alloc();
  v7[6] = v10;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v11 = (void *)swift_task_alloc();
  v7[7] = v11;
  void *v11 = v7;
  v11[1] = sub_2592D2014;
  return v13(v10, a6);
}

uint64_t sub_2592D2014()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_259283534;
  }
  else {
    uint64_t v2 = sub_2592D2128;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592D2128()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = (void *)v0[2];
  uint64_t v6 = (char *)v5 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  *uint64_t v5 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v6, v1, v3);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_2592D21E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2592D561C(a1, (uint64_t)v9);
  uint64_t v10 = sub_259309F20();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_2592A8740((uint64_t)v9);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_259309E90();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_259309F10();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = *v4;
  uint64_t v16 = (void *)(v14 | v12);
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    uint64_t v16 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  v18[1] = 1;
  v18[2] = v16;
  v18[3] = v15;
  swift_task_create();
  return swift_release();
}

uint64_t Collection<>.parallelCompactMap<A>(parallelism:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[4] = a5;
  v7[5] = a6;
  v7[3] = a4;
  uint64_t v13 = (void *)swift_task_alloc();
  v7[6] = v13;
  uint64_t v14 = sub_25930A240();
  v7[7] = v14;
  *uint64_t v13 = v7;
  v13[1] = sub_2592D24BC;
  v13[8] = a6;
  v13[9] = v6;
  v13[6] = a4;
  v13[7] = v14;
  v13[4] = a2;
  v13[5] = a3;
  v13[3] = a1;
  return MEMORY[0x270FA2498](sub_2592D0C4C, 0, 0);
}

uint64_t sub_2592D24BC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    return MEMORY[0x270FA2498](sub_2592D260C, 0, 0);
  }
}

uint64_t sub_2592D260C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  *(void *)(v0 + 16) = *(void *)(v0 + 72);
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  sub_259309E70();
  swift_getWitnessTable();
  uint64_t v4 = sub_259309CC0();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v5(v4);
}

uint64_t sub_2592D2718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25930A240();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t Collection<>.parallelFilter(parallelism:predicate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  _OWORD v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_2592D27B4, 0, 0);
}

uint64_t sub_2592D27B4()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = (void *)swift_allocObject();
  v0[8] = v5;
  _OWORD v5[2] = v1;
  v5[3] = v2;
  v5[4] = v4;
  v5[5] = v3;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[9] = v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *uint64_t v6 = v0;
  v6[1] = sub_2592D28D4;
  uint64_t v8 = v0[6];
  uint64_t v9 = v0[5];
  uint64_t v10 = v0[2];
  return Collection<>.parallelCompactMap<A>(parallelism:transform:)(v10, (uint64_t)&unk_26A37F290, (uint64_t)v5, v9, AssociatedTypeWitness, v8);
}

uint64_t sub_2592D28D4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2592D0988, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_2592D2A2C(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  _OWORD v6[2] = a1;
  v6[3] = a2;
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  v6[6] = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_2592D2B0C;
  return v10(a2);
}

uint64_t sub_2592D2B0C(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(unsigned char *)(v4 + 56) = a1 & 1;
    return MEMORY[0x270FA2498](sub_2592D2C5C, 0, 0);
  }
}

uint64_t sub_2592D2C5C()
{
  int v1 = *(unsigned __int8 *)(v0 + 56);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  if (v1 == 1)
  {
    (*(void (**)(void, void, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(*(void *)(v0 + 16), *(void *)(v0 + 24), AssociatedTypeWitness);
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v3 + 56))(*(void *)(v0 + 16), v4, 1, AssociatedTypeWitness);
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2592D2D60(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = (int *)v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_2592438A0;
  return sub_2592D2A2C(a1, a2, v9, v8, v6, v7);
}

uint64_t Sequence.asyncCompactMap<A>(predicate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  uint64_t v9 = sub_25930A240();
  v6[9] = v9;
  v6[10] = *(void *)(v9 - 8);
  v6[11] = swift_task_alloc();
  v6[12] = *(void *)(a4 - 8);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[15] = AssociatedTypeWitness;
  v6[16] = *(void *)(AssociatedTypeWitness - 8);
  v6[17] = swift_task_alloc();
  sub_25930A240();
  v6[18] = swift_task_alloc();
  v6[19] = *(void *)(a3 - 8);
  v6[20] = swift_task_alloc();
  uint64_t v11 = swift_getAssociatedTypeWitness();
  v6[21] = v11;
  v6[22] = *(void *)(v11 - 8);
  v6[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592D30DC, 0, 0);
}

uint64_t sub_2592D30DC()
{
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  v0[2] = sub_259309A60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_259309CB0();
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[16];
  swift_getAssociatedConformanceWitness();
  sub_25930A290();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[21]);
    uint64_t v8 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
    return v9(v8);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[16] + 32))(v0[17], v0[18], v0[15]);
    if (sub_259309F40())
    {
      swift_bridgeObjectRelease();
      sub_259309ED0();
      sub_2592D3A94();
      swift_allocError();
      sub_259309A70();
      swift_willThrow();
      uint64_t v12 = v0[22];
      uint64_t v11 = v0[23];
      uint64_t v13 = v0[21];
      (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v14 = (uint64_t (*)(void))v0[1];
      return v14();
    }
    else
    {
      uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))(v0[3] + *(int *)v0[3]);
      uint64_t v15 = (void *)swift_task_alloc();
      v0[24] = v15;
      void *v15 = v0;
      v15[1] = sub_2592D3450;
      uint64_t v16 = v0[17];
      uint64_t v17 = v0[11];
      return v18(v17, v16);
    }
  }
}

uint64_t sub_2592D3450()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2592D3994;
  }
  else
  {
    uint64_t v2 = sub_2592D356C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592D356C()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[6];
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3);
  uint64_t v6 = v0[16];
  uint64_t v5 = v0[17];
  uint64_t v7 = v0[15];
  if (v4 == 1)
  {
    uint64_t v9 = v0[9];
    uint64_t v8 = v0[10];
    (*(void (**)(void, void))(v6 + 8))(v0[17], v0[15]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v9);
  }
  else
  {
    uint64_t v11 = v0[13];
    uint64_t v10 = v0[14];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v10, v1, v3);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v11, v10, v3);
    sub_259309E70();
    sub_259309E40();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v10, v3);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  uint64_t v12 = v0[18];
  uint64_t v13 = v0[15];
  uint64_t v14 = v0[16];
  swift_getAssociatedConformanceWitness();
  sub_25930A290();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[21]);
    uint64_t v15 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(uint64_t))v0[1];
    return v16(v15);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[16] + 32))(v0[17], v0[18], v0[15]);
    if (sub_259309F40())
    {
      swift_bridgeObjectRelease();
      sub_259309ED0();
      sub_2592D3A94();
      swift_allocError();
      sub_259309A70();
      swift_willThrow();
      uint64_t v19 = v0[22];
      uint64_t v18 = v0[23];
      uint64_t v20 = v0[21];
      (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v21 = (uint64_t (*)(void))v0[1];
      return v21();
    }
    else
    {
      double v25 = (uint64_t (*)(uint64_t, uint64_t))(v0[3] + *(int *)v0[3]);
      uint64_t v22 = (void *)swift_task_alloc();
      v0[24] = v22;
      *uint64_t v22 = v0;
      v22[1] = sub_2592D3450;
      uint64_t v23 = v0[17];
      uint64_t v24 = v0[11];
      return v25(v24, v23);
    }
  }
}

uint64_t sub_2592D3994()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

unint64_t sub_2592D3A94()
{
  unint64_t result = qword_26A37F2A0;
  if (!qword_26A37F2A0)
  {
    sub_259309ED0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37F2A0);
  }
  return result;
}

uint64_t Sequence.asyncMap<A>(predicate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v6[9] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[10] = AssociatedTypeWitness;
  v6[11] = *(void *)(AssociatedTypeWitness - 8);
  v6[12] = swift_task_alloc();
  sub_25930A240();
  v6[13] = swift_task_alloc();
  v6[14] = *(void *)(a3 - 8);
  v6[15] = swift_task_alloc();
  uint64_t v9 = swift_getAssociatedTypeWitness();
  v6[16] = v9;
  v6[17] = *(void *)(v9 - 8);
  v6[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592D3D00, 0, 0);
}

uint64_t sub_2592D3D00()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  v0[2] = sub_259309A60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_259309CB0();
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[11];
  swift_getAssociatedConformanceWitness();
  sub_25930A290();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v8 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
    return v9(v8);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[13], v0[10]);
    if (sub_259309F40())
    {
      swift_bridgeObjectRelease();
      sub_259309ED0();
      sub_2592D3A94();
      swift_allocError();
      sub_259309A70();
      swift_willThrow();
      uint64_t v12 = v0[17];
      uint64_t v11 = v0[18];
      uint64_t v13 = v0[16];
      (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v14 = (uint64_t (*)(void))v0[1];
      return v14();
    }
    else
    {
      uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t))(v0[3] + *(int *)v0[3]);
      uint64_t v15 = (void *)swift_task_alloc();
      v0[19] = v15;
      void *v15 = v0;
      v15[1] = sub_2592D4048;
      uint64_t v16 = v0[12];
      uint64_t v17 = v0[9];
      return v18(v17, v16);
    }
  }
}

uint64_t sub_2592D4048()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2592D449C;
  }
  else
  {
    uint64_t v2 = sub_2592D4164;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592D4164()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  sub_259309E70();
  sub_259309E40();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  swift_getAssociatedConformanceWitness();
  sub_25930A290();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v7 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
    return v8(v7);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[13], v0[10]);
    if (sub_259309F40())
    {
      swift_bridgeObjectRelease();
      sub_259309ED0();
      sub_2592D3A94();
      swift_allocError();
      sub_259309A70();
      swift_willThrow();
      uint64_t v11 = v0[17];
      uint64_t v10 = v0[18];
      uint64_t v12 = v0[16];
      (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v13 = (uint64_t (*)(void))v0[1];
      return v13();
    }
    else
    {
      uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t))(v0[3] + *(int *)v0[3]);
      uint64_t v14 = (void *)swift_task_alloc();
      v0[19] = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_2592D4048;
      uint64_t v15 = v0[12];
      uint64_t v16 = v0[9];
      return v17(v16, v15);
    }
  }
}

uint64_t sub_2592D449C()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t Set.asyncFilter(predicate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  v5[8] = a1;
  v5[13] = *(void *)(a4 - 8);
  v5[14] = swift_task_alloc();
  v5[15] = swift_task_alloc();
  v5[16] = swift_task_alloc();
  sub_25930A240();
  v5[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592D4688, 0, 0);
}

uint64_t sub_2592D4688()
{
  uint64_t v1 = v0[10];
  v0[7] = sub_259309A80();
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_25930A360();
    uint64_t result = sub_25930A060();
    uint64_t v1 = v0[2];
    uint64_t v3 = v0[3];
    uint64_t v5 = v0[4];
    uint64_t v4 = v0[5];
    unint64_t v6 = v0[6];
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v0[10] + 32);
    uint64_t v8 = v0[10];
    uint64_t v10 = *(void *)(v8 + 56);
    uint64_t v3 = v8 + 56;
    uint64_t v9 = v10;
    uint64_t v5 = ~v7;
    uint64_t v11 = -v7;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v6 = v12 & v9;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  v0[18] = v1;
  v0[19] = v3;
  uint64_t v13 = v0[13];
  v0[21] = v4;
  v0[22] = v6;
  v0[20] = v5;
  if (v1 < 0)
  {
    if (sub_25930A370())
    {
      sub_25930A7A0();
      swift_unknownObjectRelease();
      goto LABEL_13;
    }
    uint64_t v13 = v0[13];
  }
  else
  {
    if (v6)
    {
      unint64_t v14 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v15 = v14 | (v4 << 6);
LABEL_10:
      (*(void (**)(void, unint64_t, void))(v13 + 16))(v0[17], *(void *)(v1 + 48) + *(void *)(v13 + 72) * v15, v0[11]);
LABEL_13:
      v0[23] = v4;
      v0[24] = v6;
      uint64_t v16 = v0[16];
      uint64_t v17 = v0[17];
      uint64_t v18 = v0[13];
      uint64_t v19 = v0[11];
      uint64_t v20 = (int *)v0[8];
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v17, 0, 1, v19);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v16, v17, v19);
      uint64_t v30 = (uint64_t (*)(uint64_t))((char *)v20 + *v20);
      uint64_t v21 = (void *)swift_task_alloc();
      v0[25] = v21;
      *uint64_t v21 = v0;
      v21[1] = sub_2592D4A34;
      uint64_t v22 = v0[16];
      return v30(v22);
    }
    int64_t v23 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      return result;
    }
    int64_t v24 = (unint64_t)(v5 + 64) >> 6;
    if (v23 < v24)
    {
      unint64_t v25 = *(void *)(v3 + 8 * v23);
      uint64_t v26 = v4 + 1;
      if (v25)
      {
LABEL_19:
        unint64_t v6 = (v25 - 1) & v25;
        unint64_t v15 = __clz(__rbit64(v25)) + (v26 << 6);
        uint64_t v4 = v26;
        goto LABEL_10;
      }
      uint64_t v26 = v4 + 2;
      if (v4 + 2 < v24)
      {
        unint64_t v25 = *(void *)(v3 + 8 * v26);
        if (v25) {
          goto LABEL_19;
        }
        uint64_t v26 = v4 + 3;
        if (v4 + 3 < v24)
        {
          unint64_t v25 = *(void *)(v3 + 8 * v26);
          if (v25) {
            goto LABEL_19;
          }
          uint64_t v27 = v4 + 4;
          while (v24 != v27)
          {
            unint64_t v25 = *(void *)(v3 + 8 * v27++);
            if (v25)
            {
              uint64_t v26 = v27 - 1;
              goto LABEL_19;
            }
          }
        }
      }
    }
  }
  (*(void (**)(void, uint64_t, uint64_t, void))(v13 + 56))(v0[17], 1, 1, v0[11]);
  sub_259261990();
  uint64_t v28 = v0[7];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v29 = (uint64_t (*)(uint64_t))v0[1];
  return v29(v28);
}

uint64_t sub_2592D4A34(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 208) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_2592D4F2C;
  }
  else
  {
    *(unsigned char *)(v4 + 216) = a1 & 1;
    uint64_t v5 = sub_2592D4B68;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2592D4B68()
{
  uint64_t v1 = *(void *)(v0 + 128);
  if (*(unsigned char *)(v0 + 216))
  {
    uint64_t v2 = *(void *)(v0 + 120);
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v4 = *(void *)(v0 + 88);
    (*(void (**)(void, void, uint64_t))(v3 + 16))(*(void *)(v0 + 112), *(void *)(v0 + 128), v4);
    sub_25930A070();
    sub_25930A030();
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    v5(v2, v4);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v5)(v1, v4);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void, void))(*(void *)(v0 + 104) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 88));
  }
  uint64_t v7 = *(void *)(v0 + 184);
  unint64_t v8 = *(void *)(v0 + 192);
  *(void *)(v0 + 168) = v7;
  *(void *)(v0 + 176) = v8;
  uint64_t v9 = *(void *)(v0 + 144);
  if (v9 < 0)
  {
    if (sub_25930A370())
    {
      sub_25930A7A0();
      swift_unknownObjectRelease();
      goto LABEL_10;
    }
  }
  else
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v7 << 6);
LABEL_7:
      (*(void (**)(void, unint64_t, void))(*(void *)(v0 + 104) + 16))(*(void *)(v0 + 136), *(void *)(v9 + 48) + *(void *)(*(void *)(v0 + 104) + 72) * v11, *(void *)(v0 + 88));
LABEL_10:
      *(void *)(v0 + 184) = v7;
      *(void *)(v0 + 192) = v8;
      uint64_t v12 = *(void *)(v0 + 128);
      uint64_t v13 = *(void *)(v0 + 136);
      uint64_t v14 = *(void *)(v0 + 104);
      uint64_t v15 = *(void *)(v0 + 88);
      uint64_t v16 = *(int **)(v0 + 64);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v13, 0, 1, v15);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v12, v13, v15);
      uint64_t v27 = (uint64_t (*)(uint64_t))((char *)v16 + *v16);
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 200) = v17;
      void *v17 = v0;
      v17[1] = sub_2592D4A34;
      uint64_t v18 = *(void *)(v0 + 128);
      return v27(v18);
    }
    int64_t v19 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      return result;
    }
    int64_t v20 = (unint64_t)(*(void *)(v0 + 160) + 64) >> 6;
    if (v19 < v20)
    {
      uint64_t v21 = *(void *)(v0 + 152);
      unint64_t v22 = *(void *)(v21 + 8 * v19);
      uint64_t v23 = v7 + 1;
      if (v22)
      {
LABEL_16:
        unint64_t v8 = (v22 - 1) & v22;
        unint64_t v11 = __clz(__rbit64(v22)) + (v23 << 6);
        uint64_t v7 = v23;
        goto LABEL_7;
      }
      uint64_t v23 = v7 + 2;
      if (v7 + 2 < v20)
      {
        unint64_t v22 = *(void *)(v21 + 8 * v23);
        if (v22) {
          goto LABEL_16;
        }
        uint64_t v23 = v7 + 3;
        if (v7 + 3 < v20)
        {
          unint64_t v22 = *(void *)(v21 + 8 * v23);
          if (v22) {
            goto LABEL_16;
          }
          uint64_t v24 = v7 + 4;
          while (v20 != v24)
          {
            unint64_t v22 = *(void *)(v21 + 8 * v24++);
            if (v22)
            {
              uint64_t v23 = v24 - 1;
              goto LABEL_16;
            }
          }
        }
      }
    }
  }
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 104) + 56))(*(void *)(v0 + 136), 1, 1, *(void *)(v0 + 88));
  sub_259261990();
  uint64_t v25 = *(void *)(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v26(v25);
}

uint64_t sub_2592D4F2C()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[16], v0[11]);
  sub_259261990();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t Dictionary.fetch(key:asyncDefault:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  void v8[4] = a3;
  v8[5] = a4;
  _OWORD v8[2] = a1;
  v8[3] = a2;
  uint64_t v9 = sub_25930A240();
  v8[10] = v9;
  v8[11] = *(void *)(v9 - 8);
  v8[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592D50DC, 0, 0);
}

uint64_t sub_2592D50DC()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[8];
  MEMORY[0x25A2DA360](v0[3], v0[6], v0[7], v2, v0[9]);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = (int *)v0[4];
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    uint64_t v9 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[13] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_2592D52A0;
    uint64_t v6 = v0[2];
    return v9(v6);
  }
  else
  {
    (*(void (**)(void, void, void))(v3 + 32))(v0[2], v0[12], v0[8]);
    swift_task_dealloc();
    unint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_2592D52A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2592D53B0()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  return swift_deallocObject();
}

uint64_t sub_2592D54AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (int *)v1[7];
  uint64_t v8 = v1[8];
  uint64_t v9 = (uint64_t)v1 + v4;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_25921D238;
  return sub_2592D1EC0(a1, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2592D561C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Sequence.sorted<A>(_:)()
{
  return sub_259309D10();
}

uint64_t sub_2592D56D0(uint64_t a1, uint64_t a2)
{
  return sub_2592D572C(a1, a2) & 1;
}

uint64_t Sequence.min<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2592D5794(a1, a2, a3, a4, a5, a6, (uint64_t)sub_2592D56D0, MEMORY[0x263F8D3C8]);
}

uint64_t sub_2592D572C(uint64_t a1, uint64_t a2)
{
  return sub_2592D57D0(a1, a2, *(void (**)(uint64_t))(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 16), *(void *)(v2 + 24)) & 1;
}

uint64_t Sequence.max<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2592D5794(a1, a2, a3, a4, a5, a6, (uint64_t)sub_2592D56D0, MEMORY[0x263F8D3C0]);
}

uint64_t sub_2592D5794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, void *, uint64_t, uint64_t))
{
  v9[2] = a3;
  v9[3] = a4;
  void v9[4] = a5;
  v9[5] = a6;
  v9[6] = a1;
  v9[7] = a2;
  return a8(a7, v9, a3, a5);
}

uint64_t sub_2592D57D0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v21 - v16;
  v18(v15);
  if (!v6)
  {
    a3(a2);
    a4 = sub_259309B40();
    int64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    v20(v13, a6);
    v20(v17, a6);
  }
  return a4 & 1;
}

double Duration.timeInterval.getter()
{
  double v0 = (double)sub_25930A960();
  sub_25930A960();
  return (double)v1 / 1.0e18 + v0;
}

uint64_t static Duration.hours<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2592D59D0(a1, a2, a3, (uint64_t (*)(char *, uint64_t, uint64_t))static Duration.minutes<A>(_:));
}

uint64_t static Duration.minutes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2592D59D0(a1, a2, a3, MEMORY[0x263F8ED40]);
}

uint64_t sub_2592D59D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, uint64_t, uint64_t))
{
  uint64_t v17 = a1;
  uint64_t v18 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v17 - v12;
  swift_getAssociatedConformanceWitness();
  sub_25930A810();
  sub_25930A7B0();
  sub_25930A080();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, a2);
  uint64_t v15 = v18(v13, a2, a3);
  v14(v13, a2);
  return v15;
}

uint64_t sub_2592D5BD8(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26B2F32A0);
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26B2F3B60, (uint64_t)qword_26B2F32A0, a1);
}

uint64_t sub_2592D5C1C(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26B2F3B68);
}

uint64_t static Log.network.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26B2F3B80, (uint64_t)qword_26B2F3B68, a1);
}

uint64_t sub_2592D5C60(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26B2F3BA8);
}

uint64_t static Log.database.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26B2F3BC0, (uint64_t)qword_26B2F3BA8, a1);
}

uint64_t sub_2592D5CA4(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26A37F2D0);
}

uint64_t static Log.photos.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26A37C7A8, (uint64_t)qword_26A37F2D0, a1);
}

uint64_t sub_2592D5CE4(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26A37F2E8);
}

uint64_t static Log.album.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26A37C7B0, (uint64_t)qword_26A37F2E8, a1);
}

uint64_t sub_2592D5D24(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26A37F300);
}

uint64_t static Log.gallery.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26A37C7B8, (uint64_t)qword_26A37F300, a1);
}

uint64_t sub_2592D5D68(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26A37F318);
}

uint64_t static Log.shuffle.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26A37C7C0, (uint64_t)qword_26A37F318, a1);
}

uint64_t sub_2592D5DAC(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26A37F330);
}

uint64_t static Log.cache.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26A37C7C8, (uint64_t)qword_26A37F330, a1);
}

uint64_t sub_2592D5DEC(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26A37F348);
}

uint64_t static Log.request.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26A37C7D0, (uint64_t)qword_26A37F348, a1);
}

uint64_t sub_2592D5E30(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26A37F360);
}

uint64_t static Log.testing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26A37C7D8, (uint64_t)qword_26A37F360, a1);
}

uint64_t sub_2592D5E74(uint64_t a1)
{
  return sub_2592D5E94(a1, qword_26B2F3B88);
}

uint64_t sub_2592D5E94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_259309860();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_259309850();
}

uint64_t static Log.session.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2592D5F30(&qword_26B2F3BA0, (uint64_t)qword_26B2F3B88, a1);
}

uint64_t sub_2592D5F30@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_259309860();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

id sub_2592D5FD8(void *a1)
{
  return objc_msgSend(a1, sel_count);
}

uint64_t sub_2592D5FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E068](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t sub_2592D5FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E078](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t sub_2592D6000(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E060](a1, a2, WitnessTable, v5);
}

void *sub_2592D6070(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2592D64F4(a1, a2, a3, MEMORY[0x263F8D7A8]);
}

uint64_t sub_2592D6088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_2592D610C()
{
  swift_getWitnessTable();
  return sub_25930A090();
}

uint64_t sub_2592D6190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

void sub_2592D6204(void *a1@<X8>)
{
  *a1 = 0;
}

id sub_2592D620C@<X0>(void *a1@<X8>)
{
  id result = sub_2592D5FD8(*v1);
  *a1 = result;
  return result;
}

void (*sub_2592D6238(void *a1, uint64_t *a2))(void *a1)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  uint64_t v6 = sub_2592D62F8(v5, *a2, *v2);
  v5[4] = v7;
  v5[5] = v6;
  return sub_2592D62B0;
}

void sub_2592D62B0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 40))(*a1);
  free(v1);
}

uint64_t (*sub_2592D62F8(void *a1, uint64_t a2, id a3))()
{
  *a1 = objc_msgSend(a3, sel_objectAtIndexedSubscript_, a2);
  return sub_2592D6358;
}

uint64_t sub_2592D6358()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_2592D6364(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

void sub_2592D63D8(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_2592D63E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592D6964(a1, a2, a3, a4, MEMORY[0x263F8D870], MEMORY[0x263F8D170]);
}

uint64_t sub_2592D6428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2592D6964(a1, a2, a3, a4, MEMORY[0x263F8D1A0], MEMORY[0x263F8D180]);
}

uint64_t sub_2592D646C(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E058](a1, a2, WitnessTable, v5);
}

void *sub_2592D64DC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2592D64F4(a1, a2, a3, MEMORY[0x263F8D7A0]);
}

void *sub_2592D64F4(void *a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, void *, uint64_t, uint64_t, void))
{
  uint64_t WitnessTable = swift_getWitnessTable();
  id result = a4(&v9, a1, a2, WitnessTable, MEMORY[0x263F8D708]);
  *a1 = v9;
  return result;
}

void sub_2592D656C(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_2592D6578(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_2592D65CC()
{
  return 2;
}

uint64_t sub_2592D65D4()
{
  swift_getWitnessTable();
  uint64_t v1 = sub_2592D6DE0();

  return v1;
}

uint64_t sub_2592D6634()
{
  return sub_259309CF0();
}

id PHFetchResult<>.collection.getter@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  return v1;
}

uint64_t sub_2592D6664()
{
  return sub_2592D66B4(&qword_26A37F378, &qword_26A37F380);
}

uint64_t sub_2592D668C()
{
  return sub_2592D66B4(&qword_26A37F388, qword_26A37F390);
}

uint64_t sub_2592D66B4(unint64_t *a1, uint64_t *a2)
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

uint64_t type metadata accessor for FetchResultCollection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2592D671C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D6738()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D6754()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t sub_2592D6760()
{
  return sub_2592D68B4();
}

unint64_t sub_2592D6778()
{
  unint64_t result = qword_26A37F418;
  if (!qword_26A37F418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37F418);
  }
  return result;
}

uint64_t sub_2592D67CC()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D67E8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D6804()
{
  return sub_2592D68B4();
}

uint64_t sub_2592D681C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D6880()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D689C()
{
  return sub_2592D68B4();
}

uint64_t sub_2592D68B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D6900()
{
  return swift_getWitnessTable();
}

uint64_t sub_2592D6964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v23 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v22 - v13;
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v22 - v17;
  char v19 = sub_259309B50();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v20 = v23(v18, &v14[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_2592D6BD4(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_25930A180();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v17 - v10;
  v17[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = sub_259309B50();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a1, v5);
  v12(v8, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v8, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    goto LABEL_5;
  }
  char v13 = sub_259309B50();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v8, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v11, v5);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t static Platform.internalInstall.getter()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t static Platform.current.getter()
{
  return 0;
}

PhotosFace::Platform_optional __swiftcall Platform.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    v1.value = PhotosFace_Platform_watch;
  }
  else {
    v1.value = PhotosFace_Platform_unknownDefault;
  }
  if (rawValue) {
    return v1;
  }
  else {
    return 0;
  }
}

void *static Platform.allCases.getter()
{
  return &unk_2707286B8;
}

uint64_t Platform.rawValue.getter(char a1)
{
  return a1 & 1;
}

BOOL sub_2592D6E48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_2592D6E64()
{
  unint64_t result = qword_26A37F420;
  if (!qword_26A37F420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37F420);
  }
  return result;
}

void *sub_2592D6EB8@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_2592D6ED8(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_2592D6EE8()
{
  unint64_t result = qword_26A37F428;
  if (!qword_26A37F428)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A37F430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37F428);
  }
  return result;
}

void sub_2592D6F44(void *a1@<X8>)
{
  *a1 = &unk_2707286E0;
}

unsigned char *storeEnumTagSinglePayload for Platform(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2592D7020);
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

ValueMetadata *type metadata accessor for Platform()
{
  return &type metadata for Platform;
}

uint64_t CheckedContinuation.resume<>(success:error:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v35 = a2;
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v34 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v32 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v33 = (char *)&v29 - v7;
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v30 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v31 = (char *)&v29 - v14;
  uint64_t v15 = sub_25930A240();
  uint64_t v16 = sub_25930A240();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18.n128_f64[0] = MEMORY[0x270FA5388](TupleTypeMetadata2 - 8);
  char v20 = (char *)&v29 - v19;
  uint64_t v22 = (char *)&v29 + *(int *)(v21 + 56) - v19;
  uint64_t v23 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v23 + 16))((char *)&v29 - v19, a1, v15, v18);
  uint64_t v24 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v22, v35, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v20, 1, v9) == 1)
  {
    uint64_t v25 = v34;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v22, 1, v4) == 1)
    {
      uint64_t result = sub_25930A580();
      __break(1u);
    }
    else
    {
      uint64_t v26 = v33;
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v33, v22, v4);
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v32, v26, v4);
      sub_259309EA0();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v4);
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v20, v15);
    }
  }
  else
  {
    uint64_t v28 = v31;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v31, v20, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v30, v28, v9);
    sub_259309EB0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v28, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v22, v16);
  }
  return result;
}

uint64_t SeedableRandom.init(seed:bits:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (result)
  {
    uint64_t v3 = a2 - 1;
    if (!__OFSUB__(a2, 1))
    {
      uint64_t v4 = result;
      uint64_t result = sub_2592D75C8(a2);
      *a3 = v4;
      a3[1] = v3;
      a3[2] = result;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall SeedableRandom.repeatingNext(upTo:)(Swift::UInt64 upTo)
{
  if (upTo)
  {
    unint64_t v2 = *(void *)v1;
    do
      unint64_t v2 = ((unint64_t)(vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v2 & *(void *)(v1 + 16)))) & 1) << (*(unsigned char *)(v1 + 8) & 0x3F)) | (v2 >> 1);
    while (v2 - 1 >= upTo);
    *(void *)uint64_t v1 = v2;
    return v2 - 1;
  }
  else
  {
    __break(1u);
  }
  return upTo;
}

uint64_t SeedableRandom.state.getter()
{
  return *(void *)v0;
}

uint64_t SeedableRandom.state.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*SeedableRandom.state.modify())()
{
  return nullsub_1;
}

uint64_t SeedableRandom.shift.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t SeedableRandom.magic.getter()
{
  return *(void *)(v0 + 16);
}

unint64_t SeedableRandom.init(bits:)@<X0>(uint64_t a1@<X8>)
{
  unint64_t result = sub_2592D7744(0xFFFFFFFFFFFFFFFFLL);
  if (result == -1)
  {
    __break(1u);
  }
  else
  {
    *(void *)a1 = result + 1;
    *(_OWORD *)(a1 + 8) = xmmword_259317430;
  }
  return result;
}

uint64_t sub_2592D75C8(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 0x40) {
    return qword_259317488[a1 - 1];
  }
  uint64_t result = sub_25930A580();
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall SeedableRandom.next()()
{
  Swift::UInt64 result = ((unint64_t)(vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v0[2] & *v0))) & 1) << v0[1]) | (*v0 >> 1);
  *uint64_t v0 = result;
  return result;
}

unint64_t SeedableRandom.repeatingNext<A>(in:)()
{
  unint64_t v1 = v0[2];
  unint64_t v2 = *v0;
  uint64_t v3 = v0[1] & 0x3F;
  do
    unint64_t v2 = ((unint64_t)(vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v2 & v1))) & 1) << v3) | (v2 >> 1);
  while ((sub_259309D50() & 1) == 0);
  *uint64_t v0 = v2;
  return v2;
}

unint64_t sub_2592D7710()
{
  unint64_t result = ((unint64_t)(vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v0[2] & *v0))) & 1) << v0[1]) | (*v0 >> 1);
  *uint64_t v0 = result;
  return result;
}

unint64_t sub_2592D7744(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x25A2DBB00](&v3, 8);
    unint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x25A2DBB00](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SeedableRandom(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SeedableRandom(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SeedableRandom()
{
  return &type metadata for SeedableRandom;
}

uint64_t static SystemDirectory.database.getter()
{
  return sub_2592D7DB0(0x6146736F746F6850, 0xEA00000000006563);
}

uint64_t static SystemDirectory.folderURL(for:)()
{
  uint64_t v0 = sub_259309250();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_259309300();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B2F3790 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v4, (uint64_t)qword_26B2F3778);
  sub_259309290();
  v10[0] = sub_2593093F0();
  v10[1] = v8;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06E50], v0);
  sub_25921DB48();
  sub_2593092F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2592D7A78()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F32C8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_259309250();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_259309300();
  __swift_allocate_value_buffer(v7, qword_26B2F3778);
  __swift_project_value_buffer(v7, (uint64_t)qword_26B2F3778);
  uint64_t v8 = swift_slowAlloc();
  uint64_t started = sysdir_start_search_path_enumeration_private();
  MEMORY[0x25A2DBC40](started, v8);
  sub_259309C30();
  MEMORY[0x25A2DBAF0](v8, -1, -1);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E30], v3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 1, 1, v7);
  return sub_2593092E0();
}

uint64_t static SystemDirectory.library.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B2F3790 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_259309300();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B2F3778);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t static SystemDirectory.photosFace.getter()
{
  if (qword_26B2F3790 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_259309300();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B2F3778);
  return sub_259309290();
}

uint64_t static SystemDirectory.developmentDatabaseFile.getter()
{
  return sub_2592D7DB0(0x6573616261746164, 0xEF6574696C71732ELL);
}

uint64_t sub_2592D7DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_259309250();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_259309300();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B2F3790 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v8, (uint64_t)qword_26B2F3778);
  sub_259309290();
  v13[0] = a1;
  v13[1] = a2;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06E50], v4);
  sub_25921DB48();
  sub_2593092F0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void static SystemDirectory.tempFolder()()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_259309300();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(self, sel_defaultManager);
  if (qword_26B2F3790 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_26B2F3778);
  sub_259309290();
  uint64_t v5 = (void *)sub_259309280();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9[0] = 0;
  id v6 = objc_msgSend(v4, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v5, 1, v9);

  id v7 = v9[0];
  if (v6)
  {
    sub_2593092C0();
  }
  else
  {
    uint64_t v8 = v7;
    sub_259309240();

    swift_willThrow();
  }
}

ValueMetadata *type metadata accessor for SystemDirectory()
{
  return &type metadata for SystemDirectory;
}

uint64_t sub_2592D81F8@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  v18[0] = a5;
  uint64_t v9 = sub_259309A20();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_259309A50();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_259309A40();
  sub_25927502C((uint64_t)v16, a1, a2, a3, a4);
  sub_259309A30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F438);
  sub_259309A10();
  sub_259309410();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return swift_bridgeObjectRelease();
}

uint64_t UUID.init(hash:)(void (*a1)(unsigned char *))
{
  uint64_t v2 = sub_259309A20();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_259309A50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_259309A40();
  a1(v9);
  sub_259309A30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F438);
  sub_259309A10();
  sub_259309410();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

_OWORD *sub_2592D860C@<X0>(_OWORD *result@<X0>, _OWORD *a2@<X8>)
{
  if (result) {
    *a2 = *result;
  }
  else {
    __break(1u);
  }
  return result;
}

BOOL sub_2592D8620()
{
  sub_259309BF0();
  uint64_t v0 = (void *)xpc_copy_entitlement_for_token();
  swift_release();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = MEMORY[0x25A2DBCA0](v0);
  BOOL v2 = v1 == sub_259309870() && xpc_BOOL_get_value(v0);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_2592D86F4(uint64_t a1)
{
  uint64_t v41 = type metadata accessor for FetchByDayResponseProto(0);
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v43 = v1;
  uint64_t v44 = MEMORY[0x263F8EE78];
  sub_25925CE14(0, v4, 0);
  uint64_t v5 = v44;
  uint64_t result = sub_2592961A8(a1);
  uint64_t v8 = result;
  uint64_t v9 = 0;
  uint64_t v10 = a1 + 64;
  char v11 = *(unsigned char *)(a1 + 32);
  uint64_t v35 = a1 + 80;
  int64_t v36 = v4;
  uint64_t v38 = a1 + 64;
  uint64_t v39 = a1;
  uint64_t v37 = v7;
  while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << v11)
  {
    unint64_t v14 = (unint64_t)v8 >> 6;
    if ((*(void *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0) {
      goto LABEL_29;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_30;
    }
    uint64_t v42 = v5;
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8 * v8);
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
    uint64_t v17 = qword_26B2F3930;
    swift_bridgeObjectRetain();
    if (v17 != -1) {
      swift_once();
    }
    type metadata accessor for CommunicationActor();
    sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
    sub_259309E90();
    uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
    if ((isCurrentExecutor & 1) == 0) {
      uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
    }
    MEMORY[0x270FA5388](isCurrentExecutor);
    *(&v34 - 4) = v15;
    *(&v34 - 3) = v16;
    *((unsigned char *)&v34 - 16) = 2;
    sub_2592EB048(&qword_26A37E2F0, (void (*)(uint64_t))type metadata accessor for FetchByDayResponseProto);
    swift_bridgeObjectRetain();
    uint64_t v19 = (uint64_t)v40;
    uint64_t v20 = v43;
    sub_259309750();
    uint64_t v21 = v19;
    uint64_t v5 = v19;
    uint64_t v22 = sub_259309710();
    uint64_t v43 = v20;
    if (v20)
    {
      sub_2592EABFC(v19, type metadata accessor for FetchByDayResponseProto);
      swift_release();
      swift_bridgeObjectRelease_n();
      return v5;
    }
    uint64_t v24 = v22;
    uint64_t v25 = v23;
    sub_2592EABFC(v21, type metadata accessor for FetchByDayResponseProto);
    uint64_t result = swift_bridgeObjectRelease_n();
    uint64_t v5 = v42;
    uint64_t v44 = v42;
    unint64_t v27 = *(void *)(v42 + 16);
    unint64_t v26 = *(void *)(v42 + 24);
    if (v27 >= v26 >> 1)
    {
      uint64_t result = sub_25925CE14(v26 > 1, v27 + 1, 1);
      uint64_t v5 = v44;
    }
    *(void *)(v5 + 16) = v27 + 1;
    unint64_t v28 = v5 + 16 * v27;
    *(void *)(v28 + 32) = v24;
    *(void *)(v28 + 40) = v25;
    a1 = v39;
    char v11 = *(unsigned char *)(v39 + 32);
    unint64_t v12 = 1 << v11;
    if (v8 >= 1 << v11) {
      goto LABEL_31;
    }
    uint64_t v10 = v38;
    uint64_t v29 = *(void *)(v38 + 8 * v14);
    if ((v29 & (1 << v8)) == 0) {
      goto LABEL_32;
    }
    LODWORD(v7) = v37;
    if (*(_DWORD *)(v39 + 36) != v37) {
      goto LABEL_33;
    }
    unint64_t v30 = v29 & (-2 << (v8 & 0x3F));
    if (v30)
    {
      unint64_t v12 = __clz(__rbit64(v30)) | v8 & 0xFFFFFFFFFFFFFFC0;
      int64_t v13 = v36;
    }
    else
    {
      unint64_t v31 = v14 + 1;
      unint64_t v32 = (v12 + 63) >> 6;
      int64_t v13 = v36;
      if (v14 + 1 < v32)
      {
        unint64_t v33 = *(void *)(v38 + 8 * v31);
        if (v33)
        {
LABEL_25:
          unint64_t v12 = __clz(__rbit64(v33)) + (v31 << 6);
        }
        else
        {
          while (v32 - 2 != v14)
          {
            unint64_t v33 = *(void *)(v35 + 8 * v14++);
            if (v33)
            {
              unint64_t v31 = v14 + 1;
              goto LABEL_25;
            }
          }
        }
      }
    }
    ++v9;
    uint64_t v8 = v12;
    if (v9 == v13) {
      return v5;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2592D8B40(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F658);
  if (swift_dynamicCast())
  {
    sub_2592CCABC(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_259309230();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_25924A3A8((uint64_t)v38, &qword_26A37F660);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_25930A480();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_2592E8AD4(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_259309C50();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_2592E8B38(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_2592E7D44((void *(*)(uint64_t *__return_ptr, char *, char *))sub_2592EACC4);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_259309340();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_2592E7CC8(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_259309C80();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_25930A480();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_2592E7CC8(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_259309C60();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_259309350();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_259309350();
    sub_259277DC4(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_259277DC4((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t PhotosXPCClient.__allocating_init(messageCenter:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t PhotosXPCClient.generatePhoto(request:)(uint64_t a1, uint64_t *a2)
{
  v3[3] = a1;
  v3[4] = v2;
  v3[5] = type metadata accessor for GeneratePhotoRequestProto(0);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = *a2;
  v3[6] = v5;
  v3[7] = v6;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v8 = sub_259309E90();
  v3[8] = v8;
  v3[9] = v7;
  return MEMORY[0x270FA2498](sub_2592D91CC, v8, v7);
}

uint64_t sub_2592D91CC()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  *(unsigned char *)(v3 + 24) = 2;
  sub_2592EB048(&qword_26A37E310, (void (*)(uint64_t))type metadata accessor for GeneratePhotoRequestProto);
  sub_259309750();
  swift_task_dealloc();
  uint64_t v4 = sub_259309710();
  uint64_t v6 = v5;
  v0[10] = v4;
  v0[11] = v5;
  sub_2592EABFC(v2, type metadata accessor for GeneratePhotoRequestProto);
  unint64_t v9 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[12] = v7;
  void *v7 = v0;
  v7[1] = sub_2592D93AC;
  return v9(1, v4, v6);
}

uint64_t sub_2592D93AC(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  uint64_t v6 = (void *)*v2;
  swift_task_dealloc();
  unint64_t v7 = v4[11];
  uint64_t v8 = v4[10];
  if (v1)
  {
    sub_259261F50(v8, v7);
    swift_task_dealloc();
    unint64_t v9 = (uint64_t (*)(void))v6[1];
    return v9();
  }
  else
  {
    v5[13] = a1;
    sub_259261F50(v8, v7);
    uint64_t v11 = v5[8];
    uint64_t v12 = v5[9];
    return MEMORY[0x270FA2498](sub_2592D9534, v11, v12);
  }
}

uint64_t sub_2592D9534()
{
  v0[2] = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  sub_259273278(&qword_26A37E620, &qword_26A37E618);
  sub_25930A760();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t PhotosXPCClient.sendMessage(request:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_259309BD0();
  v3[5] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v5 = sub_259309E90();
  v3[6] = v5;
  v3[7] = v4;
  return MEMORY[0x270FA2498](sub_2592D9748, v5, v4);
}

uint64_t sub_2592D9748()
{
  unint64_t v1 = v0[3];
  unint64_t v2 = v0[2];
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_2592D8B40(v2, v1);
  uint64_t v5 = v4;
  v0[8] = v3;
  v0[9] = v4;
  uint64_t v8 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[10] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2592D9828;
  return v8(0, v3, v5);
}

uint64_t sub_2592D9828(uint64_t a1)
{
  uint64_t v5 = *v2;
  uint64_t v4 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  unint64_t v7 = *(void *)(v4 + 72);
  uint64_t v8 = *(void *)(v4 + 64);
  if (v1)
  {
    sub_259261F50(v8, v7);
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 88) = a1;
    sub_259261F50(v8, v7);
    uint64_t v12 = (uint64_t (__cdecl *)())((char *)&dword_26A37F460 + dword_26A37F460);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v5 + 96) = v11;
    void *v11 = v6;
    v11[1] = sub_2592D99F4;
    return v12();
  }
}

uint64_t sub_2592D99F4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 104) = a1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 48);
    uint64_t v8 = *(void *)(v3 + 56);
    return MEMORY[0x270FA2498](sub_2592D9B60, v7, v8);
  }
}

uint64_t sub_2592D9B60()
{
  uint64_t v1 = *(void **)(v0 + 104);
  if (v1[2] == 1)
  {
    uint64_t v2 = v1[4];
    unint64_t v3 = v1[5];
    sub_259261DE0(v2, v3);
    swift_bridgeObjectRelease();
    sub_259309BC0();
    uint64_t result = sub_259309BB0();
    if (v5)
    {
      uint64_t v6 = result;
      uint64_t v7 = v5;
      sub_259261F50(v2, v3);
      swift_task_dealloc();
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
      return v8(v6, v7);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_25928A790();
    swift_allocError();
    unsigned char *v9 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  return result;
}

uint64_t PhotosXPCClient.trackFace<A>(type:request:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 48) = a5;
  *(void *)(v6 + 56) = v5;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 40) = a4;
  *(unsigned char *)(v6 + 112) = a2;
  *(void *)(v6 + 24) = a1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v8 = sub_259309E90();
  *(void *)(v6 + 64) = v8;
  *(void *)(v6 + 72) = v7;
  return MEMORY[0x270FA2498](sub_2592D9DB8, v8, v7);
}

uint64_t sub_2592D9DB8()
{
  uint64_t v12 = v0;
  char v1 = *(unsigned char *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 40);
  v11[0] = 2;
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 + 8) + 16))(v11, v3);
  *(void *)(v0 + 80) = v4;
  *(void *)(v0 + 88) = v5;
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  uint64_t v10 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2592D9F0C;
  return v10(0x80D03u >> (8 * v1), v6, v7);
}

uint64_t sub_2592D9F0C(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  uint64_t v6 = (void *)*v2;
  swift_task_dealloc();
  unint64_t v7 = v4[11];
  uint64_t v8 = v4[10];
  if (v1)
  {
    sub_259261F50(v8, v7);
    uint64_t v9 = (uint64_t (*)(void))v6[1];
    return v9();
  }
  else
  {
    v5[13] = a1;
    sub_259261F50(v8, v7);
    uint64_t v11 = v5[8];
    uint64_t v12 = v5[9];
    return MEMORY[0x270FA2498](sub_2592DA08C, v11, v12);
  }
}

uint64_t sub_2592DA08C()
{
  v0[2] = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  type metadata accessor for StoredPhoto(0);
  sub_259273278(&qword_26A37E620, &qword_26A37E618);
  sub_25930A760();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t PhotosXPCClient.untrackFace(type:request:)(char a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = v2;
  *(unsigned char *)(v3 + 56) = a1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v5 = sub_259309E90();
  return MEMORY[0x270FA2498](sub_2592DA270, v5, v4);
}

uint64_t sub_2592DA270()
{
  unsigned int v1 = 0x90E04u >> (8 * *(unsigned char *)(v0 + 56));
  uint64_t v2 = UUID.serialized(version:)();
  uint64_t v4 = v3;
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v3;
  uint64_t v7 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2592DA360;
  return v7(v1, v2, v4);
}

uint64_t sub_2592DA360()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  sub_259261F50(*(void *)(v2 + 32), *(void *)(v2 + 40));
  if (!v0) {
    swift_release();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return v4();
}

uint64_t PhotosXPCClient.fetchFaceList<A>(type:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(unsigned char *)(v4 + 96) = a1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v6 = sub_259309E90();
  *(void *)(v4 + 40) = v6;
  *(void *)(v4 + 48) = v5;
  return MEMORY[0x270FA2498](sub_2592DA594, v6, v5);
}

uint64_t sub_2592DA594()
{
  uint64_t v1 = 0xA0F05u >> (8 * *(unsigned char *)(v0 + 96));
  uint64_t v4 = (char *)&dword_26A37F448 + dword_26A37F448;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2592DA660;
  return ((uint64_t (*)(uint64_t, void, unint64_t))v4)(v1, 0, 0xC000000000000000);
}

uint64_t sub_2592DA660(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 64) = a1;
    uint64_t v9 = (uint64_t (*)(void))((char *)&dword_26A37F460 + dword_26A37F460);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v4 + 72) = v8;
    *uint64_t v8 = v5;
    v8[1] = sub_2592DA7F4;
    return v9();
  }
}

uint64_t sub_2592DA7F4(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v3[10] = a1;
  v3[11] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    uint64_t v7 = v3[5];
    uint64_t v8 = v3[6];
    return MEMORY[0x270FA2498](sub_2592DA958, v7, v8);
  }
}

uint64_t sub_2592DA958()
{
  uint64_t v13 = v0;
  uint64_t v1 = (void *)v0[10];
  if (v1[2] == 1)
  {
    uint64_t v2 = v0[11];
    uint64_t v3 = v0[2];
    uint64_t v4 = v0[3];
    uint64_t v5 = v1[4];
    unint64_t v6 = v1[5];
    sub_259261DE0(v5, v6);
    swift_bridgeObjectRelease();
    v12[0] = 2;
    uint64_t v7 = Array<A>.init(serialized:version:)(v5, v6, v12, v3, *(void *)(v4 + 8));
    if (!v2)
    {
      uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
      return v8(v7);
    }
  }
  else
  {
    sub_25928A790();
    swift_allocError();
    *uint64_t v10 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t PhotosXPCClient.fetchFace(type:request:)(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 40) = v3;
  *(unsigned char *)(v4 + 112) = a2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 48) = type metadata accessor for FetchFaceRequestProto(0);
  *(void *)(v4 + 56) = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v6 = sub_259309E90();
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 72) = v5;
  return MEMORY[0x270FA2498](sub_2592DABC4, v6, v5);
}

uint64_t sub_2592DABC4()
{
  char v1 = *(unsigned char *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  *(unsigned char *)(v4 + 24) = 2;
  sub_2592EB048(&qword_26A37E2E8, (void (*)(uint64_t))type metadata accessor for FetchFaceRequestProto);
  sub_259309750();
  swift_task_dealloc();
  uint64_t v5 = sub_259309710();
  uint64_t v7 = v6;
  *(void *)(v0 + 80) = v5;
  *(void *)(v0 + 88) = v6;
  sub_2592EABFC(v3, type metadata accessor for FetchFaceRequestProto);
  uint64_t v10 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2592DADB8;
  return v10(0xB1006u >> (8 * v1), v5, v7);
}

uint64_t sub_2592DADB8(uint64_t a1)
{
  uint64_t v5 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  uint64_t v6 = (void *)*v2;
  swift_task_dealloc();
  unint64_t v7 = v4[11];
  uint64_t v8 = v4[10];
  if (v1)
  {
    sub_259261F50(v8, v7);
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v6[1];
    return v9();
  }
  else
  {
    v5[13] = a1;
    sub_259261F50(v8, v7);
    uint64_t v11 = v5[8];
    uint64_t v12 = v5[9];
    return MEMORY[0x270FA2498](sub_2592DAF40, v11, v12);
  }
}

uint64_t sub_2592DAF40()
{
  v0[2] = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  type metadata accessor for StoredPhoto(0);
  sub_259273278(&qword_26A37E620, &qword_26A37E618);
  sub_25930A760();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t PhotosXPCClient.provideAssetList<A>(type:id:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = v4;
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  *(unsigned char *)(v5 + 120) = a1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v7 = sub_259309E90();
  *(void *)(v5 + 48) = v7;
  *(void *)(v5 + 56) = v6;
  return MEMORY[0x270FA2498](sub_2592DB134, v7, v6);
}

uint64_t sub_2592DB134()
{
  uint64_t v12 = v0;
  char v1 = *(unsigned char *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 24);
  v11[0] = 2;
  uint64_t v4 = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v2 + 8) + 16))(v11, v3);
  *(void *)(v0 + 64) = v4;
  *(void *)(v0 + 72) = v5;
  uint64_t v6 = v4;
  uint64_t v7 = v5;
  uint64_t v10 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2592DB27C;
  return v10(v1 + 18, v6, v7);
}

uint64_t sub_2592DB27C(uint64_t a1)
{
  uint64_t v5 = *v2;
  uint64_t v4 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  unint64_t v7 = *(void *)(v4 + 72);
  uint64_t v8 = *(void *)(v4 + 64);
  if (v1)
  {
    sub_259261F50(v8, v7);
    uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 88) = a1;
    sub_259261F50(v8, v7);
    uint64_t v12 = (uint64_t (__cdecl *)())((char *)&dword_26A37F460 + dword_26A37F460);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v5 + 96) = v11;
    void *v11 = v6;
    v11[1] = sub_2592DB440;
    return v12();
  }
}

uint64_t sub_2592DB440(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v3[13] = a1;
  v3[14] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    uint64_t v7 = v3[6];
    uint64_t v8 = v3[7];
    return MEMORY[0x270FA2498](sub_2592DB5A4, v7, v8);
  }
}

uint64_t sub_2592DB5A4()
{
  uint64_t v1 = (void *)v0[13];
  if (v1[2] == 1)
  {
    uint64_t v2 = v0[14];
    uint64_t v3 = v1[4];
    unint64_t v4 = v1[5];
    sub_259261DE0(v3, v4);
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_2592E8C98(v3, v4);
    if (!v2)
    {
      uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
      return v6(v5);
    }
  }
  else
  {
    sub_25928A790();
    swift_allocError();
    *uint64_t v8 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t PhotosXPCClient.fetchFaceByDay(type:request:)(char a1, uint64_t a2)
{
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = v2;
  *(unsigned char *)(v3 + 160) = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F4A8);
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = *(void *)(v4 - 8);
  *(void *)(v3 + 56) = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  *(void *)(v3 + 64) = type metadata accessor for CommunicationActor();
  *(void *)(v3 + 72) = sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v6 = sub_259309E90();
  *(void *)(v3 + 80) = v6;
  *(void *)(v3 + 88) = v5;
  return MEMORY[0x270FA2498](sub_2592DB820, v6, v5);
}

uint64_t sub_2592DB820()
{
  unsigned int v1 = 0xC1107u >> (8 * *(unsigned char *)(v0 + 160));
  uint64_t v2 = UUID.serialized(version:)();
  uint64_t v4 = v3;
  *(void *)(v0 + 96) = v2;
  *(void *)(v0 + 104) = v3;
  uint64_t v7 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2592DB910;
  return v7(v1, v2, v4);
}

uint64_t sub_2592DB910(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[15] = v1;
  swift_task_dealloc();
  unint64_t v5 = v4[13];
  uint64_t v6 = v4[12];
  if (v1)
  {
    sub_259261F50(v6, v5);
    uint64_t v7 = v4[10];
    uint64_t v8 = v4[11];
    uint64_t v9 = sub_2592DBF6C;
  }
  else
  {
    v4[16] = a1;
    sub_259261F50(v6, v5);
    uint64_t v7 = v4[10];
    uint64_t v8 = v4[11];
    uint64_t v9 = sub_2592DBA6C;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_2592DBA6C()
{
  v0[2] = v0[16];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  sub_259273278(&qword_26A37E620, &qword_26A37E618);
  sub_25930A760();
  uint64_t v3 = (uint64_t (*)(void))((char *)&dword_26A37F4B8 + dword_26A37F4B8);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[17] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2592DBB98;
  return v3();
}

uint64_t sub_2592DBB98(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[18] = a1;
  v4[19] = v1;
  swift_task_dealloc();
  (*(void (**)(void, void))(v3[6] + 8))(v3[7], v3[5]);
  uint64_t v5 = v3[11];
  uint64_t v6 = v3[10];
  if (v1) {
    uint64_t v7 = sub_2592DBFD0;
  }
  else {
    uint64_t v7 = sub_2592DBD28;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_2592DBD28()
{
  uint64_t v16 = v0;
  uint64_t v1 = v0[18];
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_25925CFC8(0, v2, 0);
    uint64_t v3 = v15;
    uint64_t v4 = (uint64_t *)(v1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      sub_259309E90();
      swift_bridgeObjectRetain();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v15 = v3;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25925CFC8(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v15;
      }
      unint64_t v8 = *(void *)(v3 + 16);
      unint64_t v7 = *(void *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_25925CFC8(v7 > 1, v8 + 1, 1);
        uint64_t v3 = v15;
      }
      *(void *)(v3 + 16) = v8 + 1;
      uint64_t v9 = v3 + 16 * v8;
      *(void *)(v9 + 32) = v6;
      *(void *)(v9 + 40) = v5;
      v4 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    if (*(void *)(v3 + 16)) {
      goto LABEL_11;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_11:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DFA0);
      uint64_t v10 = sub_25930A610();
      goto LABEL_14;
    }
  }
  uint64_t v10 = MEMORY[0x263F8EE80];
LABEL_14:
  uint64_t v11 = v0[19];
  uint64_t v15 = v10;
  sub_2592E9030(v3, 1, &v15);
  if (v11)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = v15;
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
    return v14(v13);
  }
}

uint64_t sub_2592DBF6C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592DBFD0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PhotosXPCClient.generateMask(identifier:)(uint64_t a1)
{
  void v2[2] = a1;
  v2[3] = v1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v4 = sub_259309E90();
  v2[4] = v4;
  v2[5] = v3;
  return MEMORY[0x270FA2498](sub_2592DC124, v4, v3);
}

uint64_t sub_2592DC124()
{
  uint64_t v1 = UUID.serialized(version:)();
  uint64_t v3 = v2;
  v0[6] = v1;
  v0[7] = v2;
  uint64_t v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_26A37F448 + dword_26A37F448);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2592DC1F8;
  return v6(2, v1, v3);
}

uint64_t sub_2592DC1F8(uint64_t a1)
{
  uint64_t v5 = *v2;
  uint64_t v4 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  unint64_t v7 = *(void *)(v4 + 56);
  uint64_t v8 = *(void *)(v4 + 48);
  if (v1)
  {
    sub_259261F50(v8, v7);
    uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 72) = a1;
    sub_259261F50(v8, v7);
    uint64_t v12 = (uint64_t (__cdecl *)())((char *)&dword_26A37F460 + dword_26A37F460);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v5 + 80) = v11;
    void *v11 = v6;
    v11[1] = sub_2592DC3BC;
    return v12();
  }
}

uint64_t sub_2592DC3BC(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = a1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 32);
    uint64_t v8 = *(void *)(v3 + 40);
    return MEMORY[0x270FA2498](sub_2592DC520, v7, v8);
  }
}

uint64_t sub_2592DC520()
{
  uint64_t v1 = *(void **)(v0 + 88);
  if (v1[2] == 1)
  {
    uint64_t v2 = v1[4];
    unint64_t v3 = v1[5];
    sub_259261DE0(v2, v3);
    swift_bridgeObjectRelease();
    uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
    return v4(v2, v3);
  }
  else
  {
    sub_25928A790();
    swift_allocError();
    *uint64_t v6 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_2592DC624(uint64_t a1, unint64_t a2, int a3)
{
  int v54 = a3;
  uint64_t v51 = sub_259309440();
  int64_t v58 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  char v53 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for AlbumIDProto();
  MEMORY[0x270FA5388](v55);
  char v56 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (uint64_t)v42 - v9;
  uint64_t v50 = type metadata accessor for AlbumID();
  uint64_t v52 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v42 - v13;
  uint64_t v15 = sub_2593095D0();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v19 = type metadata accessor for GenericListProto(0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = a1;
  unint64_t v63 = a2;
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  sub_259261DE0(a1, a2);
  sub_2593095C0();
  sub_2592EB048((unint64_t *)&qword_26A37E958, (void (*)(uint64_t))type metadata accessor for GenericListProto);
  uint64_t v22 = v19;
  sub_259309720();
  if (v3)
  {
    sub_259261F50(a1, a2);
  }
  else
  {
    unint64_t v48 = v11;
    unint64_t v49 = v17;
    uint64_t v47 = v14;
    uint64_t v23 = *(void *)v21;
    int64_t v24 = *(void *)(*(void *)v21 + 16);
    if (v24)
    {
      uint64_t v43 = v21;
      uint64_t v44 = a1;
      unint64_t v45 = a2;
      uint64_t v64 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25925CF8C(0, v24, 0);
      uint64_t v46 = (void (**)(char *, char *, uint64_t))(v58 + 32);
      v42[1] = v23;
      unint64_t v25 = (unint64_t *)(v23 + 40);
      unsigned int v26 = (uint64_t *)v56;
      uint64_t v27 = v57;
      do
      {
        uint64_t v28 = *(v25 - 1);
        unint64_t v29 = *v25;
        uint64_t v62 = v28;
        unint64_t v63 = v29;
        uint64_t v61 = 0;
        long long v59 = 0u;
        long long v60 = 0u;
        sub_259261DE0(v28, v29);
        sub_259261DE0(v28, v29);
        sub_259261DE0(v28, v29);
        sub_2593095C0();
        sub_2592EB048(&qword_26A37E418, (void (*)(uint64_t))type metadata accessor for AlbumIDProto);
        sub_259309720();
        int64_t v58 = v24;
        sub_2592EAD50(v27, (uint64_t)v26, (uint64_t (*)(void))type metadata accessor for AlbumIDProto);
        uint64_t v30 = v26[2];
        unint64_t v31 = v26[3];
        LOBYTE(v59) = v54;
        sub_259261DE0(v30, v31);
        unint64_t v32 = v53;
        UUID.init(serialized:version:)(v30, v31);
        uint64_t v34 = *v26;
        uint64_t v33 = v26[1];
        swift_bridgeObjectRetain();
        sub_2592EABFC((uint64_t)v26, (uint64_t (*)(void))type metadata accessor for AlbumIDProto);
        uint64_t v35 = (uint64_t)v48;
        (*v46)(v48, v32, v51);
        sub_259261F50(v28, v29);
        int64_t v36 = (void *)(v35 + *(int *)(v50 + 20));
        *int64_t v36 = v34;
        v36[1] = v33;
        uint64_t v27 = v57;
        sub_2592EABFC(v57, (uint64_t (*)(void))type metadata accessor for AlbumIDProto);
        uint64_t v37 = (uint64_t)v47;
        sub_2592EAC5C(v35, (uint64_t)v47, (uint64_t (*)(void))type metadata accessor for AlbumID);
        sub_259261F50(v28, v29);
        uint64_t v22 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25925CF8C(0, *(void *)(v22 + 16) + 1, 1);
          uint64_t v22 = v64;
        }
        uint64_t v38 = v52;
        unint64_t v40 = *(void *)(v22 + 16);
        unint64_t v39 = *(void *)(v22 + 24);
        unsigned int v26 = (uint64_t *)v56;
        if (v40 >= v39 >> 1)
        {
          sub_25925CF8C(v39 > 1, v40 + 1, 1);
          uint64_t v38 = v52;
          uint64_t v22 = v64;
        }
        v25 += 2;
        *(void *)(v22 + 16) = v40 + 1;
        sub_2592EAC5C(v37, v22+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v40, (uint64_t (*)(void))type metadata accessor for AlbumID);
        int64_t v24 = v58 - 1;
      }
      while (v58 != 1);
      swift_bridgeObjectRelease();
      sub_259261F50(v44, v45);
      uint64_t v21 = v43;
    }
    else
    {
      sub_259261F50(a1, a2);
      uint64_t v22 = MEMORY[0x263F8EE78];
    }
    sub_2592EABFC((uint64_t)v21, type metadata accessor for GenericListProto);
  }
  return v22;
}

uint64_t sub_2592DCD38(uint64_t a1, unint64_t a2, int a3)
{
  int v33 = a3;
  uint64_t v6 = type metadata accessor for ShuffleID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2593095D0();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = type metadata accessor for GenericListProto(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = a1;
  unint64_t v32 = a2;
  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  sub_259261DE0(a1, a2);
  sub_2593095C0();
  sub_2592EB048((unint64_t *)&qword_26A37E958, (void (*)(uint64_t))type metadata accessor for GenericListProto);
  sub_259309720();
  if (v3)
  {
    sub_259261F50(a1, a2);
  }
  else
  {
    uint64_t v27 = v6;
    uint64_t v14 = *(void *)v13;
    int64_t v15 = *(void *)(*(void *)v13 + 16);
    if (v15)
    {
      int64_t v24 = v13;
      uint64_t v25 = a1;
      unint64_t v26 = a2;
      *(void *)&long long v28 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25925CD60(0, v15, 0);
      uint64_t v16 = v14;
      uint64_t v6 = v28;
      v23[1] = v16;
      uint64_t v17 = (unint64_t *)(v16 + 40);
      do
      {
        uint64_t v19 = *(v17 - 1);
        unint64_t v18 = *v17;
        sub_259261DE0(v19, *v17);
        sub_259261DE0(v19, v18);
        sub_2592A8918(v19, v18, v33, (uint64_t)v9);
        sub_259261F50(v19, v18);
        *(void *)&long long v28 = v6;
        unint64_t v21 = *(void *)(v6 + 16);
        unint64_t v20 = *(void *)(v6 + 24);
        if (v21 >= v20 >> 1)
        {
          sub_25925CD60(v20 > 1, v21 + 1, 1);
          uint64_t v6 = v28;
        }
        v17 += 2;
        *(void *)(v6 + 16) = v21 + 1;
        sub_2592EAC5C((uint64_t)v9, v6+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v21, (uint64_t (*)(void))type metadata accessor for ShuffleID);
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      sub_259261F50(v25, v26);
      uint64_t v13 = v24;
    }
    else
    {
      sub_259261F50(a1, a2);
      uint64_t v6 = MEMORY[0x263F8EE78];
    }
    sub_2592EABFC((uint64_t)v13, type metadata accessor for GenericListProto);
  }
  return v6;
}

uint64_t sub_2592DD0E0()
{
  *(void *)(v1 + 32) = v0;
  return MEMORY[0x270FA2498](sub_2592DD100, 0, 0);
}

uint64_t sub_2592DD100()
{
  uint64_t v1 = v0[4];
  v0[5] = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = MEMORY[0x263F8EE78];
  v0[6] = v2;
  v0[7] = v3;
  swift_retain();
  swift_retain();
  uint64_t v8 = (char *)&dword_26A37F8A0 + dword_26A37F8A0;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2592DD1DC;
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v8)(v0 + 2, v5, v6);
}

uint64_t sub_2592DD1DC()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592DD4A4;
  }
  else {
    uint64_t v2 = sub_2592DD2F0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592DD2F0()
{
  uint64_t v2 = v0[2];
  unint64_t v1 = v0[3];
  if (v1 >> 60 == 15)
  {
    swift_release();
    swift_release();
    uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v4 = v0[7];
    return v3(v4);
  }
  else
  {
    sub_259261DE0(v0[2], v0[3]);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v7 = (void *)v0[7];
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v7 = sub_259248CE8(0, v7[2] + 1, 1, (void *)v0[7]);
    }
    unint64_t v9 = v7[2];
    unint64_t v8 = v7[3];
    if (v9 >= v8 >> 1) {
      uint64_t v7 = sub_259248CE8((void *)(v8 > 1), v9 + 1, 1, v7);
    }
    v7[2] = v9 + 1;
    uint64_t v10 = &v7[2 * v9];
    v10[4] = v2;
    v10[5] = v1;
    sub_259277DC4(v2, v1);
    v0[7] = v7;
    uint64_t v14 = (char *)&dword_26A37F8A0 + dword_26A37F8A0;
    uint64_t v11 = (void *)swift_task_alloc();
    v0[8] = v11;
    void *v11 = v0;
    v11[1] = sub_2592DD1DC;
    uint64_t v12 = v0[5];
    uint64_t v13 = v0[6];
    return ((uint64_t (*)(void *, uint64_t, uint64_t))v14)(v0 + 2, v12, v13);
  }
}

uint64_t sub_2592DD4A4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592DD51C()
{
  v1[4] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F4A8);
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F640);
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592DD640, 0, 0);
}

uint64_t sub_2592DD640()
{
  (*(void (**)(void, void, void))(v0[6] + 16))(v0[7], v0[4], v0[5]);
  sub_259273278(&qword_26A37F648, &qword_26A37F4A8);
  sub_259309F80();
  v0[11] = MEMORY[0x263F8EE78];
  uint64_t v1 = sub_259273278(&qword_26A37F650, &qword_26A37F640);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[12] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2592DD78C;
  uint64_t v3 = v0[8];
  return MEMORY[0x270FA1E80](v0 + 2, v3, v1);
}

uint64_t sub_2592DD78C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v6 = v2 + 64;
    uint64_t v4 = *(void *)(v2 + 64);
    uint64_t v5 = *(void *)(v6 + 8);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    uint64_t v7 = sub_2592DDAB0;
  }
  else
  {
    uint64_t v7 = sub_2592DD8CC;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_2592DD8CC()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  if (v1)
  {
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v4 = (void *)v0[11];
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v4 = sub_259248DF8(0, v4[2] + 1, 1, (void *)v0[11]);
    }
    unint64_t v6 = v4[2];
    unint64_t v5 = v4[3];
    if (v6 >= v5 >> 1) {
      uint64_t v4 = sub_259248DF8((void *)(v5 > 1), v6 + 1, 1, v4);
    }
    v4[2] = v6 + 1;
    uint64_t v7 = &v4[2 * v6];
    v7[4] = v2;
    v7[5] = v1;
    swift_bridgeObjectRelease();
    v0[11] = v4;
    uint64_t v8 = sub_259273278(&qword_26A37F650, &qword_26A37F640);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[12] = v9;
    void *v9 = v0;
    v9[1] = sub_2592DD78C;
    uint64_t v10 = v0[8];
    return MEMORY[0x270FA1E80](v0 + 2, v10, v8);
  }
  else
  {
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v12 = v0[11];
    return v11(v12);
  }
}

uint64_t sub_2592DDAB0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

PhotosFace::XPCRequestType_optional __swiftcall XPCRequestType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 0;
  char v3 = 3;
  switch(rawValue)
  {
    case 0:
      goto LABEL_4;
    case 1:
      char v2 = 1;
      goto LABEL_4;
    case 2:
      char v2 = 2;
LABEL_4:
      char v3 = v2;
      goto LABEL_5;
    case 10:
LABEL_5:
      *uint64_t v1 = v3;
      break;
    case 11:
      *uint64_t v1 = 4;
      break;
    case 12:
      *uint64_t v1 = 5;
      break;
    case 13:
      *uint64_t v1 = 6;
      break;
    case 14:
      *uint64_t v1 = 7;
      break;
    case 21:
      *uint64_t v1 = 8;
      break;
    case 22:
      *uint64_t v1 = 9;
      break;
    case 23:
      *uint64_t v1 = 10;
      break;
    case 24:
      *uint64_t v1 = 11;
      break;
    case 25:
      *uint64_t v1 = 12;
      break;
    case 31:
      *uint64_t v1 = 13;
      break;
    case 32:
      *uint64_t v1 = 14;
      break;
    case 33:
      *uint64_t v1 = 15;
      break;
    case 34:
      *uint64_t v1 = 16;
      break;
    case 35:
      *uint64_t v1 = 17;
      break;
    case 36:
      *uint64_t v1 = 18;
      break;
    case 37:
      *uint64_t v1 = 19;
      break;
    case 38:
      *uint64_t v1 = 20;
      break;
    default:
      *uint64_t v1 = 21;
      break;
  }
  return (PhotosFace::XPCRequestType_optional)rawValue;
}

uint64_t XPCRequestType.rawValue.getter()
{
  return qword_259317810[*v0];
}

BOOL sub_2592DDCF4(char *a1, char *a2)
{
  return qword_259317810[*a1] == qword_259317810[*a2];
}

uint64_t sub_2592DDD18()
{
  return sub_25930A910();
}

uint64_t sub_2592DDD68()
{
  return sub_25930A8D0();
}

uint64_t sub_2592DDDA0()
{
  return sub_25930A910();
}

PhotosFace::XPCRequestType_optional sub_2592DDDEC(Swift::Int *a1)
{
  return XPCRequestType.init(rawValue:)(*a1);
}

void sub_2592DDDF4(void *a1@<X8>)
{
  *a1 = qword_259317810[*v1];
}

uint64_t PhotosXPCServer.activate()()
{
  *(void *)(v1 + 16) = v0;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v3 = sub_259309E90();
  return MEMORY[0x270FA2498](sub_2592DDEFC, v3, v2);
}

uint64_t sub_2592DDEFC()
{
  sub_2592DDF60();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592DDF60()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_259309900();
  MEMORY[0x270FA5388](v2);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = qword_26B2F3920;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_26B2F3918;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D68);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2593131D0;
  id v5 = v4;
  sub_2593098F0();
  sub_2592EB048(&qword_26B2F3D28, MEMORY[0x263F8F3F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D38);
  sub_259273278(&qword_26B2F3D40, &qword_26B2F3D38);
  sub_25930A330();
  swift_allocObject();
  swift_weakInit();
  sub_259309970();
  swift_allocObject();
  *(void *)(v1 + 32) = sub_259309950();
  uint64_t result = swift_release();
  if (*(void *)(v1 + 32))
  {
    swift_retain();
    sub_259309960();
    return swift_release();
  }
  return result;
}

uint64_t PhotosXPCClient.init(messageCenter:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t PhotosXPCClient.deinit()
{
  swift_release();
  return v0;
}

uint64_t _s10PhotosFace0A9XPCServerCfD_0()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t PhotosXPCServer.registerGeneratePhoto<A>(callback:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v12 = 1;
  uint64_t v8 = (void *)swift_allocObject();
  _OWORD v8[2] = a3;
  v8[3] = a4;
  void v8[4] = a1;
  v8[5] = a2;
  uint64_t v9 = sub_25930A750();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  XPCMessageCenter.Server.registerData<A>(request:callback:)((uint64_t)&v12, (uint64_t)&unk_26A37F4D8, (uint64_t)v8, v9, WitnessTable);
  return swift_release();
}

uint64_t sub_2592DE4CC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 72) = a7;
  *(void *)(v8 + 80) = a8;
  *(void *)(v8 + 56) = a5;
  *(void *)(v8 + 64) = a6;
  *(void *)(v8 + 40) = a2;
  *(void *)(v8 + 48) = a3;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 88) = *(void *)(a7 - 8);
  *(void *)(v8 + 96) = swift_task_alloc();
  *(void *)(v8 + 104) = swift_task_alloc();
  *(unsigned char *)(v8 + 152) = *a4;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v11 = sub_259309E90();
  *(void *)(v8 + 112) = v11;
  *(void *)(v8 + 120) = v10;
  return MEMORY[0x270FA2498](sub_2592DE634, v11, v10);
}

uint64_t sub_2592DE634()
{
  uint64_t v2 = v0[5];
  unint64_t v1 = v0[6];
  sub_259261DE0(v2, v1);
  sub_2592A9C08(v2, v1, v0 + 2);
  uint64_t v3 = (int *)v0[7];
  uint64_t v4 = v0[2];
  v0[16] = v4;
  v0[3] = v4;
  uint64_t v8 = (int *)((char *)v3 + *v3);
  id v5 = (void *)swift_task_alloc();
  v0[17] = v5;
  *id v5 = v0;
  v5[1] = sub_2592DE7AC;
  uint64_t v6 = v0[13];
  return ((uint64_t (*)(uint64_t, void *))v8)(v6, v0 + 3);
}

uint64_t sub_2592DE7AC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 120);
  if (v0) {
    id v5 = sub_2592DE9F4;
  }
  else {
    id v5 = sub_2592DE8D0;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592DE8D0()
{
  char v1 = *(unsigned char *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 72);
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 16))(*(void *)(v0 + 96), v2, v4);
  *(unsigned char *)(swift_allocObject() + 16) = v1;
  sub_259309F90();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_2592DE9F4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592DEA60(uint64_t a1, uint64_t *a2, char a3)
{
  *(unsigned char *)(v3 + 48) = a3;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = type metadata accessor for GeneratePhotoResponseProto(0);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = *a2;
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  return MEMORY[0x270FA2498](sub_2592DEB00, 0, 0);
}

uint64_t sub_2592DEB00()
{
  uint64_t v1 = *(void *)(v0 + 40);
  char v2 = *(unsigned char *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  *(unsigned char *)(v3 + 24) = v2;
  sub_2592EB048(&qword_26A37E318, (void (*)(uint64_t))type metadata accessor for GeneratePhotoResponseProto);
  sub_259309750();
  swift_task_dealloc();
  uint64_t v4 = sub_259309710();
  uint64_t v6 = v5;
  uint64_t v7 = *(uint64_t **)(v0 + 16);
  sub_2592EABFC(*(void *)(v0 + 32), type metadata accessor for GeneratePhotoResponseProto);
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_2592DEC80(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = 0x8000000000000000;
  sub_259295990(a5, v10, a1, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 40) = v13;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t PhotosXPCServer.registerGenerateMask(callback:)(uint64_t a1, uint64_t a2)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_2592DEC80(2, (uint64_t)&unk_26A37F4E8, v4, (uint64_t)&unk_27072B8F0, (uint64_t)&unk_26A37F598);
  return swift_release();
}

uint64_t sub_2592DEF68(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  *(void *)(v6 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  *(void *)(v6 + 56) = swift_task_alloc();
  *(unsigned char *)(v6 + 64) = *a4;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v9 = sub_259309E90();
  return MEMORY[0x270FA2498](sub_2592DF09C, v9, v8);
}

uint64_t sub_2592DF09C()
{
  char v1 = *(unsigned char *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  unint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v7 = *(uint64_t **)(v0 + 16);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v3;
  *(void *)(v8 + 32) = v6;
  *(void *)(v8 + 40) = v4;
  *(unsigned char *)(v8 + 48) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  uint64_t v9 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DCA8);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 24) = 0;
  *(void *)(v10 + 16) = 0;
  swift_retain();
  sub_259261DE0(v6, v4);
  swift_retain();
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v12 = sub_2592FE30C(MEMORY[0x263F8EE78]);
  uint64_t v14 = v13;
  uint64_t v15 = sub_2592FE108(v11);
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5B0);
  uint64_t v18 = swift_allocObject();
  *(_DWORD *)(v18 + 64) = 0;
  *(void *)(v18 + 16) = v12;
  *(void *)(v18 + 24) = v14;
  uint64_t v19 = MEMORY[0x263F8EE88];
  *(void *)(v18 + 32) = MEMORY[0x263F8EE88];
  *(void *)(v18 + 40) = v15;
  *(void *)(v18 + 48) = v17;
  *(void *)(v18 + 56) = v19;
  *(void *)(v9 + 16) = v18;
  *(void *)(v9 + 24) = v10;
  uint64_t v20 = sub_259309F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v2, 1, 1, v20);
  unint64_t v21 = (void *)swift_allocObject();
  void v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_26A37F5A8;
  v21[5] = v8;
  v21[6] = v9;
  swift_retain();
  sub_2592EBE08(v2, (uint64_t)&unk_26A37F5B8, (uint64_t)v21);
  swift_release();
  swift_release();
  uint64_t *v7 = v9;
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_2592DF2C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(unsigned char *)(v7 + 145) = a7;
  *(void *)(v7 + 64) = a5;
  *(void *)(v7 + 72) = a6;
  *(void *)(v7 + 48) = a3;
  *(void *)(v7 + 56) = a4;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  uint64_t v8 = sub_259309440();
  *(void *)(v7 + 80) = v8;
  *(void *)(v7 + 88) = *(void *)(v8 - 8);
  *(void *)(v7 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592DF38C, 0, 0);
}

uint64_t sub_2592DF38C()
{
  uint64_t v2 = *(void *)(v0 + 64);
  unint64_t v1 = *(void *)(v0 + 72);
  sub_259261DE0(v2, v1);
  UUID.init(serialized:version:)(v2, v1);
  uint64_t v3 = *(int **)(v0 + 48);
  *(unsigned char *)(v0 + 144) = *(unsigned char *)(v0 + 145);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v3 + *v3);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v4;
  *unint64_t v4 = v0;
  v4[1] = sub_2592DF4E8;
  uint64_t v5 = *(void *)(v0 + 96);
  return v7(v5, v0 + 144);
}

uint64_t sub_2592DF4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)*v3;
  v6[14] = a1;
  v6[15] = a2;
  v6[16] = v2;
  swift_task_dealloc();
  if (v2)
  {
    (*(void (**)(void, void))(v6[11] + 8))(v6[12], v6[10]);
    return MEMORY[0x270FA2498](sub_2592DF84C, 0, 0);
  }
  else
  {
    uint64_t v7 = (int *)v6[4];
    (*(void (**)(void, void))(v6[11] + 8))(v6[12], v6[10]);
    _OWORD v6[2] = a1;
    v6[3] = a2;
    uint64_t v10 = (uint64_t (*)(void *))((char *)v7 + *v7);
    uint64_t v8 = (void *)swift_task_alloc();
    v6[17] = v8;
    *uint64_t v8 = v6;
    v8[1] = sub_2592DF6EC;
    return v10(v6 + 2);
  }
}

uint64_t sub_2592DF6EC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  sub_259261F50(*(void *)(v1 + 112), *(void *)(v1 + 120));
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
  return v3();
}

uint64_t sub_2592DF84C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592DF8B0(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 16) = a2;
  *(unsigned char *)(v4 + 48) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  *(void *)(v4 + 40) = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v6 = sub_259309E90();
  return MEMORY[0x270FA2498](sub_2592DF9D8, v6, v5);
}

uint64_t sub_2592DF9D8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 16);
  unint64_t v3 = *(void *)(v0 + 24);
  char v5 = *(unsigned char *)(v0 + 48);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(unsigned char *)(v6 + 24) = v5;
  *(void *)(v6 + 32) = v4;
  *(void *)(v6 + 40) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  uint64_t v7 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DCA8);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(void *)(v8 + 16) = 0;
  swift_retain();
  sub_259261DE0(v4, v3);
  swift_retain();
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v10 = sub_2592FE30C(MEMORY[0x263F8EE78]);
  uint64_t v12 = v11;
  uint64_t v13 = sub_2592FE108(v9);
  uint64_t v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5B0);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 64) = 0;
  *(void *)(v16 + 16) = v10;
  *(void *)(v16 + 24) = v12;
  uint64_t v17 = MEMORY[0x263F8EE88];
  *(void *)(v16 + 32) = MEMORY[0x263F8EE88];
  *(void *)(v16 + 40) = v13;
  *(void *)(v16 + 48) = v15;
  *(void *)(v16 + 56) = v17;
  *(void *)(v7 + 16) = v16;
  *(void *)(v7 + 24) = v8;
  uint64_t v18 = sub_259309F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v1, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  void v19[4] = &unk_26A37F670;
  v19[5] = v6;
  v19[6] = v7;
  swift_retain();
  sub_2592EBE08(v1, (uint64_t)&unk_26A37F678, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v20(v7);
}

uint64_t sub_2592DFBF0(uint64_t a1, _OWORD *a2)
{
  *(void *)(v2 + 32) = a1;
  sub_2593095D0();
  *(void *)(v2 + 40) = swift_task_alloc();
  *(void *)(v2 + 48) = type metadata accessor for GeneratePhotoResponseProto(0);
  *(void *)(v2 + 56) = swift_task_alloc();
  *(void *)(v2 + 64) = swift_task_alloc();
  *(_OWORD *)(v2 + 72) = *a2;
  return MEMORY[0x270FA2498](sub_2592DFCCC, 0, 0);
}

uint64_t sub_2592DFCCC()
{
  uint64_t v9 = v0;
  uint64_t v1 = v0[9];
  v0[2] = v1;
  unint64_t v2 = v0[10];
  v0[3] = v2;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  sub_259261DE0(v1, v2);
  sub_2593095C0();
  sub_2592EB048(&qword_26A37E318, (void (*)(uint64_t))type metadata accessor for GeneratePhotoResponseProto);
  sub_259309720();
  uint64_t v3 = v0[7];
  uint64_t v4 = (void *)v0[4];
  sub_2592EAD50(v0[8], v3, type metadata accessor for GeneratePhotoResponseProto);
  LOBYTE(v7[0]) = 2;
  GeneratePhotoResponse.init(protobuf:version:)(v3, (unsigned __int8 *)v7, v4);
  sub_2592EABFC(v0[8], type metadata accessor for GeneratePhotoResponseProto);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t PhotosXPCServer.registerTrackFace<A, B>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v18 = 0x80D03u >> (8 * a1);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a6;
  v14[5] = a7;
  v14[6] = a2;
  v14[7] = a3;
  uint64_t v15 = sub_25930A750();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  XPCMessageCenter.Server.registerData<A>(request:callback:)((uint64_t)&v18, (uint64_t)&unk_26A37F4F8, (uint64_t)v14, v15, WitnessTable);
  return swift_release();
}

uint64_t sub_2592E006C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = v13;
  v8[10] = v14;
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a2;
  void v8[4] = a3;
  _OWORD v8[2] = a1;
  v8[11] = *(void *)(a7 - 8);
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v10 = sub_259309E90();
  v8[14] = v10;
  v8[15] = v9;
  return MEMORY[0x270FA2498](sub_2592E01EC, v10, v9);
}

uint64_t sub_2592E01EC()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v4 = v0[3];
  unint64_t v3 = v0[4];
  v12[0] = 2;
  uint64_t v5 = *(void *)(v1 + 8);
  uint64_t v6 = *(void (**)(uint64_t, unint64_t, char *, uint64_t, uint64_t))(v5 + 8);
  sub_259261DE0(v4, v3);
  v6(v4, v3, v12, v2, v5);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))(v0[5] + *(int *)v0[5]);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  void *v7 = v0;
  v7[1] = sub_2592E0388;
  uint64_t v9 = v0[12];
  uint64_t v8 = v0[13];
  return v11(v8, v9);
}

uint64_t sub_2592E0388()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 96);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 56);
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 120);
  uint64_t v7 = *(void *)(v2 + 112);
  if (v0) {
    uint64_t v8 = sub_2592E05C0;
  }
  else {
    uint64_t v8 = sub_2592E0520;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_2592E0520()
{
  sub_259309F90();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592E05C0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592E062C(uint64_t a1, uint64_t a2)
{
  void v2[2] = a1;
  v2[3] = a2;
  v2[4] = type metadata accessor for StoredPhotoProto(0);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592E06C0, 0, 0);
}

uint64_t sub_2592E06C0()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 24) = 2;
  sub_2592EB048(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
  sub_259309750();
  swift_task_dealloc();
  uint64_t v3 = sub_259309710();
  uint64_t v5 = v4;
  uint64_t v6 = (uint64_t *)v0[2];
  sub_2592EABFC(v0[5], type metadata accessor for StoredPhotoProto);
  *uint64_t v6 = v3;
  v6[1] = v5;
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t PhotosXPCServer.registerUntrackFace(type:callback:)(char a1, uint64_t a2, uint64_t a3)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v6 = 0x90E04u >> (8 * a1);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  swift_retain();
  sub_2592DEC80(v6, (uint64_t)&unk_26A37F508, v7, (uint64_t)&unk_27072B8C8, (uint64_t)&unk_26A37F570);
  return swift_release();
}

uint64_t sub_2592E09BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a2;
  v6[4] = a3;
  _OWORD v6[2] = a1;
  uint64_t v7 = sub_259309440();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v9 = sub_259309E90();
  v6[10] = v9;
  v6[11] = v8;
  return MEMORY[0x270FA2498](sub_2592E0B10, v9, v8);
}

uint64_t sub_2592E0B10()
{
  uint64_t v2 = v0[3];
  unint64_t v1 = v0[4];
  sub_259261DE0(v2, v1);
  UUID.init(serialized:version:)(v2, v1);
  unsigned int v6 = (uint64_t (*)(uint64_t))(v0[5] + *(int *)v0[5]);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2592E0C5C;
  uint64_t v4 = v0[9];
  return v6(v4);
}

uint64_t sub_2592E0C5C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 72);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *(void *)(*v1 + 56);
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 88);
  uint64_t v7 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v8 = sub_2592EB0A4;
  }
  else {
    uint64_t v8 = sub_2592E0DF4;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_2592E0DF4()
{
  **(void **)(v0 + 16) = MEMORY[0x263F8EE78];
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PhotosXPCServer.registerFetchFaceList<A>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v10 = 0xA0F05u >> (8 * a1);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a2;
  v11[5] = a3;
  swift_retain();
  sub_2592DEC80(v10, (uint64_t)&unk_26A37F518, (uint64_t)v11, (uint64_t)&unk_27072B8C8, (uint64_t)&unk_26A37F570);
  return swift_release();
}

uint64_t sub_2592E0FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  void v8[4] = a6;
  _OWORD v8[2] = a1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v10 = sub_259309E90();
  v8[7] = v10;
  v8[8] = v9;
  return MEMORY[0x270FA2498](sub_2592E10F0, v10, v9);
}

uint64_t sub_2592E10F0()
{
  unint64_t v1 = (int *)v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF30);
  uint64_t v2 = swift_allocObject();
  v0[9] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2593131D0;
  uint64_t v5 = (uint64_t (*)(void))((char *)v1 + *v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2592E11E8;
  return v5();
}

uint64_t sub_2592E11E8(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_2592E13DC;
  }
  else
  {
    v4[12] = a1;
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_2592E1310;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_2592E1310()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  v12[0] = 2;
  uint64_t v5 = Array<A>.serialized(version:)(v12, v2, v3, *(void *)(v4 + 8));
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v1)
  {
    *(void *)(v0[9] + 16) = 0;
    swift_release();
  }
  else
  {
    uint64_t v9 = v0[9];
    uint64_t v10 = (void *)v0[2];
    *(void *)(v9 + 32) = v5;
    *(void *)(v9 + 40) = v7;
    *uint64_t v10 = v9;
  }
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2592E13DC()
{
  *(void *)(*(void *)(v0 + 72) + 16) = 0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PhotosXPCServer.registerFetchFace<A>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v14 = 0xB1006u >> (8 * a1);
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = a4;
  v10[3] = a5;
  v10[4] = a2;
  v10[5] = a3;
  uint64_t v11 = sub_25930A750();
  swift_retain();
  uint64_t WitnessTable = swift_getWitnessTable();
  XPCMessageCenter.Server.registerData<A>(request:callback:)((uint64_t)&v14, (uint64_t)&unk_26A37F528, (uint64_t)v10, v11, WitnessTable);
  return swift_release();
}

uint64_t sub_2592E15F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a2;
  void v8[4] = a3;
  _OWORD v8[2] = a1;
  type metadata accessor for FetchFaceRequest();
  v8[9] = swift_task_alloc();
  v8[10] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v10 = sub_259309E90();
  v8[11] = v10;
  v8[12] = v9;
  return MEMORY[0x270FA2498](sub_2592E1748, v10, v9);
}

uint64_t sub_2592E1748()
{
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  sub_259261DE0(v3, v2);
  sub_2592A9E28(v3, v2, 2, v1);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(v0[5] + *(int *)v0[5]);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2592E189C;
  uint64_t v6 = v0[9];
  uint64_t v5 = v0[10];
  return v8(v5, v6);
}

uint64_t sub_2592E189C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 72);
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  sub_2592EABFC(v3, (uint64_t (*)(void))type metadata accessor for FetchFaceRequest);
  uint64_t v4 = *(void *)(v2 + 96);
  uint64_t v5 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v6 = sub_2592E1AA4;
  }
  else {
    uint64_t v6 = sub_2592E1A08;
  }
  return MEMORY[0x270FA2498](v6, v5, v4);
}

uint64_t sub_2592E1A08()
{
  sub_259309F90();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592E1AA4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592E1B10(uint64_t a1, uint64_t a2)
{
  void v2[2] = a1;
  v2[3] = a2;
  v2[4] = type metadata accessor for StoredPhotoProto(0);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592E1BA4, 0, 0);
}

uint64_t sub_2592E1BA4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 24) = 2;
  sub_2592EB048(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
  sub_259309750();
  swift_task_dealloc();
  uint64_t v3 = sub_259309710();
  uint64_t v5 = v4;
  uint64_t v6 = (uint64_t *)v0[2];
  sub_2592EABFC(v0[5], type metadata accessor for StoredPhotoProto);
  *uint64_t v6 = v3;
  v6[1] = v5;
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t PhotosXPCServer.registerFetchFaceByDay(type:callback:)(char a1, uint64_t a2, uint64_t a3)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v6 = 0xC1107u >> (8 * a1);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  swift_retain();
  sub_2592DEC80(v6, (uint64_t)&unk_26A37F538, v7, (uint64_t)&unk_27072B8C8, (uint64_t)&unk_26A37F570);
  return swift_release();
}

uint64_t sub_2592E1EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a2;
  v6[4] = a3;
  _OWORD v6[2] = a1;
  uint64_t v7 = sub_259309440();
  v6[7] = v7;
  v6[8] = *(void *)(v7 - 8);
  v6[9] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v9 = sub_259309E90();
  v6[10] = v9;
  v6[11] = v8;
  return MEMORY[0x270FA2498](sub_2592E1FF4, v9, v8);
}

uint64_t sub_2592E1FF4()
{
  uint64_t v2 = v0[3];
  unint64_t v1 = v0[4];
  sub_259261DE0(v2, v1);
  UUID.init(serialized:version:)(v2, v1);
  unsigned int v6 = (uint64_t (*)(uint64_t))(v0[5] + *(int *)v0[5]);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2592E2140;
  uint64_t v4 = v0[9];
  return v6(v4);
}

uint64_t sub_2592E2140(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 72);
  uint64_t v6 = *(void *)(*(void *)v2 + 64);
  uint64_t v7 = *(void *)(*(void *)v2 + 56);
  *(void *)(*(void *)v2 + 104) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (v1)
  {
    uint64_t v8 = v4[10];
    uint64_t v9 = v4[11];
    uint64_t v10 = sub_2592E2374;
  }
  else
  {
    v4[14] = a1;
    uint64_t v8 = v4[10];
    uint64_t v9 = v4[11];
    uint64_t v10 = sub_2592E22CC;
  }
  return MEMORY[0x270FA2498](v10, v8, v9);
}

uint64_t sub_2592E22CC()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = sub_2592D86F4(*(void *)(v0 + 112));
  swift_bridgeObjectRelease();
  if (!v1) {
    **(void **)(v0 + 16) = v2;
  }
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2592E2374()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PhotosXPCServer.registerProvideAssetList<A>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v10 = a1 + 18;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a2;
  v11[5] = a3;
  swift_retain();
  sub_2592DEC80(v10, (uint64_t)&unk_26A37F548, (uint64_t)v11, (uint64_t)&unk_27072B8C8, (uint64_t)&unk_26A37F570);
  return swift_release();
}

uint64_t sub_2592E2558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a2;
  void v8[4] = a3;
  _OWORD v8[2] = a1;
  v8[9] = *(void *)(a7 - 8);
  v8[10] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v10 = sub_259309E90();
  v8[11] = v10;
  v8[12] = v9;
  return MEMORY[0x270FA2498](sub_2592E26A4, v10, v9);
}

uint64_t sub_2592E26A4()
{
  char v14 = v0;
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[3];
  unint64_t v3 = v0[4];
  v13[0] = 2;
  uint64_t v5 = *(void *)(v1 + 8);
  uint64_t v6 = *(void (**)(uint64_t, unint64_t, char *, uint64_t, uint64_t))(v5 + 8);
  sub_259261DE0(v4, v3);
  v6(v4, v3, v13, v2, v5);
  uint64_t v7 = (int *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF30);
  uint64_t v8 = swift_allocObject();
  v0[13] = v8;
  *(_OWORD *)(v8 + 16) = xmmword_2593131D0;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)v7 + *v7);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[14] = v9;
  void *v9 = v0;
  v9[1] = sub_2592E2860;
  uint64_t v10 = v0[10];
  return v12(v10);
}

uint64_t sub_2592E2860(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[11];
    uint64_t v6 = v4[12];
    uint64_t v7 = sub_2592E2A8C;
  }
  else
  {
    v4[16] = a1;
    uint64_t v5 = v4[11];
    uint64_t v6 = v4[12];
    uint64_t v7 = sub_2592E2988;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_2592E2988()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = sub_2592E9E2C(v0[16]);
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v6 = v0[9];
    uint64_t v5 = v0[10];
    uint64_t v7 = v0[7];
    *(void *)(v0[13] + 16) = 0;
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    uint64_t v9 = v0[13];
    uint64_t v10 = v0[9];
    uint64_t v11 = v0[10];
    uint64_t v12 = v0[7];
    uint64_t v13 = (void *)v0[2];
    *(void *)(v9 + 32) = v2;
    *(void *)(v9 + 40) = v4;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    *uint64_t v13 = v9;
  }
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_2592E2A8C()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  *(void *)(v0[13] + 16) = 0;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2592E2B24(uint64_t a1, _OWORD *a2)
{
  *(void *)(v2 + 32) = a1;
  sub_2593095D0();
  *(void *)(v2 + 40) = swift_task_alloc();
  *(void *)(v2 + 48) = type metadata accessor for StoredPhotoProto(0);
  *(void *)(v2 + 56) = swift_task_alloc();
  *(void *)(v2 + 64) = swift_task_alloc();
  *(_OWORD *)(v2 + 72) = *a2;
  return MEMORY[0x270FA2498](sub_2592E2C00, 0, 0);
}

uint64_t sub_2592E2C00()
{
  uint64_t v9 = v0;
  uint64_t v1 = v0[9];
  v0[2] = v1;
  unint64_t v2 = v0[10];
  v0[3] = v2;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  sub_259261DE0(v1, v2);
  sub_2593095C0();
  sub_2592EB048(&qword_26A37E308, (void (*)(uint64_t))type metadata accessor for StoredPhotoProto);
  sub_259309720();
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[4];
  sub_2592EAD50(v0[8], v3, type metadata accessor for StoredPhotoProto);
  LOBYTE(v7[0]) = 2;
  StoredPhoto.init(protobuf:version:)(v3, (unsigned __int8 *)v7, v4);
  sub_2592EABFC(v0[8], type metadata accessor for StoredPhotoProto);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2592E2DD8(uint64_t a1, _OWORD *a2)
{
  *(void *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *a2;
  return MEMORY[0x270FA2498](sub_2592E2E00, 0, 0);
}

uint64_t sub_2592E2E00()
{
  uint64_t v1 = v0[3];
  unint64_t v2 = v0[4];
  uint64_t v3 = v0[2];
  sub_259261DE0(v1, v2);
  sub_2592AA17C(v1, v2, 2, v3);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2592E2E9C(uint64_t a1, _OWORD *a2)
{
  *(void *)(v2 + 32) = a1;
  sub_2593095D0();
  *(void *)(v2 + 40) = swift_task_alloc();
  *(void *)(v2 + 48) = type metadata accessor for FetchByDayResponseProto(0);
  *(void *)(v2 + 56) = swift_task_alloc();
  *(_OWORD *)(v2 + 64) = *a2;
  return MEMORY[0x270FA2498](sub_2592E2F68, 0, 0);
}

uint64_t sub_2592E2F68()
{
  uint64_t v9 = v0;
  uint64_t v1 = v0[8];
  v0[2] = v1;
  unint64_t v2 = v0[9];
  v0[3] = v2;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  sub_259261DE0(v1, v2);
  sub_2593095C0();
  sub_2592EB048(&qword_26A37E2F0, (void (*)(uint64_t))type metadata accessor for FetchByDayResponseProto);
  sub_259309720();
  uint64_t v3 = (unsigned int *)v0[7];
  uint64_t v4 = (void *)v0[4];
  LOBYTE(v7[0]) = 2;
  FetchByDayResponse.init(protobuf:version:)(v3, (unsigned __int8 *)v7, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t PhotosXPCServer.registerSendMessage(callback:)(uint64_t a1, uint64_t a2)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  sub_2592DEC80(0, (uint64_t)&unk_26A37F558, v4, (uint64_t)&unk_27072B8C8, (uint64_t)&unk_26A37F570);
  return swift_release();
}

uint64_t sub_2592E3230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a2;
  v6[4] = a3;
  _OWORD v6[2] = a1;
  sub_259309BD0();
  v6[7] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v8 = sub_259309E90();
  v6[8] = v8;
  v6[9] = v7;
  return MEMORY[0x270FA2498](sub_2592E3354, v8, v7);
}

uint64_t sub_2592E3354()
{
  sub_259261DE0(v0[3], v0[4]);
  sub_259309BC0();
  uint64_t result = sub_259309BB0();
  v0[10] = v2;
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = v2;
    uint64_t v5 = (int *)v0[5];
    sub_259261F50(v0[3], v0[4]);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[11] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_2592E3480;
    return v7(v3, v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2592E3480(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  *(void *)(*(void *)v3 + 96) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_2592E366C;
  }
  else
  {
    swift_bridgeObjectRelease();
    v6[13] = a2;
    v6[14] = a1;
    uint64_t v7 = v6[8];
    uint64_t v8 = v6[9];
    uint64_t v9 = sub_2592E35BC;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_2592E35BC()
{
  uint64_t v1 = (uint64_t *)v0[2];
  uint64_t v2 = sub_2592D8B40(v0[14], v0[13]);
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF30);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2593131D0;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v4;
  *uint64_t v1 = v5;
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2592E366C()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592E36DC()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_2593098B0();
  MEMORY[0x270FA5388](v4 - 8);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (*(void *)(v0 + 32))
  {
    uint64_t v5 = *(void *)(v0 + 32);
LABEL_7:
    swift_retain();
    return v5;
  }
  sub_2593098E0();
  uint64_t v6 = qword_26B2F3920;
  swift_bridgeObjectRetain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_26B2F3918;
  swift_allocObject();
  swift_weakInit();
  id v8 = v7;
  swift_retain();
  sub_2593098A0();
  uint64_t v5 = sub_259309890();
  swift_release();
  if (!v2)
  {
    *(void *)(v3 + 32) = v5;
    swift_retain();
    swift_release();
    goto LABEL_7;
  }
  return v5;
}

uint64_t sub_2592E3918(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_259309980();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = a2 + 16;
  if (qword_26B2F3B60 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_259309860();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B2F32A0);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v10(v7, a1, v4);
  uint64_t v11 = sub_259309840();
  uint64_t v12 = v7;
  os_log_type_t v13 = sub_25930A1B0();
  if (os_log_type_enabled(v11, v13))
  {
    v20[1] = v8;
    unint64_t v21 = v12;
    char v14 = (uint8_t *)swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)char v14 = 138412290;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_2592EB048(&qword_26A37F6B0, MEMORY[0x263F8F408]);
    swift_allocError();
    uint64_t v15 = v21;
    v10(v16, (uint64_t)v21, v4);
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v22 = v17;
    sub_25930A2A0();
    uint64_t v18 = v20[0];
    *(void *)v20[0] = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
    _os_log_impl(&dword_25921A000, v11, v13, "Session Cancelled: %@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E078);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v18, -1, -1);
    MEMORY[0x25A2DBAF0](v14, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(void *)(result + 32) = 0;
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2592E3D04(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 112) = a5;
  *(void *)(v6 + 120) = a6;
  *(unsigned char *)(v6 + 41) = a4;
  *(void *)(v6 + 96) = a2;
  *(void *)(v6 + 104) = a3;
  *(void *)(v6 + 88) = a1;
  return MEMORY[0x270FA2498](sub_2592E3D30, 0, 0);
}

uint64_t sub_2592E3D30()
{
  uint64_t v1 = qword_259317810[*(char *)(v0 + 41)];
  sub_259261DE0(*(void *)(v0 + 112), *(void *)(v0 + 120));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2592E3DE4;
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  return sub_2592E4944(v1, v3, v4, 0);
}

uint64_t sub_2592E3DE4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = *v4;
  uint64_t v6 = *v4;
  uint64_t v7 = *v4;
  *(void *)(v6 + 136) = a1;
  *(void *)(v6 + 144) = a2;
  *(unsigned char *)(v6 + 42) = a3;
  swift_task_dealloc();
  sub_259261F50(*(void *)(v5 + 112), *(void *)(v5 + 120));
  if (v3)
  {
    uint64_t v8 = *(uint64_t (**)(void))(v7 + 8);
    return v8();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2592E3F60, 0, 0);
  }
}

uint64_t sub_2592E3F60()
{
  char v1 = *(unsigned char *)(v0 + 42);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 136);
    unint64_t v2 = *(void *)(v0 + 144);
    sub_25928A790();
    swift_allocError();
    *uint64_t v4 = 0;
    swift_willThrow();
    sub_2592EAED8(v3, v2, v1);
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(unsigned int *)(v0 + 136);
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 32) = 0;
    *(void *)(v0 + 16) = v7;
    *(unsigned char *)(v0 + 40) = 1;
    if (qword_26B2F3930 != -1) {
      swift_once();
    }
    type metadata accessor for CommunicationActor();
    *(void *)(v0 + 152) = sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
    uint64_t v9 = sub_259309E90();
    *(void *)(v0 + 160) = v9;
    *(void *)(v0 + 168) = v8;
    return MEMORY[0x270FA2498](sub_2592E40F8, v9, v8);
  }
}

uint64_t sub_2592E40F8()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[13];
  uint64_t v3 = off_26B2F3928;
  uint64_t v4 = swift_task_alloc();
  v0[22] = v4;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v0 + 2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[23] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F610);
  *uint64_t v5 = v0;
  v5[1] = sub_2592E421C;
  return MEMORY[0x270FA2360](v0 + 6, v3, v1, 0x73656D28646E6573, 0xEE00293A65676173, sub_2592EAEFC, v4, v6);
}

uint64_t sub_2592E421C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_2592E4594;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_2592E4338;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592E4338()
{
  *(_OWORD *)(v0 + 200) = *(_OWORD *)(v0 + 48);
  *(unsigned char *)(v0 + 43) = *(unsigned char *)(v0 + 64);
  return MEMORY[0x270FA2498](sub_2592E4364, 0, 0);
}

uint64_t sub_2592E4364()
{
  switch(*(unsigned char *)(v0 + 43))
  {
    case 1:
      uint64_t v9 = *(void *)(v0 + 200);
      unint64_t v10 = *(void *)(v0 + 208);
      uint64_t v11 = *(int **)(v0 + 88);
      *(void *)(v0 + 72) = v9;
      *(void *)(v0 + 80) = v10;
      sub_259261DE0(v9, v10);
      os_log_type_t v13 = (uint64_t (*)(uint64_t))((char *)v11 + *v11);
      uint64_t v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 216) = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_2592E4664;
      return v13(v0 + 72);
    case 2:
      uint64_t v5 = *(void *)(v0 + 200);
      uint64_t v4 = *(void *)(v0 + 208);
      uint64_t v2 = *(void *)(v0 + 136);
      unint64_t v1 = *(void *)(v0 + 144);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5E0);
      sub_259273278(&qword_26A37F690, &qword_26A37F5E0);
      swift_allocError();
      *uint64_t v6 = v5;
      v6[1] = v4;
      goto LABEL_4;
    case 3:
      sub_2592EAED8(*(void *)(v0 + 136), *(void *)(v0 + 144), 0);
      uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_6;
    default:
      uint64_t v2 = *(void *)(v0 + 136);
      unint64_t v1 = *(void *)(v0 + 144);
      sub_25928A790();
      swift_allocError();
      *uint64_t v3 = 1;
LABEL_4:
      swift_willThrow();
      sub_2592EAED8(v2, v1, 0);
      uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
LABEL_6:
      return v7();
  }
}

uint64_t sub_2592E4594()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2592E45FC, 0, 0);
}

uint64_t sub_2592E45FC()
{
  sub_2592EAED8(v0[17], v0[18], 0);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2592E4664()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592E48A8;
  }
  else {
    uint64_t v2 = sub_2592E4778;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592E4778()
{
  uint64_t v1 = *(void *)(v0 + 200);
  unint64_t v2 = *(void *)(v0 + 208);
  sub_2592EAED8(v1, v2, 1);
  sub_2592EAED8(v1, v2, 1);
  uint64_t v3 = *(unsigned int *)(v0 + 136);
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 16) = v3;
  *(unsigned char *)(v0 + 40) = 1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  *(void *)(v0 + 152) = sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v5 = sub_259309E90();
  *(void *)(v0 + 160) = v5;
  *(void *)(v0 + 168) = v4;
  return MEMORY[0x270FA2498](sub_2592E40F8, v5, v4);
}

uint64_t sub_2592E48A8()
{
  uint64_t v1 = v0[25];
  unint64_t v2 = v0[26];
  uint64_t v4 = v0[17];
  unint64_t v3 = v0[18];
  sub_2592EAED8(v1, v2, 1);
  sub_2592EAED8(v1, v2, 1);
  sub_2592EAED8(v4, v3, 0);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2592E4944(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 72) = v4;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)(v5 + 32) = a3;
  *(unsigned char *)(v5 + 40) = a4 & 1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  *(void *)(v5 + 80) = sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v7 = sub_259309E90();
  *(void *)(v5 + 88) = v7;
  *(void *)(v5 + 96) = v6;
  return MEMORY[0x270FA2498](sub_2592E4A48, v7, v6);
}

uint64_t sub_2592E4A48()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  unint64_t v3 = off_26B2F3928;
  uint64_t v4 = swift_task_alloc();
  v0[13] = v4;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v0 + 2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[14] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F610);
  *uint64_t v5 = v0;
  v5[1] = sub_2592E4B68;
  return MEMORY[0x270FA2360](v0 + 6, v3, v1, 0x73656D28646E6573, 0xEE00293A65676173, sub_2592EAEFC, v4, v6);
}

uint64_t sub_2592E4B68()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 88);
    uint64_t v4 = *(void *)(v2 + 96);
    uint64_t v5 = sub_2592E4CA4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 88);
    uint64_t v4 = *(void *)(v2 + 96);
    uint64_t v5 = sub_2592E4C84;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592E4C84()
{
  return (*(uint64_t (**)(void, void, void))(v0 + 8))(*(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned __int8 *)(v0 + 64));
}

uint64_t sub_2592E4CA4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592E4D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F698);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11);
  void v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  char v18 = a6 & 1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2592E36DC();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v15 + v14, (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F610);
  sub_259273278(&qword_26A37F6A0, &qword_26A37F5D0);
  sub_259273278(&qword_26A37F6A8, &qword_26A37F610);
  sub_2593098C0();
  swift_release();
  return swift_release();
}

uint64_t sub_2592E4FE4(void *a1, unint64_t a2, __int16 a3)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((a3 & 0x100) != 0)
  {
    id v7 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F698);
    return sub_259309EA0();
  }
  else
  {
    sub_2592EB01C((uint64_t)a1, a2, a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F698);
    return sub_259309EB0();
  }
}

uint64_t sub_2592E5140()
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_259309910();
  if (v1 != 1) {
    return sub_259309930();
  }
  swift_retain();
  sub_259309920();
  return swift_release();
}

double sub_2592E52D8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  MEMORY[0x270FA5388](isCurrentExecutor);
  _OWORD v8[2] = a2;
  v8[3] = a1;
  sub_2592EB124((uint64_t)sub_2592EA6F8, (uint64_t)v8);
  *(void *)(a3 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

BOOL sub_2592E5418(uint64_t a1, uint64_t a2)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_2592E554C(a2);
    swift_release();
  }
  return Strong == 0;
}

uint64_t sub_2592E554C(uint64_t a1)
{
  uint64_t v43 = a1;
  uint64_t v1 = sub_2593099B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  MEMORY[0x270FA5388](v6);
  unint64_t v40 = (uint64_t *)((char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  uint64_t v8 = off_26B2F3928;
  type metadata accessor for CommunicationActor();
  uint64_t v9 = sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5D0);
  sub_259273278(&qword_26A37F5D8, &qword_26A37F5D0);
  sub_2593099A0();
  uint64_t v39 = v47;
  if (v50 == 1)
  {
    uint64_t v10 = sub_259309F20();
    uint64_t v11 = (uint64_t)v41;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v41, 1, 1, v10);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))((char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v43, v1);
    unint64_t v12 = (*(unsigned __int8 *)(v2 + 80) + 44) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v8;
    *(void *)(v13 + 24) = v9;
    *(void *)(v13 + 32) = v42;
    *(_DWORD *)(v13 + 40) = v39;
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v13 + v12, (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
    swift_retain();
    swift_retain();
    sub_2592EBE08(v11, (uint64_t)&unk_26A37F5F8, v13);
    swift_release();
  }
  else
  {
    uint64_t v15 = v48;
    unint64_t v14 = v49;
    uint64_t v37 = v48;
    unint64_t v38 = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
    uint64_t v16 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DCA8);
    uint64_t v17 = swift_allocObject();
    *(_DWORD *)(v17 + 24) = 0;
    *(void *)(v17 + 16) = 0;
    sub_259261DE0(v15, v14);
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v19 = sub_2592FE30C(MEMORY[0x263F8EE78]);
    uint64_t v21 = v20;
    uint64_t v22 = sub_2592FE108(v18);
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5B0);
    uint64_t v25 = swift_allocObject();
    *(_DWORD *)(v25 + 64) = 0;
    *(void *)(v25 + 16) = v19;
    *(void *)(v25 + 24) = v21;
    uint64_t v26 = MEMORY[0x263F8EE88];
    *(void *)(v25 + 32) = MEMORY[0x263F8EE88];
    *(void *)(v25 + 40) = v22;
    *(void *)(v25 + 48) = v24;
    *(void *)(v25 + 56) = v26;
    *(void *)(v16 + 16) = v25;
    *(void *)(v16 + 24) = v17;
    uint64_t v27 = v42;
    swift_retain();
    long long v28 = v40;
    sub_2592EF1BC(v16, v40);
    swift_release();
    uint64_t v29 = *(unsigned int *)((char *)v28 + *(int *)(v6 + 32));
    uint64_t v30 = sub_259309F20();
    uint64_t v31 = (uint64_t)v41;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v41, 1, 1, v30);
    unint64_t v32 = off_26B2F3928;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = v32;
    *(void *)(v33 + 24) = v9;
    unint64_t v34 = v38;
    *(void *)(v33 + 32) = v39;
    *(_DWORD *)(v33 + 40) = v29;
    uint64_t v35 = v37;
    *(void *)(v33 + 48) = v27;
    *(void *)(v33 + 56) = v35;
    *(void *)(v33 + 64) = v34;
    *(void *)(v33 + 72) = v16;
    swift_retain();
    sub_259261DE0(v35, v34);
    swift_retain();
    swift_retain();
    sub_2592EBE08(v31, (uint64_t)&unk_26A37F608, v33);
    swift_release();
    uint64_t v44 = v29;
    uint64_t v45 = 0;
    char v46 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F610);
    sub_259273278(&qword_26A37F618, &qword_26A37F610);
    sub_259309990();
    swift_release();
    sub_259261F50(v35, v34);
    sub_25924A3A8((uint64_t)v28, &qword_26A37C990);
  }
  return sub_2592EA904(v47, v48, v49, v50);
}

uint64_t sub_2592E5B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 304) = a8;
  *(void *)(v8 + 312) = v13;
  *(void *)(v8 + 288) = a6;
  *(void *)(v8 + 296) = a7;
  *(_DWORD *)(v8 + 452) = a5;
  *(void *)(v8 + 280) = a4;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  *(void *)(v8 + 320) = type metadata accessor for CommunicationActor();
  *(void *)(v8 + 328) = sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v10 = sub_259309E90();
  *(void *)(v8 + 336) = v10;
  *(void *)(v8 + 344) = v9;
  return MEMORY[0x270FA2498](sub_2592E5C90, v10, v9);
}

uint64_t sub_2592E5C90()
{
  uint64_t v57 = v0;
  XPCRequestType.init(rawValue:)(*(void *)(v0 + 280));
  char v1 = v56[0];
  int v54 = (void *)(v0 + 248);
  if (LOBYTE(v56[0]) == 21)
  {
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_259309860();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B2F32A0);
    uint64_t v3 = sub_259309840();
    os_log_type_t v4 = sub_25930A1B0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      v56[0] = v6;
      *(_DWORD *)uint64_t v5 = 67109378;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(_DWORD *)(v0 + 440) = *(_DWORD *)(v0 + 452);
      sub_25930A2A0();
      *(_WORD *)(v5 + 8) = 2080;
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(void *)(v0 + 272) = *(void *)(v0 + 280);
      uint64_t v7 = sub_259309BE0();
      *(void *)(v0 + 256) = sub_25924FC14(v7, v8, v56);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25921A000, v3, v4, "XPC %u: Invalid message type: %s", (uint8_t *)v5, 0x12u);
      char v9 = 1;
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v6, -1, -1);
      MEMORY[0x25A2DBAF0](v5, -1, -1);
    }
    else
    {

      char v9 = 1;
    }
    goto LABEL_30;
  }
  uint64_t v10 = *(void *)(v0 + 288);
  swift_beginAccess();
  uint64_t v11 = *(void *)(v10 + 40);
  if (!*(void *)(v11 + 16) || (unint64_t v12 = sub_25925E5F8(v56[0]), (v13 & 1) == 0))
  {
    swift_endAccess();
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_259309860();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B2F32A0);
    uint64_t v25 = sub_259309840();
    os_log_type_t v26 = sub_25930A1B0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v56[0] = v52;
      *(_DWORD *)uint64_t v27 = 67109378;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(_DWORD *)(v0 + 444) = *(_DWORD *)(v0 + 452);
      sub_25930A2A0();
      *(_WORD *)(v27 + 8) = 2080;
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(unsigned char *)(v0 + 457) = v1;
      uint64_t v28 = sub_259309BE0();
      *(void *)(v0 + 224) = sub_25924FC14(v28, v29, v56);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25921A000, v25, v26, "XPC %u: Couldn't find a registry for type: %s", (uint8_t *)v27, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v52, -1, -1);
      MEMORY[0x25A2DBAF0](v27, -1, -1);
    }

    char v9 = 2;
LABEL_30:
    sub_2592EAA68();
    uint64_t v30 = (void *)swift_allocError();
    char *v31 = v9;
    swift_willThrow();
    unint64_t v32 = (os_unfair_lock_s *)(*(void *)(*(void *)(v0 + 312) + 16) + 64);
    id v33 = v30;
    os_unfair_lock_lock(v32);
    uint64_t v34 = sub_2592EE260(v30);
    uint64_t v36 = v35;
    os_unfair_lock_unlock(v32);
    if (!v34)
    {
LABEL_48:

      uint64_t v48 = *(uint64_t (**)(void))(v0 + 8);
      return v48();
    }
    uint64_t v53 = v0;
    uint64_t v37 = *(void *)(v34 + 16);
    if (v37)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)(v34 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v39 = *(void *)(v36 + 16);
      if (v39) {
        goto LABEL_37;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = *(void *)(v36 + 16);
      if (v39)
      {
LABEL_37:
        id v40 = v30;
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)(v36 + 8 * j + 32))
          {
            *int v54 = v30;
            id v44 = v30;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
            uint64_t v45 = sub_25930A770();
            if (v45)
            {
              uint64_t v42 = v45;
            }
            else
            {
              uint64_t v42 = swift_allocError();
              *char v46 = *v54;
            }
            swift_allocError();
            uint64_t *v43 = v42;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_47;
      }
    }
    id v47 = v30;
LABEL_47:
    sub_2592435BC(v34);

    swift_bridgeObjectRelease();
    uint64_t v0 = v53;
    goto LABEL_48;
  }
  uint64_t v14 = *(void *)(v11 + 56) + 16 * v12;
  uint64_t v15 = *(int **)v14;
  *(void *)(v0 + 352) = *(void *)(v14 + 8);
  swift_endAccess();
  uint64_t v16 = qword_26B2F3B60;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_259309860();
  *(void *)(v0 + 360) = __swift_project_value_buffer(v17, (uint64_t)qword_26B2F32A0);
  uint64_t v18 = sub_259309840();
  os_log_type_t v19 = sub_25930A1A0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v51 = v15;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    v56[0] = v21;
    *(_DWORD *)uint64_t v20 = 67109378;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(_DWORD *)(v0 + 448) = *(_DWORD *)(v0 + 452);
    sub_25930A2A0();
    *(_WORD *)(v20 + 8) = 2080;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(unsigned char *)(v0 + 456) = v1;
    uint64_t v22 = sub_259309BE0();
    *(void *)(v0 + 240) = sub_25924FC14(v22, v23, v56);
    sub_25930A2A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25921A000, v18, v19, "XPC %u: Starting to process request %s", (uint8_t *)v20, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v21, -1, -1);
    MEMORY[0x25A2DBAF0](v20, -1, -1);

    uint64_t v15 = v51;
  }
  else
  {
  }
  *(_OWORD *)(v0 + 192) = *(_OWORD *)(v0 + 296);
  uint64_t v55 = (uint64_t (*)(uint64_t, uint64_t))((char *)v15 + *v15);
  char v50 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v50;
  *char v50 = v0;
  v50[1] = sub_2592E661C;
  return v55(v0 + 16, v0 + 192);
}

uint64_t sub_2592E661C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_2592E6948;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_2592E6738;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592E6738()
{
  v0[29] = 0;
  uint64_t v1 = v0[5];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[10] = swift_getAssociatedTypeWitness();
  v0[11] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  sub_259309F80();
  swift_task_dealloc();
  swift_beginAccess();
  uint64_t v5 = v0[41];
  uint64_t v6 = off_26B2F3928;
  uint64_t v7 = v0[10];
  uint64_t v8 = v0[11];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v7);
  char v9 = (void *)swift_task_alloc();
  v0[48] = v9;
  void *v9 = v0;
  v9[1] = sub_2592E6B74;
  return MEMORY[0x270FA1E88](v0 + 18, v6, v5, v0 + 33, v7, v8);
}

uint64_t sub_2592E6948()
{
  swift_release();
  uint64_t v1 = (void *)v0[47];
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(v0[39] + 16) + 64);
  id v3 = v1;
  os_unfair_lock_lock(v2);
  uint64_t v4 = sub_2592EE260(v1);
  uint64_t v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v4 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        uint64_t v21 = v0;
        uint64_t v10 = v0 + 31;
        id v11 = v1;
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)(v6 + 8 * j + 32))
          {
            *uint64_t v10 = v1;
            id v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
            uint64_t v17 = sub_25930A770();
            if (v17)
            {
              uint64_t v13 = v17;
            }
            else
            {
              uint64_t v13 = swift_allocError();
              *uint64_t v14 = *v10;
            }
            swift_allocError();
            uint64_t *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v0 = v21;
        goto LABEL_18;
      }
    }
    id v18 = v1;
LABEL_18:
    sub_2592435BC(v4);

    swift_bridgeObjectRelease();
  }

  os_log_type_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_2592E6B74()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 336);
  uint64_t v4 = *(void *)(v2 + 344);
  if (v0) {
    uint64_t v5 = sub_2592E6EA0;
  }
  else {
    uint64_t v5 = sub_2592E6C88;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592E6C88()
{
  unint64_t v1 = *(void *)(v0 + 152);
  *(void *)(v0 + 400) = *(void *)(v0 + 144);
  *(void *)(v0 + 408) = v1;
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = *(void *)(v0 + 312);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    sub_259306264(0, *(os_unfair_lock_s **)(v2 + 16));
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  else
  {
    uint64_t v5 = (void *)(v0 + 232);
    uint64_t v6 = sub_259309840();
    os_log_type_t v7 = sub_25930A1A0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 67109376;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(_DWORD *)(v8 + 4) = *(_DWORD *)(v0 + 452);
      *(_WORD *)(v8 + 8) = 2048;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(void *)(v8 + 10) = *v5;
      _os_log_impl(&dword_25921A000, v6, v7, "XPC %u: Enqueuing message %ld", (uint8_t *)v8, 0x12u);
      MEMORY[0x25A2DBAF0](v8, -1, -1);
    }

    if (__OFADD__(*v5, 1))
    {
      __break(1u);
    }
    else
    {
      *(void *)(v0 + 232) = *v5 + 1;
      uint64_t v9 = sub_2592E70D8;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    return MEMORY[0x270FA2498](v9, v10, v11);
  }
}

uint64_t sub_2592E6EA0()
{
  unint64_t v1 = (void *)v0[33];
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(v0[39] + 16) + 64);
  id v3 = v1;
  os_unfair_lock_lock(v2);
  uint64_t v4 = sub_2592EE260(v1);
  uint64_t v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v4 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        uint64_t v21 = v0;
        uint64_t v10 = v0 + 31;
        id v11 = v1;
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)(v6 + 8 * j + 32))
          {
            *uint64_t v10 = v1;
            id v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
            uint64_t v17 = sub_25930A770();
            if (v17)
            {
              uint64_t v13 = v17;
            }
            else
            {
              uint64_t v13 = swift_allocError();
              *uint64_t v14 = *v10;
            }
            swift_allocError();
            uint64_t *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v0 = v21;
        goto LABEL_18;
      }
    }
    id v18 = v1;
LABEL_18:
    sub_2592435BC(v4);

    swift_bridgeObjectRelease();
  }

  os_log_type_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_2592E70D8()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  *(_OWORD *)(v0 + 160) = *(_OWORD *)(v0 + 400);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  uint64_t v4 = *(void *)(v2 + 48);
  if (v4 < 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
  }
  else
  {
    if (!*(void *)(v4 + 16))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
LABEL_15:
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
      uint64_t v20 = *(void *)(v3 + 16);
      *(void *)(v3 + 16) = v20 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
      uint64_t v21 = (void *)swift_task_alloc();
      *(void *)(v0 + 416) = v21;
      void v21[2] = v2;
      v21[3] = v3;
      v21[4] = v0 + 160;
      v21[5] = v20;
      uint64_t v22 = (void *)swift_task_alloc();
      *(void *)(v0 + 424) = v22;
      _OWORD v22[2] = v2;
      void v22[3] = v3;
      v22[4] = v20;
      unint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 432) = v23;
      *unint64_t v23 = v0;
      v23[1] = sub_2592E7374;
      return MEMORY[0x270FA2338](v23, &unk_26A37F638);
    }
    uint64_t v5 = *(void *)(v2 + 16);
    uint64_t v6 = *(void *)(v2 + 24);
    uint64_t v8 = *(void *)(v2 + 32);
    uint64_t v7 = *(void *)(v2 + 40);
    uint64_t v9 = *(void *)(v2 + 56);
    *(void *)(v0 + 208) = v7;
    *(void *)(v0 + 216) = v4;
    if (v7)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(v0 + 392);
      uint64_t result = sub_259305E1C(v7 + 16, v7 + 32, v4, 0);
      if (v11) {
        return result;
      }
      uint64_t v15 = result;
      uint64_t v9 = v10;
    }
    else
    {
      uint64_t v15 = 0;
    }
    sub_259300FCC(0, v15);
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v19 = *(void *)(v0 + 216);
    *(void *)(v2 + 16) = v5;
    *(void *)(v2 + 24) = v6;
    *(void *)(v2 + 32) = v8;
    *(void *)(v2 + 40) = v18;
    *(void *)(v2 + 48) = v19;
    *(void *)(v2 + 56) = v9;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
    if (v17)
    {
      if (v17 == 1) {
        goto LABEL_15;
      }
      uint64_t v24 = *(void *)(v0 + 160);
      unint64_t v25 = *(void *)(v0 + 168);
      *(void *)(v0 + 176) = v24;
      *(void *)(v0 + 184) = v25;
      sub_259261DE0(v24, v25);
      sub_2592EAABC(v0 + 176, *(void *)(*(void *)(v17 + 64) + 40));
      swift_continuation_throwingResume();
    }
  }
  uint64_t v13 = *(void *)(v0 + 336);
  uint64_t v14 = *(void *)(v0 + 344);
  return MEMORY[0x270FA2498](sub_2592E74C0, v13, v14);
}

uint64_t sub_2592E7374()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2592E74A8, 0, 0);
}

uint64_t sub_2592E74A8()
{
  return MEMORY[0x270FA2498](sub_2592E74C0, *(void *)(v0 + 336), *(void *)(v0 + 344));
}

uint64_t sub_2592E74C0()
{
  sub_259277DC4(v0[50], v0[51]);
  uint64_t v1 = v0[41];
  uint64_t v2 = off_26B2F3928;
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[11];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[48] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2592E6B74;
  return MEMORY[0x270FA1E88](v0 + 18, v2, v1, v0 + 33, v3, v4);
}

uint64_t sub_2592E75B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  *(_DWORD *)(v6 + 84) = a5;
  *(void *)(v6 + 144) = a4;
  *(void *)(v6 + 152) = a6;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  *(void *)(v6 + 160) = type metadata accessor for CommunicationActor();
  *(void *)(v6 + 168) = sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v8 = sub_259309E90();
  *(void *)(v6 + 176) = v8;
  *(void *)(v6 + 184) = v7;
  return MEMORY[0x270FA2498](sub_2592E76B4, v8, v7);
}

uint64_t sub_2592E76B4()
{
  uint64_t v1 = *(void *)(v0 + 144);
  unsigned int v2 = *(_DWORD *)(v0 + 84);
  swift_retain();
  uint64_t v3 = sub_2592EF678(v2);
  swift_release();
  if (qword_26B2F3B60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_259309860();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B2F32A0);
  uint64_t v5 = sub_259309840();
  os_log_type_t v6 = sub_25930A1A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109376;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(_DWORD *)(v0 + 60) = *(_DWORD *)(v0 + 84);
    sub_25930A2A0();
    *(_WORD *)(v7 + 8) = 2048;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(void *)(v0 + 136) = v3;
    sub_25930A2A0();
    _os_log_impl(&dword_25921A000, v5, v6, "XPC %u: Reading message %ld", (uint8_t *)v7, 0x12u);
    MEMORY[0x25A2DBAF0](v7, -1, -1);
  }

  *(void *)(v0 + 192) = *(void *)(v1 + 48);
  uint64_t v11 = (uint64_t (*)(uint64_t, int))((char *)&dword_26A37F898 + dword_26A37F898);
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2592E794C;
  int v9 = *(_DWORD *)(v0 + 84);
  return v11(v0 + 112, v9);
}

uint64_t sub_2592E794C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 176);
    uint64_t v4 = *(void *)(v2 + 184);
    uint64_t v5 = sub_2592E7BA8;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 176);
    uint64_t v4 = *(void *)(v2 + 184);
    uint64_t v5 = sub_2592E7A68;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592E7A68()
{
  unint64_t v1 = *(void *)(v0 + 120);
  if (v1 >> 60 == 15)
  {
    *(void *)(v0 + 40) = 0;
    *(void *)(v0 + 48) = 0;
    *(unsigned char *)(v0 + 56) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F610);
    sub_259273278(&qword_26A37F618, &qword_26A37F610);
    sub_259309990();
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 112);
    *(void *)(v0 + 64) = v2;
    *(void *)(v0 + 72) = v1;
    *(unsigned char *)(v0 + 80) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F610);
    sub_259273278(&qword_26A37F618, &qword_26A37F610);
    sub_259309990();
    sub_259277DC4(v2, v1);
  }
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2592E7BA8()
{
  unint64_t v1 = *(void **)(v0 + 208);
  swift_release();
  swift_getErrorValue();
  sub_25930A780();
  *(void *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 0xE000000000000000;
  *(unsigned char *)(v0 + 104) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F610);
  sub_259273278(&qword_26A37F618, &qword_26A37F610);
  sub_259309990();

  swift_bridgeObjectRelease();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2592E7CC8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_259309C90();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25A2DA4E0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_2592E7D44(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)unint64_t v1 = xmmword_259314C30;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_2593091E0() && __OFSUB__((int)v4, sub_259309210())) {
        goto LABEL_24;
      }
      sub_259309220();
      swift_allocObject();
      uint64_t v13 = sub_2593091C0();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_2592E8130((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_259309310();
      uint64_t result = sub_2592E8130(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *unint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *unint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *unint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_2592E8048@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_2592C71CC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_2592E89D4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_2592E8A50((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_2592E80C0(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_2592E8130(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_2593091E0();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_259309210();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_259309200();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_2592E81E8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25930A3F0();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2592E8274(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  char v12 = *a4;
  uint64_t v13 = swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *(void *)uint64_t v13 = v6;
  *(void *)(v13 + 8) = sub_25921D238;
  *(void *)(v13 + 112) = a5;
  *(void *)(v13 + 120) = a6;
  *(unsigned char *)(v13 + 41) = v12;
  *(void *)(v13 + 96) = a2;
  *(void *)(v13 + 104) = a3;
  *(void *)(v13 + 88) = a1;
  return MEMORY[0x270FA2498](sub_2592E3D30, 0, 0);
}

uint64_t sub_2592E8350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = *a4;
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  void *v17 = v8;
  v17[1] = sub_2592438A0;
  return sub_2592E5B84(a1, a2, a3, v16, a5, a6, a7, a8);
}

uint64_t sub_2592E8448(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = a4;
  *(void *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *a2;
  return MEMORY[0x270FA2498](sub_2592E8474, 0, 0);
}

uint64_t sub_2592E8474()
{
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v1 = *(int **)(v0 + 24);
  *(unsigned char *)(v0 + 72) = 2;
  *(void *)(v2 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  *(void *)(v2 + 32) = sub_259273278(&qword_26A37E620, &qword_26A37E618);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v1 + *v1);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *char v3 = v0;
  v3[1] = sub_2592E85A8;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 16);
  return v8(v6, v4, v5, v0 + 72);
}

uint64_t sub_2592E85A8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2592E86DC, 0, 0);
  }
  else
  {
    char v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2592E86DC()
{
  __swift_deallocate_boxed_opaque_existential_1(*(void *)(v0 + 16));
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592E8740(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = a4;
  *(void *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 40) = *a2;
  return MEMORY[0x270FA2498](sub_2592E876C, 0, 0);
}

uint64_t sub_2592E876C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v1 = *(int **)(v0 + 24);
  *(unsigned char *)(v0 + 72) = 2;
  *(void *)(v2 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F578);
  *(void *)(v2 + 32) = sub_259273278(&qword_26A37F580, &qword_26A37F578);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v1 + *v1);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2592E88A0;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 16);
  return v8(v6, v4, v5, v0 + 72);
}

uint64_t sub_2592E88A0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2592EB0D8, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2592E89D4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_259309220();
  swift_allocObject();
  uint64_t result = sub_2593091D0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_259309330();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2592E8A50(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_259309220();
  swift_allocObject();
  uint64_t result = sub_2593091D0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_2592E8AD4(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_2592C71CC(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_2592E89D4((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_2592E8A50((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_2592E8B38(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_259309220();
      swift_allocObject();
      sub_2593091F0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_259309330();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_2592E8BD8(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F6B8);
  uint64_t v10 = sub_259273278(&qword_26A37F6C0, &qword_26A37F6B8);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_2592E8048(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

uint64_t sub_2592E8C98(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_259309440();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2593095D0();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = type metadata accessor for GenericListProto(0);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a1;
  unint64_t v29 = a2;
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  sub_259261DE0(a1, a2);
  sub_2593095C0();
  sub_2592EB048((unint64_t *)&qword_26A37E958, (void (*)(uint64_t))type metadata accessor for GenericListProto);
  sub_259309720();
  if (v2)
  {
    sub_259261F50(a1, a2);
  }
  else
  {
    uint64_t v30 = v5;
    uint64_t v13 = *(void *)v12;
    int64_t v14 = *(void *)(*(void *)v12 + 16);
    if (v14)
    {
      uint64_t v22 = v12;
      uint64_t v23 = a1;
      unint64_t v24 = a2;
      *(void *)&long long v25 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25925CBB8(0, v14, 0);
      uint64_t v10 = v25;
      uint64_t v21 = v13;
      uint64_t v15 = (unint64_t *)(v13 + 40);
      do
      {
        uint64_t v16 = *(v15 - 1);
        unint64_t v17 = *v15;
        sub_259261DE0(v16, *v15);
        sub_259261DE0(v16, v17);
        UUID.init(serialized:version:)(v16, v17);
        sub_259261F50(v16, v17);
        *(void *)&long long v25 = v10;
        unint64_t v19 = *(void *)(v10 + 16);
        unint64_t v18 = *(void *)(v10 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_25925CBB8(v18 > 1, v19 + 1, 1);
          uint64_t v10 = v25;
        }
        v15 += 2;
        *(void *)(v10 + 16) = v19 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v19, v8, v30);
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
      sub_259261F50(v23, v24);
      char v12 = v22;
    }
    else
    {
      sub_259261F50(a1, a2);
      uint64_t v10 = MEMORY[0x263F8EE78];
    }
    sub_2592EABFC((uint64_t)v12, type metadata accessor for GenericListProto);
  }
  return v10;
}

uint64_t sub_2592E9030(uint64_t result, char a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 16);
  if (!v3) {
    return result;
  }
  uint64_t v6 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  uint64_t v28 = a3;
  while (1)
  {
    uint64_t v8 = *(v6 - 1);
    uint64_t v9 = *v6;
    uint64_t v10 = (void *)*a3;
    unint64_t v11 = sub_25925E3F4(v8);
    uint64_t v13 = v10[2];
    BOOL v14 = (v12 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      break;
    }
    unint64_t v16 = v11;
    char v17 = v12;
    uint64_t v18 = v10[3];
    swift_bridgeObjectRetain();
    if (v18 >= v15)
    {
      if (a2)
      {
        uint64_t v21 = (void *)*a3;
        if (v17) {
          goto LABEL_12;
        }
      }
      else
      {
        sub_259295118();
        uint64_t v21 = (void *)*a3;
        if (v17) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      sub_259293EC8(v15, a2 & 1);
      unint64_t v19 = sub_25925E3F4(v8);
      if ((v17 & 1) != (v20 & 1)) {
        goto LABEL_23;
      }
      unint64_t v16 = v19;
      uint64_t v21 = (void *)*a3;
      if (v17)
      {
LABEL_12:
        uint64_t v22 = *(void *)(v21[7] + 8 * v16);
        uint64_t v23 = qword_26B2F3930;
        swift_bridgeObjectRetain();
        if (v23 != -1) {
          swift_once();
        }
        type metadata accessor for CommunicationActor();
        sub_2592EB048((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
        sub_259309E90();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_25925C508(v9);
        uint64_t v7 = v21[7];
        swift_bridgeObjectRelease();
        *(void *)(v7 + 8 * v16) = v22;
        goto LABEL_4;
      }
    }
    v21[(v16 >> 6) + 8] |= 1 << v16;
    uint64_t v24 = 8 * v16;
    *(void *)(v21[6] + v24) = v8;
    *(void *)(v21[7] + v24) = v9;
    uint64_t v25 = v21[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_22;
    }
    void v21[2] = v27;
LABEL_4:
    v6 += 2;
    a2 = 1;
    --v3;
    a3 = v28;
    if (!v3) {
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  uint64_t result = sub_25930A830();
  __break(1u);
  return result;
}

uint64_t sub_2592E92A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592E92D8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v10 = v4[2];
  uint64_t v11 = v4[3];
  uint64_t v13 = v4[4];
  uint64_t v12 = v4[5];
  BOOL v14 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v14;
  *BOOL v14 = v5;
  v14[1] = sub_2592438A0;
  return sub_2592DE4CC(a1, a2, a3, a4, v13, v12, v10, v11);
}

uint64_t sub_2592E93B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592E93F0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v10 = *(void *)(v4 + 24);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v12;
  *uint64_t v12 = v5;
  v12[1] = sub_2592438A0;
  return sub_2592DEF68(a1, a2, a3, a4, v11, v10);
}

uint64_t sub_2592E94BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592E94F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = v4[2];
  uint64_t v10 = v4[3];
  uint64_t v12 = v4[6];
  uint64_t v11 = v4[7];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v13;
  *uint64_t v13 = v5;
  v13[1] = sub_2592438A0;
  return sub_2592E006C(a1, a2, a3, a4, v12, v11, v9, v10);
}

uint64_t sub_2592E95E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v10 = *(void *)(v4 + 24);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v12;
  *uint64_t v12 = v5;
  v12[1] = sub_2592438A0;
  return sub_2592E09BC(a1, a2, a3, a4, v11, v10);
}

uint64_t sub_2592E96B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = v4[2];
  uint64_t v11 = v4[3];
  uint64_t v13 = v4[4];
  uint64_t v12 = v4[5];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_2592438A0;
  return sub_2592E0FF8(a1, a2, a3, a4, v13, v12, v10, v11);
}

uint64_t sub_2592E9794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = v4[2];
  uint64_t v11 = v4[3];
  uint64_t v13 = v4[4];
  uint64_t v12 = v4[5];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_25921D238;
  return sub_2592E15F8(a1, a2, a3, a4, v13, v12, v10, v11);
}

uint64_t sub_2592E9874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v10 = *(void *)(v4 + 24);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v12;
  *uint64_t v12 = v5;
  v12[1] = sub_2592438A0;
  return sub_2592E1EA0(a1, a2, a3, a4, v11, v10);
}

uint64_t sub_2592E9940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = v4[2];
  uint64_t v11 = v4[3];
  uint64_t v13 = v4[4];
  uint64_t v12 = v4[5];
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_2592438A0;
  return sub_2592E2558(a1, a2, a3, a4, v13, v12, v10, v11);
}

uint64_t sub_2592E9A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v10 = *(void *)(v4 + 24);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v12;
  *uint64_t v12 = v5;
  v12[1] = sub_2592438A0;
  return sub_2592E3230(a1, a2, a3, a4, v11, v10);
}

unint64_t sub_2592E9AF0()
{
  unint64_t result = qword_26B2F35B0;
  if (!qword_26B2F35B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2F35B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for XPCRequestType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for XPCRequestType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *unint64_t result = a2 + 20;
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
        JUMPOUT(0x2592E9CA0);
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
          *unint64_t result = a2 + 20;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCRequestType()
{
  return &type metadata for XPCRequestType;
}

uint64_t type metadata accessor for PhotosXPCServer()
{
  return self;
}

uint64_t method lookup function for PhotosXPCServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosXPCServer);
}

uint64_t dispatch thunk of PhotosXPCServer.__allocating_init(messageCenter:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for PhotosXPCClient()
{
  return self;
}

uint64_t method lookup function for PhotosXPCClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhotosXPCClient);
}

uint64_t dispatch thunk of PhotosXPCClient.__allocating_init(messageCenter:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2592E9D78()
{
  return sub_259273278(&qword_26A37E708, &qword_26A37E6F0);
}

uint64_t sub_2592E9DB4()
{
  return sub_259273278(&qword_26A37E6A8, &qword_26A37E6A0);
}

uint64_t sub_2592E9DF0()
{
  return sub_259273278(&qword_26A37E6A8, &qword_26A37E6A0);
}

uint64_t sub_2592E9E2C(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v35 = sub_259309440();
  uint64_t v2 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  unsigned int v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for GenericListProto(0);
  MEMORY[0x270FA5388](v31);
  uint64_t v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (v7)
  {
    uint64_t v45 = MEMORY[0x263F8EE78];
    sub_25925CE14(0, v7, 0);
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v9 = v2 + 16;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
    uint64_t v32 = *(void *)(v9 + 56);
    id v33 = v10;
    uint64_t v12 = (void (**)(char *, uint64_t))(v9 - 8);
    uint64_t v34 = v9;
    do
    {
      uint64_t v13 = v35;
      v33(v4, v11, v35);
      uint64_t v36 = sub_259309420();
      char v37 = v14;
      char v38 = v15;
      char v39 = v16;
      char v40 = v17;
      char v41 = v18;
      char v42 = v19;
      char v43 = v20;
      char v44 = v21;
      sub_259309420();
      sub_259309220();
      swift_allocObject();
      uint64_t v22 = sub_2593091D0();
      (*v12)(v4, v13);
      uint64_t v8 = v45;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_25925CE14(0, *(void *)(v8 + 16) + 1, 1);
        uint64_t v8 = v45;
      }
      unint64_t v24 = *(void *)(v8 + 16);
      unint64_t v23 = *(void *)(v8 + 24);
      if (v24 >= v23 >> 1)
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_25925CE14(v23 > 1, v24 + 1, 1);
        uint64_t v8 = v45;
      }
      *(void *)(v8 + 16) = v24 + 1;
      unint64_t v25 = v8 + 16 * v24;
      *(void *)(v25 + 32) = 0x1000000000;
      *(void *)(v25 + 40) = v22 | 0x4000000000000000;
      v11 += v32;
      --v7;
    }
    while (v7);
  }
  MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  *(&v29 - 2) = v8;
  sub_2592EB048((unint64_t *)&qword_26A37E958, (void (*)(uint64_t))type metadata accessor for GenericListProto);
  uint64_t v26 = (uint64_t)v30;
  sub_259309750();
  swift_bridgeObjectRelease();
  uint64_t v27 = sub_259309710();
  sub_2592EABFC(v26, type metadata accessor for GenericListProto);
  return v27;
}

uint64_t sub_2592EA210(void *a1)
{
  return sub_2592C6ED0(a1, *(void *)(v1 + 16));
}

uint64_t sub_2592EA22C(uint64_t a1, _OWORD *a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_2592438A0;
  uint64_t v9 = (uint64_t (*)(uint64_t, _OWORD *, uint64_t, uint64_t))((char *)&dword_26A37F568 + dword_26A37F568);
  return v9(a1, a2, v7, v6);
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x25A2DBAF0);
  }
  return result;
}

uint64_t sub_2592EA348(uint64_t a1, _OWORD *a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_2592438A0;
  uint64_t v9 = (uint64_t (*)(uint64_t, _OWORD *, uint64_t, uint64_t))((char *)&dword_26A37F590 + dword_26A37F590);
  return v9(a1, a2, v7, v6);
}

uint64_t sub_2592EA410()
{
  swift_release();
  sub_259261F50(*(void *)(v0 + 32), *(void *)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_2592EA450(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = *(void *)(v2 + 32);
  uint64_t v9 = *(void *)(v2 + 40);
  char v10 = *(unsigned char *)(v2 + 48);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  void *v11 = v3;
  v11[1] = sub_2592438A0;
  return sub_2592DF2C0(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_2592EA528(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_2592438A0;
  return sub_2592F3474(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2592EA5F0()
{
  return swift_deallocObject();
}

uint64_t sub_2592EA600(uint64_t a1, uint64_t *a2)
{
  char v6 = *(unsigned char *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2592438A0;
  return sub_2592DEA60(a1, a2, v6);
}

uint64_t sub_2592EA6B0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2592EA6E8()
{
  return sub_2592E5140();
}

double sub_2592EA6F0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2592E52D8(a1, v2, a2);
}

BOOL sub_2592EA6F8@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_2592E5418(*(void *)(v1 + 16), *(void *)(v1 + 24));
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_2592EA72C()
{
  uint64_t v1 = sub_2593099B0();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 44) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2592EA800(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2593099B0() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + 32);
  int v8 = *(_DWORD *)(v1 + 40);
  uint64_t v9 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 44) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  char v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *char v10 = v2;
  v10[1] = sub_25921D238;
  return sub_2592E75B8(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_2592EA904(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return sub_259261F50(a2, a3);
  }
  return result;
}

uint64_t sub_2592EA918()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_259261F50(*(void *)(v0 + 56), *(void *)(v0 + 64));
  swift_release();
  return swift_deallocObject();
}

void sub_2592EA968()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2592438A0;
  uint64_t v2 = (char *)&dword_26A37F600 + dword_26A37F600;
  __asm { BR              X9; sub_2592E8350 }
}

unint64_t sub_2592EAA68()
{
  unint64_t result = qword_26A37F628;
  if (!qword_26A37F628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37F628);
  }
  return result;
}

uint64_t sub_2592EAABC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2592EAB24(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = (_OWORD *)v1[4];
  uint64_t v6 = v1[5];
  int v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int v8 = v2;
  v8[1] = sub_2592438A0;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))((char *)&dword_26A37F830 + dword_26A37F830);
  return v9(a1, v4, v5, v7, v6);
}

void sub_2592EABF0()
{
  sub_2592EEC18(*(os_unfair_lock_s **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_2592EABFC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2592EAC5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_2592EACC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = sub_2592E80C0((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_2592EAD30, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_2592EAD30@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2592E81E8(a1, a2);
}

uint64_t sub_2592EAD50(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2592EADB8()
{
  swift_release();
  sub_259261F50(*(void *)(v0 + 32), *(void *)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_2592EADF8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = (char *)(v2 + 3);
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_2592438A0;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))((char *)&dword_26A37F668
                                                                                    + dword_26A37F668);
  return v11(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_2592EAED8(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 2) {
    return swift_bridgeObjectRelease();
  }
  if (a3 == 1) {
    return sub_259261F50(result, a2);
  }
  return result;
}

uint64_t sub_2592EAF00()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F698);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2592EAF94(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F698);
  uint64_t v2 = *(void **)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  __int16 v4 = *(unsigned __int8 *)(a1 + 16) | (*(unsigned __int8 *)(a1 + 17) << 8);
  return sub_2592E4FE4(v2, v3, v4);
}

uint64_t sub_2592EB01C(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 2) {
    return swift_bridgeObjectRetain();
  }
  if (a3 == 1) {
    return sub_259261DE0(result, a2);
  }
  return result;
}

uint64_t sub_2592EB040(uint64_t a1)
{
  return sub_2592E3918(a1, v1);
}

uint64_t sub_2592EB048(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2592EB090(uint64_t a1)
{
  return sub_2592E4D08(a1, *(void *)(v1 + 16), **(void **)(v1 + 24), *(void *)(*(void *)(v1 + 24) + 8), *(void *)(*(void *)(v1 + 24) + 16), *(unsigned char *)(*(void *)(v1 + 24) + 24));
}

unint64_t static XPCConstants.serviceName.getter()
{
  return 0xD000000000000014;
}

unint64_t static XPCConstants.entitlementName.getter()
{
  return 0xD000000000000014;
}

ValueMetadata *type metadata accessor for XPCConstants()
{
  return &type metadata for XPCConstants;
}

uint64_t sub_2592EB124(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2593099E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)*((void *)off_26B2F3928 + 2);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F0E0], v5);
  id v10 = v9;
  LOBYTE(v9) = sub_2593099F0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if (v9)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a1;
    *(void *)(v12 + 24) = a2;
    uint64_t v13 = swift_retain();
    sub_2592EBDBC(&v16);
    swift_release();
    if (v2)
    {
      swift_release();
      return v13;
    }
    uint64_t v13 = v16;
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return v13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2592EB304(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2593099E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)*((void *)off_26B2F3928 + 2);
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F0E0], v5);
  id v10 = v9;
  LOBYTE(v9) = sub_2593099F0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  swift_retain();
  sub_2592EBB14();
  swift_release();
  if (v2) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    goto LABEL_9;
  }
  return result;
}

uint64_t XPCEventStream.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  if (qword_26B2F3920 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B2F3918;
  v4[4] = sub_2592EB930;
  v4[5] = v0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  v4[2] = sub_2592EBA04;
  v4[3] = &block_descriptor;
  uint64_t v2 = _Block_copy(v4);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v2);
  _Block_release(v2);
  return v0;
}

uint64_t XPCEventStream.init()()
{
  if (qword_26B2F3920 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26B2F3918;
  v4[4] = sub_2592EB930;
  v4[5] = v0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  v4[2] = sub_2592EBA04;
  v4[3] = &block_descriptor_4;
  uint64_t v2 = _Block_copy(v4);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v2);
  _Block_release(v2);
  return v0;
}

void sub_2592EB6EC(void *a1, uint64_t a2)
{
  __int16 v4 = (const char *)sub_259309880();
  if (xpc_dictionary_get_string(a1, v4))
  {
    uint64_t v5 = sub_259309C30();
    uint64_t v7 = v6;
    MEMORY[0x270FA5388](v5);
    v16[2] = a2;
    void v16[3] = v8;
    v16[4] = v7;
    sub_2592EB304((uint64_t)sub_2592EBAE4, (uint64_t)v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_259309860();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B2F32A0);
    swift_unknownObjectRetain_n();
    id v10 = sub_259309840();
    os_log_type_t v11 = sub_25930A1B0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v17 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_259309BE0();
      v16[8] = sub_25924FC14(v14, v15, &v17);
      sub_25930A2A0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25921A000, v10, v11, "Unknown name for field: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v13, -1, -1);
      MEMORY[0x25A2DBAF0](v12, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

void sub_2592EB930(void *a1)
{
  sub_2592EB6EC(a1, v1);
}

void sub_2592EB938(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_2592EBB3C(a2, a3);
}

uint64_t sub_2592EBA04(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
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

uint64_t XPCEventStream.deinit()
{
  return v0;
}

uint64_t XPCEventStream.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCEventStream()
{
  return self;
}

uint64_t method lookup function for XPCEventStream(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCEventStream);
}

uint64_t dispatch thunk of XPCEventStream.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void sub_2592EBAE4()
{
  sub_2592EB938(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_2592EBB04()
{
  return swift_deallocObject();
}

uint64_t sub_2592EBB14()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_2592EBB3C(uint64_t a1, unint64_t a2)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_2592C89A4();
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_26B2F3B60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_259309860();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B2F32A0);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_259309840();
  os_log_type_t v6 = sub_25930A1D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_bridgeObjectRetain();
    sub_25924FC14(a1, a2, &v9);
    sub_25930A2A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25921A000, v5, v6, "Got XPC Event Stream with object %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v8, -1, -1);
    MEMORY[0x25A2DBAF0](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_2592EBDAC()
{
  return swift_deallocObject();
}

void *sub_2592EBDBC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_2592EBE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_259309F20();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_259309F10();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25924A3A8(a1, &qword_26A37CE58);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_259309E90();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2592EBFB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E690);
  v3[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592EC04C, 0, 0);
}

uint64_t sub_2592EC04C()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[3];
  uint64_t v2 = (uint64_t *)&v1[4];
  unint64_t v3 = v1 + 16;
  os_unfair_lock_lock(v1 + 16);
  uint64_t v4 = sub_2592EEA44(v2, sub_2593028DC);
  os_unfair_lock_unlock(v3);
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v6 = v0[3];
      uint64_t v5 = v0[4];
      uint64_t v7 = v0[2];
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
      uint64_t v8 = *(void *)(v5 + 16);
      *(void *)(v5 + 16) = v8 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
      uint64_t v9 = (void *)swift_task_alloc();
      v0[6] = v9;
      id v9[2] = v6;
      v9[3] = v5;
      void v9[4] = v7;
      v9[5] = v8;
      id v10 = (void *)swift_task_alloc();
      v0[7] = v10;
      void v10[2] = v6;
      v10[3] = v5;
      v10[4] = v8;
      os_log_type_t v11 = (void *)swift_task_alloc();
      v0[8] = v11;
      void *v11 = v0;
      v11[1] = sub_2592EC2B0;
      return MEMORY[0x270FA2338](v11, &unk_26A37F8F0);
    }
    uint64_t v12 = v0[5];
    sub_259307A14(v0[2], v12);
    uint64_t v13 = type metadata accessor for StoredPhoto(0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
    sub_25924A404(v12, *(void *)(*(void *)(v4 + 64) + 40), &qword_26A37E690);
    swift_continuation_throwingResume();
  }
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2592EC2B0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2592EC3E4, 0, 0);
}

uint64_t sub_2592EC3E4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592EC444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a3;
  v4[9] = a4;
  void v4[6] = a1;
  v4[7] = a2;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_2592EC46C, 0, 0);
}

uint64_t sub_2592EC46C()
{
  uint64_t v1 = (os_unfair_lock_s *)v0[8];
  uint64_t v2 = (uint64_t *)&v1[4];
  uint64_t v3 = v1 + 16;
  os_unfair_lock_lock(v1 + 16);
  uint64_t v4 = sub_2592EEA44(v2, sub_259302904);
  os_unfair_lock_unlock(v3);
  if (v4)
  {
    if (v4 == 1)
    {
      uint64_t v6 = v0[8];
      uint64_t v5 = v0[9];
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
      uint64_t v7 = *(void *)(v5 + 16);
      *(void *)(v5 + 16) = v7 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
      uint64_t v8 = (void *)swift_task_alloc();
      v0[10] = v8;
      _OWORD v8[2] = v6;
      void v8[3] = v5;
      void v8[4] = v0 + 2;
      v8[5] = v7;
      uint64_t v9 = (void *)swift_task_alloc();
      v0[11] = v9;
      id v9[2] = v6;
      v9[3] = v5;
      void v9[4] = v7;
      id v10 = (void *)swift_task_alloc();
      v0[12] = v10;
      *id v10 = v0;
      v10[1] = sub_2592EC688;
      return MEMORY[0x270FA2338](v10, &unk_26A37F638);
    }
    uint64_t v11 = v0[6];
    unint64_t v12 = v0[7];
    v0[4] = v11;
    v0[5] = v12;
    sub_259261DE0(v11, v12);
    sub_25924A404((uint64_t)(v0 + 4), *(void *)(*(void *)(v4 + 64) + 40), &qword_26A37F630);
    swift_continuation_throwingResume();
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2592EC688()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2592EC7BC, 0, 0);
}

uint64_t sub_2592EC7BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2592EC7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return MEMORY[0x270FA2498](sub_2592EC7F4, 0, 0);
}

uint64_t sub_2592EC7F4()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 72) + 64);
  os_unfair_lock_lock(v1);
  sub_2592EE510(v0 + 16);
  os_unfair_lock_unlock(v1);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  unint64_t v4 = *(void *)(v0 + 32);
  *(void *)(v0 + 88) = v2;
  *(void *)(v0 + 96) = v4;
  char v5 = *(unsigned char *)(v0 + 40);
  *(unsigned char *)(v0 + 41) = v5;
  if (v3)
  {
    if (v3 == 1)
    {
      uint64_t v7 = *(void *)(v0 + 72);
      uint64_t v6 = *(void *)(v0 + 80);
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
      uint64_t v8 = *(void *)(v6 + 16);
      *(void *)(v6 + 16) = v8 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v9;
      id v9[2] = v7;
      v9[3] = v6;
      void v9[4] = v8;
      id v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 112) = v10;
      void v10[2] = v7;
      v10[3] = v6;
      v10[4] = v8;
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F630);
      void *v11 = v0;
      v11[1] = sub_2592ECAF4;
      uint64_t v12 = *(void *)(v0 + 64);
      return MEMORY[0x270FA2338](v12, &unk_26A37F8B0);
    }
    sub_2593077F0(v2, v4, v5 & 1);
    swift_continuation_throwingResume();
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_7:
    *(void *)(v0 + 48) = v2;
    id v13 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
    swift_willThrowTypedImpl();
    *(void *)(v0 + 56) = v2;
    if (sub_25930A770())
    {
      sub_2593077FC(v2, v4, 1);
      sub_2593077FC(v2, v4, 1);
    }
    else
    {
      swift_allocError();
      *uint64_t v16 = *(void *)(v0 + 56);
      sub_2593077FC(v2, v4, 1);
      uint64_t v3 = *(void *)(v0 + 16);
      uint64_t v2 = *(void **)(v0 + 24);
      unint64_t v4 = *(void *)(v0 + 32);
      char v5 = *(unsigned char *)(v0 + 40);
    }
    sub_259307808(v3, v2, v4, v5);
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_13;
  }
  sub_2593077F0(v2, v4, v5 & 1);
  if (v5) {
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v14 = *(void **)(v0 + 64);
  sub_259307808(v3, v2, v4, v5);
  *uint64_t v14 = v2;
  v14[1] = v4;
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
LABEL_13:
  return v15();
}

uint64_t sub_2592ECAF4()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592ECCB4;
  }
  else {
    uint64_t v2 = sub_2592ECC48;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592ECC48()
{
  sub_259307808(1, *(void **)(v0 + 88), *(void *)(v0 + 96), *(unsigned char *)(v0 + 41));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592ECCB4()
{
  sub_259307808(1, *(void **)(v0 + 88), *(void *)(v0 + 96), *(unsigned char *)(v0 + 41));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592ECD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F8F8);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  MEMORY[0x270FA5388](v11);
  id v13 = (uint64_t *)((char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (void **)((char *)&v88 - v17);
  uint64_t v19 = v3[4];
  if (v19 < 0) {
    return 1;
  }
  uint64_t v93 = v16;
  double v91 = v10;
  char v21 = (void *)*v3;
  uint64_t v20 = v3[1];
  uint64_t v23 = v3[2];
  uint64_t v22 = v3[3];
  uint64_t v94 = v3[5];
  v106 = v21;
  uint64_t v107 = v20;
  uint64_t v89 = v20;
  uint64_t v104 = v22;
  uint64_t v105 = v19;
  uint64_t v90 = v15;
  uint64_t v24 = *(int *)(v15 + 48);
  uint64_t v92 = v19;
  unint64_t v25 = (char *)v18 + v24;
  sub_259307A14(a2, (uint64_t)v18 + v24);
  uint64_t v26 = type metadata accessor for StoredPhoto(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
  *uint64_t v18 = a3;
  v18[1] = a1;
  v95 = v18;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t v27 = sub_25930A910();
  uint64_t v28 = -1 << *(unsigned char *)(v23 + 32);
  unint64_t v29 = v27 & ~v28;
  uint64_t v30 = v23 + 56;
  if ((*(void *)(v23 + 56 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29))
  {
    double v88 = v4;
    uint64_t v31 = ~v28;
    sub_259239FC0(v21, v89, v23, v22, v92);
    uint64_t v32 = *(void *)(v93 + 72);
    uint64_t v89 = v22;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v33 = v23;
    while (1)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)(v33 + 48);
      uint64_t v33 = v32 * v29;
      sub_2592207A0(v35 + v32 * v29, (uint64_t)v13, &qword_26A37DF28);
      uint64_t v36 = *v13;
      uint64_t v37 = *v95;
      sub_25924A3A8((uint64_t)v13, &qword_26A37DF28);
      if (v36 == v37) {
        break;
      }
      unint64_t v29 = (v29 + 1) & v31;
      uint64_t v33 = v34;
      if (((*(void *)(v30 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v4 = v88;
        uint64_t v38 = v93;
        uint64_t v39 = v92;
        unint64_t v29 = v89;
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v100 = v34;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
  uint64_t v39 = v92;
  sub_259239FC0(v21, v89, v23, v22, v92);
  swift_retain();
  swift_retain();
  uint64_t v33 = v23;
  unint64_t v29 = v22;
  uint64_t v38 = v93;
LABEL_9:
  uint64_t v41 = (uint64_t)v91;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v91, 1, 1, v90);
  sub_25924A3A8(v41, &qword_26A37F8F8);
  uint64_t v42 = *(void *)(v39 + 16);
  swift_release();
  swift_release();
  if (v42)
  {
    if (!*(void *)(v105 + 16))
    {
      __break(1u);
LABEL_37:
      sub_259302D84();
      uint64_t v34 = v100;
LABEL_14:
      uint64_t v45 = *(void *)(v34 + 48) + v33;
      uint64_t v46 = (uint64_t)v91;
      sub_25924A404(v45, (uint64_t)v91, &qword_26A37DF28);
      sub_259304AC8(v29);
      uint64_t v47 = v100;
      swift_bridgeObjectRelease();
      uint64_t v40 = 1;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v93 + 56))(v46, 0, 1, v90);
      sub_25924A3A8((uint64_t)v95, &qword_26A37DF28);
      swift_release();
      swift_release();
      sub_25924A3A8(v46, &qword_26A37F8F8);
      uint64_t v48 = v106;
      uint64_t v49 = v107;
      uint64_t v50 = v104;
      uint64_t v51 = v105;
      uint64_t v52 = v88;
      sub_25923A06C((id)*v88, v88[1], v88[2], v88[3], v88[4]);
      *uint64_t v52 = v48;
      v52[1] = v49;
      v52[2] = v47;
      v52[3] = v50;
      uint64_t v53 = v94;
      v52[4] = v51;
      v52[5] = v53;
      return v40;
    }
    if (v104) {
      uint64_t v43 = sub_259305E34(v104 + 16, v104 + 32, v105, 0);
    }
    else {
      uint64_t v43 = 0;
    }
    sub_259300FE4(0, v43, sub_2593028DC);
    uint64_t v40 = v74;
    sub_25924A3A8((uint64_t)v95, &qword_26A37DF28);
    v75 = v106;
    uint64_t v76 = v107;
    uint64_t v77 = v104;
    uint64_t v78 = v105;
    sub_25923A06C((id)*v4, v4[1], v4[2], v4[3], v4[4]);
    *uint64_t v4 = v75;
    v4[1] = v76;
    v4[2] = v33;
    v4[3] = v77;
    v4[4] = v78;
LABEL_32:
    v4[5] = v94;
    return v40;
  }
  int v54 = v106;
  uint64_t v55 = v107;
  uint64_t v56 = v107 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80));
  if (!v106)
  {
    uint64_t v79 = *(void *)(v107 + 16);
    if (v79)
    {
      uint64_t v80 = v38;
      v81 = v4;
      uint64_t v82 = *(void *)(v80 + 72);
      while (1)
      {
        sub_2592207A0(v56, (uint64_t)v13, &qword_26A37DF28);
        uint64_t v83 = *v13;
        uint64_t v84 = *v95;
        sub_25924A3A8((uint64_t)v13, &qword_26A37DF28);
        if (v83 == v84) {
          break;
        }
        v56 += v82;
        if (!--v79)
        {
          uint64_t v4 = v81;
          goto LABEL_30;
        }
      }
      int v54 = 0;
      uint64_t v4 = v81;
      double v85 = v95;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  uint64_t v57 = v38;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t result = sub_25930A910();
  uint64_t v59 = 1 << v54[2];
  BOOL v60 = __OFSUB__(v59, 1);
  uint64_t v61 = v59 - 1;
  if (!v60)
  {
    uint64_t v62 = v61 & result;
    uint64_t v63 = sub_2593094A0();
    *(void *)&long long v100 = v54 + 2;
    *((void *)&v100 + 1) = v54 + 4;
    *(void *)&long long v101 = v62;
    *((void *)&v101 + 1) = v63;
    *(void *)&long long v102 = v64;
    *((void *)&v102 + 1) = v65;
    char v103 = 0;
    uint64_t v66 = sub_2593094D0();
    char v68 = v67;
    long long v96 = v100;
    long long v97 = v101;
    long long v98 = v102;
    char v99 = v103;
    swift_retain();
    if ((v68 & 1) == 0)
    {
      uint64_t v92 = v55;
      uint64_t v93 = v33;
      uint64_t v69 = *(void *)(v57 + 72);
      v70 = v95;
      while (1)
      {
        sub_2592207A0(v56 + v69 * v66, (uint64_t)v13, &qword_26A37DF28);
        uint64_t v71 = *v13;
        uint64_t v72 = *v70;
        sub_25924A3A8((uint64_t)v13, &qword_26A37DF28);
        if (v71 == v72) {
          break;
        }
        sub_2593094F0();
        long long v108 = v96;
        long long v109 = v97;
        long long v110 = v98;
        char v111 = v99;
        uint64_t v66 = sub_2593094D0();
        if (v73)
        {
          uint64_t v33 = v93;
          goto LABEL_22;
        }
      }
      swift_release();
      double v85 = v70;
      uint64_t v33 = v93;
      uint64_t v55 = v92;
      goto LABEL_31;
    }
LABEL_22:
    swift_release();
LABEL_30:
    double v85 = v95;
    sub_2592FF8B0((uint64_t)v95);
    int v54 = v106;
    uint64_t v55 = v107;
LABEL_31:
    sub_25924A3A8((uint64_t)v85, &qword_26A37DF28);
    uint64_t v86 = v104;
    uint64_t v87 = v105;
    sub_25923A06C((id)*v4, v4[1], v4[2], v4[3], v4[4]);
    *uint64_t v4 = v54;
    v4[1] = v55;
    v4[2] = v33;
    v4[3] = v86;
    uint64_t v40 = 2;
    v4[4] = v87;
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t sub_2592ED4F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4[4];
  if (v5 < 0) {
    return 1;
  }
  uint64_t v6 = v4;
  uint64_t v8 = (void *)*v4;
  uint64_t v7 = v4[1];
  uint64_t v13 = v4[2];
  uint64_t v12 = v4[3];
  uint64_t v14 = v4[5];
  uint64_t v49 = v8;
  uint64_t v50 = v7;
  uint64_t v47 = v5;
  uint64_t v48 = v13;
  uint64_t v46 = v12;
  swift_retain();
  sub_259261DE0(a2, a3);
  uint64_t v38 = v8;
  uint64_t v39 = (void *)v7;
  uint64_t v37 = v13;
  uint64_t v41 = v14;
  sub_259239FC0(v8, v7, v13, v12, v5);
  swift_retain();
  uint64_t v15 = a4;
  sub_259302918(a4, (uint64_t)&v42);
  uint64_t v16 = v43;
  if (v43 != 1)
  {
    uint64_t v22 = v44;
    unint64_t v21 = v45;
    uint64_t v23 = v42;
    sub_259261F50(a2, a3);
    swift_release();
    swift_release();
    sub_259306F54(v23, v16, v22, v21);
    sub_25923A06C(v38, (uint64_t)v39, v37, v12, v5);
    uint64_t v24 = v48;
    *uint64_t v6 = v38;
    v6[1] = v39;
    _OWORD v6[2] = v24;
    v6[3] = v12;
    v6[4] = v5;
    v6[5] = v41;
    return 1;
  }
  uint64_t v17 = v39;
  uint64_t v18 = *(void *)(v5 + 16);
  uint64_t v19 = v5;
  swift_release();
  swift_release();
  if (v18)
  {
    if (v12) {
      uint64_t v20 = sub_259305E34(v12 + 16, v12 + 32, v5, 0);
    }
    else {
      uint64_t v20 = 0;
    }
    sub_259300FE4(0, v20, sub_259302904);
    uint64_t v25 = v31;
    sub_259261F50(a2, a3);
    sub_25923A06C(v38, (uint64_t)v39, v13, v12, v5);
    uint64_t v33 = v47;
    uint64_t v32 = v48;
    uint64_t v34 = v46;
    *uint64_t v6 = v38;
    v6[1] = v39;
    _OWORD v6[2] = v32;
    v6[3] = v34;
    v6[4] = v33;
    v6[5] = v41;
  }
  else
  {
    uint64_t v26 = v15;
    uint64_t v27 = v15;
    uint64_t v28 = v38;
    sub_2592FF680(v27, a1, a2, a3, (uint64_t)v38, v39);
    if (v29)
    {
      sub_2592FFAE0(v26, a1, a2, a3);
      sub_259261F50(a2, a3);
      uint64_t v30 = v12;
      sub_25923A06C(v38, (uint64_t)v39, v13, v12, v19);
      uint64_t v28 = v49;
      uint64_t v17 = (void *)v50;
    }
    else
    {
      sub_259261F50(a2, a3);
      uint64_t v30 = v12;
      sub_25923A06C(v38, (uint64_t)v39, v13, v12, v19);
    }
    uint64_t v35 = v48;
    *uint64_t v6 = v28;
    v6[1] = v17;
    _OWORD v6[2] = v35;
    v6[3] = v30;
    v6[4] = v19;
    v6[5] = v41;
    return 2;
  }
  return v25;
}

uint64_t sub_2592ED7E0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F8F8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (uint64_t *)((char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v61 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (uint64_t *)((char *)&v61 - v18);
  uint64_t v68 = *(void *)(v2 + 32);
  if (v68 < 0) {
    return 1;
  }
  uint64_t v63 = v17;
  uint64_t v64 = v6;
  unint64_t v21 = *(void **)v2;
  uint64_t v20 = *(void *)(v2 + 8);
  uint64_t v65 = *(void *)(v2 + 16);
  uint64_t v66 = *(void *)(v2 + 24);
  uint64_t v67 = *(void *)(v2 + 40);
  uint64_t v77 = v21;
  uint64_t v78 = v20;
  uint64_t v22 = (char *)v19 + *(int *)(v16 + 48);
  uint64_t v23 = type metadata accessor for StoredPhoto(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *uint64_t v19 = a1;
  v19[1] = 0;
  uint64_t v24 = v20 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  if (!v21)
  {
    uint64_t v41 = *(void *)(v20 + 16);
    if (v41)
    {
      uint64_t v62 = v14;
      uint64_t v42 = *(void *)(v8 + 72);
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      int64_t v33 = 0;
      while (1)
      {
        sub_2592207A0(v24, (uint64_t)v10, &qword_26A37DF28);
        uint64_t v43 = *v10;
        uint64_t v44 = *v19;
        sub_25924A3A8((uint64_t)v10, &qword_26A37DF28);
        if (v43 == v44) {
          break;
        }
        ++v33;
        v24 += v42;
        if (v41 == v33) {
          goto LABEL_17;
        }
      }
      uint64_t v45 = 0;
      goto LABEL_19;
    }
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  uint64_t v62 = v14;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t result = sub_25930A910();
  uint64_t v26 = 1 << v21[2];
  BOOL v27 = __OFSUB__(v26, 1);
  uint64_t v28 = v26 - 1;
  if (!v27)
  {
    uint64_t v29 = v28 & result;
    uint64_t v30 = sub_2593094A0();
    *(void *)&long long v73 = v21 + 2;
    *((void *)&v73 + 1) = v21 + 4;
    *(void *)&long long v74 = v29;
    *((void *)&v74 + 1) = v30;
    *(void *)&long long v75 = v31;
    *((void *)&v75 + 1) = v32;
    char v76 = 0;
    int64_t v33 = sub_2593094D0();
    char v35 = v34;
    long long v69 = v73;
    long long v70 = v74;
    long long v71 = v75;
    char v72 = v76;
    sub_259239FC0(v21, v20, v65, v66, v68);
    swift_retain();
    if ((v35 & 1) == 0)
    {
      uint64_t v36 = *(void *)(v8 + 72);
      while (1)
      {
        sub_2592207A0(v24 + v36 * v33, (uint64_t)v10, &qword_26A37DF28);
        uint64_t v37 = *v10;
        uint64_t v38 = *v19;
        sub_25924A3A8((uint64_t)v10, &qword_26A37DF28);
        if (v37 == v38) {
          break;
        }
        sub_2593094F0();
        long long v79 = v69;
        long long v80 = v70;
        long long v81 = v71;
        char v82 = v72;
        int64_t v33 = sub_2593094D0();
        if (v39) {
          goto LABEL_8;
        }
      }
      uint64_t v45 = v70;
      swift_release();
LABEL_19:
      uint64_t v54 = v63;
      sub_259300CF4(v33, v45, v63);
      sub_25924A3A8((uint64_t)v19, &qword_26A37DF28);
      uint64_t v55 = v54;
      uint64_t v56 = (uint64_t)v62;
      sub_25924A404(v55, (uint64_t)v62, &qword_26A37DF28);
      uint64_t v57 = v77;
      uint64_t v58 = v78;
      sub_25923A06C(*(id *)v2, *(void *)(v2 + 8), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
      *(void *)uint64_t v2 = v57;
      *(void *)(v2 + 8) = v58;
      uint64_t v59 = v66;
      *(void *)(v2 + 16) = v65;
      *(void *)(v2 + 24) = v59;
      uint64_t v60 = v67;
      *(void *)(v2 + 32) = v68;
      *(void *)(v2 + 40) = v60;
      uint64_t v40 = *(void *)(v56 + 8);
      sub_25924A3A8(v56, &qword_26A37DF28);
      return v40;
    }
LABEL_8:
    swift_release();
LABEL_17:
    sub_2592207A0((uint64_t)v19, (uint64_t)v10, &qword_26A37DF28);
    uint64_t v46 = v65;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v69 = v46;
    uint64_t v48 = (uint64_t)v64;
    sub_2593050B8(v10, isUniquelyReferenced_nonNull_native, (uint64_t)v64);
    uint64_t v49 = v69;
    swift_bridgeObjectRelease();
    sub_25924A3A8(v48, &qword_26A37F8F8);
    sub_25924A3A8((uint64_t)v19, &qword_26A37DF28);
    uint64_t v50 = v77;
    uint64_t v51 = v78;
    sub_25923A06C(*(id *)v2, *(void *)(v2 + 8), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
    *(void *)uint64_t v2 = v50;
    *(void *)(v2 + 8) = v51;
    uint64_t v52 = v66;
    *(void *)(v2 + 16) = v49;
    *(void *)(v2 + 24) = v52;
    uint64_t v40 = 1;
    uint64_t v53 = v67;
    *(void *)(v2 + 32) = v68;
    *(void *)(v2 + 40) = v53;
    return v40;
  }
  __break(1u);
  return result;
}

uint64_t sub_2592EDD94(uint64_t a1)
{
  uint64_t v2 = v1[4];
  if (v2 < 0) {
    return 1;
  }
  uint64_t v3 = v1;
  id v6 = (id)*v1;
  uint64_t v5 = (void *)v1[1];
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[5];
  id v25 = v6;
  uint64_t v26 = v5;
  uint64_t v10 = sub_2592FF680(a1, 0, 0, 0xF000000000000000, (uint64_t)v6, v5);
  if (v12)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_259305454(a1, 0, 0, 0xF000000000000000, isUniquelyReferenced_nonNull_native, (uint64_t)&v22);
    swift_bridgeObjectRelease();
    sub_259306F54(v22, *((uint64_t *)&v22 + 1), v23, v24);
    sub_259277DC4(0, 0xF000000000000000);
    sub_25923A06C((id)*v1, v1[1], v1[2], v1[3], v1[4]);
    *uint64_t v1 = v6;
    v1[1] = v5;
    v1[2] = v7;
    v1[3] = v8;
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v13 = v11;
    int64_t v14 = v10;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_259300E74(v14, v13, &v22);
    uint64_t v15 = *((void *)&v22 + 1);
    uint64_t v16 = v23;
    unint64_t v17 = v24;
    uint64_t v20 = v26;
    id v21 = v25;
    sub_25923A06C(v6, (uint64_t)v5, v7, v8, v2);
    sub_259277DC4(v16, v17);
    *uint64_t v3 = v21;
    v3[1] = v20;
    v3[2] = v7;
    v3[3] = v8;
  }
  v3[4] = v2;
  v3[5] = v9;
  return v15;
}

uint64_t sub_2592EDF54(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2 < 0) {
    return 0;
  }
  id v4 = *(id *)v1;
  uint64_t v5 = *(void *)(v1 + 8);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (a1 && !*(void *)(v2 + 16))
  {
    id v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
    uint64_t v10 = sub_25930A770();
    if (v10)
    {
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = swift_allocError();
      *char v12 = a1;
    }
    sub_25923A06C(*(id *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
    *(void *)uint64_t v1 = v11;
    *(void *)(v1 + 16) = 0;
    *(void *)(v1 + 24) = 0;
    *(void *)(v1 + 8) = 0;
  }
  else
  {
    sub_25923A06C(v4, v5, v7, v6, v2);
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
  }
  *(_OWORD *)(v1 + 32) = xmmword_259312DC0;
  int64_t v13 = *(void *)(v5 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v30 = v2;
  if (v13)
  {
    uint64_t v31 = MEMORY[0x263F8EE78];
    sub_25925CE9C(0, v13, 0);
    uint64_t v8 = v31;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
    uint64_t v15 = 0;
    uint64_t v17 = *(void *)(v14 - 8);
    uint64_t result = v14 - 8;
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(v5 + 16);
    unint64_t v20 = v5 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)) + 8;
    while (v19 != v15)
    {
      uint64_t v21 = *(void *)(v20 + *(void *)(v18 + 72) * v15);
      unint64_t v23 = *(void *)(v31 + 16);
      unint64_t v22 = *(void *)(v31 + 24);
      if (v23 >= v22 >> 1) {
        uint64_t result = sub_25925CE9C(v22 > 1, v23 + 1, 1);
      }
      ++v15;
      *(void *)(v31 + 16) = v23 + 1;
      *(void *)(v31 + 8 * v23 + 32) = v21;
      if (v13 == v15)
      {
        uint64_t v2 = v30;
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_26;
  }
LABEL_17:
  int64_t v24 = *(void *)(v2 + 16);
  if (!v24)
  {
LABEL_23:
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return v8;
  }
  uint64_t v32 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25925CE74(0, v24, 0);
  uint64_t v25 = *(void *)(v2 + 16);
  uint64_t v26 = (uint64_t *)(v2 + 40);
  while (v25)
  {
    uint64_t v27 = *v26;
    unint64_t v29 = *(void *)(v32 + 16);
    unint64_t v28 = *(void *)(v32 + 24);
    if (v29 >= v28 >> 1) {
      uint64_t result = sub_25925CE74(v28 > 1, v29 + 1, 1);
    }
    *(void *)(v32 + 16) = v29 + 1;
    *(void *)(v32 + 8 * v29 + 32) = v27;
    --v25;
    v26 += 2;
    if (!--v24) {
      goto LABEL_23;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2592EE260(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2 < 0) {
    return 0;
  }
  id v4 = *(id *)v1;
  uint64_t v5 = *(void *)(v1 + 8);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (a1 && !*(void *)(v2 + 16))
  {
    id v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
    uint64_t v10 = sub_25930A770();
    if (v10)
    {
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = swift_allocError();
      *char v12 = a1;
    }
    sub_25923A06C(*(id *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
    *(void *)uint64_t v1 = v11;
    *(void *)(v1 + 16) = 0;
    *(void *)(v1 + 24) = 0;
    *(void *)(v1 + 8) = 0;
  }
  else
  {
    sub_25923A06C(v4, v5, v7, v6, v2);
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
  }
  *(_OWORD *)(v1 + 32) = xmmword_259312DC0;
  int64_t v13 = *(void *)(v5 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (v13)
  {
    uint64_t v26 = MEMORY[0x263F8EE78];
    uint64_t result = sub_25925CE9C(0, v13, 0);
    uint64_t v8 = v26;
    uint64_t v15 = *(void *)(v5 + 16);
    uint64_t v16 = (uint64_t *)(v5 + 40);
    while (v15)
    {
      uint64_t v17 = *v16;
      unint64_t v19 = *(void *)(v26 + 16);
      unint64_t v18 = *(void *)(v26 + 24);
      if (v19 >= v18 >> 1) {
        uint64_t result = sub_25925CE9C(v18 > 1, v19 + 1, 1);
      }
      *(void *)(v26 + 16) = v19 + 1;
      *(void *)(v26 + 8 * v19 + 32) = v17;
      --v15;
      v16 += 4;
      if (!--v13) {
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_25;
  }
LABEL_16:
  int64_t v20 = *(void *)(v2 + 16);
  if (!v20)
  {
LABEL_22:
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return v8;
  }
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25925CF1C(0, v20, 0);
  uint64_t v21 = *(void *)(v2 + 16);
  unint64_t v22 = (uint64_t *)(v2 + 40);
  while (v21)
  {
    uint64_t v23 = *v22;
    unint64_t v25 = *(void *)(v27 + 16);
    unint64_t v24 = *(void *)(v27 + 24);
    if (v25 >= v24 >> 1) {
      uint64_t result = sub_25925CF1C(v24 > 1, v25 + 1, 1);
    }
    *(void *)(v27 + 16) = v25 + 1;
    *(void *)(v27 + 8 * v25 + 32) = v23;
    --v21;
    v22 += 2;
    if (!--v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_2592EE510(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[4];
  if (v4 < 0)
  {
    if (v3)
    {
      *(_OWORD *)uint64_t v1 = 0u;
      *((_OWORD *)v1 + 1) = 0u;
      *((_OWORD *)v1 + 2) = xmmword_259312DC0;
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = v3;
      *(void *)(a1 + 16) = 0;
      *(unsigned char *)(a1 + 24) = 1;
      return;
    }
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    unint64_t v11 = 0xF000000000000000;
    goto LABEL_11;
  }
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[1];
  if (*(void *)(v6 + 16))
  {
    uint64_t v7 = v1[2];
    uint64_t v8 = v1[5];
    uint64_t v15 = *v1;
    uint64_t v16 = v6;
    if (v3) {
      uint64_t v9 = sub_259306500(v3 + 16, v3 + 32, v6, 0);
    }
    else {
      uint64_t v9 = 0;
    }
    sub_259300E74(0, v9, &v12);
    uint64_t v10 = v16;
    *uint64_t v1 = v15;
    v1[1] = v10;
    v1[2] = v7;
    v1[3] = v5;
    v1[4] = v4;
    v1[5] = v8;
    unint64_t v11 = v14;
    *(_OWORD *)a1 = v13;
LABEL_11:
    *(void *)(a1 + 16) = v11;
    goto LABEL_12;
  }
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 1;
LABEL_12:
  *(unsigned char *)(a1 + 24) = 0;
}

void sub_2592EE638(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v5 = (void *)*v3;
  uint64_t v6 = v3[4];
  if (v6 < 0)
  {
    if (v5)
    {
      *(_OWORD *)uint64_t v3 = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      *((_OWORD *)v3 + 2) = xmmword_259312DC0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)a3 = v5;
      *(unsigned char *)(a3 + 24) = 1;
      return;
    }
    long long v17 = xmmword_259314080;
    goto LABEL_10;
  }
  uint64_t v25 = a3;
  uint64_t v10 = v3[1];
  uint64_t v9 = v3[2];
  uint64_t v11 = v3[3];
  uint64_t v12 = v3[5];
  uint64_t v32 = *v3;
  uint64_t v33 = v10;
  uint64_t v30 = v11;
  uint64_t v31 = v6;
  uint64_t v29 = v12;
  swift_retain();
  sub_259239FC0(v5, v10, v9, v11, v6);
  swift_retain();
  sub_259302A74(a2);
  if (v13 != 1)
  {
    swift_release();
    swift_release();
    sub_25923A06C(v5, v10, v9, v11, v6);
    uint64_t v16 = v29;
    *uint64_t v3 = v5;
    v3[1] = v10;
    v3[2] = v9;
    v3[3] = v11;
    v3[4] = v6;
    v3[5] = v16;
    long long v17 = xmmword_259314080;
    a3 = v25;
LABEL_10:
    *(_OWORD *)a3 = v17;
    *(unsigned char *)(a3 + 24) = 0;
    return;
  }
  uint64_t v14 = *(void *)(v10 + 16);
  swift_release();
  swift_release();
  if (v14)
  {
    if (v5) {
      uint64_t v15 = sub_259306500((uint64_t)v5 + 16, (uint64_t)v5 + 32, v10, 0);
    }
    else {
      uint64_t v15 = 0;
    }
    sub_259300E74(0, v15, &v26);
    sub_25923A06C(v5, v10, v9, v11, v6);
    uint64_t v19 = v33;
    uint64_t v20 = v29;
    *uint64_t v4 = v32;
    v4[1] = v19;
    v4[2] = v9;
    v4[3] = v11;
    v4[4] = v6;
    v4[5] = v20;
    uint64_t v21 = v28;
    uint64_t v22 = v25;
    *(_OWORD *)uint64_t v25 = v27;
    *(void *)(v25 + 16) = v21;
    char v23 = 2;
  }
  else
  {
    sub_2592FF798(a2, a1, v11, (void *)v6);
    if (v18)
    {
      sub_2592FFC88(a2, a1);
      sub_25923A06C(v5, v10, v9, v11, v6);
      uint64_t v11 = v30;
      uint64_t v6 = v31;
    }
    else
    {
      sub_25923A06C(v5, v10, v9, v11, v6);
    }
    uint64_t v22 = v25;
    uint64_t v24 = v29;
    *uint64_t v4 = v5;
    v4[1] = v10;
    v4[2] = v9;
    v4[3] = v11;
    v4[4] = v6;
    v4[5] = v24;
    *(void *)(v25 + 8) = 0;
    *(void *)(v25 + 16) = 0;
    *(void *)uint64_t v25 = 0;
    char v23 = -1;
  }
  *(unsigned char *)(v22 + 24) = v23;
}

uint64_t sub_2592EE8A8(uint64_t a1)
{
  uint64_t v2 = v1[4];
  if (v2 < 0) {
    return 1;
  }
  uint64_t v3 = v1;
  uint64_t v6 = (void *)*v1;
  uint64_t v5 = v1[1];
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[5];
  uint64_t v10 = sub_2592FF798(a1, 0, v8, (void *)v2);
  if (v12)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_259305700(a1, 0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_25923A06C(v6, v5, v7, v8, v2);
    *uint64_t v1 = v6;
    v1[1] = v5;
    v1[2] = v7;
    v1[3] = v8;
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v13 = v11;
    int64_t v14 = v10;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_259300FE4(v14, v13, sub_259302904);
    uint64_t v16 = v15;
    sub_25923A06C(v6, v5, v7, v8, v2);
    *uint64_t v3 = v6;
    v3[1] = v5;
    v3[2] = v7;
    v3[3] = v8;
  }
  v3[4] = v2;
  v3[5] = v9;
  return v16;
}

uint64_t sub_2592EEA44(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2 = a1[4];
  if (v2 < 0) {
    return 0;
  }
  uint64_t v4 = *a1;
  uint64_t v5 = a1[3];
  if (*(void *)(v2 + 16))
  {
    uint64_t v7 = a1[1];
    uint64_t v8 = a1[2];
    uint64_t v9 = a1[5];
    uint64_t v13 = a1[3];
    if (v5) {
      uint64_t v10 = sub_259305E34(v5 + 16, v5 + 32, v2, 0);
    }
    else {
      uint64_t v10 = 0;
    }
    sub_259300FE4(0, v10, a2);
    uint64_t result = v12;
    *a1 = v4;
    a1[1] = v7;
    a1[2] = v8;
    a1[3] = v13;
    a1[4] = v2;
    a1[5] = v9;
  }
  else
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    swift_release();
    swift_release();
    return 1;
  }
  return result;
}

uint64_t sub_2592EEB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a2;
  return MEMORY[0x270FA2498](sub_2592EEB6C, 0, 0);
}

uint64_t sub_2592EEB6C()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = (os_unfair_lock_s *)v0[10];
  v0[2] = v0;
  v0[3] = sub_259242140;
  uint64_t v4 = swift_continuation_init();
  sub_25930661C(v4, v3, v2, v1);
  return MEMORY[0x270FA23F0](v0 + 2);
}

void sub_2592EEC18(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3)
{
}

void sub_2592EEC30(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6 = a1 + 16;
  os_unfair_lock_lock(a1 + 16);
  unint64_t v7 = a4(a3);
  os_unfair_lock_unlock(v6);
  if (v7 >= 2)
  {
    swift_continuation_throwingResume();
  }
}

uint64_t sub_2592EECB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a2;
  v4[14] = a4;
  v4[12] = a1;
  return MEMORY[0x270FA2498](sub_2592EECD4, 0, 0);
}

uint64_t sub_2592EECD4()
{
  uint64_t v2 = (os_unfair_lock_s *)v0[13];
  uint64_t v1 = v0[14];
  v0[2] = v0;
  v0[7] = v0 + 10;
  v0[3] = sub_2592EED80;
  uint64_t v3 = swift_continuation_init();
  sub_259306890(v3, v2, v1);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2592EED80()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48)) {
    swift_willThrow();
  }
  else {
    *(_OWORD *)*(void *)(*v0 + 96) = *(_OWORD *)(*v0 + 80);
  }
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return v2();
}

void sub_2592EEE94(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + 16;
  os_unfair_lock_lock(a1 + 16);
  unint64_t v5 = sub_2592EE8A8(a3);
  os_unfair_lock_unlock(v4);
  if (v5 >= 2)
  {
    long long v6 = xmmword_259314080;
    sub_25924A404((uint64_t)&v6, *(void *)(*(void *)(v5 + 64) + 40), &qword_26A37F630);
    swift_continuation_throwingResume();
  }
}

void *XPCMessageCenter.Client.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)swift_allocObject();
  result[3] = a2;
  result[4] = 0;
  result[2] = a1;
  return result;
}

uint64_t sub_2592EEF70(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F870);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  uint64_t v10 = *(void *)(v9 - 8);
  double v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, double))(v10 + 48))(a1, 1, v9, v11) == 1)
  {
    sub_25924A3A8(a1, &qword_26A37F870);
    unint64_t v14 = sub_25925E5B0(a2);
    if (v15)
    {
      unint64_t v16 = v14;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v18 = *v3;
      uint64_t v22 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_2592952BC();
        uint64_t v18 = v22;
      }
      sub_25924A404(*(void *)(v18 + 56) + *(void *)(v10 + 72) * v16, (uint64_t)v8, &qword_26A37C990);
      sub_25930597C(v16, v18);
      *uint64_t v3 = v18;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_25924A3A8((uint64_t)v8, &qword_26A37F870);
  }
  else
  {
    sub_25924A404(a1, (uint64_t)v13, &qword_26A37C990);
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_259295844((uint64_t)v13, a2, v19);
    *uint64_t v3 = v22;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2592EF1BC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F870);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for CommunicationActor();
  v23[0] = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  v23[1] = v8;
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v9 = *(_DWORD *)(v2 + 32);
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v10 = *(_DWORD *)(v2 + 32);
  BOOL v11 = __CFADD__(v10, 1);
  int v12 = v10 + 1;
  if (v11)
  {
    __break(1u);
LABEL_22:
    swift_once();
    goto LABEL_13;
  }
  *(_DWORD *)(v2 + 32) = v12;
  uint64_t v13 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  swift_retain();
  sub_25930A4D0();
  unint64_t v14 = (void *)((char *)a2 + v13[9]);
  *unint64_t v14 = 0;
  v14[1] = 0;
  *(void *)((char *)a2 + v13[10]) = 0;
  *a2 = a1;
  *(_DWORD *)((char *)a2 + v13[8]) = v9;
  sub_2592207A0((uint64_t)a2, (uint64_t)v7, &qword_26A37C990);
  (*(void (**)(char *, void, uint64_t, int *))(*((void *)v13 - 1) + 56))(v7, 0, 1, v13);
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  sub_2592EEF70((uint64_t)v7, v9);
  swift_endAccess();
  if (qword_26B2F3B80 != -1) {
    goto LABEL_22;
  }
LABEL_13:
  uint64_t v15 = sub_259309860();
  __swift_project_value_buffer(v15, (uint64_t)qword_26B2F3B68);
  swift_retain();
  unint64_t v16 = sub_259309840();
  os_log_type_t v17 = sub_25930A1A0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v25[0] = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v20 = *(void *)(v2 + 16);
    unint64_t v21 = *(void *)(v2 + 24);
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_25924FC14(v20, v21, v25);
    sub_25930A2A0();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 1024;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    LODWORD(v24) = v9;
    sub_25930A2A0();
    _os_log_impl(&dword_25921A000, v16, v17, "%s: Inserted request %u", (uint8_t *)v18, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v19, -1, -1);
    MEMORY[0x25A2DBAF0](v18, -1, -1);
  }
  else
  {

    swift_release();
  }
  return sub_2592F1168();
}

uint64_t sub_2592EF678(unsigned int a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F870);
  MEMORY[0x270FA5388](v7 - 8);
  unsigned int v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t v10 = *(void *)(v1 + 40);
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_25925E5B0(a1), (v12 & 1) != 0))
  {
    sub_2592207A0(*(void *)(v10 + 56) + *(void *)(v4 + 72) * v11, (uint64_t)v9, &qword_26A37C990);
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, v13, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_25924A3A8((uint64_t)v9, &qword_26A37F870);
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    return 0;
  }
  else
  {
    sub_2592207A0((uint64_t)v9, (uint64_t)v6, &qword_26A37C990);
    sub_25924A3A8((uint64_t)v9, &qword_26A37F870);
    uint64_t v14 = *(void *)&v6[*(int *)(v3 + 40)];
    sub_25924A3A8((uint64_t)v6, &qword_26A37C990);
  }
  return v14;
}

uint64_t sub_2592EF9A0(uint64_t a1, int a2)
{
  *(_DWORD *)(v3 + 236) = a2;
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F870);
  *(void *)(v3 + 128) = swift_task_alloc();
  *(void *)(v3 + 136) = swift_task_alloc();
  *(void *)(v3 + 144) = swift_task_alloc();
  *(void *)(v3 + 152) = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  *(void *)(v3 + 160) = type metadata accessor for CommunicationActor();
  *(void *)(v3 + 168) = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v5 = sub_259309E90();
  *(void *)(v3 + 176) = v5;
  *(void *)(v3 + 184) = v4;
  return MEMORY[0x270FA2498](sub_2592EFAF4, v5, v4);
}

uint64_t sub_2592EFAF4()
{
  uint64_t v33 = v0;
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 120);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 40);
  if (*(void *)(v2 + 16))
  {
    unint64_t v3 = sub_25925E5B0(*(_DWORD *)(v0 + 236));
    uint64_t v4 = *(void *)(v0 + 152);
    if (v5)
    {
      unint64_t v6 = v3;
      uint64_t v7 = *(void *)(v2 + 56);
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
      uint64_t v9 = *(void *)(v8 - 8);
      sub_2592207A0(v7 + *(void *)(v9 + 72) * v6, v4, &qword_26A37C990);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
    }
    else
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 152);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  uint64_t v13 = *(void *)(v0 + 144);
  sub_2592207A0(*(void *)(v0 + 152), v13, &qword_26A37F870);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  *(void *)(v0 + 192) = v14;
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  int v16 = v15(v13, 1, v14);
  sub_25924A3A8(v13, &qword_26A37F870);
  if (v16 == 1)
  {
    if (qword_26B2F3B80 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_259309860();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B2F3B68);
    swift_retain();
    uint64_t v18 = sub_259309840();
    os_log_type_t v19 = sub_25930A1B0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = v31;
      *(_DWORD *)uint64_t v20 = 136315394;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v21 = *(void *)(v0 + 120);
      uint64_t v23 = *(void *)(v21 + 16);
      unint64_t v22 = *(void *)(v21 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 104) = sub_25924FC14(v23, v22, &v32);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      swift_release();
      *(_WORD *)(v20 + 12) = 1024;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(_DWORD *)(v0 + 232) = *(_DWORD *)(v0 + 236);
      sub_25930A2A0();
      _os_log_impl(&dword_25921A000, v18, v19, "%s: Received response for non-existent request %u", (uint8_t *)v20, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v31, -1, -1);
      MEMORY[0x25A2DBAF0](v20, -1, -1);
    }
    else
    {
      swift_release();
    }

    sub_2592A76E8();
    swift_allocError();
    *long long v27 = 2;
    uint64_t v28 = *(void *)(v0 + 152);
    swift_willThrow();
    sub_25924A3A8(v28, &qword_26A37F870);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
  else
  {
    uint64_t v24 = (uint64_t (*)())v15(*(void *)(v0 + 152), 1, v14);
    if (v24 == 1)
    {
      __break(1u);
    }
    else
    {
      uint64_t v24 = sub_2592F005C;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
    }
    return MEMORY[0x270FA2498](v24, v25, v26);
  }
}

uint64_t sub_2592F005C()
{
  uint64_t v1 = (uint64_t *)v0[19];
  uint64_t v2 = (uint64_t *)((char *)v1 + *(int *)(v0[24] + 36));
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = v2[1];
  }
  else
  {
    uint64_t v5 = *v1;
    uint64_t v3 = *(void *)(v5 + 16);
    uint64_t v4 = *(void *)(v5 + 24);
    *uint64_t v2 = v3;
    v2[1] = v4;
    swift_retain();
    swift_retain();
  }
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A37F8A0 + dword_26A37F8A0);
  unint64_t v6 = (void *)swift_task_alloc();
  v0[25] = v6;
  *unint64_t v6 = v0;
  v6[1] = sub_2592F0154;
  return v8((uint64_t)(v0 + 11), v3, v4);
}

uint64_t sub_2592F0154()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592F03F0;
  }
  else {
    uint64_t v2 = sub_2592F0268;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592F0268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 152);
  uint64_t v5 = *(int *)(*(void *)(v3 + 192) + 40);
  uint64_t v6 = *(void *)(v4 + v5);
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7)
  {
    __break(1u);
    return MEMORY[0x270FA2498](a1, a2, a3);
  }
  else
  {
    *(void *)(v4 + v5) = v8;
    *(_OWORD *)(v3 + 216) = *(_OWORD *)(v3 + 88);
    return MEMORY[0x270FA2498](sub_2592F02A8, *(void *)(v3 + 176), *(void *)(v3 + 184));
  }
}

uint64_t sub_2592F02A8()
{
  unint64_t v1 = *(void *)(v0 + 224);
  if (v1 >> 60 == 15)
  {
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v2 = *(void *)(v0 + 128);
    unsigned int v3 = *(_DWORD *)(v0 + 236);
    swift_beginAccess();
    sub_2592F054C(v3, v2);
    sub_25924A3A8(v2, &qword_26A37F870);
    swift_endAccess();
    unint64_t v1 = *(void *)(v0 + 224);
  }
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v5 = *(void **)(v0 + 112);
  *uint64_t v5 = *(void *)(v0 + 216);
  v5[1] = v1;
  sub_25924A3A8(v4, &qword_26A37F870);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2592F03F0()
{
  return MEMORY[0x270FA2498](sub_2592F0408, *(void *)(v0 + 176), *(void *)(v0 + 184));
}

uint64_t sub_2592F0408()
{
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0 + 136);
  unsigned int v2 = *(_DWORD *)(v0 + 236);
  swift_beginAccess();
  sub_2592F054C(v2, v1);
  sub_25924A3A8(v1, &qword_26A37F870);
  swift_endAccess();
  uint64_t v3 = *(void *)(v0 + 152);
  swift_willThrow();
  sub_25924A3A8(v3, &qword_26A37F870);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2592F054C@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  unint64_t v5 = sub_25925E5B0(a1);
  if (v6)
  {
    unint64_t v7 = v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v2;
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2592952BC();
      uint64_t v9 = v19;
    }
    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
    uint64_t v18 = *(void *)(v11 - 8);
    sub_25924A404(v10 + *(void *)(v18 + 72) * v7, a2, &qword_26A37C990);
    sub_25930597C(v7, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }
  return v12(v13, v14, 1, v15);
}

uint64_t sub_2592F06BC(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F870);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  uint64_t v54 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v8 = (uint64_t *)((char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B2F3930 != -1) {
LABEL_38:
  }
    swift_once();
  uint64_t v9 = type metadata accessor for CommunicationActor();
  uint64_t v52 = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v53 = v9;
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = (uint64_t *)(v2 + 40);
  uint64_t v11 = swift_beginAccess();
  uint64_t v12 = *(void *)(v2 + 40);
  MEMORY[0x270FA5388](v11);
  *(&v43 - 2) = a1;
  swift_bridgeObjectRetain();
  a1 = 0;
  sub_2592F0DE0((uint64_t (*)(char *))sub_2593077D0, (uint64_t)(&v43 - 4), v12);
  uint64_t v14 = v13;
  uint64_t v51 = *(void *)(v13 + 16);
  if (v51)
  {
    uint64_t v48 = v13 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
    uint64_t v47 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56);
    swift_bridgeObjectRetain();
    unint64_t v15 = 0;
    uint64_t v2 = MEMORY[0x263F8E4E0];
    uint64_t v16 = v45;
    uint64_t v46 = v8;
    uint64_t v44 = v6;
    uint64_t v49 = v14;
    uint64_t v50 = v10;
    while (1)
    {
      if (v15 >= *(void *)(v14 + 16))
      {
        __break(1u);
        goto LABEL_38;
      }
      uint64_t v55 = *(void *)(v54 + 72);
      sub_2592207A0(v48 + v55 * v15, (uint64_t)v8, &qword_26A37C990);
      uint64_t v18 = *v8;
      sub_2592A76E8();
      uint64_t v19 = (void *)swift_allocError();
      *uint64_t v20 = 1;
      uint64_t v21 = (os_unfair_lock_s *)(*(void *)(v18 + 16) + 64);
      id v22 = v19;
      os_unfair_lock_lock(v21);
      uint64_t v23 = sub_2592EE260(v19);
      uint64_t v25 = v24;
      os_unfair_lock_unlock(v21);
      if (v23) {
        break;
      }
LABEL_29:

      a1 = *(unsigned int *)((char *)v8 + *(int *)(v16 + 32));
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v37 = v50;
      swift_beginAccess();
      unint64_t v38 = sub_25925E5B0(a1);
      if (v39)
      {
        a1 = v38;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v41 = *v37;
        uint64_t v56 = *v37;
        *uint64_t v37 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2592952BC();
          uint64_t v41 = v56;
        }
        sub_25924A404(*(void *)(v41 + 56) + a1 * v55, (uint64_t)v6, &qword_26A37C990);
        sub_25930597C(a1, v41);
        *uint64_t v37 = v41;
        swift_bridgeObjectRelease();
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = 1;
      }
      ++v15;
      (*v47)(v6, v17, 1, v16);
      sub_25924A3A8((uint64_t)v6, &qword_26A37F870);
      swift_endAccess();
      sub_25924A3A8((uint64_t)v8, &qword_26A37C990);
      uint64_t v14 = v49;
      if (v15 == v51)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    uint64_t v26 = *(void *)(v23 + 16);
    if (v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)(v23 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v28 = *(void *)(v25 + 16);
      if (v28) {
        goto LABEL_18;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v28 = *(void *)(v25 + 16);
      if (v28)
      {
LABEL_18:
        id v29 = v19;
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)(v25 + 8 * j + 32))
          {
            uint64_t v57 = v19;
            id v34 = v19;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
            uint64_t v35 = sub_25930A770();
            if (v35)
            {
              uint64_t v31 = v35;
            }
            else
            {
              uint64_t v31 = swift_allocError();
              *uint64_t v32 = v57;
            }
            swift_allocError();
            *uint64_t v33 = v31;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        char v6 = v44;
        uint64_t v16 = v45;
        goto LABEL_28;
      }
    }
    id v36 = v19;
LABEL_28:
    sub_2592435BC(v23);

    swift_bridgeObjectRelease();
    uint64_t v8 = v46;
    goto LABEL_29;
  }
  return v14;
}

uint64_t sub_2592F0CD0()
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  return sub_25930A4E0() & 1;
}

void sub_2592F0DE0(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  uint64_t v39 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v32 - v11;
  int64_t v13 = 0;
  uint64_t v14 = a3;
  uint64_t v15 = *(void *)(a3 + 64);
  uint64_t v35 = a3 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v34 = MEMORY[0x263F8EE78];
  unint64_t v40 = MEMORY[0x263F8EE78];
  unint64_t v18 = v17 & v15;
  int64_t v36 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v13++, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v13 >= v36) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v35 + 8 * v13);
    if (!v22) {
      break;
    }
LABEL_18:
    unint64_t v18 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_19:
    uint64_t v24 = *(void *)(v39 + 72);
    sub_2592207A0(*(void *)(v14 + 56) + v24 * v20, (uint64_t)v9, &qword_26A37C990);
    sub_25924A404((uint64_t)v9, (uint64_t)v12, &qword_26A37C990);
    char v25 = v37(v12);
    if (v3)
    {
      sub_25924A3A8((uint64_t)v12, &qword_26A37C990);
      swift_release();
LABEL_32:
      swift_release();
      return;
    }
    if (v25)
    {
      sub_25924A404((uint64_t)v12, v33, &qword_26A37C990);
      unint64_t v26 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_25925D044(0, *(void *)(v26 + 16) + 1, 1);
      }
      unint64_t v27 = v40;
      unint64_t v29 = *(void *)(v40 + 16);
      unint64_t v28 = *(void *)(v40 + 24);
      unint64_t v30 = v29 + 1;
      if (v29 >= v28 >> 1)
      {
        unint64_t v34 = v29 + 1;
        unint64_t v32 = v29;
        sub_25925D044(v28 > 1, v29 + 1, 1);
        unint64_t v30 = v34;
        unint64_t v29 = v32;
        unint64_t v27 = v40;
      }
      *(void *)(v27 + 16) = v30;
      uint64_t v31 = *(unsigned __int8 *)(v39 + 80);
      unint64_t v34 = v27;
      sub_25924A404(v33, v27 + ((v31 + 32) & ~v31) + v29 * v24, &qword_26A37C990);
    }
    else
    {
      sub_25924A3A8((uint64_t)v12, &qword_26A37C990);
    }
  }
  int64_t v23 = v13 + 1;
  if (v13 + 1 >= v36) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v35 + 8 * v23);
  if (v22) {
    goto LABEL_17;
  }
  int64_t v23 = v13 + 2;
  if (v13 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v35 + 8 * v23);
  if (v22) {
    goto LABEL_17;
  }
  int64_t v23 = v13 + 3;
  if (v13 + 3 >= v36) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v35 + 8 * v23);
  if (v22) {
    goto LABEL_17;
  }
  int64_t v23 = v13 + 4;
  if (v13 + 4 >= v36) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v35 + 8 * v23);
  if (v22)
  {
LABEL_17:
    int64_t v13 = v23;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v36) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v35 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_18;
    }
  }
LABEL_34:
  __break(1u);
}

uint64_t sub_2592F1168()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0) {
    uint64_t result = swift_task_reportUnexpectedExecutor();
  }
  if (!*(void *)(v0 + 72))
  {
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t result = swift_beginAccess();
    if (*(void *)(*(void *)(v0 + 40) + 16) && *(unsigned char *)(v0 + 64) != 1)
    {
      uint64_t v7 = *(void *)(v0 + 48);
      uint64_t v6 = *(void *)(v0 + 56);
      uint64_t v8 = sub_259309F20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
      uint64_t v9 = (void *)swift_allocObject();
      id v9[2] = 0;
      v9[3] = 0;
      void v9[4] = v1;
      v9[5] = v7;
      v9[6] = v6;
      swift_retain();
      uint64_t v10 = sub_2592F2294((uint64_t)v4, (uint64_t)&unk_26A37F880, (uint64_t)v9);
      sub_25924A3A8((uint64_t)v4, &qword_26A37CE58);
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(void *)(v1 + 72) = v10;
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2592F1460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  uint64_t v4 = sub_25930A500();
  v3[16] = v4;
  v3[17] = *(void *)(v4 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  uint64_t v5 = sub_25930A520();
  v3[20] = v5;
  v3[21] = *(void *)(v5 - 8);
  v3[22] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  v3[23] = type metadata accessor for CommunicationActor();
  v3[24] = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v7 = sub_259309E90();
  v3[25] = v7;
  v3[26] = v6;
  return MEMORY[0x270FA2498](sub_2592F1624, v7, v6);
}

uint64_t sub_2592F1624()
{
  swift_beginAccess();
  uint64_t v1 = sub_259264E74(0xD000000000000015, 0x800000025930E220, 0x94049F30F7200000);
  uint64_t v3 = v2;
  sub_25930A510();
  *(void *)(v0 + 64) = v1;
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
  *(unsigned char *)(v0 + 56) = 1;
  return MEMORY[0x270FA2498](sub_2592F16F4, 0, 0);
}

uint64_t sub_2592F16F4()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = sub_259307788(&qword_26A37E878, MEMORY[0x263F8F710]);
  sub_25930A840();
  sub_259307788(&qword_26A37E880, MEMORY[0x263F8F6D8]);
  sub_25930A530();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[27] = v5;
  v0[28] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[29] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2592F1888;
  uint64_t v8 = v0[19];
  uint64_t v7 = v0[20];
  return MEMORY[0x270FA2380](v8, v0 + 5, v7, v4);
}

uint64_t sub_2592F1888()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 216))(*(void *)(v2 + 152), *(void *)(v2 + 128));
    uint64_t v3 = sub_2592F1DA8;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = *(void *)(v2 + 168);
    uint64_t v6 = *(void *)(v2 + 176);
    uint64_t v8 = *(void *)(v2 + 160);
    (*(void (**)(void, void))(v2 + 216))(*(void *)(v2 + 152), *(void *)(v2 + 128));
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v4 = *(void *)(v2 + 200);
    uint64_t v5 = *(void *)(v2 + 208);
    uint64_t v3 = sub_2592F19E8;
  }
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2592F19E8()
{
  uint64_t v15 = v0;
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = v0 + 104;
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (*(void *)(*(void *)(*(void *)v1 + 40) + 16))
  {
    sub_2592F2488(*(uint8_t **)(v0 + 112), *(void *)(v0 + 120));
    uint64_t v2 = sub_259264E74(0xD000000000000015, 0x800000025930E220, 0x94049F30F7200000);
    uint64_t v4 = v3;
    sub_25930A510();
    *(void *)(v0 + 64) = v2;
    *(void *)(v0 + 72) = v4;
    *(void *)(v0 + 40) = 0;
    *(void *)(v0 + 48) = 0;
    *(unsigned char *)(v0 + 56) = 1;
    return MEMORY[0x270FA2498](sub_2592F16F4, 0, 0);
  }
  else
  {
    if (qword_26B2F3B80 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_259309860();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B2F3B68);
    swift_retain();
    uint64_t v6 = sub_259309840();
    os_log_type_t v7 = sub_25930A1D0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v14 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v11 = *(void *)(*(void *)v1 + 16);
      unint64_t v10 = *(void *)(*(void *)v1 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 96) = sub_25924FC14(v11, v10, &v14);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_25921A000, v6, v7, "%s: No More Requests, all done!", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v9, -1, -1);
      MEMORY[0x25A2DBAF0](v8, -1, -1);
    }
    else
    {
      swift_release();
    }
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(void *)(*(void *)(v0 + 104) + 72) = 0;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

uint64_t sub_2592F1DA8()
{
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  return MEMORY[0x270FA2498](sub_2592F1E1C, v1, v2);
}

uint64_t sub_2592F1E1C()
{
  unint64_t v20 = v0;
  if (qword_26B2F3B80 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = sub_259309860();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B2F3B68);
  swift_retain();
  id v3 = v1;
  swift_retain();
  id v4 = v1;
  uint64_t v5 = sub_259309840();
  os_log_type_t v6 = sub_25930A1D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v8 = v0[13];
    uint64_t v9 = *(void *)(v8 + 16);
    unint64_t v10 = *(void *)(v8 + 24);
    swift_bridgeObjectRetain();
    v0[10] = sub_25924FC14(v9, v10, &v19);
    sub_25930A2A0();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v7 + 12) = 2112;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v11 = (void *)v0[30];
    id v12 = v11;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v13;
    sub_25930A2A0();
    void *v17 = v13;

    _os_log_impl(&dword_25921A000, v5, v6, "%s: Failed to sleep during timeout task: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E078);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v18, -1, -1);
    MEMORY[0x25A2DBAF0](v7, -1, -1);
  }
  else
  {
    uint64_t v14 = (void *)v0[30];

    swift_release_n();
  }
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(void *)(v0[13] + 72) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_2592F21E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v10;
  *unint64_t v10 = v6;
  v10[1] = sub_2592438A0;
  return sub_2592F1460(a4, a5, a6);
}

uint64_t sub_2592F2294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2592207A0(a1, (uint64_t)v8, &qword_26A37CE58);
  uint64_t v9 = sub_259309F20();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_25924A3A8((uint64_t)v8, &qword_26A37CE58);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_259309E90();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_259309F10();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    void v16[3] = v13;
  }
  return swift_task_create();
}

void sub_2592F2488(uint8_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  long long v73 = a1;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  uint64_t v5 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25930A500();
  uint64_t v72 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  long long v71 = (char *)&v63 - v12;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for CommunicationActor();
  uint64_t v14 = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v75 = v13;
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  if (*(void *)(*(void *)(v2 + 40) + 16))
  {
    long long v70 = v8;
    if (qword_26B2F3B80 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_259309860();
    uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_26B2F3B68);
    swift_retain();
    uint64_t v69 = v16;
    uint64_t v17 = sub_259309840();
    int v18 = sub_25930A1A0();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      int v65 = v18;
      uint64_t v66 = a2;
      uint64_t v68 = v5;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v77 = (char *)v64;
      *(_DWORD *)uint64_t v19 = 136315394;
      uint64_t v67 = v14;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v20 = *(void *)(v3 + 16);
      unint64_t v21 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_25924FC14(v20, v21, (uint64_t *)&v77);
      sub_25930A2A0();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v22 = sub_25930A970();
      uint64_t v76 = sub_25924FC14(v22, v23, (uint64_t *)&v77);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25921A000, v17, (os_log_type_t)v65, "%s: Checking for timeout requests that are over %s old.", (uint8_t *)v19, 0x16u);
      uint64_t v24 = v64;
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v24, -1, -1);
      MEMORY[0x25A2DBAF0](v19, -1, -1);

      uint64_t v5 = v68;
    }
    else
    {

      swift_release();
    }
    sub_25930A4D0();
    uint64_t v32 = sub_25930A9A0();
    uint64_t v33 = MEMORY[0x25A2DB1F0](v32);
    unint64_t v34 = (unint64_t)v71;
    MEMORY[0x25A2DAD60](v33);
    uint64_t v35 = *(void (**)(char *, NSObject *))(v72 + 8);
    int64_t v36 = v70;
    v35(v10, v70);
    uint64_t v37 = sub_2592F06BC(v34);
    unint64_t v38 = v34;
    uint64_t v39 = v37;
    v35((char *)v38, v36);
    if (*(void *)(v39 + 16))
    {
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      unint64_t v40 = sub_259309840();
      int v41 = sub_25930A1D0();
      if (os_log_type_enabled(v40, (os_log_type_t)v41))
      {
        LODWORD(v72) = v41;
        uint64_t v68 = v5;
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        long long v71 = (char *)swift_slowAlloc();
        uint64_t v77 = v71;
        long long v73 = v42;
        *(_DWORD *)uint64_t v42 = 136315650;
        sub_259309E90();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v43 = v73;
        uint64_t v44 = *(void *)(v3 + 16);
        unint64_t v45 = *(void *)(v3 + 24);
        swift_bridgeObjectRetain();
        uint64_t v76 = sub_25924FC14(v44, v45, (uint64_t *)&v77);
        sub_25930A2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *((_WORD *)v43 + 6) = 2048;
        sub_259309E90();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        uint64_t v46 = v73;
        int64_t v47 = *(void *)(v39 + 16);
        swift_bridgeObjectRelease();
        uint64_t v76 = v47;
        sub_25930A2A0();
        swift_bridgeObjectRelease();
        *((_WORD *)v46 + 11) = 2080;
        sub_259309E90();
        char isCurrentExecutor = swift_task_isCurrentExecutor();
        uint64_t v49 = v68;
        if ((isCurrentExecutor & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        if (v47)
        {
          long long v70 = v40;
          uint64_t v76 = MEMORY[0x263F8EE78];
          sub_25925D024(0, v47, 0);
          uint64_t v50 = *(unsigned __int8 *)(v49 + 80);
          uint64_t v69 = v39;
          uint64_t v51 = v39 + ((v50 + 32) & ~v50);
          uint64_t v52 = *(void *)(v49 + 72);
          do
          {
            sub_2592207A0(v51, (uint64_t)v7, &qword_26A37C990);
            sub_259309E90();
            if ((swift_task_isCurrentExecutor() & 1) == 0) {
              swift_task_reportUnexpectedExecutor();
            }
            int v53 = *(_DWORD *)&v7[*(int *)(v74 + 32)];
            sub_25924A3A8((uint64_t)v7, &qword_26A37C990);
            uint64_t v54 = v76;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_25925D024(0, *(void *)(v54 + 16) + 1, 1);
              uint64_t v54 = v76;
            }
            unint64_t v56 = *(void *)(v54 + 16);
            unint64_t v55 = *(void *)(v54 + 24);
            if (v56 >= v55 >> 1)
            {
              sub_25925D024(v55 > 1, v56 + 1, 1);
              uint64_t v54 = v76;
            }
            *(void *)(v54 + 16) = v56 + 1;
            *(_DWORD *)(v54 + 4 * v56 + 32) = v53;
            v51 += v52;
            --v47;
          }
          while (v47);
          swift_bridgeObjectRelease();
          unint64_t v40 = v70;
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v54 = MEMORY[0x263F8EE78];
        }
        os_log_type_t v57 = v72;
        uint64_t v58 = v71;
        uint64_t v59 = v73;
        uint64_t v60 = MEMORY[0x25A2DA610](v54, MEMORY[0x263F8E8F8]);
        unint64_t v62 = v61;
        swift_bridgeObjectRelease();
        uint64_t v76 = sub_25924FC14(v60, v62, (uint64_t *)&v77);
        sub_25930A2A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25921A000, v40, v57, "%s: Timed out %ld requests: %s", v59, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x25A2DBAF0](v58, -1, -1);
        MEMORY[0x25A2DBAF0](v59, -1, -1);
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (qword_26B2F3B80 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_259309860();
    __swift_project_value_buffer(v25, (uint64_t)qword_26B2F3B68);
    swift_retain();
    unint64_t v26 = sub_259309840();
    os_log_type_t v27 = sub_25930A1A0();
    if (os_log_type_enabled(v26, v27))
    {
      unint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v77 = (char *)v29;
      *(_DWORD *)unint64_t v28 = 136315138;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v30 = *(void *)(v2 + 16);
      unint64_t v31 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_25924FC14(v30, v31, (uint64_t *)&v77);
      sub_25930A2A0();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25921A000, v26, v27, "%s: Checked timeout requests, is empty, returning.", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v29, -1, -1);
      MEMORY[0x25A2DBAF0](v28, -1, -1);
    }
    else
    {

      swift_release();
    }
  }
}

uint64_t sub_2592F2FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_2592F2FEC, 0, 0);
}

uint64_t sub_2592F2FEC()
{
  id v4 = (uint64_t (*)(void *, uint64_t))(v0[3] + *(int *)v0[3]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2592F30CC;
  uint64_t v2 = v0[5];
  return v4(&unk_26A37F8D8, v2);
}

uint64_t sub_2592F30CC()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592F3248;
  }
  else {
    uint64_t v2 = sub_2592F31E0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592F31E0()
{
  sub_259305F50(0, *(os_unfair_lock_s **)(*(void *)(v0 + 40) + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592F3248()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(*(void *)(v0 + 40) + 16) + 64);
  id v3 = v1;
  os_unfair_lock_lock(v2);
  uint64_t v4 = sub_2592EDF54(v1);
  uint64_t v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v4 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    uint64_t v10 = *(void *)(v6 + 16);
    uint64_t v11 = *(void **)(v0 + 56);
    if (v10)
    {
      id v12 = v11;
      swift_bridgeObjectRetain();
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)(v6 + 8 * j + 32))
        {
          uint64_t v17 = *(void **)(v0 + 56);
          *(void *)(v0 + 16) = v17;
          id v18 = v17;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
          uint64_t v19 = sub_25930A770();
          if (v19)
          {
            uint64_t v14 = v19;
          }
          else
          {
            uint64_t v14 = swift_allocError();
            void *v15 = *(void *)(v0 + 16);
          }
          swift_allocError();
          *uint64_t v16 = v14;
          swift_continuation_throwingResumeWithError();
        }
      }
      uint64_t v11 = *(void **)(v0 + 56);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v20 = v11;
    }
    sub_2592435BC(v4);

    uint64_t v9 = *(void **)(v0 + 56);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void **)(v0 + 56);
  }

  unint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_2592F3474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_2592F3498, 0, 0);
}

uint64_t sub_2592F3498()
{
  uint64_t v4 = (uint64_t (*)(void *, uint64_t))(v0[3] + *(int *)v0[3]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2592F3578;
  uint64_t v2 = v0[5];
  return v4(&unk_26A37F820, v2);
}

uint64_t sub_2592F3578()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592F36F4;
  }
  else {
    uint64_t v2 = sub_2592F368C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592F368C()
{
  sub_259306264(0, *(os_unfair_lock_s **)(*(void *)(v0 + 40) + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592F36F4()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(*(void *)(v0 + 40) + 16) + 64);
  id v3 = v1;
  os_unfair_lock_lock(v2);
  uint64_t v4 = sub_2592EE260(v1);
  uint64_t v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v4 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    uint64_t v10 = *(void *)(v6 + 16);
    uint64_t v11 = *(void **)(v0 + 56);
    if (v10)
    {
      id v12 = v11;
      swift_bridgeObjectRetain();
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)(v6 + 8 * j + 32))
        {
          uint64_t v17 = *(void **)(v0 + 56);
          *(void *)(v0 + 16) = v17;
          id v18 = v17;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
          uint64_t v19 = sub_25930A770();
          if (v19)
          {
            uint64_t v14 = v19;
          }
          else
          {
            uint64_t v14 = swift_allocError();
            void *v15 = *(void *)(v0 + 16);
          }
          swift_allocError();
          *uint64_t v16 = v14;
          swift_continuation_throwingResumeWithError();
        }
      }
      uint64_t v11 = *(void **)(v0 + 56);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v20 = v11;
    }
    sub_2592435BC(v4);

    uint64_t v9 = *(void **)(v0 + 56);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void **)(v0 + 56);
  }

  unint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_2592F3920(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_2592F3940, 0, 0);
}

uint64_t sub_2592F3940()
{
  uint64_t v1 = v0[3];
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A37F8E0 + dword_26A37F8E0);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2592F39FC;
  uint64_t v5 = v0[2];
  return v7(v5, v3, v2);
}

uint64_t sub_2592F39FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

Swift::Void __swiftcall XPCMessageCenter.Server.activate()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_259309900();
  MEMORY[0x270FA5388](v3);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = qword_26B2F3920;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_26B2F3918;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D68);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2593131D0;
  id v6 = v5;
  sub_2593098F0();
  sub_259307788(&qword_26B2F3D28, MEMORY[0x263F8F3F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D38);
  sub_259273278(&qword_26B2F3D40, &qword_26B2F3D38);
  sub_25930A330();
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = *(void *)(v2 + 80);
  *(void *)(v8 + 24) = *(void *)(v2 + 88);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(v2 + 96);
  *(void *)(v8 + 48) = *(void *)(v2 + 112);
  *(void *)(v8 + 56) = v7;
  sub_259309970();
  swift_allocObject();
  v1[4] = sub_259309950();
  swift_release();
  if (v1[4])
  {
    swift_retain();
    sub_259309960();
    swift_release();
  }
}

uint64_t XPCMessageCenter.Server.registerData<A>(request:callback:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a5;
  uint64_t v20 = a2;
  uint64_t v9 = *(void **)v5;
  uint64_t v10 = *(void *)(*(void *)v5 + 80);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v18 - v12;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v10;
  v14[3] = a4;
  v14[4] = v9[11];
  uint64_t v15 = v19;
  v14[5] = v9[12];
  v14[6] = v15;
  v14[7] = v9[13];
  uint64_t v16 = v20;
  void v14[8] = v9[14];
  v14[9] = v16;
  v14[10] = a3;
  unint64_t v21 = &unk_26A37F6D0;
  uint64_t v22 = v14;
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A37F6D8);
  sub_259309AE0();
  sub_259309B00();
  return swift_endAccess();
}

uint64_t XPCMessageCenter.Client.sendData(request:data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  _OWORD v5[2] = a1;
  uint64_t v6 = *v4;
  v5[7] = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  v5[8] = swift_task_alloc();
  uint64_t v7 = *(void *)(v6 + 80);
  v5[9] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[10] = v8;
  v5[11] = *(void *)(v8 + 64);
  v5[12] = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v10 = sub_259309E90();
  return MEMORY[0x270FA2498](sub_2592F42F8, v10, v9);
}

uint64_t sub_2592F42F8()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[6];
  unint64_t v27 = v0[5];
  uint64_t v28 = v0[8];
  uint64_t v7 = v0[4];
  uint64_t v29 = (uint64_t *)v0[2];
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v2, v0[3], v3);
  unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v9 = (v1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v3;
  *(void *)(v10 + 24) = *(void *)(v5 + 88);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(v5 + 96);
  *(void *)(v10 + 48) = *(void *)(v5 + 112);
  *(void *)(v10 + 56) = v6;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v10 + v8, v2, v3);
  uint64_t v11 = (uint64_t *)(v10 + v9);
  uint64_t *v11 = v7;
  v11[1] = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
  uint64_t v12 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DCA8);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 24) = 0;
  *(void *)(v13 + 16) = 0;
  swift_retain();
  sub_259261DE0(v7, v27);
  swift_retain();
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t v15 = sub_2592FE30C(MEMORY[0x263F8EE78]);
  uint64_t v17 = v16;
  uint64_t v18 = sub_2592FE15C(v14, sub_2592FE4E0, (uint64_t (*)(void, void, void))sub_259248AC0, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_259278C1C, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_25925CF64);
  uint64_t v20 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5B0);
  uint64_t v21 = swift_allocObject();
  *(_DWORD *)(v21 + 64) = 0;
  *(void *)(v21 + 16) = v15;
  *(void *)(v21 + 24) = v17;
  uint64_t v22 = MEMORY[0x263F8EE88];
  *(void *)(v21 + 32) = MEMORY[0x263F8EE88];
  *(void *)(v21 + 40) = v18;
  *(void *)(v21 + 48) = v20;
  *(void *)(v21 + 56) = v22;
  *(void *)(v12 + 16) = v21;
  *(void *)(v12 + 24) = v13;
  uint64_t v23 = sub_259309F20();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v28, 1, 1, v23);
  uint64_t v24 = (void *)swift_allocObject();
  void v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_26A37F6F0;
  v24[5] = v10;
  v24[6] = v12;
  swift_retain();
  sub_2592EBE08(v28, (uint64_t)&unk_26A37F5B8, (uint64_t)v24);
  swift_release();
  swift_release();
  *uint64_t v29 = v12;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_2592F45F4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7165527472617473 && a2 == 0xEC00000074736575;
  if (v2 || (sub_25930A7C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x78654E6863746566 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25930A7C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2592F470C(char a1)
{
  if (a1) {
    return 0x78654E6863746566;
  }
  else {
    return 0x7165527472617473;
  }
}

uint64_t sub_2592F4750(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_2592F7358(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void))sub_259222BCC);
}

uint64_t sub_2592F476C(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_2592F73C0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_259222BDC);
}

uint64_t sub_2592F4784(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_2592F73F8(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void, void))sub_259222BDC);
}

uint64_t sub_2592F479C(void *a1, uint64_t a2)
{
  return sub_2592F7470(a1, a2, (uint64_t (*)(void, void, void, void, void, void))sub_2592F470C);
}

uint64_t sub_2592F47B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_2592F7650(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_2592F45F4, a4);
}

uint64_t sub_2592F47CC()
{
  return 0;
}

uint64_t sub_2592F47D8@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_2592F76A8(a1, (uint64_t (*)(void, void, void, void, void))sub_2592D65CC, a2);
}

uint64_t sub_2592F47F0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F4844(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F4898(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_25930A7C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25930A7C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2592F495C(char a1)
{
  if (a1) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_2592F4974(void *a1, void *a2)
{
  unint64_t v4 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v6 = a2[5];
  uint64_t v8 = a2[6];
  uint64_t v51 = a2[2];
  uint64_t v5 = v51;
  unint64_t v52 = v4;
  uint64_t v53 = v7;
  uint64_t v54 = v6;
  uint64_t v55 = v8;
  uint64_t NextCodingKeys = type metadata accessor for XPCMessageCenter.XPCRequest.FetchNextCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v42 = sub_25930A710();
  uint64_t v36 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  unint64_t v40 = (char *)&v33 - v9;
  unint64_t v52 = v4;
  uint64_t v53 = v7;
  uint64_t v54 = v6;
  uint64_t v55 = v8;
  uint64_t started = type metadata accessor for XPCMessageCenter.XPCRequest.StartRequestCodingKeys();
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v38 = started;
  uint64_t v43 = sub_25930A710();
  uint64_t v33 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v50 = (char *)&v33 - v11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v34 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v48 = (char *)&v33 - v12;
  uint64_t v13 = *(a2 - 1);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = v5;
  unint64_t v52 = v4;
  uint64_t v53 = v7;
  uint64_t v54 = v6;
  uint64_t v44 = v8;
  uint64_t v55 = v8;
  type metadata accessor for XPCMessageCenter.XPCRequest.CodingKeys();
  swift_getWitnessTable();
  uint64_t v17 = sub_25930A710();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v45 = v17;
  uint64_t v46 = v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v33 - v19;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25930A950();
  (*(void (**)(char *, unint64_t, void *))(v13 + 16))(v16, v49, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = v36;
    LOBYTE(v51) = 1;
    uint64_t v22 = v40;
    uint64_t v23 = v45;
    sub_25930A6D0();
    uint64_t v24 = v42;
    sub_25930A700();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v24);
    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v20, v23);
  }
  else
  {
    uint64_t v26 = AssociatedTypeWitness;
    unint64_t v27 = (uint64_t *)&v16[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    uint64_t v28 = *v27;
    unint64_t v49 = v27[1];
    uint64_t v29 = v34;
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v48, v16, v26);
    LOBYTE(v51) = 0;
    uint64_t v30 = v45;
    sub_25930A6D0();
    LOBYTE(v51) = 0;
    uint64_t v31 = v43;
    uint64_t v32 = v47;
    sub_25930A6F0();
    if (v32)
    {
      sub_259261F50(v28, v49);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v50, v31);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v48, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v20, v30);
    }
    else
    {
      uint64_t v51 = v28;
      unint64_t v52 = v49;
      char v56 = 1;
      sub_259308A64();
      sub_25930A6F0();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v50, v31);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v48, v26);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v20, v30);
      return sub_259261F50(v28, v49);
    }
  }
}

uint64_t sub_2592F4FA4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  long long v79 = a1;
  uint64_t v54 = a7;
  *(void *)&long long v76 = a2;
  *((void *)&v76 + 1) = a3;
  *(void *)&long long v77 = a4;
  *((void *)&v77 + 1) = a5;
  uint64_t v78 = a6;
  uint64_t NextCodingKeys = type metadata accessor for XPCMessageCenter.XPCRequest.FetchNextCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v65 = NextCodingKeys;
  uint64_t v56 = sub_25930A6C0();
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v66 = (char *)&v51 - v13;
  *(void *)&long long v76 = a2;
  *((void *)&v76 + 1) = a3;
  *(void *)&long long v77 = a4;
  *((void *)&v77 + 1) = a5;
  uint64_t v78 = a6;
  uint64_t started = type metadata accessor for XPCMessageCenter.XPCRequest.StartRequestCodingKeys();
  uint64_t v62 = swift_getWitnessTable();
  uint64_t v63 = started;
  uint64_t v60 = sub_25930A6C0();
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  long long v70 = (char *)&v51 - v15;
  *(void *)&long long v76 = a2;
  *((void *)&v76 + 1) = a3;
  *(void *)&long long v77 = a4;
  *((void *)&v77 + 1) = a5;
  uint64_t v78 = a6;
  type metadata accessor for XPCMessageCenter.XPCRequest.CodingKeys();
  uint64_t v72 = (_DWORD *)swift_getWitnessTable();
  uint64_t v69 = sub_25930A6C0();
  uint64_t v67 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v17 = (char *)&v51 - v16;
  uint64_t v57 = a2;
  *(void *)&long long v76 = a2;
  *((void *)&v76 + 1) = a3;
  uint64_t v58 = a4;
  *(void *)&long long v77 = a4;
  *((void *)&v77 + 1) = a5;
  uint64_t v61 = a5;
  uint64_t v78 = a6;
  uint64_t v68 = type metadata accessor for XPCMessageCenter.XPCRequest();
  uint64_t v53 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v51 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v51 - v24;
  uint64_t v26 = v79;
  __swift_project_boxed_opaque_existential_1(v79, v79[3]);
  long long v71 = v17;
  unint64_t v27 = v73;
  sub_25930A940();
  if (v27) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  }
  uint64_t v72 = v19;
  unint64_t v52 = v22;
  uint64_t v28 = v70;
  long long v73 = v25;
  uint64_t v29 = v68;
  uint64_t v30 = v69;
  uint64_t v31 = v71;
  *(void *)&long long v74 = sub_25930A6B0();
  sub_259309E70();
  swift_getWitnessTable();
  *(void *)&long long v76 = sub_25930A320();
  *((void *)&v76 + 1) = v32;
  *(void *)&long long v77 = v33;
  *((void *)&v77 + 1) = v34;
  sub_25930A310();
  swift_getWitnessTable();
  sub_25930A120();
  char v35 = v74;
  if (v74 == 2 || (long long v51 = v76, v74 = v76, v75 = v77, (sub_25930A150() & 1) == 0))
  {
    uint64_t v37 = sub_25930A450();
    swift_allocError();
    uint64_t v39 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37FA90);
    *uint64_t v39 = v29;
    sub_25930A670();
    sub_25930A440();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F8DCB0], v37);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v31, v30);
    uint64_t v26 = v79;
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  }
  if (v35)
  {
    LOBYTE(v74) = 1;
    int v41 = v66;
    sub_25930A660();
    uint64_t v43 = v56;
    int v44 = sub_25930A6A0();
    uint64_t v45 = v41;
    LODWORD(v41) = v44;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v45, v43);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v31, v30);
    uint64_t v47 = (char *)v72;
    *uint64_t v72 = v41;
  }
  else
  {
    LOBYTE(v74) = 0;
    uint64_t v36 = v30;
    sub_25930A660();
    swift_getAssociatedTypeWitness();
    LOBYTE(v74) = 0;
    uint64_t v42 = v60;
    sub_25930A690();
    swift_getTupleTypeMetadata2();
    LOBYTE(v74) = 1;
    sub_259308B30();
    sub_25930A690();
    uint64_t v46 = v67;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v28, v42);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v31, v36);
    uint64_t v47 = v52;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
  unint64_t v49 = v73;
  v48(v73, v47, v29);
  uint64_t v50 = v79;
  v48(v54, v49, v29);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
}

BOOL sub_2592F58B0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2592F58C0()
{
  return sub_25930A8D0();
}

uint64_t sub_2592F58E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7274537472617473 && a2 == 0xEB000000006D6165;
  if (v2 || (sub_25930A7C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1954047342 && a2 == 0xE400000000000000 || (sub_25930A7C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6563637553646E65 && a2 == 0xEA00000000007373 || (sub_25930A7C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x726F727245646E65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25930A7C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_2592F5AB8()
{
  return sub_25930A910();
}

uint64_t sub_2592F5B00(char a1)
{
  uint64_t result = 0x7274537472617473;
  switch(a1)
  {
    case 1:
      uint64_t result = 1954047342;
      break;
    case 2:
      uint64_t result = 0x6563637553646E65;
      break;
    case 3:
      uint64_t result = 0x726F727245646E65;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2592F5B98(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25930A7C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2592F5C08(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v75 = a4;
  unint64_t v64 = a3;
  uint64_t v65 = a2;
  uint64_t v70 = a5;
  unint64_t v71 = a6;
  uint64_t v72 = a7;
  uint64_t v73 = a8;
  uint64_t v74 = a9;
  uint64_t v14 = type metadata accessor for XPCMessageCenter.XPCResponse.EndErrorCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v58 = v14;
  uint64_t v63 = sub_25930A710();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v59 = (char *)v42 - v15;
  uint64_t v70 = a5;
  unint64_t v71 = a6;
  uint64_t v72 = a7;
  uint64_t v73 = a8;
  uint64_t v74 = a9;
  uint64_t v16 = type metadata accessor for XPCMessageCenter.XPCResponse.EndSuccessCodingKeys();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v54 = v16;
  uint64_t v53 = v17;
  uint64_t v52 = sub_25930A710();
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  unint64_t v49 = (char *)v42 - v18;
  uint64_t v70 = a5;
  unint64_t v71 = a6;
  uint64_t v72 = a7;
  uint64_t v73 = a8;
  uint64_t v74 = a9;
  uint64_t CodingKeys = type metadata accessor for XPCMessageCenter.XPCResponse.NextCodingKeys();
  uint64_t v20 = swift_getWitnessTable();
  uint64_t v46 = CodingKeys;
  uint64_t v45 = v20;
  uint64_t v50 = sub_25930A710();
  uint64_t v48 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v47 = (char *)v42 - v21;
  uint64_t v70 = a5;
  unint64_t v71 = a6;
  uint64_t v72 = a7;
  uint64_t v73 = a8;
  uint64_t v74 = a9;
  type metadata accessor for XPCMessageCenter.XPCResponse.StartStreamCodingKeys();
  v42[1] = swift_getWitnessTable();
  uint64_t v44 = sub_25930A710();
  uint64_t v43 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v23 = (char *)v42 - v22;
  uint64_t v70 = a5;
  unint64_t v71 = a6;
  uint64_t v55 = a9;
  unint64_t v56 = a6;
  uint64_t v60 = a7;
  uint64_t v72 = a7;
  uint64_t v73 = a8;
  uint64_t v62 = a8;
  uint64_t v74 = a9;
  type metadata accessor for XPCMessageCenter.XPCResponse.CodingKeys();
  swift_getWitnessTable();
  uint64_t v24 = sub_25930A710();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v66 = v24;
  uint64_t v67 = v25;
  MEMORY[0x270FA5388](v24);
  unint64_t v27 = (char *)v42 - v26;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v28 = v27;
  sub_25930A950();
  switch((char)v75)
  {
    case 1:
      LOBYTE(v70) = 1;
      unint64_t v38 = v64;
      uint64_t v37 = v65;
      sub_259261DE0(v65, v64);
      uint64_t v39 = v47;
      uint64_t v40 = v66;
      sub_25930A6D0();
      uint64_t v70 = v37;
      unint64_t v71 = v38;
      sub_259308A64();
      uint64_t v41 = v50;
      sub_25930A6F0();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v41);
      (*(void (**)(char *, uint64_t))(v67 + 8))(v28, v40);
      uint64_t result = sub_2592EAED8(v37, v38, 1);
      break;
    case 2:
      LOBYTE(v70) = 3;
      uint64_t v32 = v59;
      uint64_t v33 = v66;
      sub_25930A6D0();
      uint64_t v68 = v65;
      unint64_t v69 = v64;
      uint64_t v70 = a5;
      unint64_t v71 = v56;
      uint64_t v72 = v60;
      uint64_t v73 = v62;
      uint64_t v74 = v55;
      type metadata accessor for XPCMessageCenter.XPCErrorResponse();
      swift_getWitnessTable();
      uint64_t v34 = v63;
      sub_25930A6F0();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v32, v34);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v27, v33);
      break;
    case 3:
      LOBYTE(v70) = 2;
      char v35 = v49;
      uint64_t v36 = v66;
      sub_25930A6D0();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v35, v52);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v27, v36);
      break;
    default:
      LOBYTE(v70) = 0;
      uint64_t v29 = v66;
      sub_25930A6D0();
      uint64_t v30 = v44;
      sub_25930A700();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v23, v30);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v27, v29);
      break;
  }
  return result;
}

uint64_t sub_2592F6380(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)&long long v87 = a2;
  *((void *)&v87 + 1) = a3;
  *(void *)&long long v88 = a4;
  *((void *)&v88 + 1) = a5;
  uint64_t v89 = a6;
  uint64_t v12 = type metadata accessor for XPCMessageCenter.XPCResponse.EndErrorCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v77 = v12;
  uint64_t v67 = sub_25930A6C0();
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v70 = (char *)&v55 - v13;
  *(void *)&long long v87 = a2;
  *((void *)&v87 + 1) = a3;
  *(void *)&long long v88 = a4;
  *((void *)&v88 + 1) = a5;
  uint64_t v89 = a6;
  uint64_t v14 = type metadata accessor for XPCMessageCenter.XPCResponse.EndSuccessCodingKeys();
  uint64_t v74 = swift_getWitnessTable();
  uint64_t v75 = v14;
  uint64_t v65 = sub_25930A6C0();
  uint64_t v64 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  unint64_t v69 = (char *)&v55 - v15;
  *(void *)&long long v87 = a2;
  *((void *)&v87 + 1) = a3;
  *(void *)&long long v88 = a4;
  *((void *)&v88 + 1) = a5;
  uint64_t v89 = a6;
  uint64_t CodingKeys = type metadata accessor for XPCMessageCenter.XPCResponse.NextCodingKeys();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v73 = CodingKeys;
  uint64_t v72 = v17;
  uint64_t v63 = sub_25930A6C0();
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v68 = (char *)&v55 - v18;
  *(void *)&long long v87 = a2;
  *((void *)&v87 + 1) = a3;
  *(void *)&long long v88 = a4;
  *((void *)&v88 + 1) = a5;
  uint64_t v89 = a6;
  uint64_t started = type metadata accessor for XPCMessageCenter.XPCResponse.StartStreamCodingKeys();
  uint64_t v71 = swift_getWitnessTable();
  uint64_t v61 = sub_25930A6C0();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v21 = (char *)&v55 - v20;
  *(void *)&long long v87 = a2;
  *((void *)&v87 + 1) = a3;
  uint64_t v81 = a4;
  uint64_t v82 = a5;
  *(void *)&long long v88 = a4;
  *((void *)&v88 + 1) = a5;
  uint64_t v79 = a6;
  uint64_t v89 = a6;
  type metadata accessor for XPCMessageCenter.XPCResponse.CodingKeys();
  swift_getWitnessTable();
  uint64_t v80 = sub_25930A6C0();
  uint64_t v78 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v23 = (char *)&v55 - v22;
  uint64_t v24 = a1;
  uint64_t v25 = a1[3];
  uint64_t v26 = v24[4];
  uint64_t v83 = v24;
  __swift_project_boxed_opaque_existential_1(v24, v25);
  uint64_t v27 = v90;
  sub_25930A940();
  if (!v27)
  {
    uint64_t v57 = started;
    unint64_t v56 = v21;
    uint64_t v90 = a3;
    uint64_t v28 = v81;
    uint64_t v58 = 0;
    uint64_t v29 = v82;
    uint64_t v30 = v80;
    uint64_t v59 = v23;
    *(void *)&long long v87 = sub_25930A6B0();
    sub_259309E70();
    swift_getWitnessTable();
    *(void *)&long long v85 = sub_25930A320();
    *((void *)&v85 + 1) = v31;
    *(void *)&long long v86 = v32;
    *((void *)&v86 + 1) = v33;
    sub_25930A310();
    swift_getWitnessTable();
    sub_25930A120();
    uint64_t v34 = v30;
    if (v87 == 4 || (v55 = v85, v87 = v85, long long v88 = v86, (sub_25930A150() & 1) == 0))
    {
      uint64_t v26 = sub_25930A450();
      swift_allocError();
      uint64_t v43 = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A37FA90);
      *(void *)&long long v87 = a2;
      *((void *)&v87 + 1) = v90;
      *(void *)&long long v88 = v28;
      *((void *)&v88 + 1) = v29;
      uint64_t v89 = v79;
      uint64_t *v43 = type metadata accessor for XPCMessageCenter.XPCResponse();
      uint64_t v44 = v59;
      sub_25930A670();
      sub_25930A440();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v43, *MEMORY[0x263F8DCB0], v26);
      swift_willThrow();
      swift_unknownObjectRelease();
      uint64_t v45 = *(void (**)(char *, uint64_t))(v78 + 8);
      uint64_t v46 = v44;
      uint64_t v47 = v30;
LABEL_8:
      v45(v46, v47);
    }
    else
    {
      char v35 = v59;
      uint64_t v36 = v79;
      uint64_t v37 = v58;
      uint64_t v26 = v90;
      switch((int)v90)
      {
        case 1:
          LOBYTE(v87) = 1;
          unint64_t v49 = v68;
          sub_25930A660();
          if (v37) {
            goto LABEL_13;
          }
          sub_259308B30();
          uint64_t v50 = v63;
          sub_25930A690();
          uint64_t v51 = v78;
          (*(void (**)(char *, uint64_t))(v62 + 8))(v49, v50);
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v51 + 8))(v35, v34);
          uint64_t v26 = v87;
          break;
        case 2:
          LOBYTE(v87) = 2;
          uint64_t v26 = (uint64_t)v69;
          sub_25930A660();
          if (v37) {
            goto LABEL_13;
          }
          (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v26, v65);
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v78 + 8))(v35, v34);
          uint64_t v26 = 0;
          break;
        case 3:
          LOBYTE(v87) = 3;
          uint64_t v52 = v59;
          uint64_t v53 = v70;
          sub_25930A660();
          if (v37)
          {
            swift_unknownObjectRelease();
            uint64_t v45 = *(void (**)(char *, uint64_t))(v78 + 8);
            uint64_t v46 = v52;
            goto LABEL_18;
          }
          *(void *)&long long v87 = a2;
          *((void *)&v87 + 1) = v26;
          *(void *)&long long v88 = v28;
          *((void *)&v88 + 1) = v29;
          uint64_t v89 = v36;
          type metadata accessor for XPCMessageCenter.XPCErrorResponse();
          swift_getWitnessTable();
          uint64_t v54 = v67;
          sub_25930A690();
          (*(void (**)(char *, uint64_t))(v66 + 8))(v53, v54);
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v78 + 8))(v59, v34);
          uint64_t v26 = v84;
          break;
        default:
          LOBYTE(v87) = 0;
          unint64_t v38 = v56;
          sub_25930A660();
          if (v37)
          {
LABEL_13:
            swift_unknownObjectRelease();
            uint64_t v45 = *(void (**)(char *, uint64_t))(v78 + 8);
            uint64_t v46 = v35;
LABEL_18:
            uint64_t v47 = v34;
            goto LABEL_8;
          }
          uint64_t v39 = v61;
          int v40 = sub_25930A6A0();
          uint64_t v41 = v78;
          LODWORD(v26) = v40;
          (*(void (**)(char *, uint64_t))(v60 + 8))(v38, v39);
          swift_unknownObjectRelease();
          (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v34);
          uint64_t v26 = v26;
          break;
      }
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v83);
  return v26;
}

uint64_t sub_2592F6E8C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25930A7C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2592F6F14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v14[0] = a3;
  v14[1] = a4;
  v14[2] = a5;
  v14[3] = a6;
  v14[4] = a7;
  v14[5] = a8;
  type metadata accessor for XPCMessageCenter.XPCErrorResponse.CodingKeys();
  swift_getWitnessTable();
  uint64_t v9 = sub_25930A710();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v14 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25930A950();
  sub_25930A6E0();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_2592F7084(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v14[1] = a2;
  v14[2] = a3;
  v14[3] = a4;
  v14[4] = a5;
  v14[5] = a6;
  type metadata accessor for XPCMessageCenter.XPCErrorResponse.CodingKeys();
  swift_getWitnessTable();
  uint64_t v8 = sub_25930A6C0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - v10;
  uint64_t v12 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25930A940();
  if (!v6)
  {
    uint64_t v12 = sub_25930A680();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v12;
}

uint64_t sub_2592F7238()
{
  return 1;
}

uint64_t sub_2592F7244()
{
  return sub_25930A8D0();
}

uint64_t sub_2592F7270()
{
  return 12383;
}

uint64_t sub_2592F7280@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_2592F7C20(a1, (uint64_t (*)(void, void, void, void, void))sub_2592F7238, a2);
}

uint64_t sub_2592F7298(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F72EC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F7340(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4)
{
  return sub_2592F7358(a1, a2, a3, a4, (uint64_t (*)(void, void, void, void, void, void, void))sub_2593091A0);
}

uint64_t sub_2592F7358(unsigned __int8 *a1, unsigned __int8 *a2, void *a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void, void))
{
  return a5(*a1, *a2, a3[2], a3[3], a3[4], a3[5], a3[6]);
}

uint64_t sub_2592F737C()
{
  return sub_259222C04();
}

uint64_t sub_2592F73A8(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_2592F73C0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_259309198);
}

uint64_t sub_2592F73C0(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void, void))
{
  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5], a2[6]);
}

uint64_t sub_2592F73E0(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_2592F73F8(a1, a2, a3, (void (*)(unsigned char *, void, void, void, void, void, void))sub_259309198);
}

uint64_t sub_2592F73F8(uint64_t a1, void *a2, uint64_t a3, void (*a4)(unsigned char *, void, void, void, void, void, void))
{
  sub_25930A8C0();
  a4(v8, *v4, a2[2], a2[3], a2[4], a2[5], a2[6]);
  return sub_25930A910();
}

uint64_t sub_2592F7458(void *a1, uint64_t a2)
{
  return sub_2592F7470(a1, a2, (uint64_t (*)(void, void, void, void, void, void))sub_2592F495C);
}

uint64_t sub_2592F7470(void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void, void))
{
  return a3(*v3, a1[2], a1[3], a1[4], a1[5], a1[6]);
}

uint64_t sub_2592F7490@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_2592F7650(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_2592F4898, a4);
}

uint64_t sub_2592F74A8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F74FC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F7550@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, char *a3@<X8>)
{
  return sub_2592F4FA4(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a3);
}

uint64_t sub_2592F7578(void *a1, void *a2)
{
  return sub_2592F4974(a1, a2);
}

BOOL sub_2592F7590(char *a1, char *a2)
{
  return sub_2592F58B0(*a1, *a2);
}

uint64_t sub_2592F75AC()
{
  return sub_2592F5AB8();
}

uint64_t sub_2592F75C0()
{
  return sub_2592F58C0();
}

uint64_t sub_2592F75D4()
{
  return sub_25930A910();
}

uint64_t sub_2592F7624()
{
  return sub_2592F5B00(*v0);
}

uint64_t sub_2592F7638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_2592F7650(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_2592F58E8, a4);
}

uint64_t sub_2592F7650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void)@<X4>, unsigned char *a5@<X8>)
{
  uint64_t result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6]);
  *a5 = result;
  return result;
}

uint64_t sub_2592F7690@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_2592F76A8(a1, (uint64_t (*)(void, void, void, void, void))sub_25930918C, a2);
}

uint64_t sub_2592F76A8@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5], a1[6]);
  *a3 = result;
  return result;
}

uint64_t sub_2592F76E8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F773C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F7790@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2592F5B98(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2592F77CC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F7820(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F7874()
{
  return 0;
}

uint64_t sub_2592F7880@<X0>(unsigned char *a1@<X8>)
{
  char v2 = sub_2592F7238();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 & 1;
  return result;
}

uint64_t sub_2592F78D4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F7928(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F797C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F79D0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F7A24(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F7A78(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F7ACC@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_2592F6380(a1, a2[2], a2[3], a2[4], a2[5], a2[6]);
  if (!v3)
  {
    *(void *)a3 = result;
    *(void *)(a3 + 8) = v6;
    *(unsigned char *)(a3 + 16) = v7;
  }
  return result;
}

uint64_t sub_2592F7B0C(void *a1, uint64_t a2)
{
  return sub_2592F5C08(a1, *(void *)v2, *(void *)(v2 + 8), *(unsigned __int8 *)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48));
}

uint64_t sub_2592F7B48()
{
  return sub_25930A910();
}

uint64_t sub_2592F7B8C()
{
  return sub_25930A910();
}

uint64_t sub_2592F7BCC()
{
  return 0x6567617373656DLL;
}

uint64_t sub_2592F7BE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2592F6E8C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2592F7C20@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5], a1[6]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2592F7C64(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2592F7CB8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_2592F7D0C@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_2592F7084(a1, a2[2], a2[3], a2[4], a2[5], a2[6]);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
  }
  return result;
}

uint64_t sub_2592F7D48(void *a1, uint64_t *a2)
{
  return sub_2592F6F14(a1, *v2, v2[1], a2[2], a2[3], a2[4], a2[5], a2[6]);
}

uint64_t sub_2592F7D74()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_2593098B0();
  MEMORY[0x270FA5388](v5 - 8);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v0[4])
  {
    uint64_t v6 = v0[4];
LABEL_7:
    swift_retain();
    return v6;
  }
  sub_2593098E0();
  uint64_t v7 = qword_26B2F3920;
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)qword_26B2F3918;
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = *(void *)(v4 + 80);
  *(void *)(v10 + 24) = *(void *)(v4 + 88);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(v4 + 96);
  *(void *)(v10 + 48) = *(void *)(v4 + 112);
  *(void *)(v10 + 56) = v9;
  id v11 = v8;
  swift_retain();
  sub_2593098A0();
  uint64_t v6 = sub_259309890();
  swift_release();
  if (!v2)
  {
    v3[4] = v6;
    swift_retain();
    swift_release();
    goto LABEL_7;
  }
  return v6;
}

uint64_t sub_2592F801C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_259309980();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = a2 + 16;
  if (qword_26B2F3B60 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_259309860();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B2F32A0);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v10(v7, a1, v4);
  id v11 = sub_259309840();
  uint64_t v12 = v7;
  os_log_type_t v13 = sub_25930A1B0();
  if (os_log_type_enabled(v11, v13))
  {
    v20[1] = v8;
    uint64_t v21 = v12;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    v20[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138412290;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    sub_259307788(&qword_26A37F6B0, MEMORY[0x263F8F408]);
    swift_allocError();
    uint64_t v15 = v21;
    v10(v16, (uint64_t)v21, v4);
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v22 = v17;
    sub_25930A2A0();
    uint64_t v18 = v20[0];
    *(void *)v20[0] = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
    _os_log_impl(&dword_25921A000, v11, v13, "Session Cancelled: %@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E078);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v18, -1, -1);
    MEMORY[0x25A2DBAF0](v14, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(void *)(result + 32) = 0;
    swift_release();
    return swift_release();
  }
  return result;
}

void *XPCMessageCenter.Client.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  v2[3] = a2;
  v2[4] = 0;
  void v2[2] = a1;
  return v2;
}

uint64_t sub_2592F8418()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t XPCMessageCenter.Client.deinit()
{
  if (*(void *)(v0 + 32))
  {
    swift_retain();
    sub_2593098D0();
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t XPCMessageCenter.Client.__deallocating_deinit()
{
  XPCMessageCenter.Client.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2592F84EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[18] = a5;
  v6[19] = a6;
  v6[16] = a3;
  v6[17] = a4;
  v6[14] = a1;
  v6[15] = a2;
  uint64_t v7 = *(void **)a3;
  uint64_t v8 = *(void *)(*(void *)a3 + 80);
  v6[20] = v8;
  uint64_t v9 = v7[11];
  v6[21] = v9;
  uint64_t v10 = v7[12];
  v6[22] = v10;
  uint64_t v11 = v7[13];
  v6[23] = v11;
  uint64_t v12 = v7[14];
  unsigned char v6[24] = v12;
  _OWORD v6[2] = v8;
  v6[3] = v9;
  v6[4] = v10;
  v6[5] = v11;
  v6[6] = v12;
  uint64_t v13 = type metadata accessor for XPCMessageCenter.XPCRequest();
  v6[25] = v13;
  v6[26] = *(void *)(v13 - 8);
  v6[27] = swift_task_alloc();
  v6[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2592F8650, 0, 0);
}

uint64_t sub_2592F8650()
{
  uint64_t v1 = v0[28];
  unint64_t v2 = v0[19];
  uint64_t v3 = v0[18];
  swift_getAssociatedTypeWitness();
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(swift_getTupleTypeMetadata2() + 48));
  sub_259309D60();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_storeEnumTagMultiPayload();
  sub_259261DE0(v3, v2);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[29] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2592F8788;
  uint64_t v6 = v0[28];
  return sub_2592F91C8(v6);
}

uint64_t sub_2592F8788(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = (void *)*v4;
  uint64_t v6 = (void *)*v4;
  v6[30] = a1;
  v6[31] = a2;
  *((unsigned char *)v6 + 328) = a3;
  v6[32] = v3;
  swift_task_dealloc();
  uint64_t v7 = v5[28];
  uint64_t v8 = v5[26];
  uint64_t v9 = v5[25];
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  uint64_t v10 = v8 + 8;
  uint64_t v11 = v12;
  if (v3)
  {
    v11(v7, v9);
    uint64_t v13 = sub_2592F90E4;
  }
  else
  {
    v6[33] = v11;
    v6[34] = v10 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v11(v7, v9);
    uint64_t v13 = sub_2592F8918;
  }
  return MEMORY[0x270FA2498](v13, 0, 0);
}

uint64_t sub_2592F8918()
{
  char v1 = *(unsigned char *)(v0 + 328);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 240);
    unint64_t v2 = *(void *)(v0 + 248);
    sub_25928A790();
    swift_allocError();
    *uint64_t v4 = 0;
    swift_willThrow();
    sub_2592EAED8(v3, v2, v1);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    **(_DWORD **)(v0 + 216) = *(void *)(v0 + 240);
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v7;
    void *v7 = v0;
    v7[1] = sub_2592F8A6C;
    uint64_t v8 = *(void *)(v0 + 216);
    return sub_2592F91C8(v8);
  }
}

uint64_t sub_2592F8A6C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = (void *)*v4;
  uint64_t v7 = (void *)*v4;
  v7[36] = a1;
  v7[37] = a2;
  v7[38] = v3;
  swift_task_dealloc();
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v6[33];
  uint64_t v9 = v6[27];
  uint64_t v10 = v6[25];
  if (v3)
  {
    v8(v9, v10);
    uint64_t v11 = sub_2592F9150;
  }
  else
  {
    *((unsigned char *)v7 + 329) = a3;
    v8(v9, v10);
    uint64_t v11 = sub_2592F8BFC;
  }
  return MEMORY[0x270FA2498](v11, 0, 0);
}

uint64_t sub_2592F8BFC()
{
  switch(*(unsigned char *)(v0 + 329))
  {
    case 1:
      uint64_t v10 = *(void *)(v0 + 288);
      unint64_t v11 = *(void *)(v0 + 296);
      uint64_t v12 = *(int **)(v0 + 112);
      *(void *)(v0 + 96) = v10;
      *(void *)(v0 + 104) = v11;
      sub_259261DE0(v10, v11);
      uint64_t v14 = (uint64_t (*)(uint64_t))((char *)v12 + *v12);
      uint64_t v13 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_2592F8E50;
      return v14(v0 + 96);
    case 2:
      *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 160);
      uint64_t v5 = *(void *)(v0 + 288);
      uint64_t v4 = *(void *)(v0 + 296);
      uint64_t v2 = *(void *)(v0 + 240);
      unint64_t v1 = *(void *)(v0 + 248);
      uint64_t v6 = *(void *)(v0 + 192);
      *(_OWORD *)(v0 + 72) = *(_OWORD *)(v0 + 176);
      *(void *)(v0 + 88) = v6;
      type metadata accessor for XPCMessageCenter.XPCErrorResponse();
      swift_getWitnessTable();
      swift_allocError();
      void *v7 = v5;
      v7[1] = v4;
      goto LABEL_4;
    case 3:
      sub_2592EAED8(*(void *)(v0 + 240), *(void *)(v0 + 248), 0);
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_6;
    default:
      uint64_t v2 = *(void *)(v0 + 240);
      unint64_t v1 = *(void *)(v0 + 248);
      sub_25928A790();
      swift_allocError();
      *uint64_t v3 = 1;
LABEL_4:
      swift_willThrow();
      sub_2592EAED8(v2, v1, 0);
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
LABEL_6:
      return v8();
  }
}

uint64_t sub_2592F8E50()
{
  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2592F9038;
  }
  else {
    uint64_t v2 = sub_2592F8F64;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2592F8F64()
{
  uint64_t v1 = v0[36];
  unint64_t v2 = v0[37];
  sub_2592EAED8(v1, v2, 1);
  sub_2592EAED8(v1, v2, 1);
  *(_DWORD *)v0[27] = v0[30];
  swift_storeEnumTagMultiPayload();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[35] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2592F8A6C;
  uint64_t v4 = v0[27];
  return sub_2592F91C8(v4);
}

uint64_t sub_2592F9038()
{
  uint64_t v1 = v0[36];
  unint64_t v2 = v0[37];
  uint64_t v4 = v0[30];
  unint64_t v3 = v0[31];
  sub_2592EAED8(v1, v2, 1);
  sub_2592EAED8(v1, v2, 1);
  sub_2592EAED8(v4, v3, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2592F90E4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592F9150()
{
  sub_2592EAED8(v0[30], v0[31], 0);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2592F91C8(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  v2[12] = *v1;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  v2[13] = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v4 = sub_259309E90();
  v2[14] = v4;
  v2[15] = v3;
  return MEMORY[0x270FA2498](sub_2592F92E4, v4, v3);
}

uint64_t sub_2592F92E4()
{
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = off_26B2F3928;
  uint64_t v4 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 128) = v4;
  v4[1] = vextq_s8(*(int8x16_t *)(v0 + 80), *(int8x16_t *)(v0 + 80), 8uLL);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v5;
  uint64_t v6 = *(void *)(v2 + 112);
  long long v7 = *(_OWORD *)(v2 + 96);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v0 + 32) = v7;
  *(void *)(v0 + 48) = v6;
  uint64_t v8 = type metadata accessor for XPCMessageCenter.XPCResponse();
  *uint64_t v5 = v0;
  v5[1] = sub_2592F941C;
  return MEMORY[0x270FA2360](v0 + 56, v3, v1, 0x73656D28646E6573, 0xEE00293A65676173, sub_259306F9C, v4, v8);
}

uint64_t sub_2592F941C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 112);
    uint64_t v4 = *(void *)(v2 + 120);
    uint64_t v5 = sub_2592F9558;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 112);
    uint64_t v4 = *(void *)(v2 + 120);
    uint64_t v5 = sub_2592F9538;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592F9538()
{
  return (*(uint64_t (**)(void, void, void))(v0 + 8))(*(void *)(v0 + 56), *(void *)(v0 + 64), *(unsigned __int8 *)(v0 + 72));
}

uint64_t sub_2592F9558()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592F95BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = a3;
  uint64_t v29 = a1;
  uint64_t v3 = *(void *)(*(void *)a2 + 80);
  uint64_t v4 = *(void *)(*(void *)a2 + 88);
  uint64_t v5 = *(void *)(*(void *)a2 + 96);
  uint64_t v6 = *(void *)(*(void *)a2 + 104);
  uint64_t v25 = *(void *)(*(void *)a2 + 112);
  uint64_t v26 = v3;
  uint64_t v30 = v3;
  uint64_t v31 = v4;
  uint64_t v32 = v5;
  uint64_t v33 = v6;
  uint64_t v34 = v25;
  uint64_t v7 = type metadata accessor for XPCMessageCenter.XPCResponse();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  uint64_t v27 = v7;
  uint64_t v8 = sub_259309EC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)v24 - v10;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v12 = sub_2592F7D74();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v29, v8);
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  void v24[2] = v12;
  uint64_t v14 = (v13 + 56) & ~v13;
  uint64_t v15 = (char *)swift_allocObject();
  uint64_t v16 = v6;
  uint64_t v17 = v5;
  uint64_t v18 = v4;
  uint64_t v19 = v26;
  *((void *)v15 + 2) = v26;
  *((void *)v15 + 3) = v18;
  *((void *)v15 + 4) = v17;
  *((void *)v15 + 5) = v16;
  uint64_t v20 = v8;
  uint64_t v21 = v25;
  *((void *)v15 + 6) = v25;
  uint64_t v22 = *(void (**)(char *, char *))(v9 + 32);
  v24[1] = v20;
  v22(&v15[v14], v11);
  uint64_t v30 = v19;
  uint64_t v31 = v18;
  uint64_t v32 = v17;
  uint64_t v33 = v16;
  uint64_t v34 = v21;
  type metadata accessor for XPCMessageCenter.XPCRequest();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_2593098C0();
  swift_release();
  return swift_release();
}

uint64_t sub_2592F9944(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  int v4 = *(unsigned __int8 *)(a1 + 17);
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (v4)
  {
    id v5 = v1;
    type metadata accessor for XPCMessageCenter.XPCResponse();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
    sub_259309EC0();
    return sub_259309EA0();
  }
  else
  {
    sub_2592EB01C((uint64_t)v1, v2, v3);
    type metadata accessor for XPCMessageCenter.XPCResponse();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
    sub_259309EC0();
    return sub_259309EB0();
  }
}

uint64_t XPCMessageCenter.Server.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  XPCMessageCenter.Server.init(serviceName:)(a1, a2);
  return v4;
}

void *XPCMessageCenter.Server.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A37F6D8);
  swift_getTupleTypeMetadata2();
  sub_259309DF0();
  v2[5] = sub_259309AA0();
  void v2[2] = a1;
  v2[3] = a2;
  uint64_t v5 = sub_259264E74(0xD000000000000015, 0x800000025930B4C0, 0x86AC351052600000);
  uint64_t v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3B58);
  uint64_t v8 = swift_allocObject();
  *(_DWORD *)(v8 + 32) = 0;
  unint64_t v9 = sub_259220580(MEMORY[0x263F8EE78]);
  *(void *)(v8 + 72) = 0;
  *(void *)(v8 + 40) = v9;
  *(void *)(v8 + 48) = v5;
  *(void *)(v8 + 56) = v7;
  *(unsigned char *)(v8 + 64) = 0;
  *(void *)(v8 + 16) = 0xD000000000000010;
  *(void *)(v8 + 24) = 0x800000025930B4E0;
  v2[6] = v8;
  return v2;
}

uint64_t XPCMessageCenter.Server.deinit()
{
  if (*(void *)(v0 + 32))
  {
    swift_retain();
    sub_259309940();
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t XPCMessageCenter.Server.__deallocating_deinit()
{
  XPCMessageCenter.Server.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2592F9D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_259309910();
  if (v15 != 1) {
    return sub_259309930();
  }
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = a7;
  v13[7] = a2;
  swift_retain();
  sub_259309920();
  return swift_release();
}

uint64_t sub_2592F9F34()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592F9F6C(uint64_t a1)
{
  return sub_2592F9D54(a1, v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

void sub_2592F9F7C(BOOL *a1@<X8>)
{
  v12[1] = *MEMORY[0x263EF8340];
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  BOOL v1 = sub_2592D8620();
  if (!v1)
  {
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_259309860();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B2F32A0);
    char v3 = sub_259309840();
    os_log_type_t v4 = sub_25930A1D0();
    if (os_log_type_enabled(v3, v4))
    {
      os_log_type_t v10 = v4;
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      v12[0] = v9;
      *(_DWORD *)uint64_t v5 = 136315138;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      if (xpc_copy_code_signing_identity_for_token())
      {
        uint64_t v6 = sub_259309C30();
        unint64_t v8 = v7;
      }
      else
      {
        uint64_t v6 = 4144959;
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        unint64_t v8 = 0xE300000000000000;
      }
      sub_25924FC14(v6, v8, v12);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25921A000, v3, v10, "Rejecting Request from %s: Missing Entitlement", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v9, -1, -1);
      MEMORY[0x25A2DBAF0](v5, -1, -1);
    }
    else
    {
    }
  }
  *a1 = v1;
}

double sub_2592FA31C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  uint64_t isCurrentExecutor = swift_task_isCurrentExecutor();
  if ((isCurrentExecutor & 1) == 0) {
    uint64_t isCurrentExecutor = swift_task_reportUnexpectedExecutor();
  }
  MEMORY[0x270FA5388](isCurrentExecutor);
  void v18[2] = a3;
  v18[3] = a4;
  void v18[4] = a5;
  v18[5] = a6;
  v18[6] = a7;
  v18[7] = a2;
  v18[8] = a1;
  sub_2592EB124((uint64_t)sub_25930718C, (uint64_t)v18);
  *(void *)(a8 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a8 = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  return result;
}

uint64_t sub_2592FA48C@<X0>(uint64_t a1@<X1>, BOOL *a2@<X8>)
{
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  type metadata accessor for CommunicationActor();
  sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  uint64_t v5 = result;
  if (result)
  {
    sub_2592FA5C8(a1);
    uint64_t result = swift_release();
  }
  *a2 = v5 == 0;
  return result;
}

uint64_t sub_2592FA5C8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v96 = a1;
  char v3 = (void *)*v1;
  uint64_t v82 = sub_2593099B0();
  unint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v79 = v4;
  uint64_t v80 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37CE58);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v90 = (uint64_t)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990);
  MEMORY[0x270FA5388](v83);
  long long v87 = (void **)((char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = v3[12];
  uint64_t v9 = v3[10];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v86 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(void *)(v86 + 64);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v85 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  long long v88 = (char *)&v75 - v12;
  uint64_t v13 = v3[11];
  uint64_t v14 = v3[13];
  uint64_t v15 = v3[14];
  uint64_t v94 = v9;
  uint64_t v95 = v8;
  uint64_t v100 = v9;
  uint64_t v101 = v13;
  uint64_t v92 = v13;
  uint64_t v93 = v14;
  uint64_t v102 = v8;
  uint64_t v103 = v14;
  uint64_t v91 = v15;
  uint64_t v104 = v15;
  uint64_t v16 = type metadata accessor for XPCMessageCenter.XPCRequest();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (int *)((char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v75 - v21;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  uint64_t v23 = off_26B2F3928;
  type metadata accessor for CommunicationActor();
  uint64_t v84 = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  sub_259309E90();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_getWitnessTable();
  sub_2593099A0();
  uint64_t v78 = v17;
  (*(void (**)(int *, char *, uint64_t))(v17 + 16))(v19, v22, v16);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v77 = v22;
  if (EnumCaseMultiPayload == 1)
  {
    int v25 = *v19;
    uint64_t v26 = sub_259309F20();
    uint64_t v27 = v90;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v90, 1, 1, v26);
    unint64_t v28 = v81;
    uint64_t v29 = v80;
    uint64_t v30 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v80, v96, v82);
    unint64_t v31 = (*(unsigned __int8 *)(v28 + 80) + 84) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v84;
    *(void *)(v32 + 16) = v23;
    *(void *)(v32 + 24) = v33;
    uint64_t v34 = v92;
    *(void *)(v32 + 32) = v94;
    *(void *)(v32 + 40) = v34;
    uint64_t v35 = v93;
    *(void *)(v32 + 48) = v95;
    *(void *)(v32 + 56) = v35;
    *(void *)(v32 + 64) = v91;
    *(void *)(v32 + 72) = v2;
    *(_DWORD *)(v32 + 80) = v25;
    (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v32 + v31, v29, v30);
    swift_retain();
    swift_retain();
    sub_2592EBE08(v27, (uint64_t)&unk_26A37F850, v32);
    swift_release();
  }
  else
  {
    uint64_t v36 = AssociatedTypeWitness;
    uint64_t v37 = (uint64_t *)((char *)v19 + *(int *)(swift_getTupleTypeMetadata2() + 48));
    uint64_t v39 = *v37;
    unint64_t v38 = v37[1];
    uint64_t v82 = v39;
    unint64_t v81 = v38;
    uint64_t v40 = v86;
    uint64_t v41 = *(char **)(v86 + 32);
    uint64_t v79 = v86 + 32;
    uint64_t v80 = v41;
    ((void (*)(char *, int *, uint64_t))v41)(v88, v19, v36);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E618);
    uint64_t v42 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DCA8);
    uint64_t v43 = swift_allocObject();
    *(_DWORD *)(v43 + 24) = 0;
    *(void *)(v43 + 16) = 0;
    uint64_t v44 = MEMORY[0x263F8EE78];
    uint64_t v45 = sub_2592FE30C(MEMORY[0x263F8EE78]);
    uint64_t v47 = v46;
    uint64_t v48 = sub_2592FE15C(v44, sub_2592FE4E0, (uint64_t (*)(void, void, void))sub_259248AC0, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_259278C1C, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_25925CF64);
    uint64_t v50 = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F5B0);
    uint64_t v51 = swift_allocObject();
    *(_DWORD *)(v51 + 64) = 0;
    *(void *)(v51 + 16) = v45;
    *(void *)(v51 + 24) = v47;
    uint64_t v52 = MEMORY[0x263F8EE88];
    *(void *)(v51 + 32) = MEMORY[0x263F8EE88];
    *(void *)(v51 + 40) = v48;
    *(void *)(v51 + 48) = v50;
    *(void *)(v51 + 56) = v52;
    *(void *)(v42 + 16) = v51;
    *(void *)(v42 + 24) = v43;
    uint64_t v76 = v42;
    swift_retain();
    uint64_t v53 = v87;
    sub_2592EF1BC(v42, v87);
    swift_release();
    uint64_t v83 = *(unsigned int *)((char *)v53 + *(int *)(v83 + 32));
    uint64_t v54 = sub_259309F20();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v90, 1, 1, v54);
    uint64_t v55 = v40;
    unint64_t v56 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    uint64_t v57 = AssociatedTypeWitness;
    v56(v85, v88, AssociatedTypeWitness);
    uint64_t v58 = off_26B2F3928;
    uint64_t v75 = off_26B2F3928;
    unint64_t v59 = (*(unsigned __int8 *)(v55 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
    unint64_t v60 = (v10 + v59 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v61 = (v60 + 11) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v62 = (v61 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v63 = (v62 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v64 = (void *)swift_allocObject();
    uint64_t v65 = v84;
    v64[2] = v58;
    v64[3] = v65;
    uint64_t v66 = v92;
    v64[4] = v94;
    v64[5] = v66;
    uint64_t v67 = v93;
    v64[6] = v95;
    v64[7] = v67;
    uint64_t v68 = (char *)v64 + v59;
    uint64_t v69 = v91;
    v64[8] = v91;
    ((void (*)(char *, char *, uint64_t))v80)(v68, v85, v57);
    uint64_t v70 = v83;
    *(_DWORD *)((char *)v64 + v60) = v83;
    *(void *)((char *)v64 + v61) = v2;
    uint64_t v71 = (void *)((char *)v64 + v62);
    uint64_t v72 = v82;
    unint64_t v73 = v81;
    uint64_t *v71 = v82;
    v71[1] = v73;
    *(void *)((char *)v64 + v63) = v76;
    swift_retain();
    sub_259261DE0(v72, v73);
    swift_retain();
    swift_retain();
    sub_2592EBE08(v90, (uint64_t)&unk_26A37F860, (uint64_t)v64);
    swift_release();
    uint64_t v97 = v70;
    uint64_t v98 = 0;
    char v99 = 0;
    uint64_t v100 = v94;
    uint64_t v101 = v92;
    uint64_t v102 = v95;
    uint64_t v103 = v93;
    uint64_t v104 = v69;
    type metadata accessor for XPCMessageCenter.XPCResponse();
    swift_getWitnessTable();
    sub_259309990();
    swift_release();
    sub_259261F50(v72, v73);
    sub_25924A3A8((uint64_t)v87, &qword_26A37C990);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v88, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v77, v16);
}

uint64_t sub_2592FB05C(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a6;
  *(void *)(v6 + 48) = v8;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a1;
  *(_OWORD *)(v6 + 56) = *a2;
  return MEMORY[0x270FA2498](sub_2592FB094, 0, 0);
}

uint64_t sub_2592FB094()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(int **)(v0 + 24);
  *(unsigned char *)(v0 + 88) = 2;
  *(_OWORD *)(v1 + 24) = *(_OWORD *)(v0 + 40);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v1);
  uint64_t v8 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t, uint64_t))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2592FB198;
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 64);
  return v8(boxed_opaque_existential_1, v5, v6, v0 + 88);
}

uint64_t sub_2592FB198()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2592FB2CC, 0, 0);
  }
  else
  {
    char v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2592FB2CC()
{
  __swift_deallocate_boxed_opaque_existential_1(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2592FB330()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592FB368(uint64_t a1, _OWORD *a2)
{
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(v2 + 48);
  uint64_t v8 = swift_task_alloc();
  long long v9 = *(_OWORD *)(v2 + 72);
  *(void *)(v3 + 16) = v8;
  *(void *)uint64_t v8 = v3;
  *(void *)(v8 + 8) = sub_2592438A0;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  *(_OWORD *)(v8 + 24) = v9;
  *(void *)(v8 + 16) = a1;
  *(_OWORD *)(v8 + 56) = *a2;
  return MEMORY[0x270FA2498](sub_2592FB094, 0, 0);
}

uint64_t sub_2592FB444()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  sub_259261F50(*(void *)(v0 + v4), *(void *)(v0 + v4 + 8));
  return swift_deallocObject();
}

uint64_t sub_2592FB528(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v2 + 16) - 8) + 80);
  uint64_t v7 = *(void *)(v2 + 56);
  uint64_t v8 = v2 + v6;
  long long v9 = (uint64_t *)(v2 + ((*(void *)(*(void *)(*(void *)(v2 + 16) - 8) + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_2592438A0;
  return sub_2592F84EC(a1, a2, v7, v8, v10, v11);
}

uint64_t sub_2592FB650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 312) = a8;
  *(void *)(v8 + 320) = v17;
  *(void *)(v8 + 296) = a6;
  *(void *)(v8 + 304) = a7;
  *(_DWORD *)(v8 + 596) = a5;
  *(void *)(v8 + 288) = a4;
  uint64_t v9 = *a6;
  *(void *)(v8 + 328) = *a6;
  *(void *)(v8 + 336) = *(void *)(v9 + 96);
  uint64_t v10 = *(void *)(v9 + 80);
  *(void *)(v8 + 344) = v10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(void *)(v8 + 352) = AssociatedTypeWitness;
  *(void *)(v8 + 360) = *(void *)(AssociatedTypeWitness - 8);
  *(void *)(v8 + 368) = swift_task_alloc();
  *(void *)(v8 + 376) = swift_task_alloc();
  uint64_t v12 = sub_25930A240();
  *(void *)(v8 + 384) = v12;
  *(void *)(v8 + 392) = *(void *)(v12 - 8);
  *(void *)(v8 + 400) = swift_task_alloc();
  *(void *)(v8 + 408) = *(void *)(v10 - 8);
  *(void *)(v8 + 416) = swift_task_alloc();
  *(void *)(v8 + 424) = swift_task_alloc();
  *(void *)(v8 + 432) = swift_task_alloc();
  *(void *)(v8 + 440) = swift_task_alloc();
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  *(void *)(v8 + 448) = type metadata accessor for CommunicationActor();
  *(void *)(v8 + 456) = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v14 = sub_259309E90();
  *(void *)(v8 + 464) = v14;
  *(void *)(v8 + 472) = v13;
  return MEMORY[0x270FA2498](sub_2592FB910, v14, v13);
}

uint64_t sub_2592FB910()
{
  uint64_t v92 = v0;
  uint64_t v1 = (void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v2 = *(void *)(v0 + 408);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 360) + 16);
  v5(*(void *)(v0 + 376), *(void *)(v0 + 288), *(void *)(v0 + 352));
  sub_259309D70();
  uint64_t v90 = (void *)(v0 + 256);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v4) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 392) + 8))(*(void *)(v0 + 400), *(void *)(v0 + 384));
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 368);
    uint64_t v7 = *(void *)(v0 + 352);
    uint64_t v8 = *(void *)(v0 + 288);
    uint64_t v9 = sub_259309860();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B2F32A0);
    v5(v6, v8, v7);
    uint64_t v10 = sub_259309840();
    os_log_type_t v11 = sub_25930A1B0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      v91[0] = v82;
      *(_DWORD *)uint64_t v12 = 67109378;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(_DWORD *)(v0 + 592) = *(_DWORD *)(v0 + 596);
      sub_25930A2A0();
      *(_WORD *)(v12 + 8) = 2080;
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v13 = *(void *)(v0 + 368);
      uint64_t v15 = *(void *)(v0 + 352);
      uint64_t v14 = *(void *)(v0 + 360);
      v5(*(void *)(v0 + 376), v13, v15);
      uint64_t v16 = sub_259309BE0();
      *(void *)(v0 + 272) = sub_25924FC14(v16, v17, v91);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      _os_log_impl(&dword_25921A000, v10, v11, "XPC %u: Invalid message type: %s", (uint8_t *)v12, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v82, -1, -1);
      MEMORY[0x25A2DBAF0](v12, -1, -1);

      uint64_t v1 = (void *)(v0 + 256);
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 360) + 8))(*(void *)(v0 + 368), *(void *)(v0 + 352));
    }
    sub_2592EAA68();
    uint64_t v41 = (void *)swift_allocError();
    *uint64_t v42 = 1;
    swift_willThrow();
    goto LABEL_35;
  }
  uint64_t v18 = *(void *)(v0 + 440);
  uint64_t v19 = *(void *)(v0 + 344);
  uint64_t v20 = *(void *)(v0 + 328);
  uint64_t v21 = *(void *)(v0 + 296);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 408) + 32))(v18, *(void *)(v0 + 400), v19);
  swift_beginAccess();
  uint64_t v22 = *(void *)(v21 + 40);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F6D8);
  MEMORY[0x25A2DA360](v18, v22, v19, v23, *(void *)(v20 + 88));
  int v25 = *(int **)(v0 + 144);
  uint64_t v24 = *(void *)(v0 + 152);
  *(void *)(v0 + 480) = v25;
  *(void *)(v0 + 488) = v24;
  if (!v25)
  {
    swift_endAccess();
    if (qword_26B2F3B60 != -1) {
      swift_once();
    }
    uint64_t v44 = *(void *)(v0 + 432);
    uint64_t v43 = *(void *)(v0 + 440);
    uint64_t v45 = *(void *)(v0 + 408);
    uint64_t v46 = *(void *)(v0 + 344);
    uint64_t v47 = sub_259309860();
    __swift_project_value_buffer(v47, (uint64_t)qword_26B2F32A0);
    uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
    v48(v44, v43, v46);
    uint64_t v49 = sub_259309840();
    os_log_type_t v50 = sub_25930A1B0();
    if (os_log_type_enabled(v49, v50))
    {
      os_log_type_t loga = v50;
      long long v87 = v49;
      uint64_t v51 = swift_slowAlloc();
      uint64_t v84 = swift_slowAlloc();
      v91[0] = v84;
      *(_DWORD *)uint64_t v51 = 67109378;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(_DWORD *)(v0 + 584) = *(_DWORD *)(v0 + 596);
      sub_25930A2A0();
      *(_WORD *)(v51 + 8) = 2080;
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v52 = *(void *)(v0 + 432);
      uint64_t v53 = *(void *)(v0 + 408);
      uint64_t v54 = *(void *)(v0 + 344);
      v48(*(void *)(v0 + 416), v52, v54);
      uint64_t v55 = sub_259309BE0();
      *(void *)(v0 + 248) = sub_25924FC14(v55, v56, v91);
      uint64_t v1 = (void *)(v0 + 256);
      sub_25930A2A0();
      swift_bridgeObjectRelease();
      uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v57(v52, v54);
      uint64_t v49 = v87;
      _os_log_impl(&dword_25921A000, v87, loga, "XPC %u: Couldn't find a registry for type: %s", (uint8_t *)v51, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x25A2DBAF0](v84, -1, -1);
      MEMORY[0x25A2DBAF0](v51, -1, -1);
    }
    else
    {
      uint64_t v57 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 408) + 8);
      v57(*(void *)(v0 + 432), *(void *)(v0 + 344));
    }

    uint64_t v60 = *(void *)(v0 + 440);
    uint64_t v61 = *(void *)(v0 + 344);
    sub_2592EAA68();
    uint64_t v41 = (void *)swift_allocError();
    *unint64_t v62 = 2;
    swift_willThrow();
    v57(v60, v61);
LABEL_35:
    os_log_t v89 = (os_log_t)v0;
    unint64_t v63 = (os_unfair_lock_s *)(*(void *)(*(void *)(v0 + 320) + 16) + 64);
    id v64 = v41;
    os_unfair_lock_lock(v63);
    uint64_t v65 = sub_2592EE260(v41);
    uint64_t v67 = v66;
    os_unfair_lock_unlock(v63);
    if (!v65)
    {
LABEL_53:

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      Class isa = (uint64_t (*)(void))v89[1].isa;
      return isa();
    }
    uint64_t v68 = *(void *)(v65 + 16);
    if (v68)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)(v65 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v70 = *(void *)(v67 + 16);
      if (v70) {
        goto LABEL_42;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v70 = *(void *)(v67 + 16);
      if (v70)
      {
LABEL_42:
        id v71 = v41;
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v70; ++j)
        {
          if (*(void *)(v67 + 8 * j + 32))
          {
            *uint64_t v1 = v41;
            id v77 = v41;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
            uint64_t v78 = sub_25930A770();
            if (v78)
            {
              uint64_t v74 = v78;
            }
            else
            {
              unint64_t v73 = v1;
              uint64_t v74 = swift_allocError();
              void *v75 = *v73;
            }
            swift_allocError();
            *uint64_t v76 = v74;
            swift_continuation_throwingResumeWithError();
            uint64_t v1 = v90;
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_52;
      }
    }
    id v79 = v41;
LABEL_52:
    sub_2592435BC(v65);

    swift_bridgeObjectRelease();
    goto LABEL_53;
  }
  swift_endAccess();
  if (qword_26B2F3B60 != -1) {
    swift_once();
  }
  uint64_t v26 = *(void *)(v0 + 440);
  uint64_t v27 = *(void *)(v0 + 424);
  uint64_t v28 = *(void *)(v0 + 408);
  uint64_t v29 = *(void *)(v0 + 344);
  uint64_t v30 = sub_259309860();
  *(void *)(v0 + 496) = __swift_project_value_buffer(v30, (uint64_t)qword_26B2F32A0);
  unint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
  v31(v27, v26, v29);
  uint64_t v32 = sub_259309840();
  os_log_type_t v33 = sub_25930A1A0();
  if (os_log_type_enabled(v32, v33))
  {
    os_log_type_t v83 = v33;
    log = v32;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    v91[0] = v81;
    *(_DWORD *)uint64_t v34 = 67109378;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(_DWORD *)(v0 + 588) = *(_DWORD *)(v0 + 596);
    sub_25930A2A0();
    *(_WORD *)(v34 + 8) = 2080;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v35 = *(void *)(v0 + 424);
    uint64_t v36 = *(void *)(v0 + 408);
    uint64_t v37 = *(void *)(v0 + 344);
    v31(*(void *)(v0 + 416), v35, v37);
    uint64_t v38 = sub_259309BE0();
    *(void *)(v0 + 280) = sub_25924FC14(v38, v39, v91);
    sub_25930A2A0();
    swift_bridgeObjectRelease();
    uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v40(v35, v37);
    uint64_t v32 = log;
    _os_log_impl(&dword_25921A000, log, v83, "XPC %u: Starting to process request %s", (uint8_t *)v34, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x25A2DBAF0](v81, -1, -1);
    MEMORY[0x25A2DBAF0](v34, -1, -1);
  }
  else
  {
    uint64_t v40 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 408) + 8);
    v40(*(void *)(v0 + 424), *(void *)(v0 + 344));
  }

  *(void *)(v0 + 504) = v40;
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 304);
  os_log_t v88 = (os_log_t)((char *)v25 + *v25);
  uint64_t v58 = (void *)swift_task_alloc();
  *(void *)(v0 + 512) = v58;
  void *v58 = v0;
  v58[1] = sub_2592FC560;
  return ((uint64_t (*)(uint64_t, uint64_t))v88)(v0 + 56, v0 + 208);
}

uint64_t sub_2592FC560()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 520) = v0;
  swift_task_dealloc();
  sub_25930764C(v2[60]);
  uint64_t v3 = v2[59];
  uint64_t v4 = v2[58];
  if (v0) {
    uint64_t v5 = sub_2592FC8D8;
  }
  else {
    uint64_t v5 = sub_2592FC6C8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_2592FC6C8()
{
  v0[30] = 0;
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_259309F80();
  swift_task_dealloc();
  swift_beginAccess();
  uint64_t v5 = v0[57];
  uint64_t v6 = off_26B2F3928;
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v7);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[66] = (uint64_t)v9;
  void *v9 = v0;
  v9[1] = sub_2592FCB68;
  return MEMORY[0x270FA1E88](v0 + 28, v6, v5, v0 + 33, v7, v8);
}

uint64_t sub_2592FC8D8()
{
  (*(void (**)(void, void))(v0 + 504))(*(void *)(v0 + 440), *(void *)(v0 + 344));
  uint64_t v1 = *(void **)(v0 + 520);
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(*(void *)(v0 + 320) + 16) + 64);
  id v3 = v1;
  os_unfair_lock_lock(v2);
  uint64_t v4 = sub_2592EE260(v1);
  uint64_t v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v4 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        uint64_t v10 = (void *)(v0 + 256);
        id v11 = v1;
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)(v6 + 8 * j + 32))
          {
            *uint64_t v10 = v1;
            id v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
            uint64_t v17 = sub_25930A770();
            if (v17)
            {
              uint64_t v13 = v17;
            }
            else
            {
              uint64_t v13 = swift_allocError();
              *uint64_t v14 = *v10;
            }
            swift_allocError();
            uint64_t *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    id v18 = v1;
LABEL_18:
    sub_2592435BC(v4);

    swift_bridgeObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_2592FCB68()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 536) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 464);
  uint64_t v4 = *(void *)(v2 + 472);
  if (v0) {
    uint64_t v5 = sub_2592FD404;
  }
  else {
    uint64_t v5 = sub_2592FCC7C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592FCC7C()
{
  unint64_t v1 = *(void *)(v0 + 232);
  *(void *)(v0 + 544) = *(void *)(v0 + 224);
  *(void *)(v0 + 552) = v1;
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    uint64_t v3 = *(void *)(v0 + 440);
    uint64_t v4 = *(void *)(v0 + 344);
    uint64_t v5 = *(void *)(v0 + 320);
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    sub_259306264(0, *(os_unfair_lock_s **)(v5 + 16));
    v2(v3, v4);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  else
  {
    uint64_t v8 = (void *)(v0 + 240);
    uint64_t v9 = sub_259309840();
    os_log_type_t v10 = sub_25930A1A0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 67109376;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(_DWORD *)(v11 + 4) = *(_DWORD *)(v0 + 596);
      *(_WORD *)(v11 + 8) = 2048;
      sub_259309E90();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(void *)(v11 + 10) = *v8;
      _os_log_impl(&dword_25921A000, v9, v10, "XPC %u: Enqueuing message %ld", (uint8_t *)v11, 0x12u);
      MEMORY[0x25A2DBAF0](v11, -1, -1);
    }

    if (__OFADD__(*v8, 1))
    {
      __break(1u);
    }
    else
    {
      *(void *)(v0 + 240) = *v8 + 1;
      uint64_t v12 = sub_2592FCF04;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
    return MEMORY[0x270FA2498](v12, v13, v14);
  }
}

uint64_t sub_2592FCF04()
{
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 544);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  uint64_t v4 = *(void *)(v2 + 48);
  if (v4 < 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
  }
  else
  {
    if (!*(void *)(v4 + 16))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
LABEL_15:
      os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
      uint64_t v20 = *(void *)(v3 + 16);
      *(void *)(v3 + 16) = v20 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
      uint64_t v21 = (void *)swift_task_alloc();
      *(void *)(v0 + 560) = v21;
      void v21[2] = v2;
      v21[3] = v3;
      v21[4] = v0 + 176;
      v21[5] = v20;
      uint64_t v22 = (void *)swift_task_alloc();
      *(void *)(v0 + 568) = v22;
      _OWORD v22[2] = v2;
      void v22[3] = v3;
      v22[4] = v20;
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 576) = v23;
      *uint64_t v23 = v0;
      v23[1] = sub_2592FD1BC;
      return MEMORY[0x270FA2338](v23, &unk_26A37F868);
    }
    uint64_t v5 = *(void *)(v2 + 16);
    uint64_t v6 = *(void *)(v2 + 24);
    uint64_t v8 = *(void *)(v2 + 32);
    uint64_t v7 = *(void *)(v2 + 40);
    uint64_t v9 = *(void *)(v2 + 56);
    *(void *)(v0 + 160) = v7;
    *(void *)(v0 + 168) = v4;
    if (v7)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(v0 + 536);
      uint64_t result = sub_259305E34(v7 + 16, v7 + 32, v4, 0);
      if (v11) {
        return result;
      }
      uint64_t v15 = result;
      uint64_t v9 = v10;
    }
    else
    {
      uint64_t v15 = 0;
    }
    sub_259300FE4(0, v15, sub_259302904);
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)(v0 + 160);
    uint64_t v19 = *(void *)(v0 + 168);
    *(void *)(v2 + 16) = v5;
    *(void *)(v2 + 24) = v6;
    *(void *)(v2 + 32) = v8;
    *(void *)(v2 + 40) = v18;
    *(void *)(v2 + 48) = v19;
    *(void *)(v2 + 56) = v9;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
    if (v17)
    {
      if (v17 == 1) {
        goto LABEL_15;
      }
      uint64_t v24 = *(void *)(v0 + 176);
      unint64_t v25 = *(void *)(v0 + 184);
      *(void *)(v0 + 192) = v24;
      *(void *)(v0 + 200) = v25;
      sub_259261DE0(v24, v25);
      sub_25924A404(v0 + 192, *(void *)(*(void *)(v17 + 64) + 40), &qword_26A37F630);
      swift_continuation_throwingResume();
    }
  }
  uint64_t v13 = *(void *)(v0 + 464);
  uint64_t v14 = *(void *)(v0 + 472);
  return MEMORY[0x270FA2498](sub_2592FD308, v13, v14);
}

uint64_t sub_2592FD1BC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2592FD2F0, 0, 0);
}

uint64_t sub_2592FD2F0()
{
  return MEMORY[0x270FA2498](sub_2592FD308, *(void *)(v0 + 464), *(void *)(v0 + 472));
}

uint64_t sub_2592FD308()
{
  sub_259277DC4(v0[68], v0[69]);
  uint64_t v1 = v0[57];
  uint64_t v2 = off_26B2F3928;
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[66] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2592FCB68;
  return MEMORY[0x270FA1E88](v0 + 28, v2, v1, v0 + 33, v3, v4);
}

uint64_t sub_2592FD404()
{
  (*(void (**)(void, void))(v0 + 504))(*(void *)(v0 + 440), *(void *)(v0 + 344));
  uint64_t v1 = *(void **)(v0 + 264);
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(*(void *)(v0 + 320) + 16) + 64);
  id v3 = v1;
  os_unfair_lock_lock(v2);
  uint64_t v4 = sub_2592EE260(v1);
  uint64_t v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v4 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = *(void *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        uint64_t v10 = (void *)(v0 + 256);
        id v11 = v1;
        swift_bridgeObjectRetain();
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)(v6 + 8 * j + 32))
          {
            *uint64_t v10 = v1;
            id v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
            uint64_t v17 = sub_25930A770();
            if (v17)
            {
              uint64_t v13 = v17;
            }
            else
            {
              uint64_t v13 = swift_allocError();
              *uint64_t v14 = *v10;
            }
            swift_allocError();
            uint64_t *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    id v18 = v1;
LABEL_18:
    sub_2592435BC(v4);

    swift_bridgeObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_2592FD6AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, uint64_t a6)
{
  *(_DWORD *)(v6 + 204) = a5;
  *(void *)(v6 + 264) = a4;
  *(void *)(v6 + 272) = a6;
  *(void *)(v6 + 280) = *a4;
  if (qword_26B2F3930 != -1) {
    swift_once();
  }
  *(void *)(v6 + 288) = type metadata accessor for CommunicationActor();
  *(void *)(v6 + 296) = sub_259307788((unint64_t *)&qword_26B2F3938, (void (*)(uint64_t))type metadata accessor for CommunicationActor);
  uint64_t v8 = sub_259309E90();
  *(void *)(v6 + 304) = v8;
  *(void *)(v6 + 312) = v7;
  return MEMORY[0x270FA2498](sub_2592FD7D0, v8, v7);
}

uint64_t sub_2592FD7D0()
{
  unsigned int v1 = *(_DWORD *)(v0 + 204);
  uint64_t v2 = *(void *)(v0 + 264);
  swift_retain();
  uint64_t v3 = sub_2592EF678(v1);
  swift_release();
  if (qword_26B2F3B60 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_259309860();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B2F32A0);
  uint64_t v5 = sub_259309840();
  os_log_type_t v6 = sub_25930A1A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109376;
    sub_259309E90();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(_DWORD *)(v0 + 180) = *(_DWORD *)(v0 + 204);
    sub_25930A2A0();
    *(_WORD *)(v7 + 8) = 2048;
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    *(void *)(v0 + 256) = v3;
    sub_25930A2A0();
    _os_log_impl(&dword_25921A000, v5, v6, "XPC %u: Reading message %ld", (uint8_t *)v7, 0x12u);
    MEMORY[0x25A2DBAF0](v7, -1, -1);
  }

  *(void *)(v0 + 320) = *(void *)(v2 + 48);
  id v11 = (uint64_t (*)(uint64_t, int))((char *)&dword_26A37F898 + dword_26A37F898);
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_2592FDA64;
  int v9 = *(_DWORD *)(v0 + 204);
  return v11(v0 + 232, v9);
}

uint64_t sub_2592FDA64()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 336) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 304);
    uint64_t v4 = *(void *)(v2 + 312);
    uint64_t v5 = sub_2592FDCD8;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 304);
    uint64_t v4 = *(void *)(v2 + 312);
    uint64_t v5 = sub_2592FDB80;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2592FDB80()
{
  unint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 280);
  if (v1 >> 60 == 15)
  {
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 80);
    *(void *)(v0 + 160) = 0;
    *(void *)(v0 + 168) = 0;
    *(unsigned char *)(v0 + 176) = 3;
    uint64_t v3 = *(void *)(v2 + 112);
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v2 + 96);
    *(void *)(v0 + 48) = v3;
    type metadata accessor for XPCMessageCenter.XPCResponse();
    swift_getWitnessTable();
    sub_259309990();
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 232);
    *(void *)(v0 + 184) = v4;
    *(void *)(v0 + 192) = v1;
    *(unsigned char *)(v0 + 200) = 1;
    uint64_t v5 = *(void *)(v2 + 112);
    long long v6 = *(_OWORD *)(v2 + 96);
    *(_OWORD *)(v0 + 56) = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v0 + 72) = v6;
    *(void *)(v0 + 88) = v5;
    type metadata accessor for XPCMessageCenter.XPCResponse();
    swift_getWitnessTable();
    sub_259309990();
    sub_259277DC4(v4, v1);
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2592FDCD8()
{
  unint64_t v1 = *(void **)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 280);
  swift_release();
  swift_getErrorValue();
  sub_25930A780();
  uint64_t v3 = *(void *)(v2 + 112);
  long long v4 = *(_OWORD *)(v2 + 80);
  long long v5 = *(_OWORD *)(v2 + 96);
  *(void *)(v0 + 208) = 0;
  *(void *)(v0 + 216) = 0xE000000000000000;
  *(unsigned char *)(v0 + 224) = 2;
  *(_OWORD *)(v0 + 96) = v4;
  *(_OWORD *)(v0 + 112) = v5;
  *(void *)(v0 + 128) = v3;
  type metadata accessor for XPCMessageCenter.XPCResponse();
  swift_getWitnessTable();
  sub_259309990();

  swift_bridgeObjectRelease();
  long long v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t XPCMessageCenter.deinit()
{
  return v0;
}

uint64_t XPCMessageCenter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2592FDE10(uint64_t a1, int *a2)
{
  long long v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *long long v4 = v2;
  v4[1] = sub_2592374A4;
  return v6(a1);
}

uint64_t sub_2592FDEEC(uint64_t a1)
{
  return sub_2592FE15C(a1, sub_2592FE4E0, (uint64_t (*)(void, void, void))sub_259248AA0, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_2592789C8, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_25925CEF4);
}

uint64_t sub_2592FDF40(uint64_t a1)
{
  uint64_t v3 = sub_2592FE4E0();
  uint64_t v4 = sub_2592FE4E8(&v12, a1, 0, 1, v3);
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = v12;
  if (v12 == v5) {
    return v4;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 < v12)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_2592789D4(a1, v1, 0, (2 * v6) | 1);
    goto LABEL_9;
  }
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28) - 8);
  uint64_t v1 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  sub_25930A7E0();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v8 = swift_dynamicCastClass();
  if (!v8)
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  uint64_t v9 = *(void *)(v8 + 16);
  swift_release();
  if (v9 != v6) {
    goto LABEL_14;
  }
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v13 = v4;
  uint64_t v14 = v10;
  if (*(void *)(a1 + 16) >= v5)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2592FEBA8(a1, v1, v6, (2 * v5) | 1);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_2592FE108(uint64_t a1)
{
  return sub_2592FE15C(a1, sub_2592FE4E0, (uint64_t (*)(void, void, void))sub_259248AC0, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_259278C1C, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_25925CF64);
}

uint64_t sub_2592FE15C(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void, void, void), uint64_t (*a4)(uint64_t, uint64_t, void, uint64_t), uint64_t (*a5)(BOOL, uint64_t, uint64_t))
{
  uint64_t v10 = a2();
  uint64_t v11 = sub_2592FE814(&v18, a1, 0, 1, v10, a3);
  unint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = v18;
  if (v18 == v12) {
    return v11;
  }
  if ((v18 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v12 < v18)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v16 = a4(a1, v5, 0, (2 * v13) | 1);
    goto LABEL_9;
  }
  uint64_t v5 = a1 + 32;
  sub_25930A7E0();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v14 = swift_dynamicCastClass();
  if (!v14)
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  uint64_t v15 = *(void *)(v14 + 16);
  swift_release();
  if (v15 != v13) {
    goto LABEL_14;
  }
  uint64_t v16 = swift_dynamicCastClass();
  if (!v16)
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v19 = v11;
  uint64_t v20 = v16;
  if (*(void *)(a1 + 16) >= v12)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2592FEEE0(a1, v5, v13, (2 * v12) | 1, a5);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v19;
  }
  __break(1u);
  return result;
}

uint64_t sub_2592FE30C(uint64_t a1)
{
  uint64_t v3 = sub_2592FE4E0();
  uint64_t v4 = sub_2592FE9E4(&v11, a1, 0, 1, v3);
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = v11;
  if (v11 == v5) {
    return v4;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 < v11)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_259278D90(a1, v1, 0, (2 * v6) | 1);
    goto LABEL_9;
  }
  uint64_t v1 = a1 + 32;
  sub_25930A7E0();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(v7 + 16);
  swift_release();
  if (v8 != v6) {
    goto LABEL_14;
  }
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v12 = v4;
  uint64_t v13 = v9;
  if (*(void *)(a1 + 16) >= v5)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2592FF280(a1, v1, v6, (2 * v5) | 1);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2592FE498()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2592FE4E0()
{
  return 0;
}

uint64_t sub_2592FE4E8(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (uint64_t *)((char *)&v36 - v15);
  double v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (uint64_t *)((char *)&v36 - v19);
  unint64_t v21 = *(void *)(a2 + 16);
  uint64_t v22 = MEMORY[0x25A2D9DA0](v21, v18);
  if (a4) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = a3;
  }
  if (v23 <= v22) {
    uint64_t v23 = v22;
  }
  if (v23 <= a5) {
    uint64_t v24 = a5;
  }
  else {
    uint64_t v24 = v23;
  }
  if (v24 > 4)
  {
    uint64_t v25 = MEMORY[0x25A2D9DB0]();
    sub_259300744(&v41, a2, (void *)(v25 + 16), v25 + 32);
    *a1 = v41;
  }
  else if (v21 >= 2)
  {
    uint64_t v38 = a1;
    uint64_t result = sub_259248AAC(0, v21, 0, MEMORY[0x263F8EE78]);
    unint64_t v27 = result;
    unint64_t v28 = 0;
    unint64_t v40 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    unint64_t v39 = a2 + v40;
    uint64_t v29 = *(void *)(v11 + 72);
    unint64_t v36 = v21;
    uint64_t v37 = v13;
    while (1)
    {
      if (v28 == v21)
      {
        __break(1u);
        return result;
      }
      sub_2592207A0(v39 + v29 * v28, (uint64_t)v20, &qword_26A37DF28);
      uint64_t v30 = *(void *)(v27 + 16);
      if (v30) {
        break;
      }
LABEL_20:
      sub_2592207A0((uint64_t)v20, (uint64_t)v13, &qword_26A37DF28);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v27 = sub_259248AAC(0, *(void *)(v27 + 16) + 1, 1, v27);
      }
      unint64_t v35 = *(void *)(v27 + 16);
      unint64_t v34 = *(void *)(v27 + 24);
      if (v35 >= v34 >> 1) {
        unint64_t v27 = sub_259248AAC(v34 > 1, v35 + 1, 1, v27);
      }
      ++v28;
      *(void *)(v27 + 16) = v35 + 1;
      sub_25924A404((uint64_t)v13, v27 + v40 + v35 * v29, &qword_26A37DF28);
      uint64_t result = sub_25924A3A8((uint64_t)v20, &qword_26A37DF28);
      if (v28 == v21)
      {
        swift_bridgeObjectRelease();
        uint64_t v25 = 0;
        *uint64_t v38 = v21;
        return v25;
      }
    }
    uint64_t v31 = v27 + v40;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_2592207A0(v31, (uint64_t)v16, &qword_26A37DF28);
      uint64_t v32 = *v16;
      uint64_t v33 = *v20;
      sub_25924A3A8((uint64_t)v16, &qword_26A37DF28);
      if (v32 == v33) {
        break;
      }
      v31 += v29;
      if (!--v30)
      {
        swift_bridgeObjectRelease();
        unint64_t v21 = v36;
        uint64_t v13 = v37;
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    sub_25924A3A8((uint64_t)v20, &qword_26A37DF28);
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
    *uint64_t v38 = v28;
  }
  else
  {
    uint64_t v25 = 0;
    *a1 = v21;
  }
  return v25;
}

uint64_t sub_2592FE814(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(void, void, void))
{
  unint64_t v12 = *(void *)(a2 + 16);
  uint64_t v13 = MEMORY[0x25A2D9DA0](v12);
  if (a4) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = a3;
  }
  if (v14 <= v13) {
    uint64_t v14 = v13;
  }
  if (v14 <= a5) {
    uint64_t v15 = a5;
  }
  else {
    uint64_t v15 = v14;
  }
  if (v15 > 4)
  {
    uint64_t v16 = MEMORY[0x25A2D9DB0]();
    sub_259300A24(&v28, a2, (void *)(v16 + 16));
    *a1 = v28;
    return v16;
  }
  if (v12 < 2)
  {
LABEL_11:
    uint64_t v16 = 0;
    *a1 = v12;
    return v16;
  }
  uint64_t result = ((uint64_t (*)(void, unint64_t, void, void))a6)(0, v12, 0, MEMORY[0x263F8EE78]);
  double v18 = (void *)result;
  unint64_t v19 = 0;
  uint64_t v20 = a2 + 32;
  while (v19 != v12)
  {
    long long v21 = *(_OWORD *)(v20 + 16 * v19);
    unint64_t v22 = v18[2];
    if (v22)
    {
      if (v18[4] == (void)v21) {
        goto LABEL_28;
      }
      if (v22 != 1)
      {
        if (v18[6] == (void)v21)
        {
LABEL_28:
          swift_bridgeObjectRelease();
          uint64_t v16 = 0;
          *a1 = v19;
          return v16;
        }
        if (v22 != 2)
        {
          uint64_t v23 = v18 + 8;
          uint64_t v24 = 2;
          while (1)
          {
            uint64_t v25 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              break;
            }
            if (*v23 == (void)v21) {
              goto LABEL_28;
            }
            ++v24;
            v23 += 2;
            if (v25 == v22) {
              goto LABEL_24;
            }
          }
          __break(1u);
          break;
        }
      }
    }
LABEL_24:
    unint64_t v26 = v18[3];
    if (v22 >= v26 >> 1)
    {
      long long v27 = *(_OWORD *)(v20 + 16 * v19);
      uint64_t result = a6(v26 > 1, v22 + 1, 1);
      long long v21 = v27;
      double v18 = (void *)result;
    }
    ++v19;
    void v18[2] = v22 + 1;
    *(_OWORD *)&v18[2 * v22 + 4] = v21;
    if (v19 == v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2592FE9E4(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  unint64_t v10 = *(void *)(a2 + 16);
  uint64_t v11 = MEMORY[0x25A2D9DA0](v10);
  if (a4) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = a3;
  }
  if (v12 <= v11) {
    uint64_t v12 = v11;
  }
  if (v12 <= a5) {
    uint64_t v13 = a5;
  }
  else {
    uint64_t v13 = v12;
  }
  if (v13 > 4)
  {
    uint64_t v14 = MEMORY[0x25A2D9DB0]();
    sub_259300B8C(&v29, a2, (void *)(v14 + 16));
    *a1 = v29;
  }
  else if (v10 >= 2)
  {
    uint64_t result = (uint64_t)sub_259248BD8(0, v10, 0, MEMORY[0x263F8EE78]);
    uint64_t v16 = (void *)result;
    unint64_t v17 = 0;
    uint64_t v18 = a2 + 32;
    while (1)
    {
      if (v17 == v10)
      {
        __break(1u);
        return result;
      }
      uint64_t v19 = v18 + 32 * v17;
      long long v20 = *(_OWORD *)v19;
      uint64_t v21 = *(void *)(v19 + 16);
      unint64_t v22 = *(void *)(v19 + 24);
      uint64_t v23 = v16[2];
      if (v23) {
        break;
      }
LABEL_19:
      long long v28 = v20;
      sub_259277D68(v21, v22);
      sub_259277D68(v21, v22);
      unint64_t v26 = v16[2];
      unint64_t v25 = v16[3];
      if (v26 >= v25 >> 1) {
        uint64_t v16 = sub_259248BD8((void *)(v25 > 1), v26 + 1, 1, v16);
      }
      v16[2] = v26 + 1;
      long long v27 = &v16[4 * v26];
      *((_OWORD *)v27 + 2) = v28;
      ++v17;
      v27[6] = v21;
      v27[7] = v22;
      uint64_t result = sub_259277DC4(v21, v22);
      if (v17 == v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    uint64_t v24 = 4;
    while (v16[v24] != (void)v20)
    {
      v24 += 4;
      if (!--v23) {
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v14 = 0;
    *a1 = v17;
  }
  else
  {
LABEL_11:
    uint64_t v14 = 0;
    *a1 = v10;
  }
  return v14;
}

void sub_2592FEBA8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (void *)((char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (void *)((char *)v38 - v14);
  int64_t v16 = a4 >> 1;
  if (v16 == a3) {
    return;
  }
  v38[1] = a1;
  swift_unknownObjectRetain();
  uint64_t v42 = a2;
  unint64_t v39 = v4;
  uint64_t v41 = v10;
  uint64_t v40 = v16;
  while (a3 < v16)
  {
    uint64_t v17 = *(void *)(v10 + 72);
    sub_2592207A0(a2 + v17 * a3, (uint64_t)v15, &qword_26A37DF28);
    uint64_t v19 = *v4;
    uint64_t v18 = v4[1];
    uint64_t v20 = v18 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    if (*v4)
    {
      sub_25930A8C0();
      sub_25930A900();
      uint64_t v21 = sub_25930A910();
      uint64_t v22 = 1 << *(void *)(v19 + 16);
      BOOL v23 = __OFSUB__(v22, 1);
      uint64_t v24 = v22 - 1;
      if (v23) {
        goto LABEL_21;
      }
      uint64_t v25 = v24 & v21;
      uint64_t v26 = sub_2593094A0();
      *(void *)&long long v51 = v19 + 16;
      *((void *)&v51 + 1) = v19 + 32;
      *(void *)&long long v52 = v25;
      *((void *)&v52 + 1) = v26;
      *(void *)&long long v53 = v27;
      *((void *)&v53 + 1) = v28;
      char v54 = 0;
      uint64_t v29 = sub_2593094D0();
      char v31 = v30;
      long long v43 = v51;
      long long v44 = v52;
      long long v45 = v53;
      char v46 = v54;
      swift_retain();
      if ((v31 & 1) == 0)
      {
        while (1)
        {
          sub_2592207A0(v20 + v29 * v17, (uint64_t)v12, &qword_26A37DF28);
          uint64_t v32 = *v12;
          uint64_t v33 = *v15;
          sub_25924A3A8((uint64_t)v12, &qword_26A37DF28);
          if (v32 == v33) {
            break;
          }
          sub_2593094F0();
          long long v47 = v43;
          long long v48 = v44;
          long long v49 = v45;
          char v50 = v46;
          uint64_t v29 = sub_2593094D0();
          if (v34) {
            goto LABEL_3;
          }
        }
        swift_release();
        uint64_t v4 = v39;
        goto LABEL_5;
      }
LABEL_3:
      swift_release();
      uint64_t v4 = v39;
    }
    else
    {
      uint64_t v35 = *(void *)(v18 + 16);
      uint64_t v4 = v39;
      if (v35)
      {
        do
        {
          sub_2592207A0(v20, (uint64_t)v12, &qword_26A37DF28);
          uint64_t v36 = *v12;
          uint64_t v37 = *v15;
          sub_25924A3A8((uint64_t)v12, &qword_26A37DF28);
          if (v36 == v37) {
            goto LABEL_5;
          }
          v20 += v17;
        }
        while (--v35);
      }
    }
    sub_2592FF8B0((uint64_t)v15);
LABEL_5:
    ++a3;
    sub_25924A3A8((uint64_t)v15, &qword_26A37DF28);
    int64_t v16 = v40;
    a2 = v42;
    uint64_t v10 = v41;
    if (a3 == v40)
    {
      swift_unknownObjectRelease();
      return;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
}

uint64_t sub_2592FEEE0(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(BOOL, uint64_t, uint64_t))
{
  int64_t v6 = a4 >> 1;
  if (a4 >> 1 == a3) {
    return result;
  }
  uint64_t v7 = v5;
  uint64_t v8 = a3;
  uint64_t v9 = v5 + 1;
  uint64_t result = swift_unknownObjectRetain();
  while (v8 < v6)
  {
    long long v13 = *(_OWORD *)(a2 + 16 * v8);
    uint64_t v15 = *v7;
    uint64_t v14 = (void *)v7[1];
    int64_t v16 = v14 + 4;
    if (*v7)
    {
      long long v32 = *(_OWORD *)(a2 + 16 * v8);
      sub_25930A8C0();
      sub_25930A900();
      uint64_t result = sub_25930A910();
      if (__OFSUB__(1 << *(void *)(v15 + 16), 1)) {
        goto LABEL_49;
      }
      sub_2593094A0();
      uint64_t result = sub_2593094D0();
      if ((v17 & 1) == 0)
      {
        while (v16[2 * result] != (void)v32)
        {
          sub_2593094F0();
          uint64_t result = sub_2593094D0();
          if (v18) {
            goto LABEL_23;
          }
        }
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v19 = v14[2];
      if (v19)
      {
        if (*v16 == (void)v13) {
          goto LABEL_7;
        }
        if (v19 != 1)
        {
          if (v14[6] == (void)v13) {
            goto LABEL_7;
          }
          if (v19 != 2)
          {
            if (v14[8] == (void)v13) {
              goto LABEL_7;
            }
            if (v19 != 3)
            {
              if (v14[10] == (void)v13) {
                goto LABEL_7;
              }
              uint64_t v27 = v19 - 4;
              if (v27)
              {
                if (v14[12] == (void)v13) {
                  goto LABEL_7;
                }
                uint64_t v28 = v14 + 14;
                while (--v27)
                {
                  uint64_t v29 = *v28;
                  v28 += 2;
                  if (v29 == (void)v13) {
                    goto LABEL_7;
                  }
                }
              }
            }
          }
        }
      }
      long long v32 = *(_OWORD *)(a2 + 16 * v8);
    }
LABEL_23:
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    void *v9 = v14;
    if ((result & 1) == 0)
    {
      uint64_t result = a5(0, v14[2] + 1, 1);
      uint64_t v14 = (void *)*v9;
    }
    long long v20 = v32;
    unint64_t v22 = v14[2];
    unint64_t v21 = v14[3];
    if (v22 >= v21 >> 1)
    {
      uint64_t result = a5(v21 > 1, v22 + 1, 1);
      long long v20 = v32;
      uint64_t v14 = (void *)*v9;
    }
    v14[2] = v22 + 1;
    *(_OWORD *)&v14[2 * v22 + 4] = v20;
    v7[1] = (uint64_t)v14;
    unint64_t v23 = v14[2];
    uint64_t v24 = *v7;
    if (*v7)
    {
      swift_beginAccess();
      if (MEMORY[0x25A2D9D70](*(void *)(v24 + 16) & 0x3FLL) >= (uint64_t)v23)
      {
        uint64_t result = swift_isUniquelyReferenced_native();
        uint64_t v26 = *v7;
        if ((result & 1) == 0)
        {
          if (!v26) {
            goto LABEL_51;
          }
          uint64_t v26 = sub_259309520();
          uint64_t result = swift_release();
          uint64_t *v7 = v26;
        }
        if (!v26) {
          goto LABEL_50;
        }
        uint64_t result = sub_2593094C0();
      }
      else
      {
        uint64_t v25 = *(void *)(v24 + 24) & 0x3FLL;
        if (v23 > 0xF || v25) {
          goto LABEL_3;
        }
        uint64_t result = swift_release();
        uint64_t *v7 = 0;
      }
    }
    else if (v23 > 0xF)
    {
      uint64_t v25 = 0;
LABEL_3:
      uint64_t v10 = MEMORY[0x25A2D9DA0](v23);
      if (v25 <= v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = v25;
      }
      uint64_t v12 = sub_259300070((uint64_t)v14, v11, 0, v25);
      uint64_t result = swift_release();
      uint64_t *v7 = v12;
    }
LABEL_7:
    if (++v8 == v6) {
      return swift_unknownObjectRelease();
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_2592FF280(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 1 == a3) {
    return result;
  }
  unint64_t v5 = v4;
  uint64_t v6 = a3;
  uint64_t v7 = v4 + 1;
  unint64_t v35 = a4 >> 1;
  uint64_t result = swift_unknownObjectRetain();
  uint64_t v8 = v35;
  uint64_t v37 = v5;
  while (v6 < v8)
  {
    uint64_t v12 = (long long *)(a2 + 32 * v6);
    long long v13 = *v12;
    uint64_t v14 = *((void *)v12 + 2);
    unint64_t v15 = *((void *)v12 + 3);
    uint64_t v17 = *v5;
    int64_t v16 = (void *)v5[1];
    char v18 = v16 + 4;
    if (*v5)
    {
      long long v38 = *v12;
      sub_25930A8C0();
      sub_25930A900();
      uint64_t result = sub_25930A910();
      if (__OFSUB__(1 << *(void *)(v17 + 16), 1)) {
        goto LABEL_53;
      }
      sub_2593094A0();
      uint64_t result = sub_2593094D0();
      unint64_t v5 = v37;
      if ((v19 & 1) == 0)
      {
        while (v18[4 * result] != (void)v38)
        {
          sub_2593094F0();
          uint64_t result = sub_2593094D0();
          if (v20) {
            goto LABEL_26;
          }
        }
        uint64_t v8 = v35;
        goto LABEL_8;
      }
      goto LABEL_26;
    }
    uint64_t v21 = v16[2];
    if (!v21)
    {
      long long v38 = *v12;
LABEL_26:
      unint64_t v22 = v15;
      goto LABEL_27;
    }
    if (*v18 == (void)v13) {
      goto LABEL_8;
    }
    unint64_t v22 = *((void *)v12 + 3);
    if (v21 != 1)
    {
      if (v16[8] == (void)v13) {
        goto LABEL_8;
      }
      if (v21 != 2)
      {
        if (v16[12] == (void)v13) {
          goto LABEL_8;
        }
        if (v21 != 3)
        {
          if (v16[16] == (void)v13) {
            goto LABEL_8;
          }
          uint64_t v32 = v21 - 4;
          if (v32)
          {
            if (v16[20] == (void)v13) {
              goto LABEL_8;
            }
            uint64_t v33 = v16 + 24;
            while (--v32)
            {
              uint64_t v34 = *v33;
              v33 += 4;
              if (v34 == (void)v13) {
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
    long long v38 = *v12;
LABEL_27:
    sub_259277D68(v14, v22);
    sub_259277D68(v14, v22);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    void *v7 = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25925CF44(0, v16[2] + 1, 1);
      int64_t v16 = (void *)*v7;
    }
    long long v24 = v38;
    unint64_t v26 = v16[2];
    unint64_t v25 = v16[3];
    if (v26 >= v25 >> 1)
    {
      sub_25925CF44(v25 > 1, v26 + 1, 1);
      long long v24 = v38;
      int64_t v16 = (void *)*v7;
    }
    v16[2] = v26 + 1;
    uint64_t v27 = &v16[4 * v26];
    *((_OWORD *)v27 + 2) = v24;
    v27[6] = v14;
    v27[7] = v22;
    unint64_t v5 = v37;
    v37[1] = (uint64_t)v16;
    unint64_t v28 = v16[2];
    uint64_t v29 = *v37;
    if (*v37)
    {
      swift_beginAccess();
      if (MEMORY[0x25A2D9D70](*(void *)(v29 + 16) & 0x3FLL) >= (uint64_t)v28)
      {
        uint64_t result = swift_isUniquelyReferenced_native();
        uint64_t v31 = *v37;
        if ((result & 1) == 0)
        {
          if (!v31) {
            goto LABEL_55;
          }
          uint64_t v31 = sub_259309520();
          uint64_t result = swift_release();
          *uint64_t v37 = v31;
        }
        if (!v31) {
          goto LABEL_54;
        }
        sub_2593094C0();
        goto LABEL_7;
      }
      uint64_t v30 = *(void *)(v29 + 24) & 0x3FLL;
      if (v28 > 0xF || v30) {
        goto LABEL_3;
      }
      swift_release();
      unint64_t v5 = v37;
      *uint64_t v37 = 0;
    }
    else if (v28 > 0xF)
    {
      uint64_t v30 = 0;
LABEL_3:
      uint64_t v9 = MEMORY[0x25A2D9DA0](v28);
      if (v30 <= v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v30;
      }
      uint64_t v11 = sub_2592FFFDC((uint64_t)v16, v10, 0, v30);
      swift_release();
      unint64_t v5 = v37;
      *uint64_t v37 = v11;
    }
LABEL_7:
    uint64_t result = sub_259277DC4(v14, v22);
    uint64_t v8 = v35;
LABEL_8:
    if (++v6 == v8) {
      return swift_unknownObjectRelease();
    }
  }
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_2592FF680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v8 = a6 + 4;
  uint64_t v9 = a6[2];
  if (a5) {
    return sub_2593004C4(a1, a2, a3, a4, (uint64_t)v8, v9, (void *)(a5 + 16));
  }
  if (!v9) {
    return 0;
  }
  if (*v8 == a1) {
    return 0;
  }
  if (v9 == 1) {
    return 0;
  }
  if (a6[8] == a1) {
    return 1;
  }
  if (v9 == 2) {
    return 0;
  }
  if (a6[12] == a1) {
    return 2;
  }
  if (v9 == 3) {
    return 0;
  }
  if (a6[16] == a1) {
    return 3;
  }
  uint64_t v11 = a6 + 20;
  uint64_t v12 = 4;
  while (v9 != v12)
  {
    uint64_t v13 = *v11;
    v11 += 4;
    ++v12;
    if (v13 == a1) {
      return v12 - 1;
    }
  }
  return 0;
}

uint64_t sub_2592FF798(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a4 + 4;
  uint64_t v7 = a4[2];
  if (a3) {
    return sub_259300604(a1, a2, (uint64_t)v6, v7, (void *)(a3 + 16));
  }
  if (!v7) {
    return 0;
  }
  if (*v6 == a1) {
    return 0;
  }
  if (v7 == 1) {
    return 0;
  }
  if (a4[6] == a1) {
    return 1;
  }
  if (v7 == 2) {
    return 0;
  }
  if (a4[8] == a1) {
    return 2;
  }
  if (v7 == 3) {
    return 0;
  }
  if (a4[10] == a1) {
    return 3;
  }
  uint64_t v9 = a4 + 12;
  uint64_t v10 = 4;
  while (v7 != v10)
  {
    uint64_t v11 = *v9;
    v9 += 2;
    ++v10;
    if (v11 == a1) {
      return v10 - 1;
    }
  }
  return 0;
}

uint64_t sub_2592FF8B0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2592207A0(a1, (uint64_t)v7, &qword_26A37DF28);
  uint64_t v8 = v2 + 1;
  uint64_t v9 = v2[1];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v2[1] = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_25925CEC4(0, *(void *)(v9 + 16) + 1, 1);
    uint64_t v9 = *v8;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    sub_25925CEC4(v11 > 1, v12 + 1, 1);
    uint64_t v9 = *v8;
  }
  *(void *)(v9 + 16) = v12 + 1;
  uint64_t result = sub_25924A404((uint64_t)v7, v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v12, &qword_26A37DF28);
  v2[1] = v9;
  uint64_t v14 = *(void *)(v9 + 16);
  uint64_t v15 = *v2;
  if (*v2)
  {
    swift_beginAccess();
    if (MEMORY[0x25A2D9D70](*(void *)(v15 + 16) & 0x3FLL) >= v14)
    {
      uint64_t result = swift_isUniquelyReferenced_native();
      uint64_t v16 = *v2;
      if (!result)
      {
        if (!v16)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        uint64_t v16 = sub_259309520();
        uint64_t result = swift_release();
        *uint64_t v2 = v16;
      }
      if (v16) {
        return sub_2593094C0();
      }
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v14 < 0x10)
  {
    return result;
  }
  return sub_2592FFDFC((uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_2592FFF54);
}

uint64_t sub_2592FFAE0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v12 = v4[1];
  uint64_t v10 = v4 + 1;
  uint64_t v11 = v12;
  sub_259277D68(a3, a4);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v10 = v12;
  if ((result & 1) == 0)
  {
    uint64_t result = sub_25925CF44(0, *(void *)(v11 + 16) + 1, 1);
    uint64_t v11 = *v10;
  }
  unint64_t v15 = *(void *)(v11 + 16);
  unint64_t v14 = *(void *)(v11 + 24);
  if (v15 >= v14 >> 1)
  {
    uint64_t result = sub_25925CF44(v14 > 1, v15 + 1, 1);
    uint64_t v11 = *v10;
  }
  *(void *)(v11 + 16) = v15 + 1;
  uint64_t v16 = (void *)(v11 + 32 * v15);
  void v16[4] = a1;
  v16[5] = a2;
  v16[6] = a3;
  v16[7] = a4;
  v5[1] = v11;
  uint64_t v17 = *(void *)(v11 + 16);
  uint64_t v18 = *v5;
  if (*v5)
  {
    swift_beginAccess();
    if (MEMORY[0x25A2D9D70](*(void *)(v18 + 16) & 0x3FLL) >= v17)
    {
      uint64_t result = swift_isUniquelyReferenced_native();
      uint64_t v19 = *v5;
      if (!result)
      {
        if (!v19)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        uint64_t v19 = sub_259309520();
        uint64_t result = swift_release();
        *uint64_t v5 = v19;
      }
      if (v19) {
        return sub_2593094C0();
      }
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v17 < 0x10)
  {
    return result;
  }
  return sub_2592FFDFC((uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_2592FFFDC);
}

uint64_t sub_2592FFC88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v8 = v2[1];
  uint64_t v6 = v2 + 1;
  uint64_t v7 = v8;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v6 = v8;
  if ((result & 1) == 0)
  {
    uint64_t result = sub_25925CF64(0, *(void *)(v7 + 16) + 1, 1);
    uint64_t v7 = *v6;
  }
  unint64_t v11 = *(void *)(v7 + 16);
  unint64_t v10 = *(void *)(v7 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = sub_25925CF64(v10 > 1, v11 + 1, 1);
    uint64_t v7 = *v6;
  }
  *(void *)(v7 + 16) = v11 + 1;
  unint64_t v12 = v7 + 16 * v11;
  *(void *)(v12 + 32) = a1;
  *(void *)(v12 + 40) = a2;
  v3[1] = v7;
  uint64_t v13 = *(void *)(v7 + 16);
  uint64_t v14 = *v3;
  if (*v3)
  {
    swift_beginAccess();
    if (MEMORY[0x25A2D9D70](*(void *)(v14 + 16) & 0x3FLL) >= v13)
    {
      uint64_t result = swift_isUniquelyReferenced_native();
      uint64_t v15 = *v3;
      if (!result)
      {
        if (!v15)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        uint64_t v15 = sub_259309520();
        uint64_t result = swift_release();
        *uint64_t v3 = v15;
      }
      if (v15) {
        return sub_2593094C0();
      }
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v13 < 0x10)
  {
    return result;
  }
  return sub_2592FFEB0();
}

uint64_t sub_2592FFDFC(uint64_t (*a1)(uint64_t, uint64_t, void, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  if (*v1)
  {
    swift_beginAccess();
    uint64_t v5 = *(void *)(v3 + 24) & 0x3FLL;
    unint64_t v6 = *(void *)(v4 + 16);
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = *(void *)(v4 + 16);
  }
  if (v6 < 0x10)
  {
    uint64_t v7 = 0;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = MEMORY[0x25A2D9DA0](v6);
  if (v5 <= v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v5;
  }
  uint64_t v7 = a1(v4, v9, 0, v5);
LABEL_11:
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_2592FFEB0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 24) & 0x3FLL;
    unint64_t v4 = *(void *)(v2 + 16);
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = *(void *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v6 = MEMORY[0x25A2D9DA0](v4);
  if (v3 <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v3;
  }
  uint64_t v5 = sub_259300070(v2, v7, 0, v3);
LABEL_11:
  uint64_t result = swift_release();
  *uint64_t v0 = v5;
  return result;
}

uint64_t sub_2592FFF54(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = MEMORY[0x25A2D9DA0](*(void *)(a1 + 16));
  uint64_t v9 = 0;
  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v10 <= v8) {
    uint64_t v10 = v8;
  }
  if (v10 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 5)
  {
    uint64_t v9 = MEMORY[0x25A2D9DB0]();
    sub_25930030C(a1, (void *)(v9 + 16), v9 + 32);
  }
  return v9;
}

uint64_t sub_2592FFFDC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = MEMORY[0x25A2D9DA0](*(void *)(a1 + 16));
  uint64_t v9 = 0;
  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v10 <= v8) {
    uint64_t v10 = v8;
  }
  if (v10 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 5)
  {
    uint64_t v9 = MEMORY[0x25A2D9DB0]();
    sub_259300104(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

uint64_t sub_259300070(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = MEMORY[0x25A2D9DA0](*(void *)(a1 + 16));
  uint64_t v9 = 0;
  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v10 <= v8) {
    uint64_t v10 = v8;
  }
  if (v10 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 5)
  {
    uint64_t v9 = MEMORY[0x25A2D9DB0]();
    sub_259300208(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

uint64_t sub_259300104(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    unint64_t v4 = (void *)result;
    uint64_t v5 = 0;
    while (1)
    {
      sub_25930A8C0();
      sub_25930A900();
      uint64_t result = sub_25930A910();
      if (__OFSUB__(1 << *v4, 1)) {
        break;
      }
      if (sub_2593094A0())
      {
        while (1)
          sub_2593094F0();
      }
      uint64_t result = sub_2593094E0();
      if (++v5 == v3) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_259300208(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    unint64_t v4 = (void *)result;
    uint64_t v5 = 0;
    while (1)
    {
      sub_25930A8C0();
      sub_25930A900();
      uint64_t result = sub_25930A910();
      if (__OFSUB__(1 << *v4, 1)) {
        break;
      }
      if (sub_2593094A0())
      {
        while (1)
          sub_2593094F0();
      }
      uint64_t result = sub_2593094E0();
      if (++v5 == v3) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

void sub_25930030C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28) - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(void *)(a1 + 16);
  if (v24)
  {
    uint64_t v10 = 0;
    uint64_t v23 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v11 = *(void *)(v7 + 72);
    while (1)
    {
      sub_2592207A0(v23 + v11 * v10, (uint64_t)v9, &qword_26A37DF28);
      sub_25930A8C0();
      sub_25930A900();
      uint64_t v12 = sub_25930A910();
      uint64_t v13 = 1 << *a2;
      BOOL v14 = __OFSUB__(v13, 1);
      uint64_t v15 = v13 - 1;
      if (v14) {
        break;
      }
      uint64_t v16 = v15 & v12;
      uint64_t v17 = sub_2593094A0();
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      sub_25924A3A8((uint64_t)v9, &qword_26A37DF28);
      unint64_t v25 = a2;
      uint64_t v26 = a3;
      uint64_t v27 = v16;
      uint64_t v28 = v17;
      uint64_t v29 = v19;
      uint64_t v30 = v21;
      char v31 = 0;
      while (v28)
        sub_2593094F0();
      sub_2593094E0();
      if (++v10 == v24) {
        return;
      }
    }
    __break(1u);
  }
}

uint64_t sub_2593004C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  sub_25930A8C0();
  sub_25930A900();
  uint64_t result = sub_25930A910();
  if (__OFSUB__(1 << *a7, 1))
  {
    __break(1u);
  }
  else
  {
    sub_2593094A0();
    uint64_t result = sub_2593094D0();
    if ((v11 & 1) == 0 && *(void *)(a5 + 32 * result) != a1)
    {
      do
      {
        sub_2593094F0();
        uint64_t result = sub_2593094D0();
      }
      while ((v12 & 1) == 0 && *(void *)(a5 + 32 * result) != a1);
    }
  }
  return result;
}

uint64_t sub_259300604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  sub_25930A8C0();
  sub_25930A900();
  uint64_t result = sub_25930A910();
  if (__OFSUB__(1 << *a5, 1))
  {
    __break(1u);
  }
  else
  {
    sub_2593094A0();
    uint64_t result = sub_2593094D0();
    if ((v9 & 1) == 0 && *(void *)(a3 + 16 * result) != a1)
    {
      do
      {
        sub_2593094F0();
        uint64_t result = sub_2593094D0();
      }
      while ((v10 & 1) == 0 && *(void *)(a3 + 16 * result) != a1);
    }
  }
  return result;
}

unint64_t sub_259300744(unint64_t *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v40 = a4;
  unint64_t v35 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28) - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (uint64_t *)((char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  char v12 = (uint64_t *)((char *)&v34 - v11);
  unint64_t v13 = *(void *)(a2 + 16);
  if (v13)
  {
    unint64_t v14 = 0;
    uint64_t v15 = a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    uint64_t v16 = *(void *)(v10 + 72);
    uint64_t v36 = a3;
    unint64_t v39 = v13;
    uint64_t v38 = v15;
    uint64_t v37 = v16;
    while (1)
    {
      unint64_t v41 = v14;
      uint64_t v19 = v15 + v16 * v14;
      sub_2592207A0(v19, (uint64_t)v12, &qword_26A37DF28);
      sub_25930A8C0();
      sub_25930A900();
      unint64_t result = sub_25930A910();
      uint64_t v21 = 1 << *a3;
      BOOL v22 = __OFSUB__(v21, 1);
      uint64_t v23 = v21 - 1;
      if (v22) {
        break;
      }
      unint64_t v24 = v23 & result;
      uint64_t v25 = v40;
      uint64_t v26 = sub_2593094A0();
      uint64_t v28 = v27;
      uint64_t v30 = v29;
      sub_25924A3A8((uint64_t)v12, &qword_26A37DF28);
      *(void *)&long long v42 = a3;
      *((void *)&v42 + 1) = v25;
      uint64_t v16 = v37;
      *(void *)&long long v43 = v24;
      *((void *)&v43 + 1) = v26;
      *(void *)&long long v44 = v28;
      *((void *)&v44 + 1) = v30;
      uint64_t v15 = v38;
      unint64_t v13 = v39;
      char v45 = 0;
      char v49 = 0;
      long long v46 = v42;
      long long v47 = v43;
      long long v48 = v44;
      while (1)
      {
        unint64_t result = sub_2593094D0();
        if (v31) {
          break;
        }
        if (result >= v13)
        {
          __break(1u);
          goto LABEL_14;
        }
        sub_2592207A0(v15 + result * v16, (uint64_t)v12, &qword_26A37DF28);
        sub_2592207A0(v19, (uint64_t)v8, &qword_26A37DF28);
        uint64_t v32 = *v12;
        uint64_t v33 = *v8;
        sub_25924A3A8((uint64_t)v8, &qword_26A37DF28);
        sub_25924A3A8((uint64_t)v12, &qword_26A37DF28);
        if (v32 == v33)
        {
          unint64_t result = 0;
          *unint64_t v35 = v41;
          return result;
        }
        sub_2593094F0();
        long long v46 = v42;
        long long v47 = v43;
        long long v48 = v44;
        char v49 = v45;
      }
      unint64_t v17 = v41 + 1;
      sub_2593094E0();
      unint64_t v14 = v17;
      BOOL v18 = v17 == v13;
      a3 = v36;
      if (v18) {
        goto LABEL_11;
      }
    }
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    *unint64_t v35 = v13;
    return 1;
  }
  return result;
}

unint64_t sub_259300A24(unint64_t *a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    unint64_t v6 = 0;
    uint64_t v7 = a2 + 32;
    while (1)
    {
      sub_25930A8C0();
      sub_25930A900();
      unint64_t result = sub_25930A910();
      if (__OFSUB__(1 << *a3, 1)) {
        break;
      }
      sub_2593094A0();
      while (1)
      {
        unint64_t result = sub_2593094D0();
        if (v9) {
          break;
        }
        if (result >= v4)
        {
          __break(1u);
          goto LABEL_14;
        }
        if (*(void *)(v7 + 16 * result) == *(void *)(v7 + 16 * v6))
        {
          unint64_t result = 0;
          *a1 = v6;
          return result;
        }
        sub_2593094F0();
      }
      sub_2593094E0();
      if (++v6 == v4) {
        goto LABEL_11;
      }
    }
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    *a1 = v4;
    return 1;
  }
  return result;
}

unint64_t sub_259300B8C(unint64_t *a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    unint64_t v6 = 0;
    uint64_t v7 = a2 + 32;
    while (1)
    {
      sub_25930A8C0();
      sub_25930A900();
      unint64_t result = sub_25930A910();
      if (__OFSUB__(1 << *a3, 1)) {
        break;
      }
      sub_2593094A0();
      while (1)
      {
        unint64_t result = sub_2593094D0();
        if (v9) {
          break;
        }
        if (result >= v4)
        {
          __break(1u);
          goto LABEL_14;
        }
        if (*(void *)(v7 + 32 * result) == *(void *)(v7 + 32 * v6))
        {
          unint64_t result = 0;
          *a1 = v6;
          return result;
        }
        sub_2593094F0();
      }
      sub_2593094E0();
      if (++v6 == v4) {
        goto LABEL_11;
      }
    }
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    *a1 = v4;
    return 1;
  }
  return result;
}

unint64_t sub_259300CF4@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(v3[1] + 16);
  uint64_t v7 = *v3;
  if (!*v3)
  {
    if (!v6) {
      goto LABEL_16;
    }
    return sub_259301140(a1, a3);
  }
  swift_beginAccess();
  if ((*(void *)(v7 + 16) & 0x3FLL) == (*(void *)(v7 + 24) & 0x3FLL))
  {
    if (!v6) {
      goto LABEL_16;
    }
  }
  else if (v6 <= sub_259309510())
  {
LABEL_16:
    sub_259301140(a1, a3);
    return sub_2592FFDFC((uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_2592FFF54);
  }
  unint64_t result = swift_isUniquelyReferenced_native();
  uint64_t v10 = *v3;
  if (!result)
  {
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v10 = sub_259309520();
    unint64_t result = swift_release();
    *uint64_t v3 = v10;
  }
  if (v10)
  {
    swift_retain();
    unint64_t result = sub_25930181C(a2, (void *)(v10 + 16), v10 + 32, (uint64_t)v3);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (a1 + 1 >= a1)
    {
      uint64_t v11 = v3[1];
      swift_retain();
      sub_259301AF0(a1, a1 + 1, v11, (void *)(v10 + 16), v10 + 32);
      swift_release();
      swift_release();
      return sub_259301140(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_259300E74@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = *(void *)(v3[1] + 16);
  uint64_t v7 = *v3;
  if (!*v3)
  {
    if (!v6) {
      goto LABEL_16;
    }
    return sub_2593012C4(a1, a3);
  }
  swift_beginAccess();
  if ((*(void *)(v7 + 16) & 0x3FLL) == (*(void *)(v7 + 24) & 0x3FLL))
  {
    if (!v6) {
      goto LABEL_16;
    }
  }
  else if (v6 <= sub_259309510())
  {
LABEL_16:
    sub_2593012C4(a1, a3);
    return sub_2592FFDFC((uint64_t (*)(uint64_t, uint64_t, void, uint64_t))sub_2592FFFDC);
  }
  unint64_t result = swift_isUniquelyReferenced_native();
  uint64_t v10 = *v3;
  if (!result)
  {
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v10 = sub_259309520();
    unint64_t result = swift_release();
    *uint64_t v3 = v10;
  }
  if (v10)
  {
    unint64_t result = sub_259301650(a2, (void *)(v10 + 16), v10 + 32, (uint64_t)v3);
    uint64_t v11 = a1 + 1;
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (v11 >= a1)
    {
      sub_25930203C(a1, v11, v3[1], (void *)(v10 + 16));
      return sub_2593012C4(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_259300FCC(int64_t a1, uint64_t a2)
{
  return sub_259300FE4(a1, a2, sub_259302904);
}

unint64_t sub_259300FE4(int64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = *(void *)(v3[1] + 16);
  uint64_t v7 = *v3;
  if (!*v3)
  {
    if (!v6) {
      goto LABEL_16;
    }
    return sub_2593013A0(a1, a3);
  }
  swift_beginAccess();
  if ((*(void *)(v7 + 16) & 0x3FLL) == (*(void *)(v7 + 24) & 0x3FLL))
  {
    if (!v6) {
      goto LABEL_16;
    }
  }
  else if (v6 <= sub_259309510())
  {
LABEL_16:
    uint64_t v12 = sub_2593013A0(a1, a3);
    sub_2592FFEB0();
    return v12;
  }
  unint64_t result = swift_isUniquelyReferenced_native();
  uint64_t v10 = *v3;
  if (!result)
  {
    if (!v10) {
      goto LABEL_21;
    }
    uint64_t v10 = sub_259309520();
    unint64_t result = swift_release();
    *uint64_t v3 = v10;
  }
  if (v10)
  {
    unint64_t result = sub_259301484(a2, (void *)(v10 + 16), v10 + 32, (uint64_t)v3);
    uint64_t v11 = a1 + 1;
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (v11 >= a1)
    {
      sub_259302478(a1, v11, v3[1], (void *)(v10 + 16));
      return sub_2593013A0(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_259301140@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = (void *)sub_2593028C8(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28) - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (unint64_t)v5
      + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
      + v9 * a1;
  uint64_t result = sub_25924A404(v10, a2, &qword_26A37DF28);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    uint64_t result = sub_25930A620();
    __break(1u);
    return result;
  }
  if (v9 > 0 || v10 >= v10 + v9 + v9 * (v7 - a1))
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v9)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  _OWORD v5[2] = v7;
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_2593012C4@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = (void *)sub_2593028F0(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = &v5[4 * a1];
    long long v9 = *((_OWORD *)v7 + 2);
    long long v10 = *((_OWORD *)v7 + 3);
    uint64_t v8 = v7 + 4;
    unint64_t v11 = v6 - 1;
    *a2 = v9;
    a2[1] = v10;
    uint64_t v12 = v6 - 1 - a1;
    if (v12 >= 0)
    {
      uint64_t result = (uint64_t)memmove(v8, v8 + 4, 32 * v12);
      _OWORD v5[2] = v11;
      *uint64_t v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_25930A620();
  __break(1u);
  return result;
}

uint64_t sub_2593013A0(unint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = a2(v5);
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 16 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 48), 16 * v8);
      *(void *)(v5 + 16) = v7;
      *uint64_t v2 = v5;
      return v10;
    }
  }
  uint64_t result = sub_25930A620();
  __break(1u);
  return result;
}

unint64_t sub_259301484(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v14 = sub_2593094A0();
  sub_2593094F0();
  if (v14)
  {
    uint64_t v7 = a1;
    uint64_t v8 = sub_2593094B0();
    while (1)
    {
      unint64_t result = sub_2593094D0();
      if (v10)
      {
LABEL_20:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (result >= *(void *)(*(void *)(a4 + 8) + 16)) {
        goto LABEL_18;
      }
      sub_25930A8C0();
      sub_25930A900();
      unint64_t result = sub_25930A910();
      uint64_t v11 = 1 << *a2;
      if (__OFSUB__(v11, 1)) {
        goto LABEL_19;
      }
      uint64_t v12 = (v11 - 1) & result;
      if (v6 >= v8) {
        break;
      }
      if (v12 < v8) {
        goto LABEL_12;
      }
LABEL_13:
      sub_2593094D0();
      sub_2593094C0();
      uint64_t v6 = v7;
LABEL_3:
      sub_2593094F0();
      uint64_t v7 = a1;
    }
    if (v12 < v8) {
      goto LABEL_3;
    }
LABEL_12:
    if (v6 < v12) {
      goto LABEL_3;
    }
    goto LABEL_13;
  }
  return sub_2593094C0();
}

unint64_t sub_259301650(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v14 = sub_2593094A0();
  sub_2593094F0();
  if (v14)
  {
    uint64_t v7 = a1;
    uint64_t v8 = sub_2593094B0();
    while (1)
    {
      unint64_t result = sub_2593094D0();
      if (v10)
      {
LABEL_20:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (result >= *(void *)(*(void *)(a4 + 8) + 16)) {
        goto LABEL_18;
      }
      sub_25930A8C0();
      sub_25930A900();
      unint64_t result = sub_25930A910();
      uint64_t v11 = 1 << *a2;
      if (__OFSUB__(v11, 1)) {
        goto LABEL_19;
      }
      uint64_t v12 = (v11 - 1) & result;
      if (v6 >= v8) {
        break;
      }
      if (v12 < v8) {
        goto LABEL_12;
      }
LABEL_13:
      sub_2593094D0();
      sub_2593094C0();
      uint64_t v6 = v7;
LABEL_3:
      sub_2593094F0();
      uint64_t v7 = a1;
    }
    if (v12 < v8) {
      goto LABEL_3;
    }
LABEL_12:
    if (v6 < v12) {
      goto LABEL_3;
    }
    goto LABEL_13;
  }
  return sub_2593094C0();
}

unint64_t sub_25930181C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  char v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2593094A0();
  *(void *)&long long v31 = a2;
  *((void *)&v31 + 1) = a3;
  uint64_t v32 = a1;
  uint64_t v33 = v11;
  uint64_t v34 = v12;
  uint64_t v35 = v13;
  char v36 = 0;
  sub_2593094F0();
  uint64_t v14 = v33;
  if (v33)
  {
    char v15 = v36;
    uint64_t v17 = v34;
    uint64_t v16 = v35;
    uint64_t v18 = v32;
    long long v28 = v31;
    uint64_t v29 = a3;
    uint64_t v19 = sub_2593094B0();
    long long v20 = v28;
    uint64_t v21 = v19;
    while (1)
    {
      long long v37 = v20;
      uint64_t v38 = v18;
      uint64_t v39 = v14;
      uint64_t v40 = v17;
      uint64_t v41 = v16;
      char v42 = v15 & 1;
      unint64_t result = sub_2593094D0();
      if (v23)
      {
LABEL_21:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      uint64_t v24 = *(void *)(v30 + 8);
      if (result >= *(void *)(v24 + 16)) {
        goto LABEL_19;
      }
      sub_2592207A0(v24+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * result, (uint64_t)v10, &qword_26A37DF28);
      sub_25930A8C0();
      sub_25930A900();
      uint64_t v25 = sub_25930A910();
      unint64_t result = sub_25924A3A8((uint64_t)v10, &qword_26A37DF28);
      uint64_t v26 = 1 << *a2;
      if (__OFSUB__(v26, 1)) {
        goto LABEL_20;
      }
      uint64_t v27 = (v26 - 1) & v25;
      if (a1 >= v21)
      {
        if (v27 < v21) {
          goto LABEL_3;
        }
      }
      else if (v27 >= v21)
      {
        goto LABEL_13;
      }
      if (a1 >= v27)
      {
LABEL_13:
        sub_2593094D0();
        sub_2593094C0();
        a1 = v18;
      }
LABEL_3:
      sub_2593094F0();
      long long v20 = v31;
      uint64_t v18 = v32;
      uint64_t v14 = v33;
      uint64_t v17 = v34;
      uint64_t v16 = v35;
      char v15 = v36;
      if (!v33) {
        return sub_2593094C0();
      }
    }
  }
  return sub_2593094C0();
}

void sub_259301AF0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.n128_f64[0] = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v67 - v16;
  uint64_t v18 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v18 >= 1)
  {
    unint64_t v19 = *(void *)(a3 + 16);
    uint64_t v20 = v19 - v18;
    if ((uint64_t)v19 < v18) {
      ++v20;
    }
    if (a1 >= v20 >> 1)
    {
      uint64_t v68 = a3;
      if (__OFSUB__(v19, a2))
      {
LABEL_61:
        __break(1u);
        goto LABEL_62;
      }
      if ((uint64_t)(v19 - a2) >= MEMORY[0x25A2D9D70](*a4 & 0x3FLL, v15) / 3)
      {
LABEL_49:
        uint64_t v61 = sub_2593094A0();
        uint64_t v62 = 0;
        *(void *)&long long v74 = a4;
        *((void *)&v74 + 1) = a5;
        uint64_t v75 = 0;
        *(void *)&long long v76 = v61;
        *((void *)&v76 + 1) = v63;
        uint64_t v77 = v64;
        char v78 = 0;
        while (1)
        {
          long long v69 = v74;
          uint64_t v70 = v62;
          long long v71 = v76;
          uint64_t v72 = v77;
          char v73 = v78;
          uint64_t v65 = sub_2593094D0();
          if ((v66 & 1) == 0 && v65 >= a2)
          {
            if (__OFSUB__(v65, v18)) {
              goto LABEL_57;
            }
            sub_2593094E0();
          }
          sub_2593094F0();
          uint64_t v62 = v75;
          if (!v75) {
            return;
          }
        }
      }
      if ((uint64_t)v19 < a2) {
        goto LABEL_66;
      }
      if (a2 < 0)
      {
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      if (v19 != a2)
      {
        if (v19 <= a2)
        {
LABEL_68:
          __break(1u);
          return;
        }
        uint64_t v41 = v68 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
        uint64_t v42 = *(void *)(v11 + 72);
        swift_retain();
        while (1)
        {
          sub_2592207A0(v41 + v42 * a2, (uint64_t)v13, &qword_26A37DF28);
          sub_25930A8C0();
          sub_25930A900();
          uint64_t v43 = sub_25930A910();
          uint64_t v44 = 1 << *a4;
          BOOL v26 = __OFSUB__(v44, 1);
          uint64_t v45 = v44 - 1;
          if (v26) {
            goto LABEL_58;
          }
          uint64_t v46 = v45 & v43;
          uint64_t v47 = sub_2593094A0();
          *(void *)&long long v69 = a4;
          *((void *)&v69 + 1) = a5;
          uint64_t v70 = v46;
          *(void *)&long long v71 = v47;
          *((void *)&v71 + 1) = v48;
          uint64_t v72 = v49;
          char v73 = 0;
          if (v47)
          {
            char v50 = 0;
            long long v51 = a4;
            uint64_t v52 = a5;
            do
            {
              *(void *)&long long v74 = v51;
              *((void *)&v74 + 1) = v52;
              uint64_t v75 = v46;
              *(void *)&long long v76 = v47;
              *((void *)&v76 + 1) = v48;
              uint64_t v77 = v49;
              char v78 = v50 & 1;
              uint64_t v53 = sub_2593094D0();
              if ((v54 & 1) == 0 && v53 == a2) {
                break;
              }
              sub_2593094F0();
              uint64_t v52 = *((void *)&v69 + 1);
              long long v51 = (void *)v69;
              uint64_t v46 = v70;
              uint64_t v48 = *((void *)&v71 + 1);
              uint64_t v47 = v71;
              uint64_t v49 = v72;
              char v50 = v73;
            }
            while ((void)v71);
          }
          if (__OFSUB__(a2, v18)) {
            goto LABEL_59;
          }
          ++a2;
          sub_2593094E0();
          sub_25924A3A8((uint64_t)v13, &qword_26A37DF28);
          if (a2 == v19)
          {
            swift_release();
            return;
          }
        }
      }
    }
    else
    {
      if (MEMORY[0x25A2D9D70](*a4 & 0x3FLL, v15) / 3 <= a1)
      {
        uint64_t v55 = sub_2593094A0();
        uint64_t v56 = 0;
        *(void *)&long long v74 = a4;
        *((void *)&v74 + 1) = a5;
        uint64_t v75 = 0;
        *(void *)&long long v76 = v55;
        *((void *)&v76 + 1) = v57;
        uint64_t v77 = v58;
        char v78 = 0;
        while (1)
        {
          long long v69 = v74;
          uint64_t v70 = v56;
          long long v71 = v76;
          uint64_t v72 = v77;
          char v73 = v78;
          uint64_t v59 = sub_2593094D0();
          if ((v60 & 1) == 0 && v59 < a1)
          {
            if (__OFADD__(v59, v18))
            {
              __break(1u);
              goto LABEL_49;
            }
            sub_2593094E0();
          }
          sub_2593094F0();
          uint64_t v56 = v75;
          if (!v75) {
            goto LABEL_20;
          }
        }
      }
      if (a1 < 0) {
        goto LABEL_64;
      }
      if (v19 < a1)
      {
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      if (a1)
      {
        uint64_t v21 = a3 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
        uint64_t v22 = *(void *)(v11 + 72);
        uint64_t v68 = a3;
        swift_retain();
        uint64_t v23 = 0;
        while (1)
        {
          sub_2592207A0(v21 + v22 * v23, (uint64_t)v17, &qword_26A37DF28);
          sub_25930A8C0();
          sub_25930A900();
          uint64_t v24 = sub_25930A910();
          uint64_t v25 = 1 << *a4;
          BOOL v26 = __OFSUB__(v25, 1);
          uint64_t v27 = v25 - 1;
          if (v26) {
            break;
          }
          uint64_t v28 = v27 & v24;
          uint64_t v29 = sub_2593094A0();
          *(void *)&long long v69 = a4;
          *((void *)&v69 + 1) = a5;
          uint64_t v70 = v28;
          *(void *)&long long v71 = v29;
          *((void *)&v71 + 1) = v30;
          uint64_t v72 = v31;
          char v73 = 0;
          if (v29)
          {
            char v32 = 0;
            uint64_t v33 = a4;
            uint64_t v34 = a5;
            do
            {
              *(void *)&long long v74 = v33;
              *((void *)&v74 + 1) = v34;
              uint64_t v75 = v28;
              *(void *)&long long v76 = v29;
              *((void *)&v76 + 1) = v30;
              uint64_t v77 = v31;
              char v78 = v32 & 1;
              uint64_t v35 = sub_2593094D0();
              if ((v36 & 1) == 0 && v35 == v23) {
                break;
              }
              sub_2593094F0();
              uint64_t v34 = *((void *)&v69 + 1);
              uint64_t v33 = (void *)v69;
              uint64_t v28 = v70;
              uint64_t v30 = *((void *)&v71 + 1);
              uint64_t v29 = v71;
              uint64_t v31 = v72;
              char v32 = v73;
            }
            while ((void)v71);
          }
          if (__OFADD__(v23, v18)) {
            goto LABEL_56;
          }
          ++v23;
          sub_2593094E0();
          sub_25924A3A8((uint64_t)v17, &qword_26A37DF28);
          if (v23 == a1)
          {
            swift_release();
            goto LABEL_20;
          }
        }
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
        goto LABEL_60;
      }
LABEL_20:
      uint64_t v37 = a4[1];
      if (__OFSUB__(v37 >> 6, v18))
      {
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
      uint64_t v38 = 1 << *a4;
      BOOL v26 = __OFSUB__(v38, 1);
      uint64_t v39 = v38 - 1;
      if (v26)
      {
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      uint64_t v40 = (v39 & (((v37 >> 6) - v18) >> 63)) + (v37 >> 6) - v18;
      if (v40 < v39) {
        uint64_t v39 = 0;
      }
      a4[1] = a4[1] & 0x3FLL | ((v40 - v39) << 6);
    }
  }
}

uint64_t sub_25930203C(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v5 >= 1)
  {
    uint64_t v7 = result;
    unint64_t v8 = *(void *)(a3 + 16);
    uint64_t v9 = v8 - v5;
    if ((uint64_t)v8 < v5) {
      ++v9;
    }
    if (result < v9 >> 1)
    {
      unint64_t result = MEMORY[0x25A2D9D70](*a4 & 0x3FLL);
      if (result / 3 > v7)
      {
        if (v7 < 0)
        {
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        if (v8 < v7)
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v7)
        {
          uint64_t v10 = 0;
          while (1)
          {
            sub_25930A8C0();
            sub_25930A900();
            unint64_t result = sub_25930A910();
            if (__OFSUB__(1 << *a4, 1)) {
              break;
            }
            if (sub_2593094A0())
            {
              while (1)
              {
                uint64_t v11 = sub_2593094D0();
                if ((v12 & 1) == 0 && v11 == v10) {
                  break;
                }
                sub_2593094F0();
              }
            }
            unint64_t result = v10 + v5;
            if (__OFADD__(v10, v5)) {
              goto LABEL_53;
            }
            ++v10;
            unint64_t result = sub_2593094E0();
            if (v10 == v7) {
              goto LABEL_19;
            }
          }
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        goto LABEL_19;
      }
      sub_2593094A0();
      uint64_t v21 = sub_2593094D0();
      if ((v22 & 1) != 0 || v21 >= v7)
      {
LABEL_40:
        unint64_t result = sub_2593094F0();
LABEL_19:
        uint64_t v13 = a4[1];
        if (__OFSUB__(v13 >> 6, v5))
        {
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        uint64_t v14 = 1 << *a4;
        BOOL v15 = __OFSUB__(v14, 1);
        uint64_t v16 = v14 - 1;
        if (v15)
        {
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
        uint64_t v17 = (v16 & (((v13 >> 6) - v5) >> 63)) + (v13 >> 6) - v5;
        if (v17 < v16) {
          uint64_t v16 = 0;
        }
        a4[1] = a4[1] & 0x3FLL | ((v17 - v16) << 6);
        return result;
      }
      if (!__OFADD__(v21, v5))
      {
        sub_2593094E0();
        goto LABEL_40;
      }
      __break(1u);
LABEL_46:
      sub_2593094A0();
      uint64_t v23 = sub_2593094D0();
      if ((v24 & 1) == 0 && v23 >= v4)
      {
        BOOL v15 = __OFSUB__(v23, v5);
        unint64_t result = v23 - v5;
        if (v15)
        {
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        sub_2593094E0();
      }
      return sub_2593094F0();
    }
    uint64_t v4 = a2;
    uint64_t v18 = v8 - a2;
    if (__OFSUB__(v8, a2))
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    unint64_t result = MEMORY[0x25A2D9D70](*a4 & 0x3FLL);
    if (v18 >= result / 3) {
      goto LABEL_46;
    }
    if ((uint64_t)v8 < v4)
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (v4 < 0)
    {
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    if (v8 != v4)
    {
      if (v8 <= v4)
      {
LABEL_65:
        __break(1u);
        return result;
      }
      while (1)
      {
        sub_25930A8C0();
        sub_25930A900();
        unint64_t result = sub_25930A910();
        if (__OFSUB__(1 << *a4, 1)) {
          goto LABEL_55;
        }
        if (sub_2593094A0())
        {
          while (1)
          {
            uint64_t v19 = sub_2593094D0();
            if ((v20 & 1) == 0 && v19 == v4) {
              break;
            }
            sub_2593094F0();
          }
        }
        unint64_t result = v4 - v5;
        if (__OFSUB__(v4, v5)) {
          goto LABEL_56;
        }
        ++v4;
        unint64_t result = sub_2593094E0();
        if (v4 == v8) {
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t sub_259302478(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v5 >= 1)
  {
    uint64_t v7 = result;
    unint64_t v8 = *(void *)(a3 + 16);
    uint64_t v9 = v8 - v5;
    if ((uint64_t)v8 < v5) {
      ++v9;
    }
    if (result < v9 >> 1)
    {
      unint64_t result = MEMORY[0x25A2D9D70](*a4 & 0x3FLL);
      if (result / 3 > v7)
      {
        if (v7 < 0)
        {
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        if (v8 < v7)
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v7)
        {
          uint64_t v10 = 0;
          while (1)
          {
            sub_25930A8C0();
            sub_25930A900();
            unint64_t result = sub_25930A910();
            if (__OFSUB__(1 << *a4, 1)) {
              break;
            }
            if (sub_2593094A0())
            {
              while (1)
              {
                uint64_t v11 = sub_2593094D0();
                if ((v12 & 1) == 0 && v11 == v10) {
                  break;
                }
                sub_2593094F0();
              }
            }
            unint64_t result = v10 + v5;
            if (__OFADD__(v10, v5)) {
              goto LABEL_53;
            }
            ++v10;
            unint64_t result = sub_2593094E0();
            if (v10 == v7) {
              goto LABEL_19;
            }
          }
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        goto LABEL_19;
      }
      sub_2593094A0();
      uint64_t v21 = sub_2593094D0();
      if ((v22 & 1) != 0 || v21 >= v7)
      {
LABEL_40:
        unint64_t result = sub_2593094F0();
LABEL_19:
        uint64_t v13 = a4[1];
        if (__OFSUB__(v13 >> 6, v5))
        {
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        uint64_t v14 = 1 << *a4;
        BOOL v15 = __OFSUB__(v14, 1);
        uint64_t v16 = v14 - 1;
        if (v15)
        {
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
        uint64_t v17 = (v16 & (((v13 >> 6) - v5) >> 63)) + (v13 >> 6) - v5;
        if (v17 < v16) {
          uint64_t v16 = 0;
        }
        a4[1] = a4[1] & 0x3FLL | ((v17 - v16) << 6);
        return result;
      }
      if (!__OFADD__(v21, v5))
      {
        sub_2593094E0();
        goto LABEL_40;
      }
      __break(1u);
LABEL_46:
      sub_2593094A0();
      uint64_t v23 = sub_2593094D0();
      if ((v24 & 1) == 0 && v23 >= v4)
      {
        BOOL v15 = __OFSUB__(v23, v5);
        unint64_t result = v23 - v5;
        if (v15)
        {
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        sub_2593094E0();
      }
      return sub_2593094F0();
    }
    uint64_t v4 = a2;
    uint64_t v18 = v8 - a2;
    if (__OFSUB__(v8, a2))
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    unint64_t result = MEMORY[0x25A2D9D70](*a4 & 0x3FLL);
    if (v18 >= result / 3) {
      goto LABEL_46;
    }
    if ((uint64_t)v8 < v4)
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (v4 < 0)
    {
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    if (v8 != v4)
    {
      if (v8 <= v4)
      {
LABEL_65:
        __break(1u);
        return result;
      }
      while (1)
      {
        sub_25930A8C0();
        sub_25930A900();
        unint64_t result = sub_25930A910();
        if (__OFSUB__(1 << *a4, 1)) {
          goto LABEL_55;
        }
        if (sub_2593094A0())
        {
          while (1)
          {
            uint64_t v19 = sub_2593094D0();
            if ((v20 & 1) == 0 && v19 == v4) {
              break;
            }
            sub_2593094F0();
          }
        }
        unint64_t result = v4 - v5;
        if (__OFSUB__(v4, v5)) {
          goto LABEL_56;
        }
        ++v4;
        unint64_t result = sub_2593094E0();
        if (v4 == v8) {
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2593028B4(uint64_t a1)
{
  return sub_25925D074(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2593028C8(void *a1)
{
  return sub_25925D7A4(0, a1[2], 0, a1);
}

uint64_t sub_2593028DC(uint64_t a1)
{
  return sub_25925D7B8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2593028F0(void *a1)
{
  return sub_25925D920(0, a1[2], 0, a1);
}

uint64_t sub_259302904(uint64_t a1)
{
  return sub_25925DAAC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

double sub_259302918@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t v6 = sub_25930A910();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_11:
    double result = 0.0;
    *(_OWORD *)a2 = xmmword_259314020;
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = 0;
    return result;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 32 * v8) != a1)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_11;
      }
    }
    while (*(void *)(v9 + 32 * v8) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v2;
  uint64_t v16 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_259302FEC();
    uint64_t v12 = v16;
  }
  uint64_t v13 = (_OWORD *)(*(void *)(v12 + 48) + 32 * v8);
  long long v14 = v13[1];
  *(_OWORD *)a2 = *v13;
  *(_OWORD *)(a2 + 16) = v14;
  sub_259304D58(v8);
  *uint64_t v2 = v16;
  swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_259302A74(uint64_t a1)
{
  uint64_t v3 = *v1;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t v4 = sub_25930A910();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = v3 + 56;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(v3 + 48);
  if (*(void *)(v8 + 16 * v6) != a1)
  {
    uint64_t v12 = ~v5;
    unint64_t v6 = (v6 + 1) & v12;
    if ((*(void *)(v7 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
    {
      while (*(void *)(v8 + 16 * v6) != a1)
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v7 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          return 0;
        }
      }
      goto LABEL_3;
    }
    return 0;
  }
LABEL_3:
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v14 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2593031A8();
    uint64_t v10 = v14;
  }
  uint64_t v11 = *(void *)(*(void *)(v10 + 48) + 16 * v6);
  sub_259304F08(v6);
  *uint64_t v1 = v14;
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_259302BD0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E160);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25930A390();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    double result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  double result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    double result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    double result = (void *)swift_bridgeObjectRetain();
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

void *sub_259302D84()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_26A37F900);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_25930A390();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    double result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  char v24 = v1;
  double result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    double result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_2592207A0(*(void *)(v6 + 48) + v19, (uint64_t)v5, &qword_26A37DF28);
    double result = (void *)sub_25924A404((uint64_t)v5, *(void *)(v8 + 48) + v19, &qword_26A37DF28);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16)
  {
LABEL_25:
    double result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_259302FEC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F838);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25930A390();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    double result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  double result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    double result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22)
      {
        int64_t v9 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v9);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)(v17 + 16);
    unint64_t v19 = *(void *)(v17 + 24);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v17;
    *(void *)(v20 + 16) = v18;
    *(void *)(v20 + 24) = v19;
    double result = (void *)sub_259277D68(v18, v19);
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2593031A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F8C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25930A390();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    double result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  double result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    double result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_259303340()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E160);
  uint64_t v3 = sub_25930A3A0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25930A8C0();
    swift_bridgeObjectRetain();
    sub_259309C00();
    uint64_t result = sub_25930A910();
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

uint64_t sub_2593035F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v32 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A37F900);
  uint64_t result = sub_25930A3A0();
  uint64_t v7 = result;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  int64_t v29 = v0;
  int64_t v8 = 0;
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v30 = v5 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v9;
  int64_t v31 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = result + 56;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v8 << 6);
      goto LABEL_24;
    }
    int64_t v17 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v17 >= v31) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v30 + 8 * v17);
    ++v8;
    if (!v18)
    {
      int64_t v8 = v17 + 1;
      if (v17 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v18 = *(void *)(v30 + 8 * v8);
      if (!v18)
      {
        int64_t v8 = v17 + 2;
        if (v17 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v30 + 8 * v8);
        if (!v18) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
LABEL_24:
    uint64_t v20 = *(void *)(v32 + 72);
    sub_2592207A0(*(void *)(v5 + 48) + v20 * v16, (uint64_t)v4, &qword_26A37DF28);
    sub_25930A8C0();
    sub_25930A900();
    uint64_t result = sub_25930A910();
    uint64_t v21 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v13 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t result = sub_25924A404((uint64_t)v4, *(void *)(v7 + 48) + v14 * v20, &qword_26A37DF28);
    ++*(void *)(v7 + 16);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v29;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v30 + 8 * v19);
  if (v18)
  {
    int64_t v8 = v19;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v8 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v8 >= v31) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v30 + 8 * v8);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_259303938()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F838);
  uint64_t result = sub_25930A3A0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v29 = v2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v30 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = result + 56;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v30) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_24:
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = v17[2];
    unint64_t v21 = v17[3];
    sub_25930A8C0();
    sub_25930A900();
    uint64_t result = sub_25930A910();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
      unint64_t v10 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    uint64_t v11 = (void *)(*(void *)(v4 + 48) + 32 * v10);
    void *v11 = v18;
    v11[1] = v19;
    v11[2] = v20;
    v11[3] = v21;
    ++*(void *)(v4 + 16);
    uint64_t result = sub_259277D68(v20, v21);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v30)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v29 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v30) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_259303C04()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F8C0);
  uint64_t result = sub_25930A3A0();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v28) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v28) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    sub_25930A8C0();
    sub_25930A900();
    uint64_t result = sub_25930A910();
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
    *unint64_t v12 = v19;
    v12[1] = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_259303EA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E160);
  uint64_t v3 = sub_25930A3A0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v30 = (void *)(v2 + 56);
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
                  *int64_t v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_25930A8C0();
      sub_259309C00();
      uint64_t result = sub_25930A910();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_259304180()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v33 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26A37F900);
  uint64_t result = sub_25930A3A0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v30 = v0;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v32 = (void *)(v5 + 56);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & v9;
    int64_t v31 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 56;
    while (1)
    {
      if (v12)
      {
        unint64_t v15 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v31) {
          goto LABEL_33;
        }
        unint64_t v18 = v32[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v18 = v32[v8];
          if (!v18)
          {
            int64_t v8 = v17 + 2;
            if (v17 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v18 = v32[v8];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v31)
              {
LABEL_33:
                uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
                if (v28 > 63) {
                  bzero(v32, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v28;
                }
                uint64_t v1 = v30;
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v18 = v32[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v8 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v8 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v32[v8];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v8 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v12 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(v33 + 72);
      sub_25924A404(*(void *)(v5 + 48) + v20 * v16, (uint64_t)v4, &qword_26A37DF28);
      sub_25930A8C0();
      sub_25930A900();
      uint64_t result = sub_25930A910();
      uint64_t v21 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v14 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t result = sub_25924A404((uint64_t)v4, *(void *)(v7 + 48) + v14 * v20, &qword_26A37DF28);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_2593044FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F838);
  uint64_t result = sub_25930A3A0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v32 = (void *)(v2 + 56);
    uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v31 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v9 = result + 56;
    while (1)
    {
      if (v8)
      {
        unint64_t v12 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v13 = v12 | (v5 << 6);
      }
      else
      {
        int64_t v14 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v31) {
          goto LABEL_33;
        }
        unint64_t v15 = v32[v14];
        ++v5;
        if (!v15)
        {
          int64_t v5 = v14 + 1;
          if (v14 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v15 = v32[v5];
          if (!v15)
          {
            int64_t v5 = v14 + 2;
            if (v14 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v15 = v32[v5];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v31)
              {
LABEL_33:
                uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
                if (v30 > 63) {
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v30;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v32[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v5 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v32[v5];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
      }
      uint64_t v17 = v2;
      unint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v13);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      uint64_t v22 = v18[2];
      uint64_t v21 = v18[3];
      sub_25930A8C0();
      sub_25930A900();
      uint64_t result = sub_25930A910();
      uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v10 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v9 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v10 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
      uint64_t v11 = (void *)(*(void *)(v4 + 48) + 32 * v10);
      void *v11 = v20;
      v11[1] = v19;
      v11[2] = v22;
      v11[3] = v21;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v17;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2593047F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F8C0);
  uint64_t result = sub_25930A3A0();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v29 = (void *)(v2 + 56);
    uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9) {
          goto LABEL_33;
        }
        unint64_t v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v16 = v29[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v16 = v29[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v28;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v29[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      unint64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v14);
      uint64_t v20 = *v18;
      uint64_t v19 = v18[1];
      sub_25930A8C0();
      sub_25930A900();
      uint64_t result = sub_25930A910();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      unint64_t v12 = (void *)(*(void *)(v4 + 48) + 16 * v11);
      *unint64_t v12 = v20;
      v12[1] = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

void sub_259304AC8(unint64_t a1)
{
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v3 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  int64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v1;
  uint64_t v7 = *v1 + 56;
  uint64_t v8 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v9 = (a1 + 1) & ~v8;
  if (((1 << v9) & *(void *)(v7 + 8 * (v9 >> 6))) != 0)
  {
    unint64_t v22 = v1;
    uint64_t v10 = ~v8;
    swift_retain();
    uint64_t v11 = sub_25930A340();
    uint64_t v24 = v7;
    if ((*(void *)(v7 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
    {
      unint64_t v12 = (v11 + 1) & v10;
      uint64_t v13 = *(void *)(v3 + 72);
      while (1)
      {
        int64_t v14 = v13 * v9;
        sub_2592207A0(*(void *)(v6 + 48) + v13 * v9, (uint64_t)v5, &qword_26A37DF28);
        sub_25930A8C0();
        sub_25930A900();
        uint64_t v15 = sub_25930A910();
        sub_25924A3A8((uint64_t)v5, &qword_26A37DF28);
        unint64_t v16 = v15 & v10;
        if ((uint64_t)a1 >= (uint64_t)v12) {
          break;
        }
        if (v16 < v12) {
          goto LABEL_11;
        }
LABEL_12:
        unint64_t v17 = v13 * a1;
        if ((uint64_t)(v13 * a1) < v14 || *(void *)(v6 + 48) + v13 * a1 >= *(void *)(v6 + 48) + v14 + v13)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v9;
          if (v17 == v14) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v9;
LABEL_6:
        unint64_t v9 = (v9 + 1) & v10;
        if (((*(void *)(v24 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_16;
        }
      }
      if (v16 < v12) {
        goto LABEL_6;
      }
LABEL_11:
      if ((uint64_t)a1 < (uint64_t)v16) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_16:
    *(void *)(v24 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    swift_release();
    uint64_t v1 = v22;
  }
  else
  {
    *(void *)(v7 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v18 = *v1;
  uint64_t v19 = *(void *)(*v1 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v18 + 16) = v21;
    ++*(_DWORD *)(v18 + 36);
  }
}

unint64_t sub_259304D58(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_25930A340();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_25930A8C0();
        sub_25930A900();
        unint64_t v11 = sub_25930A910() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 32 * v2);
          int64_t v14 = (_OWORD *)(v12 + 32 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 2))
          {
            long long v10 = v14[1];
            *uint64_t v13 = *v14;
            v13[1] = v10;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_259304F08(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_25930A340();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_25930A8C0();
        sub_25930A900();
        unint64_t v10 = sub_25930A910() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v2);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            *uint64_t v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_2593050B8@<X0>(uint64_t *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  LODWORD(v48) = a2;
  uint64_t v46 = a3;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DF28);
  uint64_t v5 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v7 = (uint64_t *)((char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = v3;
  uint64_t v8 = *v3;
  sub_25930A8C0();
  uint64_t v49 = a1;
  uint64_t v9 = *a1;
  sub_25930A900();
  uint64_t v10 = sub_25930A910();
  uint64_t v11 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v12 = v10 & ~v11;
  if ((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v13 = ~v11;
    uint64_t v14 = v5;
    uint64_t v15 = *(void *)(v5 + 72);
    do
    {
      sub_2592207A0(*(void *)(v8 + 48) + v15 * v12, (uint64_t)v7, &qword_26A37DF28);
      uint64_t v16 = *v7;
      sub_25924A3A8((uint64_t)v7, &qword_26A37DF28);
      BOOL v17 = v16 == v9;
      BOOL v18 = v16 == v9;
      if (v17) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v13;
    }
    while (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
  }
  else
  {
    uint64_t v14 = v5;
    BOOL v18 = 0;
  }
  uint64_t v19 = v47;
  uint64_t v20 = *(void *)(*v47 + 16);
  BOOL v21 = !v18;
  uint64_t v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(*v47 + 24);
  if (v23 >= v22 && (v48 & 1) != 0)
  {
    if (v18)
    {
LABEL_11:
      unint64_t v24 = *(void *)(v14 + 72) * v12;
      uint64_t v25 = v46;
LABEL_28:
      uint64_t v41 = *v19;
      sub_25924A404(*(void *)(*v19 + 48) + v24, v25, &qword_26A37DF28);
      sub_25924A404((uint64_t)v49, *(void *)(v41 + 48) + v24, &qword_26A37DF28);
      uint64_t v40 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v25, v40, 1, v45);
    }
    goto LABEL_16;
  }
  if (v48)
  {
    sub_259304180();
  }
  else
  {
    if (v23 >= v22)
    {
      sub_259302D84();
      if (v18) {
        goto LABEL_11;
      }
LABEL_16:
      unint64_t v26 = v12 >> 6;
      uint64_t v27 = 1 << v12;
      uint64_t v25 = v46;
LABEL_25:
      uint64_t v36 = *v19;
      *(void *)(*v19 + 8 * v26 + 56) |= v27;
      sub_25924A404((uint64_t)v49, *(void *)(v36 + 48) + *(void *)(v14 + 72) * v12, &qword_26A37DF28);
      uint64_t v37 = *(void *)(v36 + 16);
      BOOL v38 = __OFADD__(v37, 1);
      uint64_t v39 = v37 + 1;
      if (!v38)
      {
        *(void *)(v36 + 16) = v39;
        uint64_t v40 = 1;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v25, v40, 1, v45);
      }
      goto LABEL_31;
    }
    sub_2593035F0();
  }
  uint64_t v28 = *v19;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t v29 = sub_25930A910();
  uint64_t v30 = -1 << *(unsigned char *)(v28 + 32);
  unint64_t v12 = v29 & ~v30;
  uint64_t v48 = v28;
  uint64_t v31 = v28 + 56;
  unint64_t v26 = v12 >> 6;
  uint64_t v27 = 1 << v12;
  if (((1 << v12) & *(void *)(v31 + 8 * (v12 >> 6))) != 0)
  {
    uint64_t v32 = ~v30;
    uint64_t v44 = v14;
    uint64_t v33 = *(void *)(v14 + 72);
    while (1)
    {
      unint64_t v24 = v33 * v12;
      sub_2592207A0(*(void *)(v48 + 48) + v33 * v12, (uint64_t)v7, &qword_26A37DF28);
      uint64_t v34 = *v7;
      uint64_t v35 = *v49;
      sub_25924A3A8((uint64_t)v7, &qword_26A37DF28);
      if (v34 == v35) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v32;
      unint64_t v26 = v12 >> 6;
      uint64_t v27 = 1 << v12;
      if ((*(void *)(v31 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
      {
        uint64_t v25 = v46;
        uint64_t v19 = v47;
        uint64_t v14 = v44;
        if (!v18) {
          goto LABEL_25;
        }
        goto LABEL_32;
      }
    }
    uint64_t v25 = v46;
    uint64_t v19 = v47;
    uint64_t v14 = v44;
    if (!v18) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  uint64_t v25 = v46;
  if (!v18) {
    goto LABEL_25;
  }
LABEL_32:
  uint64_t result = sub_25930A820();
  __break(1u);
  return result;
}

uint64_t sub_259305454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v12 = *v6;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t v13 = sub_25930A910();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v15 = v13 & ~v14;
  uint64_t v16 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v17 = *(void *)(v12 + 48);
  if (*(void *)(v17 + 32 * v15) == a1)
  {
    uint64_t v18 = 0;
    BOOL v19 = 1;
    goto LABEL_10;
  }
  uint64_t v20 = ~v14;
  unint64_t v15 = (v15 + 1) & ~v14;
  if ((*(void *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    uint64_t v18 = 1;
    while (1)
    {
      uint64_t v21 = *(void *)(v17 + 32 * v15);
      BOOL v19 = v21 == a1;
      if (v21 == a1) {
        break;
      }
      unint64_t v15 = (v15 + 1) & v20;
      if (((*(void *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
        goto LABEL_10;
      }
    }
    uint64_t v18 = 0;
  }
  else
  {
LABEL_9:
    BOOL v19 = 0;
    uint64_t v18 = 1;
  }
LABEL_10:
  uint64_t v22 = *(void *)(v12 + 16);
  uint64_t result = v22 + v18;
  if (__OFADD__(v22, v18))
  {
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v24 = *(void *)(v12 + 24);
  if (v24 >= result && (a5 & 1) != 0)
  {
    if (!v19) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if (a5)
  {
    sub_2593044FC();
  }
  else
  {
    if (v24 >= result)
    {
      uint64_t result = (uint64_t)sub_259302FEC();
      if (!v19)
      {
LABEL_29:
        uint64_t v31 = *v6;
        *(void *)(*v6 + 8 * (v15 >> 6) + 56) |= 1 << v15;
        uint64_t v32 = (void *)(*(void *)(v31 + 48) + 32 * v15);
        *uint64_t v32 = a1;
        v32[1] = a2;
        v32[2] = a3;
        v32[3] = a4;
        uint64_t v33 = *(void *)(v31 + 16);
        BOOL v34 = __OFADD__(v33, 1);
        uint64_t v35 = v33 + 1;
        if (!v34)
        {
          *(void *)(v31 + 16) = v35;
          *(_OWORD *)a6 = xmmword_259314020;
          *(void *)(a6 + 16) = 0;
          *(void *)(a6 + 24) = 0;
          return result;
        }
        goto LABEL_33;
      }
LABEL_27:
      uint64_t v29 = *(void *)(*v6 + 48) + 32 * v15;
      long long v30 = *(_OWORD *)(v29 + 16);
      *(_OWORD *)a6 = *(_OWORD *)v29;
      *(_OWORD *)(a6 + 16) = v30;
      *(void *)uint64_t v29 = a1;
      *(void *)(v29 + 8) = a2;
      *(void *)(v29 + 16) = a3;
      *(void *)(v29 + 24) = a4;
      return result;
    }
    sub_259303938();
  }
  uint64_t v25 = *v6;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t result = sub_25930A910();
  uint64_t v26 = -1 << *(unsigned char *)(v25 + 32);
  unint64_t v15 = result & ~v26;
  if (((*(void *)(v25 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t v27 = *(void *)(v25 + 48);
  if (*(void *)(v27 + 32 * v15) != a1)
  {
    uint64_t v28 = ~v26;
    while (1)
    {
      unint64_t v15 = (v15 + 1) & v28;
      if (((*(void *)(v25 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
        break;
      }
      if (*(void *)(v27 + 32 * v15) == a1) {
        goto LABEL_26;
      }
    }
LABEL_28:
    if (!v19) {
      goto LABEL_29;
    }
    goto LABEL_34;
  }
LABEL_26:
  if (v19) {
    goto LABEL_27;
  }
LABEL_34:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37DEF8);
  uint64_t result = sub_25930A820();
  __break(1u);
  return result;
}

uint64_t sub_259305700(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = *v3;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t v8 = sub_25930A910();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  uint64_t v11 = v7 + 56;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(v7 + 48);
  if (*(void *)(v12 + 16 * v10) == a1)
  {
    uint64_t v13 = 0;
    BOOL v14 = 1;
    goto LABEL_10;
  }
  uint64_t v15 = ~v9;
  unint64_t v10 = (v10 + 1) & ~v9;
  if ((*(void *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v13 = 1;
    while (1)
    {
      uint64_t v16 = *(void *)(v12 + 16 * v10);
      BOOL v14 = v16 == a1;
      if (v16 == a1) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v15;
      if (((*(void *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_10;
      }
    }
    uint64_t v13 = 0;
  }
  else
  {
LABEL_9:
    BOOL v14 = 0;
    uint64_t v13 = 1;
  }
LABEL_10:
  uint64_t v17 = *(void *)(v7 + 16);
  uint64_t v18 = v17 + v13;
  if (__OFADD__(v17, v13))
  {
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v19 = *(void *)(v7 + 24);
  if (v19 >= v18 && (a3 & 1) != 0)
  {
    if (!v14) {
      goto LABEL_29;
    }
    goto LABEL_27;
  }
  if (a3)
  {
    sub_2593047F8();
  }
  else
  {
    if (v19 >= v18)
    {
      sub_2593031A8();
      if (!v14)
      {
LABEL_29:
        uint64_t v27 = *v3;
        *(void *)(*v3 + 8 * (v10 >> 6) + 56) |= 1 << v10;
        uint64_t v28 = (uint64_t *)(*(void *)(v27 + 48) + 16 * v10);
        *uint64_t v28 = a1;
        v28[1] = a2;
        uint64_t v29 = *(void *)(v27 + 16);
        BOOL v30 = __OFADD__(v29, 1);
        uint64_t v31 = v29 + 1;
        if (!v30)
        {
          uint64_t result = 0;
          *(void *)(v27 + 16) = v31;
          return result;
        }
        goto LABEL_33;
      }
LABEL_27:
      uint64_t v25 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t result = *v25;
      *uint64_t v25 = a1;
      v25[1] = a2;
      return result;
    }
    sub_259303C04();
  }
  uint64_t v20 = *v3;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t v21 = sub_25930A910();
  uint64_t v22 = -1 << *(unsigned char *)(v20 + 32);
  unint64_t v10 = v21 & ~v22;
  if (((*(void *)(v20 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t v23 = *(void *)(v20 + 48);
  if (*(void *)(v23 + 16 * v10) != a1)
  {
    uint64_t v24 = ~v22;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v24;
      if (((*(void *)(v20 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      if (*(void *)(v23 + 16 * v10) == a1) {
        goto LABEL_26;
      }
    }
LABEL_28:
    if (!v14) {
      goto LABEL_29;
    }
    goto LABEL_34;
  }
LABEL_26:
  if (v14) {
    goto LABEL_27;
  }
LABEL_34:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37F8B8);
  uint64_t result = sub_25930A820();
  __break(1u);
  return result;
}

unint64_t sub_25930597C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25930A340();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        unint64_t v10 = (_DWORD *)(v9 + 4 * v6);
        uint64_t result = MEMORY[0x25A2DB110](*(void *)(a2 + 40), *v10, 4);
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        BOOL v14 = (_DWORD *)(v9 + 4 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *BOOL v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t v16 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A37C990) - 8) + 72);
        int64_t v17 = v16 * v3;
        uint64_t result = v15 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_259305B60(_OWORD *a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  *(_OWORD *)(v2 + 24) = *a1;
  return MEMORY[0x270FA2498](sub_259305B88, 0, 0);
}

uint64_t sub_259305B88()
{
  uint64_t v1 = v0[2];
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26A37F828 + dword_26A37F828);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_259305C44;
  uint64_t v6 = v0[3];
  uint64_t v5 = v0[4];
  return v8(v6, v5, v3, v2);
}

uint64_t sub_259305C44()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_259305D3C(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, uint64_t a5)
{
  *(void *)(v5 + 80) = a2;
  *(void *)(v5 + 88) = a5;
  *(_OWORD *)(v5 + 96) = *a4;
  return MEMORY[0x270FA2498](sub_259305D64, 0, 0);
}

uint64_t sub_259305D64()
{
  uint64_t v2 = v0[12];
  unint64_t v1 = v0[13];
  uint64_t v4 = (os_unfair_lock_s *)v0[10];
  uint64_t v3 = v0[11];
  v0[2] = v0;
  v0[3] = sub_259242140;
  uint64_t v5 = swift_continuation_init();
  sub_259306794(v5, v4, v2, v1, v3);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_259305E1C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_259305E34(a1, a2, a3, a4);
}

uint64_t sub_259305E34(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(void *)(a3 + 16) <= a4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = (void *)result;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t result = sub_25930A910();
  uint64_t v6 = 1 << *v5;
  BOOL v7 = __OFSUB__(v6, 1);
  uint64_t v8 = v6 - 1;
  if (v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v9 = v8 & result;
  uint64_t result = sub_2593094A0();
  uint64_t v12 = v9;
  uint64_t v13 = result;
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  while (1)
  {
    uint64_t v10 = sub_2593094D0();
    if ((v11 & 1) == 0 && v10 == a4) {
      return v9;
    }
    sub_2593094F0();
    uint64_t v9 = v12;
    uint64_t result = v13;
    if (!v13) {
      goto LABEL_13;
    }
  }
}

void sub_259305F50(void *a1, os_unfair_lock_s *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E690);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v7 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  uint64_t v8 = sub_2592EDF54(a1);
  uint64_t v10 = v9;
  os_unfair_lock_unlock(v7);
  if (v8)
  {
    uint64_t v11 = *(void *)(v8 + 16);
    if (v11)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)(v8 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      if (a1) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      if (a1)
      {
LABEL_8:
        uint64_t v13 = *(void *)(v10 + 16);
        if (v13)
        {
          swift_bridgeObjectRetain();
          id v14 = a1;
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)(v10 + 8 * j + 32))
            {
              uint64_t v27 = a1;
              id v19 = a1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
              uint64_t v20 = sub_25930A770();
              if (v20)
              {
                uint64_t v16 = v20;
              }
              else
              {
                uint64_t v16 = swift_allocError();
                void *v17 = v27;
              }
              swift_allocError();
              *int64_t v18 = v16;
              swift_continuation_throwingResumeWithError();
            }
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          id v25 = a1;
        }
        sub_2592435BC(v8);

LABEL_26:
        swift_bridgeObjectRelease();
        return;
      }
    }
    uint64_t v21 = *(void *)(v10 + 16);
    if (v21)
    {
      swift_bridgeObjectRetain();
      for (uint64_t k = 0; k != v21; ++k)
      {
        uint64_t v23 = *(void *)(v10 + 8 * k + 32);
        if (v23)
        {
          uint64_t v24 = type metadata accessor for StoredPhoto(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v6, 1, 1, v24);
          sub_25924A404((uint64_t)v6, *(void *)(*(void *)(v23 + 64) + 40), &qword_26A37E690);
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      sub_2592435BC(v8);
      goto LABEL_26;
    }
    sub_2592435BC(v8);
    swift_bridgeObjectRelease();
  }
}

void sub_259306264(void *a1, os_unfair_lock_s *a2)
{
  uint64_t v3 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  uint64_t v4 = sub_2592EE260(a1);
  uint64_t v6 = v5;
  os_unfair_lock_unlock(v3);
  if (v4)
  {
    uint64_t v7 = *(void *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v4 + 8 * i + 32)) {
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      if (a1) {
        goto LABEL_8;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      if (a1)
      {
LABEL_8:
        uint64_t v9 = *(void *)(v6 + 16);
        if (v9)
        {
          swift_bridgeObjectRetain();
          id v10 = a1;
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)(v6 + 8 * j + 32))
            {
              *(void *)&long long v21 = a1;
              id v15 = a1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
              uint64_t v16 = sub_25930A770();
              if (v16)
              {
                uint64_t v12 = v16;
              }
              else
              {
                uint64_t v12 = swift_allocError();
                *uint64_t v13 = v21;
              }
              swift_allocError();
              *id v14 = v12;
              swift_continuation_throwingResumeWithError();
            }
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          id v20 = a1;
        }
        sub_2592435BC(v4);

LABEL_26:
        swift_bridgeObjectRelease();
        return;
      }
    }
    uint64_t v17 = *(void *)(v6 + 16);
    if (v17)
    {
      swift_bridgeObjectRetain();
      for (uint64_t k = 0; k != v17; ++k)
      {
        uint64_t v19 = *(void *)(v6 + 8 * k + 32);
        if (v19)
        {
          long long v21 = xmmword_259314080;
          sub_25924A404((uint64_t)&v21, *(void *)(*(void *)(v19 + 64) + 40), &qword_26A37F630);
          swift_continuation_throwingResume();
        }
      }
      swift_bridgeObjectRelease();
      sub_2592435BC(v4);
      goto LABEL_26;
    }
    sub_2592435BC(v4);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_259306500(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(void *)(a3 + 16) <= a4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = (void *)result;
  sub_25930A8C0();
  sub_25930A900();
  uint64_t result = sub_25930A910();
  uint64_t v6 = 1 << *v5;
  BOOL v7 = __OFSUB__(v6, 1);
  uint64_t v8 = v6 - 1;
  if (v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v9 = v8 & result;
  uint64_t result = sub_2593094A0();
  uint64_t v12 = v9;
  uint64_t v13 = result;
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  while (1)
  {
    uint64_t v10 = sub_2593094D0();
    if ((v11 & 1) == 0 && v10 == a4) {
      return v9;
    }
    sub_2593094F0();
    uint64_t v9 = v12;
    uint64_t result = v13;
    if (!v13) {
      goto LABEL_13;
    }
  }
}

void sub_25930661C(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A37E690);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  os_unfair_lock_lock(a2);
  uint64_t v11 = sub_2592ECD20(a1, a3, a4);
  os_unfair_lock_unlock(a2);
  if (v11 == 1)
  {
    swift_continuation_throwingResume();
  }
  else if (v11 != 2)
  {
    swift_continuation_throwingResume();
    if (v11)
    {
      sub_259307A14(a3, (uint64_t)v10);
      uint64_t v12 = type metadata accessor for StoredPhoto(0);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
      sub_25924A404((uint64_t)v10, *(void *)(*(void *)(v11 + 64) + 40), &qword_26A37E690);
      swift_continuation_throwingResume();
    }
  }
}

void sub_259306794(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v9 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  uint64_t v10 = sub_2592ED4F8(a1, a3, a4, a5);
  os_unfair_lock_unlock(v9);
  if (v10 == 1)
  {
    swift_continuation_throwingResume();
  }
  else if (v10 != 2)
  {
    swift_continuation_throwingResume();
    if (v10)
    {
      v11[0] = a3;
      v11[1] = a4;
      sub_259261DE0(a3, a4);
      sub_25924A404((uint64_t)v11, *(void *)(*(void *)(v10 + 64) + 40), &qword_26A37F630);
      swift_continuation_throwingResume();
    }
  }
}

void sub_259306890(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  uint64_t v5 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  sub_2592EE638(a1, a3, (uint64_t)&v16);
  os_unfair_lock_unlock(v5);
  id v7 = v16;
  uint64_t v6 = v17;
  unint64_t v8 = v18;
  if (v19 > 1u)
  {
    if (v19 == 2)
    {
      if (v16)
      {
        sub_2593078F4(v16, v17, v18, 2);
        swift_continuation_throwingResume();
      }
      else
      {
        sub_2593078F4(0, v17, v18, 2);
      }
      uint64_t v14 = v6;
      uint64_t v15 = v8;
      sub_25924A404((uint64_t)&v14, *(void *)(*(void *)(a1 + 64) + 40), &qword_26A37F630);
      swift_continuation_throwingResume();
      sub_259307924(v7, v6, v8, 2);
    }
  }
  else if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2F3D70);
    swift_allocError();
    void *v9 = v7;
    sub_2593078F4(v7, v6, v8, 1);
    swift_continuation_throwingResumeWithError();
    id v10 = v16;
    uint64_t v11 = v17;
    unint64_t v12 = v18;
    char v13 = v19;
    sub_259307924(v10, v11, v12, v13);
  }
  else
  {
    uint64_t v14 = (uint64_t)v16;
    uint64_t v15 = v17;
    sub_25924A404((uint64_t)&v14, *(void *)(*(void *)(a1 + 64) + 40), &qword_26A37F630);
    swift_continuation_throwingResume();
  }
}

uint64_t sub_259306A48()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCMessageCenter()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for XPCMessageCenter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMessageCenter);
}

uint64_t sub_259306AB0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCMessageCenter.Client()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for XPCMessageCenter.Client(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMessageCenter.Client);
}

uint64_t dispatch thunk of XPCMessageCenter.Client.__allocating_init(serviceName:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_259306B40()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCMessageCenter.Server()
{
  return swift_getGenericMetadata();
}

uint64_t method lookup function for XPCMessageCenter.Server(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMessageCenter.Server);
}

uint64_t dispatch thunk of XPCMessageCenter.Server.__allocating_init(serviceName:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_259306BEC()
{
  return sub_259273278(&qword_26A37E620, &qword_26A37E618);
}

unsigned char *storeEnumTagSinglePayload for XPCError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259306CF4);
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

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

unint64_t sub_259306D30()
{
  unint64_t result = qword_26A37F800;
  if (!qword_26A37F800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37F800);
  }
  return result;
}

uint64_t sub_259306D84()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_259306DBC(uint64_t a1)
{
  unsigned int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2592438A0;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A37F808 + dword_26A37F808);
  return v6(a1, v4);
}

uint64_t sub_259306E74(_OWORD *a1)
{
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_2592438A0;
  uint64_t v5 = (uint64_t (*)(_OWORD *, uint64_t))((char *)&dword_26A37F818 + dword_26A37F818);
  return v5(a1, v1);
}

void sub_259306F20()
{
  sub_2592EEC30(*(os_unfair_lock_s **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), sub_2592EDD94);
}

uint64_t sub_259306F54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 != 1) {
    return sub_259277DC4(a3, a4);
  }
  return result;
}

uint64_t type metadata accessor for XPCMessageCenter.XPCRequest()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for XPCMessageCenter.XPCErrorResponse()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259306F9C(uint64_t a1)
{
  return sub_2592F95BC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for XPCMessageCenter.XPCResponse()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259306FBC()
{
  type metadata accessor for XPCMessageCenter.XPCResponse();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  uint64_t v1 = sub_259309EC0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_259307084(uint64_t a1)
{
  type metadata accessor for XPCMessageCenter.XPCResponse();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B2F3D70);
  sub_259309EC0();
  return sub_2592F9944(a1);
}

uint64_t sub_25930716C(uint64_t a1)
{
  return sub_2592F801C(a1, *(void *)(v1 + 56));
}

double sub_25930717C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2592FA31C(a1, v2[7], v2[2], v2[3], v2[4], v2[5], v2[6], a2);
}

uint64_t sub_25930718C@<X0>(BOOL *a1@<X8>)
{
  return sub_2592FA48C(*(void *)(v1 + 64), a1);
}

uint64_t sub_2593071B4()
{
  uint64_t v1 = sub_2593099B0();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 84) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_259307288(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2593099B0() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void **)(v1 + 72);
  int v8 = *(_DWORD *)(v1 + 80);
  uint64_t v9 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 84) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  id v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *id v10 = v2;
  v10[1] = sub_25921D238;
  return sub_2592FD6AC(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_25930738C()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (((((*(void *)(v2 + 64) + v3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 11) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  swift_release();
  sub_259261F50(*(void *)(v0 + v4), *(void *)(v0 + v4 + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2593074C0(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v8 = (v7 + 11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v6;
  int v13 = *(_DWORD *)(v1 + v7);
  uint64_t v14 = *(uint64_t **)(v1 + v8);
  uint64_t v15 = *(void *)(v1 + v9);
  uint64_t v16 = *(void *)(v1 + v9 + 8);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v17;
  void *v17 = v3;
  v17[1] = sub_2592438A0;
  return sub_2592FB650(a1, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_25930764C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25930765C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_25930769C()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2592438A0;
  unint64_t v6 = (void *)swift_task_alloc();
  _OWORD v5[2] = v6;
  *unint64_t v6 = v5;
  v6[1] = sub_2592438A0;
  return sub_2592F1460(v2, v3, v4);
}

uint64_t sub_259307788(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2593077D0()
{
  return sub_2592F0CD0() & 1;
}

id sub_2593077F0(id a1, unint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)sub_259277D68((uint64_t)a1, a2);
  }
}

void sub_2593077FC(id a1, unint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    sub_259277DC4((uint64_t)a1, a2);
  }
}

void sub_259307808(uint64_t a1, void *a2, unint64_t a3, char a4)
{
  if (a1 != 1) {
    sub_2593077FC(a2, a3, a4 & 1);
  }
}

uint64_t sub_259307828(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 32);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_25921D238;
  v6[13] = v4;
  v6[14] = v5;
  v6[12] = a1;
  return MEMORY[0x270FA2498](sub_2592EECD4, 0, 0);
}

void sub_2593078E8()
{
  sub_2592EEE94(*(os_unfair_lock_s **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

id sub_2593078F4(id result, uint64_t a2, unint64_t a3, char a4)
{
  switch(a4)
  {
    case 2:
      return (id)sub_259277D68(a2, a3);
    case 1:
      return result;
    case 0:
      return (id)sub_259277D68((uint64_t)result, a2);
  }
  return result;
}

void sub_259307924(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  if (a4 != -1) {
    sub_259307938(a1, a2, a3, a4);
  }
}

void sub_259307938(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  switch(a4)
  {
    case 2:
      sub_259277DC4(a2, a3);
      break;
    case 1:

      break;
    case 0:
      sub_259277DC4((uint64_t)a1, a2);
      break;
  }
}

uint64_t sub_259307968(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_2592438A0;
  return MEMORY[0x270FA2498](sub_2592F3940, 0, 0);
}

uint64_t sub_259307A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StoredPhoto(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_259307A78()
{
  uint64_t v2 = v0[2];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2592438A0;
  v5[11] = v4;
  v5[12] = v3;
  v5[10] = v2;
  return MEMORY[0x270FA2498](sub_2592EEB6C, 0, 0);
}

void sub_259307B34()
{
  sub_2592EEC30(*(os_unfair_lock_s **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), sub_2592ED7E0);
}

uint64_t sub_259307B6C(uint64_t a1)
{
  return sub_2592EAED8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_259307B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2592EB01C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_259307BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2592EB01C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2592EAED8(v6, v7, v8);
  return a1;
}

uint64_t sub_259307C20(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2592EAED8(v4, v5, v6);
  return a1;
}

uint64_t sub_259307C68(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t sub_259307CB0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_259307CF4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_259307D0C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t sub_259307D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_259307D2C()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[4] = v2;
    v2[5] = MEMORY[0x263F8CF68] + 64;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_259307DEC(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v7 = 4;
  }
  else {
    unint64_t v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  int v8 = *(_DWORD *)(v5 + 80);
  if ((v8 & 0x1000F8) != 0 || (v7 | 1) > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unsigned int v11 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v11 >= 2) {
      unsigned int v11 = *(_DWORD *)a2 + 2;
    }
    if (v11 == 1)
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *((unsigned char *)a1 + v7) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      int v13 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v14 = (uint64_t *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
      sub_259261DE0(*v14, v16);
      *int v13 = v15;
      v13[1] = v16;
      *((unsigned char *)a1 + v7) = 0;
    }
  }
  return a1;
}

uint64_t sub_259307F60(_DWORD *a1)
{
  uint64_t result = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(*(void *)(result - 8) + 64);
  unint64_t v4 = 4;
  if (((v3 + 7) & 0xFFFFFFFFFFFFFFF8) != 0xFFFFFFFFFFFFFFF0) {
    unint64_t v4 = ((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v5 = *((unsigned __int8 *)a1 + v4);
  uint64_t v6 = v4 & 0xFFFFFFFC;
  if (v5 >= 2 && v6 != 0) {
    unsigned int v5 = *a1 + 2;
  }
  if (v5 != 1)
  {
    (*(void (**)(_DWORD *, uint64_t))(*(void *)(result - 8) + 8))(a1, result);
    int v8 = (uint64_t *)(((unint64_t)a1 + v3 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    return sub_259261F50(v9, v10);
  }
  return result;
}

_DWORD *sub_259308064(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (((v5 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v6 = 4;
  }
  else {
    unint64_t v6 = ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFFC) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    *a1 = *a2;
    char v9 = 1;
  }
  else
  {
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
    unint64_t v10 = (void *)(((unint64_t)a1 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (uint64_t *)(((unint64_t)a2 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    sub_259261DE0(*v11, v13);
    char v9 = 0;
    *unint64_t v10 = v12;
    v10[1] = v13;
  }
  *((unsigned char *)a1 + v6) = v9;
  return a1;
}

_DWORD *sub_259308198(_DWORD *a1, _DWORD *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
      unint64_t v7 = 4;
    }
    else {
      unint64_t v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0) {
      unsigned int v8 = *a1 + 2;
    }
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      sub_259261F50(*(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8), *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
    }
    unsigned int v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v10 >= 2) {
      unsigned int v10 = *a2 + 2;
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      char v12 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      unint64_t v13 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v14 = (uint64_t *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
      sub_259261DE0(*v14, v16);
      char v12 = 0;
      *unint64_t v13 = v15;
      v13[1] = v16;
    }
    *((unsigned char *)a1 + v7) = v12;
  }
  return a1;
}

_DWORD *sub_259308330(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (((v5 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v6 = 4;
  }
  else {
    unint64_t v6 = ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFFC) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    *a1 = *a2;
    char v9 = 1;
  }
  else
  {
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
    char v9 = 0;
    *(_OWORD *)(((unint64_t)a1 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  *((unsigned char *)a1 + v6) = v9;
  return a1;
}

_DWORD *sub_259308450(_DWORD *a1, _DWORD *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
      unint64_t v7 = 4;
    }
    else {
      unint64_t v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0) {
      unsigned int v8 = *a1 + 2;
    }
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      sub_259261F50(*(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8), *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
    }
    unsigned int v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v10 >= 2) {
      unsigned int v10 = *a2 + 2;
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      char v12 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      char v12 = 0;
      *(_OWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
    *((unsigned char *)a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_2593085DC(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v5 = ((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v5 = 4;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_20;
  }
  uint64_t v6 = v5 | 1;
  char v7 = 8 * (v5 | 1);
  if ((v5 | 1) <= 3)
  {
    unsigned int v8 = (a2 + ~(-1 << v7) - 254) >> v7;
    if (v8 > 0xFFFE)
    {
      int v9 = *(_DWORD *)&a1[v6];
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (v8 > 0xFE)
    {
      int v9 = *(unsigned __int16 *)&a1[v6];
      if (!*(_WORD *)&a1[v6]) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (!v8) {
      goto LABEL_20;
    }
  }
  int v9 = a1[v6];
  if (!a1[v6])
  {
LABEL_20:
    unsigned int v13 = a1[v5];
    if (v13 >= 2) {
      return (v13 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
LABEL_13:
  int v11 = (v9 - 1) << v7;
  if (v6 >= 4) {
    int v11 = 0;
  }
  if (v6 == 1) {
    int v12 = *a1;
  }
  else {
    int v12 = *(_DWORD *)a1;
  }
  return (v12 | v11) + 255;
}

void sub_2593086F8(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v7 = ((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v7 = 4;
  }
  size_t v8 = v7 | 1;
  if (a3 < 0xFF)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = (a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8);
    if (v12 > 0xFFFE)
    {
      int v9 = 4;
    }
    else if (v12 >= 0xFF)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 != 0;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (a2 <= 0xFE)
  {
    switch(v9)
    {
      case 1:
        a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_24;
      case 2:
        *(_WORD *)&a1[v8] = 0;
        goto LABEL_23;
      case 3:
        goto LABEL_31;
      case 4:
        *(_DWORD *)&a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_24;
      default:
LABEL_23:
        if (a2) {
LABEL_24:
        }
          a1[v7] = -(char)a2;
        break;
    }
    return;
  }
  unsigned int v10 = a2 - 255;
  if (v8 < 4)
  {
    int v11 = (v10 >> (8 * v8)) + 1;
    v10 &= ~(-1 << (8 * v8));
    bzero(a1, v8);
    if (v8 == 1)
    {
      *a1 = v10;
      goto LABEL_20;
    }
  }
  else
  {
    bzero(a1, v7 | 1);
    int v11 = 1;
  }
  *(_DWORD *)a1 = v10;
LABEL_20:
  switch(v9)
  {
    case 1:
      a1[v8] = v11;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v11;
      break;
    case 3:
LABEL_31:
      __break(1u);
      JUMPOUT(0x2593088CCLL);
    case 4:
      *(_DWORD *)&a1[v8] = v11;
      break;
    default:
      return;
  }
}

uint64_t sub_2593088F4(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v3 = ((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v3 = 4;
  }
  uint64_t result = *((unsigned __int8 *)a1 + v3);
  uint64_t v5 = v3 & 0xFFFFFFFC;
  if (result >= 2 && v5 != 0) {
    return (*a1 + 2);
  }
  return result;
}

void sub_25930897C(unsigned int *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v5 = ((*(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((*(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    size_t v6 = 4;
  }
  else {
    size_t v6 = v5;
  }
  if (a2 > 1)
  {
    if (v6) {
      char v7 = 2;
    }
    else {
      char v7 = a2;
    }
    if (v6) {
      unsigned int v8 = a2 - 2;
    }
    else {
      unsigned int v8 = 0;
    }
    *((unsigned char *)a1 + v6) = v7;
    bzero(a1, v6);
    *a1 = v8;
  }
  else
  {
    *((unsigned char *)a1 + v6) = a2;
  }
}

uint64_t type metadata accessor for XPCMessageCenter.XPCRequest.FetchNextCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for XPCMessageCenter.XPCRequest.StartRequestCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for XPCMessageCenter.XPCRequest.CodingKeys()
{
  return swift_getGenericMetadata();
}

unint64_t sub_259308A64()
{
  unint64_t result = qword_26A37FA88;
  if (!qword_26A37FA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37FA88);
  }
  return result;
}

uint64_t type metadata accessor for XPCMessageCenter.XPCResponse.EndErrorCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for XPCMessageCenter.XPCResponse.EndSuccessCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for XPCMessageCenter.XPCResponse.NextCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for XPCMessageCenter.XPCResponse.StartStreamCodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for XPCMessageCenter.XPCResponse.CodingKeys()
{
  return swift_getGenericMetadata();
}

unint64_t sub_259308B30()
{
  unint64_t result = qword_26A37FA98[0];
  if (!qword_26A37FA98[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26A37FA98);
  }
  return result;
}

uint64_t type metadata accessor for XPCMessageCenter.XPCErrorResponse.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t sub_259308BA8()
{
  return 0;
}

unsigned char *sub_259308BB0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259308C7CLL);
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

unsigned char *sub_259308CAC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259308D78);
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

uint64_t sub_259308DA0(unsigned int *a1, int a2)
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

unsigned char *sub_259308DF0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x259308E8CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_259308EB4()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308ED0()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308EEC()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308F08()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308F24()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308F40()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308F5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308F78()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308F94()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308FB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308FCC()
{
  return swift_getWitnessTable();
}

uint64_t sub_259308FE8()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309004()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309020()
{
  return swift_getWitnessTable();
}

uint64_t sub_25930903C()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309058()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309074()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309090()
{
  return swift_getWitnessTable();
}

uint64_t sub_2593090AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_2593090C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2593090E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309100()
{
  return swift_getWitnessTable();
}

uint64_t sub_25930911C()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309138()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309154()
{
  return swift_getWitnessTable();
}

uint64_t sub_259309170()
{
  return swift_getWitnessTable();
}

uint64_t sub_25930918C()
{
  return 4;
}

uint64_t sub_2593091C0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2593091D0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2593091E0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2593091F0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_259309200()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_259309210()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_259309220()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_259309230()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_259309240()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_259309250()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_259309260()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_259309270()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_259309280()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_259309290()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_2593092A0()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_2593092B0()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_2593092C0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2593092D0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2593092E0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_2593092F0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_259309300()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_259309310()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_259309320()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_259309330()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_259309340()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_259309350()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_259309360()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_259309370()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_259309380()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_259309390()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_2593093A0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2593093B0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2593093C0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2593093D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2593093E0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2593093F0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_259309400()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_259309410()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_259309420()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_259309430()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_259309440()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_259309450()
{
  return MEMORY[0x270F180D8]();
}

uint64_t sub_259309460()
{
  return MEMORY[0x270F180E8]();
}

uint64_t sub_259309470()
{
  return MEMORY[0x270F18100]();
}

uint64_t sub_259309480()
{
  return MEMORY[0x270F18108]();
}

uint64_t sub_259309490()
{
  return MEMORY[0x270F18138]();
}

uint64_t sub_2593094A0()
{
  return MEMORY[0x270F18140]();
}

uint64_t sub_2593094B0()
{
  return MEMORY[0x270F18148]();
}

uint64_t sub_2593094C0()
{
  return MEMORY[0x270F18150]();
}

uint64_t sub_2593094D0()
{
  return MEMORY[0x270F18158]();
}

uint64_t sub_2593094E0()
{
  return MEMORY[0x270F18160]();
}

uint64_t sub_2593094F0()
{
  return MEMORY[0x270F18168]();
}

uint64_t sub_259309500()
{
  return MEMORY[0x270F18170]();
}

uint64_t sub_259309510()
{
  return MEMORY[0x270F18178]();
}

uint64_t sub_259309520()
{
  return MEMORY[0x270F18180]();
}

uint64_t sub_259309530()
{
  return MEMORY[0x270F18188]();
}

uint64_t sub_259309540()
{
  return MEMORY[0x270F18190]();
}

uint64_t sub_259309550()
{
  return MEMORY[0x270F18288]();
}

uint64_t sub_259309560()
{
  return MEMORY[0x270F18298]();
}

uint64_t sub_259309570()
{
  return MEMORY[0x270F182B0]();
}

uint64_t sub_259309580()
{
  return MEMORY[0x270F182B8]();
}

uint64_t sub_259309590()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_2593095A0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_2593095B0()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_2593095C0()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_2593095D0()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_2593095E0()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_259309610()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_259309620()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_259309630()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_259309640()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_259309650()
{
  return MEMORY[0x270F44B58]();
}

uint64_t sub_259309660()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_259309670()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_259309680()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_259309690()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_2593096A0()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_2593096B0()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_2593096C0()
{
  return MEMORY[0x270F44C08]();
}

uint64_t sub_2593096D0()
{
  return MEMORY[0x270F44C10]();
}

uint64_t sub_2593096E0()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_2593096F0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_259309700()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_259309710()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_259309720()
{
  return MEMORY[0x270F44CB8]();
}

uint64_t sub_259309740()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_259309750()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_259309760()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_259309770()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_259309780()
{
  return MEMORY[0x270F44D70]();
}

uint64_t sub_259309790()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_2593097A0()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_2593097B0()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_2593097C0()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_2593097D0()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_2593097E0()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t sub_2593097F0()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_259309800()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_259309810()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_259309820()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_259309830()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_259309840()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_259309850()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_259309860()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_259309870()
{
  return MEMORY[0x270FA1978]();
}

uint64_t sub_259309880()
{
  return MEMORY[0x270FA1A28]();
}

uint64_t sub_259309890()
{
  return MEMORY[0x270FA1A80]();
}

uint64_t sub_2593098A0()
{
  return MEMORY[0x270FA1AC0]();
}

uint64_t sub_2593098B0()
{
  return MEMORY[0x270FA1AF0]();
}

uint64_t sub_2593098C0()
{
  return MEMORY[0x270FA1B30]();
}

uint64_t sub_2593098D0()
{
  return MEMORY[0x270FA1B48]();
}

uint64_t sub_2593098E0()
{
  return MEMORY[0x270FA1B90]();
}

uint64_t sub_2593098F0()
{
  return MEMORY[0x270FA1BB8]();
}

uint64_t sub_259309900()
{
  return MEMORY[0x270FA1BC8]();
}

uint64_t sub_259309910()
{
  return MEMORY[0x270FA1BE0]();
}

uint64_t sub_259309920()
{
  return MEMORY[0x270FA1BF0]();
}

uint64_t sub_259309930()
{
  return MEMORY[0x270FA1C08]();
}

uint64_t sub_259309940()
{
  return MEMORY[0x270FA1C28]();
}

uint64_t sub_259309950()
{
  return MEMORY[0x270FA1C38]();
}

uint64_t sub_259309960()
{
  return MEMORY[0x270FA1C50]();
}

uint64_t sub_259309970()
{
  return MEMORY[0x270FA1C60]();
}

uint64_t sub_259309980()
{
  return MEMORY[0x270FA1C88]();
}

uint64_t sub_259309990()
{
  return MEMORY[0x270FA1D68]();
}

uint64_t sub_2593099A0()
{
  return MEMORY[0x270FA1D78]();
}

uint64_t sub_2593099B0()
{
  return MEMORY[0x270FA1D98]();
}

uint64_t sub_2593099C0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2593099D0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2593099E0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_2593099F0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_259309A00()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_259309A10()
{
  return MEMORY[0x270EEAAA0]();
}

uint64_t sub_259309A20()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_259309A30()
{
  return MEMORY[0x270EEB078]();
}

uint64_t sub_259309A40()
{
  return MEMORY[0x270EEB088]();
}

uint64_t sub_259309A50()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_259309A60()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_259309A70()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_259309A80()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_259309A90()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_259309AA0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_259309AB0()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_259309AC0()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_259309AD0()
{
  return MEMORY[0x270F9D1B0]();
}

uint64_t sub_259309AE0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_259309AF0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_259309B00()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_259309B10()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_259309B20()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_259309B30()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_259309B40()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_259309B50()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_259309B60()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_259309B70()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_259309B80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_259309B90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_259309BA0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_259309BB0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_259309BC0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_259309BD0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_259309BE0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_259309BF0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_259309C00()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_259309C10()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_259309C20()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_259309C30()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_259309C40()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_259309C50()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_259309C60()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_259309C70()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_259309C80()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_259309C90()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_259309CA0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_259309CB0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_259309CC0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_259309CD0()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_259309CE0()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_259309CF0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_259309D00()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_259309D10()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_259309D20()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_259309D30()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_259309D40()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_259309D50()
{
  return MEMORY[0x270F9DA58]();
}

uint64_t sub_259309D60()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_259309D70()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_259309D80()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_259309D90()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_259309DA0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_259309DB0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_259309DC0()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_259309DD0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_259309DE0()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_259309DF0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_259309E00()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_259309E10()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_259309E20()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_259309E30()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_259309E40()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_259309E50()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_259309E60()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_259309E70()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_259309E80()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_259309E90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_259309EA0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_259309EB0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_259309EC0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_259309ED0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_259309F10()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_259309F20()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_259309F30()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_259309F40()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_259309F50()
{
  return MEMORY[0x270FA2008]();
}

uint64_t sub_259309F70()
{
  return MEMORY[0x270FA2070]();
}

uint64_t sub_259309F80()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_259309F90()
{
  return MEMORY[0x270FA2098]();
}

uint64_t sub_259309FB0()
{
  return MEMORY[0x270FA20B8]();
}

uint64_t sub_259309FC0()
{
  return MEMORY[0x270FA20C8]();
}

uint64_t sub_259309FD0()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_259309FE0()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_259309FF0()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_25930A000()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_25930A010()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_25930A020()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25930A030()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_25930A040()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_25930A050()
{
  return MEMORY[0x270F9DF68]();
}

uint64_t sub_25930A060()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25930A070()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_25930A080()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_25930A090()
{
  return MEMORY[0x270F9E050]();
}

uint64_t sub_25930A0F0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25930A100()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25930A110()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25930A120()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_25930A140()
{
  return MEMORY[0x270F9E138]();
}

uint64_t sub_25930A150()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_25930A160()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t sub_25930A170()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25930A180()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_25930A190()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25930A1A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25930A1B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25930A1C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25930A1D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25930A1E0()
{
  return MEMORY[0x270F53A88]();
}

uint64_t sub_25930A1F0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25930A200()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_25930A210()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_25930A220()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_25930A230()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_25930A240()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25930A250()
{
  return MEMORY[0x270F9E3E0]();
}

uint64_t sub_25930A260()
{
  return MEMORY[0x270F9E400]();
}

uint64_t sub_25930A270()
{
  return MEMORY[0x270F9E430]();
}

uint64_t sub_25930A280()
{
  return MEMORY[0x270F9E450]();
}

uint64_t sub_25930A290()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25930A2A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25930A2B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25930A2C0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25930A2D0()
{
  return MEMORY[0x270F9E610]();
}

uint64_t sub_25930A2E0()
{
  return MEMORY[0x270F9E628]();
}

uint64_t sub_25930A2F0()
{
  return MEMORY[0x270F9E668]();
}

uint64_t sub_25930A300()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25930A310()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_25930A320()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_25930A330()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25930A340()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25930A350()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25930A360()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25930A370()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25930A390()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25930A3A0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25930A3B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25930A3C0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_25930A3D0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25930A3E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25930A3F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25930A400()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25930A410()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25930A420()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25930A430()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25930A440()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25930A450()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25930A460()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_25930A470()
{
  return MEMORY[0x270F9EAE8]();
}

uint64_t sub_25930A480()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25930A490()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25930A4A0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25930A4B0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25930A4C0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25930A4D0()
{
  return MEMORY[0x270FA2168]();
}

uint64_t sub_25930A4E0()
{
  return MEMORY[0x270FA2178]();
}

uint64_t sub_25930A4F0()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_25930A500()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25930A510()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25930A520()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25930A530()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25930A540()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25930A550()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_25930A560()
{
  return MEMORY[0x270F9EE78]();
}

uint64_t sub_25930A570()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25930A580()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25930A590()
{
  return MEMORY[0x270F9F030]();
}

uint64_t sub_25930A5A0()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_25930A5B0()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_25930A5C0()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_25930A5D0()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_25930A5E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25930A5F0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25930A600()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25930A610()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25930A620()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25930A630()
{
  return MEMORY[0x270FA22B0]();
}

uint64_t sub_25930A640()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25930A660()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25930A670()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25930A680()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25930A690()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25930A6A0()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_25930A6B0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25930A6C0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25930A6D0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25930A6E0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25930A6F0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25930A700()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_25930A710()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25930A720()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25930A730()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25930A740()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_25930A750()
{
  return MEMORY[0x270FA2328]();
}

uint64_t sub_25930A760()
{
  return MEMORY[0x270FA2330]();
}

uint64_t sub_25930A770()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25930A780()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_25930A790()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_25930A7A0()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t sub_25930A7B0()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_25930A7C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25930A7E0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25930A800()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_25930A810()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_25930A820()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25930A830()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25930A840()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25930A860()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25930A870()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25930A880()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25930A890()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25930A8A0()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_25930A8B0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25930A8C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25930A8D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25930A8E0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25930A8F0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_25930A900()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25930A910()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25930A920()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_25930A930()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_25930A940()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25930A950()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25930A960()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_25930A970()
{
  return MEMORY[0x270F9FF78]();
}

uint64_t sub_25930A980()
{
  return MEMORY[0x270F9FFC0]();
}

uint64_t sub_25930A990()
{
  return MEMORY[0x270F9FFC8]();
}

uint64_t sub_25930A9A0()
{
  return MEMORY[0x270F9FFE0]();
}

uint64_t sub_25930A9B0()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_25930A9E0()
{
  return MEMORY[0x270FA0128]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x270F9B670](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x270FA2490]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x270EDB7E8](*(void *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x270EDB7F8]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return MEMORY[0x270EDBF30]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}