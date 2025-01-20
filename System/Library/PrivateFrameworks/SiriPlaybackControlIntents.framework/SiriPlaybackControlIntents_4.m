id sub_232A529E4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShuffleState_, *a1);
}

void sub_232A529F8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A52A2C(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_232A52A60@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mediaType);
  *a2 = result;
  return result;
}

id sub_232A52A94(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaType_, *a1);
}

void sub_232A52AA8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A52ADC(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_232A52B10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232A52100();
  *a1 = result;
  return result;
}

uint64_t sub_232A52B3C(uint64_t *a1)
{
  return sub_232A52170(*a1);
}

ValueMetadata *type metadata accessor for SetShuffleStateIntentResponseCode()
{
  return &type metadata for SetShuffleStateIntentResponseCode;
}

uint64_t method lookup function for SetShuffleStateIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetShuffleStateIntentResponse);
}

uint64_t dispatch thunk of SetShuffleStateIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for SetShuffleStateDevicesUnsupportedReason()
{
  return &type metadata for SetShuffleStateDevicesUnsupportedReason;
}

uint64_t method lookup function for SetShuffleStateDevicesResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetShuffleStateDevicesResolutionResult);
}

uint64_t dispatch thunk of static SetShuffleStateDevicesResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

char *SetRepeatStateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return SetRepeatStateIntentResponse.init(code:userActivity:)(a1, a2);
}

id SetRepeatStateIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SetRepeatStateIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetRepeatStateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetRepeatStateIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetRepeatStateIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRepeatStateIntent();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetRepeatStateIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id SetRepeatStateIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SetRepeatStateIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id SetRepeatStateIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetRepeatStateIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SetRepeatStateIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetRepeatStateIntent.__deallocating_deinit()
{
  return sub_232A53910(type metadata accessor for SetRepeatStateIntent);
}

unint64_t SetRepeatStateIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result == 100) {
    uint64_t v1 = 100;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_232A53154@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SetRepeatStateIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_232A531AC()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetRepeatStateIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_232A5321C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___SetRepeatStateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *SetRepeatStateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___SetRepeatStateIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetRepeatStateIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetRepeatStateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetRepeatStateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetRepeatStateIntentResponse()
{
  return self;
}

id SetRepeatStateIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetRepeatStateIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRepeatStateIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetRepeatStateIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id SetRepeatStateIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetRepeatStateIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRepeatStateIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetRepeatStateIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id SetRepeatStateIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SetRepeatStateIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRepeatStateIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id SetRepeatStateIntentResponse.__deallocating_deinit()
{
  return sub_232A53910(type metadata accessor for SetRepeatStateIntentResponse);
}

uint64_t SetRepeatStateDevicesUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t sub_232A536C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SetRepeatStateDevicesUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id SetRepeatStateDevicesResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id SetRepeatStateDevicesResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SetRepeatStateDevicesResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for SetRepeatStateDevicesResolutionResult()
{
  return self;
}

id SetRepeatStateDevicesResolutionResult.__deallocating_deinit()
{
  return sub_232A53910(type metadata accessor for SetRepeatStateDevicesResolutionResult);
}

id sub_232A53910(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_232A5394C()
{
  unint64_t result = qword_268726A70;
  if (!qword_268726A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726A70);
  }
  return result;
}

unint64_t sub_232A5399C()
{
  unint64_t result = qword_268726A78;
  if (!qword_268726A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726A78);
  }
  return result;
}

void sub_232A539E8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A53A1C(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_repeatState()
{
  return sel_repeatState;
}

id sub_232A53A5C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_repeatState);
  *a2 = result;
  return result;
}

id sub_232A53A90(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRepeatState_, *a1);
}

void sub_232A53AA4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A53AD8(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_232A53B0C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mediaType);
  *a2 = result;
  return result;
}

id sub_232A53B40(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaType_, *a1);
}

void sub_232A53B54(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A53B88(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_232A53BBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232A531AC();
  *a1 = result;
  return result;
}

uint64_t sub_232A53BE8(uint64_t *a1)
{
  return sub_232A5321C(*a1);
}

ValueMetadata *type metadata accessor for SetRepeatStateIntentResponseCode()
{
  return &type metadata for SetRepeatStateIntentResponseCode;
}

uint64_t method lookup function for SetRepeatStateIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetRepeatStateIntentResponse);
}

uint64_t dispatch thunk of SetRepeatStateIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for SetRepeatStateDevicesUnsupportedReason()
{
  return &type metadata for SetRepeatStateDevicesUnsupportedReason;
}

uint64_t method lookup function for SetRepeatStateDevicesResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetRepeatStateDevicesResolutionResult);
}

uint64_t dispatch thunk of static SetRepeatStateDevicesResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

char *GetVolumeLevelIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return GetVolumeLevelIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetVolumeLevelIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t GetVolumeLevelDeviceUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 7) < 0xFFFFFFFFFFFFFFFALL) {
    return 0;
  }
  return result;
}

id GetVolumeLevelIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetVolumeLevelIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetVolumeLevelIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetVolumeLevelIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for GetVolumeLevelIntent();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id GetVolumeLevelIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id GetVolumeLevelIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for GetVolumeLevelIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id GetVolumeLevelIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id GetVolumeLevelIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for GetVolumeLevelIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id GetVolumeLevelIntent.__deallocating_deinit()
{
  return sub_232A549E8(type metadata accessor for GetVolumeLevelIntent);
}

unint64_t GetVolumeLevelIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result == 100) {
    uint64_t v1 = 100;
  }
  else {
    uint64_t v1 = 0;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_232A54214@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = GetVolumeLevelIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id sub_232A54248@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_currentVolumeLevel);
  *a2 = result;
  return result;
}

uint64_t sub_232A542A8()
{
  uint64_t v1 = v0 + OBJC_IVAR___GetVolumeLevelIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_232A54318(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___GetVolumeLevelIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *GetVolumeLevelIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___GetVolumeLevelIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetVolumeLevelIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___GetVolumeLevelIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetVolumeLevelIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetVolumeLevelIntentResponse()
{
  return self;
}

id GetVolumeLevelIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___GetVolumeLevelIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for GetVolumeLevelIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id GetVolumeLevelIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id GetVolumeLevelIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___GetVolumeLevelIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for GetVolumeLevelIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id GetVolumeLevelIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id GetVolumeLevelIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___GetVolumeLevelIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for GetVolumeLevelIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id GetVolumeLevelIntentResponse.__deallocating_deinit()
{
  return sub_232A549E8(type metadata accessor for GetVolumeLevelIntentResponse);
}

uint64_t sub_232A547A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = GetVolumeLevelDeviceUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id GetVolumeLevelDeviceResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id GetVolumeLevelDeviceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for GetVolumeLevelDeviceResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for GetVolumeLevelDeviceResolutionResult()
{
  return self;
}

id GetVolumeLevelDeviceResolutionResult.__deallocating_deinit()
{
  return sub_232A549E8(type metadata accessor for GetVolumeLevelDeviceResolutionResult);
}

id sub_232A549E8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_232A54A24()
{
  unint64_t result = qword_268726A88;
  if (!qword_268726A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726A88);
  }
  return result;
}

unint64_t sub_232A54A74()
{
  unint64_t result = qword_268726A90;
  if (!qword_268726A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726A90);
  }
  return result;
}

id sub_232A54AC4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDevice_, *a1);
}

void sub_232A54AD8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A54B0C(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_232A54B40(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A54B74(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_currentVolumeLevel()
{
  return sel_currentVolumeLevel;
}

id sub_232A54BB8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCurrentVolumeLevel_, *a1);
}

uint64_t sub_232A54BCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232A542A8();
  *a1 = result;
  return result;
}

uint64_t sub_232A54BF8(uint64_t *a1)
{
  return sub_232A54318(*a1);
}

ValueMetadata *type metadata accessor for GetVolumeLevelIntentResponseCode()
{
  return &type metadata for GetVolumeLevelIntentResponseCode;
}

uint64_t method lookup function for GetVolumeLevelIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GetVolumeLevelIntentResponse);
}

uint64_t dispatch thunk of GetVolumeLevelIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for GetVolumeLevelDeviceUnsupportedReason()
{
  return &type metadata for GetVolumeLevelDeviceUnsupportedReason;
}

uint64_t method lookup function for GetVolumeLevelDeviceResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GetVolumeLevelDeviceResolutionResult);
}

uint64_t dispatch thunk of static GetVolumeLevelDeviceResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

char *SetVolumeLevelIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return SetVolumeLevelIntentResponse.init(code:userActivity:)(a1, a2);
}

uint64_t SetVolumeLevelDevicesUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 6) < 0xFFFFFFFFFFFFFFFBLL) {
    return 0;
  }
  return result;
}

uint64_t SetVolumeLevelVolumeLevelUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  return result;
}

id SetVolumeLevelIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id sub_232A54D68@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_volumeLevel);
  *a2 = result;
  return result;
}

id SetVolumeLevelIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetVolumeLevelIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetVolumeLevelIntent();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetVolumeLevelIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id SetVolumeLevelIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetVolumeLevelIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SetVolumeLevelIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetVolumeLevelIntent.__deallocating_deinit()
{
  return sub_232A556A4(type metadata accessor for SetVolumeLevelIntent);
}

unint64_t SetVolumeLevelIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result - 100 >= 3) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_232A55140@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SetVolumeLevelIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id SetVolumeLevelIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetVolumeLevelIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetVolumeLevelIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetVolumeLevelIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id SetVolumeLevelIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id SetVolumeLevelIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SetVolumeLevelIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetVolumeLevelIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id SetVolumeLevelIntentResponse.__deallocating_deinit()
{
  return sub_232A556A4(type metadata accessor for SetVolumeLevelIntentResponse);
}

uint64_t sub_232A55410@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SetVolumeLevelDevicesUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id SetVolumeLevelDevicesResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A55574(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for SetVolumeLevelDevicesResolutionResult);
}

id SetVolumeLevelDevicesResolutionResult.__deallocating_deinit()
{
  return sub_232A556A4(type metadata accessor for SetVolumeLevelDevicesResolutionResult);
}

uint64_t sub_232A554E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SetVolumeLevelVolumeLevelUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id SetVolumeLevelVolumeLevelResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A55574(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for SetVolumeLevelVolumeLevelResolutionResult);
}

id sub_232A55574(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (void *)sub_232A684E8();
  uint64_t v7 = swift_bridgeObjectRelease();
  v11.receiver = v3;
  v11.super_class = (Class)a3(v7);
  id v8 = objc_msgSendSuper2(&v11, sel_initWithJSONDictionary_forIntent_, v6, a2);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

id SetVolumeLevelVolumeLevelResolutionResult.__deallocating_deinit()
{
  return sub_232A556A4(type metadata accessor for SetVolumeLevelVolumeLevelResolutionResult);
}

id sub_232A556A4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_232A556E0()
{
  unint64_t result = qword_268726AA0;
  if (!qword_268726AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AA0);
  }
  return result;
}

unint64_t sub_232A55730()
{
  unint64_t result = qword_268726AA8;
  if (!qword_268726AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AA8);
  }
  return result;
}

unint64_t sub_232A55780()
{
  unint64_t result = qword_268726AB0;
  if (!qword_268726AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AB0);
  }
  return result;
}

void sub_232A557CC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A55800(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_232A55834(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A55868(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_volumeLevel()
{
  return sel_volumeLevel;
}

char *keypath_get_selector_settingAttribute()
{
  return sel_settingAttribute;
}

id sub_232A558B8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_settingAttribute);
  *a2 = result;
  return result;
}

id sub_232A558EC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSettingAttribute_, *a1);
}

void sub_232A55900(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A55934(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_232A5596C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVolumeLevel_, *a1);
}

uint64_t sub_232A55980@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232843B28();
  *a1 = result;
  return result;
}

uint64_t sub_232A559AC(uint64_t *a1)
{
  return sub_232843AB8(*a1);
}

void type metadata accessor for SetVolumeLevelIntentResponseCode()
{
}

uint64_t method lookup function for SetVolumeLevelIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetVolumeLevelIntentResponse);
}

uint64_t dispatch thunk of SetVolumeLevelIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

void type metadata accessor for SetVolumeLevelDevicesUnsupportedReason()
{
}

uint64_t method lookup function for SetVolumeLevelDevicesResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetVolumeLevelDevicesResolutionResult);
}

uint64_t dispatch thunk of static SetVolumeLevelDevicesResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for SetVolumeLevelVolumeLevelUnsupportedReason()
{
}

uint64_t method lookup function for SetVolumeLevelVolumeLevelResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetVolumeLevelVolumeLevelResolutionResult);
}

uint64_t dispatch thunk of static SetVolumeLevelVolumeLevelResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_232A55AAC()
{
  return sub_232A56EF4(v0, (SEL *)&selRef_deviceContext, (void (*)(void))type metadata accessor for DeviceContext);
}

void sub_232A55AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

char *AddSpeakerIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return AddSpeakerIntentResponse.init(code:userActivity:)(a1, a2);
}

id AddSpeakerIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t AddSpeakerSourceUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  return result;
}

uint64_t AddSpeakerDestinationsUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL) {
    return 0;
  }
  return result;
}

uint64_t sub_232A55BAC()
{
  return sub_232A56EF4(v0, (SEL *)&selRef_deviceQueries, (void (*)(void))type metadata accessor for DeviceQuery);
}

void sub_232A55BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_232A55C04(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), SEL *a5)
{
  if (a1)
  {
    a4(0);
    id v7 = (id)sub_232A68648();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  objc_msgSend(v5, *a5, v7);
}

id sub_232A55C8C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_source);
  *a2 = result;
  return result;
}

void sub_232A55CC8(id *a1@<X0>, SEL *a2@<X3>, void (*a3)(void)@<X4>, uint64_t *a4@<X8>)
{
  id v6 = [*a1 *a2];
  if (v6)
  {
    id v7 = v6;
    a3(0);
    uint64_t v8 = sub_232A68658();
  }
  else
  {
    uint64_t v8 = 0;
  }
  *a4 = v8;
}

void sub_232A55D3C(void *a1, void **a2, uint64_t a3, uint64_t a4, void (*a5)(void), SEL *a6)
{
  id v7 = *a2;
  if (*a1)
  {
    a5(0);
    uint64_t v8 = sub_232A68648();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  [v7 *a6];
}

id AddSpeakerIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddSpeakerIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id AddSpeakerIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id AddSpeakerIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for AddSpeakerIntent();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id AddSpeakerIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id AddSpeakerIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AddSpeakerIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id AddSpeakerIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id AddSpeakerIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for AddSpeakerIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id AddSpeakerIntent.__deallocating_deinit()
{
  return sub_232A56AC0(type metadata accessor for AddSpeakerIntent);
}

unint64_t AddSpeakerIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result - 100 >= 4) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_232A56294@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = AddSpeakerIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_232A562EC()
{
  uint64_t v1 = v0 + OBJC_IVAR___AddSpeakerIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_232A5635C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___AddSpeakerIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *AddSpeakerIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___AddSpeakerIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id AddSpeakerIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___AddSpeakerIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddSpeakerIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for AddSpeakerIntentResponse()
{
  return self;
}

id AddSpeakerIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___AddSpeakerIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for AddSpeakerIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id AddSpeakerIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id AddSpeakerIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___AddSpeakerIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for AddSpeakerIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id AddSpeakerIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id AddSpeakerIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___AddSpeakerIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for AddSpeakerIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id AddSpeakerIntentResponse.__deallocating_deinit()
{
  return sub_232A56AC0(type metadata accessor for AddSpeakerIntentResponse);
}

uint64_t sub_232A567E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = AddSpeakerSourceUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id AddSpeakerSourceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A5696C(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AddSpeakerSourceResolutionResult);
}

uint64_t type metadata accessor for AddSpeakerSourceResolutionResult()
{
  return self;
}

id AddSpeakerSourceResolutionResult.__deallocating_deinit()
{
  return sub_232A56AC0(type metadata accessor for AddSpeakerSourceResolutionResult);
}

uint64_t sub_232A5691C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = AddSpeakerDestinationsUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id AddSpeakerDestinationsResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A5696C(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AddSpeakerDestinationsResolutionResult);
}

id sub_232A5696C(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (void *)sub_232A684E8();
  uint64_t v7 = swift_bridgeObjectRelease();
  v11.receiver = v3;
  v11.super_class = (Class)a3(v7);
  id v8 = objc_msgSendSuper2(&v11, sel_initWithJSONDictionary_forIntent_, v6, a2);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

uint64_t type metadata accessor for AddSpeakerDestinationsResolutionResult()
{
  return self;
}

id AddSpeakerDestinationsResolutionResult.__deallocating_deinit()
{
  return sub_232A56AC0(type metadata accessor for AddSpeakerDestinationsResolutionResult);
}

id sub_232A56AC0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_232A56AFC()
{
  unint64_t result = qword_268726AC0;
  if (!qword_268726AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AC0);
  }
  return result;
}

unint64_t sub_232A56B4C()
{
  unint64_t result = qword_268726AC8;
  if (!qword_268726AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AC8);
  }
  return result;
}

unint64_t sub_232A56B9C()
{
  unint64_t result = qword_268726AD0;
  if (!qword_268726AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AD0);
  }
  return result;
}

void sub_232A56BE8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A56C1C(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_232A56C50(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A56C84(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_232A56CB8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mediaType);
  *a2 = result;
  return result;
}

id sub_232A56CEC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaType_, *a1);
}

char *keypath_get_selector_source()
{
  return sel_source;
}

id sub_232A56D10(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSource_, *a1);
}

char *keypath_get_selector_destinations()
{
  return sel_destinations;
}

void sub_232A56D30(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A56D64(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_232A56D98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232A562EC();
  *a1 = result;
  return result;
}

uint64_t sub_232A56DC4(uint64_t *a1)
{
  return sub_232A5635C(*a1);
}

void type metadata accessor for AddSpeakerIntentResponseCode()
{
}

uint64_t method lookup function for AddSpeakerIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AddSpeakerIntentResponse);
}

uint64_t dispatch thunk of AddSpeakerIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

void type metadata accessor for AddSpeakerSourceUnsupportedReason()
{
}

uint64_t method lookup function for AddSpeakerSourceResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AddSpeakerSourceResolutionResult);
}

uint64_t dispatch thunk of static AddSpeakerSourceResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for AddSpeakerDestinationsUnsupportedReason()
{
}

uint64_t method lookup function for AddSpeakerDestinationsResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AddSpeakerDestinationsResolutionResult);
}

uint64_t dispatch thunk of static AddSpeakerDestinationsResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_232A56EB4(void *a1)
{
  return sub_232A56EF4(a1, (SEL *)&selRef_deviceContext, (void (*)(void))type metadata accessor for DeviceContext);
}

uint64_t sub_232A56ED4(void *a1)
{
  return sub_232A56EF4(a1, (SEL *)&selRef_deviceQueries, (void (*)(void))type metadata accessor for DeviceQuery);
}

uint64_t sub_232A56EF4(void *a1, SEL *a2, void (*a3)(void))
{
  id v4 = [a1 *a2];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  a3(0);
  uint64_t v6 = sub_232A68658();

  return v6;
}

id MoveSpeakerIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t MoveSpeakerSourceUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  return result;
}

uint64_t MoveSpeakerDestinationsUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL) {
    return 0;
  }
  return result;
}

char *MoveSpeakerIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return MoveSpeakerIntentResponse.init(code:userActivity:)(a1, a2);
}

id MoveSpeakerIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MoveSpeakerIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id MoveSpeakerIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id MoveSpeakerIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for MoveSpeakerIntent();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id MoveSpeakerIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id MoveSpeakerIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for MoveSpeakerIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id MoveSpeakerIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id MoveSpeakerIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for MoveSpeakerIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id MoveSpeakerIntent.__deallocating_deinit()
{
  return sub_232A57D0C(type metadata accessor for MoveSpeakerIntent);
}

unint64_t MoveSpeakerIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result - 100 >= 3) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_232A574E0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = MoveSpeakerIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_232A57538()
{
  uint64_t v1 = v0 + OBJC_IVAR___MoveSpeakerIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_232A575A8(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___MoveSpeakerIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *MoveSpeakerIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___MoveSpeakerIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id MoveSpeakerIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___MoveSpeakerIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MoveSpeakerIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for MoveSpeakerIntentResponse()
{
  return self;
}

id MoveSpeakerIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___MoveSpeakerIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for MoveSpeakerIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id MoveSpeakerIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id MoveSpeakerIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___MoveSpeakerIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for MoveSpeakerIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id MoveSpeakerIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id MoveSpeakerIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___MoveSpeakerIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for MoveSpeakerIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id MoveSpeakerIntentResponse.__deallocating_deinit()
{
  return sub_232A57D0C(type metadata accessor for MoveSpeakerIntentResponse);
}

uint64_t sub_232A57A30@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = MoveSpeakerSourceUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id MoveSpeakerSourceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A57BB8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for MoveSpeakerSourceResolutionResult);
}

uint64_t type metadata accessor for MoveSpeakerSourceResolutionResult()
{
  return self;
}

id MoveSpeakerSourceResolutionResult.__deallocating_deinit()
{
  return sub_232A57D0C(type metadata accessor for MoveSpeakerSourceResolutionResult);
}

uint64_t sub_232A57B68@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = MoveSpeakerDestinationsUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id MoveSpeakerDestinationsResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A57BB8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for MoveSpeakerDestinationsResolutionResult);
}

id sub_232A57BB8(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (void *)sub_232A684E8();
  uint64_t v7 = swift_bridgeObjectRelease();
  v11.receiver = v3;
  v11.super_class = (Class)a3(v7);
  id v8 = objc_msgSendSuper2(&v11, sel_initWithJSONDictionary_forIntent_, v6, a2);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

uint64_t type metadata accessor for MoveSpeakerDestinationsResolutionResult()
{
  return self;
}

id MoveSpeakerDestinationsResolutionResult.__deallocating_deinit()
{
  return sub_232A57D0C(type metadata accessor for MoveSpeakerDestinationsResolutionResult);
}

id sub_232A57D0C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_232A57D48()
{
  unint64_t result = qword_268726AE0;
  if (!qword_268726AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AE0);
  }
  return result;
}

unint64_t sub_232A57D98()
{
  unint64_t result = qword_268726AE8;
  if (!qword_268726AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AE8);
  }
  return result;
}

unint64_t sub_232A57DE8()
{
  unint64_t result = qword_268726AF0;
  if (!qword_268726AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726AF0);
  }
  return result;
}

void sub_232A57E34(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A57E68(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_232A57E9C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A57ED0(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_232A57F04@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_mediaType);
  *a2 = result;
  return result;
}

id sub_232A57F38(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaType_, *a1);
}

id sub_232A57F50(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSource_, *a1);
}

void sub_232A57F64(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A57F98(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_232A57FCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232A57538();
  *a1 = result;
  return result;
}

uint64_t sub_232A57FF8(uint64_t *a1)
{
  return sub_232A575A8(*a1);
}

void type metadata accessor for MoveSpeakerIntentResponseCode()
{
}

uint64_t method lookup function for MoveSpeakerIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MoveSpeakerIntentResponse);
}

uint64_t dispatch thunk of MoveSpeakerIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

void type metadata accessor for MoveSpeakerSourceUnsupportedReason()
{
}

uint64_t method lookup function for MoveSpeakerSourceResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MoveSpeakerSourceResolutionResult);
}

uint64_t dispatch thunk of static MoveSpeakerSourceResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for MoveSpeakerDestinationsUnsupportedReason()
{
}

uint64_t method lookup function for MoveSpeakerDestinationsResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MoveSpeakerDestinationsResolutionResult);
}

uint64_t dispatch thunk of static MoveSpeakerDestinationsResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

id SetRoomDimmingStateIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SetRoomDimmingStateIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetRoomDimmingStateIntent()
{
  return self;
}

id SetRoomDimmingStateIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetRoomDimmingStateIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntent();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetRoomDimmingStateIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id SetRoomDimmingStateIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id SetRoomDimmingStateIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetRoomDimmingStateIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetRoomDimmingStateIntent.__deallocating_deinit()
{
  return sub_232A58BA0(type metadata accessor for SetRoomDimmingStateIntent);
}

unint64_t SetRoomDimmingStateIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

unint64_t sub_232A58610@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SetRoomDimmingStateIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_232A58668()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetRoomDimmingStateIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_232A586D8(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___SetRoomDimmingStateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *SetRoomDimmingStateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return SetRoomDimmingStateIntentResponse.init(code:userActivity:)(a1, a2);
}

char *SetRoomDimmingStateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___SetRoomDimmingStateIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetRoomDimmingStateIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetRoomDimmingStateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetRoomDimmingStateIntentResponse()
{
  return self;
}

id SetRoomDimmingStateIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetRoomDimmingStateIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetRoomDimmingStateIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id SetRoomDimmingStateIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetRoomDimmingStateIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetRoomDimmingStateIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id SetRoomDimmingStateIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SetRoomDimmingStateIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetRoomDimmingStateIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id SetRoomDimmingStateIntentResponse.__deallocating_deinit()
{
  return sub_232A58BA0(type metadata accessor for SetRoomDimmingStateIntentResponse);
}

id sub_232A58BA0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_232A58BDC()
{
  unint64_t result = qword_268726B00;
  if (!qword_268726B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B00);
  }
  return result;
}

char *keypath_get_selector_roomDimmingState()
{
  return sel_roomDimmingState;
}

id sub_232A58C34@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_roomDimmingState);
  *a2 = result;
  return result;
}

id sub_232A58C68(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRoomDimmingState_, *a1);
}

uint64_t sub_232A58C7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232A58668();
  *a1 = result;
  return result;
}

uint64_t sub_232A58CA8(uint64_t *a1)
{
  return sub_232A586D8(*a1);
}

ValueMetadata *type metadata accessor for SetRoomDimmingStateIntentResponseCode()
{
  return &type metadata for SetRoomDimmingStateIntentResponseCode;
}

uint64_t method lookup function for SetRoomDimmingStateIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetRoomDimmingStateIntentResponse);
}

uint64_t dispatch thunk of SetRoomDimmingStateIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

id SetPlaybackSpeedIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t SetPlaybackSpeedSpeedMagnitudeUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v1 = 2;
  }
  else {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

char *SetPlaybackSpeedIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return SetPlaybackSpeedIntentResponse.init(code:userActivity:)(a1, a2);
}

void sub_232A58DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v7 = (void *)OUTLINED_FUNCTION_0_47(a1);
  id v9 = [v7 *v8];
  if (v9)
  {
    v10 = v9;
    a5(0);
    uint64_t v11 = sub_232A68658();
  }
  else
  {
    uint64_t v11 = 0;
  }
  *id v5 = v11;
}

id SetPlaybackSpeedIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetPlaybackSpeedIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetPlaybackSpeedIntent.init(coder:)(void *a1)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntent();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetPlaybackSpeedIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  return v7;
}

id SetPlaybackSpeedIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntent();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_backingStore_, v5, a3);

  return v6;
}

id SetPlaybackSpeedIntent.__allocating_init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(objc_allocWithZone(v0), sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetPlaybackSpeedIntent.init(domain:verb:parametersByName:)()
{
  objc_super v2 = (void *)OUTLINED_FUNCTION_1_61();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v4 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntent();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithDomain_verb_parametersByName_, v2, v3, v4);

  return v5;
}

id SetPlaybackSpeedIntent.__deallocating_deinit()
{
  return sub_232A59B7C(type metadata accessor for SetPlaybackSpeedIntent);
}

unint64_t SetPlaybackSpeedIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result - 100 >= 2) {
    unint64_t v1 = 0;
  }
  else {
    unint64_t v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  return result;
}

unint64_t sub_232A5931C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SetPlaybackSpeedIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_232A59374()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetPlaybackSpeedIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_232A593E4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___SetPlaybackSpeedIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

char *SetPlaybackSpeedIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v5 = (char *)objc_msgSend(v2, sel_init);
  id v6 = &v5[OBJC_IVAR___SetPlaybackSpeedIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  objc_super v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for SetPlaybackSpeedIntent()
{
  return self;
}

id SetPlaybackSpeedIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetPlaybackSpeedIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetPlaybackSpeedIntentResponse()
{
  return self;
}

id SetPlaybackSpeedIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetPlaybackSpeedIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithCoder_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetPlaybackSpeedIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v3;
}

id SetPlaybackSpeedIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetPlaybackSpeedIntentResponse_code] = 0;
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithBackingStore_, v3, v4, v5, v6, v7, v8, v11);

  return v9;
}

id SetPlaybackSpeedIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithPropertiesByName_, v2);

  return v3;
}

id SetPlaybackSpeedIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___SetPlaybackSpeedIntentResponse_code] = 0;
  if (a1)
  {
    objc_super v2 = (void *)sub_232A684E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v2 = 0;
  }
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for SetPlaybackSpeedIntentResponse();
  id v9 = OUTLINED_FUNCTION_0_45((uint64_t)v11.super_class, sel_initWithPropertiesByName_, v3, v4, v5, v6, v7, v8, v11);

  if (v9) {
  return v9;
  }
}

id SetPlaybackSpeedIntentResponse.__deallocating_deinit()
{
  return sub_232A59B7C(type metadata accessor for SetPlaybackSpeedIntentResponse);
}

BOOL SetPlaybackSpeedDevicesUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  return a1 == 1;
}

BOOL sub_232A598A0@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL result = SetPlaybackSpeedDevicesUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id SetPlaybackSpeedDevicesResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A59A28(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for SetPlaybackSpeedDevicesResolutionResult);
}

uint64_t type metadata accessor for SetPlaybackSpeedDevicesResolutionResult()
{
  return self;
}

id SetPlaybackSpeedDevicesResolutionResult.__deallocating_deinit()
{
  return sub_232A59B7C(type metadata accessor for SetPlaybackSpeedDevicesResolutionResult);
}

uint64_t sub_232A599D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = SetPlaybackSpeedSpeedMagnitudeUnsupportedReason.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id SetPlaybackSpeedSpeedMagnitudeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  return sub_232A59A28(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for SetPlaybackSpeedSpeedMagnitudeResolutionResult);
}

id sub_232A59A28(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (void *)sub_232A684E8();
  uint64_t v7 = swift_bridgeObjectRelease();
  v11.receiver = v3;
  v11.super_class = (Class)a3(v7);
  id v8 = objc_msgSendSuper2(&v11, sel_initWithJSONDictionary_forIntent_, v6, a2);

  id v9 = v8;
  if (v9) {

  }
  return v9;
}

uint64_t type metadata accessor for SetPlaybackSpeedSpeedMagnitudeResolutionResult()
{
  return self;
}

id SetPlaybackSpeedSpeedMagnitudeResolutionResult.__deallocating_deinit()
{
  return sub_232A59B7C(type metadata accessor for SetPlaybackSpeedSpeedMagnitudeResolutionResult);
}

id sub_232A59B7C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_232A59BB8()
{
  unint64_t result = qword_268726B10;
  if (!qword_268726B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B10);
  }
  return result;
}

unint64_t sub_232A59C08()
{
  unint64_t result = qword_268726B18;
  if (!qword_268726B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B18);
  }
  return result;
}

unint64_t sub_232A59C58()
{
  unint64_t result = qword_268726B20;
  if (!qword_268726B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B20);
  }
  return result;
}

void sub_232A59CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_232A59CD8(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_232A59D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_232A59D40(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_232A59D74(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_mediaType);
  *uint64_t v1 = result;
  return result;
}

id sub_232A59DA4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaType_, *a1);
}

void sub_232A59DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_232A59DEC(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_speedMagnitude()
{
  return sel_speedMagnitude;
}

id sub_232A59E2C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_speedMagnitude);
  *uint64_t v1 = v3;
  return result;
}

id sub_232A59E5C(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSpeedMagnitude_, *a1);
}

char *keypath_get_selector_playbackSpeedType()
{
  return sel_playbackSpeedType;
}

id sub_232A59E7C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_playbackSpeedType);
  *uint64_t v1 = result;
  return result;
}

id sub_232A59EAC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlaybackSpeedType_, *a1);
}

uint64_t sub_232A59EC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232A59374();
  *a1 = result;
  return result;
}

uint64_t sub_232A59EEC(uint64_t *a1)
{
  return sub_232A593E4(*a1);
}

void type metadata accessor for SetPlaybackSpeedIntentResponseCode()
{
}

uint64_t method lookup function for SetPlaybackSpeedIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetPlaybackSpeedIntentResponse);
}

uint64_t dispatch thunk of SetPlaybackSpeedIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

void type metadata accessor for SetPlaybackSpeedDevicesUnsupportedReason()
{
}

uint64_t method lookup function for SetPlaybackSpeedDevicesResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetPlaybackSpeedDevicesResolutionResult);
}

uint64_t dispatch thunk of static SetPlaybackSpeedDevicesResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for SetPlaybackSpeedSpeedMagnitudeUnsupportedReason()
{
}

uint64_t method lookup function for SetPlaybackSpeedSpeedMagnitudeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetPlaybackSpeedSpeedMagnitudeResolutionResult);
}

uint64_t dispatch thunk of static SetPlaybackSpeedSpeedMagnitudeResolutionResult.unsupported(forReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t OUTLINED_FUNCTION_0_47(uint64_t a1)
{
  return *(void *)a1;
}

unint64_t Direction.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5A008@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = Direction.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id sub_232A5A03C(uint64_t a1)
{
  return sub_232A5A094(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id sub_232A5A088(uint64_t a1)
{
  return sub_232A5A094(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_232A5A094(uint64_t a1, SEL *a2)
{
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);
  return v2;
}

id DirectionResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  uint64_t v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DirectionResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DirectionResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for DirectionResolutionResult()
{
  return self;
}

id DirectionResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DirectionResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5A31C()
{
  unint64_t result = qword_268726B28;
  if (!qword_268726B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B28);
  }
  return result;
}

ValueMetadata *type metadata accessor for Direction()
{
  return &type metadata for Direction;
}

uint64_t method lookup function for DirectionResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DirectionResolutionResult);
}

uint64_t dispatch thunk of static DirectionResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DirectionResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t RepeatState.init(rawValue:)(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5A3CC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = RepeatState.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id RepeatStateResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id RepeatStateResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for RepeatStateResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for RepeatStateResolutionResult()
{
  return self;
}

id RepeatStateResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RepeatStateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5A674()
{
  unint64_t result = qword_268726B30;
  if (!qword_268726B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B30);
  }
  return result;
}

ValueMetadata *type metadata accessor for RepeatState()
{
  return &type metadata for RepeatState;
}

uint64_t method lookup function for RepeatStateResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RepeatStateResolutionResult);
}

uint64_t dispatch thunk of static RepeatStateResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static RepeatStateResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t ShuffleState.init(rawValue:)(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5A724@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = ShuffleState.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id ShuffleStateResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id ShuffleStateResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ShuffleStateResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for ShuffleStateResolutionResult()
{
  return self;
}

id ShuffleStateResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShuffleStateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5A9CC()
{
  unint64_t result = qword_268726B38;
  if (!qword_268726B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B38);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShuffleState()
{
  return &type metadata for ShuffleState;
}

uint64_t method lookup function for ShuffleStateResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ShuffleStateResolutionResult);
}

uint64_t dispatch thunk of static ShuffleStateResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static ShuffleStateResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t SubtitleState.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5AA7C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = SubtitleState.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id SubtitleStateResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id SubtitleStateResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SubtitleStateResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for SubtitleStateResolutionResult()
{
  return self;
}

id SubtitleStateResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SubtitleStateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5AD24()
{
  unint64_t result = qword_268726B40;
  if (!qword_268726B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B40);
  }
  return result;
}

ValueMetadata *type metadata accessor for SubtitleState()
{
  return &type metadata for SubtitleState;
}

uint64_t method lookup function for SubtitleStateResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SubtitleStateResolutionResult);
}

uint64_t dispatch thunk of static SubtitleStateResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SubtitleStateResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t DeviceProximity.init(rawValue:)(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5ADD4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = DeviceProximity.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id DeviceProximityResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DeviceProximityResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DeviceProximityResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for DeviceProximityResolutionResult()
{
  return self;
}

id DeviceProximityResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceProximityResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for DeviceProximityResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceProximityResolutionResult);
}

uint64_t dispatch thunk of static DeviceProximityResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DeviceProximityResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t NowPlayingState.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5B0CC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = NowPlayingState.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id NowPlayingStateResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id NowPlayingStateResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for NowPlayingStateResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for NowPlayingStateResolutionResult()
{
  return self;
}

id NowPlayingStateResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NowPlayingStateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

ValueMetadata *type metadata accessor for NowPlayingState()
{
  return &type metadata for NowPlayingState;
}

uint64_t method lookup function for NowPlayingStateResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NowPlayingStateResolutionResult);
}

uint64_t dispatch thunk of static NowPlayingStateResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static NowPlayingStateResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t LanguageType.init(rawValue:)(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5B3D4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = LanguageType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id LanguageTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id LanguageTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for LanguageTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for LanguageTypeResolutionResult()
{
  return self;
}

id LanguageTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5B67C()
{
  unint64_t result = qword_268726B48;
  if (!qword_268726B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B48);
  }
  return result;
}

ValueMetadata *type metadata accessor for LanguageType()
{
  return &type metadata for LanguageType;
}

uint64_t method lookup function for LanguageTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LanguageTypeResolutionResult);
}

uint64_t dispatch thunk of static LanguageTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static LanguageTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t NowPlayingMediaType.init(rawValue:)(unint64_t result)
{
  if (result > 7) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5B72C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = NowPlayingMediaType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id NowPlayingMediaTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id NowPlayingMediaTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for NowPlayingMediaTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for NowPlayingMediaTypeResolutionResult()
{
  return self;
}

id NowPlayingMediaTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NowPlayingMediaTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5B9D4()
{
  unint64_t result = qword_268726B50;
  if (!qword_268726B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B50);
  }
  return result;
}

ValueMetadata *type metadata accessor for NowPlayingMediaType()
{
  return &type metadata for NowPlayingMediaType;
}

uint64_t method lookup function for NowPlayingMediaTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NowPlayingMediaTypeResolutionResult);
}

uint64_t dispatch thunk of static NowPlayingMediaTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static NowPlayingMediaTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t NLMediaType.init(rawValue:)(unint64_t result)
{
  if (result > 0x1A) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5BA84@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = NLMediaType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id NLMediaTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id NLMediaTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for NLMediaTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for NLMediaTypeResolutionResult()
{
  return self;
}

id NLMediaTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NLMediaTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

ValueMetadata *type metadata accessor for NLMediaType()
{
  return &type metadata for NLMediaType;
}

uint64_t method lookup function for NLMediaTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NLMediaTypeResolutionResult);
}

uint64_t dispatch thunk of static NLMediaTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static NLMediaTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t VolumeSettingState.init(rawValue:)(unint64_t result)
{
  if (result > 7) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5BD90@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = VolumeSettingState.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id VolumeSettingStateResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id VolumeSettingStateResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for VolumeSettingStateResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for VolumeSettingStateResolutionResult()
{
  return self;
}

id VolumeSettingStateResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VolumeSettingStateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5C038()
{
  unint64_t result = qword_268726B60;
  if (!qword_268726B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B60);
  }
  return result;
}

ValueMetadata *type metadata accessor for VolumeSettingState()
{
  return &type metadata for VolumeSettingState;
}

uint64_t method lookup function for VolumeSettingStateResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VolumeSettingStateResolutionResult);
}

uint64_t dispatch thunk of static VolumeSettingStateResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static VolumeSettingStateResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

BOOL VolumeSettingUnit.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_232A5C0F8@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL result = VolumeSettingUnit.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id VolumeSettingUnitResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id VolumeSettingUnitResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for VolumeSettingUnitResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for VolumeSettingUnitResolutionResult()
{
  return self;
}

id VolumeSettingUnitResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VolumeSettingUnitResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5C3A0()
{
  unint64_t result = qword_268726B68;
  if (!qword_268726B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B68);
  }
  return result;
}

ValueMetadata *type metadata accessor for VolumeSettingUnit()
{
  return &type metadata for VolumeSettingUnit;
}

uint64_t method lookup function for VolumeSettingUnitResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VolumeSettingUnitResolutionResult);
}

uint64_t dispatch thunk of static VolumeSettingUnitResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static VolumeSettingUnitResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

BOOL VolumeSettingAttribute.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_232A5C460@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL result = VolumeSettingAttribute.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id VolumeSettingAttributeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id VolumeSettingAttributeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for VolumeSettingAttributeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for VolumeSettingAttributeResolutionResult()
{
  return self;
}

id VolumeSettingAttributeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VolumeSettingAttributeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5C708()
{
  unint64_t result = qword_268726B70;
  if (!qword_268726B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B70);
  }
  return result;
}

ValueMetadata *type metadata accessor for VolumeSettingAttribute()
{
  return &type metadata for VolumeSettingAttribute;
}

uint64_t method lookup function for VolumeSettingAttributeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VolumeSettingAttributeResolutionResult);
}

uint64_t dispatch thunk of static VolumeSettingAttributeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static VolumeSettingAttributeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t VolumeSettingQualifier.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5C7B8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = VolumeSettingQualifier.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id VolumeSettingQualifierResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id VolumeSettingQualifierResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for VolumeSettingQualifierResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for VolumeSettingQualifierResolutionResult()
{
  return self;
}

id VolumeSettingQualifierResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VolumeSettingQualifierResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5CA60()
{
  unint64_t result = qword_268726B78;
  if (!qword_268726B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B78);
  }
  return result;
}

ValueMetadata *type metadata accessor for VolumeSettingQualifier()
{
  return &type metadata for VolumeSettingQualifier;
}

uint64_t method lookup function for VolumeSettingQualifierResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VolumeSettingQualifierResolutionResult);
}

uint64_t dispatch thunk of static VolumeSettingQualifierResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static VolumeSettingQualifierResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t VolumeSettingType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5CB10@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = VolumeSettingType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id VolumeSettingTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id VolumeSettingTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for VolumeSettingTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for VolumeSettingTypeResolutionResult()
{
  return self;
}

id VolumeSettingTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VolumeSettingTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5CDB8()
{
  unint64_t result = qword_268726B80;
  if (!qword_268726B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B80);
  }
  return result;
}

ValueMetadata *type metadata accessor for VolumeSettingType()
{
  return &type metadata for VolumeSettingType;
}

uint64_t method lookup function for VolumeSettingTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VolumeSettingTypeResolutionResult);
}

uint64_t dispatch thunk of static VolumeSettingTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static VolumeSettingTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t GroupType.init(rawValue:)(unint64_t result)
{
  if (result > 8) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5CE68@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = GroupType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id GroupTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id GroupTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for GroupTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for GroupTypeResolutionResult()
{
  return self;
}

id GroupTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5D110()
{
  unint64_t result = qword_268726B88;
  if (!qword_268726B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B88);
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupType()
{
  return &type metadata for GroupType;
}

uint64_t method lookup function for GroupTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GroupTypeResolutionResult);
}

uint64_t dispatch thunk of static GroupTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static GroupTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t RoomDimmingState.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5D1C0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = RoomDimmingState.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id RoomDimmingStateResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id RoomDimmingStateResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for RoomDimmingStateResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for RoomDimmingStateResolutionResult()
{
  return self;
}

id RoomDimmingStateResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RoomDimmingStateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5D468()
{
  unint64_t result = qword_268726B90;
  if (!qword_268726B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B90);
  }
  return result;
}

ValueMetadata *type metadata accessor for RoomDimmingState()
{
  return &type metadata for RoomDimmingState;
}

uint64_t method lookup function for RoomDimmingStateResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RoomDimmingStateResolutionResult);
}

uint64_t dispatch thunk of static RoomDimmingStateResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static RoomDimmingStateResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unint64_t PlaybackSpeedType.init(rawValue:)(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

unint64_t sub_232A5D518@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = PlaybackSpeedType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id PlaybackSpeedTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id PlaybackSpeedTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for PlaybackSpeedTypeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for PlaybackSpeedTypeResolutionResult()
{
  return self;
}

id PlaybackSpeedTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlaybackSpeedTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5D7C0()
{
  unint64_t result = qword_268726B98;
  if (!qword_268726B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726B98);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaybackSpeedType()
{
  return &type metadata for PlaybackSpeedType;
}

uint64_t method lookup function for PlaybackSpeedTypeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlaybackSpeedTypeResolutionResult);
}

uint64_t dispatch thunk of static PlaybackSpeedTypeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static PlaybackSpeedTypeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_232A5D85C()
{
  return sub_2329C1F1C();
}

uint64_t sub_232A5D868(uint64_t a1)
{
  return sub_232A5DA84(a1, (void (*)(uint64_t))sub_2328AB59C);
}

uint64_t sub_232A5D880()
{
  return sub_232A5D9DC();
}

uint64_t sub_232A5D8A4(uint64_t a1)
{
  return sub_232A5DA84(a1, (void (*)(uint64_t))sub_2328B49AC);
}

uint64_t sub_232A5D8BC(uint64_t a1)
{
  return sub_232A5DA84(a1, (void (*)(uint64_t))sub_2328B764C);
}

uint64_t sub_232A5D8D4(char a1)
{
  OUTLINED_FUNCTION_0_48();
  sub_2329C10A0((uint64_t)v3, a1);
  return sub_232A68EE8();
}

uint64_t sub_232A5D914()
{
  return sub_2329C1D84();
}

uint64_t sub_232A5D920()
{
  return sub_2329C1C0C();
}

uint64_t sub_232A5D92C()
{
  return sub_232A5D9DC();
}

uint64_t sub_232A5D948()
{
  return sub_232A5D9DC();
}

uint64_t sub_232A5D964()
{
  return sub_2329C19CC();
}

uint64_t sub_232A5D970()
{
  return sub_2329C1A2C();
}

uint64_t sub_232A5D97C()
{
  return sub_232A5D9DC();
}

uint64_t sub_232A5D994(uint64_t a1)
{
  return sub_232A5DA84(a1, (void (*)(uint64_t))sub_2328E5CAC);
}

uint64_t sub_232A5D9AC()
{
  return sub_2329C1AE8();
}

uint64_t sub_232A5D9B8()
{
  return sub_232A5D9DC();
}

uint64_t sub_232A5D9DC()
{
  return sub_232A68EE8();
}

uint64_t sub_232A5DA24()
{
  return sub_2329C1BA0();
}

uint64_t sub_232A5DA30()
{
  return sub_2329C1DE0();
}

uint64_t sub_232A5DA3C(uint64_t a1)
{
  return sub_232A5DA84(a1, (void (*)(uint64_t))sub_23280D9BC);
}

uint64_t sub_232A5DA54()
{
  return sub_2329C1C74();
}

uint64_t sub_232A5DA60()
{
  return sub_2329C18CC();
}

uint64_t sub_232A5DA6C(uint64_t a1)
{
  return sub_232A5DA84(a1, (void (*)(uint64_t))sub_2329FC584);
}

uint64_t sub_232A5DA84(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_232A68EE8();
}

uint64_t sub_232A5DAE8()
{
  return sub_2329C1944();
}

uint64_t sub_232A5DAF8()
{
  return sub_232A68EE8();
}

unint64_t ControlsSettingName.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t sub_232A5DB4C()
{
  return sub_232A5DAF8();
}

unint64_t sub_232A5DB68@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = ControlsSettingName.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id ControlsSettingNameResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  id v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id ControlsSettingNameResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ControlsSettingNameResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for ControlsSettingNameResolutionResult()
{
  return self;
}

id ControlsSettingNameResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlsSettingNameResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_232A5DE10()
{
  unint64_t result = qword_268726BA0;
  if (!qword_268726BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268726BA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlsSettingName()
{
  return &type metadata for ControlsSettingName;
}

uint64_t method lookup function for ControlsSettingNameResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ControlsSettingNameResolutionResult);
}

uint64_t dispatch thunk of static ControlsSettingNameResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static ControlsSettingNameResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_0_48()
{
  return sub_232A68EB8();
}

id sub_232A5DEC4(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  objc_super v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___DeviceResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

unint64_t sub_232A5DFBC()
{
  unint64_t result = qword_268726BA8;
  if (!qword_268726BA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268726BA8);
  }
  return result;
}

id sub_232A5DFFC(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DeviceResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A5E060(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_zoneNames);
  if (v3)
  {
    objc_super v4 = v3;
    uint64_t v5 = sub_232A68658();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_232A5E0C8(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1) {
    uint64_t v3 = sub_232A68648();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setZoneNames_);
}

id sub_232A5E138@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_currentHome);
  *a2 = result;
  return result;
}

id sub_232A5E174@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_currentRoom);
  *a2 = result;
  return result;
}

id sub_232A5E1B0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_numberOfAffectedRooms);
  *a2 = result;
  return result;
}

id sub_232A5E1EC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isDeviceSelectedUsingContext);
  *a2 = result;
  return result;
}

id sub_232A5E228@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_context);
  *a2 = result;
  return result;
}

id sub_232A5E264@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_disambiguated);
  *a2 = result;
  return result;
}

id sub_232A5E2A0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_confirmed);
  *a2 = result;
  return result;
}

id sub_232A5E2DC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_skipConfirmation);
  *a2 = result;
  return result;
}

id sub_232A5E318@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isEndpoint);
  *a2 = result;
  return result;
}

void sub_232A5E354(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_232A68588();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_232A5E3B8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v7 = sub_232A68558();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [v6 *a5];
}

id sub_232A5E428@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isPreResolved);
  *a2 = result;
  return result;
}

id Device.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    uint64_t v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id Device.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Device.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Device();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id Device.__deallocating_deinit()
{
  return sub_232A5E9A8(type metadata accessor for Device);
}

void sub_232A5E730()
{
}

void sub_232A5E790()
{
}

id DeviceResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DeviceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DeviceResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for DeviceResolutionResult()
{
  return self;
}

id DeviceResolutionResult.__deallocating_deinit()
{
  return sub_232A5E9A8(type metadata accessor for DeviceResolutionResult);
}

id sub_232A5E9A8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_name()
{
  return sel_name;
}

void sub_232A5E9EC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A5EA0C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_roomName()
{
  return sel_roomName;
}

void sub_232A5EA38(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A5EA58(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_zoneNames()
{
  return sel_zoneNames;
}

void sub_232A5EA8C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A5EAAC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_routeId()
{
  return sel_routeId;
}

void sub_232A5EAD8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A5EAF8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_currentHome()
{
  return sel_currentHome;
}

id sub_232A5EB28(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCurrentHome_, *a1);
}

char *keypath_get_selector_currentRoom()
{
  return sel_currentRoom;
}

id sub_232A5EB4C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCurrentRoom_, *a1);
}

char *keypath_get_selector_numberOfAffectedRooms()
{
  return sel_numberOfAffectedRooms;
}

id sub_232A5EB70(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNumberOfAffectedRooms_, *a1);
}

char *keypath_get_selector_isDeviceSelectedUsingContext()
{
  return sel_isDeviceSelectedUsingContext;
}

id sub_232A5EB94(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsDeviceSelectedUsingContext_, *a1);
}

char *keypath_get_selector_context()
{
  return sel_context;
}

id sub_232A5EBB8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContext_, *a1);
}

char *keypath_get_selector_disambiguated()
{
  return sel_disambiguated;
}

id sub_232A5EBDC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDisambiguated_, *a1);
}

char *keypath_get_selector_confirmed()
{
  return sel_confirmed;
}

id sub_232A5EC00(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setConfirmed_, *a1);
}

char *keypath_get_selector_skipConfirmation()
{
  return sel_skipConfirmation;
}

id sub_232A5EC24(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSkipConfirmation_, *a1);
}

char *keypath_get_selector_mediaSystemId()
{
  return sel_mediaSystemId;
}

void sub_232A5EC44(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A5EC64(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_isEndpoint()
{
  return sel_isEndpoint;
}

id sub_232A5EC94(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsEndpoint_, *a1);
}

char *keypath_get_selector_displayableName()
{
  return sel_displayableName;
}

void sub_232A5ECB4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A5ECD4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_isPreResolved()
{
  return sel_isPreResolved;
}

id sub_232A5ED04(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsPreResolved_, *a1);
}

uint64_t method lookup function for DeviceResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceResolutionResult);
}

uint64_t dispatch thunk of static DeviceResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DeviceResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static DeviceResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t OUTLINED_FUNCTION_0_49()
{
  return sub_232A68C18();
}

id SignedDuration.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id SignedDuration.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for SignedDuration();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for SignedDuration()
{
  return self;
}

id SignedDuration.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SignedDuration.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SignedDuration();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SignedDuration.__deallocating_deinit()
{
  return sub_232A5F674(type metadata accessor for SignedDuration);
}

id sub_232A5F0E0(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___SignedDurationResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A5F194(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___SignedDurationResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A5F2F8(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___SignedDurationResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A5F3B8()
{
}

void sub_232A5F3FC()
{
}

void sub_232A5F45C()
{
}

id SignedDurationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id SignedDurationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SignedDurationResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for SignedDurationResolutionResult()
{
  return self;
}

id SignedDurationResolutionResult.__deallocating_deinit()
{
  return sub_232A5F674(type metadata accessor for SignedDurationResolutionResult);
}

id sub_232A5F674(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_232A5F6B0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDuration_, *a1);
}

id sub_232A5F6C4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_direction);
  *a2 = result;
  return result;
}

id sub_232A5F6F8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDirection_, *a1);
}

uint64_t method lookup function for SignedDurationResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SignedDurationResolutionResult);
}

uint64_t dispatch thunk of static SignedDurationResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SignedDurationResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static SignedDurationResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t OUTLINED_FUNCTION_0_50()
{
  return sub_232A68C18();
}

uint64_t sub_232A5F788@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_nowPlayingTimestamp);
  if (v3)
  {
    id v4 = v3;
    sub_232A650F8();

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = sub_232A65138();
  return __swift_storeEnumTagSinglePayload(a2, v5, 1, v6);
}

void sub_232A5F808(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268724F20);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232877D14(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_232A65138();
  id v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    id v9 = (void *)sub_232A650B8();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setNowPlayingTimestamp_, v9);
}

id sub_232A5F908@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_silentPrimary);
  *a2 = result;
  return result;
}

void sub_232A5F944(uint64_t a1)
{
  id v2 = (void *)OUTLINED_FUNCTION_0_47(a1);
  id v4 = [v2 *v3];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_232A68588();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *uint64_t v1 = v6;
  v1[1] = v8;
}

id DeviceContext.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    id v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id DeviceContext.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DeviceContext.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeviceContext();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DeviceContext.__deallocating_deinit()
{
  return sub_232A600DC(type metadata accessor for DeviceContext);
}

id sub_232A5FB48(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DeviceContextResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A5FBFC(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___DeviceContextResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A5FD60(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DeviceContextResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A5FE20()
{
}

void sub_232A5FE64()
{
}

void sub_232A5FEC4()
{
}

id DeviceContextResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DeviceContextResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DeviceContextResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for DeviceContextResolutionResult()
{
  return self;
}

id DeviceContextResolutionResult.__deallocating_deinit()
{
  return sub_232A600DC(type metadata accessor for DeviceContextResolutionResult);
}

id sub_232A600DC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_232A60114(uint64_t a1)
{
}

void sub_232A60134(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_proximity()
{
  return sel_proximity;
}

id sub_232A60160(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_proximity);
  *uint64_t v1 = result;
  return result;
}

id sub_232A60190(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setProximity_, *a1);
}

char *keypath_get_selector_nowPlayingState()
{
  return sel_nowPlayingState;
}

id sub_232A601B0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_nowPlayingState);
  *uint64_t v1 = result;
  return result;
}

id sub_232A601E0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNowPlayingState_, *a1);
}

char *keypath_get_selector_nowPlayingTimestamp()
{
  return sel_nowPlayingTimestamp;
}

char *keypath_get_selector_nowPlayingMediaType()
{
  return sel_nowPlayingMediaType;
}

id sub_232A60214(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_nowPlayingMediaType);
  *uint64_t v1 = result;
  return result;
}

id sub_232A60244(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNowPlayingMediaType_, *a1);
}

char *keypath_get_selector_groupId()
{
  return sel_groupId;
}

void sub_232A60264(uint64_t a1)
{
}

void sub_232A60284(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_silentPrimary()
{
  return sel_silentPrimary;
}

id sub_232A602B4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSilentPrimary_, *a1);
}

void sub_232A602C8(uint64_t a1)
{
}

void sub_232A602E8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_deviceType()
{
  return sel_deviceType;
}

void sub_232A60314(uint64_t a1)
{
}

void sub_232A60334(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t method lookup function for DeviceContextResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceContextResolutionResult);
}

uint64_t dispatch thunk of static DeviceContextResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DeviceContextResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static DeviceContextResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t OUTLINED_FUNCTION_0_51()
{
  return sub_232A68C18();
}

id sub_232A603D0(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___LanguageOptionResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A60434(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___LanguageOptionResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A6052C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___LanguageOptionResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

id sub_232A60590@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isActive);
  *a2 = result;
  return result;
}

void sub_232A605CC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_characteristics);
  if (v3)
  {
    objc_super v4 = v3;
    uint64_t v5 = sub_232A68658();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_232A60634(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1) {
    uint64_t v3 = sub_232A68648();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setCharacteristics_);
}

id LanguageOption.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    uint64_t v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id LanguageOption.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    uint64_t v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for LanguageOption();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for LanguageOption()
{
  return self;
}

id LanguageOption.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id LanguageOption.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LanguageOption();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id LanguageOption.__deallocating_deinit()
{
  return sub_232A60DB0(type metadata accessor for LanguageOption);
}

void sub_232A60AF4()
{
}

void sub_232A60B38()
{
}

void sub_232A60B98()
{
}

id LanguageOptionResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id LanguageOptionResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for LanguageOptionResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for LanguageOptionResolutionResult()
{
  return self;
}

id LanguageOptionResolutionResult.__deallocating_deinit()
{
  return sub_232A60DB0(type metadata accessor for LanguageOptionResolutionResult);
}

id sub_232A60DB0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_languageIdentifier()
{
  return sel_languageIdentifier;
}

void sub_232A60DF4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A60E14(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_languageTag()
{
  return sel_languageTag;
}

void sub_232A60E40(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A60E60(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_232A60E80(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A60EA0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_isActive()
{
  return sel_isActive;
}

id sub_232A60ED0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsActive_, *a1);
}

char *keypath_get_selector_characteristics()
{
  return sel_characteristics;
}

id sub_232A60EFC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDisambiguated_, *a1);
}

uint64_t method lookup function for LanguageOptionResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LanguageOptionResolutionResult);
}

uint64_t dispatch thunk of static LanguageOptionResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static LanguageOptionResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static LanguageOptionResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id sub_232A60F64@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_fromEntity);
  *a2 = result;
  return result;
}

id DeviceQuery.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id DeviceQuery.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for DeviceQuery();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for DeviceQuery()
{
  return self;
}

id DeviceQuery.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DeviceQuery.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeviceQuery();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DeviceQuery.__deallocating_deinit()
{
  return sub_232A6186C(type metadata accessor for DeviceQuery);
}

id sub_232A612D8(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DeviceQueryResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A6138C(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___DeviceQueryResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A614F0(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DeviceQueryResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A615B0()
{
}

void sub_232A615F4()
{
}

void sub_232A61654()
{
}

id DeviceQueryResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DeviceQueryResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DeviceQueryResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for DeviceQueryResolutionResult()
{
  return self;
}

id DeviceQueryResolutionResult.__deallocating_deinit()
{
  return sub_232A6186C(type metadata accessor for DeviceQueryResolutionResult);
}

id sub_232A6186C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_accessoryName()
{
  return sel_accessoryName;
}

void sub_232A618B0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A618D0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_232A618F0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A61910(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_zoneName()
{
  return sel_zoneName;
}

void sub_232A6193C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A6195C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_placeHintString()
{
  return sel_placeHintString;
}

void sub_232A61988(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A619A8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_deviceQuantifierString()
{
  return sel_deviceQuantifierString;
}

void sub_232A619D4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A619F4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_serviceName()
{
  return sel_serviceName;
}

void sub_232A61A20(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A61A40(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_serviceGroup()
{
  return sel_serviceGroup;
}

void sub_232A61A6C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A61A8C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_deviceTypeString()
{
  return sel_deviceTypeString;
}

void sub_232A61AB8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A61AD8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_referenceString()
{
  return sel_referenceString;
}

void sub_232A61B04(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_232A61B24(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_fromEntity()
{
  return sel_fromEntity;
}

id sub_232A61B54(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFromEntity_, *a1);
}

uint64_t method lookup function for DeviceQueryResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceQueryResolutionResult);
}

uint64_t dispatch thunk of static DeviceQueryResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DeviceQueryResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static DeviceQueryResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t OUTLINED_FUNCTION_0_52()
{
  return sub_232A68C18();
}

id sub_232A61BE4(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___VolumeLevelResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A61CDC(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___VolumeLevelResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

id sub_232A61D40@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_volumeSettingValue);
  *a2 = result;
  return result;
}

id sub_232A61D7C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_resolvedVolumeOutput);
  *a2 = result;
  return result;
}

id sub_232A61DB8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_currentVolumeOutput);
  *a2 = result;
  return result;
}

id VolumeLevel.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    id v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  objc_super v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    objc_super v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id VolumeLevel.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id VolumeLevel.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for VolumeLevel();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id VolumeLevel.__deallocating_deinit()
{
  return sub_232A62338(type metadata accessor for VolumeLevel);
}

void sub_232A620C0()
{
}

void sub_232A62120()
{
}

id VolumeLevelResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id VolumeLevelResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for VolumeLevelResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for VolumeLevelResolutionResult()
{
  return self;
}

id VolumeLevelResolutionResult.__deallocating_deinit()
{
  return sub_232A62338(type metadata accessor for VolumeLevelResolutionResult);
}

id sub_232A62338(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_volumeSettingValue()
{
  return sel_volumeSettingValue;
}

id sub_232A62380(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVolumeSettingValue_, *a1);
}

char *keypath_get_selector_volumeSettingState()
{
  return sel_volumeSettingState;
}

id sub_232A623A0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_volumeSettingState);
  *uint64_t v1 = result;
  return result;
}

id sub_232A623D0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVolumeSettingState_, *a1);
}

char *keypath_get_selector_volumeSettingUnit()
{
  return sel_volumeSettingUnit;
}

id sub_232A623F0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_volumeSettingUnit);
  *uint64_t v1 = result;
  return result;
}

id sub_232A62420(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVolumeSettingUnit_, *a1);
}

char *keypath_get_selector_volumeSettingQualifier()
{
  return sel_volumeSettingQualifier;
}

id sub_232A62440(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_volumeSettingQualifier);
  *uint64_t v1 = result;
  return result;
}

id sub_232A62470(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVolumeSettingQualifier_, *a1);
}

char *keypath_get_selector_resolvedVolumeOutput()
{
  return sel_resolvedVolumeOutput;
}

id sub_232A62494(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResolvedVolumeOutput_, *a1);
}

char *keypath_get_selector_currentVolumeOutput()
{
  return sel_currentVolumeOutput;
}

id sub_232A624B8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCurrentVolumeOutput_, *a1);
}

char *keypath_get_selector_volumeSettingType()
{
  return sel_volumeSettingType;
}

id sub_232A624D8(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_47(a1), sel_volumeSettingType);
  *uint64_t v1 = result;
  return result;
}

id sub_232A62508(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVolumeSettingType_, *a1);
}

uint64_t method lookup function for VolumeLevelResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VolumeLevelResolutionResult);
}

uint64_t dispatch thunk of static VolumeLevelResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static VolumeLevelResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static VolumeLevelResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id sub_232A62570(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DeviceGroupResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A625D4(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___DeviceGroupResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A626CC(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___DeviceGroupResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A62730(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_groupName);
  if (v3)
  {
    objc_super v4 = v3;
    uint64_t v5 = sub_232A68588();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_232A62798(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_232A68558();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setGroupName_);
}

void sub_232A62808(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_streams);
  if (v3)
  {
    id v4 = v3;
    type metadata accessor for MediaStream();
    uint64_t v5 = sub_232A68658();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_232A62878(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1)
  {
    type metadata accessor for MediaStream();
    uint64_t v3 = sub_232A68648();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setStreams_);
}

id sub_232A628F0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_includesTVs);
  *a2 = result;
  return result;
}

id sub_232A6292C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_excludeGroup);
  *a2 = result;
  return result;
}

id DeviceGroup.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    uint64_t v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id DeviceGroup.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    uint64_t v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for DeviceGroup();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for DeviceGroup()
{
  return self;
}

id DeviceGroup.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DeviceGroup.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeviceGroup();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DeviceGroup.__deallocating_deinit()
{
  return sub_232A63074(type metadata accessor for DeviceGroup);
}

void sub_232A62DB8()
{
}

void sub_232A62DFC()
{
}

void sub_232A62E5C()
{
}

id DeviceGroupResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id DeviceGroupResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for DeviceGroupResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for DeviceGroupResolutionResult()
{
  return self;
}

id DeviceGroupResolutionResult.__deallocating_deinit()
{
  return sub_232A63074(type metadata accessor for DeviceGroupResolutionResult);
}

id sub_232A63074(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_groupName()
{
  return sel_groupName;
}

char *keypath_get_selector_streams()
{
  return sel_streams;
}

id sub_232A630D4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

id sub_232A63108(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

char *keypath_get_selector_includesTVs()
{
  return sel_includesTVs;
}

id sub_232A6312C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIncludesTVs_, *a1);
}

char *keypath_get_selector_excludeGroup()
{
  return sel_excludeGroup;
}

id sub_232A63150(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExcludeGroup_, *a1);
}

uint64_t method lookup function for DeviceGroupResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceGroupResolutionResult);
}

uint64_t dispatch thunk of static DeviceGroupResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static DeviceGroupResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static DeviceGroupResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id sub_232A631B8(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___MediaStreamResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A6321C(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___MediaStreamResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A63314(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___MediaStreamResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A63378(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_devices);
  if (v3)
  {
    objc_super v4 = v3;
    type metadata accessor for Device();
    uint64_t v5 = sub_232A68658();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_232A633E8(void *a1, void **a2)
{
  id v2 = *a2;
  if (*a1)
  {
    type metadata accessor for Device();
    uint64_t v3 = sub_232A68648();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setDevices_);
}

id sub_232A63460@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_groupLeader);
  *a2 = result;
  return result;
}

id MediaStream.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    uint64_t v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id MediaStream.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    uint64_t v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for MediaStream();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for MediaStream()
{
  return self;
}

id MediaStream.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id MediaStream.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MediaStream();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id MediaStream.__deallocating_deinit()
{
  return sub_232A63BA8(type metadata accessor for MediaStream);
}

void sub_232A638EC()
{
}

void sub_232A63930()
{
}

void sub_232A63990()
{
}

id MediaStreamResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id MediaStreamResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for MediaStreamResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for MediaStreamResolutionResult()
{
  return self;
}

id MediaStreamResolutionResult.__deallocating_deinit()
{
  return sub_232A63BA8(type metadata accessor for MediaStreamResolutionResult);
}

id sub_232A63BA8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_groupLeader()
{
  return sel_groupLeader;
}

id sub_232A63BF8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGroupLeader_, *a1);
}

uint64_t method lookup function for MediaStreamResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MediaStreamResolutionResult);
}

uint64_t dispatch thunk of static MediaStreamResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static MediaStreamResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static MediaStreamResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id PlaybackSpeed.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id PlaybackSpeed.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for PlaybackSpeed();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

uint64_t type metadata accessor for PlaybackSpeed()
{
  return self;
}

id PlaybackSpeed.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id PlaybackSpeed.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for PlaybackSpeed();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id PlaybackSpeed.__deallocating_deinit()
{
  return sub_232A6452C(type metadata accessor for PlaybackSpeed);
}

id sub_232A63F98(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___PlaybackSpeedResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A6404C(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___PlaybackSpeedResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A641B0(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___PlaybackSpeedResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A64270()
{
}

void sub_232A642B4()
{
}

void sub_232A64314()
{
}

id PlaybackSpeedResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id PlaybackSpeedResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for PlaybackSpeedResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for PlaybackSpeedResolutionResult()
{
  return self;
}

id PlaybackSpeedResolutionResult.__deallocating_deinit()
{
  return sub_232A6452C(type metadata accessor for PlaybackSpeedResolutionResult);
}

id sub_232A6452C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_232A64564@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_speedMagnitude);
  *a2 = v4;
  return result;
}

id sub_232A64598(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSpeedMagnitude_, *a1);
}

id sub_232A645AC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_playbackSpeedType);
  *a2 = result;
  return result;
}

id sub_232A645E0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlaybackSpeedType_, *a1);
}

uint64_t method lookup function for PlaybackSpeedResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PlaybackSpeedResolutionResult);
}

uint64_t dispatch thunk of static PlaybackSpeedResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static PlaybackSpeedResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static PlaybackSpeedResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id ControlsSettingAttribute.__allocating_init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  uint64_t v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone(v0), sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id ControlsSettingAttribute.init(identifier:display:pronunciationHint:)()
{
  OUTLINED_FUNCTION_1_62();
  if (v2)
  {
    objc_super v3 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }
  uint64_t v4 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  if (v1)
  {
    id v5 = (void *)sub_232A68558();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ControlsSettingAttribute();
  id v6 = objc_msgSendSuper2(&v8, sel_initWithIdentifier_displayString_pronunciationHint_, v3, v4, v5);

  return v6;
}

id ControlsSettingAttribute.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ControlsSettingAttribute.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ControlsSettingAttribute();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ControlsSettingAttribute.__deallocating_deinit()
{
  return sub_232A64EF0(type metadata accessor for ControlsSettingAttribute);
}

id sub_232A6495C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ControlsSettingAttributeResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_232A64A10(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_232A5DFBC();
    swift_bridgeObjectRetain();
    sub_232A68C28();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_232A68DF8();
    sub_232A5DFBC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_232A5DFBC();
  id v2 = (void *)sub_232A68648();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___ControlsSettingAttributeResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_232A64B74(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ControlsSettingAttributeResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_232A64C34()
{
}

void sub_232A64C78()
{
}

void sub_232A64CD8()
{
}

id ControlsSettingAttributeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  objc_super v5 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v5, a2);

  return v6;
}

id ControlsSettingAttributeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = (void *)sub_232A684E8();
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ControlsSettingAttributeResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v4, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for ControlsSettingAttributeResolutionResult()
{
  return self;
}

id ControlsSettingAttributeResolutionResult.__deallocating_deinit()
{
  return sub_232A64EF0(type metadata accessor for ControlsSettingAttributeResolutionResult);
}

id sub_232A64EF0(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

char *keypath_get_selector_settingName()
{
  return sel_settingName;
}

id sub_232A64F34@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_settingName);
  *a2 = result;
  return result;
}

id sub_232A64F68(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSettingName_, *a1);
}

uint64_t method lookup function for ControlsSettingAttributeResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ControlsSettingAttributeResolutionResult);
}

uint64_t dispatch thunk of static ControlsSettingAttributeResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static ControlsSettingAttributeResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static ControlsSettingAttributeResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t OUTLINED_FUNCTION_0_53()
{
  return sub_232A68C18();
}

uint64_t sub_232A64FF8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_232A65008()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_232A65018()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_232A65028()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_232A65038()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_232A65048()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_232A65058()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_232A65068()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_232A65078()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_232A65088()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_232A65098()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_232A650A8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_232A650B8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_232A650C8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_232A650D8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_232A650E8()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_232A650F8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_232A65108()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_232A65118()
{
  return MEMORY[0x270EF0BE8]();
}

uint64_t sub_232A65128()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_232A65138()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_232A65148()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_232A65158()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_232A65168()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_232A65178()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_232A65188()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_232A65198()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_232A651A8()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_232A651B8()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_232A651C8()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_232A651D8()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_232A651E8()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_232A651F8()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_232A65208()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_232A65218()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_232A65228()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_232A65238()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_232A65248()
{
  return MEMORY[0x270EF13D0]();
}

uint64_t sub_232A65258()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_232A65268()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_232A65278()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_232A65288()
{
  return MEMORY[0x270F66318]();
}

uint64_t sub_232A652B8()
{
  return MEMORY[0x270F66398]();
}

uint64_t sub_232A65318()
{
  return MEMORY[0x270F66430]();
}

uint64_t sub_232A65378()
{
  return MEMORY[0x270F66540]();
}

uint64_t sub_232A65388()
{
  return MEMORY[0x270F66548]();
}

uint64_t sub_232A653C8()
{
  return MEMORY[0x270F66650]();
}

uint64_t sub_232A653D8()
{
  return MEMORY[0x270F66658]();
}

uint64_t sub_232A653E8()
{
  return MEMORY[0x270F66660]();
}

uint64_t sub_232A65448()
{
  return MEMORY[0x270F66870]();
}

uint64_t sub_232A65458()
{
  return MEMORY[0x270F66A70]();
}

uint64_t sub_232A65468()
{
  return MEMORY[0x270F66A90]();
}

uint64_t sub_232A65478()
{
  return MEMORY[0x270F66AA0]();
}

uint64_t sub_232A65488()
{
  return MEMORY[0x270F66AD8]();
}

uint64_t sub_232A65498()
{
  return MEMORY[0x270F66AE8]();
}

uint64_t sub_232A654A8()
{
  return MEMORY[0x270F66B00]();
}

uint64_t sub_232A654B8()
{
  return MEMORY[0x270F66B18]();
}

uint64_t sub_232A654C8()
{
  return MEMORY[0x270F66BA8]();
}

uint64_t sub_232A654D8()
{
  return MEMORY[0x270F66BB0]();
}

uint64_t sub_232A654E8()
{
  return MEMORY[0x270F66BB8]();
}

uint64_t sub_232A654F8()
{
  return MEMORY[0x270F66BC0]();
}

uint64_t sub_232A65508()
{
  return MEMORY[0x270F66BC8]();
}

uint64_t sub_232A65518()
{
  return MEMORY[0x270F66BD0]();
}

uint64_t sub_232A65528()
{
  return MEMORY[0x270F66BD8]();
}

uint64_t sub_232A65538()
{
  return MEMORY[0x270F66BE0]();
}

uint64_t sub_232A65548()
{
  return MEMORY[0x270F66BE8]();
}

uint64_t sub_232A65558()
{
  return MEMORY[0x270F66C60]();
}

uint64_t sub_232A65568()
{
  return MEMORY[0x270F66C80]();
}

uint64_t sub_232A65578()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_232A65588()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_232A65598()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_232A655D8()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_232A655E8()
{
  return MEMORY[0x270F66D00]();
}

uint64_t sub_232A655F8()
{
  return MEMORY[0x270F66D08]();
}

uint64_t sub_232A65608()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_232A65618()
{
  return MEMORY[0x270F66D20]();
}

uint64_t sub_232A65628()
{
  return MEMORY[0x270F66D28]();
}

uint64_t sub_232A65638()
{
  return MEMORY[0x270F66DA0]();
}

uint64_t sub_232A65648()
{
  return MEMORY[0x270F66DB8]();
}

uint64_t sub_232A65658()
{
  return MEMORY[0x270F66DC8]();
}

uint64_t sub_232A65668()
{
  return MEMORY[0x270F66DD0]();
}

uint64_t sub_232A65678()
{
  return MEMORY[0x270F66DD8]();
}

uint64_t sub_232A65688()
{
  return MEMORY[0x270F66DE8]();
}

uint64_t sub_232A65698()
{
  return MEMORY[0x270F66DF0]();
}

uint64_t sub_232A656A8()
{
  return MEMORY[0x270F66E00]();
}

uint64_t sub_232A656B8()
{
  return MEMORY[0x270F66E20]();
}

uint64_t sub_232A656C8()
{
  return MEMORY[0x270F66E28]();
}

uint64_t sub_232A656D8()
{
  return MEMORY[0x270F66E40]();
}

uint64_t sub_232A656E8()
{
  return MEMORY[0x270F66E58]();
}

uint64_t sub_232A656F8()
{
  return MEMORY[0x270F66FF0]();
}

uint64_t sub_232A65708()
{
  return MEMORY[0x270F67000]();
}

uint64_t sub_232A65718()
{
  return MEMORY[0x270F67010]();
}

uint64_t sub_232A65728()
{
  return MEMORY[0x270F67018]();
}

uint64_t sub_232A65738()
{
  return MEMORY[0x270F67028]();
}

uint64_t sub_232A65748()
{
  return MEMORY[0x270F67030]();
}

uint64_t sub_232A65758()
{
  return MEMORY[0x270F67058]();
}

uint64_t sub_232A65768()
{
  return MEMORY[0x270F67060]();
}

uint64_t sub_232A65778()
{
  return MEMORY[0x270F67068]();
}

uint64_t sub_232A65788()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_232A65798()
{
  return MEMORY[0x270F670A8]();
}

uint64_t sub_232A657A8()
{
  return MEMORY[0x270F67198]();
}

uint64_t sub_232A657B8()
{
  return MEMORY[0x270F671A0]();
}

uint64_t sub_232A657C8()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_232A657D8()
{
  return MEMORY[0x270F671E8]();
}

uint64_t sub_232A657E8()
{
  return MEMORY[0x270F67208]();
}

uint64_t sub_232A657F8()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_232A65808()
{
  return MEMORY[0x270F67218]();
}

uint64_t sub_232A65818()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_232A65828()
{
  return MEMORY[0x270F67228]();
}

uint64_t sub_232A65838()
{
  return MEMORY[0x270F67230]();
}

uint64_t sub_232A65848()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_232A65858()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_232A65868()
{
  return MEMORY[0x270F672B0]();
}

uint64_t sub_232A65878()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_232A65888()
{
  return MEMORY[0x270F672F8]();
}

uint64_t sub_232A65898()
{
  return MEMORY[0x270F67300]();
}

uint64_t sub_232A658A8()
{
  return MEMORY[0x270F67310]();
}

uint64_t sub_232A658B8()
{
  return MEMORY[0x270F67320]();
}

uint64_t sub_232A658C8()
{
  return MEMORY[0x270F67330]();
}

uint64_t sub_232A658D8()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_232A658E8()
{
  return MEMORY[0x270F67348]();
}

uint64_t sub_232A658F8()
{
  return MEMORY[0x270F67350]();
}

uint64_t sub_232A65908()
{
  return MEMORY[0x270F67358]();
}

uint64_t sub_232A65918()
{
  return MEMORY[0x270F67360]();
}

uint64_t sub_232A65928()
{
  return MEMORY[0x270F67380]();
}

uint64_t sub_232A65938()
{
  return MEMORY[0x270F67388]();
}

uint64_t sub_232A65948()
{
  return MEMORY[0x270F67398]();
}

uint64_t sub_232A65958()
{
  return MEMORY[0x270F673A8]();
}

uint64_t sub_232A65968()
{
  return MEMORY[0x270F67430]();
}

uint64_t sub_232A65978()
{
  return MEMORY[0x270F674B8]();
}

uint64_t sub_232A65988()
{
  return MEMORY[0x270F674D8]();
}

uint64_t sub_232A65998()
{
  return MEMORY[0x270F674E8]();
}

uint64_t sub_232A659A8()
{
  return MEMORY[0x270F674F0]();
}

uint64_t sub_232A659B8()
{
  return MEMORY[0x270F674F8]();
}

uint64_t sub_232A659C8()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_232A659D8()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_232A659E8()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_232A659F8()
{
  return MEMORY[0x270F67660]();
}

uint64_t sub_232A65A08()
{
  return MEMORY[0x270F67670]();
}

uint64_t sub_232A65A18()
{
  return MEMORY[0x270F67678]();
}

uint64_t sub_232A65A28()
{
  return MEMORY[0x270F67680]();
}

uint64_t sub_232A65A38()
{
  return MEMORY[0x270F67688]();
}

uint64_t sub_232A65A48()
{
  return MEMORY[0x270F67690]();
}

uint64_t sub_232A65A58()
{
  return MEMORY[0x270F676C0]();
}

uint64_t sub_232A65A68()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_232A65A78()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_232A65A88()
{
  return MEMORY[0x270F67770]();
}

uint64_t sub_232A65A98()
{
  return MEMORY[0x270F67778]();
}

uint64_t sub_232A65AA8()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_232A65AB8()
{
  return MEMORY[0x270F677A0]();
}

uint64_t sub_232A65AC8()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_232A65AD8()
{
  return MEMORY[0x270F677C0]();
}

uint64_t sub_232A65AE8()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_232A65AF8()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_232A65B08()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_232A65B18()
{
  return MEMORY[0x270F67818]();
}

uint64_t sub_232A65B28()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_232A65B38()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_232A65B48()
{
  return MEMORY[0x270F67860]();
}

uint64_t sub_232A65B78()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_232A65B88()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_232A65B98()
{
  return MEMORY[0x270F678E8]();
}

uint64_t sub_232A65BA8()
{
  return MEMORY[0x270F678F8]();
}

uint64_t sub_232A65BB8()
{
  return MEMORY[0x270F67910]();
}

uint64_t sub_232A65BC8()
{
  return MEMORY[0x270F67918]();
}

uint64_t sub_232A65BD8()
{
  return MEMORY[0x270F67920]();
}

uint64_t sub_232A65BE8()
{
  return MEMORY[0x270F67930]();
}

uint64_t sub_232A65BF8()
{
  return MEMORY[0x270F67938]();
}

uint64_t sub_232A65C08()
{
  return MEMORY[0x270F67950]();
}

uint64_t sub_232A65C18()
{
  return MEMORY[0x270F67968]();
}

uint64_t sub_232A65C28()
{
  return MEMORY[0x270F67970]();
}

uint64_t sub_232A65C38()
{
  return MEMORY[0x270F67980]();
}

uint64_t sub_232A65C48()
{
  return MEMORY[0x270F67988]();
}

uint64_t sub_232A65C58()
{
  return MEMORY[0x270F67990]();
}

uint64_t sub_232A65C68()
{
  return MEMORY[0x270F67998]();
}

uint64_t sub_232A65C78()
{
  return MEMORY[0x270F67A78]();
}

uint64_t sub_232A65C88()
{
  return MEMORY[0x270F67A80]();
}

uint64_t sub_232A65C98()
{
  return MEMORY[0x270F67AF8]();
}

uint64_t sub_232A65CC8()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_232A65CD8()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t sub_232A65CE8()
{
  return MEMORY[0x270F67BF8]();
}

uint64_t sub_232A65CF8()
{
  return MEMORY[0x270F67C70]();
}

uint64_t sub_232A65D08()
{
  return MEMORY[0x270F67C78]();
}

uint64_t sub_232A65D18()
{
  return MEMORY[0x270F67C80]();
}

uint64_t sub_232A65D28()
{
  return MEMORY[0x270F67CD0]();
}

uint64_t sub_232A65D38()
{
  return MEMORY[0x270F67D60]();
}

uint64_t sub_232A65D48()
{
  return MEMORY[0x270F67D70]();
}

uint64_t sub_232A65D58()
{
  return MEMORY[0x270F67DB8]();
}

uint64_t sub_232A65D68()
{
  return MEMORY[0x270F67DC8]();
}

uint64_t sub_232A65D78()
{
  return MEMORY[0x270F67DD8]();
}

uint64_t sub_232A65D88()
{
  return MEMORY[0x270F67DE0]();
}

uint64_t sub_232A65D98()
{
  return MEMORY[0x270F67DE8]();
}

uint64_t sub_232A65DA8()
{
  return MEMORY[0x270F67E20]();
}

uint64_t sub_232A65DB8()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_232A65DC8()
{
  return MEMORY[0x270F67E58]();
}

uint64_t sub_232A65DD8()
{
  return MEMORY[0x270F67E68]();
}

uint64_t sub_232A65DE8()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_232A65DF8()
{
  return MEMORY[0x270F67E90]();
}

uint64_t sub_232A65E08()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_232A65E18()
{
  return MEMORY[0x270F67EA8]();
}

uint64_t sub_232A65E28()
{
  return MEMORY[0x270F67EC0]();
}

uint64_t sub_232A65E38()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_232A65E48()
{
  return MEMORY[0x270F67ED8]();
}

uint64_t sub_232A65E58()
{
  return MEMORY[0x270F67EF8]();
}

uint64_t sub_232A65E68()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_232A65EA8()
{
  return MEMORY[0x270F68018]();
}

uint64_t sub_232A65EE8()
{
  return MEMORY[0x270F68158]();
}

uint64_t sub_232A65EF8()
{
  return MEMORY[0x270F68160]();
}

uint64_t sub_232A65F08()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_232A65F18()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_232A65F28()
{
  return MEMORY[0x270F68250]();
}

uint64_t sub_232A65F38()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_232A65F48()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_232A65F58()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_232A65F68()
{
  return MEMORY[0x270F68278]();
}

uint64_t sub_232A65F78()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_232A65F88()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_232A65FB8()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_232A65FC8()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_232A65FD8()
{
  return MEMORY[0x270F683B8]();
}

uint64_t sub_232A65FE8()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_232A65FF8()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_232A66008()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_232A66018()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_232A66028()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_232A66038()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_232A66048()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_232A66058()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_232A66068()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_232A66078()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_232A66088()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_232A66098()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_232A660A8()
{
  return MEMORY[0x270F6AA80]();
}

uint64_t sub_232A660B8()
{
  return MEMORY[0x270F6AA90]();
}

uint64_t sub_232A660C8()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_232A660D8()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_232A660E8()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_232A660F8()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_232A66108()
{
  return MEMORY[0x270F6AC20]();
}

uint64_t sub_232A66118()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_232A66128()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t sub_232A66138()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_232A66148()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_232A66158()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t sub_232A66168()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t sub_232A66178()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_232A66188()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_232A66198()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_232A661A8()
{
  return MEMORY[0x270F6BF88]();
}

uint64_t sub_232A661B8()
{
  return MEMORY[0x270F6BF98]();
}

uint64_t sub_232A661C8()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_232A661D8()
{
  return MEMORY[0x270F6BFE0]();
}

uint64_t sub_232A661E8()
{
  return MEMORY[0x270F6FA40]();
}

uint64_t sub_232A661F8()
{
  return MEMORY[0x270F6C088]();
}

uint64_t sub_232A66208()
{
  return MEMORY[0x270F6C090]();
}

uint64_t sub_232A66218()
{
  return MEMORY[0x270F6C098]();
}

uint64_t sub_232A66228()
{
  return MEMORY[0x270F6C0A0]();
}

uint64_t sub_232A66238()
{
  return MEMORY[0x270F6C0A8]();
}

uint64_t sub_232A66248()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_232A66258()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_232A66268()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_232A66278()
{
  return MEMORY[0x270F6C240]();
}

uint64_t sub_232A66288()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_232A66298()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_232A662A8()
{
  return MEMORY[0x270F6FA48]();
}

uint64_t sub_232A662B8()
{
  return MEMORY[0x270F6FA50]();
}

uint64_t sub_232A662C8()
{
  return MEMORY[0x270F6FA58]();
}

uint64_t sub_232A662D8()
{
  return MEMORY[0x270F6FA60]();
}

uint64_t sub_232A662E8()
{
  return MEMORY[0x270F6FA68]();
}

uint64_t sub_232A662F8()
{
  return MEMORY[0x270F6FA70]();
}

uint64_t sub_232A66308()
{
  return MEMORY[0x270F6FA78]();
}

uint64_t sub_232A66318()
{
  return MEMORY[0x270F6FA80]();
}

uint64_t sub_232A66328()
{
  return MEMORY[0x270F6FA88]();
}

uint64_t sub_232A66338()
{
  return MEMORY[0x270F6FA90]();
}

uint64_t sub_232A66348()
{
  return MEMORY[0x270F6FA98]();
}

uint64_t sub_232A66358()
{
  return MEMORY[0x270F6FAA0]();
}

uint64_t sub_232A66368()
{
  return MEMORY[0x270F6FAA8]();
}

uint64_t sub_232A66378()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_232A66388()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_232A66398()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_232A663A8()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_232A663B8()
{
  return MEMORY[0x270F6CA30]();
}

uint64_t sub_232A663C8()
{
  return MEMORY[0x270F6FAB0]();
}

uint64_t sub_232A66408()
{
  return MEMORY[0x270F6CA88]();
}

uint64_t sub_232A66418()
{
  return MEMORY[0x270F6CA90]();
}

uint64_t sub_232A66428()
{
  return MEMORY[0x270F6CAC0]();
}

uint64_t sub_232A66438()
{
  return MEMORY[0x270F6CAE0]();
}

uint64_t sub_232A66448()
{
  return MEMORY[0x270F6CB18]();
}

uint64_t sub_232A66458()
{
  return MEMORY[0x270F6CB28]();
}

uint64_t sub_232A66468()
{
  return MEMORY[0x270F6CB30]();
}

uint64_t sub_232A66478()
{
  return MEMORY[0x270F6CB38]();
}

uint64_t sub_232A66488()
{
  return MEMORY[0x270F6CB40]();
}

uint64_t sub_232A66498()
{
  return MEMORY[0x270F6CB50]();
}

uint64_t sub_232A664A8()
{
  return MEMORY[0x270F6CB70]();
}

uint64_t sub_232A664B8()
{
  return MEMORY[0x270F6CB88]();
}

uint64_t sub_232A664C8()
{
  return MEMORY[0x270F6CB90]();
}

uint64_t sub_232A664D8()
{
  return MEMORY[0x270F6CB98]();
}

uint64_t sub_232A664E8()
{
  return MEMORY[0x270F6CBD0]();
}

uint64_t sub_232A664F8()
{
  return MEMORY[0x270F6CBF0]();
}

uint64_t sub_232A66508()
{
  return MEMORY[0x270F6CBF8]();
}

uint64_t sub_232A66518()
{
  return MEMORY[0x270F6CC08]();
}

uint64_t sub_232A66528()
{
  return MEMORY[0x270F6CC10]();
}

uint64_t sub_232A66538()
{
  return MEMORY[0x270F6CC18]();
}

uint64_t sub_232A66548()
{
  return MEMORY[0x270F6CC20]();
}

uint64_t sub_232A66558()
{
  return MEMORY[0x270F6CC28]();
}

uint64_t sub_232A66568()
{
  return MEMORY[0x270F6CC30]();
}

uint64_t sub_232A66578()
{
  return MEMORY[0x270F6CC38]();
}

uint64_t sub_232A66588()
{
  return MEMORY[0x270F6CC40]();
}

uint64_t sub_232A66598()
{
  return MEMORY[0x270F6CC48]();
}

uint64_t sub_232A665A8()
{
  return MEMORY[0x270F6CC50]();
}

uint64_t sub_232A665B8()
{
  return MEMORY[0x270F6CC70]();
}

uint64_t sub_232A665C8()
{
  return MEMORY[0x270F6CC90]();
}

uint64_t sub_232A665D8()
{
  return MEMORY[0x270F6CC98]();
}

uint64_t sub_232A665E8()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_232A665F8()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_232A66608()
{
  return MEMORY[0x270F6CCE0]();
}

uint64_t sub_232A66618()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_232A66628()
{
  return MEMORY[0x270F6CD30]();
}

uint64_t sub_232A66638()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t sub_232A66648()
{
  return MEMORY[0x270F6CD40]();
}

uint64_t sub_232A66658()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_232A66668()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_232A66678()
{
  return MEMORY[0x270F6CD80]();
}

uint64_t sub_232A66688()
{
  return MEMORY[0x270F6CD98]();
}

uint64_t sub_232A66698()
{
  return MEMORY[0x270F6CDA0]();
}

uint64_t sub_232A666A8()
{
  return MEMORY[0x270F6CDB0]();
}

uint64_t sub_232A666B8()
{
  return MEMORY[0x270F6CE60]();
}

uint64_t sub_232A666C8()
{
  return MEMORY[0x270F6CE68]();
}

uint64_t sub_232A666D8()
{
  return MEMORY[0x270F6CEA0]();
}

uint64_t sub_232A666E8()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_232A66708()
{
  return MEMORY[0x270F6CED0]();
}

uint64_t sub_232A66718()
{
  return MEMORY[0x270F6CEF0]();
}

uint64_t sub_232A66728()
{
  return MEMORY[0x270F6D030]();
}

uint64_t sub_232A66738()
{
  return MEMORY[0x270F6D038]();
}

uint64_t sub_232A66748()
{
  return MEMORY[0x270F6D040]();
}

uint64_t sub_232A66758()
{
  return MEMORY[0x270F6D0F8]();
}

uint64_t sub_232A66768()
{
  return MEMORY[0x270F6D100]();
}

uint64_t sub_232A66778()
{
  return MEMORY[0x270F6D108]();
}

uint64_t sub_232A66788()
{
  return MEMORY[0x270F6D110]();
}

uint64_t sub_232A66798()
{
  return MEMORY[0x270F6D118]();
}

uint64_t sub_232A667A8()
{
  return MEMORY[0x270F6D120]();
}

uint64_t sub_232A667B8()
{
  return MEMORY[0x270F6D128]();
}

uint64_t sub_232A667C8()
{
  return MEMORY[0x270F6D1D0]();
}

uint64_t sub_232A667D8()
{
  return MEMORY[0x270F6D1D8]();
}

uint64_t sub_232A667E8()
{
  return MEMORY[0x270F6D1E8]();
}

uint64_t sub_232A667F8()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_232A66808()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_232A66818()
{
  return MEMORY[0x270F6D288]();
}

uint64_t sub_232A66828()
{
  return MEMORY[0x270F6D290]();
}

uint64_t sub_232A66838()
{
  return MEMORY[0x270F6D298]();
}

uint64_t sub_232A66848()
{
  return MEMORY[0x270F6D2B0]();
}

uint64_t sub_232A66858()
{
  return MEMORY[0x270F6D310]();
}

uint64_t sub_232A66868()
{
  return MEMORY[0x270F6D318]();
}

uint64_t sub_232A66878()
{
  return MEMORY[0x270F6FAB8]();
}

uint64_t sub_232A66888()
{
  return MEMORY[0x270F6D338]();
}

uint64_t sub_232A66898()
{
  return MEMORY[0x270F6D358]();
}

uint64_t sub_232A668A8()
{
  return MEMORY[0x270F6D370]();
}

uint64_t sub_232A668B8()
{
  return MEMORY[0x270F6D3C8]();
}

uint64_t sub_232A668C8()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t sub_232A668D8()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_232A668E8()
{
  return MEMORY[0x270F6D430]();
}

uint64_t sub_232A668F8()
{
  return MEMORY[0x270F6D438]();
}

uint64_t sub_232A66908()
{
  return MEMORY[0x270F6D450]();
}

uint64_t sub_232A66918()
{
  return MEMORY[0x270F6D458]();
}

uint64_t sub_232A66928()
{
  return MEMORY[0x270F6D468]();
}

uint64_t sub_232A66938()
{
  return MEMORY[0x270F6D4C0]();
}

uint64_t sub_232A66948()
{
  return MEMORY[0x270F6D4E8]();
}

uint64_t sub_232A66958()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_232A66968()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_232A66978()
{
  return MEMORY[0x270F6D630]();
}

uint64_t sub_232A66988()
{
  return MEMORY[0x270F6D648]();
}

uint64_t sub_232A66998()
{
  return MEMORY[0x270F6D660]();
}

uint64_t sub_232A669A8()
{
  return MEMORY[0x270F6D828]();
}

uint64_t sub_232A669B8()
{
  return MEMORY[0x270F6D838]();
}

uint64_t sub_232A669C8()
{
  return MEMORY[0x270F6D968]();
}

uint64_t sub_232A669D8()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_232A669E8()
{
  return MEMORY[0x270F6DA00]();
}

uint64_t sub_232A669F8()
{
  return MEMORY[0x270F6DA10]();
}

uint64_t sub_232A66A08()
{
  return MEMORY[0x270F6DA48]();
}

uint64_t sub_232A66A18()
{
  return MEMORY[0x270F6DA68]();
}

uint64_t sub_232A66A28()
{
  return MEMORY[0x270F6DA88]();
}

uint64_t sub_232A66A38()
{
  return MEMORY[0x270F6DAA8]();
}

uint64_t sub_232A66A48()
{
  return MEMORY[0x270F6DC20]();
}

uint64_t sub_232A66A58()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t sub_232A66A68()
{
  return MEMORY[0x270F6DC38]();
}

uint64_t sub_232A66A78()
{
  return MEMORY[0x270F6DC40]();
}

uint64_t sub_232A66A88()
{
  return MEMORY[0x270F6DC48]();
}

uint64_t sub_232A66A98()
{
  return MEMORY[0x270F6DC50]();
}

uint64_t sub_232A66AA8()
{
  return MEMORY[0x270F6DCA8]();
}

uint64_t sub_232A66AB8()
{
  return MEMORY[0x270F6DCB8]();
}

uint64_t sub_232A66AC8()
{
  return MEMORY[0x270F6DCF8]();
}

uint64_t sub_232A66AD8()
{
  return MEMORY[0x270F6DD08]();
}

uint64_t sub_232A66AE8()
{
  return MEMORY[0x270F6DE08]();
}

uint64_t sub_232A66AF8()
{
  return MEMORY[0x270F6DE10]();
}

uint64_t sub_232A66B08()
{
  return MEMORY[0x270F6DE18]();
}

uint64_t sub_232A66B18()
{
  return MEMORY[0x270F6DE28]();
}

uint64_t sub_232A66B28()
{
  return MEMORY[0x270F6DE30]();
}

uint64_t sub_232A66B38()
{
  return MEMORY[0x270F6DF48]();
}

uint64_t sub_232A66B48()
{
  return MEMORY[0x270F6DF58]();
}

uint64_t sub_232A66B58()
{
  return MEMORY[0x270F6DF78]();
}

uint64_t sub_232A66B78()
{
  return MEMORY[0x270F6DFE0]();
}

uint64_t sub_232A66B88()
{
  return MEMORY[0x270F6DFE8]();
}

uint64_t sub_232A66B98()
{
  return MEMORY[0x270F6DFF0]();
}

uint64_t sub_232A66BA8()
{
  return MEMORY[0x270F6E168]();
}

uint64_t sub_232A66BB8()
{
  return MEMORY[0x270F6E188]();
}

uint64_t sub_232A66BC8()
{
  return MEMORY[0x270F6E190]();
}

uint64_t sub_232A66BD8()
{
  return MEMORY[0x270F6E1A0]();
}

uint64_t sub_232A66BE8()
{
  return MEMORY[0x270F6E1A8]();
}

uint64_t sub_232A66BF8()
{
  return MEMORY[0x270F6E1B0]();
}

uint64_t sub_232A66C08()
{
  return MEMORY[0x270F6E1D0]();
}

uint64_t sub_232A66C18()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_232A66C28()
{
  return MEMORY[0x270F6E200]();
}

uint64_t sub_232A66C38()
{
  return MEMORY[0x270F6E208]();
}

uint64_t sub_232A66C48()
{
  return MEMORY[0x270F6E268]();
}

uint64_t sub_232A66C58()
{
  return MEMORY[0x270F6E288]();
}

uint64_t sub_232A66C68()
{
  return MEMORY[0x270F6E290]();
}

uint64_t sub_232A66C78()
{
  return MEMORY[0x270F6E2E0]();
}

uint64_t sub_232A66C88()
{
  return MEMORY[0x270F6E2E8]();
}

uint64_t sub_232A66C98()
{
  return MEMORY[0x270F6E2F0]();
}

uint64_t sub_232A66CA8()
{
  return MEMORY[0x270F6E328]();
}

uint64_t sub_232A66CB8()
{
  return MEMORY[0x270F6E330]();
}

uint64_t sub_232A66CC8()
{
  return MEMORY[0x270F6E3C8]();
}

uint64_t sub_232A66CD8()
{
  return MEMORY[0x270F6E3D8]();
}

uint64_t sub_232A66CE8()
{
  return MEMORY[0x270F6E3F0]();
}

uint64_t sub_232A66CF8()
{
  return MEMORY[0x270F6E3F8]();
}

uint64_t sub_232A66D08()
{
  return MEMORY[0x270F6E400]();
}

uint64_t sub_232A66D18()
{
  return MEMORY[0x270F6E408]();
}

uint64_t sub_232A66D28()
{
  return MEMORY[0x270F6E410]();
}

uint64_t sub_232A66D38()
{
  return MEMORY[0x270F6E420]();
}

uint64_t sub_232A66D48()
{
  return MEMORY[0x270F6E4A0]();
}

uint64_t sub_232A66D58()
{
  return MEMORY[0x270F6E4A8]();
}

uint64_t sub_232A66D68()
{
  return MEMORY[0x270F6E4B0]();
}

uint64_t sub_232A66D78()
{
  return MEMORY[0x270F6E4D8]();
}

uint64_t sub_232A66D88()
{
  return MEMORY[0x270F6E4E0]();
}

uint64_t sub_232A66D98()
{
  return MEMORY[0x270F6E4E8]();
}

uint64_t sub_232A66DA8()
{
  return MEMORY[0x270F6E518]();
}

uint64_t sub_232A66DB8()
{
  return MEMORY[0x270F6E520]();
}

uint64_t sub_232A66DC8()
{
  return MEMORY[0x270F6E590]();
}

uint64_t sub_232A66DD8()
{
  return MEMORY[0x270F6E730]();
}

uint64_t sub_232A66DE8()
{
  return MEMORY[0x270F6E890]();
}

uint64_t sub_232A66DF8()
{
  return MEMORY[0x270F6E898]();
}

uint64_t sub_232A66E08()
{
  return MEMORY[0x270F6E8A0]();
}

uint64_t sub_232A66E18()
{
  return MEMORY[0x270F6E910]();
}

uint64_t sub_232A66E28()
{
  return MEMORY[0x270F6E918]();
}

uint64_t sub_232A66E38()
{
  return MEMORY[0x270F6E998]();
}

uint64_t sub_232A66E48()
{
  return MEMORY[0x270F6E9A8]();
}

uint64_t sub_232A66E58()
{
  return MEMORY[0x270F6E9B0]();
}

uint64_t sub_232A66E68()
{
  return MEMORY[0x270F6EA58]();
}

uint64_t sub_232A66E78()
{
  return MEMORY[0x270F6EA60]();
}

uint64_t sub_232A66E88()
{
  return MEMORY[0x270F6EA68]();
}

uint64_t sub_232A66E98()
{
  return MEMORY[0x270F6EBA8]();
}

uint64_t sub_232A66EA8()
{
  return MEMORY[0x270F6EBB8]();
}

uint64_t sub_232A66EB8()
{
  return MEMORY[0x270F6ECD0]();
}

uint64_t sub_232A66EC8()
{
  return MEMORY[0x270F6EDD0]();
}

uint64_t sub_232A66ED8()
{
  return MEMORY[0x270F6EDD8]();
}

uint64_t sub_232A66EE8()
{
  return MEMORY[0x270F6EDE0]();
}

uint64_t sub_232A66EF8()
{
  return MEMORY[0x270F6EDE8]();
}

uint64_t sub_232A66F08()
{
  return MEMORY[0x270F6EE08]();
}

uint64_t sub_232A66F18()
{
  return MEMORY[0x270F6EE40]();
}

uint64_t sub_232A66F28()
{
  return MEMORY[0x270F6EE50]();
}

uint64_t sub_232A66F38()
{
  return MEMORY[0x270F6EEA0]();
}

uint64_t sub_232A66F48()
{
  return MEMORY[0x270F6EEA8]();
}

uint64_t sub_232A66F58()
{
  return MEMORY[0x270F6EED0]();
}

uint64_t sub_232A66F68()
{
  return MEMORY[0x270F6EED8]();
}

uint64_t sub_232A66F78()
{
  return MEMORY[0x270F6EF08]();
}

uint64_t sub_232A66F88()
{
  return MEMORY[0x270F6EF10]();
}

uint64_t sub_232A66F98()
{
  return MEMORY[0x270F6EF20]();
}

uint64_t sub_232A66FA8()
{
  return MEMORY[0x270F6EF88]();
}

uint64_t sub_232A66FB8()
{
  return MEMORY[0x270F6EF90]();
}

uint64_t sub_232A66FC8()
{
  return MEMORY[0x270F6F110]();
}

uint64_t sub_232A66FD8()
{
  return MEMORY[0x270F6F140]();
}

uint64_t sub_232A66FE8()
{
  return MEMORY[0x270F6F148]();
}

uint64_t sub_232A66FF8()
{
  return MEMORY[0x270F6F238]();
}

uint64_t sub_232A67008()
{
  return MEMORY[0x270F6F240]();
}

uint64_t sub_232A67018()
{
  return MEMORY[0x270F6F280]();
}

uint64_t sub_232A67028()
{
  return MEMORY[0x270F6F320]();
}

uint64_t sub_232A67038()
{
  return MEMORY[0x270F6F328]();
}

uint64_t sub_232A67048()
{
  return MEMORY[0x270F6F330]();
}

uint64_t sub_232A67058()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_232A67068()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_232A67078()
{
  return MEMORY[0x270F6F368]();
}

uint64_t sub_232A67088()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_232A67098()
{
  return MEMORY[0x270F6F4A8]();
}

uint64_t sub_232A670A8()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_232A670B8()
{
  return MEMORY[0x270F728E8]();
}

uint64_t sub_232A670C8()
{
  return MEMORY[0x270F683E0]();
}

uint64_t sub_232A670D8()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_232A670E8()
{
  return MEMORY[0x270F728F0]();
}

uint64_t sub_232A670F8()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_232A67108()
{
  return MEMORY[0x270F72910]();
}

uint64_t sub_232A67118()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_232A67128()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_232A67138()
{
  return MEMORY[0x270F68418]();
}

uint64_t sub_232A67148()
{
  return MEMORY[0x270F72A50]();
}

uint64_t sub_232A67158()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_232A67168()
{
  return MEMORY[0x270F72AA8]();
}

uint64_t sub_232A67178()
{
  return MEMORY[0x270F72C28]();
}

uint64_t sub_232A67188()
{
  return MEMORY[0x270F72C30]();
}

uint64_t sub_232A67198()
{
  return MEMORY[0x270F72C38]();
}

uint64_t sub_232A671A8()
{
  return MEMORY[0x270F64E30]();
}

uint64_t sub_232A671B8()
{
  return MEMORY[0x270F64E40]();
}

uint64_t sub_232A671C8()
{
  return MEMORY[0x270F64E58]();
}

uint64_t sub_232A671D8()
{
  return MEMORY[0x270F64E68]();
}

uint64_t sub_232A671E8()
{
  return MEMORY[0x270F64E70]();
}

uint64_t sub_232A671F8()
{
  return MEMORY[0x270F64E78]();
}

uint64_t sub_232A67208()
{
  return MEMORY[0x270F64E80]();
}

uint64_t sub_232A67218()
{
  return MEMORY[0x270F64E88]();
}

uint64_t sub_232A67228()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_232A67238()
{
  return MEMORY[0x270F64F30]();
}

uint64_t sub_232A67248()
{
  return MEMORY[0x270F64F48]();
}

uint64_t sub_232A67258()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_232A67268()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_232A67278()
{
  return MEMORY[0x270F63AD8]();
}

uint64_t sub_232A67288()
{
  return MEMORY[0x270F63AE0]();
}

uint64_t sub_232A67298()
{
  return MEMORY[0x270F63AE8]();
}

uint64_t sub_232A672A8()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_232A672B8()
{
  return MEMORY[0x270F0C808]();
}

uint64_t sub_232A672C8()
{
  return MEMORY[0x270F0C818]();
}

uint64_t sub_232A672D8()
{
  return MEMORY[0x270F0C820]();
}

uint64_t sub_232A672E8()
{
  return MEMORY[0x270F0C830]();
}

uint64_t sub_232A672F8()
{
  return MEMORY[0x270F0C840]();
}

uint64_t sub_232A67308()
{
  return MEMORY[0x270F0C858]();
}

uint64_t sub_232A67318()
{
  return MEMORY[0x270F0C868]();
}

uint64_t sub_232A67328()
{
  return MEMORY[0x270F0C870]();
}

uint64_t sub_232A67338()
{
  return MEMORY[0x270F0C888]();
}

uint64_t sub_232A67348()
{
  return MEMORY[0x270F0C898]();
}

uint64_t sub_232A67358()
{
  return MEMORY[0x270F0C8A8]();
}

uint64_t _s26SiriPlaybackControlIntents19AccessoryItemEntityCfd_0()
{
  return MEMORY[0x270F0C8B0]();
}

uint64_t sub_232A67378()
{
  return MEMORY[0x270F0C8C0]();
}

uint64_t sub_232A673A8()
{
  return MEMORY[0x270F0C9F8]();
}

uint64_t sub_232A673B8()
{
  return MEMORY[0x270F0CA08]();
}

uint64_t sub_232A673C8()
{
  return MEMORY[0x270F0CA10]();
}

uint64_t sub_232A673D8()
{
  return MEMORY[0x270F0CA30]();
}

uint64_t sub_232A673E8()
{
  return MEMORY[0x270F0CA40]();
}

uint64_t sub_232A673F8()
{
  return MEMORY[0x270F0CA50]();
}

uint64_t sub_232A67408()
{
  return MEMORY[0x270F0CA58]();
}

uint64_t sub_232A67418()
{
  return MEMORY[0x270F0CA70]();
}

uint64_t sub_232A67428()
{
  return MEMORY[0x270F0CB10]();
}

uint64_t sub_232A67458()
{
  return MEMORY[0x270F71678]();
}

uint64_t sub_232A67468()
{
  return MEMORY[0x270F71680]();
}

uint64_t sub_232A67488()
{
  return MEMORY[0x270F71CC8]();
}

uint64_t sub_232A67498()
{
  return MEMORY[0x270F71CE0]();
}

uint64_t sub_232A674A8()
{
  return MEMORY[0x270F63C38]();
}

uint64_t sub_232A674B8()
{
  return MEMORY[0x270F63C40]();
}

uint64_t sub_232A674C8()
{
  return MEMORY[0x270F63C48]();
}

uint64_t sub_232A674D8()
{
  return MEMORY[0x270F63C50]();
}

uint64_t sub_232A674E8()
{
  return MEMORY[0x270F63C58]();
}

uint64_t sub_232A674F8()
{
  return MEMORY[0x270F63C60]();
}

uint64_t sub_232A67508()
{
  return MEMORY[0x270F63C68]();
}

uint64_t sub_232A67518()
{
  return MEMORY[0x270F63C70]();
}

uint64_t sub_232A67528()
{
  return MEMORY[0x270F63C78]();
}

uint64_t sub_232A67538()
{
  return MEMORY[0x270F63C80]();
}

uint64_t sub_232A67548()
{
  return MEMORY[0x270F63C88]();
}

uint64_t sub_232A67558()
{
  return MEMORY[0x270F652C8]();
}

uint64_t sub_232A67568()
{
  return MEMORY[0x270F652D8]();
}

uint64_t sub_232A67578()
{
  return MEMORY[0x270F652F8]();
}

uint64_t sub_232A67588()
{
  return MEMORY[0x270F65300]();
}

uint64_t sub_232A67598()
{
  return MEMORY[0x270F65390]();
}

uint64_t sub_232A675A8()
{
  return MEMORY[0x270F65398]();
}

uint64_t sub_232A675B8()
{
  return MEMORY[0x270F653A0]();
}

uint64_t sub_232A675C8()
{
  return MEMORY[0x270F653A8]();
}

uint64_t sub_232A675D8()
{
  return MEMORY[0x270F653C8]();
}

uint64_t sub_232A675E8()
{
  return MEMORY[0x270F653D8]();
}

uint64_t sub_232A675F8()
{
  return MEMORY[0x270F653E0]();
}

uint64_t sub_232A67608()
{
  return MEMORY[0x270F653F0]();
}

uint64_t sub_232A67618()
{
  return MEMORY[0x270F66050]();
}

uint64_t sub_232A67628()
{
  return MEMORY[0x270F66068]();
}

uint64_t sub_232A67638()
{
  return MEMORY[0x270F660A0]();
}

uint64_t sub_232A67648()
{
  return MEMORY[0x270F660D0]();
}

uint64_t sub_232A67658()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_232A67668()
{
  return MEMORY[0x270F6FAC0]();
}

uint64_t sub_232A67678()
{
  return MEMORY[0x270F6FAC8]();
}

uint64_t sub_232A67688()
{
  return MEMORY[0x270F6FAD0]();
}

uint64_t sub_232A67698()
{
  return MEMORY[0x270F6FAD8]();
}

uint64_t sub_232A676A8()
{
  return MEMORY[0x270F6FAE0]();
}

uint64_t sub_232A676B8()
{
  return MEMORY[0x270F6FAE8]();
}

uint64_t sub_232A676C8()
{
  return MEMORY[0x270F6FAF0]();
}

uint64_t sub_232A676D8()
{
  return MEMORY[0x270F6FAF8]();
}

uint64_t sub_232A676E8()
{
  return MEMORY[0x270F6FB00]();
}

uint64_t sub_232A676F8()
{
  return MEMORY[0x270F6FB08]();
}

uint64_t sub_232A67708()
{
  return MEMORY[0x270F6FB10]();
}

uint64_t sub_232A67718()
{
  return MEMORY[0x270F6FB18]();
}

uint64_t sub_232A67728()
{
  return MEMORY[0x270F6FB20]();
}

uint64_t sub_232A67738()
{
  return MEMORY[0x270F6FB28]();
}

uint64_t sub_232A67748()
{
  return MEMORY[0x270F6FB30]();
}

uint64_t sub_232A67758()
{
  return MEMORY[0x270F6FB38]();
}

uint64_t sub_232A67768()
{
  return MEMORY[0x270F6FB40]();
}

uint64_t sub_232A67778()
{
  return MEMORY[0x270F6FB48]();
}

uint64_t sub_232A67788()
{
  return MEMORY[0x270F6FB50]();
}

uint64_t sub_232A67798()
{
  return MEMORY[0x270F6FB58]();
}

uint64_t sub_232A677A8()
{
  return MEMORY[0x270F6FB60]();
}

uint64_t sub_232A677B8()
{
  return MEMORY[0x270F6FB68]();
}

uint64_t sub_232A677C8()
{
  return MEMORY[0x270F6FB70]();
}

uint64_t sub_232A677D8()
{
  return MEMORY[0x270F6FB78]();
}

uint64_t sub_232A677E8()
{
  return MEMORY[0x270F6FB80]();
}

uint64_t sub_232A677F8()
{
  return MEMORY[0x270F6FB88]();
}

uint64_t sub_232A67808()
{
  return MEMORY[0x270F6FB90]();
}

uint64_t sub_232A67818()
{
  return MEMORY[0x270F6FB98]();
}

uint64_t sub_232A67828()
{
  return MEMORY[0x270F6FBA0]();
}

uint64_t sub_232A67838()
{
  return MEMORY[0x270F6FBA8]();
}

uint64_t sub_232A67848()
{
  return MEMORY[0x270F6FBB0]();
}

uint64_t sub_232A67858()
{
  return MEMORY[0x270F6FBB8]();
}

uint64_t sub_232A67868()
{
  return MEMORY[0x270F6FBC0]();
}

uint64_t sub_232A67878()
{
  return MEMORY[0x270F6FBC8]();
}

uint64_t sub_232A67888()
{
  return MEMORY[0x270F6FBD0]();
}

uint64_t sub_232A67898()
{
  return MEMORY[0x270F6FBD8]();
}

uint64_t sub_232A678A8()
{
  return MEMORY[0x270F6FBE0]();
}

uint64_t sub_232A678B8()
{
  return MEMORY[0x270F6FBE8]();
}

uint64_t sub_232A678C8()
{
  return MEMORY[0x270F6FBF0]();
}

uint64_t sub_232A678D8()
{
  return MEMORY[0x270F6FBF8]();
}

uint64_t sub_232A678E8()
{
  return MEMORY[0x270F6FC00]();
}

uint64_t sub_232A678F8()
{
  return MEMORY[0x270F6FC08]();
}

uint64_t sub_232A67908()
{
  return MEMORY[0x270F6FC10]();
}

uint64_t sub_232A67918()
{
  return MEMORY[0x270F6FC18]();
}

uint64_t sub_232A67928()
{
  return MEMORY[0x270F6FC20]();
}

uint64_t sub_232A67938()
{
  return MEMORY[0x270F6FC28]();
}

uint64_t sub_232A67948()
{
  return MEMORY[0x270F6FC30]();
}

uint64_t sub_232A67958()
{
  return MEMORY[0x270F6FC38]();
}

uint64_t sub_232A67968()
{
  return MEMORY[0x270F6FC40]();
}

uint64_t sub_232A67978()
{
  return MEMORY[0x270F6FC48]();
}

uint64_t sub_232A67988()
{
  return MEMORY[0x270F6FC50]();
}

uint64_t sub_232A67998()
{
  return MEMORY[0x270F6FC58]();
}

uint64_t sub_232A679A8()
{
  return MEMORY[0x270F6FC60]();
}

uint64_t sub_232A679B8()
{
  return MEMORY[0x270F6FC68]();
}

uint64_t sub_232A679C8()
{
  return MEMORY[0x270F6FC70]();
}

uint64_t sub_232A679D8()
{
  return MEMORY[0x270F6FC78]();
}

uint64_t sub_232A679E8()
{
  return MEMORY[0x270F6FC80]();
}

uint64_t sub_232A679F8()
{
  return MEMORY[0x270F6FC88]();
}

uint64_t sub_232A67A08()
{
  return MEMORY[0x270F6FC90]();
}

uint64_t sub_232A67A18()
{
  return MEMORY[0x270F6FC98]();
}

uint64_t sub_232A67A28()
{
  return MEMORY[0x270F6FCA0]();
}

uint64_t sub_232A67A38()
{
  return MEMORY[0x270F6FCA8]();
}

uint64_t sub_232A67A48()
{
  return MEMORY[0x270F6FCB0]();
}

uint64_t sub_232A67A58()
{
  return MEMORY[0x270F6FCB8]();
}

uint64_t sub_232A67A68()
{
  return MEMORY[0x270F6FCC0]();
}

uint64_t sub_232A67A78()
{
  return MEMORY[0x270F6FCC8]();
}

uint64_t sub_232A67A88()
{
  return MEMORY[0x270F6FCD0]();
}

uint64_t sub_232A67A98()
{
  return MEMORY[0x270F6FCD8]();
}

uint64_t sub_232A67AA8()
{
  return MEMORY[0x270F6FCE0]();
}

uint64_t sub_232A67AB8()
{
  return MEMORY[0x270F6FCE8]();
}

uint64_t sub_232A67AC8()
{
  return MEMORY[0x270F6FCF0]();
}

uint64_t sub_232A67AD8()
{
  return MEMORY[0x270F6FCF8]();
}

uint64_t sub_232A67AE8()
{
  return MEMORY[0x270F6FD00]();
}

uint64_t sub_232A67AF8()
{
  return MEMORY[0x270F6FD08]();
}

uint64_t sub_232A67B08()
{
  return MEMORY[0x270F6FD10]();
}

uint64_t sub_232A67B18()
{
  return MEMORY[0x270F6FD18]();
}

uint64_t sub_232A67B28()
{
  return MEMORY[0x270F6FD20]();
}

uint64_t sub_232A67B38()
{
  return MEMORY[0x270F6FD28]();
}

uint64_t sub_232A67B48()
{
  return MEMORY[0x270F6FD30]();
}

uint64_t sub_232A67B58()
{
  return MEMORY[0x270F6FD38]();
}

uint64_t sub_232A67B68()
{
  return MEMORY[0x270F6FD40]();
}

uint64_t sub_232A67B88()
{
  return MEMORY[0x270F6FD50]();
}

uint64_t sub_232A67B98()
{
  return MEMORY[0x270F6FD58]();
}

uint64_t sub_232A67BA8()
{
  return MEMORY[0x270F6FD60]();
}

uint64_t sub_232A67BB8()
{
  return MEMORY[0x270F6FD68]();
}

uint64_t sub_232A67BC8()
{
  return MEMORY[0x270F6FD70]();
}

uint64_t sub_232A67BD8()
{
  return MEMORY[0x270F6FD78]();
}

uint64_t sub_232A67BE8()
{
  return MEMORY[0x270F6FD80]();
}

uint64_t sub_232A67BF8()
{
  return MEMORY[0x270F6FD88]();
}

uint64_t sub_232A67C08()
{
  return MEMORY[0x270F6FD90]();
}

uint64_t sub_232A67C18()
{
  return MEMORY[0x270F6FD98]();
}

uint64_t sub_232A67C28()
{
  return MEMORY[0x270F6FDA0]();
}

uint64_t sub_232A67C38()
{
  return MEMORY[0x270F6FDA8]();
}

uint64_t sub_232A67C48()
{
  return MEMORY[0x270F6FDB0]();
}

uint64_t sub_232A67C58()
{
  return MEMORY[0x270F6FDB8]();
}

uint64_t sub_232A67C68()
{
  return MEMORY[0x270F6FDC0]();
}

uint64_t sub_232A67C78()
{
  return MEMORY[0x270F6FDC8]();
}

uint64_t sub_232A67C88()
{
  return MEMORY[0x270F6FDD0]();
}

uint64_t sub_232A67C98()
{
  return MEMORY[0x270F6FDD8]();
}

uint64_t sub_232A67CA8()
{
  return MEMORY[0x270F6FDE0]();
}

uint64_t sub_232A67CB8()
{
  return MEMORY[0x270F6FE28]();
}

uint64_t sub_232A67CC8()
{
  return MEMORY[0x270F6FE30]();
}

uint64_t sub_232A67CD8()
{
  return MEMORY[0x270F6FE38]();
}

uint64_t sub_232A67CE8()
{
  return MEMORY[0x270F6FE40]();
}

uint64_t sub_232A67D08()
{
  return MEMORY[0x270F6FE50]();
}

uint64_t sub_232A67D28()
{
  return MEMORY[0x270F6FE60]();
}

uint64_t sub_232A67D78()
{
  return MEMORY[0x270F6FE88]();
}

uint64_t sub_232A67DC8()
{
  return MEMORY[0x270F6FEB0]();
}

uint64_t sub_232A67DD8()
{
  return MEMORY[0x270F6FEB8]();
}

uint64_t sub_232A67DE8()
{
  return MEMORY[0x270F6FEC0]();
}

uint64_t sub_232A67DF8()
{
  return MEMORY[0x270F6FEC8]();
}

uint64_t sub_232A67E08()
{
  return MEMORY[0x270F6FED0]();
}

uint64_t sub_232A67E18()
{
  return MEMORY[0x270F6FED8]();
}

uint64_t sub_232A67E28()
{
  return MEMORY[0x270F6FEE0]();
}

uint64_t sub_232A67E38()
{
  return MEMORY[0x270F6FEE8]();
}

uint64_t sub_232A67E48()
{
  return MEMORY[0x270F6FEF0]();
}

uint64_t sub_232A67E58()
{
  return MEMORY[0x270F6FEF8]();
}

uint64_t sub_232A67E68()
{
  return MEMORY[0x270F6FF00]();
}

uint64_t sub_232A67E78()
{
  return MEMORY[0x270F6FF08]();
}

uint64_t sub_232A67E88()
{
  return MEMORY[0x270F6FF10]();
}

uint64_t sub_232A67E98()
{
  return MEMORY[0x270F6FF18]();
}

uint64_t sub_232A67EA8()
{
  return MEMORY[0x270F6FF20]();
}

uint64_t sub_232A67EB8()
{
  return MEMORY[0x270F6FF28]();
}

uint64_t sub_232A67EC8()
{
  return MEMORY[0x270F6FF30]();
}

uint64_t sub_232A67ED8()
{
  return MEMORY[0x270F6FF38]();
}

uint64_t sub_232A67EE8()
{
  return MEMORY[0x270F6FF40]();
}

uint64_t sub_232A67EF8()
{
  return MEMORY[0x270F6FF48]();
}

uint64_t sub_232A67F08()
{
  return MEMORY[0x270F6FF50]();
}

uint64_t sub_232A67F18()
{
  return MEMORY[0x270F6FF58]();
}

uint64_t sub_232A67F28()
{
  return MEMORY[0x270F6FF60]();
}

uint64_t sub_232A67F38()
{
  return MEMORY[0x270F6FF68]();
}

uint64_t sub_232A67F48()
{
  return MEMORY[0x270F6FF70]();
}

uint64_t sub_232A67F58()
{
  return MEMORY[0x270F6FF78]();
}

uint64_t sub_232A67F68()
{
  return MEMORY[0x270F6FF80]();
}

uint64_t sub_232A67F78()
{
  return MEMORY[0x270F6FF88]();
}

uint64_t sub_232A67F88()
{
  return MEMORY[0x270F6FF90]();
}

uint64_t sub_232A67F98()
{
  return MEMORY[0x270F6FF98]();
}

uint64_t sub_232A67FA8()
{
  return MEMORY[0x270F6FFA0]();
}

uint64_t sub_232A67FB8()
{
  return MEMORY[0x270F6FFA8]();
}

uint64_t sub_232A67FC8()
{
  return MEMORY[0x270F6FFB0]();
}

uint64_t sub_232A67FD8()
{
  return MEMORY[0x270F6FFB8]();
}

uint64_t sub_232A67FE8()
{
  return MEMORY[0x270F6FFC0]();
}

uint64_t sub_232A67FF8()
{
  return MEMORY[0x270F6FFC8]();
}

uint64_t sub_232A68008()
{
  return MEMORY[0x270F6FFD0]();
}

uint64_t sub_232A68018()
{
  return MEMORY[0x270F6FFD8]();
}

uint64_t sub_232A68028()
{
  return MEMORY[0x270F6FFE0]();
}

uint64_t sub_232A68038()
{
  return MEMORY[0x270F6FFE8]();
}

uint64_t sub_232A68048()
{
  return MEMORY[0x270F6FFF0]();
}

uint64_t sub_232A68058()
{
  return MEMORY[0x270F6FFF8]();
}

uint64_t sub_232A68068()
{
  return MEMORY[0x270F70000]();
}

uint64_t sub_232A68078()
{
  return MEMORY[0x270F70008]();
}

uint64_t sub_232A68088()
{
  return MEMORY[0x270F70010]();
}

uint64_t sub_232A68098()
{
  return MEMORY[0x270F70018]();
}

uint64_t sub_232A680A8()
{
  return MEMORY[0x270F70020]();
}

uint64_t sub_232A680B8()
{
  return MEMORY[0x270F70028]();
}

uint64_t sub_232A680C8()
{
  return MEMORY[0x270F70030]();
}

uint64_t sub_232A680D8()
{
  return MEMORY[0x270F70038]();
}

uint64_t sub_232A680E8()
{
  return MEMORY[0x270F70040]();
}

uint64_t sub_232A680F8()
{
  return MEMORY[0x270F70048]();
}

uint64_t sub_232A68108()
{
  return MEMORY[0x270F70050]();
}

uint64_t sub_232A68118()
{
  return MEMORY[0x270F70058]();
}

uint64_t sub_232A68128()
{
  return MEMORY[0x270F70060]();
}

uint64_t sub_232A68138()
{
  return MEMORY[0x270F70068]();
}

uint64_t sub_232A68148()
{
  return MEMORY[0x270F70070]();
}

uint64_t sub_232A68158()
{
  return MEMORY[0x270F70078]();
}

uint64_t sub_232A68168()
{
  return MEMORY[0x270F70080]();
}

uint64_t sub_232A68178()
{
  return MEMORY[0x270F70088]();
}

uint64_t sub_232A68188()
{
  return MEMORY[0x270F70090]();
}

uint64_t sub_232A68198()
{
  return MEMORY[0x270F70098]();
}

uint64_t sub_232A681A8()
{
  return MEMORY[0x270F700A0]();
}

uint64_t sub_232A681B8()
{
  return MEMORY[0x270F700A8]();
}

uint64_t sub_232A681C8()
{
  return MEMORY[0x270F700B0]();
}

uint64_t sub_232A681D8()
{
  return MEMORY[0x270F700B8]();
}

uint64_t sub_232A681E8()
{
  return MEMORY[0x270F700C0]();
}

uint64_t sub_232A68208()
{
  return MEMORY[0x270F700D0]();
}

uint64_t sub_232A68218()
{
  return MEMORY[0x270F700D8]();
}

uint64_t sub_232A68228()
{
  return MEMORY[0x270F700E0]();
}

uint64_t sub_232A68238()
{
  return MEMORY[0x270F700E8]();
}

uint64_t sub_232A68248()
{
  return MEMORY[0x270F700F0]();
}

uint64_t sub_232A68258()
{
  return MEMORY[0x270F700F8]();
}

uint64_t sub_232A68268()
{
  return MEMORY[0x270F70100]();
}

uint64_t sub_232A68278()
{
  return MEMORY[0x270F70108]();
}

uint64_t sub_232A68288()
{
  return MEMORY[0x270F70110]();
}

uint64_t sub_232A68298()
{
  return MEMORY[0x270F70118]();
}

uint64_t sub_232A682A8()
{
  return MEMORY[0x270F70120]();
}

uint64_t sub_232A682B8()
{
  return MEMORY[0x270F70128]();
}

uint64_t sub_232A682C8()
{
  return MEMORY[0x270F72DE8]();
}

uint64_t sub_232A682D8()
{
  return MEMORY[0x270F72DF0]();
}

uint64_t sub_232A682E8()
{
  return MEMORY[0x270F72DF8]();
}

uint64_t sub_232A682F8()
{
  return MEMORY[0x270F72E90]();
}

uint64_t sub_232A68308()
{
  return MEMORY[0x270F72EA0]();
}

uint64_t sub_232A68318()
{
  return MEMORY[0x270F72EA8]();
}

uint64_t sub_232A68328()
{
  return MEMORY[0x270F72EB0]();
}

uint64_t sub_232A68338()
{
  return MEMORY[0x270F72EF8]();
}

uint64_t sub_232A68348()
{
  return MEMORY[0x270F72F00]();
}

uint64_t sub_232A68358()
{
  return MEMORY[0x270F72F08]();
}

uint64_t sub_232A68368()
{
  return MEMORY[0x270F72F10]();
}

uint64_t sub_232A68378()
{
  return MEMORY[0x270F72F18]();
}

uint64_t sub_232A68388()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_232A68398()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_232A683A8()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_232A683B8()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_232A683C8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_232A683D8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_232A683E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_232A683F8()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_232A68408()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_232A68418()
{
  return MEMORY[0x270F70A78]();
}

uint64_t sub_232A68428()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_232A68438()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_232A68448()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_232A68458()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_232A68468()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_232A68478()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_232A68488()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_232A68498()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_232A684A8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_232A684B8()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_232A684C8()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_232A684D8()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_232A684E8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_232A684F8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_232A68508()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_232A68518()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_232A68538()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_232A68548()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_232A68558()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_232A68568()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_232A68578()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_232A68588()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_232A68598()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_232A685A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_232A685B8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_232A685C8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_232A685D8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_232A685E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_232A685F8()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_232A68608()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_232A68618()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_232A68628()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_232A68638()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_232A68648()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_232A68658()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_232A68668()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_232A68678()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_232A68688()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_232A68698()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_232A686A8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_232A686B8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_232A686C8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_232A686D8()
{
  return MEMORY[0x270EF1BE8]();
}

uint64_t sub_232A686E8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_232A686F8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_232A68708()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_232A68718()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_232A68728()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_232A68738()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_232A68748()
{
  return MEMORY[0x270EF1C38]();
}

uint64_t sub_232A68758()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_232A68768()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_232A68778()
{
  return MEMORY[0x270F9DDF8]();
}

uint64_t sub_232A68788()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_232A68798()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_232A687A8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_232A687B8()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_232A687C8()
{
  return MEMORY[0x270EF1D10]();
}

uint64_t sub_232A687D8()
{
  return MEMORY[0x270F70130]();
}

uint64_t sub_232A687E8()
{
  return MEMORY[0x270F70138]();
}

uint64_t sub_232A687F8()
{
  return MEMORY[0x270F70140]();
}

uint64_t sub_232A68808()
{
  return MEMORY[0x270F70148]();
}

uint64_t sub_232A68818()
{
  return MEMORY[0x270F68430]();
}

uint64_t sub_232A68828()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_232A68838()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_232A68848()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_232A68858()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_232A68868()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_232A68878()
{
  return MEMORY[0x270FA1070]();
}

uint64_t sub_232A68888()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_232A68898()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_232A688A8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_232A688B8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_232A688C8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_232A688D8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_232A688E8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_232A688F8()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_232A68908()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_232A68918()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_232A68928()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_232A68938()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_232A68948()
{
  return MEMORY[0x270F6F4E0]();
}

uint64_t sub_232A68958()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_232A68968()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_232A68978()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_232A68988()
{
  return MEMORY[0x270F70150]();
}

uint64_t sub_232A68998()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_232A689A8()
{
  return MEMORY[0x270F66298]();
}

uint64_t sub_232A689B8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_232A689C8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_232A689D8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_232A689E8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_232A689F8()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_232A68A08()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_232A68A18()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_232A68A28()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_232A68A38()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_232A68A48()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_232A68A58()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_232A68A68()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_232A68A78()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_232A68A88()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_232A68A98()
{
  return MEMORY[0x270F9E778]();
}

uint64_t sub_232A68AA8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_232A68AB8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_232A68AC8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_232A68AD8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_232A68AE8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_232A68AF8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_232A68B08()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_232A68B18()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_232A68B28()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_232A68B38()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_232A68B48()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_232A68B58()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_232A68B68()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_232A68B78()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_232A68B88()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_232A68B98()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_232A68BA8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_232A68BB8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_232A68BC8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_232A68BD8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_232A68BE8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_232A68BF8()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_232A68C08()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_232A68C18()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_232A68C28()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_232A68C38()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_232A68C48()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_232A68C58()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_232A68C68()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_232A68C78()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_232A68C98()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_232A68CA8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_232A68CB8()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_232A68CC8()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_232A68CD8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_232A68CE8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_232A68CF8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_232A68D08()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_232A68D18()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_232A68D28()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_232A68D38()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_232A68D48()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_232A68D58()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_232A68D68()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_232A68D78()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_232A68D88()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_232A68D98()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_232A68DA8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_232A68DC8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_232A68DD8()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_232A68DE8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_232A68DF8()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_232A68E08()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_232A68E18()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_232A68E28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_232A68E38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_232A68E48()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_232A68E58()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_232A68E68()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_232A68E78()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_232A68E88()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_232A68E98()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_232A68EA8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_232A68EB8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_232A68EC8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_232A68ED8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_232A68EE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_232A68F08()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_232A68F18()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_232A68F28()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_232A68F58()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFAnalyticsContextCreateForCrossDeviceCommandHandledWithServiceDeviceContexts()
{
  return MEMORY[0x270F0EBE8]();
}

uint64_t AFAnalyticsEventTypeGetName()
{
  return MEMORY[0x270F0EC20]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x270F0EDD0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t INTypedObjectWithCustomObject()
{
  return MEMORY[0x270EF52D0]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x270FA0220]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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