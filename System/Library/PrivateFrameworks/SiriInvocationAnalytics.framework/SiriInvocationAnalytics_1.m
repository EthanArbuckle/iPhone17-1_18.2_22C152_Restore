uint64_t static UEIIntraTurnFeatureExtractor.getCatID(turn:)(uint64_t a1)
{
  return sub_25CA4392C(a1, (void (*)(void))IntraTurnFeatureKeys.UEI_CAT_ID_KEY.unsafeMutableAddressor);
}

uint64_t static UEIIntraTurnFeatureExtractor.getInvocationSource(turn:)(uint64_t a1)
{
  return sub_25CA4392C(a1, (void (*)(void))IntraTurnFeatureKeys.UEI_INVOCATION_SOURCE_KEY.unsafeMutableAddressor);
}

unint64_t static UEIIntraTurnFeatureExtractor.getInvocationSourceId(turn:)()
{
  IntraTurnFeatureKeys.UEI_INVOCATION_SOURCE_ID_KEY.unsafeMutableAddressor();
  OUTLINED_FUNCTION_4_3();
  v1 = *(uint64_t (**)(void))(v0 + 128);
  sub_25CA458C8();
  OUTLINED_FUNCTION_24_15();
  uint64_t v2 = v1();
  OUTLINED_FUNCTION_3_2(v2, v3, v4, v5, v6, v7, v8, v9, v14, v15, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18)
  {
    int v10 = OUTLINED_FUNCTION_7_2();
    uint64_t v11 = v16;
    unsigned __int8 v12 = v10 ^ 1;
    if (!v10) {
      uint64_t v11 = 0;
    }
  }
  else
  {
    sub_25C9C90F4((uint64_t)&v17);
    uint64_t v11 = 0;
    unsigned __int8 v12 = 1;
  }
  return v11 | ((unint64_t)v12 << 32);
}

uint64_t static UEIIntraTurnFeatureExtractor.getSpeakeasyCategory(turn:)(uint64_t a1)
{
  return sub_25CA4392C(a1, (void (*)(void))IntraTurnFeatureKeys.UEI_SPEAKEASY_CATEGORY_KEY.unsafeMutableAddressor);
}

uint64_t static UEIIntraTurnFeatureExtractor.getDismissalReason(turn:)(uint64_t a1)
{
  return sub_25CA4392C(a1, (void (*)(void))IntraTurnFeatureKeys.UEI_DISMISSAL_REASON_KEY.unsafeMutableAddressor);
}

uint64_t static UEIIntraTurnFeatureExtractor.getCatIDSequence(turn:)()
{
  IntraTurnFeatureKeys.UEI_CAT_ID_SEQUENCE_KEY.unsafeMutableAddressor();
  OUTLINED_FUNCTION_4_3();
  v1 = *(uint64_t (**)(void))(v0 + 128);
  sub_25CA458C8();
  OUTLINED_FUNCTION_24_15();
  uint64_t v2 = v1();
  OUTLINED_FUNCTION_3_2(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E1C60);
    if (OUTLINED_FUNCTION_7_2()) {
      return v13;
    }
  }
  else
  {
    sub_25C9C90F4((uint64_t)&v14);
  }
  return MEMORY[0x263F8EE78];
}

uint64_t static UEIIntraTurnFeatureExtractor.getUEIRequestStatusString(turn:)(uint64_t a1)
{
  return sub_25CA43A24(a1, (uint64_t (*)(void))IntraTurnFeatureKeys.UEI_REQUEST_STATUS.unsafeMutableAddressor, type metadata accessor for SISchemaUEIRequestStatus, MEMORY[0x263F6D968]);
}

uint64_t static UEIIntraTurnFeatureExtractor.getHasPunchOut(turn:)()
{
  IntraTurnFeatureKeys.UEI_HAS_PUNCHOUT.unsafeMutableAddressor();
  OUTLINED_FUNCTION_4_3();
  v1 = *(uint64_t (**)(void))(v0 + 128);
  sub_25CA458C8();
  OUTLINED_FUNCTION_24_15();
  uint64_t v2 = v1();
  OUTLINED_FUNCTION_3_2(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    uint64_t result = OUTLINED_FUNCTION_7_2();
    if (result) {
      return v13;
    }
  }
  else
  {
    sub_25C9C90F4((uint64_t)&v14);
    return 0;
  }
  return result;
}

uint64_t static UEIIntraTurnFeatureExtractor.getPunchOutAppId(turn:)(uint64_t a1)
{
  return sub_25CA4392C(a1, (void (*)(void))IntraTurnFeatureKeys.UEI_PUNCHOUT_APP.unsafeMutableAddressor);
}

uint64_t sub_25CA4392C(uint64_t a1, void (*a2)(void))
{
  a2();
  OUTLINED_FUNCTION_4_3();
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 128);
  sub_25CA458C8();
  OUTLINED_FUNCTION_24_15();
  uint64_t v4 = v3();
  OUTLINED_FUNCTION_3_2(v4, v5, v6, v7, v8, v9, v10, v11, v13, v15, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17)
  {
    if (OUTLINED_FUNCTION_7_2()) {
      return v14;
    }
  }
  else
  {
    sub_25C9C90F4((uint64_t)&v16);
  }
  return 0;
}

uint64_t static UEIIntraTurnFeatureExtractor.getPunchOutUIString(turn:)(uint64_t a1)
{
  return sub_25CA43A24(a1, (uint64_t (*)(void))IntraTurnFeatureKeys.UEI_PUNCHOUT_APP.unsafeMutableAddressor, type metadata accessor for SISchemaPunchOutUI, MEMORY[0x263F6D960]);
}

uint64_t sub_25CA43A24(uint64_t a1, uint64_t (*a2)(void), void (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = (uint64_t *)a2();
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  uint64_t v10 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 128);
  uint64_t v11 = sub_25CA458C8();
  uint64_t v12 = v10(v11);
  sub_25C9C80BC(v8, v9, v12, &v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
    a3(0);
    if (OUTLINED_FUNCTION_7_2()) {
      return a4(v14);
    }
  }
  else
  {
    sub_25C9C90F4((uint64_t)&v15);
  }
  return 0;
}

uint64_t sub_25CA43B1C()
{
  return swift_bridgeObjectRelease();
}

id UEIIntraTurnFeatureExtractor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UEIIntraTurnFeatureExtractor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25CA43B70(void *a1)
{
  id v2 = objc_msgSend(a1, sel_appID);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_25CA459A8();

  return v3;
}

void type metadata accessor for SISchemaPunchOutUI(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return sub_25C9C9F80(v2 - 128, v0, v1);
}

uint64_t OUTLINED_FUNCTION_4_26()
{
  return sub_25C9C9F80(v2 - 128, v0, v1);
}

uint64_t OUTLINED_FUNCTION_5_20()
{
  return v0 - 160;
}

uint64_t OUTLINED_FUNCTION_9_22(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t OUTLINED_FUNCTION_13_14()
{
  return v0 - 160;
}

uint64_t OUTLINED_FUNCTION_14_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_20()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_17_17(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_18_18@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_19_17()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_14()
{
  return v0 - 160;
}

uint64_t OUTLINED_FUNCTION_23_11()
{
  return v0 - 160;
}

void OUTLINED_FUNCTION_25_11(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

BOOL OUTLINED_FUNCTION_27_9@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_28_8()
{
  return v0 - 160;
}

id CarPlayEventFeatureExtractor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CarPlayEventFeatureExtractor.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CarPlayEventFeatureExtractor();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CarPlayEventFeatureExtractor()
{
  return self;
}

void CarPlayEventFeatureExtractor.extractFrom(event:)(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  id v58 = (id)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x98))();
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    IntraEventFeatureKeys.CARPLAY_REASON_KEY.unsafeMutableAddressor();
    sub_25CA458C8();
    objc_msgSend(v4, sel_reason);
    type metadata accessor for BMCarPlayReason();
    os_log_type_t v5 = *(uint64_t (**)(char *))((*v2 & *v1) + 0x68);
    unsigned int v14 = OUTLINED_FUNCTION_1_3(v6, v7, v8, v9, v10, v11, v12, v13, v54, (uint64_t)v58, v63);
    long long v15 = (void (*)(char *))v5(v14);
    uint64_t v21 = OUTLINED_FUNCTION_1_8((uint64_t)v15, v16, v17, v18, v19, v20);
    v29 = OUTLINED_FUNCTION_2_3(v21, v22, v23, v24, v25, v26, v27, v28, v55, (uint64_t)v59, v64);
    v15(v29);
    IntraEventFeatureKeys.CARPLAY_IS_STARTING_KEY.unsafeMutableAddressor();
    sub_25CA458C8();
    id v30 = objc_msgSend(v4, sel_isStart);
    v38 = OUTLINED_FUNCTION_1_3((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37, v56, (uint64_t)v60, v65);
    v39 = (void (*)(char *))v5(v38);
    uint64_t v45 = OUTLINED_FUNCTION_1_8((uint64_t)v39, v40, v41, v42, v43, v44);
    v53 = OUTLINED_FUNCTION_2_3(v45, v46, v47, v48, v49, v50, v51, v52, v57, (uint64_t)v61, v66);
    v39(v53);
  }
  else
  {
  }
}

void type metadata accessor for BMCarPlayReason()
{
  if (!qword_26A5E29B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A5E29B0);
    }
  }
}

uint64_t static CarPlayEventFeatureExtractor.getCarPlayReason(featurizedEvent:)(uint64_t a1)
{
  IntraEventFeatureKeys.CARPLAY_REASON_KEY.unsafeMutableAddressor();
  objc_super v2 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 144);
  uint64_t v3 = sub_25CA458C8();
  uint64_t v4 = v2(v3);
  OUTLINED_FUNCTION_3_2(v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17)
  {
    type metadata accessor for BMCarPlayReason();
    if (swift_dynamicCast() && v15 < 3) {
      return *(void *)&aUnknown_4[8 * v15];
    }
  }
  else
  {
    sub_25C9C90F4((uint64_t)&v16);
  }
  return 0;
}

uint64_t static CarPlayEventFeatureExtractor.getCarPlayIsStarting(featurizedEvent:)(uint64_t a1)
{
  IntraEventFeatureKeys.CARPLAY_IS_STARTING_KEY.unsafeMutableAddressor();
  objc_super v2 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 144);
  uint64_t v3 = sub_25CA458C8();
  uint64_t v4 = v2(v3);
  OUTLINED_FUNCTION_3_2(v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17)
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v15;
    }
  }
  else
  {
    sub_25C9C90F4((uint64_t)&v16);
    return 0;
  }
  return result;
}

id CarPlayEventFeatureExtractor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CarPlayEventFeatureExtractor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double FeaturizedTurnsByBucketizedTimestamp.bucketSize.getter()
{
  swift_beginAccess();
  return *(double *)(v0 + 16);
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.bucketSize.setter(double a1)
{
  uint64_t result = swift_beginAccess();
  *(double *)(v1 + 16) = a1;
  return result;
}

uint64_t (*FeaturizedTurnsByBucketizedTimestamp.bucketSize.modify())()
{
  return j__swift_endAccess;
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.dictionary.getter()
{
  return sub_25CA458C8();
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.dictionary.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*FeaturizedTurnsByBucketizedTimestamp.dictionary.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.__allocating_init(bucketSize:)(double a1)
{
  uint64_t v2 = swift_allocObject();
  *(double *)(v2 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E1A60);
  *(void *)(v2 + 24) = sub_25CA45898();
  return v2;
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.init(bucketSize:)(double a1)
{
  *(double *)(v1 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E1A60);
  *(void *)(v1 + 24) = sub_25CA45898();
  return v1;
}

Swift::OpaquePointer_optional __swiftcall FeaturizedTurnsByBucketizedTimestamp.getTurns(key:)(Swift::Int key)
{
  return TimeBasedDictionary.getValue(key:)(key);
}

uint64_t type metadata accessor for FeaturizedTurnsByBucketizedTimestamp()
{
  return self;
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.addFeaturizedConversationTurn(timestamp:turn:)()
{
  double v1 = (*(double (**)(void))(*(void *)v0 + 96))();
  double v2 = OUTLINED_FUNCTION_19_3(v1);
  if (v3)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v4 = (uint64_t)v2;
  uint64_t v5 = *(uint64_t (**)(unsigned char *))(*(void *)v0 + 136);
  swift_retain();
  uint64_t v6 = (uint64_t (*)(unsigned char *, void))v5(v21);
  uint64_t v8 = v7;
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v8;
  uint64_t v20 = *v8;
  *uint64_t v8 = (void *)0x8000000000000000;
  unint64_t v10 = sub_25C9DED4C(v4);
  if (__OFADD__(v9[2], (v11 & 1) == 0))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5E29B8);
  if (sub_25CA45F58())
  {
    unint64_t v14 = sub_25C9DED4C(v4);
    if ((v13 & 1) == (v15 & 1))
    {
      unint64_t v12 = v14;
      goto LABEL_8;
    }
LABEL_15:
    uint64_t result = sub_25CA46218();
    __break(1u);
    return result;
  }
LABEL_8:
  *uint64_t v8 = v20;
  unint64_t v16 = swift_bridgeObjectRelease();
  uint64_t v17 = *v8;
  if ((v13 & 1) == 0) {
    unint64_t v16 = sub_25C9DEE2C(v12, v4, MEMORY[0x263F8EE78], *v8);
  }
  uint64_t v18 = (void *)(v17[7] + 8 * v12);
  MEMORY[0x26119B3D0](v16);
  sub_25C9DED20(*(void *)((*v18 & 0xFFFFFFFFFFFFFF8) + 0x10));
  sub_25CA45BB8();
  sub_25CA45B78();
  return v6(v21, 0);
}

void FeaturizedTurnsByBucketizedTimestamp.addFilteredTurn(featurizedTurn:keyDict:filterOption:)(uint64_t a1, void *a2, int a3)
{
  uint64_t v4 = v3;
  int v35 = a3;
  uint64_t v7 = sub_25CA45748();
  uint64_t v34 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v10);
  double v12 = (*(double (**)(uint64_t, uint64_t))(v11 + 40))(v10, v11);
  char v13 = *(double (**)(void))(*(void *)v3 + 96);
  if (v12 != v13())
  {
    uint64_t v33 = a1;
    uint64_t v15 = defaultLogger.unsafeMutableAddressor();
    uint64_t v16 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v9, v15, v7);
    uint64_t v17 = sub_25CA45728();
    os_log_type_t v18 = sub_25CA45C88();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25C9C5000, v17, v18, "Bucket sizes for two TimeBasedDictionary objects are not the same. Set its own time buckets the same as the other", v19, 2u);
      MEMORY[0x26119C210](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v7);
    uint64_t v20 = a2[3];
    uint64_t v21 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v20);
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 40))(v20, v21);
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 104))(v22);
    a1 = v33;
  }
  double v23 = *(double *)(a1 + 40);
  double v24 = ((double (*)(uint64_t))v13)(v14);
  double v25 = OUTLINED_FUNCTION_19_3(v24);
  if (v26)
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v25 <= -9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v25 >= 9.22337204e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  Swift::Int v27 = (uint64_t)v25;
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  if (TimeBasedDictionary.exists(key:)(v27))
  {
LABEL_21:
    (*(void (**)(uint64_t, double))(*(void *)v4 + 160))(a1, v23);
    swift_retain();
    return;
  }
  if (sub_25C9DDCD0())
  {
    sub_25C9CFF6C((uint64_t)a2, (uint64_t)v37);
  }
  else
  {
    char v28 = sub_25C9DDCD0();
    sub_25C9CFF6C((uint64_t)a2, (uint64_t)v37);
    if ((v28 & 1) == 0)
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
      goto LABEL_16;
    }
  }
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  if (__OFADD__(v27, 1))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  Swift::Bool v29 = TimeBasedDictionary.exists(key:)(v27 + 1);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
  if (v29) {
    goto LABEL_21;
  }
LABEL_16:
  if (sub_25C9DDCD0())
  {
    sub_25C9CFF6C((uint64_t)a2, (uint64_t)v36);
  }
  else
  {
    char v30 = sub_25C9DDCD0();
    sub_25C9CFF6C((uint64_t)a2, (uint64_t)v36);
    if ((v30 & 1) == 0)
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
      return;
    }
  }
  __swift_project_boxed_opaque_existential_1(v36, v36[3]);
  if (__OFSUB__(v27, 1))
  {
LABEL_28:
    __break(1u);
    return;
  }
  Swift::Bool v31 = TimeBasedDictionary.exists(key:)(v27 - 1);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
  if (v31) {
    goto LABEL_21;
  }
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.debugDescription.getter()
{
  sub_25CA45E88();
  uint64_t v1 = sub_25CA45A78();
  (*(void (**)(uint64_t))(*(void *)v0 + 96))(v1);
  sub_25CA45C48();
  sub_25CA45A78();
  type metadata accessor for FeaturizedTurnsByBucketizedTimestamp();
  sub_25CA306C0();
  sub_25CA461C8();
  sub_25CA45A78();
  uint64_t v2 = swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 120))(v2);
  uint64_t v4 = result;
  int64_t v5 = 0;
  uint64_t v6 = result + 64;
  uint64_t v7 = 1 << *(unsigned char *)(result + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(result + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v11 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v5 << 6))
  {
    unint64_t v16 = *(void *)(*(void *)(v4 + 56) + 8 * i);
    sub_25CA458C8();
    sub_25CA45E88();
    swift_bridgeObjectRelease();
    sub_25CA461C8();
    sub_25CA45A78();
    swift_bridgeObjectRelease();
    sub_25CA45A78();
    if (v16 >> 62)
    {
      sub_25CA458C8();
      sub_25CA45FE8();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_25CA461C8();
    sub_25CA45A78();
    swift_bridgeObjectRelease();
    sub_25CA45A78();
    sub_25CA45A78();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v10) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v9 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v10)
  {
LABEL_23:
    swift_release();
    sub_25CA458C8();
    sub_25CA45A78();
    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FeaturizedTurnsByBucketizedTimestamp.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25CA44F18()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_25CA44F5C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t (*sub_25CA44FA0(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(**(void **)v1 + 136))();
  return sub_25C9DEB98;
}

uint64_t sub_25CA4501C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96))();
}

uint64_t sub_25CA45060()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104))();
}

uint64_t (*sub_25CA450A4(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(**(void **)v1 + 112))();
  return sub_25C9DEB98;
}

uint64_t sub_25CA45120@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 144))();
  *a1 = result;
  return result;
}

uint64_t sub_25CA45158()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25CA45168()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25CA45178()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25CA45188()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_25CA45198()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_25CA451A8()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_25CA451B8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25CA451C8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25CA451D8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25CA451E8()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_25CA451F8()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_25CA45208()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_25CA45218()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_25CA45228()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25CA45238()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25CA45248()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25CA45258()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25CA45268()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_25CA45278()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_25CA45288()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_25CA45298()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_25CA452A8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25CA452B8()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_25CA452C8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25CA452D8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25CA452E8()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25CA452F8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25CA45308()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25CA45318()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25CA45328()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25CA45338()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25CA45348()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25CA45358()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_25CA45368()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_25CA45378()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_25CA45388()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25CA45398()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_25CA453A8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_25CA453B8()
{
  return MEMORY[0x270EF0098]();
}

uint64_t sub_25CA453C8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_25CA453D8()
{
  return MEMORY[0x270EF00D8]();
}

uint64_t sub_25CA453E8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25CA453F8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25CA45408()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25CA45418()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25CA45428()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25CA45438()
{
  return MEMORY[0x270EF07D0]();
}

uint64_t sub_25CA45448()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25CA45458()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25CA45468()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25CA45478()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25CA45488()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25CA45498()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25CA454A8()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25CA454B8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25CA454C8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25CA454D8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25CA454E8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25CA454F8()
{
  return MEMORY[0x270EF0D20]();
}

uint64_t sub_25CA45508()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_25CA45518()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_25CA45528()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_25CA45538()
{
  return MEMORY[0x270EF1220]();
}

uint64_t sub_25CA45548()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_25CA45558()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25CA45568()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_25CA45578()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25CA45588()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25CA45598()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_25CA455A8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25CA455B8()
{
  return MEMORY[0x270F10B28]();
}

uint64_t sub_25CA455C8()
{
  return MEMORY[0x270F10B60]();
}

uint64_t sub_25CA455D8()
{
  return MEMORY[0x270F701B0]();
}

uint64_t sub_25CA455E8()
{
  return MEMORY[0x270F701B8]();
}

uint64_t sub_25CA455F8()
{
  return MEMORY[0x270F70290]();
}

uint64_t sub_25CA45608()
{
  return MEMORY[0x270F70298]();
}

uint64_t sub_25CA45618()
{
  return MEMORY[0x270F702A0]();
}

uint64_t sub_25CA45628()
{
  return MEMORY[0x270F70308]();
}

uint64_t sub_25CA45638()
{
  return MEMORY[0x270F70318]();
}

uint64_t sub_25CA45648()
{
  return MEMORY[0x270F70320]();
}

uint64_t sub_25CA45658()
{
  return MEMORY[0x270F70328]();
}

uint64_t sub_25CA45668()
{
  return MEMORY[0x270F70530]();
}

uint64_t sub_25CA45678()
{
  return MEMORY[0x270F705D0]();
}

uint64_t sub_25CA45688()
{
  return MEMORY[0x270F705D8]();
}

uint64_t sub_25CA45698()
{
  return MEMORY[0x270F705E0]();
}

uint64_t sub_25CA456A8()
{
  return MEMORY[0x270F705F0]();
}

uint64_t sub_25CA456B8()
{
  return MEMORY[0x270F70678]();
}

uint64_t sub_25CA456C8()
{
  return MEMORY[0x270F70690]();
}

uint64_t sub_25CA456D8()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_25CA456E8()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_25CA45718()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_25CA45728()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25CA45738()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25CA45748()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25CA45758()
{
  return MEMORY[0x270FA08B8]();
}

uint64_t sub_25CA45768()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_25CA45778()
{
  return MEMORY[0x270FA0908]();
}

uint64_t sub_25CA45788()
{
  return MEMORY[0x270FA0918]();
}

uint64_t sub_25CA45798()
{
  return MEMORY[0x270FA0928]();
}

uint64_t sub_25CA457A8()
{
  return MEMORY[0x270FA0930]();
}

uint64_t sub_25CA457B8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25CA457C8()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_25CA457D8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25CA457E8()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_25CA457F8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25CA45808()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_25CA45818()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25CA45828()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25CA45838()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25CA45848()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_25CA45858()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_25CA45868()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25CA45878()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25CA45888()
{
  return MEMORY[0x270F9D088]();
}

uint64_t sub_25CA45898()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25CA458A8()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_25CA458B8()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_25CA458C8()
{
  return MEMORY[0x270F9D0F0]();
}

uint64_t sub_25CA458D8()
{
  return MEMORY[0x270F9D120]();
}

uint64_t sub_25CA458E8()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25CA458F8()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25CA45908()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_25CA45918()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_25CA45928()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25CA45938()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25CA45948()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25CA45958()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25CA45968()
{
  return MEMORY[0x270EF18A8]();
}

uint64_t sub_25CA45978()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25CA45988()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25CA45998()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25CA459A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25CA459B8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25CA459D8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25CA459E8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25CA459F8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25CA45A08()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25CA45A18()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25CA45A28()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25CA45A38()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25CA45A48()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25CA45A58()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25CA45A68()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_25CA45A78()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25CA45A88()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25CA45A98()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_25CA45AA8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25CA45AB8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25CA45AC8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25CA45AD8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25CA45AE8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25CA45AF8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25CA45B08()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_25CA45B18()
{
  return MEMORY[0x270F9DA00]();
}

uint64_t sub_25CA45B28()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_25CA45B38()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25CA45B48()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25CA45B58()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25CA45B68()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25CA45B78()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25CA45B88()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25CA45B98()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_25CA45BA8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25CA45BB8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25CA45BC8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_25CA45BD8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25CA45BE8()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_25CA45BF8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25CA45C18()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25CA45C28()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25CA45C38()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25CA45C48()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25CA45C58()
{
  return MEMORY[0x270F66220]();
}

uint64_t sub_25CA45C68()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25CA45C78()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25CA45C88()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25CA45C98()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25CA45CA8()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25CA45CB8()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_25CA45CC8()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_25CA45CD8()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_25CA45CE8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25CA45CF8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25CA45D08()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25CA45D18()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25CA45D28()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25CA45D38()
{
  return MEMORY[0x270FA0DC8]();
}

uint64_t sub_25CA45D48()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_25CA45D58()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_25CA45D68()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_25CA45D78()
{
  return MEMORY[0x270F66270]();
}

uint64_t sub_25CA45D88()
{
  return MEMORY[0x270F662B0]();
}

uint64_t sub_25CA45D98()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_25CA45DA8()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_25CA45DB8()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_25CA45DC8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25CA45DD8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25CA45DE8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25CA45DF8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25CA45E08()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25CA45E18()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25CA45E28()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25CA45E38()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25CA45E48()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25CA45E58()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25CA45E68()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25CA45E78()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25CA45E88()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25CA45E98()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25CA45EA8()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_25CA45EB8()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_25CA45EC8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25CA45ED8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25CA45EE8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25CA45EF8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25CA45F08()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25CA45F18()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25CA45F28()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25CA45F38()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_25CA45F48()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25CA45F58()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25CA45F68()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_25CA45F78()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_25CA45F88()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25CA45F98()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_25CA45FA8()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_25CA45FB8()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_25CA45FC8()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_25CA45FD8()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_25CA45FE8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25CA45FF8()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_25CA46008()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25CA46018()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25CA46028()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_25CA46048()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25CA46058()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25CA46068()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25CA46078()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25CA46088()
{
  return MEMORY[0x270F9F288]();
}

uint64_t sub_25CA46098()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25CA460A8()
{
  return MEMORY[0x270F9F2B8]();
}

uint64_t sub_25CA460B8()
{
  return MEMORY[0x270F9F2D8]();
}

uint64_t sub_25CA460C8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_25CA460D8()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25CA460E8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25CA460F8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25CA46108()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_25CA46118()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25CA46128()
{
  return MEMORY[0x270F9F3C8]();
}

uint64_t sub_25CA46138()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25CA46158()
{
  return MEMORY[0x270F9F410]();
}

uint64_t sub_25CA46168()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_25CA46178()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25CA46188()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25CA461A8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25CA461B8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25CA461C8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25CA461D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25CA461E8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25CA461F8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25CA46208()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25CA46218()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25CA46228()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25CA46238()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25CA46248()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25CA46258()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25CA46268()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25CA46278()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25CA46288()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25CA46298()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25CA462A8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25CA462B8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}