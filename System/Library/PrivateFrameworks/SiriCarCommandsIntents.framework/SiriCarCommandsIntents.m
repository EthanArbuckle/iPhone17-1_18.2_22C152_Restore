id SetTrunkStatusIntent.__allocating_init()()
{
  objc_class *v0;
  id v1;
  uint64_t vars8;

  v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SetTrunkStatusIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetTrunkStatusIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetTrunkStatusIntent()
{
  return self;
}

id SetTrunkStatusIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetTrunkStatusIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetTrunkStatusIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetTrunkStatusIntent.__deallocating_deinit()
{
  return sub_23F98D3DC(type metadata accessor for SetTrunkStatusIntent);
}

unint64_t SetTrunkStatusIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98D454(a1);
}

BOOL sub_23F98CE30(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23F98CE44()
{
  return sub_23F991C48();
}

uint64_t sub_23F98CE8C()
{
  return sub_23F991C38();
}

uint64_t sub_23F98CEB8()
{
  return sub_23F991C48();
}

unint64_t sub_23F98CEFC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_23F98D454(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_23F98CF30(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t variable initialization expression of SetTrunkStatusIntentResponse.code()
{
  return 0;
}

uint64_t SetTrunkStatusIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetTrunkStatusIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_23F98D020@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR___SetTrunkStatusIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F98D074(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR___SetTrunkStatusIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

char *SetTrunkStatusIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetTrunkStatusIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetTrunkStatusIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetTrunkStatusIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetTrunkStatusIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetTrunkStatusIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetTrunkStatusIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetTrunkStatusIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetTrunkStatusIntentResponse.__deallocating_deinit()
{
  return sub_23F98D3DC(type metadata accessor for SetTrunkStatusIntentResponse);
}

id sub_23F98D3DC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t variable initialization expression of GetTrunkStatusIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarClimateIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of GetCarClimateIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarRadioStationIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarPlayClimateIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarPlaySeatSettingsIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of GetSignalActivationStatusIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of DeactivateSignalIntentResponse.code()
{
  return 0;
}

unint64_t sub_23F98D454(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for SetTrunkStatusIntentResponse()
{
  return self;
}

unint64_t sub_23F98D48C()
{
  unint64_t result = qword_268C5A288;
  if (!qword_268C5A288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A288);
  }
  return result;
}

ValueMetadata *type metadata accessor for SetTrunkStatusIntentResponseCode()
{
  return &type metadata for SetTrunkStatusIntentResponseCode;
}

id GetTrunkStatusIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GetTrunkStatusIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetTrunkStatusIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetTrunkStatusIntent()
{
  return self;
}

id GetTrunkStatusIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetTrunkStatusIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetTrunkStatusIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetTrunkStatusIntent.__deallocating_deinit()
{
  return sub_23F98DACC(type metadata accessor for GetTrunkStatusIntent);
}

unint64_t GetTrunkStatusIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98D454(a1);
}

uint64_t GetTrunkStatusIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___GetTrunkStatusIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *GetTrunkStatusIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___GetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetTrunkStatusIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___GetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetTrunkStatusIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___GetTrunkStatusIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetTrunkStatusIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetTrunkStatusIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___GetTrunkStatusIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetTrunkStatusIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetTrunkStatusIntentResponse.__deallocating_deinit()
{
  return sub_23F98DACC(type metadata accessor for GetTrunkStatusIntentResponse);
}

id sub_23F98DACC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for GetTrunkStatusIntentResponse()
{
  return self;
}

unint64_t sub_23F98DB2C()
{
  unint64_t result = qword_268C5A2F8;
  if (!qword_268C5A2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A2F8);
  }
  return result;
}

uint64_t sub_23F98DB80@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___GetTrunkStatusIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F98DBD4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___GetTrunkStatusIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetTrunkStatusIntentResponseCode()
{
  return &type metadata for GetTrunkStatusIntentResponseCode;
}

unint64_t IntentTrunkStatus.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t *sub_23F98DC50@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

id static IntentTrunkStatusResolutionResult.success(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentTrunkStatusResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_23F98DCC4(uint64_t a1, SEL *a2)
{
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);

  return v2;
}

id IntentTrunkStatusResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentTrunkStatusResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntentTrunkStatusResolutionResult()
{
  return self;
}

unint64_t sub_23F98DDB4()
{
  unint64_t result = qword_268C5A300;
  if (!qword_268C5A300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A300);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentTrunkStatus()
{
  return &type metadata for IntentTrunkStatus;
}

id SetCarClimateIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SetCarClimateIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarClimateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarClimateIntent()
{
  return self;
}

id SetCarClimateIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarClimateIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarClimateIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarClimateIntent.__deallocating_deinit()
{
  return sub_23F98E3EC(type metadata accessor for SetCarClimateIntent);
}

unint64_t SetCarClimateIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98D454(a1);
}

uint64_t SetCarClimateIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetCarClimateIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *SetCarClimateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarClimateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarClimateIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetCarClimateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarClimateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarClimateIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetCarClimateIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarClimateIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarClimateIntentResponse.__deallocating_deinit()
{
  return sub_23F98E3EC(type metadata accessor for SetCarClimateIntentResponse);
}

id sub_23F98E3EC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SetCarClimateIntentResponse()
{
  return self;
}

unint64_t sub_23F98E44C()
{
  unint64_t result = qword_268C5A310;
  if (!qword_268C5A310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A310);
  }
  return result;
}

uint64_t sub_23F98E4A0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___SetCarClimateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F98E4F4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___SetCarClimateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarClimateIntentResponseCode()
{
  return &type metadata for SetCarClimateIntentResponseCode;
}

id GetCarClimateIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GetCarClimateIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetCarClimateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetCarClimateIntent()
{
  return self;
}

id GetCarClimateIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetCarClimateIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetCarClimateIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetCarClimateIntent.__deallocating_deinit()
{
  return sub_23F98EB30(type metadata accessor for GetCarClimateIntent);
}

unint64_t GetCarClimateIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98D454(a1);
}

uint64_t GetCarClimateIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___GetCarClimateIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *GetCarClimateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___GetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetCarClimateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___GetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetCarClimateIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___GetCarClimateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetCarClimateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetCarClimateIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___GetCarClimateIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetCarClimateIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetCarClimateIntentResponse.__deallocating_deinit()
{
  return sub_23F98EB30(type metadata accessor for GetCarClimateIntentResponse);
}

id sub_23F98EB30(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for GetCarClimateIntentResponse()
{
  return self;
}

unint64_t sub_23F98EB90()
{
  unint64_t result = qword_268C5A320;
  if (!qword_268C5A320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A320);
  }
  return result;
}

uint64_t sub_23F98EBE4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___GetCarClimateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F98EC38(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___GetCarClimateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetCarClimateIntentResponseCode()
{
  return &type metadata for GetCarClimateIntentResponseCode;
}

unint64_t IntentClimate.init(rawValue:)(unint64_t a1)
{
  return sub_23F98EDC0(a1);
}

unint64_t sub_23F98ECC0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_23F98EDC0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static IntentClimateResolutionResult.success(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentClimateResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentClimateResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentClimateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_23F98EDC0(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for IntentClimateResolutionResult()
{
  return self;
}

unint64_t sub_23F98EDF8()
{
  unint64_t result = qword_268C5A328;
  if (!qword_268C5A328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A328);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentClimate()
{
  return &type metadata for IntentClimate;
}

id SetCarRadioStationIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SetCarRadioStationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarRadioStationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarRadioStationIntent()
{
  return self;
}

id SetCarRadioStationIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarRadioStationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarRadioStationIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarRadioStationIntent.__deallocating_deinit()
{
  return sub_23F98F430(type metadata accessor for SetCarRadioStationIntent);
}

unint64_t SetCarRadioStationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98D454(a1);
}

uint64_t SetCarRadioStationIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetCarRadioStationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *SetCarRadioStationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarRadioStationIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarRadioStationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarRadioStationIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarRadioStationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetCarRadioStationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarRadioStationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarRadioStationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetCarRadioStationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarRadioStationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarRadioStationIntentResponse.__deallocating_deinit()
{
  return sub_23F98F430(type metadata accessor for SetCarRadioStationIntentResponse);
}

id sub_23F98F430(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SetCarRadioStationIntentResponse()
{
  return self;
}

unint64_t sub_23F98F490()
{
  unint64_t result = qword_268C5A338;
  if (!qword_268C5A338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A338);
  }
  return result;
}

uint64_t sub_23F98F4E4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___SetCarRadioStationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F98F538(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___SetCarRadioStationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarRadioStationIntentResponseCode()
{
  return &type metadata for SetCarRadioStationIntentResponseCode;
}

id SetCarPlayClimateIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SetCarPlayClimateIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlayClimateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarPlayClimateIntent()
{
  return self;
}

id SetCarPlayClimateIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlayClimateIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlayClimateIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlayClimateIntent.__deallocating_deinit()
{
  return sub_23F98FBA8(type metadata accessor for SetCarPlayClimateIntent);
}

unint64_t SetCarPlayClimateIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98FBE0(a1);
}

unint64_t sub_23F98F780@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_23F98FBE0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t SetCarPlayClimateIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetCarPlayClimateIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *SetCarPlayClimateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlayClimateIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarPlayClimateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlayClimateIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarPlayClimateIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetCarPlayClimateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlayClimateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarPlayClimateIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetCarPlayClimateIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlayClimateIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlayClimateIntentResponse.__deallocating_deinit()
{
  return sub_23F98FBA8(type metadata accessor for SetCarPlayClimateIntentResponse);
}

id sub_23F98FBA8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_23F98FBE0(unint64_t result)
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

uint64_t type metadata accessor for SetCarPlayClimateIntentResponse()
{
  return self;
}

unint64_t sub_23F98FC2C()
{
  unint64_t result = qword_268C5A348;
  if (!qword_268C5A348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A348);
  }
  return result;
}

uint64_t sub_23F98FC80@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___SetCarPlayClimateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F98FCD4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___SetCarPlayClimateIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarPlayClimateIntentResponseCode()
{
  return &type metadata for SetCarPlayClimateIntentResponseCode;
}

id SetCarPlaySeatSettingsIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SetCarPlaySeatSettingsIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarPlaySeatSettingsIntent()
{
  return self;
}

id SetCarPlaySeatSettingsIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlaySeatSettingsIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlaySeatSettingsIntent.__deallocating_deinit()
{
  return sub_23F990310(type metadata accessor for SetCarPlaySeatSettingsIntent);
}

unint64_t SetCarPlaySeatSettingsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98FBE0(a1);
}

uint64_t SetCarPlaySeatSettingsIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *SetCarPlaySeatSettingsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarPlaySeatSettingsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarPlaySeatSettingsIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarPlaySeatSettingsIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlaySeatSettingsIntentResponse.__deallocating_deinit()
{
  return sub_23F990310(type metadata accessor for SetCarPlaySeatSettingsIntentResponse);
}

id sub_23F990310(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SetCarPlaySeatSettingsIntentResponse()
{
  return self;
}

unint64_t sub_23F990370()
{
  unint64_t result = qword_268C5A358;
  if (!qword_268C5A358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A358);
  }
  return result;
}

uint64_t sub_23F9903C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F990418(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarPlaySeatSettingsIntentResponseCode()
{
  return &type metadata for SetCarPlaySeatSettingsIntentResponseCode;
}

unint64_t IntentRadioBand.init(rawValue:)(unint64_t a1)
{
  return sub_23F9905A0(a1);
}

unint64_t sub_23F9904A0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_23F9905A0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static IntentRadioBandResolutionResult.success(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentRadioBandResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentRadioBandResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentRadioBandResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_23F9905A0(unint64_t result)
{
  if (result > 5) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for IntentRadioBandResolutionResult()
{
  return self;
}

unint64_t sub_23F9905D8()
{
  unint64_t result = qword_268C5A360;
  if (!qword_268C5A360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A360);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentRadioBand()
{
  return &type metadata for IntentRadioBand;
}

unint64_t IntentSeatType.init(rawValue:)(unint64_t a1)
{
  return sub_23F99075C(a1);
}

unint64_t sub_23F99065C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_23F99075C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

id static IntentSeatTypeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentSeatTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentSeatTypeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentSeatTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_23F99075C(unint64_t result)
{
  if (result > 0xC) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for IntentSeatTypeResolutionResult()
{
  return self;
}

unint64_t sub_23F990794()
{
  unint64_t result = qword_268C5A368;
  if (!qword_268C5A368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A368);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentSeatType()
{
  return &type metadata for IntentSeatType;
}

unint64_t IntentRelativeTemperatureChange.init(rawValue:)(unint64_t a1)
{
  return sub_23F98EDC0(a1);
}

id static IntentRelativeTemperatureChangeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentRelativeTemperatureChangeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentRelativeTemperatureChangeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentRelativeTemperatureChangeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntentRelativeTemperatureChangeResolutionResult()
{
  return self;
}

unint64_t sub_23F99090C()
{
  unint64_t result = qword_268C5A370;
  if (!qword_268C5A370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A370);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentRelativeTemperatureChange()
{
  return &type metadata for IntentRelativeTemperatureChange;
}

unint64_t IntentTemperatureChange.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

id static IntentTemperatureChangeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentTemperatureChangeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_23F98DCC4(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentTemperatureChangeResolutionResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentTemperatureChangeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntentTemperatureChangeResolutionResult()
{
  return self;
}

unint64_t sub_23F990A78()
{
  unint64_t result = qword_268C5A378;
  if (!qword_268C5A378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A378);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentTemperatureChange()
{
  return &type metadata for IntentTemperatureChange;
}

id GetSignalActivationStatusIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GetSignalActivationStatusIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetSignalActivationStatusIntent()
{
  return self;
}

id GetSignalActivationStatusIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetSignalActivationStatusIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSignalActivationStatusIntent.__deallocating_deinit()
{
  return sub_23F991194(type metadata accessor for GetSignalActivationStatusIntent);
}

unint64_t GetSignalActivationStatusIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98D454(a1);
}

uint64_t GetSignalActivationStatusIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___GetSignalActivationStatusIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *GetSignalActivationStatusIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetSignalActivationStatusIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetSignalActivationStatusIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetSignalActivationStatusIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSignalActivationStatusIntentResponse.__deallocating_deinit()
{
  return sub_23F991194(type metadata accessor for GetSignalActivationStatusIntentResponse);
}

uint64_t GetSignalActivationStatusCarSignalUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL) {
    return 0;
  }
  return result;
}

uint64_t *sub_23F9910D0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  unint64_t v3 = *result - 4;
  BOOL v4 = __CFADD__(v3, 3);
  BOOL v5 = v3 < 0xFFFFFFFFFFFFFFFDLL;
  if (!v4) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

id static GetSignalActivationStatusCarSignalResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);

  return v1;
}

id GetSignalActivationStatusCarSignalResolutionResult.__deallocating_deinit()
{
  return sub_23F991194(type metadata accessor for GetSignalActivationStatusCarSignalResolutionResult);
}

id sub_23F991194(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for GetSignalActivationStatusIntentResponse()
{
  return self;
}

uint64_t type metadata accessor for GetSignalActivationStatusCarSignalResolutionResult()
{
  return self;
}

unint64_t sub_23F991218()
{
  unint64_t result = qword_268C5A388;
  if (!qword_268C5A388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A388);
  }
  return result;
}

unint64_t sub_23F991270()
{
  unint64_t result = qword_268C5A390;
  if (!qword_268C5A390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A390);
  }
  return result;
}

uint64_t sub_23F9912C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___GetSignalActivationStatusIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F991318(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___GetSignalActivationStatusIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetSignalActivationStatusIntentResponseCode()
{
  return &type metadata for GetSignalActivationStatusIntentResponseCode;
}

ValueMetadata *type metadata accessor for GetSignalActivationStatusCarSignalUnsupportedReason()
{
  return &type metadata for GetSignalActivationStatusCarSignalUnsupportedReason;
}

id DeactivateSignalIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id DeactivateSignalIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeactivateSignalIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DeactivateSignalIntent()
{
  return self;
}

id DeactivateSignalIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DeactivateSignalIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeactivateSignalIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DeactivateSignalIntent.__deallocating_deinit()
{
  return sub_23F991A2C(type metadata accessor for DeactivateSignalIntent);
}

unint64_t DeactivateSignalIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_23F98D454(a1);
}

uint64_t DeactivateSignalIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___DeactivateSignalIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *DeactivateSignalIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___DeactivateSignalIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *DeactivateSignalIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___DeactivateSignalIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id DeactivateSignalIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___DeactivateSignalIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeactivateSignalIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DeactivateSignalIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___DeactivateSignalIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeactivateSignalIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DeactivateSignalIntentResponse.__deallocating_deinit()
{
  return sub_23F991A2C(type metadata accessor for DeactivateSignalIntentResponse);
}

uint64_t DeactivateSignalCarSignalUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL) {
    return 0;
  }
  return result;
}

id static DeactivateSignalCarSignalResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);

  return v1;
}

id DeactivateSignalCarSignalResolutionResult.__deallocating_deinit()
{
  return sub_23F991A2C(type metadata accessor for DeactivateSignalCarSignalResolutionResult);
}

id sub_23F991A2C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for DeactivateSignalIntentResponse()
{
  return self;
}

uint64_t type metadata accessor for DeactivateSignalCarSignalResolutionResult()
{
  return self;
}

unint64_t sub_23F991AB0()
{
  unint64_t result = qword_268C5A3A0;
  if (!qword_268C5A3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A3A0);
  }
  return result;
}

unint64_t sub_23F991B08()
{
  unint64_t result = qword_268C5A3A8;
  if (!qword_268C5A3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C5A3A8);
  }
  return result;
}

uint64_t sub_23F991B5C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___DeactivateSignalIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23F991BB0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___DeactivateSignalIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for DeactivateSignalIntentResponseCode()
{
  return &type metadata for DeactivateSignalIntentResponseCode;
}

ValueMetadata *type metadata accessor for DeactivateSignalCarSignalUnsupportedReason()
{
  return &type metadata for DeactivateSignalCarSignalUnsupportedReason;
}

uint64_t sub_23F991C28()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23F991C38()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23F991C48()
{
  return MEMORY[0x270F9FC90]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}