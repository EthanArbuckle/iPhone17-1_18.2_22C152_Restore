uint64_t SiriTranslationUIPlugin.__allocating_init()()
{
  uint64_t v0;

  return _swift_allocObject(v0, 16, 7);
}

uint64_t SiriTranslationUIPlugin.deinit()
{
  return v0;
}

uint64_t SiriTranslationUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v52 = a1;
  sub_3D40();
  sub_3CCC();
  uint64_t v50 = v2;
  uint64_t v51 = v1;
  ((void (*)(void))__chkstk_darwin)();
  sub_3CE8();
  uint64_t v48 = v4 - v3;
  uint64_t v49 = sub_3D60();
  sub_3CCC();
  uint64_t v47 = v5;
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v44 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v9 = (char *)&v43 - v8;
  sub_3D20();
  sub_3CCC();
  uint64_t v45 = v11;
  uint64_t v46 = v10;
  __chkstk_darwin(v10);
  sub_3CE8();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_3D50();
  sub_3CCC();
  uint64_t v17 = v16;
  uint64_t v19 = __chkstk_darwin(v18);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v43 - v22;
  uint64_t v24 = sub_3D70();
  sub_3CCC();
  uint64_t v26 = v25;
  __chkstk_darwin(v27);
  sub_3CE8();
  uint64_t v30 = v29 - v28;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v29 - v28, v52, v24);
  int v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 88))(v30, v24);
  if (v31 == enum case for SiriTranslationModels.translationResultView(_:))
  {
    uint64_t v32 = sub_3CF8();
    v33(v32);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v23, v30, v15);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v21, v23, v15);
    sub_3D10();
    sub_3C20(&qword_8098, (void (*)(uint64_t))&type metadata accessor for SiriTranslationResultView);
    uint64_t v34 = v46;
    uint64_t v35 = sub_3D80();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v14, v34);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v23, v15);
    return v35;
  }
  if (v31 == enum case for SiriTranslationModels.disambiguationResultView(_:))
  {
    uint64_t v36 = sub_3CF8();
    v37(v36);
    uint64_t v38 = v47;
    uint64_t v39 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v9, v30, v49);
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v44, v9, v39);
    uint64_t v40 = v48;
    sub_3D30();
    sub_3C20(&qword_8090, (void (*)(uint64_t))&type metadata accessor for SiriTranslationDisambiguationView);
    uint64_t v41 = v51;
    uint64_t v35 = sub_3D80();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v40, v41);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v39);
    return v35;
  }
  uint64_t result = sub_3D90();
  __break(1u);
  return result;
}

uint64_t SiriTranslationUIPlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_3BD8()
{
  return sub_3C20(&qword_80A0, (void (*)(uint64_t))&type metadata accessor for SiriTranslationModels);
}

uint64_t sub_3C20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3C68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriTranslationUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_3C90(uint64_t a1)
{
  return SiriTranslationUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t type metadata accessor for SiriTranslationUIPlugin()
{
  return self;
}

uint64_t sub_3CF8()
{
  return v0;
}

uint64_t sub_3D10()
{
  return SiriTranslationResultView.init(model:)();
}

uint64_t sub_3D20()
{
  return type metadata accessor for SiriTranslationResultView();
}

uint64_t sub_3D30()
{
  return SiriTranslationDisambiguationView.init(model:)();
}

uint64_t sub_3D40()
{
  return type metadata accessor for SiriTranslationDisambiguationView();
}

uint64_t sub_3D50()
{
  return type metadata accessor for SiriTranslationModels.SiriTranslationResultModel();
}

uint64_t sub_3D60()
{
  return type metadata accessor for SiriTranslationModels.SiriTranslationDisambiguationModel();
}

uint64_t sub_3D70()
{
  return type metadata accessor for SiriTranslationModels();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}