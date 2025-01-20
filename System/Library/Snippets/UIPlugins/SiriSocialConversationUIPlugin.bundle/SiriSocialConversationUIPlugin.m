uint64_t sub_3FBC()
{
  uint64_t v0;
  id v1;
  void *v3;
  uint64_t v4;

  v3 = *(void **)(v0 + *(int *)(type metadata accessor for ButtonStackView() + 20));
  v1 = v3;
  sub_19764();
  sub_40B0();
  v4 = sub_19584();

  return v4;
}

uint64_t type metadata accessor for ButtonStackView()
{
  uint64_t v1 = qword_20150;
  if (!qword_20150) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t sub_40B0()
{
  uint64_t v2 = qword_20098;
  if (!qword_20098)
  {
    sub_19764();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20098);
    return WitnessTable;
  }
  return v2;
}

void sub_4134(uint64_t a1)
{
  uint64_t v38 = a1;
  uint64_t v44 = 0;
  uint64_t v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = sub_194E4();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = v33 - 8;
  unint64_t v36 = (*(void *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v37 = (char *)v12 - v36;
  uint64_t v44 = v2;
  uint64_t v43 = v1;
  v39 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  v3 = (uint64_t *)(v38 + v39[5]);
  uint64_t v40 = *v3;
  uint64_t v41 = v3[1];
  swift_bridgeObjectRetain();
  int v42 = sub_197C4();
  swift_bridgeObjectRelease();
  if (v42)
  {
    v7 = (uint64_t *)(v38 + v39[8]);
    uint64_t v19 = *v7;
    uint64_t v20 = v7[1];
    swift_bridgeObjectRetain();
    int v21 = sub_197C4();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      v12[1] = 0;
      uint64_t v8 = v31 + *(int *)(type metadata accessor for ButtonStackView() + 20);
      id v13 = *(id *)v8;
      v12[2] = *(void *)(v8 + 8);
      id v9 = v13;
      v12[3] = sub_19764();
      sub_40B0();
      id v18 = (id)sub_19584();

      v10 = (uint64_t *)(v38 + v39[8]);
      uint64_t v16 = *v10;
      uint64_t v17 = v10[1];
      swift_bridgeObjectRetain();
      uint64_t v14 = variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel.text();
      uint64_t v15 = v11;
      variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel.text();
      sub_194D4();
      sub_19744();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v4 = v31 + *(int *)(type metadata accessor for ButtonStackView() + 20);
    id v25 = *(id *)v4;
    uint64_t v23 = *(void *)(v4 + 8);
    id v5 = v25;
    uint64_t v24 = sub_19764();
    sub_40B0();
    id v30 = (id)sub_19584();

    v6 = (uint64_t *)(v38 + v39[5]);
    uint64_t v26 = *v6;
    uint64_t v29 = v6[1];
    swift_bridgeObjectRetain();
    uint64_t v28 = *(void *)(v38 + v39[6]);
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_19884();
    sub_19754();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel.text()
{
  return sub_197A4("", 0, 1);
}

uint64_t sub_44E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v19 = sub_5FFC;
  id v30 = 0;
  uint64_t v29 = 0;
  uint64_t v1 = type metadata accessor for ButtonStackView();
  uint64_t v8 = *(void *)(v1 - 8);
  uint64_t v13 = v8;
  uint64_t v14 = *(void *)(v8 + 64);
  unint64_t v9 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  uint64_t v16 = (uint64_t)&v7 - v9;
  uint64_t v26 = sub_47B8(&qword_200A0);
  uint64_t v20 = *(void *)(v26 - 8);
  uint64_t v21 = v26 - 8;
  unint64_t v11 = (*(void *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v10);
  uint64_t v24 = (uint64_t)&v7 - v11;
  unint64_t v12 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v25 = (uint64_t)&v7 - v12;
  id v30 = (char *)&v7 - v12;
  uint64_t v29 = v4;
  sub_5CEC(v4, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v17 = swift_allocObject();
  sub_5F34(v16, v17 + v15);
  uint64_t v18 = sub_47B8(&qword_200B0);
  sub_6074();
  sub_196D4();
  unint64_t v23 = sub_61E0();
  sub_617C(v24, v26, v25);
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  uint64_t v27 = v20 + 8;
  v28(v24, v26);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v24, v25, v26);
  sub_617C(v24, v26, v22);
  v28(v24, v26);
  return ((uint64_t (*)(uint64_t, uint64_t))v28)(v25, v26);
}

uint64_t sub_47B8(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_4828@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v104 = a2;
  uint64_t v172 = a1;
  uint64_t v163 = 0;
  v105 = &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>;
  v106 = sub_8C28;
  v107 = sub_98E8;
  v108 = sub_9AEC;
  v204 = 0;
  v203 = 0;
  v202 = 0;
  v201 = 0;
  v200 = 0;
  v199 = 0;
  v198 = 0;
  v197 = 0;
  v196 = 0;
  uint64_t v195 = 0;
  uint64_t v109 = sub_47B8(&qword_20190);
  uint64_t v110 = *(void *)(v109 - 8);
  uint64_t v111 = v109 - 8;
  unint64_t v112 = (*(void *)(v110 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(0);
  uint64_t v113 = (uint64_t)v41 - v112;
  unint64_t v114 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v115 = (uint64_t)v41 - v114;
  unint64_t v116 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v117 = (uint64_t)v41 - v116;
  v204 = (char *)v41 - v116;
  uint64_t v118 = sub_196F4();
  uint64_t v119 = *(void *)(v118 - 8);
  uint64_t v120 = v118 - 8;
  unint64_t v121 = (*(void *)(v119 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v118);
  uint64_t v122 = (uint64_t)v41 - v121;
  unint64_t v123 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v41 - v121);
  uint64_t v124 = (uint64_t)v41 - v123;
  unint64_t v125 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v41 - v123);
  uint64_t v126 = (uint64_t)v41 - v125;
  v203 = (char *)v41 - v125;
  uint64_t v127 = sub_47B8(&qword_20198);
  v128 = *(void **)(v127 - 8);
  uint64_t v129 = v127 - 8;
  unint64_t v130 = (v128[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __chkstk_darwin(v163);
  v131 = (char *)v41 - v130;
  v202 = (char *)v41 - v130;
  unint64_t v132 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v8);
  v133 = (char *)v41 - v132;
  v201 = (char *)v41 - v132;
  uint64_t v134 = type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  unint64_t v135 = (*(void *)(*(void *)(v134 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v163);
  uint64_t v136 = (uint64_t)v41 - v135;
  uint64_t v10 = type metadata accessor for ButtonStackView();
  uint64_t v137 = *(void *)(v10 - 8);
  uint64_t v138 = v137;
  uint64_t v139 = *(void *)(v137 + 64);
  unint64_t v140 = (v139 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  uint64_t v141 = (uint64_t)v41 - v140;
  unint64_t v142 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v41 - v140);
  uint64_t v143 = (uint64_t)v41 - v142;
  uint64_t v144 = sub_47B8(&qword_201A0);
  unint64_t v145 = (*(void *)(*(void *)(v144 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = __chkstk_darwin(v163);
  uint64_t v146 = (uint64_t)v41 - v145;
  unint64_t v147 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v12);
  uint64_t v148 = (uint64_t)v41 - v147;
  v200 = (char *)v41 - v147;
  uint64_t v149 = sub_19714();
  uint64_t v150 = *(void *)(v149 - 8);
  uint64_t v151 = v149 - 8;
  unint64_t v152 = (*(void *)(v150 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v149);
  uint64_t v153 = (uint64_t)v41 - v152;
  unint64_t v154 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v41 - v152);
  uint64_t v155 = (uint64_t)v41 - v154;
  v199 = (char *)v41 - v154;
  uint64_t v156 = sub_47B8(&qword_201A8);
  unint64_t v157 = (*(void *)(*(void *)(v156 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = __chkstk_darwin(v163);
  v158 = (char *)v41 - v157;
  unint64_t v159 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = __chkstk_darwin(v15);
  v160 = (char *)v41 - v159;
  unint64_t v161 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v17);
  v162 = (char *)v41 - v161;
  v198 = (char *)v41 - v161;
  uint64_t v164 = sub_19724();
  uint64_t v165 = *(void *)(v164 - 8);
  uint64_t v166 = v164 - 8;
  unint64_t v167 = (*(void *)(v165 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v19 = __chkstk_darwin(v163);
  uint64_t v168 = (uint64_t)v41 - v167;
  unint64_t v169 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v19);
  uint64_t v170 = (uint64_t)v41 - v169;
  v197 = (char *)v41 - v169;
  uint64_t v180 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  unint64_t v171 = (*(void *)(*(void *)(v180 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v180);
  uint64_t v181 = (uint64_t)v41 - v171;
  uint64_t v173 = sub_47B8(&qword_201B0);
  unint64_t v174 = (*(void *)(*(void *)(v173 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v21 = __chkstk_darwin(v172);
  v175 = (char *)v41 - v174;
  unint64_t v176 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = __chkstk_darwin(v21);
  v177 = (char *)v41 - v176;
  unint64_t v178 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v25 = __chkstk_darwin(v23);
  v179 = (char *)v41 - v178;
  v196 = (char *)v41 - v178;
  uint64_t v195 = v25;
  sub_7528(v25, v26);
  int v182 = *(unsigned __int8 *)(v181 + *(int *)(v180 + 24));
  sub_7824(v181);
  if (v182)
  {
    unsigned int v100 = 1;
    uint64_t v99 = sub_197A4("com.apple.siri", 0xEuLL, 1);
    uint64_t v98 = v27;
    sub_6170();
    sub_19734();
    unint64_t v101 = sub_85B0();
    sub_617C(v168, v164, v170);
    v103 = *(void (**)(uint64_t, uint64_t))(v165 + 8);
    uint64_t v102 = v165 + 8;
    v103(v168, v164);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v165 + 16))(v168, v170, v164);
    sub_617C(v168, v164, (uint64_t)v175);
    v103(v168, v164);
    (*(void (**)(char *, void, void, uint64_t))(v165 + 56))(v175, 0, v100, v164);
    sub_6264(v175, v164, v177);
    sub_8634((uint64_t)v175);
    sub_86E4(v177, v179);
    v103(v170, v164);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v165 + 56))(v175, 1, 1, v164);
    sub_85B0();
    sub_6264(v175, v164, v177);
    sub_8634((uint64_t)v175);
    sub_86E4(v177, v179);
  }
  sub_7528(v172, v181);
  uint64_t v28 = (uint64_t *)(v181 + *(int *)(v180 + 20));
  uint64_t v95 = *v28;
  uint64_t v96 = v28[1];
  swift_bridgeObjectRetain();
  sub_7824(v181);
  int v97 = sub_197C4();
  swift_bridgeObjectRelease();
  if (v97)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v150 + 56))(v158, 1, 1, v149);
    sub_880C();
    sub_6264(v158, v149, v160);
    sub_8890((uint64_t)v158);
    sub_8940(v160, v162);
  }
  else
  {
    sub_7528(v172, v181);
    uint64_t v29 = (uint64_t *)(v181 + *(int *)(v180 + 20));
    uint64_t v90 = *v29;
    uint64_t v91 = v29[1];
    swift_bridgeObjectRetain();
    sub_7824(v181);
    v185 = &type metadata for String;
    v186 = &protocol witness table for String;
    uint64_t v183 = v90;
    uint64_t v184 = v91;
    sub_19704();
    unint64_t v92 = sub_880C();
    sub_617C(v153, v149, v155);
    v94 = *(void (**)(uint64_t, uint64_t))(v150 + 8);
    uint64_t v93 = v150 + 8;
    v94(v153, v149);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v150 + 16))(v153, v155, v149);
    sub_617C(v153, v149, (uint64_t)v158);
    v94(v153, v149);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v150 + 56))(v158, 0, 1, v149);
    sub_6264(v158, v149, v160);
    sub_8890((uint64_t)v158);
    sub_8940(v160, v162);
    v94(v155, v149);
  }
  sub_7528(v172, v181);
  uint64_t v87 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
  sub_7824(v181);
  uint64_t v88 = sub_197D4();
  swift_bridgeObjectRelease();
  BOOL v89 = v88 != 2;
  sub_5CEC(v172, v143);
  if (v89)
  {
    int v86 = 0;
  }
  else
  {
    sub_7528(v143, v181);
    uint64_t v84 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
    sub_7824(v181);
    sub_19804();
    swift_bridgeObjectRelease();
    int v85 = *(unsigned __int8 *)(v136 + *(int *)(v134 + 28));
    sub_9718(v136);
    int v86 = v85 ^ 1;
  }
  int v83 = v86;
  sub_8A68(v143);
  if (v83)
  {
    sub_7528(v172, v181);
    uint64_t v57 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
    sub_7824(v181);
    sub_19804();
    swift_bridgeObjectRelease();
    uint64_t v30 = SiriSocialConversationDataModels.ButtonModel.label.getter();
    uint64_t v31 = v181;
    uint64_t v58 = v30;
    uint64_t v59 = v32;
    sub_9718(v136);
    v62 = v190;
    v190[0] = v58;
    v190[1] = v59;
    sub_5CEC(v172, v141);
    uint64_t v66 = *(unsigned int *)(v138 + 80);
    unint64_t v60 = (v66 + 16) & ~(unint64_t)v66;
    uint64_t v67 = 7;
    uint64_t v61 = swift_allocObject();
    sub_5F34(v141, v61 + v60);
    unint64_t v71 = sub_9950();
    v70 = &type metadata for String;
    sub_19684();
    sub_7528(v172, v31);
    uint64_t v63 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
    sub_7824(v181);
    sub_19804();
    swift_bridgeObjectRelease();
    uint64_t v64 = SiriSocialConversationDataModels.ButtonModel.label.getter();
    uint64_t v65 = v33;
    sub_9718(v136);
    v72 = v189;
    v189[0] = v64;
    v189[1] = v65;
    sub_5CEC(v172, v141);
    unint64_t v68 = (v66 + 16) & ~(unint64_t)v66;
    uint64_t v69 = swift_allocObject();
    sub_5F34(v141, v69 + v68);
    sub_19684();
    v77 = v188;
    v188[3] = v127;
    unint64_t v73 = sub_9B54();
    v188[4] = v73;
    uint64_t v34 = sub_9BD8(v77);
    v75 = (void (*)(uint64_t *, char *, uint64_t))v128[2];
    v74 = v128 + 2;
    v75(v34, v131, v127);
    v76 = v187;
    v187[3] = v127;
    v187[4] = v73;
    uint64_t v35 = sub_9BD8(v187);
    v75(v35, v133, v127);
    sub_196E4();
    unint64_t v78 = sub_8FC0();
    sub_617C(v124, v118, v126);
    v80 = *(void (**)(uint64_t, uint64_t))(v119 + 8);
    uint64_t v79 = v119 + 8;
    v80(v124, v118);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v119 + 16))(v122, v126, v118);
    sub_617C(v122, v118, v124);
    v80(v122, v118);
    unint64_t v36 = sub_8EBC();
    sub_652C(v124, v118, v109, v78, v36, v146);
    v80(v124, v118);
    sub_9044(v146, v148);
    v80(v126, v118);
    v82 = (void (*)(char *, uint64_t))v128[1];
    v81 = v128 + 1;
    v82(v131, v127);
    v82(v133, v127);
  }
  else
  {
    sub_7528(v172, v181);
    uint64_t v43 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
    sub_7824(v181);
    v53 = &v194;
    uint64_t v194 = v43;
    uint64_t KeyPath = swift_getKeyPath();
    sub_5CEC(v172, v141);
    unint64_t v44 = (*(unsigned __int8 *)(v138 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80);
    uint64_t v48 = swift_allocObject();
    sub_5F34(v141, v48 + v44);
    uint64_t v49 = sub_47B8(&qword_201C8);
    uint64_t v50 = sub_47B8(&qword_201D0);
    unint64_t v51 = sub_8CAC();
    unint64_t v52 = sub_8D30();
    uint64_t v45 = sub_196C4();
    unint64_t v46 = sub_8DB4();
    unint64_t v37 = sub_8E38();
    v193[3] = v127;
    v193[4] = v45;
    v193[5] = v46;
    v193[6] = v37;
    swift_getOpaqueTypeConformance2();
    sub_19694();
    unint64_t v54 = sub_8EBC();
    sub_617C(v115, v109, v117);
    v56 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
    uint64_t v55 = v110 + 8;
    v56(v115, v109);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v110 + 16))(v113, v117, v109);
    sub_617C(v113, v109, v115);
    v56(v113, v109);
    unint64_t v38 = sub_8FC0();
    sub_6C94(v115, v118, v109, v38, v54, v146);
    v56(v115, v109);
    sub_9044(v146, v148);
    v56(v117, v109);
  }
  sub_913C(v179, v177);
  int v42 = v193;
  v193[0] = v177;
  sub_9264(v162, v160);
  v193[1] = v160;
  sub_938C(v148, v146);
  v193[2] = v146;
  v41[0] = (uint64_t)v192;
  v192[0] = v173;
  v192[1] = v156;
  v192[2] = v144;
  unint64_t v39 = sub_9484();
  v41[1] = (uint64_t)v191;
  v191[0] = v39;
  v191[1] = sub_9518();
  v191[2] = sub_95AC();
  sub_6D8C((uint64_t)v42, 3uLL, v41[0], v104);
  sub_9650(v146);
  sub_8890((uint64_t)v160);
  sub_8634((uint64_t)v177);
  sub_9650(v148);
  sub_8890((uint64_t)v162);
  return sub_8634((uint64_t)v179);
}

uint64_t sub_5CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v9 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  uint64_t v3 = (void *)(a1 + *(int *)(v9 + 20));
  uint64_t v7 = (void *)(a2 + *(int *)(v9 + 20));
  void *v7 = *v3;
  uint64_t v8 = v3[1];
  swift_bridgeObjectRetain();
  v7[1] = v8;
  *(unsigned char *)(a2 + *(int *)(v9 + 24)) = *(unsigned char *)(a1 + *(int *)(v9 + 24));
  uint64_t v11 = *(int *)(type metadata accessor for ButtonStackView() + 20);
  uint64_t v12 = *(void **)(a1 + v11);
  id v4 = v12;
  uint64_t result = a2;
  uint64_t v6 = (void *)(a2 + v11);
  void *v6 = v12;
  v6[1] = *(void *)(a1 + v11 + 8);
  return result;
}

uint64_t sub_5E14()
{
  uint64_t v5 = type metadata accessor for ButtonStackView();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v4 = (v1 + 16) & ~v1;
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(void))(*(void *)(v2 - 8) + 8))();
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

__n128 sub_5F34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  *(_OWORD *)(a2 + *(int *)(v3 + 20)) = *(_OWORD *)(a1 + *(int *)(v3 + 20));
  *(unsigned char *)(a2 + *(int *)(v3 + 24)) = *(unsigned char *)(a1 + *(int *)(v3 + 24));
  uint64_t v4 = type metadata accessor for ButtonStackView();
  __n128 result = *(__n128 *)(a1 + *(int *)(v4 + 20));
  *(__n128 *)(a2 + *(int *)(v4 + 20)) = result;
  return result;
}

uint64_t sub_5FFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ButtonStackView();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));

  return sub_4828(v3, a1);
}

unint64_t sub_6074()
{
  uint64_t v2 = qword_200B8;
  if (!qword_200B8)
  {
    sub_60F8(&qword_200B0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_200B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_60F8(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

uint64_t sub_6170()
{
  return 0;
}

uint64_t sub_617C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1);
}

unint64_t sub_61E0()
{
  uint64_t v2 = qword_200C0;
  if (!qword_200C0)
  {
    sub_60F8(&qword_200A0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_200C0);
    return WitnessTable;
  }
  return v2;
}

void *sub_6264@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = sub_19834();
  return sub_A178(a1, a3, a2, v3);
}

uint64_t sub_62B0(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  unint64_t v4 = (*(void *)(*(void *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v11 = (uint64_t)&v3 - v4;
  unint64_t v5 = (*(void *)(*(void *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel() - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin(v6);
  uint64_t v7 = (uint64_t)&v3 - v5;
  uint64_t v12 = v1;
  sub_7528(v1, (uint64_t)&v3 - v5);
  uint64_t v10 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
  sub_7824(v7);
  sub_19804();
  swift_bridgeObjectRelease();
  sub_4134(v11);
  return sub_9718(v11);
}

uint64_t sub_63EC(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v11 = 0;
  v3[1] = 0;
  uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  unint64_t v4 = (*(void *)(*(void *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v10 = (uint64_t)v3 - v4;
  unint64_t v5 = (*(void *)(*(void *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel() - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin(v6);
  uint64_t v7 = (uint64_t)v3 - v5;
  uint64_t v11 = v1;
  sub_7528(v1, (uint64_t)v3 - v5);
  uint64_t v9 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
  sub_7824(v7);
  sub_19804();
  swift_bridgeObjectRelease();
  sub_4134(v10);
  return sub_9718(v10);
}

uint64_t sub_652C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11 = a6;
  v8[1] = a1;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v10 = sub_195A4();
  unint64_t v9 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  uint64_t v12 = (char *)v8 - v9;
  (*(void (**)(void))(*(void *)(v6 - 8) + 16))();
  swift_storeEnumTagMultiPayload();
  return sub_195B4();
}

uint64_t sub_6624@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a3;
  uint64_t v21 = a1;
  uint64_t v20 = a2;
  uint64_t v12 = 0;
  uint64_t v30 = sub_A090;
  uint64_t v43 = &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>;
  unint64_t v60 = 0;
  uint64_t v59 = 0;
  uint64_t v58 = 0;
  uint64_t v40 = sub_196C4();
  uint64_t v33 = *(void *)(v40 - 8);
  uint64_t v34 = v40 - 8;
  unint64_t v11 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v35 = (char *)&v10 - v11;
  uint64_t v13 = *(void *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() - 8);
  uint64_t v24 = v13;
  uint64_t v25 = *(void *)(v13 + 64);
  unint64_t v14 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v12);
  uint64_t v29 = (uint64_t)&v10 - v14;
  uint64_t v4 = type metadata accessor for ButtonStackView();
  uint64_t v15 = *(void *)(v4 - 8);
  uint64_t v22 = v15;
  uint64_t v23 = *(void *)(v15 + 64);
  unint64_t v16 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v27 = (uint64_t)&v10 - v16;
  uint64_t v39 = sub_47B8(&qword_20198);
  uint64_t v36 = *(void *)(v39 - 8);
  uint64_t v37 = v39 - 8;
  unint64_t v17 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v39);
  unint64_t v38 = (char *)&v10 - v17;
  uint64_t v50 = sub_47B8(&qword_201D0);
  uint64_t v44 = *(void *)(v50 - 8);
  uint64_t v45 = v50 - 8;
  unint64_t v18 = (*(void *)(v44 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v50);
  uint64_t v48 = (uint64_t)&v10 - v18;
  unint64_t v19 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v10 - v18);
  uint64_t v49 = (uint64_t)&v10 - v19;
  unint64_t v60 = (char *)&v10 - v19;
  uint64_t v59 = a1;
  uint64_t v58 = v6;
  uint64_t v7 = SiriSocialConversationDataModels.ButtonModel.label.getter();
  uint64_t v32 = v57;
  v57[0] = v7;
  v57[1] = v8;
  sub_5CEC(v20, v27);
  sub_9C64(v21, v29);
  unint64_t v26 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v28 = (v26 + v23 + *(unsigned __int8 *)(v24 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v31 = swift_allocObject();
  sub_5F34(v27, v31 + v26);
  sub_9FC8(v29, v31 + v28);
  sub_9950();
  sub_19684();
  sub_195C4();
  unint64_t v41 = sub_8DB4();
  unint64_t v42 = sub_8E38();
  sub_19654();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v40);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v39);
  uint64_t v53 = v39;
  uint64_t v54 = v40;
  unint64_t v55 = v41;
  unint64_t v56 = v42;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_617C(v48, v50, v49);
  unint64_t v52 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
  uint64_t v51 = v44 + 8;
  v52(v48, v50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v48, v49, v50);
  sub_617C(v48, v50, v46);
  v52(v48, v50);
  return ((uint64_t (*)(uint64_t, uint64_t))v52)(v49, v50);
}

void sub_6C4C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_6C94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11 = a6;
  v8[1] = a1;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v10 = sub_195A4();
  unint64_t v9 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  uint64_t v12 = (char *)v8 - v9;
  (*(void (**)(void))(*(void *)(v6 - 8) + 16))();
  swift_storeEnumTagMultiPayload();
  return sub_195B4();
}

uint64_t *sub_6D8C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v25 = a1;
  unint64_t v26 = a2;
  uint64_t v27 = a3;
  unint64_t v28 = a3 & 0xFFFFFFFFFFFFFFFELL;
  if (a2 == 1)
  {
    uint64_t TupleTypeMetadata = *(void *)(v27 & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    unint64_t v19 = &v9;
    unint64_t v20 = (8 * v26 + 15) & 0xFFFFFFFFFFFFFFF0;
    __chkstk_darwin();
    uint64_t v21 = (char *)&v9 - v20;
    for (unint64_t i = v4; ; unint64_t i = v5 + 1)
    {
      unint64_t v18 = i;
      if (i >= v26) {
        break;
      }
      unint64_t v5 = v18;
      *(void *)&v21[8 * v18] = *(void *)((v27 & 0xFFFFFFFFFFFFFFFELL) + 8 * v18);
    }
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  uint64_t v14 = TupleTypeMetadata;
  uint64_t v6 = *(void *)(*(void *)(TupleTypeMetadata - 8) + 64);
  uint64_t v15 = &v9;
  unint64_t v16 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  uint64_t v17 = (char *)&v9 - v16;
  if (v7)
  {
    for (uint64_t j = 0; ; uint64_t j = v9)
    {
      uint64_t v11 = j;
      uint64_t v12 = *(void *)((v27 & 0xFFFFFFFFFFFFFFFELL) + 8 * j);
      int v10 = v26 == 1 ? 0 : *(_DWORD *)(v14 + 24 + 16 * v11 + 8);
      (*(void (**)(char *, void))(*(void *)(v12 - 8) + 16))(&v17[v10], *(void *)(v25 + 8 * v11));
      uint64_t v9 = v11 + 1;
      if (v11 + 1 == v26) {
        break;
      }
    }
  }
  sub_196A4();
  return v15;
}

uint64_t sub_6FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_8500(a1, a2);
  uint64_t v5 = *(int *)(type metadata accessor for ButtonStackView() + 20);
  sub_19764();
  sub_40B0();
  uint64_t result = sub_19594();
  uint64_t v3 = (uint64_t *)(a2 + v5);
  uint64_t *v3 = result;
  v3[1] = v4;
  return result;
}

uint64_t sub_706C()
{
  return sub_19634();
}

uint64_t sub_7084()
{
  return sub_19644();
}

uint64_t sub_709C()
{
  return sub_19664();
}

uint64_t sub_70B8@<X0>(uint64_t a1@<X8>)
{
  return sub_44E4(a1);
}

uint64_t sub_70D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  Builtin::Word v32 = 0;
  uint64_t v33 = sub_75FC;
  uint64_t v49 = 0;
  uint64_t v48 = 0;
  uint64_t v44 = sub_47B8(&qword_200C8);
  uint64_t v38 = *(void *)(v44 - 8);
  uint64_t v39 = v44 - 8;
  unint64_t v14 = (*(void *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = __chkstk_darwin(0);
  uint64_t v42 = (uint64_t)&v14 - v14;
  unint64_t v15 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  uint64_t v43 = (uint64_t)&v14 - v15;
  uint64_t v49 = (char *)&v14 - v15;
  uint64_t v34 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  unint64_t v16 = (*(void *)(*(void *)(v34 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v32);
  uint64_t v37 = (uint64_t)&v14 - v16;
  unint64_t v17 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v47 = (uint64_t)&v14 - v17;
  uint64_t v48 = (char *)&v14 - v17;
  uint64_t v28 = type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  uint64_t v27 = sub_19934();
  uint64_t v19 = v5;
  int v18 = 1;
  uint64_t v26 = sub_197A4("Okay", 4uLL, 1);
  uint64_t v20 = v6;
  uint64_t v21 = sub_197A4("", v32, v18 & 1);
  uint64_t v22 = v7;
  uint64_t v23 = variable initialization expression of SiriSocialConversationDataModels.ButtonModel.userData();
  uint64_t v24 = variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel.text();
  uint64_t v25 = v8;
  char v9 = sub_6170();
  SiriSocialConversationDataModels.ButtonModel.init(label:directInvocation:userData:link:separated:)(v26, v20, v21, v22, v23, v24, v25, v9 & 1, v19);
  uint64_t v10 = v27;
  sub_74D8();
  uint64_t v31 = v10;
  uint64_t v29 = variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel.text();
  uint64_t v30 = v11;
  char v12 = variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel.sash();
  SiriSocialConversationDataModels.ButtonStackModel.init(buttons:text:sash:)(v31, v29, v30, v12 & 1, v47);
  sub_7528(v47, v37);
  uint64_t v35 = type metadata accessor for ButtonStackView();
  unint64_t v36 = sub_7698();
  sub_771C();
  sub_196B4();
  unint64_t v41 = sub_77A0();
  sub_617C(v42, v44, v43);
  uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  uint64_t v45 = v38 + 8;
  v46(v42, v44);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v42, v43, v44);
  sub_617C(v42, v44, v40);
  v46(v42, v44);
  v46(v43, v44);
  return sub_7824(v47);
}

uint64_t variable initialization expression of SiriSocialConversationDataModels.ButtonModel.userData()
{
  return sub_19774();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_74D8()
{
}

uint64_t variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel.sash()
{
  return 1;
}

uint64_t sub_7528(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  uint64_t v3 = (void *)(a1 + *(int *)(v8 + 20));
  uint64_t v6 = (void *)(a2 + *(int *)(v8 + 20));
  void *v6 = *v3;
  uint64_t v7 = v3[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  v6[1] = v7;
  *(unsigned char *)(a2 + *(int *)(v8 + 24)) = *(unsigned char *)(a1 + *(int *)(v8 + 24));
  return result;
}

uint64_t sub_75FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = a2;
  uint64_t v4 = a1;
  uint64_t v8 = 0;
  unint64_t v5 = (*(void *)(*(void *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel() - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (uint64_t)&v3 - v5;
  uint64_t v8 = __chkstk_darwin(v4);
  sub_7528(v8, (uint64_t)&v3 - v5);
  return sub_6FFC(v7, v6);
}

unint64_t sub_7698()
{
  uint64_t v2 = qword_200D0;
  if (!qword_200D0)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_200D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_771C()
{
  uint64_t v2 = qword_200D8;
  if (!qword_200D8)
  {
    type metadata accessor for ButtonStackView();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_200D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_77A0()
{
  uint64_t v2 = qword_200E0;
  if (!qword_200E0)
  {
    sub_60F8(&qword_200C8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_200E0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_7824(uint64_t a1)
{
  uint64_t v1 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_78A4@<X0>(uint64_t a1@<X8>)
{
  return sub_70D0(a1);
}

uint64_t sub_78BC()
{
  return sub_19554();
}

uint64_t sub_78D4()
{
  return sub_19574();
}

unint64_t sub_790C()
{
  uint64_t v2 = qword_200E8;
  if (!qword_200E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_200E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_798C()
{
  return sub_19564();
}

uint64_t variable initialization expression of SiriSocialConversationDataModels.ButtonStackModel._buttons()
{
  return sub_19934();
}

unint64_t sub_79F8(void *a1, void *a2, uint64_t a3)
{
  int v18 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v18 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    swift_retain();
    *a1 = v13;
    return *a1 + ((v18 + 16) & ~(unint64_t)v18);
  }
  else
  {
    uint64_t v3 = sub_47B8(&qword_200A8);
    (*(void (**)(void *, void *))(*(void *)(v3 - 8) + 16))(a1, a2);
    uint64_t v7 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    uint64_t v8 = (void *)((char *)a1 + *(int *)(v7 + 20));
    uint64_t v4 = (void *)((char *)a2 + *(int *)(v7 + 20));
    *uint64_t v8 = *v4;
    uint64_t v9 = v4[1];
    swift_bridgeObjectRetain();
    v8[1] = v9;
    *((unsigned char *)a1 + *(int *)(v7 + 24)) = *((unsigned char *)a2 + *(int *)(v7 + 24));
    char v12 = (void *)((char *)a1 + *(int *)(a3 + 20));
    uint64_t v11 = (char *)a2 + *(int *)(a3 + 20);
    id v10 = *(id *)v11;
    id v5 = *(id *)v11;
    *char v12 = v10;
    v12[1] = *((void *)v11 + 1);
    return (unint64_t)a1;
  }
}

void sub_7BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();
}

uint64_t sub_7C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  uint64_t v10 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  uint64_t v4 = *(int *)(v10 + 20);
  uint64_t v8 = a1 + v4;
  *(void *)(a1 + v4) = *(void *)(a2 + v4);
  uint64_t v9 = *(void *)(a2 + v4 + 8);
  swift_bridgeObjectRetain();
  *(void *)(v8 + 8) = v9;
  *(unsigned char *)(a1 + *(int *)(v10 + 24)) = *(unsigned char *)(a2 + *(int *)(v10 + 24));
  uint64_t v13 = *(int *)(a3 + 20);
  unint64_t v14 = *(void **)(a2 + v13);
  id v5 = v14;
  uint64_t result = a1;
  uint64_t v7 = (void *)(a1 + v13);
  void *v7 = v14;
  v7[1] = *(void *)(a2 + v13 + 8);
  return result;
}

uint64_t sub_7D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  uint64_t v10 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  uint64_t v4 = *(int *)(v10 + 20);
  uint64_t v8 = a1 + v4;
  *(void *)(a1 + v4) = *(void *)(a2 + v4);
  uint64_t v9 = *(void *)(a2 + v4 + 8);
  swift_bridgeObjectRetain();
  *(void *)(v8 + 8) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(v10 + 24)) = *(unsigned char *)(a2 + *(int *)(v10 + 24)) & 1;
  uint64_t v5 = *(int *)(a3 + 20);
  unint64_t v16 = (void *)(a1 + v5);
  unint64_t v14 = *(void **)(a1 + v5);
  uint64_t v15 = a2 + v5;
  uint64_t v13 = *(void **)(a2 + v5);
  id v6 = v13;
  *unint64_t v16 = v13;

  uint64_t result = a1;
  v16[1] = *(void *)(v15 + 8);
  return result;
}

__n128 sub_7E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  *(_OWORD *)(a1 + *(int *)(v4 + 20)) = *(_OWORD *)(a2 + *(int *)(v4 + 20));
  *(unsigned char *)(a1 + *(int *)(v4 + 24)) = *(unsigned char *)(a2 + *(int *)(v4 + 24));
  __n128 result = *(__n128 *)(a2 + *(int *)(a3 + 20));
  *(__n128 *)(a1 + *(int *)(a3 + 20)) = result;
  return result;
}

uint64_t sub_7F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  uint64_t v10 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  uint64_t v4 = *(int *)(v10 + 20);
  uint64_t v5 = (void *)(a2 + v4);
  id v6 = (void *)(a1 + v4);
  void *v6 = *v5;
  v6[1] = v5[1];
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + *(int *)(v10 + 24)) = *(unsigned char *)(a2 + *(int *)(v10 + 24)) & 1;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v14 = a1 + v7;
  uint64_t v8 = *(void **)(a1 + v7);
  uint64_t v13 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t result = a1;
  *(void *)(v14 + 8) = *(void *)(v13 + 8);
  return result;
}

uint64_t sub_8054()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_807C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v10 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  if (a2 == *(_DWORD *)(*(void *)(v10 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v10 - 8) + 48))(a1, a2, v10);
  }
  else if (a2 == 2147483646)
  {
    int v5 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20)) < 0x100000000uLL) {
      int v5 = *(void *)(a1 + *(int *)(a3 + 20));
    }
    int v3 = v5 - 1;
    if (v5 - 1 < 0) {
      int v3 = -1;
    }
    return (v3 + 1);
  }
  else
  {
    __break(1u);
  }
  return v6;
}

uint64_t sub_81B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_81E0(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 2147483646) {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_82DC()
{
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

void *type metadata accessor for ButtonStackView_Previews()
{
  return &unk_1C8D8;
}

unint64_t sub_83D0()
{
  return sub_61E0();
}

unint64_t sub_83E8()
{
  return sub_77A0();
}

unint64_t sub_8400()
{
  return sub_8418();
}

unint64_t sub_8418()
{
  uint64_t v2 = qword_20188;
  if (!qword_20188)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20188);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_8498()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_84CC()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_8500(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  __n128 result = *(__n128 *)(a1 + *(int *)(v3 + 20));
  *(__n128 *)(a2 + *(int *)(v3 + 20)) = result;
  *(unsigned char *)(a2 + *(int *)(v3 + 24)) = *(unsigned char *)(a1 + *(int *)(v3 + 24));
  return result;
}

void sub_85A4()
{
  *unint64_t v0 = *v0;
}

unint64_t sub_85B0()
{
  uint64_t v2 = qword_201B8;
  if (!qword_201B8)
  {
    sub_19724();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_201B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_8634(uint64_t a1)
{
  uint64_t v3 = sub_19724();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void *sub_86E4(const void *a1, void *a2)
{
  uint64_t v6 = sub_19724();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_47B8(&qword_201B0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

unint64_t sub_880C()
{
  uint64_t v2 = qword_201C0;
  if (!qword_201C0)
  {
    sub_19714();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_201C0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_8890(uint64_t a1)
{
  uint64_t v3 = sub_19714();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void *sub_8940(const void *a1, void *a2)
{
  uint64_t v6 = sub_19714();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_47B8(&qword_201A8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_8A68(uint64_t a1)
{
  uint64_t v1 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t sub_8B08()
{
  uint64_t v5 = type metadata accessor for ButtonStackView();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v4 = (v1 + 16) & ~v1;
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(void))(*(void *)(v2 - 8) + 8))();
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_8C28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = type metadata accessor for ButtonStackView();
  uint64_t v4 = v2
     + ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80));

  return sub_6624(a1, v4, a2);
}

unint64_t sub_8CAC()
{
  uint64_t v2 = qword_201D8;
  if (!qword_201D8)
  {
    sub_60F8(&qword_201C8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_201D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_8D30()
{
  uint64_t v2 = qword_201E0;
  if (!qword_201E0)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_201E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_8DB4()
{
  uint64_t v2 = qword_201E8;
  if (!qword_201E8)
  {
    sub_60F8(&qword_20198);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_201E8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_8E38()
{
  uint64_t v2 = qword_201F0;
  if (!qword_201F0)
  {
    sub_196C4();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_201F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_8EBC()
{
  uint64_t v2 = qword_201F8;
  if (!qword_201F8)
  {
    sub_60F8(&qword_20190);
    sub_60F8(&qword_20198);
    sub_196C4();
    sub_8DB4();
    sub_8E38();
    swift_getOpaqueTypeConformance2();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_201F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_8FC0()
{
  uint64_t v2 = qword_20200;
  if (!qword_20200)
  {
    sub_196F4();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20200);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_9044(uint64_t a1, uint64_t a2)
{
  sub_47B8(&qword_20208);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = sub_47B8(&qword_20190);
  }
  else {
    uint64_t v2 = sub_196F4();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  swift_storeEnumTagMultiPayload();
  return a2;
}

void *sub_913C(const void *a1, void *a2)
{
  uint64_t v6 = sub_19724();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_47B8(&qword_201B0);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

void *sub_9264(const void *a1, void *a2)
{
  uint64_t v6 = sub_19714();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = sub_47B8(&qword_201A8);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_938C(uint64_t a1, uint64_t a2)
{
  sub_47B8(&qword_20208);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = sub_47B8(&qword_20190);
  }
  else {
    uint64_t v2 = sub_196F4();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  swift_storeEnumTagMultiPayload();
  return a2;
}

unint64_t sub_9484()
{
  uint64_t v2 = qword_20210;
  if (!qword_20210)
  {
    sub_60F8(&qword_201B0);
    sub_85B0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20210);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_9518()
{
  uint64_t v2 = qword_20218;
  if (!qword_20218)
  {
    sub_60F8(&qword_201A8);
    sub_880C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20218);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_95AC()
{
  uint64_t v2 = qword_20220;
  if (!qword_20220)
  {
    sub_60F8(&qword_201A0);
    sub_8FC0();
    sub_8EBC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20220);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_9650(uint64_t a1)
{
  sub_47B8(&qword_20208);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v1 = sub_47B8(&qword_20190);
  }
  else {
    uint64_t v1 = sub_196F4();
  }
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_9718(uint64_t a1)
{
  uint64_t v1 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_97C8()
{
  uint64_t v5 = type metadata accessor for ButtonStackView();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v4 = (v1 + 16) & ~v1;
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(void))(*(void *)(v2 - 8) + 8))();
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_98E8()
{
  uint64_t v1 = *(void *)(type metadata accessor for ButtonStackView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_62B0(v2);
}

unint64_t sub_9950()
{
  uint64_t v2 = qword_20230;
  if (!qword_20230)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20230);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_99CC()
{
  uint64_t v5 = type metadata accessor for ButtonStackView();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v4 = (v1 + 16) & ~v1;
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(void))(*(void *)(v2 - 8) + 8))();
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_9AEC()
{
  uint64_t v1 = *(void *)(type metadata accessor for ButtonStackView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_63EC(v2);
}

unint64_t sub_9B54()
{
  uint64_t v2 = qword_20238;
  if (!qword_20238)
  {
    sub_60F8(&qword_20198);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20238);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_9BD8(uint64_t *result)
{
  uint64_t v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    __n128 result = v2;
    uint64_t *v3 = v1;
  }
  return result;
}

uint64_t sub_9C64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v11 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  uint64_t v3 = (void *)(a1 + v11[5]);
  uint64_t v6 = (void *)(a2 + v11[5]);
  void *v6 = *v3;
  uint64_t v7 = v3[1];
  swift_bridgeObjectRetain();
  v6[1] = v7;
  uint64_t v9 = v11[6];
  uint64_t v10 = *(void *)(a1 + v9);
  swift_bridgeObjectRetain();
  *(void *)(a2 + v9) = v10;
  *(unsigned char *)(a2 + v11[7]) = *(unsigned char *)(a1 + v11[7]);
  uint64_t v4 = v11[8];
  uint64_t v13 = a2 + v4;
  *(void *)(a2 + v4) = *(void *)(a1 + v4);
  uint64_t v14 = *(void *)(a1 + v4 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *(void *)(v13 + 8) = v14;
  return result;
}

uint64_t sub_9DA4()
{
  uint64_t v6 = type metadata accessor for ButtonStackView();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v5 = (v1 + 16) & ~v1;
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  uint64_t v2 = sub_47B8(&qword_200A8);
  (*(void (**)(void))(*(void *)(v2 - 8) + 8))();
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  swift_bridgeObjectRelease();

  uint64_t v3 = sub_47B8(&qword_20228);
  (*(void (**)(void))(*(void *)(v3 - 8) + 8))();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

__n128 sub_9FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  *(_OWORD *)(a2 + v3[5]) = *(_OWORD *)(a1 + v3[5]);
  *(void *)(a2 + v3[6]) = *(void *)(a1 + v3[6]);
  *(unsigned char *)(a2 + v3[7]) = *(unsigned char *)(a1 + v3[7]);
  __n128 result = *(__n128 *)(a1 + v3[8]);
  *(__n128 *)(a2 + v3[8]) = result;
  return result;
}

void sub_A090()
{
  uint64_t v3 = *(void *)(type metadata accessor for ButtonStackView() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v4 = v5 + *(void *)(v3 + 64);
  uint64_t v1 = *(void *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() - 8);
  uint64_t v2 = v0 + ((v4 + *(unsigned __int8 *)(v1 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_6C4C(v0 + v5, v2);
}

void *sub_A178(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v9 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(void *)(*(void *)(a4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a2, a1, a3);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, a3);
  }
  return a2;
}

uint64_t SiriSocialConversationUIPlugin.__allocating_init()()
{
  return SiriSocialConversationUIPlugin.deinit();
}

uint64_t SiriSocialConversationUIPlugin.deinit()
{
  return v0;
}

uint64_t SiriSocialConversationUIPlugin.snippet(for:mode:idiom:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v35 = a1;
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  uint64_t v39 = 0;
  uint64_t v44 = 0;
  uint64_t v43 = 0;
  uint64_t v28 = 0;
  uint64_t v18 = type metadata accessor for StoryView();
  unint64_t v19 = (*(void *)(*(void *)(v18 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v20 = (uint64_t)&v14 - v19;
  unint64_t v21 = (*(void *)(*(void *)(type metadata accessor for SiriSocialConversationDataModels.StoryDataModel() - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v28);
  uint64_t v22 = (uint64_t)&v14 - v21;
  unint64_t v23 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v4);
  uint64_t v24 = (char *)&v14 - v23;
  uint64_t v44 = (char *)&v14 - v23;
  uint64_t v25 = type metadata accessor for ButtonStackView();
  unint64_t v26 = (*(void *)(*(void *)(v25 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v28);
  uint64_t v27 = (uint64_t)&v14 - v26;
  unint64_t v29 = (*(void *)(*(void *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel() - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = __chkstk_darwin(v28);
  uint64_t v30 = (uint64_t)&v14 - v29;
  unint64_t v31 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v6);
  Builtin::Word v32 = (char *)&v14 - v31;
  uint64_t v43 = (char *)&v14 - v31;
  uint64_t v37 = type metadata accessor for SiriSocialConversationDataModels();
  unint64_t v36 = (*(void *)(*(void *)(v37 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __chkstk_darwin(v35);
  uint64_t v38 = (uint64_t)&v14 - v36;
  uint64_t v42 = v8;
  uint64_t v41 = v9;
  uint64_t v40 = v10;
  uint64_t v39 = v3;
  sub_A694(v8, (uint64_t)&v14 - v36);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = v20;
    sub_A83C(v38, (uint64_t)v24);
    uint64_t v44 = v24;
    sub_A8E8((uint64_t)v24, v22);
    sub_AC4C(v22, v12);
    sub_A994();
    uint64_t v15 = sub_19624();
    sub_AA18(v20);
    sub_AA18((uint64_t)v24);
    return v15;
  }
  else
  {
    uint64_t v11 = v27;
    sub_8500(v38, (uint64_t)v32);
    uint64_t v43 = v32;
    sub_7528((uint64_t)v32, v30);
    sub_6FFC(v30, v11);
    sub_771C();
    uint64_t v16 = sub_19624();
    sub_8A68(v27);
    sub_7824((uint64_t)v32);
    return v16;
  }
}

uint64_t sub_A694(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SiriSocialConversationDataModels();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_47B8(&qword_20240);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
    v7(a2, a1);
    uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a2 + *(int *)(v4 + 20), a1 + *(int *)(v4 + 20), v6);
  }
  else
  {
    uint64_t v2 = sub_47B8(&qword_200A8);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
    uint64_t v10 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    uint64_t v8 = (void *)(a2 + *(int *)(v10 + 20));
    uint64_t v3 = (void *)(a1 + *(int *)(v10 + 20));
    *uint64_t v8 = *v3;
    uint64_t v9 = v3[1];
    swift_bridgeObjectRetain();
    v8[1] = v9;
    *(unsigned char *)(a2 + *(int *)(v10 + 24)) = *(unsigned char *)(a1 + *(int *)(v10 + 24));
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_A83C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_47B8(&qword_20240);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);
  v6(a2, a1);
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  ((void (*)(uint64_t, uint64_t, uint64_t))v6)(a2 + *(int *)(v2 + 20), a1 + *(int *)(v2 + 20), v5);
  return a2;
}

uint64_t sub_A8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_47B8(&qword_20240);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  v6(a2, a1);
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  ((void (*)(uint64_t, uint64_t, uint64_t))v6)(a2 + *(int *)(v2 + 20), a1 + *(int *)(v2 + 20), v5);
  return a2;
}

unint64_t sub_A994()
{
  uint64_t v2 = qword_20248;
  if (!qword_20248)
  {
    type metadata accessor for StoryView();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20248);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_AA18(uint64_t a1)
{
  uint64_t v4 = sub_47B8(&qword_20240);
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v4 - 8) + 8);
  v3(a1);
  uint64_t v1 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  ((void (*)(uint64_t, uint64_t))v3)(a1 + *(int *)(v1 + 20), v4);
  return a1;
}

uint64_t SiriSocialConversationUIPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_AAF4()
{
  return sub_AB0C();
}

unint64_t sub_AB0C()
{
  uint64_t v2 = qword_20250;
  if (!qword_20250)
  {
    type metadata accessor for SiriSocialConversationDataModels();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20250);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_AB90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriSocialConversationUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_ABBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = SiriSocialConversationUIPlugin.snippet(for:mode:idiom:)(a1, a2, a3);
  if (v3) {
    return v5;
  }
  else {
    return v6;
  }
}

uint64_t type metadata accessor for SiriSocialConversationUIPlugin()
{
  return self;
}

uint64_t sub_AC4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_A83C(a1, a2);
}

uint64_t sub_AC68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v15 = sub_B40C;
  unint64_t v31 = 0;
  uint64_t v30 = 0;
  uint64_t v1 = type metadata accessor for StoryView();
  unint64_t v8 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v1);
  uint64_t v16 = (uint64_t)&v8 - v8;
  uint64_t v22 = sub_47B8(&qword_202F0);
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v9 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v22);
  unint64_t v21 = (char *)&v8 - v9;
  uint64_t v24 = sub_47B8(&qword_202F8);
  unint64_t v11 = (*(void *)(*(void *)(v24 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v10);
  uint64_t v26 = (uint64_t)&v8 - v11;
  unint64_t v12 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v27 = (uint64_t)&v8 - v12;
  unint64_t v31 = (char *)&v8 - v12;
  uint64_t v30 = v4;
  sub_A8E8(v4, v5);
  uint64_t v13 = &v28;
  uint64_t v29 = v16;
  uint64_t v14 = sub_47B8(&qword_20300);
  sub_B414();
  sub_195F4();
  sub_AA18(v16);
  sub_197A4("NewYork", 7uLL, 1);
  uint64_t v17 = v6;
  uint64_t v18 = sub_195E4();
  swift_bridgeObjectRelease();
  sub_B4A4();
  sub_19674();
  swift_release();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v22);
  unint64_t v25 = sub_B528();
  sub_617C(v26, v24, v27);
  sub_B650(v26);
  sub_B6E4(v27, v26);
  sub_617C(v26, v24, v23);
  sub_B650(v26);
  return sub_B650(v27);
}

uint64_t type metadata accessor for StoryView()
{
  uint64_t v1 = qword_20390;
  if (!qword_20390) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_AFB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v19 = a1;
  char v28 = sub_B7B4;
  uint64_t v30 = sub_C7F4;
  uint64_t v48 = 0;
  uint64_t v47 = 0;
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  unint64_t v13 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v2);
  uint64_t v20 = (uint64_t)&v13 - v13;
  unint64_t v14 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v13 - v13);
  uint64_t v4 = (char *)&v13 - v14;
  uint64_t v17 = (uint64_t)&v13 - v14;
  uint64_t v40 = sub_47B8(&qword_20300);
  uint64_t v34 = *(void *)(v40 - 8);
  uint64_t v35 = v40 - 8;
  unint64_t v15 = (*(void *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = __chkstk_darwin(v19);
  uint64_t v38 = (uint64_t)&v13 - v15;
  unint64_t v16 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v39 = (uint64_t)&v13 - v16;
  uint64_t v48 = (char *)&v13 - v16;
  uint64_t v47 = v7;
  sub_A8E8(v7, (uint64_t)v4);
  uint64_t v8 = SiriSocialConversationDataModels.StoryDataModel.storyTexts.getter();
  uint64_t v9 = v20;
  uint64_t v18 = v8;
  sub_AA18(v17);
  uint64_t v24 = v46;
  v46[0] = v18;
  sub_A8E8(v19, v9);
  uint64_t v21 = SiriSocialConversationDataModels.StoryDataModel.dialogIds.getter();
  sub_AA18(v20);
  uint64_t v23 = &v45;
  uint64_t v45 = v21;
  uint64_t v22 = sub_47B8(&qword_203D0);
  sub_C680();
  sub_19944();
  sub_C704();
  sub_C704();
  uint64_t v27 = v44;
  v44[0] = v46[1];
  v44[1] = v46[2];
  uint64_t v25 = sub_47B8(&qword_200F0);
  uint64_t v26 = sub_47B8(&qword_203E0);
  sub_C730();
  uint64_t v10 = sub_197F4();
  uint64_t v33 = &v43;
  uint64_t v43 = v10;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v11 = swift_allocObject();
  uint64_t v31 = v11;
  *(void *)(v11 + 16) = v28;
  *(void *)(v11 + 24) = 0;
  uint64_t v32 = sub_47B8(&qword_203F0);
  sub_C800();
  sub_19694();
  unint64_t v37 = sub_B414();
  sub_617C(v38, v40, v39);
  uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  uint64_t v41 = v34 + 8;
  v42(v38, v40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v38, v39, v40);
  sub_617C(v38, v40, v36);
  v42(v38, v40);
  return ((uint64_t (*)(uint64_t, uint64_t))v42)(v39, v40);
}

uint64_t sub_B40C@<X0>(uint64_t a1@<X8>)
{
  return sub_AFB0(*(void *)(v1 + 16), a1);
}

unint64_t sub_B414()
{
  uint64_t v2 = qword_20308;
  if (!qword_20308)
  {
    sub_60F8(&qword_20300);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20308);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_B4A4()
{
  uint64_t v2 = qword_20310;
  if (!qword_20310)
  {
    sub_60F8(&qword_202F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20310);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_B528()
{
  uint64_t v2 = qword_20318;
  if (!qword_20318)
  {
    sub_60F8(&qword_202F8);
    sub_B4A4();
    sub_B5CC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20318);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_B5CC()
{
  uint64_t v2 = qword_20320;
  if (!qword_20320)
  {
    sub_60F8(&qword_20328);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20320);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_B650(uint64_t a1)
{
  uint64_t v1 = sub_47B8(&qword_202F0);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  sub_47B8(&qword_202F8);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_B6E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_47B8(&qword_202F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v5 = *(int *)(sub_47B8(&qword_202F8) + 36);
  uint64_t v6 = *(void *)(a1 + v5);
  swift_retain();
  *(void *)(a2 + v5) = v6;
  uint64_t v8 = *(void *)(a1 + v5 + 8);
  swift_retain();
  uint64_t result = a2;
  *(void *)(a2 + v5 + 8) = v8;
  return result;
}

uint64_t sub_B7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v48 = a1;
  uint64_t v49 = a2;
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  swift_bridgeObjectRetain();
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  sub_9950();
  uint64_t v38 = sub_19614();
  uint64_t v39 = v4;
  char v40 = v5;
  uint64_t v41 = v6;
  uint64_t v13 = v4;
  char v14 = v5;
  uint64_t v15 = v6;
  sub_195D4();
  uint64_t v34 = v38;
  uint64_t v35 = v13;
  char v36 = v14 & 1;
  uint64_t v37 = v15;
  uint64_t v30 = sub_19604();
  uint64_t v31 = v7;
  char v32 = v8;
  uint64_t v33 = v9;
  uint64_t v16 = v7;
  char v17 = v8;
  uint64_t v18 = v9;
  swift_release();
  sub_C884(v38, v13, v14 & 1);
  swift_bridgeObjectRelease();
  v27[0] = v30;
  v27[1] = v16;
  char v28 = v17 & 1;
  uint64_t v29 = v18;
  sub_617C((uint64_t)v27, (uint64_t)&type metadata for Text, (uint64_t)&v44);
  sub_C8C8((uint64_t)v27);
  long long v19 = v44;
  char v20 = v45;
  uint64_t v21 = *((void *)&v45 + 1);
  sub_C910(v44, *((uint64_t *)&v44 + 1), v45 & 1);
  swift_bridgeObjectRetain();
  long long v23 = v19;
  char v24 = v20 & 1;
  uint64_t v25 = v21;
  sub_617C((uint64_t)&v23, (uint64_t)&type metadata for Text, (uint64_t)&v26);
  sub_C8C8((uint64_t)&v23);
  uint64_t v22 = v26;
  sub_C8C8((uint64_t)&v44);
  return v22;
}

uint64_t sub_BA64@<X0>(void *a1@<X0>, uint64_t (*a2)(void, void, void, void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = a2(*a1, a1[1], a1[2], a1[3]);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v4;
  *(unsigned char *)(a3 + 16) = v5 & 1;
  *(void *)(a3 + 24) = v6;
  return result;
}

uint64_t sub_BAEC@<X0>(uint64_t a1@<X8>)
{
  return sub_AC68(a1);
}

uint64_t sub_BB04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v51 = 0;
  v33[1] = 0;
  unint64_t v34 = (*(void *)(*(void *)(type metadata accessor for SiriSocialConversationDataModels.StoryDataModel() - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  uint64_t v45 = (uint64_t)v33 - v34;
  uint64_t v47 = type metadata accessor for StoryView();
  unint64_t v35 = (*(void *)(*(void *)(v47 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v47);
  uint64_t v49 = (uint64_t)v33 - v35;
  unint64_t v36 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v33 - v35);
  uint64_t v50 = (uint64_t)v33 - v36;
  uint64_t v51 = (char *)v33 - v36;
  uint64_t v43 = &type metadata for String;
  uint64_t v38 = sub_19934();
  uint64_t v37 = v2;
  Builtin::Word v40 = 6;
  int v39 = 1;
  uint64_t v3 = sub_197A4("String", 6uLL, 1);
  uint64_t v4 = v37;
  uint64_t v5 = v3;
  uint64_t v6 = v38;
  uint64_t *v37 = v5;
  v4[1] = v7;
  sub_74D8();
  uint64_t v44 = v6;
  uint64_t v42 = sub_19934();
  uint64_t v41 = v8;
  uint64_t v9 = sub_197A4("Item 1", v40, v39 & 1);
  char v10 = v39;
  uint64_t v11 = v41;
  uint64_t v13 = v12;
  Builtin::Word v14 = v40;
  *uint64_t v41 = v9;
  v11[1] = v13;
  uint64_t v15 = sub_197A4("Item 2", v14, v10 & 1);
  char v16 = v39;
  char v17 = v41;
  uint64_t v19 = v18;
  Builtin::Word v20 = v40;
  uint64_t v41[2] = v15;
  v17[3] = v19;
  uint64_t v21 = sub_197A4("Item 3", v20, v16 & 1);
  char v22 = v39;
  long long v23 = v41;
  uint64_t v25 = v24;
  Builtin::Word v26 = v40;
  v41[4] = v21;
  v23[5] = v25;
  uint64_t v27 = sub_197A4("Item 4", v26, v22 & 1);
  char v28 = v41;
  uint64_t v29 = v27;
  uint64_t v30 = v42;
  v41[6] = v29;
  v28[7] = v31;
  sub_74D8();
  SiriSocialConversationDataModels.StoryDataModel.init(storyTexts:dialogIds:)(v44, v30, v45);
  sub_AC4C(v45, v49);
  unint64_t v48 = sub_A994();
  sub_617C(v49, v47, v50);
  sub_AA18(v49);
  sub_A8E8(v50, v49);
  sub_617C(v49, v47, v46);
  sub_AA18(v49);
  return sub_AA18(v50);
}

uint64_t sub_BDB8@<X0>(uint64_t a1@<X8>)
{
  return sub_BB04(a1);
}

uint64_t sub_BDD0()
{
  return sub_19574();
}

unint64_t sub_BE08()
{
  uint64_t v2 = qword_20330;
  if (!qword_20330)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20330);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_BE88()
{
  return sub_19564();
}

unint64_t sub_BEC0(char *a1, char *a2)
{
  uint64_t v9 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  int v10 = *(_DWORD *)(*(void *)(v9 - 8) + 80);
  if ((v10 & 0x20000) != 0)
  {
    uint64_t v5 = *(void *)a2;
    swift_retain();
    *(void *)a1 = v5;
    return *(void *)a1 + ((v10 + 16) & ~(unint64_t)v10);
  }
  else
  {
    uint64_t v3 = sub_47B8(&qword_20240);
    uint64_t v4 = *(void (**)(char *, char *, uint64_t))(*(void *)(v3 - 8) + 16);
    ((void (*)(char *, char *))v4)(a1, a2);
    v4(&a1[*(int *)(v9 + 20)], &a2[*(int *)(v9 + 20)], v3);
    return (unint64_t)a1;
  }
}

uint64_t sub_BFFC(uint64_t a1)
{
  uint64_t v4 = sub_47B8(&qword_20240);
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v4 - 8) + 8);
  v3(a1);
  uint64_t v1 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  return ((uint64_t (*)(uint64_t, uint64_t))v3)(a1 + *(int *)(v1 + 20), v4);
}

uint64_t sub_C094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B8(&qword_20240);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  v5(a1, a2);
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  ((void (*)(uint64_t, uint64_t, uint64_t))v5)(a1 + *(int *)(v2 + 20), a2 + *(int *)(v2 + 20), v4);
  return a1;
}

uint64_t sub_C144(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B8(&qword_20240);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 24);
  v5(a1, a2);
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  ((void (*)(uint64_t, uint64_t, uint64_t))v5)(a1 + *(int *)(v2 + 20), a2 + *(int *)(v2 + 20), v4);
  return a1;
}

uint64_t sub_C1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B8(&qword_20240);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  v5(a1, a2);
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  ((void (*)(uint64_t, uint64_t, uint64_t))v5)(a1 + *(int *)(v2 + 20), a2 + *(int *)(v2 + 20), v4);
  return a1;
}

uint64_t sub_C2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_47B8(&qword_20240);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  v5(a1, a2);
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  ((void (*)(uint64_t, uint64_t, uint64_t))v5)(a1 + *(int *)(v2 + 20), a2 + *(int *)(v2 + 20), v4);
  return a1;
}

uint64_t sub_C354()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_C37C(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 48))(a1, a2);
}

uint64_t sub_C3DC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_C404(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 56))(a1, a2);
}

uint64_t sub_C468()
{
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

void *type metadata accessor for StoryView_Previews()
{
  return &unk_1C998;
}

unint64_t sub_C550()
{
  return sub_B528();
}

unint64_t sub_C568()
{
  return sub_A994();
}

unint64_t sub_C580()
{
  return sub_C598();
}

unint64_t sub_C598()
{
  uint64_t v2 = qword_203C8;
  if (!qword_203C8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_203C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_C618()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C64C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_C680()
{
  uint64_t v2 = qword_203D8;
  if (!qword_203D8)
  {
    sub_60F8(&qword_203D0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_203D8);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_C704()
{
}

unint64_t sub_C730()
{
  uint64_t v2 = qword_203E8;
  if (!qword_203E8)
  {
    sub_60F8(&qword_203E0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_203E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_C7B4()
{
  return swift_deallocObject();
}

uint64_t sub_C7F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_BA64(a1, *(uint64_t (**)(void, void, void, void))(v2 + 16), a2);
}

unint64_t sub_C800()
{
  uint64_t v2 = qword_203F8;
  if (!qword_203F8)
  {
    sub_60F8(&qword_203F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_203F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_C884(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_C8C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_C910(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.buttons.getter()
{
  uint64_t v10 = 0;
  uint64_t v7 = sub_47B8(&qword_200A8);
  uint64_t v4 = *(void *)(v7 - 8);
  uint64_t v5 = v7 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v7);
  uint64_t v6 = (char *)&v2 - v3;
  uint64_t v10 = v0;
  (*(void (**)(char *))(v4 + 16))((char *)&v2 - v3);
  sub_19514();
  uint64_t v8 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v7);
  return v8;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.label.getter()
{
  uint64_t v12 = 0;
  uint64_t v7 = sub_47B8(&qword_20228);
  uint64_t v4 = *(void *)(v7 - 8);
  uint64_t v5 = v7 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v7);
  uint64_t v6 = (char *)&v2 - v3;
  uint64_t v12 = v0;
  (*(void (**)(char *))(v4 + 16))((char *)&v2 - v3);
  sub_19514();
  uint64_t v8 = v10;
  uint64_t v9 = v11;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v7);
  return v8;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.init(label:directInvocation:userData:link:separated:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v56 = a9;
  uint64_t v49 = a1;
  uint64_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v59 = a4;
  uint64_t v58 = a5;
  uint64_t v55 = a6;
  uint64_t v57 = a7;
  int v53 = a8;
  uint64_t v69 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v64 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  char v61 = 0;
  uint64_t v48 = sub_47B8(&qword_20228);
  uint64_t v46 = *(void *)(v48 - 8);
  uint64_t v47 = v48 - 8;
  unint64_t v38 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v48);
  Builtin::Word v40 = (char *)&v37 - v38;
  Builtin::Word v43 = 0;
  uint64_t v54 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  unint64_t v39 = (*(void *)(*((void *)v54 - 1) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = __chkstk_darwin(v49);
  uint64_t v60 = (uint64_t)&v37 - v39;
  uint64_t v69 = (char *)&v37 - v39;
  uint64_t v67 = v9;
  uint64_t v68 = v10;
  uint64_t v65 = v11;
  uint64_t v66 = v12;
  uint64_t v64 = v13;
  uint64_t v62 = v14;
  uint64_t v63 = v15;
  int v52 = 1;
  char v61 = v16 & 1;
  uint64_t v44 = "";
  sub_197A4("", v17, 1);
  property wrapper backing initializer of SiriSocialConversationDataModels.ButtonModel.label();
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 32))(v60, v40, v48);
  uint64_t v41 = v54[5];
  uint64_t v18 = sub_197A4(v44, v43, v52 & 1);
  uint64_t v19 = v54;
  Builtin::Word v20 = (uint64_t *)(v60 + v41);
  *Builtin::Word v20 = v18;
  v20[1] = v21;
  uint64_t v42 = v19[6];
  sub_47B8(&qword_200F0);
  sub_19934();
  uint64_t v22 = sub_19774();
  Builtin::Word v23 = v43;
  char v24 = v52;
  uint64_t v25 = v54;
  uint64_t v26 = v22;
  uint64_t v27 = v44;
  *(void *)(v60 + v42) = v26;
  uint64_t v45 = v25[8];
  uint64_t v28 = sub_197A4(v27, v23, v24 & 1);
  uint64_t v29 = v46;
  uint64_t v30 = (uint64_t *)(v60 + v45);
  *uint64_t v30 = v28;
  v30[1] = v31;
  (*(void (**)(void))(v29 + 8))();
  property wrapper backing initializer of SiriSocialConversationDataModels.ButtonModel.label();
  swift_bridgeObjectRetain();
  uint64_t v32 = v59;
  uint64_t v33 = (void *)(v60 + v54[5]);
  *uint64_t v33 = v51;
  v33[1] = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  *(void *)(v60 + v54[6]) = v58;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v60 + v54[7]) = v53 & v52;
  swift_bridgeObjectRetain();
  uint64_t v34 = v57;
  unint64_t v35 = (void *)(v60 + v54[8]);
  *unint64_t v35 = v55;
  v35[1] = v34;
  swift_bridgeObjectRelease();
  sub_9C64(v60, v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_9718(v60);
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.ButtonModel()
{
  uint64_t v1 = qword_206A8;
  if (!qword_206A8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.init(buttons:text:sash:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v35 = a5;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v36 = a3;
  int v34 = a4;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  char v38 = 0;
  uint64_t v26 = sub_47B8(&qword_200A8);
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v21 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v26);
  uint64_t v25 = (char *)&v20 - v21;
  Builtin::Word v27 = 0;
  uint64_t v32 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  unint64_t v22 = (*(void *)(*(void *)(v32 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v20 - v22;
  uint64_t v37 = (uint64_t)&v20 - v22;
  uint64_t v42 = (char *)&v20 - v22;
  uint64_t v41 = v6;
  uint64_t v39 = v7;
  uint64_t v40 = v8;
  int v29 = 1;
  int v33 = 1;
  char v38 = v9 & 1;
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  sub_19934();
  property wrapper backing initializer of SiriSocialConversationDataModels.ButtonStackModel.buttons();
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v5, v25, v26);
  uint64_t v28 = *(int *)(v32 + 20);
  uint64_t v10 = sub_197A4("", v27, v33 & 1);
  char v11 = v29;
  uint64_t v12 = v32;
  uint64_t v13 = (uint64_t *)&v5[v28];
  *uint64_t v13 = v10;
  v13[1] = v14;
  v5[*(int *)(v12 + 24)] = v11;
  SiriSocialConversationDataModels.ButtonStackModel.buttons.setter();
  swift_bridgeObjectRetain();
  uint64_t v15 = v36;
  char v16 = (void *)(v37 + *(int *)(v32 + 20));
  *char v16 = v31;
  v16[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = v35;
  uint64_t v18 = v37;
  *(unsigned char *)(v37 + *(int *)(v32 + 24)) = v34 & v33;
  sub_7528(v18, v17);
  swift_bridgeObjectRelease();
  return sub_7824(v37);
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.storyTexts.getter()
{
  uint64_t v13 = 0;
  uint64_t v10 = sub_47B8(&qword_20240);
  uint64_t v7 = *(void *)(v10 - 8);
  uint64_t v8 = v10 - 8;
  unint64_t v5 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v10);
  uint64_t v0 = (char *)&v4 - v5;
  char v9 = (char *)&v4 - v5;
  uint64_t v13 = v1;
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v0, v6 + *(int *)(v2 + 20), v10);
  sub_19514();
  uint64_t v11 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v10);
  return v11;
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.dialogIds.getter()
{
  uint64_t v10 = 0;
  uint64_t v7 = sub_47B8(&qword_20240);
  uint64_t v4 = *(void *)(v7 - 8);
  uint64_t v5 = v7 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v7);
  uint64_t v6 = (char *)&v2 - v3;
  uint64_t v10 = v0;
  (*(void (**)(char *))(v4 + 16))((char *)&v2 - v3);
  sub_19514();
  uint64_t v8 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v7);
  return v8;
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.init(storyTexts:dialogIds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v9 = a3;
  uint64_t v8 = a1;
  uint64_t v5 = a2;
  uint64_t v13 = 0;
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  uint64_t v7 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  unint64_t v6 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)&v4 - v6;
  uint64_t v13 = (char *)&v4 - v6;
  uint64_t v12 = v8;
  uint64_t v11 = __chkstk_darwin(v5);
  property wrapper backing initializer of SiriSocialConversationDataModels.StoryDataModel.dialogIds();
  property wrapper backing initializer of SiriSocialConversationDataModels.StoryDataModel.dialogIds();
  sub_A8E8(v10, v9);
  return sub_AA18(v10);
}

uint64_t sub_D514()
{
  uint64_t result = sub_197A4("SiriSocialConversationUIPlugin", 0x1EuLL, 1);
  static SiriSocialConversationDataModels.bundleName = result;
  qword_221E8 = v1;
  return result;
}

uint64_t *SiriSocialConversationDataModels.bundleName.unsafeMutableAddressor()
{
  if (qword_20090 != -1) {
    swift_once();
  }
  return &static SiriSocialConversationDataModels.bundleName;
}

uint64_t static SiriSocialConversationDataModels.bundleName.getter()
{
  uint64_t v1 = *SiriSocialConversationDataModels.bundleName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t property wrapper backing initializer of SiriSocialConversationDataModels.ButtonModel.label()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel()
{
  uint64_t v1 = qword_20750;
  if (!qword_20750) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.label.setter()
{
  return swift_bridgeObjectRelease();
}

void (*SiriSocialConversationDataModels.ButtonModel.label.modify(void *a1))(void **a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_47B8(&qword_20228);
  v2[4] = sub_19504();
  return sub_D7F0;
}

void sub_D7F0(void **a1)
{
  uint64_t v1 = (void (**)(void *, void))*a1;
  v1[4](v1, 0);
  free(v1);
}

uint64_t SiriSocialConversationDataModels.ButtonModel.directInvocation.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() + 20));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.directInvocation.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v3 = (void *)(v2 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() + 20));
  void *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.directInvocation.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.userData.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.userData.setter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  *(void *)(v1 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() + 24)) = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.userData.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.separated.getter()
{
  return *(unsigned char *)(v0 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() + 28)) & 1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.separated.setter(unsigned int a1)
{
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  uint64_t result = a1;
  *(unsigned char *)(v1 + *(int *)(v2 + 28)) = a1 & 1;
  return result;
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.separated.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.link.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.link.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unint64_t v3 = (void *)(v2 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel() + 32));
  void *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.link.modify())()
{
  return nullsub_1;
}

void *SiriSocialConversationDataModels.ButtonModel.hash(into:)(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v2 = v1;
  uint64_t v22 = v2;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  uint64_t v13 = sub_47B8(&qword_20228);
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v9 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v13);
  uint64_t v12 = (char *)&v8 - v9;
  uint64_t v33 = a1;
  uint64_t v32 = v4;
  (*(void (**)(void))(v10 + 16))();
  sub_10F7C();
  sub_19954();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v13);
  unint64_t v21 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  uint64_t v5 = (uint64_t *)(v22 + v21[5]);
  uint64_t v14 = *v5;
  uint64_t v15 = v5[1];
  swift_bridgeObjectRetain();
  char v16 = v31;
  v31[0] = v14;
  v31[1] = v15;
  uint64_t v25 = &type metadata for String;
  uint64_t v26 = &protocol witness table for String;
  sub_19954();
  sub_1100C();
  uint64_t v17 = *(void *)(v22 + v21[6]);
  swift_bridgeObjectRetain();
  uint64_t v19 = &v30;
  uint64_t v30 = v17;
  uint64_t v18 = sub_47B8(&qword_20408);
  sub_11038();
  sub_19954();
  sub_C704();
  char v29 = *(unsigned char *)(v22 + v21[7]) & 1;
  sub_19954();
  unint64_t v6 = (uint64_t *)(v22 + v21[8]);
  uint64_t v23 = *v6;
  uint64_t v24 = v6[1];
  swift_bridgeObjectRetain();
  Builtin::Word v27 = v28;
  v28[0] = v23;
  v28[1] = v24;
  sub_19954();
  uint64_t result = v27;
  sub_1100C();
  return result;
}

BOOL static SiriSocialConversationDataModels.ButtonModel.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a1;
  uint64_t v28 = a2;
  uint64_t v40 = 0;
  uint64_t v39 = 0;
  uint64_t v35 = sub_47B8(&qword_20228);
  uint64_t v31 = *(void **)(v35 - 8);
  uint64_t v32 = v35 - 8;
  uint64_t v26 = v31[8];
  unint64_t v25 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v35);
  uint64_t v33 = &v8[-v25];
  unint64_t v27 = v25;
  __chkstk_darwin(&v8[-v25]);
  int v34 = &v8[-v27];
  uint64_t v40 = v2;
  uint64_t v39 = v28;
  uint64_t v30 = (void (*)(void))v31[2];
  char v29 = v31 + 2;
  v30();
  ((void (*)(unsigned char *, uint64_t, uint64_t))v30)(v33, v28, v35);
  int v38 = sub_19534();
  uint64_t v37 = (void (*)(unsigned char *, uint64_t))v31[1];
  uint64_t v36 = v31 + 1;
  v37(v33, v35);
  v37(v34, v35);
  if (v38)
  {
    uint64_t v18 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
    unint64_t v3 = (uint64_t *)(v24 + v18[5]);
    uint64_t v19 = *v3;
    uint64_t v22 = v3[1];
    swift_bridgeObjectRetain();
    uint64_t v4 = (uint64_t *)(v28 + v18[5]);
    uint64_t v20 = *v4;
    uint64_t v21 = v4[1];
    swift_bridgeObjectRetain();
    int v23 = sub_197B4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v23)
    {
      uint64_t v16 = *(void *)(v24 + v18[6]);
      swift_bridgeObjectRetain();
      uint64_t v15 = *(void *)(v28 + v18[6]);
      swift_bridgeObjectRetain();
      int v17 = sub_19784();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17)
      {
        if ((*(unsigned char *)(v24 + v18[7]) & 1) == (*(unsigned char *)(v28 + v18[7]) & 1))
        {
          uint64_t v5 = (uint64_t *)(v24 + v18[8]);
          uint64_t v10 = *v5;
          uint64_t v13 = v5[1];
          swift_bridgeObjectRetain();
          unint64_t v6 = (uint64_t *)(v28 + v18[8]);
          uint64_t v11 = *v6;
          uint64_t v12 = v6[1];
          swift_bridgeObjectRetain();
          int v14 = sub_197B4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (v14 & 1) != 0;
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 0;
  }
}

BOOL sub_E244(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    case 4:
      uint64_t v3 = 4;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_E37C()
{
  return sub_19954();
}

uint64_t sub_E458()
{
  swift_bridgeObjectRetain();
  sub_197A4("label", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v6 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v7 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    return v7;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("directInvocation", 0x10uLL, 1);
  swift_bridgeObjectRetain();
  char v5 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v7 = 1;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("userData", 8uLL, 1);
  swift_bridgeObjectRetain();
  char v4 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v7 = 2;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("separated", 9uLL, 1);
  swift_bridgeObjectRetain();
  char v3 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v7 = 3;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("link", 4uLL, 1);
  swift_bridgeObjectRetain();
  char v2 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v7 = 4;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 5;
}

uint64_t sub_E7C4()
{
  return 5;
}

uint64_t sub_E7DC()
{
  return sub_19854();
}

uint64_t sub_E828()
{
  return 0;
}

uint64_t sub_E844(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = sub_197A4("directInvocation", 0x10uLL, 1);
      break;
    case 2:
      uint64_t v2 = sub_197A4("userData", 8uLL, 1);
      break;
    case 3:
      uint64_t v2 = sub_197A4("separated", 9uLL, 1);
      break;
    case 4:
      uint64_t v2 = sub_197A4("link", 4uLL, 1);
      break;
    default:
      uint64_t v2 = sub_197A4("label", 5uLL, 1);
      break;
  }
  return v2;
}

BOOL sub_E980(char *a1, char *a2)
{
  return sub_E244(*a1, *a2);
}

uint64_t sub_E9A4()
{
  return sub_E7DC();
}

uint64_t sub_E9C0()
{
  return sub_E37C();
}

Swift::Int sub_E9DC(Swift::Int a1)
{
  return sub_19794(a1);
}

uint64_t sub_E9F4()
{
  return sub_E844(*v0);
}

uint64_t sub_EA10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_E458();
  *a1 = result;
  return result;
}

uint64_t sub_EA3C()
{
  return sub_E828();
}

uint64_t sub_EA5C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_E7C4();
  *a1 = result;
  return result;
}

uint64_t sub_EA88()
{
  return sub_19984();
}

uint64_t sub_EAB8()
{
  return sub_19994();
}

uint64_t SiriSocialConversationDataModels.ButtonModel.encode(to:)(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v58 = 0;
  uint64_t v57 = 0;
  uint64_t v46 = sub_47B8(&qword_20228);
  uint64_t v41 = *(void *)(v46 - 8);
  uint64_t v42 = v46 - 8;
  unint64_t v33 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v46);
  uint64_t v48 = (char *)v11 - v33;
  uint64_t v45 = sub_47B8(&qword_20428);
  uint64_t v35 = *(void *)(v45 - 8);
  uint64_t v36 = v45 - 8;
  unint64_t v37 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (void *)__chkstk_darwin(v34);
  uint64_t v40 = (char *)v11 - v37;
  uint64_t v58 = v2;
  uint64_t v57 = v1;
  uint64_t v38 = v2[3];
  uint64_t v39 = v2[4];
  sub_111C8(v2, v38);
  sub_11148();
  sub_19974();
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v48, v43, v46);
  uint64_t v44 = &v56;
  char v56 = 0;
  sub_11240();
  uint64_t v3 = v47;
  sub_19924();
  uint64_t v49 = v3;
  uint64_t v50 = v3;
  if (v3)
  {
    uint64_t v14 = v50;
    (*(void (**)(char *, uint64_t))(v41 + 8))(v48, v46);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v40, v45);
    uint64_t v15 = v14;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v48, v46);
    uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
    uint64_t v5 = v49;
    uint64_t v28 = v4;
    char v6 = (uint64_t *)(v43 + *(int *)(v4 + 20));
    uint64_t v29 = *v6;
    uint64_t v30 = v6[1];
    swift_bridgeObjectRetain();
    char v55 = 1;
    sub_19904();
    uint64_t v31 = v5;
    uint64_t v32 = v5;
    if (v5)
    {
      uint64_t v13 = v32;
      swift_bridgeObjectRelease();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v40, v45);
      uint64_t v15 = v13;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = *(void *)(v43 + *(int *)(v28 + 24));
      swift_bridgeObjectRetain();
      unint64_t v25 = &v54;
      uint64_t v54 = v22;
      int v23 = &v53;
      char v53 = 2;
      uint64_t v24 = sub_47B8(&qword_20408);
      sub_112DC();
      uint64_t v7 = v31;
      sub_19924();
      uint64_t v26 = v7;
      uint64_t v27 = v7;
      if (v7)
      {
        uint64_t v12 = v27;
        sub_C704();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v40, v45);
        uint64_t v15 = v12;
      }
      else
      {
        sub_C704();
        uint64_t v8 = v26;
        char v52 = 3;
        sub_19914();
        uint64_t v20 = v8;
        uint64_t v21 = v8;
        if (v8)
        {
          v11[1] = v21;
        }
        else
        {
          unint64_t v9 = (uint64_t *)(v43 + *(int *)(v28 + 32));
          uint64_t v16 = *v9;
          uint64_t v17 = v9[1];
          swift_bridgeObjectRetain();
          char v51 = 4;
          sub_19904();
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          swift_bridgeObjectRelease();
        }
        return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v40, v45);
      }
    }
  }
  return result;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.hashValue.getter()
{
  return sub_19854();
}

uint64_t SiriSocialConversationDataModels.ButtonModel.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  unint64_t v78 = (void *)a1;
  uint64_t v91 = 0;
  uint64_t v58 = sub_47B8(&qword_20440);
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  unint64_t v61 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v58);
  uint64_t v79 = (char *)v33 - v61;
  uint64_t v69 = sub_47B8(&qword_20228);
  uint64_t v66 = *(void *)(v69 - 8);
  uint64_t v67 = v69 - 8;
  unint64_t v62 = (*(void *)(v66 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v69);
  uint64_t v63 = (char *)v33 - v62;
  unint64_t v64 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v33 - v62);
  uint64_t v68 = (char *)v33 - v64;
  Builtin::Word v73 = 0;
  v72 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  unint64_t v65 = (*(void *)(*((void *)v72 - 1) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = __chkstk_darwin(v78);
  uint64_t v76 = (uint64_t)v33 - v65;
  uint64_t v91 = v3;
  v75 = "";
  int v74 = 1;
  sub_197A4("", v4, 1);
  property wrapper backing initializer of SiriSocialConversationDataModels.ButtonModel.label();
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v76, v68, v69);
  uint64_t v70 = v72[5];
  uint64_t v5 = sub_197A4(v75, v73, v74 & 1);
  char v6 = v72;
  uint64_t v7 = (uint64_t *)(v76 + v70);
  uint64_t *v7 = v5;
  v7[1] = v8;
  uint64_t v71 = v6[6];
  sub_47B8(&qword_200F0);
  sub_19934();
  uint64_t v9 = sub_19774();
  uint64_t v10 = v72;
  Builtin::Word v11 = v73;
  char v12 = v74;
  uint64_t v13 = v9;
  uint64_t v14 = v75;
  *(void *)(v76 + v71) = v13;
  uint64_t v77 = v10[8];
  uint64_t v15 = sub_197A4(v14, v11, v12 & 1);
  uint64_t v16 = v78;
  uint64_t v17 = (uint64_t *)(v76 + v77);
  *uint64_t v17 = v15;
  v17[1] = v18;
  uint64_t v81 = v16[3];
  uint64_t v82 = v16[4];
  sub_111C8(v16, v81);
  sub_11148();
  uint64_t v19 = v80;
  sub_19964();
  uint64_t v83 = v19;
  uint64_t v84 = v19;
  if (v19)
  {
    uint64_t v38 = v84;
  }
  else
  {
    uint64_t v54 = &v90;
    char v90 = 0;
    sub_11420();
    uint64_t v20 = v83;
    sub_198D4();
    uint64_t v55 = v20;
    uint64_t v56 = v20;
    if (v20)
    {
      uint64_t v37 = v56;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v79, v58);
      uint64_t v38 = v37;
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v66 + 40))(v76, v63, v69);
      uint64_t v21 = v55;
      char v89 = 1;
      uint64_t v22 = sub_198B4();
      uint64_t v50 = v21;
      uint64_t v51 = v22;
      uint64_t v52 = v23;
      uint64_t v53 = v21;
      if (v21)
      {
        uint64_t v36 = v53;
        (*(void (**)(char *, uint64_t))(v59 + 8))(v79, v58);
        uint64_t v38 = v36;
      }
      else
      {
        uint64_t v24 = v52;
        unint64_t v25 = (uint64_t *)(v76 + v72[5]);
        *unint64_t v25 = v51;
        v25[1] = v24;
        swift_bridgeObjectRelease();
        uint64_t v47 = sub_47B8(&qword_20408);
        uint64_t v46 = &v87;
        char v87 = 2;
        sub_114BC();
        uint64_t v26 = v50;
        sub_198D4();
        uint64_t v48 = v26;
        uint64_t v49 = v26;
        if (v26)
        {
          uint64_t v35 = v49;
          (*(void (**)(char *, uint64_t))(v59 + 8))(v79, v58);
          uint64_t v38 = v35;
        }
        else
        {
          *(void *)(v76 + v72[6]) = v88;
          swift_bridgeObjectRelease();
          uint64_t v27 = v48;
          char v86 = 3;
          int v28 = sub_198C4();
          uint64_t v43 = v27;
          int v44 = v28;
          uint64_t v45 = v27;
          if (!v27)
          {
            *(unsigned char *)(v76 + v72[7]) = v44 & 1;
            char v85 = 4;
            uint64_t v29 = sub_198B4();
            uint64_t v39 = 0;
            uint64_t v40 = v29;
            uint64_t v41 = v30;
            uint64_t v42 = 0;
            uint64_t v31 = (uint64_t *)(v76 + v72[8]);
            *uint64_t v31 = v29;
            v31[1] = v30;
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v59 + 8))(v79, v58);
            sub_9C64(v76, v57);
            sub_11374((uint64_t)v78);
            return sub_9718(v76);
          }
          uint64_t v34 = v45;
          (*(void (**)(char *, uint64_t))(v59 + 8))(v79, v58);
          uint64_t v38 = v34;
        }
      }
    }
  }
  v33[1] = v38;
  sub_11374((uint64_t)v78);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v76, v69);
  sub_1100C();
  sub_C704();
  uint64_t result = v76 + v72[8];
  sub_1100C();
  return result;
}

uint64_t sub_F9DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SiriSocialConversationDataModels.ButtonModel.init(from:)(a1, a2);
}

uint64_t sub_FA34(uint64_t a1)
{
  return SiriSocialConversationDataModels.ButtonModel.encode(to:)(a1);
}

uint64_t sub_FA80()
{
  return SiriSocialConversationDataModels.ButtonModel.hashValue.getter();
}

void *sub_FA98(uint64_t a1)
{
  return SiriSocialConversationDataModels.ButtonModel.hash(into:)(a1);
}

BOOL sub_FAB0(uint64_t a1, uint64_t a2)
{
  return static SiriSocialConversationDataModels.ButtonModel.__derived_struct_equals(_:_:)(a1, a2);
}

uint64_t property wrapper backing initializer of SiriSocialConversationDataModels.ButtonStackModel.buttons()
{
  return swift_bridgeObjectRelease();
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.buttons.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.StoryDataModel()
{
  uint64_t v1 = qword_207F0;
  if (!qword_207F0) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void (*SiriSocialConversationDataModels.ButtonStackModel.buttons.modify(void *a1))(void **a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_47B8(&qword_200A8);
  v2[4] = sub_19504();
  return sub_D7F0;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.text.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel() + 20));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.text.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v2 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel() + 20));
  void *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*SiriSocialConversationDataModels.ButtonStackModel.text.modify())()
{
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.sash.getter()
{
  return *(unsigned char *)(v0 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel() + 24)) & 1;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.sash.setter(unsigned int a1)
{
  uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  uint64_t result = a1;
  *(unsigned char *)(v1 + *(int *)(v2 + 24)) = a1 & 1;
  return result;
}

uint64_t (*SiriSocialConversationDataModels.ButtonStackModel.sash.modify())()
{
  return nullsub_1;
}

BOOL sub_FE48(char a1, char a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v4 == v3;
}

uint64_t sub_FF1C()
{
  return sub_19954();
}

uint64_t sub_FFC8()
{
  swift_bridgeObjectRetain();
  sub_197A4("buttons", 7uLL, 1);
  swift_bridgeObjectRetain();
  char v4 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 0;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("text", 4uLL, 1);
  swift_bridgeObjectRetain();
  char v3 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 1;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("sash", 4uLL, 1);
  swift_bridgeObjectRetain();
  char v2 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 2;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t sub_101FC()
{
  return 3;
}

uint64_t sub_10214()
{
  return sub_19854();
}

uint64_t sub_10260(char a1)
{
  if (!a1) {
    return sub_197A4("buttons", 7uLL, 1);
  }
  if (a1 == 1) {
    return sub_197A4("text", 4uLL, 1);
  }
  return sub_197A4("sash", 4uLL, 1);
}

BOOL sub_10334(char *a1, char *a2)
{
  return sub_FE48(*a1, *a2);
}

uint64_t sub_10358()
{
  return sub_10214();
}

uint64_t sub_10374()
{
  return sub_FF1C();
}

uint64_t sub_10390()
{
  return sub_10260(*v0);
}

uint64_t sub_103AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_FFC8();
  *a1 = result;
  return result;
}

uint64_t sub_103D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_101FC();
  *a1 = result;
  return result;
}

uint64_t sub_10404()
{
  return sub_19984();
}

uint64_t sub_10434()
{
  return sub_19994();
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.encode(to:)(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  uint64_t v32 = sub_47B8(&qword_200A8);
  uint64_t v27 = *(void *)(v32 - 8);
  uint64_t v28 = v32 - 8;
  unint64_t v19 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)v9 - v19;
  uint64_t v31 = sub_47B8(&qword_20468);
  uint64_t v21 = *(void *)(v31 - 8);
  uint64_t v22 = v31 - 8;
  unint64_t v23 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v2 = (void *)__chkstk_darwin(v20);
  uint64_t v26 = (char *)v9 - v23;
  uint64_t v41 = v2;
  uint64_t v40 = v1;
  uint64_t v24 = v2[3];
  uint64_t v25 = v2[4];
  sub_111C8(v2, v24);
  sub_115D4();
  sub_19974();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v34, v29, v32);
  uint64_t v30 = &v39;
  char v39 = 0;
  sub_11654();
  uint64_t v3 = v33;
  sub_19924();
  uint64_t v35 = v3;
  uint64_t v36 = v3;
  if (v3)
  {
    uint64_t v10 = v36;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v34, v32);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v26, v31);
    uint64_t v11 = v10;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v34, v32);
    uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    uint64_t v5 = v35;
    uint64_t v14 = v4;
    char v6 = (uint64_t *)(v29 + *(int *)(v4 + 20));
    uint64_t v15 = *v6;
    uint64_t v16 = v6[1];
    swift_bridgeObjectRetain();
    char v38 = 1;
    sub_19904();
    uint64_t v17 = v5;
    uint64_t v18 = v5;
    if (v5)
    {
      v9[1] = v18;
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v26, v31);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v7 = v17;
      char v37 = 2;
      sub_19914();
      uint64_t v12 = v7;
      uint64_t v13 = v7;
      if (v7) {
        v9[0] = v13;
      }
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v26, v31);
    }
  }
  return result;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v56 = (void *)a1;
  uint64_t v66 = 0;
  uint64_t v40 = sub_47B8(&qword_20498);
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = v40 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v40);
  uint64_t v57 = (char *)v24 - v43;
  uint64_t v51 = sub_47B8(&qword_200A8);
  uint64_t v48 = *(void *)(v51 - 8);
  uint64_t v49 = v51 - 8;
  unint64_t v44 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v51);
  uint64_t v45 = (char *)v24 - v44;
  unint64_t v46 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v24 - v44);
  uint64_t v50 = (char *)v24 - v46;
  Builtin::Word v52 = 0;
  uint64_t v54 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  unint64_t v47 = (*(void *)(*(void *)(v54 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v52);
  uint64_t v55 = (uint64_t)v24 - v47;
  uint64_t v66 = v3;
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
  sub_19934();
  property wrapper backing initializer of SiriSocialConversationDataModels.ButtonStackModel.buttons();
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v55, v50, v51);
  uint64_t v53 = *(int *)(v54 + 20);
  uint64_t v4 = sub_197A4("", v52, 1);
  uint64_t v5 = v54;
  uint64_t v6 = v55;
  uint64_t v7 = v4;
  uint64_t v8 = v56;
  uint64_t v9 = (uint64_t *)(v55 + v53);
  *uint64_t v9 = v7;
  v9[1] = v10;
  *(unsigned char *)(v6 + *(int *)(v5 + 24)) = 1;
  uint64_t v59 = v8[3];
  uint64_t v60 = v8[4];
  sub_111C8(v8, v59);
  sub_115D4();
  uint64_t v11 = v58;
  sub_19964();
  uint64_t v61 = v11;
  uint64_t v62 = v11;
  if (v11)
  {
    uint64_t v28 = v62;
  }
  else
  {
    uint64_t v36 = &v65;
    char v65 = 0;
    sub_11928();
    uint64_t v12 = v61;
    sub_198D4();
    uint64_t v37 = v12;
    uint64_t v38 = v12;
    if (v12)
    {
      uint64_t v27 = v38;
      (*(void (**)(char *, uint64_t))(v41 + 8))(v57, v40);
      uint64_t v28 = v27;
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v48 + 40))(v55, v45, v51);
      uint64_t v13 = v37;
      char v64 = 1;
      uint64_t v14 = sub_198B4();
      uint64_t v32 = v13;
      uint64_t v33 = v14;
      uint64_t v34 = v15;
      uint64_t v35 = v13;
      if (v13)
      {
        uint64_t v26 = v35;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v57, v40);
        uint64_t v28 = v26;
      }
      else
      {
        uint64_t v16 = v34;
        uint64_t v17 = (uint64_t *)(v55 + *(int *)(v54 + 20));
        *uint64_t v17 = v33;
        v17[1] = v16;
        swift_bridgeObjectRelease();
        uint64_t v18 = v32;
        char v63 = 2;
        int v19 = sub_198C4();
        uint64_t v29 = v18;
        int v30 = v19;
        uint64_t v31 = v18;
        if (!v18)
        {
          uint64_t v20 = v40;
          uint64_t v21 = v57;
          uint64_t v22 = v41;
          *(unsigned char *)(v55 + *(int *)(v54 + 24)) = v30 & 1;
          (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v20);
          sub_7528(v55, v39);
          sub_11374((uint64_t)v56);
          return sub_7824(v55);
        }
        uint64_t v25 = v31;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v57, v40);
        uint64_t v28 = v25;
      }
    }
  }
  v24[1] = v28;
  sub_11374((uint64_t)v56);
  return sub_7824(v55);
}

uint64_t sub_10E04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SiriSocialConversationDataModels.ButtonStackModel.init(from:)(a1, a2);
}

uint64_t sub_10E5C(uint64_t a1)
{
  return SiriSocialConversationDataModels.ButtonStackModel.encode(to:)(a1);
}

uint64_t property wrapper backing initializer of SiriSocialConversationDataModels.StoryDataModel.dialogIds()
{
  return swift_bridgeObjectRelease();
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.dialogIds.setter()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_10F7C()
{
  uint64_t v2 = qword_20400;
  if (!qword_20400)
  {
    sub_60F8(&qword_20228);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20400);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1100C()
{
}

unint64_t sub_11038()
{
  uint64_t v2 = qword_20410;
  if (!qword_20410)
  {
    sub_60F8(&qword_20408);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20410);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_110C8()
{
  uint64_t v2 = qword_20418;
  if (!qword_20418)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20418);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_11148()
{
  uint64_t v2 = qword_20420;
  if (!qword_20420)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20420);
    return WitnessTable;
  }
  return v2;
}

void *sub_111C8(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

unint64_t sub_11240()
{
  uint64_t v2 = qword_20430;
  if (!qword_20430)
  {
    sub_60F8(&qword_20228);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20430);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_112DC()
{
  uint64_t v2 = qword_20438;
  if (!qword_20438)
  {
    sub_60F8(&qword_20408);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20438);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_11374(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

unint64_t sub_11420()
{
  uint64_t v2 = qword_20448;
  if (!qword_20448)
  {
    sub_60F8(&qword_20228);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20448);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_114BC()
{
  uint64_t v2 = qword_20450;
  if (!qword_20450)
  {
    sub_60F8(&qword_20408);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20450);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_11554()
{
  uint64_t v2 = qword_20458;
  if (!qword_20458)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20458);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_115D4()
{
  uint64_t v2 = qword_20460;
  if (!qword_20460)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20460);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_11654()
{
  uint64_t v2 = qword_20470;
  if (!qword_20470)
  {
    sub_60F8(&qword_200A8);
    sub_116F8();
    sub_11810();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20470);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_116F8()
{
  uint64_t v2 = qword_20478;
  if (!qword_20478)
  {
    sub_60F8(&qword_201C8);
    sub_1178C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20478);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1178C()
{
  uint64_t v2 = qword_20480;
  if (!qword_20480)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20480);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_11810()
{
  uint64_t v2 = qword_20488;
  if (!qword_20488)
  {
    sub_60F8(&qword_201C8);
    sub_118A4();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20488);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_118A4()
{
  uint64_t v2 = qword_20490;
  if (!qword_20490)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20490);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_11928()
{
  uint64_t v2 = qword_204A0;
  if (!qword_204A0)
  {
    sub_60F8(&qword_200A8);
    sub_116F8();
    sub_11810();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.storyTexts.setter()
{
  return swift_bridgeObjectRelease();
}

void (*SiriSocialConversationDataModels.StoryDataModel.dialogIds.modify(void *a1))(void **a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_47B8(&qword_20240);
  v2[4] = sub_19504();
  return sub_D7F0;
}

void (*SiriSocialConversationDataModels.StoryDataModel.storyTexts.modify(void *a1))(void **a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  sub_47B8(&qword_20240);
  v2[4] = sub_19504();
  return sub_D7F0;
}

BOOL sub_11B78(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_11BFC()
{
  return sub_19954();
}

uint64_t sub_11C7C()
{
  swift_bridgeObjectRetain();
  sub_197A4("dialogIds", 9uLL, 1);
  swift_bridgeObjectRetain();
  char v3 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("storyTexts", 0xAuLL, 1);
  swift_bridgeObjectRetain();
  char v2 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_11E1C()
{
  return 2;
}

uint64_t sub_11E34()
{
  return sub_19854();
}

unint64_t sub_11E90()
{
  uint64_t v2 = qword_204A8;
  if (!qword_204A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204A8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_11F10()
{
  return 0;
}

uint64_t sub_11F34(char a1)
{
  if (a1) {
    return sub_197A4("storyTexts", 0xAuLL, 1);
  }
  else {
    return sub_197A4("dialogIds", 9uLL, 1);
  }
}

BOOL sub_11FC0(unsigned char *a1, unsigned char *a2)
{
  return sub_11B78(*a1 & 1, *a2 & 1);
}

uint64_t sub_11FEC()
{
  return sub_11E34();
}

uint64_t sub_1200C()
{
  return sub_11BFC();
}

uint64_t sub_1202C()
{
  return sub_11F34(*v0 & 1);
}

uint64_t sub_1204C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_11C7C();
  *a1 = result;
  return result;
}

uint64_t sub_12078()
{
  return sub_11F10();
}

uint64_t sub_1209C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_11E1C();
  *a1 = result;
  return result;
}

uint64_t sub_120C8()
{
  return sub_19984();
}

unint64_t sub_120F8()
{
  uint64_t v2 = qword_204B0;
  if (!qword_204B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204B0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_12178()
{
  return sub_19994();
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.encode(to:)(uint64_t a1)
{
  uint64_t v17 = a1;
  uint64_t v40 = 0;
  uint64_t v39 = 0;
  uint64_t v31 = sub_47B8(&qword_20240);
  uint64_t v24 = *(void *)(v31 - 8);
  uint64_t v25 = v31 - 8;
  unint64_t v14 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v31);
  uint64_t v15 = (char *)v9 - v14;
  unint64_t v16 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)v9 - v14);
  uint64_t v33 = (char *)v9 - v16;
  uint64_t v30 = sub_47B8(&qword_204B8);
  uint64_t v18 = *(void *)(v30 - 8);
  uint64_t v19 = v30 - 8;
  unint64_t v20 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v3 = (void *)__chkstk_darwin(v17);
  unint64_t v23 = (char *)v9 - v20;
  uint64_t v40 = v3;
  uint64_t v39 = v1;
  uint64_t v21 = v3[3];
  uint64_t v22 = v3[4];
  sub_111C8(v3, v21);
  sub_120F8();
  sub_19974();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  uint64_t v28 = v24 + 16;
  v27(v33, v26, v31);
  uint64_t v29 = &v38;
  char v38 = 0;
  unint64_t v4 = sub_125B8();
  uint64_t v5 = v32;
  unint64_t v34 = v4;
  sub_19924();
  uint64_t v35 = v5;
  uint64_t v36 = v5;
  if (v5)
  {
    void v9[2] = v36;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v33, v31);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v23, v30);
  }
  else
  {
    uint64_t v10 = *(void (**)(char *, uint64_t))(v24 + 8);
    uint64_t v11 = v24 + 8;
    v10(v33, v31);
    uint64_t v6 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    v27(v15, v26 + *(int *)(v6 + 20), v31);
    uint64_t v7 = v35;
    char v37 = 1;
    sub_19924();
    uint64_t v12 = v7;
    uint64_t v13 = v7;
    if (v7) {
      v9[1] = v13;
    }
    v10(v15, v31);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v23, v30);
  }
}

unint64_t sub_125B8()
{
  uint64_t v2 = qword_204C0;
  if (!qword_204C0)
  {
    sub_60F8(&qword_20240);
    sub_1265C();
    sub_126EC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1265C()
{
  uint64_t v2 = qword_204C8;
  if (!qword_204C8)
  {
    sub_60F8(&qword_203D0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204C8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_126EC()
{
  uint64_t v2 = qword_204D0;
  if (!qword_204D0)
  {
    sub_60F8(&qword_203D0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204D0);
    return WitnessTable;
  }
  return v2;
}

uint64_t SiriSocialConversationDataModels.StoryDataModel.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v35 = a1;
  unint64_t v47 = 0;
  uint64_t v24 = sub_47B8(&qword_20240);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v24 - 8;
  unint64_t v27 = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v10 - v27;
  unint64_t v29 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin((char *)&v10 - v27);
  uint64_t v30 = (char *)&v10 - v29;
  uint64_t v31 = sub_47B8(&qword_204D8);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = v31 - 8;
  unint64_t v34 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v31);
  uint64_t v39 = (char *)&v10 - v34;
  uint64_t v36 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  unint64_t v37 = (*(void *)(*(void *)(v36 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  char v3 = (void *)__chkstk_darwin(v35);
  uint64_t v38 = (uint64_t)&v10 - v37;
  char v48 = 0;
  unint64_t v47 = v3;
  uint64_t v41 = v3[3];
  uint64_t v42 = v3[4];
  sub_111C8(v3, v41);
  sub_120F8();
  uint64_t v4 = v40;
  sub_19964();
  uint64_t v43 = v4;
  uint64_t v44 = v4;
  if (v4)
  {
    uint64_t v13 = v44;
  }
  else
  {
    uint64_t v19 = &v46;
    char v46 = 0;
    unint64_t v5 = sub_12C18();
    uint64_t v6 = v43;
    unint64_t v20 = v5;
    sub_198D4();
    uint64_t v21 = v6;
    uint64_t v22 = v6;
    if (v6)
    {
      uint64_t v12 = v22;
      (*(void (**)(char *, uint64_t))(v32 + 8))(v39, v31);
      uint64_t v13 = v12;
    }
    else
    {
      int v16 = 1;
      char v48 = 1;
      unint64_t v14 = *(void (**)(uint64_t, char *, uint64_t))(v25 + 32);
      uint64_t v15 = v25 + 32;
      v14(v38, v30, v24);
      uint64_t v7 = v21;
      char v45 = v16;
      sub_198D4();
      uint64_t v17 = v7;
      uint64_t v18 = v7;
      if (!v7)
      {
        uint64_t v8 = v38 + *(int *)(v36 + 20);
        char v48 = 3;
        v14(v8, v28, v24);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v39, v31);
        sub_A8E8(v38, v23);
        sub_11374(v35);
        return sub_AA18(v38);
      }
      uint64_t v11 = v18;
      (*(void (**)(char *, uint64_t))(v32 + 8))(v39, v31);
      uint64_t v13 = v11;
    }
  }
  uint64_t v10 = v13;
  uint64_t result = sub_11374(v35);
  if (v48) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v38, v24);
  }
  return result;
}

unint64_t sub_12C18()
{
  uint64_t v2 = qword_204E0;
  if (!qword_204E0)
  {
    sub_60F8(&qword_20240);
    sub_1265C();
    sub_126EC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204E0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_12CBC()
{
  return 1;
}

uint64_t sub_12CE0()
{
  return sub_19954();
}

BOOL sub_12D38()
{
  swift_bridgeObjectRetain();
  sub_197A4("_0", 2uLL, 1);
  swift_bridgeObjectRetain();
  char v1 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v1 & 1) == 0;
}

uint64_t sub_12E30()
{
  return 1;
}

uint64_t sub_12E48()
{
  return sub_19854();
}

unint64_t sub_12E80()
{
  uint64_t v2 = qword_204E8;
  if (!qword_204E8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_12F00()
{
  return 0;
}

uint64_t sub_12F0C()
{
  return sub_197A4("_0", 2uLL, 1);
}

uint64_t sub_12F40()
{
  swift_bridgeObjectRetain();
  sub_197A4("buttonStackView", 0xFuLL, 1);
  swift_bridgeObjectRetain();
  char v3 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_197A4("storyView", 9uLL, 1);
  swift_bridgeObjectRetain();
  char v2 = sub_197B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_130E0()
{
  return sub_19854();
}

unint64_t sub_1313C()
{
  uint64_t v2 = qword_204F0;
  if (!qword_204F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204F0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_131BC(char a1)
{
  if (a1) {
    return sub_197A4("storyView", 9uLL, 1);
  }
  else {
    return sub_197A4("buttonStackView", 0xFuLL, 1);
  }
}

uint64_t sub_13248()
{
  return sub_19854();
}

unint64_t sub_13280()
{
  uint64_t v2 = qword_204F8;
  if (!qword_204F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_204F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_13300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SiriSocialConversationDataModels.StoryDataModel.init(from:)(a1, a2);
}

uint64_t sub_13358(uint64_t a1)
{
  return SiriSocialConversationDataModels.StoryDataModel.encode(to:)(a1);
}

uint64_t sub_133A4()
{
  return sub_12CBC() & 1;
}

uint64_t sub_133C0()
{
  return sub_12E48();
}

uint64_t sub_133D8()
{
  return sub_12CE0();
}

uint64_t sub_133F0()
{
  return sub_12F0C();
}

BOOL sub_13408@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_12D38();
  *a1 = result;
  return result;
}

uint64_t sub_1343C()
{
  return sub_12F00();
}

uint64_t sub_13458@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_12E30();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1348C()
{
  return sub_19984();
}

unint64_t sub_134BC()
{
  uint64_t v2 = qword_20500;
  if (!qword_20500)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20500);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1353C()
{
  return sub_19994();
}

uint64_t sub_1356C()
{
  return sub_130E0();
}

uint64_t sub_1358C()
{
  return sub_131BC(*v0 & 1);
}

uint64_t sub_135AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_12F40();
  *a1 = result;
  return result;
}

uint64_t sub_135D8()
{
  return sub_19984();
}

unint64_t sub_13608()
{
  uint64_t v2 = qword_20508;
  if (!qword_20508)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20508);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_13688()
{
  return sub_19994();
}

uint64_t sub_136B8()
{
  return sub_13248();
}

uint64_t sub_136D0()
{
  return sub_19984();
}

unint64_t sub_13700()
{
  uint64_t v2 = qword_20510;
  if (!qword_20510)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20510);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_13780()
{
  return sub_19994();
}

uint64_t SiriSocialConversationDataModels.encode(to:)(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v50 = 0;
  uint64_t v49 = 0;
  uint64_t v18 = sub_47B8(&qword_20518);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = v18 - 8;
  unint64_t v21 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)v6 - v21;
  uint64_t v31 = 0;
  uint64_t v23 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
  unint64_t v24 = (*(void *)(*(void *)(v23 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v23);
  uint64_t v25 = (uint64_t)v6 - v24;
  uint64_t v26 = sub_47B8(&qword_20520);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = v26 - 8;
  unint64_t v29 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v31);
  uint64_t v30 = (char *)v6 - v29;
  uint64_t v32 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  unint64_t v33 = (*(void *)(*(void *)(v32 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v31);
  uint64_t v34 = (uint64_t)v6 - v33;
  uint64_t v45 = type metadata accessor for SiriSocialConversationDataModels();
  unint64_t v35 = (*(void *)(*(void *)(v45 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v45);
  uint64_t v46 = (uint64_t)v6 - v35;
  uint64_t v37 = sub_47B8(&qword_20528);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = v37 - 8;
  unint64_t v40 = (*(void *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = (void *)__chkstk_darwin(v36);
  uint64_t v41 = (char *)v6 - v40;
  uint64_t v50 = v2;
  uint64_t v49 = v1;
  uint64_t v42 = v2[3];
  uint64_t v43 = v2[4];
  sub_111C8(v2, v42);
  sub_13608();
  sub_19974();
  sub_A694(v44, v46);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_A83C(v46, v25);
    uint64_t v10 = &v48;
    char v48 = 1;
    sub_13700();
    sub_198F4();
    sub_13E80();
    uint64_t v4 = v17;
    sub_19924();
    uint64_t v11 = v4;
    uint64_t v12 = v4;
    if (!v4)
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
      sub_AA18(v25);
      uint64_t v13 = v11;
      goto LABEL_6;
    }
    v6[1] = v12;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    sub_AA18(v25);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v41, v37);
  }
  else
  {
    sub_8500(v46, v34);
    unint64_t v14 = &v47;
    char v47 = 0;
    sub_134BC();
    sub_198F4();
    sub_13F04();
    uint64_t v3 = v17;
    sub_19924();
    uint64_t v15 = v3;
    uint64_t v16 = v3;
    if (!v3)
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
      sub_7824(v34);
      uint64_t v13 = v15;
LABEL_6:
      uint64_t v9 = v13;
      return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v41, v37);
    }
    uint64_t v7 = v16;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
    sub_7824(v34);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v41, v37);
    uint64_t v8 = v7;
  }
  return result;
}

uint64_t type metadata accessor for SiriSocialConversationDataModels()
{
  uint64_t v1 = qword_20618;
  if (!qword_20618) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t sub_13E80()
{
  uint64_t v2 = qword_20530;
  if (!qword_20530)
  {
    type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20530);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_13F04()
{
  uint64_t v2 = qword_20538;
  if (!qword_20538)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20538);
    return WitnessTable;
  }
  return v2;
}

uint64_t SiriSocialConversationDataModels.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v75 = a1;
  uint64_t v98 = 0;
  uint64_t v61 = sub_47B8(&qword_20540);
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v63 = v61 - 8;
  unint64_t v64 = (*(void *)(v62 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v61);
  char v65 = (char *)&v19 - v64;
  uint64_t v66 = sub_47B8(&qword_20548);
  uint64_t v67 = *(void *)(v66 - 8);
  uint64_t v68 = v66 - 8;
  unint64_t v69 = (*(void *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v66);
  uint64_t v70 = (char *)&v19 - v69;
  uint64_t v71 = sub_47B8(&qword_20550);
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = v71 - 8;
  unint64_t v74 = (*(void *)(v72 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v71);
  uint64_t v83 = (char *)&v19 - v74;
  uint64_t v76 = type metadata accessor for SiriSocialConversationDataModels();
  unint64_t v77 = (*(void *)(*(void *)(v76 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = __chkstk_darwin(v75);
  uint64_t v78 = (uint64_t)&v19 - v77;
  unint64_t v79 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v80 = (uint64_t)&v19 - v79;
  unint64_t v81 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = (void *)__chkstk_darwin(v4);
  uint64_t v82 = (uint64_t)&v19 - v81;
  uint64_t v98 = v6;
  uint64_t v85 = v6[3];
  uint64_t v86 = v6[4];
  sub_111C8(v6, v85);
  sub_13608();
  uint64_t v7 = v84;
  sub_19964();
  uint64_t v87 = v7;
  uint64_t v88 = v7;
  if (v7)
  {
    uint64_t v32 = v88;
  }
  else
  {
    uint64_t v8 = sub_198E4();
    uint64_t v56 = &v93;
    uint64_t v93 = v8;
    uint64_t v55 = sub_47B8(&qword_20558);
    sub_14AD8();
    uint64_t v94 = sub_19844();
    uint64_t v95 = v9;
    uint64_t v96 = v10;
    uint64_t v97 = v11;
    uint64_t v57 = sub_47B8(&qword_20568);
    unint64_t v58 = sub_14B5C();
    sub_19814();
    int v59 = v92;
    if (v92 == 2) {
      goto LABEL_14;
    }
    int v54 = v59;
    int v47 = v59;
    uint64_t v52 = v94;
    uint64_t v48 = v95;
    uint64_t v49 = v96;
    uint64_t v50 = v97;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v51 = v91;
    v91[0] = v52;
    v91[1] = v48;
    v91[2] = v49;
    v91[3] = v50;
    int v53 = sub_19824();
    sub_14BE0();
    swift_unknownObjectRelease();
    if ((v53 & 1) == 0)
    {
LABEL_14:
      uint64_t v26 = 0;
      uint64_t v30 = sub_19874();
      int v24 = 1;
      uint64_t v31 = swift_allocError();
      unint64_t v29 = v17;
      uint64_t v18 = sub_47B8(&qword_20578);
      uint64_t v25 = (char *)v29 + *(int *)(v18 + 48);
      *unint64_t v29 = v76;
      uint64_t v27 = sub_198A4();
      uint64_t v28 = sub_197A4("Invalid number of keys found, expected one.", 0x2BuLL, v24 & 1);
      sub_19864();
      (*(void (**)(uint64_t *, void))(*(void *)(v30 - 8) + 104))(v29, enum case for DecodingError.typeMismatch(_:));
      swift_willThrow();
      sub_14BE0();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v83, v71);
      uint64_t v32 = v31;
    }
    else if (v47)
    {
      uint64_t v37 = &v90;
      char v90 = v47 & 1;
      sub_13700();
      uint64_t v14 = v87;
      sub_19894();
      uint64_t v38 = v14;
      uint64_t v39 = v14;
      if (v14)
      {
        uint64_t v21 = v39;
        sub_14BE0();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v83, v71);
        uint64_t v32 = v21;
      }
      else
      {
        uint64_t v34 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
        sub_14C0C();
        uint64_t v15 = v38;
        sub_198D4();
        uint64_t v35 = v15;
        uint64_t v36 = v15;
        if (!v15)
        {
          swift_storeEnumTagMultiPayload();
          sub_14C90(v78, v82);
          (*(void (**)(char *, uint64_t))(v62 + 8))(v65, v61);
          uint64_t v40 = v35;
          goto LABEL_13;
        }
        uint64_t v20 = v36;
        (*(void (**)(char *, uint64_t))(v62 + 8))(v65, v61);
        sub_14BE0();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v83, v71);
        uint64_t v32 = v20;
      }
    }
    else
    {
      uint64_t v44 = &v89;
      char v89 = v47 & 1;
      sub_134BC();
      uint64_t v12 = v87;
      sub_19894();
      uint64_t v45 = v12;
      uint64_t v46 = v12;
      if (v12)
      {
        uint64_t v23 = v46;
        sub_14BE0();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v83, v71);
        uint64_t v32 = v23;
      }
      else
      {
        uint64_t v41 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
        sub_14F28();
        uint64_t v13 = v45;
        sub_198D4();
        uint64_t v42 = v13;
        uint64_t v43 = v13;
        if (!v13)
        {
          swift_storeEnumTagMultiPayload();
          sub_14C90(v80, v82);
          (*(void (**)(char *, uint64_t))(v67 + 8))(v70, v66);
          uint64_t v40 = v42;
LABEL_13:
          uint64_t v33 = v40;
          sub_14BE0();
          (*(void (**)(char *, uint64_t))(v72 + 8))(v83, v71);
          sub_A694(v82, v60);
          sub_11374(v75);
          return sub_14E0C(v82);
        }
        uint64_t v22 = v43;
        (*(void (**)(char *, uint64_t))(v67 + 8))(v70, v66);
        sub_14BE0();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v83, v71);
        uint64_t v32 = v22;
      }
    }
  }
  uint64_t v19 = v32;
  return sub_11374(v75);
}

unint64_t sub_14AD8()
{
  uint64_t v2 = qword_20560;
  if (!qword_20560)
  {
    sub_60F8(&qword_20558);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20560);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_14B5C()
{
  uint64_t v2 = qword_20570;
  if (!qword_20570)
  {
    sub_60F8(&qword_20568);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20570);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_14BE0()
{
}

unint64_t sub_14C0C()
{
  uint64_t v2 = qword_20580;
  if (!qword_20580)
  {
    type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20580);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_14C90(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SiriSocialConversationDataModels();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_47B8(&qword_20240);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
    v7(a2, a1);
    uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a2 + *(int *)(v4 + 20), a1 + *(int *)(v4 + 20), v6);
  }
  else
  {
    uint64_t v2 = sub_47B8(&qword_200A8);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
    uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    *(_OWORD *)(a2 + *(int *)(v3 + 20)) = *(_OWORD *)(a1 + *(int *)(v3 + 20));
    *(unsigned char *)(a2 + *(int *)(v3 + 24)) = *(unsigned char *)(a1 + *(int *)(v3 + 24));
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_14E0C(uint64_t a1)
{
  type metadata accessor for SiriSocialConversationDataModels();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_47B8(&qword_20240);
    uint64_t v4 = *(void (**)(uint64_t))(*(void *)(v5 - 8) + 8);
    v4(a1);
    uint64_t v2 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    ((void (*)(uint64_t, uint64_t))v4)(a1 + *(int *)(v2 + 20), v5);
  }
  else
  {
    uint64_t v1 = sub_47B8(&qword_200A8);
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t sub_14F28()
{
  uint64_t v2 = qword_20588;
  if (!qword_20588)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20588);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_14FAC()
{
  return sub_14FC4();
}

unint64_t sub_14FC4()
{
  uint64_t v2 = qword_20590;
  if (!qword_20590)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20590);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_15048()
{
  return sub_14F28();
}

unint64_t sub_15060()
{
  return sub_13F04();
}

unint64_t sub_15078()
{
  return sub_14C0C();
}

unint64_t sub_15090()
{
  return sub_13E80();
}

unint64_t sub_150A8()
{
  return sub_150C0();
}

unint64_t sub_150C0()
{
  uint64_t v2 = qword_20598;
  if (!qword_20598)
  {
    type metadata accessor for SiriSocialConversationDataModels();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20598);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_15144()
{
  return sub_1515C();
}

unint64_t sub_1515C()
{
  uint64_t v2 = qword_205A0;
  if (!qword_205A0)
  {
    type metadata accessor for SiriSocialConversationDataModels();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_205A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_151E0()
{
  return static SiriSocialConversationDataModels.bundleName.getter();
}

uint64_t sub_151F8()
{
  return sub_194C4() & 1;
}

uint64_t sub_15214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SiriSocialConversationDataModels.init(from:)(a1, a2);
}

uint64_t sub_1526C(uint64_t a1)
{
  return SiriSocialConversationDataModels.encode(to:)(a1);
}

unint64_t initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels(char *a1, char *a2, uint64_t a3)
{
  int v16 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v16 & 0x20000) != 0)
  {
    uint64_t v12 = *(void *)a2;
    swift_retain();
    *(void *)a1 = v12;
    return *(void *)a1 + ((v16 + 16) & ~(unint64_t)v16);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_47B8(&qword_20240);
      uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
      ((void (*)(char *, char *))v8)(a1, a2);
      uint64_t v5 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
      v8(&a1[*(int *)(v5 + 20)], &a2[*(int *)(v5 + 20)], v7);
    }
    else
    {
      uint64_t v3 = sub_47B8(&qword_200A8);
      (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(a1, a2);
      uint64_t v11 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
      uint64_t v9 = &a1[*(int *)(v11 + 20)];
      uint64_t v4 = &a2[*(int *)(v11 + 20)];
      *(void *)uint64_t v9 = *(void *)v4;
      uint64_t v10 = *((void *)v4 + 1);
      swift_bridgeObjectRetain();
      *((void *)v9 + 1) = v10;
      a1[*(int *)(v11 + 24)] = a2[*(int *)(v11 + 24)];
    }
    swift_storeEnumTagMultiPayload();
    return (unint64_t)a1;
  }
}

uint64_t destroy for SiriSocialConversationDataModels(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_47B8(&qword_20240);
    uint64_t v4 = *(void (**)(uint64_t))(*(void *)(v5 - 8) + 8);
    v4(a1);
    uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1 + *(int *)(v3 + 20), v5);
  }
  else
  {
    uint64_t v1 = sub_47B8(&qword_200A8);
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    return swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_47B8(&qword_20240);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
    v7(a1, a2);
    uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20), v6);
  }
  else
  {
    uint64_t v2 = sub_47B8(&qword_200A8);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, a2);
    uint64_t v10 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    uint64_t v8 = (void *)(a1 + *(int *)(v10 + 20));
    uint64_t v3 = (void *)(a2 + *(int *)(v10 + 20));
    *uint64_t v8 = *v3;
    uint64_t v9 = v3[1];
    swift_bridgeObjectRetain();
    v8[1] = v9;
    *(unsigned char *)(a1 + *(int *)(v10 + 24)) = *(unsigned char *)(a2 + *(int *)(v10 + 24));
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_14E0C(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_47B8(&qword_20240);
      uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2);
      uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
      ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20), v6);
    }
    else
    {
      uint64_t v2 = sub_47B8(&qword_200A8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, a2);
      uint64_t v10 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
      uint64_t v8 = (void *)(a1 + *(int *)(v10 + 20));
      uint64_t v3 = (void *)(a2 + *(int *)(v10 + 20));
      *uint64_t v8 = *v3;
      uint64_t v9 = v3[1];
      swift_bridgeObjectRetain();
      v8[1] = v9;
      *(unsigned char *)(a1 + *(int *)(v10 + 24)) = *(unsigned char *)(a2 + *(int *)(v10 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_47B8(&qword_20240);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
    v7(a1, a2);
    uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20), v6);
  }
  else
  {
    uint64_t v2 = sub_47B8(&qword_200A8);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a1, a2);
    uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
    *(_OWORD *)(a1 + *(int *)(v3 + 20)) = *(_OWORD *)(a2 + *(int *)(v3 + 20));
    *(unsigned char *)(a1 + *(int *)(v3 + 24)) = *(unsigned char *)(a2 + *(int *)(v3 + 24));
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_14E0C(a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_47B8(&qword_20240);
      uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
      v7(a1, a2);
      uint64_t v4 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
      ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20), v6);
    }
    else
    {
      uint64_t v2 = sub_47B8(&qword_200A8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a1, a2);
      uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
      *(_OWORD *)(a1 + *(int *)(v3 + 20)) = *(_OWORD *)(a2 + *(int *)(v3 + 20));
      *(unsigned char *)(a1 + *(int *)(v3 + 24)) = *(unsigned char *)(a2 + *(int *)(v3 + 24));
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_15CC4()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_15CDC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_15D08()
{
  uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel();
  if (v0 <= 0x3F)
  {
    uint64_t v3 = type metadata accessor for SiriSocialConversationDataModels.StoryDataModel();
    if (v1 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return v3;
}

unint64_t initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.ButtonModel(void *a1, void *a2, int *a3)
{
  int v18 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v18 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    swift_retain();
    *a1 = v13;
    return *a1 + ((v18 + 16) & ~(unint64_t)v18);
  }
  else
  {
    uint64_t v3 = sub_47B8(&qword_20228);
    (*(void (**)(void *, void *))(*(void *)(v3 - 8) + 16))(a1, a2);
    uint64_t v4 = a3[5];
    uint64_t v7 = (char *)a1 + v4;
    *(void *)((char *)a1 + v4) = *(void *)((char *)a2 + v4);
    uint64_t v8 = *(void *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((void *)v7 + 1) = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
    *(void *)((char *)a1 + v9) = v10;
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    uint64_t v5 = a3[8];
    uint64_t v11 = (char *)a1 + v5;
    *(void *)((char *)a1 + v5) = *(void *)((char *)a2 + v5);
    uint64_t v12 = *(void *)((char *)a2 + v5 + 8);
    swift_bridgeObjectRetain();
    *((void *)v11 + 1) = v12;
    return (unint64_t)a1;
  }
}

uint64_t destroy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1)
{
  uint64_t v1 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v7 = (void *)(a1 + a3[5]);
  void *v7 = *v4;
  uint64_t v8 = v4[1];
  swift_bridgeObjectRetain();
  v7[1] = v8;
  uint64_t v9 = a3[6];
  uint64_t v10 = *(void *)(a2 + v9);
  swift_bridgeObjectRetain();
  *(void *)(a1 + v9) = v10;
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v5 = (void *)(a2 + a3[8]);
  uint64_t v14 = (void *)(a1 + a3[8]);
  *uint64_t v14 = *v5;
  uint64_t v15 = v5[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  v14[1] = v15;
  return result;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v7 = (void *)(a1 + a3[5]);
  void *v7 = *v4;
  uint64_t v8 = v4[1];
  swift_bridgeObjectRetain();
  v7[1] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[6];
  uint64_t v10 = *(void *)(a2 + v9);
  swift_bridgeObjectRetain();
  *(void *)(a1 + v9) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]) & 1;
  uint64_t v5 = (void *)(a2 + a3[8]);
  uint64_t v13 = (void *)(a1 + a3[8]);
  *uint64_t v13 = *v5;
  uint64_t v14 = v5[1];
  swift_bridgeObjectRetain();
  v13[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  __n128 result = *(__n128 *)(a2 + a3[8]);
  *(__n128 *)(a1 + a3[8]) = result;
  return result;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_47B8(&qword_20228);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v5 = (void *)(a1 + a3[5]);
  *uint64_t v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]) & 1;
  uint64_t v6 = (void *)(a2 + a3[8]);
  uint64_t v7 = (void *)(a1 + a3[8]);
  void *v7 = *v6;
  v7[1] = v6[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1652C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_47B8(&qword_20228);
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20) + 8) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_16680(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_47B8(&qword_20228);
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_16780()
{
  uint64_t v2 = sub_16884();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_16884()
{
  uint64_t v4 = qword_206B8;
  if (!qword_206B8)
  {
    unint64_t v3 = sub_19544();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_206B8);
      return v1;
    }
  }
  return v4;
}

unsigned char *sub_16924(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_16934(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFB) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 4) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 251;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 5;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_16AE4(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFB)
  {
    unsigned int v5 = ((a3 + 4) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFB)
  {
    unsigned int v4 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 4;
    }
  }
  return result;
}

uint64_t sub_16D28(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_16D30(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void *type metadata accessor for SiriSocialConversationDataModels.ButtonModel.CodingKeys()
{
  return &unk_1CA50;
}

unint64_t initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.ButtonStackModel(void *a1, void *a2, uint64_t a3)
{
  int v13 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v13 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    swift_retain();
    *a1 = v8;
    return *a1 + ((v13 + 16) & ~(unint64_t)v13);
  }
  else
  {
    uint64_t v3 = sub_47B8(&qword_200A8);
    (*(void (**)(void *, void *))(*(void *)(v3 - 8) + 16))(a1, a2);
    uint64_t v4 = *(int *)(a3 + 20);
    int v6 = (char *)a1 + v4;
    *(void *)((char *)a1 + v4) = *(void *)((char *)a2 + v4);
    uint64_t v7 = *(void *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((void *)v6 + 1) = v7;
    *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
    return (unint64_t)a1;
  }
}

uint64_t destroy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1)
{
  uint64_t v1 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  uint64_t v4 = (void *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = (void *)(a1 + *(int *)(a3 + 20));
  void *v7 = *v4;
  uint64_t v8 = v4[1];
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  v7[1] = v8;
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return result;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  uint64_t v4 = (void *)(a2 + *(int *)(a3 + 20));
  int v6 = (void *)(a1 + *(int *)(a3 + 20));
  void *v6 = *v4;
  uint64_t v7 = v4[1];
  swift_bridgeObjectRetain();
  v6[1] = v7;
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24)) & 1;
  return result;
}

__n128 initializeWithTake for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  __n128 result = *(__n128 *)(a2 + *(int *)(a3 + 20));
  *(__n128 *)(a1 + *(int *)(a3 + 20)) = result;
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return result;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_47B8(&qword_200A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  uint64_t v4 = (void *)(a2 + *(int *)(a3 + 20));
  unsigned int v5 = (void *)(a1 + *(int *)(a3 + 20));
  *unsigned int v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24)) & 1;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_17244(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_47B8(&qword_200A8);
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20) + 8) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_17398(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_47B8(&qword_200A8);
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_17498()
{
  uint64_t v2 = sub_17584();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_17584()
{
  uint64_t v4 = qword_20760;
  if (!qword_20760)
  {
    sub_60F8(&qword_201C8);
    unint64_t v3 = sub_19544();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_20760);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_1762C(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_177DC(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 2;
    }
  }
  return result;
}

void *type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys()
{
  return &unk_1CAE0;
}

unint64_t initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.StoryDataModel(char *a1, char *a2, uint64_t a3)
{
  int v11 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v11 & 0x20000) != 0)
  {
    uint64_t v6 = *(void *)a2;
    swift_retain();
    *(void *)a1 = v6;
    return *(void *)a1 + ((v11 + 16) & ~(unint64_t)v11);
  }
  else
  {
    uint64_t v4 = sub_47B8(&qword_20240);
    unsigned int v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16);
    ((void (*)(char *, char *))v5)(a1, a2);
    v5(&a1[*(int *)(a3 + 20)], &a2[*(int *)(a3 + 20)], v4);
    return (unint64_t)a1;
  }
}

uint64_t destroy for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_47B8(&qword_20240);
  uint64_t v6 = *(void (**)(uint64_t))(*(void *)(v5 - 8) + 8);
  v6(a1);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v5);
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_47B8(&qword_20240);
  int v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_47B8(&qword_20240);
  int v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_47B8(&qword_20240);
  int v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.StoryDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_47B8(&qword_20240);
  int v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.StoryDataModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_17ED4(uint64_t a1, unsigned int a2)
{
  uint64_t v6 = sub_47B8(&qword_20240);
  if (a2 == *(_DWORD *)(*(void *)(v6 - 8) + 84)) {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 48))(a1, a2, v6);
  }
  else {
    __break(1u);
  }
  return v3;
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.StoryDataModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_17FBC(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = sub_47B8(&qword_20240);
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  __break(1u);
  return result;
}

uint64_t sub_1807C()
{
  uint64_t v2 = sub_1815C();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_1815C()
{
  uint64_t v4 = qword_20800;
  if (!qword_20800)
  {
    sub_60F8(&qword_203D0);
    unint64_t v3 = sub_19544();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_20800);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_18204(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_183B4(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_185F8(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_18604(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for SiriSocialConversationDataModels.StoryDataModel.CodingKeys()
{
  return &unk_1CB70;
}

void *type metadata accessor for SiriSocialConversationDataModels.CodingKeys()
{
  return &unk_1CC00;
}

uint64_t sub_18640(unsigned __int8 *a1, int a2)
{
  if (a2)
  {
    int v6 = 1;
    if ((a2 + 1) >= 0x100)
    {
      if ((a2 + 1) >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v6 = v2;
    }
    if (v6 == 1)
    {
      int v5 = *a1;
    }
    else if (v6 == 2)
    {
      int v5 = *(unsigned __int16 *)a1;
    }
    else
    {
      int v5 = *(_DWORD *)a1;
    }
    if (v5) {
      int v4 = v5 - 1;
    }
    else {
      int v4 = -1;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

unsigned char *sub_187D4(unsigned char *result, int a2, int a3)
{
  int v5 = 0;
  if (a3)
  {
    int v4 = 1;
    if ((a3 + 1) >= 0x100)
    {
      if ((a3 + 1) >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v4 = v3;
    }
    int v5 = v4;
  }
  if (a2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
        *uint64_t result = a2;
      }
      else if (v5 == 2)
      {
        *(_WORD *)uint64_t result = a2;
      }
      else
      {
        *(_DWORD *)uint64_t result = a2;
      }
    }
  }
  else if (v5)
  {
    if (v5 == 1)
    {
      *uint64_t result = 0;
    }
    else if (v5 == 2)
    {
      *(_WORD *)uint64_t result = 0;
    }
    else
    {
      *(_DWORD *)uint64_t result = 0;
    }
  }
  return result;
}

uint64_t sub_189E4()
{
  return 0;
}

void *type metadata accessor for SiriSocialConversationDataModels.ButtonStackViewCodingKeys()
{
  return &unk_1CC90;
}

void *type metadata accessor for SiriSocialConversationDataModels.StoryViewCodingKeys()
{
  return &unk_1CD20;
}

unint64_t sub_18A14()
{
  return sub_18A2C();
}

unint64_t sub_18A2C()
{
  uint64_t v2 = qword_20830;
  if (!qword_20830)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20830);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18AAC()
{
  return sub_18AC4();
}

unint64_t sub_18AC4()
{
  uint64_t v2 = qword_20838;
  if (!qword_20838)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20838);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18B44()
{
  return sub_18B5C();
}

unint64_t sub_18B5C()
{
  uint64_t v2 = qword_20840;
  if (!qword_20840)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20840);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18BDC()
{
  return sub_18BF4();
}

unint64_t sub_18BF4()
{
  uint64_t v2 = qword_20848;
  if (!qword_20848)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20848);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18C74()
{
  return sub_18C8C();
}

unint64_t sub_18C8C()
{
  uint64_t v2 = qword_20850;
  if (!qword_20850)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20850);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18D0C()
{
  return sub_18D24();
}

unint64_t sub_18D24()
{
  uint64_t v2 = qword_20858;
  if (!qword_20858)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20858);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18DA4()
{
  return sub_18DBC();
}

unint64_t sub_18DBC()
{
  uint64_t v2 = qword_20860;
  if (!qword_20860)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20860);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18E3C()
{
  return sub_18E54();
}

unint64_t sub_18E54()
{
  uint64_t v2 = qword_20868;
  if (!qword_20868)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20868);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18ED4()
{
  return sub_18EEC();
}

unint64_t sub_18EEC()
{
  uint64_t v2 = qword_20870;
  if (!qword_20870)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20870);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_18F6C()
{
  return sub_18F84();
}

unint64_t sub_18F84()
{
  uint64_t v2 = qword_20878;
  if (!qword_20878)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20878);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_19004()
{
  return sub_1901C();
}

unint64_t sub_1901C()
{
  uint64_t v2 = qword_20880;
  if (!qword_20880)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20880);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1909C()
{
  return sub_190B4();
}

unint64_t sub_190B4()
{
  uint64_t v2 = qword_20888;
  if (!qword_20888)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20888);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_19134()
{
  return sub_1914C();
}

unint64_t sub_1914C()
{
  uint64_t v2 = qword_20890;
  if (!qword_20890)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20890);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_191CC()
{
  return sub_191E4();
}

unint64_t sub_191E4()
{
  uint64_t v2 = qword_20898;
  if (!qword_20898)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_20898);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_19264()
{
  return sub_1927C();
}

unint64_t sub_1927C()
{
  uint64_t v2 = qword_208A0;
  if (!qword_208A0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_208A0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_192FC()
{
  return sub_19314();
}

unint64_t sub_19314()
{
  uint64_t v2 = qword_208A8;
  if (!qword_208A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_208A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_19394()
{
  return sub_193AC();
}

unint64_t sub_193AC()
{
  uint64_t v2 = qword_208B0;
  if (!qword_208B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_208B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1942C()
{
  return sub_19444();
}

unint64_t sub_19444()
{
  uint64_t v2 = qword_208B8;
  if (!qword_208B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_208B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_194C4()
{
  return SnippetPluginModel.snippetHidden(for:idiom:)();
}

uint64_t sub_194D4()
{
  return AppPunchout.init(punchOutUri:bundleId:appDisplayName:)();
}

uint64_t sub_194E4()
{
  return type metadata accessor for AppPunchout();
}

uint64_t sub_194F4()
{
  return Loggable.init(wrappedValue:)();
}

uint64_t sub_19504()
{
  return Loggable.wrappedValue.modify();
}

uint64_t sub_19514()
{
  return Loggable.wrappedValue.getter();
}

uint64_t sub_19524()
{
  return Loggable.wrappedValue.setter();
}

uint64_t sub_19534()
{
  return static Loggable<A>.== infix(_:_:)();
}

uint64_t sub_19544()
{
  return type metadata accessor for Loggable();
}

uint64_t sub_19554()
{
  return static PreviewProvider.platform.getter();
}

uint64_t sub_19564()
{
  return static PreviewProvider._platform.getter();
}

uint64_t sub_19574()
{
  return static PreviewProvider._previews.getter();
}

uint64_t sub_19584()
{
  return EnvironmentObject.wrappedValue.getter();
}

uint64_t sub_19594()
{
  return EnvironmentObject.init()();
}

uint64_t sub_195A4()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_195B4()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_195C4()
{
  return static PrimitiveButtonStyle<>.rfButton.getter();
}

uint64_t sub_195D4()
{
  return static Font.body.getter();
}

uint64_t sub_195E4()
{
  return static Font.custom(_:size:)();
}

uint64_t sub_195F4()
{
  return List<>.init(content:)();
}

uint64_t sub_19604()
{
  return Text.font(_:)();
}

uint64_t sub_19614()
{
  return Text.init<A>(_:)();
}

uint64_t sub_19624()
{
  return View.eraseToAnyView()();
}

uint64_t sub_19634()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_19644()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_19654()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_19664()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_19674()
{
  return View.font(_:)();
}

uint64_t sub_19684()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_19694()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_196A4()
{
  return TupleView.init(_:)();
}

uint64_t sub_196B4()
{
  return SnippetPreview.init(snippetModel:content:)();
}

uint64_t sub_196C4()
{
  return type metadata accessor for RFButtonStyle();
}

uint64_t sub_196D4()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_196E4()
{
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t sub_196F4()
{
  return type metadata accessor for BinaryButtonView();
}

uint64_t sub_19704()
{
  return LongItemTextView.init(text1:)();
}

uint64_t sub_19714()
{
  return type metadata accessor for LongItemTextView();
}

uint64_t sub_19724()
{
  return type metadata accessor for SashStandardView();
}

uint64_t sub_19734()
{
  return SashStandardView.init(_:titleColor:showOnWatch:)();
}

uint64_t sub_19744()
{
  return dispatch thunk of Context.perform(appPunchout:)();
}

uint64_t sub_19754()
{
  return dispatch thunk of Context.perform(directInvocation:payload:)();
}

uint64_t sub_19764()
{
  return type metadata accessor for Context();
}

uint64_t sub_19774()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_19784()
{
  return static Dictionary<>.== infix(_:_:)();
}

Swift::Int sub_19794(Swift::Int seed)
{
  return Hashable._rawHashValue(seed:)(seed);
}

uint64_t sub_197A4(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII)._countAndFlagsBits;
}

uint64_t sub_197B4()
{
  return static String.== infix(_:_:)();
}

uint64_t sub_197C4()
{
  return String.isEmpty.getter();
}

uint64_t sub_197D4()
{
  return Array.count.getter();
}

uint64_t sub_197E4()
{
  return type metadata accessor for Array();
}

uint64_t sub_197F4()
{
  return Array.init<A>(_:)();
}

uint64_t sub_19804()
{
  return Array.subscript.getter();
}

uint64_t sub_19814()
{
  return Collection<>.popFirst()();
}

uint64_t sub_19824()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_19834()
{
  return type metadata accessor for Optional();
}

uint64_t sub_19844()
{
  return ArraySlice.init<A>(_:)();
}

uint64_t sub_19854()
{
  return _hashValue<A>(for:)();
}

uint64_t sub_19864()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_19874()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_19884()
{
  return _dictionaryUpCast<A, B, C, D>(_:)();
}

uint64_t sub_19894()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_198A4()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_198B4()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_198C4()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_198D4()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_198E4()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_198F4()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_19904()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_19914()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_19924()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_19934()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t sub_19944()
{
  return zip<A, B>(_:_:)();
}

uint64_t sub_19954()
{
  return Hasher.combine<A>(_:)();
}

uint64_t sub_19964()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_19974()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_19984()
{
  return CodingKey.description.getter();
}

uint64_t sub_19994()
{
  return CodingKey.debugDescription.getter();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return _swift_getEnumTagSinglePayloadGeneric();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return _swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}