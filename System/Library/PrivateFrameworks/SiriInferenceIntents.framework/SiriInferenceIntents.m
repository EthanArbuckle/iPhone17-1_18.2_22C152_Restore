void sub_21EFECD9C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_21EFECE50(a1, (SEL *)&selRef_sportName, a2);
}

void sub_21EFECDA8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECDB4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFECDC0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECDCC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFECDD8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECDE4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFECDF0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECDFC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFECE08(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECE14(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFECE20(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECE2C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFECE38(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECE44(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFECE50(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = sub_21EFF1640();
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

void sub_21EFECEB4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFECEC0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v7 = sub_21EFF1630();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [v6 *a5];
}

id SearchForSportsIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SearchForSportsIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchForSportsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SearchForSportsIntent()
{
  return self;
}

id SearchForSportsIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SearchForSportsIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SearchForSportsIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SearchForSportsIntent.__deallocating_deinit()
{
  return sub_21EFED6B4(type metadata accessor for SearchForSportsIntent);
}

unint64_t SearchForSportsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_21EFED6EC(a1);
}

BOOL sub_21EFED110(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21EFED124()
{
  return sub_21EFF16C0();
}

uint64_t sub_21EFED16C()
{
  return sub_21EFF16B0();
}

uint64_t sub_21EFED198()
{
  return sub_21EFF16C0();
}

unint64_t sub_21EFED1DC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_21EFED6EC(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_21EFED210(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_21EFED264()
{
  uint64_t v1 = v0 + OBJC_IVAR___SearchForSportsIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21EFED2F8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR___SearchForSportsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21EFED34C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR___SearchForSportsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

char *SearchForSportsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___SearchForSportsIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SearchForSportsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___SearchForSportsIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SearchForSportsIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SearchForSportsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchForSportsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchForSportsIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SearchForSportsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SearchForSportsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SearchForSportsIntentResponse.__deallocating_deinit()
{
  return sub_21EFED6B4(type metadata accessor for SearchForSportsIntentResponse);
}

id sub_21EFED6B4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_21EFED6EC(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for SearchForSportsIntentResponse()
{
  return self;
}

unint64_t sub_21EFED724()
{
  unint64_t result = qword_267EB8B48;
  if (!qword_267EB8B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EB8B48);
  }
  return result;
}

char *keypath_get_selector_sportName()
{
  return sel_sportName;
}

char *keypath_get_selector_leagueName()
{
  return sel_leagueName;
}

char *keypath_get_selector_teamName()
{
  return sel_teamName;
}

char *keypath_get_selector_athleteName()
{
  return sel_athleteName;
}

char *keypath_get_selector_sportQId()
{
  return sel_sportQId;
}

char *keypath_get_selector_leagueQId()
{
  return sel_leagueQId;
}

char *keypath_get_selector_teamQId()
{
  return sel_teamQId;
}

char *keypath_get_selector_athleteQId()
{
  return sel_athleteQId;
}

ValueMetadata *type metadata accessor for SearchForSportsIntentResponseCode()
{
  return &type metadata for SearchForSportsIntentResponseCode;
}

uint64_t method lookup function for SearchForSportsIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SearchForSportsIntentResponse);
}

uint64_t dispatch thunk of SearchForSportsIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

id GetSuggestionsIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id GetSuggestionsIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSuggestionsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetSuggestionsIntent()
{
  return self;
}

id GetSuggestionsIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetSuggestionsIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSuggestionsIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSuggestionsIntent.__deallocating_deinit()
{
  return sub_21EFEDEF8(type metadata accessor for GetSuggestionsIntent);
}

unint64_t GetSuggestionsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_21EFED6EC(a1);
}

void sub_21EFEDA1C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_suggestions);
  if (v3)
  {
    char v4 = v3;
    type metadata accessor for Suggestion();
    uint64_t v5 = sub_21EFF1660();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_21EFEDA8C(void *a1, void **a2)
{
  objc_super v2 = *a2;
  if (*a1)
  {
    type metadata accessor for Suggestion();
    uint64_t v3 = sub_21EFF1650();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setSuggestions_);
}

uint64_t sub_21EFEDB4C()
{
  uint64_t v1 = v0 + OBJC_IVAR___GetSuggestionsIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *GetSuggestionsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___GetSuggestionsIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetSuggestionsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  uint64_t v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___GetSuggestionsIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetSuggestionsIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___GetSuggestionsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSuggestionsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetSuggestionsIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___GetSuggestionsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSuggestionsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSuggestionsIntentResponse.__deallocating_deinit()
{
  return sub_21EFEDEF8(type metadata accessor for GetSuggestionsIntentResponse);
}

id sub_21EFEDEF8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for GetSuggestionsIntentResponse()
{
  return self;
}

unint64_t sub_21EFEDF58()
{
  unint64_t result = qword_267EB8BB8;
  if (!qword_267EB8BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EB8BB8);
  }
  return result;
}

char *keypath_get_selector_suggestions()
{
  return sel_suggestions;
}

uint64_t sub_21EFEDFC0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___GetSuggestionsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21EFEE014(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___GetSuggestionsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetSuggestionsIntentResponseCode()
{
  return &type metadata for GetSuggestionsIntentResponseCode;
}

uint64_t method lookup function for GetSuggestionsIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GetSuggestionsIntentResponse);
}

uint64_t dispatch thunk of GetSuggestionsIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

id ExecuteSuggestionIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ExecuteSuggestionIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExecuteSuggestionIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ExecuteSuggestionIntent()
{
  return self;
}

id ExecuteSuggestionIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ExecuteSuggestionIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ExecuteSuggestionIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ExecuteSuggestionIntent.__deallocating_deinit()
{
  return sub_21EFEE69C(type metadata accessor for ExecuteSuggestionIntent);
}

unint64_t ExecuteSuggestionIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_21EFED6EC(a1);
}

uint64_t sub_21EFEE2F0()
{
  uint64_t v1 = v0 + OBJC_IVAR___ExecuteSuggestionIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *ExecuteSuggestionIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___ExecuteSuggestionIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *ExecuteSuggestionIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___ExecuteSuggestionIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id ExecuteSuggestionIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___ExecuteSuggestionIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExecuteSuggestionIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ExecuteSuggestionIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___ExecuteSuggestionIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ExecuteSuggestionIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ExecuteSuggestionIntentResponse.__deallocating_deinit()
{
  return sub_21EFEE69C(type metadata accessor for ExecuteSuggestionIntentResponse);
}

id sub_21EFEE69C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ExecuteSuggestionIntentResponse()
{
  return self;
}

unint64_t sub_21EFEE6FC()
{
  unint64_t result = qword_267EB8BC8;
  if (!qword_267EB8BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EB8BC8);
  }
  return result;
}

char *keypath_get_selector_suggestion()
{
  return sel_suggestion;
}

id sub_21EFEE75C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_suggestion);
  *a2 = result;
  return result;
}

id sub_21EFEE798(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuggestion_, *a1);
}

uint64_t sub_21EFEE7AC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___ExecuteSuggestionIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21EFEE800(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___ExecuteSuggestionIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ExecuteSuggestionIntentResponseCode()
{
  return &type metadata for ExecuteSuggestionIntentResponseCode;
}

uint64_t method lookup function for ExecuteSuggestionIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ExecuteSuggestionIntentResponse);
}

uint64_t dispatch thunk of ExecuteSuggestionIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

void sub_21EFEE8B4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_actionIdentifier);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_21EFF1640();
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

void sub_21EFEE91C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_21EFF1630();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setActionIdentifier_);
}

void sub_21EFEE98C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_parameters);
  if (v3)
  {
    id v4 = v3;
    type metadata accessor for ActionParameter();
    uint64_t v5 = sub_21EFF1660();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v5;
}

void sub_21EFEE9FC(void *a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*a1)
  {
    type metadata accessor for ActionParameter();
    uint64_t v3 = sub_21EFF1650();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setParameters_);
}

uint64_t sub_21EFEEA7C()
{
  return 1;
}

id Suggestion.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    id v8 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  v9 = (void *)sub_21EFF1630();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id Suggestion.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    id v8 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  v9 = (void *)sub_21EFF1630();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for Suggestion();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for Suggestion()
{
  return self;
}

id Suggestion.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Suggestion.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Suggestion();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id Suggestion.__deallocating_deinit()
{
  return sub_21EFEF2E4(type metadata accessor for Suggestion);
}

id sub_21EFEEDEC(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___SuggestionResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_21EFEEEA0(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_21EFEEF98();
    swift_bridgeObjectRetain();
    sub_21EFF1680();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_21EFF1690();
    sub_21EFEEF98();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_21EFEEF98();
  id v2 = (void *)sub_21EFF1650();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___SuggestionResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

unint64_t sub_21EFEEF98()
{
  unint64_t result = qword_267EB8BD0;
  if (!qword_267EB8BD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EB8BD0);
  }
  return result;
}

id sub_21EFEF044(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___SuggestionResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_21EFEF104()
{
}

void sub_21EFEF19C()
{
}

void sub_21EFEF234()
{
}

id SuggestionResolutionResult.__deallocating_deinit()
{
  return sub_21EFEF2E4(type metadata accessor for SuggestionResolutionResult);
}

id sub_21EFEF2E4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SuggestionResolutionResult()
{
  return self;
}

char *keypath_get_selector_actionIdentifier()
{
  return sel_actionIdentifier;
}

char *keypath_get_selector_parameters()
{
  return sel_parameters;
}

uint64_t method lookup function for SuggestionResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SuggestionResolutionResult);
}

uint64_t dispatch thunk of static SuggestionResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SuggestionResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static SuggestionResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id ActionParameter.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    id v8 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  v9 = (void *)sub_21EFF1630();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  id v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id ActionParameter.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    id v8 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  v9 = (void *)sub_21EFF1630();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_21EFF1630();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for ActionParameter();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for ActionParameter()
{
  return self;
}

id ActionParameter.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ActionParameter.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ActionParameter();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ActionParameter.__deallocating_deinit()
{
  return sub_21EFEFBE4(type metadata accessor for ActionParameter);
}

id sub_21EFEF72C(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ActionParameterResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_successWithResolvedObject_, a1);
  return v2;
}

id sub_21EFEF7E0(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_21EFEEF98();
    swift_bridgeObjectRetain();
    sub_21EFF1680();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_21EFF1690();
    sub_21EFEEF98();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_21EFEEF98();
  id v2 = (void *)sub_21EFF1650();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___ActionParameterResolutionResult;
  id v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_21EFEF944(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___ActionParameterResolutionResult;
  id v2 = objc_msgSendSuper2(&v4, sel_confirmationRequiredWithObjectToConfirm_, a1);
  return v2;
}

void sub_21EFEFA04()
{
}

void sub_21EFEFA9C()
{
}

void sub_21EFEFB34()
{
}

id ActionParameterResolutionResult.__deallocating_deinit()
{
  return sub_21EFEFBE4(type metadata accessor for ActionParameterResolutionResult);
}

id sub_21EFEFBE4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ActionParameterResolutionResult()
{
  return self;
}

char *keypath_get_selector_key()
{
  return sel_key;
}

void sub_21EFEFC4C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFEFC6C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_value()
{
  return sel_value;
}

void sub_21EFEFC98(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFEFCB8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t method lookup function for ActionParameterResolutionResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActionParameterResolutionResult);
}

uint64_t dispatch thunk of static ActionParameterResolutionResult.success(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static ActionParameterResolutionResult.disambiguation(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static ActionParameterResolutionResult.confirmationRequired(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

id SocialConversationIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SocialConversationIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialConversationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SocialConversationIntent()
{
  return self;
}

id SocialConversationIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SocialConversationIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SocialConversationIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SocialConversationIntent.__deallocating_deinit()
{
  return sub_21EFF0300(type metadata accessor for SocialConversationIntent);
}

unint64_t SocialConversationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_21EFED6EC(a1);
}

uint64_t sub_21EFEFF54()
{
  uint64_t v1 = v0 + OBJC_IVAR___SocialConversationIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *SocialConversationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___SocialConversationIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SocialConversationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___SocialConversationIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SocialConversationIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SocialConversationIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SocialConversationIntentResponse.__deallocating_deinit()
{
  return sub_21EFF0300(type metadata accessor for SocialConversationIntentResponse);
}

id sub_21EFF0300(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SocialConversationIntentResponse()
{
  return self;
}

unint64_t sub_21EFF0360()
{
  unint64_t result = qword_267EB8BE0;
  if (!qword_267EB8BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EB8BE0);
  }
  return result;
}

char *keypath_get_selector_intentType()
{
  return sel_intentType;
}

void sub_21EFF03C0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF03E0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_catID()
{
  return sel_catID;
}

void sub_21EFF040C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF042C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_dialogID()
{
  return sel_dialogID;
}

void sub_21EFF0458(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF0478(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_21EFF0498@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___SocialConversationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21EFF04EC(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___SocialConversationIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SocialConversationIntentResponseCode()
{
  return &type metadata for SocialConversationIntentResponseCode;
}

uint64_t method lookup function for SocialConversationIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SocialConversationIntentResponse);
}

uint64_t dispatch thunk of SocialConversationIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

id SiriLinkFlowIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SiriLinkFlowIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriLinkFlowIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SiriLinkFlowIntent()
{
  return self;
}

id SiriLinkFlowIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SiriLinkFlowIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SiriLinkFlowIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SiriLinkFlowIntent.__deallocating_deinit()
{
  return sub_21EFF0B74(type metadata accessor for SiriLinkFlowIntent);
}

unint64_t SiriLinkFlowIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_21EFED6EC(a1);
}

uint64_t sub_21EFF07C8()
{
  uint64_t v1 = v0 + OBJC_IVAR___SiriLinkFlowIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *SiriLinkFlowIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___SiriLinkFlowIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SiriLinkFlowIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___SiriLinkFlowIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SiriLinkFlowIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___SiriLinkFlowIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriLinkFlowIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SiriLinkFlowIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___SiriLinkFlowIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SiriLinkFlowIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SiriLinkFlowIntentResponse.__deallocating_deinit()
{
  return sub_21EFF0B74(type metadata accessor for SiriLinkFlowIntentResponse);
}

id sub_21EFF0B74(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SiriLinkFlowIntentResponse()
{
  return self;
}

unint64_t sub_21EFF0BD4()
{
  unint64_t result = qword_267EB8BF0;
  if (!qword_267EB8BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EB8BF0);
  }
  return result;
}

char *keypath_get_selector_bundleIdentifier()
{
  return sel_bundleIdentifier;
}

void sub_21EFF0C34(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF0C54(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void sub_21EFF0C74(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF0C94(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_21EFF0CB4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___SiriLinkFlowIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21EFF0D08(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___SiriLinkFlowIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SiriLinkFlowIntentResponseCode()
{
  return &type metadata for SiriLinkFlowIntentResponseCode;
}

uint64_t method lookup function for SiriLinkFlowIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriLinkFlowIntentResponse);
}

uint64_t dispatch thunk of SiriLinkFlowIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

id DisambiguateActionsIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DisambiguateActionsIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisambiguateActionsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DisambiguateActionsIntent()
{
  return self;
}

id DisambiguateActionsIntent.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DisambiguateActionsIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DisambiguateActionsIntent();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DisambiguateActionsIntent.__deallocating_deinit()
{
  return sub_21EFF1390(type metadata accessor for DisambiguateActionsIntent);
}

unint64_t DisambiguateActionsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_21EFED6EC(a1);
}

uint64_t sub_21EFF0FE4()
{
  uint64_t v1 = v0 + OBJC_IVAR___DisambiguateActionsIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *DisambiguateActionsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___DisambiguateActionsIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *DisambiguateActionsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_super v5 = (char *)objc_msgSend(v2, sel_init);
  uint64_t v6 = &v5[OBJC_IVAR___DisambiguateActionsIntentResponse_code];
  swift_beginAccess();
  *(void *)uint64_t v6 = a1;
  uint64_t v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id DisambiguateActionsIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___DisambiguateActionsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisambiguateActionsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DisambiguateActionsIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___DisambiguateActionsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DisambiguateActionsIntentResponse();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DisambiguateActionsIntentResponse.__deallocating_deinit()
{
  return sub_21EFF1390(type metadata accessor for DisambiguateActionsIntentResponse);
}

id sub_21EFF1390(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for DisambiguateActionsIntentResponse()
{
  return self;
}

unint64_t sub_21EFF13F0()
{
  unint64_t result = qword_267EB8C00;
  if (!qword_267EB8C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EB8C00);
  }
  return result;
}

char *keypath_get_selector_candidateBundles()
{
  return sel_candidateBundles;
}

void sub_21EFF1450(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF1470(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_candidateActions()
{
  return sel_candidateActions;
}

void sub_21EFF149C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF14BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_selectedCandidateIndex()
{
  return sel_selectedCandidateIndex;
}

void sub_21EFF14E8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21EFF1508(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_21EFF1528@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___DisambiguateActionsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21EFF157C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___DisambiguateActionsIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateActionsIntentResponseCode()
{
  return &type metadata for DisambiguateActionsIntentResponseCode;
}

uint64_t method lookup function for DisambiguateActionsIntentResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DisambiguateActionsIntentResponse);
}

uint64_t dispatch thunk of DisambiguateActionsIntentResponse.code.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t sub_21EFF1630()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21EFF1640()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21EFF1650()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21EFF1660()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21EFF1670()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21EFF1680()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_21EFF1690()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_21EFF16A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21EFF16B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21EFF16C0()
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

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}