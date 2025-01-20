uint64_t sub_3330(uint64_t a1)
{
  return sub_33A4(a1);
}

uint64_t sub_3348()
{
  return v0;
}

uint64_t sub_3350()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_3360()
{
  return swift_allocObject();
}

uint64_t sub_3370@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_33A4(uint64_t a1)
{
  uint64_t v56 = a1;
  uint64_t v1 = sub_3CC0();
  uint64_t v46 = *(void *)(v1 - 8);
  uint64_t v47 = v1;
  ((void (*)(void))__chkstk_darwin)();
  v45 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3D70();
  ((void (*)(void))__chkstk_darwin)();
  v39 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3D60();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_3D00();
  uint64_t v40 = *(void *)(v42 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v38 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_3D40();
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  ((void (*)(void))__chkstk_darwin)();
  v51 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_3CD0();
  uint64_t v50 = *(void *)(v52 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v48 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v49 = (char *)&v37 - v11;
  uint64_t v12 = sub_3D20();
  uint64_t v55 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_3CE0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v21 = (char *)&v37 - v20;
  uint64_t v22 = sub_3CA0();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (char *)&v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v56, v22);
  int v26 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v25, v22);
  if (v26 == enum case for GenerativeResultModels.GenerativeRichTextResultSnippet(_:))
  {
    (*(void (**)(char *, uint64_t))(v23 + 96))(v25, v22);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v25, v15);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
    sub_3D10();
    sub_3C58(&qword_8148, (void (*)(uint64_t))&type metadata accessor for TextGenerationView);
    uint64_t v27 = sub_3D80();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v14, v12);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    return v27;
  }
  if (v26 == enum case for GenerativeResultModels.GenerativeNoResultSnippet(_:))
  {
    (*(void (**)(char *, uint64_t))(v23 + 96))(v25, v22);
    v29 = v49;
    uint64_t v28 = v50;
    uint64_t v30 = v52;
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v49, v25, v52);
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v48, v29, v30);
    v31 = v51;
    sub_3D30();
    sub_3C58(&qword_8140, (void (*)(uint64_t))&type metadata accessor for DisabledResponseView);
    uint64_t v32 = v54;
    uint64_t v27 = sub_3D80();
    uint64_t v33 = v53;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v32);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
    return v27;
  }
  if (v26 == enum case for GenerativeResultModels.GenerativeMediaConfirmationSnippet(_:))
  {
    (*(void (**)(char *, uint64_t))(v23 + 96))(v25, v22);
    uint64_t v28 = v40;
    v29 = v38;
    uint64_t v30 = v42;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v38, v25, v42);
    sub_3CF0();
    v31 = v41;
    sub_3D50();
    sub_3C58(&qword_8138, (void (*)(uint64_t))&type metadata accessor for AttachmentConfirmationView);
    uint64_t v32 = v44;
    uint64_t v27 = sub_3D80();
    uint64_t v33 = v43;
    goto LABEL_7;
  }
  if (v26 == enum case for GenerativeResultModels.GenerativeTAHandoffSnippet(_:))
  {
    v35 = v45;
    sub_3CB0();
    sub_3C58(&qword_8130, (void (*)(uint64_t))&type metadata accessor for GenerativeTAHandoffView);
    uint64_t v36 = v47;
    uint64_t v27 = sub_3D80();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    return v27;
  }
  uint64_t result = sub_3D90();
  __break(1u);
  return result;
}

uint64_t sub_3BEC()
{
  return sub_3C58(&qword_8090, (void (*)(uint64_t))&type metadata accessor for GenerativeResultModels);
}

uint64_t type metadata accessor for GenerativeAssistantUIPlugin()
{
  return self;
}

uint64_t sub_3C58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3CA0()
{
  return type metadata accessor for GenerativeResultModels();
}

uint64_t sub_3CB0()
{
  return GenerativeTAHandoffView.init()();
}

uint64_t sub_3CC0()
{
  return type metadata accessor for GenerativeTAHandoffView();
}

uint64_t sub_3CD0()
{
  return type metadata accessor for GenerativeNoResultSnippetModel();
}

uint64_t sub_3CE0()
{
  return type metadata accessor for GenerativeRichTextResultSnippetModel();
}

uint64_t sub_3CF0()
{
  return GenerativeMediaConfirmationSnippetModel.payload.getter();
}

uint64_t sub_3D00()
{
  return type metadata accessor for GenerativeMediaConfirmationSnippetModel();
}

uint64_t sub_3D10()
{
  return TextGenerationView.init(model:)();
}

uint64_t sub_3D20()
{
  return type metadata accessor for TextGenerationView();
}

uint64_t sub_3D30()
{
  return DisabledResponseView.init(model:)();
}

uint64_t sub_3D40()
{
  return type metadata accessor for DisabledResponseView();
}

uint64_t sub_3D50()
{
  return AttachmentConfirmationView.init(payload:)();
}

uint64_t sub_3D60()
{
  return type metadata accessor for AttachmentConfirmationView();
}

uint64_t sub_3D70()
{
  return type metadata accessor for AttachmentConfirmationPayload();
}

uint64_t sub_3D80()
{
  return View.eraseToAnyView()();
}

uint64_t sub_3D90()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
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