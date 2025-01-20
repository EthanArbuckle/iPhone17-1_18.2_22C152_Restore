BOOL ICCurrentAppearanceType()
{
  void *v0;
  uint64_t v1;

  v0 = [MEMORY[0x263F82DA0] _currentTraitCollection];
  v1 = [v0 userInterfaceStyle];

  return v1 == 2;
}

void sub_224D73084()
{
  qword_26809FA60 = 0x746E65636552;
  *(void *)algn_26809FA68 = 0xE600000000000000;
}

uint64_t static ThumbnailKey.recentObjectId.getter()
{
  if (qword_26809FA58 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26809FA60;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t ThumbnailKey.accountId.getter()
{
  return sub_224D73234(&OBJC_IVAR___ICThumbnailKey_accountId);
}

id sub_224D731BC(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_224D813C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t ThumbnailKey.objectId.getter()
{
  return sub_224D73234(&OBJC_IVAR___ICThumbnailKey_objectId);
}

uint64_t sub_224D73234(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ThumbnailKey.thumbnailId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  swift_bridgeObjectRetain();
  return v1;
}

id ThumbnailKey.__allocating_init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR___ICThumbnailKey_accountId];
  *(void *)v14 = a1;
  *((void *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR___ICThumbnailKey_objectId];
  *(void *)v15 = a3;
  *((void *)v15 + 1) = a4;
  v16 = &v13[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(void *)v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v14 = &v6[OBJC_IVAR___ICThumbnailKey_accountId];
  *(void *)v14 = a1;
  *((void *)v14 + 1) = a2;
  v15 = &v6[OBJC_IVAR___ICThumbnailKey_objectId];
  *(void *)v15 = a3;
  *((void *)v15 + 1) = a4;
  v16 = &v6[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(void *)v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v6;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.__allocating_init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return ThumbnailKey.init(accountId:objectId:)(a1, a2, a3, a4);
}

id ThumbnailKey.init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    v6 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v7 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
LABEL_6:
  v8 = (void *)sub_224D813C8();
  id v9 = objc_msgSend(v4, sel_initWithAccountId_objectId_thumbnailId_, v6, v7, v8);

  return v9;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v10 = v9;
  id v18 = objc_allocWithZone(v10);
  if (!a6)
  {
    v19 = 0;
    if (a8) {
      goto LABEL_3;
    }
LABEL_5:
    v20 = 0;
    goto LABEL_6;
  }
  v19 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  if (!a8) {
    goto LABEL_5;
  }
LABEL_3:
  v20 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v23) = 0;
  id v21 = objc_msgSend(v18, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v19, v20, a9, 0, 0, a2, a3, a4, v23);

  return v21;
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a6)
  {
    v16 = 0;
    if (a8) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = 0;
    goto LABEL_6;
  }
  v16 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  if (!a8) {
    goto LABEL_5;
  }
LABEL_3:
  v17 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v20) = 0;
  id v18 = objc_msgSend(v9, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v16, v17, a9, 0, 0, a2, a3, a4, v20);

  return v18;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8)
{
  id v17 = objc_allocWithZone(v8);
  return ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a1, a7, a8, a2, a3, a4, a5, a6);
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (!a5)
  {
    v14 = 0;
    if (a7) {
      goto LABEL_3;
    }
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  if (!a7) {
    goto LABEL_5;
  }
LABEL_3:
  v15 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
LABEL_6:
  objc_msgSend(a8, sel_displayScale);
  double v17 = v16;
  BOOL v18 = objc_msgSend(a8, sel_userInterfaceStyle) == (id)2;
  BOOL v19 = objc_msgSend(a8, sel_layoutDirection) == (id)1;
  id v20 = objc_msgSend(a8, sel_preferredContentSizeCategory);
  sub_224D813F8();

  id v21 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  BOOL v22 = objc_msgSend(a8, sel_legibilityWeight) == (id)1;
  BYTE3(v25) = 0;
  BYTE2(v25) = objc_msgSend(a8, sel_accessibilityContrast) == (id)1;
  LOWORD(v25) = v22;
  id v23 = objc_msgSend(v8, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v14, v15, v18, v19, v21, a2, a3, v17, v25);

  return v23;
}

uint64_t ThumbnailKey.description.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  uint64_t v5 = v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId;
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  uint64_t v7 = *(void *)(v5 + 8);
  if (!v2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v9 = (void *)MEMORY[0x263F8EE78];
    if (!v3) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v8 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  id v9 = sub_224D75ECC(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v11 = v9[2];
  unint64_t v10 = v9[3];
  if (v11 >= v10 >> 1) {
    id v9 = sub_224D75ECC((void *)(v10 > 1), v11 + 1, 1, v9);
  }
  v9[2] = v11 + 1;
  v12 = &v9[2 * v11];
  v12[4] = v8;
  v12[5] = v2;
  if (v3)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v9 = sub_224D75ECC(0, v9[2] + 1, 1, v9);
    }
    unint64_t v14 = v9[2];
    unint64_t v13 = v9[3];
    if (v14 >= v13 >> 1) {
      id v9 = sub_224D75ECC((void *)(v13 > 1), v14 + 1, 1, v9);
    }
    v9[2] = v14 + 1;
    v15 = &v9[2 * v14];
    v15[4] = v4;
    v15[5] = v3;
  }
LABEL_12:
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v9 = sub_224D75ECC(0, v9[2] + 1, 1, v9);
  }
  unint64_t v17 = v9[2];
  unint64_t v16 = v9[3];
  if (v17 >= v16 >> 1) {
    id v9 = sub_224D75ECC((void *)(v16 > 1), v17 + 1, 1, v9);
  }
  v9[2] = v17 + 1;
  BOOL v18 = &v9[2 * v17];
  v18[4] = v6;
  v18[5] = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAB0);
  sub_224D76020();
  uint64_t v19 = sub_224D813B8();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t ThumbnailKey.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAC0);
  uint64_t v4 = sub_224D81488();
  swift_unknownObjectRelease();
  if (v4 == v2)
  {
    char v8 = 1;
    return v8 & 1;
  }
  sub_224D760C4(a1, (uint64_t)v13);
  if (!v14)
  {
    sub_224D7612C((uint64_t)v13);
    goto LABEL_25;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    char v8 = 0;
    return v8 & 1;
  }
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  uint64_t v6 = *(void *)&v12[OBJC_IVAR___ICThumbnailKey_accountId + 8];
  if (v5)
  {
    if (!v6) {
      goto LABEL_24;
    }
    BOOL v7 = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_accountId]
      && v5 == v6;
    if (!v7 && (sub_224D81638() & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (v6)
  {
    goto LABEL_24;
  }
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  uint64_t v10 = *(void *)&v12[OBJC_IVAR___ICThumbnailKey_objectId + 8];
  if (v9)
  {
    if (v10
      && (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_objectId]
       && v9 == v10
       || (sub_224D81638() & 1) != 0))
    {
      goto LABEL_20;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v10) {
    goto LABEL_24;
  }
LABEL_20:
  if (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId]
    && *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId
                                                                                     + 8])
  {

    char v8 = 1;
  }
  else
  {
    char v8 = sub_224D81638();
  }
  return v8 & 1;
}

uint64_t ThumbnailKey.hash.getter()
{
  sub_224D81708();
  if (*(void *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    sub_224D816D8();
    swift_bridgeObjectRetain();
    sub_224D81418();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_224D816D8();
  }
  if (*(void *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
  {
    sub_224D816D8();
    swift_bridgeObjectRetain();
    sub_224D81418();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_224D816D8();
  }
  swift_bridgeObjectRetain();
  sub_224D81418();
  swift_bridgeObjectRelease();
  return sub_224D816E8();
}

id ThumbnailKey.copy(with:)@<X0>(void *a1@<X8>)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8);
  uint64_t v10 = (char *)objc_allocWithZone(ObjectType);
  unint64_t v11 = &v10[OBJC_IVAR___ICThumbnailKey_accountId];
  *(void *)unint64_t v11 = v5;
  *((void *)v11 + 1) = v4;
  v12 = &v10[OBJC_IVAR___ICThumbnailKey_objectId];
  *(void *)v12 = v7;
  *((void *)v12 + 1) = v6;
  unint64_t v13 = &v10[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(void *)unint64_t v13 = v9;
  *((void *)v13 + 1) = v8;
  v15.receiver = v10;
  v15.super_class = ObjectType;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id result = objc_msgSendSuper2(&v15, sel_init);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t sub_224D74614@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v34 = a1;
  uint64_t v3 = sub_224D812E8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)v32 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)v32 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  unint64_t v16 = (char *)v32 - v15;
  MEMORY[0x270FA5388](v14);
  BOOL v18 = (char *)v32 - v17;
  if (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    v32[1] = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId);
    uint64_t v19 = v3;
    id v20 = objc_msgSend(self, sel_sharedInstance);
    id v21 = (void *)sub_224D813C8();
    id v22 = objc_msgSend(v20, sel_applicationDocumentsURLForAccountIdentifier_, v21);
    uint64_t v33 = v2;
    id v23 = v22;

    sub_224D812D8();
    sub_224D813F8();
    sub_224D812B8();
    swift_bridgeObjectRelease();
    v24 = *(void (**)(char *, uint64_t))(v4 + 8);
    v24(v10, v19);
    sub_224D812B8();
    v24(v13, v19);
    sub_224D813F8();
    sub_224D812B8();
    swift_bridgeObjectRelease();
    v24(v16, v19);
    if (*(void *)(v33 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      uint64_t v25 = (void *)sub_224D813C8();
      id v26 = objc_msgSend(v25, sel_ic_sanitizedFilenameString);

      sub_224D813F8();
    }
    sub_224D812B8();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v24)(v18, v19);
  }
  else
  {
    id v27 = objc_msgSend(self, sel_applicationDocumentsURL);
    sub_224D812D8();

    sub_224D813F8();
    sub_224D812B8();
    swift_bridgeObjectRelease();
    v28 = *(void (**)(char *, uint64_t))(v4 + 8);
    v28(v16, v3);
    if (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      v29 = (void *)sub_224D813C8();
      id v30 = objc_msgSend(v29, sel_ic_sanitizedFilenameString);

      sub_224D813F8();
    }
    sub_224D812B8();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v28)(v7, v3);
  }
}

id sub_224D74A64(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = sub_224D812E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a1;
  sub_224D74BAC(a3, (uint64_t)v8);

  uint64_t v10 = (void *)sub_224D812A8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

uint64_t sub_224D74B64@<X0>(uint64_t a1@<X8>)
{
  return sub_224D74BAC(MEMORY[0x263F8F388], a1);
}

uint64_t sub_224D74B94@<X0>(uint64_t a1@<X8>)
{
  return sub_224D74BAC(MEMORY[0x263F8F380], a1);
}

uint64_t sub_224D74BAC@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  v18[1] = a2;
  v18[0] = sub_224D81348();
  uint64_t v3 = *(void *)(v18[0] - 8);
  MEMORY[0x270FA5388](v18[0]);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_224D812E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v18 - v11;
  sub_224D74614((uint64_t)v10);
  unint64_t v13 = (void *)sub_224D813C8();
  id v14 = objc_msgSend(v13, sel_ic_sanitizedFilenameString);

  sub_224D813F8();
  sub_224D812B8();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t v16 = v15(v10, v6);
  a1(v16);
  sub_224D81338();
  (*(void (**)(char *, void))(v3 + 8))(v5, v18[0]);
  sub_224D812C8();
  swift_bridgeObjectRelease();
  return v15(v12, v6);
}

id ThumbnailKey.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ThumbnailKey.init()()
{
}

uint64_t sub_224D74E88(char a1)
{
  return *(void *)&aAccountiobject[8 * a1];
}

BOOL sub_224D74EA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_224D74EBC()
{
  return sub_224D816F8();
}

uint64_t sub_224D74F04()
{
  return sub_224D816C8();
}

uint64_t sub_224D74F30()
{
  return sub_224D816F8();
}

uint64_t sub_224D74F74()
{
  return sub_224D74E88(*v0);
}

uint64_t sub_224D74F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_224D77CB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_224D74FA4()
{
  return 0;
}

void sub_224D74FB0(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_224D74FBC(uint64_t a1)
{
  unint64_t v2 = sub_224D7618C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_224D74FF8(uint64_t a1)
{
  unint64_t v2 = sub_224D7618C();

  return MEMORY[0x270FA00B8](a1, v2);
}

id ThumbnailKey.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ThumbnailKey.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAC8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_224D7618C();
  sub_224D81728();
  v8[15] = 0;
  sub_224D815D8();
  if (!v1)
  {
    v8[14] = 1;
    sub_224D815D8();
    v8[13] = 2;
    sub_224D815E8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

id ThumbnailKey.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ThumbnailKey.init(from:)(a1);
}

id ThumbnailKey.init(from:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAD8);
  uint64_t v4 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_224D7618C();
  uint64_t v7 = v1;
  sub_224D81718();
  if (v2)
  {
    id v20 = ObjectType;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v8 = v4;
    char v24 = 0;
    uint64_t v9 = v21;
    uint64_t v10 = sub_224D81598();
    uint64_t v12 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_accountId];
    uint64_t *v12 = v10;
    v12[1] = v13;
    char v24 = 1;
    uint64_t v14 = sub_224D81598();
    uint64_t v15 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_objectId];
    uint64_t *v15 = v14;
    v15[1] = v16;
    char v24 = 2;
    uint64_t v17 = sub_224D815A8();
    BOOL v18 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *BOOL v18 = v17;
    v18[1] = v19;

    v23.receiver = v7;
    v23.super_class = ObjectType;
    id v20 = objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v20;
}

id sub_224D7558C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = ThumbnailKey.init(from:)(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_224D755DC(void *a1)
{
  return ThumbnailKey.encode(to:)(a1);
}

id sub_224D75600()
{
  return *v0;
}

uint64_t sub_224D75608@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_224D75610(uint64_t a1)
{
  uint64_t v2 = sub_224D7650C(&qword_26809FB60, type metadata accessor for NotePreviewProviderErrors);

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_224D7567C(uint64_t a1)
{
  uint64_t v2 = sub_224D7650C(&qword_26809FB60, type metadata accessor for NotePreviewProviderErrors);

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_224D756EC(uint64_t a1)
{
  uint64_t v2 = sub_224D7650C(&qword_26809FB98, type metadata accessor for NotePreviewProviderErrors);

  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_224D75758(uint64_t a1, uint64_t a2)
{
  return sub_224D758C4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_224D75770(uint64_t a1, id *a2)
{
  uint64_t result = sub_224D813D8();
  *a2 = 0;
  return result;
}

uint64_t sub_224D757E8(uint64_t a1, id *a2)
{
  char v3 = sub_224D813E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_224D75868@<X0>(uint64_t *a1@<X8>)
{
  sub_224D813F8();
  uint64_t v2 = sub_224D813C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_224D758AC(uint64_t a1, uint64_t a2)
{
  return sub_224D758C4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_224D758C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_224D813F8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_224D75908()
{
  sub_224D813F8();
  sub_224D81418();

  return swift_bridgeObjectRelease();
}

uint64_t sub_224D7595C()
{
  sub_224D813F8();
  sub_224D816B8();
  sub_224D81418();
  uint64_t v0 = sub_224D816F8();
  swift_bridgeObjectRelease();
  return v0;
}

void *sub_224D759D0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_224D759E0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_224D759EC()
{
  return sub_224D813F8();
}

uint64_t sub_224D759FC(uint64_t a1)
{
  uint64_t v2 = sub_224D7650C(&qword_26809FB98, type metadata accessor for NotePreviewProviderErrors);

  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_224D75A68(uint64_t a1)
{
  uint64_t v2 = sub_224D7650C(&qword_26809FB98, type metadata accessor for NotePreviewProviderErrors);

  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_224D75AD4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_224D7650C(&qword_26809FB98, type metadata accessor for NotePreviewProviderErrors);
  id v5 = a1;

  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_224D75B64()
{
  id v1 = *v0;
  uint64_t v2 = sub_224D81478();

  return v2;
}

uint64_t sub_224D75B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_224D7650C(&qword_26809FB98, type metadata accessor for NotePreviewProviderErrors);

  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_224D75C18()
{
  return sub_224D816F8();
}

uint64_t sub_224D75C78()
{
  uint64_t v0 = sub_224D813F8();
  uint64_t v2 = v1;
  if (v0 == sub_224D813F8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_224D81638();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_224D75D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_224D7650C(&qword_26809FB98, type metadata accessor for NotePreviewProviderErrors);

  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

BOOL sub_224D75D88(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_224D75D9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_224D813C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_224D75DE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_224D813F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_224D75E10(uint64_t a1)
{
  uint64_t v2 = sub_224D7650C(&qword_26809FBE8, type metadata accessor for __NPNotePreviewKey);
  uint64_t v3 = sub_224D7650C(&qword_26809FBF0, type metadata accessor for __NPNotePreviewKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void *sub_224D75ECC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26809FBB0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_224D77BC4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
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

unint64_t sub_224D76020()
{
  unint64_t result = qword_26809FAB8;
  if (!qword_26809FAB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26809FAB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FAB8);
  }
  return result;
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

uint64_t sub_224D760C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_224D7612C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_224D7618C()
{
  unint64_t result = qword_26809FAD0;
  if (!qword_26809FAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FAD0);
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailKey()
{
  return self;
}

uint64_t method lookup function for ThumbnailKey(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ThumbnailKey);
}

uint64_t dispatch thunk of ThumbnailKey.__allocating_init(accountId:objectId:thumbnailId:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ThumbnailKey.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void type metadata accessor for NotePreviewProviderErrors(uint64_t a1)
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailKey.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ThumbnailKey.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x224D763D8);
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

uint64_t sub_224D76400(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_224D7640C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailKey.CodingKeys()
{
  return &type metadata for ThumbnailKey.CodingKeys;
}

unint64_t sub_224D76428()
{
  unint64_t result = qword_26809FB48;
  if (!qword_26809FB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FB48);
  }
  return result;
}

uint64_t sub_224D7647C()
{
  return sub_224D7650C(&qword_26809FB50, type metadata accessor for NotePreviewProviderErrors);
}

uint64_t sub_224D764C4()
{
  return sub_224D7650C(&qword_26809FB58, type metadata accessor for NotePreviewProviderErrors);
}

uint64_t sub_224D7650C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_224D76554()
{
  return sub_224D7650C(&qword_26809FB60, type metadata accessor for NotePreviewProviderErrors);
}

uint64_t sub_224D7659C()
{
  return sub_224D7650C(&qword_26809FB68, type metadata accessor for NotePreviewProviderErrors);
}

uint64_t sub_224D765E4()
{
  return sub_224D7650C(&qword_26809FB70, type metadata accessor for NotePreviewProviderErrors);
}

uint64_t sub_224D7662C()
{
  return sub_224D7650C(&qword_26809FB78, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_224D76688()
{
  return sub_224D7650C(&qword_26809FB80, type metadata accessor for Code);
}

unint64_t sub_224D766D4()
{
  unint64_t result = qword_26809FB88;
  if (!qword_26809FB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FB88);
  }
  return result;
}

uint64_t sub_224D76728()
{
  return sub_224D7650C(&qword_26809FB90, type metadata accessor for Code);
}

uint64_t sub_224D76770()
{
  return sub_224D7650C(&qword_26809FB98, type metadata accessor for NotePreviewProviderErrors);
}

unint64_t sub_224D767BC()
{
  unint64_t result = qword_26809FBA0;
  if (!qword_26809FBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FBA0);
  }
  return result;
}

unint64_t sub_224D76814()
{
  unint64_t result = qword_26809FBA8;
  if (!qword_26809FBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FBA8);
  }
  return result;
}

uint64_t sub_224D76868(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_224D76888(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_224D76888(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26809FBB0);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_224D81578();
  __break(1u);
  return result;
}

id sub_224D769F4(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a5 + 16);
  if (v5)
  {
    id v6 = result;
    int64_t v7 = (uint64_t *)(a5 + 40);
    uint64_t v8 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v12 = *(v7 - 1);
      uint64_t v13 = *v7;
      uint64_t v14 = HIBYTE(*v7) & 0xF;
      if ((*v7 & 0x2000000000000000) == 0) {
        uint64_t v14 = v12 & 0xFFFFFFFFFFFFLL;
      }
      if (v14)
      {
        swift_bridgeObjectRetain();
        uint64_t v27 = v8;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_224D76868(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v27;
        }
        unint64_t v10 = *(void *)(v8 + 16);
        unint64_t v9 = *(void *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          sub_224D76868(v9 > 1, v10 + 1, 1);
          uint64_t v8 = v27;
        }
        *(void *)(v8 + 16) = v10 + 1;
        uint64_t v11 = v8 + 16 * v10;
        *(void *)(v11 + 32) = v12;
        *(void *)(v11 + 40) = v13;
      }
      v7 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    uint64_t v27 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAB0);
    sub_224D76020();
    uint64_t v15 = sub_224D813B8();
    uint64_t v17 = v16;
    swift_release();
    BOOL v18 = (objc_class *)type metadata accessor for ThumbnailKey();
    uint64_t v19 = (char *)objc_allocWithZone(v18);
    id v20 = &v19[OBJC_IVAR___ICThumbnailKey_accountId];
    *(void *)id v20 = v6;
    *((void *)v20 + 1) = a2;
    uint64_t v21 = &v19[OBJC_IVAR___ICThumbnailKey_objectId];
    *(void *)uint64_t v21 = a3;
    *((void *)v21 + 1) = a4;
    id v22 = (uint64_t *)&v19[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *id v22 = v15;
    v22[1] = v17;
    v26.receiver = v19;
    v26.super_class = v18;
    return objc_msgSendSuper2(&v26, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_224D76BA0(uint64_t a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 0:
      unint64_t result = 0x656D686361747441;
      break;
    case 1:
      unint64_t result = 1702129486;
      break;
    case 2:
      unint64_t result = 0x6174744165746F4ELL;
      break;
    case 3:
    case 5:
      return result;
    case 4:
      unint64_t result = 0x7268437265706150;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0x6572507265706150;
      break;
    case 8:
      unint64_t result = 0x726174617641;
      break;
    case 10:
      unint64_t result = 0xD000000000000014;
      break;
    case 11:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      sub_224D81558();
      __break(1u);
      JUMPOUT(0x224D76D24);
  }
  return result;
}

void sub_224D76D54(double a1, double a2)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_224D81618();
  sub_224D81428();
  if ((~*(void *)&a2 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (a2 < 9.22337204e18)
  {
    sub_224D81618();
    sub_224D81428();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_224D76E70(double a1)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18)
  {
    sub_224D81618();
    sub_224D81428();
    swift_bridgeObjectRelease();
    sub_224D81428();
    return 64;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_224D76F28(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = (id)sub_224D813C8();
  }
  else {
    id v2 = (id)*MEMORY[0x263F83490];
  }
  int v3 = v2;
  uint64_t v4 = sub_224D813F8();
  uint64_t v6 = v5;
  if (v4 == sub_224D813F8() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v9 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_18:

    return 21336;
  }
  uint64_t v10 = sub_224D813F8();
  uint64_t v12 = v11;
  if (v10 == sub_224D813F8() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  char v15 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_21:

    return 83;
  }
  uint64_t v16 = sub_224D813F8();
  uint64_t v18 = v17;
  if (v16 == sub_224D813F8() && v18 == v19) {
    goto LABEL_16;
  }
  char v22 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_23;
  }
  uint64_t v23 = sub_224D813F8();
  uint64_t v25 = v24;
  if (v23 == sub_224D813F8() && v25 == v26)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
LABEL_23:

    return 77;
  }
  char v27 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27) {
    goto LABEL_23;
  }
  uint64_t v28 = sub_224D813F8();
  uint64_t v30 = v29;
  if (v28 == sub_224D813F8() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:

    return 76;
  }
  char v32 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32) {
    goto LABEL_31;
  }
  uint64_t v33 = sub_224D813F8();
  uint64_t v35 = v34;
  if (v33 == sub_224D813F8() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
LABEL_36:

    return 19544;
  }
  char v37 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v37) {
    goto LABEL_36;
  }
  uint64_t v38 = sub_224D813F8();
  uint64_t v40 = v39;
  if (v38 == sub_224D813F8() && v40 == v41) {
    goto LABEL_39;
  }
  char v42 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v42) {
    goto LABEL_41;
  }
  uint64_t v43 = sub_224D813F8();
  uint64_t v45 = v44;
  if (v43 == sub_224D813F8() && v45 == v46)
  {
LABEL_39:
    swift_bridgeObjectRelease_n();
LABEL_41:
    uint64_t v20 = 5003314;

    return v20;
  }
  char v47 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v47) {
    goto LABEL_41;
  }
  uint64_t v48 = sub_224D813F8();
  uint64_t v50 = v49;
  if (v48 == sub_224D813F8() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_49:

    return 19777;
  }
  char v52 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v52) {
    goto LABEL_49;
  }
  uint64_t v53 = sub_224D813F8();
  uint64_t v55 = v54;
  if (v53 == sub_224D813F8() && v55 == v56)
  {
    swift_bridgeObjectRelease_n();
LABEL_54:

    return 19521;
  }
  char v57 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v57) {
    goto LABEL_54;
  }
  uint64_t v58 = sub_224D813F8();
  uint64_t v60 = v59;
  if (v58 == sub_224D813F8() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
LABEL_59:

    return 5003329;
  }
  char v62 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v62) {
    goto LABEL_59;
  }
  uint64_t v63 = sub_224D813F8();
  uint64_t v65 = v64;
  if (v63 == sub_224D813F8() && v65 == v66)
  {
    swift_bridgeObjectRelease_n();
LABEL_64:
    uint64_t v20 = 1280848449;

    return v20;
  }
  char v67 = sub_224D81638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v67) {
    goto LABEL_64;
  }
  uint64_t v68 = sub_224D813F8();
  uint64_t v70 = v69;
  if (v68 == sub_224D813F8() && v70 == v71)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v72 = sub_224D81638();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v72 & 1) == 0) {
      return 0;
    }
  }
  return 1280848705;
}

id sub_224D775F4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, char a12, char a13, char a14)
{
  switch(a1)
  {
    case 0:
      uint64_t v25 = a4;
      uint64_t v24 = a2;
      id v60 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_26809FBB0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_224D81E40;
      *(void *)(inited + 32) = 0x656D686361747441;
      *(void *)(inited + 40) = 0xEA0000000000746ELL;
      sub_224D76D54(a9, a10);
      *(void *)(inited + 48) = v61;
      *(void *)(inited + 56) = v62;
      *(void *)(inited + 64) = sub_224D76E70(a11);
      *(void *)(inited + 72) = v63;
      goto LABEL_28;
    case 1:
    case 2:
    case 3:
      uint64_t v24 = a2;
      uint64_t v25 = a4;
      id v26 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_26809FBB0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_224D81E60;
      *(void *)(inited + 32) = sub_224D76BA0(a1);
      *(void *)(inited + 40) = v28;
      sub_224D76D54(a9, a10);
      *(void *)(inited + 48) = v29;
      *(void *)(inited + 56) = v30;
      if (!a6)
      {
        unint64_t v31 = 0xE500000000000000;
        uint64_t v32 = 0x746867694CLL;
        goto LABEL_21;
      }
      if (a6 == 1)
      {
        unint64_t v31 = 0xE400000000000000;
        uint64_t v32 = 1802658116;
LABEL_21:
        *(void *)(inited + 64) = v32;
        *(void *)(inited + 72) = v31;
        *(void *)(inited + 80) = sub_224D76E70(a11);
        *(void *)(inited + 88) = v49;
LABEL_28:
        char v57 = v24;
        uint64_t v58 = a3;
        uint64_t v59 = v25;
LABEL_29:
        uint64_t v64 = a5;
        goto LABEL_37;
      }
      goto LABEL_39;
    case 4:
    case 7:
    case 10:
    case 11:
      swift_getObjectType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26809FBB0);
      uint64_t v33 = swift_initStackObject();
      *(_OWORD *)(v33 + 16) = xmmword_224D81E50;
      *(void *)(v33 + 32) = sub_224D76BA0(a1);
      *(void *)(v33 + 40) = v34;
      if (a6)
      {
        if (a6 == 1)
        {
          unint64_t v35 = 0xE400000000000000;
          uint64_t v36 = 1802658116;
          goto LABEL_8;
        }
        while (1)
        {
LABEL_39:
          sub_224D81558();
          __break(1u);
        }
      }
      unint64_t v35 = 0xE500000000000000;
      uint64_t v36 = 0x746867694CLL;
LABEL_8:
      *(void *)(v33 + 48) = v36;
      *(void *)(v33 + 56) = v35;
      uint64_t v37 = sub_224D76F28(a7, a8);
      uint64_t v39 = v38;
      swift_bridgeObjectRelease();
      *(void *)(v33 + 64) = v37;
      *(void *)(v33 + 72) = v39;
      uint64_t v40 = 0x5472616C75676552;
      if (a12) {
        uint64_t v40 = 0x74786554646C6F42;
      }
      unint64_t v41 = 0xEB00000000747865;
      if (a12) {
        unint64_t v41 = 0xE800000000000000;
      }
      *(void *)(v33 + 80) = v40;
      *(void *)(v33 + 88) = v41;
      uint64_t v42 = 0x4372616C75676552;
      if (a13) {
        uint64_t v42 = 0x6F4372656B726144;
      }
      unint64_t v43 = 0xED000073726F6C6FLL;
      if (a13) {
        unint64_t v43 = 0xEC00000073726F6CLL;
      }
      *(void *)(v33 + 96) = v42;
      *(void *)(v33 + 104) = v43;
      id v44 = sub_224D769F4(a2, a3, a4, a5, v33);
LABEL_38:
      swift_deallocPartialClassInstance();
      return v44;
    case 5:
    case 6:
      id v45 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_26809FBB0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_224D81E40;
      *(void *)(inited + 32) = sub_224D76BA0(a1);
      *(void *)(inited + 40) = v46;
      if (a6)
      {
        if (a6 != 1) {
          goto LABEL_39;
        }
        unint64_t v47 = 0xE400000000000000;
        uint64_t v48 = 1802658116;
      }
      else
      {
        unint64_t v47 = 0xE500000000000000;
        uint64_t v48 = 0x746867694CLL;
      }
      *(void *)(inited + 48) = v48;
      *(void *)(inited + 56) = v47;
      uint64_t v65 = 0x4372616C75676552;
      if (a13) {
        uint64_t v65 = 0x6F4372656B726144;
      }
      unint64_t v66 = 0xED000073726F6C6FLL;
      if (a13) {
        unint64_t v66 = 0xEC00000073726F6CLL;
      }
      *(void *)(inited + 64) = v65;
      *(void *)(inited + 72) = v66;
      char v57 = 0;
      uint64_t v58 = 0;
      uint64_t v59 = 0;
      uint64_t v64 = 0;
LABEL_37:
      id v44 = sub_224D769F4(v57, v58, v59, v64, inited);
      goto LABEL_38;
    case 8:
      id v52 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      __swift_instantiateConcreteTypeFromMangledName(&qword_26809FBB0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_224D81E40;
      *(void *)(inited + 32) = 0x726174617641;
      *(void *)(inited + 40) = 0xE600000000000000;
      sub_224D76D54(a9, a10);
      *(void *)(inited + 48) = v53;
      *(void *)(inited + 56) = v54;
      uint64_t v55 = 0x726564726F426F4ELL;
      if (a14) {
        uint64_t v55 = 0x726564726F42;
      }
      unint64_t v56 = 0xE800000000000000;
      if (a14) {
        unint64_t v56 = 0xE600000000000000;
      }
      *(void *)(inited + 64) = v55;
      *(void *)(inited + 72) = v56;
      char v57 = a2;
      uint64_t v58 = a3;
      uint64_t v59 = a4;
      goto LABEL_29;
    default:
      goto LABEL_39;
  }
}

uint64_t sub_224D77BC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_224D81578();
  __break(1u);
  return result;
}

uint64_t sub_224D77CB8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x49746E756F636361 && a2 == 0xE900000000000064;
  if (v3 || (sub_224D81638() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64497463656A626FLL && a2 == 0xE800000000000000 || (sub_224D81638() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69616E626D756874 && a2 == 0xEB0000000064496CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_224D81638();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for __NPNotePreviewKey(uint64_t a1)
{
}

void type metadata accessor for Appearances(uint64_t a1)
{
}

void sub_224D77ED8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_224D77F20()
{
  return sub_224D7650C(&qword_26809FBD0, type metadata accessor for __NPNotePreviewKey);
}

uint64_t sub_224D77F68()
{
  return sub_224D7650C(&qword_26809FBD8, type metadata accessor for __NPNotePreviewKey);
}

uint64_t sub_224D77FB0()
{
  return sub_224D7650C(&qword_26809FBE0, type metadata accessor for __NPNotePreviewKey);
}

void **sub_224D78000(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
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
    uint64_t v8 = a3[5];
    char v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_224D81328();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (void **)((char *)v7 + v14);
    uint64_t v17 = (void **)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    *(void **)((char *)v7 + v15) = *(void **)((char *)a2 + v15);
    uint64_t v19 = a3[9];
    *(void **)((char *)v7 + a3[8]) = *(void **)((char *)a2 + a3[8]);
    uint64_t v20 = (uint64_t *)((char *)v7 + v19);
    uint64_t v21 = *(uint64_t *)((char *)a2 + v19);
    unint64_t v22 = *(unint64_t *)((char *)a2 + v19 + 8);
    swift_bridgeObjectRetain();
    sub_224D78158(v21, v22);
    uint64_t *v20 = v21;
    v20[1] = v22;
    uint64_t v23 = a3[10];
    uint64_t v24 = (uint64_t *)((char *)v7 + v23);
    uint64_t v25 = (uint64_t *)((char *)a2 + v23);
    uint64_t v26 = *v25;
    unint64_t v27 = v25[1];
    sub_224D78158(*v25, v27);
    *uint64_t v24 = v26;
    v24[1] = v27;
  }
  return v7;
}

uint64_t sub_224D78158(uint64_t a1, unint64_t a2)
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

uint64_t sub_224D781B0(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  uint64_t v5 = sub_224D81328();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  sub_224D78260(*(uint64_t *)((char *)a1 + a2[9]), *(unint64_t *)((char *)a1 + a2[9] + 8));
  char v6 = (uint64_t *)((char *)a1 + a2[10]);
  uint64_t v7 = *v6;
  unint64_t v8 = v6[1];

  return sub_224D78260(v7, v8);
}

uint64_t sub_224D78260(uint64_t a1, unint64_t a2)
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

void **sub_224D782B8(void **a1, void **a2, int *a3)
{
  char v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  unint64_t v8 = (char *)a1 + v7;
  char v9 = (char *)a2 + v7;
  uint64_t v10 = sub_224D81328();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (void **)((char *)a1 + v13);
  uint64_t v16 = (void **)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  *(void **)((char *)a1 + v14) = *(void **)((char *)a2 + v14);
  uint64_t v18 = a3[9];
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  uint64_t v19 = (uint64_t *)((char *)a1 + v18);
  uint64_t v20 = *(uint64_t *)((char *)a2 + v18);
  unint64_t v21 = *(unint64_t *)((char *)a2 + v18 + 8);
  swift_bridgeObjectRetain();
  sub_224D78158(v20, v21);
  uint64_t *v19 = v20;
  v19[1] = v21;
  uint64_t v22 = a3[10];
  uint64_t v23 = (uint64_t *)((char *)a1 + v22);
  uint64_t v24 = (uint64_t *)((char *)a2 + v22);
  uint64_t v25 = *v24;
  unint64_t v26 = v24[1];
  sub_224D78158(*v24, v26);
  *uint64_t v23 = v25;
  v23[1] = v26;
  return a1;
}

void **sub_224D783C4(void **a1, void **a2, int *a3)
{
  char v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_224D81328();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void **)((char *)a1 + v13);
  uint64_t v15 = (void **)((char *)a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  uint64_t v16 = a3[9];
  uint64_t v17 = (uint64_t *)((char *)a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = *v18;
  unint64_t v20 = v18[1];
  sub_224D78158(*v18, v20);
  uint64_t v21 = *v17;
  unint64_t v22 = v17[1];
  uint64_t *v17 = v19;
  v17[1] = v20;
  sub_224D78260(v21, v22);
  uint64_t v23 = a3[10];
  uint64_t v24 = (uint64_t *)((char *)a1 + v23);
  uint64_t v25 = (uint64_t *)((char *)a2 + v23);
  uint64_t v26 = *v25;
  unint64_t v27 = v25[1];
  sub_224D78158(*v25, v27);
  uint64_t v28 = *v24;
  unint64_t v29 = v24[1];
  *uint64_t v24 = v26;
  v24[1] = v27;
  sub_224D78260(v28, v29);
  return a1;
}

void *sub_224D784F0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_224D81328();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  return a1;
}

void **sub_224D785B0(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_224D81328();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void **)((char *)a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  void *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + v16) = *(void **)((char *)a2 + v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = *(uint64_t *)((char *)a1 + v17);
  unint64_t v19 = *(unint64_t *)((char *)a1 + v17 + 8);
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)((char *)a2 + v17);
  sub_224D78260(v18, v19);
  uint64_t v20 = a3[10];
  uint64_t v21 = *(uint64_t *)((char *)a1 + v20);
  unint64_t v22 = *(unint64_t *)((char *)a1 + v20 + 8);
  *(_OWORD *)((char *)a1 + v20) = *(_OWORD *)((char *)a2 + v20);
  sub_224D78260(v21, v22);
  return a1;
}

uint64_t sub_224D786A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_224D786B8);
}

uint64_t sub_224D786B8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_224D81328();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_224D78768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_224D7877C);
}

void *sub_224D7877C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_224D81328();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PersistedThumbnail()
{
  uint64_t result = qword_26809FBF8;
  if (!qword_26809FBF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_224D78870()
{
  uint64_t result = sub_224D81328();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_224D78934()
{
  unint64_t result = qword_26809FC08;
  if (!qword_26809FC08)
  {
    type metadata accessor for ThumbnailKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FC08);
  }
  return result;
}

uint64_t sub_224D7898C()
{
  sub_224D811E8();
  swift_allocObject();
  uint64_t result = sub_224D811D8();
  qword_2680A1080 = result;
  return result;
}

id sub_224D789D0@<X0>(void **a1@<X8>)
{
  id v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t sub_224D789DC@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_224D78158(a2, a3);
      uint64_t v10 = (char *)sub_224D811F8();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_224D81218();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_224D81208();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
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
        JUMPOUT(0x224D78C40);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_224D78260(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_224D811F8();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_224D81218();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_224D81208();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_224D78C50(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_224D78158(a1, a2);
      char v5 = sub_224D78E80((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_224D78260(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_224D78E80(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_224D78260(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_224D789DC((uint64_t)__s1, a3, a4, &v14);
      sub_224D78260(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_224D78E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_224D811F8();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_224D81218();
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
  sub_224D81208();
  sub_224D789DC(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_224D78F38(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x224D79074);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_224D78158(a3, a4);
              char v15 = sub_224D78C50(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
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
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_224D79094(uint64_t a1, uint64_t a2)
{
  sub_224D791BC();
  if ((sub_224D81468() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for PersistedThumbnail();
  if ((sub_224D81318() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = v4[6];
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (void *)(a2 + v5);
  uint64_t v9 = v8[1];
  if (v7)
  {
    if (!v9) {
      return 0;
    }
    BOOL v10 = *v6 == *v8 && v7 == v9;
    if (!v10 && (sub_224D81638() & 1) == 0) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  if (*(double *)(a1 + v4[7]) != *(double *)(a2 + v4[7])
    || *(void *)(a1 + v4[8]) != *(void *)(a2 + v4[8])
    || (sub_224D78F38(*(void *)(a1 + v4[9]), *(void *)(a1 + v4[9] + 8), *(void *)(a2 + v4[9]), *(void *)(a2 + v4[9] + 8)) & 1) == 0)
  {
    return 0;
  }
  uint64_t v11 = v4[10];
  uint64_t v12 = *(void *)(a1 + v11);
  unint64_t v13 = *(void *)(a1 + v11 + 8);
  uint64_t v14 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];

  return sub_224D78F38(v12, v13, v15, v16);
}

unint64_t sub_224D791BC()
{
  unint64_t result = qword_26809FC10;
  if (!qword_26809FC10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26809FC10);
  }
  return result;
}

uint64_t sub_224D791FC()
{
  uint64_t v0 = sub_224D81378();
  __swift_allocate_value_buffer(v0, qword_26809FC18);
  __swift_project_value_buffer(v0, (uint64_t)qword_26809FC18);
  type metadata accessor for PersistedThumbnailCache();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FC48);
  sub_224D81408();
  return sub_224D81368();
}

uint64_t sub_224D79294(char a1)
{
  return qword_224D827A8[a1];
}

uint64_t sub_224D792B4(void *a1)
{
  int v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FC90);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_224D7AC04();
  sub_224D81728();
  uint64_t v12 = *v3;
  HIBYTE(v11) = 0;
  type metadata accessor for ThumbnailKey();
  sub_224D7AD10(&qword_26809FC98, (void (*)(uint64_t))type metadata accessor for ThumbnailKey);
  sub_224D81608();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
    LOBYTE(v12) = 1;
    sub_224D81328();
    sub_224D7AD10(&qword_26809FCA0, MEMORY[0x263F07490]);
    sub_224D81608();
    LOBYTE(v12) = 2;
    sub_224D815D8();
    uint64_t v12 = *(uint64_t *)((char *)v3 + *(int *)(v9 + 28));
    HIBYTE(v11) = 3;
    sub_224D7AD58();
    sub_224D81608();
    LOBYTE(v12) = 4;
    sub_224D815F8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_224D79560@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_224D81328();
  uint64_t v24 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FC68);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = (uint64_t *)&v12[*(int *)(v10 + 24)];
  uint64_t *v13 = 0;
  v13[1] = 0;
  char v27 = a1;
  char v28 = v13;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_224D7AC04();
  __int16 v26 = v8;
  sub_224D81718();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = v24;
    type metadata accessor for ThumbnailKey();
    char v29 = 0;
    sub_224D7AD10(&qword_26809FC78, (void (*)(uint64_t))type metadata accessor for ThumbnailKey);
    uint64_t v15 = v25;
    sub_224D815C8();
    *(void *)uint64_t v12 = v30;
    LOBYTE(v30) = 1;
    sub_224D7AD10(&qword_26809FC80, MEMORY[0x263F07490]);
    sub_224D815C8();
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v12[v9[5]], v6, v4);
    LOBYTE(v30) = 2;
    unint64_t v16 = v26;
    uint64_t v17 = sub_224D81598();
    uint64_t v18 = v28;
    *char v28 = v17;
    v18[1] = v19;
    char v29 = 3;
    sub_224D7AC58();
    sub_224D815C8();
    *(void *)&v12[v9[7]] = v30;
    LOBYTE(v30) = 4;
    uint64_t v20 = sub_224D815B8();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v15);
    *(void *)&v12[v9[8]] = v20;
    sub_224D7ACAC((uint64_t)v12, v22);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
    return sub_224D7A3C4((uint64_t)v12);
  }
}

uint64_t sub_224D799F8()
{
  return sub_224D79294(*v0);
}

uint64_t sub_224D79A00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_224D7B048(a1, a2);
  *a3 = result;
  return result;
}

void sub_224D79A28(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_224D79A34(uint64_t a1)
{
  unint64_t v2 = sub_224D7AC04();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_224D79A70(uint64_t a1)
{
  unint64_t v2 = sub_224D7AC04();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_224D79AAC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_224D79560(a1, a2);
}

uint64_t sub_224D79AC4(void *a1)
{
  return sub_224D792B4(a1);
}

void sub_224D79ADC(void *a1@<X0>, char *a2@<X8>)
{
  v79 = a2;
  uint64_t v3 = sub_224D811B8();
  uint64_t v4 = *(NSObject **)(v3 - 8);
  uint64_t v82 = v3;
  os_log_t v83 = v4;
  MEMORY[0x270FA5388](v3);
  v81 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_224D81328();
  uint64_t v78 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (void **)((char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_224D812E8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v71 - v17;
  id v80 = a1;
  sub_224D74B64((uint64_t)&v71 - v17);
  uint64_t v19 = v84;
  uint64_t v20 = sub_224D812F8();
  v84 = v19;
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    uint64_t v22 = v84;
  }
  else
  {
    v75 = v16;
    unint64_t v76 = v21;
    uint64_t v77 = v20;
    uint64_t v73 = v6;
    v74 = v8;
    uint64_t v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    v23(v18, v12);
    uint64_t v24 = v12;
    if (qword_26809FA70 != -1) {
      swift_once();
    }
    sub_224D7AD10(&qword_26809FC40, (void (*)(uint64_t))type metadata accessor for PersistedThumbnailCache.ThumbnailDescription);
    uint64_t v25 = v11;
    __int16 v26 = (int *)v9;
    unint64_t v27 = v76;
    uint64_t v28 = v77;
    char v29 = v84;
    sub_224D811C8();
    uint64_t v22 = v29;
    if (!v29)
    {
      v84 = (void (*)(void, void))v23;
      uint64_t v72 = *(uint64_t *)((char *)v25 + v26[8]);
      uint64_t v30 = (uint64_t)v75;
      sub_224D74B94((uint64_t)v75);
      uint64_t v31 = sub_224D812F8();
      uint64_t v53 = v52;
      os_log_t v83 = v31;
      v84(v30, v24);
      uint64_t v54 = *v25;
      uint64_t v55 = (char *)v25 + v26[5];
      uint64_t v56 = v78;
      char v57 = v74;
      uint64_t v58 = (uint64_t)v25;
      uint64_t v59 = v73;
      (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v74, v55, v73);
      uint64_t v60 = v26[7];
      uint64_t v61 = v58 + v26[6];
      uint64_t v62 = *(void *)(v61 + 8);
      v84 = *(void (**)(void, void))v61;
      uint64_t v63 = *(void *)(v58 + v60);
      swift_bridgeObjectRetain();
      id v64 = v54;
      sub_224D7A3C4(v58);
      uint64_t v65 = v79;
      *(void *)v79 = v64;
      unint64_t v66 = (int *)type metadata accessor for PersistedThumbnail();
      (*(void (**)(char *, char *, uint64_t))(v56 + 32))(&v65[v66[5]], v57, v59);
      char v67 = &v65[v66[6]];
      *(void *)char v67 = v84;
      *((void *)v67 + 1) = v62;
      *(void *)&v65[v66[7]] = v63;
      *(void *)&v65[v66[8]] = v72;
      uint64_t v68 = (uint64_t *)&v65[v66[9]];
      unint64_t v69 = v76;
      *uint64_t v68 = v77;
      v68[1] = v69;
      uint64_t v70 = &v65[v66[10]];
      *(void *)uint64_t v70 = v83;
      *((void *)v70 + 1) = v53;
      (*(void (**)(char *, void, uint64_t, int *))(*((void *)v66 - 1) + 56))(v65, 0, 1, v66);
      return;
    }
    sub_224D78260(v28, v27);
  }
  id v32 = v22;
  uint64_t v33 = v81;
  sub_224D811A8();
  sub_224D7AD10(&qword_26809FC30, MEMORY[0x263F06038]);
  uint64_t v34 = v82;
  char v35 = sub_224D81228();

  ((void (*)(char *, uint64_t))v83[1].isa)(v33, v34);
  if (v35)
  {
    uint64_t v36 = type metadata accessor for PersistedThumbnail();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v79, 1, 1, v36);
  }
  else
  {
    if (qword_26809FA78 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_224D81378();
    __swift_project_value_buffer(v37, (uint64_t)qword_26809FC18);
    id v38 = v22;
    id v39 = v80;
    id v40 = v22;
    id v41 = v39;
    uint64_t v42 = sub_224D81358();
    os_log_type_t v43 = sub_224D81458();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      id v45 = (void *)swift_slowAlloc();
      v84 = (void (*)(void, void))swift_slowAlloc();
      uint64_t v85 = (uint64_t)v41;
      v86 = v84;
      *(_DWORD *)uint64_t v44 = 138412546;
      os_log_t v83 = v42;
      id v46 = v41;
      sub_224D81498();
      unint64_t v47 = v45;
      *id v45 = v41;

      *(_WORD *)(v44 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v48 = sub_224D81668();
      uint64_t v85 = sub_224D7EC1C(v48, v49, (uint64_t *)&v86);
      sub_224D81498();
      swift_bridgeObjectRelease();

      os_log_t v50 = v83;
      _os_log_impl(&dword_224D71000, v83, v43, "Cannot retrieve persisted thumbnail {key: %@, error: %s}", (uint8_t *)v44, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26809FC38);
      swift_arrayDestroy();
      MEMORY[0x22A622DA0](v47, -1, -1);
      uint64_t v51 = v84;
      swift_arrayDestroy();
      MEMORY[0x22A622DA0](v51, -1, -1);
      MEMORY[0x22A622DA0](v44, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
}

uint64_t sub_224D7A2E4()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PersistedThumbnailCache()
{
  return self;
}

uint64_t type metadata accessor for PersistedThumbnailCache.ThumbnailDescription()
{
  uint64_t result = qword_26809FC50;
  if (!qword_26809FC50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_224D7A3C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

void **sub_224D7A484(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
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
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_224D81328();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    unint64_t v16 = (void **)((char *)v7 + v14);
    uint64_t v17 = (void **)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    *(void **)((char *)v7 + v15) = *(void **)((char *)a2 + v15);
    *(void **)((char *)v7 + a3[8]) = *(void **)((char *)a2 + a3[8]);
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_224D7A5A0(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_224D81328();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void **sub_224D7A630(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_224D81328();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (void **)((char *)a1 + v13);
  unint64_t v16 = (void **)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  *(void **)((char *)a1 + v14) = *(void **)((char *)a2 + v14);
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  return a1;
}

void **sub_224D7A700(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_224D81328();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void **)((char *)a1 + v13);
  uint64_t v15 = (void **)((char *)a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  return a1;
}

void *sub_224D7A7DC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_224D81328();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void **sub_224D7A888(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_224D81328();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void **)((char *)a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  void *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  *(void **)((char *)a1 + v16) = *(void **)((char *)a2 + v16);
  return a1;
}

uint64_t sub_224D7A94C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_224D7A960);
}

uint64_t sub_224D7A960(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_224D81328();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_224D7AA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_224D7AA24);
}

void *sub_224D7AA24(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_224D81328();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_224D7AACC()
{
  uint64_t result = sub_224D81328();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_224D7AB80(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_224D7AD10(&qword_26809FC40, (void (*)(uint64_t))type metadata accessor for PersistedThumbnailCache.ThumbnailDescription);
  uint64_t result = sub_224D7AD10(&qword_26809FC60, (void (*)(uint64_t))type metadata accessor for PersistedThumbnailCache.ThumbnailDescription);
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_224D7AC04()
{
  unint64_t result = qword_26809FC70;
  if (!qword_26809FC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FC70);
  }
  return result;
}

unint64_t sub_224D7AC58()
{
  unint64_t result = qword_26809FC88;
  if (!qword_26809FC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FC88);
  }
  return result;
}

uint64_t sub_224D7ACAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PersistedThumbnailCache.ThumbnailDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_224D7AD10(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_224D7AD58()
{
  unint64_t result = qword_26809FCA8;
  if (!qword_26809FCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FCA8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PersistedThumbnailCache.ThumbnailDescription.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PersistedThumbnailCache.ThumbnailDescription.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x224D7AF08);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PersistedThumbnailCache.ThumbnailDescription.CodingKeys()
{
  return &type metadata for PersistedThumbnailCache.ThumbnailDescription.CodingKeys;
}

unint64_t sub_224D7AF44()
{
  unint64_t result = qword_26809FCB0;
  if (!qword_26809FCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FCB0);
  }
  return result;
}

unint64_t sub_224D7AF9C()
{
  unint64_t result = qword_26809FCB8;
  if (!qword_26809FCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FCB8);
  }
  return result;
}

unint64_t sub_224D7AFF4()
{
  unint64_t result = qword_26809FCC0;
  if (!qword_26809FCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FCC0);
  }
  return result;
}

uint64_t sub_224D7B048(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v3 || (sub_224D81638() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 || (sub_224D81638() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_224D81638() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C616373 && a2 == 0xE500000000000000 || (sub_224D81638() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E61726165707061 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_224D81638();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_224D7B240()
{
  uint64_t v0 = sub_224D81378();
  __swift_allocate_value_buffer(v0, qword_26809FCC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26809FCC8);
  type metadata accessor for NotePreviewProvider();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD30);
  sub_224D81408();
  return sub_224D81368();
}

id sub_224D7B2D8()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NotePreviewProvider()), sel_init);
  qword_26AD558D0 = (uint64_t)result;
  return result;
}

id NotePreviewProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id static NotePreviewProvider.shared.getter()
{
  if (qword_26AD558D8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AD558D0;

  return v0;
}

void sub_224D7B3F4()
{
  sub_224D813F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD20);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_224D82800;
  *(void *)(inited + 32) = sub_224D813F8();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD00000000000001BLL;
  *(void *)(inited + 56) = 0x8000000224D82F10;
  sub_224D7FE0C(inited);
  id v2 = objc_allocWithZone(MEMORY[0x263F087E8]);
  BOOL v3 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  unsigned int v4 = (void *)sub_224D81388();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithDomain_code_userInfo_, v3, 1, v4);

  qword_26809FCE0 = (uint64_t)v5;
}

void sub_224D7B530(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  MEMORY[0x270FA5388](v5 - 8);
  BOOL v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v10) = 0;
  id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ThumbnailKey()), sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 4, 0, 0, a1, 0, 0, 0.0, 0.0, 1.0, v10);
  sub_224D79ADC(v8, v7);
  if (v2)
  {
LABEL_6:

    return;
  }
  uint64_t v9 = type metadata accessor for PersistedThumbnail();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9) == 1)
  {
    sub_224D7F8F0((uint64_t)v7, &qword_26809FCF0);
    if (qword_26809FA88 != -1) {
      swift_once();
    }
    (id)qword_26809FCE0;
    swift_willThrow();
    goto LABEL_6;
  }

  sub_224D7FCE8((uint64_t)v7, a2);
}

void sub_224D7B6D4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PersistedThumbnail();
  uint64_t v19 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26809FA58 != -1) {
    swift_once();
  }
  id v10 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  LODWORD(v17) = 0;
  id v12 = objc_msgSend(v10, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 4, 0, v11, a1, 0, 0, 0.0, 0.0, 1.0, v17);

  sub_224D79ADC(v12, v6);
  if (v2) {
    goto LABEL_10;
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v6, 1, v7) == 1)
  {
    sub_224D7F8F0((uint64_t)v6, &qword_26809FCF0);
    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_224D81378();
    __swift_project_value_buffer(v13, (uint64_t)qword_26809FCC8);
    uint64_t v14 = sub_224D81358();
    os_log_type_t v15 = sub_224D81448();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_224D71000, v14, v15, "Cannot retrieve recent chrome thumbnail — falling back to default chrome thumbnail", v16, 2u);
      MEMORY[0x22A622DA0](v16, -1, -1);
    }

    sub_224D7B530(a1, v20);
LABEL_10:

    return;
  }

  sub_224D7FCE8((uint64_t)v6, (uint64_t)v9);
  sub_224D7FCE8((uint64_t)v9, v20);
}

void sub_224D7B9E8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = a6;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for PersistedThumbnail();
  uint64_t v31 = *(void *)(v14 - 8);
  id v32 = (void *)v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v29 = a1;
  uint64_t v18 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3;
  uint64_t v19 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  LODWORD(v28) = 0;
  id v20 = objc_msgSend(v17, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 4, v18, v19, a5, 0, 0, 0.0, 0.0, 1.0, v28);

  unint64_t v21 = v20;
  uint64_t v22 = v34;
  sub_224D79ADC(v20, v13);
  if (!v22)
  {
    uint64_t v34 = a5;
    if ((*(unsigned int (**)(char *, uint64_t, void *))(v31 + 48))(v13, 1, v32) != 1)
    {

      sub_224D7FCE8((uint64_t)v13, (uint64_t)v16);
      sub_224D7FCE8((uint64_t)v16, v33);
      return;
    }
    sub_224D7F8F0((uint64_t)v13, &qword_26809FCF0);
    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_224D81378();
    __swift_project_value_buffer(v23, (uint64_t)qword_26809FCC8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_224D81358();
    os_log_type_t v25 = sub_224D81448();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v36 = v27;
      *(_DWORD *)uint64_t v26 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_224D7EC1C(v29, a2, &v36);
      id v32 = v21;
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_224D7EC1C(v30, a4, &v36);
      unint64_t v21 = v32;
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_224D71000, v24, v25, "Cannot retrieve chrome thumbnail — falling back to default chrome thumbnail {accountId: %s, noteId: %s}", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A622DA0](v27, -1, -1);
      MEMORY[0x22A622DA0](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_224D7B530(v34, v33);
  }
}

void sub_224D7BE0C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v10) = 0;
  id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ThumbnailKey()), sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 7, 0, 0, a1, 0, 0, 0.0, 0.0, 1.0, v10);
  sub_224D79ADC(v8, v7);
  if (v2)
  {
LABEL_6:

    return;
  }
  uint64_t v9 = type metadata accessor for PersistedThumbnail();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9) == 1)
  {
    sub_224D7F8F0((uint64_t)v7, &qword_26809FCF0);
    if (qword_26809FA88 != -1) {
      swift_once();
    }
    (id)qword_26809FCE0;
    swift_willThrow();
    goto LABEL_6;
  }

  sub_224D7FCE8((uint64_t)v7, a2);
}

void sub_224D7BFB0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PersistedThumbnail();
  uint64_t v19 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26809FA58 != -1) {
    swift_once();
  }
  id v10 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  LODWORD(v17) = 0;
  id v12 = objc_msgSend(v10, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 7, 0, v11, a1, 0, 0, 0.0, 0.0, 1.0, v17);

  sub_224D79ADC(v12, v6);
  if (v2) {
    goto LABEL_10;
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v6, 1, v7) == 1)
  {
    sub_224D7F8F0((uint64_t)v6, &qword_26809FCF0);
    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_224D81378();
    __swift_project_value_buffer(v13, (uint64_t)qword_26809FCC8);
    uint64_t v14 = sub_224D81358();
    os_log_type_t v15 = sub_224D81448();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_224D71000, v14, v15, "Cannot retrieve recent preview thumbnail — falling back to default preview thumbnail", v16, 2u);
      MEMORY[0x22A622DA0](v16, -1, -1);
    }

    sub_224D7BE0C(a1, v20);
LABEL_10:

    return;
  }

  sub_224D7FCE8((uint64_t)v6, (uint64_t)v9);
  sub_224D7FCE8((uint64_t)v9, v20);
}

void sub_224D7C2C4(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v33 = a6;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for PersistedThumbnail();
  uint64_t v31 = *(void *)(v14 - 8);
  id v32 = (void *)v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v29 = a1;
  uint64_t v18 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3;
  uint64_t v19 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  LODWORD(v28) = 0;
  id v20 = objc_msgSend(v17, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, 7, v18, v19, a5, 0, 0, 0.0, 0.0, 1.0, v28);

  unint64_t v21 = v20;
  uint64_t v22 = v34;
  sub_224D79ADC(v20, v13);
  if (!v22)
  {
    uint64_t v34 = a5;
    if ((*(unsigned int (**)(char *, uint64_t, void *))(v31 + 48))(v13, 1, v32) != 1)
    {

      sub_224D7FCE8((uint64_t)v13, (uint64_t)v16);
      sub_224D7FCE8((uint64_t)v16, v33);
      return;
    }
    sub_224D7F8F0((uint64_t)v13, &qword_26809FCF0);
    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_224D81378();
    __swift_project_value_buffer(v23, (uint64_t)qword_26809FCC8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_224D81358();
    os_log_type_t v25 = sub_224D81448();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v36 = v27;
      *(_DWORD *)uint64_t v26 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_224D7EC1C(v29, a2, &v36);
      id v32 = v21;
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_224D7EC1C(v30, a4, &v36);
      unint64_t v21 = v32;
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_224D71000, v24, v25, "Cannot retrieve preview thumbnail — falling back to default preview thumbnail {accountId: %s, noteId: %s}", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A622DA0](v27, -1, -1);
      MEMORY[0x22A622DA0](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_224D7BE0C(v34, v33);
  }
}

void NotePreviewProvider.defaultPreview()(void *a1@<X8>)
{
}

void NotePreviewProvider.recentPreview()(void *a1@<X8>)
{
}

void sub_224D7C778(void (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X1>, const char *a3@<X2>, void *a4@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v34 = a4;
  uint64_t v6 = type metadata accessor for PersistedThumbnail();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v32 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v32 - v17;
  a1(0);
  if (v4)
  {
    id v38 = v4;
    id v21 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF8);
    type metadata accessor for NotePreviewProviderErrors(0);
    if (swift_dynamicCast())
    {

      swift_willThrow();
      id v22 = v38;
    }
    else
    {

      if (qword_26809FA80 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_224D81378();
      __swift_project_value_buffer(v23, (uint64_t)qword_26809FCC8);
      id v24 = v4;
      id v25 = v4;
      uint64_t v26 = sub_224D81358();
      os_log_type_t v27 = sub_224D81458();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = (void *)swift_slowAlloc();
        id v38 = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        swift_getErrorValue();
        uint64_t v30 = sub_224D81668();
        uint64_t v37 = sub_224D7EC1C(v30, v31, (uint64_t *)&v38);
        sub_224D81498();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_224D71000, v26, v27, v36, v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A622DA0](v29, -1, -1);
        MEMORY[0x22A622DA0](v28, -1, -1);
      }
      else
      {
      }
      sub_224D7F6E8();
      swift_willThrow();
      id v22 = v4;
    }
  }
  else
  {
    uint64_t v33 = v9;
    uint64_t v19 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    v19(v18, 0, 1, v6);
    a1(1);
    v19(v16, 0, 1, v6);
    uint64_t v32 = v7 + 56;
    id v20 = v35;
    v35(0);
    v20(1);
    v19(v13, 0, 1, v6);
    sub_224D80074((uint64_t)v18, (uint64_t)v16, v33, (uint64_t)v13, v34);
  }
}

void NotePreviewProvider.preview(accountId:noteId:prefersDefaultFallback:)(uint64_t a1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char a4@<W4>, void *a5@<X8>)
{
  uint64_t v90 = a2;
  uint64_t v6 = v5;
  uint64_t v92 = a1;
  v88 = a5;
  uint64_t v95 = sub_224D81378();
  uint64_t v93 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  v94 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PersistedThumbnail();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v86 = v10;
  uint64_t v87 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v85 = (uint64_t *)((char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v82 - v14);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  id v20 = (char *)&v82 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v82 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v82 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v82 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v33 = (char *)&v82 - v32;
  unint64_t v89 = v30;
  if (!v30) {
    goto LABEL_12;
  }
  uint64_t v34 = HIBYTE(v30) & 0xF;
  if ((v30 & 0x2000000000000000) == 0) {
    uint64_t v34 = v92 & 0xFFFFFFFFFFFFLL;
  }
  if (!v34 || !a3) {
    goto LABEL_12;
  }
  uint64_t v35 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v35 = v90 & 0xFFFFFFFFFFFFLL;
  }
  if (!v35)
  {
LABEL_12:
    unint64_t v80 = a3;
    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v45 = v95;
    __swift_project_value_buffer(v95, (uint64_t)qword_26809FCC8);
    uint64_t v48 = sub_224D81358();
    os_log_type_t v49 = sub_224D81448();
    BOOL v50 = os_log_type_enabled(v48, v49);
    unint64_t v47 = v94;
    if (v50)
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 67109120;
      LODWORD(v96[0]) = a4 & 1;
      sub_224D81498();
      _os_log_impl(&dword_224D71000, v48, v49, "Cannot retrieve identifier — falling back to recent or default preview {prefersDefaultFallback: %{BOOL}d}", v51, 8u);
      MEMORY[0x22A622DA0](v51, -1, -1);
    }

    uint64_t v46 = v93;
    if (a4)
    {
      uint64_t v52 = v91;
      NotePreviewProvider.defaultPreview()(v96);
      uint64_t v53 = v52;
      if (v52)
      {
LABEL_18:
        uint64_t v44 = v53;
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v56 = v91;
      NotePreviewProvider.recentPreview()(v96);
      uint64_t v53 = v56;
      if (v56) {
        goto LABEL_18;
      }
    }
    long long v57 = v96[1];
    uint64_t v58 = v97;
    uint64_t v59 = v98;
    uint64_t v60 = v88;
    *(_OWORD *)v88 = v96[0];
    *((_OWORD *)v60 + 1) = v57;
    v60[4] = v58;
    v60[5] = v59;
    return;
  }
  uint64_t v83 = v31;
  unint64_t v84 = a3;
  id v36 = objc_msgSend(self, sel_currentDevice);
  id v37 = objc_msgSend(v36, sel_userInterfaceIdiom);

  if (v37)
  {
    id v38 = v91;
    uint64_t v39 = v92;
    unint64_t v41 = v89;
    uint64_t v40 = v90;
    unint64_t v42 = v84;
    uint64_t v43 = v6;
    sub_224D7B9E8(v92, v89, v90, v84, 0, (uint64_t)v23);
    uint64_t v44 = v38;
    uint64_t v45 = v95;
    if (!v38)
    {
      v79 = *(void (**)(void, void, void, void))(v87 + 56);
      v87 += 56;
      v91 = v79;
      v79(v23, 0, 1, v86);
      sub_224D7B9E8(v39, v41, v40, v42, 1, (uint64_t)v20);
      uint64_t v82 = v43;
      v91(v20, 0, 1, v86);
      sub_224D7C2C4(v39, v89, v40, v42, 0, (uint64_t)v85);
      uint64_t v81 = v83;
      sub_224D7C2C4(v92, v89, v90, v42, 1, v83);
      v91(v81, 0, 1, v86);
      sub_224D80074((uint64_t)v23, (uint64_t)v20, v85, v81, v88);
      return;
    }
    uint64_t v46 = v93;
    unint64_t v47 = v94;
    unint64_t v80 = v42;
  }
  else
  {
    uint64_t v75 = v86;
    unint64_t v76 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56);
    v76(v33, 1, 1, v86);
    v76(v29, 1, 1, v75);
    uint64_t v77 = v91;
    unint64_t v78 = v89;
    sub_224D7C2C4(v92, v89, v90, v84, 0, (uint64_t)v15);
    uint64_t v44 = v77;
    if (!v77)
    {
      sub_224D7C2C4(v92, v78, v90, v84, 1, (uint64_t)v26);
      v76(v26, 0, 1, v86);
      sub_224D80074((uint64_t)v33, (uint64_t)v29, v15, (uint64_t)v26, v88);
      return;
    }
    sub_224D7F8F0((uint64_t)v29, &qword_26809FCF0);
    sub_224D7F8F0((uint64_t)v33, &qword_26809FCF0);
    unint64_t v47 = v94;
    uint64_t v45 = v95;
    uint64_t v46 = v93;
    unint64_t v80 = v84;
  }
LABEL_19:
  *(void *)&v96[0] = v44;
  id v54 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF8);
  type metadata accessor for NotePreviewProviderErrors(0);
  if (swift_dynamicCast())
  {

    swift_willThrow();
    uint64_t v55 = *(void **)&v96[0];
  }
  else
  {

    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v61 = __swift_project_value_buffer(v45, (uint64_t)qword_26809FCC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v47, v61, v45);
    id v62 = v44;
    swift_bridgeObjectRetain();
    unint64_t v63 = v89;
    swift_bridgeObjectRetain();
    id v64 = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_224D81358();
    os_log_type_t v66 = sub_224D81458();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = swift_slowAlloc();
      v91 = (void (*)(void, void, void, void))swift_slowAlloc();
      *(void *)&v96[0] = v91;
      *(_DWORD *)uint64_t v67 = 136315650;
      if (v63) {
        uint64_t v68 = v92;
      }
      else {
        uint64_t v68 = 9732322;
      }
      if (v63) {
        unint64_t v69 = v63;
      }
      else {
        unint64_t v69 = 0xA300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v99 = sub_224D7EC1C(v68, v69, (uint64_t *)v96);
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v67 + 12) = 2080;
      if (v80) {
        uint64_t v70 = v90;
      }
      else {
        uint64_t v70 = 9732322;
      }
      if (v80) {
        unint64_t v71 = v80;
      }
      else {
        unint64_t v71 = 0xA300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v99 = sub_224D7EC1C(v70, v71, (uint64_t *)v96);
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v67 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v72 = sub_224D81668();
      uint64_t v99 = sub_224D7EC1C(v72, v73, (uint64_t *)v96);
      sub_224D81498();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_224D71000, v65, v66, "Cannot retrieve note preview {accountId: %s, noteId: %s, error: %s}", (uint8_t *)v67, 0x20u);
      v74 = v91;
      swift_arrayDestroy();
      MEMORY[0x22A622DA0](v74, -1, -1);
      MEMORY[0x22A622DA0](v67, -1, -1);

      (*(void (**)(char *, uint64_t))(v93 + 8))(v94, v95);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
    }
    sub_224D7F6E8();
    swift_willThrow();
    uint64_t v55 = v44;
  }
}

void NotePreviewProvider.preview(for:)(void *a1@<X0>, void *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_userInfo);
  if (!v4)
  {
    long long v52 = 0u;
    long long v53 = 0u;
LABEL_14:
    sub_224D7F8F0((uint64_t)&v52, &qword_26809FAC0);
    id v11 = 0;
    id v12 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_224D81398();

  *(void *)&long long v52 = sub_224D813F8();
  *((void *)&v52 + 1) = v7;
  sub_224D814E8();
  if (*(void *)(v6 + 16) && (unint64_t v8 = sub_224D7F2EC((uint64_t)v50), (v9 & 1) != 0))
  {
    sub_224D7FA08(*(void *)(v6 + 56) + 32 * v8, (uint64_t)&v52);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  sub_224D7F9B4((uint64_t)v50);
  swift_bridgeObjectRelease();
  if (!*((void *)&v53 + 1)) {
    goto LABEL_14;
  }
  int v10 = swift_dynamicCast();
  if (v10) {
    id v11 = v50[0];
  }
  else {
    id v11 = 0;
  }
  if (v10) {
    id v12 = v50[1];
  }
  else {
    id v12 = 0;
  }
LABEL_15:
  id v13 = objc_msgSend(a1, sel_userInfo);
  if (!v13)
  {
    long long v52 = 0u;
    long long v53 = 0u;
LABEL_25:
    sub_224D7F8F0((uint64_t)&v52, &qword_26809FAC0);
    id v19 = 0;
    goto LABEL_26;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_224D81398();

  *(void *)&long long v52 = sub_224D813F8();
  *((void *)&v52 + 1) = v16;
  sub_224D814E8();
  if (*(void *)(v15 + 16) && (unint64_t v17 = sub_224D7F2EC((uint64_t)v50), (v18 & 1) != 0))
  {
    sub_224D7FA08(*(void *)(v15 + 56) + 32 * v17, (uint64_t)&v52);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  sub_224D7F9B4((uint64_t)v50);
  swift_bridgeObjectRelease();
  if (!*((void *)&v53 + 1)) {
    goto LABEL_25;
  }
  if (swift_dynamicCast()) {
    id v19 = v50[0];
  }
  else {
    id v19 = 0;
  }
LABEL_26:
  id v20 = objc_msgSend(a1, sel_userInfo);
  if (!v20)
  {
    long long v52 = 0u;
    long long v53 = 0u;
LABEL_35:
    sub_224D7F8F0((uint64_t)&v52, &qword_26809FAC0);
    goto LABEL_36;
  }
  uint64_t v21 = v20;
  uint64_t v22 = sub_224D81398();

  *(void *)&long long v52 = sub_224D813F8();
  *((void *)&v52 + 1) = v23;
  sub_224D814E8();
  if (*(void *)(v22 + 16) && (unint64_t v24 = sub_224D7F2EC((uint64_t)v50), (v25 & 1) != 0))
  {
    sub_224D7FA08(*(void *)(v22 + 56) + 32 * v24, (uint64_t)&v52);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  sub_224D7F9B4((uint64_t)v50);
  swift_bridgeObjectRelease();
  if (!*((void *)&v53 + 1)) {
    goto LABEL_35;
  }
  if (swift_dynamicCast())
  {
    char v26 = (char)v50[0];
    goto LABEL_37;
  }
LABEL_36:
  char v26 = 0;
LABEL_37:
  uint64_t v27 = self;
  uint64_t v28 = (void *)sub_224D813C8();
  id v29 = objc_msgSend(v27, sel_objectForKey_, v28);

  if (v29)
  {
    sub_224D814B8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  sub_224D7F94C((uint64_t)&v52, (uint64_t)v50);
  if (v50[3])
  {
    if (swift_dynamicCast())
    {
      if (v26)
      {
        char v30 = 1;
        goto LABEL_49;
      }
      char v30 = v51;
      goto LABEL_48;
    }
  }
  else
  {
    sub_224D7F8F0((uint64_t)v50, &qword_26809FAC0);
  }
  char v30 = 1;
  if ((v26 & 1) == 0) {
LABEL_48:
  }
    v30 ^= 1u;
LABEL_49:
  uint64_t v31 = v48;
  NotePreviewProvider.preview(accountId:noteId:prefersDefaultFallback:)((uint64_t)v19, (uint64_t)v11, (unint64_t)v12, v30, a2);
  uint64_t v32 = v48;
  if (v48)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50[0] = v48;
    id v33 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF8);
    type metadata accessor for NotePreviewProviderErrors(0);
    if (swift_dynamicCast())
    {

      swift_willThrow();
    }
    else
    {

      if (qword_26809FA80 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_224D81378();
      __swift_project_value_buffer(v34, (uint64_t)qword_26809FCC8);
      id v35 = v48;
      id v36 = a1;
      id v37 = v48;
      id v38 = v36;
      uint64_t v39 = sub_224D81358();
      os_log_type_t v40 = sub_224D81458();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = swift_slowAlloc();
        log = v39;
        unint64_t v42 = (void *)swift_slowAlloc();
        os_log_type_t v49 = (void *)swift_slowAlloc();
        v50[0] = v49;
        *(_DWORD *)uint64_t v41 = 138412546;
        *(void *)&long long v52 = v38;
        id v43 = v38;
        sub_224D81498();
        uint64_t v44 = v42;
        *unint64_t v42 = v38;

        *(_WORD *)(v41 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v45 = sub_224D81668();
        *(void *)&long long v52 = sub_224D7EC1C(v45, v46, (uint64_t *)v50);
        sub_224D81498();
        swift_bridgeObjectRelease();

        uint64_t v39 = log;
        _os_log_impl(&dword_224D71000, log, v40, "Cannot retrieve note preview {userActivity: %@, error: %s}", (uint8_t *)v41, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26809FC38);
        swift_arrayDestroy();
        MEMORY[0x22A622DA0](v44, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x22A622DA0](v49, -1, -1);
        MEMORY[0x22A622DA0](v41, -1, -1);
      }
      else
      {
      }
      sub_224D7F6E8();
      swift_willThrow();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

unint64_t NotePreviewProvider.__previewDictionary(for:)(void *a1)
{
  NotePreviewProvider.preview(for:)(a1, v6);
  if (!v2)
  {
    BOOL v3 = (void *)v6[4];
    id v4 = (void *)v6[5];
    unint64_t v1 = sub_224D80940();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v1;
}

id NotePreviewProvider.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR___NPNotePreviewProviderInternal_cache;
  BOOL v3 = self;
  id v4 = v0;
  id v5 = objc_msgSend(v3, sel_defaultManager);
  type metadata accessor for PersistedThumbnailCache();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)&v0[v2] = v6;

  v8.receiver = v4;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

id NotePreviewProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_224D7E180()
{
  type metadata accessor for WidgetNotePreviewProvider();
  uint64_t v0 = swift_allocObject();
  id v1 = objc_msgSend(self, sel_defaultManager);
  type metadata accessor for PersistedThumbnailCache();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v1;
  *(void *)(v0 + 16) = result;
  qword_26809FCE8 = v0;
  return result;
}

uint64_t static WidgetNotePreviewProvider.shared.getter()
{
  if (qword_26809FA90 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_224D7E254()
{
  return 1;
}

uint64_t sub_224D7E25C()
{
  return sub_224D816F8();
}

uint64_t sub_224D7E2A0()
{
  return sub_224D816C8();
}

uint64_t sub_224D7E2C8()
{
  return sub_224D816F8();
}

void sub_224D7E314(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v47 = a7;
  uint64_t v48 = a5;
  uint64_t v44 = sub_224D812E8();
  uint64_t v46 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  id v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_allocWithZone((Class)type metadata accessor for ThumbnailKey());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v45 = a1;
  char v18 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3;
  id v20 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  LODWORD(v41) = 0;
  id v21 = objc_msgSend(v17, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a6, v18, v20, v48, 0, 0, 0.0, 0.0, 1.0, v41);

  uint64_t v22 = (uint64_t)v50;
  sub_224D79ADC(v21, v16);
  if (!v22)
  {
    uint64_t v24 = v46;
    uint64_t v23 = v47;
    uint64_t v49 = v19;
    BOOL v50 = v13;
    uint64_t v25 = type metadata accessor for PersistedThumbnail();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v16, 1, v25) != 1)
    {

      sub_224D7FCE8((uint64_t)v16, v23);
      return;
    }
    sub_224D7F8F0((uint64_t)v16, &qword_26809FCF0);
    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_224D81378();
    __swift_project_value_buffer(v26, (uint64_t)qword_26809FCC8);
    swift_bridgeObjectRetain_n();
    unint64_t v27 = a2;
    swift_bridgeObjectRetain_n();
    id v28 = v21;
    id v29 = sub_224D81358();
    os_log_type_t v30 = sub_224D81458();
    LODWORD(v48) = v30;
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v32 = v45;
    if (v31)
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v52 = v47;
      *(_DWORD *)uint64_t v33 = 136315650;
      os_log_t v43 = v29;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_224D7EC1C(v32, v27, &v52);
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_224D7EC1C(v49, a4, &v52);
      sub_224D81498();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 22) = 2080;
      uint64_t v49 = v33 + 24;
      uint64_t v34 = (uint64_t)v50;
      sub_224D74B94((uint64_t)v50);
      sub_224D7FCA0(&qword_26809FD18, MEMORY[0x263F06EA8]);
      uint64_t v35 = v44;
      uint64_t v36 = sub_224D81618();
      unint64_t v38 = v37;
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v34, v35);
      uint64_t v51 = sub_224D7EC1C(v36, v38, &v52);
      sub_224D81498();

      swift_bridgeObjectRelease();
      os_log_t v39 = v43;
      _os_log_impl(&dword_224D71000, v43, (os_log_type_t)v48, "Cannot retrieve widget thumbnail {accountId: %s, noteId: %s, url: %s}", (uint8_t *)v33, 0x20u);
      uint64_t v40 = v47;
      swift_arrayDestroy();
      MEMORY[0x22A622DA0](v40, -1, -1);
      MEMORY[0x22A622DA0](v33, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_224D7FA64();
    swift_allocError();
    swift_willThrow();
  }
}

uint64_t WidgetNotePreviewProvider.preview(accountId:noteId:type:)@<X0>(unint64_t a1@<X1>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  uint64_t v38 = a4;
  uint64_t v39 = a2;
  uint64_t v8 = type metadata accessor for PersistedThumbnail();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (uint64_t *)((char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  char v18 = (char *)&v32 - v17;
  MEMORY[0x270FA5388](v16);
  id v21 = (char *)&v32 - v19;
  if (!a1) {
    goto LABEL_12;
  }
  uint64_t v22 = HIBYTE(a1) & 0xF;
  if ((a1 & 0x2000000000000000) == 0) {
    uint64_t v22 = v20 & 0xFFFFFFFFFFFFLL;
  }
  if (!v22 || !a3) {
    goto LABEL_12;
  }
  uint64_t v23 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v23 = v39 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    uint64_t v34 = a5;
    uint64_t v36 = v11;
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v25 = v20;
    v24((char *)&v32 - v19, 1, 1, v8);
    uint64_t v33 = v24;
    v24(v18, 1, 1, v8);
    uint64_t v26 = v37;
    uint64_t v35 = v25;
    sub_224D7E314(v25, a1, v39, a3, 0, v38, (uint64_t)v36);
    if (v26)
    {
      sub_224D7F8F0((uint64_t)v18, &qword_26809FCF0);
      return sub_224D7F8F0((uint64_t)v21, &qword_26809FCF0);
    }
    else
    {
      sub_224D7E314(v35, a1, v39, a3, 1, v38, (uint64_t)v15);
      v33(v15, 0, 1, v8);
      return sub_224D80074((uint64_t)v21, (uint64_t)v18, v36, (uint64_t)v15, v34);
    }
  }
  else
  {
LABEL_12:
    if (qword_26809FA80 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_224D81378();
    __swift_project_value_buffer(v27, (uint64_t)qword_26809FCC8);
    id v28 = sub_224D81358();
    os_log_type_t v29 = sub_224D81458();
    if (os_log_type_enabled(v28, v29))
    {
      os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v30 = 0;
      _os_log_impl(&dword_224D71000, v28, v29, "Cannot retrieve identifier", v30, 2u);
      MEMORY[0x22A622DA0](v30, -1, -1);
    }

    sub_224D7FA64();
    swift_allocError();
    return swift_willThrow();
  }
}

uint64_t WidgetNotePreviewProvider.deinit()
{
  swift_release();
  return v0;
}

uint64_t WidgetNotePreviewProvider.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_224D7EC1C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_224D7ECF0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_224D7FA08((uint64_t)v12, *a3);
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
      sub_224D7FA08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_224D7ECF0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_224D814A8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_224D7EEAC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_224D81538();
  if (!v8)
  {
    sub_224D81548();
    __break(1u);
LABEL_17:
    uint64_t result = sub_224D81578();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_224D7EEAC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_224D7EF44(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_224D7F124(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_224D7F124(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_224D7EF44(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_224D7F0BC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_224D814F8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_224D81548();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_224D81438();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_224D81578();
    __break(1u);
LABEL_14:
    uint64_t result = sub_224D81548();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_224D7F0BC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_224D7F124(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD28);
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
  uint64_t v13 = a4 + 32;
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
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_224D81578();
  __break(1u);
  return result;
}

unint64_t sub_224D7F274(uint64_t a1, uint64_t a2)
{
  sub_224D816B8();
  sub_224D81418();
  uint64_t v4 = sub_224D816F8();

  return sub_224D7F3C4(a1, a2, v4);
}

unint64_t sub_224D7F2EC(uint64_t a1)
{
  uint64_t v2 = sub_224D814C8();

  return sub_224D7F4A8(a1, v2);
}

unint64_t sub_224D7F330(uint64_t a1)
{
  sub_224D813F8();
  sub_224D816B8();
  sub_224D81418();
  uint64_t v2 = sub_224D816F8();
  swift_bridgeObjectRelease();

  return sub_224D7F570(a1, v2);
}

unint64_t sub_224D7F3C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_224D81638() & 1) == 0)
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
      while (!v14 && (sub_224D81638() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_224D7F4A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_224D7FD4C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A622660](v9, a1);
      sub_224D7F9B4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_224D7F570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_224D813F8();
    uint64_t v8 = v7;
    if (v6 == sub_224D813F8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_224D81638();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_224D813F8();
          uint64_t v15 = v14;
          if (v13 == sub_224D813F8() && v15 == v16) {
            break;
          }
          char v18 = sub_224D81638();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_224D7F6E8()
{
  sub_224D813F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD20);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_224D82810;
  *(void *)(inited + 32) = sub_224D813F8();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000019;
  *(void *)(inited + 56) = 0x8000000224D83110;
  *(void *)(inited + 80) = sub_224D813F8();
  *(void *)(inited + 88) = v2;
  swift_getErrorValue();
  *(void *)(inited + 120) = v9;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 96));
  (*(void (**)(uint64_t *))(*(void *)(v9 - 8) + 16))(boxed_opaque_existential_0);
  sub_224D7FE0C(inited);
  id v4 = objc_allocWithZone(MEMORY[0x263F087E8]);
  unint64_t v5 = (void *)sub_224D813C8();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_224D81388();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, 0, v6);

  return v7;
}

uint64_t sub_224D7F894(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PersistedThumbnail();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_224D7F8F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_224D7F94C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FAC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_224D7F9B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_224D7FA08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_224D7FA64()
{
  unint64_t result = qword_26809FD08;
  if (!qword_26809FD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FD08);
  }
  return result;
}

uint64_t type metadata accessor for NotePreviewProvider()
{
  return self;
}

uint64_t type metadata accessor for WidgetNotePreviewProvider()
{
  return self;
}

uint64_t method lookup function for WidgetNotePreviewProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WidgetNotePreviewProvider);
}

uint64_t getEnumTagSinglePayload for WidgetNotePreviewProvider.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WidgetNotePreviewProvider.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x224D7FC08);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_224D7FC30()
{
  return 0;
}

ValueMetadata *type metadata accessor for WidgetNotePreviewProvider.Error()
{
  return &type metadata for WidgetNotePreviewProvider.Error;
}

unint64_t sub_224D7FC4C()
{
  unint64_t result = qword_26809FD10;
  if (!qword_26809FD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FD10);
  }
  return result;
}

uint64_t sub_224D7FCA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_224D7FCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PersistedThumbnail();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_224D7FD4C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_224D7FE0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD70);
  uint64_t v2 = sub_224D81568();
  int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_224D81144(v6, (uint64_t)&v15, &qword_26809FD78);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_224D7F274(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_224D810D4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_224D7FF44(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD60);
  uint64_t v2 = sub_224D81568();
  int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_224D81144(v6, (uint64_t)&v13, &qword_26809FD68);
    uint64_t v7 = v13;
    unint64_t result = sub_224D7F330(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_224D810D4(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_224D80074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v90 = a5;
  uint64_t v102 = a4;
  uint64_t v103 = a2;
  uint64_t v93 = sub_224D81518();
  uint64_t v99 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  v96 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v92 = (uint64_t)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v91 = (uint64_t)&v87 - v12;
  MEMORY[0x270FA5388](v11);
  long long v14 = (char *)&v87 - v13;
  id v105 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  id v100 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  uint64_t v15 = (uint64_t *)(*a3 + OBJC_IVAR___ICThumbnailKey_objectId);
  uint64_t v16 = v15[1];
  uint64_t v89 = *v15;
  long long v17 = (int *)type metadata accessor for PersistedThumbnail();
  char v18 = (void *)((char *)a3 + v17[6]);
  uint64_t v19 = v18[1];
  uint64_t v88 = *v18;
  uint64_t v98 = a1;
  sub_224D81144(a1, (uint64_t)v14, &qword_26809FCF0);
  uint64_t v20 = *((void *)v17 - 1);
  id v21 = *(unsigned int (**)(uint64_t, uint64_t, int *))(v20 + 48);
  uint64_t v94 = v20 + 48;
  uint64_t v95 = v21;
  unsigned int v22 = v21((uint64_t)v14, 1, v17);
  v101 = a3;
  uint64_t v97 = v16;
  uint64_t v104 = v19;
  if (v22 == 1)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_224D810E4((uint64_t)v14);
LABEL_7:
    uint64_t v32 = v99;
    uint64_t v33 = v96;
    goto LABEL_14;
  }
  uint64_t v23 = (uint64_t *)&v14[v17[10]];
  uint64_t v24 = *v23;
  unint64_t v25 = v23[1];
  double v26 = *(double *)&v14[v17[7]];
  id v27 = objc_allocWithZone(MEMORY[0x263F827E8]);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_224D78158(v24, v25);
  id v28 = (void *)sub_224D81308();
  id v29 = objc_msgSend(v27, sel_initWithData_scale_, v28, v26);
  sub_224D78260(v24, v25);

  sub_224D7F894((uint64_t)v14);
  if (!v29)
  {
    a3 = v101;
    goto LABEL_7;
  }
  id v30 = v29;

  uint64_t v31 = v91;
  sub_224D81144(v103, v91, &qword_26809FCF0);
  if (v95(v31, 1, v17) == 1)
  {

    sub_224D810E4(v31);
    id v105 = v30;
    a3 = v101;
    uint64_t v32 = v99;
  }
  else
  {
    uint64_t v34 = (uint64_t *)(v31 + v17[10]);
    uint64_t v35 = *v34;
    unint64_t v36 = v34[1];
    double v37 = *(double *)(v31 + v17[7]);
    id v38 = objc_allocWithZone(MEMORY[0x263F827E8]);
    sub_224D78158(v35, v36);
    uint64_t v39 = (void *)sub_224D81308();
    id v40 = objc_msgSend(v38, sel_initWithData_scale_, v39, v37);
    sub_224D78260(v35, v36);

    sub_224D7F894(v31);
    uint64_t v32 = v99;
    if (v40)
    {
      id v41 = objc_msgSend(v30, sel_imageAsset);
      if (v41)
      {
        uint64_t v42 = v41;
        id v43 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 2);
        objc_msgSend(v42, sel_registerImage_withTraitCollection_, v40, v43);
      }
    }

    id v105 = v30;
    a3 = v101;
  }
  uint64_t v33 = v96;
LABEL_14:
  uint64_t v44 = (void *)((char *)a3 + v17[10]);
  uint64_t v45 = *v44;
  unint64_t v46 = v44[1];
  double v47 = *(double *)((char *)a3 + v17[7]);
  id v48 = objc_allocWithZone(MEMORY[0x263F827E8]);
  sub_224D78158(v45, v46);
  uint64_t v49 = (void *)sub_224D81308();
  id v50 = objc_msgSend(v48, sel_initWithData_scale_, v49, v47);
  sub_224D78260(v45, v46);

  if (!v50)
  {
    id v54 = v33;
    uint64_t v55 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_224D81508();
    uint64_t v56 = sub_224D81528();
    swift_allocError();
    uint64_t v58 = v57;
    uint64_t v59 = v93;
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 16))(v57, v54, v93);
    uint64_t v60 = v58;
    uint64_t v61 = v59;
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v56 - 8) + 104))(v60, *MEMORY[0x263F8DCB8], v56);
    swift_willThrow();
    id v51 = v100;
    uint64_t v62 = v98;
    uint64_t v52 = v102;
LABEL_24:
    sub_224D810E4(v52);
    sub_224D810E4(v103);
    sub_224D810E4(v62);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v61);
    sub_224D7F894((uint64_t)v101);

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  id v51 = v50;

  uint64_t v52 = v102;
  uint64_t v53 = v92;
  sub_224D81144(v102, v92, &qword_26809FCF0);
  if (v95(v53, 1, v17) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_224D810E4(v53);
LABEL_23:
    sub_224D81508();
    uint64_t v79 = sub_224D81528();
    swift_allocError();
    uint64_t v81 = v80;
    uint64_t v82 = *(void (**)(uint64_t, char *, uint64_t))(v32 + 16);
    uint64_t v83 = v80;
    unint64_t v84 = v33;
    id v54 = v33;
    uint64_t v55 = v32;
    uint64_t v85 = v93;
    v82(v83, v84, v93);
    uint64_t v86 = v81;
    uint64_t v61 = v85;
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v79 - 8) + 104))(v86, *MEMORY[0x263F8DCB8], v79);
    swift_willThrow();

    uint64_t v62 = v98;
    goto LABEL_24;
  }
  unint64_t v63 = (uint64_t *)(v53 + v17[10]);
  uint64_t v64 = *v63;
  unint64_t v65 = v63[1];
  double v66 = *(double *)(v53 + v17[7]);
  id v67 = objc_allocWithZone(MEMORY[0x263F827E8]);
  sub_224D78158(v64, v65);
  uint64_t v68 = (void *)sub_224D81308();
  id v69 = objc_msgSend(v67, sel_initWithData_scale_, v68, v66);
  sub_224D78260(v64, v65);

  sub_224D7F894(v53);
  if (!v69)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v52 = v102;
    goto LABEL_23;
  }
  id v70 = objc_msgSend(v51, sel_imageAsset);
  if (v70)
  {
    unint64_t v71 = v70;
    id v72 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, 2);
    objc_msgSend(v71, sel_registerImage_withTraitCollection_, v69, v72);
  }
  sub_224D810E4(v102);
  sub_224D810E4(v103);
  sub_224D810E4(v98);
  sub_224D7F894((uint64_t)a3);
  uint64_t v73 = v104;
  swift_bridgeObjectRetain();
  id v74 = v105;
  id v75 = v105;
  swift_bridgeObjectRelease();
  unint64_t v76 = v90;
  uint64_t v77 = v97;
  *uint64_t v90 = v89;
  v76[1] = v77;
  v76[2] = v88;
  v76[3] = v73;
  v76[4] = v74;
  v76[5] = v51;

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_224D80940()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v6 = (void *)v0[4];
  uint64_t v5 = (void *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_224D81E60;
  *(void *)(inited + 32) = @"NPNotePreviewKeyID";
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD40);
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 72) = @"NPNotePreviewKeyTitle";
  *(void *)(inited + 80) = v4;
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 104) = v8;
  *(void *)(inited + 112) = @"NPNotePreviewKeyChrome";
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FD58);
  *(void *)(inited + 120) = v6;
  *(void *)(inited + 144) = v9;
  *(void *)(inited + 152) = @"NPNotePreviewKeyPreview";
  *(void *)(inited + 184) = sub_224D81098(0, &qword_26809FD48);
  *(void *)(inited + 160) = v5;
  id v10 = v6;
  uint64_t v11 = @"NPNotePreviewKeyPreview";
  id v12 = v5;
  uint64_t v13 = @"NPNotePreviewKeyID";
  swift_bridgeObjectRetain();
  long long v14 = @"NPNotePreviewKeyTitle";
  swift_bridgeObjectRetain();
  uint64_t v15 = @"NPNotePreviewKeyChrome";
  return sub_224D7FF44(inited);
}

uint64_t NotePreview.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NotePreview.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*NotePreview.id.modify())()
{
  return nullsub_1;
}

uint64_t NotePreview.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NotePreview.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*NotePreview.title.modify())()
{
  return nullsub_1;
}

void *NotePreview.chrome.getter()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void NotePreview.chrome.setter(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
}

uint64_t (*NotePreview.chrome.modify())()
{
  return nullsub_1;
}

id NotePreview.preview.getter()
{
  return *(id *)(v0 + 40);
}

void NotePreview.preview.setter(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
}

uint64_t (*NotePreview.preview.modify())()
{
  return nullsub_1;
}

uint64_t sub_224D80C48@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t _s15NotesPreviewKit04NoteB0V2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  id v10 = (void *)a2[4];
  if (v3)
  {
    if (!v7 || (*a1 != *a2 || v3 != v7) && (sub_224D81638() & 1) == 0) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  if (v5)
  {
    if (!v9 || (v4 != v8 || v5 != v9) && (sub_224D81638() & 1) == 0) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  if (v6)
  {
    if (v10)
    {
      sub_224D81098(0, &qword_26809FD48);
      id v11 = v10;
      id v12 = v6;
      char v13 = sub_224D81468();

      if (v13) {
        goto LABEL_18;
      }
    }
  }
  else if (!v10)
  {
LABEL_18:
    sub_224D81098(0, (unint64_t *)&qword_26809FC10);
    return sub_224D81468() & 1;
  }
  return 0;
}

unint64_t sub_224D80D9C()
{
  unint64_t result = qword_26809FD38;
  if (!qword_26809FD38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26809FD40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26809FD38);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for NotePreview(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for NotePreview(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 40);
}

void *initializeWithCopy for NotePreview(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = (void *)a2[4];
  uint64_t v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v5;
  id v8 = v6;
  return a1;
}

void *assignWithCopy for NotePreview(void *a1, void *a2)
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

  id v7 = (void *)a2[5];
  id v8 = (void *)a1[5];
  a1[5] = v7;
  id v9 = v7;

  return a1;
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

uint64_t assignWithTake for NotePreview(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for NotePreview(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotePreview(uint64_t result, int a2, int a3)
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotePreview()
{
  return &type metadata for NotePreview;
}

uint64_t sub_224D81098(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_224D810D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_224D810E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26809FCF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_224D81144(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_224D811A8()
{
  return MEMORY[0x270EED9C0]();
}

uint64_t sub_224D811B8()
{
  return MEMORY[0x270EEDA90]();
}

uint64_t sub_224D811C8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_224D811D8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_224D811E8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_224D811F8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_224D81208()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_224D81218()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_224D81228()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_224D81298()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_224D812A8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_224D812B8()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_224D812C8()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_224D812D8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_224D812E8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_224D812F8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_224D81308()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_224D81318()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_224D81328()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_224D81338()
{
  return MEMORY[0x270FA1790]();
}

uint64_t sub_224D81348()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_224D81358()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_224D81368()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_224D81378()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_224D81388()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_224D81398()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_224D813A8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_224D813B8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_224D813C8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_224D813D8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_224D813E8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_224D813F8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_224D81408()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_224D81418()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_224D81428()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_224D81438()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_224D81448()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_224D81458()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_224D81468()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_224D81478()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_224D81488()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_224D81498()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_224D814A8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_224D814B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_224D814C8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_224D814D8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_224D814E8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_224D814F8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_224D81508()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_224D81518()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_224D81528()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_224D81538()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_224D81548()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_224D81558()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_224D81568()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_224D81578()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_224D81598()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_224D815A8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_224D815B8()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_224D815C8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_224D815D8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_224D815E8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_224D815F8()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_224D81608()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_224D81618()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_224D81628()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_224D81638()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_224D81668()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_224D81678()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_224D81688()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_224D81698()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_224D816A8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_224D816B8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_224D816C8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_224D816D8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_224D816E8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_224D816F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_224D81708()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_224D81718()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_224D81728()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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