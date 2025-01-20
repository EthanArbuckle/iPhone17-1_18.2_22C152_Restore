uint64_t AlarmUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t AlarmUIPlugin.deinit()
{
  return v0;
}

uint64_t AlarmUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  return sub_3160(a1);
}

uint64_t AlarmUIPlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_312C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_3160(uint64_t a1)
{
  uint64_t v49 = a1;
  uint64_t v1 = sub_3B90();
  uint64_t v46 = *(void *)(v1 - 8);
  uint64_t v47 = v1;
  ((void (*)(void))__chkstk_darwin)();
  v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_3C00();
  uint64_t v43 = *(void *)(v45 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v39 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v42 = (char *)&v34 - v5;
  uint64_t v6 = sub_3BD0();
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v41 = v6;
  __chkstk_darwin(v6);
  v37 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_3BF0();
  uint64_t v36 = *(void *)(v38 - 8);
  uint64_t v8 = __chkstk_darwin(v38);
  v34 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v35 = (char *)&v34 - v10;
  uint64_t v11 = sub_3BB0();
  uint64_t v48 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_3BE0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v34 - v19;
  uint64_t v21 = sub_3C10();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v49, v21);
  int v25 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
  if (v25 == enum case for SiriAlarmSnippetModels.alarmMulti(_:))
  {
    (*(void (**)(char *, uint64_t))(v22 + 96))(v24, v21);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v24, v14);
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, v14);
    sub_3BA0();
    sub_38F4(&qword_8140, (void (*)(uint64_t))&type metadata accessor for AlarmSnippet);
    uint64_t v26 = sub_3C20();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v11);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
    return v26;
  }
  if (v25 == enum case for SiriAlarmSnippetModels.alarmSelector(_:))
  {
    (*(void (**)(char *, uint64_t))(v22 + 96))(v24, v21);
    v28 = v35;
    uint64_t v27 = v36;
    uint64_t v29 = v38;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v35, v24, v38);
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v34, v28, v29);
    v30 = v37;
    sub_3BC0();
    sub_38F4(&qword_8138, (void (*)(uint64_t))&type metadata accessor for AlarmSelector);
    uint64_t v31 = v41;
    uint64_t v26 = sub_3C20();
    uint64_t v32 = v40;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v31);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    return v26;
  }
  if (v25 == enum case for SiriAlarmSnippetModels.alarmConfirmation(_:))
  {
    (*(void (**)(char *, uint64_t))(v22 + 96))(v24, v21);
    v28 = v42;
    uint64_t v27 = v43;
    uint64_t v29 = v45;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v42, v24, v45);
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v39, v28, v29);
    v30 = v44;
    sub_3B80();
    sub_38F4(&qword_8130, (void (*)(uint64_t))&type metadata accessor for AlarmConfirmation);
    uint64_t v31 = v47;
    uint64_t v26 = sub_3C20();
    uint64_t v32 = v46;
    goto LABEL_7;
  }
  uint64_t result = sub_3C30();
  __break(1u);
  return result;
}

uint64_t sub_3888()
{
  return sub_38F4(&qword_8090, (void (*)(uint64_t))&type metadata accessor for SiriAlarmSnippetModels);
}

uint64_t type metadata accessor for AlarmUIPlugin()
{
  return self;
}

uint64_t sub_38F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t static Placeholder.__derived_enum_equals(_:_:)()
{
  return 1;
}

void Placeholder.hash(into:)()
{
}

Swift::Int Placeholder.hashValue.getter()
{
  return sub_3C60();
}

Swift::Int sub_39B0()
{
  return sub_3C60();
}

unint64_t sub_39F4()
{
  unint64_t result = qword_8148;
  if (!qword_8148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8148);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Placeholder(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Placeholder(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x3B3CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_3B64()
{
  return 0;
}

ValueMetadata *type metadata accessor for Placeholder()
{
  return &type metadata for Placeholder;
}

uint64_t sub_3B80()
{
  return AlarmConfirmation.init(snippetModel:)();
}

uint64_t sub_3B90()
{
  return type metadata accessor for AlarmConfirmation();
}

uint64_t sub_3BA0()
{
  return AlarmSnippet.init(snippetModel:)();
}

uint64_t sub_3BB0()
{
  return type metadata accessor for AlarmSnippet();
}

uint64_t sub_3BC0()
{
  return AlarmSelector.init(snippetModel:)();
}

uint64_t sub_3BD0()
{
  return type metadata accessor for AlarmSelector();
}

uint64_t sub_3BE0()
{
  return type metadata accessor for AlarmSnippetModel();
}

uint64_t sub_3BF0()
{
  return type metadata accessor for AlarmSelectorModel();
}

uint64_t sub_3C00()
{
  return type metadata accessor for AlarmConfirmationModel();
}

uint64_t sub_3C10()
{
  return type metadata accessor for SiriAlarmSnippetModels();
}

uint64_t sub_3C20()
{
  return View.eraseToAnyView()();
}

uint64_t sub_3C30()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_3C40()
{
  return Hasher.init(_seed:)();
}

void sub_3C50(Swift::UInt a1)
{
}

Swift::Int sub_3C60()
{
  return Hasher._finalize()();
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}