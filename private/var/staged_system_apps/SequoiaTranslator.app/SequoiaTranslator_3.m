uint64_t sub_10021003C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned char *v20;
  uint64_t v21;
  unsigned char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char v28;
  char v29;
  unsigned char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned char *v38;
  unsigned char *v39;
  unsigned char *v40;
  unsigned char *v41;
  unsigned char *v42;
  unsigned char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned char v48[4];
  int v49;
  unsigned char *v50;
  unsigned char *v51;
  unsigned char *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned char *v55;
  unsigned char *v56;
  unsigned char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v58 = a2;
  v3 = type metadata accessor for TranslationCardView();
  v54 = *(void *)(v3 - 8);
  v53 = *(void *)(v54 + 64);
  __chkstk_darwin(v3);
  v51 = &v48[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_100007620(&qword_1002FC8A0);
  __chkstk_darwin(v5 - 8);
  v7 = &v48[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_100007620(&qword_1002FC8A8);
  v9 = v8 - 8;
  v10 = __chkstk_darwin(v8);
  v57 = &v48[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __chkstk_darwin(v10);
  v52 = &v48[-v13];
  __chkstk_darwin(v12);
  v56 = &v48[-v14];
  v15 = sub_100007620(&qword_1002FC8B0);
  v16 = __chkstk_darwin(v15 - 8);
  v55 = &v48[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __chkstk_darwin(v16);
  v20 = &v48[-v19];
  __chkstk_darwin(v18);
  v22 = &v48[-v21];
  v50 = &v48[-v21];
  *(void *)v20 = static VerticalAlignment.center.getter();
  *((void *)v20 + 1) = 0;
  v20[16] = 1;
  v23 = sub_100007620(&qword_1002FC8B8);
  sub_100213B04((void (*)(uint64_t))&dispatch thunk of PersistedTranslation.sourceLocale.getter, 0x8000000100264810, (uint64_t)&v20[*(int *)(v23 + 44)]);
  sub_10001323C((uint64_t)v20, (uint64_t)v22, &qword_1002FC8B0);
  *(void *)v7 = static VerticalAlignment.bottom.getter();
  *((void *)v7 + 1) = 0x4024000000000000;
  v7[16] = 0;
  v24 = sub_100007620(&qword_1002FC8C0);
  sub_10021060C(a1, (uint64_t)&v7[*(int *)(v24 + 44)]);
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  v25 = v60;
  swift_getKeyPath();
  v60 = v25;
  sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v49 = *(unsigned __int8 *)(v25 + 144);
  swift_release();
  Bindable.wrappedValue.getter();
  v26 = v60;
  swift_getKeyPath();
  v60 = v26;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v27 = *(id *)(v26 + 72);
  swift_release();
  v28 = sub_100200C14();

  if (v28 == 4) {
    v29 = 2;
  }
  else {
    v29 = v28;
  }
  v30 = v51;
  sub_10021795C(a1, (uint64_t)v51, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  v31 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
  v32 = swift_allocObject();
  sub_100217168((uint64_t)v30, v32 + v31);
  v33 = static Color.sourceTextColor.getter();
  swift_retain();
  v34 = static VerticalAlignment.bottom.getter();
  v59 = 0;
  swift_retain();
  static Binding.constant(_:)();
  v35 = v60;
  v36 = v61;
  v37 = v62;
  v38 = v52;
  sub_10000C3A4((uint64_t)v7, (uint64_t)v52, &qword_1002FC8A0);
  swift_release();
  swift_release();
  v39 = &v38[*(int *)(v9 + 44)];
  *v39 = 0;
  v39[1] = v49;
  v39[2] = v29;
  *((void *)v39 + 1) = sub_100217B50;
  *((void *)v39 + 2) = v32;
  v39[24] = 0;
  *((void *)v39 + 4) = v34;
  *((void *)v39 + 5) = v33;
  *((void *)v39 + 6) = v35;
  *((void *)v39 + 7) = v36;
  *((void *)v39 + 8) = v37;
  *((void *)v39 + 9) = 0x4020000000000000;
  sub_10000B070((uint64_t)v7, &qword_1002FC8A0);
  v40 = v56;
  sub_10001323C((uint64_t)v38, (uint64_t)v56, &qword_1002FC8A8);
  v41 = v50;
  v42 = v55;
  sub_10000C3A4((uint64_t)v50, (uint64_t)v55, &qword_1002FC8B0);
  v43 = v57;
  sub_10000C3A4((uint64_t)v40, (uint64_t)v57, &qword_1002FC8A8);
  v44 = v58;
  sub_10000C3A4((uint64_t)v42, v58, &qword_1002FC8B0);
  v45 = sub_100007620(&qword_1002FC928);
  sub_10000C3A4((uint64_t)v43, v44 + *(int *)(v45 + 48), &qword_1002FC8A8);
  v46 = v44 + *(int *)(v45 + 64);
  *(void *)v46 = 0;
  *(unsigned char *)(v46 + 8) = 0;
  sub_10000B070((uint64_t)v40, &qword_1002FC8A8);
  sub_10000B070((uint64_t)v41, &qword_1002FC8B0);
  sub_10000B070((uint64_t)v43, &qword_1002FC8A8);
  return sub_10000B070((uint64_t)v42, &qword_1002FC8B0);
}

uint64_t sub_10021060C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v123 = a2;
  uint64_t v3 = type metadata accessor for Locale();
  uint64_t v127 = *(void *)(v3 - 8);
  uint64_t v128 = v3;
  __chkstk_darwin(v3);
  v119 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LayoutDirection();
  uint64_t v121 = *(void *)(v5 - 8);
  uint64_t v122 = v5;
  __chkstk_darwin(v5);
  v120 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TranslationCardView();
  uint64_t v96 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v107 = (uint64_t)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v98 = (char *)&v93 - v11;
  v97 = v12;
  __chkstk_darwin(v10);
  uint64_t v106 = (uint64_t)&v93 - v13;
  uint64_t v14 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v14 - 8);
  v16 = (char *)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for AttributedString();
  __chkstk_darwin(v17 - 8);
  v126 = (char *)&v93 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = type metadata accessor for LanguageAwareText(0);
  __chkstk_darwin(v94);
  v20 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_100007620(&qword_1002FC8F8);
  __chkstk_darwin(v112);
  uint64_t v111 = (uint64_t)&v93 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100007620(&qword_1002FC900);
  __chkstk_darwin(v22 - 8);
  v110 = (char *)&v93 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_100007620(&qword_1002EF4E0);
  __chkstk_darwin(v109);
  uint64_t v113 = (uint64_t)&v93 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100007620(&qword_1002EF4E8);
  __chkstk_darwin(v25 - 8);
  uint64_t v116 = (uint64_t)&v93 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_100007620(&qword_1002FC908);
  uint64_t v27 = __chkstk_darwin(v114);
  uint64_t v118 = (uint64_t)&v93 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  v115 = (char *)&v93 - v30;
  __chkstk_darwin(v29);
  uint64_t v117 = (uint64_t)&v93 - v31;
  uint64_t v32 = a1;
  uint64_t v33 = a1 + *(int *)(v7 + 20);
  uint64_t v34 = sub_100007620(&qword_1002FC648);
  uint64_t v35 = v33;
  Bindable.wrappedValue.getter();
  uint64_t v36 = v129;
  swift_getKeyPath();
  uint64_t v129 = v36;
  uint64_t v37 = sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v38 = *(void **)(v36 + 152);
  id v39 = v38;
  swift_release();
  if (!v38)
  {
    sub_10000B0CC(0, &qword_1002F0F90);
    AttributedString.init(stringLiteral:)();
    v38 = NSAttributedString.init(_:)();
  }
  v105 = v38;
  v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v127 + 56);
  v108 = v16;
  v40(v16, 1, 1, v128);
  uint64_t v41 = v32;
  id v104 = sub_10020DC98();
  Bindable.wrappedValue.getter();
  uint64_t v42 = v129;
  swift_getKeyPath();
  uint64_t v129 = v42;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v103 = *(void *)(v42 + 184);
  uint64_t v102 = *(void *)(v42 + 192);
  int v101 = *(unsigned __int8 *)(v42 + 200);
  swift_release();
  v43 = (uint64_t *)(v41 + *(int *)(v7 + 24));
  uint64_t v44 = *v43;
  uint64_t v99 = v43[1];
  swift_unknownObjectRetain();
  uint64_t v124 = v35;
  uint64_t v125 = v34;
  Bindable.wrappedValue.getter();
  uint64_t v45 = v129;
  swift_getKeyPath();
  uint64_t v129 = v45;
  v126 = (char *)v37;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v46 = *(unsigned char *)(v45 + 178);
  swift_release();
  uint64_t v47 = v41;
  uint64_t v100 = v44;
  if (v46) {
    id v95 = 0;
  }
  else {
    id v95 = [self systemFillColor];
  }
  uint64_t v48 = (uint64_t)v98;
  uint64_t v49 = v96;
  v50 = (int *)v94;
  uint64_t v51 = v106;
  sub_10021795C(v47, v106, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  unint64_t v52 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  v98 = (char *)swift_allocObject();
  sub_100217168(v51, (uint64_t)&v98[v52]);
  sub_10021795C(v47, v48, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  uint64_t v106 = swift_allocObject();
  sub_100217168(v48, v106 + v52);
  v97 = sub_100211370();
  Bindable.wrappedValue.getter();
  uint64_t v53 = v129;
  swift_getKeyPath();
  uint64_t v54 = v47;
  uint64_t v129 = v53;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LODWORD(v96) = *(unsigned __int8 *)(v53 + 178);
  swift_release();
  uint64_t v55 = v107;
  sub_10021795C(v54, v107, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  uint64_t v56 = swift_allocObject();
  sub_100217168(v55, v56 + v52);
  type metadata accessor for LanguageAwareTextViewSizeThatFitsCache();
  v57 = (void *)swift_allocObject();
  v57[2] = sub_1001FF68C((uint64_t)_swiftEmptyArrayStorage);
  v57[3] = _swiftEmptyArrayStorage;
  v57[4] = 100;
  *(void *)v20 = v105;
  *(_OWORD *)(v20 + 8) = xmmword_10024C780;
  sub_10001323C((uint64_t)v108, (uint64_t)&v20[v50[6]], (uint64_t *)&unk_1002F4110);
  *(void *)&v20[v50[7]] = v104;
  v20[v50[8]] = 0;
  *(void *)&v20[v50[9]] = 0;
  *(void *)&v20[v50[10]] = 0;
  v20[v50[11]] = 0;
  v58 = &v20[v50[12]];
  uint64_t v59 = v102;
  *(void *)v58 = v103;
  *((void *)v58 + 1) = v59;
  v58[16] = v101;
  v60 = &v20[v50[13]];
  uint64_t v61 = v99;
  *(void *)v60 = v100;
  *((void *)v60 + 1) = v61;
  *(void *)&v20[v50[14]] = v95;
  v20[v50[15]] = 0;
  v62 = &v20[v50[16]];
  v63 = v98;
  *(void *)v62 = sub_100217938;
  *((void *)v62 + 1) = v63;
  v64 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&v20[v50[17]];
  uint64_t v65 = v106;
  *v64 = sub_100217C88;
  v64[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v65;
  v66 = &v20[v50[18]];
  *(void *)v66 = 0;
  *((void *)v66 + 1) = 0;
  *(void *)&v20[v50[19]] = v97;
  v20[v50[20]] = (v96 & 1) == 0;
  v67 = (uint64_t (**)(char, uint64_t))&v20[v50[21]];
  *v67 = sub_100217F9C;
  v67[1] = (uint64_t (*)(char, uint64_t))v56;
  *(void *)&v20[v50[22]] = v57;
  static Font.title.getter();
  uint64_t v68 = Font.bold()();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v70 = v111;
  sub_10021795C((uint64_t)v20, v111, type metadata accessor for LanguageAwareText);
  v71 = (uint64_t *)(v70 + *(int *)(v112 + 36));
  uint64_t *v71 = KeyPath;
  v71[1] = v68;
  sub_1002179C4((uint64_t)v20, type metadata accessor for LanguageAwareText);
  sub_100217A24();
  uint64_t v72 = (uint64_t)v110;
  View.accessibilityIdentifier(_:)();
  sub_10000B070(v70, &qword_1002FC8F8);
  uint64_t v73 = v113;
  sub_10000C3A4(v72, v113, &qword_1002FC900);
  *(void *)(v73 + *(int *)(v109 + 36)) = 0x3FF199999999999ALL;
  sub_10000B070(v72, &qword_1002FC900);
  uint64_t v74 = static Alignment.leading.getter();
  uint64_t v75 = v116;
  sub_10001D294(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v116, 0.0, 1, 0.0, 1, v74, v76);
  sub_10000B070(v73, &qword_1002EF4E0);
  uint64_t v77 = swift_getKeyPath();
  Bindable.wrappedValue.getter();
  uint64_t v78 = v129;
  swift_getKeyPath();
  uint64_t v129 = v78;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v79 = *(id *)(v78 + 72);
  swift_release();
  v80 = v119;
  dispatch thunk of PersistedTranslation.sourceLocale.getter();

  LOBYTE(v79) = Locale.isRTL()();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v80, v128);
  v82 = v120;
  uint64_t v81 = v121;
  v83 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
  if ((v79 & 1) == 0) {
    v83 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
  }
  uint64_t v84 = v122;
  (*(void (**)(char *, void, uint64_t))(v121 + 104))(v120, *v83, v122);
  uint64_t v85 = (uint64_t)v115;
  v86 = (uint64_t *)&v115[*(int *)(v114 + 36)];
  uint64_t v87 = sub_100007620(&qword_1002EF468);
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))((char *)v86 + *(int *)(v87 + 28), v82, v84);
  uint64_t *v86 = v77;
  sub_10000C3A4(v75, v85, &qword_1002EF4E8);
  (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v84);
  sub_10000B070(v75, &qword_1002EF4E8);
  uint64_t v88 = v117;
  sub_10001323C(v85, v117, &qword_1002FC908);
  uint64_t v89 = v118;
  sub_10000C3A4(v88, v118, &qword_1002FC908);
  uint64_t v90 = v123;
  sub_10000C3A4(v89, v123, &qword_1002FC908);
  uint64_t v91 = v90 + *(int *)(sub_100007620(&qword_1002FC918) + 48);
  *(void *)uint64_t v91 = 0;
  *(unsigned char *)(v91 + 8) = 0;
  sub_10000B070(v88, &qword_1002FC908);
  return sub_10000B070(v89, &qword_1002FC908);
}

void *sub_100211370()
{
  type metadata accessor for TranslationCardView();
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  swift_getKeyPath();
  sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v0 = *(unsigned char *)(v4 + 178);
  swift_release();
  v1 = 0;
  if ((v0 & 1) == 0)
  {
    Bindable.wrappedValue.getter();
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    v1 = *(void **)(v4 + 168);
    id v2 = v1;
    swift_release();
  }
  return v1;
}

uint64_t sub_1002114BC(uint64_t a1, char a2)
{
  if (qword_1002EE658 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100011554(v4, (uint64_t)qword_10030EB10);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "TTS play button action invoked", v7, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for TranslationCardView();
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  sub_100041F1C(a1, a2 & 1, 1);
  return swift_release();
}

uint64_t sub_1002115F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v150 = a2;
  uint64_t v3 = sub_100007620(&qword_1002FC648);
  uint64_t v148 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v146 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for TranslationCardView();
  uint64_t v127 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v128 = v6;
  unint64_t v129 = (unint64_t)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_100007620(&qword_1002F1248);
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  v130 = (char *)&v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_100007620(&qword_1002F1250);
  uint64_t v134 = *(void *)(v135 - 8);
  __chkstk_darwin(v135);
  v131 = (char *)&v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100007620(&qword_1002F1258);
  uint64_t v138 = *(void *)(v139 - 8);
  __chkstk_darwin(v139);
  v137 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_100007620(&qword_1002F1260);
  uint64_t v10 = __chkstk_darwin(v143);
  v136 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v140 = (uint64_t)&v126 - v12;
  uint64_t v141 = sub_100007620(&qword_1002FC800);
  __chkstk_darwin(v141);
  v142 = (_OWORD *)((char *)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_100007620(&qword_1002FC808);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v151 = (uint64_t)&v126 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v147 = (char *)&v126 - v17;
  uint64_t v18 = sub_100007620(&qword_1002FC810);
  __chkstk_darwin(v18 - 8);
  v20 = (char *)&v126 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100007620(&qword_1002FC818);
  uint64_t v22 = v21 - 8;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v145 = (uint64_t)&v126 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v126 - v26;
  __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v126 - v28;
  *(void *)v20 = static VerticalAlignment.lastTextBaseline.getter();
  *((void *)v20 + 1) = 0;
  v20[16] = 1;
  uint64_t v30 = &v20[*(int *)(sub_100007620(&qword_1002FC820) + 44)];
  *(void *)uint64_t v30 = static HorizontalAlignment.leading.getter();
  *((void *)v30 + 1) = 0x4010000000000000;
  v30[16] = 0;
  uint64_t v31 = sub_100007620(&qword_1002FC828);
  sub_1002129CC(a1, (uint64_t)&v30[*(int *)(v31 + 44)]);
  LOBYTE(v30) = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  sub_10000C3A4((uint64_t)v20, (uint64_t)v27, &qword_1002FC810);
  v40 = &v27[*(int *)(v22 + 44)];
  char *v40 = (char)v30;
  *((void *)v40 + 1) = v33;
  *((void *)v40 + 2) = v35;
  *((void *)v40 + 3) = v37;
  *((void *)v40 + 4) = v39;
  v40[40] = 0;
  sub_10000B070((uint64_t)v20, &qword_1002FC810);
  v144 = v29;
  uint64_t v41 = v3;
  sub_10001323C((uint64_t)v27, (uint64_t)v29, &qword_1002FC818);
  uint64_t v149 = v5;
  uint64_t v152 = a1;
  Bindable.wrappedValue.getter();
  uint64_t v42 = v162;
  swift_getKeyPath();
  *(void *)&long long v162 = v42;
  sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v43 = *(id *)(v42 + 72);
  dispatch thunk of PersistedTranslation.translationResult.getter();

  sub_100029624(&v162, *((uint64_t *)&v163 + 1));
  LOBYTE(v43) = TranslationResult.isLowConfidence.getter();
  sub_10000AB68((uint64_t)&v162);
  swift_release();
  if (v43)
  {
    sub_100007620(&qword_1002F21F8);
    uint64_t v44 = type metadata accessor for TranslateTip(0);
    unint64_t v45 = (*(unsigned __int8 *)(*(void *)(v44 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v44 - 8) + 80);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_1002488D0;
    uint64_t v47 = v46 + v45;
    if (qword_1002EE708 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_100011554(v44, (uint64_t)qword_10030ED08);
    sub_10021795C(v48, v47, type metadata accessor for TranslateTip);
    unsigned __int8 v49 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    *(void *)&long long v153 = v46;
    *((void *)&v153 + 1) = v49;
    uint64_t v154 = v50;
    uint64_t v155 = v51;
    uint64_t v156 = v52;
    uint64_t v157 = v53;
    __int16 v158 = 0;
    sub_100007620(&qword_1002FC858);
    sub_100217040(&qword_1002FC850, &qword_1002FC858, (void (*)(void))sub_100217560);
    _ConditionalContent<>.init(storage:)();
    char v54 = v165;
    char v55 = v166;
    long long v56 = v163;
    long long v57 = v164;
    v58 = v142;
    _OWORD *v142 = v162;
    v58[1] = v56;
    v58[2] = v57;
    *((unsigned char *)v58 + 48) = v54;
    *((unsigned char *)v58 + 49) = v55;
    swift_storeEnumTagMultiPayload();
    sub_100007620(&qword_1002FC840);
    sub_1002174C0();
    sub_1002175B4();
    uint64_t v59 = v147;
LABEL_9:
    _ConditionalContent<>.init(storage:)();
    uint64_t v77 = sub_100007620(&qword_1002FC830);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v59, 0, 1, v77);
    goto LABEL_10;
  }
  Bindable.wrappedValue.getter();
  uint64_t v60 = v162;
  swift_getKeyPath();
  *(void *)&long long v162 = v60;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v61 = *(unsigned __int8 *)(v60 + 226);
  swift_release();
  if (v61 == 1)
  {
    sub_100007620(&qword_1002F21F8);
    uint64_t v62 = type metadata accessor for TranslateTip(0);
    unint64_t v63 = (*(unsigned __int8 *)(*(void *)(v62 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v62 - 8) + 80);
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_1002488D0;
    uint64_t v65 = v64 + v63;
    uint64_t v59 = v147;
    if (qword_1002EE710 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_100011554(v62, (uint64_t)qword_10030ED20);
    sub_10021795C(v66, v65, type metadata accessor for TranslateTip);
    unsigned __int8 v67 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    *(void *)&long long v153 = v64;
    *((void *)&v153 + 1) = v67;
    uint64_t v154 = v68;
    uint64_t v155 = v69;
    uint64_t v156 = v70;
    uint64_t v157 = v71;
    __int16 v158 = 256;
    sub_100007620(&qword_1002FC858);
    sub_100217040(&qword_1002FC850, &qword_1002FC858, (void (*)(void))sub_100217560);
    _ConditionalContent<>.init(storage:)();
    char v72 = v165;
    char v73 = v166;
    long long v74 = v163;
    long long v75 = v164;
    uint64_t v76 = v142;
    _OWORD *v142 = v162;
    v76[1] = v74;
    v76[2] = v75;
    *((unsigned char *)v76 + 48) = v72;
    *((unsigned char *)v76 + 49) = v73;
    swift_storeEnumTagMultiPayload();
    sub_100007620(&qword_1002FC840);
    sub_1002174C0();
    sub_1002175B4();
    goto LABEL_9;
  }
  Bindable.wrappedValue.getter();
  uint64_t v96 = v162;
  swift_getKeyPath();
  *(void *)&long long v162 = v96;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v97 = *(unsigned __int8 *)(v96 + 176);
  swift_release();
  if (v97 == 1)
  {
    Bindable.wrappedValue.getter();
    uint64_t v98 = v162;
    swift_getKeyPath();
    *(void *)&long long v162 = v98;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    uint64_t v99 = v129;
    sub_10021795C(v152, v129, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
    unint64_t v100 = (*(unsigned __int8 *)(v127 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v127 + 80);
    uint64_t v101 = swift_allocObject();
    sub_100217168(v99, v101 + v100);
    unint64_t v129 = sub_100054B9C();
    uint64_t v102 = v130;
    TipView.init(_:arrowEdge:action:)();
    id v103 = [self systemGroupedBackgroundColor];
    *(void *)&long long v162 = Color.init(_:)();
    uint64_t v104 = sub_100014894(&qword_1002F12A0, &qword_1002F1248);
    v105 = v131;
    uint64_t v106 = v133;
    View.tipBackground<A>(_:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v132 + 8))(v102, v106);
    *(void *)&long long v162 = v106;
    *((void *)&v162 + 1) = &type metadata for Color;
    *(void *)&long long v163 = v104;
    *((void *)&v163 + 1) = &protocol witness table for Color;
    swift_getOpaqueTypeConformance2();
    uint64_t v107 = v137;
    uint64_t v108 = v135;
    View.tipCornerRadius(_:antialiased:)();
    (*(void (**)(char *, uint64_t))(v134 + 8))(v105, v108);
    LODWORD(v135) = static Edge.Set.bottom.getter();
    Bindable.wrappedValue.getter();
    uint64_t v109 = v162;
    swift_getKeyPath();
    *(void *)&long long v162 = v109;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    swift_release();
    Tip.shouldDisplay.getter();
    EdgeInsets.init(_all:)();
    uint64_t v111 = v110;
    uint64_t v113 = v112;
    uint64_t v115 = v114;
    uint64_t v117 = v116;
    uint64_t v118 = v138;
    uint64_t v119 = (uint64_t)v136;
    uint64_t v120 = v139;
    (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v136, v107, v139);
    uint64_t v121 = v119 + *(int *)(v143 + 36);
    *(unsigned char *)uint64_t v121 = v135;
    *(void *)(v121 + 8) = v111;
    *(void *)(v121 + 16) = v113;
    *(void *)(v121 + 24) = v115;
    *(void *)(v121 + 32) = v117;
    *(unsigned char *)(v121 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v118 + 8))(v107, v120);
    uint64_t v122 = v140;
    sub_10001323C(v119, v140, &qword_1002F1260);
    sub_10000C3A4(v122, (uint64_t)v142, &qword_1002F1260);
    swift_storeEnumTagMultiPayload();
    sub_100007620(&qword_1002FC840);
    sub_1002174C0();
    sub_1002175B4();
    uint64_t v123 = v151;
    _ConditionalContent<>.init(storage:)();
    sub_10000B070(v122, &qword_1002F1260);
    uint64_t v124 = sub_100007620(&qword_1002FC830);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56))(v123, 0, 1, v124);
    uint64_t v59 = v147;
    sub_10001323C(v123, (uint64_t)v147, &qword_1002FC808);
  }
  else
  {
    uint64_t v125 = sub_100007620(&qword_1002FC830);
    uint64_t v59 = v147;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v125 - 8) + 56))(v147, 1, 1, v125);
  }
LABEL_10:
  Bindable.wrappedValue.getter();
  uint64_t v78 = v162;
  swift_getKeyPath();
  *(void *)&long long v162 = v78;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v147 = (char *)*(id *)(v78 + 72);
  swift_release();
  Bindable.wrappedValue.getter();
  sub_1000295C0(v162 + 24, (uint64_t)&v153);
  swift_release();
  id v79 = v146;
  Bindable.projectedValue.getter();
  swift_getKeyPath();
  Bindable<A>.subscript.getter();
  swift_release();
  (*(void (**)(char *, uint64_t))(v148 + 8))(v79, v41);
  uint64_t v80 = v159;
  uint64_t v81 = v160;
  char v82 = v161;
  Bindable.wrappedValue.getter();
  uint64_t v83 = v162;
  swift_getKeyPath();
  *(void *)&long long v162 = v83;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LOBYTE(v78) = *(unsigned char *)(v83 + 177);
  swift_release();
  uint64_t v84 = (uint64_t *)(v152 + *(int *)(v149 + 28));
  uint64_t v85 = *v84;
  uint64_t v86 = v84[1];
  sub_100019614(*v84);
  type metadata accessor for SceneContext();
  sub_100217AF4((unint64_t *)&unk_1002F97F0, (void (*)(uint64_t))type metadata accessor for SceneContext);
  uint64_t v173 = EnvironmentObject.init()();
  uint64_t v174 = v87;
  type metadata accessor for PersistedTranslation();
  sub_100217AF4(&qword_1002F2E38, (void (*)(uint64_t))&type metadata accessor for PersistedTranslation);
  *(void *)&long long v162 = ObservedObject.init(wrappedValue:)();
  *((void *)&v162 + 1) = v88;
  sub_100048DE4(&v153, (uint64_t)&v163);
  uint64_t v167 = v80;
  uint64_t v168 = v81;
  char v169 = v82;
  char v170 = v78;
  uint64_t v171 = v85;
  uint64_t v172 = v86;
  uint64_t v89 = (uint64_t)v144;
  uint64_t v90 = v145;
  sub_10000C3A4((uint64_t)v144, v145, &qword_1002FC818);
  uint64_t v91 = v151;
  sub_10000C3A4((uint64_t)v59, v151, &qword_1002FC808);
  sub_1001F0C64((uint64_t)&v162, (uint64_t)&v153);
  uint64_t v92 = v150;
  sub_10000C3A4(v90, v150, &qword_1002FC818);
  uint64_t v93 = (int *)sub_100007620(&qword_1002FC838);
  uint64_t v94 = v92 + v93[12];
  *(void *)uint64_t v94 = 0x4020000000000000;
  *(unsigned char *)(v94 + 8) = 0;
  sub_10000C3A4(v91, v92 + v93[16], &qword_1002FC808);
  sub_1001F0C64((uint64_t)&v153, v92 + v93[20]);
  sub_1002173F0((uint64_t)&v162);
  sub_10000B070((uint64_t)v59, &qword_1002FC808);
  sub_10000B070(v89, &qword_1002FC818);
  sub_1002173F0((uint64_t)&v153);
  sub_10000B070(v91, &qword_1002FC808);
  return sub_10000B070(v90, &qword_1002FC818);
}

uint64_t sub_1002129CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v146 = a2;
  uint64_t v134 = type metadata accessor for Locale();
  uint64_t v117 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  uint64_t v132 = (char *)&v115 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = type metadata accessor for LayoutDirection();
  uint64_t v136 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  uint64_t v115 = (char *)&v115 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v5 - 8);
  uint64_t v123 = (char *)&v115 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_100007620(&qword_1002FC648);
  uint64_t v135 = *(void *)(v153 - 8);
  __chkstk_darwin(v153);
  uint64_t v133 = (char *)&v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for SimpleExpandingText();
  uint64_t v122 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v120 = (char *)&v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_100007620(&qword_1002FC870);
  __chkstk_darwin(v118);
  uint64_t v121 = (char *)&v115 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100007620(&qword_1002FC878);
  __chkstk_darwin(v119);
  uint64_t v129 = (uint64_t)&v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_100007620(&qword_1002FC880);
  __chkstk_darwin(v125);
  uint64_t v128 = (char *)&v115 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_100007620(&qword_1002FC888);
  __chkstk_darwin(v131);
  uint64_t v130 = (uint64_t)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100007620(&qword_1002FC890);
  uint64_t v150 = *(void *)(v13 - 8);
  uint64_t v151 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v127 = (char *)&v115 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v126 = (uint64_t)&v115 - v16;
  uint64_t v17 = sub_100007620(&qword_1002FC898);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v152 = (char *)&v115 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v149 = (uint64_t)&v115 - v20;
  uint64_t v21 = type metadata accessor for TranslationCardView();
  uint64_t v22 = v21 - 8;
  uint64_t v142 = *(void *)(v21 - 8);
  uint64_t v141 = *(void *)(v142 + 64);
  __chkstk_darwin(v21);
  uint64_t v139 = (uint64_t)&v115 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100007620(&qword_1002FC8A0);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v115 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100007620(&qword_1002FC8A8);
  uint64_t v28 = v27 - 8;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v145 = (uint64_t)&v115 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v140 = (uint64_t)&v115 - v32;
  __chkstk_darwin(v31);
  uint64_t v148 = (char *)&v115 - v33;
  uint64_t v34 = sub_100007620(&qword_1002FC8B0);
  uint64_t v35 = __chkstk_darwin(v34 - 8);
  uint64_t v144 = (uint64_t)&v115 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v39 = (char *)&v115 - v38;
  __chkstk_darwin(v37);
  uint64_t v41 = (char *)&v115 - v40;
  *(void *)uint64_t v39 = static VerticalAlignment.center.getter();
  *((void *)v39 + 1) = 0;
  v39[16] = 1;
  uint64_t v42 = sub_100007620(&qword_1002FC8B8);
  sub_100213B04((void (*)(uint64_t))&dispatch thunk of PersistedTranslation.targetLocale.getter, 0x80000001002647F0, (uint64_t)&v39[*(int *)(v42 + 44)]);
  uint64_t v143 = v41;
  sub_10001323C((uint64_t)v39, (uint64_t)v41, &qword_1002FC8B0);
  *(void *)uint64_t v26 = static VerticalAlignment.bottom.getter();
  *((void *)v26 + 1) = 0x4024000000000000;
  v26[16] = 0;
  uint64_t v43 = sub_100007620(&qword_1002FC8C0);
  sub_100213DC8(a1, (uint64_t)&v26[*(int *)(v43 + 44)]);
  uint64_t v44 = a1 + *(int *)(v22 + 28);
  Bindable.wrappedValue.getter();
  uint64_t v45 = v154[0];
  swift_getKeyPath();
  v154[0] = v45;
  uint64_t v46 = sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  int v138 = *(unsigned __int8 *)(v45 + 145);
  swift_release();
  uint64_t v137 = v44;
  Bindable.wrappedValue.getter();
  uint64_t v47 = v154[0];
  swift_getKeyPath();
  v154[0] = v47;
  uint64_t v147 = v46;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v48 = *(id *)(v47 + 72);
  swift_release();
  char v49 = sub_100200C14();

  if (v49 == 4) {
    char v50 = 2;
  }
  else {
    char v50 = v49;
  }
  uint64_t v51 = v139;
  sub_10021795C(a1, v139, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  unint64_t v52 = (*(unsigned __int8 *)(v142 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v142 + 80);
  uint64_t v53 = swift_allocObject();
  sub_100217168(v51, v53 + v52);
  uint64_t v54 = static Color.translateAccentColor.getter();
  swift_retain();
  uint64_t v55 = static VerticalAlignment.bottom.getter();
  uint64_t v157 = 0;
  swift_retain();
  static Binding.constant(_:)();
  uint64_t v57 = v154[0];
  uint64_t v56 = v154[1];
  uint64_t v58 = v154[2];
  uint64_t v59 = v140;
  sub_10000C3A4((uint64_t)v26, v140, &qword_1002FC8A0);
  swift_release();
  swift_release();
  uint64_t v60 = v59 + *(int *)(v28 + 44);
  *(unsigned char *)uint64_t v60 = 0;
  *(unsigned char *)(v60 + 1) = v138;
  *(unsigned char *)(v60 + 2) = v50;
  uint64_t v61 = (uint64_t)v152;
  *(void *)(v60 + 8) = sub_1002176E4;
  *(void *)(v60 + 16) = v53;
  *(unsigned char *)(v60 + 24) = 0;
  *(void *)(v60 + 32) = v55;
  *(void *)(v60 + 40) = v54;
  *(void *)(v60 + 48) = v57;
  *(void *)(v60 + 56) = v56;
  uint64_t v62 = (uint64_t)v148;
  uint64_t v63 = v149;
  *(void *)(v60 + 64) = v58;
  *(void *)(v60 + 72) = 0x4020000000000000;
  sub_10000B070((uint64_t)v26, &qword_1002FC8A0);
  sub_10001323C(v59, v62, &qword_1002FC8A8);
  uint64_t v155 = &type metadata for TranslateFeatures;
  unint64_t v156 = sub_10000AB14();
  LOBYTE(v154[0]) = 6;
  LOBYTE(v53) = isFeatureEnabled(_:)();
  sub_10000AB68((uint64_t)v154);
  uint64_t v64 = 1;
  uint64_t v66 = v150;
  uint64_t v65 = v151;
  if (v53)
  {
    uint64_t v67 = v135;
    uint64_t v68 = v136;
    Bindable.wrappedValue.getter();
    uint64_t v69 = v154[0];
    swift_getKeyPath();
    v154[0] = v69;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v70 = *(id *)(v69 + 72);
    swift_release();
    uint64_t v71 = sub_1000CDCA0();
    uint64_t v73 = v72;

    if (v73)
    {
      uint64_t v142 = v71;
      Bindable.wrappedValue.getter();
      uint64_t v74 = v154[0];
      swift_getKeyPath();
      v154[0] = v74;
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v75 = *(id *)(v74 + 72);
      dispatch thunk of PersistedTranslation.translationResult.getter();

      sub_100029624(v154, (uint64_t)v155);
      uint64_t v76 = (void *)dispatch thunk of TranslationResult.disambiguableResult.getter();
      if (v76)
      {
        uint64_t v77 = v76;
        unsigned __int8 v78 = [v76 hasDisambiguationsOfType:1];

        sub_10000AB68((uint64_t)v154);
        swift_release();
        uint64_t v79 = v68;
        uint64_t v80 = v67;
        uint64_t v81 = v133;
        if (v78)
        {
          swift_bridgeObjectRelease();
          uint64_t v64 = 1;
          uint64_t v61 = (uint64_t)v152;
          uint64_t v63 = v149;
LABEL_14:
          uint64_t v66 = v150;
          uint64_t v65 = v151;
          uint64_t v62 = (uint64_t)v148;
          goto LABEL_15;
        }
      }
      else
      {
        sub_10000AB68((uint64_t)v154);
        swift_release();
        uint64_t v79 = v68;
        uint64_t v80 = v67;
        uint64_t v81 = v133;
      }
      uint64_t v82 = v153;
      Bindable.projectedValue.getter();
      swift_getKeyPath();
      Bindable<A>.subscript.getter();
      swift_release();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v81, v82);
      uint64_t v83 = v117;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v117 + 56))(v123, 1, 1, v134);
      uint64_t v84 = v120;
      SimpleExpandingText.init(_:isExpanded:_:buttonAction:)();
      uint64_t v85 = static Font.headline.getter();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v87 = v122;
      uint64_t v88 = (uint64_t)v121;
      uint64_t v89 = v124;
      (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v121, v84, v124);
      uint64_t v90 = (uint64_t *)(v88 + *(int *)(v118 + 36));
      *uint64_t v90 = KeyPath;
      v90[1] = v85;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v84, v89);
      uint64_t v91 = static Color.tertiaryTranslateAccentColor.getter();
      uint64_t v92 = swift_getKeyPath();
      uint64_t v93 = v129;
      sub_10000C3A4(v88, v129, &qword_1002FC870);
      uint64_t v94 = (uint64_t *)(v93 + *(int *)(v119 + 36));
      *uint64_t v94 = v92;
      v94[1] = v91;
      sub_10000B070(v88, &qword_1002FC870);
      uint64_t v95 = swift_getKeyPath();
      Bindable.wrappedValue.getter();
      uint64_t v96 = v154[0];
      swift_getKeyPath();
      v154[0] = v96;
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v97 = *(id *)(v96 + 72);
      swift_release();
      uint64_t v98 = v132;
      dispatch thunk of PersistedTranslation.targetLocale.getter();

      LOBYTE(v96) = Locale.isRTL()();
      (*(void (**)(char *, uint64_t))(v83 + 8))(v98, v134);
      uint64_t v99 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
      if ((v96 & 1) == 0) {
        uint64_t v99 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
      }
      unint64_t v100 = v115;
      uint64_t v101 = v116;
      (*(void (**)(char *, void, uint64_t))(v79 + 104))(v115, *v99, v116);
      uint64_t v102 = (uint64_t)v128;
      id v103 = (uint64_t *)&v128[*(int *)(v125 + 36)];
      uint64_t v104 = sub_100007620(&qword_1002EF468);
      (*(void (**)(char *, char *, uint64_t))(v79 + 16))((char *)v103 + *(int *)(v104 + 28), v100, v101);
      *id v103 = v95;
      sub_10000C3A4(v93, v102, &qword_1002FC878);
      (*(void (**)(char *, uint64_t))(v79 + 8))(v100, v101);
      sub_10000B070(v93, &qword_1002FC878);
      uint64_t v105 = v130;
      sub_10000C3A4(v102, v130, &qword_1002FC880);
      *(_WORD *)(v105 + *(int *)(v131 + 36)) = 256;
      sub_10000B070(v102, &qword_1002FC880);
      sub_100217040(&qword_1002FC8D0, &qword_1002FC888, (void (*)(void))sub_100217714);
      uint64_t v106 = (uint64_t)v127;
      View.accessibilityIdentifier(_:)();
      sub_10000B070(v105, &qword_1002FC888);
      uint64_t v107 = v126;
      sub_10001323C(v106, v126, &qword_1002FC890);
      uint64_t v63 = v149;
      sub_10001323C(v107, v149, &qword_1002FC890);
      uint64_t v64 = 0;
      uint64_t v61 = (uint64_t)v152;
      goto LABEL_14;
    }
    uint64_t v64 = 1;
    uint64_t v65 = v151;
    uint64_t v61 = (uint64_t)v152;
    uint64_t v66 = v150;
  }
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 56))(v63, v64, 1, v65);
  uint64_t v108 = (uint64_t)v143;
  uint64_t v109 = v144;
  sub_10000C3A4((uint64_t)v143, v144, &qword_1002FC8B0);
  uint64_t v110 = v145;
  sub_10000C3A4(v62, v145, &qword_1002FC8A8);
  sub_10000C3A4(v63, v61, &qword_1002FC898);
  uint64_t v111 = v146;
  sub_10000C3A4(v109, v146, &qword_1002FC8B0);
  uint64_t v112 = v62;
  uint64_t v113 = sub_100007620(&qword_1002FC8C8);
  sub_10000C3A4(v110, v111 + *(int *)(v113 + 48), &qword_1002FC8A8);
  sub_10000C3A4(v61, v111 + *(int *)(v113 + 64), &qword_1002FC898);
  sub_10000B070(v63, &qword_1002FC898);
  sub_10000B070(v112, &qword_1002FC8A8);
  sub_10000B070(v108, &qword_1002FC8B0);
  sub_10000B070(v61, &qword_1002FC898);
  sub_10000B070(v110, &qword_1002FC8A8);
  return sub_10000B070(v109, &qword_1002FC8B0);
}

uint64_t sub_100213B04@<X0>(void (*a1)(uint64_t)@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  v30[1] = a2;
  uint64_t v31 = a3;
  uint64_t v4 = sub_100007620(&qword_1002F3AA8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  v30[0] = (uint64_t)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v30 - v7;
  type metadata accessor for TranslationCardView();
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  uint64_t v9 = v32;
  swift_getKeyPath();
  uint64_t v32 = v9;
  sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v10 = *(id *)(v9 + 72);
  swift_release();
  uint64_t v11 = sub_10020D9A0(a1);
  uint64_t v13 = v12;

  uint64_t v32 = v11;
  uint64_t v33 = v13;
  sub_10000C350();
  uint64_t v14 = Text.init<A>(_:)();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  static Font.footnote.getter();
  static Font.Weight.semibold.getter();
  Font.weight(_:)();
  swift_release();
  uint64_t v19 = Text.font(_:)();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  v23 &= 1u;
  sub_10001FC84(v14, v16, v18);
  swift_bridgeObjectRelease();
  uint64_t v32 = v19;
  uint64_t v33 = v21;
  char v34 = v23;
  uint64_t v35 = v25;
  View.accessibilityIdentifier(_:)();
  sub_10001FC84(v19, v21, v23);
  swift_bridgeObjectRelease();
  uint64_t v26 = v30[0];
  sub_10000C3A4((uint64_t)v8, v30[0], &qword_1002F3AA8);
  uint64_t v27 = v31;
  sub_10000C3A4(v26, v31, &qword_1002F3AA8);
  uint64_t v28 = v27 + *(int *)(sub_100007620(&qword_1002FC920) + 48);
  *(void *)uint64_t v28 = 0;
  *(unsigned char *)(v28 + 8) = 1;
  sub_10000B070((uint64_t)v8, &qword_1002F3AA8);
  return sub_10000B070(v26, &qword_1002F3AA8);
}

uint64_t sub_100213DC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v125 = a2;
  uint64_t v3 = type metadata accessor for Locale();
  uint64_t v127 = *(void *)(v3 - 8);
  uint64_t v128 = v3;
  __chkstk_darwin(v3);
  uint64_t v121 = (char *)v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LayoutDirection();
  uint64_t v123 = *(void *)(v5 - 8);
  uint64_t v124 = v5;
  __chkstk_darwin(v5);
  uint64_t v122 = (char *)v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TranslationCardView();
  uint64_t v96 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v109 = (uint64_t)v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v108 = (uint64_t)v94 - v11;
  uint64_t v97 = v12;
  __chkstk_darwin(v10);
  uint64_t v107 = (uint64_t)v94 - v13;
  uint64_t v14 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for AttributedString();
  __chkstk_darwin(v17 - 8);
  uint64_t v110 = (char *)v94 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = type metadata accessor for LanguageAwareText(0);
  __chkstk_darwin(v105);
  uint64_t v20 = (char *)v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_100007620(&qword_1002FC8F8);
  __chkstk_darwin(v114);
  uint64_t v113 = (uint64_t)v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100007620(&qword_1002FC900);
  __chkstk_darwin(v22 - 8);
  uint64_t v112 = (char *)v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_100007620(&qword_1002EF4E0);
  __chkstk_darwin(v111);
  uint64_t v115 = (uint64_t)v94 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100007620(&qword_1002EF4E8);
  __chkstk_darwin(v25 - 8);
  uint64_t v118 = (uint64_t)v94 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_100007620(&qword_1002FC908);
  uint64_t v27 = __chkstk_darwin(v116);
  uint64_t v120 = (uint64_t)v94 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v117 = (char *)v94 - v30;
  __chkstk_darwin(v29);
  uint64_t v119 = (uint64_t)v94 - v31;
  uint64_t v32 = a1;
  uint64_t v33 = a1 + *(int *)(v7 + 20);
  uint64_t v34 = sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  uint64_t v35 = v129;
  swift_getKeyPath();
  uint64_t v129 = v35;
  uint64_t v36 = sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v37 = *(void **)(v35 + 160);
  id v38 = v37;
  swift_release();
  if (!v37)
  {
    sub_10000B0CC(0, &qword_1002F0F90);
    AttributedString.init(stringLiteral:)();
    uint64_t v37 = NSAttributedString.init(_:)();
  }
  uint64_t v106 = v37;
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v127 + 56);
  uint64_t v110 = v16;
  v39(v16, 1, 1, v128);
  uint64_t v40 = v32;
  id v104 = sub_10020DC98();
  Bindable.wrappedValue.getter();
  uint64_t v41 = v129;
  swift_getKeyPath();
  uint64_t v129 = v41;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v103 = *(void *)(v41 + 208);
  uint64_t v102 = *(void *)(v41 + 216);
  int v101 = *(unsigned __int8 *)(v41 + 224);
  swift_release();
  uint64_t v42 = (uint64_t *)(v40 + *(int *)(v7 + 24));
  uint64_t v43 = *v42;
  uint64_t v99 = v42[1];
  swift_unknownObjectRetain();
  uint64_t v126 = v34;
  Bindable.wrappedValue.getter();
  uint64_t v44 = v129;
  swift_getKeyPath();
  uint64_t v129 = v44;
  v94[1] = v36;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v45 = *(unsigned char *)(v44 + 178);
  swift_release();
  uint64_t v100 = v43;
  uint64_t v95 = v20;
  if (v45)
  {
    v94[0] = 0;
  }
  else
  {
    sub_10000B0CC(0, (unint64_t *)&qword_1002F12E0);
    uint64_t v46 = (void *)static UIColor.translateAccentColor.getter();
    v94[0] = [v46 colorWithAlphaComponent:0.2];
  }
  uint64_t v47 = v96;
  uint64_t v98 = v33;
  Bindable.wrappedValue.getter();
  uint64_t v48 = v129;
  swift_getKeyPath();
  uint64_t v129 = v48;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  LODWORD(v97) = *(unsigned __int8 *)(v48 + 178);
  swift_release();
  uint64_t v49 = v107;
  sub_10021795C(v40, v107, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  unint64_t v50 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
  uint64_t v96 = swift_allocObject();
  sub_100217168(v49, v96 + v50);
  uint64_t v51 = v108;
  sub_10021795C(v40, v108, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  uint64_t v107 = swift_allocObject();
  sub_100217168(v51, v107 + v50);
  Bindable.wrappedValue.getter();
  uint64_t v52 = v129;
  swift_getKeyPath();
  uint64_t v129 = v52;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v53 = *(unsigned char *)(v52 + 178);
  swift_release();
  uint64_t v54 = v109;
  sub_10021795C(v40, v109, (uint64_t (*)(void))type metadata accessor for TranslationCardView);
  uint64_t v55 = swift_allocObject();
  sub_100217168(v54, v55 + v50);
  type metadata accessor for LanguageAwareTextViewSizeThatFitsCache();
  uint64_t v56 = (void *)swift_allocObject();
  v56[2] = sub_1001FF68C((uint64_t)_swiftEmptyArrayStorage);
  v56[3] = _swiftEmptyArrayStorage;
  v56[4] = 100;
  uint64_t v57 = (uint64_t)v95;
  *uint64_t v95 = v106;
  *(_OWORD *)(v57 + 8) = xmmword_10024C780;
  uint64_t v58 = (int *)v105;
  sub_10001323C((uint64_t)v110, v57 + *(int *)(v105 + 24), (uint64_t *)&unk_1002F4110);
  *(void *)(v57 + v58[7]) = v104;
  *(unsigned char *)(v57 + v58[8]) = 0;
  *(void *)(v57 + v58[9]) = 0;
  *(void *)(v57 + v58[10]) = 0;
  *(unsigned char *)(v57 + v58[11]) = 0;
  uint64_t v59 = v57 + v58[12];
  uint64_t v60 = v102;
  *(void *)uint64_t v59 = v103;
  *(void *)(v59 + 8) = v60;
  *(unsigned char *)(v59 + 16) = v101;
  uint64_t v61 = (void *)(v57 + v58[13]);
  uint64_t v62 = v99;
  *uint64_t v61 = v100;
  v61[1] = v62;
  *(void *)(v57 + v58[14]) = v94[0];
  *(unsigned char *)(v57 + v58[15]) = (v97 & 1) == 0;
  uint64_t v63 = (void *)(v57 + v58[16]);
  uint64_t v64 = v96;
  void *v63 = sub_100217938;
  v63[1] = v64;
  uint64_t v65 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v57 + v58[17]);
  uint64_t v66 = v107;
  *uint64_t v65 = sub_100217940;
  v65[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v66;
  uint64_t v67 = (void *)(v57 + v58[18]);
  *uint64_t v67 = 0;
  v67[1] = 0;
  *(void *)(v57 + v58[19]) = 0;
  *(unsigned char *)(v57 + v58[20]) = (v53 & 1) == 0;
  uint64_t v68 = (uint64_t (**)(char, uint64_t))(v57 + v58[21]);
  *uint64_t v68 = sub_100217950;
  v68[1] = (uint64_t (*)(char, uint64_t))v55;
  *(void *)(v57 + v58[22]) = v56;
  static Font.title.getter();
  uint64_t v69 = Font.bold()();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v71 = v113;
  sub_10021795C(v57, v113, type metadata accessor for LanguageAwareText);
  uint64_t v72 = (uint64_t *)(v71 + *(int *)(v114 + 36));
  *uint64_t v72 = KeyPath;
  v72[1] = v69;
  sub_1002179C4(v57, type metadata accessor for LanguageAwareText);
  sub_100217A24();
  uint64_t v73 = (uint64_t)v112;
  View.accessibilityIdentifier(_:)();
  sub_10000B070(v71, &qword_1002FC8F8);
  uint64_t v74 = v115;
  sub_10000C3A4(v73, v115, &qword_1002FC900);
  *(void *)(v74 + *(int *)(v111 + 36)) = 0x3FF199999999999ALL;
  sub_10000B070(v73, &qword_1002FC900);
  uint64_t v75 = static Alignment.leading.getter();
  uint64_t v76 = v118;
  sub_10001D294(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v118, 0.0, 1, 0.0, 1, v75, v77);
  sub_10000B070(v74, &qword_1002EF4E0);
  uint64_t v78 = swift_getKeyPath();
  Bindable.wrappedValue.getter();
  uint64_t v79 = v129;
  swift_getKeyPath();
  uint64_t v129 = v79;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v80 = *(id *)(v79 + 72);
  swift_release();
  uint64_t v81 = v121;
  dispatch thunk of PersistedTranslation.targetLocale.getter();

  LOBYTE(v80) = Locale.isRTL()();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v81, v128);
  uint64_t v83 = v122;
  uint64_t v82 = v123;
  uint64_t v84 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
  if ((v80 & 1) == 0) {
    uint64_t v84 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
  }
  uint64_t v85 = v124;
  (*(void (**)(char *, void, uint64_t))(v123 + 104))(v122, *v84, v124);
  uint64_t v86 = (uint64_t)v117;
  uint64_t v87 = (uint64_t *)&v117[*(int *)(v116 + 36)];
  uint64_t v88 = sub_100007620(&qword_1002EF468);
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))((char *)v87 + *(int *)(v88 + 28), v83, v85);
  *uint64_t v87 = v78;
  sub_10000C3A4(v76, v86, &qword_1002EF4E8);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v85);
  sub_10000B070(v76, &qword_1002EF4E8);
  uint64_t v89 = v119;
  sub_10001323C(v86, v119, &qword_1002FC908);
  uint64_t v90 = v120;
  sub_10000C3A4(v89, v120, &qword_1002FC908);
  uint64_t v91 = v125;
  sub_10000C3A4(v90, v125, &qword_1002FC908);
  uint64_t v92 = v91 + *(int *)(sub_100007620(&qword_1002FC918) + 48);
  *(void *)uint64_t v92 = 0;
  *(unsigned char *)(v92 + 8) = 0;
  sub_10000B070(v89, &qword_1002FC908);
  return sub_10000B070(v90, &qword_1002FC908);
}

uint64_t sub_100214BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(id, uint64_t, uint64_t))(a3
                                                      + *(int *)(type metadata accessor for TranslationCardView() + 48));
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  swift_getKeyPath();
  sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v6 = *(id *)(v9 + 72);
  swift_release();
  uint64_t v7 = v5(v6, a1, a2);

  return v7;
}

uint64_t sub_100214CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  uint64_t v16 = a1;
  uint64_t v8 = type metadata accessor for DisambiguationResultModel.TextLocation();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationCardView();
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  uint64_t v12 = v21;
  swift_getKeyPath();
  uint64_t v21 = v12;
  sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v13 = *(void (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 96);
  sub_100019614((uint64_t)v13);
  uint64_t result = swift_release();
  if (v13)
  {
    Bindable.wrappedValue.getter();
    uint64_t v15 = v21;
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *a7, v8);
    v13(v15, v11, v16, v17, v18, v19, v20);
    swift_release();
    sub_1000324E4((uint64_t)v13);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_100214EF0(char a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v7 = type metadata accessor for DisambiguationResultModel.TextLocation();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationCardView();
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *a4, v7);
  sub_100042FA4(a1, (uint64_t)v10, a2);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10021502C(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  type metadata accessor for TranslationCardView();
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  sub_100041F1C(a1, v3, 0);
  return swift_release();
}

uint64_t sub_1002150A4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + *(int *)(type metadata accessor for TranslationCardView() + 40)))
  {
    id v2 = self;
    swift_retain();
    id v3 = [v2 sharedApplication];
    [v3 sendAction:"resignFirstResponder" to:0 from:0 forEvent:0];
    swift_release();

    sub_100007620(&qword_1002F1168);
    return State.wrappedValue.setter();
  }
  else
  {
    type metadata accessor for SceneContext();
    sub_100217AF4((unint64_t *)&unk_1002F97F0, (void (*)(uint64_t))type metadata accessor for SceneContext);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

void sub_1002151E8()
{
  sub_1002152D0();
  type metadata accessor for TranslationCardView();
  sub_100007620(&qword_1002FC648);
  Bindable.wrappedValue.getter();
  swift_getKeyPath();
  sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v0 = *(void **)(v2 + 88);
  id v1 = v0;
  swift_release();
  if (v0)
  {
    dispatch thunk of DisambiguationResultModel.didAppear()();
  }
}

void sub_1002152D0()
{
  id v1 = *(void **)(v0 + *(int *)(type metadata accessor for TranslationCardView() + 32));
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    static Published.subscript.getter();

    swift_release();
    swift_release();
    if ((v8 & 1) == 0)
    {
      id v3 = sub_10020255C(0, 1, 1, _swiftEmptyArrayStorage);
      unint64_t v5 = v3[2];
      unint64_t v4 = v3[3];
      if (v5 >= v4 >> 1) {
        id v3 = sub_10020255C((void *)(v4 > 1), v5 + 1, 1, v3);
      }
      v3[2] = v5 + 1;
      v3[v5 + 4] = 1;
    }
    sub_100007620(&qword_1002FC648);
    Bindable.wrappedValue.getter();
    swift_getKeyPath();
    sub_100217AF4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v6 = *(void **)(v8 + 88);
    id v7 = v6;
    swift_release();
    if (v6)
    {
      dispatch thunk of DisambiguationResultModel.excludedTypes.setter();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    type metadata accessor for SharedTranslationOptions();
    sub_100217AF4(&qword_1002F3740, (void (*)(uint64_t))type metadata accessor for SharedTranslationOptions);
    EnvironmentObject.error()();
    __break(1u);
  }
}

unint64_t sub_1002154F4(uint64_t a1, uint64_t a2, Swift::UInt a3)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[3] = (uint64_t)&type metadata for TranslateFeatures;
  v30[4] = sub_10000AB14();
  LOBYTE(v30[0]) = 5;
  char v9 = isFeatureEnabled(_:)();
  sub_10000AB68((uint64_t)v30);
  unint64_t v10 = 0;
  if (v9)
  {
    uint64_t v11 = dispatch thunk of PersistedTranslation.disambiguableResult.getter();
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      id v14 = [v12 sentenceWithUUID:isa];

      if (v14)
      {
        unint64_t v10 = (unint64_t)_LTDisambiguableSentence.menu(forLinkIndex:)(a3);

        return v10;
      }
      if (qword_1002EE5E8 != -1) {
        swift_once();
      }
      uint64_t v15 = type metadata accessor for Logger();
      sub_100011554(v15, (uint64_t)qword_10030E9C0);
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
      id v16 = v12;
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = swift_slowAlloc();
        uint64_t v27 = (void *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        v30[0] = v28;
        *(_DWORD *)uint64_t v19 = 136446466;
        sub_100217AF4(&qword_1002F1050, (void (*)(uint64_t))&type metadata accessor for UUID);
        os_log_t v26 = v17;
        uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v29 = sub_100202FD4(v20, v21, v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        *(_WORD *)(v19 + 12) = 2114;
        uint64_t v29 = (uint64_t)v16;
        id v22 = v16;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v27 = v12;

        os_log_t v23 = v26;
        _os_log_impl((void *)&_mh_execute_header, v26, v18, "Unable to find sentence UUID %{public}s in result %{public}@", (uint8_t *)v19, 0x16u);
        sub_100007620((uint64_t *)&unk_1002F6DE0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
    }
    return 0;
  }
  return v10;
}

uint64_t *sub_1002158C8(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    unint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[5];
    char v9 = (char *)v4 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100007620(&qword_1002FC648);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[7];
    *(_OWORD *)((char *)v4 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
    uint64_t v13 = (uint64_t *)((char *)v4 + v12);
    id v14 = (char *)a2 + v12;
    uint64_t v15 = *(uint64_t *)((char *)a2 + v12);
    swift_unknownObjectRetain();
    if (v15)
    {
      uint64_t v16 = *((void *)v14 + 1);
      *uint64_t v13 = v15;
      v13[1] = v16;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    }
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    uint64_t v20 = (uint64_t *)((char *)v4 + v18);
    unint64_t v21 = (char *)a2 + v18;
    os_log_t v23 = *(void **)v21;
    uint64_t v22 = *((void *)v21 + 1);
    void *v20 = v23;
    v20[1] = v22;
    uint64_t v24 = (uint64_t *)((char *)v4 + v19);
    uint64_t v25 = (uint64_t *)((char *)a2 + v19);
    id v26 = v23;
    sub_100007620((uint64_t *)&unk_1002F5770);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v27 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v28 = *(void *)(v27 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v28 + 48))(v25, 1, v27))
      {
        uint64_t v29 = sub_100007620(&qword_1002F1058);
        memcpy(v24, v25, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v28 + 16))(v24, v25, v27);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v24, 0, 1, v27);
      }
    }
    else
    {
      *uint64_t v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v30 = a3[10];
    uint64_t v31 = a3[11];
    uint64_t v32 = (uint64_t *)((char *)v4 + v30);
    uint64_t v33 = (uint64_t *)((char *)a2 + v30);
    uint64_t v34 = *v33;
    uint64_t v35 = v33[1];
    *uint64_t v32 = v34;
    v32[1] = v35;
    uint64_t v36 = (char *)v4 + v31;
    uint64_t v37 = (char *)a2 + v31;
    *uint64_t v36 = *v37;
    *((void *)v36 + 1) = *((void *)v37 + 1);
    uint64_t v38 = a3[12];
    uint64_t v39 = a3[13];
    uint64_t v40 = (uint64_t *)((char *)v4 + v38);
    uint64_t v41 = (uint64_t *)((char *)a2 + v38);
    uint64_t v42 = v41[1];
    void *v40 = *v41;
    v40[1] = v42;
    *(uint64_t *)((char *)v4 + v39) = *(uint64_t *)((char *)a2 + v39);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100215BD0(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_100007620(&qword_1002FC648);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease();
  if (*(void *)(a1 + a2[7])) {
    swift_release();
  }

  uint64_t v7 = a1 + a2[9];
  sub_100007620((uint64_t *)&unk_1002F5770);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_100215DB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100007620(&qword_1002FC648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)(a2 + v11);
  swift_unknownObjectRetain();
  if (v14)
  {
    uint64_t v15 = *(void *)(v13 + 8);
    void *v12 = v14;
    v12[1] = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (void *)(a1 + v16);
  uint64_t v19 = a2 + v16;
  unint64_t v21 = *(void **)v19;
  uint64_t v20 = *(void *)(v19 + 8);
  *uint64_t v18 = v21;
  v18[1] = v20;
  uint64_t v22 = (void *)(a1 + v17);
  os_log_t v23 = (void *)(a2 + v17);
  id v24 = v21;
  sub_100007620((uint64_t *)&unk_1002F5770);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v26 + 48))(v23, 1, v25))
    {
      uint64_t v27 = sub_100007620(&qword_1002F1058);
      memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 16))(v22, v23, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v22, 0, 1, v25);
    }
  }
  else
  {
    *uint64_t v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v28 = a3[10];
  uint64_t v29 = a3[11];
  uint64_t v30 = (void *)(a1 + v28);
  uint64_t v31 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v31;
  uint64_t v33 = v31[1];
  *uint64_t v30 = v32;
  v30[1] = v33;
  uint64_t v34 = a1 + v29;
  uint64_t v35 = a2 + v29;
  *(unsigned char *)uint64_t v34 = *(unsigned char *)v35;
  *(void *)(v34 + 8) = *(void *)(v35 + 8);
  uint64_t v36 = a3[12];
  uint64_t v37 = a3[13];
  uint64_t v38 = (void *)(a1 + v36);
  uint64_t v39 = (void *)(a2 + v36);
  uint64_t v40 = v39[1];
  void *v38 = *v39;
  v38[1] = v40;
  *(void *)(a1 + v37) = *(void *)(a2 + v37);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10021606C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100007620(&qword_1002FC648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)(a1 + v15);
  uint64_t v19 = *(void *)(a2 + v15);
  if (v18)
  {
    if (v19)
    {
      uint64_t v20 = *(void *)(v17 + 8);
      void *v16 = v19;
      v16[1] = v20;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v19)
  {
    uint64_t v21 = *(void *)(v17 + 8);
    void *v16 = v19;
    v16[1] = v21;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
LABEL_8:
  uint64_t v22 = a3[8];
  os_log_t v23 = (void *)(a1 + v22);
  uint64_t v24 = a2 + v22;
  uint64_t v25 = *(void **)(a1 + v22);
  uint64_t v26 = *(void **)(a2 + v22);
  *os_log_t v23 = v26;
  id v27 = v26;

  v23[1] = *(void *)(v24 + 8);
  if (a1 != a2)
  {
    uint64_t v28 = a3[9];
    uint64_t v29 = (void *)(a1 + v28);
    uint64_t v30 = (void *)(a2 + v28);
    sub_10000B070(a1 + v28, (uint64_t *)&unk_1002F5770);
    sub_100007620((uint64_t *)&unk_1002F5770);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v31 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v32 = *(void *)(v31 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
      {
        uint64_t v33 = sub_100007620(&qword_1002F1058);
        memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v32 + 16))(v29, v30, v31);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      }
    }
    else
    {
      *uint64_t v29 = *v30;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v34 = a3[10];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(void *)(a1 + v34) = *(void *)(a2 + v34);
  swift_retain();
  swift_release();
  *(void *)(v35 + 8) = *(void *)(v36 + 8);
  uint64_t v37 = a3[11];
  uint64_t v38 = a1 + v37;
  uint64_t v39 = a2 + v37;
  *(unsigned char *)uint64_t v38 = *(unsigned char *)v39;
  *(void *)(v38 + 8) = *(void *)(v39 + 8);
  swift_retain();
  swift_release();
  uint64_t v40 = a3[12];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (void *)(a2 + v40);
  uint64_t v43 = v42[1];
  *uint64_t v41 = *v42;
  v41[1] = v43;
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1002163D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100007620(&qword_1002FC648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  if (*v13)
  {
    uint64_t v15 = v13[1];
    void *v12 = v14;
    v12[1] = v15;
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  uint64_t v16 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = sub_100007620((uint64_t *)&unk_1002F5770);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v18, 1, v20))
    {
      uint64_t v22 = sub_100007620(&qword_1002F1058);
      memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v17, v18, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v17, 0, 1, v20);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  uint64_t v23 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v23) = *(_OWORD *)(a2 + v23);
  uint64_t v24 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(void *)(a1 + v24) = *(void *)(a2 + v24);
  return a1;
}

uint64_t sub_100216640(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100007620(&qword_1002FC648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  swift_unknownObjectRelease();
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)(a1 + v15);
  uint64_t v19 = *(void *)(a2 + v15);
  if (v18)
  {
    if (v19)
    {
      uint64_t v20 = *(void *)(v17 + 8);
      void *v16 = v19;
      v16[1] = v20;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v19)
  {
    uint64_t v21 = *(void *)(v17 + 8);
    void *v16 = v19;
    v16[1] = v21;
    goto LABEL_8;
  }
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
LABEL_8:
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = *(void **)(a1 + v22);
  *uint64_t v23 = *v24;

  v23[1] = v24[1];
  if (a1 != a2)
  {
    uint64_t v26 = a3[9];
    id v27 = (void *)(a1 + v26);
    uint64_t v28 = (const void *)(a2 + v26);
    sub_10000B070(a1 + v26, (uint64_t *)&unk_1002F5770);
    uint64_t v29 = sub_100007620((uint64_t *)&unk_1002F5770);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v31 + 48))(v28, 1, v30))
      {
        uint64_t v32 = sub_100007620(&qword_1002F1058);
        memcpy(v27, v28, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v31 + 32))(v27, v28, v30);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v31 + 56))(v27, 0, 1, v30);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
    }
  }
  uint64_t v33 = a3[10];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  *(void *)(a1 + v33) = *(void *)(a2 + v33);
  swift_release();
  *(void *)(v34 + 8) = *(void *)(v35 + 8);
  uint64_t v36 = a3[11];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  *(unsigned char *)uint64_t v37 = *(unsigned char *)v38;
  *(void *)(v37 + 8) = *(void *)(v38 + 8);
  swift_release();
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  swift_release();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_release();
  return a1;
}

uint64_t sub_100216970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100216984);
}

uint64_t sub_100216984(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100007620(&qword_1002FC648);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_100007620(&qword_1002F1068);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[9];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[12]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_100216AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100216B00);
}

uint64_t sub_100216B00(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_100007620(&qword_1002FC648);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_100007620(&qword_1002F1068);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[12]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[9];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for TranslationCardView()
{
  uint64_t result = qword_1002FC6A8;
  if (!qword_1002FC6A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100216CB0()
{
  type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    sub_100216DE0();
    if (v1 <= 0x3F)
    {
      sub_1000542E0();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100216DE0()
{
  if (!qword_1002FC6B8)
  {
    type metadata accessor for CommittedTranslationViewModel();
    unint64_t v0 = type metadata accessor for Bindable();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1002FC6B8);
    }
  }
}

uint64_t sub_100216E38()
{
  return sub_100217AF4(&qword_1002F43C0, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_100216E80()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100216EA4()
{
  unint64_t result = qword_1002FC778;
  if (!qword_1002FC778)
  {
    sub_100007928(&qword_1002FC718);
    sub_100216F44();
    sub_100014894(&qword_1002F5D90, &qword_1002F11E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC778);
  }
  return result;
}

unint64_t sub_100216F44()
{
  unint64_t result = qword_1002FC780;
  if (!qword_1002FC780)
  {
    sub_100007928(&qword_1002FC710);
    sub_100217040(&qword_1002FC788, &qword_1002FC738, (void (*)(void))sub_100217010);
    sub_100014894(&qword_1002F2388, &qword_1002F2390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC780);
  }
  return result;
}

uint64_t sub_100217010()
{
  return sub_100217040(&qword_1002FC790, &qword_1002FC730, (void (*)(void))sub_1002170BC);
}

uint64_t sub_100217040(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007928(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1002170BC()
{
  unint64_t result = qword_1002FC798;
  if (!qword_1002FC798)
  {
    sub_100007928(&qword_1002FC728);
    sub_100014894(&qword_1002FC7A0, &qword_1002FC720);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC798);
  }
  return result;
}

uint64_t sub_100217168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranslationCardView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1002171CC()
{
  type metadata accessor for TranslationCardView();

  sub_1002151E8();
}

void sub_100217238()
{
}

unint64_t sub_100217294()
{
  unint64_t result = qword_1002FC7B0;
  if (!qword_1002FC7B0)
  {
    sub_100007928(&qword_1002FC748);
    sub_100217310();
    sub_1000544B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC7B0);
  }
  return result;
}

unint64_t sub_100217310()
{
  unint64_t result = qword_1002FC7B8;
  if (!qword_1002FC7B8)
  {
    sub_100007928(&qword_1002FC740);
    sub_100216EA4();
    sub_100217040(&qword_1002FC788, &qword_1002FC738, (void (*)(void))sub_100217010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC7B8);
  }
  return result;
}

uint64_t sub_1002173F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100217450(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for TranslationCardView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1002150A4(a1, v4);
}

unint64_t sub_1002174C0()
{
  unint64_t result = qword_1002FC848;
  if (!qword_1002FC848)
  {
    sub_100007928(&qword_1002FC840);
    sub_100217040(&qword_1002FC850, &qword_1002FC858, (void (*)(void))sub_100217560);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC848);
  }
  return result;
}

unint64_t sub_100217560()
{
  unint64_t result = qword_1002FC860;
  if (!qword_1002FC860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC860);
  }
  return result;
}

unint64_t sub_1002175B4()
{
  unint64_t result = qword_1002FC868;
  if (!qword_1002FC868)
  {
    sub_100007928(&qword_1002F1260);
    sub_100007928(&qword_1002F1250);
    sub_100007928(&qword_1002F1248);
    sub_100014894(&qword_1002F12A0, &qword_1002F1248);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC868);
  }
  return result;
}

uint64_t sub_1002176E4(uint64_t a1, char a2)
{
  return sub_100217B68(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10021502C);
}

unint64_t sub_100217714()
{
  unint64_t result = qword_1002FC8D8;
  if (!qword_1002FC8D8)
  {
    sub_100007928(&qword_1002FC880);
    sub_1002177B4();
    sub_100014894(&qword_1002EF460, &qword_1002EF468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC8D8);
  }
  return result;
}

unint64_t sub_1002177B4()
{
  unint64_t result = qword_1002FC8E0;
  if (!qword_1002FC8E0)
  {
    sub_100007928(&qword_1002FC878);
    sub_100217854();
    sub_100014894(&qword_1002EF3A0, &qword_1002EF3A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC8E0);
  }
  return result;
}

unint64_t sub_100217854()
{
  unint64_t result = qword_1002FC8E8;
  if (!qword_1002FC8E8)
  {
    sub_100007928(&qword_1002FC870);
    sub_100217AF4(&qword_1002FC8F0, (void (*)(uint64_t))&type metadata accessor for SimpleExpandingText);
    sub_100014894(&qword_1002EF0E8, &qword_1002EF0F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC8E8);
  }
  return result;
}

uint64_t sub_100217940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100217C94(a1, a2, a3, a4, a5, (unsigned int *)&enum case for DisambiguationResultModel.TextLocation.target(_:));
}

uint64_t sub_100217950(char a1, uint64_t a2)
{
  return sub_100217FA8(a1, a2, (unsigned int *)&enum case for DisambiguationResultModel.TextLocation.target(_:));
}

uint64_t sub_10021795C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1002179C4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100217A24()
{
  unint64_t result = qword_1002FC910;
  if (!qword_1002FC910)
  {
    sub_100007928(&qword_1002FC8F8);
    sub_100217AF4(&qword_1002F1308, (void (*)(uint64_t))type metadata accessor for LanguageAwareText);
    sub_100014894(&qword_1002EF0E8, &qword_1002EF0F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC910);
  }
  return result;
}

uint64_t sub_100217AF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100217B50(uint64_t a1, char a2)
{
  return sub_100217B68(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1002114BC);
}

uint64_t sub_100217B68(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a2 & 1;
  uint64_t v6 = *(void *)(type metadata accessor for TranslationCardView() - 8);
  uint64_t v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return a3(a1, v5, v7);
}

uint64_t sub_100217C10(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for TranslationCardView() - 8);
  return sub_100214BC8(a1, a2, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
}

uint64_t sub_100217C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_100217C94(a1, a2, a3, a4, a5, (unsigned int *)&enum case for DisambiguationResultModel.TextLocation.source(_:));
}

uint64_t sub_100217C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v13 = *(void *)(type metadata accessor for TranslationCardView() - 8);
  return sub_100214CE8(a1, a2, a3, a4, a5, v6 + ((*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), a6);
}

uint64_t sub_100217D3C()
{
  uint64_t v1 = (int *)type metadata accessor for TranslationCardView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  uint64_t v7 = v0 + v3 + v1[5];
  uint64_t v8 = sub_100007620(&qword_1002FC648);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_unknownObjectRelease();
  if (*(void *)(v0 + v3 + v1[7])) {
    swift_release();
  }

  uint64_t v9 = v5 + v1[9];
  sub_100007620((uint64_t *)&unk_1002F5770);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100217F9C(char a1, uint64_t a2)
{
  return sub_100217FA8(a1, a2, (unsigned int *)&enum case for DisambiguationResultModel.TextLocation.source(_:));
}

uint64_t sub_100217FA8(char a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v7 = *(void *)(type metadata accessor for TranslationCardView() - 8);
  return sub_100214EF0(a1, a2, v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a3);
}

ValueMetadata *type metadata accessor for TranslationCardView.Icons()
{
  return &type metadata for TranslationCardView.Icons;
}

uint64_t sub_10021803C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10021815C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (*a1) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = a1[1] == 1;
  }
  if (v5)
  {
    sub_10000B070((uint64_t)a1, &qword_1002FCB70);
    unint64_t v8 = sub_100203890(a2);
    if (v9)
    {
      unint64_t v10 = v8;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = *v2;
      uint64_t v14 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1002069DC();
        uint64_t v12 = v14;
      }
      sub_100208090(*(void *)(v12 + 56) + 16 * v10, (uint64_t)&v15);
      sub_10022B1B0(v10, v12);
      *uint64_t v3 = v12;
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v15 = xmmword_10024FEC0;
    }
    return sub_10000B070((uint64_t)&v15, &qword_1002FCB70);
  }
  else
  {
    sub_100208090((uint64_t)a1, (uint64_t)&v15);
    char v6 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_100206038((uint64_t)&v15, a2, v6);
    *uint64_t v2 = v13;
    return swift_bridgeObjectRelease();
  }
}

void sub_10021827C(uint64_t a1, void *a2, void *a3, void *aBlock)
{
  char v6 = *(void (**)(id, id, uint64_t (*)(char), uint64_t))(a1 + 32);
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_retain();
  id v10 = a2;
  id v9 = a3;
  v6(v10, v9, sub_100228D8C, v8);
  swift_release();
  swift_release();
}

uint64_t sub_100218350(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_1002183A4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 72);
  *a2 = v4;

  return v4;
}

void sub_10021845C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  id v2 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

uint64_t sub_100218538@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 178);
  return result;
}

uint64_t sub_1002185E0()
{
  return swift_release();
}

uint64_t sub_1002186B0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 225);
  return result;
}

uint64_t sub_100218758()
{
  return swift_release();
}

uint64_t sub_100218828@<X0>(unsigned char *a1@<X8>)
{
  return sub_10007860C(a1);
}

void sub_10021883C()
{
}

double sub_1002188B4@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100228DF0((unint64_t *)&unk_1002FC9F0, (void (*)(uint64_t))type metadata accessor for CardMetrics);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  double result = *(double *)(v3 + 16);
  *a2 = result;
  return result;
}

uint64_t sub_10021895C()
{
  return swift_release();
}

uint64_t sub_100218A34(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_100218A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  char v6 = (void *)v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();

  return v6;
}

void sub_100218B10(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_getKeyPath();
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    swift_retain();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v3 = [*(id *)(a2 + 72) objectID];
    NSObject.hash(into:)();
    swift_release();
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
}

Swift::Int sub_100218C08(uint64_t a1)
{
  Hasher.init(_seed:)();
  if (a1)
  {
    swift_getKeyPath();
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    swift_retain();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v2 = [*(id *)(a1 + 72) objectID:a1];
    NSObject.hash(into:)();
    swift_release();
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
  return Hasher._finalize()();
}

Swift::Int sub_100218D08()
{
  return sub_100218C08(*v0);
}

void sub_100218D10(uint64_t a1)
{
  sub_100218B10(a1, *v1);
}

Swift::Int sub_100218D18()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  if (v1)
  {
    swift_getKeyPath();
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    swift_retain();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v2 = [*(id *)(v1 + 72) objectID:v1];
    NSObject.hash(into:)();
    swift_release();
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
  return Hasher._finalize()();
}

unint64_t sub_100218E14(uint64_t *a1, uint64_t *a2)
{
  return sub_1002283E0(*a1, *a2);
}

uint64_t sub_100218E20()
{
  uint64_t v1 = v0;
  id v2 = &v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
  uint64_t v38 = *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
  uint64_t v39 = *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                     + 8];
  if (!v39)
  {
    id v3 = &v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryHighlightRect];
    *(_OWORD *)id v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    v3[32] = 1;
    uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryTextView];
    *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryTextView] = 0;

    BOOL v5 = *(void **)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController];
    if (!v5)
    {
      id v12 = [v0 presentedViewController];
      if (!v12)
      {
        if (qword_1002EE5E0 != -1) {
          swift_once();
        }
        uint64_t v19 = type metadata accessor for Logger();
        sub_100011554(v19, (uint64_t)qword_10030E9A8);
        char v6 = Logger.logObject.getter();
        os_log_type_t v20 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v6, v20))
        {
          uint64_t v21 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, v20, "Unable to find any dictionary view controller to dismiss", v21, 2u);
          swift_slowDealloc();
        }
        goto LABEL_18;
      }
      uint64_t v13 = (uint64_t)v12;
      if (qword_1002EE5E0 != -1) {
        goto LABEL_45;
      }
      goto LABEL_11;
    }
    char v6 = v5;
    uint64_t v7 = [v6 presentingViewController];
    if (!v7) {
      uint64_t v7 = v6;
    }
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = v9;
    aBlock[4] = (uint64_t)sub_100227F6C;
    aBlock[5] = v10;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10008BA1C;
    aBlock[3] = (uint64_t)&unk_1002D3540;
    uint64_t v11 = _Block_copy(aBlock);
    swift_release();
    [v7 dismissViewControllerAnimated:1 completion:v11];
    _Block_release(v11);
    goto LABEL_8;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (aBlock[0])
  {
    swift_retain();
    sub_10005D934(0);
    swift_release();
  }
  while (1)
  {
    unint64_t v22 = *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore];
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
      if (!v13) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v13 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (!v13) {
        goto LABEL_36;
      }
    }
    if (v13 >= 1) {
      break;
    }
    __break(1u);
LABEL_45:
    swift_once();
LABEL_11:
    uint64_t v14 = type metadata accessor for Logger();
    sub_100011554(v14, (uint64_t)qword_10030E9A8);
    char v6 = (id)v13;
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v16 = 136446210;
      swift_getObjectType();
      uint64_t v17 = _typeName(_:qualified:)();
      aBlock[6] = sub_100202FD4(v17, v18, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v15, "Couldn't find dictionaryController to dismiss but have presented view controller: %{public}s; not attempting to "
        "dismiss it though since it might not be a dictionaryController",
        v16,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
LABEL_8:
    }
    else
    {

LABEL_18:
    }
    sub_100222D94(1u, 1);
  }
  uint64_t v23 = 0;
  unint64_t v40 = v22 & 0xC000000000000001;
  uint64_t v41 = v13;
  uint64_t v42 = v2;
  do
  {
    if (v40)
    {
      uint64_t v26 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      uint64_t v26 = *(void *)(v22 + 8 * v23 + 32);
      swift_retain();
    }
    unint64_t v27 = v22;
    uint64_t v28 = *((void *)v2 + 1);
    if (v28)
    {
      uint64_t v29 = *(void *)v2;
      swift_getKeyPath();
      aBlock[0] = v26;
      sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
      swift_bridgeObjectRetain_n();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v30 = [*(id *)(v26 + 72) identifier];
      uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v33 = v32;

      if (v29 != v31 || v28 != v33) {
        _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
    }
    ++v23;
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    aBlock[0] = v26;
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v25 = swift_getKeyPath();
    __chkstk_darwin(v25);
    aBlock[0] = v26;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_release();
    id v2 = v42;
    unint64_t v22 = v27;
  }
  while (v41 != v23);
LABEL_36:
  swift_bridgeObjectRelease_n();
  if (v39)
  {
    if (v38 == 0xD000000000000025 && v39 == 0x80000001002649E0) {
      char v35 = 1;
    }
    else {
      char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    char v36 = v35;
  }
  else
  {
    char v35 = 0;
    char v36 = 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(aBlock[0]) = v35 & 1;
  swift_retain_n();
  static Published.subscript.setter();
  sub_10005F92C();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(aBlock[0]) = v36 & 1;
  swift_retain();
  static Published.subscript.setter();
  return sub_10021DE4C(0);
}

uint64_t sub_100219710(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100236B94(*a1, *a2);
}

Swift::Int sub_10021971C()
{
  return Hasher._finalize()();
}

uint64_t sub_1002197C8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100219860()
{
  return Hasher._finalize()();
}

unint64_t sub_100219908@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1002288B8(*a1);
  *a2 = result;
  return result;
}

void sub_100219938(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE800000000000000;
  unint64_t v4 = 0xEA00000000007972;
  uint64_t v5 = 0x616E6F6974636964;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6F68706F7263696DLL;
    unint64_t v4 = 0xEA0000000000656ELL;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6472616F6279656BLL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

id sub_1002199A0(uint64_t a1)
{
  uint64_t v69 = sub_100007620(&qword_1002F2128);
  uint64_t v67 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v65 = (char *)v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_100007620(&qword_1002FCB10);
  uint64_t v66 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v64 = (char *)v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007620(&qword_1002FCB18);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100007620(&qword_1002FAEF0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = (void *)sub_100007620(&qword_1002F31B0);
  uint64_t v57 = *(v58 - 1);
  __chkstk_darwin(v58);
  uint64_t v13 = (char *)v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100007620(&qword_1002FCB20);
  uint64_t v59 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  os_log_type_t v15 = (char *)v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100007620(&qword_1002FCB28);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v17 = (char *)v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource] = 0;
  unint64_t v18 = v1;
  uint64_t v71 = v6;
  uint64_t v72 = v5;
  id v70 = v8;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    uint64_t v19 = (void *)sub_10011050C((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v19 = &_swiftEmptySetSingleton;
  }
  *(void *)&v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_observers] = v19;
  *(void *)&v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore] = _swiftEmptyArrayStorage;
  os_log_type_t v20 = &v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
  *(void *)os_log_type_t v20 = 0;
  *((void *)v20 + 1) = 0;
  *(void *)&v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController] = 0;
  uint64_t v21 = &v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryHighlightRect];
  *(_OWORD *)uint64_t v21 = 0u;
  *((_OWORD *)v21 + 1) = 0u;
  v21[32] = 1;
  *(void *)&v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryTextView] = 0;
  unint64_t v22 = &v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pendingDictionaryModeIdentifier];
  *(void *)unint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v23 = &v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_entryCardStaticIdentifier];
  *(void *)uint64_t v23 = 0xD000000000000018;
  *((void *)v23 + 1) = 0x8000000100264AB0;
  v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pinComposeCardToKeyboard] = 0;
  uint64_t v24 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_bottomInsetReasonToHeightMap;
  *(void *)&v18[v24] = sub_1001FF9F8((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v25 = &v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_lastKnownKeyboardFrame];
  *(_OWORD *)uint64_t v25 = 0u;
  *((_OWORD *)v25 + 1) = 0u;
  *(void *)&v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel] = a1;
  swift_retain();

  uint64_t v26 = (objc_class *)type metadata accessor for TranslationListController();
  v77.receiver = v18;
  v77.super_class = v26;
  id v73 = [super initWithNibName:0 bundle:0];
  uint64_t v74 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel;
  unint64_t v27 = v73;
  swift_beginAccess();
  id v28 = v27;
  swift_retain();
  sub_100007620((uint64_t *)&unk_1002F9700);
  Published.projectedValue.getter();
  swift_endAccess();
  swift_release();
  sub_10000B0CC(0, (unint64_t *)&qword_1002EEE30);
  aBlock[0] = (id)static OS_dispatch_queue.main.getter();
  uint64_t v29 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  uint64_t v56 = v30 + 56;
  v55(v11, 1, 1, v29);
  v54[2] = &protocol conformance descriptor for Published<A>.Publisher;
  sub_100014894((unint64_t *)&unk_1002FCB30, &qword_1002F31B0);
  v54[1] = sub_100022364();
  uint64_t v31 = v58;
  Publisher.receive<A>(on:options:)();
  sub_10000B070((uint64_t)v11, &qword_1002FAEF0);

  (*(void (**)(char *, void *))(v57 + 8))(v13, v31);
  *(void *)(swift_allocObject() + 16) = v28;
  id v32 = v28;
  sub_100007620(&qword_1002FCA28);
  uint64_t v58 = &protocol conformance descriptor for Publishers.ReceiveOn<A, B>;
  sub_100014894(&qword_1002FCB40, &qword_1002FCB20);
  uint64_t v33 = v17;
  uint64_t v34 = v60;
  Publisher.map<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v15, v34);
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v32;
  *(void *)(v35 + 24) = a1;
  uint64_t v63 = a1;
  sub_100014894(&qword_1002FCB48, &qword_1002FCB28);
  swift_retain();
  id v36 = v32;
  uint64_t v37 = v62;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v37);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  swift_retain();
  sub_100007620((uint64_t *)&unk_1002FCB50);
  uint64_t v38 = v65;
  Published.projectedValue.getter();
  swift_endAccess();
  swift_release();
  aBlock[0] = (id)static OS_dispatch_queue.main.getter();
  v55(v11, 1, 1, v29);
  sub_100014894(&qword_1002F2170, &qword_1002F2128);
  uint64_t v39 = v64;
  uint64_t v40 = v69;
  Publisher.receive<A>(on:options:)();
  sub_10000B070((uint64_t)v11, &qword_1002FAEF0);

  (*(void (**)(char *, uint64_t))(v67 + 8))(v38, v40);
  sub_100014894(&qword_1002FCB60, &qword_1002FCB10);
  uint64_t v41 = v70;
  uint64_t v42 = v68;
  Publisher<>.removeDuplicates()();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v39, v42);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100014894(&qword_1002FCB68, &qword_1002FCB18);
  uint64_t v43 = v72;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v41, v43);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  id v44 = [self defaultCenter];
  id v45 = [self mainQueue];
  uint64_t v46 = (void *)swift_allocObject();
  v46[2] = v36;
  aBlock[4] = sub_100229490;
  aBlock[5] = v46;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_10018FADC;
  aBlock[3] = &unk_1002D39B8;
  uint64_t v47 = _Block_copy(aBlock);
  id v48 = v36;
  swift_release();
  id v49 = [v44 addObserverForName:UIKeyboardWillChangeFrameNotification object:0 queue:v45 usingBlock:v47];
  _Block_release(v47);
  swift_unknownObjectRelease();

  v75[1] = &off_1002D3490;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  id v50 = v48;
  swift_retain();
  sub_10021815C(v75, (uint64_t)v50);
  swift_endAccess();
  swift_release();

  sub_100007620(&qword_1002F4100);
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_1002488D0;
  *(void *)(v51 + 32) = type metadata accessor for UITraitHorizontalSizeClass();
  *(void *)(v51 + 40) = &protocol witness table for UITraitHorizontalSizeClass;
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v52 = v50;
  sub_100007620(&qword_1002F4108);
  UIViewController.registerForTraitChanges<A>(_:handler:)();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return v52;
}

void sub_10021A690(unint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  unint64_t v4 = *a1;
  id v5 = a2;
  uint64_t v6 = sub_100228528(v4, (uint64_t)v5);

  *a3 = v6;
}

uint64_t sub_10021A6EC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = *a1;
  uint64_t v6 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore;
  unint64_t v7 = *(void *)(a2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore);
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!(v5 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!(v5 >> 62))
    {
LABEL_3:
      uint64_t v9 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_4:
  *(void *)(a2 + v6) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_newTranslationFromPunchOut;
  if (*(unsigned char *)(a3 + OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_newTranslationFromPunchOut)) {
    unsigned int v11 = 2;
  }
  else {
    unsigned int v11 = sub_1002225CC() & (v8 < v9);
  }
  uint64_t result = sub_10021DE4C(v11);
  *(unsigned char *)(a3 + v10) = 0;
  return result;
}

uint64_t sub_10021A800(unsigned __int8 *a1)
{
  int v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (v1)
    {
      unint64_t v4 = (void *)(result
                    + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode);
      uint64_t v5 = *(void *)(result
                     + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                     + 8);
      *unint64_t v4 = 0;
      v4[1] = 0;
      if (v5)
      {
        sub_100218E20();
        swift_bridgeObjectRelease();
      }
    }
    id v6 = [v3 traitCollection];
    sub_1000D1030();
    UITraitCollection.subscript.getter();

    if ((v12 & 1) == 0)
    {
      id v7 = [v3 parentViewController];
      if (v7)
      {
        uint64_t v8 = v7;
        id v9 = [v7 navigationItem];

        [v9 setLargeTitleDisplayMode:0];
      }
    }
    if (v1)
    {
      if (qword_1002EE6A0 != -1) {
        swift_once();
      }
    }
    uint64_t v10 = sub_10000B0CC(0, (unint64_t *)&unk_1002F4120);
    __chkstk_darwin(v10);
    id v11 = v3;
    static Animation.default.getter();
    static UIView.animate(with:changes:completion:)();

    return swift_release();
  }
  return result;
}

void sub_10021AA30(char *a1, char a2, double a3)
{
  sub_100222734(2u, 0, a3);
  if (a2)
  {
    uint64_t v5 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView;
    id v6 = *(void **)&a1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView];
    if (v6)
    {
      [v6 contentSize];
      uint64_t v8 = *(void **)&a1[v5];
      if (!v8)
      {
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      double v9 = v7;
      [v8 frame];
      double MaxY = CGRectGetMaxY(v35);
      id v11 = *(void **)&a1[v5];
      if (!v11)
      {
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      double v12 = MaxY;
      [v11 adjustedContentInset];
      uint64_t v14 = *(void **)&a1[v5];
      if (!v14)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        return;
      }
      double v15 = v13;
      [v14 adjustedContentInset];
      double v17 = v16;
      id v18 = [a1 traitCollection];
      sub_1000D1030();
      UITraitCollection.subscript.getter();

      if (v34) {
        goto LABEL_18;
      }
      id v19 = [a1 parentViewController];
      if (!v19) {
        goto LABEL_18;
      }
      os_log_type_t v20 = v19;
      id v21 = [v19 navigationController];

      if (!v21) {
        goto LABEL_18;
      }
      id v22 = [v21 navigationBar];

      if (!v22) {
        goto LABEL_18;
      }
      if ((sub_10023A7E0() & 1) == 0)
      {
LABEL_17:

LABEL_18:
        sub_10021B910(0);
        return;
      }
      sub_10023A9E4();
      if (v23 >= 0.0)
      {
        double v24 = v9 - (v12 - v15 - v17);
        if (v24 >= 0.0 && v24 <= v23)
        {
          id v26 = [a1 parentViewController];
          if (v26)
          {
            unint64_t v27 = v26;
            id v28 = [v26 navigationItem];

            [v28 setLargeTitleDisplayMode:2];
          }
          uint64_t v29 = *(void **)&a1[v5];
          if (v29)
          {
            id v30 = v29;
            [v30 contentOffset];
            double v32 = v31;
            sub_10023A9E4();
            [v30 setContentOffset:0, 0.0, v32 + v33 + 5.0];

            return;
          }
          goto LABEL_29;
        }
        goto LABEL_17;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
}

void sub_10021AC98()
{
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int v1 = Strong;
    int v2 = &Strong[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
    uint64_t v3 = *(void *)&Strong[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                          + 8];
    *(void *)int v2 = 0;
    *((void *)v2 + 1) = 0;
    if (v3)
    {
      sub_100218E20();

      swift_bridgeObjectRelease();
    }
    else
    {
    }
  }
}

void sub_10021AD6C()
{
  id v1 = [objc_allocWithZone((Class)UIView) init];
  [v0 setView:v1];

  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  [v2 setAutoresizingMask:18];

  id v4 = [v0 view];
  if (!v4)
  {
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v5 = v4;
  id v6 = [self clearColor];
  [v5 setBackgroundColor:v6];

  sub_10021C73C();
}

uint64_t sub_10021AF18(char a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v7 = (objc_class *)type metadata accessor for TranslationListController();
  v12.receiver = v1;
  v12.super_class = v7;
  [super viewDidAppear:a1 & 1];
  sub_10021DE4C(0);
  uint64_t v8 = *(void *)(*(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel]
                 + OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_currentSelfLoggingInvocation);
  swift_retain();
  swift_retain();
  UUID.init()();
  uint64_t v9 = v8 + OBJC_IVAR____TtC17SequoiaTranslator28SELFLoggingInvocationWrapper_tabSessionId;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v9, v6, v3);
  swift_endAccess();
  *(unsigned char *)(v8 + OBJC_IVAR____TtC17SequoiaTranslator28SELFLoggingInvocationWrapper_hasLoggedGenderCoreAnalytics) = 0;
  swift_release();
  return swift_release();
}

void sub_10021B0D0(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = v3;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for TranslationListController();
  [super viewWillTransitionToSize:a1 withTransitionCoordinator:a2 a3];
  if ((sub_10021B250() & 1) == 0)
  {
    if (qword_1002EE5E0 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100011554(v8, (uint64_t)qword_10030E9A8);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Dismissing Dictionary Mode due to rotation/size change in a configuration we can't properly move the highlight", v11, 2u);
      swift_slowDealloc();
    }

    objc_super v12 = &v4[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
    uint64_t v13 = *(void *)&v4[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                       + 8];
    *(void *)objc_super v12 = 0;
    *((void *)v12 + 1) = 0;
    if (v13)
    {
      sub_100218E20();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_10021B250()
{
  uint64_t v1 = type metadata accessor for Locale();
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v7 = *(void *)(v0
                 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                 + 8);
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v34 = v6;
  CGRect v35 = (char *)&v34 - v4;
  uint64_t v36 = v5;
  uint64_t v37 = v3;
  uint64_t v39 = *(void *)(v0
                  + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode);
  uint64_t v40 = v7;
  unint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore);
  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
LABEL_24:
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  if (!v9)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
LABEL_20:
    char v31 = 0;
    return v31 & 1;
  }
LABEL_4:
  unint64_t v38 = v8 & 0xC000000000000001;
  uint64_t v10 = 4;
  while (1)
  {
    uint64_t v11 = v10 - 4;
    if (v38)
    {
      uint64_t v12 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v13 = v10 - 3;
      if (__OFADD__(v11, 1)) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      swift_retain();
      uint64_t v13 = v10 - 3;
      if (__OFADD__(v11, 1))
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
    swift_getKeyPath();
    uint64_t v41 = v12;
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v14 = [*(id *)(v12 + 72) identifier];
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    if (v15 == v39 && v40 == v17) {
      break;
    }
    char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_18;
    }
    swift_release();
    ++v10;
    if (v13 == v9) {
      goto LABEL_16;
    }
  }
  swift_bridgeObjectRelease();
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v41 = v12;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v20 = *(id *)(v12 + 72);
  id v21 = v35;
  dispatch thunk of PersistedTranslation.sourceLocale.getter();
  uint64_t v22 = v34;
  dispatch thunk of PersistedTranslation.targetLocale.getter();
  id v23 = objc_allocWithZone((Class)_LTLocalePair);
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  Class v25 = Locale._bridgeToObjectiveC()().super.isa;
  id v26 = [v23 initWithSourceLocale:isa targetLocale:v25];

  unint64_t v27 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  uint64_t v28 = v22;
  uint64_t v29 = v37;
  v27(v28, v37);
  v27((uint64_t)v21, v29);

  id v30 = [v26 sourceLocale];
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v30) = Locale.isRTL()();
  v27((uint64_t)v21, v29);
  if (v30)
  {
    swift_release();

    goto LABEL_20;
  }
  id v33 = [v26 targetLocale];
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v33) = Locale.isRTL()();
  swift_release();

  v27((uint64_t)v21, v29);
  char v31 = v33 ^ 1;
  return v31 & 1;
}

void sub_10021B790()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pinComposeCardToKeyboard) != 1) {
    return;
  }
  sub_10021B910(0);
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v16) {
      return;
    }
  }
  else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return;
  }
  uint64_t v2 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
  if (!v3)
  {
    __break(1u);
    goto LABEL_16;
  }
  [v3 layoutIfNeeded];
  uint64_t v4 = *(void **)(v0 + v2);
  if (!v4)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  [v4 contentOffset];
  uint64_t v7 = *(void **)(v0 + v2);
  if (!v7)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    return;
  }
  double v8 = v5;
  double v9 = v6;
  id v10 = v7;
  id v11 = [v10 traitCollection];
  [v11 displayScale];
  double v13 = v12;

  double v14 = 16.0;
  if (v13 != 0.0) {
    double v14 = sub_1000E70D0(v13 * 16.0) / v13;
  }
  uint64_t v15 = *(void **)(v0 + v2);
  if (!v15) {
    goto LABEL_18;
  }

  [v15 setContentOffset:0 animated:v8, v9 + v14];
}

uint64_t sub_10021B910(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100007620((uint64_t *)&unk_1002F4B60);
  __chkstk_darwin(v4 - 8);
  double v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *(void **)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource);
  if (v11)
  {
    uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_entryCardStaticIdentifier + 8);
    v18[0] = *(void *)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_entryCardStaticIdentifier);
    v18[1] = v12;
    id v13 = v11;
    swift_bridgeObjectRetain();
    dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
    swift_bridgeObjectRelease();

    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  IndexPath.init(row:section:)();
  uint64_t result = sub_10000B070((uint64_t)v6, (uint64_t *)&unk_1002F4B60);
LABEL_6:
  uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
  if (v15)
  {
    id v16 = v15;
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    [v16 scrollToItemAtIndexPath:isa atScrollPosition:4 animated:a1 & 1];

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10021BB54(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource);
  if (v8)
  {
    uint64_t v9 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView;
    id v10 = *(void **)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
    if (!v10)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    id v11 = v8;
    id v12 = v10;
    uint64_t v13 = dispatch thunk of UICollectionViewDiffableDataSource.numberOfSections(in:)();

    if (v13 >= 1)
    {
      double v14 = *(void **)(v2 + v9);
      if (!v14)
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      id v15 = v14;
      uint64_t v16 = dispatch thunk of UICollectionViewDiffableDataSource.collectionView(_:numberOfItemsInSection:)();

      if (v16 >= 1)
      {
        uint64_t v17 = *(void **)(v2 + v9);
        if (!v17)
        {
LABEL_21:
          __break(1u);
LABEL_22:
          __break(1u);
          return;
        }
        id v18 = v17;
        uint64_t v19 = dispatch thunk of UICollectionViewDiffableDataSource.collectionView(_:numberOfItemsInSection:)();

        if (!__OFSUB__(v19, 1))
        {
          IndexPath.init(item:section:)();
          id v20 = *(void **)(v2 + v9);
          if (v20)
          {
            id v21 = v20;
            Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
            [v21 scrollToItemAtIndexPath:isa atScrollPosition:4 animated:a1 & 1];

            (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
            return;
          }
          goto LABEL_22;
        }
        __break(1u);
        goto LABEL_19;
      }
    }
  }
  if (qword_1002EE648 != -1) {
    swift_once();
  }
  uint64_t v23 = type metadata accessor for Logger();
  sub_100011554(v23, (uint64_t)qword_10030EAE0);
  os_log_t v28 = (os_log_t)Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v24))
  {
    Class v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Class v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v24, "Couldn't scroll to the last translation card", v25, 2u);
    swift_slowDealloc();
  }
  os_log_t v26 = v28;
}

void *sub_10021BE1C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100007620(&qword_1002FCAA0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100007620(&qword_1002FCA18);
  uint64_t v38 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v37 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for UICollectionLayoutListConfiguration();
  uint64_t v13 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  id v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for UICollectionLayoutListConfiguration.Appearance.insetGrouped(_:), v9);
  UICollectionLayoutListConfiguration.init(appearance:)();
  UICollectionLayoutListConfiguration.headerTopPadding.setter();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  UICollectionLayoutListConfiguration.trailingSwipeActionsConfigurationProvider.setter();
  sub_10000B0CC(0, &qword_1002F4BA0);
  uint64_t result = (void *)static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
  uint64_t v17 = result;
  if (a1 == 1)
  {
    [result contentInsets];
    [v17 setContentInsets:0.0];
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v39);
    return v17;
  }
  if (a1)
  {
    if (qword_1002EE648 != -1) {
      swift_once();
    }
    uint64_t v31 = type metadata accessor for Logger();
    sub_100011554(v31, (uint64_t)qword_10030EAE0);
    double v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.fault.getter();
    BOOL v34 = os_log_type_enabled(v32, v33);
    uint64_t v28 = v39;
    if (v34)
    {
      CGRect v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)CGRect v35 = 134349056;
      uint64_t v41 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Failed to get section for index %{public}ld; data might be malformed",
        v35,
        0xCu);
      swift_slowDealloc();
    }

    goto LABEL_17;
  }
  id v18 = *(void **)(v2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
  if (v18)
  {
    id v19 = v18;
    id v20 = [v19 traitCollection];
    [v20 displayScale];
    double v22 = v21;

    double v23 = 16.0;
    if (v22 != 0.0) {
      double v23 = sub_1000E70D0(v22 * 16.0) / v22;
    }
    [v17 setInterGroupSpacing:v23];
    os_log_type_t v24 = *(void **)(v2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource);
    uint64_t v25 = v38;
    if (v24)
    {
      id v26 = v24;
      dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();

      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v6, 0, 1, v7);
      int v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v6, 1, v7);
      uint64_t v28 = v39;
      if (v27 != 1)
      {
        uint64_t v29 = v37;
        (*(void (**)(void))(v25 + 32))();
        char v40 = 0;
        uint64_t v30 = *(void *)(NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)() + 16);
        swift_bridgeObjectRelease();
        if (!v30)
        {
          [v17 contentInsets];
          [v17 setContentInsets:0.0];
          [v17 contentInsets];
          [v17 setContentInsets:];
        }
        (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v7);
LABEL_17:
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v28);
        return v17;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v6, 1, 1, v7);
      uint64_t v28 = v39;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v28);
    sub_10000B070((uint64_t)v6, &qword_1002FCAA0);
    return v17;
  }
  __break(1u);
  return result;
}

char *sub_10021C3F4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v1 = (char *)Strong;
  if (Strong)
  {
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource);
    if (v2
      && (id v3 = v2,
          dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)(),
          v3,
          v19))
    {
      unint64_t v4 = *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore];
      uint64_t v17 = v1;
      if (v4 >> 62) {
        goto LABEL_26;
      }
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
      {
        uint64_t v6 = 4;
        while (1)
        {
          uint64_t v7 = v6 - 4;
          if ((v4 & 0xC000000000000001) == 0) {
            break;
          }
          uint64_t v8 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1)) {
            goto LABEL_25;
          }
LABEL_12:
          swift_getKeyPath();
          sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
          ObservationRegistrar.access<A, B>(_:keyPath:)();
          swift_release();
          id v10 = [*(id *)(v8 + 72) identifier];
          uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v13 = v12;

          if (v11 == v18 && v19 == v13)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_24:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v1 = (char *)sub_10022348C(v8);

            swift_release();
            return v1;
          }
          char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v15)
          {
            swift_bridgeObjectRelease();
            goto LABEL_24;
          }
          swift_release();
          ++v6;
          if (v9 == v5) {
            goto LABEL_18;
          }
        }
        uint64_t v8 = *(void *)(v4 + 8 * v6);
        swift_retain();
        uint64_t v9 = v6 - 3;
        if (!__OFADD__(v7, 1)) {
          goto LABEL_12;
        }
LABEL_25:
        __break(1u);
LABEL_26:
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
      }
LABEL_18:

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    else
    {
    }
    return 0;
  }
  return v1;
}

void *sub_10021C6BC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0;
  }
  id v3 = (void *)Strong;
  unint64_t v4 = sub_10021BE1C(a1);

  return v4;
}

void sub_10021C73C()
{
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v2 = v1;
  [v1 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v12 = objc_allocWithZone((Class)UICollectionViewCompositionalLayout);
  v30[4] = sub_10022928C;
  uint64_t v30[5] = v11;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 1107296256;
  uint64_t v30[2] = sub_100218A94;
  v30[3] = &unk_1002D3888;
  uint64_t v13 = _Block_copy(v30);
  id v14 = [v12 initWithSectionProvider:v13];
  _Block_release(v13);
  swift_release();
  id v15 = [objc_allocWithZone((Class)UICollectionView) initWithFrame:v14 collectionViewLayout:v4];

  uint64_t v16 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView;
  uint64_t v17 = *(void **)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView];
  *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView] = v15;

  uint64_t v18 = *(void **)&v0[v16];
  if (!v18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  [v18 setAutoresizingMask:18];
  uint64_t v19 = *(void **)&v0[v16];
  if (!v19)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v20 = self;
  id v21 = v19;
  id v22 = [v20 systemGroupedBackgroundColor];
  [v21 setBackgroundColor:v22];

  double v23 = *(void **)&v0[v16];
  if (!v23)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  [v23 setKeyboardDismissMode:2];
  os_log_type_t v24 = *(void **)&v0[v16];
  if (!v24)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  [v24 setAllowsSelection:0];
  id v25 = [v0 view];
  if (!v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (!*(void *)&v0[v16])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v26 = v25;
  [v25 addSubview:];

  int v27 = *(void **)&v0[v16];
  if (!v27)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  [v27 setTag:204];
  uint64_t v28 = *(void **)&v0[v16];
  if (v28)
  {
    id v29 = [v28 keyboardLayoutGuide];
    [v29 setUsesBottomSafeArea:0];

    return;
  }
LABEL_19:
  __break(1u);
}

uint64_t sub_10021CA0C()
{
  uint64_t v1 = sub_100007620((uint64_t *)&unk_1002FCA40);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = __chkstk_darwin(v1);
  CGRect v35 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v4);
  BOOL v34 = (char *)&v31 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  double v9 = (char *)&v31 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v31 - v10;
  *(void *)(swift_allocObject() + 16) = v0;
  sub_10000B0CC(0, (unint64_t *)&qword_1002F4C18);
  id v12 = v0;
  uint64_t v36 = v11;
  UICollectionView.CellRegistration.init(handler:)();
  *(void *)(swift_allocObject() + 16) = v12;
  uint64_t v13 = (char *)v12;
  id v14 = v9;
  uint64_t result = UICollectionView.CellRegistration.init(handler:)();
  id v33 = *(id *)&v13[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView];
  if (v33)
  {
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
    uint64_t v17 = v34;
    v16(v34, v36, v1);
    uint64_t v18 = v35;
    double v32 = v14;
    v16(v35, v14, v1);
    uint64_t v19 = *(unsigned __int8 *)(v2 + 80);
    uint64_t v20 = (v19 + 24) & ~v19;
    uint64_t v21 = (v3 + v19 + v20) & ~v19;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v13;
    double v23 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
    v23(v22 + v20, v17, v1);
    v23(v22 + v21, v18, v1);
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_100229140;
    *(void *)(v24 + 24) = v22;
    id v25 = objc_allocWithZone((Class)sub_100007620(&qword_1002FCA50));
    id v26 = v13;
    id v27 = v33;
    uint64_t v28 = UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
    id v29 = *(void **)&v26[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource];
    *(void *)&v26[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource] = v28;

    uint64_t v30 = *(void (**)(char *, uint64_t))(v2 + 8);
    v30(v32, v1);
    return ((uint64_t (*)(char *, uint64_t))v30)(v36, v1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10021CD6C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  v27[2] = a4;
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100007620((uint64_t *)&unk_1002FCA80);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v27 - v16;
  uint64_t v18 = *a3;
  if (IndexPath.section.getter())
  {
    if (qword_1002EE648 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100011554(v19, (uint64_t)qword_10030EAE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 134349056;
      uint64_t v23 = IndexPath.section.getter();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v28[0] = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Malformed data: we are asked to configure a cell for a section that cannot exist: %{public}ld", v22, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
  else
  {
    v27[1] = a1;
    if (v18)
    {
      __chkstk_darwin(0);
      v27[-2] = v18;
      v27[-1] = v24;
      type metadata accessor for TranslationCardView();
      sub_100228DF0(&qword_1002F4C28, (void (*)(uint64_t))type metadata accessor for TranslationCardView);
      swift_retain();
      UIHostingConfiguration<>.init(content:)();
      static Edge.Set.all.getter();
      UIHostingConfiguration.margins(_:_:)();
      id v25 = *(void (**)(char *, uint64_t))(v12 + 8);
      v25(v15, v11);
      v28[3] = v11;
      v28[4] = sub_100014894((unint64_t *)&qword_1002FCA90, (uint64_t *)&unk_1002FCA80);
      id v26 = sub_100014830(v28);
      (*(void (**)(uint64_t *, char *, uint64_t))(v12 + 16))(v26, v17, v11);
      UICollectionViewCell.contentConfiguration.setter();
      swift_release();
      v25(v17, v11);
    }
  }
}

uint64_t sub_10021D184@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  UUID.init()();
  type metadata accessor for SharedTranslationOptions();
  sub_100228DF0(&qword_1002F3740, (void (*)(uint64_t))type metadata accessor for SharedTranslationOptions);
  uint64_t v23 = EnvironmentObject.init()();
  uint64_t v9 = v8;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v11 = (int *)type metadata accessor for TranslationCardView();
  *(void *)(a2 + v11[9]) = KeyPath;
  sub_100007620((uint64_t *)&unk_1002F5770);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  type metadata accessor for CommittedTranslationViewModel();
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  id v12 = a1;
  Bindable<A>.init(wrappedValue:)();
  uint64_t v13 = (void *)(a2 + v11[6]);
  *uint64_t v13 = a1;
  v13[1] = &off_1002D34A0;
  uint64_t v14 = (void *)(a2 + v11[7]);
  *uint64_t v14 = 0;
  v14[1] = 0;
  id v15 = (uint64_t *)(a2 + v11[8]);
  *id v15 = v23;
  v15[1] = v9;
  uint64_t v16 = (uint64_t *)(a2 + v11[10]);
  type metadata accessor for SceneContext();
  sub_100228DF0((unint64_t *)&unk_1002F97F0, (void (*)(uint64_t))type metadata accessor for SceneContext);
  uint64_t *v16 = EnvironmentObject.init()();
  v16[1] = v17;
  uint64_t v18 = a2 + v11[11];
  char v24 = 0;
  State.init(wrappedValue:)();
  uint64_t v19 = v26;
  *(unsigned char *)uint64_t v18 = v25;
  *(void *)(v18 + 8) = v19;
  uint64_t v20 = (unint64_t (**)(uint64_t, uint64_t, Swift::UInt))(a2 + v11[12]);
  NSObject *v20 = sub_1002154F4;
  v20[1] = 0;
  uint64_t v21 = v11[13];
  uint64_t result = Image.init(systemName:)();
  *(void *)(a2 + v21) = result;
  return result;
}

void sub_10021D46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a1;
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007620(&qword_1002FCA58);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v28[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v28[-1] - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v28[-1] - v18;
  if (IndexPath.section.getter() == 1)
  {
    __chkstk_darwin(1);
    *(&v27 - 2) = a4;
    type metadata accessor for ComposeTranslationCardView();
    sub_100228DF0(&qword_1002FCA60, (void (*)(uint64_t))type metadata accessor for ComposeTranslationCardView);
    UIHostingConfiguration<>.init(content:)();
    static Edge.Set.all.getter();
    UIHostingConfiguration.margins(_:_:)();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    v20(v14, v10);
    UIHostingConfiguration.animatedSizeInvalidationDisabled()();
    v20(v17, v10);
    v28[3] = v10;
    v28[4] = sub_100014894(&qword_1002FCA68, &qword_1002FCA58);
    uint64_t v21 = sub_100014830(v28);
    (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 16))(v21, v19, v10);
    UICollectionViewCell.contentConfiguration.setter();
    v20(v19, v10);
  }
  else
  {
    if (qword_1002EE648 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100011554(v22, (uint64_t)qword_10030EAE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)char v25 = 134349056;
      uint64_t v26 = IndexPath.section.getter();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v28[0] = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Malformed data: we are asked to configure a cell for a section that cannot exist: %{public}ld", v25, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
}

uint64_t sub_10021D8A4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_100007620((uint64_t *)&unk_1002F5770);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for ConversationContext(0);
  sub_100228DF0(&qword_1002EF2A0, (void (*)(uint64_t))type metadata accessor for ConversationContext);
  swift_retain();
  swift_retain();
  uint64_t v2 = EnvironmentObject.init()();
  uint64_t v4 = v3;
  type metadata accessor for SceneContext();
  sub_100228DF0((unint64_t *)&unk_1002F97F0, (void (*)(uint64_t))type metadata accessor for SceneContext);
  uint64_t v5 = EnvironmentObject.init()();
  uint64_t v7 = v6;
  uint64_t v8 = (int *)type metadata accessor for ComposeTranslationCardView();
  uint64_t v9 = (uint64_t *)((char *)a1 + v8[5]);
  *uint64_t v9 = v2;
  v9[1] = v4;
  uint64_t v10 = (uint64_t *)((char *)a1 + v8[6]);
  *uint64_t v10 = v5;
  v10[1] = v7;
  uint64_t v11 = (uint64_t *)((char *)a1 + v8[7]);
  type metadata accessor for ComposeTranslationViewModel(0);
  sub_100228DF0(&qword_1002F1228, (void (*)(uint64_t))type metadata accessor for ComposeTranslationViewModel);
  *uint64_t v11 = ObservedObject.init(wrappedValue:)();
  v11[1] = v12;
  uint64_t v13 = (uint64_t *)((char *)a1 + v8[8]);
  type metadata accessor for LanguagesService();
  sub_100228DF0((unint64_t *)&unk_1002FCA70, (void (*)(uint64_t))&type metadata accessor for LanguagesService);
  *uint64_t v13 = ObservedObject.init(wrappedValue:)();
  v13[1] = v14;
  uint64_t v15 = (char *)a1 + v8[9];
  *uint64_t v15 = FocusState.init<>()() & 1;
  *((void *)v15 + 1) = v16;
  v15[16] = v17 & 1;
  uint64_t v18 = (char *)a1 + v8[10];
  State.init(wrappedValue:)();
  *uint64_t v18 = v21;
  *((void *)v18 + 1) = v22;
  sub_100054398();
  uint64_t result = ScaledMetric.init(wrappedValue:)();
  uint64_t v20 = (unint64_t (**)(void *, uint64_t, Swift::UInt))((char *)a1 + v8[12]);
  NSObject *v20 = sub_100052074;
  v20[1] = 0;
  return result;
}

uint64_t sub_10021DB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (IndexPath.section.getter())
  {
    sub_10000B0CC(0, (unint64_t *)&qword_1002F4C18);
    return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
  }
  unint64_t v9 = *(void *)(a5 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore);
  if (v9 >> 62) {
    goto LABEL_22;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  unint64_t v23 = v9;
  if (v10)
  {
LABEL_5:
    unint64_t v11 = v9 & 0xC000000000000001;
    uint64_t v12 = 4;
    do
    {
      uint64_t v13 = v12 - 4;
      if (v11)
      {
        uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        uint64_t v15 = v12 - 3;
        if (__OFADD__(v13, 1)) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v14 = *(void *)(v9 + 8 * v12);
        swift_retain();
        uint64_t v15 = v12 - 3;
        if (__OFADD__(v13, 1))
        {
LABEL_21:
          __break(1u);
LABEL_22:
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
          unint64_t v23 = v9;
          if (!v10) {
            break;
          }
          goto LABEL_5;
        }
      }
      swift_getKeyPath();
      sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v16 = [*(id *)(v14 + 72) identifier];
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;

      if (v17 == a3 && v19 == a4) {
        goto LABEL_18;
      }
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      unint64_t v9 = v23;
      if (v21) {
        goto LABEL_19;
      }
      swift_release();
      ++v12;
    }
    while (v15 != v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_18:
  swift_bridgeObjectRelease();
LABEL_19:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000B0CC(0, (unint64_t *)&qword_1002F4C18);
  swift_retain();
  uint64_t v8 = UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
  swift_release_n();
  return v8;
}

uint64_t sub_10021DE4C(int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100007620(&qword_1002FCA18);
  uint64_t v5 = *(uint64_t (***)(char *, uint64_t))(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v71 - v9;
  sub_100228F98();
  NSDiffableDataSourceSnapshot.init()();
  NSDiffableDataSourceSnapshot.appendSections(_:)((Swift::OpaquePointer)&off_1002C85A8);
  sub_100007620(&qword_1002EE8A0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1002488D0;
  uint64_t v12 = *(void *)&v2[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_entryCardStaticIdentifier + 8];
  *(void *)(v11 + 32) = *(void *)&v2[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_entryCardStaticIdentifier];
  *(void *)(v11 + 40) = v12;
  LOBYTE(v80[0]) = 1;
  swift_bridgeObjectRetain();
  uint64_t v76 = v10;
  uint64_t v77 = v4;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
  swift_bridgeObjectRelease();
  uint64_t v78 = (uint64_t (**)(char *, uint64_t))v2;
  uint64_t v75 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore;
  unint64_t v13 = *(void *)&v2[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore];
  if ((v13 & 0x8000000000000000) != 0 || (v13 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v14 = (uint64_t)sub_1002257CC(v13, (void (*)(void *, uint64_t, unint64_t))sub_1002277F4);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = v13 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  v80[0] = v14;
  sub_1002254C8(v80);
  int v72 = a1;
  uint64_t v74 = v5;
  swift_bridgeObjectRelease();
  unint64_t v15 = v80[0];
  id v73 = v8;
  if (v80[0] < 0 || (v80[0] & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(v80[0] + 16);
    if (!v16) {
      goto LABEL_20;
    }
  }
  v80[0] = (uint64_t)_swiftEmptyArrayStorage;
  sub_1000B2CE4(0, v16 & ~(v16 >> 63), 0);
  if (v16 < 0)
  {
    __break(1u);
    goto LABEL_65;
  }
  uint64_t v17 = 0;
  do
  {
    if ((v15 & 0xC000000000000001) != 0)
    {
      uint64_t v18 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      uint64_t v18 = *(void *)(v15 + 8 * v17 + 32);
      swift_retain();
    }
    swift_getKeyPath();
    uint64_t v79 = v18;
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v19 = [*(id *)(v18 + 72) identifier];
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;
    swift_release();

    uint64_t v23 = v80[0];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1000B2CE4(0, *(void *)(v23 + 16) + 1, 1);
      uint64_t v23 = v80[0];
    }
    unint64_t v25 = *(void *)(v23 + 16);
    unint64_t v24 = *(void *)(v23 + 24);
    if (v25 >= v24 >> 1)
    {
      sub_1000B2CE4(v24 > 1, v25 + 1, 1);
      uint64_t v23 = v80[0];
    }
    ++v17;
    *(void *)(v23 + 16) = v25 + 1;
    uint64_t v26 = v23 + 16 * v25;
    *(void *)(v26 + 32) = v20;
    *(void *)(v26 + 40) = v22;
  }
  while (v16 != v17);
LABEL_20:
  swift_release();
  LOBYTE(v80[0]) = 0;
  NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
  swift_bridgeObjectRelease();
  uint64_t v5 = v78;
  unint64_t v15 = *(unint64_t *)((char *)v78 + v75);
  if (v15 >> 62) {
    goto LABEL_62;
  }
  uint64_t v27 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  for (i = v5; v27; uint64_t v27 = _CocoaArrayWrapper.endIndex.getter())
  {
    id v29 = (char *)v5 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pendingDictionaryModeIdentifier;
    uint64_t v30 = 4;
    while (1)
    {
      uint64_t v31 = v30 - 4;
      if ((v15 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v32 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v33 = v30 - 3;
      if (__OFADD__(v31, 1)) {
        goto LABEL_60;
      }
LABEL_30:
      swift_getKeyPath();
      v80[0] = v32;
      sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      uint64_t v5 = (uint64_t (**)(char *, uint64_t))[*(id *)(v32 + 72) identifier];
      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v36 = v35;

      uint64_t v37 = *((void *)v29 + 1);
      if (v37)
      {
        if (v34 == *(void *)v29 && v37 == v36)
        {
          uint64_t v5 = v78;

          swift_bridgeObjectRelease();
          swift_release();
          int v71 = 1;
          goto LABEL_39;
        }
        char v39 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        swift_bridgeObjectRelease();
        if (v39)
        {
          uint64_t v5 = v78;

          int v71 = 1;
          goto LABEL_39;
        }
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
      }
      ++v30;
      if (v33 == v27)
      {
        uint64_t v5 = v78;
        goto LABEL_38;
      }
    }
    uint64_t v32 = *(void *)(v15 + 8 * v30);
    swift_retain();
    uint64_t v33 = v30 - 3;
    if (!__OFADD__(v31, 1)) {
      goto LABEL_30;
    }
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    swift_bridgeObjectRetain_n();
    uint64_t v54 = v5;
  }
LABEL_38:

  int v71 = 0;
LABEL_39:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (char *)v5 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode;
  if (!*(uint64_t (**)(char *, uint64_t))((char *)v5
                                                  + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                                                  + 8))
  {
    char v53 = 0;
    id v52 = v5;
    goto LABEL_68;
  }
  unint64_t v15 = *(unint64_t *)((char *)v5 + v75);
  if (!(v15 >> 62))
  {
    uint64_t v40 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    uint64_t v41 = v5;
    if (v40)
    {
LABEL_42:
      uint64_t v42 = 4;
      while (1)
      {
        uint64_t v43 = v42 - 4;
        if ((v15 & 0xC000000000000001) != 0)
        {
          uint64_t v44 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v45 = v42 - 3;
          if (__OFADD__(v43, 1)) {
            goto LABEL_61;
          }
        }
        else
        {
          uint64_t v44 = *(void *)(v15 + 8 * v42);
          swift_retain();
          uint64_t v45 = v42 - 3;
          if (__OFADD__(v43, 1)) {
            goto LABEL_61;
          }
        }
        swift_getKeyPath();
        v80[0] = v44;
        sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v5 = (uint64_t (**)(char *, uint64_t))[*(id *)(v44 + 72) identifier];
        uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v48 = v47;

        uint64_t v49 = *((void *)v8 + 1);
        if (v49)
        {
          if (v46 == *(void *)v8 && v49 == v48)
          {
            id v52 = v78;

            swift_bridgeObjectRelease();
            swift_release();
            char v53 = 0;
            goto LABEL_67;
          }
          char v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_release();
          swift_bridgeObjectRelease();
          if (v51)
          {
            id v52 = v78;

            char v53 = 0;
            goto LABEL_67;
          }
        }
        else
        {
          swift_release();
          swift_bridgeObjectRelease();
        }
        ++v42;
        if (v45 == v40) {
          goto LABEL_66;
        }
      }
    }
    goto LABEL_66;
  }
LABEL_65:
  swift_bridgeObjectRetain_n();
  uint64_t v55 = v5;
  uint64_t v40 = _CocoaArrayWrapper.endIndex.getter();
  if (v40) {
    goto LABEL_42;
  }
LABEL_66:
  id v52 = v78;

  char v53 = 1;
LABEL_67:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_68:
  if (qword_1002EE648 != -1) {
    swift_once();
  }
  uint64_t v56 = type metadata accessor for Logger();
  sub_100011554(v56, (uint64_t)qword_10030EAE0);
  uint64_t v57 = Logger.logObject.getter();
  os_log_type_t v58 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 134217984;
    swift_beginAccess();
    uint64_t v60 = *(void *)(NSDiffableDataSourceSnapshot.itemIdentifiers.getter() + 16);
    swift_bridgeObjectRelease();
    v80[0] = v60;
    id v52 = v78;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v57, v58, "Snapshot identifiers count: %ld", v59, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v61 = *(uint64_t (**)(char *, uint64_t))((char *)v52
                                                  + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource);
  if (!v61) {
    return v74[1](v76, v77);
  }
  uint64_t v62 = v76;
  swift_beginAccess();
  uint64_t v64 = v73;
  uint64_t v63 = v74;
  uint64_t v65 = v77;
  ((void (*)(char *, char *, uint64_t))v74[2])(v73, v62, v77);
  uint64_t v66 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v67 = swift_allocObject();
  *(void *)(v67 + 16) = v66;
  *(unsigned char *)(v67 + 24) = v72;
  *(unsigned char *)(v67 + 25) = v71;
  *(unsigned char *)(v67 + 26) = v53;
  id v68 = v61;
  swift_retain();
  dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();

  swift_release();
  uint64_t v69 = v63[1];
  v69(v64, v65);
  swift_release();
  return v69(v62, v65);
}

uint64_t sub_10021E88C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_100007620(&qword_1002F8BA0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v33 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v32 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v32 - v14;
  __chkstk_darwin(v13);
  uint64_t v34 = (char *)&v32 - v16;
  uint64_t v17 = *a1;
  uint64_t v18 = *a2;
  swift_getKeyPath();
  uint64_t v35 = v17;
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v19 = [*(id *)(v17 + 72) creationDate];
  if (v19)
  {
    uint64_t v20 = v19;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v21(v8, v15, v9);
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v22(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v21(v34, v8, v9);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v22(v8, 1, 1, v9);
  }
  static Date.now.getter();
  sub_10000B070((uint64_t)v8, &qword_1002F8BA0);
LABEL_6:
  swift_getKeyPath();
  uint64_t v35 = v18;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v23 = [*(id *)(v18 + 72) creationDate];
  if (!v23)
  {
    uint64_t v26 = (uint64_t)v33;
    v22(v33, 1, 1, v9);
    goto LABEL_10;
  }
  unint64_t v24 = v23;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v25 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v26 = (uint64_t)v33;
  v25(v33, v15, v9);
  v22((char *)v26, 0, 1, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v26, 1, v9) == 1)
  {
LABEL_10:
    uint64_t v27 = v32;
    static Date.now.getter();
    sub_10000B070(v26, &qword_1002F8BA0);
    goto LABEL_11;
  }
  uint64_t v27 = v32;
  v25(v32, (char *)v26, v9);
LABEL_11:
  uint64_t v28 = v34;
  char v29 = static Date.< infix(_:_:)();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v10 + 8);
  v30(v27, v9);
  v30(v28, v9);
  return v29 & 1;
}

void sub_10021ECE8(uint64_t a1, char a2, char a3, char a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (char *)Strong;
    if (a2)
    {
      if (a2 == 1) {
        sub_10021B910(1);
      }
      else {
        sub_10021BB54(1);
      }
    }
    uint64_t v9 = &v8[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pendingDictionaryModeIdentifier];
    uint64_t v10 = *(void *)&v8[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pendingDictionaryModeIdentifier
                       + 8];
    if (v10 && (a3 & 1) != 0)
    {
      uint64_t v11 = *(void *)v9;
      uint64_t v12 = qword_1002EE5E0;
      swift_bridgeObjectRetain();
      if (v12 != -1) {
        swift_once();
      }
      uint64_t v13 = type metadata accessor for Logger();
      sub_100011554(v13, (uint64_t)qword_10030E9A8);
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Entering dictionary mode on new translation now that the list has updated", v16, 2u);
        swift_slowDealloc();
      }

      uint64_t v17 = &v8[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
      uint64_t v18 = *(void *)&v8[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
      uint64_t v19 = *(void *)&v8[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                         + 8];
      *(void *)uint64_t v17 = v11;
      *((void *)v17 + 1) = v10;
      if (!v19 || (v11 != v18 || v10 != v19) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        sub_100218E20();
      }
      swift_bridgeObjectRelease();
      *(void *)uint64_t v9 = 0;
      *((void *)v9 + 1) = 0;

      swift_bridgeObjectRelease();
    }
    else
    {
      if ((a4 & 1) == 0) {
        goto LABEL_25;
      }
      if (qword_1002EE5E0 != -1) {
        swift_once();
      }
      uint64_t v20 = type metadata accessor for Logger();
      sub_100011554(v20, (uint64_t)qword_10030E9A8);
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v21, v22))
      {
        id v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Dismissing Dictionary Mode because the card in Dictionary Mode is no longer shown", v23, 2u);
        swift_slowDealloc();
      }

      unint64_t v24 = &v8[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
      uint64_t v25 = *(void *)&v8[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                         + 8];
      *(void *)unint64_t v24 = 0;
      *((void *)v24 + 1) = 0;
      if (v25)
      {
        sub_100218E20();

        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_25:
      }
    }
  }
}

uint64_t sub_10021EFD8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for GenderTipManager.Registration(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v47 = (uint64_t *)((char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v46 = type metadata accessor for CommittedTranslationViewModel();
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel];
  uint64_t v7 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel;
  uint64_t v49 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel;
  uint64_t v8 = *(void *)(v6 + OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_session);
  sub_1000295C0(v8 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store, (uint64_t)&v51);
  uint64_t v45 = *(void *)(v6 + OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_ttsManager);
  id v48 = a1;
  swift_retain();
  swift_retain();
  id v9 = [v2 traitCollection];
  sub_1000D1084();
  UITraitCollection.subscript.getter();

  uint64_t v10 = v50;
  uint64_t v11 = *(void **)(*(void *)&v2[v7]
                 + OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_dictionaryManager);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = v53;
  uint64_t v14 = v54;
  uint64_t v16 = sub_1000D0FE0((uint64_t)&v51, v53);
  id v17 = v11;
  swift_retain();
  swift_retain();
  uint64_t v43 = v14;
  uint64_t v18 = v2;
  *((void *)&v42 + 1) = v12;
  *(void *)&long long v42 = sub_100228EE4;
  uint64_t v19 = v11;
  uint64_t v20 = v48;
  uint64_t v21 = sub_10004893C(v48, v8, v16, v45, 0, 0, v10, v19, v42, (uint64_t)sub_100228EEC, v13, v46, v15, v43);

  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  sub_10000AB68((uint64_t)&v51);
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  unint64_t v22 = v52;
  if (v52)
  {
    uint64_t v23 = v51;
    if (v23 == dispatch thunk of PersistedTranslation.displaySourceText.getter() && v22 == v24)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
        if (qword_1002EE5E0 != -1) {
          swift_once();
        }
        uint64_t v38 = type metadata accessor for Logger();
        sub_100011554(v38, (uint64_t)qword_10030E9A8);
        swift_bridgeObjectRetain();
        char v39 = Logger.logObject.getter();
        os_log_type_t v40 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v41 = (uint8_t *)swift_slowAlloc();
          uint64_t v51 = swift_slowAlloc();
          *(_DWORD *)uint64_t v41 = 136642819;
          swift_bridgeObjectRetain();
          uint64_t v50 = sub_100202FD4(v23, v22, &v51);
          uint64_t v20 = v48;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "Compose card pending dictionary item source text does not match new translation, clearing request to go into Dictionary Mode; pending source text: %{sensitive}s",
            v41,
            0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_1002EE5E0 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_100011554(v26, (uint64_t)qword_10030E9A8);
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      char v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Compose card pending dictionary item source text matches newly added translation source text; saving the identif"
        "ier to go into Dictionary Mode when it's on screen",
        v29,
        2u);
      swift_slowDealloc();
    }

    swift_getKeyPath();
    uint64_t v51 = v21;
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v30 = [*(id *)(v21 + 72) identifier];
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v33 = v32;

    uint64_t v34 = (uint64_t *)&v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pendingDictionaryModeIdentifier];
    *uint64_t v34 = v31;
    v34[1] = v33;
    swift_bridgeObjectRelease();
LABEL_11:
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v51 = 0;
    unint64_t v52 = 0;
    swift_retain();
    static Published.subscript.setter();
  }
  id v35 = v20;
  swift_retain();
  uint64_t v36 = v47;
  sub_1000F5AFC(v35, 0, v47);
  sub_1000F6070(v36);
  sub_1000492B4((uint64_t)v36);
  swift_release();
  if (*(void *)&v18[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                     + 8])
    sub_1002210BC(v21);
  return v21;
}

void sub_10021F6B0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v15 = (void *)Strong;
    sub_10021F758(a1, a2, a3, a4, a5, a6, a7);
  }
}

void sub_10021F758(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v81 = a6;
  uint64_t v13 = type metadata accessor for DisambiguationResultModel.TextLocation();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = &v75[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, v13);
  int v17 = (*(uint64_t (**)(unsigned char *, uint64_t))(v14 + 88))(v16, v13);
  if (v17 == enum case for DisambiguationResultModel.TextLocation.source(_:)
    || v17 == enum case for DisambiguationResultModel.TextLocation.target(_:))
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    *(void *)&v75[-32] = a1;
    *(void *)&v75[-24] = a4;
    uint64_t v73 = a5;
    LOBYTE(v74) = 0;
    uint64_t v84 = a1;
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v19 = v82;
    if (!a3)
    {
      if (qword_1002EE5E0 != -1) {
        swift_once();
      }
      uint64_t v57 = type metadata accessor for Logger();
      sub_100011554(v57, (uint64_t)qword_10030E9A8);
      os_log_type_t v58 = Logger.logObject.getter();
      os_log_type_t v59 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v60 = 0;
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "Not moving popover after setting new word because there's no UITextView to get the location from", v60, 2u);
        swift_slowDealloc();
      }

      goto LABEL_48;
    }
    id v20 = a3;
    id v21 = [v19 presentedViewController];
    if (v21)
    {
      unint64_t v22 = v21;
      id v23 = [v21 popoverPresentationController];

      if (v23)
      {
        [v23 setSourceView:0];
      }
    }
    id v24 = [v19 presentedViewController];
    if (v24)
    {
      char v25 = v24;
      id v26 = [v24 popoverPresentationController];

      if (v26)
      {
        [v26 setSourceView:v20];
      }
    }
    id v27 = [v19 presentedViewController];
    if (v27)
    {
      os_log_type_t v28 = v27;
      id v29 = [v27 popoverPresentationController];

      if (v29)
      {
        [v29 setPermittedArrowDirections:3];
      }
    }
    id v30 = [v20 beginningOfDocument];
    id v31 = [v20 positionFromPosition:v30 offset:a4];
    if (v31)
    {
      uint64_t v32 = v31;
      id v33 = [v20 positionFromPosition:v31 offset:a5];
      if (v33)
      {
        uint64_t v34 = v33;
        id v35 = [v20 textRangeFromPosition:v32 toPosition:v33];
        if (v35)
        {
          id v78 = v35;
          [v20 firstRectForRange:v35];
          double v37 = v36;
          double v39 = v38;
          double v41 = v40;
          double v43 = v42;
          if (qword_1002EE5E0 != -1) {
            swift_once();
          }
          id v80 = v30;
          uint64_t v44 = type metadata accessor for Logger();
          sub_100011554(v44, (uint64_t)qword_10030E9A8);
          swift_bridgeObjectRetain_n();
          uint64_t v45 = Logger.logObject.getter();
          os_log_type_t v46 = static os_log_type_t.info.getter();
          int v47 = v46;
          uint64_t v79 = v45;
          if (os_log_type_enabled(v45, v46))
          {
            uint64_t v48 = swift_slowAlloc();
            uint64_t v77 = swift_slowAlloc();
            uint64_t v84 = v77;
            *(_DWORD *)uint64_t v48 = 136446467;
            v85.origin.x = v37;
            v85.origin.y = v39;
            v85.size.width = v41;
            v85.size.height = v43;
            uint64_t v49 = NSStringFromRect(v85);
            int v76 = v47;
            uint64_t v50 = v49;
            uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            unint64_t v53 = v52;

            uint64_t v83 = sub_100202FD4(v51, v53, &v84);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v48 + 12) = 2085;
            if (a7) {
              uint64_t v54 = v81;
            }
            else {
              uint64_t v54 = 0x3E6C696E3CLL;
            }
            if (a7) {
              unint64_t v55 = a7;
            }
            else {
              unint64_t v55 = 0xE500000000000000;
            }
            swift_bridgeObjectRetain();
            uint64_t v83 = sub_100202FD4(v54, v55, &v84);
            uint64_t v19 = v82;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            uint64_t v56 = v79;
            _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v76, "Setting popover rect to %{public}s for word %{sensitive}s", (uint8_t *)v48, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          id v71 = [v19 presentedViewController];
          id v72 = [v71 popoverPresentationController];

          [v72 setSourceRect:v37, v39, v41, v43];
          goto LABEL_47;
        }
      }
      else
      {
        uint64_t v34 = v32;
      }
    }
    if (qword_1002EE5E0 != -1) {
      swift_once();
    }
    uint64_t v61 = type metadata accessor for Logger();
    sub_100011554(v61, (uint64_t)qword_10030E9A8);
    swift_bridgeObjectRetain_n();
    uint64_t v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = swift_slowAlloc();
      id v80 = v30;
      uint64_t v65 = v64;
      uint64_t v84 = swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 136446467;
      uint64_t v66 = _NSRange.description.getter();
      uint64_t v83 = sub_100202FD4(v66, v67, &v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2085;
      if (a7) {
        uint64_t v68 = v81;
      }
      else {
        uint64_t v68 = 0x3E6C696E3CLL;
      }
      if (a7) {
        unint64_t v69 = a7;
      }
      else {
        unint64_t v69 = 0xE500000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v70 = v68;
      uint64_t v19 = v82;
      uint64_t v83 = sub_100202FD4(v70, v69, &v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Failed to lookup range %{public}s in text view; word: %{sensitive}s",
        (uint8_t *)v65,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_48;
    }

    swift_bridgeObjectRelease_n();
LABEL_47:

LABEL_48:
    sub_100223E30(v81, a7, (uint64_t)v19);
    return;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100220168(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_1002201D8(a1, a2 & 1);
  }
}

void sub_1002201D8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DisambiguationResultModel.TextLocation();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v115 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    id v30 = &v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
    uint64_t v31 = *(void *)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                       + 8];
    *id v30 = 0;
    v30[1] = 0;
    if (!v31) {
      return;
    }
    sub_100218E20();
    goto LABEL_19;
  }
  uint64_t v121 = v7;
  swift_getKeyPath();
  uint64_t v124 = a1;
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v13 = *(void **)(a1 + 88);
  if (!v13)
  {
    if (qword_1002EE5E0 != -1) {
      swift_once();
    }
    uint64_t v32 = type metadata accessor for Logger();
    sub_100011554(v32, (uint64_t)qword_10030E9A8);
    id v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v34))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Can't find resultModel so unable to present dictionary", v35, 2u);
      swift_slowDealloc();
    }

    double v36 = &v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
    uint64_t v37 = *(void *)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                       + 8];
    *double v36 = 0;
    v36[1] = 0;
    if (!v37) {
      return;
    }
    sub_100218E20();
LABEL_19:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v119 = v6;
  type metadata accessor for DictionaryViewController();
  id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v15 = v13;
  id v16 = [v14 init];
  uint64_t v17 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController;
  uint64_t v18 = *(void **)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController];
  *(void *)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController] = v16;

  uint64_t v19 = *(void **)&v3[v17];
  if (!v19)
  {
    if (qword_1002EE5E0 != -1) {
      swift_once();
    }
    uint64_t v38 = type metadata accessor for Logger();
    sub_100011554(v38, (uint64_t)qword_10030E9A8);
    double v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      double v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to create DictionaryViewController; exiting dictionary mode",
        v41,
        2u);
      swift_slowDealloc();
    }

    double v42 = &v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
    uint64_t v43 = *(void *)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                       + 8];
    *double v42 = 0;
    v42[1] = 0;
    if (!v43)
    {

      return;
    }
    sub_100218E20();

    goto LABEL_19;
  }
  id v20 = self;
  uint64_t v122 = v19;
  id v21 = [v20 sharedApplication];
  [v21 sendAction:"resignFirstResponder" to:0 from:v3 forEvent:0];

  swift_getKeyPath();
  uint64_t v124 = a1;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v22 = [*(id *)(a1 + 72) identifier];
  id v23 = v3;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v26 = v25;

  uint64_t v123 = v23;
  id v27 = (uint64_t *)&v23[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
  uint64_t v28 = *(void *)&v23[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
  uint64_t v29 = *(void *)&v23[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                      + 8];
  *id v27 = v24;
  v27[1] = v26;
  uint64_t v115 = v27;
  id v120 = v15;
  if (v26)
  {
    if (v29 && (v24 == v28 && v29 == v26 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)) {
      goto LABEL_27;
    }
  }
  else if (!v29)
  {
    goto LABEL_28;
  }
  sub_100218E20();
LABEL_27:
  swift_bridgeObjectRelease();
LABEL_28:
  swift_getKeyPath();
  uint64_t v124 = a1;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v44 = *(id *)(a1 + 72);
  dispatch thunk of PersistedTranslation.sourceLocale.getter();
  uint64_t v45 = type metadata accessor for Locale();
  os_log_type_t v46 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56);
  v46(v12, 0, 1, v45);
  int v47 = &v122[OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_sourceLocale];
  uint64_t v48 = v122;
  swift_beginAccess();
  sub_1002018D4((uint64_t)v12, (uint64_t)v47);
  swift_endAccess();
  id v116 = v44;
  dispatch thunk of PersistedTranslation.targetLocale.getter();
  v46(v12, 0, 1, v45);
  uint64_t v49 = (uint64_t)&v48[OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_targetLocale];
  swift_beginAccess();
  sub_1002018D4((uint64_t)v12, v49);
  swift_endAccess();
  *(void *)&v48[OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_delegate + 8] = &off_1002D34B8;
  swift_unknownObjectWeakAssign();
  unsigned int v118 = enum case for DisambiguationResultModel.TextLocation.target(_:);
  uint64_t v50 = v121;
  uint64_t v117 = *(void (**)(char *))(v121 + 104);
  uint64_t v51 = v119;
  v117(v9);
  uint64_t v52 = dispatch thunk of DisambiguationResultModel.rangeOfFirstWordForDictionary(inLocation:)();
  uint64_t v54 = v53;
  uint64_t v121 = *(void *)(v50 + 8);
  ((void (*)(char *, uint64_t))v121)(v9, v51);
  unint64_t v55 = (void *)dispatch thunk of DisambiguationResultModel.targetAttributedText.getter();
  id v56 = [v55 attributedSubstringFromRange:v52, v54];

  id v57 = [v56 string];
  uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v60 = v59;

  ((void (*)(char *, void, uint64_t))v117)(v9, v118, v51);
  uint64_t v61 = v58;
  uint64_t v62 = v123;
  sub_10021F758(a1, (uint64_t)v9, 0, v52, v54, v61, v60);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v121)(v9, v51);
  id v63 = objc_allocWithZone((Class)UINavigationController);
  id v64 = [v63 initWithRootViewController:v122];
  [v64 setModalPresentationStyle:7];
  id v65 = [v64 presentationController];
  if (v65)
  {
    uint64_t v66 = v65;
    [v65 setDelegate:v62];
  }
  uint64_t v67 = sub_100223F6C(a1);
  if (!v67)
  {
    if (qword_1002EE5E0 != -1) {
      swift_once();
    }
    uint64_t v109 = type metadata accessor for Logger();
    sub_100011554(v109, (uint64_t)qword_10030E9A8);
    uint64_t v110 = Logger.logObject.getter();
    os_log_type_t v111 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v110, v111))
    {
      uint64_t v112 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v112 = 0;
      _os_log_impl((void *)&_mh_execute_header, v110, v111, "Failed to find cell for viewModel that will get Dictionary Mode, so can't display popover", v112, 2u);
      swift_slowDealloc();
    }

    uint64_t v113 = v115;
    uint64_t v114 = v115[1];
    uint64_t *v115 = 0;
    v113[1] = 0;
    if (v114)
    {
      sub_100218E20();

      swift_bridgeObjectRelease();
    }
    else
    {
    }
    return;
  }
  uint64_t v68 = (void *)v67;
  unint64_t v69 = (double *)&v62[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryHighlightRect];
  if ((v62[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryHighlightRect + 32] & 1) != 0
    || (uint64_t v70 = *(void **)&v62[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryTextView]) == 0)
  {
    if (qword_1002EE5E0 != -1) {
      swift_once();
    }
    uint64_t v81 = type metadata accessor for Logger();
    sub_100011554(v81, (uint64_t)qword_10030E9A8);
    uint64_t v82 = Logger.logObject.getter();
    os_log_type_t v83 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v84 = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "Presenting dictionary but don't yet have source rect or text view; presenting from the bottom middle of the card"
        ", and it should reposition soon when the source rect comes in",
        v84,
        2u);
      uint64_t v62 = v123;
      swift_slowDealloc();
    }

    id v75 = [v68 contentView];
    [v75 frame];
    CGFloat x = v126.origin.x;
    CGFloat y = v126.origin.y;
    CGFloat width = v126.size.width;
    CGFloat height = v126.size.height;
    double MidX = CGRectGetMidX(v126);
    v127.origin.CGFloat x = x;
    v127.origin.CGFloat y = y;
    v127.size.CGFloat width = width;
    v127.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v127);
    double v91 = CGSizeZero.height;
    id v92 = [v64 popoverPresentationController];
    if (v92)
    {
      uint64_t v93 = v92;
      [v92 setSourceView:v75];
    }
    id v94 = [v64 popoverPresentationController:v115];
    [v94 setSourceRect:MidX, MaxY, CGSizeZero.width, v91];

    id v95 = [v64 popoverPresentationController];
    if (!v95) {
      goto LABEL_46;
    }
    id v80 = v95;
    [v95 setPermittedArrowDirections:1];
  }
  else
  {
    double v72 = v69[2];
    double v71 = v69[3];
    double v74 = *v69;
    double v73 = v69[1];
    id v75 = v70;
    id v76 = [v64 popoverPresentationController];
    if (v76)
    {
      uint64_t v77 = v76;
      [v76 setSourceView:v75];
    }
    id v78 = [v64 popoverPresentationController:v115];
    [v78 setSourceRect:v74, v73, v72, v71];

    id v79 = [v64 popoverPresentationController];
    if (!v79) {
      goto LABEL_46;
    }
    id v80 = v79;
    [v79 setPermittedArrowDirections:3];
  }

LABEL_46:
  id v96 = [v64 popoverPresentationController];
  if (v96)
  {
    uint64_t v97 = v96;
    sub_100007620((uint64_t *)&unk_1002F0270);
    uint64_t v98 = swift_allocObject();
    *(_OWORD *)(v98 + 16) = xmmword_10024CE10;
    uint64_t v99 = *(void **)&v62[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView];
    if (!v99)
    {
      __break(1u);
      return;
    }
    *(void *)(v98 + 32) = v99;
    uint64_t v124 = v98;
    specialized Array._endMutation()();
    sub_10000B0CC(0, (unint64_t *)&unk_1002F4120);
    id v100 = v99;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v97 setPassthroughViews:isa];

    uint64_t v62 = v123;
  }
  id v102 = [v64 popoverPresentationController];
  if (v102)
  {
    uint64_t v103 = v102;
    id v104 = [v102 adaptiveSheetPresentationController];

    if (v104)
    {
      [v104 setDelegate:v62];
      [v104 _setShouldDismissWhenTappedOutside:0];
      sub_100007620((uint64_t *)&unk_1002F0270);
      uint64_t v105 = swift_allocObject();
      *(_OWORD *)(v105 + 16) = xmmword_100249BA0;
      uint64_t v106 = self;
      *(void *)(v105 + 32) = [v106 mediumDetent];
      uint64_t v107 = v106;
      uint64_t v62 = v123;
      *(void *)(v105 + 40) = [v107 largeDetent];
      uint64_t v124 = v105;
      specialized Array._endMutation()();
      sub_10000B0CC(0, &qword_1002FCA10);
      Class v108 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v104 setDetents:v108];

      [v104 setLargestUndimmedDetentIdentifier:UISheetPresentationControllerDetentIdentifierMedium];
      [v104 setPrefersGrabberVisible:1];
    }
  }
  [v62 presentViewController:v64 animated:1 completion:0];
}

uint64_t sub_1002210BC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1
                 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                 + 8);
  if (v3)
  {
    uint64_t v4 = *(void *)(v1
                   + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode);
    swift_getKeyPath();
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    swift_bridgeObjectRetain_n();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v5 = [*(id *)(a1 + 72) identifier];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    if (v4 != v6 || v3 != v8) {
      _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v11 = swift_getKeyPath();
  __chkstk_darwin(v11);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  return swift_release();
}

void sub_10022134C()
{
  uint64_t v1 = v0;
  id v2 = [v0 viewIfLoaded];
  id v3 = [v2 window];

  if (!v3) {
    return;
  }
  Notification.object.getter();
  if (!v147)
  {
    p_uint64_t aBlock = &aBlock;
LABEL_8:
    sub_10000B070((uint64_t)p_aBlock, (uint64_t *)&unk_1002F02C0);
    return;
  }
  sub_10000B0CC(0, &qword_1002FC9E8);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  uint64_t v4 = (void *)v155;
  id v5 = [v1 view];
  if (!v5)
  {
    __break(1u);
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  uint64_t v6 = v5;
  id v7 = [v5 window];

  if (v7)
  {
    id v8 = [v7 screen];

    uint64_t aBlock = (uint64_t)v8;
    uint64_t v9 = _bridgeAnythingToObjectiveC<A>(_:)();
  }
  else
  {
    uint64_t v9 = 0;
  }
  unsigned int v11 = [(id)v155 isEqual:v9];
  swift_unknownObjectRelease();
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v12 = Notification.userInfo.getter();
  if (!v12) {
    goto LABEL_20;
  }
  uint64_t v13 = v12;
  *(double *)&uint64_t v151 = COERCE_DOUBLE(static String._unconditionallyBridgeFromObjectiveC(_:)());
  double v152 = v14;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v13 + 16) && (unint64_t v15 = sub_10020384C((uint64_t)&aBlock), (v16 & 1) != 0))
  {
    sub_10000B170(*(void *)(v13 + 56) + 32 * v15, (uint64_t)&v155);
  }
  else
  {
    long long v155 = 0u;
    long long v156 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10006E7AC((uint64_t)&aBlock);
  if (!*((void *)&v156 + 1))
  {

    p_uint64_t aBlock = (uint64_t *)&v155;
    goto LABEL_8;
  }
  type metadata accessor for CGRect(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_20:

    return;
  }
  double v17 = *(double *)&v151;
  double v18 = v152;
  double v19 = v153;
  double v20 = v154;
  id v21 = [v1 view];
  if (!v21) {
    goto LABEL_95;
  }
  id v22 = v21;
  id v23 = [v21 keyboardLayoutGuide];

  [v23 layoutFrame];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  uint64_t v32 = (CGFloat *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_lastKnownKeyboardFrame];
  v162.origin.CGFloat x = v25;
  v162.origin.CGFloat y = v27;
  v162.size.CGFloat width = v29;
  v162.size.CGFloat height = v31;
  if (CGRectEqualToRect(*(CGRect *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_lastKnownKeyboardFrame], v162))
  {
    goto LABEL_20;
  }
  *uint64_t v32 = v25;
  v32[1] = v27;
  v32[2] = v29;
  v32[3] = v31;
  uint64_t v33 = Notification.userInfo.getter();
  if (!v33)
  {
    long long v155 = 0u;
    long long v156 = 0u;
LABEL_32:
    sub_10000B070((uint64_t)&v155, (uint64_t *)&unk_1002F02C0);
    goto LABEL_33;
  }
  uint64_t v34 = v33;
  *(double *)&uint64_t v151 = COERCE_DOUBLE(static String._unconditionallyBridgeFromObjectiveC(_:)());
  double v152 = v35;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v34 + 16) && (unint64_t v36 = sub_10020384C((uint64_t)&aBlock), (v37 & 1) != 0))
  {
    sub_10000B170(*(void *)(v34 + 56) + 32 * v36, (uint64_t)&v155);
  }
  else
  {
    long long v155 = 0u;
    long long v156 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10006E7AC((uint64_t)&aBlock);
  if (!*((void *)&v156 + 1)) {
    goto LABEL_32;
  }
  sub_10000B0CC(0, (unint64_t *)&qword_1002F3430);
  if (swift_dynamicCast())
  {
    id v38 = (id)aBlock;
    [(id)aBlock doubleValue];
    double v140 = v39;

    goto LABEL_34;
  }
LABEL_33:
  double v140 = 0.0;
LABEL_34:
  uint64_t v40 = Notification.userInfo.getter();
  if (!v40)
  {
    long long v155 = 0u;
    long long v156 = 0u;
LABEL_43:
    sub_10000B070((uint64_t)&v155, (uint64_t *)&unk_1002F02C0);
    goto LABEL_44;
  }
  uint64_t v41 = v40;
  *(double *)&uint64_t v151 = COERCE_DOUBLE(static String._unconditionallyBridgeFromObjectiveC(_:)());
  double v152 = v42;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v41 + 16) && (unint64_t v43 = sub_10020384C((uint64_t)&aBlock), (v44 & 1) != 0))
  {
    sub_10000B170(*(void *)(v41 + 56) + 32 * v43, (uint64_t)&v155);
  }
  else
  {
    long long v155 = 0u;
    long long v156 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10006E7AC((uint64_t)&aBlock);
  if (!*((void *)&v156 + 1)) {
    goto LABEL_43;
  }
  sub_10000B0CC(0, (unint64_t *)&qword_1002F3430);
  if (swift_dynamicCast())
  {
    id v45 = (id)aBlock;
    id v46 = [(id)aBlock unsignedIntegerValue];

    goto LABEL_45;
  }
LABEL_44:
  id v46 = 0;
LABEL_45:
  id v47 = [v4 coordinateSpace];
  uint64_t v48 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView;
  uint64_t v49 = *(void **)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView];
  if (!v49)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  uint64_t v50 = v47;
  id v51 = v49;
  [v50 convertRect:v51 toCoordinateSpace:v17, v18, v19, v20];
  id v56 = *(void **)&v1[v48];
  if (!v56)
  {
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  CGFloat v57 = v52;
  CGFloat v58 = v53;
  CGFloat v59 = v54;
  CGFloat v60 = v55;
  [v56 bounds];
  v163.origin.CGFloat x = v57;
  v163.origin.CGFloat y = v58;
  v163.size.CGFloat width = v59;
  v163.size.CGFloat height = v60;
  CGRect v158 = CGRectIntersection(v157, v163);
  CGFloat x = v158.origin.x;
  CGFloat height = v158.size.height;
  CGFloat y = v158.origin.y;
  CGFloat width = v158.size.width;
  IsEmptCGFloat y = CGRectIsEmpty(v158);
  id v63 = [v1 parentViewController];
  id v137 = v51;
  if (v63
    && (id v64 = v63,
        id v65 = objc_msgSend(v63, "navigationController", v51, v50),
        v64,
        v65))
  {
    id v66 = [v65 navigationBar];

    char v67 = sub_10023A7E0();
  }
  else
  {
    char v67 = 0;
  }
  id v68 = [v1 parentViewController:v137];
  double v69 = 0.0;
  if (v68)
  {
    uint64_t v70 = v68;
    id v71 = [v68 navigationController];

    if (v71)
    {
      id v72 = [v71 navigationBar];

      sub_10023A9E4();
      double v69 = v73;
    }
  }
  if (qword_1002EE648 != -1) {
    swift_once();
  }
  uint64_t v74 = type metadata accessor for Logger();
  sub_100011554(v74, (uint64_t)qword_10030EAE0);
  id v75 = Logger.logObject.getter();
  os_log_type_t v76 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v75, v76))
  {
    uint64_t v77 = swift_slowAlloc();
    *(_DWORD *)uint64_t v77 = 67109376;
    LODWORD(aBlock) = v67 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v77 + 8) = 2048;
    uint64_t aBlock = *(void *)&v69;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v75, v76, "Nav title is large? : %{BOOL}d with height: %f", (uint8_t *)v77, 0x12u);
    swift_slowDealloc();
  }

  unsigned __int8 v78 = sub_1002225CC();
  v159.origin.CGFloat x = v25;
  v159.origin.CGFloat y = v27;
  v159.size.CGFloat width = v29;
  v159.size.CGFloat height = v31;
  double v79 = CGRectGetHeight(v159);
  CGFloat v80 = x;
  v160.origin.CGFloat x = x;
  v160.origin.CGFloat y = y;
  v160.size.CGFloat width = width;
  v160.size.CGFloat height = height;
  double v81 = CGRectGetHeight(v160);
  if (v79 > v81) {
    double v82 = v79;
  }
  else {
    double v82 = v81;
  }
  id v83 = [v1 view];
  if (!v83) {
    goto LABEL_98;
  }
  uint64_t v84 = v83;
  [v83 bounds];
  CGFloat v86 = v85;
  CGFloat v88 = v87;
  CGFloat v90 = v89;
  CGFloat v92 = v91;

  v161.origin.CGFloat x = v86;
  v161.origin.CGFloat y = v88;
  v161.size.CGFloat width = v90;
  v161.size.CGFloat height = v92;
  double v93 = CGRectGetHeight(v161);
  id v94 = [v1 view];
  if (!v94)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  id v95 = v94;
  [v94 safeAreaInsets];
  double v97 = v96;

  id v98 = [v1 view];
  if (!v98)
  {
LABEL_100:
    __break(1u);
    return;
  }
  uint64_t v99 = v98;
  double v100 = v93 - v97;
  [v98 safeAreaInsets];
  double v102 = v101;

  double v150 = v100 - v102 - v82;
  uint64_t v103 = Logger.logObject.getter();
  os_log_type_t v104 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v103, v104))
  {
    uint64_t v105 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v105 = 134217984;
    swift_beginAccess();
    uint64_t aBlock = *(void *)&v150;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v103, v104, "Initial available height: %f", v105, 0xCu);
    swift_slowDealloc();
  }

  if (v67)
  {
    swift_beginAccess();
    double v150 = v69 + v150;
    uint64_t v106 = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v106, v107))
    {
      uint64_t v108 = swift_slowAlloc();
      *(_DWORD *)uint64_t v108 = 134218240;
      uint64_t aBlock = *(void *)&v69;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v108 + 12) = 2048;
      uint64_t aBlock = *(void *)&v150;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v106, v107, "Accounting for large title (+%f): %f", (uint8_t *)v108, 0x16u);
      swift_slowDealloc();
    }
  }
  unint64_t v109 = *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore];
  if (v109 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v136 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v136) {
      goto LABEL_72;
    }
  }
  else if (*(void *)((v109 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_72:
    swift_beginAccess();
    double v110 = v150 + -36.0;
    double v150 = v150 + -36.0;
    os_log_type_t v111 = Logger.logObject.getter();
    os_log_type_t v112 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v113 = swift_slowAlloc();
      *(_DWORD *)uint64_t v113 = 134218240;
      uint64_t aBlock = 0x4042000000000000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v113 + 12) = 2048;
      uint64_t aBlock = *(void *)&v110;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v111, v112, "Subtracting to show hint of prior cards (-%f): %f", (uint8_t *)v113, 0x16u);
      swift_slowDealloc();
    }
  }
  id v114 = [v1 parentViewController];
  if (v114)
  {
    uint64_t v115 = v114;
    id v116 = [v114 navigationItem];

    if (v78) {
      uint64_t v117 = 2;
    }
    else {
      uint64_t v117 = 0;
    }
    [v116 setLargeTitleDisplayMode:v117];
  }
  if (v78)
  {
    swift_beginAccess();
    double v118 = v150 + 8.0;
    BOOL v119 = IsEmpty;
  }
  else
  {
    BOOL v119 = IsEmpty;
    if (qword_1002EE580 != -1) {
      swift_once();
    }
    double v118 = *(double *)&qword_10030E700;
  }
  uint64_t v139 = ((void)v46 << 16) | 2;
  uint64_t v120 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel;
  BOOL v121 = !v119;
  uint64_t v122 = *(double **)(*(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_translationViewModel]
                    + OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_cardMetrics);
  swift_getKeyPath();
  uint64_t aBlock = (uint64_t)v122;
  sub_100228DF0((unint64_t *)&unk_1002FC9F0, (void (*)(uint64_t))type metadata accessor for CardMetrics);
  swift_retain();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  double v123 = v122[2];
  swift_release();
  if (v123 != v118)
  {
    uint64_t v124 = Logger.logObject.getter();
    os_log_type_t v125 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v124, v125))
    {
      CGRect v126 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)CGRect v126 = 134217984;
      uint64_t aBlock = *(void *)&v118;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v124, v125, "Setting height: %f", v126, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v127 = *(void *)(*(void *)&v1[v120]
                     + OBJC_IVAR____TtC17SequoiaTranslator27ComposeTranslationViewModel_cardMetrics);
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    uint64_t aBlock = v127;
    swift_retain();
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    swift_release();
    BOOL v119 = IsEmpty;
  }
  if (!v119) {
    v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pinComposeCardToKeyboard] = 1;
  }
  uint64_t v129 = self;
  uint64_t v130 = swift_allocObject();
  *(void *)(v130 + 16) = v1;
  *(unsigned char *)(v130 + 24) = v121;
  *(CGFloat *)(v130 + 32) = v80;
  *(CGFloat *)(v130 + 40) = y;
  *(CGFloat *)(v130 + 48) = width;
  *(CGFloat *)(v130 + 56) = height;
  uint64_t v148 = sub_100228E90;
  uint64_t v149 = v130;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v145 = 1107296256;
  uint64_t v146 = sub_10008BA1C;
  uint64_t v147 = &unk_1002D3748;
  uint64_t v131 = _Block_copy(&aBlock);
  uint64_t v132 = v1;
  swift_release();
  uint64_t v133 = swift_allocObject();
  *(void *)(v133 + 16) = v132;
  uint64_t v148 = sub_100228EDC;
  uint64_t v149 = v133;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v145 = 1107296256;
  uint64_t v146 = sub_100218350;
  uint64_t v147 = &unk_1002D3798;
  uint64_t v134 = _Block_copy(&aBlock);
  uint64_t v135 = v132;
  swift_release();
  [v129 animateWithDuration:v139 delay:v131 options:v134 animations:v140 completion:0.0];
  _Block_release(v134);
  _Block_release(v131);

  swift_unknownObjectRelease();
}

void *sub_10022240C(uint64_t a1, char a2, double a3, double a4, double a5, double a6)
{
  uint64_t v7 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView;
  uint64_t result = *(void **)(a1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
  if (result)
  {
    [result safeAreaInsets];
    if ((a2 & 1) == 0)
    {
      sub_100222D94(0, 0);
      return (void *)sub_10021B910(0);
    }
    uint64_t result = *(void **)(a1 + v7);
    if (result)
    {
      [result safeAreaInsets];
      sub_100222734(0, 0, a6 - v11);
      return (void *)sub_10021B910(0);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1002224A4(uint64_t a1, uint64_t a2)
{
  if (qword_1002EE648 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100011554(v3, (uint64_t)qword_10030EAE0);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "<<<<< End animation with %{BOOL}d", v6, 8u);
    swift_slowDealloc();
  }

  *(unsigned char *)(a2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pinComposeCardToKeyboard) = 0;
}

id sub_1002225CC()
{
  uint64_t v1 = v0;
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = result;
  id v4 = [result keyboardLayoutGuide];

  id result = [v1 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  os_log_type_t v5 = result;
  sub_10000B0CC(0, &qword_1002FC9E0);
  UIPopoverPresentationControllerSourceItem.frame(in:)();

  sub_1000CD4BC((uint64_t)&v19, (uint64_t)v20);
  if (v21) {
    return 0;
  }
  CGFloat v6 = *(double *)v20;
  CGFloat v7 = *(double *)&v20[1];
  CGFloat v8 = *(double *)&v20[2];
  CGFloat v9 = *(double *)&v20[3];
  id result = [v1 view];
  if (result)
  {
    uint64_t v10 = result;
    [result bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v22.origin.CGFloat x = v12;
    v22.origin.CGFloat y = v14;
    v22.size.CGFloat width = v16;
    v22.size.CGFloat height = v18;
    v23.origin.CGFloat x = v6;
    v23.origin.CGFloat y = v7;
    v23.size.CGFloat width = v8;
    v23.size.CGFloat height = v9;
    return (id)CGRectIntersectsRect(v22, v23);
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_100222734(unsigned __int8 a1, char a2, double a3)
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    CGFloat v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_bottomInsetReasonToHeightMap);
    swift_beginAccess();
    uint64_t v8 = *v7;
    if (*(void *)(*v7 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v9 = sub_100203940(a1);
      if (v10)
      {
        double v11 = *(double *)(*(void *)(v8 + 56) + 8 * v9);
        swift_bridgeObjectRelease();
        if (v11 == a3)
        {
          if (qword_1002EE648 != -1) {
            swift_once();
          }
          uint64_t v12 = type metadata accessor for Logger();
          sub_100011554(v12, (uint64_t)qword_10030EAE0);
          double v13 = Logger.logObject.getter();
          os_log_type_t v14 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = swift_slowAlloc();
            v37[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v15 = 136446466;
            if (a1)
            {
              if (a1 == 1) {
                uint64_t v16 = 0x616E6F6974636964;
              }
              else {
                uint64_t v16 = 0x6F68706F7263696DLL;
              }
              if (a1 == 1) {
                unint64_t v17 = 0xEA00000000007972;
              }
              else {
                unint64_t v17 = 0xEA0000000000656ELL;
              }
            }
            else
            {
              uint64_t v16 = 0x6472616F6279656BLL;
              unint64_t v17 = 0xE800000000000000;
            }
            sub_100202FD4(v16, v17, v37);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v15 + 12) = 2050;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl((void *)&_mh_execute_header, v13, v14, "Not changing bottom inset for reason %{public}s because the height %{public}f is already being used", (uint8_t *)v15, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }

          return;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    if (qword_1002EE648 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100011554(v19, (uint64_t)qword_10030EAE0);
    double v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      v37[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446466;
      if (a1)
      {
        if (a1 == 1) {
          uint64_t v23 = 0x616E6F6974636964;
        }
        else {
          uint64_t v23 = 0x6F68706F7263696DLL;
        }
        if (a1 == 1) {
          unint64_t v24 = 0xEA00000000007972;
        }
        else {
          unint64_t v24 = 0xEA0000000000656ELL;
        }
      }
      else
      {
        uint64_t v23 = 0x6472616F6279656BLL;
        unint64_t v24 = 0xE800000000000000;
      }
      sub_100202FD4(v23, v24, v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2050;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Adding bottom inset reason to %{public}s with height %{public}f", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v36 = *v7;
    *CGFloat v7 = 0x8000000000000000;
    sub_1002062B4(a1, isUniquelyReferenced_nonNull_native, a3);
    *CGFloat v7 = v36;
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v26 = swift_bridgeObjectRetain();
    double v27 = COERCE_DOUBLE(sub_100223178(v26));
    char v29 = v28;
    swift_bridgeObjectRelease();
    if (v29) {
      double v30 = 0.0;
    }
    else {
      double v30 = v27;
    }
    CGFloat v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 134349056;
      *(double *)char v37 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Setting bottom inset to %{public}f", v33, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v34;
    *(double *)(v35 + 24) = v30;
    if (a2)
    {
      sub_10000B0CC(0, (unint64_t *)&unk_1002F4120);
      static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)();
    }
    else
    {
      swift_retain();
      sub_100223374();
      swift_release();
    }
    swift_release();
  }
  else
  {
    char v18 = a2 & 1;
    sub_100222D94(a1, v18);
  }
}

uint64_t sub_100222D94(unsigned __int8 a1, char a2)
{
  uint64_t v3 = v2;
  if (qword_1002EE648 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100011554(v6, (uint64_t)qword_10030EAE0);
  CGFloat v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v9 = 136446210;
    if (a1)
    {
      if (a1 == 1) {
        uint64_t v10 = 0x616E6F6974636964;
      }
      else {
        uint64_t v10 = 0x6F68706F7263696DLL;
      }
      if (a1 == 1) {
        unint64_t v11 = 0xEA00000000007972;
      }
      else {
        unint64_t v11 = 0xEA0000000000656ELL;
      }
    }
    else
    {
      unint64_t v11 = 0xE800000000000000;
      uint64_t v10 = 0x6472616F6279656BLL;
    }
    sub_100202FD4(v10, v11, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Removing bottom inset reason %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v12 = v3 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_bottomInsetReasonToHeightMap;
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)v12 + 16))
  {
    swift_bridgeObjectRetain();
    sub_100203940(a1);
    char v15 = v14;
    uint64_t result = swift_bridgeObjectRelease();
    if (v15)
    {
      swift_beginAccess();
      sub_1002271E4(a1);
      swift_endAccess();
      uint64_t v16 = swift_bridgeObjectRetain();
      double v17 = COERCE_DOUBLE(sub_100223178(v16));
      char v19 = v18;
      swift_bridgeObjectRelease();
      if (v19) {
        double v20 = 0.0;
      }
      else {
        double v20 = v17;
      }
      os_log_type_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 134349056;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Setting bottom inset to %{public}f", v23, 0xCu);
        swift_slowDealloc();
      }

      uint64_t v24 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v24;
      *(double *)(v25 + 24) = v20;
      if (a2)
      {
        sub_10000B0CC(0, (unint64_t *)&unk_1002F4120);
        static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)();
      }
      else
      {
        swift_retain();
        sub_100223374();
        swift_release();
      }
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_100223178(uint64_t a1)
{
  uint64_t v1 = a1 + 64;
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v3 = 1 << v2;
  uint64_t v4 = -1;
  if (1 << v2 < 64) {
    uint64_t v4 = ~(-1 << (1 << v2));
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = __clz(__rbit64(v5));
    unint64_t v8 = (v5 - 1) & v5;
    int64_t v9 = (unint64_t)(v3 + 63) >> 6;
  }
  else
  {
    LODWORD(v6) = v2 & 0x3F;
    if (v6 <= 6) {
      return 0;
    }
    int64_t v9 = (unint64_t)(v3 + 63) >> 6;
    unint64_t v18 = *(void *)(a1 + 72);
    if (v18)
    {
      uint64_t v6 = 1;
    }
    else
    {
      if (v6 < 8) {
        return 0;
      }
      unint64_t v18 = *(void *)(a1 + 80);
      if (v18)
      {
        uint64_t v6 = 2;
      }
      else
      {
        unint64_t v18 = *(void *)(a1 + 88);
        if (v18)
        {
          uint64_t v6 = 3;
        }
        else
        {
LABEL_37:
          if (v6 < 9) {
            return 0;
          }
          unint64_t v18 = *(void *)(a1 + 96);
          if (v18)
          {
            uint64_t v6 = 4;
          }
          else
          {
            unint64_t v18 = *(void *)(a1 + 104);
            if (!v18) {
              goto LABEL_43;
            }
            uint64_t v6 = 5;
          }
        }
      }
    }
LABEL_30:
    unint64_t v8 = (v18 - 1) & v18;
    unint64_t v7 = __clz(__rbit64(v18)) + (v6 << 6);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  double v11 = *(double *)(v10 + 8 * v7);
  while (v8)
  {
    unint64_t v12 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_7:
    if (v11 < *(double *)(v10 + 8 * v13)) {
      double v11 = *(double *)(v10 + 8 * v13);
    }
  }
  int64_t v14 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v14 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v14);
  ++v6;
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 1;
  if (v14 + 1 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 2;
  if (v14 + 2 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 3;
  if (v14 + 3 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15)
  {
LABEL_25:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_7;
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v16);
  if (v15)
  {
    uint64_t v6 = v16;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v9) {
      return *(void *)&v11;
    }
    unint64_t v15 = *(void *)(v1 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_43:
  uint64_t v19 = 0;
  uint64_t v20 = 6;
  if (v9 > 6) {
    uint64_t v20 = v9;
  }
  uint64_t v21 = v20 - 6;
  while (v21 != v19)
  {
    unint64_t v18 = *(void *)(a1 + 112 + 8 * v19++);
    if (v18)
    {
      uint64_t v6 = v19 + 5;
      goto LABEL_30;
    }
  }
  return 0;
}

void sub_100223374()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    char v2 = *(void **)(Strong + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
    id v3 = v2;

    if (!v2)
    {
      __break(1u);
      goto LABEL_9;
    }
    [v3 contentInset];
    [v3 setContentInset:];
  }
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectWeakLoadStrong();
  if (!v4) {
    return;
  }
  unint64_t v5 = (void *)v4;
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
  id v7 = v6;

  if (!v6)
  {
LABEL_9:
    __break(1u);
    return;
  }
  [v7 verticalScrollIndicatorInsets];
  [v7 setVerticalScrollIndicatorInsets:];
}

id sub_10022348C(uint64_t a1)
{
  if (*(void *)(v1
                 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                 + 8))
    return 0;
  unint64_t v4 = *(void *)(v1
                 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode);
  id v5 = [self mainBundle];
  v20._object = (void *)0x800000010025E480;
  v6._countAndFlagsBits = 0x4554454C4544;
  v6._object = (void *)0xE600000000000000;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v20._countAndFlagsBits = 0xD000000000000013;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)v4, (NSBundle)v5, v7, v20);

  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  swift_retain();
  swift_retain();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_100228D4C;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10021827C;
  aBlock[3] = &unk_1002D3680;
  double v11 = _Block_copy(aBlock);
  id v12 = [self contextualActionWithStyle:1 title:v10 handler:v11];

  _Block_release(v11);
  swift_release();
  swift_release();
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [self _systemImageNamed:v13];

  [v12 setImage:v14];
  sub_100007620((uint64_t *)&unk_1002F0270);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10024CE10;
  *(void *)(v15 + 32) = v12;
  aBlock[0] = v15;
  specialized Array._endMutation()();
  sub_10000B0CC(0, &qword_1002F4B70);
  id v16 = v12;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v2 = [self configurationWithActions:isa];

  [v2 _setSwipeActionsStyle:3];
  return v2;
}

void sub_100223794(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = sub_100007620(&qword_1002FC9D8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v14 = (char *)Strong;
    uint64_t v38 = a4;
    double v39 = a3;
    if (qword_1002EE5D8 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100011554(v15, (uint64_t)qword_10030E990);
    swift_retain_n();
    id v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v36 = v10;
    uint64_t v37 = v9;
    if (v18)
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v35 = v14;
      *(_DWORD *)uint64_t v19 = 136446210;
      v34[1] = v19 + 4;
      swift_getKeyPath();
      uint64_t v40 = a6;
      sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v20 = [*(id *)(a6 + 72) identifier];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v23 = v22;

      uint64_t v40 = sub_100202FD4(v21, v23, &v41);
      id v14 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "User deleted card item %{public}s via swipe action", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v24 = *(void **)&v14[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource];
    uint64_t v25 = v39;
    if (v24)
    {
      LOBYTE(v41) = 0;
      id v26 = v24;
      UICollectionViewDiffableDataSource.snapshot(for:)();
      sub_100007620(&qword_1002EE8A0);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_1002488D0;
      swift_getKeyPath();
      uint64_t v41 = a6;
      sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v28 = [*(id *)(a6 + 72) identifier];
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v31 = v30;

      *(void *)(v27 + 32) = v29;
      *(void *)(v27 + 40) = v31;
      uint64_t v32 = v37;
      NSDiffableDataSourceSectionSnapshot.delete(_:)((Swift::OpaquePointer)v27);
      swift_bridgeObjectRelease();
      LOBYTE(v41) = 0;
      UICollectionViewDiffableDataSource.apply(_:to:animatingDifferences:completion:)();

      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v32);
    }
    ((void (*)(uint64_t))v25)(1);
    swift_getKeyPath();
    uint64_t v41 = a6;
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    swift_retain();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    id v33 = *(id *)(a6 + 72);
    sub_100229680(v33);

    swift_release();
  }
  else
  {
    a3();
  }
}

id sub_100223CF0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TranslationListController();
  return [super dealloc];
}

uint64_t type metadata accessor for TranslationListController()
{
  return self;
}

void sub_100223E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v3 = *(char **)(a3 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController);
    if (v3)
    {
      unint64_t v4 = &v3[OBJC_IVAR____TtC17SequoiaTranslator24DictionaryViewController_text];
      *(void *)unint64_t v4 = a1;
      *((void *)v4 + 1) = a2;
      swift_bridgeObjectRetain();
      oslog = v3;
      swift_bridgeObjectRelease();
      sub_1000C8CC8();
    }
    else
    {
      if (qword_1002EE5E0 != -1) {
        swift_once();
      }
      uint64_t v5 = type metadata accessor for Logger();
      sub_100011554(v5, (uint64_t)qword_10030E9A8);
      oslog = Logger.logObject.getter();
      os_log_type_t v6 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(oslog, v6))
      {
        Swift::String v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Swift::String v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Got new word to define but don't have a dictionaryController to update the definition", v7, 2u);
        swift_slowDealloc();
      }
    }
  }
}

uint64_t sub_100223F6C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100007620((uint64_t *)&unk_1002F4B60);
  __chkstk_darwin(v4 - 8);
  os_log_type_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  swift_getKeyPath();
  v22[0] = a1;
  sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
  id v12 = v11;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v13 = [*(id *)(a1 + 72) identifier];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  v22[0] = v14;
  v22[1] = v16;
  dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
  swift_bridgeObjectRelease();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_10000B070((uint64_t)v6, (uint64_t *)&unk_1002F4B60);
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  BOOL v18 = *(void **)(v2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
  if (v18)
  {
    id v19 = v18;
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    id v21 = [v19 cellForItemAtIndexPath:isa];

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (uint64_t)v21;
  }
  __break(1u);
  return result;
}

void sub_100224238()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    swift_beginAccess();
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      id v3 = (void *)v2;
      uint64_t v4 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController;
      uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController];
      if (v5)
      {
        type metadata accessor for DictionaryViewController();
        id v6 = v3;
        id v7 = v5;
        char v8 = static NSObject.== infix(_:_:)();

        if (v8)
        {
          uint64_t v9 = *(char **)&v1[v4];
          *(void *)&v1[v4] = 0;

          uint64_t v1 = v9;
LABEL_18:

          return;
        }
      }
    }
    if (*(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController])
    {
      if (qword_1002EE5E0 != -1) {
        swift_once();
      }
      uint64_t v10 = type metadata accessor for Logger();
      sub_100011554(v10, (uint64_t)qword_10030E9A8);
      uint64_t v11 = Logger.logObject.getter();
      os_log_type_t v12 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v11, v12)) {
        goto LABEL_17;
      }
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
            "a different instance now";
    }
    else
    {
      if (qword_1002EE5E0 != -1) {
        swift_once();
      }
      uint64_t v15 = type metadata accessor for Logger();
      sub_100011554(v15, (uint64_t)qword_10030E9A8);
      uint64_t v11 = Logger.logObject.getter();
      os_log_type_t v12 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v11, v12)) {
        goto LABEL_17;
      }
      id v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v13 = 0;
    }
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v14, v13, 2u);
    swift_slowDealloc();
LABEL_17:

    goto LABEL_18;
  }
}

uint64_t sub_100224474(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_100007620((uint64_t *)&unk_1002F4B60);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for IndexPath();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t result = __chkstk_darwin(v12);
  if (a2 == 2)
  {
    uint64_t v17 = *(void *)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                       + 8];
    if (v17)
    {
      uint64_t v48 = v16;
      uint64_t v49 = v15;
      id v51 = (char *)&v48 - v14;
      id v52 = a3;
      uint64_t v58 = *(void *)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
      uint64_t v59 = v17;
      unint64_t v18 = *(void *)&v3[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore];
      double v53 = v9;
      double v54 = v3;
      uint64_t v50 = a1;
      if (v18 >> 62) {
        goto LABEL_28;
      }
      uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v55 = v11;
      uint64_t v56 = v10;
      if (!v19)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        return swift_bridgeObjectRelease();
      }
LABEL_5:
      unint64_t v57 = v18 & 0xC000000000000001;
      uint64_t v11 = 4;
      while (1)
      {
        uint64_t v20 = v11 - 4;
        if (v57)
        {
          uint64_t v21 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v22 = v11 - 3;
          if (__OFADD__(v20, 1)) {
            goto LABEL_27;
          }
        }
        else
        {
          uint64_t v21 = *(void *)(v18 + 8 * v11);
          swift_retain();
          uint64_t v22 = v11 - 3;
          if (__OFADD__(v20, 1))
          {
LABEL_27:
            __break(1u);
LABEL_28:
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
            uint64_t v55 = v11;
            uint64_t v56 = v10;
            if (!v19) {
              goto LABEL_17;
            }
            goto LABEL_5;
          }
        }
        unint64_t v23 = v18;
        swift_getKeyPath();
        uint64_t aBlock = (void **)v21;
        sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        id v24 = [*(id *)(v21 + 72) identifier:v48];
        uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v10 = v26;

        if (v25 == v58 && v59 == v10)
        {
          swift_bridgeObjectRelease();
LABEL_19:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v30 = v54;
          uint64_t v29 = v55;
          uint64_t v31 = *(void **)&v54[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource];
          uint64_t v32 = v56;
          if (v31)
          {
            swift_getKeyPath();
            uint64_t aBlock = (void **)v21;
            id v33 = v31;
            ObservationRegistrar.access<A, B>(_:keyPath:)();
            swift_release();
            id v34 = [*(id *)(v21 + 72) identifier];
            uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v37 = v36;

            uint64_t aBlock = (void **)v35;
            uint64_t v61 = v37;
            uint64_t v38 = (uint64_t)v53;
            dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
            swift_bridgeObjectRelease();

            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v38, 1, v32) != 1)
            {
              double v39 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 32);
              uint64_t v40 = v51;
              v39(v51, v38, v32);
              if (v52)
              {
                uint64_t v41 = v49;
                (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v49, v40, v32);
                unint64_t v42 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
                uint64_t v43 = swift_allocObject();
                char v44 = v50;
                *(void *)(v43 + 16) = v50;
                *(void *)(v43 + 24) = v30;
                v39((char *)(v43 + v42), v41, v32);
                id v64 = sub_100228C94;
                uint64_t v65 = v43;
                uint64_t aBlock = _NSConcreteStackBlock;
                uint64_t v61 = 1107296256;
                uint64_t v62 = sub_100218A34;
                id v63 = &unk_1002D3630;
                id v45 = _Block_copy(&aBlock);
                id v46 = v44;
                id v47 = v30;
                swift_release();
                [v52 animateAlongsideTransition:v45 completion:0];
                swift_release();
                _Block_release(v45);
                return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v51, v32);
              }
              else
              {
                (*(void (**)(char *, uint64_t))(v29 + 8))(v40, v32);
                return swift_release();
              }
            }
          }
          else
          {
            uint64_t v38 = (uint64_t)v53;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v55 + 56))(v53, 1, 1, v56);
          }
          swift_release();
          return sub_10000B070(v38, (uint64_t *)&unk_1002F4B60);
        }
        char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        unint64_t v18 = v23;
        if (v28) {
          goto LABEL_19;
        }
        swift_release();
        ++v11;
        if (v22 == v19) {
          goto LABEL_17;
        }
      }
    }
  }
  return result;
}

void sub_100224A38(uint64_t a1, void *a2, uint64_t a3)
{
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = a2;
    id v8 = [v6 adaptiveSheetPresentationController];
    [v8 frameOfPresentedViewInContainerView];
    double Height = CGRectGetHeight(v18);
    uint64_t v10 = *(void **)(a3 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
    if (!v10)
    {
LABEL_11:
      __break(1u);
      return;
    }
    double v11 = Height;
    [v10 safeAreaInsets];
    double v13 = v11 - v12;
    if (v11 - v12 <= 0.0) {
      double v13 = 0.0;
    }
    sub_100222734(1u, 0, v13);
  }
  uint64_t v14 = *(void **)(a3 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView);
  if (!v14)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v15 = v14;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  [v15 scrollToItemAtIndexPath:isa atScrollPosition:1 animated:0];
}

id sub_100224BFC(void *a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode);
  uint64_t v4 = *(void *)(v1
                 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                 + 8);
  *id v3 = 0;
  v3[1] = 0;
  if (v4)
  {
    sub_100218E20();
    swift_bridgeObjectRelease();
  }
  if (qword_1002EE5E0 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100011554(v5, (uint64_t)qword_10030E9A8);
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Force dismissing dictionary controller due to user pressing close button", v8, 2u);
    swift_slowDealloc();
  }

  return [a1 dismissViewControllerAnimated:1 completion:0];
}

uint64_t sub_100224DB4(void *a1)
{
  uint64_t v2 = v1;
  id v3 = [a1 presentingViewController];
  id v4 = [v3 transitionCoordinator];

  if (v4)
  {
    uint64_t v5 = &v2[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_bottomInsetReasonToHeightMap];
    swift_beginAccess();
    uint64_t v6 = *(void *)v5;
    if (*(void *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_100203940(1u);
      if (v8) {
        uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
      }
      else {
        uint64_t v9 = 0;
      }
      char v11 = v8 ^ 1;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      char v11 = 1;
    }
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v2;
    uint64_t v22 = sub_100228904;
    uint64_t v23 = v12;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_100218A34;
    uint64_t v21 = &unk_1002D3590;
    double v13 = _Block_copy(&aBlock);
    uint64_t v14 = v2;
    swift_release();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v9;
    *(unsigned char *)(v15 + 24) = v11 & 1;
    *(void *)(v15 + 32) = v14;
    uint64_t v22 = sub_100228968;
    uint64_t v23 = v15;
    uint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_100218A34;
    uint64_t v21 = &unk_1002D35E0;
    uint64_t v16 = _Block_copy(&aBlock);
    uint64_t v17 = v14;
    swift_release();
    [v4 animateAlongsideTransition:v13 completion:v16];
    _Block_release(v16);
    _Block_release(v13);
    return swift_unknownObjectRelease();
  }
  else
  {
    return sub_100222D94(1u, 1);
  }
}

unsigned char *storeEnumTagSinglePayload for TranslationListController.BottomInsetReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100225150);
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

ValueMetadata *type metadata accessor for TranslationListController.BottomInsetReason()
{
  return &type metadata for TranslationListController.BottomInsetReason;
}

unsigned char *storeEnumTagSinglePayload for TranslationListController.TranslationSection(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100225254);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationListController.TranslationSection()
{
  return &type metadata for TranslationListController.TranslationSection;
}

unint64_t sub_100225290()
{
  unint64_t result = qword_1002FC9C8;
  if (!qword_1002FC9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC9C8);
  }
  return result;
}

unint64_t sub_1002252E8()
{
  unint64_t result = qword_1002FC9D0;
  if (!qword_1002FC9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FC9D0);
  }
  return result;
}

double sub_10022533C@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_1002253BC()
{
  return static Published.subscript.setter();
}

uint64_t sub_100225440@<X0>(unsigned char *a1@<X8>)
{
  return sub_10007860C(a1);
}

uint64_t sub_100225454()
{
  return static Published.subscript.setter();
}

uint64_t sub_1002254C8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10023B920(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1002259C4(v6);
  return specialized ContiguousArray._endMutation()();
}

void *sub_100225544(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      uint64_t v9 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_100007620(&qword_1002FCAC0);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  double result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_1002256B8(unint64_t a1)
{
  return sub_1002257CC(a1, (void (*)(void *, uint64_t, unint64_t))sub_10022739C);
}

void *sub_1002256D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100007620(&qword_1002FC4D0);
  long long v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 88);
  uint64_t v5 = sub_100227FB0(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_100011710();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_1002257CC(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
{
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v4 <= 0)
    {
      uint64_t v5 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100007620((uint64_t *)&unk_1002F0270);
      uint64_t v5 = (void *)swift_allocObject();
      int64_t v6 = j__malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      v5[2] = v4;
      v5[3] = (2 * (v7 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v8;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(void *, uint64_t, unint64_t))v4) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v4) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v5;
}

void *sub_1002258D4(unint64_t a1)
{
  return sub_1002257CC(a1, (void (*)(void *, uint64_t, unint64_t))sub_100227A18);
}

void *sub_1002258EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100007620(&qword_1002F3998);
  uint64_t v3 = swift_allocObject();
  size_t v4 = j__malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * v4 - 64;
  uint64_t v5 = sub_10022824C(&v7, (unsigned char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_100011710();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return (void *)v3;
}

Swift::Int sub_1002259C4(uint64_t *a1)
{
  uint64_t v2 = sub_100007620(&qword_1002F8BA0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v148 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  char v166 = (char *)&v148 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  int64_t v10 = (char *)&v148 - v9;
  __chkstk_darwin(v8);
  CGRect v158 = (char *)&v148 - v11;
  uint64_t v176 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v176 - 8);
  uint64_t v13 = __chkstk_darwin(v176);
  uint64_t v15 = (char *)&v148 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v174 = (char *)&v148 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  CGRect v157 = (char *)&v148 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v172 = (char *)&v148 - v21;
  __chkstk_darwin(v20);
  CGRect v161 = (char *)&v148 - v22;
  Swift::Int v23 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v23);
  if (result >= v23)
  {
    if (v23 < 0) {
      goto LABEL_158;
    }
    if (v23) {
      return sub_100226940(0, v23, 1, a1);
    }
    return result;
  }
  if (v23 >= 0) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v23 + 1;
  }
  if (v23 < -1) {
    goto LABEL_166;
  }
  long long v155 = v10;
  char v165 = v5;
  Swift::Int v153 = result;
  uint64_t v149 = a1;
  if (v23 < 2)
  {
    uint64_t v29 = (char *)_swiftEmptyArrayStorage;
    uint64_t v179 = (uint64_t)_swiftEmptyArrayStorage;
    CGRect v162 = (uint64_t *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v23 != 1)
    {
      unint64_t v91 = _swiftEmptyArrayStorage[2];
      goto LABEL_122;
    }
  }
  else
  {
    uint64_t v26 = a1;
    uint64_t v27 = v25 >> 1;
    type metadata accessor for CommittedTranslationViewModel();
    uint64_t v28 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) = v27;
    a1 = v26;
    CGRect v162 = (uint64_t *)((v28 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v179 = v28;
  }
  Swift::Int v30 = 0;
  uint64_t v31 = *a1;
  v175 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v171 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  uint64_t v167 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v150 = v31 + 16;
  uint64_t v151 = v31 - 8;
  uint64_t v29 = (char *)_swiftEmptyArrayStorage;
  long long v164 = v15;
  Swift::Int v159 = v23;
  uint64_t v168 = v31;
  uint64_t v173 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  do
  {
    Swift::Int v32 = v30++;
    if (v30 >= v23)
    {
      Swift::Int v56 = v153;
      goto LABEL_42;
    }
    uint64_t v178 = *(void *)(v31 + 8 * v30);
    uint64_t v177 = *(void *)(v31 + 8 * v32);
    swift_retain();
    swift_retain();
    uint64_t v33 = v163;
    LODWORD(v170) = sub_10021E88C(&v178, &v177);
    uint64_t v163 = v33;
    if (v33)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      goto LABEL_134;
    }
    swift_release();
    swift_release();
    Swift::Int v30 = v32 + 2;
    if (v32 + 2 >= v23) {
      goto LABEL_33;
    }
    Swift::Int v169 = v32 + 2;
    double v152 = v29;
    Swift::Int v156 = v32;
    id v34 = (uint64_t *)(v150 + 8 * v32);
    while (1)
    {
      uint64_t v36 = *(v34 - 1);
      uint64_t v35 = *v34;
      swift_getKeyPath();
      uint64_t v178 = v35;
      sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
      swift_retain();
      swift_retain();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v37 = [*(id *)(v35 + 72) creationDate];
      if (v37)
      {
        uint64_t v38 = v37;
        double v39 = v172;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v40 = *v173;
        uint64_t v41 = (uint64_t)v158;
        uint64_t v42 = v176;
        (*v173)(v158, v39, v176);
        uint64_t v43 = *v175;
        (*v175)(v41, 0, 1, v42);
        if ((*v171)(v41, 1, v42) != 1)
        {
          v40(v161, (char *)v41, v176);
          goto LABEL_22;
        }
      }
      else
      {
        uint64_t v43 = *v175;
        uint64_t v41 = (uint64_t)v158;
        (*v175)((uint64_t)v158, 1, 1, v176);
      }
      static Date.now.getter();
      sub_10000B070(v41, &qword_1002F8BA0);
LABEL_22:
      swift_getKeyPath();
      uint64_t v178 = v36;
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v44 = [*(id *)(v36 + 72) creationDate];
      if (v44)
      {
        id v45 = v44;
        id v46 = v172;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        id v47 = *v173;
        uint64_t v48 = (uint64_t)v155;
        uint64_t v49 = v176;
        (*v173)(v155, v46, v176);
        v43(v48, 0, 1, v49);
        if ((*v171)(v48, 1, v49) != 1)
        {
          uint64_t v50 = v157;
          v47(v157, (char *)v48, v176);
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v48 = (uint64_t)v155;
        v43((uint64_t)v155, 1, 1, v176);
      }
      uint64_t v50 = v157;
      static Date.now.getter();
      sub_10000B070(v48, &qword_1002F8BA0);
LABEL_27:
      id v51 = v161;
      int v52 = static Date.< infix(_:_:)();
      double v53 = v50;
      double v54 = *v167;
      uint64_t v55 = v176;
      (*v167)(v53, v176);
      v54(v51, v55);
      swift_release();
      swift_release();
      if ((v170 ^ v52)) {
        break;
      }
      ++v34;
      Swift::Int v23 = v159;
      if (v159 == ++v169)
      {
        Swift::Int v30 = v159;
        uint64_t v29 = v152;
        goto LABEL_32;
      }
    }
    uint64_t v29 = v152;
    Swift::Int v23 = v159;
    Swift::Int v30 = v169;
LABEL_32:
    Swift::Int v32 = v156;
LABEL_33:
    Swift::Int v56 = v153;
    uint64_t v31 = v168;
    if (v170)
    {
      if (v30 >= v32)
      {
        if (v32 < v30)
        {
          unint64_t v57 = (uint64_t *)(v151 + 8 * v30);
          Swift::Int v58 = v30;
          Swift::Int v59 = v32;
          CGFloat v60 = (uint64_t *)(v168 + 8 * v32);
          while (1)
          {
            if (v59 != --v58)
            {
              if (!v31) {
                goto LABEL_164;
              }
              uint64_t v61 = *v60;
              uint64_t *v60 = *v57;
              uint64_t *v57 = v61;
            }
            ++v59;
            --v57;
            ++v60;
            if (v59 >= v58) {
              goto LABEL_42;
            }
          }
        }
        goto LABEL_42;
      }
LABEL_161:
      __break(1u);
LABEL_162:
      __break(1u);
LABEL_163:
      __break(1u);
LABEL_164:
      __break(1u);
LABEL_165:
      __break(1u);
LABEL_166:
      Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
LABEL_42:
    if (v30 >= v23) {
      goto LABEL_71;
    }
    if (__OFSUB__(v30, v32)) {
      goto LABEL_157;
    }
    if (v30 - v32 >= v56) {
      goto LABEL_71;
    }
    if (__OFADD__(v32, v56)) {
      goto LABEL_159;
    }
    if (v32 + v56 >= v23) {
      Swift::Int v62 = v23;
    }
    else {
      Swift::Int v62 = v32 + v56;
    }
    if (v62 < v32)
    {
LABEL_160:
      __break(1u);
      goto LABEL_161;
    }
    if (v30 == v62) {
      goto LABEL_71;
    }
    Swift::Int v156 = v32;
    double v152 = v29;
    id v63 = (uint64_t *)(v151 + 8 * v30);
    Swift::Int v154 = v62;
    while (2)
    {
      uint64_t v65 = *(void *)(v31 + 8 * v30);
      Swift::Int v66 = v156;
      CGRect v160 = v63;
      Swift::Int v169 = v30;
      while (2)
      {
        uint64_t v67 = *v63;
        swift_getKeyPath();
        uint64_t v178 = v65;
        uint64_t v68 = sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
        swift_retain();
        swift_retain();
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        id v69 = [*(id *)(v65 + 72) creationDate];
        if (!v69)
        {
          id v75 = *v175;
          uint64_t v74 = (uint64_t)v166;
          (*v175)((uint64_t)v166, 1, 1, v176);
          goto LABEL_59;
        }
        uint64_t v70 = v69;
        uint64_t v170 = v68;
        id v71 = v172;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v72 = v176;
        double v73 = *v173;
        uint64_t v74 = (uint64_t)v166;
        (*v173)(v166, v71, v176);
        id v75 = *v175;
        (*v175)(v74, 0, 1, v72);
        if ((*v171)(v74, 1, v72) == 1)
        {
LABEL_59:
          static Date.now.getter();
          sub_10000B070(v74, &qword_1002F8BA0);
        }
        else
        {
          v73(v174, (char *)v74, v72);
        }
        swift_getKeyPath();
        uint64_t v178 = v67;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        id v76 = [*(id *)(v67 + 72) creationDate];
        if (v76)
        {
          uint64_t v77 = v76;
          unsigned __int8 v78 = v172;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          double v79 = *v173;
          uint64_t v80 = (uint64_t)v165;
          uint64_t v81 = v176;
          (*v173)(v165, v78, v176);
          v75(v80, 0, 1, v81);
          if ((*v171)(v80, 1, v81) != 1)
          {
            double v82 = v164;
            v79(v164, (char *)v80, v176);
            goto LABEL_66;
          }
        }
        else
        {
          uint64_t v80 = (uint64_t)v165;
          v75((uint64_t)v165, 1, 1, v176);
        }
        double v82 = v164;
        static Date.now.getter();
        sub_10000B070(v80, &qword_1002F8BA0);
LABEL_66:
        id v83 = v174;
        char v84 = static Date.< infix(_:_:)();
        double v85 = *v167;
        CGFloat v86 = v82;
        uint64_t v87 = v176;
        (*v167)(v86, v176);
        v85(v83, v87);
        swift_release();
        swift_release();
        if (v84)
        {
          uint64_t v31 = v168;
          Swift::Int v64 = v169;
          if (!v168) {
            goto LABEL_162;
          }
          uint64_t v88 = *v63;
          uint64_t v65 = v63[1];
          uint64_t *v63 = v65;
          v63[1] = v88;
          --v63;
          if (v64 == ++v66) {
            goto LABEL_53;
          }
          continue;
        }
        break;
      }
      uint64_t v31 = v168;
      Swift::Int v64 = v169;
LABEL_53:
      Swift::Int v30 = v64 + 1;
      id v63 = v160 + 1;
      if (v30 != v154) {
        continue;
      }
      break;
    }
    Swift::Int v30 = v154;
    uint64_t v29 = v152;
    Swift::Int v32 = v156;
LABEL_71:
    if (v30 < v32) {
      goto LABEL_153;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v29 = sub_10023B4F4(0, *((void *)v29 + 2) + 1, 1, v29);
    }
    unint64_t v90 = *((void *)v29 + 2);
    unint64_t v89 = *((void *)v29 + 3);
    unint64_t v91 = v90 + 1;
    uint64_t v31 = v168;
    if (v90 >= v89 >> 1)
    {
      double v140 = sub_10023B4F4((char *)(v89 > 1), v90 + 1, 1, v29);
      uint64_t v31 = v168;
      uint64_t v29 = v140;
    }
    *((void *)v29 + 2) = v91;
    CGFloat v92 = v29 + 32;
    double v93 = &v29[16 * v90 + 32];
    *(void *)double v93 = v32;
    *((void *)v93 + 1) = v30;
    if (v90)
    {
      while (2)
      {
        unint64_t v94 = v91 - 1;
        if (v91 >= 4)
        {
          uint64_t v99 = &v92[16 * v91];
          uint64_t v100 = *((void *)v99 - 8);
          uint64_t v101 = *((void *)v99 - 7);
          BOOL v105 = __OFSUB__(v101, v100);
          uint64_t v102 = v101 - v100;
          if (v105) {
            goto LABEL_141;
          }
          uint64_t v104 = *((void *)v99 - 6);
          uint64_t v103 = *((void *)v99 - 5);
          BOOL v105 = __OFSUB__(v103, v104);
          uint64_t v97 = v103 - v104;
          char v98 = v105;
          if (v105) {
            goto LABEL_142;
          }
          unint64_t v106 = v91 - 2;
          os_log_type_t v107 = &v92[16 * v91 - 32];
          uint64_t v109 = *(void *)v107;
          uint64_t v108 = *((void *)v107 + 1);
          BOOL v105 = __OFSUB__(v108, v109);
          uint64_t v110 = v108 - v109;
          if (v105) {
            goto LABEL_144;
          }
          BOOL v105 = __OFADD__(v97, v110);
          uint64_t v111 = v97 + v110;
          if (v105) {
            goto LABEL_147;
          }
          if (v111 >= v102)
          {
            uint64_t v129 = &v92[16 * v94];
            uint64_t v131 = *(void *)v129;
            uint64_t v130 = *((void *)v129 + 1);
            BOOL v105 = __OFSUB__(v130, v131);
            uint64_t v132 = v130 - v131;
            if (v105) {
              goto LABEL_151;
            }
            BOOL v122 = v97 < v132;
          }
          else
          {
LABEL_90:
            if (v98) {
              goto LABEL_143;
            }
            unint64_t v106 = v91 - 2;
            os_log_type_t v112 = &v92[16 * v91 - 32];
            uint64_t v114 = *(void *)v112;
            uint64_t v113 = *((void *)v112 + 1);
            BOOL v115 = __OFSUB__(v113, v114);
            uint64_t v116 = v113 - v114;
            char v117 = v115;
            if (v115) {
              goto LABEL_146;
            }
            double v118 = &v92[16 * v94];
            uint64_t v120 = *(void *)v118;
            uint64_t v119 = *((void *)v118 + 1);
            BOOL v105 = __OFSUB__(v119, v120);
            uint64_t v121 = v119 - v120;
            if (v105) {
              goto LABEL_149;
            }
            if (__OFADD__(v116, v121)) {
              goto LABEL_150;
            }
            if (v116 + v121 < v97) {
              goto LABEL_102;
            }
            BOOL v122 = v97 < v121;
          }
          if (v122) {
            unint64_t v94 = v106;
          }
        }
        else
        {
          if (v91 == 3)
          {
            uint64_t v96 = *((void *)v29 + 4);
            uint64_t v95 = *((void *)v29 + 5);
            BOOL v105 = __OFSUB__(v95, v96);
            uint64_t v97 = v95 - v96;
            char v98 = v105;
            goto LABEL_90;
          }
          uint64_t v123 = *((void *)v29 + 4);
          uint64_t v124 = *((void *)v29 + 5);
          BOOL v105 = __OFSUB__(v124, v123);
          uint64_t v116 = v124 - v123;
          char v117 = v105;
LABEL_102:
          if (v117) {
            goto LABEL_145;
          }
          os_log_type_t v125 = &v92[16 * v94];
          uint64_t v127 = *(void *)v125;
          uint64_t v126 = *((void *)v125 + 1);
          BOOL v105 = __OFSUB__(v126, v127);
          uint64_t v128 = v126 - v127;
          if (v105) {
            goto LABEL_148;
          }
          if (v128 < v116) {
            goto LABEL_119;
          }
        }
        unint64_t v133 = v94 - 1;
        if (v94 - 1 >= v91)
        {
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
          goto LABEL_160;
        }
        if (!v31) {
          goto LABEL_163;
        }
        uint64_t v134 = &v92[16 * v133];
        uint64_t v135 = *(void *)v134;
        uint64_t v136 = &v92[16 * v94];
        uint64_t v137 = *((void *)v136 + 1);
        uint64_t v138 = v163;
        sub_100226E88((uint64_t *)(v31 + 8 * *(void *)v134), (uint64_t *)(v31 + 8 * *(void *)v136), v31 + 8 * v137, v162);
        uint64_t v163 = v138;
        if (v138) {
          goto LABEL_133;
        }
        if (v137 < v135) {
          goto LABEL_138;
        }
        if (v94 > *((void *)v29 + 2)) {
          goto LABEL_139;
        }
        *(void *)uint64_t v134 = v135;
        *(void *)&v92[16 * v133 + 8] = v137;
        unint64_t v139 = *((void *)v29 + 2);
        if (v94 >= v139) {
          goto LABEL_140;
        }
        unint64_t v91 = v139 - 1;
        memmove(&v92[16 * v94], v136 + 16, 16 * (v139 - 1 - v94));
        *((void *)v29 + 2) = v139 - 1;
        uint64_t v31 = v168;
        if (v139 <= 2) {
          goto LABEL_119;
        }
        continue;
      }
    }
    unint64_t v91 = 1;
LABEL_119:
    Swift::Int v23 = v159;
  }
  while (v30 < v159);
LABEL_122:
  if (v91 >= 2)
  {
    uint64_t v141 = *v149;
    do
    {
      unint64_t v142 = v91 - 2;
      if (v91 < 2) {
        goto LABEL_152;
      }
      if (!v141) {
        goto LABEL_165;
      }
      uint64_t v143 = *(void *)&v29[16 * v142 + 32];
      uint64_t v144 = *(void *)&v29[16 * v91 + 24];
      uint64_t v145 = v163;
      sub_100226E88((uint64_t *)(v141 + 8 * v143), (uint64_t *)(v141 + 8 * *(void *)&v29[16 * v91 + 16]), v141 + 8 * v144, v162);
      uint64_t v163 = v145;
      if (v145) {
        break;
      }
      if (v144 < v143) {
        goto LABEL_154;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v29 = sub_10023B8E4((uint64_t)v29);
      }
      if (v142 >= *((void *)v29 + 2)) {
        goto LABEL_155;
      }
      uint64_t v146 = &v29[16 * v142 + 32];
      *(void *)uint64_t v146 = v143;
      *((void *)v146 + 1) = v144;
      unint64_t v147 = *((void *)v29 + 2);
      if (v91 > v147) {
        goto LABEL_156;
      }
      memmove(&v29[16 * v91 + 16], &v29[16 * v91 + 32], 16 * (v147 - v91));
      *((void *)v29 + 2) = v147 - 1;
      unint64_t v91 = v147 - 1;
    }
    while (v147 > 2);
  }
LABEL_133:
  swift_bridgeObjectRelease();
LABEL_134:
  *(void *)((v179 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  specialized Array._endMutation()();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100226940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v46 = a1;
  uint64_t v7 = sub_100007620(&qword_1002F8BA0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  int64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  double v53 = (char *)&v44 - v11;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  unint64_t v57 = (char *)&v44 - v17;
  uint64_t result = __chkstk_darwin(v16);
  CGFloat v60 = (char *)&v44 - v20;
  uint64_t v45 = a2;
  if (a3 != a2)
  {
    uint64_t v21 = (void (**)(char *, char *, uint64_t))(v19 + 32);
    Swift::Int v59 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    uint64_t v22 = *a4;
    Swift::Int v56 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
    uint64_t v48 = (void (**)(char *, uint64_t))(v19 + 8);
    uint64_t v49 = (void (**)(char *, char *, uint64_t))(v19 + 32);
    uint64_t v54 = v22;
    Swift::Int v23 = (void *)(v22 + 8 * a3 - 8);
    uint64_t v50 = v12;
    id v51 = v15;
    int v52 = v10;
LABEL_5:
    uint64_t v24 = *(void *)(v54 + 8 * a3);
    uint64_t v58 = v46;
    id v47 = v23;
    uint64_t v55 = a3;
    while (1)
    {
      uint64_t v25 = *v23;
      swift_getKeyPath();
      uint64_t v62 = v24;
      sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
      swift_retain();
      uint64_t v61 = v25;
      swift_retain();
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v26 = [*(id *)(v24 + 72) creationDate];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = v57;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v29 = *v21;
        uint64_t v30 = (uint64_t)v53;
        (*v21)(v53, v28, v12);
        uint64_t v31 = *v59;
        (*v59)(v30, 0, 1, v12);
        if ((*v56)(v30, 1, v12) != 1)
        {
          v29(v60, (char *)v30, v12);
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v31 = *v59;
        uint64_t v30 = (uint64_t)v53;
        (*v59)((uint64_t)v53, 1, 1, v12);
      }
      static Date.now.getter();
      sub_10000B070(v30, &qword_1002F8BA0);
LABEL_11:
      swift_getKeyPath();
      uint64_t v32 = v61;
      uint64_t v62 = v61;
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      id v33 = [*(id *)(v32 + 72) creationDate];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = v57;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v36 = *v21;
        uint64_t v37 = (uint64_t)v52;
        (*v21)(v52, v35, v12);
        v31(v37, 0, 1, v12);
        if ((*v56)(v37, 1, v12) != 1)
        {
          uint64_t v38 = v51;
          v36(v51, (char *)v37, v12);
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v37 = (uint64_t)v52;
        v31((uint64_t)v52, 1, 1, v12);
      }
      uint64_t v38 = v51;
      static Date.now.getter();
      sub_10000B070(v37, &qword_1002F8BA0);
LABEL_16:
      double v39 = v60;
      char v40 = static Date.< infix(_:_:)();
      uint64_t v41 = *v48;
      uint64_t v12 = v50;
      (*v48)(v38, v50);
      v41(v39, v12);
      swift_release();
      uint64_t result = swift_release();
      uint64_t v42 = v55;
      uint64_t v21 = v49;
      if ((v40 & 1) == 0) {
        goto LABEL_4;
      }
      if (!v54)
      {
        __break(1u);
        return result;
      }
      uint64_t v43 = *v23;
      uint64_t v24 = v23[1];
      *Swift::Int v23 = v24;
      v23[1] = v43;
      --v23;
      if (v42 == ++v58)
      {
LABEL_4:
        a3 = v42 + 1;
        Swift::Int v23 = v47 + 1;
        if (a3 == v45) {
          return result;
        }
        goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t sub_100226E88(uint64_t *__src, uint64_t *a2, unint64_t a3, uint64_t *__dst)
{
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v37 = __src;
  uint64_t v36 = __dst;
  uint64_t v32 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      uint64_t v19 = v4;
      if (__dst != a2 || &a2[v13] <= __dst)
      {
        memmove(__dst, a2, 8 * v13);
        __dst = v32;
      }
      uint64_t v20 = &__dst[v13];
      uint64_t v35 = v20;
      uint64_t v37 = v6;
      if (v7 >= v6 || v11 < 8) {
        goto LABEL_48;
      }
      uint64_t v21 = (uint64_t *)(a3 - 8);
      uint64_t v22 = v6;
      uint64_t v31 = v7;
      while (1)
      {
        Swift::Int v23 = v20;
        uint64_t v24 = *--v20;
        uint64_t v34 = v24;
        uint64_t v25 = *--v22;
        uint64_t v33 = v25;
        swift_retain();
        swift_retain();
        char v26 = sub_10021E88C(&v34, &v33);
        if (v19) {
          goto LABEL_47;
        }
        char v27 = v26;
        uint64_t v28 = v21 + 1;
        swift_release();
        swift_release();
        if (v27)
        {
          uint64_t v29 = v32;
          if (v28 != v6 || v21 >= v6) {
            *uint64_t v21 = *v22;
          }
          uint64_t v37 = v22;
          uint64_t v19 = 0;
          uint64_t v20 = v23;
        }
        else
        {
          uint64_t v35 = v20;
          uint64_t v29 = v32;
          if (v28 < v23 || v21 >= v23 || v28 != v23) {
            *uint64_t v21 = *v20;
          }
          uint64_t v22 = v6;
          uint64_t v19 = 0;
        }
        if (v22 > v31)
        {
          --v21;
          uint64_t v6 = v22;
          if (v20 > v29) {
            continue;
          }
        }
        goto LABEL_48;
      }
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst)
    {
      memmove(__dst, __src, 8 * v10);
      __dst = v32;
    }
    uint64_t v14 = &__dst[v10];
    uint64_t v35 = v14;
    if ((unint64_t)v6 >= a3 || v8 < 8) {
      goto LABEL_48;
    }
    while (1)
    {
      uint64_t v34 = *v6;
      uint64_t v15 = __dst;
      uint64_t v33 = *__dst;
      swift_retain();
      swift_retain();
      char v16 = sub_10021E88C(&v34, &v33);
      if (v4) {
        break;
      }
      char v17 = v16;
      swift_release();
      swift_release();
      if (v17)
      {
        uint64_t v18 = v6 + 1;
        if (v7 < v6 || v7 >= v18 || v7 != v6) {
          *uint64_t v7 = *v6;
        }
        __dst = v15;
      }
      else
      {
        if (v7 != v15) {
          *uint64_t v7 = *v15;
        }
        __dst = v15 + 1;
        uint64_t v36 = v15 + 1;
        uint64_t v18 = v6;
      }
      uint64_t v37 = ++v7;
      if (__dst < v14)
      {
        uint64_t v6 = v18;
        if ((unint64_t)v18 < a3) {
          continue;
        }
      }
      goto LABEL_48;
    }
LABEL_47:
    swift_release();
    swift_release();
LABEL_48:
    sub_10023B780(&v37, &v36, &v35);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1002271E4(unsigned __int8 a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100203940(a1);
  char v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v1;
  uint64_t v11 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100206BA0();
    uint64_t v8 = v11;
  }
  uint64_t v9 = *(void *)(*(void *)(v8 + 56) + 8 * v4);
  sub_10022B370(v4, v8);
  *uint64_t v2 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1002272A8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1002038D4(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v1;
  uint64_t v10 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100206D30();
    uint64_t v7 = v10;
  }
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 24 * v4);
  sub_10022B58C(v4, v7);
  *uint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10022739C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100014894(&qword_1002FCAF8, &qword_1002FCAF0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100007620(&qword_1002FCAF0);
          uint64_t v12 = sub_100098648(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for PersistedTranslation();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1002275C0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100014894(&qword_1002FCAE8, &qword_1002FCAE0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100007620(&qword_1002FCAE0);
          uint64_t v12 = sub_10009871C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10000B0CC(0, (unint64_t *)&unk_1002F3450);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1002277F4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100014894((unint64_t *)&unk_1002FCA30, &qword_1002FCA28);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100007620(&qword_1002FCA28);
          uint64_t v12 = sub_1000986B4(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for CommittedTranslationViewModel();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100227A18(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100014894(&qword_1002FCAD8, &qword_1002FCAD0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100007620(&qword_1002FCAD0);
          uint64_t v12 = sub_10009871C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10000B0CC(0, &qword_1002FCAC8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100227C4C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100014894((unint64_t *)&unk_1002FCAB0, &qword_1002FCAA8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100007620(&qword_1002FCAA8);
          uint64_t v12 = sub_10009871C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10000B0CC(0, &qword_1002FAFC0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100227E88()
{
  return sub_10003E5F8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_100227EB0()
{
  return sub_10003DD6C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_100227ED0@<X0>(unsigned char *a1@<X8>)
{
  return sub_10007860C(a1);
}

uint64_t sub_100227EFC@<X0>(unsigned char *a1@<X8>)
{
  return sub_10007860C(a1);
}

uint64_t sub_100227F30()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100227F6C()
{
}

uint64_t sub_100227F74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100227F84()
{
  return swift_release();
}

void sub_100227F94()
{
  sub_10003B68C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void *sub_100227FB0(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a4 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a4 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v10 = 0;
    uint64_t v8 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v33;
    result[2] = ~v5;
    result[3] = v10;
    result[4] = v7;
    return (void *)v8;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
    int64_t v10 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v9 = a2;
  uint64_t v30 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v31 = result;
  int64_t v10 = 0;
  uint64_t v11 = 0;
  int64_t v32 = (unint64_t)(63 - v5) >> 6;
  if (!v7) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v12 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v13 = v12 | (v10 << 6);
  while (1)
  {
    ++v11;
    uint64_t v17 = *(void *)(a4 + 48) + 88 * v13;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v19 = *(void *)(v17 + 16);
    uint64_t v20 = *(void *)(v17 + 24);
    uint64_t v21 = *(void *)(v17 + 32);
    uint64_t v22 = *(void *)(v17 + 40);
    char v23 = *(unsigned char *)(v17 + 64);
    uint64_t v24 = *(void **)(v17 + 72);
    uint64_t v25 = *(void **)(v17 + 80);
    long long v26 = *(_OWORD *)(v17 + 48);
    *(void *)uint64_t v9 = *(void *)v17;
    *(void *)(v9 + 8) = v18;
    *(void *)(v9 + 16) = v19;
    *(void *)(v9 + 24) = v20;
    *(void *)(v9 + 32) = v21;
    *(void *)(v9 + 40) = v22;
    *(_OWORD *)(v9 + 48) = v26;
    *(unsigned char *)(v9 + 64) = v23;
    *(void *)(v9 + 72) = v24;
    *(void *)(v9 + 80) = v25;
    if (v11 == v8)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v28 = v24;
      id v29 = v25;
      goto LABEL_38;
    }
    v9 += 88;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v27 = v24;
    uint64_t result = v25;
    if (v7) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v14 >= v32) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v33 + 8 * v14);
    if (!v15)
    {
      v10 += 2;
      if (v14 + 1 >= v32)
      {
        unint64_t v7 = 0;
        int64_t v10 = v14;
      }
      else
      {
        unint64_t v15 = *(void *)(v33 + 8 * v10);
        if (v15) {
          goto LABEL_14;
        }
        int64_t v16 = v14 + 2;
        if (v14 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v33 + 8 * v16);
        if (v15)
        {
LABEL_17:
          int64_t v14 = v16;
          goto LABEL_18;
        }
        int64_t v10 = v14 + 3;
        if (v14 + 3 < v32)
        {
          unint64_t v15 = *(void *)(v33 + 8 * v10);
          if (v15)
          {
LABEL_14:
            int64_t v14 = v10;
            goto LABEL_18;
          }
          int64_t v16 = v14 + 4;
          if (v14 + 4 >= v32)
          {
LABEL_33:
            unint64_t v7 = 0;
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v33 + 8 * v16);
          if (!v15)
          {
            while (1)
            {
              int64_t v14 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v32)
              {
                unint64_t v7 = 0;
                int64_t v10 = v32 - 1;
                goto LABEL_37;
              }
              unint64_t v15 = *(void *)(v33 + 8 * v14);
              ++v16;
              if (v15) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v7 = 0;
        int64_t v10 = v14 + 2;
      }
LABEL_37:
      uint64_t v8 = v11;
LABEL_38:
      uint64_t v5 = v30;
      uint64_t result = v31;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v14 << 6);
    int64_t v10 = v14;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_10022824C(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(unsigned char *)(*(void *)(a4 + 48) + v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

unint64_t sub_1002283E0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (a1 | a2) == 0;
  if (a1 && a2)
  {
    swift_getKeyPath();
    sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
    swift_retain();
    swift_retain();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v5 = *(void **)(a1 + 72);
    swift_getKeyPath();
    id v6 = v5;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    unint64_t v2 = (unint64_t)[v6 isEqual:*(void *)(a2 + 72)];
    swift_release();
    swift_release();
  }
  return v2;
}

void *sub_100228528(unint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_34;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  uint64_t result = _swiftEmptyArrayStorage;
  if (v3)
  {
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)();
    if (v3 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v28 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore;
      unint64_t v29 = v2 & 0xC000000000000001;
      uint64_t v25 = v2 + 32;
      uint64_t v26 = v3;
      uint64_t v27 = v2;
      do
      {
        if (v5 == v3) {
          goto LABEL_33;
        }
        if (v29) {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v6 = *(id *)(v25 + 8 * v5);
        }
        unint64_t v7 = v6;
        unint64_t v8 = *(void *)(a2 + v28);
        uint64_t v31 = v5;
        if (v8 >> 62)
        {
          swift_bridgeObjectRetain_n();
          id v24 = v7;
          uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
          if (v9)
          {
LABEL_14:
            unint64_t v33 = v8;
            unint64_t v34 = v8 & 0xC000000000000001;
            uint64_t v11 = 4;
            uint64_t v32 = v9;
            do
            {
              uint64_t v12 = v11 - 4;
              if (v34)
              {
                uint64_t v13 = specialized _ArrayBuffer._getElementSlowPath(_:)();
                uint64_t v2 = v11 - 3;
                if (__OFADD__(v12, 1)) {
                  goto LABEL_32;
                }
              }
              else
              {
                uint64_t v13 = *(void *)(v8 + 8 * v11);
                swift_retain();
                uint64_t v2 = v11 - 3;
                if (__OFADD__(v12, 1))
                {
LABEL_32:
                  __break(1u);
LABEL_33:
                  __break(1u);
LABEL_34:
                  swift_bridgeObjectRetain();
                  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
                  swift_bridgeObjectRelease();
                  goto LABEL_3;
                }
              }
              swift_getKeyPath();
              sub_100228DF0(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
              ObservationRegistrar.access<A, B>(_:keyPath:)();
              swift_release();
              id v14 = [*(id *)(v13 + 72) identifier];
              uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v17 = v16;

              uint64_t v18 = v7;
              id v19 = [v7 identifier];
              uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v22 = v21;

              if (v15 == v20 && v17 == v22)
              {

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_27:
                swift_bridgeObjectRelease();

                swift_bridgeObjectRelease();
                goto LABEL_7;
              }
              char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              unint64_t v8 = v33;
              if (v23)
              {

                goto LABEL_27;
              }
              swift_release();
              ++v11;
              unint64_t v7 = v18;
            }
            while (v2 != v32);
          }
        }
        else
        {
          uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain_n();
          id v10 = v7;
          if (v9) {
            goto LABEL_14;
          }
        }

        swift_bridgeObjectRelease_n();
        sub_10021EFD8(v7);

LABEL_7:
        uint64_t v5 = v31 + 1;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        uint64_t v3 = v26;
        uint64_t v2 = v27;
      }
      while (v31 + 1 != v26);
      return _swiftEmptyArrayStorage;
    }
  }
  return result;
}

unint64_t sub_1002288B8(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1002C8D58, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

uint64_t sub_100228904()
{
  return sub_100222D94(1u, 0);
}

uint64_t sub_100228930()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100228968(void *a1)
{
  if ((*(unsigned char *)(v1 + 24) & 1) == 0)
  {
    double v2 = *(double *)(v1 + 16);
    if ([a1 isCancelled]) {
      sub_100222734(1u, 1, v2);
    }
  }
}

void sub_1002289BC()
{
  *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_collectionView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dataSource] = 0;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    uint64_t v1 = (void *)sub_10011050C((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v1 = &_swiftEmptySetSingleton;
  }
  *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_observers] = v1;
  *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore] = _swiftEmptyArrayStorage;
  double v2 = &v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode];
  *double v2 = 0;
  v2[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryController] = 0;
  unint64_t v3 = &v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryHighlightRect];
  *(_OWORD *)unint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  v3[32] = 1;
  *(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_dictionaryTextView] = 0;
  uint64_t v4 = &v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pendingDictionaryModeIdentifier];
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = &v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_entryCardStaticIdentifier];
  *uint64_t v5 = 0xD000000000000018;
  v5[1] = 0x8000000100264AB0;
  v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_pinComposeCardToKeyboard] = 0;
  uint64_t v6 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_bottomInsetReasonToHeightMap;
  *(void *)&v0[v6] = sub_1001FF9F8((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v7 = &v0[OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_lastKnownKeyboardFrame];
  *unint64_t v7 = 0u;
  v7[1] = 0u;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100228B38()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode);
  uint64_t v2 = *(void *)(v0
                 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_viewModelIdentifierInDictionaryMode
                 + 8);
  void *v1 = 0;
  v1[1] = 0;
  if (v2)
  {
    sub_100218E20();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100228BC0()
{
  uint64_t v1 = type metadata accessor for IndexPath();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100228C94(uint64_t a1)
{
  type metadata accessor for IndexPath();
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);

  sub_100224A38(a1, v3, v4);
}

uint64_t sub_100228D0C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100228D4C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  sub_100223794(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_100228D54()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100228D8C(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100228DA4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100228DDC()
{
}

uint64_t sub_100228DF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100228E38()
{
  return sub_100063D54(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_100228E58()
{
  return _swift_deallocObject(v0, 64, 7);
}

void *sub_100228E90()
{
  return sub_10022240C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48), *(double *)(v0 + 56));
}

uint64_t sub_100228EA4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100228EDC(uint64_t a1)
{
  sub_1002224A4(a1, *(void *)(v1 + 16));
}

void sub_100228EE4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
}

void sub_100228EEC(uint64_t a1, char a2)
{
}

uint64_t sub_100228F0C()
{
  return sub_100228F6C((uint64_t (*)(void, void, void, void))sub_10003E520);
}

uint64_t sub_100228F40()
{
  return sub_100228F6C((uint64_t (*)(void, void, void, void))sub_10003E144);
}

uint64_t sub_100228F6C(uint64_t (*a1)(void, void, void, void))
{
  return a1(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned __int8 *)(v1 + 40));
}

unint64_t sub_100228F98()
{
  unint64_t result = qword_1002FCA20;
  if (!qword_1002FCA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FCA20);
  }
  return result;
}

uint64_t sub_100228FEC()
{
  swift_release();

  return _swift_deallocObject(v0, 27, 7);
}

void sub_100229024()
{
  sub_10021ECE8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(unsigned char *)(v0 + 25), *(unsigned char *)(v0 + 26));
}

void sub_100229038(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10021CD6C(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_100229040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10021D46C(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100229048()
{
  uint64_t v1 = sub_100007620((uint64_t *)&unk_1002FCA40);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;

  uint64_t v9 = v0 + v4;
  id v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v6);
}

uint64_t sub_100229140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100007620((uint64_t *)&unk_1002FCA40);
  uint64_t v9 = *(void *)(v4 + 16);

  return sub_10021DB5C(a1, a2, a3, a4, v9);
}

uint64_t sub_10022920C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100229244(uint64_t a1, uint64_t a2, void *a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v3 + 16))(a1, a2, *a3, a3[1]);
}

uint64_t sub_100229274@<X0>(uint64_t *a1@<X8>)
{
  return sub_10021D8A4(a1);
}

uint64_t sub_100229284@<X0>(uint64_t a1@<X8>)
{
  return sub_10021D184(*(void **)(v1 + 24), a1);
}

void *sub_10022928C(uint64_t a1)
{
  return sub_10021C6BC(a1);
}

char *sub_100229294()
{
  return sub_10021C3F4();
}

void *assignWithCopy for TranslationListController.TranslationContent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for TranslationListController.TranslationContent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TranslationListController.TranslationContent(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TranslationListController.TranslationContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

void *sub_1002293B0(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for TranslationListController.TranslationContent()
{
  return &type metadata for TranslationListController.TranslationContent;
}

unint64_t sub_1002293E4()
{
  unint64_t result = qword_1002FCB00;
  if (!qword_1002FCB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FCB00);
  }
  return result;
}

void sub_100229438(unint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_10021A690(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_100229440()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100229480(unint64_t *a1)
{
  return sub_10021A6EC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100229488(unsigned __int8 *a1)
{
  return sub_10021A800(a1);
}

void sub_100229490()
{
}

void sub_1002294B4()
{
}

void sub_1002294BC()
{
  sub_10021AA30(*(char **)(v0 + 16), *(unsigned char *)(v0 + 32), *(double *)(v0 + 24));
}

uint64_t sub_10022952C()
{
  return sub_100227EB0();
}

uint64_t sub_100229544()
{
  return sub_100227E88();
}

uint64_t sub_10022955C()
{
  return sub_100228E38();
}

uint64_t sub_100229574()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1002295E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10022965C()
{
  return sub_10022A3D4();
}

void sub_100229680(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_100007620(&qword_1002F8BA0);
  __chkstk_darwin(v8 - 8);
  id v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v11 = [a1 favoriteDate];
  if (v11)
  {
    uint64_t v12 = v11;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v10, v7, v4);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
    {
      sub_10000B070((uint64_t)v10, &qword_1002F8BA0);
      NSString v13 = String._bridgeToObjectiveC()();
      [a1 setSessionID:v13];

      sub_100029624((void *)(v2 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), *(void *)(v2 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24));
      dispatch thunk of TranslationStore.save()();
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
  }
  sub_10000B070((uint64_t)v10, &qword_1002F8BA0);
  sub_100029624((void *)(v2 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), *(void *)(v2 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24));
  dispatch thunk of TranslationStore.deleteBackground(_:completion:)();
LABEL_6:
  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = a1;
  uint64_t v15 = (void (*)(unsigned char *, void))static Published.subscript.modify();
  uint64_t v17 = v16;
  uint64_t v18 = sub_1001FF014(v16, v14);

  if (*v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v19 >= v18) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v19 >= v18)
    {
LABEL_8:
      sub_10022C554(v18, v19, (void (*)(void))&type metadata accessor for PersistedTranslation);
      v15(v21, 0);
      swift_release();
      swift_release();
      return;
    }
  }
  __break(1u);
}

void sub_1002299E4(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_observations);
  swift_beginAccess();
  uint64_t v46 = *v2 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(*v2 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v51 = v4 & *(void *)(*v2 + 64);
  unint64_t v5 = (unint64_t)(v3 + 63) >> 6;
  unint64_t v43 = v5 - 1;
  uint64_t v6 = swift_bridgeObjectRetain();
  unint64_t v7 = 0;
  int64_t v47 = v5;
  uint64_t v49 = v6;
  unint64_t v44 = v5 - 5;
  uint64_t v45 = v6 + 104;
  uint64_t v54 = v2;
  while (1)
  {
    if (v51)
    {
      unint64_t v8 = __clz(__rbit64(v51));
      unint64_t v50 = v7;
      v51 &= v51 - 1;
      unint64_t v9 = v8 | (v7 << 6);
LABEL_8:
      uint64_t v10 = *(void *)(v49 + 56);
      unint64_t v64 = *(void *)(*(void *)(v49 + 48) + 8 * v9);
      sub_100208034(v10 + 16 * v9, (uint64_t)v65);
      goto LABEL_15;
    }
    int64_t v11 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_74;
    }
    if (v11 >= v47)
    {
      unint64_t v50 = v7;
    }
    else
    {
      unint64_t v12 = *(void *)(v46 + 8 * v11);
      if (v12) {
        goto LABEL_12;
      }
      if ((uint64_t)(v7 + 2) >= v47)
      {
        unint64_t v50 = v7 + 1;
      }
      else
      {
        unint64_t v12 = *(void *)(v46 + 8 * (v7 + 2));
        if (v12)
        {
          int64_t v11 = v7 + 2;
LABEL_12:
          unint64_t v50 = v11;
          unint64_t v51 = (v12 - 1) & v12;
          unint64_t v9 = __clz(__rbit64(v12)) + (v11 << 6);
          goto LABEL_8;
        }
        if ((uint64_t)(v7 + 3) >= v47)
        {
          unint64_t v50 = v7 + 2;
        }
        else
        {
          unint64_t v12 = *(void *)(v46 + 8 * (v7 + 3));
          if (v12)
          {
            int64_t v11 = v7 + 3;
            goto LABEL_12;
          }
          int64_t v11 = v7 + 4;
          if ((uint64_t)(v7 + 4) >= v47)
          {
            unint64_t v50 = v7 + 3;
          }
          else
          {
            unint64_t v12 = *(void *)(v46 + 8 * v11);
            if (v12) {
              goto LABEL_12;
            }
            while (v44 != v7)
            {
              unint64_t v12 = *(void *)(v45 + 8 * v7++);
              if (v12)
              {
                int64_t v11 = v7 + 4;
                goto LABEL_12;
              }
            }
            unint64_t v50 = v43;
          }
        }
      }
    }
    unint64_t v51 = 0;
    unint64_t v64 = 0;
    v65[0] = 0;
    v65[1] = 1;
LABEL_15:
    sub_10022C244((uint64_t)&v64, (uint64_t)&v66);
    if (v67[0]) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v67[1] == 1;
    }
    if (v13)
    {
LABEL_71:
      swift_release();
      return;
    }
    uint64_t v14 = v66;
    sub_100208090((uint64_t)v67, (uint64_t)v63);
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong) {
      break;
    }
    swift_beginAccess();
    unint64_t v38 = sub_100203890(v14);
    if (v39)
    {
      unint64_t v40 = v38;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v42 = *v2;
      uint64_t v61 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1002069DC();
        uint64_t v42 = v61;
      }
      sub_100208090(*(void *)(v42 + 56) + 16 * v40, (uint64_t)&v62);
      sub_10022B1B0(v40, v42);
      *uint64_t v2 = v42;
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v62 = xmmword_10024FEC0;
    }
    sub_10000B070((uint64_t)&v62, &qword_1002FCB70);
    swift_endAccess();
LABEL_5:
    sub_100013384((uint64_t)v63);
    unint64_t v7 = v50;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  unint64_t v15 = v64;
  swift_bridgeObjectRetain();
  unint64_t v16 = (unint64_t)sub_10022C2C4(v15, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v16 >> 62))
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v17) {
      goto LABEL_22;
    }
    goto LABEL_4;
  }
  uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
  if (!v17)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
LABEL_22:
  unint64_t v18 = 0;
  uint64_t v56 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationListController_localDataStore;
  unint64_t v57 = v16 & 0xC000000000000001;
  int v52 = (char *)(v16 + 32);
  uint64_t v53 = v16 & 0xFFFFFFFFFFFFFF8;
  uint64_t v55 = v17;
  while (1)
  {
    if (v57)
    {
      id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (v18 >= *(void *)(v53 + 16)) {
        goto LABEL_73;
      }
      id v20 = *(id *)&v52[8 * v18];
    }
    id v60 = v20;
    BOOL v21 = __OFADD__(v18, 1);
    unint64_t v22 = v18 + 1;
    if (v21) {
      break;
    }
    unint64_t v59 = v22;
    unint64_t v23 = *(void *)(Strong + v56);
    if (v23 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
      if (v24)
      {
LABEL_32:
        uint64_t v25 = 4;
        do
        {
          uint64_t v26 = v25 - 4;
          if ((v23 & 0xC000000000000001) != 0)
          {
            uint64_t v27 = specialized _ArrayBuffer._getElementSlowPath(_:)();
            uint64_t v28 = v25 - 3;
            if (__OFADD__(v26, 1)) {
              goto LABEL_70;
            }
          }
          else
          {
            uint64_t v27 = *(void *)(v23 + 8 * v25);
            swift_retain();
            uint64_t v28 = v25 - 3;
            if (__OFADD__(v26, 1))
            {
LABEL_70:
              __break(1u);
              goto LABEL_71;
            }
          }
          swift_getKeyPath();
          unint64_t v64 = v27;
          sub_10022C4F4(&qword_1002F4B90, (void (*)(uint64_t))type metadata accessor for CommittedTranslationViewModel);
          ObservationRegistrar.access<A, B>(_:keyPath:)();
          swift_release();
          id v29 = [*(id *)(v27 + 72) identifier];
          uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v32 = v31;

          id v33 = [v60 identifier];
          uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v36 = v35;

          if (v30 == v34 && v32 == v36)
          {
            swift_bridgeObjectRelease_n();
LABEL_44:
            uint64_t v2 = v54;
            uint64_t v19 = v55;
            unint64_t v18 = v59;
            swift_bridgeObjectRelease_n();
            sub_10003F29C(v60, 0);
            swift_release();

            goto LABEL_24;
          }
          char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v37) {
            goto LABEL_44;
          }
          swift_release();
          ++v25;
        }
        while (v28 != v24);
      }
    }
    else
    {
      uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (v24) {
        goto LABEL_32;
      }
    }

    swift_bridgeObjectRelease_n();
    uint64_t v2 = v54;
    uint64_t v19 = v55;
    unint64_t v18 = v59;
LABEL_24:
    if (v18 == v19) {
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
}

void sub_10022A070()
{
  sub_100029624((void *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), *(void *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24));
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v1 = dispatch thunk of TranslationStore.translations(with:)();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  unint64_t v8 = v1;
  swift_retain();
  static Published.subscript.setter();
  if (qword_1002EE628 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100011554(v2, (uint64_t)qword_10030EA80);
  swift_retain_n();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134349314;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_release();
    swift_bridgeObjectRelease();
    unint64_t v8 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    *(_WORD *)(v5 + 12) = 2082;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    unint64_t v8 = sub_100202FD4(v8, v9, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Loaded %{public}ld translations to session with ID: %{public}s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }
}

uint64_t sub_10022A3D4()
{
  uint64_t result = Notification.userInfo.getter();
  if (result)
  {
    uint64_t v1 = result;
    *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((void *)&v63 + 1) = v2;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v1 + 16) && (unint64_t v3 = sub_10020384C((uint64_t)v66), (v4 & 1) != 0))
    {
      sub_10000B170(*(void *)(v1 + 56) + 32 * v3, (uint64_t)&v63);
    }
    else
    {
      long long v63 = 0u;
      long long v64 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10006E7AC((uint64_t)v66);
    if (!*((void *)&v64 + 1)) {
      return sub_10000B070((uint64_t)&v63, (uint64_t *)&unk_1002F02C0);
    }
    sub_100048EC8(&v63, v65);
    sub_10000B170((uint64_t)v65, (uint64_t)v66);
    sub_100007620(&qword_1002FCD50);
    if (!swift_dynamicCast())
    {
      if (qword_1002EE5D8 != -1) {
LABEL_80:
      }
        swift_once();
      uint64_t v10 = type metadata accessor for Logger();
      sub_100011554(v10, (uint64_t)qword_10030E990);
      int64_t v11 = Logger.logObject.getter();
      os_log_type_t v12 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v11, v12))
      {
        BOOL v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v13 = 0;
          v13,
          2u);
        swift_slowDealloc();
      }

      return sub_10000AB68((uint64_t)v65);
    }
    uint64_t v5 = v63;
    unint64_t v6 = v63 & 0xC000000000000001;
    if ((v63 & 0xC000000000000001) != 0)
    {
      if (__CocoaSet.count.getter())
      {
LABEL_10:
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        *(void *)&long long v63 = v66[0];
        if (v6)
        {
          __CocoaSet.makeIterator()();
          type metadata accessor for PersistedTranslation();
          sub_10022C4F4(&qword_1002F4190, (void (*)(uint64_t))&type metadata accessor for PersistedTranslation);
          Set.Iterator.init(_cocoa:)();
          uint64_t v5 = v66[0];
          uint64_t v56 = v66[1];
          uint64_t v7 = v66[2];
          uint64_t v8 = v66[3];
          unint64_t v9 = v66[4];
        }
        else
        {
          uint64_t v8 = 0;
          uint64_t v14 = -1 << *(unsigned char *)(v5 + 32);
          uint64_t v56 = v5 + 56;
          uint64_t v7 = ~v14;
          uint64_t v15 = -v14;
          if (v15 < 64) {
            uint64_t v16 = ~(-1 << v15);
          }
          else {
            uint64_t v16 = -1;
          }
          unint64_t v9 = v16 & *(void *)(v5 + 56);
        }
        uint64_t v54 = v7;
        int64_t v55 = (unint64_t)(v7 + 64) >> 6;
        unint64_t v57 = (char *)&_swiftEmptyArrayStorage;
        uint64_t v58 = v5;
        if ((v5 & 0x8000000000000000) == 0) {
          goto LABEL_26;
        }
LABEL_44:
        if (__CocoaSet.Iterator.next()())
        {
          type metadata accessor for PersistedTranslation();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v23 = v62;
          swift_unknownObjectRelease();
          uint64_t v19 = v8;
          uint64_t v17 = v9;
          if (v62)
          {
            do
            {
              unint64_t v59 = v17;
              uint64_t v60 = v19;
              uint64_t v24 = v63;
              if ((unint64_t)v63 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
                if (!v25)
                {
LABEL_25:
                  swift_bridgeObjectRelease();

                  unint64_t v9 = v59;
                  uint64_t v8 = v60;
                  uint64_t v5 = v58;
                  if (v58 < 0) {
                    goto LABEL_44;
                  }
                  goto LABEL_26;
                }
              }
              else
              {
                uint64_t v25 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (!v25) {
                  goto LABEL_25;
                }
              }
              uint64_t v61 = v25;
              uint64_t v26 = 4;
              while (1)
              {
                unint64_t v27 = v26 - 4;
                id v28 = (v24 & 0xC000000000000001) != 0
                    ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
                    : *(id *)(v24 + 8 * v26);
                id v29 = v28;
                id v30 = [v28 identifier:v54];
                uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t v33 = v32;

                uint64_t v34 = v23;
                id v35 = [v23 identifier];
                uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t v38 = v37;

                if (v31 == v36 && v33 == v38) {
                  break;
                }
                char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();

                if (v40) {
                  goto LABEL_61;
                }
                uint64_t v41 = v26 - 3;
                if (__OFADD__(v27, 1))
                {
                  __break(1u);
                  goto LABEL_78;
                }
                id v23 = v34;
                ++v26;
                if (v41 == v61) {
                  goto LABEL_25;
                }
              }
              swift_bridgeObjectRelease();

              swift_bridgeObjectRelease();
LABEL_61:
              swift_bridgeObjectRelease();
              unint64_t v42 = v63;
              id v43 = v34;
              if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                || (v42 & 0x8000000000000000) != 0
                || (v42 & 0x4000000000000000) != 0)
              {
                unint64_t v42 = sub_100098590(v42);
                *(void *)&long long v63 = v42;
              }
              uint64_t v44 = v42 & 0xFFFFFFFFFFFFFF8;
              if (v27 >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
LABEL_78:
                __break(1u);
                goto LABEL_79;
              }
              uint64_t v45 = *(void **)(v44 + 8 * v26);
              *(void *)(v44 + 8 * v26) = v43;

              specialized Array._endMutation()();
              id v46 = [v43 identifier];
              uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v49 = v48;

              unint64_t v50 = v57;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v50 = sub_10020266C(0, *((void *)v57 + 2) + 1, 1, v57);
              }
              unint64_t v52 = *((void *)v50 + 2);
              unint64_t v51 = *((void *)v50 + 3);
              if (v52 >= v51 >> 1) {
                unint64_t v50 = sub_10020266C((char *)(v51 > 1), v52 + 1, 1, v50);
              }
              *((void *)v50 + 2) = v52 + 1;
              unint64_t v57 = v50;
              uint64_t v53 = &v50[16 * v52];
              *((void *)v53 + 4) = v47;
              *((void *)v53 + 5) = v49;

              uint64_t v5 = v58;
              unint64_t v9 = v59;
              uint64_t v8 = v60;
              if (v58 < 0) {
                goto LABEL_44;
              }
LABEL_26:
              if (v9)
              {
                uint64_t v17 = (v9 - 1) & v9;
                unint64_t v18 = __clz(__rbit64(v9)) | (v8 << 6);
                uint64_t v19 = v8;
              }
              else
              {
                int64_t v20 = v8 + 1;
                if (__OFADD__(v8, 1))
                {
LABEL_79:
                  __break(1u);
                  goto LABEL_80;
                }
                if (v20 >= v55) {
                  break;
                }
                unint64_t v21 = *(void *)(v56 + 8 * v20);
                uint64_t v19 = v8 + 1;
                if (!v21)
                {
                  uint64_t v19 = v8 + 2;
                  if (v8 + 2 >= v55) {
                    break;
                  }
                  unint64_t v21 = *(void *)(v56 + 8 * v19);
                  if (!v21)
                  {
                    uint64_t v19 = v8 + 3;
                    if (v8 + 3 >= v55) {
                      break;
                    }
                    unint64_t v21 = *(void *)(v56 + 8 * v19);
                    if (!v21)
                    {
                      uint64_t v19 = v8 + 4;
                      if (v8 + 4 >= v55) {
                        break;
                      }
                      unint64_t v21 = *(void *)(v56 + 8 * v19);
                      if (!v21)
                      {
                        uint64_t v22 = v8 + 5;
                        while (v55 != v22)
                        {
                          unint64_t v21 = *(void *)(v56 + 8 * v22++);
                          if (v21)
                          {
                            uint64_t v19 = v22 - 1;
                            goto LABEL_41;
                          }
                        }
                        break;
                      }
                    }
                  }
                }
LABEL_41:
                uint64_t v17 = (v21 - 1) & v21;
                unint64_t v18 = __clz(__rbit64(v21)) + (v19 << 6);
              }
              id v23 = *(id *)(*(void *)(v5 + 48) + 8 * v18);
            }
            while (v23);
          }
        }
        sub_100011710();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.setter();
        sub_1002299E4(v57);
        swift_bridgeObjectRelease();
        return sub_10000AB68((uint64_t)v65);
      }
    }
    else if (*(void *)(v63 + 16))
    {
      goto LABEL_10;
    }
    sub_10000AB68((uint64_t)v65);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10022AB78()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD__translations;
  uint64_t v2 = sub_100007620((uint64_t *)&unk_1002F9700);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10000AB68(v0 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store);
  uint64_t v3 = v0 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD__currentID;
  uint64_t v4 = sub_100007620(&qword_1002EF7B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_10022AC84()
{
  return type metadata accessor for TranslationSession_RD();
}

uint64_t type metadata accessor for TranslationSession_RD()
{
  uint64_t result = qword_1002FCBB8;
  if (!qword_1002FCBB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10022ACD8()
{
  sub_1001FE914();
  if (v0 <= 0x3F)
  {
    sub_10022ADC8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10022ADC8()
{
  if (!qword_1002EF5F8)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1002EF5F8);
    }
  }
}

uint64_t initializeWithCopy for TranslationSession_RD.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t assignWithCopy for TranslationSession_RD.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakCopyAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t initializeWithTake for TranslationSession_RD.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeInit();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t assignWithTake for TranslationSession_RD.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectWeakTakeAssign();
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t getEnumTagSinglePayload for TranslationSession_RD.Observation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 8) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TranslationSession_RD.Observation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      *(void *)(result + 8) = 1;
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationSession_RD.Observation()
{
  return &type metadata for TranslationSession_RD.Observation;
}

uint64_t sub_10022AF70@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TranslationSession_RD();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10022AFB0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_10022B030()
{
  return static Published.subscript.setter();
}

uint64_t sub_10022B0B4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10022B134()
{
  return static Published.subscript.setter();
}

unint64_t sub_10022B1B0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = static Hasher._hash(seed:_:)();
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
        uint64_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *uint64_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t result = v15 + 16 * v3;
        if (v3 < (uint64_t)v6 || result >= v15 + 16 * v6 + 16)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          BOOL v16 = v3 == v6;
          int64_t v3 = v6;
          if (v16) {
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
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10022B370(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        uint64_t result = Hasher._finalize()();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          unint64_t v11 = (unsigned char *)(v10 + v3);
          os_log_type_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *unint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *uint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    BOOL v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    BOOL v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  uint64_t *v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10022B58C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_retain();
        sub_1001302C0();
        Swift::Int v10 = Hasher._finalize()();
        uint64_t result = swift_release();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (void *)(v12 + 8 * v3);
          uint64_t v14 = (void *)(v12 + 8 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = v15 + 24 * v3;
          uint64_t v17 = (long long *)(v15 + 24 * v6);
          if (24 * v3 < (uint64_t)(24 * v6) || v16 >= (unint64_t)v17 + 24 || (v18 = v3 == v6, int64_t v3 = v6, !v18))
          {
            long long v9 = *v17;
            *(void *)(v16 + 16) = *((void *)v17 + 2);
            *(_OWORD *)unint64_t v16 = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10022B77C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    if (!(*v4 >> 62))
    {
      if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v22 < v5) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v8 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v7 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v10 = v23 + v7;
    if (!__OFADD__(v23, v7)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (*v4 >> 62) {
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v10 = v9 + v7;
  if (__OFADD__(v9, v7)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v11 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v11;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v11 & 0x8000000000000000) != 0
    || (v11 & 0x4000000000000000) != 0
    || (uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8, v10 > *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v11 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      unint64_t v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      *uint64_t v4 = v11;
      uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v14 = (void *)(v13 + 32 + 8 * v6);
  type metadata accessor for PersistedTranslation();
  swift_arrayDestroy();
  if (v7)
  {
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v16 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_17:
        if (v16 < 0)
        {
LABEL_42:
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v14 + 1);
        BOOL v18 = (char *)(v13 + 32 + 8 * v5);
        if (v14 + 1 != (void *)v18 || v17 >= &v18[8 * v16]) {
          memmove(v17, v18, 8 * v16);
        }
        if (!(v11 >> 62))
        {
          uint64_t v19 = *(void *)(v13 + 16);
          uint64_t v20 = v19 + v7;
          if (!__OFADD__(v19, v7))
          {
LABEL_23:
            *(void *)(v13 + 16) = v20;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v20 = v25 + v7;
        if (!__OFADD__(v25, v7)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v15 = *(void *)(v13 + 16);
      uint64_t v16 = v15 - v5;
      if (!__OFSUB__(v15, v5)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:
  *uint64_t v14 = v3;

  return specialized Array._endMutation()();
}

char *sub_10022BA68(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v5 = *(void **)v3;
  int64_t v6 = *(void *)(*(void *)v3 + 16);
  if (v6 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v10 > v5[3] >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    uint64_t v5 = sub_100202908(isUniquelyReferenced_nonNull_native, v13, 1, v5);
  }
  uint64_t v14 = (uint64_t)&v5[11 * a1 + 4];
  uint64_t result = (char *)swift_arrayDestroy();
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v16 = v5[2];
  BOOL v17 = __OFSUB__(v16, a2);
  uint64_t v18 = v16 - a2;
  if (v17) {
    goto LABEL_26;
  }
  if ((v18 & 0x8000000000000000) == 0)
  {
    uint64_t result = (char *)(v14 + 88);
    uint64_t v19 = (char *)&v5[11 * a2 + 4];
    if ((char *)(v14 + 88) != v19 || result >= &v19[88 * v18]) {
      uint64_t result = (char *)memmove(result, v19, 88 * v18);
    }
    uint64_t v20 = v5[2];
    BOOL v17 = __OFADD__(v20, v9);
    uint64_t v21 = v20 + v9;
    if (!v17)
    {
      v5[2] = v21;
LABEL_20:
      long long v22 = *(_OWORD *)(a3 + 48);
      *(_OWORD *)(v14 + 32) = *(_OWORD *)(a3 + 32);
      *(_OWORD *)(v14 + 48) = v22;
      *(_OWORD *)(v14 + 64) = *(_OWORD *)(a3 + 64);
      *(void *)(v14 + 80) = *(void *)(a3 + 80);
      long long v23 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)a3;
      *(_OWORD *)(v14 + 16) = v23;
      *(void *)uint64_t v3 = v5;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10022BC10(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  unint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v10 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    unint64_t v5 = sub_100202FA0(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *uint64_t v3 = v5;
  }
  uint64_t v14 = *(void *)(type metadata accessor for StreamingRequestInfo(0) - 8);
  unint64_t v15 = v5 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  uint64_t v16 = *(void *)(v14 + 72);
  uint64_t v17 = v15 + v16 * a1;
  swift_arrayDestroy();
  if (!v9) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v5 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_33;
  }
  if (v19 < 0)
  {
LABEL_35:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  unint64_t v20 = v17 + v16;
  unint64_t v21 = v15 + v16 * a2;
  if (v17 + v16 < v21 || v20 >= v21 + v19 * v16)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v20 != v21)
  {
    swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v23 = *(void *)(v5 + 16);
  BOOL v24 = __OFADD__(v23, v9);
  uint64_t v25 = v23 + v9;
  if (v24)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(void *)(v5 + 16) = v25;
LABEL_25:
  if (v16 >= 1) {
    sub_1000B63E4(a3, v17);
  }
  return sub_10000B070(a3, &qword_1002FB720);
}

uint64_t sub_10022BE1C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v34 = a5;
  uint64_t v32 = a4;
  int v33 = a3;
  uint64_t v14 = (void *)a9;
  uint64_t v15 = sub_100007620((uint64_t *)&unk_1002F33E0);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DispatchPredicate();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  unint64_t v21 = (uint64_t *)((char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37[3] = a6;
  v37[4] = a8;
  long long v22 = sub_100014830(v37);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(v22, a1, a6);
  v36[3] = a7;
  v36[4] = a9;
  uint64_t v23 = sub_100014830(v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 16))(v23, a2, a7);
  sub_100022324();
  *unint64_t v21 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v19 + 104))(v21, enum case for DispatchPredicate.onQueue(_:), v18);
  uint64_t v24 = _dispatchPreconditionTest(_:)();
  uint64_t v26 = *(void (**)(uint64_t *, uint64_t))(v19 + 8);
  uint64_t v25 = (void (*)(uint64_t *, void))(v19 + 8);
  v26(v21, v18);
  if (v24)
  {
    sub_100029624((void *)(v34 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), *(void *)(v34 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24));
    uint64_t v14 = (void *)dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)();
    if (!v14)
    {
LABEL_5:
      sub_10000AB68((uint64_t)v37);
      sub_10000AB68((uint64_t)v36);
      return (uint64_t)v14;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    NSString v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v14 setSessionID:v27];

    sub_100021C4C(v32, (uint64_t)v17);
    dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v24 = v14;
    uint64_t v25 = (void (*)(uint64_t *, void))static Published.subscript.modify();
    if (!(*v28 >> 62))
    {
LABEL_4:
      sub_10022B77C(0, 0, v24);
      v25(&v35, 0);
      swift_release();
      swift_release();
      goto LABEL_5;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v30 & 0x8000000000000000) == 0) {
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_10022C1C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = sub_10022BE1C(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  if (v10)
  {
    sub_100029624((void *)(a5 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), *(void *)(a5 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24));
    dispatch thunk of TranslationStore.save()();
  }
  return v10;
}

uint64_t sub_10022C244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007620(&qword_1002FCD58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10022C2AC(uint64_t a1, uint64_t a2)
{
  return sub_10022C554(a1, a2, (void (*)(void))&type metadata accessor for PersistedTranslation);
}

void *sub_10022C2C4(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  uint64_t v24 = &_swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      uint64_t v22 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v23 = v3 & 0xC000000000000001;
      uint64_t v20 = v4;
      unint64_t v21 = (void **)(v3 + 32);
      uint64_t v19 = a2 + 7;
      while (1)
      {
        if (v23)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v5 >= *(void *)(v22 + 16))
          {
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          id v6 = v21[v5];
        }
        uint64_t v7 = v6;
        if (__OFADD__(v5++, 1)) {
          goto LABEL_31;
        }
        id v9 = [v6 identifier];
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v3 = (unint64_t)v11;

        uint64_t v12 = (void *)a2[2];
        if (v12) {
          break;
        }

        swift_bridgeObjectRelease();
LABEL_5:
        if (v5 == v4) {
          return v24;
        }
      }
      int64_t v13 = a2;
      BOOL v14 = a2[4] == v10 && a2[5] == v3;
      if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        break;
      }
      if (v12 == (void *)1)
      {
LABEL_27:

        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      uint64_t v15 = v19;
      uint64_t v16 = 1;
      while (1)
      {
        a2 = (void *)(v16 + 1);
        if (__OFADD__(v16, 1)) {
          break;
        }
        BOOL v17 = *(v15 - 1) == v10 && *v15 == v3;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_16;
        }
        v15 += 2;
        ++v16;
        if (a2 == v12) {
          goto LABEL_27;
        }
      }
LABEL_32:
      __break(1u);
LABEL_33:
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }
LABEL_16:
    swift_bridgeObjectRelease();
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    unint64_t v3 = (unint64_t)&v24;
    specialized ContiguousArray._endMutation()();
LABEL_17:
    uint64_t v4 = v20;
    a2 = v13;
    goto LABEL_5;
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10022C4F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10022C53C(uint64_t a1, uint64_t a2)
{
  return sub_10022C554(a1, a2, (void (*)(void))type metadata accessor for LanguageAwareTextViewSizeThatFitsCache.Condition);
}

uint64_t sub_10022C554(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    id v6 = a3;
    uint64_t v3 = a2;
    uint64_t v5 = a1;
    if (!(*v4 >> 62))
    {
      if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v20 < v3) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v8 = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v7 = v5 - v3;
  if (__OFSUB__(0, v8))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v10 = v21 + v7;
    if (!__OFADD__(v21, v7)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (*v4 >> 62) {
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v10 = v9 - v8;
  if (__OFADD__(v9, v7)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v11 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v11;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v11 & 0x8000000000000000) != 0
    || (v11 & 0x4000000000000000) != 0
    || (uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8, v10 > *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v11 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      unint64_t v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      *uint64_t v4 = v11;
      uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  v6(0);
  swift_arrayDestroy();
  if (v7)
  {
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v15 = v22 - v3;
      if (!__OFSUB__(v22, v3))
      {
LABEL_17:
        if (v15 < 0)
        {
LABEL_42:
          uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
          __break(1u);
          return result;
        }
        uint64_t v16 = (const void *)(v13 + 32 + 8 * v3);
        if (v5 != v3 || v13 + 32 + 8 * v5 >= (unint64_t)v16 + 8 * v15) {
          memmove((void *)(v13 + 32 + 8 * v5), v16, 8 * v15);
        }
        if (!(v11 >> 62))
        {
          uint64_t v17 = *(void *)(v13 + 16);
          uint64_t v18 = v17 + v7;
          if (!__OFADD__(v17, v7))
          {
LABEL_23:
            *(void *)(v13 + 16) = v18;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        uint64_t v18 = v23 + v7;
        if (!__OFADD__(v23, v7)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v14 = *(void *)(v13 + 16);
      uint64_t v15 = v14 - v3;
      if (!__OFSUB__(v14, v3)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:

  return specialized Array._endMutation()();
}

uint64_t sub_10022C83C()
{
  uint64_t v88 = type metadata accessor for DispatchPredicate();
  uint64_t v93 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v87 = (uint64_t *)((char *)&v63 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = sub_100007620((uint64_t *)&unk_1002F33E0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  id v71 = (uint64_t *)((char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v79 = (uint64_t)&v63 - v6;
  __chkstk_darwin(v5);
  uint64_t v65 = (char *)&v63 - v7;
  uint64_t v94 = type metadata accessor for StoredTranslationResult();
  CGFloat v92 = *(char **)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v95 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = type metadata accessor for SpeechResultOrigin();
  unint64_t v86 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  double v85 = (void (**)(uint64_t *, char *, uint64_t))((char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = type metadata accessor for Locale();
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for StoredSpeechResult();
  uint64_t v66 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  unint64_t v90 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v0 + 64);
  uint64_t v15 = *(void *)(v14 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24);
  uint64_t v80 = (void *)(v14 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store);
  sub_100029624((void *)(v14 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), v15);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v100 = &_swiftEmptyArrayStorage;
  swift_retain();
  static Published.subscript.setter();
  uint64_t v72 = v14;
  *(void *)(v14 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_lidDisambiguationCounter) = 0;
  uint64_t v16 = *(void *)(v0 + 72);
  uint64_t v17 = *(void *)(v16 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24);
  unsigned __int8 v78 = (void *)(v16 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store);
  sub_100029624((void *)(v16 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), v17);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t v18 = (void (*)(uint64_t *, void))v65;
  swift_release();
  dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)();
  uint64_t KeyPath = (uint64_t *)&unk_1002F33E0;
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v100 = &_swiftEmptyArrayStorage;
  swift_retain();
  static Published.subscript.setter();
  uint64_t v70 = v16;
  *(void *)(v16 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_lidDisambiguationCounter) = 0;
  Locale.init(identifier:)();
  (*(void (**)(void *, void, uint64_t))(v86 + 104))(v85, enum case for SpeechResultOrigin.text(_:), v91);
  uint64_t v68 = v12;
  StoredSpeechResult.init(text:sanitizedText:locale:origin:)();
  unint64_t v86 = sub_100022324();
  unint64_t v20 = 0;
  double v85 = (void (**)(uint64_t *, char *, uint64_t))(v66 + 16);
  char v84 = (uint64_t *)(v92 + 16);
  unsigned int v83 = enum case for DispatchPredicate.onQueue(_:);
  double v82 = (void (**)(uint64_t *, void, uint64_t))(v93 + 104);
  uint64_t v81 = (void (**)(uint64_t *, uint64_t))(v93 + 8);
  uint64_t v67 = (void (**)(char *, uint64_t))(v92 + 8);
LABEL_3:
  if (v20 < 3)
  {
    unint64_t v69 = v20 + 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Locale.init(identifier:)();
    StoredTranslationResult.init(text:locale:isOffline:romanization:)();
    uint64_t v93 = type metadata accessor for UUID();
    uint64_t v21 = *(void *)(v93 - 8);
    uint64_t v22 = *(char **)(v21 + 56);
    uint64_t v91 = v21 + 56;
    CGFloat v92 = v22;
    uint64_t v23 = 3;
    while (1)
    {
      ((void (*)(void (*)(uint64_t *, void), uint64_t, uint64_t, uint64_t))v92)(v18, 1, 1, v93);
      uint64_t v24 = v89;
      uint64_t v101 = v89;
      uint64_t v25 = sub_1000ECE9C(&qword_1002F0F78, (void (*)(uint64_t))&type metadata accessor for StoredSpeechResult);
      uint64_t v102 = v25;
      uint64_t v26 = sub_100014830((uint64_t *)&v100);
      NSString v27 = *v85;
      (*v85)(v26, v90, v24);
      uint64_t v28 = v94;
      uint64_t v98 = v94;
      uint64_t v29 = sub_1000ECE9C((unint64_t *)&unk_1002F96D0, (void (*)(uint64_t))&type metadata accessor for StoredTranslationResult);
      uint64_t v99 = v29;
      uint64_t v30 = sub_100014830(&v97);
      uint64_t v77 = *v84;
      ((void (*)(uint64_t *, char *, uint64_t))v77)(v30, v95, v28);
      uint64_t v31 = static OS_dispatch_queue.main.getter();
      uint64_t v32 = v87;
      *uint64_t v87 = v31;
      uint64_t v33 = v88;
      id v76 = *v82;
      v76(v32, v83, v88);
      LOBYTE(v28) = _dispatchPreconditionTest(_:)();
      uint64_t v34 = *v81;
      (*v81)(v32, v33);
      if ((v28 & 1) == 0) {
        break;
      }
      sub_100029624(v80, v80[3]);
      uint64_t v35 = dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)();
      if (!v35) {
        goto LABEL_26;
      }
      uint64_t v36 = (void *)v35;
      uint64_t v74 = v25;
      id v75 = v27;
      uint64_t v73 = v23;
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      NSString v37 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v36 setSessionID:v37];

      sub_10000C3A4((uint64_t)v18, v79, KeyPath);
      dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter();
      swift_getKeyPath();
      uint64_t v38 = KeyPath;
      uint64_t KeyPath = (uint64_t *)swift_getKeyPath();
      id v39 = v36;
      uint64_t v40 = (uint64_t)v18;
      uint64_t v18 = (void (*)(uint64_t *, void))static Published.subscript.modify();
      uint64_t v42 = *v41;
      if ((unint64_t)*v41 >> 62)
      {
        uint64_t v60 = v42 & 0xFFFFFFFFFFFFFF8;
        if (v42 < 0) {
          uint64_t v60 = *v41;
        }
        uint64_t v64 = v60;
        swift_bridgeObjectRetain();
        uint64_t v64 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v64 < 0) {
          goto LABEL_23;
        }
      }
      sub_10022B77C(0, 0, (uint64_t)v39);
      v18(&v96, 0);
      swift_release();
      swift_release();
      sub_10000AB68((uint64_t)&v100);
      sub_10000AB68((uint64_t)&v97);
      sub_10000B070(v40, v38);
      sub_100029624(v80, v80[3]);
      dispatch thunk of TranslationStore.toggleFavorite(_:)();
      uint64_t KeyPath = v71;
      ((void (*)(uint64_t *, uint64_t, uint64_t, uint64_t))v92)(v71, 1, 1, v93);
      uint64_t v43 = v89;
      uint64_t v101 = v89;
      uint64_t v102 = v74;
      uint64_t v44 = sub_100014830((uint64_t *)&v100);
      v75(v44, v90, v43);
      uint64_t v45 = v94;
      uint64_t v98 = v94;
      uint64_t v99 = v29;
      id v46 = sub_100014830(&v97);
      ((void (*)(uint64_t *, char *, uint64_t))v77)(v46, v95, v45);
      uint64_t v47 = static OS_dispatch_queue.main.getter();
      uint64_t v48 = v87;
      *uint64_t v87 = v47;
      uint64_t v49 = v88;
      v76(v48, v83, v88);
      char v50 = _dispatchPreconditionTest(_:)();
      v34(v48, v49);
      if ((v50 & 1) == 0) {
        goto LABEL_24;
      }
      sub_100029624(v78, v78[3]);
      uint64_t v51 = dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)();
      if (!v51) {
        goto LABEL_27;
      }
      unint64_t v52 = (void *)v51;
      uint64_t v53 = v39;
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      NSString v54 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v52 setSessionID:v54];

      sub_10000C3A4((uint64_t)KeyPath, v79, v38);
      dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter();
      swift_getKeyPath();
      swift_getKeyPath();
      id v55 = v52;
      uint64_t v56 = (uint64_t)KeyPath;
      uint64_t v58 = (void (*)(uint64_t *, void))static Published.subscript.modify();
      uint64_t v59 = *v57;
      if ((unint64_t)*v57 >> 62)
      {
        uint64_t v61 = v59 & 0xFFFFFFFFFFFFFF8;
        if (v59 < 0) {
          uint64_t v61 = *v57;
        }
        uint64_t v77 = v61;
        swift_bridgeObjectRetain();
        uint64_t v77 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v77 < 0)
        {
          __break(1u);
LABEL_21:
          sub_100007620(&qword_1002FCF60);
          swift_arrayDestroy();
          return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v90, v89);
        }
      }
      sub_10022B77C(0, 0, (uint64_t)v55);
      v58(&v96, 0);
      swift_release();
      swift_release();
      sub_10000AB68((uint64_t)&v100);
      sub_10000AB68((uint64_t)&v97);
      sub_10000B070(v56, v38);
      sub_100029624(v78, v78[3]);
      dispatch thunk of TranslationStore.toggleFavorite(_:)();

      uint64_t v23 = v73 - 1;
      uint64_t KeyPath = v38;
      uint64_t v18 = (void (*)(uint64_t *, void))v40;
      if (v73 == 1)
      {
        (*v67)(v95, v94);
        unint64_t v20 = v69;
        if (v69 != 3) {
          goto LABEL_3;
        }
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  __break(1u);
LABEL_26:
  sub_10000AB68((uint64_t)&v100);
  sub_10000AB68((uint64_t)&v97);
  sub_10000B070((uint64_t)v18, (uint64_t *)&unk_1002F33E0);
  __break(1u);
LABEL_27:
  sub_10000AB68((uint64_t)&v100);
  sub_10000AB68((uint64_t)&v97);
  uint64_t result = sub_10000B070((uint64_t)KeyPath, (uint64_t *)&unk_1002F33E0);
  __break(1u);
  return result;
}

uint64_t sub_10022D688(uint64_t a1)
{
  uint64_t v52 = type metadata accessor for DispatchPredicate();
  uint64_t v37 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v4 = (uint64_t *)((char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100007620((uint64_t *)&unk_1002F33E0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v41 = (uint64_t)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v42 = (char *)&v36 - v8;
  uint64_t v56 = type metadata accessor for StoredTranslationResult();
  uint64_t v39 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = type metadata accessor for SpeechResultOrigin();
  uint64_t v53 = *(char **)(v55 - 8);
  __chkstk_darwin(v55);
  char v50 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Locale();
  __chkstk_darwin(v12 - 8);
  uint64_t v54 = type metadata accessor for StoredSpeechResult();
  uint64_t v38 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v1 + 64);
  uint64_t v16 = *(void *)(v15 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24);
  uint64_t v49 = *(void *)(v15 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 32);
  uint64_t v51 = (void *)(v15 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store);
  sub_100029624((void *)(v15 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), v16);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  v59[0] = (uint64_t)_swiftEmptyArrayStorage;
  swift_retain();
  static Published.subscript.setter();
  uint64_t v40 = v15;
  *(void *)(v15 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_lidDisambiguationCounter) = 0;
  Locale.init(identifier:)();
  (*((void (**)(char *, void, uint64_t))v53 + 13))(v50, enum case for SpeechResultOrigin.text(_:), v55);
  uint64_t v53 = v14;
  StoredSpeechResult.init(text:sanitizedText:locale:origin:)();
  Locale.init(identifier:)();
  uint64_t v55 = (uint64_t)v10;
  uint64_t result = StoredTranslationResult.init(text:locale:isOffline:romanization:)();
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = (uint64_t)v42;
    if (!a1)
    {
LABEL_15:
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v55, v56);
      return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v53, v54);
    }
    char v50 = (char *)sub_100022324();
    uint64_t v49 = type metadata accessor for UUID();
    uint64_t v19 = *(void *)(v49 - 8);
    uint64_t v48 = (void (**)(uint64_t *, char *, uint64_t))(v38 + 16);
    uint64_t v47 = (void (**)(uint64_t *, uint64_t, uint64_t))(v39 + 16);
    id v46 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    uint64_t v45 = v19 + 56;
    uint64_t v44 = (void (**)(uint64_t *, void, uint64_t))(v37 + 104);
    unsigned int v43 = enum case for DispatchPredicate.onQueue(_:);
    unint64_t v20 = (uint64_t *)&unk_1002F33E0;
    uint64_t v21 = (uint64_t (**)(uint64_t *, uint64_t))(v37 + 8);
    v46(v18, 1, 1, v49);
    while (1)
    {
      uint64_t v22 = v54;
      v59[3] = v54;
      v59[4] = sub_1000ECE9C(&qword_1002F0F78, (void (*)(uint64_t))&type metadata accessor for StoredSpeechResult);
      uint64_t v23 = sub_100014830(v59);
      (*v48)(v23, v53, v22);
      uint64_t v24 = v56;
      v58[3] = v56;
      v58[4] = sub_1000ECE9C((unint64_t *)&unk_1002F96D0, (void (*)(uint64_t))&type metadata accessor for StoredTranslationResult);
      uint64_t v25 = sub_100014830(v58);
      (*v47)(v25, v55, v24);
      *uint64_t v4 = static OS_dispatch_queue.main.getter();
      uint64_t v26 = v52;
      (*v44)(v4, v43, v52);
      LOBYTE(v24) = _dispatchPreconditionTest(_:)();
      uint64_t result = (*v21)(v4, v26);
      if ((v24 & 1) == 0) {
        break;
      }
      sub_100029624(v51, v51[3]);
      uint64_t v27 = dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)();
      if (v27)
      {
        uint64_t v28 = (void *)v27;
        swift_getKeyPath();
        swift_getKeyPath();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        NSString v29 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        [v28 setSessionID:v29];

        uint64_t v30 = v20;
        sub_10000C3A4(v18, v41, v20);
        dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter();
        swift_getKeyPath();
        swift_getKeyPath();
        id v31 = v28;
        uint64_t v33 = (void (*)(uint64_t *, void))static Published.subscript.modify();
        uint64_t v34 = *v32;
        if ((unint64_t)*v32 >> 62)
        {
          uint64_t v35 = v34 & 0xFFFFFFFFFFFFFF8;
          if (v34 < 0) {
            uint64_t v35 = *v32;
          }
          uint64_t v37 = v35;
          swift_bridgeObjectRetain();
          uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v37 < 0)
          {
            __break(1u);
            goto LABEL_15;
          }
        }
        sub_10022B77C(0, 0, (uint64_t)v31);
        v33(&v57, 0);
        swift_release();
        swift_release();
        sub_10000AB68((uint64_t)v59);
        sub_10000AB68((uint64_t)v58);

        uint64_t v18 = (uint64_t)v42;
        unint64_t v20 = v30;
      }
      else
      {
        sub_10000AB68((uint64_t)v59);
        sub_10000AB68((uint64_t)v58);
      }
      sub_10000B070(v18, v20);
      if (!--a1) {
        goto LABEL_15;
      }
      v46(v18, 1, 1, v49);
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10022DF78(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = sub_100007620(&qword_1002FCF58);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SELFLoggingInvocationDescription();
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v49 - v10;
  uint64_t v12 = sub_100007620(&qword_1002F8BA0);
  __chkstk_darwin(v12 - 8);
  uint64_t v54 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v58 = *(void *)(v14 - 8);
  uint64_t v59 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v55 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v56 = (char *)&v49 - v17;
  if (qword_1002EE628 != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  sub_100011554(v18, (uint64_t)qword_10030EA80);
  swift_retain_n();
  uint64_t v19 = Logger.logObject.getter();
  int v20 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    char v50 = v19;
    LODWORD(v53) = v20;
    uint64_t v21 = (_WORD *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    v69[0] = v52;
    *(_DWORD *)uint64_t v21 = 136446466;
    swift_beginAccess();
    uint64_t v23 = v2[12];
    unint64_t v22 = v2[13];
    id v62 = (id)v2[10];
    id v51 = v62;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_getAtKeyPath();
    unint64_t v24 = v66;
    if (v66)
    {
      uint64_t v23 = v65;
      swift_release();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_release();

      unint64_t v24 = v22;
    }
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v65 = sub_100202FD4(v23, v24, v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    id v51 = v21;
    v21[6] = 2082;
    swift_beginAccess();
    uint64_t v26 = v2[17];
    unint64_t v25 = v2[18];
    id v64 = (id)v2[15];
    id v27 = v64;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_getAtKeyPath();
    unint64_t v28 = v66;
    if (v66)
    {
      uint64_t v26 = v65;
      swift_release();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_release();

      unint64_t v28 = v25;
    }
    NSString v29 = v50;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v30 = (uint8_t *)v51;
    uint64_t v65 = sub_100202FD4(v26, v28, v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v53, "Suspending sessions with IDs; TranslateTab: %{public}s, ConversationTab: %{public}s",
      v30,
      0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  id v31 = (char *)v2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager_selfLoggingInvocationsHolders;
  swift_beginAccess();
  uint64_t v32 = *(void *)v31;
  uint64_t v33 = *(void *)(*(void *)v31 + 16);
  if (v33)
  {
    uint64_t v53 = v2;
    uint64_t v34 = v32 + 32;
    uint64_t v35 = (unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48);
    uint64_t v52 = v32;
    swift_bridgeObjectRetain();
    uint64_t v36 = _swiftEmptyArrayStorage;
    do
    {
      sub_1000295C0(v34, (uint64_t)&v65);
      uint64_t v38 = v67;
      uint64_t v37 = v68;
      sub_100029624(&v65, v67);
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v37);
      sub_10000AB68((uint64_t)&v65);
      if ((*v35)(v5, 1, v61) == 1)
      {
        sub_10000B070((uint64_t)v5, &qword_1002FCF58);
      }
      else
      {
        sub_1002300E4((uint64_t)v5, (uint64_t)v11);
        sub_1002300E4((uint64_t)v11, (uint64_t)v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v36 = (void *)sub_100202F6C(0, v36[2] + 1, 1, (unint64_t)v36);
        }
        unint64_t v40 = v36[2];
        unint64_t v39 = v36[3];
        if (v40 >= v39 >> 1) {
          uint64_t v36 = (void *)sub_100202F6C(v39 > 1, v40 + 1, 1, (unint64_t)v36);
        }
        v36[2] = v40 + 1;
        sub_1002300E4((uint64_t)v9, (uint64_t)v36+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v40);
      }
      v34 += 40;
      --v33;
    }
    while (v33);
    swift_bridgeObjectRelease();
    uint64_t v2 = v53;
  }
  else
  {
    uint64_t v36 = _swiftEmptyArrayStorage;
  }
  swift_beginAccess();
  uint64_t v63 = v36;
  id v64 = v36;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_setAtWritableKeyPath();
  swift_release();
  PassthroughSubject.send(_:)();
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v41 = v58;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
  unsigned int v43 = v56;
  uint64_t v44 = v59;
  v42(v56, v57, v59);
  uint64_t v45 = v55;
  v42(v55, (uint64_t)v43, v44);
  swift_beginAccess();
  id v46 = v54;
  v42(v54, (uint64_t)v45, v44);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v46, 0, 1, v44);
  swift_retain();
  swift_setAtWritableKeyPath();
  swift_release();
  sub_100007620(&qword_1002F96E8);
  PassthroughSubject.send(_:)();
  uint64_t v47 = *(void (**)(char *, uint64_t))(v41 + 8);
  v47(v45, v44);
  swift_endAccess();
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v47)(v43, v44);
  *((unsigned char *)v2 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager_isSuspended) = 1;
  return result;
}

void sub_10022E7FC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100007620(&qword_1002F8BA0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  os_log_t v78 = (os_log_t)((char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v66 - v9;
  uint64_t v11 = sub_100007620(&qword_1002F96E8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (void **)((char *)&v66 - v15);
  uint64_t v17 = type metadata accessor for Date();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v77 = (char *)&v66 - v21;
  __chkstk_darwin(v20);
  unint64_t v24 = (char *)&v66 - v23;
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager_isSuspended) == 1)
  {
    uint64_t v71 = OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager_isSuspended;
    uint64_t v73 = v22;
    uint64_t v75 = a1;
    uint64_t v76 = v11;
    uint64_t v25 = v3 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager__sessionSuspension_RD;
    swift_beginAccess();
    uint64_t v72 = v25;
    sub_10000C3A4(v25, (uint64_t)v16, &qword_1002F96E8);
    id v82 = *v16;
    id v26 = v82;
    uint64_t v74 = v18;
    id v27 = v26;
    swift_getAtKeyPath();

    uint64_t v28 = v74;
    sub_10000C3A4((uint64_t)v16, (uint64_t)v14, &qword_1002F96E8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v10, 1, v17) == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v24, &v14[*(int *)(v76 + 32)], v17);
      sub_10000B070((uint64_t)v14, &qword_1002F96E8);
      sub_10000B070((uint64_t)v10, &qword_1002F8BA0);
    }
    else
    {
      sub_10000B070((uint64_t)v14, &qword_1002F96E8);
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v24, v10, v17);
    }
    uint64_t v33 = v75;
    sub_10000B070((uint64_t)v16, &qword_1002F96E8);
    Date.timeIntervalSince(_:)();
    double v35 = v34;
    uint64_t v36 = *(void (**)(char *, uint64_t))(v28 + 8);
    uint64_t v70 = v28 + 8;
    unint64_t v69 = v36;
    v36(v24, v17);
    if (*(double *)(v3 + 16) >= v35)
    {
      if (a2)
      {
        if (qword_1002EE628 != -1) {
          swift_once();
        }
        uint64_t v41 = type metadata accessor for Logger();
        sub_100011554(v41, (uint64_t)qword_10030EA80);
        uint64_t v42 = Logger.logObject.getter();
        os_log_type_t v43 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v44 = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Session is resuming within the time limit on first launch", v44, 2u);
          swift_slowDealloc();
        }

        sub_10022F8C4();
      }
    }
    else
    {
      if (qword_1002EE628 != -1) {
        swift_once();
      }
      uint64_t v37 = type metadata accessor for Logger();
      sub_100011554(v37, (uint64_t)qword_10030EA80);
      uint64_t v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v38, v39))
      {
        unint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Session was timed-out when resuming", v40, 2u);
        swift_slowDealloc();
      }

      sub_10022FB7C();
      sub_10022F2A4();
    }
    if (qword_1002EE628 != -1) {
      swift_once();
    }
    uint64_t v45 = type metadata accessor for Logger();
    sub_100011554(v45, (uint64_t)qword_10030EA80);
    swift_retain_n();
    id v46 = Logger.logObject.getter();
    int v47 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v46, (os_log_type_t)v47))
    {
      int v67 = v47;
      uint64_t v48 = swift_slowAlloc();
      unint64_t v66 = (void *)swift_slowAlloc();
      uint64_t v81 = v66;
      *(_DWORD *)uint64_t v48 = 136446466;
      swift_beginAccess();
      uint64_t v49 = *(void *)(v3 + 96);
      unint64_t v50 = *(void *)(v3 + 104);
      id v79 = *(id *)(v3 + 80);
      id v51 = v79;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_getAtKeyPath();
      unint64_t v52 = v83;
      uint64_t v68 = v17;
      if (v83)
      {
        uint64_t v49 = (uint64_t)v82;
        swift_release();
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_release();

        unint64_t v52 = v50;
      }
      swift_release();
      swift_bridgeObjectRelease();
      id v82 = (id)sub_100202FD4(v49, v52, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2082;
      swift_beginAccess();
      uint64_t v56 = *(void *)(v3 + 136);
      unint64_t v57 = *(void *)(v3 + 144);
      uint64_t v54 = v3;
      id v80 = *(id *)(v3 + 120);
      id v58 = v80;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_getAtKeyPath();
      unint64_t v59 = v83;
      uint64_t v55 = v68;
      if (v83)
      {
        uint64_t v56 = (uint64_t)v82;
        swift_release();
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_release();

        unint64_t v59 = v57;
      }
      swift_release();
      swift_bridgeObjectRelease();
      id v82 = (id)sub_100202FD4(v56, v59, (uint64_t *)&v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v67, "Resuming sessions with IDs; TranslateTab: %{public}s, ConversationTab: %{public}s",
        (uint8_t *)v48,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v28 = v74;
      uint64_t v33 = v75;
    }
    else
    {
      uint64_t v53 = v17;
      uint64_t v54 = v3;
      uint64_t v55 = v53;

      swift_release_n();
    }
    *(unsigned char *)(v54 + v71) = 0;
    uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
    uint64_t v61 = v28;
    id v62 = v77;
    v60(v77, v33, v55);
    uint64_t v63 = v73;
    v60(v73, (uint64_t)v62, v55);
    swift_beginAccess();
    os_log_t v64 = v78;
    v60((char *)v78, (uint64_t)v63, v55);
    (*(void (**)(os_log_t, void, uint64_t, uint64_t))(v61 + 56))(v64, 0, 1, v55);
    swift_retain();
    swift_setAtWritableKeyPath();
    swift_release();
    PassthroughSubject.send(_:)();
    uint64_t v65 = v69;
    v69(v63, v55);
    swift_endAccess();
    v65(v62, v55);
    swift_beginAccess();
    id v80 = &_swiftEmptyArrayStorage;
    uint64_t v81 = &_swiftEmptyArrayStorage;
    swift_retain();
    swift_setAtWritableKeyPath();
    swift_release();
    PassthroughSubject.send(_:)();
    swift_endAccess();
  }
  else
  {
    if (qword_1002EE628 != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    sub_100011554(v29, (uint64_t)qword_10030EA80);
    os_log_t v78 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v78, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, v30, "Trying to resume but not suspended", v31, 2u);
      swift_slowDealloc();
    }
    os_log_t v32 = v78;
  }
}

uint64_t sub_10022F2A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1002EE628 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100011554(v6, (uint64_t)qword_10030EA80);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Preparing new sessions", v9, 2u);
    swift_slowDealloc();
  }

  UUID.init()();
  uint64_t v10 = (void *)UUID.uuidString.getter();
  uint64_t v12 = v11;
  uint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v5, v2);
  swift_beginAccess();
  id v31 = v10;
  uint64_t v32 = v12;
  uint64_t v29 = v10;
  uint64_t v30 = v12;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_setAtWritableKeyPath();
  swift_release();
  PassthroughSubject.send(_:)();
  swift_bridgeObjectRelease();
  swift_endAccess();
  UUID.init()();
  uint64_t v14 = (void *)UUID.uuidString.getter();
  uint64_t v16 = v15;
  v13(v5, v2);
  swift_beginAccess();
  id v31 = v14;
  uint64_t v32 = v16;
  uint64_t v29 = v14;
  uint64_t v30 = v16;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_setAtWritableKeyPath();
  swift_release();
  PassthroughSubject.send(_:)();
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v17 = v1[8];
  uint64_t v19 = (void *)v1[12];
  uint64_t v18 = v1[13];
  id v31 = (id)v1[10];
  id v20 = v31;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_getAtKeyPath();
  uint64_t v21 = v34;
  if (v34)
  {
    uint64_t v19 = v33;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_release();

    uint64_t v21 = v18;
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v33 = v19;
  uint64_t v34 = v21;
  swift_retain();
  static Published.subscript.setter();
  uint64_t v22 = v1[9];
  unint64_t v24 = (void *)v1[17];
  uint64_t v23 = v1[18];
  id v31 = (id)v1[15];
  id v25 = v31;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_getAtKeyPath();
  uint64_t v26 = v34;
  if (v34)
  {
    unint64_t v24 = v33;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_release();

    uint64_t v26 = v23;
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v33 = v24;
  uint64_t v34 = v26;
  swift_retain();
  static Published.subscript.setter();
  sub_100029624(v1 + 3, v1[6]);
  dispatch thunk of TranslationStore.clearHistory(completion:)();
  sub_100029624((void *)(v17 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), *(void *)(v17 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24));
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v33 = &_swiftEmptyArrayStorage;
  swift_retain();
  static Published.subscript.setter();
  *(void *)(v17 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_lidDisambiguationCounter) = 0;
  sub_100029624((void *)(v22 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store), *(void *)(v22 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_store + 24));
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v33 = &_swiftEmptyArrayStorage;
  swift_retain();
  uint64_t result = static Published.subscript.setter();
  *(void *)(v22 + OBJC_IVAR____TtC17SequoiaTranslator21TranslationSession_RD_lidDisambiguationCounter) = 0;
  return result;
}

void sub_10022F8C4()
{
  uint64_t v1 = v0;
  if (qword_1002EE628 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100011554(v2, (uint64_t)qword_10030EA80);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Loading sessions with translations", v5, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  id v6 = *(id *)(v1 + 80);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_getAtKeyPath();
  if (!v9) {
    swift_bridgeObjectRetain();
  }
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.setter();
  swift_beginAccess();
  id v7 = *(id *)(v1 + 120);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_getAtKeyPath();
  if (!v8) {
    swift_bridgeObjectRetain();
  }
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.setter();
  sub_10022A070();
  sub_10022A070();
}

uint64_t sub_10022FB7C()
{
  uint64_t v1 = type metadata accessor for SELFLoggingInvocationDescription();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  os_log_type_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager__lastSELFLoggingInvocations;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v5 + 16);
  v29[0] = *(id *)v5;
  id v7 = v29[0];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_getAtKeyPath();
  uint64_t v8 = v32;
  if (v32)
  {
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_release();

    uint64_t v8 = v6;
  }
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v28 = v0;
    uint64_t v10 = self;
    uint64_t v11 = v8 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)(v2 + 72);
    v27[1] = v12;
    swift_bridgeObjectRetain();
    do
    {
      sub_1001A0AF8(v11, (uint64_t)v4);
      id v14 = objc_allocWithZone((Class)_LTLocalePair);
      Class isa = Locale._bridgeToObjectiveC()().super.isa;
      Class v16 = Locale._bridgeToObjectiveC()().super.isa;
      id v17 = [v14 initWithSourceLocale:isa targetLocale:v16];

      Class v18 = UUID._bridgeToObjectiveC()().super.isa;
      NSString v19 = String._bridgeToObjectiveC()();
      [v10 userEndedTypingWithInvocationId:v18 payload:v19 localePair:v17 reason:2];

      sub_1001A0B5C((uint64_t)v4);
      v11 += v13;
      --v9;
    }
    while (v9);
    swift_bridgeObjectRelease_n();
    uint64_t v0 = v28;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v20 = (uint64_t *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager_selfLoggingInvocationsHolders);
  uint64_t result = swift_beginAccess();
  uint64_t v22 = *v20;
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    uint64_t v24 = v22 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_1000295C0(v24, (uint64_t)v29);
      uint64_t v25 = v30;
      uint64_t v26 = v31;
      sub_100029624(v29, v30);
      (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v25, v26);
      sub_10000AB68((uint64_t)v29);
      v24 += 40;
      --v23;
    }
    while (v23);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10022FE78()
{
  sub_10000AB68(v0 + 24);
  swift_release();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  uint64_t v2 = *(void **)(v0 + 120);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  sub_10000B070(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager__sessionSuspension_RD, &qword_1002F96E8);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC17SequoiaTranslator25TranslationSessionManager__lastSELFLoggingInvocations);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10022FF4C()
{
  sub_10022FE78();

  return swift_deallocClassInstance();
}

uint64_t sub_10022FFA4()
{
  return type metadata accessor for TranslationSessionManager();
}

uint64_t type metadata accessor for TranslationSessionManager()
{
  uint64_t result = qword_1002FCDA8;
  if (!qword_1002FCDA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10022FFF8()
{
  sub_1001FE970();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1002300E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SELFLoggingInvocationDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100230148()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1002301BC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100007620(&qword_1002FAEF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100007620(&qword_1002EF7B8);
  uint64_t v7 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007620(&qword_1002EF7C0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v27 = v10;
  uint64_t v28 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100007620((uint64_t *)&unk_1002FCB50);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  id v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v2 + OBJC_IVAR____TtC17SequoiaTranslator20TTSPlaybackViewModel__isPlaying;
  LOBYTE(v29) = 0;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v17, v14);
  uint64_t v19 = OBJC_IVAR____TtC17SequoiaTranslator20TTSPlaybackViewModel_conversationManager;
  *(void *)(v2 + OBJC_IVAR____TtC17SequoiaTranslator20TTSPlaybackViewModel_conversationManager) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC17SequoiaTranslator20TTSPlaybackViewModel_subscriptions) = _swiftEmptyArrayStorage;
  id v20 = *(void **)(v2 + v19);
  *(void *)(v2 + v19) = a1;
  id v21 = a1;

  swift_beginAccess();
  sub_100007620(&qword_1002EF7C8);
  Published.projectedValue.getter();
  swift_endAccess();
  sub_100022324();
  id v29 = (id)static OS_dispatch_queue.main.getter();
  uint64_t v22 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
  sub_100014894(&qword_1002EF7D0, &qword_1002EF7B8);
  sub_100230F6C((unint64_t *)&qword_1002F9840, (void (*)(uint64_t))sub_100022324);
  uint64_t v23 = v26;
  Publisher.receive<A>(on:options:)();
  sub_10008B6B4((uint64_t)v6);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
  sub_100014894(&qword_1002EF7D8, &qword_1002EF7C0);
  swift_retain();
  uint64_t v24 = v27;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v24);
  swift_beginAccess();
  sub_100007620((uint64_t *)&unk_1002F9850);
  sub_100014894(&qword_1002F2C58, (uint64_t *)&unk_1002F9850);
  AnyCancellable.store<A>(in:)();
  swift_endAccess();
  swift_release();

  return v2;
}

uint64_t sub_100230674()
{
  return static Published.subscript.setter();
}

void sub_1002306F0(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchTime();
  uint64_t v15 = __chkstk_darwin(v14);
  id v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  id v21 = *(void **)(v3 + OBJC_IVAR____TtC17SequoiaTranslator20TTSPlaybackViewModel_conversationManager);
  if (v21)
  {
    id v39 = v21;
    sub_10008BA60(a1, a2);
    uint64_t v22 = v39;
  }
  else
  {
    uint64_t v31 = (char *)&v30 - v19;
    uint64_t v32 = v20;
    uint64_t v38 = v6;
    id v39 = (id)v18;
    uint64_t v33 = v13;
    uint64_t v34 = v9;
    uint64_t v35 = v11;
    uint64_t v36 = v10;
    uint64_t v37 = v7;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    int v23 = LOBYTE(aBlock[0]);
    swift_getKeyPath();
    swift_getKeyPath();
    if (v23 == 1)
    {
      LOBYTE(aBlock[0]) = 0;
      swift_retain();
      static Published.subscript.setter();
    }
    else
    {
      LOBYTE(aBlock[0]) = 1;
      swift_retain();
      static Published.subscript.setter();
      sub_100022324();
      uint64_t v24 = (void *)static OS_dispatch_queue.main.getter();
      static DispatchTime.now()();
      uint64_t v25 = v31;
      + infix(_:_:)();
      uint64_t v32 = *(void *)(v32 + 8);
      ((void (*)(char *, id))v32)(v17, v39);
      aBlock[4] = sub_100230F4C;
      aBlock[5] = v3;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10008BA1C;
      aBlock[3] = &unk_1002D3A60;
      uint64_t v26 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      uint64_t v27 = v33;
      static DispatchQoS.unspecified.getter();
      aBlock[0] = _swiftEmptyArrayStorage;
      sub_100230F6C((unint64_t *)&qword_1002F5710, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100007620(&qword_1002EEE40);
      sub_100014894((unint64_t *)&qword_1002F5720, &qword_1002EEE40);
      uint64_t v28 = v34;
      uint64_t v29 = v38;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
      _Block_release(v26);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v28, v29);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v27, v36);
      ((void (*)(char *, id))v32)(v25, v39);
    }
  }
}

uint64_t sub_100230BE0()
{
  return static Published.subscript.setter();
}

uint64_t sub_100230C50()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SequoiaTranslator20TTSPlaybackViewModel__isPlaying;
  uint64_t v2 = sub_100007620((uint64_t *)&unk_1002FCB50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_100230D14()
{
  return type metadata accessor for TTSPlaybackViewModel();
}

uint64_t type metadata accessor for TTSPlaybackViewModel()
{
  uint64_t result = qword_1002FCFA8;
  if (!qword_1002FCFA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100230D68()
{
  sub_1000AFBD4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_100230E10@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TTSPlaybackViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100230E50@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100230ED4()
{
  return static Published.subscript.setter();
}

uint64_t sub_100230F4C()
{
  return sub_100230BE0();
}

uint64_t sub_100230F54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100230F64()
{
  return swift_release();
}

uint64_t sub_100230F6C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100230FB4()
{
  return sub_100230674();
}

void sub_100230FBC(uint64_t a1, void *a2)
{
  char v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100231028()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10023109C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100231110()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

double sub_100231184()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1002311F8(void *a1, void *a2)
{
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v3 = sub_100007620(&qword_1002FD2E0);
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  __chkstk_darwin(v3);
  uint64_t v31 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100007620(&qword_1002FD2D8);
  uint64_t v5 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007620(&qword_1002F1020);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100007620(&qword_1002EF7C8);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v2 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__currentlyPlayingTranslationID;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  sub_100007620(&qword_1002F1378);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  uint64_t v17 = v2 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__currentSide;
  LOBYTE(v36) = 1;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v17, v11, v8);
  uint64_t v18 = v2 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__wordTimingInfo;
  uint64_t v36 = 0;
  sub_100007620(&qword_1002FD120);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v18, v7, v30);
  uint64_t v19 = v2 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__totalDuration;
  uint64_t v36 = 0;
  uint64_t v20 = v31;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v19, v20, v33);
  uint64_t v22 = v34;
  id v21 = v35;
  *(void *)(v2 + 16) = v34;
  *(void *)(v2 + 24) = v21;
  int v23 = self;
  id v24 = v22;
  id v25 = v21;
  id v26 = [v23 defaultCenter];
  uint64_t v27 = self;
  swift_retain();
  id v28 = [v27 sharedInstance];
  [v26 addObserver:v2 selector:"handleAudioInterruptionWithNotification:" name:AVAudioSessionInterruptionNotification object:v28];

  swift_release();
  return v2;
}

uint64_t sub_100231610(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8)
{
  *(void *)(v9 + 112) = a5;
  *(void *)(v9 + 120) = v8;
  *(unsigned char *)(v9 + 187) = a8;
  *(unsigned char *)(v9 + 186) = a7;
  *(unsigned char *)(v9 + 185) = a6;
  *(void *)(v9 + 96) = a2;
  *(void *)(v9 + 104) = a4;
  *(unsigned char *)(v9 + 184) = a3;
  *(void *)(v9 + 88) = a1;
  uint64_t v10 = type metadata accessor for Locale();
  *(void *)(v9 + 128) = v10;
  *(void *)(v9 + 136) = *(void *)(v10 - 8);
  *(void *)(v9 + 144) = swift_task_alloc();
  *(void *)(v9 + 152) = swift_task_alloc();
  return _swift_task_switch(sub_1002316F8, 0, 0);
}

uint64_t sub_1002316F8()
{
  uint64_t v1 = v0[12];
  uint64_t ObjectType = swift_getObjectType();
  v0[20] = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 24))(ObjectType, v1);
  v0[21] = v3;
  (*(void (**)(uint64_t, uint64_t))(v1 + 32))(ObjectType, v1);
  (*(void (**)(uint64_t, uint64_t))(v1 + 40))(ObjectType, v1);
  swift_weakInit();
  return _swift_task_switch(sub_1002317F4, 0, 0);
}

uint64_t sub_1002317F4()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v12 = *(void *)(v0 + 168);
  uint64_t v11 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 144);
  unsigned __int8 v2 = *(unsigned char *)(v0 + 187);
  unsigned __int8 v3 = *(unsigned char *)(v0 + 186);
  unsigned __int8 v4 = *(unsigned char *)(v0 + 185);
  long long v10 = *(_OWORD *)(v0 + 104);
  int v5 = *(unsigned __int8 *)(v0 + 184);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v7 = *(void *)(v0 + 96);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_100231910;
  uint64_t v8 = swift_continuation_init();
  sub_100231BB8(v8, v0 + 80, v1, v12, v5 ^ 1, v11, v5, v13, v10, *((uint64_t *)&v10 + 1), v6, v7, v4, v3, v2);
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100231910()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1)
  {
    swift_willThrow();
    swift_bridgeObjectRelease();
    unsigned __int8 v2 = sub_100231AFC;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_weakDestroy();
    unsigned __int8 v2 = sub_100231A4C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100231A4C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[16];
  unsigned __int8 v3 = *(void (**)(uint64_t, uint64_t))(v0[17] + 8);
  v3(v0[18], v2);
  v3(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100231AFC()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[16];
  unsigned __int8 v3 = *(void (**)(uint64_t, uint64_t))(v0[17] + 8);
  v3(v0[18], v2);
  v3(v1, v2);
  swift_weakDestroy();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100231BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, unsigned __int8 a14, unsigned __int8 a15)
{
  int v59 = a7;
  uint64_t v54 = a4;
  uint64_t v53 = a3;
  uint64_t v52 = a1;
  int v63 = a14;
  int v64 = a15;
  int v62 = a13;
  uint64_t v60 = a11;
  uint64_t v61 = a12;
  int v51 = a5 & 1;
  uint64_t v57 = a10;
  uint64_t v56 = a9;
  uint64_t v66 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v69 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  uint64_t v65 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DispatchQoS();
  uint64_t v67 = *(void *)(v18 - 8);
  uint64_t v68 = v18;
  __chkstk_darwin(v18);
  id v58 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for Locale();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v21 + 64);
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v49 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  id v25 = (char *)&v48 - v24;
  sub_10000B0CC(0, (unint64_t *)&qword_1002EEE30);
  uint64_t v55 = static OS_dispatch_queue.main.getter();
  uint64_t v26 = swift_allocObject();
  uint64_t v50 = v26;
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v27(v25, a6, v20);
  v27((char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), a8, v20);
  uint64_t v28 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v29 = (v28 + 49) & ~v28;
  uint64_t v30 = v29 + v22;
  uint64_t v31 = (v28 + v29 + v22 + 1) & ~v28;
  unint64_t v32 = (v22 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  uint64_t v34 = v52;
  *(void *)(v33 + 16) = v26;
  *(void *)(v33 + 24) = v34;
  uint64_t v35 = v54;
  *(void *)(v33 + 32) = v53;
  *(void *)(v33 + 40) = v35;
  *(unsigned char *)(v33 + 48) = v51;
  uint64_t v36 = v33 + v29;
  uint64_t v37 = *(void (**)(uint64_t, char *, uint64_t))(v21 + 32);
  v37(v36, v25, v20);
  *(unsigned char *)(v33 + v30) = v59;
  v37(v33 + v31, v49, v20);
  uint64_t v38 = (void *)(v33 + v32);
  uint64_t v39 = v57;
  void *v38 = v56;
  v38[1] = v39;
  unint64_t v40 = v33 + ((v32 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v41 = v61;
  *(void *)unint64_t v40 = v60;
  *(void *)(v40 + 8) = v41;
  *(unsigned char *)(v40 + 16) = v62;
  *(unsigned char *)(v40 + 17) = v63;
  *(unsigned char *)(v40 + 18) = v64;
  aBlock[4] = sub_10023536C;
  aBlock[5] = v33;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10008BA1C;
  aBlock[3] = &unk_1002D3B68;
  uint64_t v42 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  os_log_type_t v43 = v58;
  static DispatchQoS.unspecified.getter();
  uint64_t v70 = _swiftEmptyArrayStorage;
  sub_10001165C();
  sub_100007620(&qword_1002EEE40);
  sub_1000116B4();
  uint64_t v45 = v65;
  uint64_t v44 = v66;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  id v46 = (void *)v55;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v42);

  (*(void (**)(char *, uint64_t))(v69 + 8))(v45, v44);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v43, v68);
  swift_release();
  return swift_release();
}

uint64_t sub_1002320F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, char a14, unsigned __int8 a15)
{
  int v102 = a7;
  uint64_t v100 = a6;
  unint64_t v105 = a4;
  uint64_t v19 = sub_100007620(&qword_1002F33C0);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = type metadata accessor for Locale();
  uint64_t v22 = *(void *)(v101 - 8);
  uint64_t v23 = __chkstk_darwin(v101);
  id v25 = (char *)&v89 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v99 = (char *)&v89 - v26;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return swift_continuation_throwingResume();
  }
  uint64_t v28 = Strong;
  uint64_t v98 = v25;
  int v29 = a5 & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!v108) {
    goto LABEL_14;
  }
  if (aBlock == a3 && v108 == v105)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
    {
LABEL_14:
      uint64_t v95 = a8;
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v36 = v108;
      swift_bridgeObjectRelease();
      uint64_t v97 = a2;
      int v104 = v29;
      unint64_t v37 = v105;
      if (v36)
      {
        if (qword_1002EE658 != -1) {
          swift_once();
        }
        uint64_t v38 = type metadata accessor for Logger();
        sub_100011554(v38, (uint64_t)qword_10030EB10);
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        uint64_t v39 = Logger.logObject.getter();
        os_log_type_t v40 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v41 = swift_slowAlloc();
          uint64_t v106 = swift_slowAlloc();
          *(_DWORD *)uint64_t v41 = 136446466;
          uint64_t v90 = v22;
          swift_bridgeObjectRetain();
          uint64_t aBlock = sub_100202FD4(a3, v37, &v106);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v41 + 12) = 2082;
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          if (v108) {
            uint64_t v42 = aBlock;
          }
          else {
            uint64_t v42 = 0;
          }
          if (v108) {
            unint64_t v43 = v108;
          }
          else {
            unint64_t v43 = 0xE000000000000000;
          }
          uint64_t aBlock = sub_100202FD4(v42, v43, &v106);
          uint64_t v22 = v90;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          int v29 = v104;
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "New translation TTS will start before the currently playing one ends. New translation: %{public}s. Currently playing translation: %{public}s", (uint8_t *)v41, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_release_n();
        }

        sub_100234200();
      }
      if (qword_1002EE658 != -1) {
        swift_once();
      }
      int v94 = a13;
      uint64_t v93 = a12;
      uint64_t v92 = a11;
      uint64_t v91 = a10;
      uint64_t v44 = type metadata accessor for Logger();
      sub_100011554(v44, (uint64_t)qword_10030EB10);
      swift_bridgeObjectRetain_n();
      uint64_t v45 = Logger.logObject.getter();
      os_log_type_t v46 = static os_log_type_t.debug.getter();
      BOOL v47 = os_log_type_enabled(v45, v46);
      uint64_t v103 = a3;
      uint64_t v96 = v21;
      if (v47)
      {
        BOOL v48 = v29 == 0;
        uint64_t v49 = swift_slowAlloc();
        uint64_t v50 = swift_slowAlloc();
        uint64_t v90 = v22;
        uint64_t aBlock = v50;
        *(_DWORD *)uint64_t v49 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v106 = sub_100202FD4(a3, v105, &aBlock);
        LOBYTE(v29) = v104;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v49 + 12) = 1026;
        LODWORD(v106) = v48;
        a3 = v103;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Setting UI state for TTS with identifier %{public}s; source: %{BOOL,public}d",
          (uint8_t *)v49,
          0x12u);
        swift_arrayDestroy();
        uint64_t v22 = v90;
        swift_slowDealloc();
        unint64_t v37 = v105;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t aBlock = a3;
      uint64_t v108 = v37;
      swift_bridgeObjectRetain();
      swift_retain();
      static Published.subscript.setter();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock) = v29;
      swift_retain();
      static Published.subscript.setter();
      int v51 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
      uint64_t v53 = v99;
      uint64_t v52 = v100;
      uint64_t v54 = v101;
      v51(v99, v100, v101);
      char v55 = v102;
      if (v102) {
        uint64_t v56 = v52;
      }
      else {
        uint64_t v56 = v95;
      }
      uint64_t v57 = v98;
      v51(v98, v56, v54);
      sub_10000B0CC(0, (unint64_t *)&qword_1002EEE30);
      id v58 = (void *)static OS_dispatch_queue.main.getter();
      id v59 = objc_allocWithZone((Class)_LTSpeakRequest);
      Class isa = Locale._bridgeToObjectiveC()().super.isa;
      Class v61 = Locale._bridgeToObjectiveC()().super.isa;
      id v62 = [v59 initWithSourceLocale:isa targetLocale:v61 handlerQueue:v58];

      int v63 = *(void (**)(char *, uint64_t))(v22 + 8);
      v63(v57, v54);
      v63(v53, v54);
      if (v91)
      {
        id v64 = v62;
        NSString v65 = String._bridgeToObjectiveC()();
      }
      else
      {
        id v66 = v62;
        NSString v65 = 0;
      }
      LODWORD(v101) = a15;
      [v62 setSessionID:v65];

      uint64_t v67 = v93;
      sub_100235464(v92, v93, v55 & 1);
      NSString v68 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v62 setText:v68];

      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v67 + 96))(ObjectType, v67);
      [v62 setTtsPlaybackRate:];
      char v70 = v94;
      [v62 setMuteTTSBasedOnRingerSwitchIfPossible:v94 & 1];
      uint64_t v71 = swift_allocObject();
      swift_weakInit();
      uint64_t v111 = sub_1002356B0;
      uint64_t v112 = v71;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v108 = 1107296256;
      uint64_t v109 = sub_100233158;
      uint64_t v110 = &unk_1002D3B90;
      uint64_t v72 = _Block_copy(&aBlock);
      swift_release();
      [v62 setAudioStartHandler:v72];
      _Block_release(v72);
      sub_10000B0CC(0, (unint64_t *)&qword_1002F3390);
      id v73 = v62;
      uint64_t v74 = (void *)static NSUserDefaults.translationGroupDefaults.getter();
      char v75 = NSUserDefaults.onDeviceOnly.getter();

      [v73 setForcedOfflineTranslation:v75 & 1];
      uint64_t v76 = swift_allocObject();
      swift_weakInit();
      uint64_t v77 = swift_allocObject();
      uint64_t v78 = v103;
      *(void *)(v77 + 16) = v76;
      *(void *)(v77 + 24) = v78;
      *(void *)(v77 + 32) = v105;
      *(unsigned char *)(v77 + 40) = v104;
      uint64_t v79 = v97;
      *(void *)(v77 + 48) = v97;
      uint64_t v111 = sub_1002356F8;
      uint64_t v112 = v77;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v108 = 1107296256;
      uint64_t v109 = sub_100230FBC;
      uint64_t v110 = &unk_1002D3BE0;
      id v80 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      swift_release();
      [v73 setCompletionHandler:v80];
      _Block_release(v80);
      if (v70)
      {
        uint64_t v81 = (uint64_t)v96;
        if (a14) {
          uint64_t v82 = 112;
        }
        else {
          uint64_t v82 = 16;
        }
      }
      else
      {
        uint64_t v81 = (uint64_t)v96;
        if (a14) {
          uint64_t v82 = 96;
        }
        else {
          uint64_t v82 = 0;
        }
      }
      uint64_t v83 = v103;
      if (v101) {
        v82 |= 1uLL;
      }
      uint64_t v84 = type metadata accessor for TaskPriority();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56))(v81, 1, 1, v84);
      type metadata accessor for MainActor();
      unint64_t v85 = v105;
      swift_bridgeObjectRetain();
      swift_retain();
      id v86 = v73;
      uint64_t v87 = static MainActor.shared.getter();
      uint64_t v88 = swift_allocObject();
      *(void *)(v88 + 16) = v87;
      *(void *)(v88 + 24) = &protocol witness table for MainActor;
      *(void *)(v88 + 32) = v28;
      *(void *)(v88 + 40) = v82;
      *(void *)(v88 + 48) = v83;
      *(void *)(v88 + 56) = v85;
      *(unsigned char *)(v88 + 64) = v104;
      *(void *)(v88 + 72) = v79;
      *(void *)(v88 + 80) = v86;
      sub_100056780(v81, (uint64_t)&unk_1002FD2C8, v88);

      swift_release();
      return swift_release();
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if ((v29 == 0) == aBlock) {
    goto LABEL_14;
  }
  if (qword_1002EE658 != -1) {
    swift_once();
  }
  uint64_t v32 = type metadata accessor for Logger();
  sub_100011554(v32, (uint64_t)qword_10030EB10);
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "User paused in-progress TTS, cancelling the current playback", v35, 2u);
    swift_slowDealloc();
  }

  sub_100234200();
  swift_continuation_throwingResume();
  return swift_release();
}

uint64_t sub_100232E0C(unint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for DispatchPredicate();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000B0CC(0, (unint64_t *)&qword_1002EEE30);
  *uint64_t v7 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  char v8 = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_4;
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (!result) {
    return result;
  }
  if (qword_1002EE658 != -1) {
    goto LABEL_15;
  }
LABEL_4:
  uint64_t v10 = type metadata accessor for Logger();
  sub_100011554(v10, (uint64_t)qword_10030EB10);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134349312;
    if (a1)
    {
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
    }
    double v15 = *(double *)&v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2050;
    double v15 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Audio started. wordTimingInfo.count: %{public}ld. totalDuration: %{public}f", (uint8_t *)v13, 0x16u);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_getKeyPath();
  swift_getKeyPath();
  double v15 = a2;
  swift_retain();
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  double v15 = *(double *)&a1;
  swift_bridgeObjectRetain();
  return static Published.subscript.setter();
}

uint64_t sub_100233158(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, double))(a1 + 32);
  if (a2)
  {
    sub_10000B0CC(0, &qword_1002FD2D0);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1002331F0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for DispatchPredicate();
  uint64_t v16 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (uint64_t *)((char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000B0CC(0, (unint64_t *)&qword_1002EEE30);
  *uint64_t v14 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v16 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v12);
  char v15 = _dispatchPreconditionTest(_:)();
  uint64_t v17 = *(void (**)(uint64_t *, uint64_t))(v16 + 8);
  LOBYTE(v16) = v16 + 8;
  v17(v14, v12);
  if (v15)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (!result) {
      return result;
    }
    a2 = result;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (!v43)
    {
      LODWORD(v16) = 0;
      goto LABEL_10;
    }
    if (v42 == a3 && v43 == a4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      LODWORD(v16) = 0;
      if ((v19 & 1) == 0) {
        goto LABEL_10;
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    LODWORD(v16) = ((a5 & 1) == 0) ^ v42;
LABEL_10:
    if (a1)
    {
      swift_errorRetain();
      if (qword_1002EE658 == -1) {
        goto LABEL_12;
      }
      goto LABEL_38;
    }
    if (qword_1002EE658 != -1) {
      swift_once();
    }
    uint64_t v27 = type metadata accessor for Logger();
    sub_100011554(v27, (uint64_t)qword_10030EB10);
    swift_bridgeObjectRetain_n();
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v40 = a6;
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      LODWORD(v39) = v16;
      uint64_t v42 = v31;
      *(_DWORD *)uint64_t v30 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_100202FD4(a3, a4, &v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "TTS speak request complete for translation: %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      char v32 = v39;
      swift_slowDealloc();
      swift_slowDealloc();

      if ((v32 & 1) == 0)
      {
LABEL_19:
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        uint64_t v33 = Logger.logObject.getter();
        os_log_type_t v34 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v35 = swift_slowAlloc();
          uint64_t v41 = swift_slowAlloc();
          *(_DWORD *)uint64_t v35 = 136446466;
          swift_bridgeObjectRetain();
          uint64_t v42 = sub_100202FD4(a3, a4, &v41);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v35 + 12) = 2082;
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          if (v43) {
            uint64_t v36 = v42;
          }
          else {
            uint64_t v36 = 7104878;
          }
          if (v43) {
            unint64_t v37 = v43;
          }
          else {
            unint64_t v37 = 0xE300000000000000;
          }
          uint64_t v42 = sub_100202FD4(v36, v37, &v41);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl((void *)&_mh_execute_header, v33, v34, "Currently playing translation was changed before it completed. Completed translation: %{public}s. Currently playing translation: %{public}s", (uint8_t *)v35, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_release_n();
        }

        goto LABEL_34;
      }
    }
    else
    {
      swift_bridgeObjectRelease_n();

      if ((v16 & 1) == 0) {
        goto LABEL_19;
      }
    }
    sub_100234414();
LABEL_34:
    swift_continuation_throwingResume();
    return swift_release();
  }
  __break(1u);
LABEL_38:
  swift_once();
LABEL_12:
  uint64_t v20 = type metadata accessor for Logger();
  sub_100011554(v20, (uint64_t)qword_10030EB10);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v40 = a6;
    id v25 = (void *)v24;
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136446466;
    uint64_t v39 = a2;
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_100202FD4(a3, a4, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2112;
    uint64_t v26 = _convertErrorToNSError(_:)();
    uint64_t v41 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v25 = v26;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "TTS speak request failed for translation: %{public}s. Error: %@", (uint8_t *)v23, 0x16u);
    sub_100007620((uint64_t *)&unk_1002F6DE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if ((v16 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  swift_bridgeObjectRelease_n();
  swift_errorRelease();
  swift_errorRelease();

  if (v16) {
LABEL_28:
  }
    sub_100234414();
LABEL_29:
  sub_100007620((uint64_t *)&unk_1002FA720);
  swift_allocError();
  void *v38 = a1;
  swift_continuation_throwingResumeWithError();
  return swift_release();
}

uint64_t sub_100233A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 80) = v13;
  *(void *)(v8 + 88) = v14;
  *(unsigned char *)(v8 + 153) = a8;
  *(void *)(v8 + 64) = a6;
  *(void *)(v8 + 72) = a7;
  *(void *)(v8 + 48) = a4;
  *(void *)(v8 + 56) = a5;
  type metadata accessor for MainActor();
  *(void *)(v8 + 96) = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v8 + 104) = v10;
  *(void *)(v8 + 112) = v9;
  return _swift_task_switch(sub_100233AD4, v10, v9);
}

uint64_t sub_100233AD4()
{
  *(void *)(v0 + 120) = *(void *)(*(void *)(v0 + 48) + 24);
  return _swift_task_switch(sub_100233AFC, 0, 0);
}

uint64_t sub_100233AFC()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[7];
  uint64_t v3 = swift_task_alloc();
  v0[16] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[17] = v4;
  uint64_t v5 = sub_100007620(&qword_1002F33D8);
  *uint64_t v4 = v0;
  v4[1] = sub_100233C04;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 4, 0, 0, 0xD000000000000022, 0x800000010025CC40, sub_10009A1B0, v3, v5);
}

uint64_t sub_100233C04()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100233D1C, 0, 0);
}

uint64_t sub_100233D1C()
{
  v0[18] = v0[4];
  return _swift_task_switch(sub_100233D3C, v0[13], v0[14]);
}

uint64_t sub_100233D3C()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  if (!v1)
  {
    char v4 = 0;
    goto LABEL_9;
  }
  if (*(void *)(v0 + 16) == *(void *)(v0 + 64) && v1 == *(void *)(v0 + 72))
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  char v4 = 0;
  if ((v3 & 1) == 0)
  {
LABEL_9:
    uint64_t v5 = *(void *)(v0 + 144);
    if (!v5) {
      goto LABEL_17;
    }
LABEL_10:
    swift_errorRetain();
    if (qword_1002EE658 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100011554(v6, (uint64_t)qword_10030EB10);
    swift_errorRetain();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      char v26 = v4;
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      uint64_t v11 = _convertErrorToNSError(_:)();
      *(void *)(v0 + 40) = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v10 = v11;
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "TTS audio session config failed. Error: %@", v9, 0xCu);
      sub_100007620((uint64_t *)&unk_1002F6DE0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      if ((v26 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {
      swift_errorRelease();

      if ((v4 & 1) == 0)
      {
LABEL_25:
        sub_100007620((uint64_t *)&unk_1002FA720);
        swift_allocError();
        *char v19 = v5;
        swift_continuation_throwingResumeWithError();
        swift_errorRelease();
        goto LABEL_31;
      }
    }
    sub_100234414();
    goto LABEL_25;
  }
LABEL_16:
  char v12 = *(unsigned char *)(v0 + 153);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  char v4 = ((v12 & 1) == 0) ^ *(unsigned char *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 144);
  if (v5) {
    goto LABEL_10;
  }
LABEL_17:
  if (v4)
  {
    if (qword_1002EE658 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100011554(v13, (uint64_t)qword_10030EB10);
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "TTS speak request starting", v16, 2u);
      swift_slowDealloc();
    }
    uint64_t v17 = *(void *)(v0 + 88);
    uint64_t v18 = *(void *)(v0 + 48);

    [*(id *)(v18 + 16) translate:v17];
  }
  else
  {
    if (qword_1002EE658 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_100011554(v20, (uint64_t)qword_10030EB10);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Not starting TTS request since it's been cancelled while doing prep work", v23, 2u);
      swift_slowDealloc();
    }
  }
LABEL_31:
  uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
  return v24();
}

uint64_t sub_100234200()
{
  uint64_t v1 = v0;
  if (qword_1002EE658 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100011554(v2, (uint64_t)qword_10030EB10);
  swift_retain_n();
  char v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (v10) {
      uint64_t v6 = v9;
    }
    else {
      uint64_t v6 = 0;
    }
    if (v10) {
      unint64_t v7 = v10;
    }
    else {
      unint64_t v7 = 0xE000000000000000;
    }
    sub_100202FD4(v6, v7, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Cleaning up translator to cancel currently playing translation: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  [*(id *)(v1 + 16) cleanup];
  return sub_100234414();
}

uint64_t sub_100234414()
{
  return static Published.subscript.setter();
}

void sub_100234504()
{
  uint64_t v0 = Notification.userInfo.getter();
  if (!v0) {
    return;
  }
  uint64_t v1 = v0;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v2 = sub_10020384C((uint64_t)v15), (v3 & 1) != 0))
  {
    sub_10000B170(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v16);
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10006E7AC((uint64_t)v15);
  if (!*((void *)&v17 + 1))
  {
    sub_1000132A0((uint64_t)&v16);
    return;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  if (!v14)
  {
    if (qword_1002EE658 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100011554(v8, (uint64_t)qword_10030EB10);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v9, v10)) {
      goto LABEL_25;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    char v12 = "Audio interruption ended";
    goto LABEL_24;
  }
  if (v14 != 1)
  {
    if (qword_1002EE658 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100011554(v13, (uint64_t)qword_10030EB10);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v9, v10)) {
      goto LABEL_25;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    char v12 = "Audio interruption with unhandled type";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v12, v11, 2u);
    swift_slowDealloc();
LABEL_25:

    return;
  }
  if (qword_1002EE658 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100011554(v4, (uint64_t)qword_10030EB10);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Audio interruption began", v7, 2u);
    swift_slowDealloc();
  }

  sub_100234200();
}

uint64_t sub_1002348F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__currentlyPlayingTranslationID;
  uint64_t v2 = sub_100007620(&qword_1002EF7C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__currentSide;
  uint64_t v4 = sub_100007620(&qword_1002F1020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__wordTimingInfo;
  uint64_t v6 = sub_100007620(&qword_1002FD2D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC17SequoiaTranslator10TTSManager__totalDuration;
  uint64_t v8 = sub_100007620(&qword_1002FD2E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return swift_deallocClassInstance();
}

uint64_t sub_100234A7C()
{
  return type metadata accessor for TTSManager();
}

uint64_t type metadata accessor for TTSManager()
{
  uint64_t result = qword_1002FD0F8;
  if (!qword_1002FD0F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100234AD0()
{
  sub_100022CC4(319, (unint64_t *)&qword_1002F32F0, &qword_1002F1378);
  if (v0 <= 0x3F)
  {
    sub_1000219BC(319, &qword_1002FD110);
    if (v1 <= 0x3F)
    {
      sub_100022CC4(319, &qword_1002FD118, &qword_1002FD120);
      if (v2 <= 0x3F)
      {
        sub_1000219BC(319, (unint64_t *)&unk_1002FD128);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

unsigned char *storeEnumTagSinglePayload for TTSManager.PlaybackSide(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100234D2CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSManager.PlaybackSide()
{
  return &type metadata for TTSManager.PlaybackSide;
}

unint64_t sub_100234D68()
{
  unint64_t result = qword_1002FD2B8;
  if (!qword_1002FD2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1002FD2B8);
  }
  return result;
}

uint64_t sub_100234DBC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TTSManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

double sub_100234DFC@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100234E7C()
{
  return static Published.subscript.setter();
}

uint64_t sub_100234F00@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100234F80()
{
  return static Published.subscript.setter();
}

uint64_t sub_100234FF4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100235074()
{
  return static Published.subscript.setter();
}

double sub_1002350F0@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100235170()
{
  return static Published.subscript.setter();
}

uint64_t sub_100235204()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10023523C()
{
  uint64_t v1 = type metadata accessor for Locale();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 49) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4 + 1) & ~v3;
  unint64_t v8 = (((v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4;
  os_log_type_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, v8 + 19, v6);
}

uint64_t sub_10023536C()
{
  uint64_t v1 = *(void *)(type metadata accessor for Locale() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 49) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = v3 + v4;
  uint64_t v6 = (v2 + v3 + v4 + 1) & ~v2;
  unint64_t v7 = (v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v0 + v3;
  uint64_t v9 = v0 + v6;
  uint64_t v11 = *(void *)(v0 + v7);
  uint64_t v10 = *(void *)(v0 + v7 + 8);
  uint64_t v12 = v0 + ((v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  return sub_1002320F4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48), v8, *(unsigned __int8 *)(v0 + v5), v9, v11, v10, *(void *)v12, *(void *)(v12 + 8), *(unsigned char *)(v12 + 16), *(unsigned char *)(v12 + 17), *(unsigned char *)(v12 + 18));
}

uint64_t sub_10023544C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10023545C()
{
  return swift_release();
}

uint64_t sub_100235464(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = type metadata accessor for Locale();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(ObjectType, a2);
  char v13 = static Locale.== infix(_:_:)();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  v14(v11, v5);
  if (v13) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64))(ObjectType, a2);
  }
  if (a3) {
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64))(ObjectType, a2);
  }
  else {
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 72))(ObjectType, a2);
  }
  uint64_t v15 = v16;
  if (byte_10030EB88 == 1)
  {
    long long v17 = self;
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v19 = [v17 stringReplacingRedactionsWithBeepMarker:v18];

    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return v15;
}

uint64_t sub_1002356B0(unint64_t a1, double a2)
{
  return sub_100232E0C(a1, a2);
}

uint64_t sub_1002356B8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1002356F8(uint64_t a1)
{
  return sub_1002331F0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_10023570C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10023575C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  char v9 = *(unsigned char *)(v1 + 64);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_100021B58;
  return sub_100233A28(a1, v12, v4, v5, v6, v7, v8, v9);
}

void sub_100235868(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + OBJC_IVAR____TtC17SequoiaTranslator16ConversationTurn_request) censorSpeech];
  uint64_t v23 = v1;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_censorSpeech) = v2;
  sub_10009C7C0((uint64_t)v25);
  if (!v25[3])
  {
    sub_100235C10((uint64_t)v25);
    return;
  }
  sub_100007620(&qword_1002FC480);
  sub_10000B0CC(0, &qword_1002F33B0);
  if (swift_dynamicCast())
  {
    BOOL v3 = [v24 route] == (id)1;
    *(unsigned char *)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_offline) = v3;
    v25[0] = v24;
    sub_10009ED80();
    *(unsigned char *)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_lowQualityMT) = TranslationResult.isLowConfidence.getter() & 1;
    id v4 = [v24 translations];
    sub_10000B0CC(0, (unint64_t *)&unk_1002F3410);
    unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v21)
      {
LABEL_5:
        if ((v5 & 0xC000000000000001) != 0)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_26;
          }
          id v6 = *(id *)(v5 + 32);
        }
        uint64_t v7 = v6;
        swift_bridgeObjectRelease();
        id v8 = [v7 statistics];
        if (v8)
        {
          char v9 = v8;
          id v10 = [v8 inputTokenCount];
          *(void *)(v23 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_inputTokenCount) = v10;
          id v11 = [v9 inputSubtokenCount];

          *(void *)(v23 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_inputSubtokenCount) = v11;
        }
        id v12 = [v7 senses];
        sub_10000B0CC(0, &qword_1002F3590);
        unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        os_log_type_t v22 = v7;
        if (!(v5 >> 62))
        {
          uint64_t v13 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v13)
          {
LABEL_12:
            if (v13 < 1)
            {
              __break(1u);
              return;
            }
            uint64_t v14 = 0;
            uint64_t v15 = OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_senseDisambiguation;
            uint64_t v16 = OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_nBestDisplay;
            do
            {
              if ((v5 & 0xC000000000000001) != 0) {
                id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
              }
              else {
                id v17 = *(id *)(v5 + 8 * v14 + 32);
              }
              NSString v18 = v17;
              ++v14;
              unsigned int v19 = [v17 isPhrasebookMatch];

              if (v19) {
                uint64_t v20 = v16;
              }
              else {
                uint64_t v20 = v15;
              }
              *(unsigned char *)(v23 + v20) = 1;
            }
            while (v13 != v14);
          }
LABEL_27:

          swift_bridgeObjectRelease();
          return;
        }
LABEL_26:
        swift_bridgeObjectRetain();
        uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v13) {
          goto LABEL_12;
        }
        goto LABEL_27;
      }
    }
    else if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100235C10(uint64_t a1)
{
  uint64_t v2 = sub_100007620((uint64_t *)&unk_1002F33F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100235C70(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEF65636E65646966;
  uint64_t v3 = 0x6E6F43776F4C7369;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6563617053736168;
    }
    else {
      uint64_t v5 = 1954047348;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xED00007265746641;
    }
    else {
      unint64_t v6 = 0xE400000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x6E6F43776F4C7369;
  unint64_t v6 = 0xEF65636E65646966;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x6563617053736168;
    }
    else {
      uint64_t v3 = 1954047348;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xED00007265746641;
    }
    else {
      unint64_t v2 = 0xE400000000000000;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100235DA4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6C616E69467369;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6C616E69467369;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0x8000000100259FF0;
      unint64_t v5 = 0xD000000000000012;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x656C61636F6CLL;
      break;
    case 3:
      unint64_t v5 = 0x6E6F43776F4C7369;
      unint64_t v3 = 0xEF65636E65646966;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v3 = 0x800000010025A010;
      break;
    case 5:
      unint64_t v5 = 0x657474616D726F66;
      unint64_t v3 = 0xEF676E6972745364;
      break;
    case 6:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x6E696769726FLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x8000000100259FF0;
      if (v5 == 0xD000000000000012) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x656C61636F6CLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xEF65636E65646966;
      if (v5 != 0x6E6F43776F4C7369) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0x800000010025A010;
      if (v5 != 0xD000000000000018) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      uint64_t v2 = 0x657474616D726F66;
      unint64_t v6 = 0xEF676E6972745364;
      goto LABEL_18;
    case 6:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x6E696769726FLL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100236028(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEF65636E65646966;
  uint64_t v3 = 0x6E6F43776F4C7369;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6E6F43776F4C7369;
  unint64_t v6 = 0xEF65636E65646966;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x657474616D726F66;
      unint64_t v6 = 0xEF676E6972745364;
      break;
    case 2:
      unint64_t v6 = 0x800000010025A010;
      unint64_t v5 = 0xD000000000000018;
      break;
    case 3:
      unint64_t v5 = 0x654D7365736E6573;
      unint64_t v6 = 0xEA00000000006174;
      break;
    case 4:
      unint64_t v5 = 0x617A696E616D6F72;
      unint64_t v6 = 0xEC0000006E6F6974;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEF676E6972745364;
      if (v5 == 0x657474616D726F66) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v2 = 0x800000010025A010;
      if (v5 != 0xD000000000000018) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v3 = 0x654D7365736E6573;
      unint64_t v2 = 0xEA00000000006174;
      goto LABEL_12;
    case 4:
      unint64_t v2 = 0xEC0000006E6F6974;
      if (v5 != 0x617A696E616D6F72) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v3) {
        goto LABEL_16;
      }
LABEL_13:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100236244(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000011;
  }
  else {
    unint64_t v3 = 0x65746C4174736562;
  }
  if (v2) {
    unint64_t v4 = 0xEF65766974616E72;
  }
  else {
    unint64_t v4 = 0x8000000100259FC0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000011;
  }
  else {
    unint64_t v5 = 0x65746C4174736562;
  }
  if (a2) {
    unint64_t v6 = 0x8000000100259FC0;
  }
  else {
    unint64_t v6 = 0xEF65766974616E72;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1002362FC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x74616E7265746C61;
  }
  else {
    uint64_t v3 = 0x656C61636F6CLL;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xEC00000073657669;
  }
  if (a2) {
    uint64_t v5 = 0x74616E7265746C61;
  }
  else {
    uint64_t v5 = 0x656C61636F6CLL;
  }
  if (a2) {
    unint64_t v6 = 0xEC00000073657669;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1002363A8(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x444965736E6573;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x444965736E6573;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6974696E69666564;
      unint64_t v3 = 0xEA00000000006E6FLL;
      break;
    case 2:
      uint64_t v6 = 0x656372756F73;
      goto LABEL_5;
    case 3:
      uint64_t v6 = 0x746567726174;
LABEL_5:
      uint64_t v5 = v6 & 0xFFFFFFFFFFFFLL | 0x614D000000000000;
      unint64_t v3 = 0xEB00000000686374;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x736C6562616CLL;
      break;
    case 5:
      unint64_t v3 = 0x800000010025A080;
      uint64_t v5 = 0xD000000000000011;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEA00000000006E6FLL;
      if (v5 == 0x6974696E69666564) {
        goto LABEL_17;
      }
      goto LABEL_20;
    case 2:
      uint64_t v8 = 0x656372756F73;
      goto LABEL_13;
    case 3:
      uint64_t v8 = 0x746567726174;
LABEL_13:
      unint64_t v7 = 0xEB00000000686374;
      if (v5 != (v8 & 0xFFFFFFFFFFFFLL | 0x614D000000000000)) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 4:
      unint64_t v7 = 0xE600000000000000;
      uint64_t v2 = 0x736C6562616CLL;
      goto LABEL_16;
    case 5:
      unint64_t v7 = 0x800000010025A080;
      if (v5 != 0xD000000000000011) {
        goto LABEL_20;
      }
      goto LABEL_17;
    default:
LABEL_16:
      if (v5 != v2) {
        goto LABEL_20;
      }
LABEL_17:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_20:
      }
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_1002365B4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x800000010025A130;
  uint64_t v4 = a1;
  uint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x697461636F766E69;
      uint64_t v6 = 1682533999;
      goto LABEL_6;
    case 2:
      uint64_t v7 = 0x656372756F73;
      goto LABEL_5;
    case 3:
      uint64_t v7 = 0x746567726174;
LABEL_5:
      uint64_t v5 = v7 & 0xFFFFFFFFFFFFLL | 0x6F4C000000000000;
      uint64_t v6 = 1701601635;
LABEL_6:
      unint64_t v3 = v6 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      break;
    default:
      break;
  }
  unint64_t v8 = 0x800000010025A130;
  switch(a2)
  {
    case 1:
      uint64_t v2 = 0x697461636F766E69;
      uint64_t v9 = 1682533999;
      goto LABEL_12;
    case 2:
      uint64_t v10 = 0x656372756F73;
      goto LABEL_11;
    case 3:
      uint64_t v10 = 0x746567726174;
LABEL_11:
      uint64_t v2 = v10 & 0xFFFFFFFFFFFFLL | 0x6F4C000000000000;
      uint64_t v9 = 1701601635;
LABEL_12:
      unint64_t v8 = v9 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v8) {
    char v11 = 1;
  }
  else {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_100236738(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x74616C736E617274;
    }
    else {
      uint64_t v3 = 0x726F727265;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEB00000000676E69;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x74616C736E617274;
      }
      else {
        uint64_t v6 = 0x726F727265;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEB00000000676E69;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1701602409;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1701602409)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_10023684C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1954047348;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1954047348;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6554746567726174;
      unint64_t v3 = 0xEA00000000007478;
      break;
    case 2:
      uint64_t v6 = 0x656372756F73;
      goto LABEL_5;
    case 3:
      uint64_t v6 = 0x746567726174;
LABEL_5:
      uint64_t v5 = v6 & 0xFFFFFFFFFFFFLL | 0x6F4C000000000000;
      unint64_t v3 = 0xEE004449656C6163;
      break;
    case 4:
      uint64_t v5 = 0x656D757274736E69;
      unint64_t v3 = 0xEF6E6F697461746ELL;
      break;
    case 5:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x7375636F66;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEA00000000007478;
      if (v5 == 0x6554746567726174) {
        goto LABEL_17;
      }
      goto LABEL_20;
    case 2:
      uint64_t v8 = 0x656372756F73;
      goto LABEL_13;
    case 3:
      uint64_t v8 = 0x746567726174;
LABEL_13:
      unint64_t v7 = 0xEE004449656C6163;
      if (v5 != (v8 & 0xFFFFFFFFFFFFLL | 0x6F4C000000000000)) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 4:
      uint64_t v2 = 0x656D757274736E69;
      unint64_t v7 = 0xEF6E6F697461746ELL;
      goto LABEL_16;
    case 5:
      unint64_t v7 = 0xE500000000000000;
      if (v5 != 0x7375636F66) {
        goto LABEL_20;
      }
      goto LABEL_17;
    default:
LABEL_16:
      if (v5 != v2) {
        goto LABEL_20;
      }
LABEL_17:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_20:
      }
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_100236A60(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xE900000000000079;
  uint64_t v3 = 0x72746E4572657375;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x65676175676E616CLL;
    }
    else {
      uint64_t v5 = 0x4C52556E65706FLL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEE0065676E616843;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x72746E4572657375;
  unint64_t v6 = 0xE900000000000079;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x65676175676E616CLL;
    }
    else {
      uint64_t v3 = 0x4C52556E65706FLL;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xEE0065676E616843;
    }
    else {
      unint64_t v2 = 0xE700000000000000;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100236B94(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x616E6F6974636964;
    }
    else {
      uint64_t v3 = 0x6F68706F7263696DLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEA00000000007972;
    }
    else {
      unint64_t v4 = 0xEA0000000000656ELL;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x616E6F6974636964;
      }
      else {
        uint64_t v6 = 0x6F68706F7263696DLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEA00000000007972;
      }
      else {
        unint64_t v7 = 0xEA0000000000656ELL;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE800000000000000;
    uint64_t v3 = 0x6472616F6279656BLL;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE800000000000000;
  if (v3 != 0x6472616F6279656BLL)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100236CC0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x70615472657375;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x70615472657375;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6465766965636572;
      unint64_t v3 = 0xED0000726F727245;
      break;
    case 2:
      uint64_t v5 = 0x6465766965636572;
      unint64_t v3 = 0xED00006C616E6946;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x7465736572;
      break;
    case 4:
      uint64_t v5 = 0x69647541706F7473;
      unint64_t v3 = 0xE90000000000006FLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      uint64_t v7 = 0x726F727245;
      goto LABEL_9;
    case 2:
      uint64_t v7 = 0x6C616E6946;
LABEL_9:
      unint64_t v6 = v7 & 0xFFFFFFFFFFFFLL | 0xED00000000000000;
      if (v5 != 0x6465766965636572) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x7465736572;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE90000000000006FLL;
      if (v5 != 0x69647541706F7473) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v8 = 1;
      }
      else {
LABEL_16:
      }
        char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8 & 1;
  }
}

uint64_t sub_100236EB0(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x7465736E75;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x7465736E75;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x7469617274726F70;
      break;
    case 2:
      uint64_t v5 = 0x61737265766E6F63;
      unint64_t v3 = 0xEC0000006E6F6974;
      break;
    case 3:
      uint64_t v5 = 0x73616364616F7262;
      unint64_t v3 = 0xE900000000000074;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE500000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x7469617274726F70) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v2 = 0x61737265766E6F63;
      unint64_t v6 = 0xEC0000006E6F6974;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE900000000000074;
      if (v5 == 0x73616364616F7262) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100237050(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x8000000100259EE0;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x726F7774654E6F6ELL;
    }
    else {
      unint64_t v5 = 0xD000000000000014;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE90000000000006BLL;
    }
    else {
      unint64_t v6 = 0x8000000100259F00;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000013;
  unint64_t v6 = 0x8000000100259EE0;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0x726F7774654E6F6ELL;
    }
    else {
      unint64_t v2 = 0xD000000000000014;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xE90000000000006BLL;
    }
    else {
      unint64_t v3 = 0x8000000100259F00;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_100237158(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1886352499;
  }
  else {
    uint64_t v3 = 0x7472617473;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1886352499;
  }
  else {
    uint64_t v5 = 0x7472617473;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1002371F4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0x6E776F44776F6C73;
  unint64_t v3 = 0xE800000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 0x6E776F44776F6C73;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x74786554646E6966;
      break;
    case 2:
      unint64_t v3 = 0x8000000100259F30;
      unint64_t v5 = 0xD000000000000013;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v6 = "translationTakingTooLong";
      goto LABEL_6;
    case 4:
      unint64_t v5 = 0xD000000000000017;
      unint64_t v6 = "tapShutterButtonToPause";
LABEL_6:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE800000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x74786554646E6966;
      break;
    case 2:
      unint64_t v7 = 0x8000000100259F30;
      unint64_t v2 = 0xD000000000000013;
      break;
    case 3:
      unint64_t v2 = 0xD000000000000018;
      char v8 = "translationTakingTooLong";
      goto LABEL_12;
    case 4:
      unint64_t v2 = 0xD000000000000017;
      char v8 = "tapShutterButtonToPause";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_1002373A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100236A60(*a1, *a2);
}

Swift::Int sub_1002373B0()
{
  return Hasher._finalize()();
}

uint64_t sub_100237464()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100237504()
{
  return Hasher._finalize()();
}

unint64_t sub_1002375B4@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100238628(*a1);
  *a2 = result;
  return result;
}

void sub_1002375E4(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE900000000000079;
  unint64_t v4 = 0xEE0065676E616843;
  uint64_t v5 = 0x65676175676E616CLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x4C52556E65706FLL;
    unint64_t v4 = 0xE700000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x72746E4572657375;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

unsigned char *sub_100237654(char a1)
{
  unint64_t v3 = &v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_sourceLocale];
  uint64_t v4 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_localePair] = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_start];
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7(&v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_end], 1, 1, v6);
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_eventType] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_characterCount] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_pastedCharacterCount] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_inputTokenCount] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_inputSubtokenCount] = 0;
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_airplaneModeEnabled] = 0;
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_onDeviceModeEnabled] = 0;
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_offline] = 0;
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_censorSpeech] = 0;
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_lowQualityMT] = 0;
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_nBestDisplay] = 0;
  v1[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_senseDisambiguation] = 0;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for TypedInputInstrumentation();
  unint64_t result = [super init];
  result[OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_eventType] = a1;
  return result;
}

id sub_10023783C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TypedInputInstrumentation();
  return [super dealloc];
}

uint64_t sub_1002378EC()
{
  return type metadata accessor for TypedInputInstrumentation();
}

uint64_t type metadata accessor for TypedInputInstrumentation()
{
  uint64_t result = qword_1002FD310;
  if (!qword_1002FD310) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100237940()
{
  sub_1001C4740(319, (unint64_t *)&qword_1002F6D40, (void (*)(uint64_t))&type metadata accessor for Locale);
  if (v0 <= 0x3F)
  {
    sub_1001C4740(319, (unint64_t *)&qword_1002F2B90, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for TypedInputInstrumentation.EventType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100237B48);
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

ValueMetadata *type metadata accessor for TypedInputInstrumentation.EventType()
{
  return &type metadata for TypedInputInstrumentation.EventType;
}

unint64_t sub_100237B84()
{
  unint64_t result = qword_1002FD320;
  if (!qword_1002FD320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FD320);
  }
  return result;
}

void *sub_100237BD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100007620(&qword_1002F8BA0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v85 = (uint64_t)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v83 - v5;
  uint64_t v86 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v86 - 8);
  uint64_t v8 = __chkstk_darwin(v86);
  uint64_t v84 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v87 = (char *)&v83 - v10;
  uint64_t v11 = sub_100007620((uint64_t *)&unk_1002F4110);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Locale();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  id v17 = (char *)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v1 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_sourceLocale;
  swift_beginAccess();
  sub_10000C3A4(v18, (uint64_t)v13, (uint64_t *)&unk_1002F4110);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_10000B070((uint64_t)v13, (uint64_t *)&unk_1002F4110);
    unsigned int v19 = &_swiftEmptyDictionarySingleton;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    Locale.ltIdentifier.getter();
    NSString v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v89 = &_swiftEmptyDictionarySingleton;
    sub_100205C04((uint64_t)v20, 0x6F4C656372756F73, 0xEC000000656C6163, isUniquelyReferenced_nonNull_native);
    unsigned int v19 = v89;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  os_log_type_t v22 = *(void **)(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_localePair);
  if (v22)
  {
    id v23 = v22;
    sub_100006274();
    NSString v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v89 = v19;
    sub_100205C04((uint64_t)v24, 0x6150656C61636F6CLL, 0xEA00000000007269, v25);
    unsigned int v19 = v89;

    swift_bridgeObjectRelease();
  }
  sub_1000A6138();
  Class isa = NSNumber.init(integerLiteral:)(*(void *)(v1
                                                 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_characterCount)).super.super.isa;
  char v27 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v19;
  sub_100205C04((uint64_t)isa, 0x6574636172616863, 0xEE00746E756F4372, v27);
  uint64_t v28 = v89;
  swift_bridgeObjectRelease();
  uint64_t v29 = OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_pastedCharacterCount;
  Class v30 = NSNumber.init(BOOLeanLiteral:)(*(void *)(v1
                                                 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_pastedCharacterCount) > 0).super.super.isa;
  char v31 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v28;
  sub_100205C04((uint64_t)v30, 0x6576456574736170, 0xEA0000000000746ELL, v31);
  char v32 = v89;
  swift_bridgeObjectRelease();
  Class v33 = NSNumber.init(integerLiteral:)(*(void *)(v1 + v29)).super.super.isa;
  char v34 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v32;
  sub_100205C04((uint64_t)v33, 0xD000000000000014, 0x8000000100264D50, v34);
  uint64_t v35 = v89;
  swift_bridgeObjectRelease();
  Class v36 = NSNumber.init(BOOLeanLiteral:)(*(unsigned char *)(v1
                                                + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_airplaneModeEnabled)).super.super.isa;
  char v37 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v35;
  sub_100205C04((uint64_t)v36, 0x656E616C70726961, 0xEC00000065646F4DLL, v37);
  uint64_t v38 = v89;
  swift_bridgeObjectRelease();
  Class v39 = NSNumber.init(BOOLeanLiteral:)(*(unsigned char *)(v1
                                                + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_onDeviceModeEnabled)).super.super.isa;
  char v40 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v38;
  sub_100205C04((uint64_t)v39, 0x6563697665446E6FLL, 0xEC00000065646F4DLL, v40);
  uint64_t v41 = v89;
  swift_bridgeObjectRelease();
  Class v42 = NSNumber.init(BOOLeanLiteral:)(*(unsigned char *)(v1
                                                + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_offline)).super.super.isa;
  char v43 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v41;
  sub_100205C04((uint64_t)v42, 0x656E696C66666FLL, 0xE700000000000000, v43);
  uint64_t v44 = v89;
  swift_bridgeObjectRelease();
  Class v45 = NSNumber.init(BOOLeanLiteral:)(*(unsigned char *)(v1
                                                + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_censorSpeech)).super.super.isa;
  char v46 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v44;
  sub_100205C04((uint64_t)v45, 0x7053726F736E6563, 0xEC00000068636565, v46);
  BOOL v47 = v89;
  swift_bridgeObjectRelease();
  uint64_t v48 = v7;
  uint64_t v49 = (uint64_t)v6;
  NSString v50 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  char v51 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v47;
  sub_100205C04((uint64_t)v50, 0x707954746E657665, 0xE900000000000065, v51);
  uint64_t v52 = v89;
  swift_bridgeObjectRelease();
  Class v53 = Bool._bridgeToObjectiveC()().super.super.isa;
  char v54 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v52;
  sub_100205C04((uint64_t)v53, 0xD000000000000013, 0x8000000100262EE0, v54);
  char v55 = v89;
  swift_bridgeObjectRelease();
  Class v56 = Bool._bridgeToObjectiveC()().super.super.isa;
  char v57 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v55;
  sub_100205C04((uint64_t)v56, 0x696C617551776F6CLL, 0xEC000000544D7974, v57);
  id v58 = v89;
  swift_bridgeObjectRelease();
  Class v59 = Bool._bridgeToObjectiveC()().super.super.isa;
  char v60 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v89 = v58;
  sub_100205C04((uint64_t)v59, 0x736944747365426ELL, 0xEC00000079616C70, v60);
  Class v61 = v89;
  swift_bridgeObjectRelease();
  uint64_t v62 = v1 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_start;
  swift_beginAccess();
  sub_10000C3A4(v62, (uint64_t)v6, &qword_1002F8BA0);
  int v63 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  id v64 = v6;
  uint64_t v65 = v86;
  if (v63((uint64_t)v64, 1, v86) == 1)
  {
    sub_10000B070(v49, &qword_1002F8BA0);
  }
  else
  {
    uint64_t v66 = v49;
    uint64_t v67 = v48;
    NSString v68 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 32);
    v68(v87, v66, v65);
    uint64_t v69 = v85;
    sub_10000C3A4(v1 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_end, v85, &qword_1002F8BA0);
    if (v63(v69, 1, v65) == 1)
    {
      (*(void (**)(char *, uint64_t))(v48 + 8))(v87, v65);
      sub_10000B070(v69, &qword_1002F8BA0);
    }
    else
    {
      char v70 = v84;
      v68(v84, v69, v65);
      uint64_t v71 = v87;
      Date.timeIntervalSince(_:)();
      Class v73 = NSNumber.init(floatLiteral:)(v72).super.super.isa;
      char v74 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v88 = v61;
      sub_100205C04((uint64_t)v73, 0x6E6F697461727564, 0xE800000000000000, v74);
      Class v61 = v88;
      swift_bridgeObjectRelease();
      char v75 = *(void (**)(char *, uint64_t))(v67 + 8);
      v75(v70, v65);
      v75(v71, v65);
    }
  }
  Class v76 = NSNumber.init(integerLiteral:)(*(void *)(v1
                                                 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_inputSubtokenCount)).super.super.isa;
  char v77 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v88 = v61;
  sub_100205C04((uint64_t)v76, 0x64726F77627573, 0xE700000000000000, v77);
  uint64_t v78 = v88;
  swift_bridgeObjectRelease();
  Class v79 = NSNumber.init(integerLiteral:)(*(void *)(v1
                                                 + OBJC_IVAR____TtC17SequoiaTranslator25TypedInputInstrumentation_inputTokenCount)).super.super.isa;
  char v80 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v88 = v78;
  sub_100205C04((uint64_t)v79, 0xD000000000000011, 0x8000000100264DA0, v80);
  uint64_t v81 = v88;
  swift_bridgeObjectRelease();
  return v81;
}

unint64_t sub_100238628(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1002C8DC0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

void sub_100238674(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_10000B0CC(0, (unint64_t *)&qword_1002EEE20);
    sub_10001158C();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v21;
    uint64_t v19 = v22;
    uint64_t v3 = v23;
    uint64_t v2 = v24;
    unint64_t v4 = v25;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v3 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
  }
  int64_t v8 = (unint64_t)(v3 + 64) >> 6;
  while (v1 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_41;
    }
    sub_10000B0CC(0, (unint64_t *)&qword_1002EEE20);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v12 = v20;
    swift_unknownObjectRelease();
    uint64_t v11 = v2;
    uint64_t v9 = v4;
    if (!v20) {
      goto LABEL_41;
    }
LABEL_33:
    self;
    uint64_t v16 = swift_dynamicCastObjCClass();
    if (!v16) {
      goto LABEL_8;
    }
    id v17 = (void *)v16;
    id v12 = v12;
    if ([v17 activationState])
    {
      id v18 = [v17 activationState];

      if (v18 != (id)1)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
    }
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
LABEL_9:
    uint64_t v2 = v11;
    unint64_t v4 = v9;
  }
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v2 << 6);
    uint64_t v11 = v2;
LABEL_32:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_41;
    }
    goto LABEL_33;
  }
  int64_t v13 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    if (v13 >= v8) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v19 + 8 * v13);
    uint64_t v11 = v2 + 1;
    if (!v14)
    {
      uint64_t v11 = v2 + 2;
      if (v2 + 2 >= v8) {
        goto LABEL_41;
      }
      unint64_t v14 = *(void *)(v19 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v2 + 3;
        if (v2 + 3 >= v8) {
          goto LABEL_41;
        }
        unint64_t v14 = *(void *)(v19 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v2 + 4;
          if (v2 + 4 >= v8) {
            goto LABEL_41;
          }
          unint64_t v14 = *(void *)(v19 + 8 * v11);
          if (!v14)
          {
            uint64_t v11 = v2 + 5;
            if (v2 + 5 >= v8) {
              goto LABEL_41;
            }
            unint64_t v14 = *(void *)(v19 + 8 * v11);
            if (!v14)
            {
              uint64_t v15 = v2 + 6;
              while (v8 != v15)
              {
                unint64_t v14 = *(void *)(v19 + 8 * v15++);
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_31;
                }
              }
LABEL_41:
              sub_100011710();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

void *sub_1002389D4()
{
  unint64_t v0 = sub_100238AD4();
  if (v0)
  {
    unint64_t v1 = v0;
    if (v0 >> 62) {
      goto LABEL_16;
    }
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
    {
      uint64_t v3 = 4;
      while (1)
      {
        id v4 = (v1 & 0xC000000000000001) != 0
           ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
           : *(id *)(v1 + 8 * v3);
        uint64_t v5 = v4;
        uint64_t v6 = v3 - 3;
        if (__OFADD__(v3 - 4, 1)) {
          break;
        }
        if ([v4 isKeyWindow])
        {
          swift_bridgeObjectRelease_n();
          return v5;
        }

        ++v3;
        if (v6 == v2) {
          goto LABEL_11;
        }
      }
      __break(1u);
LABEL_16:
      swift_bridgeObjectRetain();
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_100238AD4()
{
  id v1 = [v0 connectedScenes];
  sub_10000B0CC(0, (unint64_t *)&qword_1002EEE20);
  sub_10001158C();
  uint64_t v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100238674(v2);
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v15 = (uint64_t)_swiftEmptyArrayStorage;
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease_n();
    uint64_t v11 = (uint64_t)_swiftEmptyArrayStorage;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  if (!v5) {
    goto LABEL_12;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v7 = *(id *)(v4 + 8 * v6 + 32);
      }
      int64_t v8 = v7;
      ++v6;
      id v9 = [v7 windows];
      sub_10000B0CC(0, &qword_1002FCAC8);
      unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      sub_1001D0688(v10);
    }
    while (v5 != v6);
    swift_bridgeObjectRelease_n();
    uint64_t v11 = v15;
    if (v15 < 0) {
      goto LABEL_17;
    }
LABEL_13:
    if ((v11 & 0x4000000000000000) == 0)
    {
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      goto LABEL_15;
    }
LABEL_17:
    unint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v12 = (uint64_t)sub_1002258D4(v14);
    swift_bridgeObjectRelease();
LABEL_15:
    uint64_t v15 = v12;
    sub_100238CFC(&v15);
    swift_bridgeObjectRelease();
    return v15;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_100238CFC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10023B95C(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100238D78(v6);
  return specialized ContiguousArray._endMutation()();
}

void sub_100238D78(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_150;
    }
    if (v3) {
      sub_100239618(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_158;
  }
  Swift::Int v118 = v4;
  Swift::Int v122 = v3;
  uint64_t v116 = a1;
  if (v3 < 2)
  {
    int64_t v8 = (char *)_swiftEmptyArrayStorage;
    uint64_t v125 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v123 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
LABEL_116:
      if (v12 >= 2)
      {
        uint64_t v107 = *v116;
        do
        {
          unint64_t v108 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_145;
          }
          if (!v107) {
            goto LABEL_157;
          }
          uint64_t v109 = v8;
          uint64_t v110 = v8 + 32;
          uint64_t v111 = *(void *)&v8[16 * v108 + 32];
          uint64_t v112 = *(void *)&v8[16 * v12 + 24];
          sub_100239794((id *)(v107 + 8 * v111), (id *)(v107 + 8 * *(void *)&v110[16 * v12 - 16]), v107 + 8 * v112, v123);
          if (v1) {
            break;
          }
          if (v112 < v111) {
            goto LABEL_146;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v109 = sub_10023B8E4((uint64_t)v109);
          }
          if (v108 >= *((void *)v109 + 2)) {
            goto LABEL_147;
          }
          uint64_t v113 = &v109[16 * v108 + 32];
          *(void *)uint64_t v113 = v111;
          *((void *)v113 + 1) = v112;
          unint64_t v114 = *((void *)v109 + 2);
          if (v12 > v114) {
            goto LABEL_148;
          }
          int64_t v8 = v109;
          memmove(&v109[16 * v12 + 16], &v109[16 * v12 + 32], 16 * (v114 - v12));
          *((void *)v109 + 2) = v114 - 1;
          unint64_t v12 = v114 - 1;
        }
        while (v114 > 2);
      }
LABEL_127:
      swift_bridgeObjectRelease();
      *(void *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_10000B0CC(0, &qword_1002FCAC8);
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    uint64_t v123 = (char *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v125 = v7;
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v117 = *a1 - 8;
  int64_t v8 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v11 = v122;
  uint64_t v124 = *a1;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 < v11)
    {
      unint64_t v14 = *(void **)(v10 + 8 * v13);
      id v15 = *(id *)(v10 + 8 * v9);
      id v16 = v14;
      id v17 = [v15 windowScene];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = (uint64_t)[v17 activationState];
      }
      else
      {
        uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v20 = [v16 windowScene];
      if (v20)
      {
        uint64_t v21 = v20;
        id v22 = [v20 activationState];

        BOOL v88 = v19 < (uint64_t)v22;
        uint64_t v10 = v124;
        BOOL v23 = v88;
      }
      else
      {

        BOOL v23 = v19 != 0x7FFFFFFFFFFFFFFFLL;
      }
      BOOL v120 = v23;
      Swift::Int v24 = v13 + 2;
      if (v13 + 2 < v122)
      {
        do
        {
          char v26 = *(void **)(v10 + 8 * v9);
          id v27 = *(id *)(v10 + 8 * v24);
          id v28 = v26;
          id v29 = [v27 windowScene];
          if (v29)
          {
            Class v30 = v29;
            uint64_t v31 = (uint64_t)[v29 activationState];
          }
          else
          {
            uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
          }
          id v32 = [v28 windowScene];
          if (v32)
          {
            Class v33 = v32;
            id v34 = [v32 activationState];

            BOOL v88 = v31 < (uint64_t)v34;
            uint64_t v10 = v124;
            int v35 = !v88;
            if (((v120 ^ v35) & 1) == 0) {
              goto LABEL_36;
            }
          }
          else
          {

            if (v120 == (v31 == 0x7FFFFFFFFFFFFFFFLL)) {
              goto LABEL_36;
            }
          }
          Swift::Int v25 = v24 + 1;
          Swift::Int v9 = v24;
          Swift::Int v24 = v25;
        }
        while (v25 < v122);
        Swift::Int v24 = v25;
        if (!v120) {
          goto LABEL_45;
        }
      }
      else
      {
LABEL_36:
        if (!v120)
        {
LABEL_45:
          Swift::Int v9 = v24;
          goto LABEL_46;
        }
      }
      if (v24 < v13) {
        goto LABEL_151;
      }
      if (v13 < v24)
      {
        Class v36 = (uint64_t *)(v117 + 8 * v24);
        Swift::Int v37 = v24;
        Swift::Int v38 = v13;
        Class v39 = (uint64_t *)(v10 + 8 * v13);
        while (1)
        {
          if (v38 != --v37)
          {
            if (!v10) {
              goto LABEL_156;
            }
            uint64_t v40 = *v39;
            *Class v39 = *v36;
            *Class v36 = v40;
          }
          ++v38;
          --v36;
          ++v39;
          if (v38 >= v37) {
            goto LABEL_45;
          }
        }
      }
      goto LABEL_45;
    }
LABEL_46:
    uint64_t v121 = v13;
    if (v9 >= v122) {
      goto LABEL_68;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_149;
    }
    if (v9 - v13 >= v118) {
      goto LABEL_68;
    }
    if (__OFADD__(v13, v118)) {
      goto LABEL_152;
    }
    Swift::Int v41 = v122;
    if (v13 + v118 < v122) {
      Swift::Int v41 = v13 + v118;
    }
    if (v41 < v13) {
      break;
    }
    if (v9 != v41)
    {
      BOOL v115 = v8;
      uint64_t v42 = v117 + 8 * v9;
      Swift::Int v119 = v41;
      do
      {
        char v43 = *(void **)(v10 + 8 * v9);
        uint64_t v44 = v121;
        uint64_t v45 = v42;
        do
        {
          char v46 = *(void **)v45;
          id v47 = v43;
          id v48 = v46;
          id v49 = [v47 windowScene];
          if (v49)
          {
            NSString v50 = v49;
            uint64_t v51 = (uint64_t)[v49 activationState];
          }
          else
          {
            uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
          }
          id v52 = [v48 windowScene];
          if (v52)
          {
            Class v53 = v52;
            id v54 = [v52 activationState];

            BOOL v88 = v51 < (uint64_t)v54;
            uint64_t v10 = v124;
            if (!v88) {
              break;
            }
          }
          else
          {

            if (v51 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
          }
          if (!v10) {
            goto LABEL_154;
          }
          char v55 = *(void **)v45;
          char v43 = *(void **)(v45 + 8);
          *(void *)uint64_t v45 = v43;
          *(void *)(v45 + 8) = v55;
          v45 -= 8;
          ++v44;
        }
        while (v9 != v44);
        ++v9;
        v42 += 8;
      }
      while (v9 != v119);
      Swift::Int v9 = v119;
      int64_t v8 = v115;
      Swift::Int v13 = v121;
    }
LABEL_68:
    if (v9 < v13) {
      goto LABEL_144;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v8 = sub_10023B4F4(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v57 = *((void *)v8 + 2);
    unint64_t v56 = *((void *)v8 + 3);
    unint64_t v12 = v57 + 1;
    if (v57 >= v56 >> 1) {
      int64_t v8 = sub_10023B4F4((char *)(v56 > 1), v57 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v12;
    id v58 = v8 + 32;
    Class v59 = &v8[16 * v57 + 32];
    *(void *)Class v59 = v121;
    *((void *)v59 + 1) = v9;
    if (v57)
    {
      while (1)
      {
        unint64_t v60 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v65 = &v58[16 * v12];
          uint64_t v66 = *((void *)v65 - 8);
          uint64_t v67 = *((void *)v65 - 7);
          BOOL v71 = __OFSUB__(v67, v66);
          uint64_t v68 = v67 - v66;
          if (v71) {
            goto LABEL_133;
          }
          uint64_t v70 = *((void *)v65 - 6);
          uint64_t v69 = *((void *)v65 - 5);
          BOOL v71 = __OFSUB__(v69, v70);
          uint64_t v63 = v69 - v70;
          char v64 = v71;
          if (v71) {
            goto LABEL_134;
          }
          unint64_t v72 = v12 - 2;
          Class v73 = &v58[16 * v12 - 32];
          uint64_t v75 = *(void *)v73;
          uint64_t v74 = *((void *)v73 + 1);
          BOOL v71 = __OFSUB__(v74, v75);
          uint64_t v76 = v74 - v75;
          if (v71) {
            goto LABEL_136;
          }
          BOOL v71 = __OFADD__(v63, v76);
          uint64_t v77 = v63 + v76;
          if (v71) {
            goto LABEL_139;
          }
          if (v77 >= v68)
          {
            uint64_t v95 = &v58[16 * v60];
            uint64_t v97 = *(void *)v95;
            uint64_t v96 = *((void *)v95 + 1);
            BOOL v71 = __OFSUB__(v96, v97);
            uint64_t v98 = v96 - v97;
            if (v71) {
              goto LABEL_143;
            }
            BOOL v88 = v63 < v98;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v89 = *((void *)v8 + 4);
            uint64_t v90 = *((void *)v8 + 5);
            BOOL v71 = __OFSUB__(v90, v89);
            uint64_t v82 = v90 - v89;
            char v83 = v71;
            goto LABEL_99;
          }
          uint64_t v62 = *((void *)v8 + 4);
          uint64_t v61 = *((void *)v8 + 5);
          BOOL v71 = __OFSUB__(v61, v62);
          uint64_t v63 = v61 - v62;
          char v64 = v71;
        }
        if (v64) {
          goto LABEL_135;
        }
        unint64_t v72 = v12 - 2;
        uint64_t v78 = &v58[16 * v12 - 32];
        uint64_t v80 = *(void *)v78;
        uint64_t v79 = *((void *)v78 + 1);
        BOOL v81 = __OFSUB__(v79, v80);
        uint64_t v82 = v79 - v80;
        char v83 = v81;
        if (v81) {
          goto LABEL_138;
        }
        uint64_t v84 = &v58[16 * v60];
        uint64_t v86 = *(void *)v84;
        uint64_t v85 = *((void *)v84 + 1);
        BOOL v71 = __OFSUB__(v85, v86);
        uint64_t v87 = v85 - v86;
        if (v71) {
          goto LABEL_141;
        }
        if (__OFADD__(v82, v87)) {
          goto LABEL_142;
        }
        if (v82 + v87 >= v63)
        {
          BOOL v88 = v63 < v87;
LABEL_105:
          if (v88) {
            unint64_t v60 = v72;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v83) {
          goto LABEL_137;
        }
        uint64_t v91 = &v58[16 * v60];
        uint64_t v93 = *(void *)v91;
        uint64_t v92 = *((void *)v91 + 1);
        BOOL v71 = __OFSUB__(v92, v93);
        uint64_t v94 = v92 - v93;
        if (v71) {
          goto LABEL_140;
        }
        if (v94 < v82) {
          goto LABEL_14;
        }
LABEL_107:
        unint64_t v99 = v60 - 1;
        if (v60 - 1 >= v12)
        {
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
          goto LABEL_153;
        }
        if (!v10) {
          goto LABEL_155;
        }
        uint64_t v100 = v8;
        uint64_t v101 = v10;
        int v102 = &v58[16 * v99];
        uint64_t v103 = *(void *)v102;
        int v104 = &v58[16 * v60];
        uint64_t v105 = *((void *)v104 + 1);
        sub_100239794((id *)(v101 + 8 * *(void *)v102), (id *)(v101 + 8 * *(void *)v104), v101 + 8 * v105, v123);
        if (v1) {
          goto LABEL_127;
        }
        if (v105 < v103) {
          goto LABEL_130;
        }
        if (v60 > *((void *)v100 + 2)) {
          goto LABEL_131;
        }
        *(void *)int v102 = v103;
        *(void *)&v58[16 * v99 + 8] = v105;
        unint64_t v106 = *((void *)v100 + 2);
        if (v60 >= v106) {
          goto LABEL_132;
        }
        int64_t v8 = v100;
        unint64_t v12 = v106 - 1;
        memmove(&v58[16 * v60], v104 + 16, 16 * (v106 - 1 - v60));
        *((void *)v100 + 2) = v106 - 1;
        uint64_t v10 = v124;
        if (v106 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_14:
    Swift::Int v11 = v122;
    if (v9 >= v122) {
      goto LABEL_116;
    }
  }
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100239618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v29 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
    uint64_t v6 = &selRef_initWithTagSchemes_options_;
    uint64_t v7 = &selRef_initWithTagSchemes_options_;
LABEL_5:
    int64_t v8 = *(void **)(v29 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v28 = v5;
    while (1)
    {
      uint64_t v10 = *(void **)v5;
      id v11 = v8;
      id v12 = v10;
      id v13 = [v11 v6[34]];
      if (v13)
      {
        unint64_t v14 = v13;
        uint64_t v15 = (uint64_t)[v13 v7[329]];
      }
      else
      {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v16 = [v12 v6[34]];
      if (v16)
      {
        id v17 = v16;
        id v18 = [v16 v7[329]];
        uint64_t v19 = v11;
        uint64_t v20 = v4;
        uint64_t v21 = v7;
        id v22 = v6;
        uint64_t v23 = (uint64_t)v18;

        BOOL v24 = v15 < v23;
        uint64_t v6 = v22;
        uint64_t v7 = v21;
        uint64_t v4 = v20;
        if (!v24) {
          goto LABEL_4;
        }
      }
      else
      {

        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_4;
        }
      }
      if (!v29) {
        break;
      }
      Swift::Int v25 = *(void **)v5;
      int64_t v8 = *(void **)(v5 + 8);
      *(void *)uint64_t v5 = v8;
      *(void *)(v5 + 8) = v25;
      v5 -= 8;
      if (v4 == ++v9)
      {
LABEL_4:
        ++v4;
        uint64_t v5 = v28 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
    }
    __break(1u);
  }
}

uint64_t sub_100239794(id *a1, id *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = __src;
  uint64_t v5 = (char *)__src - (char *)a1;
  uint64_t v6 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v6 = (char *)__src - (char *)a1;
  }
  uint64_t v7 = v6 >> 3;
  uint64_t v8 = a3 - (void)__src;
  uint64_t v9 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v9 = a3 - (void)__src;
  }
  uint64_t v10 = v9 >> 3;
  id v47 = a1;
  char v46 = (void **)a4;
  if (v7 >= v9 >> 3)
  {
    if (v8 < -7) {
      goto LABEL_54;
    }
    if (a4 != (char *)__src || &__src[v10] <= (id *)a4) {
      memmove(a4, __src, 8 * v10);
    }
    Swift::Int v25 = &a4[8 * v10];
    uint64_t v45 = v25;
    id v47 = v4;
    if (a1 >= v4 || v8 < 8)
    {
LABEL_53:
      sub_10023B780(&v47, &v46, &v45);
      return 1;
    }
    char v26 = (id *)(a3 - 8);
    id v27 = v4;
    while (1)
    {
      unint64_t v42 = (unint64_t)v25;
      uint64_t v44 = v4;
      uint64_t v28 = v25 - 8;
      uint64_t v29 = *--v27;
      id v30 = *((id *)v25 - 1);
      id v31 = v29;
      id v32 = [v30 windowScene];
      if (v32)
      {
        Class v33 = v32;
        uint64_t v34 = (uint64_t)[v32 activationState];
      }
      else
      {
        uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
      }
      int v35 = v26 + 1;
      id v36 = [v31 windowScene];
      if (v36)
      {
        Swift::Int v37 = v36;
        id v38 = [v36 activationState];

        if (v34 >= (uint64_t)v38) {
          goto LABEL_46;
        }
      }
      else
      {

        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_46:
          uint64_t v45 = v28;
          id v27 = v44;
          if ((unint64_t)v35 < v42 || (unint64_t)v26 >= v42 || v35 != (id *)v42) {
            *char v26 = *(id *)v28;
          }
          Swift::Int v25 = v28;
          goto LABEL_51;
        }
      }
      Swift::Int v25 = (char *)v42;
      if (v35 != v44 || v26 >= v44) {
        *char v26 = *v27;
      }
      id v47 = v27;
LABEL_51:
      if (v27 > a1)
      {
        --v26;
        uint64_t v4 = v27;
        if (v25 > a4) {
          continue;
        }
      }
      goto LABEL_53;
    }
  }
  if (v5 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v7] <= (id *)a4) {
      memmove(a4, a1, 8 * v7);
    }
    id v11 = &a4[8 * v7];
    uint64_t v45 = v11;
    if ((unint64_t)v4 < a3 && v5 >= 8)
    {
      id v12 = (void **)a4;
      id v13 = a1;
      while (1)
      {
        unint64_t v14 = v4;
        uint64_t v15 = *v12;
        id v16 = *v4;
        id v17 = v15;
        id v18 = [v16 windowScene];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = (uint64_t)[v18 activationState];
        }
        else
        {
          uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
        }
        id v21 = [v17 windowScene];
        if (v21)
        {
          id v22 = v21;
          id v23 = [v21 activationState];

          if (v20 >= (uint64_t)v23) {
            goto LABEL_23;
          }
        }
        else
        {

          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_23:
            if (v13 != v12) {
              *id v13 = *v12;
            }
            char v46 = ++v12;
            BOOL v24 = v14;
            goto LABEL_26;
          }
        }
        BOOL v24 = v14 + 1;
        if (v13 < v14 || v13 >= v24 || v13 != v14) {
          *id v13 = *v14;
        }
LABEL_26:
        ++v13;
        if (v12 < (void **)v11)
        {
          uint64_t v4 = v24;
          if ((unint64_t)v24 < a3) {
            continue;
          }
        }
        id v47 = v13;
        goto LABEL_53;
      }
    }
    goto LABEL_53;
  }
LABEL_54:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100239B68(double a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  sub_100007620((uint64_t *)&unk_1002F0270);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100249A60;
  uint64_t v8 = self;
  id v9 = [v8 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1 compatibleWithTraitCollection:0];
  uint64_t v10 = self;
  [v9 pointSize];
  id v11 = [v10 systemFontOfSize:];
  id v12 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle1];
  id v13 = [v12 scaledFontForFont:v11 maximumPointSize:1.79769313e308];

  *(void *)(inited + 32) = v13;
  id v14 = [v8 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 compatibleWithTraitCollection:0];
  [v14 pointSize];
  id v15 = [v10 systemFontOfSize:];
  id v16 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle2];
  id v17 = [v16 scaledFontForFont:v15 maximumPointSize:1.79769313e308];

  *(void *)(inited + 40) = v17;
  id v18 = [v8 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle3 compatibleWithTraitCollection:0];
  [v18 pointSize];
  id v19 = [v10 systemFontOfSize:];
  id v20 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle3];
  id v21 = [v20 scaledFontForFont:v19 maximumPointSize:1.79769313e308];

  *(void *)(inited + 48) = v21;
  id v22 = [v8 preferredFontDescriptorWithTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:0];
  [v22 pointSize];
  id v23 = [v10 systemFontOfSize:];
  id v24 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleBody];
  id v25 = [v24 scaledFontForFont:v23 maximumPointSize:1.79769313e308];

  *(void *)(inited + 56) = v25;
  unint64_t v107 = inited;
  specialized Array._endMutation()();
  if (a5)
  {
    id v26 = a5;
    p_weak_ivar_lyt = (void **)(&ResourceBundleClass + 56);
  }
  else
  {
    id v28 = [v8 preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1 compatibleWithTraitCollection:0];
    p_weak_ivar_lyt = &ResourceBundleClass.weak_ivar_lyt;
    [v28 pointSize];
    id v29 = [v10 systemFontOfSize:];
    id v30 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:UIFontTextStyleTitle1];
    id v26 = [v30 scaledFontForFont:v29 maximumPointSize:1.79769313e308];
  }
  double v31 = floor(a1);
  double v32 = floor(a2);
  id v33 = objc_allocWithZone((Class)NSString);
  id v34 = a5;
  id v35 = v26;
  swift_bridgeObjectRetain();
  NSString v36 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v37 = [v33 initWithString:v36];

  sub_100007620(&qword_1002FC3D0);
  uint64_t v38 = swift_initStackObject();
  *(_OWORD *)(v38 + 16) = xmmword_1002488D0;
  *(void *)(v38 + 32) = NSFontAttributeName;
  unint64_t v105 = sub_1001A5590();
  *(void *)(v38 + 64) = v105;
  *(void *)(v38 + 40) = v35;
  id v39 = v35;
  int v104 = NSFontAttributeName;
  sub_1001FF520(v38);
  type metadata accessor for Key(0);
  sub_100136748();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v37 boundingRectWithSize:1 options:isa attributes:0 context:v31];
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;

  v108.origin.CGFloat x = v42;
  v108.origin.CGFloat y = v44;
  v108.size.CGFloat width = v46;
  v108.size.CGFloat height = v48;
  double Height = CGRectGetHeight(v108);

  if (v32 >= ceil(Height))
  {
    unint64_t v75 = inited;
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v75 = inited;
      uint64_t v76 = _CocoaArrayWrapper.endIndex.getter();
      if (v76)
      {
LABEL_18:
        unint64_t v77 = v75 & 0xC000000000000001;
        uint64_t v78 = 4;
        while (1)
        {
          if (v77) {
            id v79 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v79 = *(id *)(v75 + 8 * v78);
          }
          uint64_t v80 = v79;
          uint64_t v81 = v78 - 3;
          if (__OFADD__(v78 - 4, 1)) {
            goto LABEL_28;
          }
          [v79 p_weak_ivar_lyt[222]];
          double v83 = v82;
          [v39 p_weak_ivar_lyt[222]];
          if (v84 < v83)
          {
            id v85 = objc_allocWithZone((Class)NSString);
            swift_bridgeObjectRetain();
            NSString v86 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            id v87 = [v85 initWithString:v86];

            uint64_t v88 = swift_initStackObject();
            *(_OWORD *)(v88 + 16) = xmmword_1002488D0;
            *(void *)(v88 + 64) = v105;
            *(void *)(v88 + 32) = v104;
            *(void *)(v88 + 40) = v80;
            uint64_t v89 = v104;
            id v65 = v80;
            sub_1001FF520(v88);
            Class v90 = Dictionary._bridgeToObjectiveC()().super.isa;
            p_weak_ivar_lyt = (void **)(&ResourceBundleClass + 56);
            swift_bridgeObjectRelease();
            [v87 boundingRectWithSize:1 options:v90 attributes:0 context:v31];
            CGFloat v92 = v91;
            CGFloat v94 = v93;
            CGFloat v96 = v95;
            CGFloat v98 = v97;

            unint64_t v75 = v107;
            v110.origin.CGFloat x = v92;
            v110.origin.CGFloat y = v94;
            v110.size.CGFloat width = v96;
            v110.size.CGFloat height = v98;
            if (ceil(CGRectGetHeight(v110)) < v32) {
              break;
            }
          }

          ++v78;
          if (v81 == v76) {
            goto LABEL_41;
          }
        }
LABEL_26:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v39 = v65;
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v76 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v76) {
        goto LABEL_18;
      }
    }
LABEL_41:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  unint64_t v50 = inited;
  unint64_t v103 = inited >> 62;
  if (inited >> 62) {
    goto LABEL_29;
  }
  uint64_t v51 = *(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (; v51; uint64_t v51 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v52 = v50 & 0xC000000000000001;
    uint64_t v53 = 4;
    while (1)
    {
      id v54 = v52 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v50 + 8 * v53);
      char v55 = v54;
      uint64_t v56 = v53 - 3;
      if (__OFADD__(v53 - 4, 1)) {
        break;
      }
      [v54 p_weak_ivar_lyt[222]];
      double v58 = v57;
      [v39 p_weak_ivar_lyt[222]];
      if (v58 < v59)
      {
        id v60 = objc_allocWithZone((Class)NSString);
        swift_bridgeObjectRetain();
        NSString v61 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v62 = [v60 initWithString:v61];

        uint64_t v63 = swift_initStackObject();
        *(_OWORD *)(v63 + 16) = xmmword_1002488D0;
        *(void *)(v63 + 64) = v105;
        *(void *)(v63 + 32) = v104;
        *(void *)(v63 + 40) = v55;
        char v64 = v104;
        id v65 = v55;
        sub_1001FF520(v63);
        Class v66 = Dictionary._bridgeToObjectiveC()().super.isa;
        p_weak_ivar_lyt = (void **)(&ResourceBundleClass + 56);
        swift_bridgeObjectRelease();
        [v62 boundingRectWithSize:1 options:v66 attributes:0 context:v31];
        CGFloat v68 = v67;
        CGFloat v70 = v69;
        CGFloat v72 = v71;
        CGFloat v74 = v73;

        unint64_t v50 = v107;
        v109.origin.CGFloat x = v68;
        v109.origin.CGFloat y = v70;
        v109.size.CGFloat width = v72;
        v109.size.CGFloat height = v74;
        if (ceil(CGRectGetHeight(v109)) < v32) {
          goto LABEL_26;
        }
      }

      ++v53;
      if (v56 == v51) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v50 = v107;
  }
LABEL_30:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v103)
  {
    swift_bridgeObjectRetain();
    uint64_t v99 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v99)
    {
LABEL_42:
      swift_bridgeObjectRelease();
      return (unint64_t)v39;
    }
  }
  else
  {
    uint64_t v99 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v99) {
      goto LABEL_42;
    }
  }
  unint64_t result = v99 - 1;
  if (__OFSUB__(v99, 1))
  {
    __break(1u);
    goto LABEL_44;
  }
  if ((v50 & 0xC000000000000001) != 0)
  {
LABEL_44:
    id v101 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_39;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v101 = *(id *)(v50 + 8 * result + 32);
LABEL_39:
    id v102 = v101;

    id v39 = v102;
    goto LABEL_42;
  }
  __break(1u);
  return result;
}

id sub_10023A5B4(uint64_t a1, id a2)
{
  uint64_t v3 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for UserInterfaceSizeClass.compact(_:), v3);
  char v7 = static UserInterfaceSizeClass.== infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v8 = (id *)&UIFontTextStyleTitle2;
  if ((v7 & 1) == 0) {
    uint64_t v8 = (id *)&UIFontTextStyleTitle1;
  }
  id v9 = *v8;
  if (a2) {
    a2 = [self traitCollectionWithPreferredContentSizeCategory:a2];
  }
  id v10 = [self preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:a2];
  id v11 = self;
  [v10 pointSize];
  id v12 = [v11 systemFontOfSize:];
  id v13 = [objc_allocWithZone((Class)UIFontMetrics) initForTextStyle:v9];
  id v14 = [v13 scaledFontForFont:v12 maximumPointSize:1.79769313e308];

  return v14;
}

uint64_t sub_10023A7E0()
{
  [v0 frame];
  double v2 = v1;
  id v3 = [v0 _restingHeights];
  if (!v3) {
    goto LABEL_19;
  }
  uint64_t v4 = v3;
  sub_1000A6138();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6)
    {
LABEL_4:
      id v17 = _swiftEmptyArrayStorage;
      sub_1000B2EFC(0, v6 & ~(v6 >> 63), 0);
      if ((v6 & 0x8000000000000000) == 0)
      {
        uint64_t v7 = 0;
        uint64_t v8 = v17;
        do
        {
          if ((v5 & 0xC000000000000001) != 0) {
            id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v9 = *(id *)(v5 + 8 * v7 + 32);
          }
          id v10 = v9;
          CGFloat.init(truncating:)();
          uint64_t v12 = v11;

          id v17 = v8;
          unint64_t v14 = v8[2];
          unint64_t v13 = v8[3];
          if (v14 >= v13 >> 1)
          {
            sub_1000B2EFC(v13 > 1, v14 + 1, 1);
            uint64_t v8 = v17;
          }
          ++v7;
          v8[2] = v14 + 1;
          v8[v14 + 4] = v12;
        }
        while (v6 != v7);
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
      __break(1u);
LABEL_19:
      __break(1u);
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = _swiftEmptyArrayStorage;
LABEL_15:
  id v17 = v8;
  swift_bridgeObjectRetain();
  sub_10023AB84((uint64_t *)&v17);
  swift_bridgeObjectRelease();
  if (v17[2] == 2)
  {
    double v15 = *((double *)v17 + 5);
    swift_release();
    return v2 == v15;
  }
  else
  {
    swift_release();
    return 0;
  }
}

void sub_10023A9E4()
{
  id v1 = [v0 _restingHeights];
  if (v1)
  {
    double v2 = v1;
    sub_1000A6138();
    unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v10 == 2)
      {
        swift_bridgeObjectRetain();
        uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
        if (v4)
        {
LABEL_5:
          if ((v3 & 0xC000000000000001) != 0)
          {
            id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_22;
            }
            id v5 = *(id *)(v3 + 32);
          }
          uint64_t v6 = v5;
          swift_bridgeObjectRelease();
          CGFloat.init(truncating:)();

          unint64_t v7 = v4 - 1;
          if (!__OFSUB__(v4, 1))
          {
            if ((v3 & 0xC000000000000001) != 0)
            {
              id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_14:
              id v9 = v8;
              swift_bridgeObjectRelease();
              CGFloat.init(truncating:)();

              return;
            }
            if ((v7 & 0x8000000000000000) == 0)
            {
              if (v7 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                id v8 = *(id *)(v3 + 8 * v7 + 32);
                goto LABEL_14;
              }
              goto LABEL_24;
            }
LABEL_23:
            __break(1u);
LABEL_24:
            __break(1u);
            return;
          }
          __break(1u);
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
        swift_bridgeObjectRelease();
        __break(1u);
      }
    }
    else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) == 2)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = 2;
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
  }
}

Swift::Int sub_10023AB84(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10023B948(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_10023ABF0(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_10023ABF0(void *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v80 = 0;
      uint64_t v81 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v83 = *(double *)(v81 + 8 * i);
        uint64_t v84 = v80;
        do
        {
          uint64_t v85 = v81 + 8 * v84;
          if (v83 >= *(double *)v85) {
            break;
          }
          if (!v81) {
            goto LABEL_140;
          }
          *(void *)(v85 + 8) = *(void *)v85;
          *(double *)(v81 + 8 * v84--) = v83;
        }
        while (v84 != -1);
        ++v80;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  Swift::Int v97 = result;
  Swift::Int v98 = v3;
  if (v3 < 2)
  {
    id v8 = _swiftEmptyArrayStorage;
    __dst = (double *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_102:
      CGFloat v96 = v8;
      if (v12 >= 2)
      {
        uint64_t v86 = *v2;
        do
        {
          unint64_t v87 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_131;
          }
          if (!v86) {
            goto LABEL_144;
          }
          uint64_t v88 = v11;
          uint64_t v89 = v11 + 32;
          uint64_t v90 = *(void *)&v11[16 * v87 + 32];
          uint64_t v91 = *(void *)&v11[16 * v12 + 24];
          sub_10023B284((double *)(v86 + 8 * v90), (double *)(v86 + 8 * *(void *)&v89[16 * v12 - 16]), v86 + 8 * v91, __dst);
          if (v1) {
            break;
          }
          if (v91 < v90) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v88 = sub_10023B8E4((uint64_t)v88);
          }
          if (v87 >= *((void *)v88 + 2)) {
            goto LABEL_133;
          }
          CGFloat v92 = &v88[16 * v87 + 32];
          *(void *)CGFloat v92 = v90;
          *((void *)v92 + 1) = v91;
          unint64_t v93 = *((void *)v88 + 2);
          if (v12 > v93) {
            goto LABEL_134;
          }
          memmove(&v88[16 * v12 + 16], &v88[16 * v12 + 32], 16 * (v93 - v12));
          uint64_t v11 = v88;
          *((void *)v88 + 2) = v93 - 1;
          unint64_t v12 = v93 - 1;
        }
        while (v93 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      v96[2] = 0;
      return swift_bridgeObjectRelease();
    }
    CGFloat v96 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v7 + 16) = v6;
    Swift::Int v3 = v98;
    CGFloat v96 = (void *)v7;
    __dst = (double *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *v2;
  CGFloat v94 = v2;
  uint64_t v95 = *v2 - 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  uint64_t v99 = *v2;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 < v3)
    {
      double v14 = *(double *)(v10 + 8 * v9);
      double v15 = *(double *)(v10 + 8 * v13);
      Swift::Int v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        double v16 = v14;
        while (1)
        {
          double v17 = v16;
          double v16 = *(double *)(v10 + 8 * v9);
          if (v14 < v15 == v16 >= v17) {
            break;
          }
          if (v3 == ++v9)
          {
            Swift::Int v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13) {
          goto LABEL_137;
        }
        if (v13 < v9)
        {
          id v18 = (uint64_t *)(v95 + 8 * v9);
          Swift::Int v19 = v9;
          Swift::Int v20 = v13;
          id v21 = (uint64_t *)(v10 + 8 * v13);
          do
          {
            if (v20 != --v19)
            {
              if (!v10) {
                goto LABEL_143;
              }
              uint64_t v22 = *v21;
              *id v21 = *v18;
              *id v18 = v22;
            }
            ++v20;
            --v18;
            ++v21;
          }
          while (v20 < v19);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_135;
    }
    if (v9 - v13 >= v97) {
      goto LABEL_46;
    }
    Swift::Int v23 = v13 + v97;
    if (__OFADD__(v13, v97)) {
      goto LABEL_138;
    }
    if (v23 >= v3) {
      Swift::Int v23 = v3;
    }
    if (v23 < v13) {
      break;
    }
    if (v9 != v23)
    {
      id v24 = (double *)(v95 + 8 * v9);
      do
      {
        double v25 = *(double *)(v10 + 8 * v9);
        Swift::Int v26 = v13;
        id v27 = v24;
        do
        {
          double v28 = *v27;
          if (v25 >= *v27) {
            break;
          }
          if (!v10) {
            goto LABEL_141;
          }
          *id v27 = v25;
          v27[1] = v28;
          --v27;
          ++v26;
        }
        while (v9 != v26);
        ++v9;
        ++v24;
      }
      while (v9 != v23);
      Swift::Int v9 = v23;
    }
LABEL_46:
    if (v9 < v13) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_10023B4F4(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v30 = *((void *)v11 + 2);
    unint64_t v29 = *((void *)v11 + 3);
    unint64_t v12 = v30 + 1;
    uint64_t v10 = v99;
    if (v30 >= v29 >> 1)
    {
      id v79 = sub_10023B4F4((char *)(v29 > 1), v30 + 1, 1, v11);
      uint64_t v10 = v99;
      uint64_t v11 = v79;
    }
    *((void *)v11 + 2) = v12;
    double v31 = v11 + 32;
    double v32 = &v11[16 * v30 + 32];
    *(void *)double v32 = v13;
    *((void *)v32 + 1) = v9;
    if (v30)
    {
      while (1)
      {
        unint64_t v33 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v38 = &v31[16 * v12];
          uint64_t v39 = *((void *)v38 - 8);
          uint64_t v40 = *((void *)v38 - 7);
          BOOL v44 = __OFSUB__(v40, v39);
          uint64_t v41 = v40 - v39;
          if (v44) {
            goto LABEL_119;
          }
          uint64_t v43 = *((void *)v38 - 6);
          uint64_t v42 = *((void *)v38 - 5);
          BOOL v44 = __OFSUB__(v42, v43);
          uint64_t v36 = v42 - v43;
          char v37 = v44;
          if (v44) {
            goto LABEL_120;
          }
          unint64_t v45 = v12 - 2;
          CGFloat v46 = &v31[16 * v12 - 32];
          uint64_t v48 = *(void *)v46;
          uint64_t v47 = *((void *)v46 + 1);
          BOOL v44 = __OFSUB__(v47, v48);
          uint64_t v49 = v47 - v48;
          if (v44) {
            goto LABEL_122;
          }
          BOOL v44 = __OFADD__(v36, v49);
          uint64_t v50 = v36 + v49;
          if (v44) {
            goto LABEL_125;
          }
          if (v50 >= v41)
          {
            CGFloat v68 = &v31[16 * v33];
            uint64_t v70 = *(void *)v68;
            uint64_t v69 = *((void *)v68 + 1);
            BOOL v44 = __OFSUB__(v69, v70);
            uint64_t v71 = v69 - v70;
            if (v44) {
              goto LABEL_129;
            }
            BOOL v61 = v36 < v71;
            goto LABEL_83;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v62 = *((void *)v11 + 4);
            uint64_t v63 = *((void *)v11 + 5);
            BOOL v44 = __OFSUB__(v63, v62);
            uint64_t v55 = v63 - v62;
            char v56 = v44;
            goto LABEL_77;
          }
          uint64_t v35 = *((void *)v11 + 4);
          uint64_t v34 = *((void *)v11 + 5);
          BOOL v44 = __OFSUB__(v34, v35);
          uint64_t v36 = v34 - v35;
          char v37 = v44;
        }
        if (v37) {
          goto LABEL_121;
        }
        unint64_t v45 = v12 - 2;
        uint64_t v51 = &v31[16 * v12 - 32];
        uint64_t v53 = *(void *)v51;
        uint64_t v52 = *((void *)v51 + 1);
        BOOL v54 = __OFSUB__(v52, v53);
        uint64_t v55 = v52 - v53;
        char v56 = v54;
        if (v54) {
          goto LABEL_124;
        }
        double v57 = &v31[16 * v33];
        uint64_t v59 = *(void *)v57;
        uint64_t v58 = *((void *)v57 + 1);
        BOOL v44 = __OFSUB__(v58, v59);
        uint64_t v60 = v58 - v59;
        if (v44) {
          goto LABEL_127;
        }
        if (__OFADD__(v55, v60)) {
          goto LABEL_128;
        }
        if (v55 + v60 >= v36)
        {
          BOOL v61 = v36 < v60;
LABEL_83:
          if (v61) {
            unint64_t v33 = v45;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v56) {
          goto LABEL_123;
        }
        char v64 = &v31[16 * v33];
        uint64_t v66 = *(void *)v64;
        uint64_t v65 = *((void *)v64 + 1);
        BOOL v44 = __OFSUB__(v65, v66);
        uint64_t v67 = v65 - v66;
        if (v44) {
          goto LABEL_126;
        }
        if (v67 < v55) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v72 = v33 - 1;
        if (v33 - 1 >= v12)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v10) {
          goto LABEL_142;
        }
        double v73 = &v31[16 * v72];
        uint64_t v74 = *(void *)v73;
        unint64_t v75 = v31;
        uint64_t v76 = &v31[16 * v33];
        uint64_t v77 = *((void *)v76 + 1);
        sub_10023B284((double *)(v10 + 8 * *(void *)v73), (double *)(v10 + 8 * *(void *)v76), v10 + 8 * v77, __dst);
        if (v1) {
          goto LABEL_113;
        }
        if (v77 < v74) {
          goto LABEL_116;
        }
        if (v33 > *((void *)v11 + 2)) {
          goto LABEL_117;
        }
        *(void *)double v73 = v74;
        *(void *)&v75[16 * v72 + 8] = v77;
        unint64_t v78 = *((void *)v11 + 2);
        if (v33 >= v78) {
          goto LABEL_118;
        }
        unint64_t v12 = v78 - 1;
        memmove(v76, v76 + 16, 16 * (v78 - 1 - v33));
        double v31 = v75;
        *((void *)v11 + 2) = v78 - 1;
        uint64_t v10 = v99;
        if (v78 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v98;
    if (v9 >= v98)
    {
      id v8 = v96;
      uint64_t v2 = v94;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10023B284(double *__src, double *a2, unint64_t a3, double *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  id v24 = __src;
  Swift::Int v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      double v16 = &v4[v13];
      uint64_t v22 = v16;
      id v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        double v17 = (double *)(a3 - 8);
        while (1)
        {
          id v18 = v17 + 1;
          Swift::Int v19 = v6 - 1;
          double v20 = *(v6 - 1);
          if (*(v16 - 1) >= v20)
          {
            uint64_t v22 = v16 - 1;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              *double v17 = *(v16 - 1);
            }
            --v16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v18 != v6 || v17 >= v6) {
              *double v17 = v20;
            }
            id v24 = --v6;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }
          --v17;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    double v14 = &v4[v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*v6 >= *v4)
        {
          if (v7 != v4) {
            *uint64_t v7 = *v4;
          }
          Swift::Int v23 = ++v4;
          double v15 = v6;
        }
        else
        {
          double v15 = v6 + 1;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *uint64_t v7 = *v6;
          }
        }
        ++v7;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      id v24 = v7;
    }
LABEL_42:
    sub_10023B784((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10023B4F4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_100007620(&qword_1002FD328);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  double v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10023B5F0(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_10023B6AC(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -88)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 88;
    if (result != v3 || result >= &v3[88 * v6])
    {
      return (char *)memmove(result, v3, 88 * v6);
    }
  }
  return result;
}

char *sub_10023B784(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_10023B840(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  int64_t v4 = *a3 - (void)v3;
  if (v4 < 0)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    if (result != v3 || result >= &v3[v4])
    {
      return (char *)memmove(result, v3, v4);
    }
  }
  return result;
}

char *sub_10023B8E4(uint64_t a1)
{
  return sub_10023B4F4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10023B8F8(uint64_t a1)
{
  return sub_1000B2F1C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10023B90C(uint64_t a1)
{
  return sub_1000B3804(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10023B920(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10023B934(uint64_t a1)
{
  return sub_1000B398C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10023B948(uint64_t a1)
{
  return sub_1000B4010(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_10023B960(void *a1)
{
  uint64_t v2 = v1;
  int64_t v4 = self;
  sub_100007620((uint64_t *)&unk_1002F0270);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100249A60;
  id v6 = [a1 topAnchor];
  id v7 = [v2 topAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];

  *(void *)(v5 + 32) = v8;
  id v9 = [a1 leadingAnchor];
  id v10 = [v2 leadingAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];

  *(void *)(v5 + 40) = v11;
  id v12 = [v2 trailingAnchor];
  id v13 = [a1 trailingAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];

  *(void *)(v5 + 48) = v14;
  id v15 = [v2 bottomAnchor];
  id v16 = [a1 bottomAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16];

  *(void *)(v5 + 56) = v17;
  specialized Array._endMutation()();
  sub_10002AEFC();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:isa];
}

uint64_t sub_10023BBA8()
{
  id v1 = [v0 subviews];
  sub_10000B0CC(0, (unint64_t *)&unk_1002F4120);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62) {
    goto LABEL_29;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    unint64_t v4 = 0;
    unint64_t v5 = v2 & 0xC000000000000001;
    unint64_t v18 = v2 + 32;
    uint64_t v19 = v2 & 0xFFFFFFFFFFFFFF8;
    uint64_t v21 = v3;
    unint64_t v22 = v2;
    unint64_t v20 = v2 & 0xC000000000000001;
    while (1)
    {
      if (v5)
      {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v4 >= *(void *)(v19 + 16)) {
          goto LABEL_28;
        }
        id v7 = *(id *)(v18 + 8 * v4);
      }
      id v8 = v7;
      if (__OFADD__(v4++, 1)) {
        break;
      }
      id v10 = [v7 gestureRecognizers];
      if (!v10) {
        goto LABEL_6;
      }
      id v11 = v10;
      sub_10000B0CC(0, qword_1002FD330);
      unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v13)
        {
LABEL_15:
          if (v13 < 1) {
            goto LABEL_27;
          }
          for (uint64_t i = 0; i != v13; ++i)
          {
            if ((v12 & 0xC000000000000001) != 0) {
              id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v15 = *(id *)(v12 + 8 * i + 32);
            }
            id v16 = v15;
            self;
            if (swift_dynamicCastObjCClass())
            {
            }
            else
            {
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
              specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized ContiguousArray._endMutation()();
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v3 = v21;
          unint64_t v2 = v22;
          unint64_t v5 = v20;
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v13) {
          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
LABEL_5:
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_release();
      [v8 setGestureRecognizers:isa];

LABEL_6:
      sub_10023BBA8();

      if (v4 == v3) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
LABEL_30:

  return swift_bridgeObjectRelease();
}

id sub_10023BE98()
{
  id v1 = [v0 nextResponder];
  if (v1)
  {
    unint64_t v2 = v1;
    self;
    id result = (id)swift_dynamicCastObjCClass();
    if (result) {
      return result;
    }
  }
  id result = [v0 nextResponder];
  if (result)
  {
    unint64_t v4 = result;
    self;
    if (swift_dynamicCastObjCClass())
    {
      uint64_t v5 = sub_10023BE98();

      return (id)v5;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

void sub_10023BF54(void *a1)
{
  objc_msgSend(objc_msgSend(a1, "container"), "effectiveContentSize");
  double v4 = v3;
  swift_unknownObjectRelease();
  id v5 = [a1 traitCollection];
  id v6 = [v5 horizontalSizeClass];

  if (v6 != (id)1)
  {
    id v7 = [v1 view:v4];
    if (v7)
    {
      id v8 = v7;
      id v9 = [v7 readableContentGuide];

      [v9 layoutFrame];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;

      v18.origin.CGFloat x = v11;
      v18.origin.CGFloat y = v13;
      v18.size.CGFloat width = v15;
      v18.size.CGFloat height = v17;
      CGRectGetWidth(v18);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10023C090()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void **sub_10023C13C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  int v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  id v9 = (char *)*a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    a1 = (void **)&v9[(v6 & 0xF8 ^ 0x1F8) & (v6 + 16)];
  }
  else
  {
    double v12 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    CGFloat v13 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    void *v12 = *v13;
    uint64_t v14 = ((unint64_t)v12 + v6 + 8) & ~v6;
    uint64_t v15 = ((unint64_t)v13 + v6 + 8) & ~v6;
    double v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    CGFloat v17 = v9;
    swift_retain();
    v16(v14, v15, v4);
    *(void *)((v7 + v14) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v7 + v15) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_10023C288(id *a1, uint64_t a2)
{
  unint64_t v3 = (unint64_t)a1 + 15;

  swift_release();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))(((v3 & 0xFFFFFFFFFFFFFFF8)
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));

  return swift_release();
}

void **sub_10023C32C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  id v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = ((unint64_t)v5 + v11 + 8) & ~v11;
  uint64_t v13 = ((unint64_t)v6 + v11 + 8) & ~v11;
  id v14 = v4;
  swift_retain();
  v9(v12, v13, v7);
  *(void *)((*(void *)(v10 + 48) + 7 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v10 + 48)
                                                                                       + 7
                                                                                       + v13) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

void **sub_10023C404(void **a1, void **a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  uint64_t v5 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  unint64_t v8 = (unint64_t)a1 + 15;
  id v9 = v5;

  uint64_t v10 = (void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = v6 & 0xFFFFFFFFFFFFFFF8;
  *uint64_t v10 = *(void *)(v6 & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v13 = v12 + 24;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = ((unint64_t)v10 + v14 + 8) & ~v14;
  unint64_t v16 = (v14 + 8 + (v6 & 0xFFFFFFFFFFFFFFF8)) & ~v14;
  (*(void (**)(uint64_t, unint64_t))(v12 + 24))(v15, (v14 + 8 + v11) & ~v14);
  *(void *)((*(void *)(v13 + 40) + 7 + v15) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v13 + 40)
                                                                                       + 7
                                                                                       + v16) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

void *sub_10023C4F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 32;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)v4 + v8 + 8) & ~v8;
  uint64_t v10 = ((unint64_t)v5 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v9, v10);
  *(void *)((*(void *)(v7 + 32) + 7 + v9) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v7 + 32) + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void **sub_10023C5A8(void **a1, void **a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t)a2 + 15;
  uint64_t v6 = *a1;
  *a1 = *a2;
  unint64_t v7 = (unint64_t)a1 + 15;

  v7 &= 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v7 = *(void *)v5;
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (v10 + 8 + v7) & ~v10;
  uint64_t v12 = (v10 + 8 + v5) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  *(void *)((*(void *)(v9 + 24) + 7 + v11) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v9 + 24) + 7 + v12) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_10023C684(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v6 + 16) & ~v6) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
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
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x10023C7E4);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
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
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8)
  }
                                                                  + v6
                                                                  + 8) & ~v6);
  uint64_t v17 = *(void *)a1;
  if (*(void *)a1 >= 0xFFFFFFFFuLL) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_10023C7F8(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v19 = (((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8) + v9 + 8) & ~v9;
              unint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
              v20(v19);
            }
            else
            {
              if ((a2 & 0x80000000) != 0) {
                uint64_t v18 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v18 = a2 - 1;
              }
              *(void *)a1 = v18;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x10023C9F0);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for UserDefault()
{
  return sub_1000BA700();
}

uint64_t sub_10023CA30()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  qword_1002FD3B8 = result;
  unk_1002FD3C0 = v1;
  return result;
}

id sub_10023CA60()
{
  return sub_10023CAD4();
}

id sub_10023CA7C()
{
  return sub_10023CAD4();
}

id sub_10023CA98()
{
  return sub_10023CAD4();
}

id sub_10023CAB8()
{
  return sub_10023CAD4();
}

id sub_10023CAD4()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 BOOLForKey:v1];

  return v2;
}

uint64_t sub_10023CB18@<X0>(uint64_t a1@<X8>)
{
  return sub_10023CB6C(a1);
}

uint64_t sub_10023CB34(uint64_t a1)
{
  return sub_10023CCC8(a1);
}

uint64_t sub_10023CB50@<X0>(uint64_t a1@<X8>)
{
  return sub_10023CB6C(a1);
}

uint64_t sub_10023CB6C@<X0>(uint64_t a1@<X8>)
{
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 objectForKey:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10023D304((uint64_t)v9, (uint64_t)v10);
  if (v11)
  {
    uint64_t v5 = type metadata accessor for Date();
    int v6 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, v6 ^ 1u, 1, v5);
  }
  else
  {
    sub_10000B070((uint64_t)v10, (uint64_t *)&unk_1002F02C0);
    uint64_t v8 = type metadata accessor for Date();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 1, 1, v8);
  }
}

uint64_t sub_10023CCAC(uint64_t a1)
{
  return sub_10023CCC8(a1);
}

uint64_t sub_10023CCC8(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_100007620(&qword_1002F8BA0);
  __chkstk_darwin(v4 - 8);
  int v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000786D8(a1, (uint64_t)v6);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  NSString v10 = String._bridgeToObjectiveC()();
  [v2 setObject:isa forKey:v10];
  swift_unknownObjectRelease();

  return sub_10000B070(a1, &qword_1002F8BA0);
}

uint64_t sub_10023CE2C()
{
  return sub_10023CE88();
}

uint64_t sub_10023CE50()
{
  return sub_10023CE88();
}

uint64_t sub_10023CE6C()
{
  return sub_10023CE88();
}

uint64_t sub_10023CE88()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 stringForKey:v1];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_10023CF04()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 dataForKey:v1];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = v4;

  type metadata accessor for JSONDecoder();
  swift_allocObject();
  JSONDecoder.init()();
  sub_100007620(&qword_1002FD3E0);
  sub_10023D240(&qword_1002FD3F0, &qword_1002FD3F8);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  swift_release();
  sub_100101604(v3, v5);
  return v7;
}

uint64_t sub_10023D058()
{
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  sub_100007620(&qword_1002FD3C8);
  sub_10023D194();
  uint64_t v1 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v3 = v2;
  swift_bridgeObjectRelease();
  sub_100101584(v1, v3);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100101604(v1, v3);
  NSString v5 = String._bridgeToObjectiveC()();
  [v0 setObject:isa forKey:v5];
  swift_unknownObjectRelease();

  sub_1001015F0(v1, v3);
  return swift_release();
}

unint64_t sub_10023D194()
{
  unint64_t result = qword_1002FD3D0;
  if (!qword_1002FD3D0)
  {
    sub_100007928(&qword_1002FD3C8);
    sub_10023D240(&qword_1002FD3D8, &qword_1002FD3E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FD3D0);
  }
  return result;
}

uint64_t sub_10023D240(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007928(&qword_1002FD3E0);
    sub_10023D2C0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10023D2C0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SELFLoggingInvocationDescription();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10023D304(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007620((uint64_t *)&unk_1002F02C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10023D36C()
{
  id v0 = [self standardUserDefaults];
  sub_100007620(&qword_1002F9E78);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100247140;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x800000010025C830;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = 0x79616C706F747541;
  *(void *)(inited + 88) = 0xEB00000000535454;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(unsigned char *)(inited + 96) = 0;
  sub_1001FF3E8(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v0 registerDefaults:isa];
}

void *sub_10023D484@<X0>(char a1@<W0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v7 = sub_100007620(&qword_1002FA120);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007620(qword_1002FD400);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SidebarButton();
  __chkstk_darwin(v13);
  int v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100007620(&qword_1002FA110);
  __chkstk_darwin(v36);
  int v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100007620(&qword_1002FA0F0);
  __chkstk_darwin(v18 - 8);
  uint64_t v35 = (char *)v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    type metadata accessor for ConversationContext(0);
    v33[0] = v10;
    sub_10023DAA4(&qword_1002EF2A0, (void (*)(uint64_t))type metadata accessor for ConversationContext);
    v33[1] = v7;
    EnvironmentObject.projectedValue.getter();
    swift_getKeyPath();
    EnvironmentObject.Wrapper.subscript.getter();
    swift_release();
    swift_release();
    unint64_t v20 = &v15[*(int *)(v13 + 20)];
    uint64_t v37 = 0;
    State.init(wrappedValue:)();
    uint64_t v21 = v39;
    *(void *)unint64_t v20 = v38;
    *((void *)v20 + 1) = v21;
    unint64_t v22 = &v15[*(int *)(v13 + 24)];
    LOBYTE(v37) = 1;
    State.init(wrappedValue:)();
    uint64_t v23 = v39;
    *unint64_t v22 = v38;
    *((void *)v22 + 1) = v23;
    uint64_t v24 = static Alignment.topLeading.getter();
    uint64_t v26 = v25;
    uint64_t v27 = (uint64_t)&v17[*(int *)(v36 + 36)];
    sub_1001A890C((uint64_t)v15, v27);
    double v28 = (uint64_t *)(v27 + *(int *)(sub_100007620(&qword_1002FA1F8) + 36));
    *double v28 = v24;
    v28[1] = v26;
    sub_10000C3A4(v34, (uint64_t)v17, &qword_1002FA120);
    sub_10023DAF4((uint64_t)v15);
    sub_10000C3A4((uint64_t)v17, (uint64_t)v12, &qword_1002FA110);
    swift_storeEnumTagMultiPayload();
    sub_1001AC418();
    sub_10023D914(&qword_1002FA118, &qword_1002FA120, (void (*)(void))sub_1001AC4F4, (void (*)(void))sub_1001AC634);
    uint64_t v29 = (uint64_t)v35;
    _ConditionalContent<>.init(storage:)();
    uint64_t v30 = (uint64_t)v17;
    double v31 = &qword_1002FA110;
  }
  else
  {
    sub_10000C3A4(v34, (uint64_t)v9, &qword_1002FA120);
    sub_10000C3A4((uint64_t)v9, (uint64_t)v12, &qword_1002FA120);
    swift_storeEnumTagMultiPayload();
    sub_1001AC418();
    sub_10023D914(&qword_1002FA118, &qword_1002FA120, (void (*)(void))sub_1001AC4F4, (void (*)(void))sub_1001AC634);
    uint64_t v29 = (uint64_t)v35;
    _ConditionalContent<>.init(storage:)();
    uint64_t v30 = (uint64_t)v9;
    double v31 = &qword_1002FA120;
  }
  sub_10000B070(v30, v31);
  sub_10023D99C(v29, a4);
  return sub_10023DA04(a3);
}

uint64_t sub_10023D914(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007928(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10023D99C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007620(&qword_1002FA0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_10023DA04(void *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v4 = (void *)a1[9];
  swift_release();
  swift_release();
  sub_10005477C(v2, v3);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_10023DAA4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10023DAF4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SidebarButton();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10023DB50()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AnyStateObserver()
{
  return sub_1000BA700();
}

uint64_t sub_10023DBB0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

id sub_10023DBB8()
{
  type metadata accessor for WaveformUIKitView();
  id v0 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  sub_10023DFD8();
  return v0;
}

void sub_10023DBF8(char *a1)
{
  uint64_t v3 = *(void *)v1;
  char v4 = *(unsigned char *)(v1 + 8);
  int v5 = *(_DWORD *)(v1 + 12);
  sub_1000247E8(*(void *)v1, v4);
  double v6 = sub_100100F84(v3, v4);
  sub_10002485C(v3, v4);
  *(double *)&a1[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_scale] = 1.0 / v6;
  [a1 setNeedsLayout];
  *(_DWORD *)&a1[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_volumeLevel] = v5;
  sub_10023E948();
}

uint64_t sub_10023DC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10023F158();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10023DCF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10023F158();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10023DD5C()
{
}

void sub_10023DDDC()
{
  uint64_t v1 = v0;
  v25.receiver = v0;
  v25.super_class = (Class)type metadata accessor for WaveformUIKitView();
  [super layoutSubviews];
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageLayer];
  if (v2)
  {
    uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageContainerLayer];
    id v4 = v2;
    [v4 bounds];
    [v3 setBounds:];
    CATransform3DMakeScale(&v24, *(CGFloat *)&v1[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_scale], *(CGFloat *)&v1[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_scale], 1.0);
    [v3 setTransform:&v24];
    id v5 = [v1 layer];
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    v26.origin.CGFloat x = v7;
    v26.origin.CGFloat y = v9;
    v26.size.CGFloat width = v11;
    v26.size.CGFloat height = v13;
    double MidX = CGRectGetMidX(v26);
    id v15 = [v1 layer];
    [v15 bounds];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    v27.origin.CGFloat x = v17;
    v27.origin.CGFloat y = v19;
    v27.size.CGFloat width = v21;
    v27.size.CGFloat height = v23;
    [v3 setPosition:MidX, CGRectGetMinY(v27)];
  }
}

void sub_10023DFD8()
{
  uint64_t v1 = sub_100007620(&qword_1002EFD90);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  double v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  CGFloat v11 = (char *)&v41 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_package;
  if (*(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_package]) {
    return;
  }
  uint64_t v42 = (char *)&v41 - v13;
  uint64_t v43 = v12;
  uint64_t v41 = v0;
  id v15 = [self mainBundle];
  NSString v16 = String._bridgeToObjectiveC()();
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v15 URLForResource:v16 withExtension:v17];

  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v43);
    goto LABEL_6;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v19 = v5;
  double v20 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v21 = v43;
  v20(v3, v11, v43);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v3, 0, 1, v21);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v3, 1, v21) == 1)
  {
LABEL_6:
    sub_10000B070((uint64_t)v3, &qword_1002EFD90);
    return;
  }
  double v22 = v42;
  v20(v42, v3, v21);
  sub_10000B0CC(0, &qword_1002FD510);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v8, v22, v21);
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v25 = sub_10023E604((uint64_t)v8, v23, v24, 0);
  id v26 = [v25 rootLayer];
  if (v26)
  {
    CGRect v27 = v26;
    double v28 = v41;
    uint64_t v29 = *(void **)&v41[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageContainerLayer];
    id v30 = [v29 superlayer];

    if (!v30)
    {
      [v29 setAnchorPoint:0.5, 0.0];
      id v31 = [v28 layer];
      [v31 addSublayer:v29];
    }
    [v29 setGeometryFlipped:[v25 isGeometryFlipped]];
    [v29 addSublayer:v27];
    double v32 = *(void **)&v28[v14];
    *(void *)&v28[v14] = v25;
    id v33 = v25;

    uint64_t v34 = *(void **)&v28[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageLayer];
    *(void *)&v28[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageLayer] = v27;
    id v35 = v27;

    NSString v36 = String._bridgeToObjectiveC()();
    id v37 = [v33 publishedObjectWithName:v36];

    if (v37)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v45, 0, sizeof(v45));
    }
    sub_10023D304((uint64_t)v45, (uint64_t)v46);
    if (v46[3])
    {
      sub_10000B0CC(0, &qword_1002FD518);
      int v38 = swift_dynamicCast();
      uint64_t v39 = v44;
      if (!v38) {
        uint64_t v39 = 0;
      }
    }
    else
    {
      sub_10000B070((uint64_t)v46, (uint64_t *)&unk_1002F02C0);
      uint64_t v39 = 0;
    }
    uint64_t v40 = *(void **)&v28[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_particlesLayer];
    *(void *)&v28[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_particlesLayer] = v39;

    sub_10023E7CC();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v43);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v43);
  }
}

id sub_10023E604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  uint64_t v7 = v6;
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v9.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }
  id v18 = 0;
  id v10 = [(id)swift_getObjCClassFromMetadata() packageWithContentsOfURL:v7 type:v8 options:v9.super.isa error:&v18];

  id v11 = v18;
  if (v10)
  {
    uint64_t v12 = type metadata accessor for URL();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    id v14 = v11;
    v13(a1, v12);
  }
  else
  {
    id v15 = v18;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v16 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
  }
  return v10;
}

void sub_10023E7CC()
{
  id v1 = [v0 window];
  if (v1)
  {
    uint64_t v2 = OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink;
    if (!*(void *)&v0[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink])
    {
      id v13 = v1;
      id v6 = [v1 screen];
      id v7 = [v6 displayLinkWithTarget:v0 selector:"_updateParticles"];

      NSString v8 = *(void **)&v0[v2];
      *(void *)&v0[v2] = v7;

      NSDictionary v9 = *(void **)&v0[v2];
      if (v9)
      {
        id v10 = self;
        id v11 = v9;
        id v12 = [v10 currentRunLoop];
        [v11 addToRunLoop:v12 forMode:NSDefaultRunLoopMode];
      }
      uint64_t v5 = v13;
      goto LABEL_9;
    }
  }
  id v3 = [v0 window];

  if (v3) {
    return;
  }
  uint64_t v4 = OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink;
  [*(id *)&v0[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink] invalidate];
  uint64_t v5 = *(void **)&v0[v4];
  *(void *)&v0[v4] = 0;
LABEL_9:
}

void sub_10023E948()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_particlesLayer);
  if (!v1) {
    return;
  }
  id v17 = v1;
  id v2 = [v17 emitterCells];
  if (!v2)
  {
    id v14 = v17;
LABEL_11:

    return;
  }
  id v3 = v2;
  sub_10000B0CC(0, &qword_1002FD508);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v5 = v17;
    if (v15) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v5 = v17;
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_5:
      if ((v4 & 0xC000000000000001) != 0)
      {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v6 = *(id *)(v4 + 32);
      }
      id v7 = v6;
      swift_bridgeObjectRelease();
      *(float *)&double v8 = (float)(*(float *)(v0 + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_volumeLevel)
                            * 2000.0)
                    + 3000.0;
      [v7 setBirthRate:v8];
      Class isa = Float._bridgeToObjectiveC()().super.super.isa;
      NSString v10 = String._bridgeToObjectiveC()();
      [v7 setValue:isa forKeyPath:v10];

      CFTimeInterval v11 = CACurrentMediaTime();
      sin(v11 + v11);
      Class v12 = Float._bridgeToObjectiveC()().super.super.isa;
      NSString v13 = String._bridgeToObjectiveC()();
      [v7 setValue:v12 forKeyPath:v13];

      NSString v16 = String._bridgeToObjectiveC()();
      [v17 reloadValueForKeyPath:v16];

      id v14 = v16;
      goto LABEL_11;
    }
  }

  swift_bridgeObjectRelease();
}

id sub_10023EC68(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageContainerLayer;
  id v10 = objc_allocWithZone((Class)CALayer);
  CFTimeInterval v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  *(void *)&v11[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_package] = 0;
  *(void *)&v11[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageLayer] = 0;
  *(void *)&v11[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_particlesLayer] = 0;
  *(void *)&v11[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink] = 0;
  *(_DWORD *)&v11[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_volumeLevel] = 0;
  *(void *)&v11[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_scale] = 0x3FF0000000000000;

  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for WaveformUIKitView();
  return [super initWithFrame:a1, a2, a3, a4];
}

id sub_10023ED84(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageContainerLayer;
  id v4 = objc_allocWithZone((Class)CALayer);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  *(void *)&v5[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_package] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageLayer] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_particlesLayer] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink] = 0;
  *(_DWORD *)&v5[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_volumeLevel] = 0;
  *(void *)&v5[OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_scale] = 0x3FF0000000000000;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for WaveformUIKitView();
  id v6 = [super initWithCoder:a1];

  return v6;
}

id sub_10023EE90()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WaveformUIKitView();
  return [super dealloc];
}

uint64_t type metadata accessor for WaveformUIKitView()
{
  return self;
}

uint64_t sub_10023EF68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000247E8(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  return a1;
}

uint64_t assignWithCopy for WaveformView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1000247E8(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002485C(v6, v7);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  return a1;
}

uint64_t assignWithTake for WaveformView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_10002485C(v6, v7);
  *(_DWORD *)(a1 + 12) = *((_DWORD *)a2 + 3);
  return a1;
}

uint64_t getEnumTagSinglePayload for WaveformView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WaveformView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WaveformView()
{
  return &type metadata for WaveformView;
}

unint64_t sub_10023F104()
{
  unint64_t result = qword_1002FD520;
  if (!qword_1002FD520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FD520);
  }
  return result;
}

unint64_t sub_10023F158()
{
  unint64_t result = qword_1002FD528;
  if (!qword_1002FD528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1002FD528);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static AppIntent.openAppWhenRun.getter()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t AppIntent.systemContext.getter()
{
  return AppIntent.systemContext.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t static AppIntent.authenticationPolicy.getter()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IntentParameter.wrappedValue.modify()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t IntentParameter.wrappedValue.getter()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t IntentParameter.wrappedValue.setter()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentDescription.init(stringLiteral:)()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t type metadata accessor for IntentDescription()
{
  return type metadata accessor for IntentDescription();
}

uint64_t type metadata accessor for IntentSystemContext.Source()
{
  return type metadata accessor for IntentSystemContext.Source();
}

uint64_t IntentSystemContext.source.getter()
{
  return IntentSystemContext.source.getter();
}

uint64_t type metadata accessor for IntentSystemContext()
{
  return type metadata accessor for IntentSystemContext();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t NSNotFound.getter()
{
  return NSNotFound.getter();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t static CharacterSet.whitespaces.getter()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

NSNotification __swiftcall Notification._bridgeToObjectiveC()()
{
  return (NSNotification)Notification._bridgeToObjectiveC()();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.init(name:object:userInfo:)()
{
  return Notification.init(name:object:userInfo:)();
}

uint64_t Notification.object.getter()
{
  return Notification.object.getter();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.host.setter()
{
  return URLComponents.host.setter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t URLComponents.string.getter()
{
  return URLComponents.string.getter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t AttributeScopes.SwiftUIAttributes.customAttributes.getter()
{
  return AttributeScopes.SwiftUIAttributes.customAttributes.getter();
}

uint64_t AttributedString.characters.getter()
{
  return AttributedString.characters.getter();
}

uint64_t AttributedString.startIndex.getter()
{
  return AttributedString.startIndex.getter();
}

uint64_t AttributedString.CharacterView._count.getter()
{
  return AttributedString.CharacterView._count.getter();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return type metadata accessor for AttributedString.CharacterView();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return AttributedString.init(stringLiteral:)();
}

uint64_t AttributedString.Runs.Run.subscript.getter()
{
  return AttributedString.Runs.Run.subscript.getter();
}

uint64_t AttributedString.Runs.Run.range.getter()
{
  return AttributedString.Runs.Run.range.getter();
}

uint64_t type metadata accessor for AttributedString.Runs.Run()
{
  return type metadata accessor for AttributedString.Runs.Run();
}

uint64_t type metadata accessor for AttributedString.Runs.Index()
{
  return type metadata accessor for AttributedString.Runs.Index();
}

uint64_t type metadata accessor for AttributedString.Runs()
{
  return type metadata accessor for AttributedString.Runs();
}

uint64_t type metadata accessor for AttributedString.Index()
{
  return type metadata accessor for AttributedString.Index();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t AttributedString.subscript.modify()
{
  return AttributedString.subscript.modify();
}

uint64_t AttributedString.subscript.getter()
{
  return AttributedString.subscript.getter();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t AttributeContainer.init()()
{
  return AttributeContainer.init()();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributedSubstring.subscript.setter()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t AttributedSubstring.runs.getter()
{
  return AttributedSubstring.runs.getter();
}

uint64_t type metadata accessor for AttributedSubstring()
{
  return type metadata accessor for AttributedSubstring();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)()
{
  return static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
}

uint64_t static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)()
{
  return static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
}

uint64_t type metadata accessor for PredicateExpressions.ComparisonOperator()
{
  return type metadata accessor for PredicateExpressions.ComparisonOperator();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t AttributedStringProtocol.index(_:offsetByCharacters:)()
{
  return AttributedStringProtocol.index(_:offsetByCharacters:)();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t URL.description.getter()
{
  return URL.description.getter();
}

uint64_t static URL.translateAppURL(with:)()
{
  return static URL.translateAppURL(with:)();
}

uint64_t static URL.topLevelSettingsURL.getter()
{
  return static URL.topLevelSettingsURL.getter();
}

uint64_t static URL.downloadLanguagesURL.getter()
{
  return static URL.downloadLanguagesURL.getter();
}

uint64_t URL.init(fileURLWithPath:isDirectory:relativeTo:)()
{
  return URL.init(fileURLWithPath:isDirectory:relativeTo:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.description.getter()
{
  return UUID.description.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t Locale.languageCode.getter()
{
  return Locale.languageCode.getter();
}

uint64_t Locale.ltIdentifier.getter()
{
  return Locale.ltIdentifier.getter();
}

uint64_t Locale.sqDisplayName(context:in:)()
{
  return Locale.sqDisplayName(context:in:)();
}

uint64_t Locale.ltLanguageCode.getter()
{
  return Locale.ltLanguageCode.getter();
}

uint64_t Locale.languageIdentifier.getter()
{
  return Locale.languageIdentifier.getter();
}

Swift::Bool __swiftcall Locale.isTraditionalChinese()()
{
  return Locale.isTraditionalChinese()();
}

Swift::String __swiftcall Locale.ltLocalizedAppString(_:table:bundle:)(Swift::String _, Swift::String table, NSBundle bundle)
{
  uint64_t v3 = Locale.ltLocalizedAppString(_:table:bundle:)(_._countAndFlagsBits, _._object, table._countAndFlagsBits, table._object, bundle.super.isa);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::Bool __swiftcall Locale.isRTL()()
{
  return Locale.isRTL()();
}

Swift::String_optional __swiftcall Locale.localizedString(forIdentifier:)(Swift::String forIdentifier)
{
  uint64_t v1 = Locale.localizedString(forIdentifier:)(forIdentifier._countAndFlagsBits, forIdentifier._object);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

Swift::String_optional __swiftcall Locale.localizedString(forLanguageCode:)(Swift::String forLanguageCode)
{
  uint64_t v1 = Locale.localizedString(forLanguageCode:)(forLanguageCode._countAndFlagsBits, forLanguageCode._object);
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t static Locale.preferredLanguages.getter()
{
  return static Locale.preferredLanguages.getter();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.== infix(_:_:)()
{
  return static Locale.== infix(_:_:)();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t Locale.Language.isRTL.getter()
{
  return Locale.Language.isRTL.getter();
}

uint64_t type metadata accessor for Locale.Language()
{
  return type metadata accessor for Locale.Language();
}

uint64_t Locale.language.getter()
{
  return Locale.language.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

Swift::tuple_inserted_Bool_memberAfterInsert_Int __swiftcall IndexSet.insert(_:)(Swift::Int a1)
{
  char v1 = IndexSet.insert(_:)(a1);
  result.memberAfterInsert = v2;
  result.inserted = v1;
  return result;
}

uint64_t IndexSet.init()()
{
  return IndexSet.init()();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

uint64_t type metadata accessor for URLError.NetworkUnavailableReason()
{
  return type metadata accessor for URLError.NetworkUnavailableReason();
}

uint64_t URLError.networkUnavailableReason.getter()
{
  return URLError.networkUnavailableReason.getter();
}

uint64_t type metadata accessor for URLError()
{
  return type metadata accessor for URLError();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.init(row:section:)()
{
  return IndexPath.init(row:section:)();
}

uint64_t IndexPath.row.getter()
{
  return IndexPath.row.getter();
}

uint64_t IndexPath.init(item:section:)()
{
  return IndexPath.init(item:section:)();
}

uint64_t IndexPath.item.getter()
{
  return IndexPath.item.getter();
}

uint64_t IndexPath.section.getter()
{
  return IndexPath.section.getter();
}

uint64_t IndexPath.init()()
{
  return IndexPath.init()();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t Selector.description.getter()
{
  return Selector.description.getter();
}

uint64_t static Selector.== infix(_:_:)()
{
  return static Selector.== infix(_:_:)();
}

uint64_t Activity.attributes.getter()
{
  return Activity.attributes.getter();
}

uint64_t dispatch thunk of Activity.activityState.getter()
{
  return dispatch thunk of Activity.activityState.getter();
}

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t dispatch thunk of Activity.endSync(_:dismissalPolicy:)()
{
  return dispatch thunk of Activity.endSync(_:dismissalPolicy:)();
}

uint64_t static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:isMomentary:)()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:isMomentary:)();
}

uint64_t ActivityAuthorizationInfo.areActivitiesEnabled.getter()
{
  return ActivityAuthorizationInfo.areActivitiesEnabled.getter();
}

uint64_t ActivityAuthorizationInfo.init()()
{
  return ActivityAuthorizationInfo.init()();
}

uint64_t type metadata accessor for ActivityAuthorizationInfo()
{
  return type metadata accessor for ActivityAuthorizationInfo();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination()
{
  return type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
}

uint64_t ActivityPresentationOptions.init(destinations:)()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t ActivityPresentationOptions.isActionButtonInitiated.setter()
{
  return ActivityPresentationOptions.isActionButtonInitiated.setter();
}

uint64_t ActivityPresentationOptions.shouldSuppressAlertContentOnLockScreen.setter()
{
  return ActivityPresentationOptions.shouldSuppressAlertContentOnLockScreen.setter();
}

uint64_t type metadata accessor for ActivityPresentationOptions()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t static ActivityState.== infix(_:_:)()
{
  return static ActivityState.== infix(_:_:)();
}

uint64_t type metadata accessor for ActivityState()
{
  return type metadata accessor for ActivityState();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t CGFloat.init(truncating:)()
{
  return CGFloat.init(truncating:)();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t type metadata accessor for ImageTranslationButtonStyle.Style()
{
  return type metadata accessor for ImageTranslationButtonStyle.Style();
}

uint64_t ImageTranslationButtonStyle.init(style:highlighted:)()
{
  return ImageTranslationButtonStyle.init(style:highlighted:)();
}

uint64_t type metadata accessor for ImageTranslationButtonStyle()
{
  return type metadata accessor for ImageTranslationButtonStyle();
}

uint64_t dispatch thunk of VisualTranslationObservable.removeAll()()
{
  return dispatch thunk of VisualTranslationObservable.removeAll()();
}

uint64_t type metadata accessor for VisualTranslationObservable()
{
  return type metadata accessor for VisualTranslationObservable();
}

Swift::Void __swiftcall VisualTranslationViewBridge.showDebugMenu()()
{
}

uint64_t VisualTranslationViewBridge.init(optimizedForExtendedExperience:)()
{
  return VisualTranslationViewBridge.init(optimizedForExtendedExperience:)();
}

uint64_t VisualTranslationViewBridge.view.getter()
{
  return VisualTranslationViewBridge.view.getter();
}

uint64_t VisualTranslationViewBridge.translate(_:sourceLocale:targetLocale:taskHint:selfLoggingInvocationId:)()
{
  return VisualTranslationViewBridge.translate(_:sourceLocale:targetLocale:taskHint:selfLoggingInvocationId:)();
}

uint64_t type metadata accessor for VisualTranslationViewBridge()
{
  return type metadata accessor for VisualTranslationViewBridge();
}

uint64_t VisualTranslationView.init(observable:options:systemTranslationDismissHandler:)()
{
  return VisualTranslationView.init(observable:options:systemTranslationDismissHandler:)();
}

uint64_t type metadata accessor for VisualTranslationView()
{
  return type metadata accessor for VisualTranslationView();
}

uint64_t static VisualTranslationOptions.backgroundRendering.getter()
{
  return static VisualTranslationOptions.backgroundRendering.getter();
}

uint64_t type metadata accessor for VisualTranslationOptions()
{
  return type metadata accessor for VisualTranslationOptions();
}

uint64_t static VisualTranslationService.isOCRLocale(_:)()
{
  return static VisualTranslationService.isOCRLocale(_:)();
}

uint64_t type metadata accessor for VisualTranslationService()
{
  return type metadata accessor for VisualTranslationService();
}

uint64_t type metadata accessor for TranslationTaskHint()
{
  return type metadata accessor for TranslationTaskHint();
}

uint64_t LocalePair.init(sourceLocale:targetLocale:)()
{
  return LocalePair.init(sourceLocale:targetLocale:)();
}

uint64_t LocalePair.sourceLocale.getter()
{
  return LocalePair.sourceLocale.getter();
}

uint64_t LocalePair.targetLocale.getter()
{
  return LocalePair.targetLocale.getter();
}

uint64_t type metadata accessor for LocalePair()
{
  return type metadata accessor for LocalePair();
}

uint64_t type metadata accessor for PlayButton.Size()
{
  return type metadata accessor for PlayButton.Size();
}

uint64_t PlayButton.init(isPlaying:size:action:)()
{
  return PlayButton.init(isPlaying:size:action:)();
}

uint64_t type metadata accessor for PlayButton()
{
  return type metadata accessor for PlayButton();
}

uint64_t type metadata accessor for ExpandingText()
{
  return type metadata accessor for ExpandingText();
}

uint64_t ExpandingText.init(_:isExpanded:_:buttonAction:)()
{
  return ExpandingText.init(_:isExpanded:_:buttonAction:)();
}

uint64_t LanguageModel.id.getter()
{
  return LanguageModel.id.getter();
}

uint64_t LanguageModel.state.getter()
{
  return LanguageModel.state.getter();
}

uint64_t type metadata accessor for LanguageModel()
{
  return type metadata accessor for LanguageModel();
}

uint64_t static LanguageState.== infix(_:_:)()
{
  return static LanguageState.== infix(_:_:)();
}

uint64_t type metadata accessor for LanguageState()
{
  return type metadata accessor for LanguageState();
}

uint64_t static ErrorStateView.airplaneMode(sourceLocale:targetLocale:context:)()
{
  return static ErrorStateView.airplaneMode(sourceLocale:targetLocale:context:)();
}

uint64_t static ErrorStateView.missingOfflineAssets(context:)()
{
  return static ErrorStateView.missingOfflineAssets(context:)();
}

uint64_t static ErrorStateView.noInternetConnection(context:)()
{
  return static ErrorStateView.noInternetConnection(context:)();
}

uint64_t type metadata accessor for ErrorStateView.Context()
{
  return type metadata accessor for ErrorStateView.Context();
}

uint64_t type metadata accessor for ErrorStateView()
{
  return type metadata accessor for ErrorStateView();
}

uint64_t LanguageOption.locale.getter()
{
  return LanguageOption.locale.getter();
}

uint64_t type metadata accessor for LanguageOption()
{
  return type metadata accessor for LanguageOption();
}

uint64_t LanguagePicker.init(selectedLocale:preferredLocales:oppositeLocale:languageModels:disabledLanguages:)()
{
  return LanguagePicker.init(selectedLocale:preferredLocales:oppositeLocale:languageModels:disabledLanguages:)();
}

uint64_t type metadata accessor for LanguagePicker()
{
  return type metadata accessor for LanguagePicker();
}

uint64_t LanguagePairPath.description.getter()
{
  return LanguagePairPath.description.getter();
}

uint64_t LanguagesService.localeModalities.getter()
{
  return LanguagesService.localeModalities.getter();
}

uint64_t LanguagesService.$localeModalities.getter()
{
  return LanguagesService.$localeModalities.getter();
}

uint64_t LanguagesService.asrUnsupportedModels.getter()
{
  return LanguagesService.asrUnsupportedModels.getter();
}

uint64_t LanguagesService.autoDetectSpeechUnsupportedPairs.getter()
{
  return LanguagesService.autoDetectSpeechUnsupportedPairs.getter();
}

uint64_t LanguagesService.init(task:)()
{
  return LanguagesService.init(task:)();
}

uint64_t LanguagesService.models.getter()
{
  return LanguagesService.models.getter();
}

uint64_t LanguagesService.$models.getter()
{
  return LanguagesService.$models.getter();
}

uint64_t type metadata accessor for LanguagesService()
{
  return type metadata accessor for LanguagesService();
}

uint64_t ConversationButton.init(action:)()
{
  return ConversationButton.init(action:)();
}

uint64_t type metadata accessor for ConversationButton()
{
  return type metadata accessor for ConversationButton();
}

uint64_t static SharedTranslations.translationGroupSharedTranslations()()
{
  return static SharedTranslations.translationGroupSharedTranslations()();
}

uint64_t SharedTranslations.Translation.sourceText.getter()
{
  return SharedTranslations.Translation.sourceText.getter();
}

uint64_t SharedTranslations.Translation.targetText.getter()
{
  return SharedTranslations.Translation.targetText.getter();
}

uint64_t SharedTranslations.Translation.sourceLocale.getter()
{
  return SharedTranslations.Translation.sourceLocale.getter();
}

uint64_t SharedTranslations.Translation.targetLocale.getter()
{
  return SharedTranslations.Translation.targetLocale.getter();
}

uint64_t type metadata accessor for SharedTranslations.Translation()
{
  return type metadata accessor for SharedTranslations.Translation();
}

uint64_t dispatch thunk of SharedTranslations.unregister()()
{
  return dispatch thunk of SharedTranslations.unregister()();
}

uint64_t dispatch thunk of SharedTranslations.translations.getter()
{
  return dispatch thunk of SharedTranslations.translations.getter();
}

uint64_t dispatch thunk of SharedTranslations.presentedItemChangedAction.setter()
{
  return dispatch thunk of SharedTranslations.presentedItemChangedAction.setter();
}

uint64_t type metadata accessor for SharedTranslations()
{
  return type metadata accessor for SharedTranslations();
}

uint64_t type metadata accessor for CoreAnalyticsLogger.InteractionLocation()
{
  return type metadata accessor for CoreAnalyticsLogger.InteractionLocation();
}

uint64_t dispatch thunk of CoreAnalyticsLogger.didOfferDisambiguation(fromCard:hasGender:hasMeaning:genderDisambiguationSettingEnabled:)()
{
  return dispatch thunk of CoreAnalyticsLogger.didOfferDisambiguation(fromCard:hasGender:hasMeaning:genderDisambiguationSettingEnabled:)();
}

uint64_t dispatch thunk of CoreAnalyticsLogger.didInteractWithDisambiguation(fromCard:location:type:localePair:)()
{
  return dispatch thunk of CoreAnalyticsLogger.didInteractWithDisambiguation(fromCard:location:type:localePair:)();
}

uint64_t static CoreAnalyticsLogger.shared.getter()
{
  return static CoreAnalyticsLogger.shared.getter();
}

uint64_t type metadata accessor for CoreAnalyticsLogger.CardType()
{
  return type metadata accessor for CoreAnalyticsLogger.CardType();
}

uint64_t type metadata accessor for CoreAnalyticsLogger()
{
  return type metadata accessor for CoreAnalyticsLogger();
}

uint64_t type metadata accessor for SimpleExpandingText()
{
  return type metadata accessor for SimpleExpandingText();
}

uint64_t SimpleExpandingText.init(_:isExpanded:_:buttonAction:)()
{
  return SimpleExpandingText.init(_:isExpanded:_:buttonAction:)();
}

uint64_t DisambiguationLinkInfo.sentenceUUID.getter()
{
  return DisambiguationLinkInfo.sentenceUUID.getter();
}

uint64_t DisambiguationLinkInfo.init(sentenceUUID:linkIndex:)()
{
  return DisambiguationLinkInfo.init(sentenceUUID:linkIndex:)();
}

uint64_t DisambiguationLinkInfo.linkIndex.getter()
{
  return DisambiguationLinkInfo.linkIndex.getter();
}

uint64_t type metadata accessor for DisambiguationLinkInfo()
{
  return type metadata accessor for DisambiguationLinkInfo();
}

uint64_t SecureHostingController.init(rootView:)()
{
  return SecureHostingController.init(rootView:)();
}

uint64_t DetectableLanguagePicker.init(isDetected:selectedOption:preferredLocales:oppositeLocale:languageModels:sourceUsesOCR:)()
{
  return DetectableLanguagePicker.init(isDetected:selectedOption:preferredLocales:oppositeLocale:languageModels:sourceUsesOCR:)();
}

uint64_t type metadata accessor for DetectableLanguagePicker()
{
  return type metadata accessor for DetectableLanguagePicker();
}

uint64_t static AirplaneModeConfiguration.isAirplaneModeEnabled.getter()
{
  return static AirplaneModeConfiguration.isAirplaneModeEnabled.getter();
}

uint64_t dispatch thunk of AirplaneModeConfiguration.isEnabled.getter()
{
  return dispatch thunk of AirplaneModeConfiguration.isEnabled.getter();
}

uint64_t type metadata accessor for AirplaneModeConfiguration()
{
  return type metadata accessor for AirplaneModeConfiguration();
}

uint64_t DisambiguationResultModel.init(disambiguableResult:excludedTypes:sourceLocale:targetLocale:globalAttributeProvider:linkAttributeProvider:userSelectionHandler:)()
{
  return DisambiguationResultModel.init(disambiguableResult:excludedTypes:sourceLocale:targetLocale:globalAttributeProvider:linkAttributeProvider:userSelectionHandler:)();
}

uint64_t DisambiguationResultModel.disambiguableResult.getter()
{
  return DisambiguationResultModel.disambiguableResult.getter();
}

uint64_t dispatch thunk of DisambiguationResultModel.renderMode.setter()
{
  return dispatch thunk of DisambiguationResultModel.renderMode.setter();
}

uint64_t static DisambiguationResultModel.TextLocation.== infix(_:_:)()
{
  return static DisambiguationResultModel.TextLocation.== infix(_:_:)();
}

uint64_t type metadata accessor for DisambiguationResultModel.TextLocation()
{
  return type metadata accessor for DisambiguationResultModel.TextLocation();
}

uint64_t DisambiguationResultModel.LinkRangeInfo.sourceRange.getter()
{
  return DisambiguationResultModel.LinkRangeInfo.sourceRange.getter();
}

uint64_t DisambiguationResultModel.LinkRangeInfo.targetRange.getter()
{
  return DisambiguationResultModel.LinkRangeInfo.targetRange.getter();
}

uint64_t type metadata accessor for DisambiguationResultModel.LinkRangeInfo()
{
  return type metadata accessor for DisambiguationResultModel.LinkRangeInfo();
}

uint64_t static DisambiguationResultModel.RenderingMode.== infix(_:_:)()
{
  return static DisambiguationResultModel.RenderingMode.== infix(_:_:)();
}

uint64_t type metadata accessor for DisambiguationResultModel.RenderingMode()
{
  return type metadata accessor for DisambiguationResultModel.RenderingMode();
}

uint64_t dispatch thunk of DisambiguationResultModel.excludedTypes.setter()
{
  return dispatch thunk of DisambiguationResultModel.excludedTypes.setter();
}

uint64_t DisambiguationResultModel.init(withStaticSource:staticTarget:sourceLocale:targetLocale:globalAttributeProvider:)()
{
  return DisambiguationResultModel.init(withStaticSource:staticTarget:sourceLocale:targetLocale:globalAttributeProvider:)();
}

uint64_t static DisambiguationResultModel.defaultAttributes(forRTL:)()
{
  return static DisambiguationResultModel.defaultAttributes(forRTL:)();
}

uint64_t static DisambiguationResultModel.dictionaryItemKey.getter()
{
  return static DisambiguationResultModel.dictionaryItemKey.getter();
}

uint64_t dispatch thunk of DisambiguationResultModel.sourceAttributedText.getter()
{
  return dispatch thunk of DisambiguationResultModel.sourceAttributedText.getter();
}

uint64_t dispatch thunk of DisambiguationResultModel.targetAttributedText.getter()
{
  return dispatch thunk of DisambiguationResultModel.targetAttributedText.getter();
}

uint64_t dispatch thunk of DisambiguationResultModel.$sourceAttributedText.getter()
{
  return dispatch thunk of DisambiguationResultModel.$sourceAttributedText.getter();
}

uint64_t dispatch thunk of DisambiguationResultModel.$targetAttributedText.getter()
{
  return dispatch thunk of DisambiguationResultModel.$targetAttributedText.getter();
}

uint64_t dispatch thunk of DisambiguationResultModel.rangeOfFirstWordForDictionary(inLocation:)()
{
  return dispatch thunk of DisambiguationResultModel.rangeOfFirstWordForDictionary(inLocation:)();
}

uint64_t dispatch thunk of DisambiguationResultModel.didAppear()()
{
  return dispatch thunk of DisambiguationResultModel.didAppear()();
}

uint64_t dispatch thunk of DisambiguationResultModel.rangeInfo(for:)()
{
  return dispatch thunk of DisambiguationResultModel.rangeInfo(for:)();
}

uint64_t type metadata accessor for DisambiguationResultModel()
{
  return type metadata accessor for DisambiguationResultModel();
}

uint64_t GenderDisambiguationLearnMoreView.init()()
{
  return GenderDisambiguationLearnMoreView.init()();
}

uint64_t type metadata accessor for GenderDisambiguationLearnMoreView()
{
  return type metadata accessor for GenderDisambiguationLearnMoreView();
}

uint64_t type metadata accessor for TaskHint()
{
  return type metadata accessor for TaskHint();
}

uint64_t DataRepresentation.init(exportedContentType:exporting:)()
{
  return DataRepresentation.init(exportedContentType:exporting:)();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t StoredTranslationAlternative.init(text:romanization:lowConfidence:)()
{
  return StoredTranslationAlternative.init(text:romanization:lowConfidence:)();
}

uint64_t type metadata accessor for StoredTranslationAlternative()
{
  return type metadata accessor for StoredTranslationAlternative();
}

uint64_t type metadata accessor for StoredTranslationResult.CodingKeys()
{
  return type metadata accessor for StoredTranslationResult.CodingKeys();
}

uint64_t StoredTranslationResult.init(text:locale:isOffline:romanization:)()
{
  return StoredTranslationResult.init(text:locale:isOffline:romanization:)();
}

uint64_t type metadata accessor for StoredTranslationResult()
{
  return type metadata accessor for StoredTranslationResult();
}

uint64_t dispatch thunk of PersistedTranslation.isFavorite.getter()
{
  return dispatch thunk of PersistedTranslation.isFavorite.getter();
}

uint64_t dispatch thunk of PersistedTranslation.displayText.getter()
{
  return dispatch thunk of PersistedTranslation.displayText.getter();
}

uint64_t dispatch thunk of PersistedTranslation.alternatives.getter()
{
  return dispatch thunk of PersistedTranslation.alternatives.getter();
}

uint64_t dispatch thunk of PersistedTranslation.sourceLocale.getter()
{
  return dispatch thunk of PersistedTranslation.sourceLocale.getter();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.getter()
{
  return dispatch thunk of PersistedTranslation.speechResult.getter();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.setter()
{
  return dispatch thunk of PersistedTranslation.speechResult.setter();
}

uint64_t dispatch thunk of PersistedTranslation.targetLocale.getter()
{
  return dispatch thunk of PersistedTranslation.targetLocale.getter();
}

uint64_t dispatch thunk of PersistedTranslation.hasAlternatives.getter()
{
  return dispatch thunk of PersistedTranslation.hasAlternatives.getter();
}

uint64_t dispatch thunk of PersistedTranslation.displaySourceText.getter()
{
  return dispatch thunk of PersistedTranslation.displaySourceText.getter();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.getter()
{
  return dispatch thunk of PersistedTranslation.translationResult.getter();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.setter()
{
  return dispatch thunk of PersistedTranslation.translationResult.setter();
}

uint64_t dispatch thunk of PersistedTranslation.showDisambiguation.getter()
{
  return dispatch thunk of PersistedTranslation.showDisambiguation.getter();
}

uint64_t dispatch thunk of PersistedTranslation.disambiguableResult.getter()
{
  return dispatch thunk of PersistedTranslation.disambiguableResult.getter();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.getter()
{
  return dispatch thunk of PersistedTranslation.selfLoggingInvocationId.getter();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter()
{
  return dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter();
}

uint64_t PersistedTranslation.selectedAlternativeIndex.getter()
{
  return PersistedTranslation.selectedAlternativeIndex.getter();
}

uint64_t PersistedTranslation.selectedAlternativeIndex.setter()
{
  return PersistedTranslation.selectedAlternativeIndex.setter();
}

uint64_t static PersistedTranslation.sortedByCreationDateFetchRequest(sessionIDs:)()
{
  return static PersistedTranslation.sortedByCreationDateFetchRequest(sessionIDs:)();
}

uint64_t static PersistedTranslation.favoritedSortedByCreationDateFetchRequest(localePair:)()
{
  return static PersistedTranslation.favoritedSortedByCreationDateFetchRequest(localePair:)();
}

uint64_t static PersistedTranslation.favoritedSortedByLocalePairAndCreationDateFetchRequest()()
{
  return static PersistedTranslation.favoritedSortedByLocalePairAndCreationDateFetchRequest()();
}

uint64_t type metadata accessor for PersistedTranslation()
{
  return type metadata accessor for PersistedTranslation();
}

uint64_t dispatch thunk of TranslationAlternative.sensesMeta.getter()
{
  return dispatch thunk of TranslationAlternative.sensesMeta.getter();
}

uint64_t dispatch thunk of TranslationAlternative.romanization.getter()
{
  return dispatch thunk of TranslationAlternative.romanization.getter();
}

uint64_t TranslationAlternative.displayString.getter()
{
  return TranslationAlternative.displayString.getter();
}

uint64_t dispatch thunk of TranslationStoreCoreData.viewContext.getter()
{
  return dispatch thunk of TranslationStoreCoreData.viewContext.getter();
}

uint64_t TranslationStoreCoreData.init(inMemoryOnly:)()
{
  return TranslationStoreCoreData.init(inMemoryOnly:)();
}

uint64_t TranslationStoreCoreData.deleteBackground(_:completion:)()
{
  return TranslationStoreCoreData.deleteBackground(_:completion:)();
}

uint64_t TranslationStoreCoreData.persistentContainer.getter()
{
  return TranslationStoreCoreData.persistentContainer.getter();
}

uint64_t TranslationStoreCoreData.toggleFavoriteBackground(_:)()
{
  return TranslationStoreCoreData.toggleFavoriteBackground(_:)();
}

uint64_t TranslationStoreCoreData.moc.getter()
{
  return TranslationStoreCoreData.moc.getter();
}

Swift::Void __swiftcall TranslationStoreCoreData.save()()
{
}

uint64_t TranslationStoreCoreData.insert(speech:translationResult:context:isFavorite:)()
{
  return TranslationStoreCoreData.insert(speech:translationResult:context:isFavorite:)();
}

uint64_t type metadata accessor for TranslationStoreCoreData()
{
  return type metadata accessor for TranslationStoreCoreData();
}

uint64_t dispatch thunk of TranslationSense.definition.getter()
{
  return dispatch thunk of TranslationSense.definition.getter();
}

uint64_t dispatch thunk of TranslationSense.sourceMatch.getter()
{
  return dispatch thunk of TranslationSense.sourceMatch.getter();
}

uint64_t dispatch thunk of TranslationSense.targetMatch.getter()
{
  return dispatch thunk of TranslationSense.targetMatch.getter();
}

uint64_t dispatch thunk of TranslationSense.labels.getter()
{
  return dispatch thunk of TranslationSense.labels.getter();
}

uint64_t dispatch thunk of TranslationStore.clearHistory(completion:)()
{
  return dispatch thunk of TranslationStore.clearHistory(completion:)();
}

uint64_t dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)()
{
  return dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)();
}

uint64_t dispatch thunk of TranslationStore.translations(with:)()
{
  return dispatch thunk of TranslationStore.translations(with:)();
}

uint64_t dispatch thunk of TranslationStore.favoriteCount.getter()
{
  return dispatch thunk of TranslationStore.favoriteCount.getter();
}

uint64_t dispatch thunk of TranslationStore.toggleFavorite(_:)()
{
  return dispatch thunk of TranslationStore.toggleFavorite(_:)();
}

uint64_t dispatch thunk of TranslationStore.deleteBackground(_:completion:)()
{
  return dispatch thunk of TranslationStore.deleteBackground(_:completion:)();
}

uint64_t dispatch thunk of TranslationStore.updateDisambiguation(for:)()
{
  return dispatch thunk of TranslationStore.updateDisambiguation(for:)();
}

uint64_t dispatch thunk of TranslationStore.toggleFavoriteBackground(_:)()
{
  return dispatch thunk of TranslationStore.toggleFavoriteBackground(_:)();
}

uint64_t dispatch thunk of TranslationStore.save()()
{
  return dispatch thunk of TranslationStore.save()();
}

uint64_t dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)()
{
  return dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)();
}

uint64_t dispatch thunk of TranslationResult.disambiguableResult.getter()
{
  return dispatch thunk of TranslationResult.disambiguableResult.getter();
}

uint64_t dispatch thunk of TranslationResult.alternatives.getter()
{
  return dispatch thunk of TranslationResult.alternatives.getter();
}

uint64_t dispatch thunk of TranslationResult.locale.getter()
{
  return dispatch thunk of TranslationResult.locale.getter();
}

uint64_t dispatch thunk of TranslationResult.isFinal.getter()
{
  return dispatch thunk of TranslationResult.isFinal.getter();
}

uint64_t dispatch thunk of TranslationResult.isOffline.getter()
{
  return dispatch thunk of TranslationResult.isOffline.getter();
}

uint64_t TranslationResult.isLowConfidence.getter()
{
  return TranslationResult.isLowConfidence.getter();
}

uint64_t dispatch thunk of SpeechResult.alternatives.getter()
{
  return dispatch thunk of SpeechResult.alternatives.getter();
}

uint64_t dispatch thunk of SpeechResult.origin.getter()
{
  return dispatch thunk of SpeechResult.origin.getter();
}

uint64_t dispatch thunk of SpeechResult.isEmpty()()
{
  return dispatch thunk of SpeechResult.isEmpty()();
}

uint64_t dispatch thunk of SpeechResult.isFinal.getter()
{
  return dispatch thunk of SpeechResult.isFinal.getter();
}

uint64_t FavoritesItem.translation.getter()
{
  return FavoritesItem.translation.getter();
}

uint64_t static FavoritesItem.== infix(_:_:)()
{
  return static FavoritesItem.== infix(_:_:)();
}

uint64_t FavoritesItem.hash(into:)()
{
  return FavoritesItem.hash(into:)();
}

uint64_t dispatch thunk of SpeechSausage.tokenBins.getter()
{
  return dispatch thunk of SpeechSausage.tokenBins.getter();
}

uint64_t dispatch thunk of SpeechTokenBin.bestAlternative.getter()
{
  return dispatch thunk of SpeechTokenBin.bestAlternative.getter();
}

uint64_t dispatch thunk of SpeechTokenBin.tokenAlternatives.getter()
{
  return dispatch thunk of SpeechTokenBin.tokenAlternatives.getter();
}

uint64_t dispatch thunk of AnnotatedResult.isLowConfidence.getter()
{
  return dispatch thunk of AnnotatedResult.isLowConfidence.getter();
}

uint64_t dispatch thunk of AnnotatedResult.locale.getter()
{
  return dispatch thunk of AnnotatedResult.locale.getter();
}

uint64_t AnnotatedResult.displayString.getter()
{
  return AnnotatedResult.displayString.getter();
}

uint64_t dispatch thunk of AnySpeechResult.value.getter()
{
  return dispatch thunk of AnySpeechResult.value.getter();
}

uint64_t dispatch thunk of FormattedString.formattedString.getter()
{
  return dispatch thunk of FormattedString.formattedString.getter();
}

uint64_t dispatch thunk of SanitizedResult.sanitizedFormattedString.getter()
{
  return dispatch thunk of SanitizedResult.sanitizedFormattedString.getter();
}

uint64_t type metadata accessor for SpeechResultOrigin()
{
  return type metadata accessor for SpeechResultOrigin();
}

uint64_t StoredSpeechResult.init(text:sanitizedText:locale:origin:)()
{
  return StoredSpeechResult.init(text:sanitizedText:locale:origin:)();
}

uint64_t type metadata accessor for StoredSpeechResult()
{
  return type metadata accessor for StoredSpeechResult();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.hasSpaceAfter.getter()
{
  return dispatch thunk of SpeechTokenAlternatives.hasSpaceAfter.getter();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.isLowConfidence.getter()
{
  return dispatch thunk of SpeechTokenAlternatives.isLowConfidence.getter();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.text.getter()
{
  return dispatch thunk of SpeechTokenAlternatives.text.getter();
}

uint64_t type metadata accessor for StoredDisambiguableResult()
{
  return type metadata accessor for StoredDisambiguableResult();
}

uint64_t StoredDisambiguableResult.init(_:)()
{
  return StoredDisambiguableResult.init(_:)();
}

uint64_t UTType.identifier.getter()
{
  return UTType.identifier.getter();
}

UTType __swiftcall UTType._bridgeToObjectiveC()()
{
  return (UTType)UTType._bridgeToObjectiveC()();
}

uint64_t static UTType.png.getter()
{
  return static UTType.png.getter();
}

uint64_t static UTType.jpeg.getter()
{
  return static UTType.jpeg.getter();
}

uint64_t static UTType.image.getter()
{
  return static UTType.image.getter();
}

uint64_t static UTType.plainText.getter()
{
  return static UTType.plainText.getter();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static _UIKitNumericRawRepresentable.+ infix(_:_:)()
{
  return static _UIKitNumericRawRepresentable.+ infix(_:_:)();
}

uint64_t static _UIKitNumericRawRepresentable.- infix(_:_:)()
{
  return static _UIKitNumericRawRepresentable.- infix(_:_:)();
}

uint64_t static UICellAccessory.customView(configuration:)()
{
  return static UICellAccessory.customView(configuration:)();
}

uint64_t type metadata accessor for UICellAccessory.DisplayedState()
{
  return type metadata accessor for UICellAccessory.DisplayedState();
}

uint64_t type metadata accessor for UICellAccessory.LayoutDimension()
{
  return type metadata accessor for UICellAccessory.LayoutDimension();
}

uint64_t UICellAccessory.CustomViewConfiguration.init(customView:placement:isHidden:reservedLayoutWidth:tintColor:maintainsFixedSize:)()
{
  return UICellAccessory.CustomViewConfiguration.init(customView:placement:isHidden:reservedLayoutWidth:tintColor:maintainsFixedSize:)();
}

uint64_t type metadata accessor for UICellAccessory.CustomViewConfiguration()
{
  return type metadata accessor for UICellAccessory.CustomViewConfiguration();
}

uint64_t type metadata accessor for UICellAccessory.Placement()
{
  return type metadata accessor for UICellAccessory.Placement();
}

uint64_t type metadata accessor for UICellAccessory()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t UIMutableTraits.layoutDirection.setter()
{
  return UIMutableTraits.layoutDirection.setter();
}

uint64_t dispatch thunk of UIMutableTraits.subscript.setter()
{
  return dispatch thunk of UIMutableTraits.subscript.setter();
}

uint64_t type metadata accessor for UITraitOverrides()
{
  return type metadata accessor for UITraitOverrides();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t static UITraitDefinition._isPrivate.getter()
{
  return static UITraitDefinition._isPrivate.getter();
}

uint64_t static UITraitDefinition.identifier.getter()
{
  return static UITraitDefinition.identifier.getter();
}

uint64_t static UITraitDefinition.affectsColorAppearance.getter()
{
  return static UITraitDefinition.affectsColorAppearance.getter();
}

uint64_t static UITraitDefinition._defaultValueRepresentsUnspecified.getter()
{
  return static UITraitDefinition._defaultValueRepresentsUnspecified.getter();
}

uint64_t static UITraitDefinition.name.getter()
{
  return static UITraitDefinition.name.getter();
}

uint64_t type metadata accessor for UITraitActiveAppearance()
{
  return type metadata accessor for UITraitActiveAppearance();
}

uint64_t type metadata accessor for UITraitBacklightLuminance()
{
  return type metadata accessor for UITraitBacklightLuminance();
}

uint64_t type metadata accessor for UITraitUserInterfaceIdiom()
{
  return type metadata accessor for UITraitUserInterfaceIdiom();
}

uint64_t type metadata accessor for UITraitUserInterfaceStyle()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t static UIListContentConfiguration.extraProminentInsetGroupedHeader()()
{
  return static UIListContentConfiguration.extraProminentInsetGroupedHeader()();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t type metadata accessor for UITraitHorizontalSizeClass()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t NSDiffableDataSourceSnapshot.appendItems(_:toSection:)()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

uint64_t NSDiffableDataSourceSnapshot.numberOfItems.getter()
{
  return NSDiffableDataSourceSnapshot.numberOfItems.getter();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.appendSections(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
}

uint64_t NSDiffableDataSourceSnapshot.itemIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers.getter();
}

uint64_t NSDiffableDataSourceSnapshot.numberOfSections.getter()
{
  return NSDiffableDataSourceSnapshot.numberOfSections.getter();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.reconfigureItems(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.sectionIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t NSDiffableDataSourceSnapshot.init()()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t UIContentUnavailableConfiguration.secondaryText.setter()
{
  return UIContentUnavailableConfiguration.secondaryText.setter();
}

uint64_t UIContentUnavailableConfiguration.ButtonProperties.primaryAction.setter()
{
  return UIContentUnavailableConfiguration.ButtonProperties.primaryAction.setter();
}

uint64_t UIContentUnavailableConfiguration.buttonProperties.modify()
{
  return UIContentUnavailableConfiguration.buttonProperties.modify();
}

uint64_t UIContentUnavailableConfiguration.directionalLayoutMargins.setter()
{
  return UIContentUnavailableConfiguration.directionalLayoutMargins.setter();
}

uint64_t UIContentUnavailableConfiguration.text.setter()
{
  return UIContentUnavailableConfiguration.text.setter();
}

uint64_t static UIContentUnavailableConfiguration.empty()()
{
  return static UIContentUnavailableConfiguration.empty()();
}

uint64_t UIContentUnavailableConfiguration.image.setter()
{
  return UIContentUnavailableConfiguration.image.setter();
}

uint64_t UIContentUnavailableConfiguration.button.modify()
{
  return UIContentUnavailableConfiguration.button.modify();
}

uint64_t type metadata accessor for UIContentUnavailableConfiguration()
{
  return type metadata accessor for UIContentUnavailableConfiguration();
}

uint64_t UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.collectionView(_:numberOfItemsInSection:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.collectionView(_:numberOfItemsInSection:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.numberOfSections(in:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.numberOfSections(in:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.sectionIdentifier(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.sectionIdentifier(for:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t UICollectionViewDiffableDataSource.apply(_:to:animatingDifferences:completion:)()
{
  return UICollectionViewDiffableDataSource.apply(_:to:animatingDifferences:completion:)();
}

uint64_t UICollectionViewDiffableDataSource.snapshot(for:)()
{
  return UICollectionViewDiffableDataSource.snapshot(for:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.snapshot()()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
}

Swift::Void __swiftcall NSDiffableDataSourceSectionSnapshot.delete(_:)(Swift::OpaquePointer a1)
{
}

uint64_t UICollectionLayoutListConfiguration.trailingSwipeActionsConfigurationProvider.setter()
{
  return UICollectionLayoutListConfiguration.trailingSwipeActionsConfigurationProvider.setter();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.Appearance()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t UICollectionLayoutListConfiguration.init(appearance:)()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t UICollectionLayoutListConfiguration.headerMode.setter()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t UICollectionLayoutListConfiguration.showsSeparators.setter()
{
  return UICollectionLayoutListConfiguration.showsSeparators.setter();
}

uint64_t UICollectionLayoutListConfiguration.headerTopPadding.setter()
{
  return UICollectionLayoutListConfiguration.headerTopPadding.setter();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t Tip.invalidate(reason:)()
{
  return Tip.invalidate(reason:)();
}

uint64_t Tip.shouldDisplay.getter()
{
  return Tip.shouldDisplay.getter();
}

uint64_t Tip.shouldDisplayUpdates.getter()
{
  return Tip.shouldDisplayUpdates.getter();
}

uint64_t Tip.id.getter()
{
  return Tip.id.getter();
}

uint64_t Tip.image.getter()
{
  return Tip.image.getter();
}

uint64_t Tip.actions.getter()
{
  return Tip.actions.getter();
}

uint64_t TipView.init(_:arrowEdge:action:)()
{
  return TipView.init(_:arrowEdge:action:)();
}

uint64_t static Tips.RuleBuilder.buildExpression(_:)()
{
  return static Tips.RuleBuilder.buildExpression(_:)();
}

{
  return static Tips.RuleBuilder.buildExpression(_:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(accumulated:next:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(accumulated:next:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(first:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(first:)();
}

uint64_t type metadata accessor for Tips.EmptyDonation()
{
  return type metadata accessor for Tips.EmptyDonation();
}

uint64_t static Tips.OptionsBuilder.buildExpression<A>(_:)()
{
  return static Tips.OptionsBuilder.buildExpression<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildFinalResult<A>(_:)()
{
  return static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A>(first:)()
{
  return static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return type metadata accessor for Tips.MaxDisplayCount();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return Tips.MaxDisplayCount.init(_:)();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return type metadata accessor for Tips.InvalidationReason();
}

uint64_t static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter()
{
  return static Tips.ConfigurationOption.AnalyticsEngine.coreAnalytics.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine()
{
  return type metadata accessor for Tips.ConfigurationOption.AnalyticsEngine();
}

uint64_t static Tips.ConfigurationOption.analyticsEngine(_:)()
{
  return static Tips.ConfigurationOption.analyticsEngine(_:)();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.system.getter()
{
  return static Tips.ConfigurationOption.DisplayFrequency.system.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DisplayFrequency()
{
  return type metadata accessor for Tips.ConfigurationOption.DisplayFrequency();
}

uint64_t static Tips.ConfigurationOption.displayFrequency(_:)()
{
  return static Tips.ConfigurationOption.displayFrequency(_:)();
}

uint64_t static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter()
{
  return static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DatastoreLocation()
{
  return type metadata accessor for Tips.ConfigurationOption.DatastoreLocation();
}

uint64_t static Tips.ConfigurationOption.datastoreLocation(_:)()
{
  return static Tips.ConfigurationOption.datastoreLocation(_:)();
}

uint64_t type metadata accessor for Tips.ConfigurationOption()
{
  return type metadata accessor for Tips.ConfigurationOption();
}

uint64_t type metadata accessor for Tips.Rule()
{
  return type metadata accessor for Tips.Rule();
}

uint64_t Tips.Rule.init<A>(_:_:)()
{
  return Tips.Rule.init<A>(_:_:)();
}

{
  return Tips.Rule.init<A>(_:_:)();
}

uint64_t Tips.Event.sendDonation<>(_:)()
{
  return Tips.Event.sendDonation<>(_:)();
}

uint64_t Tips.Event.init<>(id:)()
{
  return Tips.Event.init<>(id:)();
}

uint64_t Tips.Event.donations.getter()
{
  return Tips.Event.donations.getter();
}

uint64_t Tips.Action.init(id:perform:_:)()
{
  return Tips.Action.init(id:perform:_:)();
}

uint64_t Tips.Action.with(index:)()
{
  return Tips.Action.with(index:)();
}

uint64_t type metadata accessor for Tips.Action()
{
  return type metadata accessor for Tips.Action();
}

uint64_t type metadata accessor for Tips.Status()
{
  return type metadata accessor for Tips.Status();
}

uint64_t Tips.Parameter.wrappedValue.setter()
{
  return Tips.Parameter.wrappedValue.setter();
}

uint64_t Tips.Parameter.init<A>(_:_:_:_:)()
{
  return Tips.Parameter.init<A>(_:_:_:_:)();
}

uint64_t static Tips.configure(_:)()
{
  return static Tips.configure(_:)();
}

uint64_t Publishers.CombineLatest.init(_:_:)()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t Publishers.CombineLatest3.init(_:_:_:)()
{
  return Publishers.CombineLatest3.init(_:_:_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t AnyCancellable.store<A>(in:)()
{
  return AnyCancellable.store<A>(in:)();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t PassthroughSubject.send(_:)()
{
  return PassthroughSubject.send(_:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

uint64_t ConnectablePublisher.autoconnect()()
{
  return ConnectablePublisher.autoconnect()();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.combineLatest<A, B, C>(_:_:_:)()
{
  return Publisher.combineLatest<A, B, C>(_:_:_:)();
}

{
  return Publisher.combineLatest<A, B, C>(_:_:_:)();
}

uint64_t Publisher.combineLatest<A>(_:)()
{
  return Publisher.combineLatest<A>(_:)();
}

uint64_t Publisher.combineLatest<A, B, C, D>(_:_:_:_:)()
{
  return Publisher.combineLatest<A, B, C, D>(_:_:_:_:)();
}

uint64_t Publisher.combineLatest<A, B>(_:_:)()
{
  return Publisher.combineLatest<A, B>(_:_:)();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.filter(_:)()
{
  return Publisher.filter(_:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.debounce<A>(for:scheduler:options:)()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t Publisher.dropFirst(_:)()
{
  return Publisher.dropFirst(_:)();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t Publisher<>.assign<A>(to:on:)()
{
  return Publisher<>.assign<A>(to:on:)();
}

uint64_t NWPathMonitor.pathUpdateHandler.setter()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t NWPathMonitor.start(queue:)()
{
  return NWPathMonitor.start(queue:)();
}

uint64_t NWPathMonitor.init()()
{
  return NWPathMonitor.init()();
}

uint64_t type metadata accessor for NWPathMonitor()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t type metadata accessor for NWPath.Status()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t NWPath.status.getter()
{
  return NWPath.status.getter();
}

uint64_t type metadata accessor for NWPath()
{
  return type metadata accessor for NWPath();
}

uint64_t Animatable<>.animatableData.modify()
{
  return Animatable<>.animatableData.modify();
}

uint64_t static Animatable<>._makeAnimatable(value:inputs:)()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t static Animatable._makeAnimatable(value:inputs:)()
{
  return static Animatable._makeAnimatable(value:inputs:)();
}

uint64_t static ButtonRole.destructive.getter()
{
  return static ButtonRole.destructive.getter();
}

uint64_t static ButtonRole.cancel.getter()
{
  return static ButtonRole.cancel.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t FocusState.wrappedValue.getter()
{
  return FocusState.wrappedValue.getter();
}

uint64_t FocusState.wrappedValue.setter()
{
  return FocusState.wrappedValue.setter();
}

uint64_t FocusState.projectedValue.getter()
{
  return FocusState.projectedValue.getter();
}

uint64_t FocusState.init<>()()
{
  return FocusState.init<>()();
}

uint64_t static ScenePhase.== infix(_:_:)()
{
  return static ScenePhase.== infix(_:_:)();
}

uint64_t type metadata accessor for ScenePhase()
{
  return type metadata accessor for ScenePhase();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t static AlignmentID._combineExplicit(childValue:_:into:)()
{
  return static AlignmentID._combineExplicit(childValue:_:into:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for ControlSize()
{
  return type metadata accessor for ControlSize();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t Environment.init<A>(_:)()
{
  return Environment.init<A>(_:)();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t Transaction.animation.setter()
{
  return Transaction.animation.setter();
}

uint64_t DropDelegate.dropExited(info:)()
{
  return DropDelegate.dropExited(info:)();
}

uint64_t DropDelegate.dropEntered(info:)()
{
  return DropDelegate.dropEntered(info:)();
}

uint64_t DropDelegate.dropUpdated(info:)()
{
  return DropDelegate.dropUpdated(info:)();
}

uint64_t FetchRequest.init(fetchRequest:animation:)()
{
  return FetchRequest.init(fetchRequest:animation:)();
}

uint64_t FetchRequest.wrappedValue.getter()
{
  return FetchRequest.wrappedValue.getter();
}

uint64_t type metadata accessor for FetchRequest()
{
  return type metadata accessor for FetchRequest();
}

uint64_t static ListItemTint.fixed(_:)()
{
  return static ListItemTint.fixed(_:)();
}

uint64_t type metadata accessor for ListItemTint()
{
  return type metadata accessor for ListItemTint();
}

uint64_t ScaledMetric.init(wrappedValue:)()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t ScaledMetric.wrappedValue.getter()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledMetric()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t SharePreview<>.init(_:image:)()
{
  return SharePreview<>.init(_:image:)();
}

uint64_t TimelineView.Context.date.getter()
{
  return TimelineView.Context.date.getter();
}

uint64_t TimelineView<>.init(_:content:)()
{
  return TimelineView<>.init(_:content:)();
}

uint64_t VerticalEdge.rawValue.getter()
{
  return VerticalEdge.rawValue.getter();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t static AnyTransition.asymmetric(insertion:removal:)()
{
  return static AnyTransition.asymmetric(insertion:removal:)();
}

uint64_t static AnyTransition.blur(radius:)()
{
  return static AnyTransition.blur(radius:)();
}

uint64_t static AnyTransition.move(edge:)()
{
  return static AnyTransition.move(edge:)();
}

uint64_t static AnyTransition.scale(scale:anchor:)()
{
  return static AnyTransition.scale(scale:anchor:)();
}

uint64_t static AnyTransition.opacity.getter()
{
  return static AnyTransition.opacity.getter();
}

uint64_t AnyTransition.combined(with:)()
{
  return AnyTransition.combined(with:)();
}

uint64_t static AnyTransition.identity.getter()
{
  return static AnyTransition.identity.getter();
}

uint64_t static AnyTransition.modifier<A>(active:identity:)()
{
  return static AnyTransition.modifier<A>(active:identity:)();
}

uint64_t AnyTransition.init<A>(_:)()
{
  return AnyTransition.init<A>(_:)();
}

Swift::Void __swiftcall DismissAction.callAsFunction()()
{
}

uint64_t type metadata accessor for DismissAction()
{
  return type metadata accessor for DismissAction();
}

uint64_t GeometryProxy.size.getter()
{
  return GeometryProxy.size.getter();
}

uint64_t GeometryProxy.frame<A>(in:)()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t ImageRenderer.uiImage.getter()
{
  return ImageRenderer.uiImage.getter();
}

uint64_t ImageRenderer.init(content:)()
{
  return ImageRenderer.init(content:)();
}

uint64_t OpenURLAction.callAsFunction(_:)()
{
  return OpenURLAction.callAsFunction(_:)();
}

uint64_t type metadata accessor for OpenURLAction()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t PhaseAnimator.init<A, B>(_:trigger:content:animation:)()
{
  return PhaseAnimator.init<A, B>(_:trigger:content:animation:)();
}

uint64_t static ShaderLibrary.subscript.getter()
{
  return static ShaderLibrary.subscript.getter();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t HorizontalEdge.rawValue.getter()
{
  return HorizontalEdge.rawValue.getter();
}

uint64_t LabeledContent<>.init<A>(_:value:)()
{
  return LabeledContent<>.init<A>(_:value:)();
}

uint64_t LinearKeyframe.init(_:duration:timingCurve:)()
{
  return LinearKeyframe.init(_:duration:timingCurve:)();
}

uint64_t NavigationLink<>.init<A>(value:label:)()
{
  return NavigationLink<>.init<A>(value:label:)();
}

uint64_t NavigationView.init(content:)()
{
  return NavigationView.init(content:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t ObservedObject.projectedValue.getter()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t ObservedObject.Wrapper.subscript.getter()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t ShaderFunction.dynamicallyCall(withArguments:)()
{
  return ShaderFunction.dynamicallyCall(withArguments:)();
}

uint64_t type metadata accessor for ShaderFunction()
{
  return type metadata accessor for ShaderFunction();
}

uint64_t ViewDimensions.subscript.getter()
{
  return ViewDimensions.subscript.getter();
}

uint64_t ButtonMenuStyle.init()()
{
  return ButtonMenuStyle.init()();
}

uint64_t type metadata accessor for ButtonMenuStyle()
{
  return type metadata accessor for ButtonMenuStyle();
}

uint64_t DynamicTypeSize.isAccessibilitySize.getter()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t GraphicsContext.rbDrawingState.getter()
{
  return GraphicsContext.rbDrawingState.getter();
}

uint64_t GraphicsContext.draw(_:options:)()
{
  return GraphicsContext.draw(_:options:)();
}

uint64_t static GraphicsContext.Filter.layerShader(_:maxSampleOffset:)()
{
  return static GraphicsContext.Filter.layerShader(_:maxSampleOffset:)();
}

uint64_t static GraphicsContext.Filter.shadow(color:radius:x:y:blendMode:options:)()
{
  return static GraphicsContext.Filter.shadow(color:radius:x:y:blendMode:options:)();
}

uint64_t type metadata accessor for GraphicsContext.Filter()
{
  return type metadata accessor for GraphicsContext.Filter();
}

uint64_t GraphicsContext.addFilter(_:options:)()
{
  return GraphicsContext.addFilter(_:options:)();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t ModifiedContent<>.accessibility(label:)()
{
  return ModifiedContent<>.accessibility(label:)();
}

uint64_t ModifiedContent<>.accessibility(value:)()
{
  return ModifiedContent<>.accessibility(value:)();
}

uint64_t ModifiedContent<>.accessibility(addTraits:)()
{
  return ModifiedContent<>.accessibility(addTraits:)();
}

uint64_t ModifiedContent<>.accessibilityIdentifier(_:)()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static SafeAreaRegions.keyboard.getter()
{
  return static SafeAreaRegions.keyboard.getter();
}

uint64_t static SafeAreaRegions.container.getter()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t type metadata accessor for ScaleTransition()
{
  return type metadata accessor for ScaleTransition();
}

uint64_t ScaleTransition.init(_:anchor:)()
{
  return ScaleTransition.init(_:anchor:)();
}

uint64_t ScrollViewProxy.scrollTo<A>(_:anchor:)()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t type metadata accessor for ScrollViewProxy()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t static KeyboardShortcut.defaultAction.getter()
{
  return static KeyboardShortcut.defaultAction.getter();
}

uint64_t type metadata accessor for KeyboardShortcut()
{
  return type metadata accessor for KeyboardShortcut();
}

uint64_t KeyframeTimeline.init<A>(initialValue:content:)()
{
  return KeyframeTimeline.init<A>(initialValue:content:)();
}

uint64_t KeyframeTimeline.value(progress:)()
{
  return KeyframeTimeline.value(progress:)();
}

uint64_t static KeyframesBuilder.buildArray<A>(_:)()
{
  return static KeyframesBuilder.buildArray<A>(_:)();
}

uint64_t static KeyframesBuilder.buildExpression<A>(_:)()
{
  return static KeyframesBuilder.buildExpression<A>(_:)();
}

uint64_t static KeyframesBuilder.buildFinalResult<A>(_:)()
{
  return static KeyframesBuilder.buildFinalResult<A>(_:)();
}

uint64_t static KeyframesBuilder.buildPartialBlock<A>(first:)()
{
  return static KeyframesBuilder.buildPartialBlock<A>(first:)();
}

uint64_t static RedactionReasons.placeholder.getter()
{
  return static RedactionReasons.placeholder.getter();
}

uint64_t type metadata accessor for RedactionReasons()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t SidebarListStyle.init()()
{
  return SidebarListStyle.init()();
}

uint64_t type metadata accessor for SidebarListStyle()
{
  return type metadata accessor for SidebarListStyle();
}

uint64_t ToolbarItemGroup.init(placement:content:)()
{
  return ToolbarItemGroup.init(placement:content:)();
}

uint64_t static ToolbarPlacement.tabBar.getter()
{
  return static ToolbarPlacement.tabBar.getter();
}

uint64_t type metadata accessor for ToolbarPlacement()
{
  return type metadata accessor for ToolbarPlacement();
}

uint64_t type metadata accessor for _BlendModeEffect()
{
  return type metadata accessor for _BlendModeEffect();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t static ButtonBorderShape.capsule.getter()
{
  return static ButtonBorderShape.capsule.getter();
}

uint64_t type metadata accessor for ButtonBorderShape()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t static ContentShapeKinds.contextMenuPreview.getter()
{
  return static ContentShapeKinds.contextMenuPreview.getter();
}

uint64_t type metadata accessor for ContentShapeKinds()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t static ContentTransition.symbolEffect<A>(_:options:)()
{
  return static ContentTransition.symbolEffect<A>(_:options:)();
}

uint64_t type metadata accessor for ContentTransition()
{
  return type metadata accessor for ContentTransition();
}

uint64_t EnvironmentObject.projectedValue.getter()
{
  return EnvironmentObject.projectedValue.getter();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.Wrapper.subscript.getter()
{
  return EnvironmentObject.Wrapper.subscript.getter();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.unlockAndOpenURL.getter()
{
  return EnvironmentValues.unlockAndOpenURL.getter();
}

uint64_t EnvironmentValues.unlockAndOpenURL.setter()
{
  return EnvironmentValues.unlockAndOpenURL.setter();
}

uint64_t EnvironmentValues.languageLabelContext.getter()
{
  return EnvironmentValues.languageLabelContext.getter();
}

uint64_t EnvironmentValues.languageLabelContext.setter()
{
  return EnvironmentValues.languageLabelContext.setter();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t EnvironmentValues.imageScale.setter()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t EnvironmentValues.scenePhase.getter()
{
  return EnvironmentValues.scenePhase.getter();
}

uint64_t EnvironmentValues.scenePhase.setter()
{
  return EnvironmentValues.scenePhase.setter();
}

uint64_t EnvironmentValues.accentColor.getter()
{
  return EnvironmentValues.accentColor.getter();
}

uint64_t EnvironmentValues.accentColor.setter()
{
  return EnvironmentValues.accentColor.setter();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.controlSize.getter()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t EnvironmentValues.displayScale.getter()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t EnvironmentValues.displayScale.setter()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t EnvironmentValues.sizeCategory.getter()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t EnvironmentValues.sizeCategory.setter()
{
  return EnvironmentValues.sizeCategory.setter();
}

uint64_t EnvironmentValues.avoidsOrphans.getter()
{
  return EnvironmentValues.avoidsOrphans.getter();
}

uint64_t EnvironmentValues.avoidsOrphans.setter()
{
  return EnvironmentValues.avoidsOrphans.setter();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.layoutDirection.getter()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t EnvironmentValues.layoutDirection.setter()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t EnvironmentValues.contentTransition.getter()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t EnvironmentValues.contentTransition.setter()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t EnvironmentValues._buttonBorderShape.getter()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.setter()
{
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t EnvironmentValues.managedObjectContext.getter()
{
  return EnvironmentValues.managedObjectContext.getter();
}

uint64_t EnvironmentValues.managedObjectContext.setter()
{
  return EnvironmentValues.managedObjectContext.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.dismiss.getter()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t EnvironmentValues.tintColor.getter()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t EnvironmentValues.tintColor.setter()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return EnvironmentValues.subscript.getter();
}

{
  return EnvironmentValues.subscript.getter();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

{
  return EnvironmentValues.subscript.setter();
}

uint64_t InlinePickerStyle.init()()
{
  return InlinePickerStyle.init()();
}

uint64_t type metadata accessor for InlinePickerStyle()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t type metadata accessor for NavigationBarItem.TitleDisplayMode()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t OpacityTransition.init()()
{
  return OpacityTransition.init()();
}

uint64_t type metadata accessor for OpacityTransition()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t static VerticalAlignment.lastTextBaseline.getter()
{
  return static VerticalAlignment.lastTextBaseline.getter();
}

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.bottom.getter()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t VerticalAlignment.init(_:)()
{
  return VerticalAlignment.init(_:)();
}

uint64_t type metadata accessor for ColorRenderingMode()
{
  return type metadata accessor for ColorRenderingMode();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation(_:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t static PresentationDetent.large.getter()
{
  return static PresentationDetent.large.getter();
}

uint64_t static PresentationDetent.medium.getter()
{
  return static PresentationDetent.medium.getter();
}

uint64_t type metadata accessor for PresentationDetent()
{
  return type metadata accessor for PresentationDetent();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static AccessibilityTraits.playsSound.getter()
{
  return static AccessibilityTraits.playsSound.getter();
}

uint64_t static AccessibilityTraits.updatesFrequently.getter()
{
  return static AccessibilityTraits.updatesFrequently.getter();
}

uint64_t static AccessibilityTraits.startsMediaSession.getter()
{
  return static AccessibilityTraits.startsMediaSession.getter();
}

uint64_t type metadata accessor for AccessibilityTraits()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t BorderedButtonStyle.init()()
{
  return BorderedButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedButtonStyle()
{
  return type metadata accessor for BorderedButtonStyle();
}

uint64_t type metadata accessor for ContentSizeCategory()
{
  return type metadata accessor for ContentSizeCategory();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static HorizontalAlignment.trailing.getter()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t NavigationSplitView.init<>(columnVisibility:sidebar:detail:)()
{
  return NavigationSplitView.init<>(columnVisibility:sidebar:detail:)();
}

uint64_t TitleOnlyLabelStyle.init()()
{
  return TitleOnlyLabelStyle.init()();
}

uint64_t type metadata accessor for TitleOnlyLabelStyle()
{
  return type metadata accessor for TitleOnlyLabelStyle();
}

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t dispatch thunk of UIHostingController.sizingOptions.setter()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t dispatch thunk of UIHostingController.rootView.getter()
{
  return dispatch thunk of UIHostingController.rootView.getter();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t static ToolbarItemPlacement.topBarTrailing.getter()
{
  return static ToolbarItemPlacement.topBarTrailing.getter();
}

uint64_t static ToolbarItemPlacement.navigationBarLeading.getter()
{
  return static ToolbarItemPlacement.navigationBarLeading.getter();
}

uint64_t static ToolbarItemPlacement.navigationBarTrailing.getter()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t type metadata accessor for _MaskAlignmentEffect()
{
  return type metadata accessor for _MaskAlignmentEffect();
}

uint64_t type metadata accessor for GlobalCoordinateSpace()
{
  return type metadata accessor for GlobalCoordinateSpace();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static ToolbarContentBuilder.buildIf<A>(_:)()
{
  return static ToolbarContentBuilder.buildIf<A>(_:)();
}

uint64_t type metadata accessor for _ViewModifier_Content()
{
  return type metadata accessor for _ViewModifier_Content();
}

uint64_t UIHostingConfiguration.animatedSizeInvalidationDisabled()()
{
  return UIHostingConfiguration.animatedSizeInvalidationDisabled()();
}

uint64_t UIHostingConfiguration.margins(_:_:)()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t UIHostingConfiguration<>.init(content:)()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t static UserInterfaceSizeClass.== infix(_:_:)()
{
  return static UserInterfaceSizeClass.== infix(_:_:)();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t static CoordinateSpaceProtocol<>.global.getter()
{
  return static CoordinateSpaceProtocol<>.global.getter();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Title()
{
  return type metadata accessor for LabelStyleConfiguration.Title();
}

uint64_t LabelStyleConfiguration.title.getter()
{
  return LabelStyleConfiguration.title.getter();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return type metadata accessor for ButtonStyleConfiguration.Label();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return ButtonStyleConfiguration.label.getter();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return ButtonStyleConfiguration.isPressed.getter();
}

uint64_t EnabledTextSelectability.init()()
{
  return EnabledTextSelectability.init()();
}

uint64_t type metadata accessor for EnabledTextSelectability()
{
  return type metadata accessor for EnabledTextSelectability();
}

uint64_t static NavigationSplitViewStyle<>.prominentDetail.getter()
{
  return static NavigationSplitViewStyle<>.prominentDetail.getter();
}

uint64_t static NavigationSplitViewStyle<>.automatic.getter()
{
  return static NavigationSplitViewStyle<>.automatic.getter();
}

uint64_t AnimationTimelineSchedule.init(minimumInterval:paused:)()
{
  return AnimationTimelineSchedule.init(minimumInterval:paused:)();
}

uint64_t type metadata accessor for AnimationTimelineSchedule()
{
  return type metadata accessor for AnimationTimelineSchedule();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t UIViewRepresentableContext.environment.getter()
{
  return UIViewRepresentableContext.environment.getter();
}

uint64_t static NavigationSplitViewVisibility.detailOnly.getter()
{
  return static NavigationSplitViewVisibility.detailOnly.getter();
}

uint64_t static NavigationSplitViewVisibility.== infix(_:_:)()
{
  return static NavigationSplitViewVisibility.== infix(_:_:)();
}

uint64_t static NavigationSplitViewVisibility.all.getter()
{
  return static NavigationSplitViewVisibility.all.getter();
}

uint64_t static NavigationSplitViewVisibility.automatic.getter()
{
  return static NavigationSplitViewVisibility.automatic.getter();
}

uint64_t type metadata accessor for NavigationSplitViewVisibility()
{
  return type metadata accessor for NavigationSplitViewVisibility();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t static UIHostingControllerSizingOptions.intrinsicContentSize.getter()
{
  return static UIHostingControllerSizingOptions.intrinsicContentSize.getter();
}

uint64_t static UIHostingControllerSizingOptions.preferredContentSize.getter()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t type metadata accessor for UIHostingControllerSizingOptions()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t type metadata accessor for AutomaticNavigationSplitViewStyle()
{
  return type metadata accessor for AutomaticNavigationSplitViewStyle();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t type metadata accessor for ProminentDetailNavigationSplitViewStyle()
{
  return type metadata accessor for ProminentDetailNavigationSplitViewStyle();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t static Axis.Set.vertical.getter()
{
  return static Axis.Set.vertical.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t Edge.init(rawValue:)()
{
  return Edge.init(rawValue:)();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t static Font.body.getter()
{
  return static Font.body.getter();
}

uint64_t Font.bold()()
{
  return Font.bold()();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.bold.getter()
{
  return static Font.Weight.bold.getter();
}

uint64_t static Font.Weight.regular.getter()
{
  return static Font.Weight.regular.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
}

uint64_t static Font.title3.getter()
{
  return static Font.title3.getter();
}

uint64_t Font.weight(_:)()
{
  return Font.weight(_:)();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t static Font.caption2.getter()
{
  return static Font.caption2.getter();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Form.init(content:)()
{
  return Form.init(content:)();
}

uint64_t List.init(selection:content:)()
{
  return List.init(selection:content:)();
}

uint64_t Menu.init(content:label:primaryAction:)()
{
  return Menu.init(content:label:primaryAction:)();
}

uint64_t Menu.init(content:label:)()
{
  return Menu.init(content:label:)();
}

uint64_t Path.move(to:)()
{
  return Path.move(to:)();
}

uint64_t Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)()
{
  return Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:)();
}

uint64_t Path.addLine(to:)()
{
  return Path.addLine(to:)();
}

uint64_t Path.addCurve(to:control1:control2:)()
{
  return Path.addCurve(to:control1:control2:)();
}

uint64_t Path.applying(_:)()
{
  return Path.applying(_:)();
}

uint64_t Path.init()()
{
  return Path.init()();
}

uint64_t type metadata accessor for Text.WritingMode()
{
  return type metadata accessor for Text.WritingMode();
}

uint64_t Text.Measurements.numberOfLines(of:in:writingMode:)()
{
  return Text.Measurements.numberOfLines(of:in:writingMode:)();
}

uint64_t Text.Measurements.size(of:in:writingMode:)()
{
  return Text.Measurements.size(of:in:writingMode:)();
}

uint64_t Text.Measurements.init()()
{
  return Text.Measurements.init()();
}

uint64_t type metadata accessor for Text.Measurements()
{
  return type metadata accessor for Text.Measurements();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.CustomAttributes.add<A>(_:)()
{
  return Text.CustomAttributes.add<A>(_:)();
}

uint64_t Text.CustomAttributes.init()()
{
  return Text.CustomAttributes.init()();
}

uint64_t type metadata accessor for Text.CustomAttributes()
{
  return type metadata accessor for Text.CustomAttributes();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.Layout.Run.typographicBounds.getter()
{
  return Text.Layout.Run.typographicBounds.getter();
}

uint64_t type metadata accessor for Text.Layout.Run()
{
  return type metadata accessor for Text.Layout.Run();
}

uint64_t Text.Layout.Run.subscript.getter()
{
  return Text.Layout.Run.subscript.getter();
}

uint64_t Text.Layout.Line.typographicBounds.getter()
{
  return Text.Layout.Line.typographicBounds.getter();
}

uint64_t type metadata accessor for Text.Layout.Line()
{
  return type metadata accessor for Text.Layout.Line();
}

uint64_t type metadata accessor for Text.Layout()
{
  return type metadata accessor for Text.Layout();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.bindGeometry(to:reader:)()
{
  return View.bindGeometry(to:reader:)();
}

uint64_t View.popoverTip<A>(_:arrowEdge:action:)()
{
  return View.popoverTip<A>(_:arrowEdge:action:)();
}

uint64_t View.tipBackground<A>(_:)()
{
  return View.tipBackground<A>(_:)();
}

uint64_t View.tipCornerRadius(_:antialiased:)()
{
  return View.tipCornerRadius(_:antialiased:)();
}

uint64_t View.navigationSplitViewStyle<A>(_:)()
{
  return View.navigationSplitViewStyle<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.labelStyle<A>(_:)()
{
  return View.labelStyle<A>(_:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.contextMenu<A>(menuItems:)()
{
  return View.contextMenu<A>(menuItems:)();
}

uint64_t View.environment<A>(_:)()
{
  return View.environment<A>(_:)();
}

uint64_t View.pickerStyle<A>(_:)()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t View.drawingGroup(opaque:colorMode:)()
{
  return View.drawingGroup(opaque:colorMode:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t View.scenePadding(_:)()
{
  return View.scenePadding(_:)();
}

uint64_t View.accessibility(hint:)()
{
  return View.accessibility(hint:)();
}

uint64_t View.accessibility(label:)()
{
  return View.accessibility(label:)();
}

uint64_t View.textSelection<A>(_:)()
{
  return View.textSelection<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.scrollDisabled(_:)()
{
  return View.scrollDisabled(_:)();
}

uint64_t View.dynamicTypeSize(_:)()
{
  return View.dynamicTypeSize(_:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

uint64_t View.keyboardShortcut(_:)()
{
  return View.keyboardShortcut(_:)();
}

uint64_t View.toolbarBackground(_:for:)()
{
  return View.toolbarBackground(_:for:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

uint64_t View.confirmationDialog<A>(_:isPresented:titleVisibility:actions:)()
{
  return View.confirmationDialog<A>(_:isPresented:titleVisibility:actions:)();
}

uint64_t View.navigationBarTitle(_:displayMode:)()
{
  return View.navigationBarTitle(_:displayMode:)();
}

uint64_t View.navigationBarTitle(_:)()
{
  return View.navigationBarTitle(_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.allowsSecureDrawing()()
{
  return View.allowsSecureDrawing()();
}

uint64_t View.navigationBarHidden(_:)()
{
  return View.navigationBarHidden(_:)();
}

uint64_t View.presentationDetents(_:)()
{
  return View.presentationDetents(_:)();
}

uint64_t View.typesettingLanguage(_:isEnabled:)()
{
  return View.typesettingLanguage(_:isEnabled:)();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.accessibilityShowsLargeContentViewer<A>(_:)()
{
  return View.accessibilityShowsLargeContentViewer<A>(_:)();
}

uint64_t View.bold(_:)()
{
  return View.bold(_:)();
}

uint64_t View.mask<A>(alignment:_:)()
{
  return View.mask<A>(alignment:_:)();
}

uint64_t View.alert<A, B, C, D>(_:isPresented:presenting:actions:message:)()
{
  return View.alert<A, B, C, D>(_:isPresented:presenting:actions:message:)();
}

uint64_t View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t View.sheet<A>(isPresented:onDismiss:content:)()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t View.onDrop(of:delegate:)()
{
  return View.onDrop(of:delegate:)();
}

uint64_t View.focused(_:)()
{
  return View.focused(_:)();
}

uint64_t View.tabItem<A>(_:)()
{
  return View.tabItem<A>(_:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.onChange<A>(of:initial:_:)()
{
  return View.onChange<A>(of:initial:_:)();
}

{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t View.redacted(reason:)()
{
  return View.redacted(reason:)();
}

uint64_t View.formSheet<A>(isPresented:content:)()
{
  return View.formSheet<A>(isPresented:content:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t View.menuOrder(_:)()
{
  return View.menuOrder(_:)();
}

uint64_t View.menuStyle<A>(_:)()
{
  return View.menuStyle<A>(_:)();
}

uint64_t View.statusBar(hidden:)()
{
  return View.statusBar(hidden:)();
}

uint64_t Angle.animatableData.getter()
{
  return Angle.animatableData.getter();
}

uint64_t Angle.animatableData.setter()
{
  return Angle.animatableData.setter();
}

uint64_t static Color.sourceTextColor.getter()
{
  return static Color.sourceTextColor.getter();
}

uint64_t static Color.appBackgroundColor.getter()
{
  return static Color.appBackgroundColor.getter();
}

uint64_t static Color.broadcastTintColor.getter()
{
  return static Color.broadcastTintColor.getter();
}

uint64_t static Color.translateAccentColor.getter()
{
  return static Color.translateAccentColor.getter();
}

uint64_t static Color.enabledCardButtonFillColor.getter()
{
  return static Color.enabledCardButtonFillColor.getter();
}

uint64_t static Color.disabledCardButtonFillColor.getter()
{
  return static Color.disabledCardButtonFillColor.getter();
}

uint64_t static Color.tertiaryTranslateAccentColor.getter()
{
  return static Color.tertiaryTranslateAccentColor.getter();
}

uint64_t static Color.quaternaryTranslateAccentColor.getter()
{
  return static Color.quaternaryTranslateAccentColor.getter();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t static Color.accentColor.getter()
{
  return static Color.accentColor.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.teal.getter()
{
  return static Color.teal.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.primary.getter()
{
  return static Color.primary.getter();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Color.init(_:bundle:)()
{
  return Color.init(_:bundle:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
}

uint64_t Label<>.init(_:systemImage:)()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t Label<>.init<A>(_:systemImage:)()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t Shape.layoutDirectionBehavior.getter()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t static Shape.role.getter()
{
  return static Shape.role.getter();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t type metadata accessor for State()
{
  return type metadata accessor for State();
}

uint64_t Button.init(role:action:label:)()
{
  return Button.init(role:action:label:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init(_:role:action:)()
{
  return Button<>.init(_:role:action:)();
}

uint64_t Button<>.init(_:action:)()
{
  return Button<>.init(_:action:)();
}

uint64_t Picker.init(selection:label:content:)()
{
  return Picker.init(selection:label:content:)();
}

uint64_t Picker<>.init(_:selection:content:)()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t static Shader.Argument._float(_:)()
{
  return static Shader.Argument._float(_:)();
}

uint64_t static Shader.Argument._float2(_:_:)()
{
  return static Shader.Argument._float2(_:_:)();
}

uint64_t type metadata accessor for Shader.Argument()
{
  return type metadata accessor for Shader.Argument();
}

uint64_t type metadata accessor for Shader()
{
  return type metadata accessor for Shader();
}

uint64_t Toggle.init(isOn:label:)()
{
  return Toggle.init(isOn:label:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t Binding.init(get:set:)()
{
  return Binding.init(get:set:)();
}

uint64_t static Binding.constant(_:)()
{
  return static Binding.constant(_:)();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t type metadata accessor for Capsule()
{
  return type metadata accessor for Capsule();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t Section<>.init(content:)()
{
  return Section<>.init(content:)();
}

uint64_t TabView.init(selection:content:)()
{
  return TabView.init(selection:content:)();
}

uint64_t Bindable.wrappedValue.getter()
{
  return Bindable.wrappedValue.getter();
}

uint64_t Bindable.projectedValue.getter()
{
  return Bindable.projectedValue.getter();
}

uint64_t Bindable<A>.init(wrappedValue:)()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t Bindable<A>.subscript.getter()
{
  return Bindable<A>.subscript.getter();
}

uint64_t type metadata accessor for Bindable()
{
  return type metadata accessor for Bindable();
}

uint64_t DropInfo.itemProviders(for:)()
{
  return DropInfo.itemProviders(for:)();
}

Swift::Bool __swiftcall DropInfo.hasItemsConforming(to:)(Swift::OpaquePointer to)
{
  return DropInfo.hasItemsConforming(to:)(to._rawValue);
}

uint64_t static Material.bar.getter()
{
  return static Material.bar.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.topLeading.getter()
{
  return static Alignment.topLeading.getter();
}

uint64_t static Alignment.bottomTrailing.getter()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t static Alignment.top.getter()
{
  return static Alignment.top.getter();
}

uint64_t static Alignment.bottom.getter()
{
  return static Alignment.bottom.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t static Alignment.trailing.getter()
{
  return static Alignment.trailing.getter();
}

uint64_t Animation.logicallyComplete(after:)()
{
  return Animation.logicallyComplete(after:)();
}

uint64_t Animation.delay(_:)()
{
  return Animation.delay(_:)();
}

uint64_t static Animation.easeIn(duration:)()
{
  return static Animation.easeIn(duration:)();
}

uint64_t static Animation.linear(duration:)()
{
  return static Animation.linear(duration:)();
}

uint64_t static Animation.linear.getter()
{
  return static Animation.linear.getter();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return static Animation.spring(response:dampingFraction:blendDuration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t static Animation.easeInOut.getter()
{
  return static Animation.easeInOut.getter();
}

uint64_t AnyLayout.init<A>(_:)()
{
  return AnyLayout.init<A>(_:)();
}

uint64_t type metadata accessor for BlendMode()
{
  return type metadata accessor for BlendMode();
}

uint64_t static MenuOrder.fixed.getter()
{
  return static MenuOrder.fixed.getter();
}

uint64_t type metadata accessor for MenuOrder()
{
  return type metadata accessor for MenuOrder();
}

uint64_t ShareLink.init<A>(item:subject:message:preview:label:)()
{
  return ShareLink.init<A>(item:subject:message:preview:label:)();
}

uint64_t TextProxy.sizeThatFits(_:)()
{
  return TextProxy.sizeThatFits(_:)();
}

uint64_t static UnitCurve.linear.getter()
{
  return static UnitCurve.linear.getter();
}

uint64_t type metadata accessor for UnitCurve()
{
  return type metadata accessor for UnitCurve();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t static SymbolEffectOptions.default.getter()
{
  return static SymbolEffectOptions.default.getter();
}

uint64_t type metadata accessor for SymbolEffectOptions()
{
  return type metadata accessor for SymbolEffectOptions();
}

uint64_t AutomaticSymbolEffect.init()()
{
  return AutomaticSymbolEffect.init()();
}

uint64_t type metadata accessor for AutomaticSymbolEffect()
{
  return type metadata accessor for AutomaticSymbolEffect();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t static PHPickerFilter.any(of:)()
{
  return static PHPickerFilter.any(of:)();
}

uint64_t static PHPickerFilter.images.getter()
{
  return static PHPickerFilter.images.getter();
}

uint64_t type metadata accessor for PHPickerFilter()
{
  return type metadata accessor for PHPickerFilter();
}

uint64_t PHPickerResult.itemProvider.getter()
{
  return PHPickerResult.itemProvider.getter();
}

uint64_t type metadata accessor for PHPickerResult()
{
  return type metadata accessor for PHPickerResult();
}

uint64_t PHPickerConfiguration.init(photoLibrary:)()
{
  return PHPickerConfiguration.init(photoLibrary:)();
}

uint64_t PHPickerConfiguration.selectionLimit.setter()
{
  return PHPickerConfiguration.selectionLimit.setter();
}

uint64_t PHPickerConfiguration.filter.setter()
{
  return PHPickerConfiguration.filter.setter();
}

uint64_t type metadata accessor for PHPickerConfiguration()
{
  return type metadata accessor for PHPickerConfiguration();
}

uint64_t static DataScannerViewController.RecognizedDataType.text(languages:textContentType:)()
{
  return static DataScannerViewController.RecognizedDataType.text(languages:textContentType:)();
}

uint64_t type metadata accessor for DataScannerViewController.RecognizedDataType()
{
  return type metadata accessor for DataScannerViewController.RecognizedDataType();
}

uint64_t DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)()
{
  return DataScannerViewController.init(recognizedDataTypes:qualityLevel:recognizesMultipleItems:isHighFrameRateTrackingEnabled:isPinchToZoomEnabled:isGuidanceEnabled:isHighlightingEnabled:usesSingleCamera:)();
}

uint64_t dispatch thunk of DataScannerViewController.overlayContainerView.getter()
{
  return dispatch thunk of DataScannerViewController.overlayContainerView.getter();
}

uint64_t dispatch thunk of DataScannerViewController.isScanning.getter()
{
  return dispatch thunk of DataScannerViewController.isScanning.getter();
}

uint64_t dispatch thunk of DataScannerViewController.stopCamera()()
{
  return dispatch thunk of DataScannerViewController.stopCamera()();
}

uint64_t dispatch thunk of DataScannerViewController.startCamera()()
{
  return dispatch thunk of DataScannerViewController.startCamera()();
}

uint64_t type metadata accessor for DataScannerViewController.QualityLevel()
{
  return type metadata accessor for DataScannerViewController.QualityLevel();
}

uint64_t dispatch thunk of DataScannerViewController.stopScanning()()
{
  return dispatch thunk of DataScannerViewController.stopScanning()();
}

uint64_t dispatch thunk of DataScannerViewController.startScanning()()
{
  return dispatch thunk of DataScannerViewController.startScanning()();
}

uint64_t type metadata accessor for DataScannerViewController.TextContentType()
{
  return type metadata accessor for DataScannerViewController.TextContentType();
}

uint64_t dispatch thunk of DataScannerViewController.privateDelegate.setter()
{
  return dispatch thunk of DataScannerViewController.privateDelegate.setter();
}

uint64_t dispatch thunk of DataScannerViewController.recognizedItems.getter()
{
  return dispatch thunk of DataScannerViewController.recognizedItems.getter();
}

uint64_t type metadata accessor for DataScannerViewController.ScanningUnavailable()
{
  return type metadata accessor for DataScannerViewController.ScanningUnavailable();
}

uint64_t type metadata accessor for DataScannerViewController.SceneStabilityState()
{
  return type metadata accessor for DataScannerViewController.SceneStabilityState();
}

uint64_t dispatch thunk of DataScannerViewController.delegate.setter()
{
  return dispatch thunk of DataScannerViewController.delegate.setter();
}

uint64_t dispatch thunk of DataScannerViewController.hasTorch.getter()
{
  return dispatch thunk of DataScannerViewController.hasTorch.getter();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.getter()
{
  return dispatch thunk of DataScannerViewController.isTorchOn.getter();
}

uint64_t dispatch thunk of DataScannerViewController.isTorchOn.setter()
{
  return dispatch thunk of DataScannerViewController.isTorchOn.setter();
}

uint64_t type metadata accessor for DataScannerViewController()
{
  return type metadata accessor for DataScannerViewController();
}

uint64_t DataScannerViewControllerPrivateDelegate.dataScannerDidUpdateSceneLuminosity(_:newLuminosity:)()
{
  return DataScannerViewControllerPrivateDelegate.dataScannerDidUpdateSceneLuminosity(_:newLuminosity:)();
}

uint64_t dispatch thunk of ControlCenter.reloadControls(ofKind:)()
{
  return dispatch thunk of ControlCenter.reloadControls(ofKind:)();
}

uint64_t static ControlCenter.shared.getter()
{
  return static ControlCenter.shared.getter();
}

uint64_t type metadata accessor for ControlCenter()
{
  return type metadata accessor for ControlCenter();
}

uint64_t BinaryFloatingPoint.clip(to:)()
{
  return BinaryFloatingPoint.clip(to:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init(localized:table:bundle:locale:comment:)()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.isWhitespaceOnly.getter()
{
  return String.isWhitespaceOnly.getter();
}

uint64_t static String.TRANSLATION_LIMIT.getter()
{
  return static String.TRANSLATION_LIMIT.getter();
}

Swift::tuple_Bool_String __swiftcall String.truncated(limit:)(Swift::Int limit)
{
  char v1 = String.truncated(limit:)(limit);
  result._1._object = v3;
  result._1._countAndFlagsBits = v2;
  result._0 = v1;
  return result;
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

Swift::Void __swiftcall String.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t String.index(_:offsetBy:)()
{
  return String.index(_:offsetBy:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF16View.count.getter()
{
  return String.UTF16View.count.getter();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.hashValue.getter()
{
  return String.hashValue.getter();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t Array<A>.defaultPair(userLanguages:)()
{
  return Array<A>.defaultPair(userLanguages:)();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t Array.debugDescription.getter()
{
  return Array.debugDescription.getter();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Bool.IntentDisplayName()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t static Task.== infix(_:_:)()
{
  return static Task.== infix(_:_:)();
}

uint64_t Task.hash(into:)()
{
  return Task.hash(into:)();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t AsyncThrowingStream.makeAsyncIterator()()
{
  return AsyncThrowingStream.makeAsyncIterator()();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

NSNumber __swiftcall Float._bridgeToObjectiveC()()
{
  return (NSNumber)Float._bridgeToObjectiveC()();
}

uint64_t static Float._forceBridgeFromObjectiveC(_:result:)()
{
  return static Float._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Float._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Float._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Float._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t Collection<>.contains<A>(_:)()
{
  return Collection<>.contains<A>(_:)();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t RangeReplaceableCollection<>.remove(atOffsets:)()
{
  return RangeReplaceableCollection<>.remove(atOffsets:)();
}

uint64_t Range<>.init(_:in:)()
{
  return Range<>.init(_:in:)();
}

uint64_t type metadata accessor for UITextItem.Content()
{
  return type metadata accessor for UITextItem.Content();
}

uint64_t UITextItem.content.getter()
{
  return UITextItem.content.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t NSItemProvider.loadDataRepresentation(for:completionHandler:)()
{
  return NSItemProvider.loadDataRepresentation(for:completionHandler:)();
}

uint64_t static NSUserDefaults.ltuiRegisterDefaults()()
{
  return static NSUserDefaults.ltuiRegisterDefaults()();
}

uint64_t static NSUserDefaults.translationGroupDefaults.getter()
{
  return static NSUserDefaults.translationGroupDefaults.getter();
}

uint64_t NSUserDefaults.onDeviceOnly.getter()
{
  return NSUserDefaults.onDeviceOnly.getter();
}

uint64_t NSUserDefaults.onDeviceOnly.setter()
{
  return NSUserDefaults.onDeviceOnly.setter();
}

uint64_t NSUserDefaults.genderDisambiguationEnabled.getter()
{
  return NSUserDefaults.genderDisambiguationEnabled.getter();
}

uint64_t static NSUserDefaults.Constants.genderDisambiguationEnabledKey.getter()
{
  return static NSUserDefaults.Constants.genderDisambiguationEnabledKey.getter();
}

uint64_t UICollectionView.CellRegistration.init(handler:)()
{
  return UICollectionView.CellRegistration.init(handler:)();
}

uint64_t UICollectionView.SupplementaryRegistration.init(elementKind:handler:)()
{
  return UICollectionView.SupplementaryRegistration.init(elementKind:handler:)();
}

uint64_t UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
}

uint64_t UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)()
{
  return UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
}

uint64_t UIViewController.traitOverrides.getter()
{
  return UIViewController.traitOverrides.getter();
}

uint64_t UIViewController.traitOverrides.setter()
{
  return UIViewController.traitOverrides.setter();
}

uint64_t UIViewController.registerForTraitChanges<A>(_:handler:)()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t UIViewController.contentUnavailableConfiguration.getter()
{
  return UIViewController.contentUnavailableConfiguration.getter();
}

uint64_t UIViewController.contentUnavailableConfiguration.setter()
{
  return UIViewController.contentUnavailableConfiguration.setter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t UITraitCollection.subscript.getter()
{
  return UITraitCollection.subscript.getter();
}

uint64_t NSAttributedString.init(_:)()
{
  return NSAttributedString.init(_:)();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t UICollectionViewCell.contentConfiguration.setter()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t PHPickerViewController.init(configuration:)()
{
  return PHPickerViewController.init(configuration:)();
}

uint64_t PHPickerViewController.delegate.setter()
{
  return PHPickerViewController.delegate.setter();
}

uint64_t type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t UICollectionViewListCell.accessories.setter()
{
  return UICollectionViewListCell.accessories.setter();
}

UIMenu_optional __swiftcall _LTDisambiguableSentence.menu(forLinkIndex:)(Swift::UInt forLinkIndex)
{
  char v1 = (objc_class *)_LTDisambiguableSentence.menu(forLinkIndex:)(forLinkIndex);
  result.value.super.super.Class isa = v1;
  result.is_nil = v2;
  return result;
}

uint64_t static NSCollectionLayoutSection.list(using:layoutEnvironment:)()
{
  return static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
}

uint64_t type metadata accessor for UITextItemMenuConfiguration.Preview()
{
  return type metadata accessor for UITextItemMenuConfiguration.Preview();
}

uint64_t UITextItemMenuConfiguration.init(preview:menu:)()
{
  return UITextItemMenuConfiguration.init(preview:menu:)();
}

uint64_t UIPopoverPresentationControllerSourceItem.frame(in:)()
{
  return UIPopoverPresentationControllerSourceItem.frame(in:)();
}

UIMenu __swiftcall UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t UIView.traitOverrides.getter()
{
  return UIView.traitOverrides.getter();
}

uint64_t UIView.traitOverrides.setter()
{
  return UIView.traitOverrides.setter();
}

uint64_t UIView.registerForTraitChanges<A>(_:handler:)()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)()
{
  return static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)();
}

uint64_t static UIView.animate(with:changes:completion:)()
{
  return static UIView.animate(with:changes:completion:)();
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

uint64_t static UIColor.sourceLinkColor.getter()
{
  return static UIColor.sourceLinkColor.getter();
}

uint64_t static UIColor.sourceTextColor.getter()
{
  return static UIColor.sourceTextColor.getter();
}

uint64_t static UIColor.targetLinkColor.getter()
{
  return static UIColor.targetLinkColor.getter();
}

uint64_t static UIColor.targetTextColor.getter()
{
  return static UIColor.targetTextColor.getter();
}

uint64_t static UIColor.appBackgroundColor.getter()
{
  return static UIColor.appBackgroundColor.getter();
}

uint64_t static UIColor.translateAccentColor.getter()
{
  return static UIColor.translateAccentColor.getter();
}

uint64_t static UIColor.dictionaryHighlightColor.getter()
{
  return static UIColor.dictionaryHighlightColor.getter();
}

uint64_t static UIColor.quaternarySourceTextColor.getter()
{
  return static UIColor.quaternarySourceTextColor.getter();
}

uint64_t static UIColor.quaternaryTranslateAccentColor.getter()
{
  return static UIColor.quaternaryTranslateAccentColor.getter();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

NSNumber __swiftcall NSNumber.init(floatLiteral:)(Swift::Double floatLiteral)
{
  return (NSNumber)NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hash(into:)()
{
  return NSObject.hash(into:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UIButton.Configuration.image.setter()
{
  return UIButton.Configuration.image.setter();
}

uint64_t static UIButton.Configuration.plain()()
{
  return static UIButton.Configuration.plain()();
}

uint64_t UIButton.Configuration.title.setter()
{
  return UIButton.Configuration.title.setter();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
}

UIButton __swiftcall UIButton.init(type:primaryAction:)(UIButtonType type, UIAction_optional primaryAction)
{
  return (UIButton)UIButton.init(type:primaryAction:)(type, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil);
}

uint64_t _NSRange.description.getter()
{
  return _NSRange.description.getter();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t Optional.publisher.getter()
{
  return Optional.publisher.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.init<A>(_:)()
{
  return Substring.init<A>(_:)();
}

NSNumber __swiftcall UInt._bridgeToObjectiveC()()
{
  return (NSNumber)UInt._bridgeToObjectiveC()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.enumerateSubstrings<A>(in:options:_:)()
{
  return StringProtocol.enumerateSubstrings<A>(in:options:_:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t Identifiable<>.id.getter()
{
  return Identifiable<>.id.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t AsyncMapSequence.base.getter()
{
  return AsyncMapSequence.base.getter();
}

uint64_t AsyncMapSequence.Iterator.baseIterator.modify()
{
  return AsyncMapSequence.Iterator.baseIterator.modify();
}

uint64_t AsyncMapSequence.Iterator.transform.getter()
{
  return AsyncMapSequence.Iterator.transform.getter();
}

uint64_t AsyncMapSequence.Iterator.init(_:transform:)()
{
  return AsyncMapSequence.Iterator.init(_:transform:)();
}

uint64_t AsyncMapSequence.transform.getter()
{
  return AsyncMapSequence.transform.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectStandardize(CGRect rect)
{
  return _CGRectStandardize(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MGIsQuestionValid()
{
  return _MGIsQuestionValid();
}

uint64_t MRAVOutputDeviceCreateFromAVOutputDevice()
{
  return _MRAVOutputDeviceCreateFromAVOutputDevice();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_deviceSupportsDynamicIsland()
{
  return _MobileGestalt_get_deviceSupportsDynamicIsland();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t RBDrawingStateSetTransition()
{
  return _RBDrawingStateSetTransition();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return _SFLocalizableWAPIStringKeyForKey();
}

uint64_t TIGetDefaultInputModesForLanguage()
{
  return _TIGetDefaultInputModesForLanguage();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LTIsInternalInstall()
{
  return __LTIsInternalInstall();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

float log10f(float a1)
{
  return _log10f(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

long double sin(long double __x)
{
  return _sin(__x);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return _swift_continuation_throwingResumeWithError();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setAtWritableKeyPath()
{
  return _swift_setAtWritableKeyPath();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

uint64_t vk_cgImagePropertyOrientationFromVKOrientation()
{
  return _vk_cgImagePropertyOrientationFromVKOrientation();
}