BOOL sub_100002F64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100002F78()
{
  Swift::UInt64 v1 = *v0;
  sub_1000099D8();
  sub_1000099E8(v1);
  return sub_1000099F8();
}

void sub_100002FC0()
{
  sub_1000099E8(*v0);
}

Swift::Int sub_100002FEC()
{
  Swift::UInt64 v1 = *v0;
  sub_1000099D8();
  sub_1000099E8(v1);
  return sub_1000099F8();
}

unint64_t sub_100003030@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100007DDC(*a1);
  *a2 = result;
  return result;
}

void sub_10000305C(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_100003068(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  id v11 = 0;
  v9[0] = a1;
  v9[1] = a2;
  int v10 = a3;
  id v5 = [objc_allocWithZone(v4) initWithComponentDescription:v9 options:a4 error:&v11];
  if (v5)
  {
    id v6 = v11;
  }
  else
  {
    id v7 = v11;
    sub_1000095C8();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_100003158(unint64_t a1, unint64_t a2, int a3, unsigned int a4)
{
  unsigned int v157 = a4;
  int v156 = a3;
  unint64_t v155 = a2;
  unint64_t v154 = a1;
  sub_100008A34(&qword_100010C90);
  __chkstk_darwin();
  v159 = (char *)&v147 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008A34(&qword_100010C98);
  __chkstk_darwin();
  v158 = (char *)&v147 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = &v4[qword_100010B00];
  v8 = (char *)self;
  v166 = v8;
  LOBYTE(v173) = 0;
  v9 = v4;
  v165 = v9;
  sub_1000097F8();
  NSString v10 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v161 = (objc_class *)type metadata accessor for KonaSynthesizerAudioUnit();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v164 = ObjCClassFromMetadata;
  v167 = (char *)self;
  v12 = (objc_class *)[v167 bundleForClass:ObjCClassFromMetadata];
  v137._countAndFlagsBits = 0xE000000000000000;
  v178._countAndFlagsBits = 0x4C554D5F45544152;
  v178._object = (void *)0xEF5245494C504954;
  v188.value._countAndFlagsBits = 0xD000000000000010;
  v188.value._object = (void *)0x800000010000AC00;
  v168 = (char *)0x800000010000AC00;
  v13.super.Class isa = v12;
  v198._countAndFlagsBits = 0;
  v198._object = (void *)0xE000000000000000;
  sub_1000095A8(v178, v188, v13, v198, v137);

  NSString v14 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v15) = 1112014848;
  LODWORD(v16) = 1128792064;
  id v17 = [v8 createParameterWithIdentifier:v10 name:v14 address:0 min:3 max:0 unit:0 unitName:v15 flags:v16 valueStrings:0 dependentParameters:0];

  id v176 = 0;
  char v177 = 1;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  uint64_t v18 = sub_100008A34(&qword_100010BD0);
  unint64_t v19 = sub_100007AA0();
  v153 = v7;
  unint64_t v163 = v19;
  sub_100009608();
  v20 = &v9[qword_100010B08];
  LOBYTE(v173) = 1;
  sub_1000097F8();
  NSString v21 = sub_1000097D8();
  swift_bridgeObjectRelease();
  id v22 = v167;
  uint64_t v23 = v164;
  v24 = (objc_class *)[v167 bundleForClass:v164];
  v138._countAndFlagsBits = 0xE000000000000000;
  v179._countAndFlagsBits = 0x5A49535F44414548;
  v179._object = (void *)0xE900000000000045;
  v189.value._countAndFlagsBits = 0xD000000000000010;
  v189.value._object = (void *)0x800000010000AC00;
  v25.super.Class isa = v24;
  v199._countAndFlagsBits = 0;
  v199._object = (void *)0xE000000000000000;
  sub_1000095A8(v179, v189, v25, v199, v138);

  NSString v26 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v27) = 1120403456;
  id v28 = [v166 createParameterWithIdentifier:v21 name:v26 address:1 min:3 max:0 unit:0 unitName:0.0 flags:v27 valueStrings:0 dependentParameters:0];

  id v176 = 0;
  char v177 = 1;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  v152 = v20;
  uint64_t v162 = v18;
  sub_100009608();
  v29 = &v165[qword_100010B10];
  LOBYTE(v173) = 2;
  sub_1000097F8();
  NSString v30 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v31 = (objc_class *)[v22 bundleForClass:v23];
  v139._countAndFlagsBits = 0xE000000000000000;
  v180._countAndFlagsBits = 0x41425F4843544950;
  v180._object = (void *)0xEA00000000004553;
  v190.value._countAndFlagsBits = 0xD000000000000010;
  v190.value._object = v168;
  v32.super.Class isa = v31;
  v200._countAndFlagsBits = 0;
  v200._object = (void *)0xE000000000000000;
  sub_1000095A8(v180, v190, v32, v200, v139);

  NSString v33 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v34) = 1109393408;
  LODWORD(v35) = 1137901568;
  id v36 = v166;
  id v37 = [v166 createParameterWithIdentifier:v30 name:v33 address:2 min:8 max:0 unit:0 unitName:v34 flags:v35 valueStrings:0 dependentParameters:0];

  id v176 = 0;
  char v177 = 1;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  v151 = v29;
  sub_100009608();
  v38 = v165;
  v39 = &v165[qword_100010B18];
  LOBYTE(v173) = 3;
  sub_1000097F8();
  NSString v40 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v41 = v167;
  v42 = (objc_class *)[v167 bundleForClass:v164];
  v140._countAndFlagsBits = 0xE000000000000000;
  v181._countAndFlagsBits = 0x41525F4843544950;
  v181._object = (void *)0xEB0000000045474ELL;
  v191.value._countAndFlagsBits = 0xD000000000000010;
  v191.value._object = v168;
  v43.super.Class isa = v42;
  v201._countAndFlagsBits = 0;
  v201._object = (void *)0xE000000000000000;
  sub_1000095A8(v181, v191, v43, v201, v140);

  NSString v44 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v45) = 1120403456;
  id v46 = [v36 createParameterWithIdentifier:v40 name:v44 address:3 min:3 max:0 unit:0 unitName:0.0 flags:v45 valueStrings:0 dependentParameters:0];

  id v176 = 0;
  char v177 = 1;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  v150 = v39;
  sub_100009608();
  v47 = &v38[qword_100010B20];
  v48 = v38;
  LOBYTE(v173) = 4;
  sub_1000097F8();
  NSString v49 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v50 = v41;
  uint64_t v51 = v164;
  v52 = (objc_class *)[v50 bundleForClass:v164];
  v141._countAndFlagsBits = 0xE000000000000000;
  v182._countAndFlagsBits = 0x4E49485441455242;
  v182._object = (void *)0xEB00000000535345;
  v192.value._countAndFlagsBits = 0xD000000000000010;
  v192.value._object = v168;
  v53.super.Class isa = v52;
  v202._countAndFlagsBits = 0;
  v202._object = (void *)0xE000000000000000;
  sub_1000095A8(v182, v192, v53, v202, v141);

  NSString v54 = sub_1000097D8();
  swift_bridgeObjectRelease();
  id v55 = v166;
  LODWORD(v56) = 1120403456;
  id v57 = [v166 createParameterWithIdentifier:v49 name:v54 address:4 min:3 max:0 unit:0 unitName:0.0 flags:v56 valueStrings:0 dependentParameters:0];

  id v176 = 0;
  char v177 = 1;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  v149 = v47;
  sub_100009608();
  v58 = &v48[qword_100010B28];
  LOBYTE(v173) = 5;
  sub_1000097F8();
  NSString v59 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v60 = (objc_class *)[v167 bundleForClass:v51];
  v183._object = (void *)0xE900000000000053;
  v142._countAndFlagsBits = 0xE000000000000000;
  v183._countAndFlagsBits = 0x53454E4847554F52;
  v193.value._countAndFlagsBits = 0xD000000000000010;
  v61 = v168;
  v193.value._object = v168;
  v62.super.Class isa = v60;
  v203._countAndFlagsBits = 0;
  v203._object = (void *)0xE000000000000000;
  sub_1000095A8(v183, v193, v62, v203, v142);

  NSString v63 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v64 = v55;
  LODWORD(v65) = 1120403456;
  id v66 = [v55 createParameterWithIdentifier:v59 name:v63 address:5 min:3 max:0 unit:0 unitName:0.0 flags:v65 valueStrings:0 dependentParameters:0];

  id v176 = 0;
  char v177 = 1;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  v148 = v58;
  sub_100009608();
  unint64_t v67 = (unint64_t)&v48[qword_100010B30];
  LOBYTE(v173) = 6;
  sub_1000097F8();
  NSString v68 = sub_1000097D8();
  swift_bridgeObjectRelease();
  id v69 = v167;
  uint64_t v70 = v164;
  v71 = (objc_class *)[v167 bundleForClass:v164];
  v143._countAndFlagsBits = 0xE000000000000000;
  v184._countAndFlagsBits = 0x5441525F504D4153;
  v184._object = (void *)0xE900000000000045;
  v194.value._countAndFlagsBits = 0xD000000000000010;
  v194.value._object = v61;
  v72.super.Class isa = v71;
  v204._countAndFlagsBits = 0;
  v204._object = (void *)0xE000000000000000;
  sub_1000095A8(v184, v194, v72, v204, v143);

  NSString v73 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v74) = 1.0;
  id v75 = [v64 createParameterWithIdentifier:v68 name:v73 address:6 min:2 max:0 unit:0 unitName:0.0 flags:v74 valueStrings:0 dependentParameters:0];

  LOBYTE(v176) = 0;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  unint64_t v163 = v67;
  sub_100009608();
  uint64_t v76 = (uint64_t)&v48[qword_100010B38];
  LOBYTE(v173) = 7;
  sub_1000097F8();
  NSString v77 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v78 = (objc_class *)[v69 bundleForClass:v70];
  v185._countAndFlagsBits = 0xD000000000000011;
  v144._countAndFlagsBits = 0xE000000000000000;
  v185._object = (void *)0x800000010000AC20;
  v195.value._countAndFlagsBits = 0xD000000000000010;
  v79 = v168;
  v195.value._object = v168;
  v80.super.Class isa = v78;
  v205._countAndFlagsBits = 0;
  v205._object = (void *)0xE000000000000000;
  sub_1000095A8(v185, v195, v80, v205, v144);

  NSString v81 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v82) = 1.0;
  id v83 = v166;
  id v84 = [v166 createParameterWithIdentifier:v77 name:v81 address:7 min:2 max:0 unit:0 unitName:0.0 flags:v82 valueStrings:0 dependentParameters:0];

  LOBYTE(v176) = 0;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  uint64_t v162 = v76;
  sub_100009608();
  v85 = &v165[qword_100010B40];
  LOBYTE(v173) = 8;
  sub_1000097F8();
  NSString v86 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v87 = (objc_class *)[v69 bundleForClass:v70];
  v186._countAndFlagsBits = 0xD000000000000017;
  v145._countAndFlagsBits = 0xE000000000000000;
  v186._object = (void *)0x800000010000AC40;
  v196.value._countAndFlagsBits = 0xD000000000000010;
  v196.value._object = v79;
  v88.super.Class isa = v87;
  v206._countAndFlagsBits = 0;
  v206._object = (void *)0xE000000000000000;
  sub_1000095A8(v186, v196, v88, v206, v145);

  NSString v89 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v90) = 1.0;
  v91 = v83;
  id v92 = [v83 createParameterWithIdentifier:v86 name:v89 address:8 min:2 max:0 unit:0 unitName:0.0 flags:v90 valueStrings:0 dependentParameters:0];

  LOBYTE(v176) = 1;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  v147 = v85;
  sub_100009608();
  id v93 = v165;
  v94 = &v165[qword_100010B48];
  LOBYTE(v173) = 9;
  sub_1000097F8();
  NSString v95 = sub_1000097D8();
  swift_bridgeObjectRelease();
  v96 = (objc_class *)[v167 bundleForClass:v70];
  v187._countAndFlagsBits = 0xD000000000000014;
  v146._countAndFlagsBits = 0xE000000000000000;
  v187._object = (void *)0x800000010000AC60;
  v197.value._countAndFlagsBits = 0xD000000000000010;
  v197.value._object = v79;
  v97.super.Class isa = v96;
  v207._countAndFlagsBits = 0;
  v207._object = (void *)0xE000000000000000;
  sub_1000095A8(v187, v197, v97, v207, v146);

  NSString v98 = sub_1000097D8();
  swift_bridgeObjectRelease();
  LODWORD(v99) = 1.0;
  id v100 = [v91 createParameterWithIdentifier:v95 name:v98 address:9 min:2 max:0 unit:0 unitName:0.0 flags:v99 valueStrings:0 dependentParameters:0];

  LOBYTE(v176) = 0;
  uint64_t v175 = 0;
  long long v173 = 0u;
  long long v174 = 0u;
  v168 = v94;
  sub_100009608();
  uint64_t v101 = qword_100010B58;
  *(void *)((char *)v93 + qword_100010B58) = 0;
  uint64_t v102 = qword_100010B60;
  *(void *)((char *)v93 + qword_100010B60) = 0;
  *(void *)((char *)v93 + qword_100010B68) = &_swiftEmptyArrayStorage;
  v167 = (char *)qword_100010B70;
  *(void *)((char *)v93 + qword_100010B70) = 0;
  v103 = (char *)qword_100010B78;
  *(void *)((char *)v93 + qword_100010B78) = 0;
  *(void *)((char *)v93 + qword_100010B80) = 0;
  v104 = (char *)v93 + qword_100010B88;
  *(void *)v104 = 0;
  v104[8] = 1;
  uint64_t v170 = 0x40CF400000000000;
  long long v171 = xmmword_100009E20;
  long long v172 = xmmword_100009E30;
  type metadata accessor for CMFormatDescription(0);
  uint64_t v105 = sub_1000097A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v158, 1, 1, v105);
  uint64_t v106 = sub_1000098D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56))(v159, 1, 1, v106);
  uint64_t v107 = v160;
  sub_1000097B8();
  if (v107)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v108 = (void *)v173;
    id v109 = [objc_allocWithZone((Class)AVAudioFormat) initWithCMAudioFormatDescription:(void)v173];
    id v110 = objc_allocWithZone((Class)AUAudioUnitBus);
    *(void *)&long long v173 = 0;
    id v111 = [v110 initWithFormat:v109 error:&v173];
    v112 = (void *)v173;
    if (v111)
    {
      unsigned int v113 = v154;
      unint64_t v114 = HIDWORD(v154);
      unsigned int v115 = v155;
      unint64_t v116 = HIDWORD(v155);
      *(void *)((char *)v93 + qword_100010B50) = v111;
      id v117 = v112;

      id v176 = 0;
      v169.receiver = v93;
      v169.super_class = v161;
      *(void *)&long long v173 = __PAIR64__(v114, v113);
      *((void *)&v173 + 1) = __PAIR64__(v116, v115);
      LODWORD(v174) = v156;
      id v118 = objc_msgSendSuper2(&v169, "initWithComponentDescription:options:error:", &v173, v157, &v176);
      id v93 = v176;
      if (v118)
      {
        v119 = v118;
        id v120 = v176;
        v121 = v119;
        [v121 setMaximumFramesToRender:256];
        sub_100008A34(&qword_100010C58);
        uint64_t v122 = swift_allocObject();
        *(_OWORD *)(v122 + 16) = xmmword_100009E40;
        v123 = *(void **)&v121[qword_100010B50];
        *(void *)(v122 + 32) = v123;
        *(void *)&long long v173 = v122;
        sub_100009898();
        id v124 = objc_allocWithZone((Class)AUAudioUnitBusArray);
        sub_100008D84(0, &qword_100010CA0);
        id v93 = v121;
        id v125 = v123;
        Class isa = sub_100009878().super.isa;
        swift_bridgeObjectRelease();
        id v127 = [v124 initWithAudioUnit:v93 busType:2 busses:isa];

        v128 = *(void **)((char *)v93 + qword_100010B60);
        *(void *)((char *)v93 + qword_100010B60) = v127;
      }
      else
      {
        id v135 = v176;
        sub_1000095C8();

        swift_willThrow();
      }
    }
    else
    {
      id v129 = (id)v173;
      v166 = v103;
      id v130 = v129;
      sub_1000095C8();

      swift_willThrow();
      uint64_t v131 = sub_100008A34(&qword_100010C38);
      v132 = *(void (**)(char *, uint64_t))(*(void *)(v131 - 8) + 8);
      v132(v153, v131);
      v132(v152, v131);
      v132(v151, v131);
      v132(v150, v131);
      v132(v149, v131);
      v132(v148, v131);
      uint64_t v133 = sub_100008A34(&qword_100010C30);
      v134 = *(void (**)(unint64_t, uint64_t))(*(void *)(v133 - 8) + 8);
      v134(v163, v133);
      v134(v162, v133);
      v134((unint64_t)v147, v133);
      v134((unint64_t)v168, v133);

      swift_bridgeObjectRelease();
      swift_deallocPartialClassInstance();
    }
    return (uint64_t)v93;
  }
  return result;
}

uint64_t sub_10000461C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return sub_100003158(*(void *)a3, *(void *)(a3 + 8), *(_DWORD *)(a3 + 16), a4);
}

id sub_10000469C(uint64_t a1)
{
  id result = *(id *)(a1 + qword_100010B60);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000046B4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100008A34(&qword_100010C30);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self allVoices];
  sub_100008D84(0, &qword_100010C08);
  unint64_t v10 = sub_100009888();

  swift_bridgeObjectRetain();
  id v11 = sub_100007DEC(v10, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v2 + qword_100010B48, v5);
    sub_1000095F8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    [v11 konaLanguage];
    sub_100009658();

    return swift_release();
  }
  return result;
}

uint64_t sub_100004870(void *a1)
{
  uint64_t v2 = sub_1000097E8();
  uint64_t v4 = v3;
  id v5 = a1;
  sub_1000046B4(v2, v4);

  return swift_bridgeObjectRelease();
}

Class sub_1000048D8()
{
  sub_100008D84(0, &qword_100010C78);
  v0.super.super.Class isa = sub_1000098E8(0).super.super.isa;
  return v0.super.super.isa;
}

unint64_t sub_100004928(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008A34(&qword_100010C88);
  uint64_t v2 = (void *)sub_1000099A8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100007B74(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_100004A44(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008A34(&qword_100010C20);
  uint64_t v2 = sub_1000099A8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100008A78(v6, (uint64_t)v15);
    unint64_t result = sub_100007BEC((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100008AE0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

Class sub_100004B74(void *a1)
{
  uint64_t v2 = sub_1000097E8();
  uint64_t v4 = v3;
  id v5 = a1;
  sub_100008178(v2, v4);

  swift_bridgeObjectRelease();
  sub_100008D84(0, &qword_100010C78);
  v6.super.Class isa = sub_1000097C8().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

id sub_100004C24()
{
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3[4] = sub_100008CE0;
  v3[5] = v0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 1107296256;
  v3[2] = sub_100004CF0;
  v3[3] = &unk_10000C788;
  Swift::UInt64 v1 = _Block_copy(v3);
  swift_release();
  return v1;
}

uint64_t sub_100004CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *aBlock)
{
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))(a1 + 32);
  double v15 = _Block_copy(aBlock);
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    double v15 = sub_100008D4C;
  }
  else
  {
    uint64_t v16 = 0;
  }
  swift_retain();
  uint64_t v17 = v14(a2, a3, a4, a5, a6, a7, v15, v16);
  sub_100008D04((uint64_t)v15);
  swift_release();
  return v17;
}

void sub_100004DDC(unint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = sub_100009778();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  char v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    long long v10 = (char *)Strong;
    sub_100009788();
    long long v11 = (void (*)(unsigned char *, void))sub_100009798();
    uint64_t v13 = v12;
    v11(v46, 0);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v13)
    {
      if (!a3) {
        goto LABEL_12;
      }
      if (a3 >= 8)
      {
        uint64_t v14 = a3 & 0xFFFFFFF8;
        double v15 = (_OWORD *)(v13 + 16);
        uint64_t v16 = v14;
        do
        {
          *(v15 - 1) = 0uLL;
          *double v15 = 0uLL;
          v15 += 2;
          v16 -= 8;
        }
        while (v16);
        if (v14 == a3)
        {
LABEL_12:
          uint64_t v19 = qword_100010B68;
          unint64_t v20 = *(void *)&v10[qword_100010B68];
          if (v20 >> 62)
          {
LABEL_39:
            swift_bridgeObjectRetain();
            uint64_t v42 = sub_100009998();
            swift_bridgeObjectRelease();
            if (!v42) {
              goto LABEL_40;
            }
          }
          else if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
LABEL_40:

            return;
          }
          uint64_t v21 = qword_100010B78;
          if (!*(void *)&v10[qword_100010B78])
          {
            id v22 = [*(id *)&v10[qword_100010B58] nextBuffer];
            uint64_t v23 = *(void **)&v10[v21];
            *(void *)&v10[v21] = v22;

            v24 = *(void **)&v10[v21];
            if (v24)
            {
              id v25 = [v24 markers];
              sub_100008D84(0, &qword_100010C70);
              NSString v26 = (void *)sub_100009888();
            }
            else
            {
              NSString v26 = &_swiftEmptyArrayStorage;
            }
            sub_100006908((unint64_t)v26);
            swift_bridgeObjectRelease();
            *(void *)&v10[qword_100010B80] = 0;
            if (!*(void *)&v10[v21]) {
              goto LABEL_36;
            }
          }
          if (!a3)
          {
LABEL_37:
            sub_100009768();
            goto LABEL_40;
          }
          NSBundle v43 = (_DWORD *)a1;
          uint64_t v44 = v19;
          a1 = 0;
          uint64_t v19 = qword_100010B80;
          uint64_t v45 = qword_100010B58;
          do
          {
            double v27 = *(void **)&v10[v21];
            if (!v27) {
              goto LABEL_44;
            }
            uint64_t v28 = *(void *)&v10[v19];
            id v29 = [v27 buffer];
            unsigned int v30 = [v29 frameLength];

            if (v28 >= v30)
            {
              *(void *)&v10[v19] = 0;
              id v31 = [*(id *)&v10[v45] nextBuffer];
              NSBundle v32 = *(void **)&v10[v21];
              *(void *)&v10[v21] = v31;

              NSString v33 = *(void **)&v10[v21];
              if (v33)
              {
                id v34 = [v33 markers];
                sub_100008D84(0, &qword_100010C70);
                double v35 = (void *)sub_100009888();
              }
              else
              {
                double v35 = &_swiftEmptyArrayStorage;
              }
              sub_100006908((unint64_t)v35);
              swift_bridgeObjectRelease();
            }
            uint64_t v36 = *(void *)&v10[v21];
            if (!v36) {
              goto LABEL_32;
            }
            id v37 = [*(id *)&v10[v21] buffer];
            uint64_t v38 = *((void *)[v37 mutableAudioBufferList] + 2);
            if (!v38) {
              goto LABEL_45;
            }
            *(_DWORD *)(v13 + 4 * a1) = *(_DWORD *)(v38 + 4 * *(void *)&v10[v19]);

            uint64_t v39 = *(void *)&v10[v19];
            BOOL v40 = __OFADD__(v39, 1);
            uint64_t v41 = v39 + 1;
            if (v40)
            {
              __break(1u);
              goto LABEL_39;
            }
            ++a1;
            *(void *)&v10[v19] = v41;
          }
          while (a3 != a1);
          a1 = a3;
LABEL_32:
          uint64_t v19 = v44;
          if ((a1 - 0x2000000000000000) >> 62 == 3)
          {
            if (((4 * a1) & 0x8000000000000000) == 0)
            {
              if (!((4 * a1) >> 32))
              {
                a1 = (unint64_t)v43;
                if (v36) {
                  goto LABEL_37;
                }
LABEL_36:
                *(_DWORD *)a1 = 128;
                *(void *)&v10[v19] = &_swiftEmptyArrayStorage;
                swift_bridgeObjectRelease();
                goto LABEL_37;
              }
LABEL_43:
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
              goto LABEL_46;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v17 = (_DWORD *)(v13 + 4 * v14);
      uint64_t v18 = a3 - v14;
      do
      {
        *v17++ = 0;
        --v18;
      }
      while (v18);
      goto LABEL_12;
    }
LABEL_46:
    __break(1u);
  }
}

id sub_10000526C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v132 = sub_100008A34(&qword_100010C30);
  uint64_t v131 = *(void *)(v132 - 8);
  __chkstk_darwin();
  id v130 = (char *)&v116 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_100008A34(&qword_100010C38);
  uint64_t v136 = *(void *)(v141 - 8);
  __chkstk_darwin();
  Swift::String v137 = (char *)&v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_100008A34(&qword_100010C40);
  uint64_t v135 = *(void *)(v140 - 8);
  __chkstk_darwin();
  Swift::String v142 = (char *)&v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009748();
  uint64_t v138 = *(void *)(v7 - 8);
  uint64_t v139 = v7;
  __chkstk_darwin();
  uint64_t v9 = (char *)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009668();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (uint64_t *)((char *)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v127 = sub_1000096A8();
  uint64_t v14 = (void *)sub_100009698();
  double v15 = *(void (**)(uint64_t *, void, uint64_t))(v11 + 104);
  uint64_t v129 = v11 + 104;
  v128 = v15;
  v15(v13, enum case for TTSSpeechEvent.receivedStart(_:), v10);
  id v16 = [a1 jobIdentifier];
  sub_1000097E8();

  sub_100009688();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void (**)(uint64_t *, uint64_t))(v11 + 8);
  v126 = v13;
  uint64_t v134 = v10;
  uint64_t v133 = v11 + 8;
  v17(v13, v10);
  id v18 = [self allVoices];
  sub_100008D84(0, &qword_100010C08);
  unint64_t v19 = sub_100009888();

  id v20 = a1;
  uint64_t v21 = (void *)sub_100007F94(v19, v20);
  swift_bridgeObjectRelease();

  if (!v21)
  {
    id result = (id)AXTTSLogKona();
    if (result)
    {
      id v25 = result;
      sub_1000098C8();
      sub_100008A34(&qword_100010C48);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_100009E50;
      id v27 = [v20 voice];
      id v28 = [v27 identifier];

      uint64_t v29 = sub_1000097E8();
      uint64_t v31 = v30;

      *(void *)(v26 + 56) = &type metadata for String;
      *(void *)(v26 + 64) = sub_100008BA0();
      *(void *)(v26 + 32) = v29;
      *(void *)(v26 + 40) = v31;
      sub_100009758();

      return (id)swift_bridgeObjectRelease();
    }
    goto LABEL_48;
  }
  id v125 = v17;
  id v144 = v21;

  uint64_t v22 = v2 + qword_100010B88;
  *(void *)uint64_t v22 = 15;
  *(unsigned char *)(v22 + 8) = 0;
  id v23 = [v20 ssmlRepresentation];
  sub_1000097E8();

  sub_100009738();
  id v122 = v20;
  id v124 = v9;
  uint64_t v32 = qword_100010B58;
  NSString v33 = *(void **)(v2 + qword_100010B58);
  id v34 = v33;
  id v35 = v144;
  if (!v33)
  {
    id v36 = [objc_allocWithZone((Class)AXKonaSpeechEngine) initWithVoice:v144];
    id v37 = *(void **)(v2 + v32);
    *(void *)(v2 + v32) = v36;

    id v34 = *(void **)(v2 + v32);
    if (!v34)
    {
      id result = (id)AXTTSLogKona();
      if (result)
      {
        v61 = result;
        sub_1000098C8();
        sub_100008A34(&qword_100010C48);
        uint64_t v62 = swift_allocObject();
        *(_OWORD *)(v62 + 16) = xmmword_100009E50;
        id v63 = [v122 voice];
        id v64 = [v63 identifier];

        uint64_t v65 = sub_1000097E8();
        uint64_t v67 = v66;

        *(void *)(v62 + 56) = &type metadata for String;
        *(void *)(v62 + 64) = sub_100008BA0();
        *(void *)(v62 + 32) = v65;
        *(void *)(v62 + 40) = v67;
        sub_100009758();

        swift_bridgeObjectRelease();
        return (id)(*(uint64_t (**)(char *, uint64_t))(v138 + 8))(v124, v139);
      }
      goto LABEL_49;
    }
  }
  uint64_t v143 = v2;
  id v145 = v34;
  id v38 = [v145 voice];
  id v39 = [v38 identifier];

  uint64_t v40 = sub_1000097E8();
  uint64_t v42 = v41;

  id v43 = [v35 identifier];
  uint64_t v44 = sub_1000097E8();
  uint64_t v46 = v45;

  if (v40 == v44 && v42 == v46)
  {
    swift_bridgeObjectRelease_n();
    id v47 = v144;
    [v145 setVoice:v144];
    v48 = v137;
    if (v33) {
      goto LABEL_28;
    }
  }
  else
  {
    char v49 = sub_1000099B8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v47 = v144;
    [v145 setVoice:v144];
    v48 = v137;
    if (v33 && (v49 & 1) != 0) {
      goto LABEL_28;
    }
  }
  id v50 = [v145 ruleSetRunner];
  [v50 reset];

  id v51 = [self sharedInstance];
  NSString v52 = [v47 identifier];
  if (!v52)
  {
    sub_1000097E8();
    NSString v52 = sub_1000097D8();
    swift_bridgeObjectRelease();
  }
  id v53 = [v51 resourceWithVoiceId:v52];

  if (v53)
  {
    sub_100009728();
    unint64_t v54 = sub_100009718();
    unint64_t v55 = v54;
    if (v54 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_100009998();
      uint64_t v56 = (uint64_t)result;
      if (result) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v56 = *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v56)
      {
LABEL_18:
        if (v56 < 1)
        {
LABEL_47:
          __break(1u);
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
          return result;
        }
        uint64_t v57 = 0;
        do
        {
          if ((v55 & 0xC000000000000001) != 0) {
            id v58 = (id)sub_100009938();
          }
          else {
            id v58 = *(id *)(v55 + 8 * v57 + 32);
          }
          NSString v59 = v58;
          ++v57;
          id v60 = [v145 ruleSetRunner];
          [v60 loadRuleSet:v59];
        }
        while (v56 != v57);
      }
    }

    swift_bridgeObjectRelease_n();
    id v47 = v144;
  }
LABEL_28:
  id v68 = [v145 parameters];
  id v69 = [v68 copy];

  Swift::String v137 = (char *)[v69 copy];
  sub_100009648();
  swift_allocObject();
  uint64_t v70 = sub_100009638();
  aBlock = (void **)v70;
  sub_100008A34(&qword_100010C60);
  swift_allocObject();
  uint64_t v123 = v70;
  swift_retain();
  sub_100009678();
  sub_1000096F8();
  id v71 = [v47 parameters];
  id v72 = [v71 speed];

  uint64_t v73 = v136;
  uint64_t v74 = v141;
  v121 = *(void (**)(char *, uint64_t, uint64_t))(v136 + 16);
  v121(v48, v143 + qword_100010B00, v141);
  sub_1000095E8();
  id v120 = *(uint64_t (**)(char *, uint64_t))(v73 + 8);
  id result = (id)v120(v48, v74);
  float v75 = (float)(uint64_t)aBlock / 100.0;
  if ((_BYTE)v147) {
    float v75 = 1.0;
  }
  float v76 = v75 * (float)(uint64_t)v72;
  if ((~LODWORD(v76) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v76 <= -9.2234e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  id v119 = v69;
  if (v76 >= 9.2234e18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v77 = (uint64_t)v76;
  id v78 = v144;
  id v79 = [v144 parameters];
  [v79 pitchBase];

  sub_1000096D8();
  uint64_t v117 = v77;
  sub_1000096C8();
  id v80 = [v78 parameters];
  [v80 volume];

  sub_1000096E8();
  id v81 = [v78 languageCode];
  sub_1000097E8();

  sub_100009708();
  sub_100008BF4();
  sub_1000096B8();
  uint64_t v136 = sub_100009628();
  uint64_t v118 = v82;
  uint64_t v83 = v141;
  id v84 = v121;
  v121(v48, v143 + qword_100010B08, v141);
  sub_1000095E8();
  v85 = (void (*)(char *, uint64_t))v120;
  v120(v48, v83);
  id v86 = v137;
  if ((v147 & 1) == 0) {
    [v137 setHeadSize:aBlock];
  }
  uint64_t v87 = v143;
  v84(v48, v143 + qword_100010B18, v83);
  sub_1000095E8();
  v85(v48, v83);
  if ((v147 & 1) == 0) {
    [v86 setPitchFluctuation:aBlock];
  }
  v84(v48, v87 + qword_100010B20, v83);
  sub_1000095E8();
  v85(v48, v83);
  if ((v147 & 1) == 0) {
    [v86 setBreathiness:aBlock];
  }
  v84(v48, v87 + qword_100010B28, v83);
  sub_1000095E8();
  v85(v48, v83);
  if ((v147 & 1) == 0) {
    [v86 setRoughness:aBlock];
  }
  v84(v48, v87 + qword_100010B10, v83);
  sub_1000095E8();
  v85(v48, v83);
  if ((v147 & 1) == 0) {
    [v86 setPitchBase:aBlock];
  }
  [v86 setSpeed:v117];
  uint64_t v88 = v131;
  NSString v89 = *(void (**)(char *, uint64_t, uint64_t))(v131 + 16);
  double v90 = v130;
  uint64_t v91 = v132;
  v89(v130, v87 + qword_100010B30, v132);
  sub_1000095E8();
  id v92 = *(void (**)(char *, uint64_t))(v88 + 8);
  v92(v90, v91);
  id v93 = v145;
  [v145 setHighQualityMode:aBlock];
  v89(v90, v143 + qword_100010B38, v91);
  sub_1000095E8();
  v92(v90, v91);
  [v93 setPhrasePrediction:aBlock];
  v89(v90, v143 + qword_100010B40, v91);
  sub_1000095E8();
  v92(v90, v91);
  [v93 setAbbreviationDictionary:aBlock];
  v89(v90, v143 + qword_100010B48, v91);
  sub_1000095E8();
  v92(v90, v91);
  [v93 setPreferCommunityDictionary:aBlock];
  [v93 setParameters:v86];
  v94 = (void *)sub_100009698();
  id v95 = v122;
  id v96 = [v122 ssmlRepresentation];
  uint64_t v97 = sub_1000097E8();
  uint64_t v99 = v98;

  id v100 = v126;
  uint64_t *v126 = v97;
  v100[1] = v99;
  uint64_t v101 = v118;
  v100[2] = v136;
  v100[3] = v101;
  uint64_t v102 = v134;
  v128(v100, enum case for TTSSpeechEvent.markupConversion(_:), v134);
  swift_bridgeObjectRetain();
  id v103 = [v95 jobIdentifier];
  sub_1000097E8();

  sub_100009688();
  swift_bridgeObjectRelease();
  v125(v100, v102);
  id v104 = [v93 ruleSetRunner];
  uint64_t v105 = swift_allocObject();
  *(void *)(v105 + 16) = v95;
  v150 = sub_100008C88;
  uint64_t v151 = v105;
  aBlock = _NSConcreteStackBlock;
  uint64_t v147 = 1107296256;
  uint64_t v106 = v95;
  v148 = sub_1000067C4;
  v149 = &unk_10000C738;
  uint64_t v107 = _Block_copy(&aBlock);
  id v108 = v95;
  swift_release();
  [v104 setMatchLogger:v107];
  _Block_release(v107);

  NSString v109 = sub_1000097D8();
  swift_bridgeObjectRelease();
  [v93 synthesizeText:v109];
  swift_release();

  uint64_t v110 = v143;
  (*(void (**)(char *, uint64_t))(v135 + 8))(v142, v140);
  (*(void (**)(char *, uint64_t))(v138 + 8))(v124, v139);
  id v111 = v144;
  v112 = *(void **)(v110 + qword_100010B70);
  *(void *)(v110 + qword_100010B70) = v144;
  id v113 = v111;

  sub_100008A34(&qword_100010C58);
  uint64_t v114 = swift_allocObject();
  *(_OWORD *)(v114 + 16) = xmmword_100009E40;
  *(void *)(v114 + 32) = v106;
  aBlock = (void **)v114;
  sub_100009898();
  *(void *)(v110 + qword_100010B68) = aBlock;
  id v115 = v106;

  id result = (id)swift_bridgeObjectRelease();
  *(void *)(v110 + qword_100010B80) = 0;
  return result;
}

uint64_t sub_1000065FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v26 = a4;
  id v27 = a8;
  uint64_t v24 = a5;
  uint64_t v25 = a3;
  uint64_t v12 = sub_100009668();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  double v15 = (uint64_t *)((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000096A8();
  id v16 = (void *)sub_100009698();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = [a7 identifier];
  uint64_t v18 = sub_1000097E8();
  uint64_t v20 = v19;

  *double v15 = a1;
  v15[1] = a2;
  _OWORD v15[2] = v24;
  v15[3] = a6;
  uint64_t v21 = v26;
  v15[4] = v25;
  v15[5] = v21;
  v15[6] = v18;
  v15[7] = v20;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, enum case for TTSSpeechEvent.ruleRewrite(_:), v12);
  id v22 = [v27 jobIdentifier];
  sub_1000097E8();

  sub_100009688();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_1000067C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  uint64_t v10 = sub_1000097E8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1000097E8();
  uint64_t v15 = v14;
  swift_retain();
  id v16 = a6;
  v9(v10, v12, a3, a4, v13, v15, v16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_1000068A0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10000526C(v4);
}

uint64_t sub_100006908(unint64_t a1)
{
  uint64_t v3 = qword_100010B68;
  unint64_t v4 = *(void *)&v1[qword_100010B68];
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    id v5 = (char *)sub_100009998();
    if (!v5) {
      goto LABEL_15;
    }
  }
  else
  {
    id v5 = *(char **)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v5) {
      goto LABEL_15;
    }
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v6 = (id)sub_100009938();
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_22;
    }
    id v6 = *(id *)(v4 + 32);
  }
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  id v8 = [v7 ssmlRepresentation];

  uint64_t v9 = sub_1000097E8();
  unint64_t v11 = v10;

  swift_bridgeObjectRetain();
  id v5 = v1;
  unint64_t v12 = (unint64_t)sub_100008570(a1, v9, v11, (uint64_t)v5);
  swift_bridgeObjectRelease_n();

  if (!(v12 >> 62))
  {
    if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
LABEL_22:
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100009998();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_15;
  }
LABEL_8:
  id v13 = [v5 speechSynthesisOutputMetadataBlock];
  if (v13)
  {
    uint64_t v14 = (void (**)(void, void, void))v13;
    unint64_t v15 = *(void *)&v1[v3];
    if (v15 >> 62)
    {
      _Block_copy(v13);
      swift_bridgeObjectRetain();
      uint64_t result = sub_100009998();
      if (result)
      {
LABEL_11:
        if ((v15 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return result;
          }
          id v18 = *(id *)(v15 + 32);
          goto LABEL_14;
        }
LABEL_26:
        id v18 = (id)sub_100009938();
LABEL_14:
        uint64_t v19 = v18;
        swift_bridgeObjectRelease();
        sub_100008D84(0, &qword_100010CA8);
        Class isa = sub_100009878().super.isa;
        ((void (**)(void, Class, void *))v14)[2](v14, isa, v19);

        _Block_release(v14);
        _Block_release(v14);

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      _Block_copy(v13);
      uint64_t result = swift_bridgeObjectRetain();
      if (v16) {
        goto LABEL_11;
      }
    }
    _Block_release(v14);
    _Block_release(v14);
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_26;
  }
LABEL_15:
  return swift_bridgeObjectRelease();
}

uint64_t sub_100006BC0(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  sub_100008A34(&qword_100010CB8);
  __chkstk_darwin();
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v29 = a5;
    unint64_t v30 = a6;
    uint64_t v27 = a1;
    uint64_t v28 = a2;
    uint64_t v16 = sub_1000095D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
    sub_100008DC0();
  }
  else
  {
    uint64_t v14 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v14 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (4 * v14 < a3 >> 14) {
      return 0;
    }
    uint64_t v29 = a5;
    unint64_t v30 = a6;
    uint64_t v27 = a1;
    uint64_t v28 = a2;
    uint64_t v17 = sub_1000095D8();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v25 = v18 + 56;
    uint64_t v26 = v19;
    v19(v13, 1, 1, v17);
    sub_100008DC0();
    uint64_t v15 = sub_1000098F8();
    char v21 = v20;
    sub_100008E14((uint64_t)v13);
    if ((v21 & 1) == 0) {
      return v15;
    }
    uint64_t v29 = a5;
    unint64_t v30 = a6;
    uint64_t v27 = a1;
    uint64_t v28 = a2;
    v26(v13, 1, 1, v17);
  }
  uint64_t v15 = sub_1000098F8();
  char v23 = v22;
  sub_100008E14((uint64_t)v13);
  if (v23) {
    return 0;
  }
  return v15;
}

Class sub_100006E48()
{
  sub_100008880();
  sub_100008D84(0, &qword_100010C00);
  v0.super.Class isa = sub_100009878().super.isa;
  swift_bridgeObjectRelease();
  return v0.super.isa;
}

void sub_100006EB4(id *a1@<X0>, void *a2@<X8>)
{
  id v2 = *a1;
  id v3 = [*a1 name];
  sub_1000097E8();

  id v4 = [v2 identifier];
  sub_1000097E8();

  sub_100008A34(&qword_100010C10);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100009E50;
  id v6 = [v2 languageCode];
  uint64_t v7 = sub_1000097E8();
  uint64_t v9 = v8;

  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v9;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100009E50;
  id v11 = [v2 languageCode];
  uint64_t v12 = sub_1000097E8();
  uint64_t v14 = v13;

  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v14;
  id v15 = objc_allocWithZone((Class)AVSpeechSynthesisProviderVoice);
  NSString v16 = sub_1000097D8();
  swift_bridgeObjectRelease();
  NSString v17 = sub_1000097D8();
  swift_bridgeObjectRelease();
  Class isa = sub_100009878().super.isa;
  swift_bridgeObjectRelease();
  Class v19 = sub_100009878().super.isa;
  swift_bridgeObjectRelease();
  id v20 = [v15 initWithName:v16 identifier:v17 primaryLanguages:isa supportedLanguages:v19];

  sub_100008A34(&qword_100010C18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100009E50;
  sub_1000097E8();
  sub_100009928();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = 0x636E6575716F6C45;
  *(void *)(inited + 80) = 0xE900000000000065;
  sub_100004A44(inited);
  Class v22 = sub_1000097C8().super.isa;
  swift_bridgeObjectRelease();
  [v20 setExtraAttributes:v22];

  *a2 = v20;
}

void sub_10000717C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100009668();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000096A8();
  id v6 = (void *)sub_100009698();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for TTSSpeechEvent.receivedStop(_:), v2);
  uint64_t v7 = qword_100010B68;
  unint64_t v8 = *(void *)(v1 + qword_100010B68);
  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  if (!sub_100009998()) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_100009938();
    goto LABEL_6;
  }
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v10 = *(id *)(v8 + 32);
LABEL_6:
    id v11 = v10;
    swift_bridgeObjectRelease();
    id v12 = [v11 jobIdentifier];

    sub_1000097E8();
LABEL_9:
    sub_100009688();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [*(id *)(v1 + qword_100010B58) cancelSynthesis];
    *(void *)(v1 + v7) = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    *(void *)(v1 + qword_100010B80) = 0;
    uint64_t v13 = *(void **)(v1 + qword_100010B78);
    *(void *)(v1 + qword_100010B78) = 0;

    uint64_t v14 = v1 + qword_100010B88;
    *(void *)uint64_t v14 = 0;
    *(unsigned char *)(v14 + 8) = 1;
    return;
  }
  __break(1u);
}

void sub_1000073D8(void *a1)
{
  id v1 = a1;
  sub_10000717C();
}

void sub_100007420()
{
  uint64_t v1 = v0 + qword_100010B00;
  uint64_t v2 = sub_100008A34(&qword_100010C38);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + qword_100010B08, v2);
  v3(v0 + qword_100010B10, v2);
  v3(v0 + qword_100010B18, v2);
  v3(v0 + qword_100010B20, v2);
  v3(v0 + qword_100010B28, v2);
  uint64_t v4 = v0 + qword_100010B30;
  uint64_t v5 = sub_100008A34(&qword_100010C30);
  id v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v0 + qword_100010B38, v5);
  v6(v0 + qword_100010B40, v5);
  v6(v0 + qword_100010B48, v5);

  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(v0 + qword_100010B78);
}

id sub_100007630()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KonaSynthesizerAudioUnit();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100007668(uint64_t a1)
{
  uint64_t v2 = a1 + qword_100010B00;
  uint64_t v3 = sub_100008A34(&qword_100010C38);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
  v4(a1 + qword_100010B08, v3);
  v4(a1 + qword_100010B10, v3);
  v4(a1 + qword_100010B18, v3);
  v4(a1 + qword_100010B20, v3);
  v4(a1 + qword_100010B28, v3);
  uint64_t v5 = a1 + qword_100010B30;
  uint64_t v6 = sub_100008A34(&qword_100010C30);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + qword_100010B38, v6);
  v7(a1 + qword_100010B40, v6);
  v7(a1 + qword_100010B48, v6);

  swift_bridgeObjectRelease();
  unint64_t v8 = *(void **)(a1 + qword_100010B78);
}

uint64_t variable initialization expression of AudioUnitFactory.audioUnit()
{
  return 0;
}

uint64_t type metadata accessor for KonaSynthesizerAudioUnit()
{
  uint64_t result = qword_100010B90;
  if (!qword_100010B90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000078D0()
{
  sub_1000079F0();
  if (v0 <= 0x3F)
  {
    sub_100007B0C();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

void sub_1000079F0()
{
  if (!qword_100010BC8)
  {
    sub_100007A58(&qword_100010BD0);
    sub_100007AA0();
    unint64_t v0 = sub_100009618();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010BC8);
    }
  }
}

uint64_t sub_100007A58(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100007AA0()
{
  unint64_t result = qword_100010BD8;
  if (!qword_100010BD8)
  {
    sub_100007A58(&qword_100010BD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010BD8);
  }
  return result;
}

void sub_100007B0C()
{
  if (!qword_100010BE0)
  {
    unint64_t v0 = sub_100009618();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010BE0);
    }
  }
}

uint64_t sub_100007B6C()
{
  return type metadata accessor for KonaSynthesizerAudioUnit();
}

unint64_t sub_100007B74(uint64_t a1, uint64_t a2)
{
  sub_1000099D8();
  sub_100009808();
  Swift::Int v4 = sub_1000099F8();
  return sub_100007C30(a1, a2, v4);
}

unint64_t sub_100007BEC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100009908(*(void *)(v2 + 40));
  return sub_100007D14(a1, v4);
}

unint64_t sub_100007C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000099B8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000099B8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100007D14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100008AF0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100009918();
      sub_100008B4C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100007DDC(unint64_t result)
{
  if (result >= 0xA) {
    return 10;
  }
  return result;
}

void *sub_100007DEC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100009998();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)sub_100009938();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, "identifier", v22);
        uint64_t v16 = sub_1000097E8();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_1000099B8();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100007F94(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100009998();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v5 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)sub_100009938();
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * i);
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        char v21 = v6;
        id v8 = [v6 identifier];
        uint64_t v9 = sub_1000097E8();
        uint64_t v11 = v10;

        id v12 = [a2 voice];
        id v13 = [v12 identifier];

        uint64_t v14 = sub_1000097E8();
        uint64_t v16 = v15;

        if (v9 == v14 && v11 == v16)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          uint64_t v3 = (uint64_t)v21;
          swift_bridgeObjectRelease();
          return v3;
        }
        char v18 = sub_1000099B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_17;
        }

        if (v7 == v3)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_100008178(uint64_t a1, uint64_t a2)
{
  id v4 = [self allVoices];
  sub_100008D84(0, &qword_100010C08);
  unint64_t v5 = sub_100009888();

  swift_bridgeObjectRetain();
  id v6 = sub_100007DEC(v5, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_100008A34(&qword_100010C80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100009E60;
    *(void *)(inited + 32) = sub_1000097F8();
    *(void *)(inited + 40) = v8;
    *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithInteger:100];
    *(void *)(inited + 56) = sub_1000097F8();
    *(void *)(inited + 64) = v9;
    id v10 = [v6 parameters];
    id v11 = [v10 headSize];

    *(void *)(inited + 72) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v11];
    *(void *)(inited + 80) = sub_1000097F8();
    *(void *)(inited + 88) = v12;
    id v13 = [v6 parameters];
    id v14 = [v13 pitchBase];

    *(void *)(inited + 96) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v14];
    *(void *)(inited + 104) = sub_1000097F8();
    *(void *)(inited + 112) = v15;
    id v16 = [v6 parameters];
    id v17 = [v16 pitchFluctuation];

    *(void *)(inited + 120) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v17];
    *(void *)(inited + 128) = sub_1000097F8();
    *(void *)(inited + 136) = v18;
    id v19 = [v6 parameters];
    id v20 = [v19 breathiness];

    *(void *)(inited + 144) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v20];
    *(void *)(inited + 152) = sub_1000097F8();
    *(void *)(inited + 160) = v21;
    id v22 = [v6 parameters];
    id v23 = [v22 roughness];

    *(void *)(inited + 168) = [objc_allocWithZone((Class)NSNumber) initWithInteger:v23];
    *(void *)(inited + 176) = sub_1000097F8();
    *(void *)(inited + 184) = v24;
    sub_100008D84(0, &qword_100010C78);
    *(NSNumber *)(inited + 192) = sub_1000098E8(0);
    *(void *)(inited + 200) = sub_1000097F8();
    *(void *)(inited + 208) = v25;
    *(NSNumber *)(inited + 216) = sub_1000098E8(1);
    *(void *)(inited + 224) = sub_1000097F8();
    *(void *)(inited + 232) = v26;
    *(NSNumber *)(inited + 240) = sub_1000098E8(0);
    *(void *)(inited + 248) = sub_1000097F8();
    *(void *)(inited + 256) = v27;
    *(NSNumber *)(inited + 264) = sub_1000098E8(0);
    unint64_t v28 = sub_100004928(inited);

    return v28;
  }
  else
  {
    return sub_100004928((uint64_t)&_swiftEmptyArrayStorage);
  }
}

void *sub_100008570(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v5 = v4;
  unint64_t v8 = a1;
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v9; uint64_t v9 = sub_100009998())
  {
    uint64_t v25 = v5;
    uint64_t v26 = v9;
    uint64_t v28 = a2;
    unint64_t v29 = v8 & 0xC000000000000001;
    uint64_t v10 = a4 + qword_100010B88;
    a2 = 4;
    unint64_t v27 = v8;
    while (1)
    {
      a4 = a2 - 4;
      id v12 = v29 ? (id)sub_100009938() : *(id *)(v8 + 8 * a2);
      unint64_t v5 = v12;
      uint64_t v13 = a2 - 3;
      if (__OFADD__(a4, 1)) {
        break;
      }
      NSString v14 = [v12 text];
      if (!v14)
      {
        sub_1000097E8();
        NSString v14 = sub_1000097D8();
        swift_bridgeObjectRelease();
      }
      id v15 = objc_msgSend(v14, "xmlEscaped", v25);

      uint64_t v16 = sub_1000097E8();
      uint64_t v18 = v17;

      unint64_t v8 = a3;
      sub_100006BC0(v16, v18, *(void *)v10, *(unsigned char *)(v10 + 8), v28, a3);
      if (v19)
      {

        swift_bridgeObjectRelease();
        uint64_t v11 = v26;
        unint64_t v8 = v27;
      }
      else
      {
        sub_100009828();
        *(void *)uint64_t v10 = sub_100009838();
        *(unsigned char *)(v10 + 8) = 0;
        sub_100008DC0();
        a4 = sub_100009818();
        if ((v18 & 0x1000000000000000) != 0) {
          Swift::Int v20 = sub_100009848();
        }
        else {
          Swift::Int v20 = sub_100009858();
        }
        Swift::Int v21 = v20;
        swift_bridgeObjectRelease();
        unsigned int v22 = [v5 framePosition];
        if (v22 >> 30) {
          goto LABEL_23;
        }
        id v23 = objc_msgSend(objc_allocWithZone((Class)AVSpeechSynthesisMarker), "initWithMarkerType:forTextRange:atByteSampleOffset:", 1, a4, v21, 4 * v22);

        uint64_t v11 = v26;
        unint64_t v8 = v27;
        if (v23)
        {
          sub_100009868();
          if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1000098A8();
          }
          sub_1000098B8();
          sub_100009898();
        }
      }
      ++a2;
      if (v13 == v11) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
  }
LABEL_25:
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

void *sub_100008880()
{
  id v0 = [self allVoices];
  sub_100008D84(0, &qword_100010C08);
  unint64_t v1 = sub_100009888();

  if (v1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      uint64_t v10 = &_swiftEmptyArrayStorage;
      sub_100009968();
      if (v2 < 0) {
        break;
      }
      uint64_t v3 = 0;
      while (v2 != v3)
      {
        if ((v1 & 0xC000000000000001) != 0) {
          id v4 = (id)sub_100009938();
        }
        else {
          id v4 = *(id *)(v1 + 8 * v3 + 32);
        }
        unint64_t v5 = v4;
        id v8 = v4;
        sub_100006EB4(&v8, &v9);

        ++v3;
        sub_100009948();
        sub_100009978();
        sub_100009988();
        sub_100009958();
        if (v2 == v3)
        {
          id v6 = v10;
          swift_bridgeObjectRelease();
          return v6;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_100009998();
      swift_bridgeObjectRelease();
      if (!v2) {
        goto LABEL_13;
      }
    }
    __break(1u);
    unint64_t result = (void *)swift_release();
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100008A34(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008A34(&qword_100010C28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100008AE0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008AF0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100008B4C(uint64_t a1)
{
  return a1;
}

unint64_t sub_100008BA0()
{
  unint64_t result = qword_100010C50;
  if (!qword_100010C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010C50);
  }
  return result;
}

unint64_t sub_100008BF4()
{
  unint64_t result = qword_100010C68;
  if (!qword_100010C68)
  {
    sub_100007A58(&qword_100010C40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010C68);
  }
  return result;
}

uint64_t sub_100008C50()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  return sub_1000065FC(a1, a2, a3, a4, a5, a6, a7, *(void **)(v7 + 16));
}

uint64_t sub_100008C90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008CA0()
{
  return swift_release();
}

uint64_t sub_100008CA8()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100008CE0(unint64_t a1, uint64_t a2, unsigned int a3)
{
}

uint64_t sub_100008D04(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100008D14()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008D4C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void type metadata accessor for CMFormatDescription(uint64_t a1)
{
}

uint64_t sub_100008D84(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100008DC0()
{
  unint64_t result = qword_100010CB0;
  if (!qword_100010CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010CB0);
  }
  return result;
}

uint64_t sub_100008E14(uint64_t a1)
{
  uint64_t v2 = sub_100008A34(&qword_100010CB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for KonaAUParameters(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KonaAUParameters(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for KonaAUParameters(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x100008FE0);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

uint64_t sub_100009008(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100009014(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KonaAUParameters()
{
  return &type metadata for KonaAUParameters;
}

__n128 sub_10000902C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_100009040(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100009060(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for AudioBufferList(uint64_t a1)
{
}

uint64_t sub_1000090A0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000090D4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1000090E8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100009108(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for AudioTimeStamp(uint64_t a1)
{
}

void type metadata accessor for AudioUnitRenderActionFlags(uint64_t a1)
{
}

unint64_t sub_100009170()
{
  unint64_t result = qword_100010CE0;
  if (!qword_100010CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010CE0);
  }
  return result;
}

void type metadata accessor for AudioTimeStampFlags(uint64_t a1)
{
}

__n128 sub_1000091D8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for SMPTETime(uint64_t a1)
{
}

__n128 sub_100009200(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000920C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000922C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for AudioBuffer(uint64_t a1)
{
}

void type metadata accessor for SMPTETimeFlags(uint64_t a1)
{
}

void type metadata accessor for SMPTETimeType(uint64_t a1)
{
}

void sub_100009290(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)(AudioComponentDescription with)
{
  uint64_t v3 = v1;
  UInt32 componentFlagsMask = with.componentFlagsMask;
  uint64_t v5 = *(void *)&with.componentManufacturer;
  uint64_t v6 = *(void *)&with.componentType;
  type metadata accessor for KonaSynthesizerAudioUnit();
  result.super.Class isa = (Class)sub_100003068(v6, v5, componentFlagsMask, 0);
  if (!v2)
  {
    uint64_t v8 = OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit;
    uint64_t v9 = *(void **)(v3 + OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit);
    *(AUAudioUnit *)(v3 + OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit) = result;

    uint64_t v10 = *(void **)(v3 + v8);
    if (v10) {
      return (AUAudioUnit)v10;
    }
    else {
      __break(1u);
    }
  }
  return result;
}

id AudioUnitFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "init");
}

id AudioUnitFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AudioUnitFactory()
{
  return self;
}

uint64_t sub_1000095A8(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000095B8()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000095C8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000095D8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000095E8()
{
  return AUParamValue.wrappedValue.getter();
}

uint64_t sub_1000095F8()
{
  return AUParamValue.projectedValue.getter();
}

uint64_t sub_100009608()
{
  return AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)();
}

uint64_t sub_100009618()
{
  return type metadata accessor for AUParamValue();
}

uint64_t sub_100009628()
{
  return dispatch thunk of StringStream.string.getter();
}

uint64_t sub_100009638()
{
  return StringStream.init()();
}

uint64_t sub_100009648()
{
  return type metadata accessor for StringStream();
}

uint64_t sub_100009658()
{
  return dispatch thunk of AUParamWrapper.enabled.setter();
}

uint64_t sub_100009668()
{
  return type metadata accessor for TTSSpeechEvent();
}

uint64_t sub_100009678()
{
  return FormattedStream.init(_:)();
}

uint64_t sub_100009688()
{
  return dispatch thunk of TTSSpeechTracer.emit(event:forIdentifier:)();
}

uint64_t sub_100009698()
{
  return static TTSSpeechTracer.shared.getter();
}

uint64_t sub_1000096A8()
{
  return type metadata accessor for TTSSpeechTracer();
}

uint64_t sub_1000096B8()
{
  return TTSMarkupVisitor.visit(_:)();
}

uint64_t sub_1000096C8()
{
  return EloquenceMarkupWriter.voiceNormalRate.setter();
}

uint64_t sub_1000096D8()
{
  return EloquenceMarkupWriter.voiceNormalPitch.setter();
}

uint64_t sub_1000096E8()
{
  return EloquenceMarkupWriter.voiceNormalVolume.setter();
}

uint64_t sub_1000096F8()
{
  return EloquenceMarkupWriter.init(stream:)();
}

uint64_t sub_100009708()
{
  return EloquenceMarkupWriter.language.setter();
}

uint64_t sub_100009718()
{
  return dispatch thunk of static TTSPronunciationUtils.rulesets(for:)();
}

uint64_t sub_100009728()
{
  return type metadata accessor for TTSPronunciationUtils();
}

uint64_t sub_100009738()
{
  return TTSMarkup.SpeechDocument.init(ssml:)();
}

uint64_t sub_100009748()
{
  return type metadata accessor for TTSMarkup.SpeechDocument();
}

uint64_t sub_100009758()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_100009768()
{
  return noErr.getter();
}

uint64_t sub_100009778()
{
  return type metadata accessor for UnsafeMutableAudioBufferListPointer();
}

uint64_t sub_100009788()
{
  return UnsafeMutableAudioBufferListPointer.init(_:)();
}

uint64_t sub_100009798()
{
  return UnsafeMutableAudioBufferListPointer.subscript.read();
}

uint64_t sub_1000097A8()
{
  return type metadata accessor for ManagedAudioChannelLayout();
}

uint64_t sub_1000097B8()
{
  return _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)();
}

NSDictionary sub_1000097C8()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_1000097D8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000097E8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000097F8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100009808()
{
  return String.hash(into:)();
}

uint64_t sub_100009818()
{
  return String.Index.utf16Offset<A>(in:)();
}

uint64_t sub_100009828()
{
  return String.count.getter();
}

uint64_t sub_100009838()
{
  return String.index(_:offsetBy:)();
}

Swift::Int sub_100009848()
{
  return String.UTF16View._foreignCount()();
}

uint64_t sub_100009858()
{
  return String.UTF16View._nativeGetOffset(for:)();
}

uint64_t sub_100009868()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100009878()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100009888()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009898()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000098A8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000098B8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000098C8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000098D8()
{
  return type metadata accessor for CMFormatDescriptionRef.Extensions();
}

NSNumber sub_1000098E8(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_1000098F8()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

Swift::Int sub_100009908(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100009918()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100009928()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100009938()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100009948()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100009958()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100009968()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100009978()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100009988()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100009998()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000099A8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000099B8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000099C8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000099D8()
{
  return Hasher.init(_seed:)();
}

void sub_1000099E8(Swift::UInt64 a1)
{
}

Swift::Int sub_1000099F8()
{
  return Hasher._finalize()();
}

uint64_t AXTTSLogKona()
{
  return _AXTTSLogKona();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}