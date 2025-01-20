id sub_221B1A934(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id result;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t inited;
  void **v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void aBlock[6];

  v6 = sub_221B96A88();
  v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_221B96AA8();
  v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend(result, sel_target);

    v42 = v10;
    v43 = v7;
    v40 = a2;
    v41 = v11;
    if (v16)
    {
      self;
      v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        v39 = v17;
        v16 = objc_msgSend(v17, sel_navigationItem);
LABEL_7:
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
        v19 = self;
        v20 = (void *)sub_221B96AF8();
        v21 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

        objc_msgSend(v18, sel_setFont_, v21);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F6D760);
        inited = swift_initStackObject();
        v23 = (void **)MEMORY[0x263F81500];
        *(_OWORD *)(inited + 16) = xmmword_221B9EEF0;
        v24 = *v23;
        *(void *)(inited + 32) = *v23;
        v25 = self;
        v26 = v18;
        swift_bridgeObjectRetain();
        v27 = v24;
        v28 = objc_msgSend(v25, sel_labelColor);
        v29 = objc_msgSend(v28, sel_colorWithAlphaComponent_, a3);

        *(void *)(inited + 64) = sub_221B1C2B4(0, &qword_267F6D768);
        *(void *)(inited + 40) = v29;
        sub_221B1AF1C(inited, &qword_267F6D798, &qword_267F6D7A0, (uint64_t (*)(uint64_t))sub_221B1B964);
        v30 = objc_allocWithZone(MEMORY[0x263F086A0]);
        v31 = (void *)sub_221B96AF8();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_221B1C26C(&qword_267F6D770, type metadata accessor for Key);
        v32 = (void *)sub_221B96AC8();
        swift_bridgeObjectRelease();
        v33 = objc_msgSend(v30, sel_initWithString_attributes_, v31, v32);

        objc_msgSend(v26, sel_setAttributedText_, v33);
        sub_221B1C2B4(0, &qword_267F6D778);
        v34 = (void *)sub_221B96B68();
        v35 = swift_allocObject();
        *(void *)(v35 + 16) = v16;
        *(void *)(v35 + 24) = v26;
        aBlock[4] = sub_221B1C330;
        aBlock[5] = v35;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_221B1B04C;
        aBlock[3] = &block_descriptor;
        v36 = _Block_copy(aBlock);
        v37 = v16;
        swift_release();
        sub_221B96A98();
        aBlock[0] = MEMORY[0x263F8EE78];
        sub_221B1C26C(&qword_267F6D780, MEMORY[0x263F8F030]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F6D788);
        sub_221B1C364(&qword_267F6D790, &qword_267F6D788);
        sub_221B96B88();
        MEMORY[0x223C8E0B0](0, v13, v9, v36);

        _Block_release(v36);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v13, v42);
      }
      swift_unknownObjectRelease();
      v16 = 0;
    }
    v39 = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_221B1AF1C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_221B96B98();
  v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_221B1C3A8(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_221B1C200(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

uint64_t sub_221B1B04C(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_221B1B090()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  v1 = (void *)sub_221B96A28();
  sub_221B1AF1C(MEMORY[0x263F8EE78], &qword_267F6D750, &qword_267F6D758, (uint64_t (*)(uint64_t))sub_221B1B964);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_221B1C26C(&qword_267F6D748, type metadata accessor for OpenExternalURLOptionsKey);
  id v2 = (id)sub_221B96AC8();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);
}

id sub_221B1B220(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v10 = (void *)sub_221B96AF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  id v12 = v11;
  if (v12) {

  }
  return v12;
}

id sub_221B1B420()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_221B1B458(uint64_t a1, uint64_t a2)
{
  return sub_221B1B5D8(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_221B1B47C(uint64_t a1, uint64_t a2)
{
  return sub_221B1B5D8(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_221B1B49C(uint64_t a1, id *a2)
{
  uint64_t result = sub_221B96B08();
  *a2 = 0;
  return result;
}

uint64_t sub_221B1B514(uint64_t a1, id *a2)
{
  char v3 = sub_221B96B18();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_221B1B594@<X0>(uint64_t *a1@<X8>)
{
  sub_221B96B28();
  uint64_t v2 = sub_221B96AF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_221B1B5D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_221B96B28();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_221B1B61C()
{
  sub_221B96B28();
  sub_221B96B48();
  return swift_bridgeObjectRelease();
}

uint64_t sub_221B1B670()
{
  sub_221B96B28();
  sub_221B96BC8();
  sub_221B96B48();
  uint64_t v0 = sub_221B96BD8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_221B1B6E8()
{
  uint64_t v0 = sub_221B96B28();
  uint64_t v2 = v1;
  if (v0 == sub_221B96B28() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_221B96BB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_221B1B778@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_221B96B28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_221B1B7A4(uint64_t a1)
{
  uint64_t v2 = sub_221B1C26C(&qword_267F6D770, type metadata accessor for Key);
  uint64_t v3 = sub_221B1C26C(&qword_267F6D7E8, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_221B1B860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_221B96AF8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_221B1B8A8(uint64_t a1)
{
  uint64_t v2 = sub_221B1C26C(&qword_267F6D748, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_221B1C26C(&qword_267F6D7F0, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_221B1B964(uint64_t a1)
{
  sub_221B96B28();
  sub_221B96BC8();
  sub_221B96B48();
  uint64_t v2 = sub_221B96BD8();
  swift_bridgeObjectRelease();
  return sub_221B1B9F8(a1, v2);
}

unint64_t sub_221B1B9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_221B96B28();
    uint64_t v8 = v7;
    if (v6 == sub_221B96B28() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_221B96BB8();
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
          uint64_t v13 = sub_221B96B28();
          uint64_t v15 = v14;
          if (v13 == sub_221B96B28() && v15 == v16) {
            break;
          }
          char v18 = sub_221B96BB8();
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

uint64_t sub_221B1BB70()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F6D728);
  uint64_t v19 = *(void *)(v2 - 8);
  uint64_t v20 = v2;
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_221B96A48();
  MEMORY[0x270FA5388]();
  sub_221B96AE8();
  MEMORY[0x270FA5388]();
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  id v5 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v5, sel_sf_isChinaRegionCellularDevice);

  sub_221B96AD8();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_221B96A38();
  uint64_t v9 = sub_221B96B38();
  uint64_t v11 = v10;
  sub_221B96AD8();
  id v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_221B96A38();
  v22[0] = sub_221B96B38();
  v22[1] = v13;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v1;
  v14[3] = v9;
  v14[4] = v11;
  uint64_t v15 = MEMORY[0x270FA5388]();
  *(&v18 - 6) = v9;
  *(&v18 - 5) = v11;
  *(&v18 - 4) = (uint64_t)v22;
  *(&v18 - 3) = (uint64_t)sub_221B1C080;
  *(&v18 - 2) = v15;
  v1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F6D730);
  sub_221B1C364(&qword_267F6D738, &qword_267F6D730);
  sub_221B96A68();
  swift_bridgeObjectRelease();
  sub_221B96A78();
  uint64_t v16 = v20;
  v21[3] = v20;
  v21[4] = sub_221B1C364(&qword_267F6D740, &qword_267F6D728);
  __swift_allocate_boxed_opaque_existential_1(v21);
  sub_221B96A58();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v16);
  MEMORY[0x223C8E090](v21);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SettingsCellularUIPlacardCell()
{
  return self;
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

uint64_t sub_221B1C040()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_221B1C080(double a1)
{
  return sub_221B1A934(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_221B1C08C()
{
  return sub_221B96AB8();
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

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

_OWORD *sub_221B1C200(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_221B1C224(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_221B1C26C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_221B1C2B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_221B1C2F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_221B1C330()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return objc_msgSend(result, sel_setTitleView_, *(void *)(v0 + 24));
  }
  return result;
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

uint64_t sub_221B1C364(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_221B1C3A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_221B1C40C()
{
  return sub_221B1C26C(&qword_267F6D7B8, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_221B1C454()
{
  return sub_221B1C26C(&qword_267F6D7C0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_221B1C49C()
{
  return sub_221B1C26C(&qword_267F6D7C8, type metadata accessor for Key);
}

uint64_t sub_221B1C4E4()
{
  return sub_221B1C26C(&qword_267F6D7D0, type metadata accessor for Key);
}

uint64_t sub_221B1C52C()
{
  return sub_221B1C26C(&qword_267F6D7D8, type metadata accessor for Key);
}

uint64_t sub_221B1C574()
{
  return sub_221B1C26C(&qword_267F6D7E0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_221B1C5C4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_221B1D950(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_221B1DDB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_221B20164(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B2027C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B203EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B204B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B20748(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B20860(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B20A98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B254C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_221B26458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B27318(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B27744(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B277CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B29A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B29C78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B2A634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_26AC32358)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2645E0DB8;
    uint64_t v7 = 0;
    qword_26AC32358 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_26AC32358;
    if (qword_26AC32358)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_26AC32358;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_26AC32358 = result;
  return result;
}

void sub_221B2AE10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B2C2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_26AC32258)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2645E0DF0;
    uint64_t v7 = 0;
    qword_26AC32258 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_26AC32258;
    if (qword_26AC32258)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_26AC32258;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_26AC32250 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  qword_26AC32258 = result;
  return result;
}

void sub_221B35734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B35FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B36C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PSIsDataRoamingOptionAvailable()
{
  uint64_t v0 = +[PSUICoreTelephonyDataCache sharedInstance];
  uint64_t v1 = [v0 isCellularDataEnabled];

  return v1;
}

uint64_t PSIsCDMARoamingOptionAvailable()
{
  uint64_t v0 = _CTServerConnectionCreate();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    _CTServerConnectionIsCDMAInternationalRoamingSettingAllowed();
    CFRelease(v1);
  }
  return 0;
}

uint64_t PSIsVoiceRoamingOptionAvailable()
{
  uint64_t v0 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  uint64_t v1 = [v0 shouldShowVoiceRoamingSwitchForDefaultVoicePlan];

  return v1;
}

uint64_t PSIsDataRoamingEnabled()
{
  uint64_t v0 = +[PSUICoreTelephonyDataCache sharedInstance];
  uint64_t v1 = [v0 getInternationalDataAccessStatus];

  return v1;
}

uint64_t PSIsVoiceRoamingEnabled()
{
  uint64_t v0 = _CTServerConnectionCreate();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    _CTServerConnectionGetEnableOnlyHomeNetwork();
    CFRelease(v1);
  }
  return 1;
}

void PSSetVoiceRoamingEnabled()
{
  uint64_t v0 = _CTServerConnectionCreate();
  if (v0)
  {
    uint64_t v1 = (const void *)v0;
    _CTServerConnectionSetEnableOnlyHomeNetwork();
    CFRelease(v1);
  }
}

uint64_t PSIsDataRoamingEnabledForService(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[PSUICoreTelephonyDataCache sharedInstance];
  uint64_t v3 = [v2 getInternationalDataAccessStatus:v1];

  return v3;
}

void PSSetDataRoamingEnabled(uint64_t a1)
{
  CFPreferencesSetAppValue(@"DeferredSMSMessageCount", 0, @"com.apple.springboard");
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  id v2 = +[PSUICoreTelephonyDataCache sharedInstance];
  [v2 setInternationalDataAccessStatus:a1];
}

void PSSetDataRoamingEnabledForService(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[PSUICoreTelephonyDataCache sharedInstance];
  [v4 setInternationalDataAccessStatus:v3 status:a2];
}

void PSSetCDMARoamingEnabled()
{
  uint64_t v0 = _CTServerConnectionCreate();
  if (v0)
  {
    id v1 = (const void *)v0;
    _CTServerConnectionSetCDMAInternationalRoaming();
    CFRelease(v1);
  }
}

uint64_t PSShouldIncludeMMSFooterNote()
{
  uint64_t v0 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  int v1 = [v0 isMMSOnWhileRoamingForActiveDataPlan];

  if (CPCanSendMMS()) {
    return v1 ^ 1u;
  }
  else {
    return 0;
  }
}

id PSDataRoamingSpecifiers(void *a1)
{
  int v1 = (void *)MEMORY[0x263F5FC40];
  id v2 = (void *)MEMORY[0x263F086E0];
  id v3 = a1;
  id v4 = [v2 bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"DATA_ROAMING_TOGGLE" value:&stru_26D410CA0 table:@"Cellular"];
  long long v6 = [v1 preferenceSpecifierNamed:v5 target:v3 set:sel_setDataRoamingEnabled_specifier_ get:sel_getDataRoamingStatus_ detail:0 cell:6 edit:0];

  [v6 setIdentifier:@"DATA_ROAMING"];
  uint64_t v7 = NSNumber;
  uint64_t v8 = +[PSUICoreTelephonyDataCache sharedInstance];
  uint64_t v9 = +[SettingsCellularUtils singleSIMUIServiceDescriptor];
  uint64_t v10 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "hideDataRoaming:", v9) ^ 1);
  [v6 setProperty:v10 forKey:*MEMORY[0x263F600A8]];

  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v6, 0);

  return v11;
}

id PSCDMARoamingSpecifiers(void *a1)
{
  int v1 = (void *)MEMORY[0x263F5FC40];
  id v2 = a1;
  id v3 = [v1 groupSpecifierWithName:0];
  [v3 setProperty:@"CDMA_ROAMING_GROUP" forKey:*MEMORY[0x263F60138]];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"CDMA_ROAMING_EXPLANATION" value:&stru_26D410CA0 table:@"Cellular"];
  [v3 setProperty:v5 forKey:*MEMORY[0x263F600F8]];

  long long v6 = +[PSUICellularPlanManagerCache sharedInstance];
  uint64_t v7 = [v6 selectedPlanItem];
  uint64_t v8 = [v7 isBackedByCellularPlan] ^ 1;

  uint64_t v9 = (void *)MEMORY[0x263F5FC40];
  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v10 localizedStringForKey:@"CDMA_ROAMING_TOGGLE" value:&stru_26D410CA0 table:@"Cellular"];
  id v12 = [v9 preferenceSpecifierNamed:v11 target:v2 set:sel_setCDMARoamingEnabled_specifier_ get:sel_getCDMARoamingStatus_ detail:0 cell:6 edit:0];

  [v12 setIdentifier:@"CDMA_ROAMING"];
  uint64_t v13 = [NSNumber numberWithBool:v8];
  [v12 setProperty:v13 forKey:*MEMORY[0x263F600A8]];

  uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, v12, 0);

  return v14;
}

id PSRoamingSubMenuSpecifiers(void *a1)
{
  int v1 = (void *)MEMORY[0x263F5FC40];
  id v2 = a1;
  id v3 = [v1 emptyGroupSpecifier];
  id v4 = (void *)MEMORY[0x263F5FC40];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v6 = [v5 localizedStringForKey:@"ROAMING_LINK" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v7 = [v4 preferenceSpecifierNamed:v6 target:v2 set:0 get:sel_roamingSettingsDescription_ detail:objc_opt_class() cell:2 edit:0];

  [v7 setIdentifier:@"ROAMING_LINK"];
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, v7, 0);

  return v8;
}

void sub_221B3BF10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B3E1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B3F928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id getCLLocationManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLLocationManagerClass_softClass;
  uint64_t v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_2645E0D98;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_221B3FA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221B3FF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getCLCopyAppsUsingLocationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreLocationLibrary();
  uint64_t result = dlsym(v2, "CLCopyAppsUsingLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLCopyAppsUsingLocationSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreLocationLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CoreLocationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2645E0ED0;
    uint64_t v5 = 0;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = CoreLocationLibraryCore_frameworkLibrary;
    if (CoreLocationLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CoreLocationLibraryCore_frameworkLibrary;
}

uint64_t __CoreLocationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary = result;
  return result;
}

PSUISubscriptionContextMenusGroup *__getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  CoreLocationLibrary();
  uint64_t result = (PSUISubscriptionContextMenusGroup *)objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = (PSUISubscriptionContextMenusGroup *)abort_report_np();
    return [(PSUISubscriptionContextMenusGroup *)v3 initWithFactory:v5];
  }
  return result;
}

void sub_221B420CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_221B45B94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B45C88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B45D18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B45FE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B460DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B461C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B46484(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B47018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B4719C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B4748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_221B47C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221B483A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B487D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B48C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PSAnalyticsSendEvent(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (void (*)(id, void))_MergedGlobals_61;
  uint64_t v8 = _MergedGlobals_61;
  if (!_MergedGlobals_61)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getAnalyticsSendEventSymbolLoc_block_invoke_1;
    v4[3] = &unk_2645E0D98;
    v4[4] = &v5;
    __getAnalyticsSendEventSymbolLoc_block_invoke_1((uint64_t)v4);
    uint64_t v2 = (void (*)(id, void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    dlerror();
    id v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  v2(v1, MEMORY[0x263EFFA78]);
}

void sub_221B49288(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_26AC32288)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke_1;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2645E1030;
    uint64_t v7 = 0;
    qword_26AC32288 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_26AC32288;
    if (qword_26AC32288)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_26AC32288;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_61 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  qword_26AC32288 = result;
  return result;
}

uint64_t MobileStoreUILibraryCore()
{
  if (!MobileStoreUILibraryCore_frameworkLibrary) {
    MobileStoreUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return MobileStoreUILibraryCore_frameworkLibrary;
}

uint64_t __MobileStoreUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileStoreUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSUUIMetricsLaunchApplicationWithIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileStoreUILibrary();
  uint64_t result = dlsym(v2, "SUUIMetricsLaunchApplicationWithIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_26AC32290 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileStoreUILibrary()
{
  uint64_t v0 = MobileStoreUILibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getSUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MobileStoreUILibrary();
  uint64_t result = dlsym(v2, "SUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_26AC32298 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_221B49C84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B4BCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B50198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_221B50614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  _Block_object_dispose((const void *)(v27 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AC322B8)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __RemoteUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2645E1148;
    uint64_t v6 = 0;
    qword_26AC322B8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_26AC322B8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("RemoteUIController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_63 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RemoteUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_26AC322B8 = result;
  return result;
}

void sub_221B52974(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t MobileStoreUILibraryCore_0()
{
  if (!MobileStoreUILibraryCore_frameworkLibrary_0) {
    MobileStoreUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return MobileStoreUILibraryCore_frameworkLibrary_0;
}

uint64_t __MobileStoreUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MobileStoreUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

PSUIDataUsageCategorySpecifier *__getSUUIItemOfferButtonClass_block_invoke(uint64_t a1)
{
  if (!MobileStoreUILibraryCore_0())
  {
    id v3 = (void *)abort_report_np();
    free(v3);
  }
  uint64_t result = (PSUIDataUsageCategorySpecifier *)objc_getClass("SUUIItemOfferButton");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSUUIItemOfferButtonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    SEL v4 = (PSUIDataUsageCategorySpecifier *)abort_report_np();
    return [(PSUIDataUsageCategorySpecifier *)v4 initWithType:v6 subSpecifiers:v7];
  }
  return result;
}

void sub_221B548E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id getCLLocationManagerClass_0()
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLLocationManagerClass_softClass_0;
  uint64_t v7 = getCLLocationManagerClass_softClass_0;
  if (!getCLLocationManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_0;
    v3[3] = &unk_2645E0D98;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_221B59258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221B5B5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_221B5CF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void *__getCLCopyAppsUsingLocationSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)CoreLocationLibrary_0();
  uint64_t result = dlsym(v2, "CLCopyAppsUsingLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLCopyAppsUsingLocationSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreLocationLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CoreLocationLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2645E12E0;
    uint64_t v5 = 0;
    CoreLocationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = CoreLocationLibraryCore_frameworkLibrary_0;
    if (CoreLocationLibraryCore_frameworkLibrary_0)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CoreLocationLibraryCore_frameworkLibrary_0;
}

uint64_t __CoreLocationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

PSUIPlanPendingTransferDetailController *__getCLLocationManagerClass_block_invoke_0(uint64_t a1)
{
  CoreLocationLibrary_0();
  uint64_t result = (PSUIPlanPendingTransferDetailController *)objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = (PSUIPlanPendingTransferDetailController *)abort_report_np();
    return [(PSUIPlanPendingTransferDetailController *)v3 init];
  }
  return result;
}

void sub_221B5E960(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_221B5F38C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B5F554(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B5F868(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B5F9C4(_Unwind_Exception *exception_object)
{
}

void sub_221B5FB8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B5FCE8(_Unwind_Exception *exception_object)
{
}

void sub_221B60040(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B60364(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B66570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221B672EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getCTCarrierSpaceClientClass_block_invoke(uint64_t a1)
{
  CTCarrierSpaceLibrary();
  Class result = objc_getClass("CTCarrierSpaceClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCTCarrierSpaceClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)CTCarrierSpaceLibrary();
  }
  return result;
}

uint64_t CTCarrierSpaceLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CTCarrierSpaceLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CTCarrierSpaceLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2645E1448;
    uint64_t v5 = 0;
    CTCarrierSpaceLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = CTCarrierSpaceLibraryCore_frameworkLibrary;
    if (CTCarrierSpaceLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CTCarrierSpaceLibraryCore_frameworkLibrary;
}

uint64_t __CTCarrierSpaceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CTCarrierSpaceLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CTCarrierSpaceLibrary();
  uint64_t result = dlsym(v2, "kCTCarrierSpaceConnectionAccountIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_221B6AF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_221B6B228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AC322F8)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CoreLocationLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2645E1488;
    uint64_t v6 = 0;
    qword_26AC322F8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_26AC322F8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CLLocationManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_67 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreLocationLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  qword_26AC322F8 = result;
  return result;
}

void PSAnalyticsSendEvent_0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  long long v5 = (void (*)(id, id))_MergedGlobals_1_3;
  uint64_t v11 = _MergedGlobals_1_3;
  if (!_MergedGlobals_1_3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getAnalyticsSendEventSymbolLoc_block_invoke_2;
    v7[3] = &unk_2645E0D98;
    v7[4] = &v8;
    __getAnalyticsSendEventSymbolLoc_block_invoke_2((uint64_t)v7);
    long long v5 = (void (*)(id, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    dlerror();
    uint64_t v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v5(v3, v4);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_26AC323A8)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke_2;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2645E1508;
    uint64_t v7 = 0;
    qword_26AC323A8 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_26AC323A8;
    if (qword_26AC323A8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_26AC323A8;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_1_3 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  qword_26AC323A8 = result;
  return result;
}

void sub_221B6D060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_221B6D0E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_221B6D184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_221B6D1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_221B6D418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_221B6D540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_221B6D664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_221B6D8C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_221B6DD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221B6DF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221B6ED84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCTCarrierSpaceClientClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AC323B8)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CTCarrierSpaceLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2645E1548;
    uint64_t v6 = 0;
    qword_26AC323B8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_26AC323B8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CTCarrierSpaceClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  _MergedGlobals_1_4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CTCarrierSpaceLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  qword_26AC323B8 = result;
  return result;
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_26AC323C8)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke_3;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2645E1560;
    uint64_t v7 = 0;
    qword_26AC323C8 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_26AC323C8;
    if (qword_26AC323C8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_26AC323C8;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_26AC323C0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  qword_26AC323C8 = result;
  return result;
}

Class __getRemoteUIControllerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26AC323D8)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __RemoteUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2645E1578;
    uint64_t v6 = 0;
    qword_26AC323D8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_26AC323D8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("RemoteUIController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_26AC323D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RemoteUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  qword_26AC323D8 = result;
  return result;
}

void sub_221B70040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_221B70294(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_221B71650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_221B71A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_221B71C6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B7265C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B727A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B72BBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B72CBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B72DB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73124(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73348(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73668(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B7375C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73AA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73B98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73EC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B73FB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B7425C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_221B74354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B74664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B74758(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B749E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B80AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_26AC323E8)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke_4;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2645E17F8;
    uint64_t v7 = 0;
    qword_26AC323E8 = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_26AC323E8;
    if (qword_26AC323E8)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_26AC323E8;
LABEL_5:
  uint64_t result = dlsym(v2, "AnalyticsSendEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_1_5 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  qword_26AC323E8 = result;
  return result;
}

id PSUIGetPlanSubscriptionStatus(int a1)
{
  switch(a1)
  {
    case 0:
    case 8:
      id v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v2 = v1;
      id v3 = @"CELLULAR_ACCOUNT_ACTIVE";
      goto LABEL_6;
    case 1:
      id v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v2 = v1;
      id v3 = @"CELLULAR_ACCOUNT_EXPIRED";
      goto LABEL_6;
    case 2:
    case 6:
    case 7:
    case 9:
      id v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v2 = v1;
      id v3 = @"CELLULAR_ACCOUNT_ACTIVATING";
      goto LABEL_6;
    case 3:
    case 4:
    case 5:
      id v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v2 = v1;
      id v3 = @"CELLULAR_ACCOUNT_INVALIDPLAN";
LABEL_6:
      id v4 = [v1 localizedStringForKey:v3 value:&stru_26D410CA0 table:@"Cellular"];

      break;
    default:
      id v4 = 0;
      break;
  }
  return v4;
}

id PSUIFormatDataUsage(double a1, double a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F67EB0] loggerWithCategory:@"PlanManagerCache"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = [NSNumber numberWithDouble:a1];
    long long v6 = [NSNumber numberWithDouble:a2];
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "DataUsage: data: %@ bytes left for %@ seconds", buf, 0x16u);
  }
  uint64_t v7 = [MEMORY[0x263F67F00] usageSizeString:a1];
  if (a2 <= 86400.0)
  {
    if (a2 <= 3600.0)
    {
      uint64_t v9 = NSString;
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (a2 <= 0.0)
      {
        uint64_t v17 = @"CELLULAR_PLAN_DATA_USAGE_%@_LEFT";
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v8 = (int)(a2 / 3600.0);
      uint64_t v9 = NSString;
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if ((int)v8 >= 2)
      {
        uint64_t v11 = @"CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_%@_HOURS";
        goto LABEL_9;
      }
    }
    uint64_t v17 = @"CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_ONE_HOUR";
  }
  else
  {
    uint64_t v8 = (int)(a2 / 86400.0);
    uint64_t v9 = NSString;
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if ((int)v8 >= 2)
    {
      uint64_t v11 = @"CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_%@_DAYS";
LABEL_9:
      id v12 = [v10 localizedStringForKey:v11 value:&stru_26D410CA0 table:@"Cellular"];
      uint64_t v13 = (void *)MEMORY[0x263F08A30];
      uint64_t v14 = [NSNumber numberWithInt:v8];
      uint64_t v15 = [v13 localizedStringFromNumber:v14 numberStyle:0];
      uint64_t v16 = objc_msgSend(v9, "stringWithFormat:", v12, v7, v15);

      goto LABEL_15;
    }
    uint64_t v17 = @"CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_ONE_DAY";
  }
LABEL_14:
  id v12 = [v10 localizedStringForKey:v17 value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v16 = objc_msgSend(v9, "stringWithFormat:", v12, v7);
LABEL_15:

  return v16;
}

id PSUIFormatPlanStatusForPlan(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 plan];

  if (v2)
  {
    id v3 = [v1 plan];
    id v4 = [v3 dataUsage];

    long long v5 = [v1 plan];
    if ([v5 status] || !v4)
    {
    }
    else
    {
      uint64_t v6 = [v4 count];

      if (v6)
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v7 = v4;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
        double v9 = 0.0;
        double v10 = 0.0;
        double v11 = 0.0;
        if (v8)
        {
          uint64_t v12 = v8;
          uint64_t v13 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v35 != v13) {
                objc_enumerationMutation(v7);
              }
              uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              [v15 dataCapacity];
              double v11 = v11 + v16;
              [v15 dataUsed];
              double v10 = v10 + v17;
            }
            uint64_t v12 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v12);
        }

        if (v11 - v10 >= 0.0) {
          double v9 = v11 - v10;
        }
        uint64_t v18 = [v1 plan];
        [v18 timestamp];
        if (v19 > 0.0)
        {
          uint64_t v20 = [v1 plan];
          [v20 billingEndDate];
          if (v21 <= 0.0)
          {
            uint64_t v27 = PSUIFormatDataUsage(v9, 0.0);
          }
          else
          {
            v22 = [v1 plan];
            [v22 billingEndDate];
            double v24 = v23;
            v25 = [v1 plan];
            [v25 timestamp];
            uint64_t v27 = PSUIFormatDataUsage(v9, v24 - v26);
          }
          goto LABEL_21;
        }
        uint64_t v28 = PSUIFormatDataUsage(v9, 0.0);
LABEL_20:
        uint64_t v27 = (void *)v28;
LABEL_21:

        goto LABEL_22;
      }
    }
    uint64_t v18 = [v1 plan];
    uint64_t v28 = PSUIGetPlanSubscriptionStatus([v18 status]);
    goto LABEL_20;
  }
  uint64_t v27 = 0;
LABEL_22:
  if ([v1 type] == 2 || objc_msgSend(v1, "type") == 3)
  {
    id v29 = v27;
  }
  else
  {
    v30 = NSString;
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"CELLULAR_PLAN_STATUS_SIM_CARD_AND_STATUS" value:&stru_26D410CA0 table:@"Cellular"];
    objc_msgSend(v30, "stringWithFormat:", v32, v27);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v29;
}

void sub_221B83D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B8425C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B849D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B86014(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B86108(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B8622C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B86430(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B86788(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B86D1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B86FB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B87628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B879C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B87B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B87C7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B87EAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B87FE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_221B88300(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221B884DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass_1()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLLocationManagerClass_softClass_1;
  uint64_t v7 = getCLLocationManagerClass_softClass_1;
  if (!getCLLocationManagerClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_2;
    v3[3] = &unk_2645E0D98;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_2((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_221B88F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke_2(uint64_t a1)
{
  CoreLocationLibrary_1();
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)CoreLocationLibrary_1();
  }
  return result;
}

uint64_t CoreLocationLibrary_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary_1)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __CoreLocationLibraryCore_block_invoke_2;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2645E1920;
    uint64_t v5 = 0;
    CoreLocationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = CoreLocationLibraryCore_frameworkLibrary_1;
    if (CoreLocationLibraryCore_frameworkLibrary_1)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return CoreLocationLibraryCore_frameworkLibrary_1;
}

uint64_t __CoreLocationLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getCLCopyAppsUsingLocationSymbolLoc_block_invoke_1(uint64_t a1)
{
  uint64_t v2 = (void *)CoreLocationLibrary_1();
  uint64_t result = dlsym(v2, "CLCopyAppsUsingLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCLCopyAppsUsingLocationSymbolLoc_ptr_1 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_221B8EF54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221B90C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_221B96A28()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_221B96A38()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_221B96A48()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_221B96A58()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_221B96A68()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_221B96A78()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_221B96A88()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_221B96A98()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_221B96AA8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_221B96AB8()
{
  return MEMORY[0x270F5D0D8]();
}

uint64_t sub_221B96AC8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_221B96AD8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_221B96AE8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_221B96AF8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_221B96B08()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_221B96B18()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_221B96B28()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_221B96B38()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_221B96B48()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_221B96B58()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_221B96B68()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_221B96B78()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_221B96B88()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_221B96B98()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_221B96BB8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_221B96BC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_221B96BD8()
{
  return MEMORY[0x270F9FC90]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F1B710]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x270F1B718]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPCanSendMMS()
{
  return MEMORY[0x270F0CCF8]();
}

uint64_t CTDataRateAsString()
{
  return MEMORY[0x270EE8680]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t PSAbbreviatedFormattedTimeStringWithDays()
{
  return MEMORY[0x270F551B8]();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x270F551E8]();
}

uint64_t PSFormattedTimeStringWithDays()
{
  return MEMORY[0x270F55200]();
}

uint64_t PSIsTelephonyDead()
{
  return MEMORY[0x270F55260]();
}

uint64_t PSSimIsRequired()
{
  return MEMORY[0x270F552F0]();
}

uint64_t PSTimeStringIsShortened()
{
  return MEMORY[0x270F55330]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x270F5D188]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x270F5D1B8]();
}

uint64_t ScreenScale()
{
  return MEMORY[0x270F55380]();
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x270F55398]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B508]();
}

uint64_t WiFiManagerClientSetProperty()
{
  return MEMORY[0x270F4B678]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCopyReliableNetworkFallbackSettings()
{
  return MEMORY[0x270EE8798]();
}

uint64_t _CTServerConnectionCopyStartDateOfCellularDataUsageRecords()
{
  return MEMORY[0x270EE87A0]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x270EE87C0]();
}

uint64_t _CTServerConnectionGetCDMAInternationalRoaming()
{
  return MEMORY[0x270EE8800]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x270EE8808]();
}

uint64_t _CTServerConnectionGetEnableOnlyHomeNetwork()
{
  return MEMORY[0x270EE8820]();
}

uint64_t _CTServerConnectionIsCDMAInternationalRoamingSettingAllowed()
{
  return MEMORY[0x270EE8850]();
}

uint64_t _CTServerConnectionSetCDMAInternationalRoaming()
{
  return MEMORY[0x270EE8888]();
}

uint64_t _CTServerConnectionSetEnableOnlyHomeNetwork()
{
  return MEMORY[0x270EE88A0]();
}

uint64_t _CTServerConnectionSetReliableNetworkFallbackToCellular()
{
  return MEMORY[0x270EE88A8]();
}

uint64_t _CTServerConnectionUnregisterForAllNotifications()
{
  return MEMORY[0x270EE88C8]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}