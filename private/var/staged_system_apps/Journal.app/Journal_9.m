uint64_t sub_100643944@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *a1;
  if (v4)
  {
    v5 = v4;
    v6 = v4;
    v7 = v4;
    v8 = v4;
  }
  else
  {
    v9 = *((unsigned char *)a1 + 48);
    v10 = swift_retain();
    v11 = sub_100666C70(v10, v9);
    swift_release();
    swift_getKeyPath();
    sub_100648710((unint64_t *)&qword_1007FA9D8, (void (*)(uint64_t))type metadata accessor for InsightsDataManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    v8 = *(void *)(v11 + OBJC_IVAR____TtC7Journal19InsightsDataManager__places);
    swift_bridgeObjectRetain();
    swift_release();
    v12 = swift_retain();
    v13 = sub_100666C70(v12, v9);
    swift_release();
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    v7 = *(void *)(v13 + OBJC_IVAR____TtC7Journal19InsightsDataManager__places);
    swift_bridgeObjectRetain();
    swift_release();
    v14 = swift_retain();
    v15 = sub_100666C70(v14, v9);
    swift_release();
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    v6 = *(void *)(v15 + OBJC_IVAR____TtC7Journal19InsightsDataManager__places);
    swift_bridgeObjectRetain();
    swift_release();
    v16 = swift_retain();
    v17 = sub_100666C70(v16, v9);
    swift_release();
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    v5 = *(void *)(v17 + OBJC_IVAR____TtC7Journal19InsightsDataManager__places);
    swift_bridgeObjectRetain();
    swift_release();
  }
  *a2 = v8;
  a2[1] = 6;
  a2[2] = v7;
  a2[3] = 5;
  a2[4] = v6;
  a2[5] = 4;
  a2[6] = v5;
  a2[7] = 3;
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_100643BCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v108 = a1;
  uint64_t v106 = type metadata accessor for AttributedString.FormattingOptions();
  __chkstk_darwin(v106);
  v107 = (char *)&v83 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100010218(&qword_1007FEAE0);
  __chkstk_darwin(v3 - 8);
  v104 = (char *)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = type metadata accessor for NumberFormatStyleConfiguration.Notation();
  uint64_t v93 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  v91 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_100010218(&qword_1007F8E58);
  uint64_t v95 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  v90 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v92 = (char *)&v83 - v8;
  uint64_t v9 = type metadata accessor for String.LocalizationValue.StringInterpolation();
  __chkstk_darwin(v9 - 8);
  uint64_t v105 = type metadata accessor for AttributedString();
  uint64_t v103 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v101 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v102 = (char *)&v83 - v12;
  uint64_t v13 = sub_100010218(&qword_100814B38);
  __chkstk_darwin(v13);
  uint64_t v86 = (uint64_t)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v17 = (char *)&v83 - v16;
  uint64_t v85 = sub_100010218(&qword_100814B40);
  __chkstk_darwin(v85);
  v19 = (uint64_t *)((char *)&v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v87 = sub_100010218(&qword_100814B48);
  uint64_t v97 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v99 = (uint64_t)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = v20;
  __chkstk_darwin(v21);
  v23 = (char *)&v83 - v22;
  uint64_t v89 = type metadata accessor for Locale();
  uint64_t v88 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  v109 = (char *)&v83 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v25 - 8);
  v110 = (char *)&v83 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v1)
  {
    uint64_t v27 = *v1;
  }
  else
  {
    char v28 = *((unsigned char *)v1 + 48);
    uint64_t v29 = swift_retain();
    uint64_t v30 = sub_100666C70(v29, v28);
    swift_release();
    swift_getKeyPath();
    v116 = (double *)v30;
    sub_100648710((unint64_t *)&qword_1007FA9D8, (void (*)(uint64_t))type metadata accessor for InsightsDataManager);
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v27 = *(void *)(v30 + OBJC_IVAR____TtC7Journal19InsightsDataManager__places);
    swift_bridgeObjectRetain();
    swift_release();
  }
  v111 = v1;
  if (*(void *)(v27 + 16))
  {
    uint64_t v32 = *(void *)(v27 + 32);
    uint64_t v31 = *(void *)(v27 + 40);
    uint64_t v114 = *(unsigned __int8 *)(v27 + 48);
    uint64_t v115 = v31;
    uint64_t v33 = *(void *)(v27 + 56);
    v34 = *(void **)(v27 + 64);
    swift_bridgeObjectRetain();
    sub_10001DFB8((id)v32);
    swift_bridgeObjectRetain();
    id v113 = v34;
    swift_bridgeObjectRelease();
    sub_10001DFB8((id)v32);
    v112 = (void *)v32;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v112 = 0;
    id v113 = 0;
    uint64_t v114 = 0;
    uint64_t v115 = 0;
    uint64_t v33 = 0;
    uint64_t v32 = 4;
  }
  uint64_t v35 = sub_10065F6A8((void *)v32);
  v37 = v36;
  sub_10040B12C((id)v32);
  if (!v37)
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    uint64_t v35 = String.init(localized:table:bundle:locale:comment:)();
    v37 = v38;
  }
  v39 = v111;
  uint64_t v84 = v35;
  v100 = v23;
  if (v33)
  {
    v40 = v112;
    v41 = v113;
    sub_100647814(v112, v115, v114, v33, v113);
    id v42 = v41;
    sub_10001DFA8(v40);

    swift_bridgeObjectRelease();
  }
  else
  {
    v41 = 0;
  }
  uint64_t v43 = v39[3];
  char v44 = *((unsigned char *)v39 + 32);
  sub_100026CCC(v43, v44);
  char v45 = sub_100666714(v43, v44);
  sub_100026DF8(v43, v44);
  uint64_t v46 = 3;
  if (v45) {
    uint64_t v46 = 4;
  }
  void *v19 = v41;
  v19[1] = v46;
  v19[2] = sub_100336390;
  v19[3] = 0;
  uint64_t v47 = v85;
  uint64_t v48 = enum case for AsyncImagePhase.empty(_:);
  uint64_t v49 = type metadata accessor for AsyncImagePhase();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v17, v48, v49);
  *(void *)&v17[*(int *)(v13 + 36)] = 0;
  v50 = &v17[*(int *)(v13 + 40)];
  *(void *)v50 = 0;
  v50[8] = 1;
  sub_10001B220((uint64_t)v17, v86, &qword_100814B38);
  State.init(wrappedValue:)();
  sub_10001457C((uint64_t)v17, &qword_100814B38);
  v51 = (char *)v19 + *(int *)(v47 + 48);
  *(void *)v51 = swift_getKeyPath();
  v51[8] = 0;
  if (qword_1007F6BD0 != -1) {
    swift_once();
  }
  static UnitPoint.center.getter();
  static AnyTransition.scale(scale:anchor:)();
  uint64_t v52 = AnyTransition.combined(with:)();
  swift_release();
  uint64_t v53 = (uint64_t)v100;
  sub_10001B220((uint64_t)v19, (uint64_t)v100, &qword_100814B40);
  *(void *)(v53 + *(int *)(v87 + 36)) = v52;
  sub_10001457C((uint64_t)v19, &qword_100814B40);
  uint64_t v54 = v84;
  if (v33)
  {
    swift_bridgeObjectRetain();
    id v55 = v113;
    v56 = v112;
    sub_10001DFB8(v112);
    sub_10001DFA8(v56);

    swift_bridgeObjectRelease();
    uint64_t v57 = v115;
    if (v114)
    {
      if ((v33 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v57 = __CocoaSet.count.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v57 = *(void *)(v33 + 16);
      }
    }
  }
  else
  {
    uint64_t v57 = 0;
  }
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v58._countAndFlagsBits = 0x2064657469736956;
  v58._object = (void *)0xEA00000000002A2ALL;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v58);
  v59._countAndFlagsBits = v54;
  v59._object = v37;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v59);
  swift_bridgeObjectRelease();
  v60._countAndFlagsBits = 2107946;
  v60._object = (void *)0xE300000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v60);
  v116 = (double *)v57;
  static Locale.autoupdatingCurrent.getter();
  sub_100014398();
  v61 = v90;
  IntegerFormatStyle.init(locale:)();
  v62 = v91;
  static NumberFormatStyleConfiguration.Notation.compactName.getter();
  v63 = v92;
  uint64_t v64 = v96;
  IntegerFormatStyle.notation(_:)();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v62, v94);
  v65 = *(void (**)(char *, uint64_t))(v95 + 8);
  v65(v61, v64);
  sub_100014488(&qword_1008002E8, &qword_1007F8E58);
  sub_100014344();
  String.LocalizationValue.StringInterpolation.appendInterpolation<A, B>(_:format:)();
  v65(v63, v64);
  v66._countAndFlagsBits = 10272;
  v66._object = (void *)0xE200000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v66);
  v116 = (double *)v57;
  String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
  v67._countAndFlagsBits = 0x73656D69742029;
  v67._object = (void *)0xE700000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v67);
  String.LocalizationValue.init(stringInterpolation:)();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v88 + 56))(v104, 1, 1, v89);
  v116 = _swiftEmptyArrayStorage;
  sub_100648710(&qword_1007FEB10, (void (*)(uint64_t))&type metadata accessor for AttributedString.FormattingOptions);
  sub_100010218(&qword_1007FEB18);
  sub_100014488((unint64_t *)&qword_1007FEB20, &qword_1007FEB18);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  v68 = v102;
  AttributedString.init(localized:options:table:bundle:locale:comment:)();
  uint64_t v69 = v103;
  uint64_t v70 = (uint64_t)v101;
  uint64_t v71 = v105;
  (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v101, v68, v105);
  uint64_t v72 = Namespace.wrappedValue.getter();
  static UnitPoint.leading.getter();
  double v74 = v73;
  double v76 = v75;
  uint64_t v77 = v53;
  uint64_t v78 = v53;
  uint64_t v79 = v99;
  sub_10001B220(v77, v99, &qword_100814B48);
  unint64_t v80 = (*(unsigned __int8 *)(v97 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
  uint64_t v81 = swift_allocObject();
  sub_10002C4EC(v79, v81 + v80, &qword_100814B48);
  sub_100630648(v70, v72, (uint64_t)sub_100647754, v81, v108, v74, v76);
  sub_1006477CC(v112, v115, v114, v33, v113);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v71);
  return sub_10001457C(v78, &qword_100814B48);
}

uint64_t sub_100644934@<X0>(uint64_t a1@<X8>)
{
  return sub_1006420C0(a1);
}

uint64_t sub_100644970(id *a1)
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_100644A68()
{
  return Label.init(title:icon:)();
}

uint64_t sub_100644B64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for NumberFormatStyleConfiguration.Notation();
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100010218(&qword_1007F8E58);
  uint64_t v36 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v37 = (char *)&v35 - v11;
  uint64_t v12 = type metadata accessor for Locale();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v13 - 8);
  uint64_t v40 = 0;
  unint64_t v41 = 0xE000000000000000;
  id v14 = *(id *)a1;
  sub_10001DFB8(*(id *)a1);
  uint64_t v16 = sub_10065C35C(v14);
  if (!v15)
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    uint64_t v16 = String.init(localized:table:bundle:locale:comment:)();
  }
  uint64_t v17 = v16;
  String.append(_:)(*(Swift::String *)(&v15 - 1));
  swift_bridgeObjectRelease();
  sub_10001DFA8(v14);
  sub_100014344();
  uint64_t v18 = Text.init<A>(_:)();
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v24 = v23;
  if (*(unsigned char *)(a1 + 16) == 1)
  {
    uint64_t v25 = *(void *)(a1 + 24);
    if ((v25 & 0xC000000000000001) != 0) {
      uint64_t v26 = __CocoaSet.count.getter();
    }
    else {
      uint64_t v26 = *(void *)(v25 + 16);
    }
  }
  else
  {
    uint64_t v26 = *(void *)(a1 + 8);
  }
  char v27 = v22 & 1;
  uint64_t v40 = v26;
  static Locale.autoupdatingCurrent.getter();
  sub_100014398();
  IntegerFormatStyle.init(locale:)();
  static NumberFormatStyleConfiguration.Notation.compactName.getter();
  IntegerFormatStyle.notation(_:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v7);
  sub_100014488(&qword_1008002E8, &qword_1007F8E58);
  uint64_t v28 = Text.init<A>(_:format:)();
  uint64_t v30 = v29;
  LOBYTE(v40) = v27;
  char v32 = v31 & 1;
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = v20;
  *(unsigned char *)(a2 + 16) = v27;
  *(void *)(a2 + 24) = v24;
  *(void *)(a2 + 32) = v28;
  *(void *)(a2 + 40) = v29;
  *(unsigned char *)(a2 + 48) = v31 & 1;
  *(void *)(a2 + 56) = v33;
  sub_1000C04A4(v18, v20, v27);
  swift_bridgeObjectRetain();
  sub_1000C04A4(v28, v30, v32);
  swift_bridgeObjectRetain();
  sub_10002B8D0(v28, v30, v32);
  swift_bridgeObjectRelease();
  sub_10002B8D0(v18, v20, v40);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100644F8C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_100010218(&qword_100814B38);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void **)(a1 + 32);
  *a2 = v10;
  a2[1] = 3;
  a2[2] = sub_100645130;
  a2[3] = 0;
  uint64_t v11 = sub_100010218(&qword_100814B40);
  uint64_t v12 = enum case for AsyncImagePhase.empty(_:);
  uint64_t v13 = type metadata accessor for AsyncImagePhase();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v9, v12, v13);
  *(void *)&v9[*(int *)(v4 + 36)] = 0;
  id v14 = &v9[*(int *)(v4 + 40)];
  *(void *)id v14 = 0;
  v14[8] = 1;
  sub_10001B220((uint64_t)v9, (uint64_t)v6, &qword_100814B38);
  id v15 = v10;
  State.init(wrappedValue:)();
  sub_10001457C((uint64_t)v9, &qword_100814B38);
  uint64_t v16 = (char *)a2 + *(int *)(v11 + 48);
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v16 = result;
  v16[8] = 0;
  return result;
}

uint64_t sub_100645130@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Image.ResizingMode();
  uint64_t v3 = *(void *)(v2 - 8);
  __n128 v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v3 + 104))(v6, enum case for Image.ResizingMode.stretch(_:), v2, v4);
  uint64_t v7 = Image.resizable(capInsets:resizingMode:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *a1 = v7;
  return result;
}

uint64_t sub_100645244@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  *a1 = 0x4010000000000000;
  sub_100010218(&qword_100814C18);
  sub_100542BB0(v2, v3);
  swift_bridgeObjectRetain();
  sub_100010218(&qword_100814C20);
  sub_100010218(&qword_100814C28);
  sub_100014488(&qword_100814C30, &qword_100814C20);
  sub_100014488(&qword_100814C38, &qword_100814C28);
  sub_100647C7C();
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100645374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v134 = a2;
  uint64_t v133 = type metadata accessor for ContentShapeKinds();
  uint64_t v132 = *(void *)(v133 - 8);
  __chkstk_darwin(v133);
  v131 = (char *)&v107 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Capsule();
  __chkstk_darwin(v4 - 8);
  v130 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100010218(&qword_100814B58);
  __chkstk_darwin(v127);
  v128 = (char *)&v107 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_100010218(&qword_1008000E8);
  __chkstk_darwin(v116);
  uint64_t v8 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = (void (*)(char *, uint64_t, uint64_t))type metadata accessor for Font.TextStyle();
  v138 = (uint64_t (**)(void))*((void *)v140 - 1);
  __chkstk_darwin(v140);
  v139 = (uint64_t (**)(void))((char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v142 = type metadata accessor for InsightsVisitedPlacesView.LabelStyle();
  __chkstk_darwin(v142);
  v141 = (char *)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = (void *)type metadata accessor for ColorResource();
  uint64_t v135 = *(v136 - 1);
  __chkstk_darwin(v136);
  uint64_t v12 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100010218(&qword_100814B60);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100010218(&qword_100814B68);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v107 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_100010218(&qword_100814B70);
  uint64_t v107 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  v137 = (char *)&v107 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_100010218(&qword_100814B78);
  uint64_t v112 = *(void *)(v114 - 8);
  __chkstk_darwin(v114);
  v111 = (char *)&v107 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_100010218(&qword_100814B80);
  __chkstk_darwin(v109);
  id v113 = (char *)&v107 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_100010218(&qword_100814B88);
  __chkstk_darwin(v110);
  uint64_t v117 = (uint64_t)&v107 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_100010218(&qword_100814B90);
  __chkstk_darwin(v115);
  uint64_t v121 = (uint64_t)&v107 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_100010218(&qword_100814B98);
  __chkstk_darwin(v118);
  v122 = (char *)&v107 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_100010218(&qword_100814BA0);
  __chkstk_darwin(v120);
  uint64_t v123 = (uint64_t)&v107 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100010218(&qword_100814BA8);
  __chkstk_darwin(v119);
  v126 = (char *)&v107 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_100010218(&qword_100814BB0);
  __chkstk_darwin(v124);
  v125 = (char *)&v107 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = a1;
  ButtonStyleConfiguration.label.getter();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v16, v13);
  v34 = &v20[*(int *)(v18 + 44)];
  *(void *)v34 = KeyPath;
  *((void *)v34 + 1) = 1;
  v34[16] = 0;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  int v35 = static HierarchicalShapeStyle.primary.getter();
  if (qword_1007F7F80 != -1) {
    swift_once();
  }
  uint64_t v36 = (void (*)(void, void, void))v136;
  uint64_t v37 = sub_100026A54((uint64_t)v136, (uint64_t)qword_10083EFA0);
  (*(void (**)(char *, uint64_t, void))(v135 + 16))(v12, v37, v36);
  uint64_t v38 = Color.init(_:)();
  sub_10001B220((uint64_t)v20, (uint64_t)v23, &qword_100814B60);
  uint64_t v39 = &v23[*(int *)(v21 + 36)];
  *(_DWORD *)uint64_t v39 = v35;
  *((void *)v39 + 1) = v38;
  sub_10001457C((uint64_t)v20, &qword_100814B60);
  *(void *)&long long v144 = 0x403E000000000000;
  ((void (*)(uint64_t (**)(void), void, void))v138[13])(v139, enum case for Font.TextStyle.body(_:), v140);
  sub_1000DA83C();
  uint64_t v40 = (uint64_t)v141;
  ScaledMetric.init(wrappedValue:relativeTo:)();
  unint64_t v41 = sub_100647A44();
  uint64_t v42 = sub_100648710(&qword_100814BE0, (void (*)(uint64_t))type metadata accessor for InsightsVisitedPlacesView.LabelStyle);
  uint64_t v43 = v137;
  uint64_t v44 = v142;
  View.labelStyle<A>(_:)();
  sub_100647C1C(v40, (uint64_t (*)(void))type metadata accessor for InsightsVisitedPlacesView.LabelStyle);
  sub_10001457C((uint64_t)v23, &qword_100814B68);
  uint64_t v45 = enum case for DynamicTypeSize.xxxLarge(_:);
  uint64_t v46 = type metadata accessor for DynamicTypeSize();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 104))(v8, v45, v46);
  sub_100648710(&qword_100800128, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
  if (result)
  {
    *(void *)&long long v144 = v21;
    *((void *)&v144 + 1) = v44;
    *(void *)&long long v145 = v41;
    *((void *)&v145 + 1) = v42;
    swift_getOpaqueTypeConformance2();
    sub_100014488(&qword_100800160, &qword_1008000E8);
    uint64_t v48 = v111;
    uint64_t v49 = v108;
    View.dynamicTypeSize<A>(_:)();
    sub_10001457C((uint64_t)v8, &qword_1008000E8);
    (*(void (**)(char *, uint64_t))(v107 + 8))(v43, v49);
    unsigned __int8 v50 = static Edge.Set.leading.getter();
    unsigned __int8 v51 = static Edge.Set.vertical.getter();
    char v52 = Edge.Set.init(rawValue:)();
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v50) {
      char v52 = Edge.Set.init(rawValue:)();
    }
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v51) {
      char v52 = Edge.Set.init(rawValue:)();
    }
    EdgeInsets.init(_all:)();
    uint64_t v54 = v53;
    uint64_t v56 = v55;
    uint64_t v58 = v57;
    uint64_t v60 = v59;
    uint64_t v61 = v112;
    uint64_t v62 = (uint64_t)v113;
    uint64_t v63 = v114;
    (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v113, v48, v114);
    uint64_t v64 = v62 + *(int *)(v109 + 36);
    *(unsigned char *)uint64_t v64 = v52;
    *(void *)(v64 + 8) = v54;
    *(void *)(v64 + 16) = v56;
    *(void *)(v64 + 24) = v58;
    *(void *)(v64 + 32) = v60;
    *(unsigned char *)(v64 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v48, v63);
    char v65 = static Edge.Set.trailing.getter();
    EdgeInsets.init(_all:)();
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72;
    uint64_t v74 = v117;
    sub_10001B220(v62, v117, &qword_100814B80);
    uint64_t v75 = v74 + *(int *)(v110 + 36);
    *(unsigned char *)uint64_t v75 = v65;
    *(void *)(v75 + 8) = v67;
    *(void *)(v75 + 16) = v69;
    *(void *)(v75 + 24) = v71;
    *(void *)(v75 + 32) = v73;
    *(unsigned char *)(v75 + 40) = 0;
    sub_10001457C(v62, &qword_100814B80);
    static Alignment.center.getter();
    _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
    uint64_t v76 = v121;
    sub_10001B220(v74, v121, &qword_100814B88);
    uint64_t v77 = (_OWORD *)(v76 + *(int *)(v115 + 36));
    long long v78 = v149;
    v77[4] = v148;
    v77[5] = v78;
    v77[6] = v150;
    long long v79 = v145;
    *uint64_t v77 = v144;
    v77[1] = v79;
    long long v80 = v147;
    v77[2] = v146;
    v77[3] = v80;
    sub_10001457C(v74, &qword_100814B88);
    uint64_t v81 = v127;
    v82 = v128;
    uint64_t v83 = &v128[*(int *)(v127 + 36)];
    uint64_t v84 = enum case for BlendMode.plusDarker(_:);
    uint64_t v85 = type metadata accessor for BlendMode();
    uint64_t v86 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v85 - 8) + 104);
    v86(v83, v84, v85);
    v86(&v82[*(int *)(v81 + 40)], enum case for BlendMode.plusLighter(_:), v85);
    *(void *)v82 = 2;
    uint64_t v87 = enum case for RoundedCornerStyle.continuous(_:);
    LODWORD(v141) = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v88 = type metadata accessor for RoundedCornerStyle();
    uint64_t v89 = *(void *)(v88 - 8);
    v140 = *(void (**)(char *, uint64_t, uint64_t))(v89 + 104);
    uint64_t v142 = v89 + 104;
    uint64_t v90 = (uint64_t)v130;
    v140(v130, v87, v88);
    uint64_t v91 = (uint64_t)v122;
    uint64_t v92 = (uint64_t)&v122[*(int *)(v118 + 36)];
    sub_10001B220((uint64_t)v82, v92, &qword_100814B58);
    uint64_t v93 = sub_100010218(&qword_100814BE8);
    uint64_t v94 = v92 + *(int *)(v93 + 52);
    v138 = &type metadata accessor for Capsule;
    sub_100647BB4(v90, v94, (uint64_t (*)(void))&type metadata accessor for Capsule);
    *(_WORD *)(v92 + *(int *)(v93 + 56)) = 256;
    sub_10001B220(v76, v91, &qword_100814B90);
    v139 = &type metadata accessor for Capsule;
    sub_100647C1C(v90, (uint64_t (*)(void))&type metadata accessor for Capsule);
    sub_10001457C((uint64_t)v82, &qword_100814B58);
    sub_10001457C(v76, &qword_100814B90);
    if (ButtonStyleConfiguration.isPressed.getter()) {
      double v95 = 0.75;
    }
    else {
      double v95 = 1.0;
    }
    uint64_t v96 = v123;
    sub_10001B220(v91, v123, &qword_100814B98);
    *(double *)(v96 + *(int *)(v120 + 36)) = v95;
    sub_10001457C(v91, &qword_100814B98);
    uint64_t v97 = v131;
    static ContentShapeKinds.interaction.getter();
    uint64_t v98 = (uint64_t)v126;
    uint64_t v99 = &v126[*(int *)(v119 + 36)];
    v100 = &v99[*(int *)(sub_100010218(&qword_100813590) + 40)];
    uint64_t v101 = v132;
    v136 = *(void **)(v132 + 16);
    uint64_t v102 = v133;
    ((void (*)(char *, char *, uint64_t))v136)(v100, v97, v133);
    *uint64_t v99 = 0;
    sub_10001B220(v96, v98, &qword_100814BA0);
    v137 = *(char **)(v101 + 8);
    ((void (*)(char *, uint64_t))v137)(v97, v102);
    sub_10001457C(v96, &qword_100814BA0);
    sub_100010218(&qword_100814BF0);
    uint64_t v103 = swift_allocObject();
    *(_OWORD *)(v103 + 16) = xmmword_1006D6270;
    static ContentShapeKinds.hoverEffect.getter();
    static ContentShapeKinds.accessibility.getter();
    uint64_t v143 = v103;
    sub_100648710(&qword_100814BF8, (void (*)(uint64_t))&type metadata accessor for ContentShapeKinds);
    sub_100010218(&qword_100814C00);
    sub_100014488(&qword_100814C08, &qword_100814C00);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    v140((char *)v90, v141, v88);
    uint64_t v104 = (uint64_t)v125;
    uint64_t v105 = (uint64_t)&v125[*(int *)(v124 + 36)];
    sub_100647BB4(v90, v105, (uint64_t (*)(void))v138);
    uint64_t v106 = sub_100010218(&qword_100814C10);
    ((void (*)(uint64_t, char *, uint64_t))v136)(v105 + *(int *)(v106 + 40), v97, v102);
    *(unsigned char *)(v105 + *(int *)(v106 + 36)) = 0;
    sub_10001B220(v98, v104, &qword_100814BA8);
    sub_100647C1C(v90, (uint64_t (*)(void))v139);
    ((void (*)(char *, uint64_t))v137)(v97, v102);
    sub_10001457C(v98, &qword_100814BA8);
    return sub_10002C4EC(v104, v134, &qword_100814BB0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10064658C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v25[1] = a1;
  uint64_t v28 = a2;
  uint64_t v27 = type metadata accessor for LabelStyleConfiguration.Title();
  __chkstk_darwin(v27);
  v25[2] = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100010218(&qword_100814D60);
  __chkstk_darwin(v3 - 8);
  uint64_t v26 = (uint64_t)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v25 - v6;
  uint64_t v8 = type metadata accessor for LabelStyleConfiguration.Icon();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010218(&qword_100814D68);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v25 - v17;
  LabelStyleConfiguration.icon.getter();
  sub_100010218(&qword_1007FD6E0);
  ScaledMetric.wrappedValue.getter();
  ScaledMetric.wrappedValue.getter();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v8);
  uint64_t v19 = &v15[*(int *)(v13 + 44)];
  long long v20 = v30;
  *(_OWORD *)uint64_t v19 = v29;
  *((_OWORD *)v19 + 1) = v20;
  *((_OWORD *)v19 + 2) = v31;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_10002C4EC((uint64_t)v15, (uint64_t)v18, &qword_100814D68);
  *(void *)uint64_t v7 = static VerticalAlignment.firstTextBaseline.getter();
  *((void *)v7 + 1) = 0x4018000000000000;
  v7[16] = 0;
  sub_100010218(&qword_100814D70);
  LabelStyleConfiguration.title.getter();
  sub_100010218(&qword_100814D78);
  sub_100648710(&qword_100814D80, (void (*)(uint64_t))&type metadata accessor for LabelStyleConfiguration.Title);
  sub_100014488(&qword_100814D88, &qword_100814D78);
  Group.init<A, B>(subviews:transform:)();
  sub_10001B220((uint64_t)v18, (uint64_t)v15, &qword_100814D68);
  uint64_t v21 = v26;
  sub_10001B220((uint64_t)v7, v26, &qword_100814D60);
  uint64_t v22 = v28;
  sub_10001B220((uint64_t)v15, v28, &qword_100814D68);
  uint64_t v23 = sub_100010218(&qword_100814D90);
  sub_10001B220(v21, v22 + *(int *)(v23 + 48), &qword_100814D60);
  sub_10001457C((uint64_t)v7, &qword_100814D60);
  sub_10001457C((uint64_t)v18, &qword_100814D68);
  sub_10001457C(v21, &qword_100814D60);
  return sub_10001457C((uint64_t)v15, &qword_100814D68);
}

uint64_t sub_1006469A8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v37 = type metadata accessor for SubviewsCollection();
  uint64_t v35 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v33 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = type metadata accessor for SubviewsCollectionSlice();
  uint64_t v34 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  long long v31 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010218(&qword_100814D98);
  uint64_t v6 = v5 - 8;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v32 = (uint64_t)&v31 - v10;
  uint64_t v11 = sub_100010218(&qword_100814DA0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100010218(&qword_100814DA8);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  long long v20 = (char *)&v31 - v19;
  sub_1003F240C((uint64_t)v13);
  sub_100648758();
  View.bold(_:)();
  sub_10001457C((uint64_t)v13, &qword_100814DA0);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v17, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v33, a1, v37);
  uint64_t v21 = v31;
  sub_100514C90(1);
  int v22 = static HierarchicalShapeStyle.secondary.getter();
  uint64_t v23 = v34;
  uint64_t v24 = v36;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v8, v21, v36);
  *(_DWORD *)&v8[*(int *)(v6 + 44)] = v22;
  (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v24);
  uint64_t v25 = v32;
  sub_10002C4EC((uint64_t)v8, v32, &qword_100814D98);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v26(v17, v20, v14);
  sub_10001B220(v25, (uint64_t)v8, &qword_100814D98);
  uint64_t v27 = v38;
  v26(v38, v17, v14);
  uint64_t v28 = sub_100010218(&qword_100814DB8);
  sub_10001B220((uint64_t)v8, (uint64_t)&v27[*(int *)(v28 + 48)], &qword_100814D98);
  sub_10001457C(v25, &qword_100814D98);
  long long v29 = *(void (**)(char *, uint64_t))(v15 + 8);
  v29(v20, v14);
  sub_10001457C((uint64_t)v8, &qword_100814D98);
  return ((uint64_t (*)(char *, uint64_t))v29)(v17, v14);
}

uint64_t sub_100646DF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = static VerticalAlignment.center.getter();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = sub_100010218(&qword_100814D58);
  return sub_10064658C(a1, a2 + *(int *)(v4 + 44));
}

unint64_t sub_100646E5C()
{
  unint64_t result = qword_100814A80;
  if (!qword_100814A80)
  {
    sub_100014440(&qword_100814A50);
    sub_100646EFC();
    sub_100014488(&qword_100800188, &qword_100800190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814A80);
  }
  return result;
}

unint64_t sub_100646EFC()
{
  unint64_t result = qword_100814A88;
  if (!qword_100814A88)
  {
    sub_100014440(&qword_100814A70);
    sub_100646F9C();
    sub_100014488(&qword_100800158, &qword_100800120);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814A88);
  }
  return result;
}

unint64_t sub_100646F9C()
{
  unint64_t result = qword_100814A90;
  if (!qword_100814A90)
  {
    sub_100014440(&qword_100814A68);
    sub_10064703C();
    sub_100014488(&qword_100806E60, &qword_100806E68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814A90);
  }
  return result;
}

unint64_t sub_10064703C()
{
  unint64_t result = qword_100814A98;
  if (!qword_100814A98)
  {
    sub_100014440(&qword_100814A60);
    sub_100014488(&qword_100814AA0, &qword_100814A58);
    sub_100014488(&qword_100800148, &qword_100800150);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814A98);
  }
  return result;
}

unint64_t sub_100647108()
{
  unint64_t result = qword_100814AF0;
  if (!qword_100814AF0)
  {
    sub_100014440(&qword_100814AD8);
    sub_1006471A8();
    sub_100014488(&qword_1008002A8, &qword_1008002B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814AF0);
  }
  return result;
}

unint64_t sub_1006471A8()
{
  unint64_t result = qword_100814AF8;
  if (!qword_100814AF8)
  {
    sub_100014440(&qword_100814AD0);
    sub_100014440(&qword_100814AC0);
    sub_100014440(&qword_1008000E8);
    sub_100014440(&qword_100814B00);
    sub_100014488(&qword_100814B08, &qword_100814B00);
    sub_100647338();
    swift_getOpaqueTypeConformance2();
    sub_100014488(&qword_100800160, &qword_1008000E8);
    swift_getOpaqueTypeConformance2();
    sub_100014488(&qword_100805F70, &qword_100805F18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814AF8);
  }
  return result;
}

unint64_t sub_100647338()
{
  unint64_t result = qword_100814B10;
  if (!qword_100814B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814B10);
  }
  return result;
}

unint64_t sub_10064738C()
{
  unint64_t result = qword_100814B18;
  if (!qword_100814B18)
  {
    sub_100014440(&qword_100814AB0);
    sub_10064742C();
    sub_100014488(&qword_1008002A8, &qword_1008002B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814B18);
  }
  return result;
}

unint64_t sub_10064742C()
{
  unint64_t result = qword_100814B20;
  if (!qword_100814B20)
  {
    sub_100014440(&qword_100814AA8);
    sub_100014488(&qword_100814B28, &qword_100814470);
    sub_100014488(&qword_100813550, &qword_100813540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814B20);
  }
  return result;
}

uint64_t sub_1006474F0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000C04A4(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_100647540(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10002B8D0(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100647598@<X0>(void *a1@<X8>)
{
  uint64_t result = EnvironmentValues.displayScale.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_1006475C4()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_1006475EC()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(sub_100010218(&qword_100814B48) - 8) + 80);
  uint64_t v2 = (id *)(v0 + ((v1 + 16) & ~v1));

  swift_release();
  uint64_t v3 = sub_100010218(&qword_100814B40);
  uint64_t v4 = (char *)v2 + *(int *)(v3 + 44);
  uint64_t v5 = type metadata accessor for AsyncImagePhase();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  sub_100010218(&qword_100814B50);
  swift_release();
  sub_100026DF8(*(uint64_t *)((char *)v2 + *(int *)(v3 + 48)), *((unsigned char *)v2 + *(int *)(v3 + 48) + 8));
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100647754@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_100010218(&qword_100814B48) - 8);
  return sub_10001B220(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1, &qword_100814B48);
}

void *sub_1006477CC(void *result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a4)
  {
    sub_10001DFA8(result);

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

id sub_100647814(id result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a4)
  {
    sub_10001DFB8(result);
    swift_bridgeObjectRetain();
    return a5;
  }
  return result;
}

ValueMetadata *type metadata accessor for InsightsVisitedPlacesView.ButtonStyle()
{
  return &type metadata for InsightsVisitedPlacesView.ButtonStyle;
}

void *initializeBufferWithCopyOfBuffer for InsightsVisitedPlacesView.GridView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for InsightsVisitedPlacesView.GridView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for InsightsVisitedPlacesView.GridView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for InsightsVisitedPlacesView.GridView()
{
  return &type metadata for InsightsVisitedPlacesView.GridView;
}

uint64_t sub_100647948()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1006479B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1006479D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for InsightsVisitedPlacesView.LabelStyle()
{
  uint64_t result = qword_100814CC0;
  if (!qword_100814CC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100647A44()
{
  unint64_t result = qword_100814BB8;
  if (!qword_100814BB8)
  {
    sub_100014440(&qword_100814B68);
    sub_100647AE4();
    sub_100014488(&qword_100814BD0, &qword_100814BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814BB8);
  }
  return result;
}

unint64_t sub_100647AE4()
{
  unint64_t result = qword_100814BC0;
  if (!qword_100814BC0)
  {
    sub_100014440(&qword_100814B60);
    sub_100648710(&qword_100814BC8, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    sub_100014488(&qword_100800678, &qword_100800680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814BC0);
  }
  return result;
}

uint64_t sub_100647BB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100647C1C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100647C7C()
{
  unint64_t result = qword_100814C40;
  if (!qword_100814C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814C40);
  }
  return result;
}

uint64_t sub_100647CD0()
{
  return sub_100644A68();
}

unint64_t sub_100647CD8()
{
  unint64_t result = qword_100814C58;
  if (!qword_100814C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814C58);
  }
  return result;
}

uint64_t sub_100647D2C@<X0>(uint64_t a1@<X8>)
{
  return sub_100644B64(*(void *)(v1 + 16), a1);
}

uint64_t sub_100647D34@<X0>(void *a1@<X8>)
{
  return sub_100644F8C(*(void *)(v1 + 16), a1);
}

uint64_t sub_100647D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD6E0);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100647DAC(uint64_t a1)
{
  uint64_t v2 = sub_100010218(&qword_1007FD6E0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100647E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100647E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100647EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100647F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD6E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100647FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100647FC8);
}

uint64_t sub_100647FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD6E0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100648038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10064804C);
}

uint64_t sub_10064804C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD6E0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_1006480C0()
{
  sub_1000DA7E0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_100648150()
{
  unint64_t result = qword_100814CF8;
  if (!qword_100814CF8)
  {
    sub_100014440(&qword_100814BB0);
    sub_1006481F0();
    sub_100014488(&qword_100814D38, &qword_100814C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814CF8);
  }
  return result;
}

unint64_t sub_1006481F0()
{
  unint64_t result = qword_100814D00;
  if (!qword_100814D00)
  {
    sub_100014440(&qword_100814BA8);
    sub_1006483B8(&qword_100814D08, &qword_100814BA0, (void (*)(void))sub_1006482BC);
    sub_100014488(&qword_1008135C8, &qword_100813590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814D00);
  }
  return result;
}

unint64_t sub_1006482BC()
{
  unint64_t result = qword_100814D10;
  if (!qword_100814D10)
  {
    sub_100014440(&qword_100814B98);
    sub_1006483B8(&qword_100814D18, &qword_100814B90, (void (*)(void))sub_100648388);
    sub_100014488(&qword_100814D30, &qword_100814BE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814D10);
  }
  return result;
}

uint64_t sub_100648388()
{
  return sub_1006483B8(&qword_100814D20, &qword_100814B88, (void (*)(void))sub_100648434);
}

uint64_t sub_1006483B8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100014440(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100648434()
{
  unint64_t result = qword_100814D28;
  if (!qword_100814D28)
  {
    sub_100014440(&qword_100814B80);
    sub_100014440(&qword_100814B70);
    sub_100014440(&qword_1008000E8);
    sub_100014440(&qword_100814B68);
    type metadata accessor for InsightsVisitedPlacesView.LabelStyle();
    sub_100647A44();
    sub_100648710(&qword_100814BE0, (void (*)(uint64_t))type metadata accessor for InsightsVisitedPlacesView.LabelStyle);
    swift_getOpaqueTypeConformance2();
    sub_100014488(&qword_100800160, &qword_1008000E8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814D28);
  }
  return result;
}

unint64_t sub_1006485BC()
{
  unint64_t result = qword_100814D40;
  if (!qword_100814D40)
  {
    sub_100014440(&qword_100814C18);
    sub_100014488(&qword_100814560, &qword_100814568);
    sub_10064865C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814D40);
  }
  return result;
}

unint64_t sub_10064865C()
{
  unint64_t result = qword_100814D48;
  if (!qword_100814D48)
  {
    sub_100014440(&qword_100814D50);
    sub_100014488(&qword_100814C38, &qword_100814C28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814D48);
  }
  return result;
}

uint64_t sub_1006486F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100648710(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100648758()
{
  unint64_t result = qword_100814DB0;
  if (!qword_100814DB0)
  {
    sub_100014440(&qword_100814DA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814DB0);
  }
  return result;
}

uint64_t sub_1006487C4()
{
  return sub_100014488(&qword_100814DC0, &qword_100814DC8);
}

id sub_100648804()
{
  uint64_t v1 = OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)LPLinkMetadata) init];
    NSString v5 = String._bridgeToObjectiveC()();
    [v4 setTitle:v5];

    id v6 = [objc_allocWithZone((Class)LPLinkView) initWithMetadata:v4];
    uint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

char *sub_1006488D0(void *a1)
{
  uint64_t v3 = _s9LinkAssetC8LinkDataVMa(0);
  uint64_t v77 = *(void *)(v3 - 8);
  uint64_t v78 = v3;
  __chkstk_darwin(v3);
  uint64_t v75 = (uint64_t)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010218(&qword_1007F9F68);
  __chkstk_darwin(v5 - 8);
  uint64_t v76 = (uint64_t)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100010218((uint64_t *)&unk_100800A60);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v79 = (uint64_t)&v74 - v11;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v74 - v13;
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v74 = (char *)&v74 - v20;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v74 - v22;
  *(void *)&v1[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC7Journal15LPLinkAssetView_asset] = a1;
  uint64_t v24 = (objc_class *)type metadata accessor for LPLinkAssetView();
  v80.receiver = v1;
  v80.super_class = v24;
  uint64_t v25 = a1;
  uint64_t v26 = (char *)[super initWithFrame:0.0, 0.0, 0.0, 0.0];
  _s9LinkAssetCMa(0);
  uint64_t v27 = swift_dynamicCastClass();
  if (v27)
  {
    uint64_t v28 = v27;
    unint64_t v29 = *(void *)(v27 + OBJC_IVAR____TtCC7Journal10Journaling5Asset_attachments);
    if (v29 >> 62)
    {
      uint64_t v48 = v25;
      uint64_t v49 = v26;
      swift_bridgeObjectRetain();
      if (_CocoaArrayWrapper.endIndex.getter())
      {
LABEL_4:
        if ((v29 & 0xC000000000000001) != 0) {
          specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          swift_retain();
        }
        swift_bridgeObjectRelease();
        sub_1005DA2EC(v14);
        swift_release();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
        {
          (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v23, v14, v15);
          if (URL.isFileURL.getter())
          {
            id v33 = objc_allocWithZone((Class)LPLinkView);
            URL._bridgeToObjectiveC()(v34);
            uint64_t v36 = v35;
            id v37 = [v33 initWithMetadataLoadedFromURL:v35];

            uint64_t v38 = *(void **)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView];
            *(void *)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView] = v37;

            (*(void (**)(char *, uint64_t))(v16 + 8))(v23, v15);
            goto LABEL_35;
          }
          (*(void (**)(char *, uint64_t))(v16 + 8))(v23, v15);
LABEL_22:
          id v50 = sub_1000D05AC();
          if (v50)
          {
            unsigned __int8 v51 = v50;
            id v52 = [objc_allocWithZone((Class)LPLinkView) initWithMetadata:v50];
            uint64_t v53 = *(void **)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView];
            *(void *)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView] = v52;

            goto LABEL_35;
          }
          if (*(void *)(v28 + OBJC_IVAR____TtCC7Journal10Journaling9LinkAsset_metadata))
          {
            swift_retain();
            uint64_t v54 = v76;
            sub_10003BD50(v76);
            swift_release();
            uint64_t v55 = v78;
            if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48))(v54, 1, v78))
            {
              uint64_t v57 = v75;
              sub_1000D39D0(v54, v75);
              sub_10001457C(v54, &qword_1007F9F68);
              uint64_t v58 = v57 + *(int *)(v55 + 28);
              uint64_t v56 = v79;
              sub_100052E44(v58, v79);
              sub_1000D3A34(v57);
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v56, 1, v15) != 1)
              {
                uint64_t v59 = v74;
                (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v74, v56, v15);
                id v60 = objc_allocWithZone((Class)LPLinkView);
                URL._bridgeToObjectiveC()(v61);
                uint64_t v63 = v62;
                id v64 = [v60 initWithMetadataLoadedFromURL:v62];

                char v65 = *(void **)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView];
                *(void *)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView] = v64;

                (*(void (**)(char *, uint64_t))(v16 + 8))(v59, v15);
                goto LABEL_35;
              }
              goto LABEL_28;
            }
            sub_10001457C(v54, &qword_1007F9F68);
          }
          uint64_t v56 = v79;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v79, 1, 1, v15);
LABEL_28:

          sub_10001457C(v56, (uint64_t *)&unk_100800A60);
          goto LABEL_35;
        }
LABEL_21:
        sub_10001457C((uint64_t)v14, (uint64_t *)&unk_100800A60);
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
      long long v31 = v25;
      uint64_t v32 = v26;
      swift_bridgeObjectRetain();
      if (v30) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
    goto LABEL_21;
  }
  unint64_t v39 = *(void *)&v25[OBJC_IVAR____TtCC7Journal10Journaling5Asset_attachments];
  if (!(v39 >> 62))
  {
    uint64_t v40 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t v41 = v26;
    swift_bridgeObjectRetain();
    if (v40) {
      goto LABEL_12;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v9, 1, 1, v15);
LABEL_34:
    sub_10001457C((uint64_t)v9, (uint64_t *)&unk_100800A60);
    goto LABEL_35;
  }
  uint64_t v66 = v26;
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_33;
  }
LABEL_12:
  if ((v39 & 0xC000000000000001) != 0) {
    specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else {
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_1005DA2EC(v9);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 1, v15) == 1) {
    goto LABEL_34;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v9, v15);
  if (URL.isFileURL.getter())
  {
    id v42 = objc_allocWithZone((Class)LPLinkView);
    URL._bridgeToObjectiveC()(v43);
    uint64_t v45 = v44;
    id v46 = [v42 initWithMetadataLoadedFromURL:v44];

    uint64_t v47 = *(void **)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView];
    *(void *)&v26[OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView] = v46;
  }
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
LABEL_35:
  id v67 = sub_100648804();
  [v67 _setDisablePreviewGesture:1];

  uint64_t v68 = v26;
  id v69 = sub_100648804();
  [v68 addSubview:v69];

  id v70 = sub_100648804();
  sub_1001DCF60(0.0);

  swift_bridgeObjectRelease();
  int v71 = v68[OBJC_IVAR____TtC7Journal16JournalAssetView_isAssetFinishedLoading];
  v68[OBJC_IVAR____TtC7Journal16JournalAssetView_isAssetFinishedLoading] = 1;
  if (v71 == 1 || !swift_unknownObjectWeakLoadStrong())
  {
  }
  else
  {
    uint64_t v72 = v68;
    sub_100491AF4();

    swift_unknownObjectRelease();
  }

  return v68;
}

void *sub_1006491E8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC7Journal15LPLinkAssetView_asset);
  id v2 = v1;
  return v1;
}

void sub_100649248()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC7Journal15LPLinkAssetView____lazy_storage___linkView);
}

id sub_100649288()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LPLinkAssetView();
  return [super dealloc];
}

uint64_t type metadata accessor for LPLinkAssetView()
{
  return self;
}

unint64_t sub_10064932C(char a1)
{
  unint64_t result = 0x707954616964656DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 1735290739;
      break;
    case 2:
      unint64_t result = 0x6D614E6D75626C61;
      break;
    case 3:
      unint64_t result = 0x614E747369747261;
      break;
    case 4:
      unint64_t result = 0x4C5255616964656DLL;
      break;
    case 5:
      unint64_t result = 0x656D614E707061;
      break;
    case 6:
      unint64_t result = 0x6D69547472617473;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0x726156726F6C6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100649450(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100010218(&qword_100814F58);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002E0BC(a1, a1[3]);
  sub_10064BDE4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v14[0]) = *v3;
  char v16 = 0;
  sub_1000B1860();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v14[0]) = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v14[0]) = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v14[0]) = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    uint64_t v9 = _s20ThirdPartyMediaAssetC12MetadataTypeVMa(0);
    LOBYTE(v14[0]) = 4;
    type metadata accessor for URL();
    sub_10064BD9C(&qword_1007FC738, (void (*)(uint64_t))&type metadata accessor for URL);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v14[0]) = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v14[0]) = 6;
    type metadata accessor for Date();
    sub_10064BD9C(&qword_1007F99F0, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    uint64_t v10 = &v3[*(int *)(v9 + 44)];
    char v11 = v10[32];
    long long v12 = *((_OWORD *)v10 + 1);
    v14[0] = *(_OWORD *)v10;
    v14[1] = v12;
    char v15 = v11;
    char v16 = 7;
    sub_100010218(&qword_100814F40);
    sub_10064BE8C(&qword_100814F60);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    LOBYTE(v14[0]) = v3[*(int *)(v9 + 48)];
    char v16 = 8;
    sub_10064BED4();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100649800@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_100010218((uint64_t *)&unk_1007FC470);
  __chkstk_darwin(v3 - 8);
  id v42 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010218((uint64_t *)&unk_100800A60);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100010218(&qword_100814F30);
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _s20ThirdPartyMediaAssetC12MetadataTypeVMa(0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v15 = &v13[v14[11]];
  *(_OWORD *)char v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  v15[32] = 1;
  uint64_t v45 = v14;
  id v46 = a1;
  uint64_t v16 = v14[12];
  uint64_t v17 = v13;
  v13[v16] = 3;
  sub_10002E0BC(a1, a1[3]);
  sub_10064BDE4();
  uint64_t v18 = v47;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v18) {
    return _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v46);
  }
  uint64_t v19 = (uint64_t)v7;
  uint64_t v47 = v15;
  uint64_t v40 = v16;
  uint64_t v20 = v43;
  char v51 = 0;
  sub_1000B174C();
  uint64_t v21 = v44;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v22 = (uint64_t)v17;
  char *v17 = v48;
  LOBYTE(v48) = 1;
  uint64_t v23 = v20;
  *((void *)v17 + 1) = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  *((void *)v17 + 2) = v24;
  LOBYTE(v48) = 2;
  uint64_t v25 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v26 = (uint64_t)v46;
  *((void *)v17 + 3) = v25;
  *((void *)v17 + 4) = v27;
  LOBYTE(v48) = 3;
  uint64_t v28 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  unint64_t v29 = v45;
  *((void *)v17 + 5) = v28;
  *((void *)v17 + 6) = v30;
  type metadata accessor for URL();
  LOBYTE(v48) = 4;
  sub_10064BD9C(&qword_1007FC720, (void (*)(uint64_t))&type metadata accessor for URL);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_10002C4EC(v19, (uint64_t)&v17[v29[8]], (uint64_t *)&unk_100800A60);
  LOBYTE(v48) = 5;
  uint64_t v31 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v32 = (uint64_t *)&v17[v29[9]];
  *uint64_t v32 = v31;
  v32[1] = v33;
  type metadata accessor for Date();
  LOBYTE(v48) = 6;
  sub_10064BD9C(&qword_10080E9D0, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v34 = (uint64_t)v42;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_10002C4EC(v34, v22 + v29[10], (uint64_t *)&unk_1007FC470);
  sub_100010218(&qword_100814F40);
  char v51 = 7;
  sub_10064BE8C(&qword_100814F48);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  char v35 = v50;
  long long v36 = v49;
  id v37 = v47;
  *(_OWORD *)uint64_t v47 = v48;
  *((_OWORD *)v37 + 1) = v36;
  v37[32] = v35;
  char v51 = 8;
  sub_10064BE38();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v21);
  uint64_t v38 = v41;
  *(unsigned char *)(v22 + v40) = v48;
  sub_100353044(v22, v38);
  _s7Journal19DynamicWaveformViewVwxx_0(v26);
  return sub_10021D0F0(v22);
}

uint64_t sub_100649F2C(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = sub_100010218(&qword_100814FB0);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  __chkstk_darwin(v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010218(&qword_100814FB8);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100010218(&qword_100814FC0);
  uint64_t v18 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100010218(&qword_100814FC8);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002E0BC(a1, a1[3]);
  sub_10064C9B0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_10064CA58();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_10064CA04();
      char v15 = v21;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_10064CAAC();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_10064A298()
{
  return sub_10064932C(*v0);
}

uint64_t sub_10064A2A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10064BF28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10064A2C8(uint64_t a1)
{
  unint64_t v2 = sub_10064BDE4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10064A304(uint64_t a1)
{
  unint64_t v2 = sub_10064BDE4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10064A340@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100649800(a1, a2);
}

uint64_t sub_10064A358(void *a1)
{
  return sub_100649450(a1);
}

uint64_t sub_10064A370()
{
  uint64_t v1 = 1802658148;
  if (*v0 != 1) {
    uint64_t v1 = 0x6B72614479726576;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746867696CLL;
  }
}

uint64_t sub_10064A3C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10064C300(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10064A3E8(uint64_t a1)
{
  unint64_t v2 = sub_10064C9B0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10064A424(uint64_t a1)
{
  unint64_t v2 = sub_10064C9B0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10064A460(uint64_t a1)
{
  unint64_t v2 = sub_10064CA58();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10064A49C(uint64_t a1)
{
  unint64_t v2 = sub_10064CA58();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10064A4D8(uint64_t a1)
{
  unint64_t v2 = sub_10064CAAC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10064A514(uint64_t a1)
{
  unint64_t v2 = sub_10064CAAC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10064A550(uint64_t a1)
{
  unint64_t v2 = sub_10064CA04();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10064A58C(uint64_t a1)
{
  unint64_t v2 = sub_10064CA04();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10064A5C8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10064C440(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_10064A5F4(void *a1)
{
  return sub_100649F2C(a1, *v1);
}

uint64_t sub_10064A610()
{
  uint64_t v1 = sub_100010218(&qword_1007F9DD8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = _s20ThirdPartyMediaAssetC12MetadataTypeVMa(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = __chkstk_darwin(v4);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!*(void *)(v0 + OBJC_IVAR____TtCC7Journal10Journaling20ThirdPartyMediaAsset_metadata))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t, __n128))(v5 + 56))(v3, 1, 1, v4, v6);
    goto LABEL_5;
  }
  swift_retain();
  sub_10003A8E4((uint64_t)v3);
  swift_release();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_5:
    sub_10001457C((uint64_t)v3, &qword_1007F9DD8);
    return 0;
  }
  sub_10021D14C((uint64_t)v3, (uint64_t)v8);
  sub_100010218((uint64_t *)&unk_10080C370);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1006D7C30;
  *(void *)(inited + 32) = *((void *)v8 + 1);
  *(_OWORD *)(inited + 40) = *((_OWORD *)v8 + 1);
  uint64_t v10 = *((void *)v8 + 6);
  *(_OWORD *)(inited + 56) = *((_OWORD *)v8 + 2);
  *(void *)(inited + 72) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_10023DA38(8236, 0xE200000000000000, inited);
  swift_setDeallocating();
  sub_100010218(&qword_100803920);
  swift_arrayDestroy();
  sub_10021D0F0((uint64_t)v8);
  return v11;
}

uint64_t sub_10064A84C()
{
  return swift_release();
}

id sub_10064A85C()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s20ThirdPartyMediaAssetCMa(0);
  return [super dealloc];
}

uint64_t sub_10064A8A4()
{
  return _s20ThirdPartyMediaAssetCMa(0);
}

uint64_t _s20ThirdPartyMediaAssetCMa(uint64_t a1)
{
  return sub_10003352C(a1, (uint64_t *)&unk_100814E30);
}

uint64_t sub_10064A8CC()
{
  return swift_updateClassMetadata2();
}

void *sub_10064A910(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    uint64_t v7 = a2[4];
    a1[3] = a2[3];
    a1[4] = v7;
    uint64_t v8 = a2[6];
    uint64_t v9 = a3[8];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    a1[5] = a2[5];
    a1[6] = v8;
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = sub_100010218((uint64_t *)&unk_100800A60);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[9];
    uint64_t v17 = a3[10];
    uint64_t v18 = (void *)((char *)v4 + v16);
    uint64_t v19 = (void *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (char *)v4 + v17;
    uint64_t v22 = (char *)a2 + v17;
    uint64_t v23 = type metadata accessor for Date();
    uint64_t v24 = *(void *)(v23 - 8);
    char v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
    swift_bridgeObjectRetain();
    if (v25(v22, 1, v23))
    {
      uint64_t v26 = sub_100010218((uint64_t *)&unk_1007FC470);
      memcpy(v21, v22, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    uint64_t v27 = a3[11];
    uint64_t v28 = a3[12];
    unint64_t v29 = (char *)v4 + v27;
    uint64_t v30 = (char *)a2 + v27;
    long long v31 = *((_OWORD *)v30 + 1);
    *(_OWORD *)unint64_t v29 = *(_OWORD *)v30;
    *((_OWORD *)v29 + 1) = v31;
    v29[32] = v30[32];
    *((unsigned char *)v4 + v28) = *((unsigned char *)a2 + v28);
  }
  return v4;
}

uint64_t sub_10064ABE0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 40);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v7, 1, v8);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v7, v8);
  }
  return result;
}

uint64_t sub_10064AD64(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = a3[8];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = sub_100010218((uint64_t *)&unk_100800A60);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[9];
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = (void *)(a1 + v15);
  uint64_t v20 = (const void *)(a2 + v15);
  uint64_t v21 = type metadata accessor for Date();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48);
  swift_bridgeObjectRetain();
  if (v23(v20, 1, v21))
  {
    uint64_t v24 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v25 = a3[11];
  uint64_t v26 = a3[12];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  long long v29 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *(_OWORD *)(v27 + 16) = v29;
  *(unsigned char *)(v27 + 32) = *(unsigned char *)(v28 + 32);
  *(unsigned char *)(a1 + v26) = *(unsigned char *)(a2 + v26);
  return a1;
}

uint64_t sub_10064AFE4(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_100010218((uint64_t *)&unk_100800A60);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[9];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = type metadata accessor for Date();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  int v24 = v23(v19, 1, v21);
  int v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_12;
  }
  if (v25)
  {
LABEL_12:
    uint64_t v26 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v19, v20, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_13:
  uint64_t v27 = a3[11];
  uint64_t v28 = a1 + v27;
  long long v29 = (long long *)(a2 + v27);
  long long v30 = *v29;
  long long v31 = v29[1];
  *(unsigned char *)(v28 + 32) = *((unsigned char *)v29 + 32);
  *(_OWORD *)uint64_t v28 = v30;
  *(_OWORD *)(v28 + 16) = v31;
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_10064B354(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = sub_100010218((uint64_t *)&unk_100800A60);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  int v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v18 = a3[11];
  uint64_t v19 = a3[12];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  long long v22 = *(_OWORD *)(v21 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *(_OWORD *)(v20 + 16) = v22;
  *(unsigned char *)(v20 + 32) = *(unsigned char *)(v21 + 32);
  *(unsigned char *)(a1 + v19) = *(unsigned char *)(a2 + v19);
  return a1;
}

uint64_t sub_10064B594(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[8];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
LABEL_6:
    uint64_t v17 = sub_100010218((uint64_t *)&unk_100800A60);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_7:
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  void *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  int v24 = (void *)(a1 + v23);
  int v25 = (void *)(a2 + v23);
  uint64_t v26 = type metadata accessor for Date();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v27 + 48);
  int v29 = v28(v24, 1, v26);
  int v30 = v28(v25, 1, v26);
  if (!v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v27 + 40))(v24, v25, v26);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v27 + 8))(v24, v26);
    goto LABEL_12;
  }
  if (v30)
  {
LABEL_12:
    uint64_t v31 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v24, v25, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v27 + 32))(v24, v25, v26);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
LABEL_13:
  uint64_t v32 = a3[11];
  uint64_t v33 = a3[12];
  uint64_t v34 = a1 + v32;
  uint64_t v35 = a2 + v32;
  long long v36 = *(_OWORD *)(v35 + 16);
  *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
  *(_OWORD *)(v34 + 16) = v36;
  *(unsigned char *)(v34 + 32) = *(unsigned char *)(v35 + 32);
  *(unsigned char *)(a1 + v33) = *(unsigned char *)(a2 + v33);
  return a1;
}

uint64_t sub_10064B8C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10064B8D4);
}

uint64_t sub_10064B8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100010218((uint64_t *)&unk_100800A60);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = a1 + *(int *)(a3 + 32);
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = sub_100010218((uint64_t *)&unk_1007FC470);
      int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = a1 + *(int *)(a3 + 40);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t sub_10064BA14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10064BA28);
}

uint64_t sub_10064BA28(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 16) = a2;
  }
  else
  {
    uint64_t v8 = sub_100010218((uint64_t *)&unk_100800A60);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 32);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100010218((uint64_t *)&unk_1007FC470);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 40);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t _s20ThirdPartyMediaAssetC12MetadataTypeVMa(uint64_t a1)
{
  return sub_10003352C(a1, qword_100814E98);
}

void sub_10064BB7C()
{
  sub_1000B0C5C(319, (unint64_t *)&qword_1007F9270, (void (*)(uint64_t))&type metadata accessor for URL);
  if (v0 <= 0x3F)
  {
    sub_1000B0C5C(319, (unint64_t *)&qword_1007FAAE0, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *_s20ThirdPartyMediaAssetC12ColorVariantOMa()
{
  return &_s20ThirdPartyMediaAssetC12ColorVariantON;
}

uint64_t sub_10064BCC0()
{
  return swift_retain();
}

uint64_t sub_10064BCD0(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtCC7Journal10Journaling20ThirdPartyMediaAsset_metadata) = a1;
  return swift_release();
}

uint64_t sub_10064BCE8()
{
  return sub_10064A610();
}

uint64_t sub_10064BD0C()
{
  return sub_10064BD9C(&qword_1007F9DE0, (void (*)(uint64_t))_s20ThirdPartyMediaAssetC12MetadataTypeVMa);
}

uint64_t sub_10064BD54()
{
  return sub_10064BD9C(&qword_100814EF0, (void (*)(uint64_t))_s20ThirdPartyMediaAssetC12MetadataTypeVMa);
}

uint64_t sub_10064BD9C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10064BDE4()
{
  unint64_t result = qword_100814F38;
  if (!qword_100814F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814F38);
  }
  return result;
}

unint64_t sub_10064BE38()
{
  unint64_t result = qword_100814F50;
  if (!qword_100814F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814F50);
  }
  return result;
}

uint64_t sub_10064BE8C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100014440(&qword_100814F40);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10064BED4()
{
  unint64_t result = qword_100814F68;
  if (!qword_100814F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814F68);
  }
  return result;
}

uint64_t sub_10064BF28(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x707954616964656DLL && a2 == 0xE900000000000065;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1735290739 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D614E6D75626C61 && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x614E747369747261 && a2 == 0xEA0000000000656DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4C5255616964656DLL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656D614E707061 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6D69547472617473 && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001006A9220 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x726156726F6C6F63 && a2 == 0xEC000000746E6169)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_10064C300(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746867696CLL && a2 == 0xE500000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1802658148 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6B72614479726576 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_10064C440(void *a1)
{
  uint64_t v2 = sub_100010218(&qword_100814F70);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin(v2);
  int v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100010218(&qword_100814F78);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100010218(&qword_100814F80);
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010218(&qword_100814F88);
  uint64_t v28 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10002E0BC(a1, a1[3]);
  sub_10064C9B0();
  uint64_t v12 = (uint64_t)v30;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  int v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v11 = v18;
    sub_100010218(&qword_100809688);
    *uint64_t v11 = &_s20ThirdPartyMediaAssetC12ColorVariantON;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, enum case for DecodingError.typeMismatch(_:), v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_10064CA58();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_10064CA04();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_10064CAAC();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v30);
  return v11;
}

unint64_t sub_10064C9B0()
{
  unint64_t result = qword_100814F90;
  if (!qword_100814F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814F90);
  }
  return result;
}

unint64_t sub_10064CA04()
{
  unint64_t result = qword_100814F98;
  if (!qword_100814F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814F98);
  }
  return result;
}

unint64_t sub_10064CA58()
{
  unint64_t result = qword_100814FA0;
  if (!qword_100814FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FA0);
  }
  return result;
}

unint64_t sub_10064CAAC()
{
  unint64_t result = qword_100814FA8;
  if (!qword_100814FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FA8);
  }
  return result;
}

unsigned char *_s20ThirdPartyMediaAssetC12ColorVariantOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10064CBCCLL);
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

ValueMetadata *_s20ThirdPartyMediaAssetC12ColorVariantO10CodingKeysOMa()
{
  return &_s20ThirdPartyMediaAssetC12ColorVariantO10CodingKeysON;
}

ValueMetadata *_s20ThirdPartyMediaAssetC12ColorVariantO15LightCodingKeysOMa()
{
  return &_s20ThirdPartyMediaAssetC12ColorVariantO15LightCodingKeysON;
}

ValueMetadata *_s20ThirdPartyMediaAssetC12ColorVariantO14DarkCodingKeysOMa()
{
  return &_s20ThirdPartyMediaAssetC12ColorVariantO14DarkCodingKeysON;
}

ValueMetadata *_s20ThirdPartyMediaAssetC12ColorVariantO18VeryDarkCodingKeysOMa()
{
  return &_s20ThirdPartyMediaAssetC12ColorVariantO18VeryDarkCodingKeysON;
}

unsigned char *_s20ThirdPartyMediaAssetC12MetadataTypeV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x10064CD00);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *_s20ThirdPartyMediaAssetC12MetadataTypeV10CodingKeysOMa()
{
  return &_s20ThirdPartyMediaAssetC12MetadataTypeV10CodingKeysON;
}

unint64_t sub_10064CD3C()
{
  unint64_t result = qword_100814FD0;
  if (!qword_100814FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FD0);
  }
  return result;
}

unint64_t sub_10064CD94()
{
  unint64_t result = qword_100814FD8;
  if (!qword_100814FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FD8);
  }
  return result;
}

unint64_t sub_10064CDEC()
{
  unint64_t result = qword_100814FE0;
  if (!qword_100814FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FE0);
  }
  return result;
}

unint64_t sub_10064CE44()
{
  unint64_t result = qword_100814FE8;
  if (!qword_100814FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FE8);
  }
  return result;
}

unint64_t sub_10064CE9C()
{
  unint64_t result = qword_100814FF0;
  if (!qword_100814FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FF0);
  }
  return result;
}

unint64_t sub_10064CEF4()
{
  unint64_t result = qword_100814FF8;
  if (!qword_100814FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100814FF8);
  }
  return result;
}

unint64_t sub_10064CF4C()
{
  unint64_t result = qword_100815000;
  if (!qword_100815000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815000);
  }
  return result;
}

unint64_t sub_10064CFA4()
{
  unint64_t result = qword_100815008;
  if (!qword_100815008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815008);
  }
  return result;
}

unint64_t sub_10064CFFC()
{
  unint64_t result = qword_100815010;
  if (!qword_100815010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815010);
  }
  return result;
}

unint64_t sub_10064D054()
{
  unint64_t result = qword_100815018;
  if (!qword_100815018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815018);
  }
  return result;
}

unint64_t sub_10064D0AC()
{
  unint64_t result = qword_100815020;
  if (!qword_100815020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815020);
  }
  return result;
}

unint64_t sub_10064D104()
{
  unint64_t result = qword_100815028;
  if (!qword_100815028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815028);
  }
  return result;
}

uint64_t *sub_10064D158(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v28 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date.FormatStyle.TimeStyle();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Locale();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for Calendar();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = type metadata accessor for TimeZone();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    uint64_t v20 = a3[8];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = type metadata accessor for FormatStyleCapitalizationContext();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = a3[9];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t sub_10064D388(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for Date.FormatStyle.TimeStyle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = type metadata accessor for FormatStyleCapitalizationContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + a2[9];
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);

  return v15(v13, v14);
}

uint64_t sub_10064D538(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date.FormatStyle.TimeStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = type metadata accessor for FormatStyleCapitalizationContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  return a1;
}

uint64_t sub_10064D718(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date.FormatStyle.TimeStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = type metadata accessor for FormatStyleCapitalizationContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  return a1;
}

uint64_t sub_10064D8F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date.FormatStyle.TimeStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = type metadata accessor for FormatStyleCapitalizationContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  return a1;
}

uint64_t sub_10064DAD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date.FormatStyle.TimeStyle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = type metadata accessor for TimeZone();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = type metadata accessor for FormatStyleCapitalizationContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 40))(v20, v21, v22);
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 40))(v24, v25, v26);
  return a1;
}

uint64_t sub_10064DCB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10064DCCC);
}

uint64_t sub_10064DCCC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date.FormatStyle.TimeStyle();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for Locale();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_11:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_12;
  }
  uint64_t v14 = type metadata accessor for Calendar();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_11;
  }
  uint64_t v15 = type metadata accessor for TimeZone();
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = *(void *)(v15 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_11;
  }
  uint64_t v16 = type metadata accessor for FormatStyleCapitalizationContext();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
  {
    uint64_t v8 = v16;
    uint64_t v12 = *(void *)(v16 - 8);
    uint64_t v13 = a3[8];
    goto LABEL_11;
  }
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a3[9];

  return v19(v21, a2, v20);
}

uint64_t sub_10064DEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10064DF10);
}

uint64_t sub_10064DF10(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for Date.FormatStyle.TimeStyle();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_12:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = type metadata accessor for Locale();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_11:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_12;
  }
  uint64_t v16 = type metadata accessor for Calendar();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[6];
    goto LABEL_11;
  }
  uint64_t v17 = type metadata accessor for TimeZone();
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
  {
    uint64_t v10 = v17;
    uint64_t v14 = *(void *)(v17 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_11;
  }
  uint64_t v18 = type metadata accessor for FormatStyleCapitalizationContext();
  if (*(_DWORD *)(*(void *)(v18 - 8) + 84) == a3)
  {
    uint64_t v10 = v18;
    uint64_t v14 = *(void *)(v18 - 8);
    uint64_t v15 = a4[8];
    goto LABEL_11;
  }
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  uint64_t v22 = v20;
  uint64_t v23 = a1 + a4[9];

  return v21(v23, a2, a2, v22);
}

uint64_t _s23YearAdaptiveFormatStyleVMa()
{
  uint64_t result = qword_100815088;
  if (!qword_100815088) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10064E198()
{
  uint64_t result = type metadata accessor for Date.FormatStyle.TimeStyle();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Locale();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for Calendar();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for TimeZone();
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for FormatStyleCapitalizationContext();
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for Date();
            if (v6 <= 0x3F)
            {
              swift_initStructMetadata();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10064E350(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v80 = a1;
  uint64_t v3 = type metadata accessor for Date.FormatStyle.Symbol.Day();
  uint64_t v62 = *(void *)(v3 - 8);
  uint64_t v63 = v3;
  __chkstk_darwin(v3);
  uint64_t v61 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for Date.FormatStyle.Symbol.Month();
  uint64_t v59 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v58 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for Date.FormatStyle.Symbol.Weekday();
  uint64_t v56 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v55 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for FormatStyleCapitalizationContext();
  uint64_t v77 = *(void *)(v7 - 8);
  uint64_t v78 = v7;
  __chkstk_darwin(v7);
  uint64_t v79 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TimeZone();
  uint64_t v73 = *(void *)(v9 - 8);
  uint64_t v74 = v9;
  __chkstk_darwin(v9);
  uint64_t v76 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Calendar();
  uint64_t v67 = *(void *)(v11 - 8);
  uint64_t v68 = v11;
  __chkstk_darwin(v11);
  uint64_t v72 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Locale();
  uint64_t v64 = *(void *)(v13 - 8);
  uint64_t v65 = v13;
  __chkstk_darwin(v13);
  id v69 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100010218(&qword_1007F9538);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100010218(&qword_1007F9540);
  __chkstk_darwin(v18 - 8);
  uint64_t v66 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for Date.FormatStyle();
  uint64_t v71 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v54 - v23;
  __chkstk_darwin(v25);
  uint64_t v54 = (char *)&v54 - v26;
  __chkstk_darwin(v27);
  id v70 = (char *)&v54 - v28;
  uint64_t v29 = type metadata accessor for Calendar.Component();
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  char v32 = (char *)&v54 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v33 = (int *)_s23YearAdaptiveFormatStyleVMa();
  uint64_t v34 = v1 + v33[6];
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v32, enum case for Calendar.Component.year(_:), v29);
  char v35 = Calendar.isDate(_:equalTo:toGranularity:)();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v29);
  if (v35)
  {
    uint64_t v36 = type metadata accessor for Date.FormatStyle.DateStyle();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v66, 1, 1, v36);
    uint64_t v37 = type metadata accessor for Date.FormatStyle.TimeStyle();
    uint64_t v38 = *(void *)(v37 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v17, v2, v37);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v17, 0, 1, v37);
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v69, v2 + v33[5], v65);
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v72, v34, v68);
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v76, v2 + v33[7], v74);
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v79, v2 + v33[8], v78);
    Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
    unint64_t v39 = v55;
    static Date.FormatStyle.Symbol.Weekday.wide.getter();
    Date.FormatStyle.weekday(_:)();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v39, v57);
    uint64_t v40 = v71;
    uint64_t v41 = *(void (**)(char *, uint64_t))(v71 + 8);
    uint64_t v42 = v75;
    v41(v21, v75);
    uint64_t v43 = v58;
    static Date.FormatStyle.Symbol.Month.wide.getter();
    uint64_t v44 = v54;
    Date.FormatStyle.month(_:)();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v43, v60);
    v41(v24, v42);
    uint64_t v45 = v61;
    static Date.FormatStyle.Symbol.Day.defaultDigits.getter();
    id v46 = v70;
    Date.FormatStyle.day(_:)();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v45, v63);
    v41(v44, v42);
    uint64_t v47 = v40;
  }
  else
  {
    long long v48 = v66;
    static Date.FormatStyle.DateStyle.complete.getter();
    uint64_t v49 = type metadata accessor for Date.FormatStyle.DateStyle();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
    uint64_t v50 = type metadata accessor for Date.FormatStyle.TimeStyle();
    uint64_t v51 = *(void *)(v50 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v17, v2, v50);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v51 + 56))(v17, 0, 1, v50);
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v69, v2 + v33[5], v65);
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v72, v34, v68);
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v76, v2 + v33[7], v74);
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v79, v2 + v33[8], v78);
    id v46 = v70;
    Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
    uint64_t v42 = v75;
    uint64_t v47 = v71;
  }
  uint64_t v52 = Date.FormatStyle.format(_:)();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v42);
  return v52;
}

uint64_t sub_10064ED94(void *a1)
{
  uint64_t v3 = sub_100010218(&qword_100815120);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10002E0BC(a1, a1[3]);
  sub_1006505D8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  type metadata accessor for Date.FormatStyle.TimeStyle();
  sub_10065062C(&qword_100815128, (void (*)(uint64_t))&type metadata accessor for Date.FormatStyle.TimeStyle);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    _s23YearAdaptiveFormatStyleVMa();
    v8[14] = 1;
    type metadata accessor for Locale();
    sub_10065062C(&qword_10080BF58, (void (*)(uint64_t))&type metadata accessor for Locale);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v8[13] = 2;
    type metadata accessor for Calendar();
    sub_10065062C(&qword_100815130, (void (*)(uint64_t))&type metadata accessor for Calendar);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v8[12] = 3;
    type metadata accessor for TimeZone();
    sub_10065062C(&qword_100815138, (void (*)(uint64_t))&type metadata accessor for TimeZone);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v8[11] = 4;
    type metadata accessor for FormatStyleCapitalizationContext();
    sub_10065062C(&qword_100815140, (void (*)(uint64_t))&type metadata accessor for FormatStyleCapitalizationContext);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v8[10] = 5;
    type metadata accessor for Date();
    sub_10065062C(&qword_1007F99F0, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10064F178@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  __chkstk_darwin(v3);
  uint64_t v45 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for FormatStyleCapitalizationContext();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  __chkstk_darwin(v5);
  id v46 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = type metadata accessor for TimeZone();
  uint64_t v63 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v49 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = type metadata accessor for Calendar();
  uint64_t v65 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  long long v48 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for Locale();
  uint64_t v67 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Date.FormatStyle.TimeStyle();
  uint64_t v47 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100010218(&qword_1008150F0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v50 = v14;
  uint64_t v51 = v15;
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _s23YearAdaptiveFormatStyleVMa();
  uint64_t v19 = (int *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = &v21[v19[7]];
  static Locale.autoupdatingCurrent.getter();
  uint64_t v64 = &v21[v19[8]];
  static Calendar.autoupdatingCurrent.getter();
  uint64_t v62 = &v21[v19[9]];
  static TimeZone.autoupdatingCurrent.getter();
  uint64_t v61 = &v21[v19[10]];
  static FormatStyleCapitalizationContext.unknown.getter();
  uint64_t v53 = &v21[v19[11]];
  static Date.now.getter();
  uint64_t v22 = a1[3];
  uint64_t v54 = a1;
  sub_10002E0BC(a1, v22);
  sub_1006505D8();
  uint64_t v52 = v17;
  uint64_t v23 = v60;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v23)
  {
    uint64_t v29 = v57;
    uint64_t v28 = v58;
    uint64_t v31 = v55;
    uint64_t v30 = v56;
    uint64_t v32 = v59;
    char v33 = v53;
    _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v54);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v69);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v64, v68);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v32);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v61, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v33, v28);
  }
  else
  {
    uint64_t v24 = v10;
    uint64_t v25 = v48;
    uint64_t v26 = v49;
    char v75 = 0;
    sub_10065062C(&qword_100815100, (void (*)(uint64_t))&type metadata accessor for Date.FormatStyle.TimeStyle);
    uint64_t v27 = v50;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v21, v13, v11);
    char v74 = 1;
    sub_10065062C(&qword_10080BF48, (void (*)(uint64_t))&type metadata accessor for Locale);
    uint64_t v34 = v24;
    uint64_t v35 = v69;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v60 = v11;
    (*(void (**)(char *, char *, uint64_t))(v67 + 40))(v66, v34, v35);
    char v73 = 2;
    sub_10065062C(&qword_100815108, (void (*)(uint64_t))&type metadata accessor for Calendar);
    uint64_t v36 = v25;
    uint64_t v37 = v68;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v38 = v59;
    (*(void (**)(char *, char *, uint64_t))(v65 + 40))(v64, v36, v37);
    char v72 = 3;
    sub_10065062C(&qword_100815110, (void (*)(uint64_t))&type metadata accessor for TimeZone);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v63 + 40))(v62, v26, v38);
    char v71 = 4;
    sub_10065062C(&qword_100815118, (void (*)(uint64_t))&type metadata accessor for FormatStyleCapitalizationContext);
    unint64_t v39 = v46;
    uint64_t v40 = v56;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v55 + 40))(v61, v39, v40);
    char v70 = 5;
    sub_10065062C(&qword_10080E9D0, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v41 = v58;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v27);
    (*(void (**)(char *, char *, uint64_t))(v57 + 40))(v53, v45, v41);
    sub_100650574((uint64_t)v21, v44);
    _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v54);
    return sub_1002AEB40((uint64_t)v21);
  }
}

unint64_t sub_10064FB28()
{
  unint64_t result = 0x6C797453656D6974;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656C61636F6CLL;
      break;
    case 2:
      unint64_t result = 0x7261646E656C6163;
      break;
    case 3:
      unint64_t result = 0x656E6F5A656D6974;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0x636E657265666572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10064FBF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100650940(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10064FC18(uint64_t a1)
{
  unint64_t v2 = sub_1006505D8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10064FC54(uint64_t a1)
{
  unint64_t v2 = sub_1006505D8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10064FC90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10064E350(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10064FCB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_100650574(v3, a3);
  uint64_t v7 = a3 + *(int *)(a2 + 20);
  uint64_t v8 = type metadata accessor for Locale();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24);

  return v9(v7, a1, v8);
}

uint64_t sub_10064FD44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10064F178(a1, a2);
}

uint64_t sub_10064FD5C(void *a1)
{
  return sub_10064ED94(a1);
}

Swift::Int sub_10064FD74()
{
  return Hasher._finalize()();
}

uint64_t sub_10064FFC4()
{
  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int sub_100650204()
{
  return Hasher._finalize()();
}

uint64_t sub_100650454()
{
  return sub_10065062C(&qword_1008150D0, (void (*)(uint64_t))_s23YearAdaptiveFormatStyleVMa);
}

uint64_t sub_10065049C()
{
  return sub_10065062C(&qword_1008150D8, (void (*)(uint64_t))_s23YearAdaptiveFormatStyleVMa);
}

uint64_t sub_1006504E4()
{
  return sub_10065062C(&qword_1008150E0, (void (*)(uint64_t))_s23YearAdaptiveFormatStyleVMa);
}

uint64_t sub_10065052C()
{
  return sub_10065062C(&qword_1008150E8, (void (*)(uint64_t))_s23YearAdaptiveFormatStyleVMa);
}

uint64_t sub_100650574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s23YearAdaptiveFormatStyleVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1006505D8()
{
  unint64_t result = qword_1008150F8;
  if (!qword_1008150F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1008150F8);
  }
  return result;
}

uint64_t sub_10065062C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100650674()
{
  if ((static Date.FormatStyle.TimeStyle.== infix(_:_:)() & 1) == 0) {
    return 0;
  }
  _s23YearAdaptiveFormatStyleVMa();
  if ((static Locale.== infix(_:_:)() & 1) == 0
    || (static Calendar.== infix(_:_:)() & 1) == 0
    || (static TimeZone.== infix(_:_:)() & 1) == 0
    || (static FormatStyleCapitalizationContext.== infix(_:_:)() & 1) == 0)
  {
    return 0;
  }

  return static Date.== infix(_:_:)();
}

unsigned char *_s23YearAdaptiveFormatStyleV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x100650800);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *_s23YearAdaptiveFormatStyleV10CodingKeysOMa()
{
  return &_s23YearAdaptiveFormatStyleV10CodingKeysON;
}

unint64_t sub_10065083C()
{
  unint64_t result = qword_100815168;
  if (!qword_100815168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815168);
  }
  return result;
}

unint64_t sub_100650894()
{
  unint64_t result = qword_100815170;
  if (!qword_100815170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815170);
  }
  return result;
}

unint64_t sub_1006508EC()
{
  unint64_t result = qword_100815178;
  if (!qword_100815178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815178);
  }
  return result;
}

uint64_t sub_100650940(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C797453656D6974 && a2 == 0xE900000000000065;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7261646E656C6163 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656E6F5A656D6974 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001006A9240 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x636E657265666572 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_100650BCC(uint64_t a1)
{
  uint64_t v23 = sub_100010218(&qword_1007FC8E0);
  __chkstk_darwin(v23);
  unsigned int v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010218((uint64_t *)&unk_1007FF080);
  uint64_t v10 = *(int *)(v9 + 28);
  uint64_t v22 = v1;
  uint64_t v11 = v1 + v10;
  sub_100654F14((unint64_t *)&qword_1007FD120, (void (*)(uint64_t))&type metadata accessor for Date);
  char v12 = dispatch thunk of static Comparable.>= infix(_:_:)();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v21[1] = a1;
  v13(v8, a1, v5);
  sub_100121250(v11, (uint64_t)v4);
  if ((v12 & 1) == 0)
  {
    sub_10001457C((uint64_t)v4, &qword_1007FC8E0);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  char v14 = dispatch thunk of static Comparable.<= infix(_:_:)();
  sub_10001457C((uint64_t)v4, &qword_1007FC8E0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((v14 & 1) == 0) {
    return 0;
  }
  uint64_t v15 = *(void *)(v22 + *(int *)(v9 + 32));
  uint64_t v16 = sub_10066B940();
  if (!*(void *)(v15 + 16)) {
    return 0;
  }
  unint64_t v17 = sub_10001BAFC(v16);
  if ((v18 & 1) == 0) {
    return 0;
  }
  uint64_t v19 = *(void *)(*(void *)(v15 + 56) + 32 * v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v19;
}

uint64_t sub_100650E64(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 88);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_100650F04(uint64_t result, uint64_t a2, char a3, uint64_t a4, unsigned int a5, char a6)
{
  if (a6 & 1) != 0 || (a3) {
    goto LABEL_38;
  }
  unint64_t v8 = result;
  if (a4 < result) {
    goto LABEL_36;
  }
  uint64_t v9 = a2;
  if (a5 != a2)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    return result;
  }
  if (result != a4)
  {
    unint64_t result = sub_100010218((uint64_t *)&unk_1007FF080);
    unsigned int v11 = a5;
    uint64_t v12 = *(void *)(v6 + *(int *)(result + 32));
    uint64_t v13 = v12 + 64;
    uint64_t v14 = v12 + 96;
    uint64_t v10 = 1;
    while (1)
    {
      if ((v8 & 0x8000000000000000) != 0 || (uint64_t v15 = 1 << *(unsigned char *)(v12 + 32), (uint64_t)v8 >= v15))
      {
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      unint64_t v16 = v8 >> 6;
      unint64_t v17 = *(void *)(v13 + 8 * (v8 >> 6));
      if (((v17 >> v8) & 1) == 0) {
        goto LABEL_33;
      }
      if (*(_DWORD *)(v12 + 36) != v9) {
        goto LABEL_34;
      }
      unint64_t v18 = v17 & (-2 << (v8 & 0x3F));
      if (v18)
      {
        unint64_t v8 = __clz(__rbit64(v18)) | v8 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v19 = v16 + 1;
        unint64_t v20 = (unint64_t)(v15 + 63) >> 6;
        if (v16 + 1 >= v20) {
          goto LABEL_26;
        }
        unint64_t v21 = *(void *)(v13 + 8 * v19);
        if (!v21)
        {
          unint64_t v19 = v16 + 2;
          if (v16 + 2 >= v20) {
            goto LABEL_26;
          }
          unint64_t v21 = *(void *)(v13 + 8 * v19);
          if (!v21)
          {
            unint64_t v19 = v16 + 3;
            if (v16 + 3 >= v20) {
              goto LABEL_26;
            }
            unint64_t v21 = *(void *)(v13 + 8 * v19);
            if (!v21)
            {
              while (v20 - 4 != v16)
              {
                unint64_t v21 = *(void *)(v14 + 8 * v16++);
                if (v21)
                {
                  uint64_t v22 = v14;
                  unint64_t result = sub_1000733B8(v8, v9, 0);
                  uint64_t v14 = v22;
                  unsigned int v11 = a5;
                  unint64_t v19 = v16 + 3;
                  goto LABEL_17;
                }
              }
              uint64_t v23 = v14;
              unint64_t result = sub_1000733B8(v8, v9, 0);
              uint64_t v14 = v23;
              unsigned int v11 = a5;
LABEL_26:
              unint64_t v8 = v15;
              goto LABEL_27;
            }
          }
        }
LABEL_17:
        unint64_t v8 = __clz(__rbit64(v21)) + (v19 << 6);
      }
LABEL_27:
      if (v9 != v11) {
        goto LABEL_35;
      }
      if (v8 == a4) {
        return v10;
      }
      uint64_t v9 = a5;
      if (__OFADD__(v10++, 1))
      {
        __break(1u);
        goto LABEL_32;
      }
    }
  }
  return 0;
}

void sub_100651100()
{
  uint64_t v1 = v0;
  uint64_t Update = type metadata accessor for InsightsDataManager.LastUpdate(0);
  __chkstk_darwin(Update);
  unsigned int v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100010218(&qword_100815180);
  __chkstk_darwin(v5 - 8);
  unint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = (int *)_s8SnapshotVMa();
  uint64_t v9 = *((void *)v8 - 1);
  __chkstk_darwin(v8);
  unsigned int v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OBJC_IVAR____TtC7Journal19InsightsDataManager_options;
  if (sub_100542088(5, *(void *)(v0 + OBJC_IVAR____TtC7Journal19InsightsDataManager_options)))
  {
    id v13 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v14 = String._bridgeToObjectiveC()();
    id v37 = [v13 initWithSuiteName:v14];

    if (v37)
    {
      NSString v15 = String._bridgeToObjectiveC()();
      id v16 = [v37 dataForKey:v15];

      if (v16)
      {
        uint64_t v34 = Update;
        uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v19 = v18;

        type metadata accessor for PropertyListDecoder();
        swift_allocObject();
        PropertyListDecoder.init()();
        sub_100654F14(&qword_100815188, (void (*)(uint64_t))_s8SnapshotVMa);
        uint64_t v35 = v17;
        unint64_t v36 = v19;
        dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
        swift_release();
        (*(void (**)(char *, void, uint64_t, int *))(v9 + 56))(v7, 0, 1, v8);
        sub_100652DD8((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))_s8SnapshotVMa);
        swift_getKeyPath();
        uint64_t v33 = 0;
        uint64_t v39 = v1;
        sub_100654F14((unint64_t *)&qword_1007FA9D8, (void (*)(uint64_t))type metadata accessor for InsightsDataManager);
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v39 = v1;
        swift_getKeyPath();
        ObservationRegistrar.willSet<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v21 = v1 + OBJC_IVAR____TtC7Journal19InsightsDataManager__streaks;
        swift_beginAccess();
        sub_100651964((uint64_t)v11, v21);
        swift_endAccess();
        uint64_t v39 = v1;
        swift_getKeyPath();
        ObservationRegistrar.didSet<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v32 = &v11[v8[5]];
        swift_getKeyPath();
        uint64_t v39 = v1;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v39 = v1;
        swift_getKeyPath();
        ObservationRegistrar.willSet<A, B>(_:keyPath:)();
        swift_release();
        swift_beginAccess();
        uint64_t v22 = type metadata accessor for InsightsDataManager.Streaks(0);
        sub_100651964((uint64_t)v32, v21 + *(int *)(v22 + 20));
        swift_endAccess();
        uint64_t v39 = v1;
        swift_getKeyPath();
        ObservationRegistrar.didSet<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v23 = *(void *)&v11[v8[6]];
        swift_getKeyPath();
        uint64_t v39 = v1;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v39 = v1;
        swift_getKeyPath();
        ObservationRegistrar.willSet<A, B>(_:keyPath:)();
        swift_release();
        *(void *)(v1 + OBJC_IVAR____TtC7Journal19InsightsDataManager__wordCount) = v23;
        uint64_t v39 = v1;
        swift_getKeyPath();
        ObservationRegistrar.didSet<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v24 = *(void *)&v11[v8[7]];
        swift_getKeyPath();
        uint64_t v39 = v1;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v39 = v1;
        swift_getKeyPath();
        ObservationRegistrar.willSet<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v25 = v1 + OBJC_IVAR____TtC7Journal19InsightsDataManager__byEntryDate;
        swift_beginAccess();
        uint64_t v32 = (char *)type metadata accessor for InsightsDataManager.EntrySummaryGroup(0);
        uint64_t v26 = v25 + *((int *)v32 + 5);
        *(void *)uint64_t v26 = v24;
        *(unsigned char *)(v26 + 8) = 0;
        uint64_t v38 = v1;
        swift_getKeyPath();
        ObservationRegistrar.didSet<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v31 = *(void *)&v11[v8[8]];
        swift_getKeyPath();
        uint64_t v38 = v1;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v38 = v1;
        swift_getKeyPath();
        ObservationRegistrar.willSet<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v27 = v25 + *((int *)v32 + 8);
        *(void *)uint64_t v27 = v31;
        *(unsigned char *)(v27 + 8) = 0;
        uint64_t v38 = v1;
        swift_getKeyPath();
        ObservationRegistrar.didSet<A, B>(_:keyPath:)();
        swift_release();
        static Date.now.getter();
        uint64_t v28 = *(void *)(v1 + v12);
        uint64_t v29 = v34;
        *(void *)&v4[*(int *)(v34 + 20)] = 0;
        *(void *)&v4[*(int *)(v29 + 24)] = v28;
        uint64_t KeyPath = swift_getKeyPath();
        __chkstk_darwin(KeyPath);
        *(&v31 - 2) = v1;
        *(&v31 - 1) = (uint64_t)v4;
        uint64_t v38 = v1;
        swift_bridgeObjectRetain();
        ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
        swift_release();
        sub_100652D78((uint64_t)v4, type metadata accessor for InsightsDataManager.LastUpdate);

        sub_100040DD0(v35, v36);
        sub_100652D78((uint64_t)v11, (uint64_t (*)(void))_s8SnapshotVMa);
      }
      else
      {
        id v20 = v37;
      }
    }
  }
}

uint64_t _s8SnapshotVMa()
{
  uint64_t result = qword_1008151F0;
  if (!qword_1008151F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100651964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StreakSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1006519E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for InsightsDataManager.EntrySummaryGroup(0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date.now.getter();
  uint64_t v9 = sub_100650BCC((uint64_t)v8);
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v13)
  {
    sub_10012C4F4(v9, v11, v13);
    sub_100654EAC(v1, (uint64_t)v4, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
    sub_100652D78((uint64_t)v4, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
  }
  else
  {
    sub_100654EAC(v1, (uint64_t)v4, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
    NSString v14 = &v4[*(int *)(v2 + 32)];
    uint64_t v11 = *(void *)v14;
    int v15 = v14[8];
    sub_100652D78((uint64_t)v4, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
    if (v15) {
      return 0;
    }
  }
  return v11;
}

uint64_t sub_100651BD8()
{
  uint64_t v1 = type metadata accessor for InsightsDataManager.EntrySummaryGroup(0);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + *(int *)(sub_100010218((uint64_t *)&unk_1007FF080) + 32));
  uint64_t result = sub_100650E64(v4);
  if (v7) {
    goto LABEL_10;
  }
  unsigned int v8 = *(_DWORD *)(v4 + 36);
  if (v8 != v6)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v4 + 32);
  if (result == v9)
  {
    sub_100654EAC(v0, (uint64_t)v3, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
    uint64_t v10 = &v3[*(int *)(v1 + 20)];
    uint64_t v11 = *(void *)v10;
    int v12 = v10[8];
    sub_100652D78((uint64_t)v3, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
    if (v12) {
      return 0;
    }
    else {
      return v11;
    }
  }
  else
  {
    uint64_t v13 = sub_100650E64(v4);
    uint64_t v15 = v14;
    char v17 = v16 & 1;
    uint64_t v18 = sub_100650F04(v13, v14, v16 & 1, v9, v8, 0);
    sub_1000733B8(v13, v15, v17);
    sub_100654EAC(v0, (uint64_t)v3, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
    sub_100652D78((uint64_t)v3, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
    return v18;
  }
}

uint64_t sub_100651D78(void *a1)
{
  uint64_t v3 = sub_100010218(&qword_100815250);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002E0BC(a1, a1[3]);
  sub_100654E58();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  type metadata accessor for StreakSummary();
  sub_100654F14(&qword_100815258, (void (*)(uint64_t))type metadata accessor for StreakSummary);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    _s8SnapshotVMa();
    char v12 = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    char v11 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v10 = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v9 = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100651FC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = (int *)type metadata accessor for StreakSummary();
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v25 - v6;
  uint64_t v34 = sub_100010218(&qword_100815238);
  uint64_t v30 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  unint64_t v36 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s8SnapshotVMa();
  char v9 = (int *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Date();
  char v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  v13(&v11[v3[5]], 1, 1, v12);
  v13(&v11[v3[6]], 1, 1, v12);
  *(void *)&v11[v3[7]] = 0;
  uint64_t v14 = (uint64_t)&v11[v9[7]];
  v13((char *)v14, 1, 1, v12);
  v13((char *)(v14 + v3[5]), 1, 1, v12);
  v13((char *)(v14 + v3[6]), 1, 1, v12);
  uint64_t v31 = v3;
  *(void *)(v14 + v3[7]) = 0;
  uint64_t v15 = v9[8];
  *(void *)&v11[v15] = 0;
  uint64_t v16 = v9[9];
  *(void *)&v11[v16] = 0;
  uint64_t v17 = v9[10];
  *(void *)&v11[v17] = 0;
  sub_10002E0BC(a1, a1[3]);
  sub_100654E58();
  uint64_t v18 = v35;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v18)
  {
    uint64_t v27 = v15;
    uint64_t v28 = v14;
    uint64_t v25 = v16;
    uint64_t v26 = v17;
    uint64_t v35 = a1;
    uint64_t v19 = (uint64_t)v32;
    char v41 = 0;
    sub_100654F14(&qword_100815248, (void (*)(uint64_t))type metadata accessor for StreakSummary);
    id v20 = v36;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_10015D90C(v33, (uint64_t)v11);
    char v40 = 1;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    sub_10015D90C(v19, v28);
    char v39 = 2;
    *(void *)&v11[v27] = KeyedDecodingContainer.decode(_:forKey:)();
    char v38 = 3;
    *(void *)&v11[v25] = KeyedDecodingContainer.decode(_:forKey:)();
    char v37 = 4;
    uint64_t v22 = v34;
    uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v22);
    uint64_t v24 = v29;
    a1 = v35;
    *(void *)&v11[v26] = v23;
    sub_100654EAC((uint64_t)v11, v24, (uint64_t (*)(void))_s8SnapshotVMa);
  }
  _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)a1);
  return sub_100652D78((uint64_t)v11, (uint64_t (*)(void))_s8SnapshotVMa);
}

uint64_t sub_100652470()
{
  uint64_t result = 0x6144657669746361;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6557657669746361;
      break;
    case 2:
      uint64_t result = 0x6E756F4364726F77;
      break;
    case 3:
      uint64_t result = 0x746E756F43796164;
      break;
    case 4:
      uint64_t result = 0x5473656972746E65;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100652538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100655168(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100652560(uint64_t a1)
{
  unint64_t v2 = sub_100654E58();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10065259C(uint64_t a1)
{
  unint64_t v2 = sub_100654E58();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1006525D8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100651FC4(a1, a2);
}

uint64_t sub_1006525F0(void *a1)
{
  return sub_100651D78(a1);
}

uint64_t sub_100652608()
{
  uint64_t v1 = type metadata accessor for InsightsDataManager.EntrySummaryGroup(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v47 = (uint64_t)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v43 - v4;
  uint64_t v6 = type metadata accessor for StreakSummary();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  char v11 = (char *)&v43 - v10;
  uint64_t v48 = _s8SnapshotVMa();
  __chkstk_darwin(v48);
  uint64_t v49 = (uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v43 - v18;
  uint64_t v50 = v0;
  uint64_t result = sub_100542088(5, *(void *)(v0 + OBJC_IVAR____TtC7Journal19InsightsDataManager_options));
  if (result)
  {
    swift_getKeyPath();
    uint64_t v21 = v50;
    uint64_t v22 = v50 + OBJC_IVAR____TtC7Journal19InsightsDataManager___observationRegistrar;
    uint64_t v54 = v50;
    uint64_t v45 = sub_100654F14((unint64_t *)&qword_1007FA9D8, (void (*)(uint64_t))type metadata accessor for InsightsDataManager);
    uint64_t v46 = v22;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v23 = v21 + OBJC_IVAR____TtC7Journal19InsightsDataManager__lastUpdated;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v19, v23, v13);
    static Date.distantPast.getter();
    sub_100654F14((unint64_t *)&qword_1007FABD0, (void (*)(uint64_t))&type metadata accessor for Date);
    LOBYTE(v22) = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
    v24(v16, v13);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v19, v13);
    if ((v22 & 1) == 0)
    {
      swift_getKeyPath();
      uint64_t v53 = v50;
      ObservationRegistrar.access<A, B>(_:keyPath:)();
      swift_release();
      uint64_t Update = type metadata accessor for InsightsDataManager.LastUpdate(0);
      uint64_t result = sub_100542088(5, *(void *)(v23 + *(int *)(Update + 24)));
      if ((result & 1) == 0)
      {
        swift_getKeyPath();
        uint64_t v26 = v50;
        uint64_t v53 = v50;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v27 = v26 + OBJC_IVAR____TtC7Journal19InsightsDataManager__streaks;
        swift_beginAccess();
        sub_100654EAC(v27, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for StreakSummary);
        swift_getKeyPath();
        uint64_t v52 = v26;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v28 = type metadata accessor for InsightsDataManager.Streaks(0);
        sub_100654EAC(v27 + *(int *)(v28 + 20), (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for StreakSummary);
        swift_getKeyPath();
        uint64_t v52 = v26;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v44 = *(void *)(v26 + OBJC_IVAR____TtC7Journal19InsightsDataManager__wordCount);
        swift_getKeyPath();
        uint64_t v52 = v26;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v29 = v26 + OBJC_IVAR____TtC7Journal19InsightsDataManager__byEntryDate;
        swift_beginAccess();
        sub_100654EAC(v29, (uint64_t)v5, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
        uint64_t v43 = sub_100651BD8();
        sub_100652D78((uint64_t)v5, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
        swift_getKeyPath();
        uint64_t v51 = v26;
        ObservationRegistrar.access<A, B>(_:keyPath:)();
        swift_release();
        uint64_t v30 = v29;
        uint64_t v31 = v47;
        sub_100654EAC(v30, v47, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
        uint64_t v32 = sub_1006519E0();
        sub_100652D78(v31, type metadata accessor for InsightsDataManager.EntrySummaryGroup);
        uint64_t v33 = v49;
        sub_100652DD8((uint64_t)v11, v49, (uint64_t (*)(void))type metadata accessor for StreakSummary);
        uint64_t v34 = (int *)v48;
        sub_100652DD8((uint64_t)v8, v33 + *(int *)(v48 + 20), (uint64_t (*)(void))type metadata accessor for StreakSummary);
        *(void *)(v33 + v34[6]) = v44;
        *(void *)(v33 + v34[7]) = v43;
        *(void *)(v33 + v34[8]) = v32;
        id v35 = objc_allocWithZone((Class)NSUserDefaults);
        NSString v36 = String._bridgeToObjectiveC()();
        id v37 = [v35 initWithSuiteName:v36];

        if (v37)
        {
          type metadata accessor for PropertyListEncoder();
          swift_allocObject();
          PropertyListEncoder.init()();
          sub_100654F14(&qword_100815190, (void (*)(uint64_t))_s8SnapshotVMa);
          uint64_t v38 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
          unint64_t v40 = v39;
          swift_release();
          Class isa = Data._bridgeToObjectiveC()().super.isa;
          NSString v42 = String._bridgeToObjectiveC()();
          [v37 setObject:isa forKey:v42];

          sub_100040DD0(v38, v40);
        }
        return sub_100652D78(v33, (uint64_t (*)(void))_s8SnapshotVMa);
      }
    }
  }
  return result;
}

uint64_t sub_100652D78(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100652DD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100652E40(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = sub_100010218((uint64_t *)&unk_1007FC470);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = (int *)type metadata accessor for StreakSummary();
    uint64_t v13 = v12[5];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    if (v9((uint64_t *)((char *)a2 + v13), 1, v7))
    {
      uint64_t v16 = sub_100010218((uint64_t *)&unk_1007FC470);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v15, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v14, 0, 1, v7);
    }
    uint64_t v17 = v12[6];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    if (v9((uint64_t *)((char *)a2 + v17), 1, v7))
    {
      uint64_t v20 = sub_100010218((uint64_t *)&unk_1007FC470);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v18, v19, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v18, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + v12[7]) = *(uint64_t *)((char *)a2 + v12[7]);
    uint64_t v21 = a3[5];
    uint64_t v22 = (char *)a1 + v21;
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v35 = v8;
    NSString v36 = a3;
    if (v9((uint64_t *)((char *)a2 + v21), 1, v7))
    {
      uint64_t v24 = sub_100010218((uint64_t *)&unk_1007FC470);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v22, v23, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v22, 0, 1, v7);
    }
    uint64_t v25 = v12[5];
    uint64_t v26 = &v22[v25];
    uint64_t v27 = &v23[v25];
    if (v9((uint64_t *)&v23[v25], 1, v7))
    {
      uint64_t v28 = sub_100010218((uint64_t *)&unk_1007FC470);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v26, v27, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v26, 0, 1, v7);
    }
    uint64_t v29 = v12[6];
    uint64_t v30 = &v22[v29];
    uint64_t v31 = &v23[v29];
    if (v9((uint64_t *)&v23[v29], 1, v7))
    {
      uint64_t v32 = sub_100010218((uint64_t *)&unk_1007FC470);
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v30, v31, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v30, 0, 1, v7);
    }
    *(void *)&v22[v12[7]] = *(void *)&v23[v12[7]];
    uint64_t v33 = v36[7];
    *(uint64_t *)((char *)a1 + v36[6]) = *(uint64_t *)((char *)a2 + v36[6]);
    *(uint64_t *)((char *)a1 + v33) = *(uint64_t *)((char *)a2 + v33);
    *(uint64_t *)((char *)a1 + v36[8]) = *(uint64_t *)((char *)a2 + v36[8]);
  }
  return a1;
}

uint64_t sub_100653334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v4 - 8);
  int v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  if (!v5(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v4);
  }
  uint64_t v6 = type metadata accessor for StreakSummary();
  uint64_t v7 = a1 + *(int *)(v6 + 20);
  if (!v5(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v7, v4);
  }
  uint64_t v8 = a1 + *(int *)(v6 + 24);
  if (!v5(v8, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v8, v4);
  }
  uint64_t v9 = a1 + *(int *)(a2 + 20);
  if (!v5(v9, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v9, v4);
  }
  uint64_t v10 = v9 + *(int *)(v6 + 20);
  if (!v5(v10, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v10, v4);
  }
  uint64_t v11 = v9 + *(int *)(v6 + 24);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v5)(v11, 1, v4);
  if (!result)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);
    return v13(v11, v4);
  }
  return result;
}

char *sub_100653578(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = (int *)type metadata accessor for StreakSummary();
  uint64_t v11 = v10[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  if (v8(&a2[v11], 1, v6))
  {
    uint64_t v14 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v13, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  }
  uint64_t v15 = v10[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  if (v8(&a2[v15], 1, v6))
  {
    uint64_t v18 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v16, v17, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  }
  *(void *)&a1[v10[7]] = *(void *)&a2[v10[7]];
  uint64_t v19 = a3[5];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v34 = a3;
  uint64_t v22 = v8;
  if (v8(&a2[v19], 1, v6))
  {
    uint64_t v23 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v20, v21, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v6);
  }
  uint64_t v24 = v10[5];
  uint64_t v25 = &v20[v24];
  uint64_t v26 = &v21[v24];
  if (v22(&v21[v24], 1, v6))
  {
    uint64_t v27 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v25, v26, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v25, 0, 1, v6);
  }
  uint64_t v28 = v10[6];
  uint64_t v29 = &v20[v28];
  uint64_t v30 = &v21[v28];
  if (v22(&v21[v28], 1, v6))
  {
    uint64_t v31 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v29, v30, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v29, 0, 1, v6);
  }
  *(void *)&v20[v10[7]] = *(void *)&v21[v10[7]];
  uint64_t v32 = v34[7];
  *(void *)&a1[v34[6]] = *(void *)&a2[v34[6]];
  *(void *)&a1[v32] = *(void *)&a2[v32];
  *(void *)&a1[v34[8]] = *(void *)&a2[v34[8]];
  return a1;
}

char *sub_100653A18(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
  int v8 = v7(a1, 1, v6);
  int v9 = v7(a2, 1, v6);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v9)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = (int *)type metadata accessor for StreakSummary();
  uint64_t v12 = v11[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v7(&a1[v12], 1, v6);
  int v16 = v7(v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v13, v14, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v13, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v6);
LABEL_12:
    uint64_t v17 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v13, v14, v6);
LABEL_13:
  uint64_t v18 = v11[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  int v21 = v7(&a1[v18], 1, v6);
  int v22 = v7(v20, 1, v6);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v19, v20, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v19, 0, 1, v6);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v19, v6);
LABEL_18:
    uint64_t v23 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v19, v20, v6);
LABEL_19:
  *(void *)&a1[v11[7]] = *(void *)&a2[v11[7]];
  uint64_t v24 = a3[5];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  int v27 = v7(&a1[v24], 1, v6);
  int v28 = v7(v26, 1, v6);
  uint64_t v43 = a3;
  uint64_t v44 = a2;
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v25, v26, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v25, 0, 1, v6);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v25, v6);
LABEL_24:
    uint64_t v29 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v25, v26, v6);
LABEL_25:
  uint64_t v30 = v11[5];
  uint64_t v31 = &v25[v30];
  uint64_t v32 = &v26[v30];
  int v33 = v7(&v25[v30], 1, v6);
  int v34 = v7(v32, 1, v6);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v31, v32, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v31, 0, 1, v6);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v34)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v6);
LABEL_30:
    uint64_t v35 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v31, v32, v6);
LABEL_31:
  uint64_t v36 = v11[6];
  id v37 = &v25[v36];
  uint64_t v38 = &v26[v36];
  int v39 = v7(&v25[v36], 1, v6);
  int v40 = v7(v38, 1, v6);
  if (!v39)
  {
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 24))(v37, v38, v6);
      goto LABEL_37;
    }
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v6);
    goto LABEL_36;
  }
  if (v40)
  {
LABEL_36:
    uint64_t v41 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v37, v38, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v37, 0, 1, v6);
LABEL_37:
  *(void *)&v25[v11[7]] = *(void *)&v26[v11[7]];
  *(void *)&a1[v43[6]] = *(void *)&v44[v43[6]];
  *(void *)&a1[v43[7]] = *(void *)&v44[v43[7]];
  *(void *)&a1[v43[8]] = *(void *)&v44[v43[8]];
  return a1;
}

char *sub_100654118(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = (int *)type metadata accessor for StreakSummary();
  uint64_t v11 = v10[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  if (v8(&a2[v11], 1, v6))
  {
    uint64_t v14 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v13, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  }
  uint64_t v15 = v10[6];
  int v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  if (v8(&a2[v15], 1, v6))
  {
    uint64_t v18 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  }
  *(void *)&a1[v10[7]] = *(void *)&a2[v10[7]];
  uint64_t v19 = a3[5];
  uint64_t v20 = &a1[v19];
  int v21 = &a2[v19];
  int v34 = a3;
  int v22 = v8;
  if (v8(&a2[v19], 1, v6))
  {
    uint64_t v23 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v20, v21, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v6);
  }
  uint64_t v24 = v10[5];
  uint64_t v25 = &v20[v24];
  uint64_t v26 = &v21[v24];
  if (v22(&v21[v24], 1, v6))
  {
    uint64_t v27 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v25, v26, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v25, 0, 1, v6);
  }
  uint64_t v28 = v10[6];
  uint64_t v29 = &v20[v28];
  uint64_t v30 = &v21[v28];
  if (v22(&v21[v28], 1, v6))
  {
    uint64_t v31 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v29, v30, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v29, 0, 1, v6);
  }
  *(void *)&v20[v10[7]] = *(void *)&v21[v10[7]];
  uint64_t v32 = v34[7];
  *(void *)&a1[v34[6]] = *(void *)&a2[v34[6]];
  *(void *)&a1[v32] = *(void *)&a2[v32];
  *(void *)&a1[v34[8]] = *(void *)&a2[v34[8]];
  return a1;
}

char *sub_1006545B8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v46 = *(void *)(v6 - 8);
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  int v8 = v7(a1, 1, v6);
  int v9 = v7(a2, 1, v6);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v9)
  {
    (*(void (**)(char *, uint64_t))(v46 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = (int *)type metadata accessor for StreakSummary();
  uint64_t v12 = v11[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v7(&a1[v12], 1, v6);
  int v16 = v7(v14, 1, v6);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v13, v14, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v13, 0, 1, v6);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v46 + 8))(v13, v6);
LABEL_12:
    uint64_t v17 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v13, v14, v6);
LABEL_13:
  uint64_t v18 = v11[6];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  int v21 = v7(&a1[v18], 1, v6);
  int v22 = v7(v20, 1, v6);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v19, v20, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v19, 0, 1, v6);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v46 + 8))(v19, v6);
LABEL_18:
    uint64_t v23 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v19, v20, v6);
LABEL_19:
  *(void *)&a1[v11[7]] = *(void *)&a2[v11[7]];
  uint64_t v24 = a3[5];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  int v27 = v7(&a1[v24], 1, v6);
  int v28 = v7(v26, 1, v6);
  uint64_t v44 = a3;
  uint64_t v45 = a2;
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v25, v26, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v25, 0, 1, v6);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v28)
  {
    (*(void (**)(char *, uint64_t))(v46 + 8))(v25, v6);
LABEL_24:
    uint64_t v29 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v25, v26, v6);
LABEL_25:
  uint64_t v30 = v11[5];
  uint64_t v31 = &v25[v30];
  uint64_t v32 = &v26[v30];
  int v33 = v7(&v25[v30], 1, v6);
  int v34 = v7(v32, 1, v6);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v31, v32, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v31, 0, 1, v6);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v34)
  {
    (*(void (**)(char *, uint64_t))(v46 + 8))(v31, v6);
LABEL_30:
    uint64_t v35 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v31, v32, v6);
LABEL_31:
  uint64_t v36 = v11[6];
  id v37 = &v25[v36];
  uint64_t v38 = &v26[v36];
  int v39 = v7(&v25[v36], 1, v6);
  int v40 = v7(v38, 1, v6);
  if (!v39)
  {
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v37, v38, v6);
      goto LABEL_37;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v37, v6);
    goto LABEL_36;
  }
  if (v40)
  {
LABEL_36:
    uint64_t v41 = sub_100010218((uint64_t *)&unk_1007FC470);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v37, v38, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v37, 0, 1, v6);
LABEL_37:
  *(void *)&v25[v11[7]] = *(void *)&v26[v11[7]];
  uint64_t v42 = v44[7];
  *(void *)&a1[v44[6]] = *(void *)&v45[v44[6]];
  *(void *)&a1[v42] = *(void *)&v45[v42];
  *(void *)&a1[v44[8]] = *(void *)&v45[v44[8]];
  return a1;
}

uint64_t sub_100654CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100654CC8);
}

uint64_t sub_100654CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StreakSummary();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100654D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100654D48);
}

uint64_t sub_100654D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StreakSummary();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100654DB8()
{
  uint64_t result = type metadata accessor for StreakSummary();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100654E58()
{
  unint64_t result = qword_100815240;
  if (!qword_100815240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815240);
  }
  return result;
}

uint64_t sub_100654EAC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100654F14(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *_s8SnapshotV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x100655028);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *_s8SnapshotV10CodingKeysOMa()
{
  return &_s8SnapshotV10CodingKeysON;
}

unint64_t sub_100655064()
{
  unint64_t result = qword_100815260;
  if (!qword_100815260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815260);
  }
  return result;
}

unint64_t sub_1006550BC()
{
  unint64_t result = qword_100815268;
  if (!qword_100815268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815268);
  }
  return result;
}

unint64_t sub_100655114()
{
  unint64_t result = qword_100815270;
  if (!qword_100815270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815270);
  }
  return result;
}

uint64_t sub_100655168(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6144657669746361 && a2 == 0xEA00000000007379;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6557657669746361 && a2 == 0xEB00000000736B65 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E756F4364726F77 && a2 == 0xE900000000000074 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E756F43796164 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x5473656972746E65 && a2 == 0xEF72616559736968)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1006553DC(void *a1)
{
  if (!a1) {
    return 0;
  }
  type metadata accessor for JournalEntryCollectionViewController();
  uint64_t v2 = swift_dynamicCastClass();
  if (!v2)
  {
    id v5 = a1;
    id v6 = [v5 childViewControllers];
    sub_10001B284(0, (unint64_t *)&qword_1008068F0);
    unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v7 >> 62) {
      goto LABEL_18;
    }
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v8)
    {
      uint64_t v9 = 4;
      while (1)
      {
        id v10 = (v7 & 0xC000000000000001) != 0
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
            : *(id *)(v7 + 8 * v9);
        uint64_t v11 = v10;
        uint64_t v12 = v9 - 3;
        if (__OFADD__(v9 - 4, 1)) {
          break;
        }
        uint64_t v3 = sub_1006553DC(v10);

        if (v3)
        {

          swift_bridgeObjectRelease();
          return v3;
        }
        ++v9;
        if (v12 == v8) {
          goto LABEL_13;
        }
      }
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
LABEL_13:

    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v3 = v2;
  id v4 = a1;
  return v3;
}

BOOL sub_100655760(void *a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v53 = *(void *)(v6 - 8);
  uint64_t v54 = v6;
  __chkstk_darwin(v6);
  uint64_t v51 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for DispatchQoS();
  uint64_t v50 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v49 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1007F7D00 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = sub_100026A54(v9, (uint64_t)qword_10083EB00);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v55 = v10;
  if (v13)
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_10011EA98((uint64_t)a1, a2, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Running test: %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v48 = a1;
  id v15 = [self sharedApplication];
  sub_10031F2EC();
  id v17 = v16;
  while (v17)
  {
    id v19 = [v17 presentedViewController];
    if (v19)
    {
      uint64_t v20 = v17;
      do
      {
        int v21 = v20;
        uint64_t v20 = v19;

        id v19 = [v20 presentedViewController];
      }
      while (v19);
      id v17 = v20;
    }
    else
    {
      uint64_t v20 = v17;
    }
    self;
    int v22 = (void *)swift_dynamicCastObjCClass();
    if (v22)
    {
      uint64_t v18 = &selRef_topViewController;
    }
    else
    {
      self;
      int v22 = (void *)swift_dynamicCastObjCClass();
      if (!v22) {
        break;
      }
      uint64_t v18 = &selRef_selectedViewController;
    }
    id v17 = [v22 *v18];
  }
  uint64_t v23 = (char *)sub_1006553DC(v17);

  if (!v23) {
    return 0;
  }
  uint64_t v24 = *(void **)&v23[OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_entryCollectionView];
  BOOL v25 = v24 != 0;
  if (v24)
  {
    uint64_t v47 = v23;
    id v26 = v24;
    int v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Will trigger test run", v29, 2u);
      swift_slowDealloc();
    }

    id v30 = objc_allocWithZone((Class)RPTScrollViewTestParameters);
    swift_bridgeObjectRetain();
    uint64_t v31 = v26;
    NSString v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v33 = [v30 initWithTestName:v32 scrollView:v31 completionHandler:0];

    sub_10001B284(0, (unint64_t *)&qword_100805AB0);
    int v34 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v33;
    *(void *)(v35 + 24) = v3;
    aBlock[4] = (uint64_t)sub_100656050;
    aBlock[5] = v35;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10017D530;
    aBlock[3] = (uint64_t)&unk_1007B9680;
    uint64_t v36 = _Block_copy(aBlock);
    id v48 = v33;
    id v37 = v3;
    swift_release();
    uint64_t v38 = v49;
    static DispatchQoS.unspecified.getter();
    aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_10004F6A0();
    sub_100010218(&qword_100804DB0);
    sub_10001B1BC();
    int v39 = v51;
    uint64_t v40 = v54;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v36);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v39, v40);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v52);
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Triggered test run", v43, 2u);
      swift_slowDealloc();
      uint64_t v44 = v31;
    }
    else
    {
      uint64_t v44 = v41;
      uint64_t v41 = v31;
    }
    uint64_t v45 = v47;
  }
  return v25;
}

void sub_100655E34()
{
  if (qword_1007F7D00 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100026A54(v0, (uint64_t)qword_10083EB00);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Failed running test with error: %@", v2, 0xCu);
    sub_100010218((uint64_t *)&unk_1007FC430);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_100656010()
{
  return swift_deallocObject();
}

id sub_100656050()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = self;

  return [v3 runTestWithParameters:v1 delegate:v2];
}

uint64_t sub_10065609C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1006560AC()
{
  return swift_release();
}

uint64_t sub_1006560B4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v61 = a5;
  uint64_t v56 = type metadata accessor for NavigationBarItem.TitleDisplayMode();
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v51 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Locale();
  __chkstk_darwin(v10 - 8);
  uint64_t v44 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v12 - 8);
  uint64_t v49 = sub_100010218(&qword_1008153A0);
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v46 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100010218(&qword_1008153A8);
  uint64_t v55 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v53 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100010218(&qword_1008153B0);
  uint64_t v50 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  id v48 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = a3;
  uint64_t v60 = (char *)a4;
  char v70 = a3;
  unint64_t v71 = a4;
  swift_bridgeObjectRetain();
  sub_100010218(&qword_100813CF0);
  State.projectedValue.getter();
  int v16 = (void *)v62;
  unint64_t v17 = (unint64_t)v63;
  unint64_t v18 = v64;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v20 = static SafeAreaRegions.all.getter();
  char v21 = static Edge.Set.all.getter();
  uint64_t v58 = (char *)a2;
  uint64_t v62 = a2;
  uint64_t v63 = v16;
  unint64_t v64 = v17;
  unint64_t v65 = v18;
  uint64_t v66 = KeyPath;
  char v67 = 0;
  uint64_t v68 = v20;
  char v69 = v21;
  char v70 = 0;
  unint64_t v71 = 0xE000000000000000;
  sub_10001DFB8(a1);
  int v22 = (char *)a1;
  uint64_t v24 = sub_10065C35C(a1);
  if (!v23)
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    uint64_t v24 = String.init(localized:table:bundle:locale:comment:)();
  }
  uint64_t v25 = v24;
  String.append(_:)(*(Swift::String *)(&v23 - 1));
  swift_bridgeObjectRelease();
  uint64_t v45 = v22;
  sub_10001DFA8(v22);
  uint64_t v26 = sub_100010218(&qword_1008153B8);
  unint64_t v27 = sub_1006585E0();
  unint64_t v28 = sub_100014344();
  uint64_t v29 = v46;
  View.navigationTitle<A>(_:)();
  swift_release();
  swift_release();
  id v30 = v58;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v31 = v54;
  NSString v32 = v51;
  uint64_t v33 = v56;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v51, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v56);
  uint64_t v62 = v26;
  uint64_t v63 = &type metadata for String;
  unint64_t v64 = v27;
  unint64_t v65 = v28;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v35 = v53;
  uint64_t v36 = v49;
  View.navigationBarTitleDisplayMode(_:)();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  uint64_t v37 = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v29, v36);
  __chkstk_darwin(v37);
  *(&v44 - 4) = v45;
  *(&v44 - 3) = v30;
  uint64_t v38 = v60;
  *(&v44 - 2) = v59;
  *(&v44 - 1) = v38;
  sub_100010218(&qword_1008153D0);
  uint64_t v62 = v36;
  uint64_t v63 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v39 = sub_100014440(&qword_1008153D8);
  uint64_t v40 = sub_100014488(&qword_1008153E0, &qword_1008153D8);
  uint64_t v62 = v39;
  uint64_t v63 = (void *)v40;
  swift_getOpaqueTypeConformance2();
  uint64_t v41 = v48;
  uint64_t v42 = v57;
  View.toolbar<A>(content:)();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v42);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v50 + 32))(v61, v41, v52);
}

uint64_t sub_100656750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ToolbarItemPlacement();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100010218(&qword_1008153D8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v14[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static ToolbarItemPlacement.principal.getter();
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_100010218(&qword_1008153E8);
  sub_1006586C8();
  ToolbarItem<>.init(placement:content:)();
  sub_100014488(&qword_1008153E0, &qword_1008153D8);
  static ToolbarContentBuilder.buildBlock<A>(_:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10065690C@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v5 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010218(&qword_1008153F8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010218(&qword_100815408);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v11 = static HorizontalAlignment.center.getter();
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  uint64_t v16 = sub_100010218(&qword_100815410);
  sub_100656BB0(a1, v22, v23, (uint64_t)&v11[*(int *)(v16 + 44)]);
  static AccessibilityChildBehavior.combine.getter();
  sub_100014488(&qword_100815400, &qword_1008153F8);
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10001457C((uint64_t)v11, &qword_1008153F8);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v18 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v24, v15, v12);
  uint64_t v19 = v18 + *(int *)(sub_100010218(&qword_1008153E8) + 36);
  *(void *)uint64_t v19 = KeyPath;
  *(void *)(v19 + 8) = 1;
  *(unsigned char *)(v19 + 16) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_100656BB0@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v70 = a4;
  uint64_t v7 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v7 - 8);
  v63[1] = (char *)v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AccessibilityTraits();
  uint64_t v65 = *(void *)(v9 - 8);
  uint64_t v66 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Locale();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v13 - 8);
  uint64_t v14 = sub_100010218(&qword_100802DC8);
  __chkstk_darwin(v14 - 8);
  uint64_t v69 = (uint64_t)v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v64 = (char *)v63 - v17;
  __chkstk_darwin(v18);
  uint64_t v71 = (uint64_t)v63 - v19;
  uint64_t v73 = 0;
  uint64_t v74 = 0xE000000000000000;
  sub_10001DFB8(a1);
  uint64_t v21 = sub_10065C35C(a1);
  uint64_t v67 = a2;
  uint64_t v68 = a3;
  if (!v20)
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    uint64_t v21 = String.init(localized:table:bundle:locale:comment:)();
  }
  uint64_t v22 = v21;
  String.append(_:)(*(Swift::String *)(&v20 - 1));
  swift_bridgeObjectRelease();
  sub_10001DFA8(a1);
  sub_100014344();
  uint64_t v23 = Text.init<A>(_:)();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  static Font.headline.getter();
  uint64_t v28 = Text.font(_:)();
  uint64_t v30 = v29;
  char v32 = v31;
  uint64_t v34 = v33;
  swift_release();
  sub_10002B8D0(v23, v25, v27);
  swift_bridgeObjectRelease();
  uint64_t v73 = v28;
  uint64_t v74 = v30;
  char v75 = v32 & 1;
  uint64_t v76 = v34;
  static AccessibilityTraits.isHeader.getter();
  uint64_t v35 = (uint64_t)v64;
  View.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v11, v66);
  sub_10002B8D0(v73, v74, v75);
  swift_bridgeObjectRelease();
  sub_1001E323C(v35, v71);
  uint64_t v37 = v67;
  uint64_t v36 = v68;
  uint64_t v73 = v67;
  uint64_t v74 = v68;
  sub_100010218(&qword_100813CF0);
  State.wrappedValue.getter();
  if (v72)
  {
    LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v38._countAndFlagsBits = 0;
    v38._object = (void *)0xE000000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v38);
    uint64_t v73 = v37;
    uint64_t v74 = v36;
    State.wrappedValue.getter();
    LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
    v39._countAndFlagsBits = 0x73656972746E4520;
    v39._object = (void *)0xE800000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v39);
    LocalizedStringKey.init(stringInterpolation:)();
    uint64_t v40 = Text.init(_:tableName:bundle:comment:)();
    uint64_t v42 = v41;
    char v44 = v43 & 1;
    static Font.footnote.getter();
    uint64_t v45 = Text.font(_:)();
    uint64_t v47 = v46;
    char v49 = v48;
    swift_release();
    char v50 = v49 & 1;
    sub_10002B8D0(v40, v42, v44);
    swift_bridgeObjectRelease();
    LODWORD(v73) = static HierarchicalShapeStyle.secondary.getter();
    uint64_t v51 = Text.foregroundStyle<A>(_:)();
    uint64_t v53 = v52;
    uint64_t v55 = v54;
    uint64_t v57 = v56 & 1;
    sub_10002B8D0(v45, v47, v50);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v51 = 0;
    uint64_t v53 = 0;
    uint64_t v57 = 0;
    uint64_t v55 = 0;
  }
  uint64_t v58 = v71;
  uint64_t v59 = v69;
  sub_1006587D0(v71, v69);
  uint64_t v60 = v70;
  sub_1006587D0(v59, v70);
  uint64_t v61 = (uint64_t *)(v60 + *(int *)(sub_100010218(&qword_100815418) + 48));
  uint64_t *v61 = v51;
  v61[1] = v53;
  v61[2] = v57;
  v61[3] = v55;
  sub_1001D7E98(v51, v53, v57, v55);
  sub_10001457C(v58, &qword_100802DC8);
  sub_1001D7EDC(v51, v53, v57, v55);
  return sub_10001457C(v59, &qword_100802DC8);
}

uint64_t sub_100657184@<X0>(uint64_t a1@<X8>)
{
  return sub_1006560B4(*(void **)v1, *(void *)(v1 + 8), *(char **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_100657190(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1 + 32);
  char v5 = *(unsigned char *)(v2 + 40);
  j__swift_retain();
  sub_100666444(v4, v5);
  j__swift_release();
  swift_weakAssign();
  swift_release();
  *(void *)(sub_10065743C() + OBJC_IVAR____TtCC7Journal10Journaling18EntryListViewModel_assetIDs) = *(void *)v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_100035CFC();
  swift_release();
  sub_100010218(&qword_100815388);
  Binding.projectedValue.getter();
  uint64_t v6 = (void *)(a1
                + OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController_entryCount);
  *uint64_t v6 = v8;
  v6[1] = v9;
  v6[2] = v10;
  swift_release();
  return swift_release();
}

char *sub_1006572AC()
{
  type metadata accessor for InsightsPlacesDetailView.ContentViewController();
  uint64_t v0 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *(void *)&v0[OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_delegate + 8] = &off_1007B96A8;
  swift_unknownObjectWeakAssign();
  return v0;
}

uint64_t sub_100657310(uint64_t a1)
{
  return sub_100657190(a1);
}

uint64_t sub_10065734C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100658C28();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1006573B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100658C28();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100657414()
{
}

uint64_t sub_10065743C()
{
  uint64_t v1 = OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController____lazy_storage___model;
  if (*(void *)(v0
                 + OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController____lazy_storage___model))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController____lazy_storage___model);
  }
  else
  {
    uint64_t v3 = v0;
    _s18EntryListViewModelCMa();
    swift_allocObject();
    uint64_t v2 = sub_100036004();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_10065752C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
    type metadata accessor for MainActor();
    swift_retain();
    swift_retain();
    uint64_t v10 = static MainActor.shared.getter();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    *(void *)(v11 + 24) = &protocol witness table for MainActor;
    *(void *)(v11 + 32) = v8;
    *(void *)(v11 + 40) = a1;
    *(unsigned char *)(v11 + 48) = a2 & 1;
    sub_100328A8C((uint64_t)v6, (uint64_t)&unk_100815398, v11);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100657684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 88) = a6;
  *(void *)(v6 + 24) = a4;
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 40) = type metadata accessor for CanvasStartingState();
  *(void *)(v6 + 48) = swift_task_alloc();
  type metadata accessor for MainActor();
  *(void *)(v6 + 56) = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v6 + 64) = v8;
  *(void *)(v6 + 72) = v7;
  return _swift_task_switch(sub_100657754, v8, v7);
}

uint64_t sub_100657754()
{
  uint64_t v1 = *(void *)(v0 + 48);
  int v2 = *(unsigned __int8 *)(v0 + 88);
  uint64_t v3 = type metadata accessor for WidgetFamily();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 1, v3);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  if (v2 == 1)
  {
    uint64_t v6 = (void *)(v4 + *(int *)(v5 + 20));
    *uint64_t v6 = 0;
    v6[1] = 0;
    uint64_t v7 = v4 + *(int *)(v5 + 24);
    uint64_t v8 = type metadata accessor for Date();
    char v9 = 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  }
  else
  {
    uint64_t v10 = v4 + *(int *)(v5 + 24);
    uint64_t v11 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
    uint64_t v12 = (void *)(v4 + *(int *)(v5 + 20));
    *uint64_t v12 = 0;
    v12[1] = 0;
    char v9 = -2;
  }
  uint64_t v13 = *(void *)(v0 + 32);
  *(unsigned char *)(*(void *)(v0 + 48) + *(int *)(*(void *)(v0 + 40) + 28)) = v9;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_10065790C;
  uint64_t v15 = *(void *)(v0 + 48);
  return sub_100059E88(v13, v15);
}

uint64_t sub_10065790C(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 48);
  *(unsigned char *)(*v1 + 89) = a1;
  swift_task_dealloc();
  sub_1006584B8(v3, (uint64_t (*)(void))type metadata accessor for CanvasStartingState);
  uint64_t v4 = *(void *)(v2 + 72);
  uint64_t v5 = *(void *)(v2 + 64);
  return _swift_task_switch(sub_10025E2C4, v5, v4);
}

uint64_t sub_100657A6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UIBackgroundConfiguration();
  __chkstk_darwin(v2 - 8);
  type metadata accessor for UIContentUnavailableConfiguration();
  uint64_t v3 = swift_allocBox();
  static UIContentUnavailableConfiguration.empty()();
  if (qword_1007F7910 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  UIContentUnavailableConfiguration.text.setter();
  if (qword_1007F72D8 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10083D8A0;
  uint64_t v5 = (void (*)(void *, void))UIContentUnavailableConfiguration.directionalLayoutMargins.modify();
  *(void *)(v6 + 8) = v4;
  v5(aBlock, 0);
  uint64_t v7 = (void (*)(void *, void))UIContentUnavailableConfiguration.directionalLayoutMargins.modify();
  *(void *)(v8 + 24) = v4;
  v7(aBlock, 0);
  static UIBackgroundConfiguration.clear()();
  UIContentUnavailableConfiguration.background.setter();
  char v9 = self;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  *(void *)(v10 + 24) = v3;
  aBlock[4] = sub_100062E4C;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10017D530;
  aBlock[3] = &unk_1007B9720;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v1;
  swift_retain();
  swift_release();
  [v9 animateWithDuration:0 delay:v11 options:0 animations:0.44 completion:0.0];
  _Block_release(v11);
  return swift_release();
}

uint64_t sub_100657CC8()
{
  sub_10065743C();
  uint64_t v0 = sub_100035E94();
  swift_release();
  sub_100010218(&qword_100815388);
  uint64_t v1 = Binding.wrappedValue.getter();
  if (v3 && !v0) {
    uint64_t v1 = static Animation.default.getter();
  }
  __chkstk_darwin(v1);
  withAnimation<A>(_:_:)();
  return swift_release();
}

uint64_t sub_100657DB8()
{
  return Binding.wrappedValue.setter();
}

id sub_100657E20(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController____lazy_storage___model] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController_entryCount];
  uint64_t v13 = 0;
  uint64_t v7 = v3;
  static Binding.constant(_:)();
  uint64_t v8 = v15;
  *(_OWORD *)uint64_t v6 = v14;
  *((void *)v6 + 2) = v8;

  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for InsightsPlacesDetailView.ContentViewController();
  id v10 = [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_100657F64(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController____lazy_storage___model] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController_entryCount];
  uint64_t v9 = 0;
  uint64_t v4 = v1;
  static Binding.constant(_:)();
  uint64_t v5 = v11;
  *(_OWORD *)uint64_t v3 = v10;
  *((void *)v3 + 2) = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for InsightsPlacesDetailView.ContentViewController();
  [super initWithCoder:a1];

  return v6;
}

uint64_t sub_100658034()
{
  swift_release();
  swift_release();

  return swift_release();
}

id sub_100658088()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InsightsPlacesDetailView.ContentViewController();
  return [super dealloc];
}

uint64_t sub_100658118()
{
  return type metadata accessor for InsightsPlacesDetailView.ContentViewController();
}

uint64_t type metadata accessor for InsightsPlacesDetailView.ContentViewController()
{
  uint64_t result = qword_100815378;
  if (!qword_100815378) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10065816C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_1006581C4()
{
  return sub_100657DB8();
}

uint64_t sub_1006581E0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100658220(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100658230()
{
  return swift_release();
}

uint64_t sub_100658238()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_100658280(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10002C194;
  return sub_100657684(a1, v4, v5, v6, v7, v8);
}

uint64_t destroy for InsightsPlacesDetailView(id *a1)
{
  if ((unint64_t)*a1 >= 4) {

  }
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for InsightsPlacesDetailView(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  if (*(void *)a2 >= 4uLL) {
    id v5 = v4;
  }
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  *a1 = v4;
  a1[1] = v6;
  uint64_t v8 = *(void *)(a2 + 24);
  a1[2] = v7;
  a1[3] = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void **assignWithCopy for InsightsPlacesDetailView(void **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  id v5 = *(void **)a2;
  if ((unint64_t)*a1 >= 4)
  {
    if ((unint64_t)v5 >= 4)
    {
      *a1 = v5;
      id v7 = v5;

      goto LABEL_8;
    }
    sub_1006584B8((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for MKPointOfInterestCategory);
    id v5 = *(void **)a2;
    goto LABEL_6;
  }
  if ((unint64_t)v5 < 4)
  {
LABEL_6:
    *a1 = v5;
    goto LABEL_8;
  }
  *a1 = v5;
  id v6 = v5;
LABEL_8:
  a1[1] = *(void **)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = *(void **)(a2 + 16);
  a1[3] = *(void **)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1006584B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t *assignWithTake for InsightsPlacesDetailView(unint64_t *a1, unint64_t *a2)
{
  uint64_t v4 = (void *)*a1;
  unint64_t v5 = *a2;
  if (*a1 >= 4)
  {
    if (v5 >= 4)
    {
      *a1 = v5;

      goto LABEL_6;
    }
    sub_1006584B8((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for MKPointOfInterestCategory);
  }
  *a1 = v5;
LABEL_6:
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  unint64_t v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for InsightsPlacesDetailView()
{
  return &type metadata for InsightsPlacesDetailView;
}

uint64_t sub_1006585BC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1006585E0()
{
  unint64_t result = qword_1008153C0;
  if (!qword_1008153C0)
  {
    sub_100014440(&qword_1008153B8);
    sub_10065865C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1008153C0);
  }
  return result;
}

unint64_t sub_10065865C()
{
  unint64_t result = qword_1008153C8;
  if (!qword_1008153C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1008153C8);
  }
  return result;
}

uint64_t sub_1006586B0()
{
  return sub_100656750(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1006586BC@<X0>(uint64_t a1@<X8>)
{
  return sub_10065690C(*(void **)(v1 + 16), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

unint64_t sub_1006586C8()
{
  unint64_t result = qword_1008153F0;
  if (!qword_1008153F0)
  {
    sub_100014440(&qword_1008153E8);
    sub_100014440(&qword_1008153F8);
    sub_100014488(&qword_100815400, &qword_1008153F8);
    swift_getOpaqueTypeConformance2();
    sub_100014488(&qword_100800678, &qword_100800680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1008153F0);
  }
  return result;
}

uint64_t sub_1006587D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_100802DC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t destroy for InsightsPlacesDetailView.Representable()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return j__swift_release();
}

uint64_t initializeWithCopy for InsightsPlacesDetailView.Representable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  char v6 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  j__swift_retain();
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return a1;
}

uint64_t assignWithCopy for InsightsPlacesDetailView.Representable(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v2[1];
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = v2[2];
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = v2[3];
  uint64_t v4 = v2[4];
  LOBYTE(v2) = *((unsigned char *)v2 + 40);
  j__swift_retain();
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = (_BYTE)v2;
  j__swift_release();
  return a1;
}

__n128 initializeWithTake for InsightsPlacesDetailView.Representable(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for InsightsPlacesDetailView.Representable(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  char v4 = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v4;
  j__swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InsightsPlacesDetailView.Representable(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InsightsPlacesDetailView.Representable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InsightsPlacesDetailView.Representable()
{
  return &type metadata for InsightsPlacesDetailView.Representable;
}

uint64_t sub_100658AC8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100658C28()
{
  unint64_t result = qword_100815420;
  if (!qword_100815420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815420);
  }
  return result;
}

uint64_t sub_100658C7C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100035380(v0, qword_100815428);
  uint64_t v1 = sub_100026A54(v0, (uint64_t)qword_100815428);
  if (qword_1007F7DF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100026A54(v0, (uint64_t)qword_10083EDD0);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

unint64_t sub_100658D48()
{
  unint64_t result = qword_100815440;
  if (!qword_100815440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815440);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TranscriptPostProcessorError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100658E68);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TranscriptPostProcessorError()
{
  return &type metadata for TranscriptPostProcessorError;
}

uint64_t sub_100658EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  long long v14 = (void *)(a8 + 16);
  swift_beginAccess();
  uint64_t v15 = *(void *)(a8 + 16);
  if (v15 == 1)
  {
    swift_bridgeObjectRetain();
    sub_100010218(&qword_1007F8E80);
    sub_100014488(&qword_1007F8E88, &qword_1007F8E80);
    sub_100014344();
    uint64_t v19 = _NSRange.init<A, B>(_:in:)();
    uint64_t v21 = v20;
    swift_beginAccess();
    *(void *)(a12 + 16) = v19;
    *(void *)(a12 + 24) = v21;
    *(unsigned char *)(a12 + 32) = 0;
    *a7 = 1;
  }
  else if (!v15)
  {
    swift_bridgeObjectRetain();
    sub_100010218(&qword_1007F8E80);
    sub_100014488(&qword_1007F8E88, &qword_1007F8E80);
    sub_100014344();
    uint64_t v16 = _NSRange.init<A, B>(_:in:)();
    uint64_t v18 = v17;
    swift_beginAccess();
    *(void *)(a9 + 16) = v16;
    *(void *)(a9 + 24) = v18;
    *(unsigned char *)(a9 + 32) = 0;
  }
  uint64_t result = swift_beginAccess();
  if (__OFADD__(*v14, 1)) {
    __break(1u);
  }
  else {
    ++*v14;
  }
  return result;
}

uint64_t sub_100659084(uint64_t a1, uint64_t a2, uint64_t a3, char **a4)
{
  String.subscript.getter();
  uint64_t v5 = static String._fromSubstring(_:)();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = *a4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = sub_1002A54A0(0, *((void *)v8 + 2) + 1, 1, v8);
    *a4 = v8;
  }
  unint64_t v11 = *((void *)v8 + 2);
  unint64_t v10 = *((void *)v8 + 3);
  if (v11 >= v10 >> 1)
  {
    uint64_t v8 = sub_1002A54A0((char *)(v10 > 1), v11 + 1, 1, v8);
    *a4 = v8;
  }
  *((void *)v8 + 2) = v11 + 1;
  objc_super v12 = &v8[16 * v11];
  *((void *)v12 + 4) = v5;
  *((void *)v12 + 5) = v7;
  return 1;
}

uint64_t sub_100659154@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  int v3 = v2;
  Swift::String v39 = a2;
  uint64_t v5 = type metadata accessor for CharacterSet();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = a1[1];
  unint64_t v10 = *a1;
  if ((v9 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v9) & 0xF;
  }
  else {
    uint64_t v11 = v10 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v12 = 7;
  if (((v9 >> 60) & ((v10 & 0x800000000000000) == 0)) != 0) {
    uint64_t v12 = 11;
  }
  unint64_t v13 = v12 | (v11 << 16);
  swift_bridgeObjectRetain();
  unint64_t v47 = v13;
  if (!v11) {
    goto LABEL_14;
  }
  unint64_t v13 = v47;
  String.index(before:)();
  String.subscript.getter();
  Swift::String v38 = v8;
  char v14 = Character.isWhitespace.getter();
  int v3 = v2;
  uint64_t v8 = v38;
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0) {
    goto LABEL_14;
  }
  unint64_t v13 = String.index(before:)();
  if (v13 < 0x4000) {
    goto LABEL_14;
  }
  unint64_t v37 = 4 * v11;
  while (1)
  {
    swift_bridgeObjectRetain();
    String.index(before:)();
    String.subscript.getter();
    swift_bridgeObjectRelease();
    char v15 = Character.isWhitespace.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      break;
    }
    unint64_t v13 = String.index(before:)();
    if (v13 < 0x4000) {
      goto LABEL_14;
    }
  }
  if (v37 < v13 >> 14)
  {
    __break(1u);
  }
  else
  {
LABEL_14:
    unint64_t v37 = v10;
    Swift::String v38 = v3;
    unint64_t v40 = v10;
    unint64_t v41 = v9;
    static CharacterSet.whitespacesAndNewlines.getter();
    sub_100014344();
    uint64_t v17 = StringProtocol.trimmingCharacters(in:)();
    unint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v45 = v17;
    unint64_t v46 = v19;
    swift_bridgeObjectRetain();
    sub_1005A86F4(v17, v19);
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    if (!v21 || (char v22 = Character.isPunctuation.getter(), swift_bridgeObjectRelease(), (v22 & 1) == 0))
    {
      v23._countAndFlagsBits = 46;
      v23._object = (void *)0xE100000000000000;
      String.append(_:)(v23);
    }
    uint64_t v24 = v45;
    unint64_t v25 = v46;
    swift_bridgeObjectRetain();
    sub_10055A870(1);
    swift_bridgeObjectRelease();
    Swift::String v26 = Substring.uppercased()();
    swift_bridgeObjectRelease();
    unint64_t v27 = sub_100518238(1uLL, v24, v25);
    unint64_t v29 = v28;
    unint64_t v31 = v30;
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    Swift::String v44 = v26;
    unint64_t v40 = v27;
    unint64_t v41 = v29;
    unint64_t v42 = v31;
    unint64_t v43 = v33;
    sub_10018AC84();
    swift_bridgeObjectRetain();
    String.append<A>(contentsOf:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v40 = v47;
    unint64_t v41 = v13;
    unint64_t v42 = v37;
    unint64_t v43 = v9;
    sub_100010218(&qword_100815468);
    sub_100014488((unint64_t *)&unk_100815470, &qword_100815468);
    String.append<A>(contentsOf:)();
    uint64_t result = swift_bridgeObjectRelease();
    object = v44._object;
    uint64_t v35 = v39;
    uint64_t *v39 = v44._countAndFlagsBits;
    v35[1] = (uint64_t)object;
  }
  return result;
}

uint64_t sub_100659544(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = result;
  uint64_t result = String.count.getter();
  if (__OFSUB__(result, v1))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  String.index(_:offsetBy:limitedBy:)();

  return String.subscript.getter();
}

unint64_t sub_100659610(unint64_t a1)
{
  uint64_t v31 = type metadata accessor for TranscriptViewModelSegment(0);
  __chkstk_darwin(v31);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[0] = 0;
  v30[1] = 0xE000000000000000;
  uint64_t v25 = *(void *)(a1 + 16);
  if (v25)
  {
    v24[0] = v1;
    v24[1] = a1;
    unint64_t v6 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v26 = *(void *)(v3 + 72);
    unint64_t v27 = v6;
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    do
    {
      sub_100140F00(v27 + v26 * v7, (uint64_t)v5);
      if (static Task<>.isCancelled.getter()) {
        goto LABEL_46;
      }
      uint64_t v8 = (uint64_t *)&v5[*(int *)(v31 + 20)];
      uint64_t v9 = *v8;
      a1 = v8[1];
      uint64_t v10 = HIBYTE(a1) & 0xF;
      if ((a1 & 0x2000000000000000) == 0) {
        uint64_t v10 = *v8 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v11 = 7;
      if (((a1 >> 60) & ((v9 & 0x800000000000000) == 0)) != 0) {
        uint64_t v11 = 11;
      }
      if (v10)
      {
        v24[2] = v11 | (v10 << 16);
        while (1)
        {
          unint64_t v12 = String.index(before:)();
          uint64_t v13 = String.subscript.getter();
          uint64_t v15 = HIBYTE(v14) & 0xF;
          if ((v14 & 0x2000000000000000) == 0) {
            uint64_t v15 = v13 & 0xFFFFFFFFFFFFLL;
          }
          if (!v15)
          {
            __break(1u);
            JUMPOUT(0x100659AA4);
          }
          if ((v14 & 0x1000000000000000) != 0)
          {
            int v17 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
          }
          else if ((v14 & 0x2000000000000000) != 0)
          {
            if ((v13 & 0x80) != 0)
            {
              switch(__clz(~(_BYTE)v13))
              {
                case 0x1Au:
                  int v17 = (v13 >> 8) & 0x3F | ((v13 & 0x1F) << 6);
                  break;
                case 0x1Bu:
                  int v17 = (v13 >> 2) & 0xFC0 | ((v13 & 0xF) << 12) | WORD1(v13) & 0x3F;
                  break;
                case 0x1Cu:
                  int v17 = (16 * v13) & 0x3F000 | ((v13 & 0xF) << 18) | (v13 >> 10) & 0xFC0 | BYTE3(v13) & 0x3F;
                  break;
                default:
                  goto LABEL_22;
              }
            }
            else
            {
LABEL_22:
              int v17 = v13;
            }
          }
          else
          {
            if ((v13 & 0x1000000000000000) != 0) {
              uint64_t v16 = (char *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
            }
            else {
              uint64_t v16 = (char *)_StringObject.sharedUTF8.getter();
            }
            int v17 = *v16;
            if (*v16 < 0)
            {
              switch(__clz(v17 ^ 0xFF))
              {
                case 0x1Au:
                  int v17 = v16[1] & 0x3F | ((v17 & 0x1F) << 6);
                  break;
                case 0x1Bu:
                  int v17 = ((v17 & 0xF) << 12) | ((v16[1] & 0x3F) << 6) | v16[2] & 0x3F;
                  break;
                case 0x1Cu:
                  int v17 = ((v17 & 0xF) << 18) | ((v16[1] & 0x3F) << 12) | ((v16[2] & 0x3F) << 6) | v16[3] & 0x3F;
                  break;
                default:
                  break;
              }
            }
          }
          swift_bridgeObjectRelease();
          if ((v17 - 14) <= 0xFFFFFFFB && (v17 - 8232) >= 2 && v17 != 133) {
            break;
          }
          if (v12 < 0x4000) {
            goto LABEL_36;
          }
        }
        if (!((String.index(before:)() ^ v12) >> 14))
        {
          uint64_t v9 = *v8;
          a1 = v8[1];
          goto LABEL_39;
        }
LABEL_36:
        uint64_t v19 = *v8;
        unint64_t v18 = (void *)v8[1];
        swift_bridgeObjectRetain();
        if ((static Task<>.isCancelled.getter() & 1) == 0) {
          goto LABEL_40;
        }
LABEL_45:
        swift_bridgeObjectRelease();
LABEL_46:
        sub_10065C1E0();
        swift_allocError();
        *char v22 = 2;
        swift_willThrow();
        swift_bridgeObjectRelease();
        sub_100140F64((uint64_t)v5);
        swift_bridgeObjectRelease();
        return a1;
      }
LABEL_39:
      uint64_t v28 = v9;
      unint64_t v29 = (void *)a1;
      swift_bridgeObjectRetain();
      a1 = (unint64_t)&v28;
      v20._countAndFlagsBits = 32;
      v20._object = (void *)0xE100000000000000;
      String.append(_:)(v20);
      uint64_t v19 = v28;
      unint64_t v18 = v29;
      if (static Task<>.isCancelled.getter()) {
        goto LABEL_45;
      }
LABEL_40:
      ++v7;
      a1 = (unint64_t)v30;
      v21._countAndFlagsBits = v19;
      v21._object = v18;
      String.append(_:)(v21);
      swift_bridgeObjectRelease();
      sub_100140F64((uint64_t)v5);
    }
    while (v7 != v25);
    swift_bridgeObjectRelease();
    a1 = v30[0];
    if ((static Task<>.isCancelled.getter() & 1) == 0) {
      goto LABEL_44;
    }
  }
  else
  {
    a1 = 0;
    if ((static Task<>.isCancelled.getter() & 1) == 0)
    {
LABEL_44:
      sub_100659544(1);
      swift_bridgeObjectRelease();
      a1 = static String._fromSubstring(_:)();
      swift_bridgeObjectRelease();
    }
  }
  return a1;
}

void *sub_100659AC4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  NSString v6 = String._bridgeToObjectiveC()();
  [a3 setString:v6];

  [a3 setLanguage:a4];
  NLTokenizer.enumerateTokens(in:using:)();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100659BAC(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    String.index(_:offsetBy:limitedBy:)();
    return String.subscript.getter();
  }
  return result;
}

void *sub_100659C48(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    unint64_t v14 = _swiftEmptyArrayStorage;
    sub_100095B64(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = (unint64_t *)(a1 + 40);
    do
    {
      unint64_t v5 = *v4;
      v12[0] = *(v4 - 1);
      v12[1] = v5;
      sub_100659154(v12, v13);
      uint64_t v6 = v13[0];
      uint64_t v7 = v13[1];
      unint64_t v14 = v2;
      unint64_t v9 = v2[2];
      unint64_t v8 = v2[3];
      if (v9 >= v8 >> 1)
      {
        sub_100095B64(v8 > 1, v9 + 1, 1);
        uint64_t v2 = v14;
      }
      v4 += 2;
      v2[2] = v9 + 1;
      uint64_t v10 = &v2[2 * v9];
      v10[4] = v6;
      v10[5] = v7;
      --v1;
    }
    while (v1);
  }
  return v2;
}

NSObject *sub_100659D28(unint64_t a1, uint64_t **a2, char *a3)
{
  v245 = a2;
  uint64_t v244 = sub_100010218((uint64_t *)&qword_100815448);
  __chkstk_darwin(v244);
  v243 = (char *)v225 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)v225 - v8;
  uint64_t v10 = sub_100010218((uint64_t *)&qword_100815450);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v246 = (char *)v225 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v225 - v14;
  uint64_t v251 = type metadata accessor for CharacterSet();
  uint64_t v248 = *(void *)(v251 - 8);
  __chkstk_darwin(v251);
  v250 = (char *)v225 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v253 = type metadata accessor for TranscriptViewModelSegment(0);
  uint64_t v17 = *(void *)(v253 - 8);
  __chkstk_darwin(v253);
  __chkstk_darwin(v18);
  __chkstk_darwin(v19);
  Swift::String v23 = (char *)v225 - v22;
  unint64_t v24 = a1;
  int64_t v25 = *(void *)(a1 + 16);
  if (!v25)
  {
    if (qword_1007F7F00 != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    sub_100026A54(v40, (uint64_t)qword_100815428);
    unint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "No segments to process", v43, 2u);
      swift_slowDealloc();
    }

    return _swiftEmptyArrayStorage;
  }
  v240 = v9;
  uint64_t v231 = v21;
  uint64_t v234 = v20;
  v235 = v15;
  uint64_t v236 = v11;
  uint64_t v239 = v10;
  uint64_t v247 = v3;
  v242 = a3;
  unint64_t v26 = v24;
  v254._uint64_t countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
  sub_100095B64(0, v25, 0);
  unint64_t v241 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v249 = v26;
  uint64_t v27 = v26 + v241;
  uint64_t v252 = *(void *)(v17 + 72);
  uint64_t countAndFlagsBits = v254._countAndFlagsBits;
  unint64_t v233 = v26 + v241;
  unint64_t v232 = v25;
  int64_t v29 = v25;
  do
  {
    sub_100140F00(v27, (uint64_t)v23);
    unint64_t v30 = &v23[*(int *)(v253 + 20)];
    uint64_t v31 = *(void *)v30;
    uint64_t v32 = *((void *)v30 + 1);
    swift_bridgeObjectRetain();
    sub_100140F64((uint64_t)v23);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_100095B64(0, *(void *)(countAndFlagsBits + 16) + 1, 1);
      uint64_t countAndFlagsBits = v254._countAndFlagsBits;
    }
    unint64_t v34 = *(void *)(countAndFlagsBits + 16);
    unint64_t v33 = *(void *)(countAndFlagsBits + 24);
    uint64_t v35 = (v34 + 1);
    if (v34 >= v33 >> 1)
    {
      sub_100095B64(v33 > 1, v34 + 1, 1);
      uint64_t countAndFlagsBits = v254._countAndFlagsBits;
    }
    *(void *)(countAndFlagsBits + 16) = v35;
    uint64_t v36 = countAndFlagsBits + 16 * v34;
    *(void *)(v36 + 32) = v31;
    *(void *)(v36 + 40) = v32;
    v27 += v252;
    --v29;
  }
  while (v29);
  uint64_t v37 = v247;
  unint64_t v38 = sub_100659610(v249);
  if (v37) {
    goto LABEL_9;
  }
  Swift::String v44 = (uint64_t *)v38;
  uint64_t v45 = v39;
  if (static Task<>.isCancelled.getter())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1007F7F00 != -1) {
      swift_once();
    }
    uint64_t v46 = type metadata accessor for Logger();
    sub_100026A54(v46, (uint64_t)qword_100815428);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v35, v47))
    {
      char v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v47, "Cancelled after step 1. Aborting.", v48, 2u);
      swift_slowDealloc();
    }

    sub_10065C1E0();
    swift_allocError();
    char v50 = 2;
LABEL_66:
    *char v49 = v50;
    swift_willThrow();
    return v35;
  }
  id v51 = v242;
  if (!v242)
  {
LABEL_61:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1007F7F00 != -1) {
      swift_once();
    }
    uint64_t v104 = type metadata accessor for Logger();
    sub_100026A54(v104, (uint64_t)qword_100815428);
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v105 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v35, v105))
    {
      uint64_t v106 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v106 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v105, "Language is not English, skipping.", v106, 2u);
      swift_slowDealloc();
    }

    sub_10065C1E0();
    swift_allocError();
    char v50 = 1;
    goto LABEL_66;
  }
  uint64_t v247 = 0;
  uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v54 = v53;
  if (v52 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v54 == v55)
  {
    id v56 = v51;
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v57 = _stringCompareWithSmolCheck(_:_:expecting:)();
  id v58 = v51;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v57 & 1) == 0)
  {

    goto LABEL_61;
  }
LABEL_26:
  uint64_t v59 = String.count.getter();
  uint64_t v60 = (uint64_t **)sub_100659AC4((uint64_t)v44, v45, v245, (uint64_t)v51);
  swift_bridgeObjectRelease();
  unint64_t v61 = (unint64_t)v60[2];
  uint64_t v62 = (char *)_swiftEmptyArrayStorage;
  if (v61)
  {
    unint64_t v249 = v59;
    uint64_t v63 = (void (**)(char *, uint64_t))(v248 + 8);
    swift_bridgeObjectRetain();
    v245 = v60;
    unint64_t v64 = v60 + 5;
    do
    {
      Swift::String v44 = *v64;
      v254._uint64_t countAndFlagsBits = (uint64_t)*(v64 - 1);
      v254._object = v44;
      swift_bridgeObjectRetain();
      uint64_t v65 = v250;
      static CharacterSet.whitespacesAndNewlines.getter();
      sub_100014344();
      uint64_t v66 = StringProtocol.trimmingCharacters(in:)();
      uint64_t v68 = v67;
      (*v63)(v65, v251);
      v254._uint64_t countAndFlagsBits = v66;
      v254._object = v68;
      swift_bridgeObjectRetain();
      v69._uint64_t countAndFlagsBits = 2570;
      v69._object = (void *)0xE200000000000000;
      String.append(_:)(v69);
      swift_bridgeObjectRelease();
      uint64_t v70 = v254._countAndFlagsBits;
      object = v254._object;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        uint64_t v72 = v62;
      }
      else {
        uint64_t v72 = sub_1002A54A0(0, *((void *)v62 + 2) + 1, 1, v62);
      }
      unint64_t v74 = *((void *)v72 + 2);
      unint64_t v73 = *((void *)v72 + 3);
      uint64_t v45 = v74 + 1;
      if (v74 >= v73 >> 1) {
        uint64_t v72 = sub_1002A54A0((char *)(v73 > 1), v74 + 1, 1, v72);
      }
      v64 += 2;
      *((void *)v72 + 2) = v45;
      char v75 = &v72[16 * v74];
      *((void *)v75 + 4) = v70;
      *((void *)v75 + 5) = object;
      uint64_t v62 = v72;
      swift_bridgeObjectRelease();
      --v61;
    }
    while (v61);
    uint64_t v60 = v245;
    swift_bridgeObjectRelease();
    uint64_t v59 = v249;
  }
  swift_bridgeObjectRelease();
  unint64_t v76 = *((void *)v62 + 2);
  if (v76)
  {
    unint64_t v61 = v76 - 1;
    swift_bridgeObjectRetain();
    sub_100659BAC(v59);
    Swift::String v44 = v77;
    swift_bridgeObjectRelease();
    uint64_t v60 = (uint64_t **)static String._fromSubstring(_:)();
    uint64_t v45 = v78;
    swift_bridgeObjectRelease();
    v228 = v62;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_37;
    }
  }
  else
  {
    __break(1u);
  }
  v228 = sub_1000EFF88((uint64_t)v228);
LABEL_37:
  uint64_t v79 = v228;
  if (v76 > *((void *)v228 + 2))
  {
    __break(1u);
LABEL_160:
    __break(1u);
LABEL_161:
    __break(1u);
LABEL_162:
    __break(1u);
    goto LABEL_163;
  }
  v230 = (void (**)(void, void))(v228 + 32);
  uint64_t v80 = &v228[16 * v61 + 32];
  *(void *)uint64_t v80 = v60;
  *((void *)v80 + 1) = v45;
  uint64_t v81 = v79;
  swift_bridgeObjectRelease();
  if (static Task<>.isCancelled.getter())
  {
    swift_bridgeObjectRelease();
    Swift::String v44 = (uint64_t *)v242;
    if (qword_1007F7F00 == -1)
    {
LABEL_40:
      uint64_t v82 = type metadata accessor for Logger();
      sub_100026A54(v82, (uint64_t)qword_100815428);
      uint64_t v35 = Logger.logObject.getter();
      os_log_type_t v83 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v35, v83))
      {
        uint64_t v84 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v84 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, v83, "Cancelled after step 2. Aborting.", v84, 2u);
        swift_slowDealloc();
      }

      sub_10065C1E0();
      swift_allocError();
      *uint64_t v85 = 2;
      swift_willThrow();
      swift_bridgeObjectRelease();

      return v35;
    }
LABEL_163:
    swift_once();
    goto LABEL_40;
  }
  v258 = _swiftEmptyArrayStorage;
  v229 = (uint64_t **)*((void *)v81 + 2);
  if (v229)
  {
    uint64_t v86 = (void (**)(char *, uint64_t))(v248 + 8);
    swift_bridgeObjectRetain_n();
    unint64_t v249 = sub_100014344();
    uint64_t v87 = 0;
    do
    {
      uint64_t v89 = v230[2 * (void)v87 + 1];
      v254._uint64_t countAndFlagsBits = (uint64_t)v230[2 * (void)v87];
      v254._object = v89;
      uint64_t v256 = 8238;
      unint64_t v257 = 0xE200000000000000;
      swift_bridgeObjectRetain();
      uint64_t v90 = StringProtocol.components<A>(separatedBy:)();
      uint64_t v256 = (uint64_t)_swiftEmptyArrayStorage;
      uint64_t v91 = *(void *)(v90 + 16);
      if (v91)
      {
        uint64_t v238 = (uint64_t)v89;
        v245 = v87;
        v237 = (void (*)(void, void, void))v90;
        uint64_t v92 = (void **)(v90 + 40);
        do
        {
          uint64_t v93 = (uint64_t)*(v92 - 1);
          uint64_t v94 = *v92;
          v254._uint64_t countAndFlagsBits = v93;
          v254._object = v94;
          swift_bridgeObjectRetain();
          double v95 = v250;
          static CharacterSet.whitespaces.getter();
          uint64_t v96 = StringProtocol.trimmingCharacters(in:)();
          unint64_t v98 = v97;
          (*v86)(v95, v251);
          swift_bridgeObjectRelease();
          uint64_t v99 = HIBYTE(v98) & 0xF;
          if ((v98 & 0x2000000000000000) == 0) {
            uint64_t v99 = v96 & 0xFFFFFFFFFFFFLL;
          }
          if (v99)
          {
            uint64_t v100 = v256;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_100095B64(0, *(void *)(v100 + 16) + 1, 1);
              uint64_t v100 = v256;
            }
            unint64_t v102 = *(void *)(v100 + 16);
            unint64_t v101 = *(void *)(v100 + 24);
            if (v102 >= v101 >> 1)
            {
              sub_100095B64(v101 > 1, v102 + 1, 1);
              uint64_t v100 = v256;
            }
            *(void *)(v100 + 16) = v102 + 1;
            unint64_t v103 = v100 + 16 * v102;
            *(void *)(v103 + 32) = v93;
            *(void *)(v103 + 40) = v94;
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          v92 += 2;
          --v91;
        }
        while (v91);
        swift_bridgeObjectRelease();
        uint64_t v88 = (void *)v256;
        uint64_t v87 = v245;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v88 = _swiftEmptyArrayStorage;
      }
      uint64_t v87 = (uint64_t **)((char *)v87 + 1);
      sub_1000C8C2C((uint64_t)v88);
      swift_bridgeObjectRelease();
    }
    while (v87 != v229);
    swift_bridgeObjectRelease_n();
  }
  uint64_t v108 = v242;
  uint64_t v109 = swift_bridgeObjectRetain();
  uint64_t v110 = sub_100659C48(v109);
  swift_bridgeObjectRelease();
  if (static Task<>.isCancelled.getter())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1007F7F00 != -1) {
      swift_once();
    }
    uint64_t v111 = type metadata accessor for Logger();
    sub_100026A54(v111, (uint64_t)qword_100815428);
    uint64_t v112 = Logger.logObject.getter();
    os_log_type_t v113 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v112, v113)) {
      goto LABEL_121;
    }
    uint64_t v114 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v114 = 0;
    uint64_t v115 = "Cancelled after step 3. Aborting.";
    goto LABEL_120;
  }
  v254._uint64_t countAndFlagsBits = (uint64_t)v110;
  uint64_t v116 = sub_100010218(&qword_100800A70);
  uint64_t v117 = sub_100014488((unint64_t *)&qword_1007F9100, &qword_100800A70);
  v237 = (void (*)(void, void, void))v116;
  v230 = (void (**)(void, void))v117;
  uint64_t v118 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v120 = v119;
  swift_bridgeObjectRelease();
  v254._uint64_t countAndFlagsBits = v118;
  v254._object = v120;
  uint64_t v121 = v250;
  static CharacterSet.whitespaces.getter();
  unint64_t v249 = sub_100014344();
  uint64_t v122 = StringProtocol.components(separatedBy:)();
  uint64_t v123 = *(uint64_t ***)(v248 + 8);
  v248 += 8;
  v245 = v123;
  ((void (*)(char *, uint64_t))v123)(v121, v251);
  swift_bridgeObjectRelease();
  uint64_t v124 = *(void *)(v122 + 16);
  v125 = _swiftEmptyArrayStorage;
  uint64_t v238 = v122;
  if (v124)
  {
    v126 = (uint64_t *)(v122 + 40);
    do
    {
      uint64_t v131 = *(v126 - 1);
      uint64_t v130 = *v126;
      uint64_t v132 = HIBYTE(*v126) & 0xF;
      if ((*v126 & 0x2000000000000000) == 0) {
        uint64_t v132 = v131 & 0xFFFFFFFFFFFFLL;
      }
      if (v132)
      {
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v254._uint64_t countAndFlagsBits = (uint64_t)v125;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100095B64(0, v125[2] + 1, 1);
          v125 = (void *)v254._countAndFlagsBits;
        }
        unint64_t v128 = v125[2];
        unint64_t v127 = v125[3];
        if (v128 >= v127 >> 1)
        {
          sub_100095B64(v127 > 1, v128 + 1, 1);
          v125 = (void *)v254._countAndFlagsBits;
        }
        v125[2] = v128 + 1;
        uint64_t v129 = &v125[2 * v128];
        v129[4] = v131;
        v129[5] = v130;
      }
      v126 += 2;
      --v124;
    }
    while (v124);
  }
  swift_bridgeObjectRelease();
  uint64_t v256 = (uint64_t)v125;
  int64_t v134 = v125[2];
  int64_t v135 = *(void *)(countAndFlagsBits + 16);
  if (v134 == v135)
  {
    swift_bridgeObjectRelease();
    goto LABEL_87;
  }
  uint64_t v150 = qword_1007F7F00;
  swift_retain();
  if (v150 != -1) {
    swift_once();
  }
  uint64_t v151 = type metadata accessor for Logger();
  v225[1] = sub_100026A54(v151, (uint64_t)qword_100815428);
  v152 = Logger.logObject.getter();
  os_log_type_t v153 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v152, v153))
  {
    v154 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v154 = 0;
    _os_log_impl((void *)&_mh_execute_header, v152, v153, "There was a difference in word count between the initial and post-processed strings. Ideally this shouldn't happen, but sometimes it is unavoidable. Trying to reconcile this with a diff.", v154, 2u);
    swift_slowDealloc();
  }

  if (v134)
  {
    v229 = (uint64_t **)v135;
    v255 = _swiftEmptyArrayStorage;
    sub_100095B64(0, v134, 0);
    v155 = v125 + 5;
    do
    {
      Swift::String v254 = String.lowercased()();
      swift_bridgeObjectRetain();
      v156 = v250;
      static CharacterSet.whitespacesAndNewlines.getter();
      uint64_t v238 = StringProtocol.trimmingCharacters(in:)();
      uint64_t v158 = v157;
      ((void (*)(char *, uint64_t))v245)(v156, v251);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v159 = v255;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100095B64(0, v159[2] + 1, 1);
        v159 = v255;
      }
      unint64_t v161 = v159[2];
      unint64_t v160 = v159[3];
      if (v161 >= v160 >> 1)
      {
        sub_100095B64(v160 > 1, v161 + 1, 1);
        v159 = v255;
      }
      v155 += 2;
      v159[2] = v161 + 1;
      v162 = &v159[2 * v161];
      v162[4] = v238;
      v162[5] = v158;
      --v134;
    }
    while (v134);
    swift_release();
    int64_t v135 = (int64_t)v229;
    if (v229) {
      goto LABEL_108;
    }
  }
  else
  {
    swift_release();
    v159 = _swiftEmptyArrayStorage;
    if (v135)
    {
LABEL_108:
      v255 = _swiftEmptyArrayStorage;
      sub_100095B64(0, v135, 0);
      uint64_t v163 = countAndFlagsBits + 40;
      do
      {
        int64_t v164 = v135;
        Swift::String v254 = String.lowercased()();
        swift_bridgeObjectRetain();
        v165 = v250;
        static CharacterSet.whitespacesAndNewlines.getter();
        uint64_t v166 = StringProtocol.trimmingCharacters(in:)();
        uint64_t v168 = v167;
        ((void (*)(char *, uint64_t))v245)(v165, v251);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v169 = v255;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100095B64(0, v169[2] + 1, 1);
          v169 = v255;
        }
        unint64_t v171 = v169[2];
        unint64_t v170 = v169[3];
        if (v171 >= v170 >> 1)
        {
          sub_100095B64(v170 > 1, v171 + 1, 1);
          v169 = v255;
        }
        v163 += 16;
        v169[2] = v171 + 1;
        v172 = &v169[2 * v171];
        v172[4] = v166;
        v172[5] = v168;
        int64_t v135 = v164 - 1;
      }
      while (v164 != 1);
      swift_bridgeObjectRelease();
      goto LABEL_126;
    }
  }
  swift_bridgeObjectRelease();
  v169 = _swiftEmptyArrayStorage;
LABEL_126:
  uint64_t v175 = v239;
  v226 = v169;
  v254._uint64_t countAndFlagsBits = (uint64_t)v169;
  v255 = v159;
  v176 = v235;
  BidirectionalCollection<>.difference<A>(from:)();
  swift_bridgeObjectRelease();
  uint64_t v177 = v236;
  v178 = *(void (**)(void, void, void))(v236 + 16);
  uint64_t v179 = (uint64_t)v243;
  uint64_t v238 = v236 + 16;
  v237 = v178;
  v178(v243, v176, v175);
  uint64_t v180 = sub_100014488((unint64_t *)&qword_100815460, (uint64_t *)&qword_100815450);
  dispatch thunk of Collection.startIndex.getter();
  uint64_t v181 = v244;
  *(void *)(v179 + *(int *)(v244 + 36)) = v254._countAndFlagsBits;
  uint64_t v182 = (uint64_t)v240;
  sub_10002C4EC(v179, (uint64_t)v240, (uint64_t *)&qword_100815448);
  Swift::String v44 = (uint64_t *)(v182 + *(int *)(v181 + 36));
  uint64_t v183 = *v44;
  dispatch thunk of Collection.endIndex.getter();
  if (v183 == v254._countAndFlagsBits)
  {
    uint64_t v184 = (uint64_t)v240;
LABEL_128:
    sub_10001457C(v184, (uint64_t *)&qword_100815448);
    char v185 = static Task<>.isCancelled.getter();
    v186 = (char *)v256;
    if (v185)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v187 = Logger.logObject.getter();
      os_log_type_t v188 = static os_log_type_t.debug.getter();
      BOOL v189 = os_log_type_enabled(v187, v188);
      id v190 = v242;
      uint64_t v191 = v236;
      v192 = v235;
      if (v189)
      {
        v193 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v193 = 0;
        _os_log_impl((void *)&_mh_execute_header, v187, v188, "Cancelled after step 4a. Aborting.", v193, 2u);
        swift_slowDealloc();
      }

      sub_10065C1E0();
      swift_allocError();
      unsigned char *v194 = 2;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v191 + 8))(v192, v175);
      goto LABEL_122;
    }
    int64_t v209 = *(void *)(v256 + 16);
    v210 = _swiftEmptyArrayStorage;
    if (v209)
    {
      v255 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      sub_100095B64(0, v209, 0);
      v246 = v186;
      v211 = v186 + 40;
      do
      {
        Swift::String v254 = String.lowercased()();
        swift_bridgeObjectRetain();
        v212 = v250;
        static CharacterSet.whitespacesAndNewlines.getter();
        uint64_t v213 = StringProtocol.trimmingCharacters(in:)();
        uint64_t v215 = v214;
        ((void (*)(char *, uint64_t))v245)(v212, v251);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v210 = v255;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100095B64(0, v210[2] + 1, 1);
          v210 = v255;
        }
        unint64_t v217 = v210[2];
        unint64_t v216 = v210[3];
        if (v217 >= v216 >> 1)
        {
          sub_100095B64(v216 > 1, v217 + 1, 1);
          v210 = v255;
        }
        v211 += 16;
        v210[2] = v217 + 1;
        v218 = &v210[2 * v217];
        v218[4] = v213;
        v218[5] = v215;
        --v209;
      }
      while (v209);
      swift_bridgeObjectRelease();
    }
    char v219 = sub_1004B872C(v210, v226);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v220 = v242;
    if ((v219 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      v221 = Logger.logObject.getter();
      os_log_type_t v222 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v221, v222))
      {
        v223 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v223 = 0;
        _os_log_impl((void *)&_mh_execute_header, v221, v222, "The post-processor encountered a discrepancy where diffing was necessary and attempted to diff, however, the attempt was unsuccessful. This is unexpected.", v223, 2u);
        swift_slowDealloc();
      }

      sub_10065C1E0();
      swift_allocError();
      unsigned char *v224 = 3;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v236 + 8))(v235, v175);
      goto LABEL_122;
    }
    (*(void (**)(char *, uint64_t))(v236 + 8))(v235, v175);
LABEL_87:
    uint64_t v251 = v256;
    uint64_t v108 = *(char **)(v256 + 16);
    uint64_t v136 = v234;
    unint64_t v137 = v233;
    if (v108)
    {
      if ((unint64_t)v108 > v232)
      {
        __break(1u);
LABEL_165:
        swift_once();
LABEL_118:
        uint64_t v173 = type metadata accessor for Logger();
        sub_100026A54(v173, (uint64_t)qword_100815428);
        uint64_t v112 = Logger.logObject.getter();
        os_log_type_t v113 = static os_log_type_t.debug.getter();
        if (!os_log_type_enabled(v112, v113))
        {
LABEL_121:

          sub_10065C1E0();
          swift_allocError();
          unsigned char *v174 = 2;
          swift_willThrow();

LABEL_122:
          uint64_t v35 = v258;
          swift_bridgeObjectRelease();
LABEL_9:
          swift_bridgeObjectRelease();
          return v35;
        }
        uint64_t v114 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v114 = 0;
        uint64_t v115 = "Cancelled after step 4. Aborting.";
LABEL_120:
        _os_log_impl((void *)&_mh_execute_header, v112, v113, v115, v114, 2u);
        swift_slowDealloc();
        goto LABEL_121;
      }
      v138 = (uint64_t *)(v251 + 40);
      uint64_t v35 = _swiftEmptyArrayStorage;
      uint64_t v139 = v231;
      v140 = (int *)v253;
      do
      {
        uint64_t v142 = *(v138 - 1);
        uint64_t v141 = *v138;
        uint64_t v143 = *(void *)(v137 + v140[6]);
        unint64_t v144 = v137;
        uint64_t v145 = *(void *)(v137 + v140[7]);
        swift_bridgeObjectRetain();
        UUID.init()();
        long long v146 = (void *)(v139 + v140[5]);
        *long long v146 = v142;
        v146[1] = v141;
        *(void *)(v139 + v140[6]) = v143;
        *(void *)(v139 + v140[7]) = v145;
        sub_100140F00(v139, v136);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v35 = sub_1002A59A8(0, (int64_t)v35[2].isa + 1, 1, (unint64_t)v35);
        }
        unint64_t isa = (unint64_t)v35[2].isa;
        unint64_t v147 = (unint64_t)v35[3].isa;
        if (isa >= v147 >> 1) {
          uint64_t v35 = sub_1002A59A8(v147 > 1, isa + 1, 1, (unint64_t)v35);
        }
        v138 += 2;
        v35[2].unint64_t isa = (Class)(isa + 1);
        uint64_t v149 = v252;
        sub_100390DC0(v136, (uint64_t)v35 + v241 + isa * v252);
        sub_100140F64(v139);
        unint64_t v137 = v144 + v149;
        --v108;
      }
      while (v108);
    }
    else
    {
      uint64_t v35 = _swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease();
    if ((static Task<>.isCancelled.getter() & 1) == 0)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v35;
    }
    swift_bridgeObjectRelease();
    uint64_t v108 = v242;
    if (qword_1007F7F00 == -1) {
      goto LABEL_118;
    }
    goto LABEL_165;
  }
  v230 = (void (**)(void, void))(v177 + 8);
  uint64_t v184 = (uint64_t)v240;
  v229 = (uint64_t **)v180;
  v227 = v44;
  while (1)
  {
    v196 = (void (*)(void, void))dispatch thunk of Collection.subscript.read();
    uint64_t v199 = *(void *)v197;
    uint64_t v198 = *(void *)(v197 + 8);
    uint64_t v200 = *(void *)(v197 + 16);
    int v201 = *(unsigned __int8 *)(v197 + 32);
    uint64_t v202 = v175;
    int v203 = *(unsigned __int8 *)(v197 + 33);
    uint64_t v244 = *(void *)(v197 + 24);
    LODWORD(v243) = v201;
    sub_10065C234();
    v196(&v254, 0);
    v204 = v246;
    v237(v246, v184, v202);
    dispatch thunk of Collection.formIndex(after:)();
    (*v230)(v204, v202);
    if (v203 == 1) {
      break;
    }
    if (*(void *)(v256 + 16) < v199) {
      goto LABEL_161;
    }
    uint64_t v175 = v239;
    if (v199 < 0) {
      goto LABEL_162;
    }
    sub_1000F32DC(v199, v199, v198, v200);
LABEL_134:
    Swift::String v44 = v227;
    uint64_t v195 = *v227;
    uint64_t v184 = (uint64_t)v240;
    dispatch thunk of Collection.endIndex.getter();
    if (v195 == v254._countAndFlagsBits) {
      goto LABEL_128;
    }
  }
  v205 = (char *)v256;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v205 = sub_1000EFF88((uint64_t)v205);
  }
  unint64_t v206 = *((void *)v205 + 2);
  if (v199 >= v206) {
    goto LABEL_160;
  }
  unint64_t v207 = v206 - 1;
  uint64_t v208 = v206 - 1 - v199;
  if (v208 >= 0)
  {
    memmove(&v205[16 * v199 + 32], &v205[16 * v199 + 48], 16 * v208);
    *((void *)v205 + 2) = v207;
    sub_10065C23C();
    swift_bridgeObjectRelease();
    uint64_t v256 = (uint64_t)v205;
    uint64_t v175 = v239;
    goto LABEL_134;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10065B904(id a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = a3;
  uint64_t v46 = type metadata accessor for TranscriptViewModelSegment(0);
  uint64_t v5 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v45 = (uint64_t)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_bridgeObjectRetain();
    [a1 beginEditing];
    uint64_t v7 = *(void *)(a2 + 16);
    uint64_t v8 = &stru_1007D7000;
    if (v7)
    {
      int v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      unint64_t v41 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      uint64_t v12 = *(void *)(v5 + 72);
      uint64_t v43 = v7;
      uint64_t v44 = v12;
      uint64_t v39 = v7 - 1;
      v38[1] = (char *)&type metadata for Any + 8;
      id v47 = a1;
      while (1)
      {
        int v40 = v9;
        unint64_t v13 = v41 + v44 * v11;
        uint64_t v14 = v11;
        while (1)
        {
          uint64_t v15 = a2;
          uint64_t v16 = a2 + v13;
          uint64_t v17 = a2 + v13;
          uint64_t v18 = v45;
          sub_100140F00(v17, v45);
          type metadata accessor for TranscriptMetadata(0);
          uint64_t v19 = swift_allocObject();
          UUID.init()();
          sub_100390DC0(v18, v19 + OBJC_IVAR____TtC7Journal18TranscriptMetadata_segment);
          uint64_t v20 = (uint64_t *)(v16 + *(int *)(v46 + 20));
          uint64_t v21 = *v20;
          unint64_t v22 = v20[1];
          swift_bridgeObjectRetain();
          LOBYTE(v16) = sub_100369D7C(v21, v22);
          swift_bridgeObjectRelease();
          if (v16)
          {
            swift_bridgeObjectRetain();
          }
          else
          {
            v51[0] = v21;
            v51[1] = v22;
            swift_bridgeObjectRetain();
            v23._uint64_t countAndFlagsBits = 32;
            v23._object = (void *)0xE100000000000000;
            String.append(_:)(v23);
          }
          unint64_t v24 = [a1 length];
          int64_t v25 = v24 - v10;
          if ((uint64_t)v24 < (uint64_t)v10)
          {
            __break(1u);
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
            goto LABEL_42;
          }
          if (__OFSUB__(v24, v10)) {
            goto LABEL_39;
          }
          char v48 = v10;
          int64_t v49 = v24 - v10;
          if (!v25) {
            goto LABEL_24;
          }
          if (qword_1007F6A20 != -1) {
            swift_once();
          }
          if ([a1 attribute:static NSAttributedStringKey.audio_transcriptText atIndex:v10 effectiveRange:&v48])
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v50, 0, sizeof(v50));
          }
          sub_10002C4EC((uint64_t)v50, (uint64_t)v51, &qword_1007FAD50);
          a1 = v47;
          if (!v51[3])
          {
            sub_10001457C((uint64_t)v51, &qword_1007FAD50);
            goto LABEL_24;
          }
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_24;
          }
          if ((static UUID.== infix(_:_:)() & 1) == 0) {
            break;
          }
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v10 = &v48[v49];
          if (__OFADD__(v48, v49)) {
            goto LABEL_40;
          }
          ++v14;
          v13 += v44;
          a2 = v15;
          if (v43 == v14)
          {
            swift_bridgeObjectRelease();
            uint64_t v8 = &stru_1007D7000;
            char v35 = v40;
            goto LABEL_29;
          }
        }
        swift_release();
LABEL_24:
        id v26 = objc_allocWithZone((Class)NSMutableAttributedString);
        NSString v27 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v28 = [v26 initWithString:v27];

        type metadata accessor for Key(0);
        sub_10002103C();
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        id v30 = v28;
        uint64_t v8 = &stru_1007D7000;
        id v31 = [v30 length];

        [v30 addAttributes:isa range:0];
        if (qword_1007F6A20 != -1) {
          swift_once();
        }
        uint64_t v11 = v14 + 1;
        uint64_t v32 = static NSAttributedStringKey.audio_transcriptText;
        id v33 = v30;
        swift_retain();
        id v34 = [v33 length];

        [v33 addAttribute:v32 value:v19 range:0];
        swift_release();
        a1 = v47;
        [v47 replaceCharactersInRange:v10 withAttributedString:v25];
        uint64_t v10 = [a1 length];

        swift_release();
        int v9 = 1;
        a2 = v15;
        if (v39 == v14)
        {
          swift_bridgeObjectRelease();
          char v35 = 1;
          goto LABEL_29;
        }
      }
    }
    swift_bridgeObjectRelease();
    char v35 = 0;
    uint64_t v10 = 0;
LABEL_29:
    if (v10 != [a1 v8[79].types])
    {
      uint64_t v36 = [a1 v8[79].types];
      if ((uint64_t)v36 < (uint64_t)v10) {
        goto LABEL_41;
      }
      if (__OFSUB__(v36, v10))
      {
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
      [a1 deleteCharactersInRange:v10, v36 - v10];
    }
    if ((v35 & 1) == 0)
    {
LABEL_36:
      [a1 endEditing];
      return;
    }
    uint64_t v37 = (char *)[a1 v8[79].types];
    if (!__OFSUB__(v37, 1))
    {
      [a1 deleteCharactersInRange:v37 - 1, 1];
      goto LABEL_36;
    }
LABEL_43:
    __break(1u);
  }
}

uint64_t sub_10065BEF8@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  }
  char v5 = 1;
  if (v4)
  {
    uint64_t v7 = result;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = 0;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 24) = 0;
    *(void *)(v9 + 16) = 0;
    *(unsigned char *)(v9 + 32) = 1;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 24) = 0;
    *(void *)(v10 + 16) = 0;
    *(unsigned char *)(v10 + 32) = 1;
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = v8;
    v11[3] = v10;
    v11[4] = v7;
    v11[5] = a2;
    v11[6] = v9;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100010218(&qword_1007F8E80);
    sub_100014344();
    sub_100014488(&qword_1007F8E88, &qword_1007F8E80);
    StringProtocol.enumerateSubstrings<A>(in:options:_:)();
    swift_release();
    swift_beginAccess();
    long long v16 = *(_OWORD *)(v9 + 16);
    char v5 = *(unsigned char *)(v9 + 32);
    swift_beginAccess();
    long long v15 = *(_OWORD *)(v10 + 16);
    char v12 = *(unsigned char *)(v10 + 32);
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    long long v14 = v15;
    long long v13 = v16;
  }
  else
  {
    long long v13 = 0uLL;
    char v12 = 1;
    long long v14 = 0uLL;
  }
  *(_OWORD *)a3 = v13;
  *(unsigned char *)(a3 + 16) = v5;
  *(_OWORD *)(a3 + 24) = v14;
  *(unsigned char *)(a3 + 40) = v12;
  return result;
}

uint64_t sub_10065C13C()
{
  return swift_deallocObject();
}

uint64_t sub_10065C14C()
{
  return swift_deallocObject();
}

uint64_t sub_10065C15C()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_10065C1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  return sub_100658EA0(a1, a2, a3, a4, a5, a6, a7, v7[2], v7[3], v7[4], v7[5], v7[6]);
}

unint64_t sub_10065C1E0()
{
  unint64_t result = qword_100815458;
  if (!qword_100815458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815458);
  }
  return result;
}

uint64_t sub_10065C234()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10065C23C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10065C244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100659084(a1, a2, a3, *(char ***)(v3 + 16));
}

uint64_t sub_10065C250()
{
  uint64_t v1 = type metadata accessor for Locale();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_10065C35C(*v0);
  if (!v4)
  {
    String.LocalizationValue.init(stringLiteral:)();
    static Locale.current.getter();
    return String.init(localized:table:bundle:locale:comment:)();
  }
  return v3;
}

uint64_t sub_10065C35C(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  uint64_t result = 0;
  switch((unint64_t)a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      goto LABEL_213;
    case 4uLL:
      return result;
    default:
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v6;
      if (v5 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v7 == v8)
      {
        sub_10065F698(a1);
        swift_bridgeObjectRelease_n();
        sub_10040B12C(a1);
        goto LABEL_213;
      }
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v10) {
        goto LABEL_213;
      }
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v13 = v12;
      if (v11 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v13 == v14)
      {
        sub_10065F698(a1);
        swift_bridgeObjectRelease_n();
        sub_10040B12C(a1);
        goto LABEL_213;
      }
      char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v16) {
        goto LABEL_213;
      }
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;
      if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20) {
        goto LABEL_258;
      }
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v21) {
        goto LABEL_213;
      }
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v24 = v23;
      if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25) {
        goto LABEL_258;
      }
      char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v26) {
        goto LABEL_213;
      }
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v29 = v28;
      if (v27 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v29 == v30) {
        goto LABEL_258;
      }
      char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v31) {
        goto LABEL_213;
      }
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v34 = v33;
      if (v32 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v34 == v35) {
        goto LABEL_258;
      }
      char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v36) {
        goto LABEL_213;
      }
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v39 = v38;
      if (v37 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v39 == v40) {
        goto LABEL_258;
      }
      char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v41) {
        goto LABEL_213;
      }
      uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v44 = v43;
      if (v42 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v44 == v45) {
        goto LABEL_258;
      }
      char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v46) {
        goto LABEL_213;
      }
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v49 = v48;
      if (v47 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v49 == v50) {
        goto LABEL_258;
      }
      char v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v51) {
        goto LABEL_213;
      }
      uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v54 = v53;
      if (v52 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v54 == v55) {
        goto LABEL_258;
      }
      char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v56) {
        goto LABEL_213;
      }
      uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v59 = v58;
      if (v57 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v59 == v60) {
        goto LABEL_258;
      }
      char v61 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v61) {
        goto LABEL_213;
      }
      uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v64 = v63;
      if (v62 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v64 == v65) {
        goto LABEL_258;
      }
      char v66 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v66) {
        goto LABEL_213;
      }
      uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v69 = v68;
      if (v67 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v69 == v70) {
        goto LABEL_258;
      }
      char v71 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v71) {
        goto LABEL_213;
      }
      uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v74 = v73;
      if (v72 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v74 == v75) {
        goto LABEL_258;
      }
      char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v76) {
        goto LABEL_213;
      }
      uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v79 = v78;
      if (v77 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v79 == v80) {
        goto LABEL_258;
      }
      char v81 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v81) {
        goto LABEL_213;
      }
      uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v84 = v83;
      if (v82 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v84 == v85) {
        goto LABEL_258;
      }
      char v86 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v86) {
        goto LABEL_213;
      }
      uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v89 = v88;
      if (v87 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v89 == v90) {
        goto LABEL_258;
      }
      char v91 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v91) {
        goto LABEL_213;
      }
      uint64_t v92 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v94 = v93;
      if (v92 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v94 == v95) {
        goto LABEL_258;
      }
      char v96 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v96) {
        goto LABEL_213;
      }
      uint64_t v97 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v99 = v98;
      if (v97 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v99 == v100) {
        goto LABEL_258;
      }
      char v101 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v101) {
        goto LABEL_213;
      }
      uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v104 = v103;
      if (v102 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v104 == v105) {
        goto LABEL_258;
      }
      char v106 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v106) {
        goto LABEL_213;
      }
      uint64_t v107 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v109 = v108;
      if (v107 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v109 == v110) {
        goto LABEL_258;
      }
      char v111 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v111) {
        goto LABEL_213;
      }
      uint64_t v112 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v114 = v113;
      if (v112 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v114 == v115) {
        goto LABEL_258;
      }
      char v116 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v116) {
        goto LABEL_213;
      }
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v119 = v118;
      if (v117 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v119 == v120) {
        goto LABEL_258;
      }
      char v121 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v121) {
        goto LABEL_213;
      }
      uint64_t v122 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v124 = v123;
      if (v122 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v124 == v125) {
        goto LABEL_258;
      }
      char v126 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v126) {
        goto LABEL_213;
      }
      uint64_t v127 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v129 = v128;
      if (v127 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v129 == v130) {
        goto LABEL_258;
      }
      char v131 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v131) {
        goto LABEL_213;
      }
      uint64_t v132 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v134 = v133;
      if (v132 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v134 == v135) {
        goto LABEL_258;
      }
      char v136 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v136) {
        goto LABEL_213;
      }
      uint64_t v137 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v139 = v138;
      if (v137 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v139 == v140) {
        goto LABEL_258;
      }
      char v141 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v141) {
        goto LABEL_213;
      }
      uint64_t v142 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v144 = v143;
      if (v142 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v144 == v145) {
        goto LABEL_258;
      }
      char v146 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v146) {
        goto LABEL_213;
      }
      uint64_t v147 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v149 = v148;
      if (v147 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v149 == v150) {
        goto LABEL_258;
      }
      char v151 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v151) {
        goto LABEL_213;
      }
      uint64_t v152 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v154 = v153;
      if (v152 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v154 == v155) {
        goto LABEL_258;
      }
      char v156 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v156) {
        goto LABEL_213;
      }
      uint64_t v157 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v159 = v158;
      if (v157 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v159 == v160) {
        goto LABEL_258;
      }
      char v161 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v161) {
        goto LABEL_213;
      }
      uint64_t v162 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v164 = v163;
      if (v162 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v164 == v165) {
        goto LABEL_258;
      }
      char v166 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v166) {
        goto LABEL_213;
      }
      uint64_t v167 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v169 = v168;
      if (v167 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v169 == v170) {
        goto LABEL_258;
      }
      char v171 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v171) {
        goto LABEL_213;
      }
      uint64_t v172 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v174 = v173;
      if (v172 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v174 == v175) {
        goto LABEL_258;
      }
      char v176 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v176) {
        goto LABEL_213;
      }
      uint64_t v177 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v179 = v178;
      if (v177 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v179 == v180) {
        goto LABEL_258;
      }
      char v181 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v181) {
        goto LABEL_213;
      }
      uint64_t v182 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v184 = v183;
      if (v182 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v184 == v185) {
        goto LABEL_258;
      }
      char v186 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v186) {
        goto LABEL_213;
      }
      uint64_t v187 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v189 = v188;
      if (v187 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v189 == v190) {
        goto LABEL_258;
      }
      char v191 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v191) {
        goto LABEL_213;
      }
      uint64_t v192 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v194 = v193;
      if (v192 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v194 == v195) {
        goto LABEL_258;
      }
      char v196 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v196) {
        goto LABEL_213;
      }
      uint64_t v197 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v199 = v198;
      if (v197 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v199 == v200) {
        goto LABEL_258;
      }
      char v201 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v201) {
        goto LABEL_213;
      }
      uint64_t v202 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v204 = v203;
      if (v202 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v204 == v205) {
        goto LABEL_258;
      }
      char v206 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v206) {
        goto LABEL_213;
      }
      uint64_t v207 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v209 = v208;
      if (v207 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v209 == v210) {
        goto LABEL_258;
      }
      char v211 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v211) {
        goto LABEL_213;
      }
      uint64_t v212 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v214 = v213;
      if (v212 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v214 == v215) {
        goto LABEL_258;
      }
      char v216 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v216) {
        goto LABEL_213;
      }
      uint64_t v217 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v219 = v218;
      if (v217 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v219 == v220) {
        goto LABEL_258;
      }
      char v221 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v221) {
        goto LABEL_213;
      }
      uint64_t v222 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v224 = v223;
      if (v222 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v224 == v225) {
        goto LABEL_258;
      }
      char v226 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v226) {
        goto LABEL_213;
      }
      uint64_t v227 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v229 = v228;
      if (v227 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v229 == v230) {
        goto LABEL_258;
      }
      char v231 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v231) {
        goto LABEL_213;
      }
      uint64_t v232 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v234 = v233;
      if (v232 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v234 == v235) {
        goto LABEL_258;
      }
      char v236 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v236) {
        goto LABEL_213;
      }
      uint64_t v237 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v239 = v238;
      if (v237 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v239 == v240) {
        goto LABEL_258;
      }
      char v241 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v241) {
        goto LABEL_213;
      }
      uint64_t v242 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v244 = v243;
      if (v242 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v244 == v245) {
        goto LABEL_258;
      }
      char v246 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v246) {
        goto LABEL_213;
      }
      uint64_t v247 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v249 = v248;
      if (v247 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v249 == v250) {
        goto LABEL_258;
      }
      char v251 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v251) {
        goto LABEL_213;
      }
      uint64_t v252 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v254 = v253;
      if (v252 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v254 == v255) {
        goto LABEL_258;
      }
      char v256 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v256) {
        goto LABEL_213;
      }
      uint64_t v257 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v259 = v258;
      if (v257 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v259 == v260) {
        goto LABEL_258;
      }
      char v261 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v261) {
        goto LABEL_213;
      }
      uint64_t v262 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v264 = v263;
      if (v262 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v264 == v265) {
        goto LABEL_258;
      }
      char v266 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v266) {
        goto LABEL_213;
      }
      uint64_t v267 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v269 = v268;
      if (v267 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v269 == v270) {
        goto LABEL_258;
      }
      char v271 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v271) {
        goto LABEL_213;
      }
      uint64_t v272 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v274 = v273;
      if (v272 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v274 == v275) {
        goto LABEL_258;
      }
      char v276 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v276) {
        goto LABEL_213;
      }
      uint64_t v277 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v279 = v278;
      if (v277 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v279 == v280) {
        goto LABEL_258;
      }
      char v281 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v281) {
        goto LABEL_213;
      }
      uint64_t v282 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v284 = v283;
      if (v282 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v284 == v285) {
        goto LABEL_258;
      }
      char v286 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v286) {
        goto LABEL_213;
      }
      uint64_t v287 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v289 = v288;
      if (v287 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v289 == v290) {
        goto LABEL_258;
      }
      char v291 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v291) {
        goto LABEL_213;
      }
      uint64_t v292 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v294 = v293;
      if (v292 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v294 == v295) {
        goto LABEL_258;
      }
      char v296 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v296) {
        goto LABEL_213;
      }
      uint64_t v297 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v299 = v298;
      if (v297 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v299 == v300) {
        goto LABEL_258;
      }
      char v301 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v301) {
        goto LABEL_213;
      }
      uint64_t v302 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v304 = v303;
      if (v302 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v304 == v305) {
        goto LABEL_258;
      }
      char v306 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v306) {
        goto LABEL_213;
      }
      uint64_t v307 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v309 = v308;
      if (v307 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v309 == v310) {
        goto LABEL_258;
      }
      char v311 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v311) {
        goto LABEL_213;
      }
      uint64_t v312 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v314 = v313;
      if (v312 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v314 == v315) {
        goto LABEL_258;
      }
      char v316 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v316) {
        goto LABEL_213;
      }
      uint64_t v317 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v319 = v318;
      if (v317 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v319 == v320) {
        goto LABEL_258;
      }
      char v321 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v321) {
        goto LABEL_213;
      }
      uint64_t v322 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v324 = v323;
      if (v322 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v324 == v325) {
        goto LABEL_258;
      }
      char v326 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v326) {
        goto LABEL_213;
      }
      uint64_t v327 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v329 = v328;
      if (v327 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v329 == v330) {
        goto LABEL_258;
      }
      char v331 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v331) {
        goto LABEL_213;
      }
      uint64_t v332 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v334 = v333;
      if (v332 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v334 == v335) {
        goto LABEL_258;
      }
      char v336 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v336) {
        goto LABEL_213;
      }
      uint64_t v337 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v339 = v338;
      if (v337 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v339 == v340) {
        goto LABEL_258;
      }
      char v341 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v341) {
        goto LABEL_213;
      }
      uint64_t v342 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v344 = v343;
      if (v342 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v344 == v345) {
        goto LABEL_258;
      }
      char v346 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v346) {
        goto LABEL_213;
      }
      uint64_t v347 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v349 = v348;
      if (v347 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v349 == v350) {
        goto LABEL_258;
      }
      char v351 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v351) {
        goto LABEL_213;
      }
      uint64_t v352 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v354 = v353;
      if (v352 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v354 == v355) {
        goto LABEL_258;
      }
      char v356 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v356) {
        goto LABEL_213;
      }
      uint64_t v357 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v359 = v358;
      if (v357 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v359 == v360) {
        goto LABEL_258;
      }
      char v361 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v361) {
        goto LABEL_213;
      }
      uint64_t v362 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v364 = v363;
      if (v362 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v364 == v365) {
        goto LABEL_258;
      }
      char v366 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v366) {
        goto LABEL_213;
      }
      uint64_t v367 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v369 = v368;
      if (v367 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v369 == v370)
      {
LABEL_258:
        sub_10065F698(a1);
        swift_bridgeObjectRelease_n();
        sub_10040B12C(a1);
LABEL_213:
        String.LocalizationValue.init(stringLiteral:)();
        static Locale.current.getter();
        return String.init(localized:table:bundle:locale:comment:)();
      }
      char v371 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v371) {
        goto LABEL_213;
      }
      return 0;
  }
}

id sub_10065F698(id result)
{
  if (result != (id)4) {
    return sub_10001DFB8(result);
  }
  return result;
}

uint64_t sub_10065F6A8(void *a1)
{
  uint64_t v2 = type metadata accessor for Locale();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v3 - 8);
  uint64_t result = 0;
  switch((unint64_t)a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      goto LABEL_242;
    case 4uLL:
      return result;
    default:
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v6;
      if (v5 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v7 == v8) {
        goto LABEL_17;
      }
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v10) {
        goto LABEL_242;
      }
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v13 = v12;
      if (v11 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v13 == v14)
      {
        sub_10065F698(a1);
        swift_bridgeObjectRelease_n();
        sub_10040B12C(a1);
        goto LABEL_242;
      }
      char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v16) {
        goto LABEL_242;
      }
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;
      if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20) {
        goto LABEL_28;
      }
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v21) {
        goto LABEL_242;
      }
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v24 = v23;
      if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25) {
        goto LABEL_28;
      }
      char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v26) {
        goto LABEL_242;
      }
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v29 = v28;
      if (v27 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v29 == v30) {
        goto LABEL_28;
      }
      char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v31) {
        goto LABEL_242;
      }
      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v34 = v33;
      if (v32 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v34 == v35) {
        goto LABEL_28;
      }
      char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v36) {
        goto LABEL_242;
      }
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v39 = v38;
      if (v37 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v39 == v40) {
        goto LABEL_28;
      }
      char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v41) {
        goto LABEL_242;
      }
      uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v44 = v43;
      if (v42 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v44 == v45) {
        goto LABEL_28;
      }
      char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v46) {
        goto LABEL_242;
      }
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v49 = v48;
      if (v47 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v49 == v50) {
        goto LABEL_28;
      }
      char v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v51) {
        goto LABEL_242;
      }
      uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v54 = v53;
      if (v52 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v54 == v55) {
        goto LABEL_28;
      }
      char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v56) {
        goto LABEL_242;
      }
      uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v59 = v58;
      if (v57 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v59 == v60) {
        goto LABEL_28;
      }
      char v61 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v61) {
        goto LABEL_242;
      }
      uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v64 = v63;
      if (v62 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v64 == v65) {
        goto LABEL_28;
      }
      char v66 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v66) {
        goto LABEL_242;
      }
      uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v69 = v68;
      if (v67 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v69 == v70) {
        goto LABEL_28;
      }
      char v71 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v71) {
        goto LABEL_242;
      }
      uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v74 = v73;
      if (v72 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v74 == v75) {
        goto LABEL_28;
      }
      char v76 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v76) {
        goto LABEL_242;
      }
      uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v79 = v78;
      if (v77 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v79 == v80)
      {
LABEL_17:
        sub_10065F698(a1);
        swift_bridgeObjectRelease_n();
        sub_10040B12C(a1);
        goto LABEL_242;
      }
      char v81 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v81) {
        goto LABEL_242;
      }
      uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v84 = v83;
      if (v82 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v84 == v85) {
        goto LABEL_28;
      }
      char v86 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v86) {
        goto LABEL_242;
      }
      uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v89 = v88;
      if (v87 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v89 == v90) {
        goto LABEL_28;
      }
      char v91 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v91) {
        goto LABEL_242;
      }
      uint64_t v92 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v94 = v93;
      if (v92 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v94 == v95) {
        goto LABEL_28;
      }
      char v96 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v96) {
        goto LABEL_242;
      }
      uint64_t v97 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v99 = v98;
      if (v97 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v99 == v100) {
        goto LABEL_28;
      }
      char v101 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v101) {
        goto LABEL_242;
      }
      uint64_t v102 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v104 = v103;
      if (v102 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v104 == v105) {
        goto LABEL_28;
      }
      char v106 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v106) {
        goto LABEL_242;
      }
      uint64_t v107 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v109 = v108;
      if (v107 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v109 == v110) {
        goto LABEL_28;
      }
      char v111 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v111) {
        goto LABEL_242;
      }
      uint64_t v112 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v114 = v113;
      if (v112 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v114 == v115) {
        goto LABEL_28;
      }
      char v116 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v116) {
        goto LABEL_242;
      }
      uint64_t v117 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v119 = v118;
      if (v117 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v119 == v120) {
        goto LABEL_28;
      }
      char v121 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v121) {
        goto LABEL_242;
      }
      uint64_t v122 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v124 = v123;
      if (v122 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v124 == v125) {
        goto LABEL_28;
      }
      char v126 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v126) {
        goto LABEL_242;
      }
      uint64_t v127 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v129 = v128;
      if (v127 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v129 == v130) {
        goto LABEL_28;
      }
      char v131 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v131) {
        goto LABEL_242;
      }
      uint64_t v132 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v134 = v133;
      if (v132 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v134 == v135) {
        goto LABEL_28;
      }
      char v136 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v136) {
        goto LABEL_242;
      }
      uint64_t v137 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v139 = v138;
      if (v137 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v139 == v140) {
        goto LABEL_28;
      }
      char v141 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v141) {
        goto LABEL_242;
      }
      uint64_t v142 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v144 = v143;
      if (v142 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v144 == v145) {
        goto LABEL_28;
      }
      char v146 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v146) {
        goto LABEL_242;
      }
      uint64_t v147 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v149 = v148;
      if (v147 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v149 == v150) {
        goto LABEL_28;
      }
      char v151 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v151) {
        goto LABEL_242;
      }
      uint64_t v152 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v154 = v153;
      if (v152 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v154 == v155) {
        goto LABEL_28;
      }
      char v156 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v156) {
        goto LABEL_242;
      }
      uint64_t v157 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v159 = v158;
      if (v157 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v159 == v160) {
        goto LABEL_28;
      }
      char v161 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v161) {
        goto LABEL_242;
      }
      uint64_t v162 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v164 = v163;
      if (v162 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v164 == v165) {
        goto LABEL_28;
      }
      char v166 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v166) {
        goto LABEL_242;
      }
      uint64_t v167 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v169 = v168;
      if (v167 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v169 == v170) {
        goto LABEL_28;
      }
      char v171 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v171) {
        goto LABEL_242;
      }
      uint64_t v172 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v174 = v173;
      if (v172 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v174 == v175) {
        goto LABEL_28;
      }
      char v176 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v176) {
        goto LABEL_242;
      }
      uint64_t v177 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v179 = v178;
      if (v177 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v179 == v180) {
        goto LABEL_28;
      }
      char v181 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v181) {
        goto LABEL_242;
      }
      uint64_t v182 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v184 = v183;
      if (v182 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v184 == v185) {
        goto LABEL_28;
      }
      char v186 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v186) {
        goto LABEL_242;
      }
      uint64_t v187 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v189 = v188;
      if (v187 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v189 == v190) {
        goto LABEL_28;
      }
      char v191 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v191) {
        goto LABEL_242;
      }
      uint64_t v192 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v194 = v193;
      if (v192 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v194 == v195) {
        goto LABEL_28;
      }
      char v196 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v196) {
        goto LABEL_242;
      }
      uint64_t v197 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v199 = v198;
      if (v197 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v199 == v200) {
        goto LABEL_28;
      }
      char v201 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v201) {
        goto LABEL_242;
      }
      uint64_t v202 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v204 = v203;
      if (v202 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v204 == v205) {
        goto LABEL_28;
      }
      char v206 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v206) {
        goto LABEL_242;
      }
      uint64_t v207 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v209 = v208;
      if (v207 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v209 == v210) {
        goto LABEL_28;
      }
      char v211 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v211) {
        goto LABEL_242;
      }
      uint64_t v212 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v214 = v213;
      if (v212 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v214 == v215) {
        goto LABEL_28;
      }
      char v216 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v216) {
        goto LABEL_242;
      }
      uint64_t v217 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v219 = v218;
      if (v217 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v219 == v220) {
        goto LABEL_28;
      }
      char v221 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v221) {
        goto LABEL_242;
      }
      uint64_t v222 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v224 = v223;
      if (v222 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v224 == v225) {
        goto LABEL_28;
      }
      char v226 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v226) {
        goto LABEL_242;
      }
      uint64_t v227 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v229 = v228;
      if (v227 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v229 == v230) {
        goto LABEL_28;
      }
      char v231 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v231) {
        goto LABEL_242;
      }
      uint64_t v232 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v234 = v233;
      if (v232 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v234 == v235) {
        goto LABEL_28;
      }
      char v236 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v236) {
        goto LABEL_242;
      }
      uint64_t v237 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v239 = v238;
      if (v237 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v239 == v240) {
        goto LABEL_28;
      }
      char v241 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v241) {
        goto LABEL_242;
      }
      uint64_t v242 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v244 = v243;
      if (v242 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v244 == v245) {
        goto LABEL_28;
      }
      char v246 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v246) {
        goto LABEL_242;
      }
      uint64_t v247 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v249 = v248;
      if (v247 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v249 == v250) {
        goto LABEL_28;
      }
      char v251 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v251) {
        goto LABEL_242;
      }
      uint64_t v252 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v254 = v253;
      if (v252 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v254 == v255) {
        goto LABEL_28;
      }
      char v256 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v256) {
        goto LABEL_242;
      }
      uint64_t v257 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v259 = v258;
      if (v257 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v259 == v260) {
        goto LABEL_28;
      }
      char v261 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v261) {
        goto LABEL_242;
      }
      uint64_t v262 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v264 = v263;
      if (v262 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v264 == v265) {
        goto LABEL_28;
      }
      char v266 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v266) {
        goto LABEL_242;
      }
      uint64_t v267 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v269 = v268;
      if (v267 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v269 == v270) {
        goto LABEL_28;
      }
      char v271 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v271) {
        goto LABEL_242;
      }
      uint64_t v272 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v274 = v273;
      if (v272 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v274 == v275) {
        goto LABEL_28;
      }
      char v276 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v276) {
        goto LABEL_242;
      }
      uint64_t v277 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v279 = v278;
      if (v277 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v279 == v280) {
        goto LABEL_28;
      }
      char v281 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v281) {
        goto LABEL_242;
      }
      uint64_t v282 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v284 = v283;
      if (v282 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v284 == v285) {
        goto LABEL_28;
      }
      char v286 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v286) {
        goto LABEL_242;
      }
      uint64_t v287 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v289 = v288;
      if (v287 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v289 == v290) {
        goto LABEL_28;
      }
      char v291 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v291) {
        goto LABEL_242;
      }
      uint64_t v292 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v294 = v293;
      if (v292 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v294 == v295) {
        goto LABEL_28;
      }
      char v296 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v296) {
        goto LABEL_242;
      }
      uint64_t v297 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v299 = v298;
      if (v297 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v299 == v300) {
        goto LABEL_28;
      }
      char v301 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v301) {
        goto LABEL_242;
      }
      uint64_t v302 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v304 = v303;
      if (v302 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v304 == v305) {
        goto LABEL_28;
      }
      char v306 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v306) {
        goto LABEL_242;
      }
      uint64_t v307 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v309 = v308;
      if (v307 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v309 == v310) {
        goto LABEL_28;
      }
      char v311 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v311) {
        goto LABEL_242;
      }
      uint64_t v312 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v314 = v313;
      if (v312 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v314 == v315) {
        goto LABEL_28;
      }
      char v316 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v316) {
        goto LABEL_242;
      }
      uint64_t v317 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v319 = v318;
      if (v317 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v319 == v320) {
        goto LABEL_28;
      }
      char v321 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v321) {
        goto LABEL_242;
      }
      uint64_t v322 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v324 = v323;
      if (v322 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v324 == v325) {
        goto LABEL_28;
      }
      char v326 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v326) {
        goto LABEL_242;
      }
      uint64_t v327 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v329 = v328;
      if (v327 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v329 == v330) {
        goto LABEL_28;
      }
      char v331 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v331) {
        goto LABEL_242;
      }
      uint64_t v332 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v334 = v333;
      if (v332 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v334 == v335) {
        goto LABEL_28;
      }
      char v336 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v336) {
        goto LABEL_242;
      }
      uint64_t v337 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v339 = v338;
      if (v337 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v339 == v340) {
        goto LABEL_28;
      }
      char v341 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v341) {
        goto LABEL_242;
      }
      uint64_t v342 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v344 = v343;
      if (v342 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v344 == v345) {
        goto LABEL_28;
      }
      char v346 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v346) {
        goto LABEL_242;
      }
      uint64_t v347 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v349 = v348;
      if (v347 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v349 == v350) {
        goto LABEL_28;
      }
      char v351 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v351) {
        goto LABEL_242;
      }
      uint64_t v352 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v354 = v353;
      if (v352 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v354 == v355) {
        goto LABEL_28;
      }
      char v356 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v356) {
        goto LABEL_242;
      }
      uint64_t v357 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v359 = v358;
      if (v357 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v359 == v360) {
        goto LABEL_28;
      }
      char v361 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v361) {
        goto LABEL_242;
      }
      uint64_t v362 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v364 = v363;
      if (v362 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v364 == v365) {
        goto LABEL_28;
      }
      char v366 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v366) {
        goto LABEL_242;
      }
      uint64_t v367 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v369 = v368;
      if (v367 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v369 == v370)
      {
LABEL_28:
        sub_10065F698(a1);
        swift_bridgeObjectRelease_n();
        sub_10040B12C(a1);
LABEL_242:
        String.LocalizationValue.init(stringLiteral:)();
        static Locale.current.getter();
        return String.init(localized:defaultValue:table:bundle:locale:comment:)();
      }
      char v371 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_10065F698(a1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10040B12C(a1);
      if (v371) {
        goto LABEL_242;
      }
      return 0;
  }
}

id sub_1006639DC()
{
  sub_100010218((uint64_t *)&unk_100815690);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1006D6280;
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 32) = UIPageViewControllerOptionInterPageSpacingKey;
  *(void *)(inited + 40) = 0;
  uint64_t v1 = UIPageViewControllerOptionInterPageSpacingKey;
  sub_100397828(inited);
  id v2 = objc_allocWithZone((Class)type metadata accessor for InsightsCalendarDetailTabView.ViewControllerType());
  type metadata accessor for OptionsKey(0);
  sub_1006666CC(&qword_1007F8C10, type metadata accessor for OptionsKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithTransitionStyle:1 navigationOrientation:0 options:isa];

  id v5 = v4;
  sub_100010218(&qword_100815668);
  UIViewControllerRepresentableContext.coordinator.getter();
  [v5 setDataSource:v12];

  id v6 = v5;
  UIViewControllerRepresentableContext.coordinator.getter();
  [v6 setDelegate:v12];

  uint64_t v7 = qword_1007F68B0;
  id v8 = v6;
  if (v7 != -1) {
    swift_once();
  }
  [v8 additionalSafeAreaInsets];
  [v8 setAdditionalSafeAreaInsets:];

  id result = [v8 view];
  if (result)
  {
    char v10 = result;
    id v11 = [self systemBackgroundColor];
    [v10 setBackgroundColor:v11];

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100663C40(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100010218(&qword_100815668);
  uint64_t v74 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v73 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DateComponents();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v66 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_100010218((uint64_t *)&unk_100815670);
  __chkstk_darwin(v78);
  uint64_t v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100010218((uint64_t *)&unk_1007FF070);
  __chkstk_darwin(v13 - 8);
  char v71 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v67 = (uint64_t)&v66 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v66 - v18;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v66 - v21;
  uint64_t v70 = type metadata accessor for InsightsCalendarDetailTabView(0);
  __chkstk_darwin(v70);
  uint64_t v24 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = v6;
  uint64_t v72 = a2;
  UIViewControllerRepresentableContext.coordinator.getter();
  uint64_t v25 = v80;
  uint64_t v79 = v3;
  sub_1006661F0(v3, (uint64_t)v24);
  uint64_t v26 = (uint64_t)v25 + OBJC_IVAR____TtCV7Journal29InsightsCalendarDetailTabView11Coordinator_configuration;
  swift_beginAccess();
  sub_1006662B0((uint64_t)v24, v26);
  swift_endAccess();

  id v27 = [a1 viewControllers];
  char v76 = a1;
  if (!v27) {
    goto LABEL_12;
  }
  uint64_t v28 = v27;
  sub_10038625C();
  unint64_t v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v29 >> 62))
  {
    if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_4;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v34) {
    goto LABEL_11;
  }
LABEL_4:
  if ((v29 & 0xC000000000000001) != 0)
  {
    id v30 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_7;
  }
  if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v30 = *(id *)(v29 + 32);
LABEL_7:
    char v31 = v30;
    swift_bridgeObjectRelease();
    type metadata accessor for InsightsEntriesViewController();
    uint64_t v32 = (objc_class *)swift_dynamicCastClass();
    if (v32)
    {
      uint64_t v77 = v32;
      uint64_t v33 = (uint64_t)v32 + OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_currentDate;
      swift_beginAccess();
      sub_10001B220(v33, (uint64_t)v22, (uint64_t *)&unk_1007FF070);
      goto LABEL_13;
    }

LABEL_12:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v22, 1, 1, v8);
    uint64_t v77 = 0;
LABEL_13:
    uint64_t v68 = sub_100010218((uint64_t *)&unk_1008155A0);
    Binding.wrappedValue.getter();
    uint64_t v69 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
    v69(v19, 0, 1, v8);
    uint64_t v35 = (uint64_t)&v12[*(int *)(v78 + 48)];
    sub_10001B220((uint64_t)v22, (uint64_t)v12, (uint64_t *)&unk_1007FF070);
    sub_10001B220((uint64_t)v19, v35, (uint64_t *)&unk_1007FF070);
    char v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    if (v36((uint64_t)v12, 1, v8) == 1)
    {
      sub_10001457C((uint64_t)v19, (uint64_t *)&unk_1007FF070);
      sub_10001457C((uint64_t)v22, (uint64_t *)&unk_1007FF070);
      if (v36(v35, 1, v8) == 1)
      {
        sub_10001457C((uint64_t)v12, (uint64_t *)&unk_1007FF070);
        Class isa = v77;
LABEL_25:

        return;
      }
    }
    else
    {
      uint64_t v38 = v67;
      sub_10001B220((uint64_t)v12, v67, (uint64_t *)&unk_1007FF070);
      if (v36(v35, 1, v8) != 1)
      {
        uint64_t v39 = v38;
        uint64_t v40 = v66;
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v66, v35, v8);
        sub_1006666CC(&qword_1007FF298, (void (*)(uint64_t))&type metadata accessor for DateComponents);
        char v41 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v42 = *(void (**)(char *, uint64_t))(v9 + 8);
        v42(v40, v8);
        sub_10001457C((uint64_t)v19, (uint64_t *)&unk_1007FF070);
        sub_10001457C((uint64_t)v22, (uint64_t *)&unk_1007FF070);
        v42((char *)v39, v8);
        sub_10001457C((uint64_t)v12, (uint64_t *)&unk_1007FF070);
        if (v41)
        {
          Class isa = v77;
          goto LABEL_25;
        }
LABEL_21:
        type metadata accessor for InsightsEntriesViewController();
        id v43 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
        uint64_t v44 = (uint64_t)v71;
        uint64_t v45 = v79;
        Binding.wrappedValue.getter();
        v69((char *)v44, 0, 1, v8);
        uint64_t v46 = (uint64_t)v43 + OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_currentDate;
        swift_beginAccess();
        sub_100666314(v44, v46);
        swift_endAccess();
        sub_10005F928();
        sub_10001457C(v44, (uint64_t *)&unk_1007FF070);
        uint64_t v47 = v45 + *(int *)(v70 + 20);
        uint64_t v48 = *(void *)v47;
        LOBYTE(v44) = *(unsigned char *)(v47 + 8);
        uint64_t v49 = (char *)v43;
        j__swift_retain();
        sub_100666444(v48, v44);
        j__swift_release();
        swift_weakAssign();

        swift_release();
        uint64_t v50 = v75;
        uint64_t v51 = v72;
        UIViewControllerRepresentableContext.coordinator.getter();
        uint64_t v52 = (void *)aBlock[0];
        *(void *)&v49[OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_insightsEntriesDelegate + 8] = &off_1007B9988;
        swift_unknownObjectWeakAssign();

        sub_100010218((uint64_t *)&unk_1007FA1C0);
        uint64_t v53 = swift_allocObject();
        *(_OWORD *)(v53 + 16) = xmmword_1006D6D00;
        *(void *)(v53 + 32) = v49;
        aBlock[0] = v53;
        specialized Array._endMutation()();
        sub_10038625C();
        uint64_t v54 = v49;
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        UIViewControllerRepresentableContext.transaction.getter();
        sub_10002BD38();
        Transaction.subscript.getter();
        swift_release();
        uint64_t v55 = aBlock[0];
        UIViewControllerRepresentableContext.transaction.getter();
        uint64_t v56 = Transaction.animation.getter();
        swift_release();
        swift_release();
        uint64_t v58 = v73;
        uint64_t v57 = v74;
        (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v73, v51, v50);
        if (v56)
        {
          UIViewControllerRepresentableContext.transaction.getter();
          char v59 = Transaction.disablesAnimations.getter();
          swift_release();
          char v60 = v59 ^ 1;
        }
        else
        {
          char v60 = 0;
        }
        (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v50);
        uint64_t v61 = swift_allocObject();
        uint64_t v62 = v76;
        *(void *)(v61 + 16) = v76;
        *(void *)(v61 + 24) = v54;
        aBlock[4] = sub_100666690;
        aBlock[5] = v61;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1001C7318;
        aBlock[3] = &unk_1007B99C0;
        uint64_t v63 = _Block_copy(aBlock);
        uint64_t v64 = v54;
        id v65 = v62;
        swift_release();
        [v65 setViewControllers:isa direction:v55 animated:v60 & 1 completion:v63];
        _Block_release(v63);

        goto LABEL_25;
      }
      sub_10001457C((uint64_t)v19, (uint64_t *)&unk_1007FF070);
      sub_10001457C((uint64_t)v22, (uint64_t *)&unk_1007FF070);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v38, v8);
    }
    sub_10001457C((uint64_t)v12, (uint64_t *)&unk_100815670);
    goto LABEL_21;
  }
  __break(1u);
}

id sub_1006648E4(uint64_t a1)
{
  return sub_100664F94(a1, type metadata accessor for InsightsCalendarDetailTabView.ViewControllerType);
}

uint64_t type metadata accessor for InsightsCalendarDetailTabView.ViewControllerType()
{
  return self;
}

void (*sub_100664920(void *a1, uint64_t a2))(void, void)
{
  uint64_t v35 = a2;
  uint64_t v3 = type metadata accessor for Calendar();
  uint64_t v37 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for InsightsCalendarDetailTabView(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100010218((uint64_t *)&unk_1007FF070);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v30 - v13;
  uint64_t v15 = type metadata accessor for DateComponents();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for InsightsEntriesViewController();
  uint64_t v19 = swift_dynamicCastClass();
  if (!v19) {
    return 0;
  }
  uint64_t v33 = v3;
  uint64_t v32 = v19;
  uint64_t v20 = v19 + OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_currentDate;
  swift_beginAccess();
  sub_10001B220(v20, (uint64_t)v14, (uint64_t *)&unk_1007FF070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_10001457C((uint64_t)v14, (uint64_t *)&unk_1007FF070);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
  id v21 = a1;
  id result = (void (*)(void, void))DateComponents.day.modify();
  char v24 = *(unsigned char *)(v23 + 8);
  id v31 = v21;
  if (v24)
  {
    result(v38, 0);
LABEL_8:
    uint64_t v25 = v36 + OBJC_IVAR____TtCV7Journal29InsightsCalendarDetailTabView11Coordinator_configuration;
    swift_beginAccess();
    sub_1006661F0(v25, (uint64_t)v8);
    sub_100666954(&qword_1007F9480, (uint64_t (*)(void))&type metadata accessor for Calendar, 0x7261646E656C6143, 0xE800000000000000, (uint64_t)v5);
    sub_100666254((uint64_t)v8);
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v26(v11, v18, v15);
    id v27 = *(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56);
    v27(v11, 0, 1, v15);
    LOBYTE(v25) = sub_100638BFC((uint64_t)v11);
    sub_10001457C((uint64_t)v11, (uint64_t *)&unk_1007FF070);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v33);
    if ((v25 & 1) == 0)
    {
      id v28 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
      v26(v11, v18, v15);
      v27(v11, 0, 1, v15);
      uint64_t v29 = (uint64_t)v28 + OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_currentDate;
      swift_beginAccess();
      sub_100666314((uint64_t)v11, v29);
      swift_endAccess();
      sub_10005F928();
      sub_10001457C((uint64_t)v11, (uint64_t *)&unk_1007FF070);
      swift_weakLoadStrong();
      swift_weakAssign();

      swift_release();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      return (void (*)(void, void))v28;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);

    return 0;
  }
  if (!__OFADD__(*(void *)v23, v35))
  {
    *(void *)v23 += v35;
    result(v38, 0);
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

id sub_100664E60(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  uint64_t v11 = sub_100664920(v9, a5);

  return v11;
}

id sub_100664F78()
{
  return sub_100664F94(0, (uint64_t (*)(void))type metadata accessor for InsightsCalendarDetailTabView.Coordinator);
}

id sub_100664F94(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t sub_100664FDC()
{
  return type metadata accessor for InsightsCalendarDetailTabView.Coordinator(0);
}

uint64_t type metadata accessor for InsightsCalendarDetailTabView.Coordinator(uint64_t a1)
{
  return sub_10003352C(a1, (uint64_t *)&unk_100815590);
}

uint64_t sub_100665004()
{
  uint64_t result = type metadata accessor for InsightsCalendarDetailTabView(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for InsightsCalendarDetailTabView(uint64_t a1)
{
  return sub_10003352C(a1, (uint64_t *)&unk_100815610);
}

uint64_t *sub_1006650B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    swift_retain();
    swift_retain();
    uint64_t v8 = *(int *)(sub_100010218((uint64_t *)&unk_1008155A0) + 32);
    id v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for DateComponents();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v10) = v14[8];
    j__swift_retain();
    *(void *)uint64_t v13 = v15;
    v13[8] = (char)v10;
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    sub_100010218(&qword_1007F9480);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = type metadata accessor for Calendar();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      void *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100665268(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(sub_100010218((uint64_t *)&unk_1008155A0) + 32);
  uint64_t v5 = type metadata accessor for DateComponents();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  j__swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  sub_100010218(&qword_1007F9480);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for Calendar();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

void *sub_100665394(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_retain();
  uint64_t v7 = *(int *)(sub_100010218((uint64_t *)&unk_1008155A0) + 32);
  uint64_t v8 = (char *)a1 + v7;
  id v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DateComponents();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)v13;
  LOBYTE(v9) = v13[8];
  j__swift_retain();
  *(void *)uint64_t v12 = v14;
  v12[8] = (char)v9;
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  sub_100010218(&qword_1007F9480);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = type metadata accessor for Calendar();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *uint64_t v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1006654F0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(sub_100010218((uint64_t *)&unk_1008155A0) + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DateComponents();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v8) = v12[8];
  j__swift_retain();
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v8;
  j__swift_release();
  if (a1 != a2)
  {
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (void *)((char *)a1 + v14);
    uint64_t v16 = (void *)((char *)a2 + v14);
    sub_10001457C((uint64_t)a1 + v14, &qword_1007F9480);
    sub_100010218(&qword_1007F9480);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = type metadata accessor for Calendar();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_10066568C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(sub_100010218((uint64_t *)&unk_1008155A0) + 32);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for DateComponents();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  uint64_t v17 = sub_100010218(&qword_1007F9480);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = type metadata accessor for Calendar();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

void *sub_1006657DC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  uint64_t v6 = *(int *)(sub_100010218((uint64_t *)&unk_1008155A0) + 32);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for DateComponents();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v12) = v12[8];
  *(void *)uint64_t v11 = v13;
  v11[8] = (char)v12;
  j__swift_release();
  if (a1 != a2)
  {
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    sub_10001457C((uint64_t)a1 + v14, &qword_1007F9480);
    uint64_t v17 = sub_100010218(&qword_1007F9480);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = type metadata accessor for Calendar();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10066596C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100665980);
}

uint64_t sub_100665980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100010218((uint64_t *)&unk_1008155A0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_100010218(&qword_1008155B0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_100665AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100665AC4);
}

uint64_t sub_100665AC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100010218((uint64_t *)&unk_1008155A0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  }
  else
  {
    uint64_t v11 = sub_100010218(&qword_1008155B0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_100665BF8()
{
  sub_100665D28(319, qword_100815620, (uint64_t (*)(uint64_t))&type metadata accessor for DateComponents, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Binding);
  if (v0 <= 0x3F)
  {
    sub_100665D28(319, (unint64_t *)&qword_1007F94F8, (uint64_t (*)(uint64_t))&type metadata accessor for Calendar, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100665D28(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100665D8C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DateComponents();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - v8;
  uint64_t v10 = type metadata accessor for InsightsCalendarDetailTabView(0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1 + OBJC_IVAR____TtCV7Journal29InsightsCalendarDetailTabView11Coordinator_configuration;
  swift_beginAccess();
  sub_1006661F0(v13, (uint64_t)v12);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v14(v9, a1, v3);
  v14(v6, (uint64_t)v9, v3);
  sub_100010218((uint64_t *)&unk_1008155A0);
  Binding.wrappedValue.setter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return sub_100666254((uint64_t)v12);
}

id sub_100665F48()
{
  return sub_1006639DC();
}

uint64_t sub_100665F64@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __chkstk_darwin(a1 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1006661F0(v2, (uint64_t)v5);
  uint64_t v6 = (objc_class *)type metadata accessor for InsightsCalendarDetailTabView.Coordinator(0);
  id v7 = objc_allocWithZone(v6);
  sub_1006661F0((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR____TtCV7Journal29InsightsCalendarDetailTabView11Coordinator_configuration);
  v10.receiver = v7;
  v10.super_class = v6;
  [super init];
  uint64_t result = sub_100666254((uint64_t)v5);
  *a2 = v8;
  return result;
}

uint64_t sub_100666028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1006666CC(&qword_1008156A0, (void (*)(uint64_t))type metadata accessor for InsightsCalendarDetailTabView);

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1006660BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1006666CC(&qword_1008156A0, (void (*)(uint64_t))type metadata accessor for InsightsCalendarDetailTabView);

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100666150()
{
}

uint64_t sub_1006661A8()
{
  return sub_1006666CC(&qword_100815660, (void (*)(uint64_t))type metadata accessor for InsightsCalendarDetailTabView);
}

uint64_t sub_1006661F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InsightsCalendarDetailTabView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100666254(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InsightsCalendarDetailTabView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1006662B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InsightsCalendarDetailTabView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100666314(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218((uint64_t *)&unk_1007FF070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10066637C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1006666CC(&qword_1008156A8, type metadata accessor for NavigationDirection);

  return static TransactionKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

uint64_t sub_100666410@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954(&qword_1007F9480, (uint64_t (*)(void))&type metadata accessor for Calendar, 0x7261646E656C6143, 0xE800000000000000, a1);
}

uint64_t sub_100666444(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = static os_log_type_t.fault.getter();
    uint64_t v9 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_10011EA98(0xD000000000000026, 0x80000001006A9A60, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_100666650()
{
  return swift_deallocObject();
}

id sub_100666690()
{
  return [*(id *)(v0 + 16) setContentScrollView:*(void *)(*(void *)(v0 + 24)+ OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_entryCollectionView) forEdge:1];
}

uint64_t sub_1006666B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1006666C4()
{
  return swift_release();
}

uint64_t sub_1006666CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100666714(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  uint64_t v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10011EA98(1819242306, 0xE400000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_100026DF8(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_100666918@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954(&qword_1007FD6E8, (uint64_t (*)(void))&type metadata accessor for ControlSize, 0x536C6F72746E6F43, 0xEB00000000657A69, a1);
}

uint64_t sub_100666954@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = type metadata accessor for EnvironmentValues();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100010218(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B220(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = static os_log_type_t.fault.getter();
    id v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v25 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_10011EA98(v27, v25, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_100666C0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954((uint64_t *)&unk_1007FF130, (uint64_t (*)(void))&type metadata accessor for Locale, 0x656C61636F4CLL, 0xE600000000000000, a1);
}

uint64_t sub_100666C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954(&qword_1007FF140, (uint64_t (*)(void))&type metadata accessor for TimeZone, 0x656E6F5A656D6954, 0xE800000000000000, a1);
}

uint64_t sub_100666C70(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = static os_log_type_t.fault.getter();
    uint64_t v9 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_10011EA98(0xD000000000000013, 0x800000010068C820, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

double sub_100666E78(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  uint64_t v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10011EA98(0x656C62756F44, 0xE600000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_100026DF8(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_100667080@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954((uint64_t *)&unk_1008156D0, (uint64_t (*)(void))&type metadata accessor for DismissAction, 0x417373696D736944, 0xED00006E6F697463, a1);
}

uint64_t sub_1006670C0(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = static os_log_type_t.fault.getter();
    uint64_t v9 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_10011EA98(0x67696C4174786554, 0xED0000746E656D6ELL, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_100026DF8(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_1006672D4@<X0>(uint64_t a1@<X8>)
{
  return sub_10066784C((uint64_t *)&unk_1008156C0, (uint64_t (*)(char *, uint64_t))sub_100667F38, 0xD000000000000020, 0x80000001006A9A90, a1);
}

uint64_t sub_10066730C@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954(&qword_100807970, (uint64_t (*)(void))&type metadata accessor for OpenURLAction, 0x414C52556E65704FLL, 0xED00006E6F697463, a1);
}

double sub_10066734C(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  uint64_t v9 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10011EA98(0x74616F6C464743, 0xE700000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  sub_100026DF8(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_100667558@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954((uint64_t *)&unk_1008156B0, (uint64_t (*)(void))&type metadata accessor for LayoutDirection, 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_100667598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for EnvironmentValues();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 0x100) != 0)
  {
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain();
    os_log_type_t v10 = static os_log_type_t.fault.getter();
    uint64_t v11 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v15 = v13 + 4;
      uint64_t v17 = sub_10011EA98(0xD00000000000001CLL, 0x80000001006A9AC0, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    sub_1005F6678(a1, a2, a3, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v18;
  }
  return a1;
}

uint64_t sub_1006677D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100666954(&qword_1008156E0, (uint64_t (*)(void))&type metadata accessor for RedactionReasons, 0xD000000000000010, 0x80000001006A9AE0, a1);
}

uint64_t sub_10066780C@<X0>(uint64_t a1@<X8>)
{
  return sub_10066784C(&qword_100813370, (uint64_t (*)(char *, uint64_t))sub_100615AD8, 0x7374686769736E49, 0xEE00796C696D6146, a1);
}

uint64_t sub_10066784C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(char *, uint64_t)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = type metadata accessor for EnvironmentValues();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100010218(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B220(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return a2(v17, a5);
  }
  os_log_type_t v19 = static os_log_type_t.fault.getter();
  os_log_type_t v20 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v20, v19))
  {
    unint64_t v24 = a4;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v25 = a5;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315138;
    uint64_t v27 = sub_10011EA98(v26, v24, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

void sub_100667AD4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for InsightsCalendarDetailTabView(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100010218((uint64_t *)&unk_1007FF070);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DateComponents();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v34 - v15;
  *(void *)&double v18 = __chkstk_darwin(v17).n128_u64[0];
  os_log_type_t v20 = (char *)&v34 - v19;
  id v21 = [a1 viewControllers:v18];
  if (!v21) {
    return;
  }
  uint64_t v22 = v21;
  uint64_t v34 = v2;
  sub_10038625C();
  unint64_t v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v33) {
      goto LABEL_4;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_16;
  }
LABEL_4:
  if ((v23 & 0xC000000000000001) != 0)
  {
    id v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v24 = *(id *)(v23 + 32);
  }
  id v35 = v24;
  swift_bridgeObjectRelease();
  type metadata accessor for InsightsEntriesViewController();
  uint64_t v25 = swift_dynamicCastClass();
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = v25 + OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_currentDate;
    swift_beginAccess();
    sub_10001B220(v27, (uint64_t)v9, (uint64_t *)&unk_1007FF070);
    uint64_t v28 = v11;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {

      sub_10001457C((uint64_t)v9, (uint64_t *)&unk_1007FF070);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v20, v9, v10);
      [a1 setContentScrollView:*(void *)(v26 + OBJC_IVAR____TtC7Journal36JournalEntryCollectionViewController_entryCollectionView) forEdge:1];
      uint64_t v30 = v34 + OBJC_IVAR____TtCV7Journal29InsightsCalendarDetailTabView11Coordinator_configuration;
      swift_beginAccess();
      sub_1006661F0(v30, (uint64_t)v6);
      id v31 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
      v31(v16, v20, v10);
      v31(v13, v16, v10);
      sub_100010218((uint64_t *)&unk_1008155A0);
      Binding.wrappedValue.setter();
      uint64_t v32 = *(void (**)(char *, uint64_t))(v28 + 8);
      v32(v16, v10);

      sub_100666254((uint64_t)v6);
      v32(v20, v10);
    }
  }
  else
  {
    id v29 = v35;
  }
}

ValueMetadata *_s25__Key_navigationDirectionVMa()
{
  return &_s25__Key_navigationDirectionVN;
}

uint64_t sub_100667F38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_100807978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ForModuleLookup()
{
  return self;
}

id sub_100667FC4()
{
  type metadata accessor for ForModuleLookup();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10083EE60 = (uint64_t)result;
  return result;
}

void sub_10066801C(uint64_t a1, void *a2, void *a3, char a4)
{
  uint64_t v8 = sub_100010218((uint64_t *)&unk_100800A60);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [self defaultWorkspace];
  if (v11)
  {
    uint64_t v12 = v11;
    sub_10001B220(a1, (uint64_t)v10, (uint64_t *)&unk_100800A60);
    uint64_t v13 = type metadata accessor for URL();
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v16 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13) != 1)
    {
      URL._bridgeToObjectiveC()(v15);
      uint64_t v16 = v17;
      (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
    }
    id v18 = sub_1006681AC(a2, a3, a4 & 1);
    [v12 openURL:v16 configuration:v18 completionHandler:0];
  }
  else
  {
    __break(1u);
  }
}

id sub_1006681AC(void *a1, void *a2, char a3)
{
  id v6 = [objc_allocWithZone((Class)_LSOpenConfiguration) init];
  [v6 setSensitive:1];
  id v7 = sub_100668328(a1, a2);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v7 _currentOpenApplicationEndpoint];
  }
  else
  {
    id v9 = 0;
  }
  [v6 setTargetConnectionEndpoint:v9];

  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  id v18 = &type metadata for Bool;
  LOBYTE(v17) = a3 & 1;
  sub_10002102C(&v17, v16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100599164(v16, v10, v12, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v6 setFrontBoardOptions:isa];

  return v6;
}

id sub_100668328(void *a1, id a2)
{
  id v3 = a1;
  if (!a1)
  {
    if (a2)
    {
      if ([a2 sender])
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v9, 0, sizeof(v9));
      }
      sub_1000685B8((uint64_t)v9, (uint64_t)&v10);
      if (*((void *)&v11 + 1))
      {
        sub_10001B220((uint64_t)&v10, (uint64_t)v9, &qword_1007FAD50);
        sub_10001B284(0, (unint64_t *)&qword_10080CF00);
        if (swift_dynamicCast())
        {
          id v3 = v8;
LABEL_18:
          _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v9);
          goto LABEL_19;
        }
        sub_10001B284(0, &qword_1007FBAF0);
        if (swift_dynamicCast())
        {
          id v3 = [v8 windowScene];

          goto LABEL_18;
        }
        sub_10001B284(0, (unint64_t *)&qword_100802730);
        if (swift_dynamicCast())
        {
          id v4 = [v8 window];
          if (v4)
          {
            uint64_t v5 = v4;
            id v3 = [v4 windowScene];
          }
          else
          {

            id v3 = 0;
          }
          goto LABEL_18;
        }
        _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v9);
        id v3 = 0;
      }
      else
      {
        id v3 = 0;
      }
    }
    else
    {
      id v3 = 0;
      long long v10 = 0u;
      long long v11 = 0u;
    }
LABEL_19:
    sub_10001457C((uint64_t)&v10, &qword_1007FAD50);
  }
  id v6 = a1;
  return v3;
}

id sub_1006686A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsOpenSensitiveURLAction();
  return [super dealloc];
}

uint64_t type metadata accessor for SettingsOpenSensitiveURLAction()
{
  return self;
}

char *sub_100668700(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_contentView;
  id v10 = objc_allocWithZone((Class)UIView);
  long long v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  uint64_t v12 = OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_fillView;
  *(void *)&v11[v12] = [objc_allocWithZone((Class)UIView) init];

  v56.receiver = v11;
  v56.super_class = (Class)type metadata accessor for PlatterBackgroundEffectView();
  uint64_t v13 = (char *)objc_msgSendSuper2(&v56, "initWithFrame:", a1, a2, a3, a4);
  id v14 = [v13 layer];
  [v14 setCornerRadius:12.0];

  id v15 = [v13 layer];
  [v15 setCornerCurve:kCACornerCurveContinuous];

  id v16 = [v13 layer];
  LODWORD(v17) = 1.0;
  [v16 setShadowOpacity:v17];

  id v18 = [v13 layer];
  if (qword_1007F7460 != -1) {
    swift_once();
  }
  [v18 shadowOffset];
  [v18 setShadowOffset:];

  id v19 = [v13 layer];
  if (qword_1007F7458 != -1) {
    swift_once();
  }
  [v19 setShadowRadius:*(double *)&qword_10083DA68];

  id v20 = [v13 layer];
  [v20 setShadowPathIsBounds:1];

  uint64_t v21 = OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_fillView;
  uint64_t v22 = *(void **)&v13[OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_fillView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 setClipsToBounds:1];
  id v23 = [v22 layer];
  [v23 setCornerRadius:12.0];

  id v24 = [*(id *)&v13[v21] layer];
  [v24 setCornerCurve:kCACornerCurveContinuous];

  uint64_t v25 = *(void **)&v13[v21];
  [v13 addSubview:v25];
  uint64_t v26 = OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_contentView;
  uint64_t v27 = *(void **)&v13[OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_contentView];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 addSubview:v27];
  id v55 = self;
  sub_100010218((uint64_t *)&unk_1007FA1C0);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1006E41B0;
  id v29 = [v25 topAnchor];
  id v30 = [v13 topAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  *(void *)(v28 + 32) = v31;
  id v32 = [*(id *)&v13[v21] leadingAnchor];
  id v33 = [v13 leadingAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33];

  *(void *)(v28 + 40) = v34;
  id v35 = [*(id *)&v13[v21] bottomAnchor];
  id v36 = [v13 bottomAnchor];
  id v37 = [v35 constraintEqualToAnchor:v36];

  *(void *)(v28 + 48) = v37;
  id v38 = [*(id *)&v13[v21] trailingAnchor];
  id v39 = [v13 trailingAnchor];
  id v40 = [v38 constraintEqualToAnchor:v39];

  *(void *)(v28 + 56) = v40;
  id v41 = [*(id *)&v13[v26] topAnchor];
  id v42 = [v13 topAnchor];
  id v43 = [v41 constraintEqualToAnchor:v42];

  *(void *)(v28 + 64) = v43;
  id v44 = [*(id *)&v13[v26] leadingAnchor];
  id v45 = [v13 leadingAnchor];
  id v46 = [v44 constraintEqualToAnchor:v45];

  *(void *)(v28 + 72) = v46;
  id v47 = [*(id *)&v13[v26] bottomAnchor];
  id v48 = [v13 bottomAnchor];
  id v49 = [v47 constraintEqualToAnchor:v48];

  *(void *)(v28 + 80) = v49;
  id v50 = [*(id *)&v13[v26] trailingAnchor];
  id v51 = [v13 trailingAnchor];
  id v52 = [v50 constraintEqualToAnchor:v51];

  *(void *)(v28 + 88) = v52;
  specialized Array._endMutation()();
  sub_10001B284(0, (unint64_t *)&qword_1008059B0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v55 activateConstraints:isa];

  return v13;
}

uint64_t sub_100668DDC(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_contentView;
  id v4 = objc_allocWithZone((Class)UIView);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_fillView;
  id v7 = [objc_allocWithZone((Class)UIView) init];

  *(void *)&v5[v6] = v7;
  id v8 = *(void **)&v5[v6];

  type metadata accessor for PlatterBackgroundEffectView();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_100668EC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ColorResource();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for PlatterBackgroundEffectView();
  v23.receiver = v0;
  v23.super_class = v6;
  [super layoutSubviews];
  id v7 = [v0 layer];
  sub_10001B284(0, (unint64_t *)&qword_1007FC140);
  if (qword_1007F7FB0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100026A54(v2, (uint64_t)qword_10083F030);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9(v5, v8, v2);
  id v10 = (void *)UIColor.init(resource:)();
  id v11 = [v10 CGColor];

  [v7 setShadowColor:v11];
  id v12 = [v0 layer];
  id v13 = [v0 traitCollection];
  id v14 = [v13 userInterfaceStyle];

  [v12 setAllowsGroupBlending:v14 != (id)2];
  id v15 = *(void **)&v0[OBJC_IVAR____TtC7Journal27PlatterBackgroundEffectView_fillView];
  if (qword_1007F7FA8 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100026A54(v2, (uint64_t)qword_10083F018);
  v9(v5, v16, v2);
  double v17 = (void *)UIColor.init(resource:)();
  [v15 setBackgroundColor:v17];

  id v18 = [v15 layer];
  id v19 = [v1 traitCollection];
  id v20 = [v19 userInterfaceStyle];

  if (v20 == (id)2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v21 = 0;
  }
  [v18 setCompositingFilter:v21];

  return swift_unknownObjectRelease();
}

id sub_100669248()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlatterBackgroundEffectView();
  [super dealloc];
}

uint64_t type metadata accessor for PlatterBackgroundEffectView()
{
  return self;
}

uint64_t *sub_1006692EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for CalendarBinningUnit(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_100010218(&qword_1007FD190);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = type metadata accessor for Calendar.Component();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = *(int *)(v7 + 20);
      id v13 = (char *)a1 + v12;
      id v14 = (char *)a2 + v12;
      uint64_t v15 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
      uint64_t v16 = *(int *)(v7 + 24);
      double v17 = (char *)a1 + v16;
      id v18 = (char *)a2 + v16;
      uint64_t v19 = type metadata accessor for Calendar();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v20 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v20) = *(uint64_t *)((char *)a2 + v20);
  }
  return a1;
}

uint64_t type metadata accessor for CalendarBinningUnit(uint64_t a1)
{
  return sub_10003352C(a1, qword_1008158D8);
}

uint64_t sub_100669540(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = type metadata accessor for Calendar.Component();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    uint64_t v5 = a1 + *(int *)(v2 + 20);
    uint64_t v6 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    uint64_t v7 = a1 + *(int *)(v2 + 24);
    uint64_t v8 = type metadata accessor for Calendar();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v7, v8);
  }
  return result;
}

char *sub_100669680(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100010218(&qword_1007FD190);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = type metadata accessor for Calendar.Component();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    uint64_t v10 = *(int *)(v6 + 20);
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = *(int *)(v6 + 24);
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = type metadata accessor for Calendar();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  return a1;
}

char *sub_100669864(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v22 = type metadata accessor for Calendar.Component();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 24))(a1, a2, v22);
      uint64_t v23 = *(int *)(v6 + 20);
      id v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      uint64_t v26 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
      uint64_t v27 = *(int *)(v6 + 24);
      uint64_t v28 = &a1[v27];
      id v29 = &a2[v27];
      uint64_t v30 = type metadata accessor for Calendar();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
      goto LABEL_7;
    }
    sub_10066CBE4((uint64_t)a1, type metadata accessor for CalendarBinningUnit);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v20 = sub_100010218(&qword_1007FD190);
    memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = type metadata accessor for Calendar.Component();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  uint64_t v12 = *(int *)(v6 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = *(int *)(v6 + 24);
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = type metadata accessor for Calendar();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *sub_100669B5C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_100010218(&qword_1007FD190);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = type metadata accessor for Calendar.Component();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    uint64_t v10 = *(int *)(v6 + 20);
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    uint64_t v14 = *(int *)(v6 + 24);
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = type metadata accessor for Calendar();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v18 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  return a1;
}

char *sub_100669D40(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v23 = type metadata accessor for Calendar.Component();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 40))(a1, a2, v23);
      uint64_t v24 = *(int *)(v6 + 20);
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      uint64_t v27 = type metadata accessor for Date();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
      uint64_t v28 = *(int *)(v6 + 24);
      id v29 = &a1[v28];
      uint64_t v30 = &a2[v28];
      uint64_t v31 = type metadata accessor for Calendar();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 40))(v29, v30, v31);
      goto LABEL_7;
    }
    sub_10066CBE4((uint64_t)a1, type metadata accessor for CalendarBinningUnit);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v20 = sub_100010218(&qword_1007FD190);
    memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v11 = type metadata accessor for Calendar.Component();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  uint64_t v12 = *(int *)(v6 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = type metadata accessor for Date();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = *(int *)(v6 + 24);
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = type metadata accessor for Calendar();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v21 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v21] = *(void *)&a2[v21];
  return a1;
}

uint64_t sub_10066A034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10066A048);
}

uint64_t sub_10066A048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD190);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10066A0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10066A0CC);
}

uint64_t sub_10066A0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100010218(&qword_1007FD190);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for UniformDateBins(uint64_t a1)
{
  return sub_10003352C(a1, (uint64_t *)&unk_100815838);
}

void sub_10066A160()
{
  sub_10066A1FC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10066A1FC()
{
  if (!qword_100815848)
  {
    type metadata accessor for CalendarBinningUnit(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100815848);
    }
  }
}

uint64_t *sub_10066A254(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Calendar.Component();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int v9 = (char *)a1 + v8;
    int v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Date();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for Calendar();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_10066A3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Calendar.Component();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = type metadata accessor for Calendar();
  int v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t sub_10066A49C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar.Component();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_10066A5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar.Component();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_10066A6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar.Component();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_10066A7B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar.Component();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Calendar();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_10066A8BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10066A8D0);
}

uint64_t sub_10066A8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Calendar.Component();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for Calendar();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t sub_10066AA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10066AA30);
}

uint64_t sub_10066AA30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Calendar.Component();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for Calendar();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

uint64_t sub_10066AB88()
{
  uint64_t result = type metadata accessor for Calendar.Component();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Date();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for Calendar();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_10066AC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v39 = a1;
  uint64_t v44 = a2;
  uint64_t v45 = sub_100010218(&qword_1007FD188);
  __chkstk_darwin(v45);
  id v42 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v41 = (char *)&v38 - v6;
  uint64_t v7 = sub_100010218(&qword_1007FC8E0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v43 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v40 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v16 = sub_100010218(&qword_1007FD190);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100010218(&qword_1007FD198);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B220(v3, (uint64_t)v18, &qword_1007FD190);
  uint64_t v22 = type metadata accessor for CalendarBinningUnit(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v18, 1, v22) == 1)
  {
    sub_10001457C((uint64_t)v18, &qword_1007FD190);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v21, 1, 1, v7);
LABEL_5:
    Date.init(timeIntervalSinceReferenceDate:)();
    Date.init(timeIntervalSinceReferenceDate:)();
    sub_10066CB38((unint64_t *)&qword_1007FD120, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v25 = v10;
    uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
    if (result)
    {
      uint64_t v38 = v7;
      uint64_t v39 = (uint64_t)v21;
      uint64_t v26 = v45;
      uint64_t v28 = v40;
      uint64_t v27 = v41;
      id v29 = &v41[*(int *)(v45 + 48)];
      uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
      v30(v41, v15, v25);
      v30(v29, v12, v25);
      uint64_t v31 = *(int *)(v26 + 48);
      id v32 = v42;
      id v33 = &v42[v31];
      id v34 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
      v34(v42, v27, v25);
      v34(v33, v29, v25);
      uint64_t v35 = (uint64_t)v43;
      v30(v43, v32, v25);
      id v36 = *(void (**)(char *, uint64_t))(v28 + 8);
      v36(v33, v25);
      id v37 = &v32[*(int *)(v45 + 48)];
      v30(v32, v27, v25);
      v30(v37, v29, v25);
      v30((char *)(v35 + *(int *)(v38 + 36)), v37, v25);
      v36(v32, v25);
      sub_100476304(v35, v44);
      return sub_10001457C(v39, &qword_1007FD198);
    }
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v23 = *(void *)(v3 + *(int *)(type metadata accessor for UniformDateBins(0) + 20));
  uint64_t result = v23 + v39;
  if (!__OFADD__(v23, v39))
  {
    sub_10066C1A4(result, v21);
    sub_10066CBE4((uint64_t)v18, type metadata accessor for CalendarBinningUnit);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v21, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v21, 1, v7) != 1) {
      return sub_100476304((uint64_t)v21, v44);
    }
    goto LABEL_5;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10066B1E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v72 = a3;
  uint64_t v7 = type metadata accessor for DateComponents();
  uint64_t v64 = *(void *)(v7 - 8);
  uint64_t v65 = v7;
  __chkstk_darwin(v7);
  uint64_t v63 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v66 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010218(&qword_1007FC8E0);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100010218(&qword_1007F9BE8);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100010218((uint64_t *)&unk_1007FC470);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for Date();
  uint64_t v69 = *(void *)(v21 - 8);
  uint64_t v70 = v21;
  __n128 v22 = __chkstk_darwin(v21);
  char v71 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56);
  uint64_t v68 = v9;
  char v59 = v24;
  uint64_t v60 = v10 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))v24)(a4, 1, 1, v9, v22);
  uint64_t v25 = type metadata accessor for UniformDateBins(0);
  uint64_t v58 = *(int *)(v25 + 20);
  *(void *)(a4 + v58) = 0;
  uint64_t v26 = *(int *)(v25 + 24);
  uint64_t v61 = a4;
  uint64_t v57 = v26;
  *(void *)(a4 + v26) = 1;
  uint64_t v27 = a1;
  Calendar.dateInterval(of:for:)();
  uint64_t v28 = type metadata accessor for DateInterval();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v17, 1, v28) == 1)
  {
    sub_10001457C((uint64_t)v17, &qword_1007F9BE8);
    uint64_t v30 = 1;
  }
  else
  {
    DateInterval.start.getter();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v28);
    uint64_t v30 = 0;
  }
  uint64_t v31 = v69;
  uint64_t v32 = v70;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56))(v20, v30, 1, v70);
  sub_10001B220(a2, (uint64_t)v14, &qword_1007FC8E0);
  int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48))(v20, 1, v32);
  id v34 = v71;
  uint64_t v67 = a2;
  if (v33 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v71, v14, v32);
    sub_10001457C((uint64_t)v14, &qword_1007FC8E0);
    sub_10001457C((uint64_t)v20, (uint64_t *)&unk_1007FC470);
  }
  else
  {
    sub_10001457C((uint64_t)v14, &qword_1007FC8E0);
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v34, v20, v32);
  }
  uint64_t v35 = v31;
  uint64_t v36 = type metadata accessor for Calendar.Component();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v62 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  uint64_t v38 = (uint64_t)v66;
  v62(v66, v27, v36);
  uint64_t v39 = v68;
  uint64_t v40 = *(int *)(v68 + 20);
  uint64_t v55 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v38 + v40, v71, v32);
  uint64_t v41 = v38 + *(int *)(v39 + 24);
  uint64_t v42 = type metadata accessor for Calendar();
  uint64_t v43 = *(void *)(v42 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v41, v72, v42);
  sub_100010218(&qword_1007FB058);
  uint64_t v56 = v37;
  unint64_t v44 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1006D6280;
  v62((char *)(v45 + v44), v38, v36);
  sub_1000F5AEC(v45);
  swift_setDeallocating();
  uint64_t v46 = v36;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  id v47 = v63;
  uint64_t v48 = v67;
  Calendar.dateComponents(_:from:to:)();
  swift_bridgeObjectRelease();
  uint64_t v49 = DateComponents.value(for:)();
  char v51 = v50;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v47, v65);
  if (v51)
  {
    __break(1u);
  }
  else
  {
    uint64_t v53 = sub_10066BD94(v48);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v72, v42);
    sub_10001457C(v48, &qword_1007FC8E0);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v46);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v70);
    uint64_t v54 = v61;
    sub_10001457C(v61, &qword_1007FD190);
    sub_10066D07C(v38, v54, type metadata accessor for CalendarBinningUnit);
    uint64_t result = v59(v54, 0, 1, v68);
    *(void *)(v54 + v58) = v49;
    *(void *)(v54 + v57) = v53;
  }
  return result;
}

uint64_t sub_10066B940()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DateComponents();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100010218(&qword_1007FD190);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B220(v1, (uint64_t)v8, &qword_1007FD190);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10001457C((uint64_t)v8, &qword_1007FD190);
    return 0;
  }
  uint64_t v23 = v1;
  sub_10066D07C((uint64_t)v8, (uint64_t)v12, type metadata accessor for CalendarBinningUnit);
  sub_100010218(&qword_1007FB058);
  uint64_t v14 = type metadata accessor for Calendar.Component();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v24 = v2;
  uint64_t v17 = (v16 + 32) & ~v16;
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1006D6280;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v18 + v17, v12, v14);
  sub_1000F5AEC(v18);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  Calendar.dateComponents(_:from:to:)();
  swift_bridgeObjectRelease();
  uint64_t v19 = DateComponents.value(for:)();
  char v21 = v20;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v24);
  if (v21) {
    goto LABEL_7;
  }
  sub_10066CBE4((uint64_t)v12, type metadata accessor for CalendarBinningUnit);
  uint64_t v22 = *(void *)(v23 + *(int *)(type metadata accessor for UniformDateBins(0) + 20));
  uint64_t result = v19 - v22;
  if (__OFSUB__(v19, v22))
  {
    __break(1u);
LABEL_7:
    __break(1u);
  }
  return result;
}

uint64_t sub_10066BCB8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  if (a2)
  {
    unint64_t v3 = a3 - result;
    if (a3 - result >= (unint64_t)(a2 - 1)) {
      unint64_t v3 = a2 - 1;
    }
    if (v3 >= (result ^ 0x7FFFFFFFFFFFFFFFuLL)) {
      unint64_t v3 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v4 = v3 + 1;
    if (v4 >= 5)
    {
      uint64_t v7 = v4 & 3;
      if ((v4 & 3) == 0) {
        uint64_t v7 = 4;
      }
      unint64_t v5 = v4 - v7;
      int64x2_t v8 = 0uLL;
      v9.i64[0] = 0;
      v9.i64[1] = result;
      int64x2_t v10 = vdupq_n_s64(1uLL);
      unint64_t v11 = v5;
      do
      {
        int64x2_t v8 = vaddq_s64(v8, v10);
        int64x2_t v9 = vaddq_s64(v9, v10);
        v11 -= 4;
      }
      while (v11);
      uint64_t v6 = vaddvq_s64(vaddq_s64(vzip1q_s64(v9, v8), vzip2q_s64(v9, v8)));
    }
    else
    {
      unint64_t v5 = 0;
      uint64_t v6 = result;
    }
    uint64_t v12 = v5 + result - 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = v5 + result - a3;
    uint64_t v14 = a2 - v5;
    uint64_t result = v6;
    while (1)
    {
      if (!v13) {
        return 0;
      }
      if (!v12) {
        break;
      }
      ++result;
      ++v12;
      ++v13;
      if (!--v14) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

uint64_t sub_10066BD94(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v40 = sub_100010218(&qword_1007FC8E0);
  __chkstk_darwin(v40);
  uint64_t v32 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v31 = (char *)&v30 - v5;
  uint64_t v43 = type metadata accessor for DateComponents();
  uint64_t v6 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  int64x2_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v42 = v2 + *(int *)(v9 + 24);
  uint64_t v10 = sub_100010218(&qword_1007FB058);
  uint64_t v11 = type metadata accessor for Calendar.Component();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v37 = v14 + *(void *)(v12 + 72);
  uint64_t v38 = v10;
  uint64_t v36 = v13 | 7;
  uint64_t v15 = swift_allocObject();
  long long v34 = xmmword_1006D6280;
  *(_OWORD *)(v15 + 16) = xmmword_1006D6280;
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v35(v15 + v14, v2, v11);
  sub_1000F5AEC(v15);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v33 = v2 + *(int *)(v9 + 20);
  Calendar.dateComponents(_:from:to:)();
  swift_bridgeObjectRelease();
  uint64_t v16 = DateComponents.value(for:)();
  LOBYTE(v9) = v17;
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t v39 = v6 + 8;
  uint64_t result = v18(v8, v43);
  if (v9) {
    goto LABEL_14;
  }
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v34;
  v35(v20 + v14, v2, v11);
  sub_1000F5AEC(v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  Calendar.dateComponents(_:from:to:)();
  swift_bridgeObjectRelease();
  uint64_t v21 = DateComponents.value(for:)();
  char v23 = v22;
  uint64_t result = v18(v8, v43);
  if ((v23 & 1) == 0)
  {
    uint64_t v24 = v31;
    sub_10066C1A4(v16, v31);
    uint64_t v25 = v32;
    uint64_t result = sub_10066C1A4(v21, v32);
    uint64_t v26 = v21 - v16;
    if (__OFSUB__(v21, v16))
    {
      __break(1u);
    }
    else
    {
      uint64_t v27 = v26 + 1;
      if (!__OFADD__(v26, 1))
      {
        uint64_t result = static Date.== infix(_:_:)();
        if ((result & 1) == 0 || (BOOL v28 = __OFSUB__(v27, 1), --v27, !v28))
        {
          char v29 = static Date.== infix(_:_:)();
          sub_10001457C((uint64_t)v25, &qword_1007FC8E0);
          uint64_t result = sub_10001457C((uint64_t)v24, &qword_1007FC8E0);
          if ((v29 & 1) == 0) {
            return v27;
          }
          BOOL v28 = __OFSUB__(v27--, 1);
          if (!v28) {
            return v27;
          }
          goto LABEL_13;
        }
LABEL_12:
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_10066C1A4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v44 = sub_100010218(&qword_1007FD188);
  __chkstk_darwin(v44);
  uint64_t v39 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v38 = (char *)&v37 - v6;
  uint64_t v7 = sub_100010218((uint64_t *)&unk_1007FC470);
  __chkstk_darwin(v7 - 8);
  uint64_t v42 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v37 - v10;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v41 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  char v17 = (char *)&v37 - v16;
  type metadata accessor for CalendarBinningUnit(0);
  uint64_t v43 = v2;
  uint64_t v18 = a1;
  Calendar.date(byAdding:value:to:wrappingComponents:)();
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  uint64_t result = v19(v11, 1, v12);
  if (result == 1) {
    goto LABEL_8;
  }
  uint64_t v37 = v13;
  uint64_t v21 = *(uint64_t (**)(char *, char *, uint64_t))(v13 + 32);
  uint64_t result = v21(v17, v11, v12);
  if (__OFADD__(v18, 1))
  {
    __break(1u);
LABEL_7:
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  char v22 = v42;
  Calendar.date(byAdding:value:to:wrappingComponents:)();
  uint64_t result = v19(v22, 1, v12);
  if (result != 1)
  {
    char v23 = v41;
    v21(v41, v22, v12);
    sub_10066CB38((unint64_t *)&qword_1007FD120, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t result = dispatch thunk of static Comparable.<= infix(_:_:)();
    if (result)
    {
      uint64_t v24 = v44;
      uint64_t v25 = v38;
      uint64_t v26 = &v38[*(int *)(v44 + 48)];
      v21(v38, v17, v12);
      uint64_t v27 = (void (*)(char *, char *, uint64_t))v21;
      BOOL v28 = v26;
      v27(v26, v23, v12);
      char v29 = v39;
      uint64_t v30 = &v39[*(int *)(v24 + 48)];
      uint64_t v31 = v37;
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
      v32(v39, v25, v12);
      v32(v30, v28, v12);
      uint64_t v33 = v40;
      v27(v40, v29, v12);
      long long v34 = *(void (**)(char *, uint64_t))(v31 + 8);
      v34(v30, v12);
      uint64_t v35 = &v29[*(int *)(v44 + 48)];
      v27(v29, v25, v12);
      v27(v35, v28, v12);
      uint64_t v36 = sub_100010218(&qword_1007FC8E0);
      v27(&v33[*(int *)(v36 + 36)], v35, v12);
      return ((uint64_t (*)(char *, uint64_t))v34)(v29, v12);
    }
    goto LABEL_7;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10066C5E8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(v2 + *(int *)(result + 24));
  return result;
}

void (*sub_10066C5F8(void *a1, uint64_t *a2))(uint64_t *a1)
{
  uint64_t v4 = sub_100010218(&qword_1007FC8E0);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  *a1 = v5;
  sub_10066AC8C(*a2, (uint64_t)v5);
  return sub_10066C678;
}

void sub_10066C678(uint64_t *a1)
{
  uint64_t v1 = (void *)*a1;
  sub_10001457C(*a1, &qword_1007FC8E0);

  free(v1);
}

uint64_t *sub_10066C6BC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(void *)(v3 + *(int *)(a2 + 24));
  if (v5 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v6 = *result;
  if (*result < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v7 = result[1];
  if (v5 >= v7)
  {
    uint64_t v8 = sub_100010218(&qword_100815940);
    uint64_t result = (uint64_t *)sub_10066CB80(v3, (uint64_t)a3 + *(int *)(v8 + 40));
    *a3 = v6;
    a3[1] = v7;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10066C730@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10066CB80(v2, a2);
  uint64_t result = sub_100010218(&qword_100815930);
  *(void *)(a2 + *(int *)(result + 36)) = 0;
  *(void *)(a2 + *(int *)(result + 40)) = *(void *)(v2 + *(int *)(a1 + 24));
  return result;
}

BOOL sub_10066C78C(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 24)) == 0;
}

void sub_10066C7A4(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *sub_10066C7B4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = *result;
    if (!a2)
    {
LABEL_6:
      *a3 = v3;
      return result;
    }
    unint64_t v4 = v3 ^ 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v5 = a2 - 1;
    while (v4 > v5)
    {
      ++v3;
      if (!--a2) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10066C7EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_10066BCB8(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *sub_10066C824(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  if (*a2 < *result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*a2 == *result) {
    return 0;
  }
  unint64_t v4 = (uint64_t *)(v3 - v2);
  if (v3 > v2)
  {
    uint64_t result = 0;
    unint64_t v5 = v3 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t result = (uint64_t *)((char *)result + 1);
      if (v4 == result) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *sub_10066C87C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *sub_10066C898(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

void *sub_10066C8B4(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *sub_10066C8D0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_10066C8E8(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

uint64_t sub_10066C900@<X0>(uint64_t a1@<X8>)
{
  sub_10066D07C(v1, a1, type metadata accessor for UniformDateBins);
  uint64_t result = sub_100010218(&qword_1007FD1A0);
  *(void *)(a1 + *(int *)(result + 36)) = 0;
  return result;
}

uint64_t sub_10066C954(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + *(int *)(a1 + 24));
  if (result < 0) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10066C968()
{
  sub_1000CC8C8(v0);
  uint64_t v2 = v1;
  sub_10066CBE4(v0, type metadata accessor for UniformDateBins);
  return v2;
}

uint64_t sub_10066C9B4()
{
  if ((static Calendar.Component.== infix(_:_:)() & 1) == 0 || (static Date.== infix(_:_:)() & 1) == 0) {
    return 0;
  }

  return static Calendar.== infix(_:_:)();
}

uint64_t sub_10066CA30()
{
  return sub_100014488(&qword_100815918, &qword_1007FD1A0);
}

uint64_t sub_10066CA6C()
{
  return sub_10066CB38(&qword_100815920, (void (*)(uint64_t))type metadata accessor for UniformDateBins);
}

void *sub_10066CAB4()
{
  return &protocol witness table for Int;
}

uint64_t sub_10066CAC0()
{
  return sub_100014488(&qword_100815928, &qword_100815930);
}

uint64_t sub_10066CAFC()
{
  return sub_100014488(&qword_100815938, &qword_100815940);
}

uint64_t sub_10066CB38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10066CB80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UniformDateBins(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10066CBE4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL sub_10066CC44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CalendarBinningUnit(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100010218(qword_100815948);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010218(&qword_1007FD190);
  __chkstk_darwin(v12 - 8);
  uint64_t v31 = (uint64_t)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v28 - v15;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v28 - v18;
  uint64_t v29 = a1;
  sub_10001B220(a1, (uint64_t)&v28 - v18, &qword_1007FD190);
  uint64_t v30 = a2;
  sub_10001B220(a2, (uint64_t)v16, &qword_1007FD190);
  uint64_t v20 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_10001B220((uint64_t)v19, (uint64_t)v11, &qword_1007FD190);
  sub_10001B220((uint64_t)v16, v20, &qword_1007FD190);
  uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v21((uint64_t)v11, 1, v4) != 1)
  {
    uint64_t v24 = v31;
    sub_10001B220((uint64_t)v11, v31, &qword_1007FD190);
    if (v21(v20, 1, v4) != 1)
    {
      sub_10066D07C(v20, (uint64_t)v7, type metadata accessor for CalendarBinningUnit);
      if (static Calendar.Component.== infix(_:_:)() & 1) != 0 && (static Date.== infix(_:_:)())
      {
        char v27 = static Calendar.== infix(_:_:)();
        sub_10066CBE4((uint64_t)v7, type metadata accessor for CalendarBinningUnit);
        sub_10001457C((uint64_t)v16, &qword_1007FD190);
        sub_10001457C((uint64_t)v19, &qword_1007FD190);
        sub_10066CBE4(v24, type metadata accessor for CalendarBinningUnit);
        sub_10001457C((uint64_t)v11, &qword_1007FD190);
        if ((v27 & 1) == 0) {
          return 0;
        }
        goto LABEL_4;
      }
      sub_10066CBE4((uint64_t)v7, type metadata accessor for CalendarBinningUnit);
      sub_10001457C((uint64_t)v16, &qword_1007FD190);
      sub_10001457C((uint64_t)v19, &qword_1007FD190);
      sub_10066CBE4(v24, type metadata accessor for CalendarBinningUnit);
      uint64_t v26 = (uint64_t)v11;
      uint64_t v25 = &qword_1007FD190;
LABEL_14:
      sub_10001457C(v26, v25);
      return 0;
    }
    sub_10001457C((uint64_t)v16, &qword_1007FD190);
    sub_10001457C((uint64_t)v19, &qword_1007FD190);
    sub_10066CBE4(v24, type metadata accessor for CalendarBinningUnit);
LABEL_8:
    uint64_t v25 = qword_100815948;
    uint64_t v26 = (uint64_t)v11;
    goto LABEL_14;
  }
  sub_10001457C((uint64_t)v16, &qword_1007FD190);
  sub_10001457C((uint64_t)v19, &qword_1007FD190);
  if (v21(v20, 1, v4) != 1) {
    goto LABEL_8;
  }
  sub_10001457C((uint64_t)v11, &qword_1007FD190);
LABEL_4:
  uint64_t v22 = type metadata accessor for UniformDateBins(0);
  if (*(void *)(v29 + *(int *)(v22 + 20)) == *(void *)(v30 + *(int *)(v22 + 20))) {
    return *(void *)(v29 + *(int *)(v22 + 24)) == *(void *)(v30 + *(int *)(v22 + 24));
  }
  return 0;
}

uint64_t sub_10066D07C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10066D0E8()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t sub_10066D168@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v3 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v65 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  __chkstk_darwin(v3);
  uint64_t v64 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = type metadata accessor for ScrollBounceBehavior();
  uint64_t v62 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v61 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for ScrollIndicatorVisibility();
  uint64_t v59 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v68 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100014440(&qword_1008159D0);
  uint64_t v57 = a1[2];
  uint64_t v56 = a1[3];
  uint64_t v55 = a1[4];
  uint64_t v54 = a1[5];
  uint64_t v77 = v57;
  uint64_t v78 = v56;
  uint64_t v79 = v55;
  uint64_t v80 = v54;
  uint64_t v8 = type metadata accessor for InsightsCapsulePicker.ButtonStyle();
  uint64_t v9 = sub_100014488(&qword_1008159D8, &qword_1008159D0);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v77 = v7;
  uint64_t v78 = v8;
  uint64_t v79 = v9;
  uint64_t v80 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  sub_100014440(&qword_1008159E0);
  uint64_t v11 = type metadata accessor for _ConditionalContent();
  uint64_t v77 = v7;
  uint64_t v78 = v8;
  uint64_t v79 = v9;
  uint64_t v80 = WitnessTable;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v13 = sub_100671A7C();
  uint64_t v82 = OpaqueTypeConformance2;
  unint64_t v83 = v13;
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v15 = type metadata accessor for ForEachSubviewCollection();
  uint64_t v16 = type metadata accessor for Subview.ID();
  uint64_t v17 = swift_getWitnessTable();
  uint64_t v18 = sub_100672DF4(qword_1008159F0, (void (*)(uint64_t))&type metadata accessor for Subview.ID);
  uint64_t v77 = v15;
  uint64_t v78 = v16;
  uint64_t v79 = v11;
  uint64_t v80 = v17;
  uint64_t v81 = v18;
  type metadata accessor for ForEach();
  uint64_t v76 = v14;
  swift_getWitnessTable();
  type metadata accessor for LazyHStack();
  type metadata accessor for ModifiedContent();
  uint64_t v74 = swift_getWitnessTable();
  uint64_t v75 = &protocol witness table for _FixedSizeLayout;
  swift_getWitnessTable();
  uint64_t v19 = type metadata accessor for ScrollView();
  uint64_t v48 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)v46 - v20;
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v77 = v19;
  uint64_t v78 = v22;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v53 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  id v52 = (char *)v46 - v24;
  uint64_t v77 = v19;
  uint64_t v78 = v22;
  v46[0] = v22;
  uint64_t v25 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = OpaqueTypeMetadata2;
  uint64_t v78 = v25;
  uint64_t v26 = swift_getOpaqueTypeMetadata2();
  uint64_t v50 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v49 = (char *)v46 - v27;
  uint64_t v77 = OpaqueTypeMetadata2;
  uint64_t v78 = v25;
  v46[1] = v25;
  uint64_t v28 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = v26;
  uint64_t v78 = v28;
  uint64_t v47 = v28;
  uint64_t v29 = swift_getOpaqueTypeMetadata2();
  uint64_t v51 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)v46 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  long long v34 = (char *)v46 - v33;
  static Axis.Set.horizontal.getter();
  uint64_t v69 = v57;
  uint64_t v70 = v56;
  uint64_t v71 = v55;
  uint64_t v72 = v54;
  uint64_t v73 = v58;
  ScrollView.init(_:showsIndicators:content:)();
  static ScrollIndicatorVisibility.hidden.getter();
  unsigned __int8 v35 = static Axis.Set.vertical.getter();
  unsigned __int8 v36 = static Axis.Set.horizontal.getter();
  Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v35) {
    Axis.Set.init(rawValue:)();
  }
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v36) {
    Axis.Set.init(rawValue:)();
  }
  uint64_t v37 = v52;
  uint64_t v38 = v68;
  View.scrollIndicators(_:axes:)();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v38, v60);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v21, v19);
  uint64_t v39 = v61;
  static ScrollBounceBehavior.basedOnSize.getter();
  LOBYTE(v38) = static Axis.Set.vertical.getter();
  Axis.Set.init(rawValue:)();
  Axis.Set.init(rawValue:)();
  if (Axis.Set.init(rawValue:)() != v38) {
    Axis.Set.init(rawValue:)();
  }
  uint64_t v40 = v49;
  View.scrollBounceBehavior(_:axes:)();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v63);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v37, OpaqueTypeMetadata2);
  uint64_t v41 = v64;
  static AccessibilityChildBehavior.contain.getter();
  uint64_t v42 = v47;
  View.accessibilityElement(children:)();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v41, v66);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v40, v26);
  uint64_t v77 = v26;
  uint64_t v78 = v42;
  uint64_t v43 = swift_getOpaqueTypeConformance2();
  sub_1000B29EC(v31, v29, v43);
  uint64_t v44 = *(void (**)(char *, uint64_t))(v51 + 8);
  v44(v31, v29);
  sub_1000B29EC(v34, v29, v43);
  return ((uint64_t (*)(char *, uint64_t))v44)(v34, v29);
}

uint64_t sub_10066DB78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v40 = a4;
  uint64_t v39 = a3;
  uint64_t v42 = a1;
  uint64_t v43 = a6;
  uint64_t v10 = type metadata accessor for PinnedScrollableViews();
  __chkstk_darwin(v10 - 8);
  uint64_t v41 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100014440(&qword_1008159D0);
  uint64_t v52 = a2;
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  uint64_t v55 = a5;
  uint64_t v13 = type metadata accessor for InsightsCapsulePicker.ButtonStyle();
  uint64_t v14 = sub_100014488(&qword_1008159D8, &qword_1008159D0);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v52 = v12;
  uint64_t v53 = v13;
  uint64_t v54 = v14;
  uint64_t v55 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  sub_100014440(&qword_1008159E0);
  uint64_t v16 = type metadata accessor for _ConditionalContent();
  uint64_t v52 = v12;
  uint64_t v53 = v13;
  uint64_t v54 = v14;
  uint64_t v55 = WitnessTable;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v18 = sub_100671A7C();
  uint64_t v57 = OpaqueTypeConformance2;
  unint64_t v58 = v18;
  uint64_t v19 = swift_getWitnessTable();
  uint64_t v20 = type metadata accessor for ForEachSubviewCollection();
  uint64_t v21 = type metadata accessor for Subview.ID();
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v23 = sub_100672DF4(qword_1008159F0, (void (*)(uint64_t))&type metadata accessor for Subview.ID);
  uint64_t v52 = v20;
  uint64_t v53 = v21;
  uint64_t v54 = v16;
  uint64_t v55 = v22;
  uint64_t v56 = v23;
  type metadata accessor for ForEach();
  uint64_t v51 = v19;
  swift_getWitnessTable();
  uint64_t v24 = type metadata accessor for LazyHStack();
  uint64_t v38 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v38 - v25;
  uint64_t v27 = type metadata accessor for ModifiedContent();
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v38 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v33 = (char *)&v38 - v32;
  uint64_t v44 = a2;
  uint64_t v45 = v39;
  uint64_t v46 = v40;
  uint64_t v47 = a5;
  uint64_t v48 = v42;
  static VerticalAlignment.center.getter();
  sub_10066D0E8();
  LazyHStack.init(alignment:spacing:pinnedViews:content:)();
  uint64_t v34 = swift_getWitnessTable();
  View.fixedSize(horizontal:vertical:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v24);
  uint64_t v49 = v34;
  uint64_t v50 = &protocol witness table for _FixedSizeLayout;
  uint64_t v35 = swift_getWitnessTable();
  sub_1000B29EC(v30, v27, v35);
  unsigned __int8 v36 = *(void (**)(char *, uint64_t))(v28 + 8);
  v36(v30, v27);
  sub_1000B29EC(v33, v27, v35);
  return ((uint64_t (*)(char *, uint64_t))v36)(v33, v27);
}

uint64_t sub_10066E05C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v53 = a6;
  uint64_t v56 = a2;
  uint64_t v57 = a3;
  uint64_t v47 = a5;
  uint64_t v48 = a2;
  uint64_t v58 = a4;
  uint64_t v59 = a5;
  uint64_t v54 = type metadata accessor for InsightsCapsulePicker();
  uint64_t v50 = *(void *)(v54 - 8);
  uint64_t v51 = *(void *)(v50 + 64);
  __chkstk_darwin(v54);
  uint64_t v49 = (char *)&v44 - v10;
  uint64_t v11 = *(void *)(a3 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100014440(&qword_1008159D0);
  uint64_t v56 = a2;
  uint64_t v57 = a3;
  uint64_t v16 = a3;
  uint64_t v58 = a4;
  uint64_t v59 = a5;
  uint64_t v17 = type metadata accessor for InsightsCapsulePicker.ButtonStyle();
  uint64_t v18 = sub_100014488(&qword_1008159D8, &qword_1008159D0);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v56 = v15;
  uint64_t v57 = v17;
  uint64_t v58 = v18;
  uint64_t v59 = WitnessTable;
  swift_getOpaqueTypeMetadata2();
  sub_100014440(&qword_1008159E0);
  uint64_t v20 = type metadata accessor for _ConditionalContent();
  uint64_t v56 = v15;
  uint64_t v57 = v17;
  uint64_t v58 = v18;
  uint64_t v59 = WitnessTable;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v22 = sub_100671A7C();
  uint64_t v61 = OpaqueTypeConformance2;
  unint64_t v62 = v22;
  uint64_t v46 = swift_getWitnessTable();
  uint64_t v44 = v20;
  uint64_t v23 = type metadata accessor for ForEachSubviewCollection();
  uint64_t v24 = type metadata accessor for Subview.ID();
  uint64_t v25 = swift_getWitnessTable();
  uint64_t v26 = sub_100672DF4(qword_1008159F0, (void (*)(uint64_t))&type metadata accessor for Subview.ID);
  uint64_t v56 = v23;
  uint64_t v57 = v24;
  uint64_t v58 = v20;
  uint64_t v59 = v25;
  uint64_t v60 = v26;
  uint64_t v27 = type metadata accessor for ForEach();
  uint64_t v45 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v29 = (char *)&v44 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v31 = __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v44 - v32;
  uint64_t v34 = v54;
  uint64_t v35 = v52;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))(v14, v52 + *(int *)(v54 + 52), v16, v31);
  unsigned __int8 v36 = v49;
  uint64_t v37 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, v35, v34);
  unint64_t v38 = (*(unsigned __int8 *)(v37 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  uint64_t v39 = (char *)swift_allocObject();
  *((void *)v39 + 2) = v48;
  *((void *)v39 + 3) = v16;
  *((void *)v39 + 4) = a4;
  *((void *)v39 + 5) = v47;
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(&v39[v38], v36, v54);
  uint64_t v40 = v46;
  ForEach.init<A>(subviewOf:content:)();
  uint64_t v55 = v40;
  uint64_t v41 = swift_getWitnessTable();
  sub_1000B29EC(v29, v27, v41);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v45 + 8);
  v42(v29, v27);
  sub_1000B29EC(v33, v27, v41);
  return ((uint64_t (*)(char *, uint64_t))v42)(v33, v27);
}

uint64_t sub_10066E540@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v103 = a2;
  uint64_t v114 = a1;
  uint64_t v111 = a7;
  uint64_t v116 = a3;
  uint64_t v117 = a4;
  uint64_t v118 = a5;
  uint64_t v119 = a6;
  uint64_t v112 = a5;
  uint64_t v97 = type metadata accessor for InsightsCapsulePicker();
  uint64_t v94 = *(void *)(v97 - 8);
  uint64_t v92 = *(void *)(v94 + 64);
  __chkstk_darwin(v97);
  uint64_t v93 = (char *)&v87 - v11;
  uint64_t v12 = sub_100010218(&qword_1008159D0);
  uint64_t v102 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v100 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = a3;
  uint64_t v117 = a4;
  uint64_t v95 = a4;
  uint64_t v118 = a5;
  uint64_t v119 = a6;
  uint64_t v96 = a6;
  uint64_t v14 = type metadata accessor for InsightsCapsulePicker.ButtonStyle();
  uint64_t v15 = sub_100014488(&qword_1008159D8, &qword_1008159D0);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v110 = v12;
  uint64_t v116 = v12;
  uint64_t v117 = v14;
  uint64_t v109 = v14;
  uint64_t v108 = v15;
  uint64_t v118 = v15;
  uint64_t v119 = WitnessTable;
  uint64_t v107 = WitnessTable;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v101 = *(void *)(OpaqueTypeMetadata2 - 8);
  __chkstk_darwin(OpaqueTypeMetadata2);
  uint64_t v99 = (char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v98 = (char *)&v87 - v20;
  uint64_t v21 = sub_100010218(&qword_1008159E0);
  __chkstk_darwin(v21);
  char v91 = (char *)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for ContainerValues();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v87 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = (void (*)(char *, char *, uint64_t))type metadata accessor for Optional();
  uint64_t v27 = *((void *)v89 - 1);
  __chkstk_darwin(v89);
  uint64_t v29 = (char *)&v87 - v28;
  uint64_t v30 = *(void *)(a3 - 8);
  uint64_t v31 = *(void *)(v30 + 64);
  __chkstk_darwin(v32);
  uint64_t v90 = (char *)&v87 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v113 = (char *)&v87 - v34;
  uint64_t v106 = OpaqueTypeMetadata2;
  uint64_t v105 = v21;
  uint64_t v35 = type metadata accessor for _ConditionalContent();
  uint64_t v104 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v115 = (char *)&v87 - v36;
  Subview.containerValues.getter();
  ContainerValues.tag<A>(for:)();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  uint64_t v37 = v30;
  uint64_t v38 = a3;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v29, 1, a3) == 1)
  {
    (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v27 + 8))(v29, v89);
    char v39 = static Edge.Set.horizontal.getter();
    EdgeInsets.init(_all:)();
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v47 = v46;
    uint64_t v48 = type metadata accessor for Subview();
    uint64_t v49 = (uint64_t)v91;
    (*(void (**)(char *, void (*)(char *, uint64_t), uint64_t))(*(void *)(v48 - 8) + 16))(v91, v114, v48);
    uint64_t v50 = v105;
    uint64_t v51 = v49 + *(int *)(v105 + 36);
    *(unsigned char *)uint64_t v51 = v39;
    *(void *)(v51 + 8) = v41;
    *(void *)(v51 + 16) = v43;
    *(void *)(v51 + 24) = v45;
    *(void *)(v51 + 32) = v47;
    *(unsigned char *)(v51 + 40) = 0;
    uint64_t v52 = v110;
    uint64_t v53 = v109;
    uint64_t v116 = v110;
    uint64_t v117 = v109;
    uint64_t v54 = v108;
    uint64_t v55 = v107;
    uint64_t v118 = v108;
    uint64_t v119 = v107;
    swift_getOpaqueTypeConformance2();
    sub_100671A7C();
    sub_10028F68C(v49, v106, v50);
    sub_10001457C(v49, &qword_1008159E0);
  }
  else
  {
    uint64_t v89 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    uint64_t v56 = v113;
    v89(v113, v29, a3);
    uint64_t v57 = v94;
    uint64_t v58 = v93;
    uint64_t v59 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v93, v103, v97);
    uint64_t v60 = v90;
    uint64_t v61 = v56;
    uint64_t v62 = v38;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v90, v61, v38);
    uint64_t v63 = *(unsigned __int8 *)(v57 + 80);
    char v91 = (char *)v35;
    uint64_t v64 = (v63 + 48) & ~v63;
    unint64_t v65 = (v92 + *(unsigned __int8 *)(v37 + 80) + v64) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    uint64_t v66 = swift_allocObject();
    uint64_t v67 = v95;
    *(void *)(v66 + 16) = v62;
    *(void *)(v66 + 24) = v67;
    uint64_t v68 = v96;
    *(void *)(v66 + 32) = v112;
    *(void *)(v66 + 40) = v68;
    (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v66 + v64, v58, v59);
    uint64_t v88 = v62;
    uint64_t v69 = ((uint64_t (*)(unint64_t, char *, uint64_t))v89)(v66 + v65, v60, v62);
    __chkstk_darwin(v69);
    *(&v87 - 2) = (uint64_t)v114;
    type metadata accessor for Subview();
    uint64_t v70 = v100;
    Button.init(action:label:)();
    uint64_t v71 = *(uint64_t (**)(char *, char *))(v103 + *(int *)(v59 + 56));
    type metadata accessor for Binding();
    Binding.wrappedValue.getter();
    LOBYTE(v66) = v71(v60, v113);
    uint64_t v72 = *(void (**)(char *, uint64_t))(v37 + 8);
    uint64_t v112 = v37 + 8;
    uint64_t v114 = v72;
    v72(v60, v62);
    uint64_t v73 = Namespace.wrappedValue.getter();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v75 = swift_getKeyPath();
    char v126 = 0;
    char v124 = 0;
    uint64_t v130 = v75;
    char v131 = 0;
    uint64_t v128 = KeyPath;
    char v129 = 0;
    LOBYTE(v116) = v66 & 1;
    *(_DWORD *)((char *)&v116 + 1) = *(_DWORD *)v127;
    HIDWORD(v116) = *(_DWORD *)&v127[3];
    uint64_t v117 = v73;
    uint64_t v118 = KeyPath;
    LOBYTE(v119) = 0;
    *(_DWORD *)((char *)&v119 + 1) = *(_DWORD *)v125;
    HIDWORD(v119) = *(_DWORD *)&v125[3];
    uint64_t v120 = v75;
    char v121 = 0;
    uint64_t v53 = v109;
    uint64_t v76 = swift_checkMetadataState();
    uint64_t v77 = (uint64_t)v99;
    uint64_t v52 = v110;
    uint64_t v54 = v108;
    uint64_t v55 = v107;
    View.buttonStyle<A>(_:)();
    sub_1006720B8((uint64_t)&v128);
    sub_1006720B8((uint64_t)&v130);
    (*(void (**)(char *, uint64_t))(v102 + 8))(v70, v52);
    uint64_t v116 = v52;
    uint64_t v117 = v76;
    uint64_t v118 = v54;
    uint64_t v119 = v55;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v79 = v98;
    uint64_t v80 = v106;
    sub_1000B29EC(v77, v106, OpaqueTypeConformance2);
    uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v101 + 8);
    v81(v77, v80);
    sub_1000B29EC(v79, v80, OpaqueTypeConformance2);
    sub_100671A7C();
    sub_10028F594(v77, v80);
    v81(v77, v80);
    v81((uint64_t)v79, v80);
    v114(v113, v88);
    uint64_t v35 = (uint64_t)v91;
  }
  uint64_t v116 = v52;
  uint64_t v117 = v53;
  uint64_t v118 = v54;
  uint64_t v119 = v55;
  uint64_t v82 = swift_getOpaqueTypeConformance2();
  unint64_t v83 = sub_100671A7C();
  uint64_t v122 = v82;
  unint64_t v123 = v83;
  uint64_t v84 = swift_getWitnessTable();
  uint64_t v85 = v115;
  sub_1000B29EC(v115, v35, v84);
  return (*(uint64_t (**)(char *, uint64_t))(v104 + 8))(v85, v35);
}

uint64_t sub_10066F108()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  sub_100026CCC(v1, v2);
  char v3 = sub_100666714(v1, v2);
  sub_100026DF8(v1, v2);
  return v3 & 1;
}

uint64_t sub_10066F160()
{
  uint64_t v1 = *(void *)(v0 + 32);
  char v2 = *(unsigned char *)(v0 + 40);
  sub_100026CCC(v1, v2);
  char v3 = sub_100666714(v1, v2);
  sub_100026DF8(v1, v2);
  return v3 & 1;
}

uint64_t sub_10066F1B8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v143 = a2;
  uint64_t v142 = a3;
  uint64_t v141 = type metadata accessor for AccessibilityTraits();
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141);
  uint64_t v139 = (char *)&v110 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Capsule();
  __chkstk_darwin(v5 - 8);
  uint64_t v138 = (char *)&v110 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = type metadata accessor for ContentShapeKinds();
  uint64_t v136 = *(void *)(v137 - 8);
  __chkstk_darwin(v137);
  uint64_t v135 = (char *)&v110 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_100010218(&qword_100800610);
  __chkstk_darwin(v122);
  uint64_t v113 = (char *)&v110 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v111 = (char *)&v110 - v10;
  uint64_t v130 = sub_100010218(&qword_100815A78);
  __chkstk_darwin(v130);
  uint64_t v112 = (uint64_t)&v110 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v110 = (uint64_t)&v110 - v13;
  uint64_t v115 = type metadata accessor for Text.LineStyle.Pattern();
  uint64_t v114 = *(void *)(v115 - 8);
  __chkstk_darwin(v115);
  uint64_t v15 = (char *)&v110 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v110 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100010218(&qword_100815A80);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v110 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_100010218(&qword_100815A88);
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v144 = (char *)&v110 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_100010218(&qword_100815A90);
  __chkstk_darwin(v116);
  uint64_t v25 = (char *)&v110 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_100010218(&qword_100815A98);
  __chkstk_darwin(v117);
  uint64_t v27 = (char *)&v110 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_100010218(&qword_100815AA0);
  __chkstk_darwin(v118);
  uint64_t v126 = (uint64_t)&v110 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_100010218(&qword_100815AA8);
  __chkstk_darwin(v123);
  uint64_t v128 = (uint64_t)&v110 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_100010218(&qword_100815AB0);
  __chkstk_darwin(v124);
  char v129 = (char *)&v110 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100010218(&qword_100815AB8);
  __chkstk_darwin(v127);
  uint64_t v131 = (uint64_t)&v110 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_100010218(&qword_100815AC0);
  __chkstk_darwin(v125);
  uint64_t v133 = (char *)&v110 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_100010218(&qword_100815AC8);
  __chkstk_darwin(v145);
  char v146 = (char *)&v110 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100010218(&qword_100815AD0);
  __chkstk_darwin(v34 - 8);
  uint64_t v134 = (char *)&v110 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = a1;
  ButtonStyleConfiguration.label.getter();
  static Font.footnote.getter();
  uint64_t v36 = Font.bold()();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v22, v19, v16);
  uint64_t v38 = (uint64_t *)&v22[*(int *)(v20 + 36)];
  uint64_t *v38 = KeyPath;
  v38[1] = v36;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  int v121 = *(unsigned __int8 *)v147;
  if (v121)
  {
    static Text.LineStyle.Pattern.solid.getter();
    sub_1006727B4();
    View.underline(_:pattern:color:)();
    (*(void (**)(char *, uint64_t))(v114 + 8))(v15, v115);
    sub_10001457C((uint64_t)v22, &qword_100815A80);
    int v39 = static HierarchicalShapeStyle.secondary.getter();
    uint64_t v40 = v122;
    uint64_t v41 = v111;
    uint64_t v42 = &v111[*(int *)(v122 + 36)];
    uint64_t v43 = enum case for BlendMode.plusDarker(_:);
    uint64_t v44 = type metadata accessor for BlendMode();
    uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 104);
    v45(v42, v43, v44);
    v45(&v41[*(int *)(v40 + 40)], enum case for BlendMode.plusLighter(_:), v44);
    *(_DWORD *)uint64_t v41 = v39;
    LOBYTE(v39) = ButtonStyleConfiguration.isPressed.getter();
    uint64_t v46 = v110;
    sub_10001B220((uint64_t)v41, v110, &qword_100800610);
    float v47 = 1.0;
    if (v39) {
      float v47 = 0.75;
    }
  }
  else
  {
    sub_10066F108();
    static Text.LineStyle.Pattern.solid.getter();
    sub_1006727B4();
    View.underline(_:pattern:color:)();
    (*(void (**)(char *, uint64_t))(v114 + 8))(v15, v115);
    sub_10001457C((uint64_t)v22, &qword_100815A80);
    int v48 = static HierarchicalShapeStyle.tertiary.getter();
    uint64_t v49 = v122;
    uint64_t v41 = v113;
    uint64_t v50 = &v113[*(int *)(v122 + 36)];
    uint64_t v51 = enum case for BlendMode.plusDarker(_:);
    uint64_t v52 = type metadata accessor for BlendMode();
    uint64_t v53 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v52 - 8) + 104);
    v53(v50, v51, v52);
    v53(&v41[*(int *)(v49 + 40)], enum case for BlendMode.plusLighter(_:), v52);
    *(_DWORD *)uint64_t v41 = v48;
    LOBYTE(v48) = ButtonStyleConfiguration.isPressed.getter();
    uint64_t v46 = v112;
    sub_10001B220((uint64_t)v41, v112, &qword_100800610);
    float v47 = 0.4;
    if ((v48 & 1) == 0) {
      float v47 = 1.0;
    }
  }
  *(float *)(v46 + *(int *)(v130 + 36)) = v47;
  sub_10001457C((uint64_t)v41, &qword_100800610);
  sub_100014488(&qword_100815AE0, &qword_100815A78);
  uint64_t v54 = AnyShapeStyle.init<A>(_:)();
  uint64_t v55 = v119;
  uint64_t v56 = v144;
  uint64_t v57 = v120;
  (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v25, v144, v120);
  *(void *)&v25[*(int *)(v116 + 36)] = v54;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
  LOBYTE(v54) = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  sub_10001B220((uint64_t)v25, (uint64_t)v27, &qword_100815A90);
  uint64_t v66 = &v27[*(int *)(v117 + 36)];
  *uint64_t v66 = v54;
  *((void *)v66 + 1) = v59;
  *((void *)v66 + 2) = v61;
  *((void *)v66 + 3) = v63;
  *((void *)v66 + 4) = v65;
  v66[40] = 0;
  sub_10001457C((uint64_t)v25, &qword_100815A90);
  LOBYTE(v54) = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v68 = v67;
  uint64_t v70 = v69;
  uint64_t v72 = v71;
  uint64_t v74 = v73;
  uint64_t v75 = v126;
  sub_10001B220((uint64_t)v27, v126, &qword_100815A98);
  uint64_t v76 = v75 + *(int *)(v118 + 36);
  *(unsigned char *)uint64_t v76 = v54;
  *(void *)(v76 + 8) = v68;
  *(void *)(v76 + 16) = v70;
  *(void *)(v76 + 24) = v72;
  *(void *)(v76 + 32) = v74;
  *(unsigned char *)(v76 + 40) = 0;
  sub_10001457C((uint64_t)v27, &qword_100815A98);
  static Alignment.center.getter();
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  uint64_t v77 = v128;
  sub_10001B220(v75, v128, &qword_100815AA0);
  uint64_t v78 = (_OWORD *)(v77 + *(int *)(v123 + 36));
  long long v79 = v154;
  v78[4] = v153;
  v78[5] = v79;
  v78[6] = v155;
  long long v80 = v150;
  *uint64_t v78 = v149;
  v78[1] = v80;
  long long v81 = v152;
  v78[2] = v151;
  v78[3] = v81;
  sub_10001457C(v75, &qword_100815AA0);
  uint64_t v82 = static Alignment.center.getter();
  uint64_t v84 = v83;
  uint64_t v85 = (uint64_t)v129;
  uint64_t v86 = (uint64_t)&v129[*(int *)(v124 + 36)];
  sub_100670360(v147, v143[2], v143[3], v143[4], v143[5], v86);
  uint64_t v87 = (uint64_t *)(v86 + *(int *)(sub_100010218(&qword_100815AE8) + 36));
  *uint64_t v87 = v82;
  v87[1] = v84;
  sub_10002C4EC(v77, v85, &qword_100815AA8);
  uint64_t v88 = static Animation.spring(response:dampingFraction:blendDuration:)();
  uint64_t v89 = v131;
  sub_10001B220(v85, v131, &qword_100815AB0);
  uint64_t v90 = v89 + *(int *)(v127 + 36);
  *(void *)uint64_t v90 = v88;
  int v91 = v121;
  *(unsigned char *)(v90 + 8) = v121;
  sub_10001457C(v85, &qword_100815AB0);
  uint64_t v92 = v135;
  static ContentShapeKinds.interaction.getter();
  uint64_t v93 = (uint64_t)v133;
  uint64_t v94 = &v133[*(int *)(v125 + 36)];
  uint64_t v95 = &v94[*(int *)(sub_100010218(&qword_100813590) + 40)];
  uint64_t v96 = v136;
  uint64_t v144 = *(char **)(v136 + 16);
  uint64_t v97 = v137;
  ((void (*)(char *, char *, uint64_t))v144)(v95, v92, v137);
  *uint64_t v94 = 0;
  sub_10001B220(v89, v93, &qword_100815AB8);
  uint64_t v147 = *(void (**)(char *, uint64_t))(v96 + 8);
  v147(v92, v97);
  sub_10001457C(v89, &qword_100815AB8);
  sub_100010218(&qword_100814BF0);
  uint64_t v98 = swift_allocObject();
  *(_OWORD *)(v98 + 16) = xmmword_1006D6270;
  static ContentShapeKinds.hoverEffect.getter();
  static ContentShapeKinds.accessibility.getter();
  uint64_t v148 = (double *)v98;
  sub_100672DF4(&qword_100814BF8, (void (*)(uint64_t))&type metadata accessor for ContentShapeKinds);
  sub_100010218(&qword_100814C00);
  sub_100014488(&qword_100814C08, &qword_100814C00);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v99 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v100 = type metadata accessor for RoundedCornerStyle();
  uint64_t v101 = (uint64_t)v138;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v100 - 8) + 104))(v138, v99, v100);
  uint64_t v102 = (uint64_t)v146;
  uint64_t v103 = (uint64_t)&v146[*(int *)(v145 + 36)];
  sub_100672884(v101, v103);
  uint64_t v104 = sub_100010218(&qword_100814C10);
  ((void (*)(uint64_t, char *, uint64_t))v144)(v103 + *(int *)(v104 + 40), v92, v97);
  *(unsigned char *)(v103 + *(int *)(v104 + 36)) = 0;
  sub_10001B220(v93, v102, &qword_100815AC0);
  sub_1003A5268(v101);
  v147(v92, v97);
  sub_10001457C(v93, &qword_100815AC0);
  if (v91)
  {
    uint64_t v105 = v139;
    static AccessibilityTraits.isSelected.getter();
    uint64_t v106 = v141;
  }
  else
  {
    uint64_t v148 = _swiftEmptyArrayStorage;
    sub_100672DF4(&qword_100815AF0, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
    sub_100010218(&qword_100815AF8);
    sub_100014488(&qword_100815B00, &qword_100815AF8);
    uint64_t v105 = v139;
    uint64_t v106 = v141;
    dispatch thunk of SetAlgebra.init<A>(_:)();
  }
  sub_1006728E8();
  uint64_t v107 = (uint64_t)v134;
  uint64_t v108 = (uint64_t)v146;
  View.accessibilityAddTraits(_:)();
  (*(void (**)(char *, uint64_t))(v140 + 8))(v105, v106);
  sub_10001457C(v108, &qword_100815AC8);
  return sub_10002C4EC(v107, v142, &qword_100815AD0);
}

uint64_t sub_100670360@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v48 = a4;
  uint64_t v49 = a5;
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  uint64_t v52 = a1;
  uint64_t v55 = a6;
  uint64_t v6 = type metadata accessor for BlendMode();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100010218(&qword_100815B60);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (uint64_t *)((char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = type metadata accessor for Capsule();
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = v16;
  uint64_t v17 = sub_100010218(&qword_100815B68);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100010218(&qword_100815B70);
  uint64_t v22 = v21 - 8;
  __chkstk_darwin(v21);
  uint64_t v51 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100010218(&qword_100815B78);
  __chkstk_darwin(v53);
  uint64_t v54 = (uint64_t)&v46 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v26 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v16, v25, v26);
  static Color.black.getter();
  uint64_t v27 = Color.opacity(_:)();
  swift_release();
  uint64_t v28 = v6;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for BlendMode.plusDarker(_:), v6);
  uint64_t v29 = v52;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v13 + *(int *)(v11 + 44), v9, v28);
  *uint64_t v13 = v27;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v28);
  uint64_t v30 = (uint64_t)v50;
  sub_100672884((uint64_t)v50, (uint64_t)v20);
  sub_10001B220((uint64_t)v13, (uint64_t)&v20[*(int *)(v18 + 60)], &qword_100815B60);
  *(_WORD *)&v20[*(int *)(v18 + 64)] = 256;
  uint64_t v31 = (uint64_t)v13;
  uint64_t v32 = (uint64_t)v51;
  sub_10001457C(v31, &qword_100815B60);
  sub_1003A5268(v30);
  uint64_t v33 = v29;
  char v34 = *v29;
  if (v34) {
    double v35 = 1.0;
  }
  else {
    double v35 = 0.0;
  }
  sub_10001B220((uint64_t)v20, v32, &qword_100815B68);
  *(double *)(v32 + *(int *)(v22 + 44)) = v35;
  sub_10001457C((uint64_t)v20, &qword_100815B68);
  if (v34)
  {
    uint64_t v56 = v46;
    uint64_t v57 = v47;
    uint64_t v58 = v48;
    uint64_t v59 = v49;
    type metadata accessor for InsightsCapsulePicker.ButtonStyle();
    char v36 = sub_10066F160() ^ 1;
  }
  else
  {
    char v36 = 0;
  }
  uint64_t v37 = *((void *)v33 + 1);
  int v38 = static MatchedGeometryProperties.frame.getter();
  static UnitPoint.center.getter();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v43 = v54;
  sub_10001B220(v32, v54, &qword_100815B70);
  uint64_t v44 = v43 + *(int *)(v53 + 36);
  *(void *)uint64_t v44 = 0x6F697463656C6573;
  *(void *)(v44 + 8) = 0xE90000000000006ELL;
  *(void *)(v44 + 16) = v37;
  *(_DWORD *)(v44 + 24) = v38;
  *(void *)(v44 + 32) = v40;
  *(void *)(v44 + 40) = v42;
  *(unsigned char *)(v44 + 48) = v36 & 1;
  sub_10001457C(v32, &qword_100815B70);
  return sub_10002C4EC(v43, v55, &qword_100815B78);
}

uint64_t sub_1006707EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10066F1B8(a1, a2, a3);
}

BOOL sub_10067082C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a4;
  uint64_t v33 = a2;
  uint64_t v6 = sub_100010218((uint64_t *)&unk_1007FC470);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v29 - v10;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v29 - v13;
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void **)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)v29 - v20;
  uint64_t v32 = a1;
  sub_10001B220(a1, (uint64_t)v14, (uint64_t *)&unk_1007FC470);
  uint64_t v22 = (unsigned int (*)(char *, uint64_t, uint64_t))v16[6];
  if (v22(v14, 1, v15) == 1)
  {
    uint64_t v11 = v14;
    uint64_t v23 = v33;
  }
  else
  {
    v29[1] = a3;
    uint64_t v30 = v8;
    uint64_t v24 = (void (*)(char *, char *, uint64_t))v16[4];
    v24(v21, v14, v15);
    uint64_t v23 = v33;
    sub_10001B220(v33, (uint64_t)v11, (uint64_t *)&unk_1007FC470);
    if (v22(v11, 1, v15) != 1)
    {
      v24(v18, v11, v15);
      BOOL v26 = Calendar.compare(_:to:toGranularity:)() == 0;
      uint64_t v27 = (void (*)(char *, uint64_t))v16[1];
      v27(v18, v15);
      v27(v21, v15);
      return v26;
    }
    ((void (*)(char *, uint64_t))v16[1])(v21, v15);
    uint64_t v8 = v30;
  }
  sub_10001457C((uint64_t)v11, (uint64_t *)&unk_1007FC470);
  unsigned int v25 = v22((char *)v32, 1, v15);
  sub_10001B220(v23, (uint64_t)v8, (uint64_t *)&unk_1007FC470);
  BOOL v26 = v25 == 1 && v22(v8, 1, v15) == 1;
  sub_10001457C((uint64_t)v8, (uint64_t *)&unk_1007FC470);
  return v26;
}

uint64_t sub_100670B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_100670B54()
{
  uint64_t result = type metadata accessor for Binding();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_100670C40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(void *)(v4 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = ((v7 + 16) & ~v7) + *(void *)(v6 + 64) + v9;
  uint64_t v11 = *(void *)(v8 + 64) + 7;
  int v12 = (*(_DWORD *)(v8 + 80) | *(_DWORD *)(v6 + 80)) & 0x100000;
  uint64_t v13 = *a2;
  *a1 = *a2;
  if ((v9 | v7) > 7
    || v12 != 0
    || ((((v11 + (v10 & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    a1 = (uint64_t *)(v13 + (((v9 | v7) & 0xF8 ^ 0x1F8) & ((v9 | v7) + 16)));
  }
  else
  {
    uint64_t v17 = ~v9;
    uint64_t v18 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v18 = *v19;
    uint64_t v20 = ((unint64_t)v19 + v7 + 8) & ~v7;
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    uint64_t v27 = ((unint64_t)v18 + v7 + 8) & ~v7;
    uint64_t v28 = v4;
    swift_retain();
    swift_retain();
    v21(v27, v20, v5);
    unint64_t v22 = ((unint64_t)a2 + v10) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v17, v22, v28);
    uint64_t v23 = (void *)((v11 + (((unint64_t)a1 + v10) & v17)) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v24 = (void *)((v11 + v22) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v25 = v24[1];
    void *v23 = *v24;
    v23[1] = v25;
    *(void *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_100670E5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 15;
  swift_release();
  swift_release();
  uint64_t v5 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v6 = v5 + 8;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t))(v5 + 8))(((v4 & 0xFFFFFFFFFFFFFFF8) + v7 + 8) & ~v7);
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 8))((*(void *)(v6 + 56)
                                                                                            + a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)
                                                                                            + ((v7 + 16) & ~v7)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80));

  return swift_release();
}

void *sub_100670F58(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v6 = *v7;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
  uint64_t v10 = *(void *)(v8 - 8) + 16;
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(v8 - 8) + 80);
  uint64_t v12 = ((unint64_t)v6 + v11 + 8) & ~v11;
  uint64_t v13 = ((unint64_t)v7 + v11 + 8) & ~v11;
  swift_retain();
  swift_retain();
  v9(v12, v13, v8);
  uint64_t v14 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = ((v11 + 16) & ~v11) + *(void *)(v10 + 48) + v16;
  unint64_t v18 = ((unint64_t)a1 + v17) & ~v16;
  unint64_t v19 = ((unint64_t)a2 + v17) & ~v16;
  (*(void (**)(unint64_t, unint64_t))(v14 + 16))(v18, v19);
  uint64_t v20 = *(void *)(v15 + 48) + 7;
  uint64_t v21 = (void *)((v20 + v18) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v22 = (void *)((v20 + v19) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  *(void *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

void *sub_1006710B8(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v7 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  *uint64_t v7 = *(void *)v6;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))(((unint64_t)v7 + v10 + 8) & ~v10, (v10 + 8 + v6) & ~v10);
  uint64_t v11 = *(void *)(v9 + 40);
  uint64_t v12 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v13 = v12 + 24;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = ((v10 + 16) & ~v10) + v11 + v14;
  unint64_t v16 = ((unint64_t)a1 + v15) & ~v14;
  unint64_t v17 = ((unint64_t)a2 + v15) & ~v14;
  (*(void (**)(unint64_t, unint64_t))(v12 + 24))(v16, v17);
  uint64_t v18 = *(void *)(v13 + 40) + 7;
  unint64_t v19 = (void *)((v18 + v16) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = (void *)((v18 + v17) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  swift_retain();
  swift_release();
  *(void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_100671224(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  unint64_t v6 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v6 = *v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))(((unint64_t)v6 + v10 + 8) & ~v10, ((unint64_t)v7 + v10 + 8) & ~v10);
  uint64_t v11 = *(void *)(v9 + 32);
  uint64_t v12 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v13 = v12 + 32;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = ((v10 + 16) & ~v10) + v11 + v14;
  unint64_t v16 = ((unint64_t)a1 + v15) & ~v14;
  unint64_t v17 = ((unint64_t)a2 + v15) & ~v14;
  (*(void (**)(unint64_t, unint64_t))(v12 + 32))(v16, v17);
  uint64_t v18 = *(void *)(v13 + 32) + 7;
  unint64_t v19 = (_OWORD *)((v18 + v16) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = (_OWORD *)((v18 + v17) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v19 = *v20;
  *(void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_100671350(void *a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_release();
  uint64_t v7 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  *uint64_t v7 = *(void *)v6;
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  (*(void (**)(unint64_t, unint64_t))(v8 + 40))(((unint64_t)v7 + v10 + 8) & ~v10, (v10 + 8 + v6) & ~v10);
  uint64_t v11 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v12 = v11 + 40;
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = ((v10 + 16) & ~v10) + *(void *)(v9 + 24) + v13;
  unint64_t v15 = ((unint64_t)a1 + v14) & ~v13;
  unint64_t v16 = ((unint64_t)a2 + v14) & ~v13;
  (*(void (**)(unint64_t, unint64_t))(v11 + 40))(v15, v16);
  uint64_t v17 = *(void *)(v12 + 24) + 7;
  uint64_t v18 = (_OWORD *)((v17 + v15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v19 = v17 + v16;
  unint64_t v20 = (v19 & 0xFFFFFFFFFFFFFFF8) + 23;
  *uint64_t v18 = *(_OWORD *)(v19 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  *(void *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8) = *(void *)(v20 & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1006714A0(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v6 = 0x7FFFFFFF;
  }
  else {
    unsigned int v6 = *(_DWORD *)(v4 + 84);
  }
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  if (v9 <= v6) {
    unsigned int v12 = v6;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v8 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v13 = ((v10 + 16) & ~v10) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + v11;
  if (v12 < a2)
  {
    unint64_t v14 = ((((*(void *)(*(void *)(v7 - 8) + 64) + (v13 & ~v11) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    if ((v14 & 0xFFFFFFF8) != 0) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = a2 - v12 + 1;
    }
    if (v15 >= 0x10000) {
      unsigned int v16 = 4;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v15 < 0x100) {
      unsigned int v16 = 1;
    }
    if (v15 >= 2) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    switch(v17)
    {
      case 1:
        int v18 = *((unsigned __int8 *)a1 + v14);
        if (!*((unsigned char *)a1 + v14)) {
          break;
        }
        goto LABEL_25;
      case 2:
        int v18 = *(unsigned __int16 *)((char *)a1 + v14);
        if (*(_WORD *)((char *)a1 + v14)) {
          goto LABEL_25;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1006716A4);
      case 4:
        int v18 = *(_DWORD *)((char *)a1 + v14);
        if (!v18) {
          break;
        }
LABEL_25:
        int v20 = v18 - 1;
        if ((v14 & 0xFFFFFFF8) != 0)
        {
          int v20 = 0;
          int v21 = *a1;
        }
        else
        {
          int v21 = 0;
        }
        return v12 + (v21 | v20) + 1;
      default:
        break;
    }
  }
  if (v6 < v9) {
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(((unint64_t)a1 + v13) & ~v11, v9, v7);
  }
  unint64_t v22 = (unint64_t *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v22 + v10 + 8) & ~v10);
  }
  unint64_t v23 = *v22;
  if (v23 >= 0xFFFFFFFF) {
    LODWORD(v23) = -1;
  }
  return (v23 + 1);
}

void sub_1006716B8(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(a4 + 24);
  uint64_t v10 = *(void *)(v9 - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  if (v11 <= v8) {
    unsigned int v14 = v8;
  }
  else {
    unsigned int v14 = *(_DWORD *)(v10 + 84);
  }
  size_t v15 = ((v12 + 16) & ~v12) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v16 = v15 + v13;
  size_t v17 = ((((*(void *)(*(void *)(v9 - 8) + 64) + ((v15 + v13) & ~v13) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v14 >= a3)
  {
    int v21 = 0;
    int v22 = a2 - v14;
    if (a2 <= v14)
    {
LABEL_20:
      uint64_t v23 = ~v13;
      switch(v21)
      {
        case 1:
          a1[v17] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 2:
          *(_WORD *)&a1[v17] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_33;
        case 3:
          goto LABEL_63;
        case 4:
          *(_DWORD *)&a1[v17] = 0;
          goto LABEL_32;
        default:
LABEL_32:
          if (a2)
          {
LABEL_33:
            if (v8 >= v11)
            {
              if (v8 >= a2)
              {
                uint64_t v30 = (void *)((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8);
                if ((v7 & 0x80000000) != 0)
                {
                  uint64_t v32 = *(void (**)(unint64_t))(v6 + 56);
                  v32(((unint64_t)v30 + v12 + 8) & ~v12);
                }
                else
                {
                  if ((a2 & 0x80000000) != 0) {
                    uint64_t v31 = a2 ^ 0x80000000;
                  }
                  else {
                    uint64_t v31 = a2 - 1;
                  }
                  *uint64_t v30 = v31;
                }
              }
              else
              {
                if (v15 <= 3) {
                  int v27 = ~(-1 << (8 * v15));
                }
                else {
                  int v27 = -1;
                }
                if (v15)
                {
                  int v28 = v27 & (~v8 + a2);
                  if (v15 <= 3) {
                    int v29 = v15;
                  }
                  else {
                    int v29 = 4;
                  }
                  bzero(a1, v15);
                  switch(v29)
                  {
                    case 2:
                      *(_WORD *)a1 = v28;
                      break;
                    case 3:
                      *(_WORD *)a1 = v28;
                      a1[2] = BYTE2(v28);
                      break;
                    case 4:
                      *(_DWORD *)a1 = v28;
                      break;
                    default:
                      *a1 = v28;
                      break;
                  }
                }
              }
            }
            else
            {
              BOOL v26 = *(void (**)(unint64_t))(v10 + 56);
              v26((unint64_t)&a1[v16] & v23);
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v18 = a3 - v14;
    if (((((*(_DWORD *)(*(void *)(v9 - 8) + 64) + ((v15 + v13) & ~v13) + 7) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v19 = v18 + 1;
    else {
      unsigned int v19 = 2;
    }
    if (v19 >= 0x10000) {
      int v20 = 4;
    }
    else {
      int v20 = 2;
    }
    if (v19 < 0x100) {
      int v20 = 1;
    }
    if (v19 >= 2) {
      int v21 = v20;
    }
    else {
      int v21 = 0;
    }
    int v22 = a2 - v14;
    if (a2 <= v14) {
      goto LABEL_20;
    }
  }
  if (((((*(_DWORD *)(*(void *)(v9 - 8) + 64) + ((v15 + v13) & ~v13) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF8) {
    int v24 = v22;
  }
  else {
    int v24 = 1;
  }
  if (((((*(_DWORD *)(*(void *)(v9 - 8) + 64) + ((v15 + v13) & ~v13) + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    int v25 = ~v14 + a2;
    bzero(a1, v17);
    *(_DWORD *)a1 = v25;
  }
  switch(v21)
  {
    case 1:
      a1[v17] = v24;
      break;
    case 2:
      *(_WORD *)&a1[v17] = v24;
      break;
    case 3:
LABEL_63:
      __break(1u);
      JUMPOUT(0x1006719FCLL);
    case 4:
      *(_DWORD *)&a1[v17] = v24;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for InsightsCapsulePicker()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100671A4C()
{
  return sub_100672778();
}

uint64_t type metadata accessor for InsightsCapsulePicker.ButtonStyle()
{
  return swift_getGenericMetadata();
}

unint64_t sub_100671A7C()
{
  unint64_t result = qword_1008159E8;
  if (!qword_1008159E8)
  {
    sub_100014440(&qword_1008159E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1008159E8);
  }
  return result;
}

uint64_t sub_100671AF0()
{
  return sub_100671B20((uint64_t (*)(void, void, void, void, void))sub_10066DB78);
}

uint64_t sub_100671B08()
{
  return sub_100671B20((uint64_t (*)(void, void, void, void, void))sub_10066E05C);
}

uint64_t sub_100671B20(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_100671B38()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v6 = *(_OWORD *)(v0 + 24);
  unint64_t v2 = (int *)(type metadata accessor for InsightsCapsulePicker() - 8);
  uint64_t v3 = v0
     + ((*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80));
  swift_release();
  swift_release();
  uint64_t v4 = type metadata accessor for Binding();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v3 + *(int *)(v4 + 32), v1);
  (*(void (**)(uint64_t))(*(void *)(v6 - 8) + 8))(v3 + v2[15]);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_100671C98@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2[2];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v9 = *(void *)(type metadata accessor for InsightsCapsulePicker() - 8);
  uint64_t v10 = (uint64_t)v2 + ((*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_10066E540(a1, v10, v5, v6, v7, v8, a2);
}

uint64_t sub_100671D54()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v10 = *(_OWORD *)(v0 + 24);
  unint64_t v2 = (int *)(type metadata accessor for InsightsCapsulePicker() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = *(void *)(v1 - 8);
  unint64_t v5 = (v3 + *(void *)(*(void *)v2 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v0 + v3;
  swift_release();
  swift_release();
  uint64_t v7 = type metadata accessor for Binding();
  uint64_t v8 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
  v8(v6 + *(int *)(v7 + 32), v1);
  (*(void (**)(uint64_t))(*(void *)(v10 - 8) + 8))(v6 + v2[15]);
  swift_release();
  v8(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_100671F18()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(type metadata accessor for InsightsCapsulePicker() - 8);
  uint64_t v3 = v0
     + ((((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
       + *(void *)(v2 + 64)
       + *(unsigned __int8 *)(*(void *)(v1 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  uint64_t v4 = type metadata accessor for InsightsCapsulePicker();
  return sub_1006720E8(v3, v4);
}

uint64_t sub_100672018@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = type metadata accessor for Subview();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_100672088@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.accessibilityReduceMotion.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1006720B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1006720E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  __n128 v3 = __chkstk_darwin(a1);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v2, v3);
  type metadata accessor for Binding();
  return Binding.wrappedValue.setter();
}

uint64_t sub_1006721B8(uint64_t a1)
{
  sub_100026DF8(*(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);

  return sub_100026DF8(v2, v3);
}

uint64_t sub_1006721FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 24);
  sub_100026CCC(v4, v5);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(v2 + 32);
  LOBYTE(v2) = *(unsigned char *)(v2 + 40);
  sub_100026CCC(v6, v2);
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v2;
  return a1;
}

uint64_t sub_100672270(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 24);
  sub_100026CCC(v4, v5);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  sub_100026DF8(v6, v7);
  uint64_t v8 = *(void *)(v2 + 32);
  LOBYTE(v2) = *(unsigned char *)(v2 + 40);
  sub_100026CCC(v8, v2);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v2;
  sub_100026DF8(v9, v10);
  return a1;
}

uint64_t sub_100672300(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 16);
  char v6 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = v4;
  sub_100026DF8(v5, v6);
  char v7 = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v7;
  sub_100026DF8(v8, v9);
  return a1;
}

uint64_t sub_100672368(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[41]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_1006723BC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_10067240C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100672760()
{
  return sub_100672778();
}

uint64_t sub_100672778()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1006727B4()
{
  unint64_t result = qword_100815AD8;
  if (!qword_100815AD8)
  {
    sub_100014440(&qword_100815A80);
    sub_100672DF4(&qword_100814BC8, (void (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    sub_100014488(&qword_1007F9638, &qword_1007F9640);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815AD8);
  }
  return result;
}

uint64_t sub_100672884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Capsule();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1006728E8()
{
  unint64_t result = qword_100815B08;
  if (!qword_100815B08)
  {
    sub_100014440(&qword_100815AC8);
    sub_100672988();
    sub_100014488(&qword_100814D38, &qword_100814C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815B08);
  }
  return result;
}

unint64_t sub_100672988()
{
  unint64_t result = qword_100815B10;
  if (!qword_100815B10)
  {
    sub_100014440(&qword_100815AC0);
    sub_100672A28();
    sub_100014488(&qword_1008135C8, &qword_100813590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815B10);
  }
  return result;
}

unint64_t sub_100672A28()
{
  unint64_t result = qword_100815B18;
  if (!qword_100815B18)
  {
    sub_100014440(&qword_100815AB8);
    sub_100672AC8();
    sub_100014488(&qword_100801C50, &qword_100801C58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815B18);
  }
  return result;
}

unint64_t sub_100672AC8()
{
  unint64_t result = qword_100815B20;
  if (!qword_100815B20)
  {
    sub_100014440(&qword_100815AB0);
    sub_100672BC4(&qword_100815B28, &qword_100815AA8, (void (*)(void))sub_100672B94);
    sub_100014488(&qword_100815B58, &qword_100815AE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815B20);
  }
  return result;
}

uint64_t sub_100672B94()
{
  return sub_100672BC4(&qword_100815B30, &qword_100815AA0, (void (*)(void))sub_100672C40);
}

uint64_t sub_100672BC4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100014440(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100672C40()
{
  return sub_100672BC4(&qword_100815B38, &qword_100815A98, (void (*)(void))sub_100672C70);
}

unint64_t sub_100672C70()
{
  unint64_t result = qword_100815B40;
  if (!qword_100815B40)
  {
    sub_100014440(&qword_100815A90);
    sub_100014440(&qword_100815A80);
    sub_1006727B4();
    swift_getOpaqueTypeConformance2();
    sub_100014488(&qword_100815B48, &qword_100815B50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815B40);
  }
  return result;
}

unint64_t sub_100672D48()
{
  unint64_t result = qword_100815B80;
  if (!qword_100815B80)
  {
    sub_100014440(&qword_100815AD0);
    sub_1006728E8();
    sub_100672DF4((unint64_t *)&qword_1007F96A0, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815B80);
  }
  return result;
}

uint64_t sub_100672DF4(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_100672F0C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalPrintPageRenderer();
  [super dealloc];
}

uint64_t type metadata accessor for JournalPrintPageRenderer()
{
  return self;
}

id SyncDataMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id JournalEntryAssetAttachmentMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryAssetAttachmentMO();
  id v5 = [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

uint64_t type metadata accessor for JournalEntryAssetAttachmentMO()
{
  return self;
}

id JournalEntryAssetAttachmentMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryAssetAttachmentMO();
  return [super dealloc];
}

id static JournalEntryAssetAttachmentMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

void *sub_10067313C()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_100673148@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for JournalEntryAssetAttachmentMO();
  uint64_t result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

id JournalEntryAssetFileAttachmentMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryAssetFileAttachmentMO();
  id v5 = [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

uint64_t type metadata accessor for JournalEntryAssetFileAttachmentMO()
{
  return self;
}

id JournalEntryAssetFileAttachmentMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryAssetFileAttachmentMO();
  return [super dealloc];
}

id static JournalEntryAssetFileAttachmentMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

unint64_t sub_100673310()
{
  unint64_t result = qword_100815C00;
  if (!qword_100815C00)
  {
    sub_100014440(&qword_100800950);
    sub_100673384();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100815C00);
  }
  return result;
}

unint64_t sub_100673384()
{
  unint64_t result = qword_100811270;
  if (!qword_100811270)
  {
    type metadata accessor for UUID();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100811270);
  }
  return result;
}

uint64_t sub_1006733DC@<X0>(uint64_t a1@<X8>)
{
  id v3 = [*v1 id];
  if (v3)
  {
    uint64_t v4 = v3;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v5 = type metadata accessor for UUID();
    char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

id JournalEntryAssetMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryAssetMO();
  [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

uint64_t type metadata accessor for JournalEntryAssetMO()
{
  return self;
}

id JournalEntryAssetMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryAssetMO();
  return [super dealloc];
}

id static JournalEntryAssetMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

id JournalEntryMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalEntryMO();
  id v5 = [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

uint64_t type metadata accessor for JournalEntryMO()
{
  return self;
}

id JournalEntryMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalEntryMO();
  return [super dealloc];
}

id static JournalEntryMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

id JournalMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for JournalMO();
  id v5 = [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

uint64_t type metadata accessor for JournalMO()
{
  return self;
}

id JournalMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JournalMO();
  [super dealloc];
}

id static JournalMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

id SyncDataMO.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for SyncDataMO();
  id v5 = [super initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

uint64_t type metadata accessor for SyncDataMO()
{
  return self;
}

id SyncDataMO.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SyncDataMO();
  return [super dealloc];
}

id static SyncDataMO.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_100673AAC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SyncDataMO();
  uint64_t result = Identifiable<>.id.getter();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_100673B14()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100815CA8 = (uint64_t)result;
  return result;
}

uint64_t sub_100673B6C()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EE68);
  sub_100026A54(v0, (uint64_t)qword_10083EE68);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100673C18()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EE80);
  sub_100026A54(v0, (uint64_t)qword_10083EE80);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100673CC0()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EE98);
  sub_100026A54(v0, (uint64_t)qword_10083EE98);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100673D70()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EEB0);
  sub_100026A54(v0, (uint64_t)qword_10083EEB0);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100673E18()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EEC8);
  sub_100026A54(v0, (uint64_t)qword_10083EEC8);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100673EC0()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EEE0);
  sub_100026A54(v0, (uint64_t)qword_10083EEE0);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100673F68()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EEF8);
  sub_100026A54(v0, (uint64_t)qword_10083EEF8);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674010()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EF10);
  sub_100026A54(v0, (uint64_t)qword_10083EF10);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_1006740B8()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EF28);
  sub_100026A54(v0, (uint64_t)qword_10083EF28);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674164()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EF40);
  sub_100026A54(v0, (uint64_t)qword_10083EF40);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674214()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EF58);
  sub_100026A54(v0, (uint64_t)qword_10083EF58);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_1006742C4()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EF70);
  sub_100026A54(v0, (uint64_t)qword_10083EF70);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674374()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EF88);
  sub_100026A54(v0, (uint64_t)qword_10083EF88);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_10067441C()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EFA0);
  sub_100026A54(v0, (uint64_t)qword_10083EFA0);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_1006744C4()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EFB8);
  sub_100026A54(v0, (uint64_t)qword_10083EFB8);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_10067456C()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EFD0);
  sub_100026A54(v0, (uint64_t)qword_10083EFD0);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674614()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083EFE8);
  sub_100026A54(v0, (uint64_t)qword_10083EFE8);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_1006746BC()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F000);
  sub_100026A54(v0, (uint64_t)qword_10083F000);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674764()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F018);
  sub_100026A54(v0, (uint64_t)qword_10083F018);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_10067480C()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F030);
  sub_100026A54(v0, (uint64_t)qword_10083F030);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_1006748BC()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F048);
  sub_100026A54(v0, (uint64_t)qword_10083F048);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674964()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F060);
  sub_100026A54(v0, (uint64_t)qword_10083F060);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674A0C()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F078);
  sub_100026A54(v0, (uint64_t)qword_10083F078);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674AB4()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F090);
  sub_100026A54(v0, (uint64_t)qword_10083F090);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674B5C()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F0A8);
  sub_100026A54(v0, (uint64_t)qword_10083F0A8);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674C04()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F0C0);
  sub_100026A54(v0, (uint64_t)qword_10083F0C0);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674CAC()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F0D8);
  sub_100026A54(v0, (uint64_t)qword_10083F0D8);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674D54()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F0F0);
  sub_100026A54(v0, (uint64_t)qword_10083F0F0);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674DFC()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F108);
  sub_100026A54(v0, (uint64_t)qword_10083F108);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674EA4()
{
  uint64_t v0 = type metadata accessor for ColorResource();
  sub_100035380(v0, qword_10083F120);
  sub_100026A54(v0, (uint64_t)qword_10083F120);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ColorResource.init(name:bundle:)();
}

uint64_t sub_100674F4C()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_100035380(v0, qword_10083F138);
  sub_100026A54(v0, (uint64_t)qword_10083F138);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100674FF4()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_100035380(v0, qword_10083F150);
  sub_100026A54(v0, (uint64_t)qword_10083F150);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10067509C()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_100035380(v0, qword_10083F168);
  sub_100026A54(v0, (uint64_t)qword_10083F168);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100675144()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_100035380(v0, qword_10083F180);
  sub_100026A54(v0, (uint64_t)qword_10083F180);
  if (qword_1007F7F10 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100815CA8;
  return ImageResource.init(name:bundle:)();
}

void sub_1006751EC(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[RCActivityWaveformProcessor processAudioBuffer:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s -- Processing buffer is too full", (uint8_t *)&v1, 0xCu);
}

void sub_100675270()
{
  __assert_rtn("advanceWritePointer", "VMRingBuffer.h", 75, "mFill <= mCapacity");
}

void sub_10067529C()
{
  __assert_rtn("advanceReadPointer", "VMRingBuffer.h", 84, "mFill >= 0");
}

void sub_1006752C8()
{
  __assert_rtn("allocatePageAlignedMirroredMemory", "VMMemoryHelpers.m", 22, "size == round_page(size)");
}

void sub_1006752F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10067536C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1006753E4(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[RCPlatterWaveformView removeSliceWithType:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s -- Unexpected slice type", (uint8_t *)&v1, 0xCu);
}

void sub_100675468(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t static _AssistantIntentsProvider.uniqueEntities.getter()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t AppDependency.wrappedValue.getter()
{
  return AppDependency.wrappedValue.getter();
}

uint64_t AppDependency.__allocating_init(key:manager:)()
{
  return AppDependency.__allocating_init(key:manager:)();
}

uint64_t type metadata accessor for AppIntentError()
{
  return type metadata accessor for AppIntentError();
}

uint64_t AppShortcutPhrase.init(stringLiteral:)()
{
  return AppShortcutPhrase.init(stringLiteral:)();
}

uint64_t AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)()
{
  return AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t AppShortcutPhrase.init(stringInterpolation:)()
{
  return AppShortcutPhrase.init(stringInterpolation:)();
}

uint64_t static AppShortcutsBuilder.buildBlock(_:)()
{
  return static AppShortcutsBuilder.buildBlock(_:)();
}

uint64_t static AppShortcutsBuilder.buildExpression(_:)()
{
  return static AppShortcutsBuilder.buildExpression(_:)();
}

uint64_t AppDependencyManager.add<A>(key:dependency:)()
{
  return AppDependencyManager.add<A>(key:dependency:)();
}

uint64_t static AppDependencyManager.shared.getter()
{
  return static AppDependencyManager.shared.getter();
}

uint64_t type metadata accessor for AppDependencyManager()
{
  return type metadata accessor for AppDependencyManager();
}

uint64_t static AppShortcutsProvider.updateAppShortcutParameters()()
{
  return static AppShortcutsProvider.updateAppShortcutParameters()();
}

uint64_t static AppShortcutsProvider.shortcutTileColor.getter()
{
  return static AppShortcutsProvider.shortcutTileColor.getter();
}

uint64_t type metadata accessor for AppShortcutPhraseToken()
{
  return type metadata accessor for AppShortcutPhraseToken();
}

uint64_t static AppIntent.description.getter()
{
  return static AppIntent.description.getter();
}

uint64_t AppIntent.systemContext.getter()
{
  return AppIntent.systemContext.getter();
}

uint64_t static AppIntent.isDiscoverable.getter()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t static AppIntent.parameterSummary.getter()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)()
{
  return AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)();
}

uint64_t type metadata accessor for AppShortcut()
{
  return type metadata accessor for AppShortcut();
}

uint64_t IntentFile.init(data:filename:type:)()
{
  return IntentFile.init(data:filename:type:)();
}

uint64_t IntentFile.fileURL.getter()
{
  return IntentFile.fileURL.getter();
}

uint64_t IntentFile.init(fileURL:filename:type:)()
{
  return IntentFile.init(fileURL:filename:type:)();
}

uint64_t type metadata accessor for IntentFile()
{
  return type metadata accessor for IntentFile();
}

uint64_t IntentDialog.init(stringLiteral:)()
{
  return IntentDialog.init(stringLiteral:)();
}

uint64_t type metadata accessor for IntentDialog()
{
  return type metadata accessor for IntentDialog();
}

uint64_t IntentDialog.init(_:)()
{
  return IntentDialog.init(_:)();
}

uint64_t static IntentResult.result<A, B>(value:opensIntent:)()
{
  return static IntentResult.result<A, B>(value:opensIntent:)();
}

uint64_t static IntentResult.result<>()()
{
  return static IntentResult.result<>()();
}

uint64_t IndexedEntity.attributeSet.getter()
{
  return IndexedEntity.attributeSet.getter();
}

uint64_t EntityProperty.wrappedValue.getter()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t EntityProperty.wrappedValue.setter()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t EntityProperty<>.init()()
{
  return EntityProperty<>.init()();
}

{
  return EntityProperty<>.init()();
}

{
  return EntityProperty<>.init()();
}

{
  return EntityProperty<>.init()();
}

{
  return EntityProperty<>.init()();
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

uint64_t IntentParameter.projectedValue.getter()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t IntentParameter.needsValueError(_:)()
{
  return IntentParameter.needsValueError(_:)();
}

uint64_t IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(description:default:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(description:default:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(description:default:kind:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(description:default:kind:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t IntentParameter<>.init(description:default:displayStyle:requestValueDialog:inputConnectionBehavior:)()
{
  return IntentParameter<>.init(description:default:displayStyle:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t _AssistantIntent.IntentProjection.subscript.getter()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t type metadata accessor for _AssistantIntent.PhraseToken()
{
  return type metadata accessor for _AssistantIntent.PhraseToken();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.PhraseBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t static _AssistantIntent.StringValueBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.StringValueBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildBlock()()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t _AssistantIntent.Value.init<A>(for:builder:)()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t type metadata accessor for _AssistantIntent.Value()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t _AssistantIntent.Phrase.init(stringLiteral:)()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t _AssistantIntent.Phrase.init(stringInterpolation:)()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t type metadata accessor for _AssistantIntent()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t _AssistantIntent.init<A>(_:phrases:parameterValues:)()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t type metadata accessor for StringSearchScope()
{
  return type metadata accessor for StringSearchScope();
}

uint64_t type metadata accessor for IntentSystemContext.Kind()
{
  return type metadata accessor for IntentSystemContext.Kind();
}

uint64_t IntentSystemContext.kind.getter()
{
  return IntentSystemContext.kind.getter();
}

uint64_t type metadata accessor for IntentSystemContext()
{
  return type metadata accessor for IntentSystemContext();
}

uint64_t StringSearchCriteria.term.getter()
{
  return StringSearchCriteria.term.getter();
}

uint64_t type metadata accessor for StringSearchCriteria()
{
  return type metadata accessor for StringSearchCriteria();
}

uint64_t static AssistantSchemaEntity.isAssistantOnly.getter()
{
  return static AssistantSchemaEntity.isAssistantOnly.getter();
}

uint64_t static AssistantSchemaIntent.isAssistantOnly.getter()
{
  return static AssistantSchemaIntent.isAssistantOnly.getter();
}

uint64_t type metadata accessor for DisplayRepresentation.Image()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t DisplayRepresentation.init(title:subtitle:image:)()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t static DynamicOptionsProvider.useForParameterResolution.getter()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)();
}

uint64_t static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)()
{
  return static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)();
}

uint64_t IntentParameterSummary.init(_:table:)()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t IntentParameterSummary.init(_:table:_:)()
{
  return IntentParameterSummary.init(_:table:_:)();
}

uint64_t ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

Swift::Void __swiftcall ParameterSummaryString.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t ParameterSummaryString.init(stringInterpolation:)()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t type metadata accessor for InputConnectionBehavior()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t static ParameterSummaryBuilder.buildBlock<A>(_:)()
{
  return static ParameterSummaryBuilder.buildBlock<A>(_:)();
}

uint64_t static ParameterSummaryBuilder.buildExpression<A>(_:)()
{
  return static ParameterSummaryBuilder.buildExpression<A>(_:)();
}

uint64_t static PersistentlyIdentifiable.persistentIdentifier.getter()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t type metadata accessor for HasValueComparisonOperator()
{
  return type metadata accessor for HasValueComparisonOperator();
}

uint64_t type metadata accessor for IntentAuthenticationPolicy()
{
  return type metadata accessor for IntentAuthenticationPolicy();
}

uint64_t ParameterSummaryWhenCondition.init<A>(_:_:_:otherwise:)()
{
  return ParameterSummaryWhenCondition.init<A>(_:_:_:otherwise:)();
}

uint64_t static CocoaError.Code.coderInvalidValue.getter()
{
  return static CocoaError.Code.coderInvalidValue.getter();
}

uint64_t type metadata accessor for CocoaError.Code()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t static CocoaError.error(_:userInfo:url:)()
{
  return static CocoaError.error(_:userInfo:url:)();
}

uint64_t dispatch thunk of FormatStyle.format(_:)()
{
  return dispatch thunk of FormatStyle.format(_:)();
}

uint64_t dispatch thunk of FormatStyle.locale(_:)()
{
  return dispatch thunk of FormatStyle.locale(_:)();
}

uint64_t static FormatStyle<>.iso8601.getter()
{
  return static FormatStyle<>.iso8601.getter();
}

uint64_t static FormatStyle<>.dateTime.getter()
{
  return static FormatStyle<>.dateTime.getter();
}

uint64_t static FormatStyle.measurement<A>(width:usage:numberFormatStyle:)()
{
  return static FormatStyle.measurement<A>(width:usage:numberFormatStyle:)();
}

uint64_t static FormatStyle.list<A>(type:width:)()
{
  return static FormatStyle.list<A>(type:width:)();
}

uint64_t FormatStyle.locale(_:)()
{
  return FormatStyle.locale(_:)();
}

uint64_t static FormatStyle<>.time(pattern:)()
{
  return static FormatStyle<>.time(pattern:)();
}

uint64_t static FormatStyle<>.units(allowed:width:maximumUnitCount:zeroValueUnits:valueLength:fractionalPart:)()
{
  return static FormatStyle<>.units(allowed:width:maximumUnitCount:zeroValueUnits:valueLength:fractionalPart:)();
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

uint64_t static JSONEncoder.OutputFormatting.prettyPrinted.getter()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
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

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t static Measurement<>.FormatStyle.UnitWidth.abbreviated.getter()
{
  return static Measurement<>.FormatStyle.UnitWidth.abbreviated.getter();
}

uint64_t static Measurement<>.FormatStyle.UnitWidth.wide.getter()
{
  return static Measurement<>.FormatStyle.UnitWidth.wide.getter();
}

uint64_t static Measurement<>.FormatStyle.UnitWidth.narrow.getter()
{
  return static Measurement<>.FormatStyle.UnitWidth.narrow.getter();
}

uint64_t Measurement<>.formatted<A>(_:)()
{
  return Measurement<>.formatted<A>(_:)();
}

uint64_t CharacterSet.isSuperset(of:)()
{
  return CharacterSet.isSuperset(of:)();
}

uint64_t static CharacterSet.whitespaces.getter()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return CharacterSet.init(charactersIn:)();
}

NSCharacterSet __swiftcall CharacterSet._bridgeToObjectiveC()()
{
  return (NSCharacterSet)CharacterSet._bridgeToObjectiveC()();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t CharacterSet.union(_:)()
{
  return CharacterSet.union(_:)();
}

uint64_t static CharacterSet.newlines.getter()
{
  return static CharacterSet.newlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)DateInterval._bridgeToObjectiveC()();
}

uint64_t DateInterval.end.getter()
{
  return DateInterval.end.getter();
}

uint64_t DateInterval.init(start:end:)()
{
  return DateInterval.init(start:end:)();
}

uint64_t DateInterval.start.getter()
{
  return DateInterval.start.getter();
}

uint64_t type metadata accessor for DateInterval()
{
  return type metadata accessor for DateInterval();
}

uint64_t Notification.debugDescription.getter()
{
  return Notification.debugDescription.getter();
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

uint64_t Notification.name.getter()
{
  return Notification.name.getter();
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

uint64_t static ParseStrategy<>.iso8601.getter()
{
  return static ParseStrategy<>.iso8601.getter();
}

uint64_t URLComponents.queryItems.modify()
{
  return URLComponents.queryItems.modify();
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

uint64_t URLComponents.host.getter()
{
  return URLComponents.host.getter();
}

uint64_t URLComponents.host.setter()
{
  return URLComponents.host.setter();
}

uint64_t URLComponents.scheme.getter()
{
  return URLComponents.scheme.getter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t static AttributeScope.decodingConfiguration.getter()
{
  return static AttributeScope.decodingConfiguration.getter();
}

uint64_t static AttributeScope.encodingConfiguration.getter()
{
  return static AttributeScope.encodingConfiguration.getter();
}

uint64_t DateComponents.weekOfYear.getter()
{
  return DateComponents.weekOfYear.getter();
}

NSDateComponents __swiftcall DateComponents._bridgeToObjectiveC()()
{
  return (NSDateComponents)DateComponents._bridgeToObjectiveC()();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t DateComponents.day.modify()
{
  return DateComponents.day.modify();
}

uint64_t DateComponents.day.getter()
{
  return DateComponents.day.getter();
}

uint64_t DateComponents.day.setter()
{
  return DateComponents.day.setter();
}

uint64_t DateComponents.date.getter()
{
  return DateComponents.date.getter();
}

uint64_t DateComponents.hour.setter()
{
  return DateComponents.hour.setter();
}

uint64_t DateComponents.value(for:)()
{
  return DateComponents.value(for:)();
}

uint64_t DateComponents.minute.setter()
{
  return DateComponents.minute.setter();
}

uint64_t DateComponents.second.getter()
{
  return DateComponents.second.getter();
}

uint64_t DateComponents.second.setter()
{
  return DateComponents.second.setter();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t SortDescriptor.init(_:comparator:)()
{
  return SortDescriptor.init(_:comparator:)();
}

uint64_t SortDescriptor.init<A>(_:order:)()
{
  return SortDescriptor.init<A>(_:order:)();
}

uint64_t type metadata accessor for AttributeScopes.FoundationAttributes.MeasurementAttribute.Component()
{
  return type metadata accessor for AttributeScopes.FoundationAttributes.MeasurementAttribute.Component();
}

uint64_t AttributeScopes.FoundationAttributes.measurement.getter()
{
  return AttributeScopes.FoundationAttributes.measurement.getter();
}

uint64_t AttributeScopes.FoundationAttributes.inlinePresentationIntent.getter()
{
  return AttributeScopes.FoundationAttributes.inlinePresentationIntent.getter();
}

uint64_t AttributeScopes.UIKitAttributes.font.getter()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.foregroundColor.getter()
{
  return AttributeScopes.SwiftUIAttributes.foregroundColor.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.font.getter()
{
  return AttributeScopes.SwiftUIAttributes.font.getter();
}

uint64_t AttributeScopes.SwiftUIAttributes.tracking.getter()
{
  return AttributeScopes.SwiftUIAttributes.tracking.getter();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t AttributedString.characters.getter()
{
  return AttributedString.characters.getter();
}

uint64_t type metadata accessor for AttributedString.CharacterView()
{
  return type metadata accessor for AttributedString.CharacterView();
}

uint64_t AttributedString.subscript.setter()
{
  return AttributedString.subscript.setter();
}

uint64_t AttributedString.init(stringLiteral:)()
{
  return AttributedString.init(stringLiteral:)();
}

uint64_t AttributedString.replaceSubrange<A, B>(_:with:)()
{
  return AttributedString.replaceSubrange<A, B>(_:with:)();
}

uint64_t type metadata accessor for AttributedString.FormattingOptions()
{
  return type metadata accessor for AttributedString.FormattingOptions();
}

uint64_t AttributedString.replaceAttributes(_:with:)()
{
  return AttributedString.replaceAttributes(_:with:)();
}

uint64_t type metadata accessor for AttributedString.InterpolationOptions()
{
  return type metadata accessor for AttributedString.InterpolationOptions();
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

uint64_t AttributedString.Runs.subscript.getter()
{
  return AttributedString.Runs.subscript.getter();
}

{
  return AttributedString.Runs.subscript.getter();
}

{
  return AttributedString.Runs.subscript.getter();
}

uint64_t AttributedString.runs.getter()
{
  return AttributedString.runs.getter();
}

uint64_t type metadata accessor for AttributedString.Index()
{
  return type metadata accessor for AttributedString.Index();
}

uint64_t AttributedString.init(localized:defaultValue:options:table:bundle:locale:comment:)()
{
  return AttributedString.init(localized:defaultValue:options:table:bundle:locale:comment:)();
}

uint64_t AttributedString.init<A>(localized:options:table:bundle:locale:comment:including:)()
{
  return AttributedString.init<A>(localized:options:table:bundle:locale:comment:including:)();
}

uint64_t AttributedString.init(localized:options:table:bundle:locale:comment:)()
{
  return AttributedString.init(localized:options:table:bundle:locale:comment:)();
}

uint64_t type metadata accessor for AttributedString()
{
  return type metadata accessor for AttributedString();
}

uint64_t AttributedString.init(_:attributes:)()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t AttributedString.subscript.getter()
{
  return AttributedString.subscript.getter();
}

uint64_t AttributedString.init(_:)()
{
  return AttributedString.init(_:)();
}

{
  return AttributedString.init(_:)();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t URLResourceValues.isDirectory.getter()
{
  return URLResourceValues.isDirectory.getter();
}

uint64_t URLResourceValues.creationDate.getter()
{
  return URLResourceValues.creationDate.getter();
}

uint64_t URLResourceValues.isExcludedFromBackup.getter()
{
  return URLResourceValues.isExcludedFromBackup.getter();
}

uint64_t URLResourceValues.isExcludedFromBackup.setter()
{
  return URLResourceValues.isExcludedFromBackup.setter();
}

uint64_t URLResourceValues.fileSize.getter()
{
  return URLResourceValues.fileSize.getter();
}

uint64_t URLResourceValues.init()()
{
  return URLResourceValues.init()();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t AttributeContainer.subscript.getter()
{
  return AttributeContainer.subscript.getter();
}

uint64_t static AttributeContainer.subscript.getter()
{
  return static AttributeContainer.subscript.getter();
}

uint64_t AttributeContainer.Builder.callAsFunction(_:)()
{
  return AttributeContainer.Builder.callAsFunction(_:)();
}

uint64_t AttributeContainer.init()()
{
  return AttributeContainer.init()();
}

uint64_t type metadata accessor for AttributeContainer()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t AttributeContainer.init(_:)()
{
  return AttributeContainer.init(_:)();
}

uint64_t IntegerFormatStyle.init(locale:)()
{
  return IntegerFormatStyle.init(locale:)();
}

uint64_t IntegerFormatStyle.notation(_:)()
{
  return IntegerFormatStyle.notation(_:)();
}

NSPresentationIntent __swiftcall PresentationIntent._bridgeToObjectiveC()()
{
  return (NSPresentationIntent)PresentationIntent._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for PresentationIntent.Kind()
{
  return type metadata accessor for PresentationIntent.Kind();
}

uint64_t type metadata accessor for PresentationIntent()
{
  return type metadata accessor for PresentationIntent();
}

uint64_t PresentationIntent.init(_:identity:parent:)()
{
  return PresentationIntent.init(_:identity:parent:)();
}

uint64_t static AttributedStringKey.runBoundaries.getter()
{
  return static AttributedStringKey.runBoundaries.getter();
}

uint64_t static AttributedStringKey.inheritedByAddedText.getter()
{
  return static AttributedStringKey.inheritedByAddedText.getter();
}

uint64_t static AttributedStringKey.invalidationConditions.getter()
{
  return static AttributedStringKey.invalidationConditions.getter();
}

uint64_t AttributedSubstring.characters.getter()
{
  return AttributedSubstring.characters.getter();
}

uint64_t type metadata accessor for AttributedSubstring()
{
  return type metadata accessor for AttributedSubstring();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
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

{
  return AttributeDynamicLookup.subscript.getter();
}

{
  return AttributeDynamicLookup.subscript.getter();
}

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

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t LocalizedStringResource.init(stringInterpolation:)()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t dispatch thunk of AttributedStringProtocol.characters.getter()
{
  return dispatch thunk of AttributedStringProtocol.characters.getter();
}

uint64_t dispatch thunk of AttributedStringProtocol.runs.getter()
{
  return dispatch thunk of AttributedStringProtocol.runs.getter();
}

uint64_t AttributedStringProtocol.replacingAttributes(_:with:)()
{
  return AttributedStringProtocol.replacingAttributes(_:with:)();
}

uint64_t static AttributedStringProtocol.== infix<A>(_:_:)()
{
  return static AttributedStringProtocol.== infix<A>(_:_:)();
}

uint64_t dispatch thunk of AttributedStringProtocol.subscript.getter()
{
  return dispatch thunk of AttributedStringProtocol.subscript.getter();
}

uint64_t FloatingPointFormatStyle.init(locale:)()
{
  return FloatingPointFormatStyle.init(locale:)();
}

uint64_t FloatingPointFormatStyle.precision(_:)()
{
  return FloatingPointFormatStyle.precision(_:)();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t static MeasurementFormatUnitUsage<>.workout.getter()
{
  return static MeasurementFormatUnitUsage<>.workout.getter();
}

uint64_t static MeasurementFormatUnitUsage<>.road.getter()
{
  return static MeasurementFormatUnitUsage<>.road.getter();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t static NumberFormatStyleConfiguration.Notation.compactName.getter()
{
  return static NumberFormatStyleConfiguration.Notation.compactName.getter();
}

uint64_t static NumberFormatStyleConfiguration.Notation.automatic.getter()
{
  return static NumberFormatStyleConfiguration.Notation.automatic.getter();
}

uint64_t type metadata accessor for NumberFormatStyleConfiguration.Notation()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Notation();
}

uint64_t static NumberFormatStyleConfiguration.Precision.fractionLength(_:)()
{
  return static NumberFormatStyleConfiguration.Precision.fractionLength(_:)();
}

uint64_t static NumberFormatStyleConfiguration.Precision.fractionLength<A>(_:)()
{
  return static NumberFormatStyleConfiguration.Precision.fractionLength<A>(_:)();
}

uint64_t type metadata accessor for NumberFormatStyleConfiguration.Precision()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Precision();
}

uint64_t static FormatStyleCapitalizationContext.standalone.getter()
{
  return static FormatStyleCapitalizationContext.standalone.getter();
}

uint64_t static FormatStyleCapitalizationContext.== infix(_:_:)()
{
  return static FormatStyleCapitalizationContext.== infix(_:_:)();
}

uint64_t static FormatStyleCapitalizationContext.unknown.getter()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t type metadata accessor for FormatStyleCapitalizationContext()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)()
{
  return _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)();
}

uint64_t URL.isFileURL.getter()
{
  return URL.isFileURL.getter();
}

uint64_t URL.relativePath.getter()
{
  return URL.relativePath.getter();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.pathExtension.getter()
{
  return URL.pathExtension.getter();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t static URL.cachesDirectory.getter()
{
  return static URL.cachesDirectory.getter();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.debugDescription.getter()
{
  return URL.debugDescription.getter();
}

uint64_t static URL.libraryDirectory.getter()
{
  return static URL.libraryDirectory.getter();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

uint64_t URL.setResourceValues(_:)()
{
  return URL.setResourceValues(_:)();
}

uint64_t static URL.temporaryDirectory.getter()
{
  return static URL.temporaryDirectory.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

Swift::Void __swiftcall URL.appendPathComponent(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall URL.appendPathExtension(_:)(Swift::String a1)
{
}

uint64_t URL.deletingPathExtension()()
{
  return URL.deletingPathExtension()();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

Swift::Void __swiftcall URL.stopAccessingSecurityScopedResource()()
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Bool __swiftcall URL.startAccessingSecurityScopedResource()()
{
  return URL.startAccessingSecurityScopedResource()();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

Swift::Void __swiftcall URL.append(queryItems:)(Swift::OpaquePointer queryItems)
{
}

uint64_t URL.append<A>(path:directoryHint:)()
{
  return URL.append<A>(path:directoryHint:)();
}

uint64_t URL.append<A>(component:directoryHint:)()
{
  return URL.append<A>(component:directoryHint:)();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t URL.appending<A>(components:directoryHint:)()
{
  return URL.appending<A>(components:directoryHint:)();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

Swift::String __swiftcall URL.formatted()()
{
  uint64_t v0 = URL.formatted()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t Data._copyContents(initializing:)()
{
  return Data._copyContents(initializing:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.timeIntervalSinceReferenceDate.getter()
{
  return static Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.FormatStyle.TimeStyle.== infix(_:_:)()
{
  return static Date.FormatStyle.TimeStyle.== infix(_:_:)();
}

uint64_t static Date.FormatStyle.TimeStyle.omitted.getter()
{
  return static Date.FormatStyle.TimeStyle.omitted.getter();
}

uint64_t static Date.FormatStyle.TimeStyle.shortened.getter()
{
  return static Date.FormatStyle.TimeStyle.shortened.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.TimeStyle()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t static Date.FormatStyle.DateStyle.abbreviated.getter()
{
  return static Date.FormatStyle.DateStyle.abbreviated.getter();
}

uint64_t static Date.FormatStyle.DateStyle.long.getter()
{
  return static Date.FormatStyle.DateStyle.long.getter();
}

uint64_t static Date.FormatStyle.DateStyle.omitted.getter()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t static Date.FormatStyle.DateStyle.complete.getter()
{
  return static Date.FormatStyle.DateStyle.complete.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.DateStyle()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t Date.FormatStyle.day(_:)()
{
  return Date.FormatStyle.day(_:)();
}

uint64_t Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t Date.FormatStyle.year(_:)()
{
  return Date.FormatStyle.year(_:)();
}

uint64_t Date.FormatStyle.month(_:)()
{
  return Date.FormatStyle.month(_:)();
}

uint64_t static Date.FormatStyle.Symbol.Day.defaultDigits.getter()
{
  return static Date.FormatStyle.Symbol.Day.defaultDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Day()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Day();
}

uint64_t static Date.FormatStyle.Symbol.Year.defaultDigits.getter()
{
  return static Date.FormatStyle.Symbol.Year.defaultDigits.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Year()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Year();
}

uint64_t static Date.FormatStyle.Symbol.Month.abbreviated.getter()
{
  return static Date.FormatStyle.Symbol.Month.abbreviated.getter();
}

uint64_t static Date.FormatStyle.Symbol.Month.wide.getter()
{
  return static Date.FormatStyle.Symbol.Month.wide.getter();
}

uint64_t static Date.FormatStyle.Symbol.Month.narrow.getter()
{
  return static Date.FormatStyle.Symbol.Month.narrow.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Month()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Month();
}

uint64_t static Date.FormatStyle.Symbol.Weekday.abbreviated.getter()
{
  return static Date.FormatStyle.Symbol.Weekday.abbreviated.getter();
}

uint64_t static Date.FormatStyle.Symbol.Weekday.wide.getter()
{
  return static Date.FormatStyle.Symbol.Weekday.wide.getter();
}

uint64_t type metadata accessor for Date.FormatStyle.Symbol.Weekday()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Weekday();
}

uint64_t Date.FormatStyle.format(_:)()
{
  return Date.FormatStyle.format(_:)();
}

uint64_t Date.FormatStyle.weekday(_:)()
{
  return Date.FormatStyle.weekday(_:)();
}

uint64_t type metadata accessor for Date.FormatStyle()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t static Date.distantFuture.getter()
{
  return static Date.distantFuture.getter();
}

uint64_t Date.debugDescription.getter()
{
  return Date.debugDescription.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.ISO8601FormatStyle.day()()
{
  return Date.ISO8601FormatStyle.day()();
}

uint64_t Date.ISO8601FormatStyle.year()()
{
  return Date.ISO8601FormatStyle.year()();
}

uint64_t Date.ISO8601FormatStyle.month()()
{
  return Date.ISO8601FormatStyle.month()();
}

uint64_t type metadata accessor for Date.ISO8601FormatStyle()
{
  return type metadata accessor for Date.ISO8601FormatStyle();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t Date.IntervalFormatStyle.day()()
{
  return Date.IntervalFormatStyle.day()();
}

uint64_t Date.IntervalFormatStyle.init(date:time:locale:calendar:timeZone:)()
{
  return Date.IntervalFormatStyle.init(date:time:locale:calendar:timeZone:)();
}

uint64_t Date.IntervalFormatStyle.year()()
{
  return Date.IntervalFormatStyle.year()();
}

uint64_t Date.IntervalFormatStyle.month(_:)()
{
  return Date.IntervalFormatStyle.month(_:)();
}

uint64_t type metadata accessor for Date.IntervalFormatStyle()
{
  return type metadata accessor for Date.IntervalFormatStyle();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.+ infix(_:_:)()
{
  return static Date.+ infix(_:_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.compare(_:)()
{
  return Date.compare(_:)();
}

uint64_t Date.formatted(date:time:)()
{
  return Date.formatted(date:time:)();
}

uint64_t Date.formatted<A>(_:)()
{
  return Date.formatted<A>(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Date.init<A>(_:strategy:)()
{
  return Date.init<A>(_:strategy:)();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
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

uint64_t UUID.init(uuid:)()
{
  return UUID.init(uuid:)();
}

uint64_t UUID.uuid.getter()
{
  return UUID.uuid.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.LanguageCode.identifier.getter()
{
  return Locale.LanguageCode.identifier.getter();
}

uint64_t type metadata accessor for Locale.LanguageCode()
{
  return type metadata accessor for Locale.LanguageCode();
}

uint64_t Locale.collatorIdentifier.getter()
{
  return Locale.collatorIdentifier.getter();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)Locale._bridgeToObjectiveC()();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t static Locale.== infix(_:_:)()
{
  return static Locale.== infix(_:_:)();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t Locale.Language.languageCode.getter()
{
  return Locale.Language.languageCode.getter();
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

uint64_t type metadata accessor for Calendar.Identifier()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t Calendar.init(identifier:)()
{
  return Calendar.init(identifier:)();
}

uint64_t Calendar.startOfDay(for:)()
{
  return Calendar.startOfDay(for:)();
}

uint64_t Calendar.dateInterval(of:for:)()
{
  return Calendar.dateInterval(of:for:)();
}

uint64_t Calendar.isDateInToday(_:)()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t type metadata accessor for Calendar.MatchingPolicy()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t Calendar.dateComponents(_:from:)()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t type metadata accessor for Calendar.SearchDirection()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t Calendar.isDateInYesterday(_:)()
{
  return Calendar.isDateInYesterday(_:)();
}

uint64_t Calendar.endOfDay(_:)()
{
  return Calendar.endOfDay(_:)();
}

uint64_t type metadata accessor for Calendar.RepeatedTimePolicy()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

NSCalendar __swiftcall Calendar._bridgeToObjectiveC()()
{
  return (NSCalendar)Calendar._bridgeToObjectiveC()();
}

uint64_t static Calendar.autoupdatingCurrent.getter()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t static Calendar.== infix(_:_:)()
{
  return static Calendar.== infix(_:_:)();
}

uint64_t static Calendar._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)()
{
  return Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t Calendar.date(from:)()
{
  return Calendar.date(from:)();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t Calendar.date(byAdding:value:to:wrappingComponents:)()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t Calendar.range(of:in:for:)()
{
  return Calendar.range(of:in:for:)();
}

uint64_t Calendar.isDate(_:inSameDayAs:)()
{
  return Calendar.isDate(_:inSameDayAs:)();
}

uint64_t Calendar.isDate(_:equalTo:toGranularity:)()
{
  return Calendar.isDate(_:equalTo:toGranularity:)();
}

uint64_t Calendar.compare(_:to:toGranularity:)()
{
  return Calendar.compare(_:to:toGranularity:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t static Calendar.Component.== infix(_:_:)()
{
  return static Calendar.Component.== infix(_:_:)();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t Calendar.component(_:from:)()
{
  return Calendar.component(_:from:)();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

void __swiftcall IndexSet._bridgeToObjectiveC()(NSIndexSet *__return_ptr retstr)
{
}

uint64_t IndexSet.count.getter()
{
  return IndexSet.count.getter();
}

uint64_t IndexSet.first.getter()
{
  return IndexSet.first.getter();
}

Swift::tuple_inserted_Bool_memberAfterInsert_Int __swiftcall IndexSet.insert(_:)(Swift::Int a1)
{
  char v1 = IndexSet.insert(_:)(a1);
  result.memberAfterInsert = v2;
  result.inserted = v1;
  return result;
}

uint64_t IndexSet.init(integer:)()
{
  return IndexSet.init(integer:)();
}

uint64_t IndexSet.init()()
{
  return IndexSet.init()();
}

uint64_t type metadata accessor for IndexSet()
{
  return type metadata accessor for IndexSet();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t static TimeZone.autoupdatingCurrent.getter()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t static TimeZone.== infix(_:_:)()
{
  return static TimeZone.== infix(_:_:)();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t IndexPath.init(arrayLiteral:)()
{
  return IndexPath.init(arrayLiteral:)();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath.> infix(_:_:)()
{
  return static IndexPath.> infix(_:_:)();
}

uint64_t static IndexPath.< infix(_:_:)()
{
  return static IndexPath.< infix(_:_:)();
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

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t static Selector.== infix(_:_:)()
{
  return static Selector.== infix(_:_:)();
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t Activity.attributes.getter()
{
  return Activity.attributes.getter();
}

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
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

uint64_t ActivityPresentationOptions.shouldSuppressAlertContentOnLockScreen.setter()
{
  return ActivityPresentationOptions.shouldSuppressAlertContentOnLockScreen.setter();
}

uint64_t type metadata accessor for ActivityPresentationOptions()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t withObservationTracking<A>(_:onChange:)()
{
  return withObservationTracking<A>(_:onChange:)();
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

uint64_t static AVPartialAsyncProperty<A>.stringValue.getter()
{
  return static AVPartialAsyncProperty<A>.stringValue.getter();
}

uint64_t static AVPartialAsyncProperty<A>.dateValue.getter()
{
  return static AVPartialAsyncProperty<A>.dateValue.getter();
}

uint64_t static AVPartialAsyncProperty<A>.duration.getter()
{
  return static AVPartialAsyncProperty<A>.duration.getter();
}

uint64_t static AVPartialAsyncProperty<A>.metadata.getter()
{
  return static AVPartialAsyncProperty<A>.metadata.getter();
}

uint64_t type metadata accessor for CGPathFillRule()
{
  return type metadata accessor for CGPathFillRule();
}

uint64_t CGFloat.init(truncating:)()
{
  return CGFloat.init(truncating:)();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)CGFloat._bridgeToObjectiveC()();
}

uint64_t static CGFloat._forceBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static CGFloat._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t CGFloat.roundToScreenScale()()
{
  return CGFloat.roundToScreenScale()();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t StateOfMindEntryView.init(model:presentationStyle:)()
{
  return StateOfMindEntryView.init(model:presentationStyle:)();
}

uint64_t type metadata accessor for StateOfMindEntryView()
{
  return type metadata accessor for StateOfMindEntryView();
}

uint64_t StateOfMindEntryModel.init(healthStore:configuration:onSampleSave:)()
{
  return StateOfMindEntryModel.init(healthStore:configuration:onSampleSave:)();
}

uint64_t StateOfMindEntryModel.Configuration.init(reflectiveInterval:date:parentSampleUUID:fitnessPlusSessionID:)()
{
  return StateOfMindEntryModel.Configuration.init(reflectiveInterval:date:parentSampleUUID:fitnessPlusSessionID:)();
}

uint64_t static StateOfMindEntryModel.Configuration.InitialReflectiveInterval.fixed(_:)()
{
  return static StateOfMindEntryModel.Configuration.InitialReflectiveInterval.fixed(_:)();
}

uint64_t type metadata accessor for StateOfMindEntryModel.Configuration.InitialReflectiveInterval()
{
  return type metadata accessor for StateOfMindEntryModel.Configuration.InitialReflectiveInterval();
}

uint64_t type metadata accessor for StateOfMindEntryModel.Configuration()
{
  return type metadata accessor for StateOfMindEntryModel.Configuration();
}

uint64_t type metadata accessor for StateOfMindEntryModel()
{
  return type metadata accessor for StateOfMindEntryModel();
}

uint64_t StateOfMindVisualization.ValenceImageProvider.uiImage.getter()
{
  return StateOfMindVisualization.ValenceImageProvider.uiImage.getter();
}

uint64_t type metadata accessor for StateOfMindVisualization.ValenceImageProvider.ImageScale()
{
  return type metadata accessor for StateOfMindVisualization.ValenceImageProvider.ImageScale();
}

uint64_t StateOfMindVisualization.ValenceImageProvider.init(valence:imageScale:)()
{
  return StateOfMindVisualization.ValenceImageProvider.init(valence:imageScale:)();
}

uint64_t type metadata accessor for StateOfMindVisualization.ValenceImageProvider()
{
  return type metadata accessor for StateOfMindVisualization.ValenceImageProvider();
}

uint64_t type metadata accessor for StateOfMindEntryPresentationStyle()
{
  return type metadata accessor for StateOfMindEntryPresentationStyle();
}

uint64_t DataRepresentation.init(exportedContentType:exporting:)()
{
  return DataRepresentation.init(exportedContentType:exporting:)();
}

uint64_t type metadata accessor for DataRepresentation()
{
  return type metadata accessor for DataRepresentation();
}

uint64_t type metadata accessor for TupleTransferRepresentation()
{
  return type metadata accessor for TupleTransferRepresentation();
}

uint64_t TupleTransferRepresentation.init(_:)()
{
  return TupleTransferRepresentation.init(_:)();
}

uint64_t static RegexWordBoundaryKind.simple.getter()
{
  return static RegexWordBoundaryKind.simple.getter();
}

uint64_t type metadata accessor for RegexWordBoundaryKind()
{
  return type metadata accessor for RegexWordBoundaryKind();
}

uint64_t Regex.init(_regexString:version:)()
{
  return Regex.init(_regexString:version:)();
}

uint64_t Regex.ignoresCase(_:)()
{
  return Regex.ignoresCase(_:)();
}

uint64_t Regex.wordBoundaryKind(_:)()
{
  return Regex.wordBoundaryKind(_:)();
}

uint64_t Regex.Match.range.getter()
{
  return Regex.Match.range.getter();
}

uint64_t Regex.Match.output.getter()
{
  return Regex.Match.output.getter();
}

uint64_t ActivitySceneMetrics.init(size:cornerRadius:)()
{
  return ActivitySceneMetrics.init(size:cornerRadius:)();
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return type metadata accessor for ActivitySceneMetrics();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return dispatch thunk of ActivityScene.resolvedMetrics.setter();
}

uint64_t dispatch thunk of ActivityScene.backgroundTintColor.setter()
{
  return dispatch thunk of ActivityScene.backgroundTintColor.setter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t ColorResource.init(name:bundle:)()
{
  return ColorResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ColorResource()
{
  return type metadata accessor for ColorResource();
}

uint64_t static ImageResource.wingsBackground(value:)()
{
  return static ImageResource.wingsBackground(value:)();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ImageResource()
{
  return type metadata accessor for ImageResource();
}

uint64_t static UTType.calendarEvent.getter()
{
  return static UTType.calendarEvent.getter();
}

uint64_t UTType.init(filenameExtension:conformingTo:)()
{
  return UTType.init(filenameExtension:conformingTo:)();
}

uint64_t static UTType.audiovisualContent.getter()
{
  return static UTType.audiovisualContent.getter();
}

UTType __swiftcall UTType._bridgeToObjectiveC()()
{
  return (UTType)UTType._bridgeToObjectiveC()();
}

uint64_t static UTType._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UTType._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static UTType.data.getter()
{
  return static UTType.data.getter();
}

uint64_t static UTType.heic.getter()
{
  return static UTType.heic.getter();
}

uint64_t static UTType.item.getter()
{
  return static UTType.item.getter();
}

uint64_t static UTType.jpeg.getter()
{
  return static UTType.jpeg.getter();
}

uint64_t static UTType.audio.getter()
{
  return static UTType.audio.getter();
}

uint64_t static UTType.image.getter()
{
  return static UTType.image.getter();
}

uint64_t static UTType.movie.getter()
{
  return static UTType.movie.getter();
}

uint64_t static UTType.video.getter()
{
  return static UTType.video.getter();
}

uint64_t static UTType.contact.getter()
{
  return static UTType.contact.getter();
}

uint64_t UTType.conforms(to:)()
{
  return UTType.conforms(to:)();
}

uint64_t static UTType.livePhoto.getter()
{
  return static UTType.livePhoto.getter();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
}

uint64_t MOOnboardingNavigationController.init(onboardingDelegate:)()
{
  return MOOnboardingNavigationController.init(onboardingDelegate:)();
}

uint64_t type metadata accessor for MOOnboardingNavigationController()
{
  return type metadata accessor for MOOnboardingNavigationController();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t OSSignpostID.init(log:)()
{
  return OSSignpostID.init(log:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
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

uint64_t dispatch thunk of UIContentView.configuration.setter()
{
  return dispatch thunk of UIContentView.configuration.setter();
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

uint64_t UICellAccessory.CheckmarkOptions.init(isHidden:reservedLayoutWidth:tintColor:)()
{
  return UICellAccessory.CheckmarkOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t type metadata accessor for UICellAccessory.CheckmarkOptions()
{
  return type metadata accessor for UICellAccessory.CheckmarkOptions();
}

uint64_t UICellAccessory.PopUpMenuOptions.init(isHidden:reservedLayoutWidth:tintColor:)()
{
  return UICellAccessory.PopUpMenuOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t type metadata accessor for UICellAccessory.PopUpMenuOptions()
{
  return type metadata accessor for UICellAccessory.PopUpMenuOptions();
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

uint64_t static UICellAccessory.checkmark(displayed:options:)()
{
  return static UICellAccessory.checkmark(displayed:options:)();
}

uint64_t static UICellAccessory.popUpMenu(_:displayed:options:selectedElementDidChangeHandler:)()
{
  return static UICellAccessory.popUpMenu(_:displayed:options:selectedElementDidChangeHandler:)();
}

uint64_t type metadata accessor for UICellAccessory()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t UIMutableTraits.userInterfaceStyle.setter()
{
  return UIMutableTraits.userInterfaceStyle.setter();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t type metadata accessor for UITraitLegibilityWeight()
{
  return type metadata accessor for UITraitLegibilityWeight();
}

uint64_t UICellConfigurationState.traitCollection.getter()
{
  return UICellConfigurationState.traitCollection.getter();
}

uint64_t static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UICellConfigurationState()
{
  return type metadata accessor for UICellConfigurationState();
}

uint64_t UIBackgroundConfiguration.backgroundColor.setter()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t UIBackgroundConfiguration.backgroundInsets.modify()
{
  return UIBackgroundConfiguration.backgroundInsets.modify();
}

uint64_t static UIBackgroundConfiguration.clear()()
{
  return static UIBackgroundConfiguration.clear()();
}

uint64_t static UIBackgroundConfiguration.listCell()()
{
  return static UIBackgroundConfiguration.listCell()();
}

uint64_t type metadata accessor for UIBackgroundConfiguration()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t type metadata accessor for UITraitUserInterfaceStyle()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t UIListContentConfiguration.secondaryText.setter()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t UIListContentConfiguration.TextProperties.font.setter()
{
  return UIListContentConfiguration.TextProperties.font.setter();
}

uint64_t UIListContentConfiguration.TextProperties.color.getter()
{
  return UIListContentConfiguration.TextProperties.color.getter();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t type metadata accessor for UIListContentConfiguration.TextProperties()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties();
}

uint64_t UIListContentConfiguration.textProperties.modify()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t UIListContentConfiguration.textProperties.getter()
{
  return UIListContentConfiguration.textProperties.getter();
}

uint64_t UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter()
{
  return UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter();
}

uint64_t UIListContentConfiguration.ImageProperties.reservedLayoutSize.modify()
{
  return UIListContentConfiguration.ImageProperties.reservedLayoutSize.modify();
}

uint64_t UIListContentConfiguration.ImageProperties.tintColor.setter()
{
  return UIListContentConfiguration.ImageProperties.tintColor.setter();
}

uint64_t UIListContentConfiguration.imageProperties.modify()
{
  return UIListContentConfiguration.imageProperties.modify();
}

uint64_t UIListContentConfiguration.imageToTextPadding.setter()
{
  return UIListContentConfiguration.imageToTextPadding.setter();
}

uint64_t UIListContentConfiguration.directionalLayoutMargins.modify()
{
  return UIListContentConfiguration.directionalLayoutMargins.modify();
}

uint64_t UIListContentConfiguration.directionalLayoutMargins.getter()
{
  return UIListContentConfiguration.directionalLayoutMargins.getter();
}

uint64_t UIListContentConfiguration.directionalLayoutMargins.setter()
{
  return UIListContentConfiguration.directionalLayoutMargins.setter();
}

uint64_t static UIListContentConfiguration.prominentInsetGroupedHeader()()
{
  return static UIListContentConfiguration.prominentInsetGroupedHeader()();
}

uint64_t UIListContentConfiguration.textToSecondaryTextVerticalPadding.getter()
{
  return UIListContentConfiguration.textToSecondaryTextVerticalPadding.getter();
}

uint64_t UIListContentConfiguration.axesPreservingSuperviewLayoutMargins.modify()
{
  return UIListContentConfiguration.axesPreservingSuperviewLayoutMargins.modify();
}

uint64_t UIListContentConfiguration.axesPreservingSuperviewLayoutMargins.setter()
{
  return UIListContentConfiguration.axesPreservingSuperviewLayoutMargins.setter();
}

uint64_t UIListContentConfiguration.textToSecondaryTextHorizontalPadding.getter()
{
  return UIListContentConfiguration.textToSecondaryTextHorizontalPadding.getter();
}

uint64_t static UIListContentConfiguration.cell()()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t UIListContentConfiguration.text.getter()
{
  return UIListContentConfiguration.text.getter();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t UIListContentConfiguration.image.setter()
{
  return UIListContentConfiguration.image.setter();
}

uint64_t UIListContentConfiguration.updated(for:)()
{
  return UIListContentConfiguration.updated(for:)();
}

uint64_t static UIListContentConfiguration.valueCell()()
{
  return static UIListContentConfiguration.valueCell()();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t NSDiffableDataSourceSnapshot.appendItems(_:toSection:)()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.deleteItems(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.insertItems(_:afterItem:)()
{
  return NSDiffableDataSourceSnapshot.insertItems(_:afterItem:)();
}

uint64_t NSDiffableDataSourceSnapshot.numberOfItems.getter()
{
  return NSDiffableDataSourceSnapshot.numberOfItems.getter();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.appendSections(_:)(Swift::OpaquePointer a1)
{
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.deleteAllItems()()
{
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.deleteSections(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.insertSections(_:beforeSection:)()
{
  return NSDiffableDataSourceSnapshot.insertSections(_:beforeSection:)();
}

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.reloadSections(_:)(Swift::OpaquePointer a1)
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

Swift::Void __swiftcall NSDiffableDataSourceSnapshot.reconfigureItems(_:)(Swift::OpaquePointer a1)
{
}

uint64_t NSDiffableDataSourceSnapshot.sectionIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t NSDiffableDataSourceSnapshot.reloadedItemIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.reloadedItemIdentifiers.getter();
}

uint64_t NSDiffableDataSourceSnapshot.reconfiguredItemIdentifiers.getter()
{
  return NSDiffableDataSourceSnapshot.reconfiguredItemIdentifiers.getter();
}

uint64_t static NSDiffableDataSourceSnapshot._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static NSDiffableDataSourceSnapshot._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t NSDiffableDataSourceSnapshot.moveItem(_:afterItem:)()
{
  return NSDiffableDataSourceSnapshot.moveItem(_:afterItem:)();
}

uint64_t NSDiffableDataSourceSnapshot.moveItem(_:beforeItem:)()
{
  return NSDiffableDataSourceSnapshot.moveItem(_:beforeItem:)();
}

uint64_t NSDiffableDataSourceSnapshot.init()()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t UIListSeparatorConfiguration.bottomSeparatorVisibility.setter()
{
  return UIListSeparatorConfiguration.bottomSeparatorVisibility.setter();
}

uint64_t UIListSeparatorConfiguration.bottomSeparatorInsets.modify()
{
  return UIListSeparatorConfiguration.bottomSeparatorInsets.modify();
}

uint64_t UIListSeparatorConfiguration.bottomSeparatorInsets.setter()
{
  return UIListSeparatorConfiguration.bottomSeparatorInsets.setter();
}

uint64_t type metadata accessor for UIListSeparatorConfiguration.Visibility()
{
  return type metadata accessor for UIListSeparatorConfiguration.Visibility();
}

uint64_t type metadata accessor for UIListSeparatorConfiguration()
{
  return type metadata accessor for UIListSeparatorConfiguration();
}

uint64_t UITableViewDiffableDataSource.init(tableView:cellProvider:)()
{
  return UITableViewDiffableDataSource.init(tableView:cellProvider:)();
}

uint64_t dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)()
{
  return dispatch thunk of UITableViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t UIContentUnavailableConfiguration.background.modify()
{
  return UIContentUnavailableConfiguration.background.modify();
}

uint64_t UIContentUnavailableConfiguration.background.setter()
{
  return UIContentUnavailableConfiguration.background.setter();
}

uint64_t UIContentUnavailableConfiguration.secondaryText.setter()
{
  return UIContentUnavailableConfiguration.secondaryText.setter();
}

uint64_t UIContentUnavailableConfiguration.ImageProperties.tintColor.setter()
{
  return UIContentUnavailableConfiguration.ImageProperties.tintColor.setter();
}

uint64_t UIContentUnavailableConfiguration.imageProperties.modify()
{
  return UIContentUnavailableConfiguration.imageProperties.modify();
}

uint64_t UIContentUnavailableConfiguration.ButtonProperties.primaryAction.setter()
{
  return UIContentUnavailableConfiguration.ButtonProperties.primaryAction.setter();
}

uint64_t UIContentUnavailableConfiguration.buttonProperties.modify()
{
  return UIContentUnavailableConfiguration.buttonProperties.modify();
}

uint64_t UIContentUnavailableConfiguration.imageToTextPadding.setter()
{
  return UIContentUnavailableConfiguration.imageToTextPadding.setter();
}

uint64_t UIContentUnavailableConfiguration.secondaryAttributedText.setter()
{
  return UIContentUnavailableConfiguration.secondaryAttributedText.setter();
}

uint64_t UIContentUnavailableConfiguration.directionalLayoutMargins.modify()
{
  return UIContentUnavailableConfiguration.directionalLayoutMargins.modify();
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

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.applySnapshotUsingReloadData(_:completion:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.applySnapshotUsingReloadData(_:completion:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
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

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.index(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.index(for:)();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.snapshot()()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)();
}

uint64_t NSDiffableDataSourceSectionSnapshot.append(_:to:)()
{
  return NSDiffableDataSourceSectionSnapshot.append(_:to:)();
}

uint64_t NSDiffableDataSourceSectionSnapshot.init()()
{
  return NSDiffableDataSourceSectionSnapshot.init()();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.Appearance()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.FooterMode()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.FooterMode();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t UICollectionLayoutListConfiguration.init(appearance:)()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t UICollectionLayoutListConfiguration.footerMode.setter()
{
  return UICollectionLayoutListConfiguration.footerMode.setter();
}

uint64_t UICollectionLayoutListConfiguration.headerMode.setter()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t UICollectionLayoutListConfiguration.backgroundColor.setter()
{
  return UICollectionLayoutListConfiguration.backgroundColor.setter();
}

uint64_t UICollectionLayoutListConfiguration.showsSeparators.setter()
{
  return UICollectionLayoutListConfiguration.showsSeparators.setter();
}

uint64_t UICollectionLayoutListConfiguration.itemSeparatorHandler.setter()
{
  return UICollectionLayoutListConfiguration.itemSeparatorHandler.setter();
}

uint64_t type metadata accessor for UICollectionLayoutListConfiguration()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t type metadata accessor for UITraitPreferredContentSizeCategory()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UIContentUnavailableConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UIContentUnavailableConfigurationState()
{
  return type metadata accessor for UIContentUnavailableConfigurationState();
}

uint64_t type metadata accessor for UIConfigurationTextAttributesTransformer()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t UIConfigurationTextAttributesTransformer.init(_:)()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t static ScaleDomain<>.automatic<A>(includesZero:reversed:dataType:modifyInferredDomain:)()
{
  return static ScaleDomain<>.automatic<A>(includesZero:reversed:dataType:modifyInferredDomain:)();
}

uint64_t AxisGridLine.init(centered:stroke:)()
{
  return AxisGridLine.init(centered:stroke:)();
}

uint64_t type metadata accessor for AxisGridLine()
{
  return type metadata accessor for AxisGridLine();
}

uint64_t ChartContent.foregroundStyle<A>(_:)()
{
  return ChartContent.foregroundStyle<A>(_:)();
}

uint64_t ChartContent.lineStyle(_:)()
{
  return ChartContent.lineStyle(_:)();
}

uint64_t static AxisMarkPreset.automatic.getter()
{
  return static AxisMarkPreset.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPreset()
{
  return type metadata accessor for AxisMarkPreset();
}

uint64_t static AxisMarkValues.stride(by:count:roundLowerBound:roundUpperBound:calendar:)()
{
  return static AxisMarkValues.stride(by:count:roundLowerBound:roundUpperBound:calendar:)();
}

uint64_t static AxisMarkValues.automatic(desiredCount:roundLowerBound:roundUpperBound:)()
{
  return static AxisMarkValues.automatic(desiredCount:roundLowerBound:roundUpperBound:)();
}

uint64_t type metadata accessor for AxisMarkValues()
{
  return type metadata accessor for AxisMarkValues();
}

uint64_t AxisValueLabel.init<A>(format:centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)()
{
  return AxisValueLabel.init<A>(format:centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)();
}

uint64_t AxisValueLabel.init<>(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)()
{
  return AxisValueLabel.init<>(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)();
}

uint64_t static AxisMarkPosition.automatic.getter()
{
  return static AxisMarkPosition.automatic.getter();
}

uint64_t type metadata accessor for AxisMarkPosition()
{
  return type metadata accessor for AxisMarkPosition();
}

uint64_t type metadata accessor for ChartAxisContent()
{
  return type metadata accessor for ChartAxisContent();
}

uint64_t static PositionScaleRange<>.plotDimension(padding:)()
{
  return static PositionScaleRange<>.plotDimension(padding:)();
}

uint64_t static PlottableProjection.value(_:_:)()
{
  return static PlottableProjection.value(_:_:)();
}

uint64_t type metadata accessor for AutomaticScaleDomain()
{
  return type metadata accessor for AutomaticScaleDomain();
}

uint64_t type metadata accessor for PlotDimensionScaleRange()
{
  return type metadata accessor for PlotDimensionScaleRange();
}

uint64_t static AxisValueLabelOrientation.automatic.getter()
{
  return static AxisValueLabelOrientation.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelOrientation()
{
  return type metadata accessor for AxisValueLabelOrientation();
}

uint64_t static AxisValueLabelCollisionResolution.greedy(priority:minimumSpacing:)()
{
  return static AxisValueLabelCollisionResolution.greedy(priority:minimumSpacing:)();
}

uint64_t static AxisValueLabelCollisionResolution.greedy.getter()
{
  return static AxisValueLabelCollisionResolution.greedy.getter();
}

uint64_t static AxisValueLabelCollisionResolution.automatic.getter()
{
  return static AxisValueLabelCollisionResolution.automatic.getter();
}

uint64_t type metadata accessor for AxisValueLabelCollisionResolution()
{
  return type metadata accessor for AxisValueLabelCollisionResolution();
}

uint64_t Chart.init(content:)()
{
  return Chart.init(content:)();
}

uint64_t AxisMark.foregroundStyle<A>(_:)()
{
  return AxisMark.foregroundStyle<A>(_:)();
}

uint64_t AxisMark.font(_:)()
{
  return AxisMark.font(_:)();
}

uint64_t AxisMark.offset(x:y:)()
{
  return AxisMark.offset(x:y:)();
}

uint64_t AxisTick.init(centered:length:stroke:)()
{
  return AxisTick.init(centered:length:stroke:)();
}

uint64_t type metadata accessor for AxisTick()
{
  return type metadata accessor for AxisTick();
}

uint64_t RulePlot.init<A, B, C>(_:x:yStart:yEnd:)()
{
  return RulePlot.init<A, B, C>(_:x:yStart:yEnd:)();
}

uint64_t AxisMarks.init(preset:position:values:content:)()
{
  return AxisMarks.init(preset:position:values:content:)();
}

uint64_t AxisMarks.init<A>(preset:position:values:content:)()
{
  return AxisMarks.init<A>(preset:position:values:content:)();
}

uint64_t AxisValue.as<A>(_:)()
{
  return AxisValue.as<A>(_:)();
}

uint64_t AxisValue.count.getter()
{
  return AxisValue.count.getter();
}

uint64_t AxisValue.index.getter()
{
  return AxisValue.index.getter();
}

uint64_t type metadata accessor for AxisValue()
{
  return type metadata accessor for AxisValue();
}

uint64_t type metadata accessor for ScaleType()
{
  return type metadata accessor for ScaleType();
}

uint64_t SpeechAnalyzer.__allocating_init<A>(client:inputSequence:audioFormat:modules:options:restrictedLogging:analysisContext:didChangeVolatileRange:)()
{
  return SpeechAnalyzer.__allocating_init<A>(client:inputSequence:audioFormat:modules:options:restrictedLogging:analysisContext:didChangeVolatileRange:)();
}

uint64_t type metadata accessor for SpeechAnalyzer()
{
  return type metadata accessor for SpeechAnalyzer();
}

uint64_t ClientInfo.init(identifier:)()
{
  return ClientInfo.init(identifier:)();
}

uint64_t type metadata accessor for ClientInfo()
{
  return type metadata accessor for ClientInfo();
}

uint64_t type metadata accessor for Transcriber.ModelOptions()
{
  return type metadata accessor for Transcriber.ModelOptions();
}

uint64_t type metadata accessor for Transcriber.ReportingOption()
{
  return type metadata accessor for Transcriber.ReportingOption();
}

uint64_t Transcriber.MultisegmentResult.earResultType.getter()
{
  return Transcriber.MultisegmentResult.earResultType.getter();
}

uint64_t Transcriber.MultisegmentResult.transcriptions.getter()
{
  return Transcriber.MultisegmentResult.transcriptions.getter();
}

uint64_t Transcriber.MultisegmentResult.resultsFinalToTime.getter()
{
  return Transcriber.MultisegmentResult.resultsFinalToTime.getter();
}

uint64_t Transcriber.MultisegmentResult.range.getter()
{
  return Transcriber.MultisegmentResult.range.getter();
}

uint64_t Transcriber.MultisegmentResult.segments.getter()
{
  return Transcriber.MultisegmentResult.segments.getter();
}

uint64_t type metadata accessor for Transcriber.MultisegmentResult()
{
  return type metadata accessor for Transcriber.MultisegmentResult();
}

uint64_t type metadata accessor for Transcriber.TranscriptionOption()
{
  return type metadata accessor for Transcriber.TranscriptionOption();
}

uint64_t Transcriber.multisegmentResults.getter()
{
  return Transcriber.multisegmentResults.getter();
}

uint64_t Transcriber.init(locale:taskHint:modelOptions:transcriptionOptions:reportingOptions:attributeOptions:)()
{
  return Transcriber.init(locale:taskHint:modelOptions:transcriptionOptions:reportingOptions:attributeOptions:)();
}

uint64_t type metadata accessor for Transcriber()
{
  return type metadata accessor for Transcriber();
}

uint64_t AnalyzerInput.init(buffer:bufferStartTime:)()
{
  return AnalyzerInput.init(buffer:bufferStartTime:)();
}

uint64_t type metadata accessor for AnalyzerInput()
{
  return type metadata accessor for AnalyzerInput();
}

uint64_t type metadata accessor for EARResultType()
{
  return type metadata accessor for EARResultType();
}

uint64_t type metadata accessor for AnalysisContext()
{
  return type metadata accessor for AnalysisContext();
}

uint64_t type metadata accessor for AnalysisOptions()
{
  return type metadata accessor for AnalysisOptions();
}

uint64_t type metadata accessor for TimeRangeAttribute()
{
  return type metadata accessor for TimeRangeAttribute();
}

uint64_t TranscriptionSegment.text.getter()
{
  return TranscriptionSegment.text.getter();
}

uint64_t type metadata accessor for TranscriptionSegment()
{
  return type metadata accessor for TranscriptionSegment();
}

uint64_t type metadata accessor for TranscriptionResultAttributeOption()
{
  return type metadata accessor for TranscriptionResultAttributeOption();
}

uint64_t type metadata accessor for TaskHint()
{
  return type metadata accessor for TaskHint();
}

uint64_t FilePath.init(_:)()
{
  return FilePath.init(_:)();
}

uint64_t FilePath.removePrefix(_:)()
{
  return FilePath.removePrefix(_:)();
}

uint64_t FilePath.string.getter()
{
  return FilePath.string.getter();
}

uint64_t type metadata accessor for FilePath()
{
  return type metadata accessor for FilePath();
}

uint64_t AnyTip.id.getter()
{
  return AnyTip.id.getter();
}

uint64_t type metadata accessor for AnyTip()
{
  return type metadata accessor for AnyTip();
}

uint64_t AnyTip.init<A>(_:)()
{
  return AnyTip.init<A>(_:)();
}

uint64_t dispatch thunk of Tip.id.getter()
{
  return dispatch thunk of Tip.id.getter();
}

uint64_t Tip.invalidate(reason:)()
{
  return Tip.invalidate(reason:)();
}

uint64_t Tip.statusUpdates.getter()
{
  return Tip.statusUpdates.getter();
}

uint64_t Tip.shouldDisplayUpdates.getter()
{
  return Tip.shouldDisplayUpdates.getter();
}

uint64_t Tip.id.getter()
{
  return Tip.id.getter();
}

uint64_t Tip.actions.getter()
{
  return Tip.actions.getter();
}

uint64_t TipUIPopoverViewController.popoverPresentationController.getter()
{
  return TipUIPopoverViewController.popoverPresentationController.getter();
}

uint64_t type metadata accessor for TipUIPopoverViewController()
{
  return type metadata accessor for TipUIPopoverViewController();
}

uint64_t TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)()
{
  return TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)();
}

uint64_t TipView.init(_:arrowEdge:action:)()
{
  return TipView.init(_:arrowEdge:action:)();
}

uint64_t type metadata accessor for TipUIView()
{
  return type metadata accessor for TipUIView();
}

uint64_t TipUIView.init(_:arrowEdge:actionHandler:)()
{
  return TipUIView.init(_:arrowEdge:actionHandler:)();
}

uint64_t static Tips.showTipsForTesting(_:)()
{
  return static Tips.showTipsForTesting(_:)();
}

uint64_t static Tips.hideAllTipsForTesting()()
{
  return static Tips.hideAllTipsForTesting()();
}

uint64_t static Tips.RuleBuilder.buildExpression(_:)()
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

uint64_t static Tips.resetDatastore()()
{
  return static Tips.resetDatastore()();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return type metadata accessor for Tips.MaxDisplayCount();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return Tips.MaxDisplayCount.init(_:)();
}

uint64_t static Tips.ParameterOption.transient.getter()
{
  return static Tips.ParameterOption.transient.getter();
}

uint64_t type metadata accessor for Tips.ParameterOption()
{
  return type metadata accessor for Tips.ParameterOption();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return type metadata accessor for Tips.InvalidationReason();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.daily.getter()
{
  return static Tips.ConfigurationOption.DisplayFrequency.daily.getter();
}

uint64_t static Tips.ConfigurationOption.DisplayFrequency.immediate.getter()
{
  return static Tips.ConfigurationOption.DisplayFrequency.immediate.getter();
}

uint64_t type metadata accessor for Tips.ConfigurationOption.DisplayFrequency()
{
  return type metadata accessor for Tips.ConfigurationOption.DisplayFrequency();
}

uint64_t static Tips.ConfigurationOption.displayFrequency(_:)()
{
  return static Tips.ConfigurationOption.displayFrequency(_:)();
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

uint64_t Tips.Parameter.wrappedValue.getter()
{
  return Tips.Parameter.wrappedValue.getter();
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

uint64_t type metadata accessor for Publishers.PrefetchStrategy()
{
  return type metadata accessor for Publishers.PrefetchStrategy();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t AsyncPublisher.makeAsyncIterator()()
{
  return AsyncPublisher.makeAsyncIterator()();
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

uint64_t Subject<>.send()()
{
  return Subject<>.send()();
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

uint64_t Publisher.buffer(size:prefetch:whenFull:)()
{
  return Publisher.buffer(size:prefetch:whenFull:)();
}

uint64_t Publisher.collect<A>(_:options:)()
{
  return Publisher.collect<A>(_:options:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.debounce<A>(for:scheduler:options:)()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t Publisher.throttle<A>(for:scheduler:latest:)()
{
  return Publisher.throttle<A>(for:scheduler:latest:)();
}

uint64_t Publisher.subscribe<A>(on:options:)()
{
  return Publisher.subscribe<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t Publisher<>.values.getter()
{
  return Publisher<>.values.getter();
}

uint64_t NWPathMonitor.pathUpdateHandler.setter()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t NWPathMonitor.start(queue:)()
{
  return NWPathMonitor.start(queue:)();
}

uint64_t type metadata accessor for NWPathMonitor.Iterator()
{
  return type metadata accessor for NWPathMonitor.Iterator();
}

uint64_t NWPathMonitor.init()()
{
  return NWPathMonitor.init()();
}

uint64_t type metadata accessor for NWPathMonitor()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t NWPath.isConstrained.getter()
{
  return NWPath.isConstrained.getter();
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

uint64_t AppStorage.init<A>(wrappedValue:_:store:)()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t AppStorage.wrappedValue.getter()
{
  return AppStorage.wrappedValue.getter();
}

uint64_t AppStorage.wrappedValue.setter()
{
  return AppStorage.wrappedValue.setter();
}

uint64_t AppStorage.projectedValue.getter()
{
  return AppStorage.projectedValue.getter();
}

uint64_t AppStorage.init<A>(_:store:)()
{
  return AppStorage.init<A>(_:store:)();
}

uint64_t DatePicker.init(selection:displayedComponents:label:)()
{
  return DatePicker.init(selection:displayedComponents:label:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t LazyHStack.init(alignment:spacing:pinnedViews:content:)()
{
  return LazyHStack.init(alignment:spacing:pinnedViews:content:)();
}

uint64_t type metadata accessor for LazyHStack()
{
  return type metadata accessor for LazyHStack();
}

uint64_t type metadata accessor for ScrollView()
{
  return type metadata accessor for ScrollView();
}

uint64_t ScrollView.init(_:showsIndicators:content:)()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t ShapeStyle._apply(to:)()
{
  return ShapeStyle._apply(to:)();
}

uint64_t static ShapeStyle._apply(to:)()
{
  return static ShapeStyle._apply(to:)();
}

uint64_t ShapeStyle.blendMode(_:)()
{
  return ShapeStyle.blendMode(_:)();
}

uint64_t Transition.combined<A>(with:)()
{
  return Transition.combined<A>(with:)();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for ControlSize()
{
  return type metadata accessor for ControlSize();
}

uint64_t DragGesture.init<A>(minimumDistance:coordinateSpace:)()
{
  return DragGesture.init<A>(minimumDistance:coordinateSpace:)();
}

uint64_t DragGesture.Value.location.getter()
{
  return DragGesture.Value.location.getter();
}

uint64_t type metadata accessor for DragGesture()
{
  return type metadata accessor for DragGesture();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t Environment.init<A>(_:)()
{
  return Environment.init<A>(_:)();
}

uint64_t static GestureMask.all.getter()
{
  return static GestureMask.all.getter();
}

uint64_t ScrollPhase.isScrolling.getter()
{
  return ScrollPhase.isScrolling.getter();
}

uint64_t static ShadowStyle.drop(color:radius:x:y:)()
{
  return static ShadowStyle.drop(color:radius:x:y:)();
}

uint64_t type metadata accessor for ShadowStyle()
{
  return type metadata accessor for ShadowStyle();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ToolbarItem<>.init(placement:content:)()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t Transaction.disablesAnimations.getter()
{
  return Transaction.disablesAnimations.getter();
}

uint64_t Transaction.animation.getter()
{
  return Transaction.animation.getter();
}

uint64_t Transaction.animation.setter()
{
  return Transaction.animation.setter();
}

uint64_t Transaction.subscript.getter()
{
  return Transaction.subscript.getter();
}

uint64_t Transaction.subscript.setter()
{
  return Transaction.subscript.setter();
}

uint64_t ProgressView.init<>(_:)()
{
  return ProgressView.init<>(_:)();
}

uint64_t ScaledMetric.init(wrappedValue:relativeTo:)()
{
  return ScaledMetric.init(wrappedValue:relativeTo:)();
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

uint64_t SharePreview<>.init(_:)()
{
  return SharePreview<>.init(_:)();
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

uint64_t static AnyTransition.scale(scale:anchor:)()
{
  return static AnyTransition.scale(scale:anchor:)();
}

uint64_t static AnyTransition.offset(x:y:)()
{
  return static AnyTransition.offset(x:y:)();
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

uint64_t AnyTransition.animation(_:)()
{
  return AnyTransition.animation(_:)();
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

uint64_t type metadata accessor for GeometryProxy()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t ImageRenderer.uiImage.getter()
{
  return ImageRenderer.uiImage.getter();
}

uint64_t ImageRenderer.proposedSize.setter()
{
  return ImageRenderer.proposedSize.setter();
}

uint64_t ImageRenderer.scale.setter()
{
  return ImageRenderer.scale.setter();
}

uint64_t ImageRenderer.__allocating_init(content:)()
{
  return ImageRenderer.__allocating_init(content:)();
}

uint64_t ImageRenderer.isOpaque.setter()
{
  return ImageRenderer.isOpaque.setter();
}

uint64_t ImageRenderer.colorMode.setter()
{
  return ImageRenderer.colorMode.setter();
}

uint64_t type metadata accessor for ImageRenderer()
{
  return type metadata accessor for ImageRenderer();
}

uint64_t LayoutSubview.sizeThatFits(_:)()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t LayoutSubview.place(at:anchor:proposal:)()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t LayoutSubview.priority.getter()
{
  return LayoutSubview.priority.getter();
}

uint64_t type metadata accessor for LayoutSubview()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t LayoutSubview.subscript.getter()
{
  return LayoutSubview.subscript.getter();
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

uint64_t static PreferenceKey._isReadableByHost.getter()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t static PreferenceKey._includesRemovedValues.getter()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t static TextAlignment.== infix(_:_:)()
{
  return static TextAlignment.== infix(_:_:)();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static EnvironmentKey._valuesEqual(_:_:)()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t LabeledContent<>.init(content:label:)()
{
  return LabeledContent<>.init(content:label:)();
}

uint64_t LayoutSubviews.layoutDirection.getter()
{
  return LayoutSubviews.layoutDirection.getter();
}

uint64_t type metadata accessor for LayoutSubviews()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t LinearGradient.init(gradient:startPoint:endPoint:)()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t NavigationLink.init(destination:label:)()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t NavigationView.init(content:)()
{
  return NavigationView.init(content:)();
}

uint64_t ScrollGeometry.contentSize.getter()
{
  return ScrollGeometry.contentSize.getter();
}

uint64_t ScrollGeometry.contentInsets.getter()
{
  return ScrollGeometry.contentInsets.getter();
}

uint64_t ScrollGeometry.contentOffset.getter()
{
  return ScrollGeometry.contentOffset.getter();
}

uint64_t ScrollGeometry.bounds.getter()
{
  return ScrollGeometry.bounds.getter();
}

uint64_t ScrollPosition.init<A>(idType:x:y:)()
{
  return ScrollPosition.init<A>(idType:x:y:)();
}

uint64_t ScrollPosition.scrollTo(x:)()
{
  return ScrollPosition.scrollTo(x:)();
}

uint64_t ScrollPosition.scrollTo(edge:)()
{
  return ScrollPosition.scrollTo(edge:)();
}

uint64_t type metadata accessor for ScrollPosition()
{
  return type metadata accessor for ScrollPosition();
}

uint64_t TintShapeStyle.init()()
{
  return TintShapeStyle.init()();
}

uint64_t type metadata accessor for TintShapeStyle()
{
  return type metadata accessor for TintShapeStyle();
}

uint64_t AsyncImagePhase.image.getter()
{
  return AsyncImagePhase.image.getter();
}

uint64_t type metadata accessor for AsyncImagePhase()
{
  return type metadata accessor for AsyncImagePhase();
}

uint64_t ButtonMenuStyle.init()()
{
  return ButtonMenuStyle.init()();
}

uint64_t type metadata accessor for ButtonMenuStyle()
{
  return type metadata accessor for ButtonMenuStyle();
}

uint64_t ContainerValues.tag<A>(for:)()
{
  return ContainerValues.tag<A>(for:)();
}

uint64_t type metadata accessor for ContainerValues()
{
  return type metadata accessor for ContainerValues();
}

uint64_t DisclosureGroup.init(content:label:)()
{
  return DisclosureGroup.init(content:label:)();
}

uint64_t static DynamicProperty._propertyBehaviors.getter()
{
  return static DynamicProperty._propertyBehaviors.getter();
}

Swift::Void __swiftcall DynamicProperty.update()()
{
}

uint64_t DynamicTypeSize.isAccessibilitySize.getter()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t static LayoutDirection.== infix(_:_:)()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t type metadata accessor for LayoutDirection()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t ModifiedContent<>.accessibilityValue(_:)()
{
  return ModifiedContent<>.accessibilityValue(_:)();
}

uint64_t ModifiedContent<>.accessibilityValue<A>(_:)()
{
  return ModifiedContent<>.accessibilityValue<A>(_:)();
}

uint64_t ModifiedContent<>.accessibilityAddTraits(_:)()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t ModifiedContent<>.accessibilityRemoveTraits(_:)()
{
  return ModifiedContent<>.accessibilityRemoveTraits(_:)();
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

uint64_t withTransaction<A>(_:_:)()
{
  return withTransaction<A>(_:_:)();
}

uint64_t LayoutProperties.stackOrientation.setter()
{
  return LayoutProperties.stackOrientation.setter();
}

uint64_t LayoutProperties.init()()
{
  return LayoutProperties.init()();
}

uint64_t PlainButtonStyle.init()()
{
  return PlainButtonStyle.init()();
}

uint64_t type metadata accessor for PlainButtonStyle()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t static RedactionReasons.invalidated.getter()
{
  return static RedactionReasons.invalidated.getter();
}

uint64_t type metadata accessor for RedactionReasons()
{
  return type metadata accessor for RedactionReasons();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t static ButtonBorderShape.circle.getter()
{
  return static ButtonBorderShape.circle.getter();
}

uint64_t static ButtonBorderShape.capsule.getter()
{
  return static ButtonBorderShape.capsule.getter();
}

uint64_t static ButtonBorderShape.automatic.getter()
{
  return static ButtonBorderShape.automatic.getter();
}

uint64_t type metadata accessor for ButtonBorderShape()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t ButtonToggleStyle.init()()
{
  return ButtonToggleStyle.init()();
}

uint64_t type metadata accessor for ButtonToggleStyle()
{
  return type metadata accessor for ButtonToggleStyle();
}

uint64_t static ContentShapeKinds.hoverEffect.getter()
{
  return static ContentShapeKinds.hoverEffect.getter();
}

uint64_t static ContentShapeKinds.interaction.getter()
{
  return static ContentShapeKinds.interaction.getter();
}

uint64_t static ContentShapeKinds.accessibility.getter()
{
  return static ContentShapeKinds.accessibility.getter();
}

uint64_t type metadata accessor for ContentShapeKinds()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t static ContentTransition.numericText(countsDown:)()
{
  return static ContentTransition.numericText(countsDown:)();
}

uint64_t static ContentTransition.symbolEffect<A>(_:options:)()
{
  return static ContentTransition.symbolEffect<A>(_:options:)();
}

uint64_t type metadata accessor for ContentTransition()
{
  return type metadata accessor for ContentTransition();
}

uint64_t EnvironmentValues.imageScale.getter()
{
  return EnvironmentValues.imageScale.getter();
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

uint64_t EnvironmentValues.controlSize.setter()
{
  return EnvironmentValues.controlSize.setter();
}

uint64_t EnvironmentValues.isPresented.getter()
{
  return EnvironmentValues.isPresented.getter();
}

uint64_t EnvironmentValues.displayScale.getter()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t EnvironmentValues.displayScale.setter()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
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

uint64_t EnvironmentValues.redactionReasons.getter()
{
  return EnvironmentValues.redactionReasons.getter();
}

uint64_t EnvironmentValues.redactionReasons.setter()
{
  return EnvironmentValues.redactionReasons.setter();
}

uint64_t EnvironmentValues._openSensitiveURL.getter()
{
  return EnvironmentValues._openSensitiveURL.getter();
}

uint64_t EnvironmentValues.contentTransition.getter()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t EnvironmentValues._buttonBorderShape.getter()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t EnvironmentValues._buttonBorderShape.setter()
{
  return EnvironmentValues._buttonBorderShape.setter();
}

uint64_t EnvironmentValues.backgroundMaterial.getter()
{
  return EnvironmentValues.backgroundMaterial.getter();
}

uint64_t EnvironmentValues.backgroundMaterial.setter()
{
  return EnvironmentValues.backgroundMaterial.setter();
}

uint64_t EnvironmentValues.minimumScaleFactor.getter()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t EnvironmentValues.minimumScaleFactor.setter()
{
  return EnvironmentValues.minimumScaleFactor.setter();
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

uint64_t EnvironmentValues.accessibilityReduceMotion.getter()
{
  return EnvironmentValues.accessibilityReduceMotion.getter();
}

uint64_t EnvironmentValues.accessibilityShowButtonShapes.getter()
{
  return EnvironmentValues.accessibilityShowButtonShapes.getter();
}

uint64_t EnvironmentValues._accessibilityShowButtonShapes.getter()
{
  return EnvironmentValues._accessibilityShowButtonShapes.getter();
}

uint64_t EnvironmentValues._accessibilityShowButtonShapes.setter()
{
  return EnvironmentValues._accessibilityShowButtonShapes.setter();
}

uint64_t EnvironmentValues.accessibilityReduceTransparency.getter()
{
  return EnvironmentValues.accessibilityReduceTransparency.getter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
}

uint64_t EnvironmentValues.locale.getter()
{
  return EnvironmentValues.locale.getter();
}

uint64_t EnvironmentValues.dismiss.getter()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t EnvironmentValues.calendar.getter()
{
  return EnvironmentValues.calendar.getter();
}

uint64_t EnvironmentValues.textCase.getter()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t EnvironmentValues.textCase.setter()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t EnvironmentValues.timeZone.getter()
{
  return EnvironmentValues.timeZone.getter();
}

uint64_t type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t EnvironmentValues.widgetFamily.getter()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t EnvironmentValues.widgetRenderingMode.getter()
{
  return EnvironmentValues.widgetRenderingMode.getter();
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

uint64_t EnvironmentValues.subscript.setter()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t static FocusInteractions.activate.getter()
{
  return static FocusInteractions.activate.getter();
}

uint64_t type metadata accessor for FocusInteractions()
{
  return type metadata accessor for FocusInteractions();
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

uint64_t static VerticalAlignment.firstTextBaseline.getter()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t static VerticalAlignment.top.getter()
{
  return static VerticalAlignment.top.getter();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t type metadata accessor for ColorRenderingMode()
{
  return type metadata accessor for ColorRenderingMode();
}

uint64_t IconOnlyLabelStyle.init()()
{
  return IconOnlyLabelStyle.init()();
}

uint64_t type metadata accessor for IconOnlyLabelStyle()
{
  return type metadata accessor for IconOnlyLabelStyle();
}

uint64_t IdentityTransition.init()()
{
  return IdentityTransition.init()();
}

uint64_t type metadata accessor for IdentityTransition()
{
  return type metadata accessor for IdentityTransition();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

uint64_t LocalizedStringKey.StringInterpolation.appendInterpolation(_:)()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
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

uint64_t static RoundedCornerStyle.== infix(_:_:)()
{
  return static RoundedCornerStyle.== infix(_:_:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t type metadata accessor for SubviewsCollection()
{
  return type metadata accessor for SubviewsCollection();
}

uint64_t static AccessibilityTraits.isSelected.getter()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t static AccessibilityTraits.updatesFrequently.getter()
{
  return static AccessibilityTraits.updatesFrequently.getter();
}

uint64_t static AccessibilityTraits.isButton.getter()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t static AccessibilityTraits.isHeader.getter()
{
  return static AccessibilityTraits.isHeader.getter();
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

uint64_t TupleToolbarContent.init(_:)()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t dispatch thunk of UIHostingController.rootView.getter()
{
  return dispatch thunk of UIHostingController.rootView.getter();
}

uint64_t dispatch thunk of UIHostingController.rootView.setter()
{
  return dispatch thunk of UIHostingController.rootView.setter();
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

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t static DatePickerComponents.hourAndMinute.getter()
{
  return static DatePickerComponents.hourAndMinute.getter();
}

uint64_t static DatePickerComponents.date.getter()
{
  return static DatePickerComponents.date.getter();
}

uint64_t type metadata accessor for DatePickerComponents()
{
  return type metadata accessor for DatePickerComponents();
}

uint64_t type metadata accessor for NamedCoordinateSpace()
{
  return type metadata accessor for NamedCoordinateSpace();
}

uint64_t static ScrollBounceBehavior.basedOnSize.getter()
{
  return static ScrollBounceBehavior.basedOnSize.getter();
}

uint64_t type metadata accessor for ScrollBounceBehavior()
{
  return type metadata accessor for ScrollBounceBehavior();
}

uint64_t static ToolbarItemPlacement.topBarLeading.getter()
{
  return static ToolbarItemPlacement.topBarLeading.getter();
}

uint64_t static ToolbarItemPlacement.topBarTrailing.getter()
{
  return static ToolbarItemPlacement.topBarTrailing.getter();
}

uint64_t static ToolbarItemPlacement.principal.getter()
{
  return static ToolbarItemPlacement.principal.getter();
}

uint64_t type metadata accessor for ToolbarItemPlacement()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t type metadata accessor for _BlendModeShapeStyle()
{
  return type metadata accessor for _BlendModeShapeStyle();
}

uint64_t static BlurReplaceTransition.Configuration.downUp.getter()
{
  return static BlurReplaceTransition.Configuration.downUp.getter();
}

uint64_t type metadata accessor for BlurReplaceTransition.Configuration()
{
  return type metadata accessor for BlurReplaceTransition.Configuration();
}

uint64_t BlurReplaceTransition.init(configuration:)()
{
  return BlurReplaceTransition.init(configuration:)();
}

uint64_t type metadata accessor for BlurReplaceTransition()
{
  return type metadata accessor for BlurReplaceTransition();
}

uint64_t BorderlessButtonStyle.init()()
{
  return BorderlessButtonStyle.init()();
}

uint64_t type metadata accessor for BorderlessButtonStyle()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t InsetGroupedListStyle.init()()
{
  return InsetGroupedListStyle.init()();
}

uint64_t type metadata accessor for InsetGroupedListStyle()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t type metadata accessor for PinnedScrollableViews()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t static ToolbarContentBuilder.buildBlock<A>(_:)()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t static ContentMarginPlacement.scrollContent.getter()
{
  return static ContentMarginPlacement.scrollContent.getter();
}

uint64_t type metadata accessor for ContentMarginPlacement()
{
  return type metadata accessor for ContentMarginPlacement();
}

uint64_t ContentUnavailableView.init(label:description:actions:)()
{
  return ContentUnavailableView.init(label:description:actions:)();
}

uint64_t static HierarchicalShapeStyle.quaternary.getter()
{
  return static HierarchicalShapeStyle.quaternary.getter();
}

uint64_t static HierarchicalShapeStyle.primary.getter()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t static HierarchicalShapeStyle.tertiary.getter()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t UIHostingConfiguration.makeContentView()()
{
  return UIHostingConfiguration.makeContentView()();
}

uint64_t UIHostingConfiguration.margins(_:_:)()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t UIHostingConfiguration<>.init(content:)()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t AccessibilityFocusState.wrappedValue.setter()
{
  return AccessibilityFocusState.wrappedValue.setter();
}

uint64_t AccessibilityFocusState.projectedValue.getter()
{
  return AccessibilityFocusState.projectedValue.getter();
}

uint64_t AccessibilityFocusState.init<>()()
{
  return AccessibilityFocusState.init<>()();
}

uint64_t type metadata accessor for AccessibilityFocusState()
{
  return type metadata accessor for AccessibilityFocusState();
}

uint64_t static CoordinateSpaceProtocol<>.named<A>(_:)()
{
  return static CoordinateSpaceProtocol<>.named<A>(_:)();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Icon()
{
  return type metadata accessor for LabelStyleConfiguration.Icon();
}

uint64_t LabelStyleConfiguration.icon.getter()
{
  return LabelStyleConfiguration.icon.getter();
}

uint64_t type metadata accessor for LabelStyleConfiguration.Title()
{
  return type metadata accessor for LabelStyleConfiguration.Title();
}

uint64_t LabelStyleConfiguration.title.getter()
{
  return LabelStyleConfiguration.title.getter();
}

uint64_t SafeAreaPaddingModifier.init(edges:insets:)()
{
  return SafeAreaPaddingModifier.init(edges:insets:)();
}

uint64_t type metadata accessor for SafeAreaPaddingModifier()
{
  return type metadata accessor for SafeAreaPaddingModifier();
}

uint64_t type metadata accessor for SubviewsCollectionSlice()
{
  return type metadata accessor for SubviewsCollectionSlice();
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

uint64_t type metadata accessor for ForEachSubviewCollection()
{
  return type metadata accessor for ForEachSubviewCollection();
}

uint64_t type metadata accessor for AccessibilityTechnologies()
{
  return type metadata accessor for AccessibilityTechnologies();
}

uint64_t AnimationTimelineSchedule.init(minimumInterval:paused:)()
{
  return AnimationTimelineSchedule.init(minimumInterval:paused:)();
}

uint64_t type metadata accessor for AnimationTimelineSchedule()
{
  return type metadata accessor for AnimationTimelineSchedule();
}

uint64_t static MatchedGeometryProperties.frame.getter()
{
  return static MatchedGeometryProperties.frame.getter();
}

uint64_t static MatchedGeometryProperties.position.getter()
{
  return static MatchedGeometryProperties.position.getter();
}

uint64_t static ScrollIndicatorVisibility.hidden.getter()
{
  return static ScrollIndicatorVisibility.hidden.getter();
}

uint64_t type metadata accessor for ScrollIndicatorVisibility()
{
  return type metadata accessor for ScrollIndicatorVisibility();
}

uint64_t static AccessibilityChildBehavior.ignore.getter()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t static AccessibilityChildBehavior.contain.getter()
{
  return static AccessibilityChildBehavior.contain.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t UIViewRepresentableContext.coordinator.getter()
{
  return UIViewRepresentableContext.coordinator.getter();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t static ContainerBackgroundPlacement.widget.getter()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t type metadata accessor for ContainerBackgroundPlacement()
{
  return type metadata accessor for ContainerBackgroundPlacement();
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

Swift::Void __swiftcall AXChartDescriptorRepresentable.updateChartDescriptor(_:)(AXChartDescriptor a1)
{
}

uint64_t ProgressViewStyleConfiguration.fractionCompleted.getter()
{
  return ProgressViewStyleConfiguration.fractionCompleted.getter();
}

uint64_t type metadata accessor for AccessibilityAttachmentModifier()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t UIViewControllerRepresentableContext.coordinator.getter()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t UIViewControllerRepresentableContext.transaction.getter()
{
  return UIViewControllerRepresentableContext.transaction.getter();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Axis.Set.horizontal.getter()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t Axis.Set.init(rawValue:)()
{
  return Axis.Set.init(rawValue:)();
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

uint64_t static Font.largeTitle.getter()
{
  return static Font.largeTitle.getter();
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

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
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

uint64_t type metadata accessor for Font.Leading()
{
  return type metadata accessor for Font.Leading();
}

uint64_t static Font.caption.getter()
{
  return static Font.caption.getter();
}

uint64_t Font.leading(_:)()
{
  return Font.leading(_:)();
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

uint64_t Link.init(sensitiveUrl:label:)()
{
  return Link.init(sensitiveUrl:label:)();
}

uint64_t List<>.init(content:)()
{
  return List<>.init(content:)();
}

uint64_t Menu.init(content:label:)()
{
  return Menu.init(content:label:)();
}

uint64_t Text.fontDesign(_:)()
{
  return Text.fontDesign(_:)();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.monospacedDigit()()
{
  return Text.monospacedDigit()();
}

uint64_t Text.contentTransition(_:)()
{
  return Text.contentTransition(_:)();
}

uint64_t Text.accessibilityLabel(_:)()
{
  return Text.accessibilityLabel(_:)();
}

uint64_t static Text.+ infix(_:_:)()
{
  return static Text.+ infix(_:_:)();
}

uint64_t type metadata accessor for Text.Case()
{
  return type metadata accessor for Text.Case();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.shadow(color:radius:x:y:)()
{
  return Text.shadow(color:radius:x:y:)();
}

uint64_t Text.tracking(_:)()
{
  return Text.tracking(_:)();
}

uint64_t static Text.LineStyle.Pattern.solid.getter()
{
  return static Text.LineStyle.Pattern.solid.getter();
}

uint64_t type metadata accessor for Text.LineStyle.Pattern()
{
  return type metadata accessor for Text.LineStyle.Pattern();
}

uint64_t Text.init<A>(_:format:)()
{
  return Text.init<A>(_:format:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init(_:)()
{
  return Text.init(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t View.chartXAxis<A>(content:)()
{
  return View.chartXAxis<A>(content:)();
}

uint64_t View.chartYAxis<A>(content:)()
{
  return View.chartYAxis<A>(content:)();
}

uint64_t View.chartXScale<A, B>(domain:range:type:)()
{
  return View.chartXScale<A, B>(domain:range:type:)();
}

uint64_t View.chartYScale<A, B>(domain:range:type:)()
{
  return View.chartYScale<A, B>(domain:range:type:)();
}

uint64_t View.chartPlotStyle<A>(content:)()
{
  return View.chartPlotStyle<A>(content:)();
}

uint64_t View.chartXAxisStyle<A>(content:)()
{
  return View.chartXAxisStyle<A>(content:)();
}

uint64_t View.chartYAxisStyle<A>(content:)()
{
  return View.chartYAxisStyle<A>(content:)();
}

uint64_t View.tipBackground<A>(_:)()
{
  return View.tipBackground<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.progressViewStyle<A>(_:)()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t View.fontWeight(_:)()
{
  return View.fontWeight(_:)();
}

uint64_t View.labelStyle<A>(_:)()
{
  return View.labelStyle<A>(_:)();
}

uint64_t View.transition(_:)()
{
  return View.transition(_:)();
}

uint64_t View.unredacted()()
{
  return View.unredacted()();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.environment<A>(_:)()
{
  return View.environment<A>(_:)();
}

uint64_t View.environment<A>(_:_:)()
{
  return View.environment<A>(_:_:)();
}

uint64_t View.layoutValue<A>(key:value:)()
{
  return View.layoutValue<A>(key:value:)();
}

uint64_t View.toggleStyle<A>(_:)()
{
  return View.toggleStyle<A>(_:)();
}

uint64_t View.contentShape<A>(_:_:eoFill:)()
{
  return View.contentShape<A>(_:_:eoFill:)();
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

uint64_t View.phaseAnimator<A, B, C>(_:content:animation:)()
{
  return View.phaseAnimator<A, B, C>(_:content:animation:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.contentMargins(_:_:for:)()
{
  return View.contentMargins(_:_:for:)();
}

uint64_t View.scrollDisabled(_:)()
{
  return View.scrollDisabled(_:)();
}

uint64_t View.scrollPosition(_:anchor:)()
{
  return View.scrollPosition(_:anchor:)();
}

uint64_t View.dynamicTypeSize(_:)()
{
  return View.dynamicTypeSize(_:)();
}

uint64_t View.dynamicTypeSize<A>(_:)()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t View.foregroundStyle<A>(_:)()
{
  return View.foregroundStyle<A>(_:)();
}

uint64_t View.monospacedDigit()()
{
  return View.monospacedDigit()();
}

uint64_t View.navigationTitle(_:)()
{
  return View.navigationTitle(_:)();
}

{
  return View.navigationTitle(_:)();
}

uint64_t View.navigationTitle<A>(_:)()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t View.scrollIndicators(_:axes:)()
{
  return View.scrollIndicators(_:axes:)();
}

uint64_t View.accessibilityLabel(_:)()
{
  return View.accessibilityLabel(_:)();
}

{
  return View.accessibilityLabel(_:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.minimumScaleFactor(_:)()
{
  return View.minimumScaleFactor(_:)();
}

uint64_t View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)()
{
  return View.onLongPressGesture(minimumDuration:maximumDistance:pressing:perform:)();
}

uint64_t View.accessibilityAction(named:_:)()
{
  return View.accessibilityAction(named:_:)();
}

uint64_t View.accessibilityHidden(_:)()
{
  return View.accessibilityHidden(_:)();
}

uint64_t View.containerBackground<A>(_:for:)()
{
  return View.containerBackground<A>(_:for:)();
}

uint64_t View.defaultScrollAnchor(_:)()
{
  return View.defaultScrollAnchor(_:)();
}

uint64_t View.onScrollPhaseChange(_:)()
{
  return View.onScrollPhaseChange(_:)();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.accessibilityFocused(_:)()
{
  return View.accessibilityFocused(_:)();
}

uint64_t View.invalidatableContent(_:)()
{
  return View.invalidatableContent(_:)();
}

uint64_t View.scrollBounceBehavior(_:axes:)()
{
  return View.scrollBounceBehavior(_:axes:)();
}

uint64_t View.matchedGeometryEffect<A>(id:in:properties:anchor:isSource:)()
{
  return View.matchedGeometryEffect<A>(id:in:properties:anchor:isSource:)();
}

uint64_t View.navigationDestination<A, B>(item:destination:)()
{
  return View.navigationDestination<A, B>(item:destination:)();
}

uint64_t View.accessibilityAddTraits(_:)()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t View.onScrollGeometryChange<A>(for:of:action:)()
{
  return View.onScrollGeometryChange<A>(for:of:action:)();
}

uint64_t View.accessibilityIdentifier(_:)()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t View.accessibilityRemoveTraits(_:)()
{
  return View.accessibilityRemoveTraits(_:)();
}

uint64_t View.backgroundPreferenceValue<A, B>(_:alignment:_:)()
{
  return View.backgroundPreferenceValue<A, B>(_:alignment:_:)();
}

uint64_t View.accessibilityChartDescriptor<A>(_:)()
{
  return View.accessibilityChartDescriptor<A>(_:)();
}

uint64_t View.navigationBarTitleDisplayMode(_:)()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t View.bold(_:)()
{
  return View.bold(_:)();
}

uint64_t View.font(_:)()
{
  return View.font(_:)();
}

uint64_t View.task<A>(id:priority:_:)()
{
  return View.task<A>(id:priority:_:)();
}

uint64_t View.frame(width:height:alignment:)()
{
  return View.frame(width:height:alignment:)();
}

uint64_t View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t View.shadow(color:radius:x:y:)()
{
  return View.shadow(color:radius:x:y:)();
}

uint64_t View.zIndex(_:)()
{
  return View.zIndex(_:)();
}

uint64_t View.gesture<A>(_:including:)()
{
  return View.gesture<A>(_:including:)();
}

uint64_t View.overlay<A>(_:ignoresSafeAreaEdges:)()
{
  return View.overlay<A>(_:ignoresSafeAreaEdges:)();
}

uint64_t View.padding(_:)()
{
  return View.padding(_:)();
}

uint64_t View.padding(_:_:)()
{
  return View.padding(_:_:)();
}

uint64_t View.toolbar<A>(content:)()
{
  return View.toolbar<A>(content:)();
}

uint64_t View.disabled(_:)()
{
  return View.disabled(_:)();
}

uint64_t View.modifier<A>(_:)()
{
  return View.modifier<A>(_:)();
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

uint64_t View.tracking(_:)()
{
  return View.tracking(_:)();
}

uint64_t View.clipShape<A>(_:style:)()
{
  return View.clipShape<A>(_:style:)();
}

uint64_t View.fixedSize(horizontal:vertical:)()
{
  return View.fixedSize(horizontal:vertical:)();
}

uint64_t View.focusable(_:interactions:)()
{
  return View.focusable(_:interactions:)();
}

uint64_t View.lineLimit(_:)()
{
  return View.lineLimit(_:)();
}

uint64_t View.listStyle<A>(_:)()
{
  return View.listStyle<A>(_:)();
}

uint64_t View.menuStyle<A>(_:)()
{
  return View.menuStyle<A>(_:)();
}

uint64_t View.underline(_:pattern:color:)()
{
  return View.underline(_:pattern:color:)();
}

uint64_t Color.cgColor.getter()
{
  return Color.cgColor.getter();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.red.getter()
{
  return static Color.red.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
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

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

{
  return Color.init(_:)();
}

uint64_t Group.init<A, B>(subviews:transform:)()
{
  return Group.init<A, B>(subviews:transform:)();
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

uint64_t type metadata accessor for Image.Scale()
{
  return type metadata accessor for Image.Scale();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t Image.init(_:)()
{
  return Image.init(_:)();
}

uint64_t Label.init(title:icon:)()
{
  return Label.init(title:icon:)();
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

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t type metadata accessor for Button()
{
  return type metadata accessor for Button();
}

uint64_t static Layout._makeLayoutView(root:inputs:body:)()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t Layout.updateCache(_:subviews:)()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t static Layout.layoutProperties.getter()
{
  return static Layout.layoutProperties.getter();
}

uint64_t Layout.explicitAlignment(of:in:proposal:subviews:cache:)()
{
  return Layout.explicitAlignment(of:in:proposal:subviews:cache:)();
}

uint64_t Layout.spacing(subviews:cache:)()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t Picker.init(selection:label:content:)()
{
  return Picker.init(selection:label:content:)();
}

uint64_t Picker<>.init(_:selection:content:)()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t Toggle.init(isOn:label:)()
{
  return Toggle.init(isOn:label:)();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
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

uint64_t Binding.animation(_:)()
{
  return Binding.animation(_:)();
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

uint64_t ForEach.init<A>(subviewOf:content:)()
{
  return ForEach.init<A>(subviewOf:content:)();
}

uint64_t ForEach<>.init(_:id:content:)()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t type metadata accessor for ForEach()
{
  return type metadata accessor for ForEach();
}

uint64_t Gesture<>.onChanged(_:)()
{
  return Gesture<>.onChanged(_:)();
}

uint64_t Section<>.init(header:content:)()
{
  return Section<>.init(header:content:)();
}

uint64_t Section<>.init(header:footer:content:)()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t Section<>.init(content:)()
{
  return Section<>.init(content:)();
}

uint64_t Subview.containerValues.getter()
{
  return Subview.containerValues.getter();
}

uint64_t type metadata accessor for Subview.ID()
{
  return type metadata accessor for Subview.ID();
}

uint64_t type metadata accessor for Subview()
{
  return type metadata accessor for Subview();
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

uint64_t Gradient.Stop.init(color:location:)()
{
  return Gradient.Stop.init(color:location:)();
}

uint64_t Gradient.init(stops:)()
{
  return Gradient.init(stops:)();
}

uint64_t Gradient.init(colors:)()
{
  return Gradient.init(colors:)();
}

uint64_t static Material.regular.getter()
{
  return static Material.regular.getter();
}

uint64_t static Material.ultraThin.getter()
{
  return static Material.ultraThin.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.topLeading.getter()
{
  return static Alignment.topLeading.getter();
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

uint64_t Animation.repeatForever(autoreverses:)()
{
  return Animation.repeatForever(autoreverses:)();
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

uint64_t static Animation.easeOut(duration:)()
{
  return static Animation.easeOut(duration:)();
}

uint64_t static Animation.easeInOut(duration:)()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t AnyLayout.updateCache(_:subviews:)()
{
  return AnyLayout.updateCache(_:subviews:)();
}

uint64_t AnyLayout.sizeThatFits(proposal:subviews:cache:)()
{
  return AnyLayout.sizeThatFits(proposal:subviews:cache:)();
}

uint64_t AnyLayout.placeSubviews(in:proposal:subviews:cache:)()
{
  return AnyLayout.placeSubviews(in:proposal:subviews:cache:)();
}

uint64_t type metadata accessor for AnyLayout.Cache()
{
  return type metadata accessor for AnyLayout.Cache();
}

uint64_t AnyLayout.makeCache(subviews:)()
{
  return AnyLayout.makeCache(subviews:)();
}

uint64_t AnyLayout.init<A>(_:)()
{
  return AnyLayout.init<A>(_:)();
}

uint64_t type metadata accessor for BlendMode()
{
  return type metadata accessor for BlendMode();
}

uint64_t Namespace.wrappedValue.getter()
{
  return Namespace.wrappedValue.getter();
}

uint64_t ShareLink.init<A>(item:subject:message:preview:label:)()
{
  return ShareLink.init<A>(item:subject:message:preview:label:)();
}

uint64_t type metadata accessor for TupleView()
{
  return type metadata accessor for TupleView();
}

uint64_t TupleView.init(_:)()
{
  return TupleView.init(_:)();
}

uint64_t static UnitPoint.topLeading.getter()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t static UnitPoint.topTrailing.getter()
{
  return static UnitPoint.topTrailing.getter();
}

uint64_t static UnitPoint.top.getter()
{
  return static UnitPoint.top.getter();
}

uint64_t static UnitPoint.bottom.getter()
{
  return static UnitPoint.bottom.getter();
}

uint64_t static UnitPoint.center.getter()
{
  return static UnitPoint.center.getter();
}

uint64_t static UnitPoint.leading.getter()
{
  return static UnitPoint.leading.getter();
}

uint64_t static UnitPoint.trailing.getter()
{
  return static UnitPoint.trailing.getter();
}

uint64_t ReplaceSymbolEffect.downUp.getter()
{
  return ReplaceSymbolEffect.downUp.getter();
}

uint64_t ReplaceSymbolEffect.init()()
{
  return ReplaceSymbolEffect.init()();
}

uint64_t type metadata accessor for ReplaceSymbolEffect()
{
  return type metadata accessor for ReplaceSymbolEffect();
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

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t DispatchQoS.relativePriority.getter()
{
  return DispatchQoS.relativePriority.getter();
}

uint64_t static DispatchQoS.default.getter()
{
  return static DispatchQoS.default.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t DispatchTime.advanced(by:)()
{
  return DispatchTime.advanced(by:)();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
}

uint64_t static MusicAuthorization.currentStatus.getter()
{
  return static MusicAuthorization.currentStatus.getter();
}

uint64_t type metadata accessor for MusicAuthorization.Status()
{
  return type metadata accessor for MusicAuthorization.Status();
}

uint64_t type metadata accessor for PHPickerFilter()
{
  return type metadata accessor for PHPickerFilter();
}

uint64_t PHPickerConfiguration.init(photoLibrary:)()
{
  return PHPickerConfiguration.init(photoLibrary:)();
}

uint64_t PHPickerConfiguration.selectionLimit.setter()
{
  return PHPickerConfiguration.selectionLimit.setter();
}

uint64_t type metadata accessor for PHPickerConfiguration.AssetRepresentationMode()
{
  return type metadata accessor for PHPickerConfiguration.AssetRepresentationMode();
}

uint64_t PHPickerConfiguration.preferredAssetRepresentationMode.setter()
{
  return PHPickerConfiguration.preferredAssetRepresentationMode.setter();
}

uint64_t PHPickerConfiguration.Update.selectionLimit.setter()
{
  return PHPickerConfiguration.Update.selectionLimit.setter();
}

uint64_t PHPickerConfiguration.Update.init()()
{
  return PHPickerConfiguration.Update.init()();
}

uint64_t type metadata accessor for PHPickerConfiguration.Update()
{
  return type metadata accessor for PHPickerConfiguration.Update();
}

uint64_t PHPickerConfiguration.filter.setter()
{
  return PHPickerConfiguration.filter.setter();
}

uint64_t type metadata accessor for PHPickerConfiguration.Selection()
{
  return type metadata accessor for PHPickerConfiguration.Selection();
}

uint64_t PHPickerConfiguration.selection.setter()
{
  return PHPickerConfiguration.selection.setter();
}

uint64_t type metadata accessor for PHPickerConfiguration()
{
  return type metadata accessor for PHPickerConfiguration();
}

uint64_t static AppStore.requestReview(in:)()
{
  return static AppStore.requestReview(in:)();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t Insecure.SHA1Digest.withUnsafeBytes<A>(_:)()
{
  return Insecure.SHA1Digest.withUnsafeBytes<A>(_:)();
}

uint64_t type metadata accessor for Insecure.SHA1Digest()
{
  return type metadata accessor for Insecure.SHA1Digest();
}

uint64_t Insecure.SHA1.update(bufferPointer:)()
{
  return Insecure.SHA1.update(bufferPointer:)();
}

uint64_t Insecure.SHA1.finalize()()
{
  return Insecure.SHA1.finalize()();
}

uint64_t Insecure.SHA1.init()()
{
  return Insecure.SHA1.init()();
}

uint64_t type metadata accessor for Insecure.SHA1()
{
  return type metadata accessor for Insecure.SHA1();
}

uint64_t static WidgetRenderingMode.vibrant.getter()
{
  return static WidgetRenderingMode.vibrant.getter();
}

uint64_t type metadata accessor for WidgetRenderingMode()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)()
{
  return dispatch thunk of WidgetCenter.reloadTimelines(ofKind:)();
}

uint64_t dispatch thunk of WidgetCenter.reloadAllTimelines()()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

Swift::Void __swiftcall WidgetCenter.invalidateRelevances(ofKind:)(Swift::String ofKind)
{
}

uint64_t static WidgetCenter.shared.getter()
{
  return static WidgetCenter.shared.getter();
}

uint64_t type metadata accessor for WidgetCenter()
{
  return type metadata accessor for WidgetCenter();
}

uint64_t WidgetFamily.init(rawValue:)()
{
  return WidgetFamily.init(rawValue:)();
}

uint64_t WidgetFamily.rawValue.getter()
{
  return WidgetFamily.rawValue.getter();
}

uint64_t type metadata accessor for WidgetFamily()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t Array.init()()
{
  return Array.init()();
}

uint64_t CancellationError.init()()
{
  return CancellationError.init()();
}

Swift::String __swiftcall BinaryFloatingPoint.formatted()()
{
  uint64_t v0 = BinaryFloatingPoint.formatted()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.removeValue(forKey:)()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return Dictionary.init(minimumCapacity:)();
}

uint64_t type metadata accessor for Dictionary.Keys()
{
  return type metadata accessor for Dictionary.Keys();
}

uint64_t Dictionary.count.getter()
{
  return Dictionary.count.getter();
}

uint64_t Dictionary.index(after:)()
{
  return Dictionary.index(after:)();
}

Swift::Void __swiftcall Dictionary.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Dictionary()
{
  return type metadata accessor for Dictionary();
}

uint64_t Dictionary.subscript.getter()
{
  return Dictionary.subscript.getter();
}

{
  return Dictionary.subscript.getter();
}

uint64_t Dictionary.subscript.setter()
{
  return Dictionary.subscript.setter();
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

uint64_t Character.isWhitespace.getter()
{
  return Character.isWhitespace.getter();
}

uint64_t Character.isPunctuation.getter()
{
  return Character.isPunctuation.getter();
}

uint64_t Character.hash(into:)()
{
  return Character.hash(into:)();
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)()
{
  return BidirectionalCollection<>.firstMatch<A, B>(of:)();
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t BidirectionalCollection<>.contains<A>(_:)()
{
  return BidirectionalCollection<>.contains<A>(_:)();
}

uint64_t dispatch thunk of BidirectionalCollection.index(before:)()
{
  return dispatch thunk of BidirectionalCollection.index(before:)();
}

uint64_t BidirectionalCollection<>.difference<A>(from:)()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t static Comparable.> infix(_:_:)()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t static Comparable.>= infix(_:_:)()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t static Comparable.<= infix(_:_:)()
{
  return static Comparable.<= infix(_:_:)();
}

uint64_t MutableCollection.move(fromOffsets:toOffset:)()
{
  return MutableCollection.move(fromOffsets:toOffset:)();
}

uint64_t type metadata accessor for ClosedRange()
{
  return type metadata accessor for ClosedRange();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t type metadata accessor for String.IntentInputOptions()
{
  return type metadata accessor for String.IntentInputOptions();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A, B>(_:format:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A, B>(_:format:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation(_:options:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation(_:options:)();
}

uint64_t String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall String.LocalizationValue.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for String.LocalizationValue.StringInterpolation()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t String.LocalizationValue.init(stringInterpolation:)()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t static String.StandardComparator.localizedStandard.getter()
{
  return static String.StandardComparator.localizedStandard.getter();
}

uint64_t type metadata accessor for String.StandardComparator()
{
  return type metadata accessor for String.StandardComparator();
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

uint64_t String.init(localized:defaultValue:table:bundle:locale:comment:)()
{
  return String.init(localized:defaultValue:table:bundle:locale:comment:)();
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
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = String.uppercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.debugDescription.getter()
{
  return String.debugDescription.getter();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(before:)()
{
  return String.index(before:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
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

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

Swift::Int __swiftcall String.UTF16View._foreignCount()()
{
  return String.UTF16View._foreignCount()();
}

uint64_t String.UTF16View._nativeGetOffset(for:)()
{
  return String.UTF16View._nativeGetOffset(for:)();
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

{
  return String.init<A>(_:)();
}

uint64_t Sequence.sorted<A, B>(using:)()
{
  return Sequence.sorted<A, B>(using:)();
}

uint64_t Sequence.formatted<A>(_:)()
{
  return Sequence.formatted<A>(_:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return Sequence._copyContents(initializing:)();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

{
  return RawRepresentable<>.init(from:)();
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

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
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

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t Array.endIndex.getter()
{
  return Array.endIndex.getter();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
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

uint64_t type metadata accessor for CancellationError()
{
  return type metadata accessor for CancellationError();
}

uint64_t TaskGroup.makeAsyncIterator()()
{
  return TaskGroup.makeAsyncIterator()();
}

Swift::Void __swiftcall TaskGroup.cancelAll()()
{
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t static TaskPriority.low.getter()
{
  return static TaskPriority.low.getter();
}

uint64_t static TaskPriority.high.getter()
{
  return static TaskPriority.high.getter();
}

uint64_t static TaskPriority.utility.getter()
{
  return static TaskPriority.utility.getter();
}

uint64_t TaskPriority.init(rawValue:)()
{
  return TaskPriority.init(rawValue:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return static AsyncStream.makeStream(of:bufferingPolicy:)();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t AsyncStream.Continuation.yield<A>()()
{
  return AsyncStream.Continuation.yield<A>()();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return AsyncStream.Continuation.yield(_:)();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t static Task<>.checkCancellation()()
{
  return static Task<>.checkCancellation()();
}

Swift::Void __swiftcall ThrowingTaskGroup.cancelAll()()
{
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

uint64_t Double.init(_:)()
{
  return Double.init(_:)();
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

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static Int._forceBridgeFromObjectiveC(_:result:)()
{
  return static Int._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Int._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of static Numeric.* infix(_:_:)()
{
  return dispatch thunk of static Numeric.* infix(_:_:)();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t Collection.trimmingPrefix(while:)()
{
  return Collection.trimmingPrefix(while:)();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.index(_:offsetBy:limitedBy:)()
{
  return dispatch thunk of Collection.index(_:offsetBy:limitedBy:)();
}

uint64_t Collection<>.uniqued()()
{
  return Collection<>.uniqued()();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t Collection.count.getter()
{
  return Collection.count.getter();
}

uint64_t Collection.first.getter()
{
  return Collection.first.getter();
}

uint64_t Collection.index(_:offsetBy:limitedBy:)()
{
  return Collection.index(_:offsetBy:limitedBy:)();
}

uint64_t Collection.index(_:offsetBy:)()
{
  return Collection.index(_:offsetBy:)();
}

uint64_t Collection.isEmpty.getter()
{
  return Collection.isEmpty.getter();
}

uint64_t Collection.distance(from:to:)()
{
  return Collection.distance(from:to:)();
}

uint64_t Collection<>.indices.getter()
{
  return Collection<>.indices.getter();
}

uint64_t Collection<>.subscript.getter()
{
  return Collection<>.subscript.getter();
}

uint64_t dispatch thunk of Collection.subscript.getter()
{
  return dispatch thunk of Collection.subscript.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t RangeReplaceableCollection<>.replace<A, B, C>(_:maxReplacements:with:)()
{
  return RangeReplaceableCollection<>.replace<A, B, C>(_:maxReplacements:with:)();
}

uint64_t RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)()
{
  return RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)()
{
  return RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)();
}

uint64_t Range<>.init(_:in:)()
{
  return Range<>.init(_:in:)();
}

uint64_t type metadata accessor for Range()
{
  return type metadata accessor for Range();
}

uint64_t CKDatabase.modifyRecordZones(saving:deleting:completionHandler:)()
{
  return CKDatabase.modifyRecordZones(saving:deleting:completionHandler:)();
}

CKRecordID __swiftcall CKRecordID.init(recordName:zoneID:)(Swift::String recordName, CKRecordZoneID zoneID)
{
  return (CKRecordID)CKRecordID.init(recordName:zoneID:)(recordName._countAndFlagsBits, recordName._object, zoneID.super.isa);
}

AXDataPoint __swiftcall AXDataPoint.init(x:y:additionalValues:label:)(Swift::Double x, Swift::Double_optional y, Swift::OpaquePointer additionalValues, Swift::String_optional label)
{
  return (AXDataPoint)AXDataPoint.init(x:y:additionalValues:label:)(*(void *)&y.is_nil, additionalValues._rawValue, label.value._countAndFlagsBits, label.value._object, x, *(__n128 *)&y.value);
}

uint64_t CMTimeRange.end.getter()
{
  return CMTimeRange.end.getter();
}

uint64_t NLTokenizer.enumerateTokens(in:using:)()
{
  return NLTokenizer.enumerateTokens(in:using:)();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t CGContextRef.fillPath(using:)()
{
  return CGContextRef.fillPath(using:)();
}

uint64_t NSDictionary.init(dictionaryLiteral:)()
{
  return NSDictionary.init(dictionaryLiteral:)();
}

uint64_t NSExpression.init(format:_:)()
{
  return NSExpression.init(format:_:)();
}

uint64_t CSSearchQuery.Results.Item.item.getter()
{
  return CSSearchQuery.Results.Item.item.getter();
}

uint64_t type metadata accessor for CSSearchQuery.Results.Item()
{
  return type metadata accessor for CSSearchQuery.Results.Item();
}

uint64_t type metadata accessor for CSSearchQuery.Results.Iterator()
{
  return type metadata accessor for CSSearchQuery.Results.Iterator();
}

uint64_t type metadata accessor for CSSearchQuery.Results()
{
  return type metadata accessor for CSSearchQuery.Results();
}

uint64_t CSSearchQuery.results.getter()
{
  return CSSearchQuery.results.getter();
}

uint64_t HKStateOfMind.associations.getter()
{
  return HKStateOfMind.associations.getter();
}

uint64_t HKStateOfMind.labels.getter()
{
  return HKStateOfMind.labels.getter();
}

uint64_t NSUndoManager.registerUndo<A>(withTarget:handler:)()
{
  return NSUndoManager.registerUndo<A>(withTarget:handler:)();
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

CKRecordZoneID __swiftcall CKRecordZoneID.init(zoneName:ownerName:)(Swift::String zoneName, Swift::String ownerName)
{
  return (CKRecordZoneID)CKRecordZoneID.init(zoneName:ownerName:)(zoneName._countAndFlagsBits, zoneName._object, ownerName._countAndFlagsBits, ownerName._object);
}

uint64_t NSItemProvider.loadObject<A>(ofClass:completionHandler:)()
{
  return NSItemProvider.loadObject<A>(ofClass:completionHandler:)();
}

uint64_t NSItemProvider.canLoadObject<A>(ofClass:)()
{
  return NSItemProvider.canLoadObject<A>(ofClass:)();
}

uint64_t NSItemProvider.loadFileRepresentation(for:openInPlace:completionHandler:)()
{
  return NSItemProvider.loadFileRepresentation(for:openInPlace:completionHandler:)();
}

uint64_t static CAGradientLayer.gradientLayerForValence(_:style:)()
{
  return static CAGradientLayer.gradientLayerForValence(_:style:)();
}

UIBarButtonItem __swiftcall UIBarButtonItem.init(systemItem:primaryAction:menu:)(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return (UIBarButtonItem)UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil, menu.value.super.super.isa, *(void *)&menu.is_nil);
}

UIBarButtonItem __swiftcall UIBarButtonItem.init(title:image:primaryAction:menu:)(Swift::String_optional title, UIImage_optional image, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return (UIBarButtonItem)UIBarButtonItem.init(title:image:primaryAction:menu:)(title.value._countAndFlagsBits, title.value._object, image.value.super.isa, *(void *)&image.is_nil, primaryAction.value.super.super.isa, *(void *)&primaryAction.is_nil, menu.value.super.super.isa, *(void *)&menu.is_nil);
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t UITableViewCell.defaultContentConfiguration()()
{
  return UITableViewCell.defaultContentConfiguration()();
}

CAFrameRateRange __swiftcall CAFrameRateRange.init(minimum:maximum:preferred:)(Swift::Float minimum, Swift::Float maximum, Swift::Float_optional *preferred)
{
  CAFrameRateRange.init(minimum:maximum:preferred:)(preferred, minimum, maximum);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CGMutablePathRef.move(to:transform:)()
{
  return CGMutablePathRef.move(to:transform:)();
}

uint64_t CGMutablePathRef.addLine(to:transform:)()
{
  return CGMutablePathRef.addLine(to:transform:)();
}

uint64_t NSSortDescriptor.init<A, B>(keyPath:ascending:)()
{
  return NSSortDescriptor.init<A, B>(keyPath:ascending:)();
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

uint64_t static UIViewController.ViewLoading.subscript.getter()
{
  return static UIViewController.ViewLoading.subscript.getter();
}

uint64_t static UIViewController.ViewLoading.subscript.setter()
{
  return static UIViewController.ViewLoading.subscript.setter();
}

uint64_t UIViewController.ViewLoading.init()()
{
  return UIViewController.ViewLoading.init()();
}

uint64_t type metadata accessor for UIViewController.ViewLoading()
{
  return type metadata accessor for UIViewController.ViewLoading();
}

Swift::Void __swiftcall UIViewController.setContentScrollView(_:)(UIScrollView_optional a1)
{
}

uint64_t UIViewController.registerForTraitChanges(_:action:)()
{
  return UIViewController.registerForTraitChanges(_:action:)();
}

uint64_t UIViewController.registerForTraitChanges<A>(_:handler:)()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t UIViewController.contentUnavailableConfiguration.setter()
{
  return UIViewController.contentUnavailableConfiguration.setter();
}

uint64_t AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)()
{
  return AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
}

uint64_t static NSKeyedUnarchiver.unarchivedArrayOfObjects<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedArrayOfObjects<A>(ofClass:from:)();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t static OS_dispatch_queue.Attributes.concurrent.getter()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
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

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.milliseconds(_:)()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.milliseconds(_:)();
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)();
}

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

uint64_t OS_dispatch_queue.qos.getter()
{
  return OS_dispatch_queue.qos.getter();
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

uint64_t UIListContentView.configuration.setter()
{
  return UIListContentView.configuration.setter();
}

uint64_t UIListContentView.init(configuration:)()
{
  return UIListContentView.init(configuration:)();
}

uint64_t UITraitCollection.modifyingTraits(_:)()
{
  return UITraitCollection.modifyingTraits(_:)();
}

uint64_t NSAttributedString.init(_:)()
{
  return NSAttributedString.init(_:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t NSNotificationCenter.Notifications.makeAsyncIterator()()
{
  return NSNotificationCenter.Notifications.makeAsyncIterator()();
}

uint64_t type metadata accessor for NSNotificationCenter.Notifications.Iterator()
{
  return type metadata accessor for NSNotificationCenter.Notifications.Iterator();
}

uint64_t type metadata accessor for NSNotificationCenter.Notifications()
{
  return type metadata accessor for NSNotificationCenter.Notifications();
}

uint64_t NSNotificationCenter.notifications(named:object:)()
{
  return NSNotificationCenter.notifications(named:object:)();
}

uint64_t NSNotificationCenter.Publisher.init(center:name:object:)()
{
  return NSNotificationCenter.Publisher.init(center:name:object:)();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t UICollectionViewCell.contentConfiguration.getter()
{
  return UICollectionViewCell.contentConfiguration.getter();
}

uint64_t UICollectionViewCell.contentConfiguration.setter()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t UICollectionViewCell.backgroundConfiguration.setter()
{
  return UICollectionViewCell.backgroundConfiguration.setter();
}

uint64_t UICollectionViewCell.configurationUpdateHandler.setter()
{
  return UICollectionViewCell.configurationUpdateHandler.setter();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t UIContentSizeCategory.isAccessibilityCategory.getter()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t static UIContentSizeCategory.> infix(_:_:)()
{
  return static UIContentSizeCategory.> infix(_:_:)();
}

uint64_t static UIContentSizeCategory.>= infix(_:_:)()
{
  return static UIContentSizeCategory.>= infix(_:_:)();
}

uint64_t static NSManagedObjectContext.didMergeChangesObjectIDsNotification.getter()
{
  return static NSManagedObjectContext.didMergeChangesObjectIDsNotification.getter();
}

uint64_t NSManagedObjectContext.performAndWait<A>(_:)()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t NSManagedObjectContext.NotificationKey.rawValue.getter()
{
  return NSManagedObjectContext.NotificationKey.rawValue.getter();
}

uint64_t type metadata accessor for NSManagedObjectContext.NotificationKey()
{
  return type metadata accessor for NSManagedObjectContext.NotificationKey();
}

uint64_t type metadata accessor for NSManagedObjectContext.ScheduledTaskType()
{
  return type metadata accessor for NSManagedObjectContext.ScheduledTaskType();
}

uint64_t NSManagedObjectContext.count<A>(for:)()
{
  return NSManagedObjectContext.count<A>(for:)();
}

uint64_t NSManagedObjectContext.fetch<A>(_:)()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t PHPickerViewController.updatePicker(using:)()
{
  return PHPickerViewController.updatePicker(using:)();
}

uint64_t PHPickerViewController.init(configuration:)()
{
  return PHPickerViewController.init(configuration:)();
}

uint64_t CKRecordKeyValueSetting.subscript.setter()
{
  return CKRecordKeyValueSetting.subscript.setter();
}

uint64_t UICollectionViewListCell.accessories.setter()
{
  return UICollectionViewListCell.accessories.setter();
}

uint64_t UICollectionViewListCell.defaultContentConfiguration()()
{
  return UICollectionViewListCell.defaultContentConfiguration()();
}

uint64_t UIContentUnavailableView.init(configuration:)()
{
  return UIContentUnavailableView.init(configuration:)();
}

uint64_t static NSCollectionLayoutSection.list(using:layoutEnvironment:)()
{
  return static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
}

uint64_t AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)()
{
  return AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)();
}

uint64_t CSSearchableItemAttributeSet.associateAppEntity<A>(_:priority:)()
{
  return CSSearchableItemAttributeSet.associateAppEntity<A>(_:priority:)();
}

uint64_t UITextFormattingViewController.FormattingDescriptor.init(attributes:)()
{
  return UITextFormattingViewController.FormattingDescriptor.init(attributes:)();
}

uint64_t UITextFormattingViewController.FormattingDescriptor._blockquote.setter()
{
  return UITextFormattingViewController.FormattingDescriptor._blockquote.setter();
}

uint64_t UITextFormattingViewController.FormattingDescriptor._bridgeToObjectiveC()()
{
  return UITextFormattingViewController.FormattingDescriptor._bridgeToObjectiveC()();
}

uint64_t UITextFormattingViewController.FormattingDescriptor.strikethroughPresent.setter()
{
  return UITextFormattingViewController.FormattingDescriptor.strikethroughPresent.setter();
}

uint64_t UITextFormattingViewController.FormattingDescriptor.init(string:range:)()
{
  return UITextFormattingViewController.FormattingDescriptor.init(string:range:)();
}

uint64_t type metadata accessor for UITextFormattingViewController.FormattingDescriptor()
{
  return type metadata accessor for UITextFormattingViewController.FormattingDescriptor();
}

uint64_t static UITextFormattingViewController.ChangeValue._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UITextFormattingViewController.ChangeValue._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UITextFormattingViewController.ChangeValue()
{
  return type metadata accessor for UITextFormattingViewController.ChangeValue();
}

uint64_t static NSCoreDataCoreSpotlightDelegate.indexDidUpdateNotification.getter()
{
  return static NSCoreDataCoreSpotlightDelegate.indexDidUpdateNotification.getter();
}

uint64_t static UICollectionViewCompositionalLayout.list(using:)()
{
  return static UICollectionViewCompositionalLayout.list(using:)();
}

uint64_t static UISheetPresentationControllerDetent.custom(identifier:resolver:)()
{
  return static UISheetPresentationControllerDetent.custom(identifier:resolver:)();
}

uint64_t static UITextFormattingViewControllerComponent.component(_:_:)()
{
  return static UITextFormattingViewControllerComponent.component(_:_:)();
}

uint64_t static UITextFormattingViewControllerComponentGroup.group(_:)()
{
  return static UITextFormattingViewControllerComponentGroup.group(_:)();
}

uint64_t NSSet.init(arrayLiteral:)()
{
  return NSSet.init(arrayLiteral:)();
}

uint64_t NSSet.makeIterator()()
{
  return NSSet.makeIterator()();
}

uint64_t CMTime.isIndefinite.getter()
{
  return CMTime.isIndefinite.getter();
}

uint64_t static CMTime.== infix(_:_:)()
{
  return static CMTime.== infix(_:_:)();
}

uint64_t static CMTime.>= infix(_:_:)()
{
  return static CMTime.>= infix(_:_:)();
}

__C::CMTime __swiftcall CMTime.init(value:timescale:)(Swift::Int64 value, Swift::Int32 timescale)
{
  Swift::Int64 v2 = CMTime.init(value:timescale:)(value, *(void *)&timescale);
  result.epoch = v4;
  result.timescale = v3;
  result.flags = *(__C::CMTimeFlags *)((char *)&v3 + 4);
  result.value = v2;
  return result;
}

__C::CMTime __swiftcall CMTime.init(seconds:preferredTimescale:)(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  Swift::Int64 v2 = CMTime.init(seconds:preferredTimescale:)(*(void *)&preferredTimescale, seconds);
  result.epoch = v4;
  result.timescale = v3;
  result.flags = *(__C::CMTimeFlags *)((char *)&v3 + 4);
  result.value = v2;
  return result;
}

uint64_t CMTime.seconds.getter()
{
  return CMTime.seconds.getter();
}

UIMenu __swiftcall UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t UIView.Invalidating.init(wrappedValue:_:)()
{
  return UIView.Invalidating.init(wrappedValue:_:)();
}

uint64_t static UIView.Invalidating.subscript.modify()
{
  return static UIView.Invalidating.subscript.modify();
}

uint64_t static UIView.Invalidating.subscript.getter()
{
  return static UIView.Invalidating.subscript.getter();
}

uint64_t static UIView.Invalidating.subscript.setter()
{
  return static UIView.Invalidating.subscript.setter();
}

uint64_t type metadata accessor for UIView.Invalidating()
{
  return type metadata accessor for UIView.Invalidating();
}

uint64_t UIView.Invalidations.Configuration.init()()
{
  return UIView.Invalidations.Configuration.init()();
}

uint64_t type metadata accessor for UIView.Invalidations.Configuration()
{
  return type metadata accessor for UIView.Invalidations.Configuration();
}

uint64_t UIView.Invalidations.IntrinsicContentSize.init()()
{
  return UIView.Invalidations.IntrinsicContentSize.init()();
}

uint64_t type metadata accessor for UIView.Invalidations.IntrinsicContentSize()
{
  return type metadata accessor for UIView.Invalidations.IntrinsicContentSize();
}

uint64_t UIView.Invalidations.Layout.init()()
{
  return UIView.Invalidations.Layout.init()();
}

uint64_t type metadata accessor for UIView.Invalidations.Layout()
{
  return type metadata accessor for UIView.Invalidations.Layout();
}

uint64_t UIView.registerForTraitChanges(_:action:)()
{
  return UIView.registerForTraitChanges(_:action:)();
}

uint64_t UIView.registerForTraitChanges(_:target:action:)()
{
  return UIView.registerForTraitChanges(_:target:action:)();
}

uint64_t UIView.registerForTraitChanges<A>(_:handler:)()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t static UIView.animate(_:changes:completion:)()
{
  return static UIView.animate(_:changes:completion:)();
}

uint64_t UIView.contentCompressionResistancePriority(_:forAxis:)()
{
  return UIView.contentCompressionResistancePriority(_:forAxis:)();
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

uint64_t UIColor.init(resource:)()
{
  return UIColor.init(resource:)();
}

uint64_t UIColor.init(_:)()
{
  return UIColor.init(_:)();
}

uint64_t UIImage.init(resource:)()
{
  return UIImage.init(resource:)();
}

CKRecord __swiftcall CKRecord.init(recordType:recordID:)(Swift::String recordType, CKRecordID recordID)
{
  return (CKRecord)CKRecord.init(recordType:recordID:)(recordType._countAndFlagsBits, recordType._object, recordID.super.isa);
}

uint64_t CKRecord.recordType.getter()
{
  return CKRecord.recordType.getter();
}

uint64_t CKRecord.allKeys()()
{
  return CKRecord.allKeys()();
}

uint64_t CKRecord.subscript.getter()
{
  return CKRecord.subscript.getter();
}

uint64_t CKRecord.subscript.setter()
{
  return CKRecord.subscript.setter();
}

uint64_t NLTagger.tag(at:unit:scheme:)()
{
  return NLTagger.tag(at:unit:scheme:)();
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

uint64_t NSString.init(string:)()
{
  return NSString.init(string:)();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t UIButton.Configuration.preferredSymbolConfigurationForImage.setter()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t UIButton.Configuration.background.modify()
{
  return UIButton.Configuration.background.modify();
}

uint64_t UIButton.Configuration.background.setter()
{
  return UIButton.Configuration.background.setter();
}

uint64_t static UIButton.Configuration.borderless()()
{
  return static UIButton.Configuration.borderless()();
}

uint64_t UIButton.Configuration.buttonSize.setter()
{
  return UIButton.Configuration.buttonSize.setter();
}

uint64_t type metadata accessor for UIButton.Configuration.CornerStyle()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t UIButton.Configuration.cornerStyle.setter()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t UIButton.Configuration.imagePadding.setter()
{
  return UIButton.Configuration.imagePadding.setter();
}

uint64_t UIButton.Configuration.contentInsets.modify()
{
  return UIButton.Configuration.contentInsets.modify();
}

uint64_t UIButton.Configuration.contentInsets.getter()
{
  return UIButton.Configuration.contentInsets.getter();
}

uint64_t UIButton.Configuration.contentInsets.setter()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t type metadata accessor for UIButton.Configuration.TitleAlignment()
{
  return type metadata accessor for UIButton.Configuration.TitleAlignment();
}

uint64_t UIButton.Configuration.imagePlacement.setter()
{
  return UIButton.Configuration.imagePlacement.setter();
}

uint64_t UIButton.Configuration.titleAlignment.setter()
{
  return UIButton.Configuration.titleAlignment.setter();
}

uint64_t UIButton.Configuration.attributedTitle.setter()
{
  return UIButton.Configuration.attributedTitle.setter();
}

uint64_t UIButton.Configuration.baseBackgroundColor.setter()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t static UIButton.Configuration.== infix(_:_:)()
{
  return static UIButton.Configuration.== infix(_:_:)();
}

uint64_t UIButton.Configuration.titleTextAttributesTransformer.setter()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t type metadata accessor for UIButton.Configuration.Size()
{
  return type metadata accessor for UIButton.Configuration.Size();
}

uint64_t static UIButton.Configuration.gray()()
{
  return static UIButton.Configuration.gray()();
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

uint64_t static UIButton.Configuration.filled()()
{
  return static UIButton.Configuration.filled()();
}

uint64_t static UIButton.Configuration.tinted()()
{
  return static UIButton.Configuration.tinted()();
}

uint64_t static UIButton.Configuration.bordered()()
{
  return static UIButton.Configuration.bordered()();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t UIButton.configuration.getter()
{
  return UIButton.configuration.getter();
}

uint64_t UIButton.configuration.setter()
{
  return UIButton.configuration.setter();
}

uint64_t UIButton.titleLabelFont(_:)()
{
  return UIButton.titleLabelFont(_:)();
}

uint64_t _NSRange.description.getter()
{
  return _NSRange.description.getter();
}

uint64_t _NSRange.debugDescription.getter()
{
  return _NSRange.debugDescription.getter();
}

uint64_t _NSRange.init<A, B>(_:in:)()
{
  return _NSRange.init<A, B>(_:in:)();
}

uint64_t CGPathRef.copy(dashingWithPhase:lengths:transform:)()
{
  return CGPathRef.copy(dashingWithPhase:lengths:transform:)();
}

uint64_t CGPathRef.copy(strokingWithWidth:lineCap:lineJoin:miterLimit:transform:)()
{
  return CGPathRef.copy(strokingWithWidth:lineCap:lineJoin:miterLimit:transform:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)()
{
  return NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerTimeType.Stride()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Optional<A>.hashValue.getter()
{
  return Optional<A>.hashValue.getter();
}

Swift::String __swiftcall Substring.uppercased()()
{
  uint64_t v0 = Substring.uppercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t Substring.index(before:)()
{
  return Substring.index(before:)();
}

uint64_t Substring.distance(from:to:)()
{
  return Substring.distance(from:to:)();
}

uint64_t Substring.subscript.getter()
{
  return Substring.subscript.getter();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components(separatedBy:)()
{
  return StringProtocol.components(separatedBy:)();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.rangeOfCharacter(from:options:range:)()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
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

uint64_t StringProtocol.removingPercentEncoding.getter()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t StringProtocol.write(to:atomically:encoding:)()
{
  return StringProtocol.write(to:atomically:encoding:)();
}

uint64_t StringProtocol.padding<A>(toLength:withPad:startingAt:)()
{
  return StringProtocol.padding<A>(toLength:withPad:startingAt:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t BinaryInteger.formatted<A>(_:)()
{
  return BinaryInteger.formatted<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.insert(_:)()
{
  return dispatch thunk of SetAlgebra.insert(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init()()
{
  return dispatch thunk of SetAlgebra.init()();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
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

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
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

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
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

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
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

uint64_t static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)()
{
  return static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return _decodeScalar(_:startingAt:)();
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

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
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

uint64_t AsyncMapSequence.init(_:transform:)()
{
  return AsyncMapSequence.init(_:transform:)();
}

uint64_t type metadata accessor for IndexingIterator()
{
  return type metadata accessor for IndexingIterator();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
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

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return _CocoaArrayWrapper.subscript.getter();
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

uint64_t AsyncPrefixSequence.base.getter()
{
  return AsyncPrefixSequence.base.getter();
}

uint64_t AsyncPrefixSequence.count.getter()
{
  return AsyncPrefixSequence.count.getter();
}

uint64_t AsyncPrefixSequence.Iterator.baseIterator.modify()
{
  return AsyncPrefixSequence.Iterator.baseIterator.modify();
}

uint64_t AsyncPrefixSequence.Iterator.remaining.modify()
{
  return AsyncPrefixSequence.Iterator.remaining.modify();
}

uint64_t AsyncPrefixSequence.Iterator.remaining.getter()
{
  return AsyncPrefixSequence.Iterator.remaining.getter();
}

uint64_t AsyncPrefixSequence.Iterator.init(_:count:)()
{
  return AsyncPrefixSequence.Iterator.init(_:count:)();
}

uint64_t AsyncPrefixSequence.init(_:count:)()
{
  return AsyncPrefixSequence.init(_:count:)();
}

uint64_t dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of _HasContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter()
{
  return dispatch thunk of _HasContiguousBytes._providesContiguousBytesNoCopy.getter();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

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

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
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

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return type metadata accessor for KeyedEncodingContainer();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _stringCompareInternal(_:_:_:_:expecting:)()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return type metadata accessor for FloatingPointRoundingRule();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
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

uint64_t == infix<A>(_:_:)()
{
  return == infix<A>(_:_:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t _copyCollectionToContiguousArray<A>(_:)()
{
  return _copyCollectionToContiguousArray<A>(_:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return Hasher.finalize()();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t Hasher.init()()
{
  return Hasher.init()();
}

uint64_t type metadata accessor for Result()
{
  return type metadata accessor for Result();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t static Duration.TimeFormatStyle.Pattern.minuteSecond(padMinuteToLength:fractionalSecondsLength:roundFractionalSeconds:)()
{
  return static Duration.TimeFormatStyle.Pattern.minuteSecond(padMinuteToLength:fractionalSecondsLength:roundFractionalSeconds:)();
}

uint64_t static Duration.TimeFormatStyle.Pattern.minuteSecond.getter()
{
  return static Duration.TimeFormatStyle.Pattern.minuteSecond.getter();
}

uint64_t static Duration.TimeFormatStyle.Pattern.hourMinuteSecond(padHourToLength:fractionalSecondsLength:roundFractionalSeconds:)()
{
  return static Duration.TimeFormatStyle.Pattern.hourMinuteSecond(padHourToLength:fractionalSecondsLength:roundFractionalSeconds:)();
}

uint64_t static Duration.TimeFormatStyle.Pattern.hourMinuteSecond.getter()
{
  return static Duration.TimeFormatStyle.Pattern.hourMinuteSecond.getter();
}

uint64_t type metadata accessor for Duration.TimeFormatStyle.Pattern()
{
  return type metadata accessor for Duration.TimeFormatStyle.Pattern();
}

uint64_t type metadata accessor for Duration.TimeFormatStyle()
{
  return type metadata accessor for Duration.TimeFormatStyle();
}

uint64_t static Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy.hide.getter()
{
  return static Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy.hide.getter();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy()
{
  return type metadata accessor for Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy();
}

uint64_t static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.hide.getter()
{
  return static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.hide.getter();
}

uint64_t static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.show(length:rounded:increment:)()
{
  return static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.show(length:rounded:increment:)();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.FractionalPartDisplayStrategy()
{
  return type metadata accessor for Duration.UnitsFormatStyle.FractionalPartDisplayStrategy();
}

uint64_t static Duration.UnitsFormatStyle.Unit.hours.getter()
{
  return static Duration.UnitsFormatStyle.Unit.hours.getter();
}

uint64_t static Duration.UnitsFormatStyle.Unit.minutes.getter()
{
  return static Duration.UnitsFormatStyle.Unit.minutes.getter();
}

uint64_t static Duration.UnitsFormatStyle.Unit.seconds.getter()
{
  return static Duration.UnitsFormatStyle.Unit.seconds.getter();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.Unit()
{
  return type metadata accessor for Duration.UnitsFormatStyle.Unit();
}

uint64_t static Duration.UnitsFormatStyle.UnitWidth.abbreviated.getter()
{
  return static Duration.UnitsFormatStyle.UnitWidth.abbreviated.getter();
}

uint64_t static Duration.UnitsFormatStyle.UnitWidth.wide.getter()
{
  return static Duration.UnitsFormatStyle.UnitWidth.wide.getter();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle.UnitWidth()
{
  return type metadata accessor for Duration.UnitsFormatStyle.UnitWidth();
}

uint64_t type metadata accessor for Duration.UnitsFormatStyle()
{
  return type metadata accessor for Duration.UnitsFormatStyle();
}

uint64_t Duration.formatted<A>(_:)()
{
  return Duration.formatted<A>(_:)();
}

uint64_t static Duration.< infix(_:_:)()
{
  return static Duration.< infix(_:_:)();
}

uint64_t static Duration.== infix(_:_:)()
{
  return static Duration.== infix(_:_:)();
}

uint64_t static Duration.zero.getter()
{
  return static Duration.zero.getter();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t CACornerRadiiEqualToRadii()
{
  return _CACornerRadiiEqualToRadii();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DEqualToTransform(a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return _CGColorCreateGenericGray(gray, alpha);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return _CGImageSourceGetType(isrc);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  CGPoint v4 = _CGPointApplyAffineTransform(point, t);
  double y = v4.y;
  double x = v4.x;
  result.double y = y;
  result.double x = x;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGRect CGRectFromString(NSString *string)
{
  return _CGRectFromString(string);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  return _CGRectStandardize(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

uint64_t HKStateOfMindDomainFromAssociation()
{
  return _HKStateOfMindDomainFromAssociation();
}

uint64_t HKStateOfMindReflectiveIntervalFromKind()
{
  return _HKStateOfMindReflectiveIntervalFromKind();
}

uint64_t HKUILocalizedStringForStateOfMindDomain()
{
  return _HKUILocalizedStringForStateOfMindDomain();
}

uint64_t HKUILocalizedStringForStateOfMindLabel()
{
  return _HKUILocalizedStringForStateOfMindLabel();
}

uint64_t HKUILocalizedStringForValenceClassificationAndReflectiveInterval()
{
  return _HKUILocalizedStringForValenceClassificationAndReflectiveInterval();
}

uint64_t HKUIStandardMapGreenColor()
{
  return _HKUIStandardMapGreenColor();
}

uint64_t HKUIStandardMapRedColor()
{
  return _HKUIStandardMapRedColor();
}

CLLocationCoordinate2D MKCoordinateForMapPoint(MKMapPoint mapPoint)
{
  CLLocationCoordinate2D v3 = _MKCoordinateForMapPoint(mapPoint);
  double longitude = v3.longitude;
  double latitude = v3.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  return _MKCoordinateRegionForMapRect(rect);
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MKMapPoint v3 = _MKMapPointForCoordinate(coordinate);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

BOOL MKMapRectIntersectsRect(MKMapRect rect1, MKMapRect rect2)
{
  return _MKMapRectIntersectsRect(rect1, rect2);
}

MKMapRect MKMapRectUnion(MKMapRect rect1, MKMapRect rect2)
{
  return _MKMapRectUnion(rect1, rect2);
}

CGFloat MKRoadWidthAtZoomScale(MKZoomScale zoomScale)
{
  return _MKRoadWidthAtZoomScale(zoomScale);
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return _MobileGestalt_get_wapiCapability();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSUnionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return _PFCurrentPlatformLivePhotoBundleType();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return _SBSIsSystemApertureAvailable();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  return _UIAccessibilityConvertFrameToScreenCoordinates(rect, view);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return _UIAccessibilityIsSwitchControlRunning();
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return _UIAccessibilityIsVideoAutoplayEnabled();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImageHEICRepresentation(UIImage *image)
{
  return _UIImageHEICRepresentation(image);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

void UIRectFill(CGRect rect)
{
}

uint64_t UISColorLuminance()
{
  return _UISColorLuminance();
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

{
}

{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uint64_t lroundf(float a1)
{
  return _lroundf(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deallocUninitializedObject()
{
  return _swift_deallocUninitializedObject();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
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

uint64_t swift_getFunctionTypeMetadata1()
{
  return _swift_getFunctionTypeMetadata1();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_isUniquelyReferenced_native()
{
  return _swift_isUniquelyReferenced_native();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_task_getMainExecutor()
{
  return _swift_task_getMainExecutor();
}

uint64_t swift_task_isCancelled()
{
  return _swift_task_isCancelled();
}

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
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

uint64_t swift_unownedRetain()
{
  return _swift_unownedRetain();
}

uint64_t swift_unownedRetainStrong()
{
  return _swift_unownedRetainStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
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

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

void vDSP_maxmgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

kern_return_t vm_remap(vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return _vm_remap(target_task, target_address, size, mask, flags, src_task, src_address, copy, cur_protection, max_protection, inheritance);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__activeSliceFrame(void *a1, const char *a2, ...)
{
  return _[a1 _activeSliceFrame];
}

id objc_msgSend__bufferRange(void *a1, const char *a2, ...)
{
  return _[a1 _bufferRange];
}

id objc_msgSend__excessFrames(void *a1, const char *a2, ...)
{
  return _[a1 _excessFrames];
}

id objc_msgSend__genericAmplitudes(void *a1, const char *a2, ...)
{
  return _[a1 _genericAmplitudes];
}

id objc_msgSend__handleDiscoveredAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDiscoveredAccount:completion:");
}

id objc_msgSend__heightForAmplitude_(void *a1, const char *a2, ...)
{
  return [a1 _heightForAmplitude:];
}

id objc_msgSend__inactiveSliceFrame(void *a1, const char *a2, ...)
{
  return _[a1 _inactiveSliceFrame];
}

id objc_msgSend__initWithSuiteName_container_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithSuiteName:container:");
}

id objc_msgSend__leadingRoundedFrame(void *a1, const char *a2, ...)
{
  return _[a1 _leadingRoundedFrame];
}

id objc_msgSend__maxHeightForSliceAtIndex_sliceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maxHeightForSliceAtIndex:sliceType:");
}

id objc_msgSend__resetActiveSlicesWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetActiveSlicesWithIndex:");
}

id objc_msgSend__roundedSliceWidthPerSide(void *a1, const char *a2, ...)
{
  return _[a1 _roundedSliceWidthPerSide];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return _[a1 _setupViews];
}

id objc_msgSend__sliceScale(void *a1, const char *a2, ...)
{
  return _[a1 _sliceScale];
}

id objc_msgSend__tearDown(void *a1, const char *a2, ...)
{
  return _[a1 _tearDown];
}

id objc_msgSend__trailingRoundedFrame(void *a1, const char *a2, ...)
{
  return _[a1 _trailingRoundedFrame];
}

id objc_msgSend__updateAmplitudes(void *a1, const char *a2, ...)
{
  return _[a1 _updateAmplitudes];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryAppleAccount];
}

id objc_msgSend_activeSliceColor(void *a1, const char *a2, ...)
{
  return _[a1 activeSliceColor];
}

id objc_msgSend_activeSliceQueue(void *a1, const char *a2, ...)
{
  return _[a1 activeSliceQueue];
}

id objc_msgSend_activityWaveformRunningAverageDuration(void *a1, const char *a2, ...)
{
  return _[a1 activityWaveformRunningAverageDuration];
}

id objc_msgSend_activityWaveformTimeWindowDuration(void *a1, const char *a2, ...)
{
  return _[a1 activityWaveformTimeWindowDuration];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_amplitude(void *a1, const char *a2, ...)
{
  return _[a1 amplitude];
}

id objc_msgSend_amplitudeForSliceWithTimeRange_fullTimeRangeSampled_(void *a1, const char *a2, ...)
{
  return [a1 amplitudeForSliceWithTimeRange:fullTimeRangeSampled:];
}

id objc_msgSend_amplitudeNeedsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 amplitudeNeedsUpdate];
}

id objc_msgSend_appendSliceWithType_(void *a1, const char *a2, ...)
{
  return [a1 appendSliceWithType:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_calculateAmplitude_sampleCount_channelCount_(void *a1, const char *a2, ...)
{
  return [a1 calculateAmplitude:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_consumeRingBufferIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 consumeRingBufferIfNecessary];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_currentTimeWindow(void *a1, const char *a2, ...)
{
  return _[a1 currentTimeWindow];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_discoverPropertiesForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverPropertiesForAccount:options:completion:");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_enumerateAllSlices_(void *a1, const char *a2, ...)
{
  return [a1 enumerateAllSlices:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatChannelData(void *a1, const char *a2, ...)
{
  return _[a1 floatChannelData];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameForSlice_sliceType_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 frameForSlice:sliceType:atIndex:];
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return _[a1 frameLength];
}

id objc_msgSend_heightForSlice_sliceType_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 heightForSlice:sliceType:atIndex:];
}

id objc_msgSend_hostTime(void *a1, const char *a2, ...)
{
  return _[a1 hostTime];
}

id objc_msgSend_indexForSliceStartTime_(void *a1, const char *a2, ...)
{
  return [a1 indexForSliceStartTime:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:];
}

id objc_msgSend_initWithDatabase_dataSource_metadata_(void *a1, const char *a2, ...)
{
  return [a1 initWithDatabase:dataSource:metadata:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return [a1 initWithLength:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return [a1 isEnabledForDataclass:];
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return [a1 isProvisionedForDataclass:];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_maximumSliceHeight(void *a1, const char *a2, ...)
{
  return _[a1 maximumSliceHeight];
}

id objc_msgSend_minimumSliceHeight(void *a1, const char *a2, ...)
{
  return _[a1 minimumSliceHeight];
}

id objc_msgSend_monospacedDigitSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 monospacedDigitSystemFontOfSize:];
}

id objc_msgSend_numberOfInactiveSlices(void *a1, const char *a2, ...)
{
  return _[a1 numberOfInactiveSlices];
}

id objc_msgSend_numberOfSlices(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSlices];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_platterCompactViewSliceCount(void *a1, const char *a2, ...)
{
  return _[a1 platterCompactViewSliceCount];
}

id objc_msgSend_platterMinimalViewSliceCount(void *a1, const char *a2, ...)
{
  return _[a1 platterMinimalViewSliceCount];
}

id objc_msgSend_platterWaveformActiveSliceColor(void *a1, const char *a2, ...)
{
  return _[a1 platterWaveformActiveSliceColor];
}

id objc_msgSend_platterWaveformInactiveSliceColor(void *a1, const char *a2, ...)
{
  return _[a1 platterWaveformInactiveSliceColor];
}

id objc_msgSend_platterWaveformMinimumRoundedSliceWidthPerSide(void *a1, const char *a2, ...)
{
  return _[a1 platterWaveformMinimumRoundedSliceWidthPerSide];
}

id objc_msgSend_platterWaveformPercentageOfRoundedSlices(void *a1, const char *a2, ...)
{
  return _[a1 platterWaveformPercentageOfRoundedSlices];
}

id objc_msgSend_platterWaveformSlicePadding(void *a1, const char *a2, ...)
{
  return _[a1 platterWaveformSlicePadding];
}

id objc_msgSend_platterWaveformSliceScaleFactorForExpandedMode(void *a1, const char *a2, ...)
{
  return _[a1 platterWaveformSliceScaleFactorForExpandedMode];
}

id objc_msgSend_platterWaveformSliceWidth(void *a1, const char *a2, ...)
{
  return _[a1 platterWaveformSliceWidth];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeSliceWithType_(void *a1, const char *a2, ...)
{
  return [a1 removeSliceWithType:];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return _[a1 sampleRate];
}

id objc_msgSend_secondsForHostTime_(void *a1, const char *a2, ...)
{
  return [a1 secondsForHostTime:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActiveSliceColor_(void *a1, const char *a2, ...)
{
  return [a1 setActiveSliceColor:];
}

id objc_msgSend_setActiveSliceQueue_(void *a1, const char *a2, ...)
{
  return [a1 setActiveSliceQueue:];
}

id objc_msgSend_setAllowsEdgeAntialiasing_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsEdgeAntialiasing:];
}

id objc_msgSend_setAllowsHitTesting_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsHitTesting:];
}

id objc_msgSend_setAmplitude_(void *a1, const char *a2, ...)
{
  return [a1 setAmplitude:];
}

id objc_msgSend_setAmplitudeNeedsUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setAmplitudeNeedsUpdate:];
}

id objc_msgSend_setAssetDownloadStagingManager_(void *a1, const char *a2, ...)
{
  return [a1 setAssetDownloadStagingManager:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCurrentTimeWindow_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTimeWindow:];
}

id objc_msgSend_setDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 setDataProvider:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setInactiveSliceStack_(void *a1, const char *a2, ...)
{
  return [a1 setInactiveSliceStack:];
}

id objc_msgSend_setNeedsToDeleteRecords_needsToDelete_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsToDeleteRecords:needsToDelete:];
}

id objc_msgSend_setNeedsToSaveRecords_needsToSave_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsToSaveRecords:needsToSave:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setSliceRecyclerStack_(void *a1, const char *a2, ...)
{
  return [a1 setSliceRecyclerStack:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return _[a1 setupView];
}

id objc_msgSend_sharedStyleProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedStyleProvider];
}

id objc_msgSend_sliceDuration(void *a1, const char *a2, ...)
{
  return _[a1 sliceDuration];
}

id objc_msgSend_slicePadding(void *a1, const char *a2, ...)
{
  return _[a1 slicePadding];
}

id objc_msgSend_sliceTimeRangeForIndex_(void *a1, const char *a2, ...)
{
  return [a1 sliceTimeRangeForIndex:];
}

id objc_msgSend_sliceViewContainer(void *a1, const char *a2, ...)
{
  return _[a1 sliceViewContainer];
}

id objc_msgSend_sliceWidth(void *a1, const char *a2, ...)
{
  return _[a1 sliceWidth];
}

id objc_msgSend_sliceWithType_(void *a1, const char *a2, ...)
{
  return [a1 sliceWithType:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_timeWindow(void *a1, const char *a2, ...)
{
  return _[a1 timeWindow];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_updateActiveSlicesForTimeRange_(void *a1, const char *a2, ...)
{
  return [a1 updateActiveSlicesForTimeRange:];
}

id objc_msgSend_updateInactiveSlicesForTimeRange_inactiveSliceCount_(void *a1, const char *a2, ...)
{
  return [a1 updateInactiveSlicesForTimeRange:inactiveSliceCount:];
}

id objc_msgSend_updateSlicesAndFrames(void *a1, const char *a2, ...)
{
  return _[a1 updateSlicesAndFrames];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_xPositionForSliceAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 xPositionForSliceAtIndex:];
}