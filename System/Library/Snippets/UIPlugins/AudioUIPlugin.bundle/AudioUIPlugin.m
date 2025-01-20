uint64_t SiriAudioSnippets.snippetHidden(for:idiom:)()
{
  return 0;
}

uint64_t SiriAudioSnippets.snippet.getter()
{
  uint64_t v142 = type metadata accessor for SiriAudioMediaPlayerSnippet(0);
  __chkstk_darwin(v142);
  v141 = (char *)&v132 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_17FF0();
  uint64_t v140 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  v139 = (char *)&v132 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = type metadata accessor for SiriAudioShazamSnippet(0);
  __chkstk_darwin(v137);
  v136 = (char *)&v132 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_180F0();
  uint64_t v135 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  v134 = (char *)&v132 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v4 = __chkstk_darwin(v150);
  v146 = (uint64_t *)((char *)&v132 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  uint64_t v148 = (uint64_t)&v132 - v6;
  uint64_t v149 = sub_17FC0();
  uint64_t v147 = *(void *)(v149 - 8);
  uint64_t v7 = __chkstk_darwin(v149);
  v144 = (char *)&v132 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v145 = (char *)&v132 - v9;
  uint64_t v156 = type metadata accessor for SiriAudioSimpleTextSnippet();
  __chkstk_darwin(v156);
  v155 = (char *)&v132 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v157 = sub_17F70();
  uint64_t v154 = *(void *)(v157 - 8);
  __chkstk_darwin(v157);
  v153 = (char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = type metadata accessor for SiriAudioDisambiguationSnippet();
  __chkstk_darwin(v161);
  v160 = (char *)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_180D0();
  uint64_t v159 = *(void *)(v162 - 8);
  __chkstk_darwin(v162);
  v158 = (char *)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = type metadata accessor for SiriAudioActionButtonSnippet();
  __chkstk_darwin(v166);
  v165 = (char *)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_18050();
  uint64_t v164 = *(void *)(v167 - 8);
  __chkstk_darwin(v167);
  v163 = (char *)&v132 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = type metadata accessor for ConfirmationSnippet();
  __chkstk_darwin(v168);
  v17 = (char *)&v132 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_18170();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v170 = v18;
  uint64_t v171 = v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v133 = (char *)&v132 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  v132 = (char *)&v132 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v152 = (char *)&v132 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v151 = (char *)&v132 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v30 = (char *)&v132 - v29;
  uint64_t v31 = __chkstk_darwin(v28);
  v33 = (char *)&v132 - v32;
  __chkstk_darwin(v31);
  v35 = (char *)&v132 - v34;
  uint64_t v36 = sub_18080();
  uint64_t v37 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  v39 = (char *)&v132 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_17F50();
  uint64_t v41 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  v43 = (char *)&v132 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v43, v169, v40);
  int v44 = (*(uint64_t (**)(char *, uint64_t))(v41 + 88))(v43, v40);
  if (v44 == enum case for SiriAudioSnippets.confirmation(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v43, v40);
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v39, v43, v36);
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v45 = v170;
    uint64_t v46 = sub_7590(v170, (uint64_t)qword_21CD8);
    uint64_t v47 = v171;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v35, v46, v45);
    v48 = sub_18150();
    os_log_type_t v49 = sub_186C0();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_0, v48, v49, "SiriAudioSnippets#snippet create ConfirmationSnippet", v50, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v47 + 8))(v35, v45);
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v17, v39, v36);
    v51 = (uint64_t *)&v17[*(int *)(v168 + 20)];
    sub_18650();
    sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t *v51 = sub_18250();
    v51[1] = v52;
    sub_7680(&qword_20810, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippet);
    uint64_t v53 = sub_183C0();
    sub_76C8((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for ConfirmationSnippet);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v36);
    return v53;
  }
  if (v44 == enum case for SiriAudioSnippets.actionButton(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v43, v40);
    v55 = v163;
    uint64_t v54 = v164;
    v56 = v43;
    uint64_t v57 = v167;
    (*(void (**)(char *, char *, uint64_t))(v164 + 32))(v163, v56, v167);
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v58 = v170;
    uint64_t v59 = sub_7590(v170, (uint64_t)qword_21CD8);
    uint64_t v60 = v171;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v33, v59, v58);
    v61 = sub_18150();
    os_log_type_t v62 = sub_186C0();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_0, v61, v62, "SiriAudioSnippets#snippet create SiriAudioActionButtonSnippet", v63, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v60 + 8))(v33, v58);
    uint64_t v64 = (uint64_t)v165;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v165, v55, v57);
    v65 = (uint64_t *)(v64 + *(int *)(v166 + 20));
    sub_18650();
    sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t *v65 = sub_18250();
    v65[1] = v66;
    sub_7680(&qword_20808, (void (*)(uint64_t))type metadata accessor for SiriAudioActionButtonSnippet);
    uint64_t v53 = sub_183C0();
    v67 = type metadata accessor for SiriAudioActionButtonSnippet;
LABEL_19:
    sub_76C8(v64, (uint64_t (*)(void))v67);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v57);
    return v53;
  }
  if (v44 == enum case for SiriAudioSnippets.disambiguation(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v43, v40);
    v55 = v158;
    uint64_t v54 = v159;
    v68 = v43;
    uint64_t v57 = v162;
    (*(void (**)(char *, char *, uint64_t))(v159 + 32))(v158, v68, v162);
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v69 = v170;
    uint64_t v70 = sub_7590(v170, (uint64_t)qword_21CD8);
    uint64_t v71 = v171;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v30, v70, v69);
    v72 = sub_18150();
    os_log_type_t v73 = sub_186C0();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_0, v72, v73, "SiriAudioSnippets#snippet create SiriAudioDisambiguationSnippet", v74, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v30, v69);
    uint64_t v64 = (uint64_t)v160;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v160, v55, v57);
    v75 = (uint64_t *)(v64 + *(int *)(v161 + 20));
    sub_18650();
    sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t *v75 = sub_18250();
    v75[1] = v76;
    sub_7680(&qword_20800, (void (*)(uint64_t))type metadata accessor for SiriAudioDisambiguationSnippet);
    uint64_t v53 = sub_183C0();
    v67 = type metadata accessor for SiriAudioDisambiguationSnippet;
    goto LABEL_19;
  }
  if (v44 == enum case for SiriAudioSnippets.simpleText(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v43, v40);
    uint64_t v78 = v154;
    v79 = v153;
    uint64_t v80 = v157;
    (*(void (**)(char *, char *, uint64_t))(v154 + 32))(v153, v43, v157);
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v81 = v170;
    uint64_t v82 = sub_7590(v170, (uint64_t)qword_21CD8);
    uint64_t v83 = v171;
    v84 = v151;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v151, v82, v81);
    v85 = sub_18150();
    os_log_type_t v86 = sub_186C0();
    if (os_log_type_enabled(v85, v86))
    {
      v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_0, v85, v86, "SiriAudioSnippets#snippet create Section Header standard view", v87, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v81);
    v88 = v155;
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v155, v79, v80);
    v89 = (uint64_t *)&v88[*(int *)(v156 + 20)];
    sub_18650();
    sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t *v89 = sub_18250();
    v89[1] = v90;
    sub_7680(&qword_207F8, (void (*)(uint64_t))type metadata accessor for SiriAudioSimpleTextSnippet);
    uint64_t v53 = sub_183C0();
    v91 = (uint64_t (*)(uint64_t))type metadata accessor for SiriAudioSimpleTextSnippet;
LABEL_27:
    v92 = v91;
    uint64_t v93 = (uint64_t)v88;
LABEL_28:
    sub_76C8(v93, v92);
    (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v80);
    return v53;
  }
  if (v44 == enum case for SiriAudioSnippets.alternatives(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v43, v40);
    uint64_t v94 = v147;
    v95 = *(void (**)(char *, char *, uint64_t))(v147 + 32);
    v96 = v145;
    uint64_t v97 = v149;
    v95(v145, v43, v149);
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v98 = v170;
    uint64_t v99 = sub_7590(v170, (uint64_t)qword_21CD8);
    uint64_t v100 = v171;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v152, v99, v98);
    v101 = sub_18150();
    os_log_type_t v102 = sub_186C0();
    if (os_log_type_enabled(v101, v102))
    {
      v103 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v103 = 0;
      _os_log_impl(&dword_0, v101, v102, "SiriAudioSnippets#snippet create Alternative Snippet", v103, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v100 + 8))(v152, v98);
    v104 = v144;
    (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v144, v96, v97);
    sub_18650();
    sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t v105 = sub_18250();
    v106 = v146;
    uint64_t *v146 = v105;
    v106[1] = v107;
    uint64_t v108 = v150;
    v109 = (uint64_t *)((char *)v106 + *(int *)(v150 + 20));
    uint64_t *v109 = swift_getKeyPath();
    sub_75D8(&qword_207E8);
    swift_storeEnumTagMultiPayload();
    v110 = (char *)v106 + *(int *)(v108 + 24);
    char v172 = 0;
    sub_184A0();
    uint64_t v111 = v174;
    char *v110 = v173;
    *((void *)v110 + 1) = v111;
    v95((char *)v106 + *(int *)(v108 + 28), v104, v97);
    uint64_t v112 = (uint64_t)v106;
    uint64_t v113 = v148;
    sub_761C(v112, v148);
    sub_7680(&qword_207F0, (void (*)(uint64_t))type metadata accessor for SiriAudioAlternativeSnippet);
    uint64_t v53 = sub_183C0();
    sub_76C8(v113, (uint64_t (*)(void))type metadata accessor for SiriAudioAlternativeSnippet);
    (*(void (**)(char *, uint64_t))(v94 + 8))(v96, v97);
    return v53;
  }
  if (v44 == enum case for SiriAudioSnippets.shazam(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v43, v40);
    uint64_t v78 = v135;
    v79 = v134;
    uint64_t v80 = v138;
    (*(void (**)(char *, char *, uint64_t))(v135 + 32))(v134, v43, v138);
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v114 = v170;
    uint64_t v115 = sub_7590(v170, (uint64_t)qword_21CD8);
    uint64_t v116 = v171;
    v117 = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v132, v115, v114);
    v118 = sub_18150();
    os_log_type_t v119 = sub_186C0();
    if (os_log_type_enabled(v118, v119))
    {
      v120 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v120 = 0;
      _os_log_impl(&dword_0, v118, v119, "SiriAudioSnippets#snippet create ShazamSnippet", v120, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v116 + 8))(v117, v114);
    v88 = v136;
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v136, v79, v80);
    v121 = (uint64_t *)&v88[*(int *)(v137 + 20)];
    sub_18650();
    sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t *v121 = sub_18250();
    v121[1] = v122;
    sub_7680(&qword_207E0, (void (*)(uint64_t))type metadata accessor for SiriAudioShazamSnippet);
    uint64_t v53 = sub_183C0();
    v91 = type metadata accessor for SiriAudioShazamSnippet;
    goto LABEL_27;
  }
  if (v44 == enum case for SiriAudioSnippets.mediaPlayer(_:))
  {
    (*(void (**)(char *, uint64_t))(v41 + 96))(v43, v40);
    uint64_t v78 = v140;
    v79 = v139;
    uint64_t v80 = v143;
    (*(void (**)(char *, char *, uint64_t))(v140 + 32))(v139, v43, v143);
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v123 = v170;
    uint64_t v124 = sub_7590(v170, (uint64_t)qword_21CD8);
    uint64_t v125 = v171;
    v126 = v133;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v133, v124, v123);
    v127 = sub_18150();
    os_log_type_t v128 = sub_186C0();
    if (os_log_type_enabled(v127, v128))
    {
      v129 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v129 = 0;
      _os_log_impl(&dword_0, v127, v128, "SiriAudioSnippets#snippet create SiriAudioMediaPlayerSnippet", v129, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v125 + 8))(v126, v123);
    v130 = v141;
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(&v141[*(int *)(v142 + 24)], v79, v80);
    *(void *)v130 = sub_120AC;
    *((void *)v130 + 1) = 0;
    v130[16] = 0;
    sub_18650();
    sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    *((void *)v130 + 3) = sub_18250();
    *((void *)v130 + 4) = v131;
    sub_7680(&qword_207D8, (void (*)(uint64_t))type metadata accessor for SiriAudioMediaPlayerSnippet);
    uint64_t v53 = sub_183C0();
    v92 = type metadata accessor for SiriAudioMediaPlayerSnippet;
    uint64_t v93 = (uint64_t)v130;
    goto LABEL_28;
  }
  uint64_t result = sub_18780();
  __break(1u);
  return result;
}

uint64_t sub_7430()
{
  return sub_18260();
}

uint64_t sub_7454(uint64_t a1)
{
  sub_181F0();
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_18270();
}

uint64_t _s13AudioUIPlugin19ConfirmationSnippetV8_context33_771F22E388A5AC0FA382258073F3D643LL7SwiftUI17EnvironmentObjectVy0dN07ContextCGvpfi_0()
{
  sub_18650();
  sub_7680((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);

  return sub_18250();
}

uint64_t sub_7590(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_75C8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_75D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_761C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioAlternativeSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_7680(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_76C8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_7728(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_180D0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }
  return a1;
}

void sub_7800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_180D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_7874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_180D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t sub_78FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_180D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t sub_7994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_180D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_7A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_180D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t sub_7AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7AB8);
}

uint64_t sub_7AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_180D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_7B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7B98);
}

uint64_t sub_7B98(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_180D0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for SiriAudioDisambiguationSnippet()
{
  uint64_t result = qword_20890;
  if (!qword_20890) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_7CA0()
{
  uint64_t result = sub_180D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_7D34()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_7D50()
{
  qword_20818 = 0x401C000000000000;
}

void sub_7D60()
{
  qword_20820 = 0x401C000000000000;
}

void sub_7D70()
{
  qword_20828 = 0x64496D657469;
  unk_20830 = 0xE600000000000000;
}

uint64_t sub_7D90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAudioDisambiguationSnippet();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  int v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9804(a1, (uint64_t)v5);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_986C((uint64_t)v5, v7 + v6);
  sub_9804(a1, (uint64_t)v5);
  uint64_t v8 = swift_allocObject();
  sub_986C((uint64_t)v5, v8 + v6);
  sub_185A0();
  sub_75D8(&qword_208D8);
  sub_9ED4(&qword_208E0, (void (*)(uint64_t))&type metadata accessor for PrimaryHeaderRichView);
  sub_99EC();
  return sub_18600();
}

uint64_t sub_7F54()
{
  return sub_18590();
}

uint64_t sub_7FE8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAudioDisambiguationSnippet();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  v10[3] = sub_180B0();
  sub_9804(a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_986C((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  sub_75D8(&qword_208F8);
  sub_75D8(&qword_20900);
  sub_A188(&qword_20908, &qword_208F8);
  uint64_t v7 = sub_18580();
  uint64_t v8 = sub_9ED4(&qword_208F0, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  v10[1] = v7;
  v10[2] = v8;
  swift_getOpaqueTypeConformance2();
  sub_9ED4(&qword_20910, (void (*)(uint64_t))&type metadata accessor for SiriAudioDisambiguationItemModel);
  return sub_184D0();
}

uint64_t sub_8204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationSnippet();
  uint64_t v44 = *(void *)(v4 - 8);
  __chkstk_darwin(v4 - 8);
  v34[1] = v5;
  uint64_t v36 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_17F40();
  uint64_t v6 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v40 = v7;
  v43 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_75D8(&qword_20918);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_17DF0();
  v34[0] = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_18580();
  uint64_t v41 = *(void *)(v14 - 8);
  uint64_t v42 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_75D8(&qword_20900);
  uint64_t v38 = *(void *)(v17 - 8);
  uint64_t v39 = v17;
  __chkstk_darwin(v17);
  uint64_t v37 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_17F10();
  os_log_type_t v73 = &type metadata for String;
  v74 = &protocol witness table for String;
  uint64_t v71 = v19;
  uint64_t v72 = v20;
  uint64_t v70 = 0;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v21 = sub_17F30();
  if (v22)
  {
    *((void *)&v66 + 1) = &type metadata for String;
    v67 = &protocol witness table for String;
    *(void *)&long long v65 = v21;
    *((void *)&v65 + 1) = v22;
  }
  else
  {
    v67 = 0;
    long long v65 = 0u;
    long long v66 = 0u;
  }
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v55 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v23 = v45;
  if (sub_18090())
  {
    sub_17F00();
    sub_17DE0();
    uint64_t v24 = sub_90B4((uint64_t)v13);
    (*(void (**)(char *, uint64_t))(v34[0] + 8))(v13, v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_17F20();
    uint64_t v24 = sub_8E2C((uint64_t)v10);
    sub_9C34((uint64_t)v10);
  }
  uint64_t v26 = v35;
  uint64_t v25 = (uint64_t)v36;
  if (v24)
  {
    *((void *)&v48 + 1) = &type metadata for AnyView;
    os_log_type_t v49 = &protocol witness table for AnyView;
    *(void *)&long long v47 = v24;
  }
  else
  {
    os_log_type_t v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
  }
  sub_18570();
  uint64_t v27 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v43, a1, v26);
  sub_9804(v23, v25);
  unint64_t v28 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v29 = (v40 + *(unsigned __int8 *)(v44 + 80) + v28) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  uint64_t v30 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v30 + v28, v27, v26);
  sub_986C(v25, v30 + v29);
  sub_9ED4(&qword_208F0, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  uint64_t v31 = v37;
  uint64_t v32 = v42;
  sub_183F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v32);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v38 + 32))(v46, v31, v39);
}

uint64_t sub_87A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17F40();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v11 = sub_18170();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207D0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_7590(v11, (uint64_t)qword_21CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v41 = v12;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, a1, v4);
  v16(v8, a1, v4);
  uint64_t v17 = sub_18150();
  os_log_type_t v18 = sub_186C0();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v40 = a1;
    uint64_t v21 = v20;
    uint64_t v37 = swift_slowAlloc();
    v43[0] = v37;
    *(_DWORD *)uint64_t v21 = 136315394;
    int v36 = v19;
    os_log_t v35 = v17;
    uint64_t v22 = sub_17F00();
    uint64_t v42 = sub_F064(v22, v23, v43);
    uint64_t v38 = v11;
    sub_186E0();
    swift_bridgeObjectRelease();
    uint64_t v39 = a2;
    uint64_t v24 = *(void (**)(char *, uint64_t))(v5 + 8);
    v24(v10, v4);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v25 = sub_17F10();
    uint64_t v42 = sub_F064(v25, v26, v43);
    sub_186E0();
    swift_bridgeObjectRelease();
    v24(v8, v4);
    a2 = v39;
    os_log_t v27 = v35;
    _os_log_impl(&dword_0, v35, (os_log_type_t)v36, "SiriAudioDisambiguationSnippet#body tapped on %s, itemTitle: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v38);
  }
  else
  {
    unint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
    v28(v10, v4);
    v28(v8, v4);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
  }
  unint64_t v29 = *(void **)(a2 + *(int *)(type metadata accessor for SiriAudioDisambiguationSnippet() + 20));
  if (v29)
  {
    id v30 = v29;
    sub_180A0();
    sub_75D8(&qword_20930);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_19AF0;
    if (qword_207B0 != -1) {
      swift_once();
    }
    v43[0] = qword_20828;
    v43[1] = unk_20830;
    swift_bridgeObjectRetain();
    sub_18720();
    uint64_t v32 = sub_17F00();
    *(void *)(inited + 96) = &type metadata for String;
    *(void *)(inited + 72) = v32;
    *(void *)(inited + 80) = v33;
    sub_8CE8(inited);
    sub_18640();

    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_18650();
    sub_9ED4((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t result = sub_18240();
    __break(1u);
  }
  return result;
}

unint64_t sub_8CE8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_75D8(&qword_20938);
  uint64_t v2 = sub_18760();
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
    sub_A0E8(v6, (uint64_t)v15, &qword_20940);
    unint64_t result = sub_9F1C((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_9F60(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_8E2C(uint64_t a1)
{
  uint64_t v18 = sub_17DF0();
  uint64_t v2 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_75D8(&qword_20918);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  char v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  long long v10 = (char *)&v17 - v9;
  uint64_t v11 = sub_17DB0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A0E8(a1, (uint64_t)v10, &qword_20918);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_9C34((uint64_t)v10);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
    sub_17DD0();
    sub_9C34((uint64_t)v8);
    uint64_t v15 = sub_90B4((uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

uint64_t sub_90B4(uint64_t a1)
{
  uint64_t v41 = sub_18500();
  uint64_t v39 = *(void *)(v41 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v37 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_75D8(&qword_20920);
  uint64_t v40 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v38 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_17DF0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v12 = sub_18170();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207D0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_7590(v12, (uint64_t)qword_21CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  uint64_t v36 = v13;
  uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v42(v11, a1, v5);
  uint64_t v17 = sub_18150();
  os_log_type_t v18 = sub_186C0();
  uint64_t v35 = v12;
  os_log_type_t v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v34 = v3;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v43 = v32;
    uint64_t v33 = a1;
    *(_DWORD *)uint64_t v20 = 136315138;
    id v30 = v20 + 4;
    uint64_t v31 = v20;
    v42(v9, (uint64_t)v11, v5);
    uint64_t v44 = sub_18670();
    uint64_t v45 = v21;
    uint64_t v22 = sub_186A0();
    uint64_t v44 = sub_F064(v22, v23, &v43);
    a1 = v33;
    sub_186E0();
    uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    _os_log_impl(&dword_0, v17, v19, "SiriAudioDisambiguationSnippet#imageView building imageView: %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }

  (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v35);
  v42(v9, a1, v5);
  uint64_t v24 = v37;
  sub_18510();
  if (qword_207A0 != -1) {
    swift_once();
  }
  if (qword_207A8 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_9ED4(&qword_20928, (void (*)(uint64_t))&type metadata accessor for RFImageView);
  unint64_t v26 = v38;
  uint64_t v27 = v41;
  sub_18400();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v24, v27);
  uint64_t v44 = v27;
  uint64_t v45 = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = sub_183C0();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v3);
  return v28;
}

uint64_t sub_96B0()
{
  return sub_18470();
}

uint64_t sub_96CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_9804(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_986C((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_75D8(&qword_208C8);
  sub_A188(&qword_208D0, &qword_208C8);
  return sub_18530();
}

uint64_t sub_9804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_986C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioDisambiguationSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_98D0()
{
  return sub_9968(sub_7D90);
}

uint64_t sub_98E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_9934()
{
  return sub_9968((uint64_t (*)(uint64_t))sub_7F54);
}

uint64_t sub_9950()
{
  return sub_9968(sub_7FE8);
}

uint64_t sub_9968(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for SiriAudioDisambiguationSnippet() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

unint64_t sub_99EC()
{
  unint64_t result = qword_208E8;
  if (!qword_208E8)
  {
    sub_98E8(&qword_208D8);
    sub_18580();
    sub_9ED4(&qword_208F0, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_208E8);
  }
  return result;
}

uint64_t sub_9AC4()
{
  uint64_t v1 = (int *)(type metadata accessor for SiriAudioDisambiguationSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_180D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_9BB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SiriAudioDisambiguationSnippet() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_8204(a1, v6, a2);
}

uint64_t sub_9C34(uint64_t a1)
{
  uint64_t v2 = sub_75D8(&qword_20918);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9C94()
{
  uint64_t v1 = sub_17F40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for SiriAudioDisambiguationSnippet() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v11 = sub_180D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v0 + v8, v11);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_9E08()
{
  uint64_t v1 = *(void *)(sub_17F40() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for SiriAudioDisambiguationSnippet() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_87A0(v0 + v2, v5);
}

uint64_t sub_9ED4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_9F1C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_18700(*(void *)(v2 + 40));

  return sub_9F70(a1, v4);
}

_OWORD *sub_9F60(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_9F70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_A038(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_18710();
      sub_A094((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_A038(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_A094(uint64_t a1)
{
  return a1;
}

uint64_t sub_A0E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_75D8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_A14C()
{
  return sub_A188(&qword_20948, &qword_20950);
}

uint64_t sub_A188(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_98E8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SiriAudioActionButtonSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for SiriAudioActionButtonSnippet() + 20));
  sub_18650();
  sub_B73C((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
  *unint64_t v4 = sub_18250();
  v4[1] = v5;
  uint64_t v6 = sub_18050();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);

  return v7(a2, a1, v6);
}

uint64_t type metadata accessor for SiriAudioActionButtonSnippet()
{
  uint64_t result = qword_209B0;
  if (!qword_209B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriAudioActionButtonSnippet.body.getter()
{
  uint64_t v1 = type metadata accessor for SiriAudioActionButtonSnippet();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8);
  sub_ABE0(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_AC48((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  return sub_18530();
}

uint64_t sub_A3FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v54 = a2;
  uint64_t v3 = sub_18000();
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  __chkstk_darwin(v3);
  long long v48 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_184F0();
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  __chkstk_darwin(v5);
  long long v51 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_18060();
  uint64_t v7 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_18520();
  uint64_t v42 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for SiriAudioActionButtonSnippet();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12 - 8);
  uint64_t v41 = sub_75D8(&qword_209F8);
  uint64_t v15 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_75D8(&qword_20A00);
  uint64_t v44 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  os_log_type_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_75D8(&qword_20A08);
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v43 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_ABE0(a1, (uint64_t)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v22 = swift_allocObject();
  sub_AC48((uint64_t)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
  uint64_t v56 = a1;
  sub_75D8(&qword_20A10);
  sub_A188(&qword_20A18, &qword_20A10);
  sub_184C0();
  sub_18030();
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v40);
  if (v23 == enum case for SiriAudioActionButtonSnippetStyle.button(_:))
  {
    sub_182D0();
LABEL_5:
    uint64_t v24 = v41;
    goto LABEL_8;
  }
  if (v23 == enum case for SiriAudioActionButtonSnippetStyle.buttonCircularIconOnly(_:))
  {
    sub_182E0();
    goto LABEL_5;
  }
  uint64_t v24 = v41;
  if (v23 != enum case for SiriAudioActionButtonSnippetStyle.buttonCircularIconAndTitle(_:))
  {
    sub_18780();
    __break(1u);
    goto LABEL_16;
  }
  sub_182F0();
LABEL_8:
  uint64_t v25 = sub_A188(&qword_20A20, &qword_209F8);
  uint64_t v26 = sub_B73C(&qword_20A28, (void (*)(uint64_t))&type metadata accessor for RFButtonStyle);
  uint64_t v27 = v55;
  sub_18450();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v27);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v24);
  uint64_t v28 = v48;
  sub_18010();
  int v29 = (*(uint64_t (**)(char *, uint64_t))(v49 + 88))(v28, v50);
  if (v29 == enum case for SiriAudioActionButtonSnippetRole.standard(_:))
  {
    id v30 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.standard(_:);
LABEL_14:
    uint64_t v32 = v51;
    uint64_t v31 = v52;
    uint64_t v33 = v53;
    (*(void (**)(char *, void, uint64_t))(v52 + 104))(v51, *v30, v53);
    uint64_t v57 = v24;
    uint64_t v58 = v55;
    uint64_t v59 = v25;
    uint64_t v60 = v26;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v35 = v43;
    uint64_t v36 = v46;
    sub_183D0();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v36);
    uint64_t v57 = v36;
    uint64_t v58 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v37 = v47;
    uint64_t v38 = sub_183C0();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v35, v37);
    *long long v54 = v38;
    return result;
  }
  if (v29 == enum case for SiriAudioActionButtonSnippetRole.preferred(_:))
  {
    id v30 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferred(_:);
    goto LABEL_14;
  }
  if (v29 == enum case for SiriAudioActionButtonSnippetRole.preferredAndDestructive(_:))
  {
    id v30 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferredAndDestructive(_:);
    goto LABEL_14;
  }
LABEL_16:
  uint64_t result = sub_18780();
  __break(1u);
  return result;
}

uint64_t sub_ABE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioActionButtonSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_AC48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioActionButtonSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_ACB0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_ACCC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + *(int *)(type metadata accessor for SiriAudioActionButtonSnippet() + 20));
  if (v1)
  {
    id v2 = v1;
    id v3 = (id)sub_18040();
    sub_18630();
  }
  else
  {
    sub_18650();
    sub_B73C((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_18240();
    __break(1u);
  }
}

uint64_t sub_AD98@<X0>(uint64_t a1@<X8>)
{
  sub_18020();
  sub_B78C();
  uint64_t result = sub_183B0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_ADF8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_ABE0(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_AC48((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  return sub_18530();
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriAudioActionButtonSnippet(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_18050();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }
  return a1;
}

void destroy for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18050();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t assignWithCopy for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t initializeWithTake for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_B290);
}

uint64_t sub_B290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18050();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for SiriAudioActionButtonSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_B370);
}

uint64_t sub_B370(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_18050();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t sub_B42C()
{
  uint64_t result = sub_18050();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_B4C0()
{
  return sub_A188(&qword_209E8, &qword_209F0);
}

uint64_t sub_B500@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for SiriAudioActionButtonSnippet() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_A3FC(v4, a1);
}

uint64_t sub_B574()
{
  uint64_t v1 = (int *)(type metadata accessor for SiriAudioActionButtonSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_18050();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

void sub_B664()
{
  uint64_t v1 = *(void *)(type metadata accessor for SiriAudioActionButtonSnippet() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_ACCC(v2);
}

uint64_t sub_B6C4()
{
  return sub_18490();
}

uint64_t sub_B73C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_B784@<X0>(uint64_t a1@<X8>)
{
  return sub_AD98(a1);
}

unint64_t sub_B78C()
{
  unint64_t result = qword_20A30;
  if (!qword_20A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20A30);
  }
  return result;
}

char *sub_B7E0(char *a1, char **a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    unint64_t v10 = (char **)((char *)a2 + v8);
    int v11 = v5;
    sub_75D8(&qword_207E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_181F0();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *(void *)uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = &a1[v13];
    uint64_t v16 = (char *)a2 + v13;
    *uint64_t v15 = *v16;
    *((void *)v15 + 1) = *((void *)v16 + 1);
    uint64_t v17 = &a1[v14];
    uint64_t v18 = (uint64_t)a2 + v14;
    uint64_t v19 = sub_17FC0();
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
    swift_retain();
    v20(v17, v18, v19);
  }
  return a1;
}

uint64_t sub_B97C(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  sub_75D8(&qword_207E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_181F0();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_17FC0();
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *sub_BA78(void *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)((char *)a1 + v8);
  unint64_t v10 = (void *)(a2 + v8);
  id v11 = v6;
  sub_75D8(&qword_207E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_181F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v13;
  uint64_t v16 = (char *)(a2 + v13);
  *uint64_t v15 = *v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  uint64_t v17 = (char *)a1 + v14;
  uint64_t v18 = a2 + v14;
  uint64_t v19 = sub_17FC0();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
  swift_retain();
  v20(v17, v18, v19);
  return a1;
}

uint64_t sub_BBC4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  if (a1 != a2)
  {
    uint64_t v9 = a3[5];
    unint64_t v10 = (void *)(a1 + v9);
    id v11 = (void *)(a2 + v9);
    sub_FB74(a1 + v9, &qword_207E8);
    sub_75D8(&qword_207E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_181F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *unint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_17FC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

_OWORD *sub_BD38(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_75D8(&qword_207E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_181F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_17FC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

void **sub_BE6C(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_FB74((uint64_t)a1 + v7, &qword_207E8);
    uint64_t v10 = sub_75D8(&qword_207E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_181F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *uint64_t v13 = *v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_release();
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_17FC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t sub_BFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_BFF8);
}

uint64_t sub_BFF8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t v9 = sub_75D8(&qword_20A38);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = sub_17FC0();
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 28);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t sub_C134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_C148);
}

void *sub_C148(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v8 = sub_75D8(&qword_20A38);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_17FC0();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 28);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for SiriAudioAlternativeSnippet()
{
  uint64_t result = qword_20A98;
  if (!qword_20A98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_C2C4()
{
  sub_C398();
  if (v0 <= 0x3F)
  {
    sub_17FC0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_C398()
{
  if (!qword_20AA8)
  {
    sub_181F0();
    unint64_t v0 = sub_18200();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_20AA8);
    }
  }
}

uint64_t sub_C3F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C40C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v95 = a1;
  uint64_t v93 = sub_75D8(&qword_20AE0);
  __chkstk_darwin(v93);
  uint64_t v94 = (char *)v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_75D8(&qword_20AE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v81 = (void *)((char *)v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_181F0();
  uint64_t v79 = *(void *)(v6 - 8);
  uint64_t v80 = v6;
  __chkstk_darwin(v6);
  uint64_t v78 = (char *)v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_18610();
  uint64_t v8 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  uint64_t v10 = (char *)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_75D8(&qword_20AF0);
  uint64_t v15 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v17 = (char *)v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_75D8(&qword_20AF8);
  __chkstk_darwin(v87);
  v96 = (char *)v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_75D8(&qword_20B00);
  uint64_t v89 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  v88 = (char *)v73 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_75D8(&qword_20B08);
  __chkstk_darwin(v90);
  v75 = (char *)v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_75D8(&qword_20B10);
  uint64_t v77 = *(void *)(v91 - 8);
  uint64_t v21 = __chkstk_darwin(v91);
  v74 = (char *)v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v76 = (char *)v73 - v23;
  char v24 = sub_17F80();
  uint64_t v86 = v2;
  sub_E7C4(v2, (uint64_t)v14);
  uint64_t v25 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v27 = v26 + v13;
  uint64_t v28 = (void (**)(char *, uint64_t))(v8 + 8);
  int v29 = (void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v82 = v25 | 7;
  uint64_t v83 = v27;
  uint64_t v30 = swift_allocObject();
  sub_761C((uint64_t)v14, v30 + v26);
  sub_75D8(&qword_20B18);
  sub_E844();
  sub_18530();
  uint64_t v31 = v84;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for ComponentStackBottomSpacing.default(_:), v84);
  if (v24)
  {
    v73[1] = &protocol conformance descriptor for ComponentStack<A>;
    uint64_t v32 = sub_A188(&qword_20B60, &qword_20AF0);
    uint64_t v33 = v85;
    sub_18420();
    (*v28)(v10, v31);
    (*v29)(v17, v33);
    sub_E7C4(v86, (uint64_t)v14);
    uint64_t v34 = swift_allocObject();
    sub_761C((uint64_t)v14, v34 + v26);
    sub_75D8(&qword_20B68);
    uint64_t v97 = v33;
    unint64_t v98 = v32;
    swift_getOpaqueTypeConformance2();
    uint64_t v35 = sub_98E8(&qword_20B70);
    uint64_t v36 = sub_98E8(&qword_20B78);
    uint64_t v37 = sub_A188(&qword_20B80, &qword_20B78);
    uint64_t v97 = v36;
    unint64_t v98 = v37;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v97 = v35;
    unint64_t v98 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    uint64_t v39 = v88;
    sub_185B0();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v42 = v78;
    uint64_t v41 = v79;
    uint64_t v43 = v80;
    (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, enum case for ColorScheme.dark(_:), v80);
    uint64_t v44 = v90;
    uint64_t v45 = (uint64_t)v75;
    uint64_t v46 = (uint64_t *)&v75[*(int *)(v90 + 36)];
    uint64_t v47 = sub_75D8(&qword_20BA0);
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))((char *)v46 + *(int *)(v47 + 28), v42, v43);
    *uint64_t v46 = KeyPath;
    uint64_t v48 = v89;
    uint64_t v49 = v92;
    (*(void (**)(uint64_t, char *, uint64_t))(v89 + 16))(v45, v39, v92);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v49);
    uint64_t v50 = sub_18480();
    uint64_t v51 = (uint64_t)v81;
    *uint64_t v81 = v50;
    uint64_t v52 = enum case for HostBackground.color(_:);
    uint64_t v53 = sub_18540();
    uint64_t v54 = *(void *)(v53 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 104))(v51, v52, v53);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v51, 0, 1, v53);
    unint64_t v55 = sub_E9D8();
    uint64_t v56 = v74;
    sub_18410();
    sub_FB74(v51, &qword_20AE8);
    sub_FB74(v45, &qword_20B08);
    uint64_t v57 = v77;
    uint64_t v58 = v76;
    uint64_t v59 = v56;
    uint64_t v60 = v91;
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v76, v59, v91);
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v94, v58, v60);
    swift_storeEnumTagMultiPayload();
    uint64_t v97 = v44;
    unint64_t v98 = v55;
    swift_getOpaqueTypeConformance2();
    sub_A188(&qword_20B90, &qword_20B00);
    sub_182C0();
    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v58, v60);
  }
  else
  {
    uint64_t v81 = (uint64_t *)&protocol conformance descriptor for ComponentStack<A>;
    uint64_t v62 = sub_A188(&qword_20B60, &qword_20AF0);
    uint64_t v63 = v85;
    sub_18420();
    (*v28)(v10, v31);
    (*v29)(v17, v63);
    sub_E7C4(v86, (uint64_t)v14);
    uint64_t v64 = swift_allocObject();
    sub_761C((uint64_t)v14, v64 + v26);
    sub_75D8(&qword_20B68);
    uint64_t v97 = v63;
    unint64_t v98 = v62;
    swift_getOpaqueTypeConformance2();
    uint64_t v65 = sub_98E8(&qword_20B70);
    uint64_t v66 = sub_98E8(&qword_20B78);
    uint64_t v67 = sub_A188(&qword_20B80, &qword_20B78);
    uint64_t v97 = v66;
    unint64_t v98 = v67;
    uint64_t v68 = swift_getOpaqueTypeConformance2();
    uint64_t v97 = v65;
    unint64_t v98 = v68;
    swift_getOpaqueTypeConformance2();
    long long v69 = v88;
    sub_185B0();
    uint64_t v70 = v89;
    uint64_t v71 = v92;
    (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v94, v69, v92);
    swift_storeEnumTagMultiPayload();
    unint64_t v72 = sub_E9D8();
    uint64_t v97 = v90;
    unint64_t v98 = v72;
    swift_getOpaqueTypeConformance2();
    sub_A188(&qword_20B90, &qword_20B00);
    sub_182C0();
    return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v69, v71);
  }
}

uint64_t sub_D094@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v25 = a2;
  uint64_t v30 = a4;
  uint64_t v29 = sub_18610();
  uint64_t v5 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = sub_75D8(&qword_20B78);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_75D8(&qword_20B70);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v26 = v15;
  uint64_t v27 = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E7C4(a1, (uint64_t)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v19 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v20 = swift_allocObject();
  sub_761C((uint64_t)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  sub_75D8(&qword_20BA8);
  sub_EB64();
  sub_18530();
  uint64_t v21 = v29;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ComponentStackBottomSpacing.none(_:), v29);
  uint64_t v22 = sub_A188(&qword_20B80, &qword_20B78);
  sub_18420();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v21);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v31 = v11;
  uint64_t v32 = v22;
  swift_getOpaqueTypeConformance2();
  uint64_t v23 = v26;
  sub_18460();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v18, v23);
}

uint64_t sub_D420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v32 = sub_183A0();
  uint64_t v3 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v31 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_185D0();
  uint64_t v5 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_75D8(&qword_20B30);
  __chkstk_darwin(v28);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_75D8(&qword_20B18);
  __chkstk_darwin(v29);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (char *)(a1 + *(int *)(type metadata accessor for SiriAudioAlternativeSnippet() + 24));
  char v13 = *v12;
  unint64_t v14 = *((void *)v12 + 1);
  LOBYTE(v50) = v13;
  unint64_t v51 = v14;
  sub_75D8(&qword_20BE0);
  sub_184B0();
  if (v47)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0xE000000000000000;
  }
  else
  {
    uint64_t v15 = sub_17FB0();
  }
  uint64_t v52 = &type metadata for String;
  uint64_t v53 = &protocol witness table for String;
  uint64_t v50 = v15;
  unint64_t v51 = v16;
  uint64_t v49 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v43 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v17 = sub_17FA0();
  uint64_t v39 = &type metadata for String;
  uint64_t v40 = &protocol witness table for String;
  uint64_t v37 = v17;
  uint64_t v38 = v18;
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  sub_185C0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v20 = v30;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v30);
  uint64_t v21 = &v9[*(int *)(v28 + 36)];
  *(void *)uint64_t v21 = KeyPath;
  *((void *)v21 + 1) = 1;
  v21[16] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  uint64_t v23 = v31;
  uint64_t v22 = v32;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v31, enum case for Text.TruncationMode.tail(_:), v32);
  uint64_t v24 = swift_getKeyPath();
  uint64_t v25 = (uint64_t *)&v11[*(int *)(v29 + 36)];
  uint64_t v26 = sub_75D8(&qword_20B58);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v25 + *(int *)(v26 + 28), v23, v22);
  *uint64_t v25 = v24;
  sub_FB0C((uint64_t)v9, (uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v23, v22);
  sub_FB74((uint64_t)v9, &qword_20B30);
  return sub_FBD0((uint64_t)v11, v33);
}

uint64_t sub_D7F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v15 = sub_17F90();
  sub_E7C4(a1, (uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_761C((uint64_t)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  sub_75D8(&qword_20BB8);
  sub_75D8(&qword_20BC0);
  sub_A188(&qword_20BC8, &qword_20BB8);
  uint64_t v7 = sub_98E8(&qword_20900);
  uint64_t v8 = sub_18580();
  uint64_t v9 = sub_F76C(&qword_208F0, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v13 = v7;
  uint64_t v14 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_F76C(&qword_20BD0, (void (*)(uint64_t))&type metadata accessor for SiriAudioAlternativeItemModel);
  return sub_184D0();
}

uint64_t sub_DA58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v52 = a3;
  uint64_t v4 = sub_17DC0();
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  __chkstk_darwin(v4);
  uint64_t v49 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v39 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v40 = v7;
  uint64_t v43 = (uint64_t)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_17EF0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v38 = v10;
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_18580();
  uint64_t v44 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_75D8(&qword_20900);
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v48 = v14;
  __chkstk_darwin(v14);
  unint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_75D8(&qword_20BC0);
  uint64_t v45 = *(void *)(v17 - 8);
  uint64_t v46 = v17;
  __chkstk_darwin(v17);
  long long v42 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_17EB0();
  uint64_t v80 = &type metadata for String;
  uint64_t v81 = &protocol witness table for String;
  uint64_t v78 = v19;
  uint64_t v79 = v20;
  uint64_t v77 = 0;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v21 = sub_17EE0();
  os_log_type_t v73 = &type metadata for String;
  v74 = &protocol witness table for String;
  uint64_t v22 = v37;
  uint64_t v71 = v21;
  uint64_t v72 = v23;
  uint64_t v70 = 0;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v67 = 0;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v24 = sub_E048();
  if (v24)
  {
    *((void *)&v54 + 1) = &type metadata for AnyView;
    unint64_t v55 = &protocol witness table for AnyView;
    *(void *)&long long v53 = v24;
  }
  else
  {
    unint64_t v55 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
  }
  sub_18570();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v25 = v43;
  sub_E7C4(v22, v43);
  unint64_t v26 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v27 = (v38 + *(unsigned __int8 *)(v39 + 80) + v26) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v28 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v28 + v26, v11, v8);
  sub_761C(v25, v28 + v27);
  uint64_t v29 = sub_F76C(&qword_208F0, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
  uint64_t v30 = v41;
  sub_183F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v13, v30);
  uint64_t v32 = v49;
  uint64_t v31 = v50;
  uint64_t v33 = v51;
  (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, enum case for SeparatorStyle.insetLeading(_:), v51);
  uint64_t v78 = v30;
  uint64_t v79 = v29;
  swift_getOpaqueTypeConformance2();
  long long v34 = v42;
  uint64_t v35 = v48;
  sub_183E0();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v16, v35);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v45 + 32))(v52, v34, v46);
}

uint64_t sub_E048()
{
  uint64_t v0 = sub_17DF0();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_18500();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_75D8(&qword_20918);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = sub_17DB0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_17ED0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_FB74((uint64_t)v10, &qword_20918);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
    sub_17DD0();
    sub_FB74((uint64_t)v8, &qword_20918);
    sub_18510();
    sub_F76C(&qword_20928, (void (*)(uint64_t))&type metadata accessor for RFImageView);
    uint64_t v15 = sub_183C0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v15;
}

void sub_E35C(uint64_t a1, id *a2)
{
  uint64_t v4 = sub_17EF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v31 - v9;
  uint64_t v11 = sub_18170();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207D0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_7590(v11, (uint64_t)qword_21CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v38 = v12;
  unint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, a1, v4);
  v16(v8, a1, v4);
  uint64_t v17 = sub_18150();
  os_log_type_t v18 = sub_186C0();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v35 = v11;
    uint64_t v21 = v20;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v40 = v34;
    *(_DWORD *)uint64_t v21 = 136315394;
    int v33 = v19;
    os_log_t v32 = v17;
    uint64_t v22 = sub_17EA0();
    uint64_t v39 = sub_F064(v22, v23, &v40);
    uint64_t v36 = a2;
    sub_186E0();
    swift_bridgeObjectRelease();
    uint64_t v37 = a1;
    uint64_t v24 = *(void (**)(char *, uint64_t))(v5 + 8);
    v24(v10, v4);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v25 = sub_17EB0();
    uint64_t v39 = sub_F064(v25, v26, &v40);
    a2 = v36;
    sub_186E0();
    swift_bridgeObjectRelease();
    v24(v8, v4);
    os_log_t v27 = v32;
    _os_log_impl(&dword_0, v32, (os_log_type_t)v33, "AlternativeItemsView#body tapped on %s, itemTitle: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v35);
  }
  else
  {
    uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
    v28(v10, v4);
    v28(v8, v4);

    (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v11);
  }
  if (*a2)
  {
    id v29 = *a2;
    uint64_t v30 = (void *)sub_17EC0();
    sub_18630();
  }
  else
  {
    sub_18650();
    sub_F76C((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_18240();
    __break(1u);
  }
}

uint64_t sub_E7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioAlternativeSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_E82C()
{
  return sub_F934((uint64_t (*)(uint64_t))sub_D420);
}

unint64_t sub_E844()
{
  unint64_t result = qword_20B20;
  if (!qword_20B20)
  {
    sub_98E8(&qword_20B18);
    sub_E8E4();
    sub_A188(&qword_20B50, &qword_20B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20B20);
  }
  return result;
}

unint64_t sub_E8E4()
{
  unint64_t result = qword_20B28;
  if (!qword_20B28)
  {
    sub_98E8(&qword_20B30);
    sub_F76C(&qword_20B38, (void (*)(uint64_t))&type metadata accessor for SimpleItemStandardView);
    sub_A188(&qword_20B40, &qword_20B48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20B28);
  }
  return result;
}

uint64_t sub_E9B8@<X0>(uint64_t a1@<X8>)
{
  return sub_EAC4((uint64_t)&unk_1D218, (uint64_t)sub_EB4C, a1);
}

unint64_t sub_E9D8()
{
  unint64_t result = qword_20B88;
  if (!qword_20B88)
  {
    sub_98E8(&qword_20B08);
    sub_A188(&qword_20B90, &qword_20B00);
    sub_A188(&qword_20B98, &qword_20BA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20B88);
  }
  return result;
}

uint64_t sub_EAA4@<X0>(uint64_t a1@<X8>)
{
  return sub_EAC4((uint64_t)&unk_1D1A0, (uint64_t)sub_EB4C, a1);
}

uint64_t sub_EAC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for SiriAudioAlternativeSnippet() - 8);
  return sub_D094(v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a1, a2, a3);
}

uint64_t sub_EB4C()
{
  return sub_F934(sub_D7F8);
}

unint64_t sub_EB64()
{
  unint64_t result = qword_20BB0;
  if (!qword_20BB0)
  {
    sub_98E8(&qword_20BA8);
    sub_98E8(&qword_20900);
    sub_18580();
    sub_F76C(&qword_208F0, (void (*)(uint64_t))&type metadata accessor for SimpleItemRichView);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20BB0);
  }
  return result;
}

uint64_t sub_EC78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SiriAudioAlternativeSnippet() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_DA58(a1, v6, a2);
}

uint64_t sub_ECF8()
{
  uint64_t v1 = sub_17EF0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(*(void *)(v6 - 8) + 64);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  uint64_t v10 = v0 + v8 + *(int *)(v6 + 20);
  sub_75D8(&qword_207E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_181F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v12 = v0 + v8 + *(int *)(v6 + 28);
  uint64_t v13 = sub_17FC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);

  return _swift_deallocObject(v0, v8 + v9, v3 | v7 | 7);
}

void sub_EEF8()
{
  uint64_t v1 = *(void *)(sub_17EF0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for SiriAudioAlternativeSnippet() - 8);
  uint64_t v5 = (id *)(v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));

  sub_E35C(v0 + v2, v5);
}

uint64_t sub_EFC4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_EFEC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_F064(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_186E0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_F064(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_F138(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_F70C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_F70C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_F6BC((uint64_t)v12);
  return v7;
}

uint64_t sub_F138(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_186F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_F2F4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_18740();
  if (!v8)
  {
    sub_18750();
    __break(1u);
LABEL_17:
    uint64_t result = sub_18770();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_F2F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_F38C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_F56C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_F56C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_F38C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_F504(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_18730();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_18750();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_18690();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_18770();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_18750();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_F504(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_75D8(&qword_20BD8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_F56C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_75D8(&qword_20BD8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_18770();
  __break(1u);
  return result;
}

uint64_t sub_F6BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_F70C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_F76C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_F7B8()
{
  uint64_t v1 = type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_75D8(&qword_207E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_181F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v8 = sub_17FC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_F934(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for SiriAudioAlternativeSnippet() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_F9B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_182A0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_F9EC()
{
  return sub_182B0();
}

uint64_t sub_FA1C()
{
  return sub_18280();
}

uint64_t sub_FA40(uint64_t a1)
{
  uint64_t v2 = sub_183A0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_18290();
}

uint64_t sub_FB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75D8(&qword_20B30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_FB74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_75D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_FBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75D8(&qword_20B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_FC3C()
{
  unint64_t result = qword_20BE8;
  if (!qword_20BE8)
  {
    sub_98E8(&qword_20BF0);
    sub_98E8(&qword_20B08);
    sub_E9D8();
    swift_getOpaqueTypeConformance2();
    sub_A188(&qword_20B90, &qword_20B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20BE8);
  }
  return result;
}

uint64_t ConfirmationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ConfirmationSnippet() + 20));
  sub_18650();
  sub_10468((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
  *uint64_t v4 = sub_18250();
  v4[1] = v5;
  uint64_t v6 = sub_18080();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);

  return v7(a2, a1, v6);
}

uint64_t type metadata accessor for ConfirmationSnippet()
{
  uint64_t result = qword_20C58;
  if (!qword_20C58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ConfirmationSnippet.body.getter()
{
  uint64_t v1 = type metadata accessor for ConfirmationSnippet();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8);
  sub_10398(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_10400((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_18560();
  sub_10468(&qword_20BF8, (void (*)(uint64_t))&type metadata accessor for BinaryButtonView);
  return sub_18530();
}

uint64_t sub_FF78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v27 = sub_184F0();
  uint64_t v3 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ConfirmationSnippet();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = sub_75D8(&qword_209F8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_75D8(&qword_20CA0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v25 = v13;
  uint64_t v26 = v14;
  __chkstk_darwin(v13);
  unint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_104CC();
  uint64_t v35 = &type metadata for AnyView;
  uint64_t v36 = &protocol witness table for AnyView;
  uint64_t v34 = v17;
  sub_10398(a1, (uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = swift_allocObject();
  sub_10400((uint64_t)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  uint64_t v29 = a1;
  sub_75D8(&qword_20A10);
  sub_A188(&qword_20A18, &qword_20A10);
  sub_184C0();
  uint64_t v20 = v27;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for ButtonItemButtonStyle.Role.standard(_:), v27);
  uint64_t v21 = sub_A188(&qword_20A20, &qword_209F8);
  sub_183D0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v30 = v9;
  uint64_t v31 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v25;
  uint64_t v23 = sub_183C0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v22);
  int v33 = &protocol witness table for AnyView;
  os_log_t v32 = &type metadata for AnyView;
  uint64_t v30 = v23;
  return sub_18550();
}

uint64_t sub_10398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10400(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10468(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_104B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_104CC()
{
  uint64_t v26 = sub_184F0();
  uint64_t v1 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ConfirmationSnippet();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = sub_75D8(&qword_209F8);
  uint64_t v23 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_75D8(&qword_20CA0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v24 = v10;
  uint64_t v25 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10398(v0, (uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  sub_10400((uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  uint64_t v27 = v0;
  sub_75D8(&qword_20A10);
  sub_A188(&qword_20A18, &qword_20A10);
  sub_184C0();
  char v16 = sub_18070();
  uint64_t v17 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferredAndDestructive(_:);
  if ((v16 & 1) == 0) {
    uint64_t v17 = (unsigned int *)&enum case for ButtonItemButtonStyle.Role.preferred(_:);
  }
  uint64_t v18 = v26;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *v17, v26);
  uint64_t v19 = sub_A188(&qword_20A20, &qword_209F8);
  sub_183D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v7);
  uint64_t v28 = v7;
  uint64_t v29 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v24;
  uint64_t v21 = sub_183C0();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v20);
  return v21;
}

void sub_108B8(uint64_t a1, const char *a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_18170();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_7590(v6, (uint64_t)qword_21CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = sub_18150();
  os_log_type_t v12 = sub_186C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, a2, v13, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  unint64_t v14 = *(void **)(a1 + *(int *)(type metadata accessor for ConfirmationSnippet() + 20));
  if (v14)
  {
    id v15 = v14;
    char v16 = (void *)a3();
    sub_18630();
  }
  else
  {
    sub_18650();
    sub_10468((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    sub_18240();
    __break(1u);
  }
}

uint64_t sub_10AF8@<X0>(void (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  a1();
  sub_B78C();
  uint64_t result = sub_183B0();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_10B58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_10398(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_10400((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_18560();
  sub_10468(&qword_20BF8, (void (*)(uint64_t))&type metadata accessor for BinaryButtonView);
  return sub_18530();
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmationSnippet(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_18080();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    os_log_type_t v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *uint64_t v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }
  return a1;
}

void destroy for ConfirmationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18080();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t assignWithCopy for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t initializeWithTake for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18080();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_11028);
}

uint64_t sub_11028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18080();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_11108);
}

uint64_t sub_11108(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_18080();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t sub_111C4()
{
  uint64_t result = sub_18080();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_11258()
{
  return sub_A188(&qword_20C90, &qword_20C98);
}

uint64_t sub_11298@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ConfirmationSnippet() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_FF78(v4, a1);
}

void sub_1130C()
{
}

uint64_t sub_1132C()
{
  return sub_18490();
}

uint64_t sub_113A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10AF8((void (*)(void))&SiriAudioConfirmationSnippetModel.denyText.getter, a1);
}

uint64_t sub_113D8()
{
  uint64_t v1 = (int *)(type metadata accessor for ConfirmationSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_18080();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

void sub_114C8()
{
}

void sub_114E8(const char *a1, uint64_t (*a2)(void))
{
  uint64_t v5 = *(void *)(type metadata accessor for ConfirmationSnippet() - 8);
  sub_108B8(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a1, a2);
}

uint64_t sub_1155C()
{
  return sub_18490();
}

uint64_t sub_115D4@<X0>(uint64_t a1@<X8>)
{
  return sub_10AF8((void (*)(void))&SiriAudioConfirmationSnippetModel.confirmText.getter, a1);
}

uint64_t sub_11604()
{
  uint64_t v0 = sub_18170();
  sub_11B2C(v0, qword_21CC0);
  sub_7590(v0, (uint64_t)qword_21CC0);
  return sub_18160();
}

uint64_t sub_11688()
{
  return 1;
}

Swift::Int sub_11690()
{
  return sub_18800();
}

void sub_116D4()
{
}

Swift::Int sub_116FC()
{
  return sub_18800();
}

uint64_t sub_1174C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Plugin()
{
  return self;
}

unint64_t sub_11784()
{
  unint64_t result = qword_20D40;
  if (!qword_20D40)
  {
    sub_17F50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20D40);
  }
  return result;
}

uint64_t sub_117DC()
{
  return sub_11840();
}

uint64_t sub_117F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_11828(uint64_t a1)
{
  return sub_11B90(a1);
}

uint64_t sub_11840()
{
  uint64_t v0 = sub_18170();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207B8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_7590(v0, (uint64_t)qword_21CC0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_18150();
  os_log_type_t v6 = sub_186C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v14 = v12;
    *(_DWORD *)uint64_t v7 = 136315138;
    v11[1] = v7 + 4;
    uint64_t v8 = sub_18680();
    uint64_t v13 = sub_F064(v8, v9, &v14);
    sub_186E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v5, v6, "Plugin#view %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_11AD8();
  swift_allocError();
  return swift_willThrow();
}

unint64_t sub_11AD8()
{
  unint64_t result = qword_20D48;
  if (!qword_20D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20D48);
  }
  return result;
}

uint64_t *sub_11B2C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_11B90(uint64_t a1)
{
  uint64_t v2 = sub_17F50();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v27 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - v6;
  uint64_t v8 = sub_18170();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  int v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207B8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_7590(v8, (uint64_t)qword_21CC0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v29 = v8;
  uint64_t v30 = a1;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v13(v7, a1, v2);
  uint64_t v14 = sub_18150();
  os_log_type_t v15 = sub_186C0();
  int v16 = v15;
  uint64_t v28 = v14;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    int v25 = v16;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v32 = v26;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v23 = v18 + 4;
    uint64_t v24 = v18;
    v13(v27, (uint64_t)v7, v2);
    uint64_t v19 = sub_18670();
    uint64_t v31 = sub_F064(v19, v20, &v32);
    sub_186E0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    uint64_t v21 = v28;
    _os_log_impl(&dword_0, v28, (os_log_type_t)v25, "AudioUIPlugin#snippet %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  return SiriAudioSnippets.snippet.getter();
}

uint64_t getEnumTagSinglePayload for Plugin.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Plugin.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x11FF4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Plugin.Error()
{
  return &type metadata for Plugin.Error;
}

unint64_t sub_12030()
{
  unint64_t result = qword_20D50;
  if (!qword_20D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_20D50);
  }
  return result;
}

uint64_t type metadata accessor for AudioUIPluginUtils()
{
  return self;
}

uint64_t sub_120AC()
{
  type metadata accessor for MediaPlayerHeightController(0);
  uint64_t v0 = swift_allocObject();
  sub_181A0();
  return v0;
}

uint64_t sub_1210C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unsigned int v4 = (int *)type metadata accessor for SiriAudioAlternativeSnippet();
  uint64_t v5 = *((void *)v4 - 1);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v71 = (uint64_t *)((char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  uint64_t v72 = (uint64_t)&v70 - v8;
  uint64_t v9 = sub_75D8(&qword_21050);
  __chkstk_darwin(v9 - 8);
  uint64_t v78 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_17FC0();
  uint64_t v82 = *(void *)(v83 - 8);
  uint64_t v11 = __chkstk_darwin(v83);
  uint64_t v70 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v70 - v13;
  uint64_t v15 = sub_75D8(&qword_21058);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v90 = (uint64_t)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v89 = (uint64_t)&v70 - v18;
  uint64_t v19 = sub_75D8(&qword_21060);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_18120();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  int v25 = (char *)&v70 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = a1 + *(int *)(type metadata accessor for SiriAudioMediaPlayerSnippet(0) + 24);
  sub_17FE0();
  int v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22);
  uint64_t v84 = v5;
  uint64_t v81 = v14;
  if (v26 == 1)
  {
    sub_FB74((uint64_t)v21, &qword_21060);
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v92 = 0;
    uint64_t v93 = 0;
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    uint64_t v91 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    uint64_t v77 = 0;
    uint64_t v74 = 0;
    uint64_t v76 = 0;
    uint64_t v75 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v25, v21, v22);
    uint64_t v80 = sub_18110();
    uint64_t v79 = v29;
    uint64_t v93 = sub_18100();
    uint64_t v88 = v30;
    uint64_t v31 = *(void **)(a1 + 24);
    if (!v31)
    {
      sub_18650();
      sub_14A90((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
      uint64_t result = sub_18240();
      __break(1u);
      return result;
    }
    id v32 = v31;
    sub_18620();
    uint64_t v34 = v33;

    type metadata accessor for MediaPlayerHeightController(0);
    sub_14A90(&qword_21080, (void (*)(uint64_t))type metadata accessor for MediaPlayerHeightController);
    sub_18210();
    uint64_t v35 = sub_18230();
    uint64_t v86 = v36;
    uint64_t v87 = v35;
    sub_18210();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_181B0();
    swift_release();
    swift_release();
    swift_release();
    sub_184E0();
    sub_18220();
    uint64_t v85 = v97;
    unsigned __int8 v95 = v98;
    uint64_t v77 = v99;
    unsigned __int8 v94 = v100;
    uint64_t v76 = v101;
    uint64_t v75 = v102;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    uint64_t v92 = v95;
    uint64_t v74 = v94;
    uint64_t v91 = v34;
    uint64_t v5 = v84;
    uint64_t v14 = v81;
    uint64_t v27 = v80;
    uint64_t v28 = v79;
  }
  uint64_t v37 = (uint64_t)v78;
  sub_17FD0();
  uint64_t v38 = v82;
  uint64_t v39 = v83;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v37, 1, v83) == 1)
  {
    sub_FB74(v37, &qword_21050);
    uint64_t v40 = 1;
    uint64_t v41 = v89;
  }
  else
  {
    uint64_t v42 = v37;
    uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 32);
    v43(v14, v42, v39);
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
    uint64_t v80 = v27;
    uint64_t v45 = v70;
    v44(v70, v14, v39);
    sub_18650();
    uint64_t v46 = v38;
    sub_14A90((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t v47 = sub_18250();
    uint64_t v79 = v28;
    uint64_t v48 = v71;
    *uint64_t v71 = v47;
    v48[1] = v49;
    uint64_t v50 = (uint64_t *)((char *)v48 + v4[5]);
    uint64_t *v50 = swift_getKeyPath();
    sub_75D8(&qword_207E8);
    swift_storeEnumTagMultiPayload();
    uint64_t v51 = (char *)v48 + v4[6];
    unsigned __int8 v94 = 0;
    sub_184A0();
    uint64_t v52 = v96;
    char *v51 = v95;
    *((void *)v51 + 1) = v52;
    long long v53 = v45;
    uint64_t v27 = v80;
    v43((char *)v48 + v4[7], (uint64_t)v53, v39);
    uint64_t v5 = v84;
    uint64_t v54 = (uint64_t)v48;
    uint64_t v28 = v79;
    uint64_t v55 = v72;
    sub_14A28(v54, v72, (uint64_t (*)(void))type metadata accessor for SiriAudioAlternativeSnippet);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v81, v39);
    uint64_t v56 = v55;
    uint64_t v41 = v89;
    sub_14A28(v56, v89, (uint64_t (*)(void))type metadata accessor for SiriAudioAlternativeSnippet);
    uint64_t v40 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(v41, v40, 1, v4);
  uint64_t v57 = v90;
  sub_14918(v41, v90);
  *a2 = v27;
  a2[1] = v28;
  uint64_t v58 = v92;
  uint64_t v59 = v88;
  a2[2] = v93;
  a2[3] = v59;
  uint64_t v60 = v91;
  uint64_t v61 = v87;
  a2[4] = v91;
  a2[5] = v61;
  uint64_t v91 = v60;
  uint64_t v92 = v58;
  uint64_t v62 = v85;
  a2[6] = v86;
  a2[7] = v62;
  uint64_t v63 = v77;
  a2[8] = v58;
  a2[9] = v63;
  uint64_t v64 = v76;
  a2[10] = v74;
  a2[11] = v64;
  a2[12] = v75;
  uint64_t v65 = sub_75D8(&qword_21068);
  sub_14918(v57, (uint64_t)a2 + *(int *)(v65 + 48));
  uint64_t v66 = v87;
  uint64_t v67 = v88;
  uint64_t v68 = v86;
  sub_14980(v27, v28, v93, v88, v60, v87, v86);
  sub_FB74(v89, &qword_21058);
  sub_FB74(v90, &qword_21058);
  return sub_149D0(v27, v28, v93, v67, v91, v66, v68);
}

uint64_t sub_12A70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_14744(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_14A28((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, type metadata accessor for SiriAudioMediaPlayerSnippet);
  sub_75D8(&qword_21040);
  sub_A188(&qword_21048, &qword_21040);
  return sub_18530();
}

uint64_t sub_12BBC()
{
  uint64_t v0 = sub_18170();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_7590(v0, (uint64_t)qword_21CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  swift_retain_n();
  uint64_t v5 = sub_18150();
  os_log_type_t v6 = sub_186C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    uint64_t v9 = v7 + 4;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_181B0();
    swift_release();
    swift_release();
    sub_186E0();
    swift_release_n();
    _os_log_impl(&dword_0, v5, v6, "snippetHeight#set value to %f", v7, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_12E08()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_181B0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_12E7C()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtC13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267627MediaPlayerHeightController__snippetHeight;
  uint64_t v2 = sub_75D8(&qword_210A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_12F20()
{
  return type metadata accessor for MediaPlayerHeightController(0);
}

uint64_t type metadata accessor for MediaPlayerHeightController(uint64_t a1)
{
  return sub_141F4(a1, (uint64_t *)&unk_20E40);
}

void sub_12F48()
{
  sub_12FD8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_12FD8()
{
  if (!qword_20E50)
  {
    unint64_t v0 = sub_181D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_20E50);
    }
  }
}

uint64_t sub_13030@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MediaPlayerHeightController(0);
  uint64_t result = sub_18190();
  *a1 = result;
  return result;
}

void sub_13070()
{
  qword_20DF0 = 0x4C41434F4CLL;
  *(void *)algn_20DF8 = 0xE500000000000000;
}

void sub_13090()
{
  algn_20E08[5] = 0;
  *(_WORD *)&algn_20E08[6] = -5120;
}

id sub_130BC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_18170();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *(void *)(v2 + 8);
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)v2;
  uint64_t v10 = qword_207C8;
  swift_bridgeObjectRetain();
  if (v10 != -1) {
    swift_once();
  }
  BOOL v11 = v9 == qword_20E00 && v8 == *(void *)algn_20E08;
  if (v11 || (sub_18790() & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v12 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v12)
  {
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    if (qword_207C0 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_20DF0;
    unint64_t v8 = *(void *)algn_20DF8;
    swift_bridgeObjectRetain();
  }
  if (qword_207D0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_7590(v4, (uint64_t)qword_21CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  swift_bridgeObjectRetain();
  sub_14C2C(v2);
  swift_bridgeObjectRetain();
  sub_14C2C(v2);
  uint64_t v14 = sub_18150();
  os_log_type_t v15 = sub_186C0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v29[1] = a1;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v30 = v9;
    uint64_t v31 = (void *)v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    v33[0] = sub_F064(v30, v8, (uint64_t *)&v31);
    sub_186E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    sub_15028(v2 + 16, (uint64_t)v33);
    sub_15028((uint64_t)v33, (uint64_t)&v32);
    sub_15090((uint64_t)v33);
    sub_75D8(&qword_21090);
    uint64_t v19 = sub_18670();
    v29[0] = v4;
    *(void *)&long long v32 = sub_F064(v19, v20, (uint64_t *)&v31);
    sub_186E0();
    swift_bridgeObjectRelease();
    sub_14CA4(v2);
    sub_14CA4(v2);
    _os_log_impl(&dword_0, v14, v15, "MediaPlayerViewController#makeUIViewController with routeUID: %s bundleID: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void))(v5 + 8))(v7, v29[0]);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_14CA4(v2);
    sub_14CA4(v2);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  id v21 = sub_14CF0(*(void *)(v2 + 16), *(void *)(v2 + 24));
  swift_bridgeObjectRelease();
  long long v32 = *(_OWORD *)(v2 + 40);
  swift_retain();
  id result = [v21 view];
  if (result)
  {
    uint64_t v23 = result;
    objc_msgSend(result, "sizeThatFits:", *(double *)(v2 + 32), 250.0);
    uint64_t v25 = v24;

    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v31 = (void *)v25;
    swift_retain();
    sub_181C0();
    sub_12BBC();
    sub_14FFC((uint64_t)&v32);
    sub_75D8(&qword_21088);
    sub_18380();
    int v26 = v31;
    [v21 setDelegate:v31];

    id result = [v21 view];
    if (result)
    {
      uint64_t v28 = result;
      LODWORD(v27) = 1148846080;
      [result setContentHuggingPriority:1 forAxis:v27];

      return v21;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_135E0(id a1, void (*a2)(uint64_t), uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = v4;
  if (a2)
  {
    uint64_t v9 = swift_retain();
    a2(v9);
    sub_15110((uint64_t)a2);
  }
  id result = [a1 view];
  if (result)
  {
    id v11 = result;
    objc_msgSend(result, "sizeThatFits:", *(double *)(v5+ OBJC_IVAR____TtCV13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267625MediaPlayerViewController11Coordinator_snippetWidth), 250.0);

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_181C0();
    id result = (id)sub_12BBC();
    if (a4)
    {
      uint64_t v12 = swift_retain();
      a4(v12);
      return (id)sub_15110((uint64_t)a4);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_13880()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MediaPlayerViewController.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MediaPlayerViewController.Coordinator()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for MediaPlayerViewController(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MediaPlayerViewController()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for MediaPlayerViewController(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for MediaPlayerViewController(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MediaPlayerViewController(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for MediaPlayerViewController(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaPlayerViewController(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaPlayerViewController(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaPlayerViewController()
{
  return &type metadata for MediaPlayerViewController;
}

uint64_t sub_13BDC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *(void *)a1 = *a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    sub_13CE8();
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = v9;
    id v11 = (void *)a2[3];
    uint64_t v10 = a2[4];
    *(void *)(a1 + 24) = v11;
    *(void *)(a1 + 32) = v10;
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = sub_17FF0();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
    id v17 = v11;
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_13CE8()
{
  return swift_retain();
}

uint64_t sub_13CF0(uint64_t a1, uint64_t a2)
{
  sub_13D78();

  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_17FF0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_13D78()
{
  return swift_release();
}

uint64_t sub_13D80(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_13CE8();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v10 = (void *)a2[3];
  uint64_t v9 = a2[4];
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v9;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t)a2 + v11;
  uint64_t v14 = sub_17FF0();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  id v16 = v10;
  v15(v12, v13, v14);
  return a1;
}

uint64_t sub_13E3C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_13CE8();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_13D78();
  uint64_t v9 = *(void **)(a1 + 24);
  uint64_t v10 = (void *)a2[3];
  *(void *)(a1 + 24) = v10;
  id v11 = v10;

  *(void *)(a1 + 32) = a2[4];
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t)a2 + v12;
  uint64_t v15 = sub_17FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t sub_13F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_17FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_13F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_13D78();
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_17FF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_14048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1405C);
}

uint64_t sub_1405C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
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
    uint64_t v9 = sub_17FF0();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_14118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1412C);
}

uint64_t sub_1412C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }
  else
  {
    uint64_t v7 = sub_17FF0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SiriAudioMediaPlayerSnippet(uint64_t a1)
{
  return sub_141F4(a1, qword_20FF8);
}

uint64_t sub_141F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1422C()
{
  uint64_t result = sub_17FF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_142CC()
{
  return &protocol witness table for Never;
}

id sub_142D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_18170();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_207D0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_7590(v2, (uint64_t)qword_21CD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_18150();
  os_log_type_t v8 = sub_186C0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "MediaPlayerViewController#makeCoordinator creating MediaPlayer Coordinator", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = *(void *)(v1 + 32);
  long long v20 = *(_OWORD *)(v1 + 40);
  uint64_t v11 = *((void *)&v20 + 1);
  uint64_t v12 = (objc_class *)type metadata accessor for MediaPlayerViewController.Coordinator();
  uint64_t v13 = (char *)objc_allocWithZone(v12);
  uint64_t v14 = &v13[OBJC_IVAR____TtCV13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267625MediaPlayerViewController11Coordinator_parent];
  long long v16 = *(_OWORD *)(v1 + 16);
  long long v15 = *(_OWORD *)(v1 + 32);
  long long v17 = *(_OWORD *)v1;
  *((void *)v14 + 6) = *(void *)(v1 + 48);
  *((_OWORD *)v14 + 1) = v16;
  *((_OWORD *)v14 + 2) = v15;
  *(_OWORD *)uint64_t v14 = v17;
  *(void *)&v13[OBJC_IVAR____TtCV13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267625MediaPlayerViewController11Coordinator_snippetWidth] = v10;
  *(void *)&v13[OBJC_IVAR____TtCV13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267625MediaPlayerViewController11Coordinator_heightController] = v11;
  sub_14C2C(v1);
  sub_14C78((uint64_t)&v20);
  v19.receiver = v13;
  v19.super_class = v12;
  return objc_msgSendSuper2(&v19, "init");
}

id sub_14500(uint64_t a1)
{
  return sub_130BC(a1);
}

id sub_1454C@<X0>(void *a1@<X8>)
{
  id result = sub_142D8();
  *a1 = result;
  return result;
}

uint64_t sub_14598()
{
  return sub_18320();
}

uint64_t sub_145D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_150BC();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_14638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_150BC();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1469C()
{
}

unint64_t sub_146C8()
{
  unint64_t result = qword_21038;
  if (!qword_21038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21038);
  }
  return result;
}

void *sub_1471C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_14728()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_14744(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioMediaPlayerSnippet(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_147A8()
{
  uint64_t v1 = (int *)(type metadata accessor for SiriAudioMediaPlayerSnippet(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_13D78();

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_17FF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_148A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for SiriAudioMediaPlayerSnippet(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1210C(v4, a1);
}

uint64_t sub_14918(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75D8(&qword_21058);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_14980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_149D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7)
  {
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_14A28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_14A90(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_14AD8@<D0>(double *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_181B0();
  swift_release();
  swift_release();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_14B5C()
{
  return sub_12BBC();
}

uint64_t sub_14BE0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_14C1C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *double result = v4 + 1;
  return result;
}

uint64_t sub_14C2C(uint64_t a1)
{
  return a1;
}

uint64_t sub_14C78(uint64_t a1)
{
  return a1;
}

uint64_t sub_14CA4(uint64_t a1)
{
  return a1;
}

id sub_14CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_18170();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  NSString v7 = sub_18660();
  swift_bridgeObjectRelease();
  if (a2)
  {
    NSString v8 = sub_18660();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  id v9 = [objc_allocWithZone((Class)MRUNowPlayingViewController) initWithRouteUID:v7 client:v8 player:0];

  [v9 setLayout:4];
  [v9 setContext:5];
  uint64_t v10 = self;
  id v11 = [v9 traitCollection];
  id v12 = [v11 userInterfaceStyle];

  uint64_t v13 = [v10 _visualStylingProviderForRecipe:1 category:1 andUserInterfaceStyle:v12];
  id v14 = [objc_allocWithZone((Class)MRUVisualStylingProvider) initWithVisualStylingProvider:v13];
  if (v14)
  {
    long long v15 = v14;
    [v9 setStylingProvider:v14];
  }
  else
  {
    if (qword_207D0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_7590(v3, (uint64_t)qword_21CD8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v16, v3);
    long long v17 = sub_18150();
    os_log_type_t v18 = sub_186C0();
    if (os_log_type_enabled(v17, v18))
    {
      objc_super v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "MediaPlayerViewController#mediaController MRUVisualStyleProvider is undefined", v19, 2u);
      swift_slowDealloc();
      long long v20 = v13;
    }
    else
    {
      long long v20 = v17;
      long long v17 = v13;
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v9;
}

uint64_t sub_14FFC(uint64_t a1)
{
  return a1;
}

uint64_t sub_15028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75D8(&qword_21090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_15090(uint64_t a1)
{
  return a1;
}

unint64_t sub_150BC()
{
  unint64_t result = qword_21098;
  if (!qword_21098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21098);
  }
  return result;
}

uint64_t sub_15110(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_15120()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_15158()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_15168()
{
  return sub_A188(&qword_210A8, (uint64_t *)&unk_210B0);
}

uint64_t sub_151B0()
{
  uint64_t v0 = sub_18170();
  sub_11B2C(v0, qword_21CD8);
  sub_7590(v0, (uint64_t)qword_21CD8);
  sub_15248();
  sub_186D0();
  return sub_18180();
}

unint64_t sub_15248()
{
  unint64_t result = qword_21120;
  if (!qword_21120)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_21120);
  }
  return result;
}

uint64_t *sub_15288(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_17F70();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    id v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    id v12 = *(void **)v10;
    uint64_t v11 = *((void *)v10 + 1);
    *id v9 = v12;
    v9[1] = v11;
    id v13 = v12;
  }
  return a1;
}

void sub_15360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17F70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_153D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_17F70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v11 = *(void **)v9;
  uint64_t v10 = *(void *)(v9 + 8);
  *uint64_t v8 = v11;
  v8[1] = v10;
  id v12 = v11;
  return a1;
}

uint64_t sub_1545C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_17F70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  uint64_t v11 = *(void **)v9;
  *uint64_t v8 = *(void *)v9;
  id v12 = v11;

  v8[1] = *(void *)(v9 + 8);
  return a1;
}

uint64_t sub_154F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_17F70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_15570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_17F70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = *(void **)(a1 + v7);
  *uint64_t v8 = *v9;

  v8[1] = v9[1];
  return a1;
}

uint64_t sub_15604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_15618);
}

uint64_t sub_15618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_17F70();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_156E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_156F8);
}

uint64_t sub_156F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_17F70();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for SiriAudioSimpleTextSnippet()
{
  uint64_t result = qword_21180;
  if (!qword_21180) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_15800()
{
  uint64_t result = sub_17F70();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_15894()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_158B0()
{
  return sub_185E0();
}

uint64_t sub_15940(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_15A50(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_15BA4((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_185F0();
  sub_15C78();
  return sub_18530();
}

uint64_t sub_15A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioSimpleTextSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_15AB4()
{
  uint64_t v1 = (int *)(type metadata accessor for SiriAudioSimpleTextSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_17F70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_15BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioSimpleTextSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_15C08()
{
  type metadata accessor for SiriAudioSimpleTextSnippet();

  return sub_158B0();
}

unint64_t sub_15C78()
{
  unint64_t result = qword_211B8;
  if (!qword_211B8)
  {
    sub_185F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_211B8);
  }
  return result;
}

unint64_t sub_15CD4()
{
  unint64_t result = qword_211C0;
  if (!qword_211C0)
  {
    sub_98E8(&qword_211C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_211C0);
  }
  return result;
}

uint64_t *sub_15D30(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_16C78(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for SiriAudioShazamSnippetModel);
}

void sub_15D48(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_15D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16DFC(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for SiriAudioShazamSnippetModel);
}

uint64_t sub_15D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16EA0(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for SiriAudioShazamSnippetModel);
}

uint64_t sub_15D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16F54(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for SiriAudioShazamSnippetModel);
}

uint64_t sub_15DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16FEC(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for SiriAudioShazamSnippetModel);
}

uint64_t sub_15DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_15DD4);
}

uint64_t sub_15DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_170B0(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for SiriAudioShazamSnippetModel);
}

uint64_t sub_15DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_15E00);
}

uint64_t sub_15E00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_171AC(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for SiriAudioShazamSnippetModel);
}

uint64_t type metadata accessor for SiriAudioShazamSnippet(uint64_t a1)
{
  return sub_141F4(a1, qword_21228);
}

uint64_t sub_15E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_17284(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for SiriAudioShazamSnippetModel);
}

uint64_t sub_15E50()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_15E6C(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t matched = type metadata accessor for ShazamSuccessfulMatchView(0);
  __chkstk_darwin(matched);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_18140();
  uint64_t v26 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_75D8(&qword_21298);
  __chkstk_darwin(v28);
  uint64_t v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_75D8(&qword_212A0);
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_75D8(&qword_21278);
  __chkstk_darwin(v9);
  int v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_17E90();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  long long v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_180E0();
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (v16 == enum case for ShazamSnippetRole.success(_:))
  {
    (*(void (**)(char *, uint64_t))(v13 + 96))(v15, v12);
    uint64_t v17 = v26;
    objc_super v19 = v29;
    uint64_t v18 = v30;
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v29, v15, v30);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v2, v19, v18);
    long long v20 = (uint64_t *)&v2[*(int *)(matched + 20)];
    sub_18650();
    sub_169A4((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    *long long v20 = sub_18250();
    v20[1] = v21;
    sub_169EC((uint64_t)v2, (uint64_t)v8, type metadata accessor for ShazamSuccessfulMatchView);
    swift_storeEnumTagMultiPayload();
    sub_168DC();
    sub_169A4(&qword_21288, (void (*)(uint64_t))type metadata accessor for ShazamSuccessfulMatchView);
    sub_182C0();
    sub_16A54((uint64_t)v11, (uint64_t)v5);
    swift_storeEnumTagMultiPayload();
    sub_16830();
    sub_16950();
    sub_182C0();
    sub_16ABC((uint64_t)v11);
    sub_16B1C((uint64_t)v2);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v29, v30);
  }
  else if (v16 == enum case for ShazamSnippetRole.listening(_:))
  {
    sub_18650();
    sub_169A4((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    uint64_t v22 = (void *)sub_18250();
    *uint64_t v8 = v22;
    v8[1] = v23;
    swift_storeEnumTagMultiPayload();
    sub_168DC();
    sub_169A4(&qword_21288, (void (*)(uint64_t))type metadata accessor for ShazamSuccessfulMatchView);
    id v24 = v22;
    sub_182C0();
    sub_16A54((uint64_t)v11, (uint64_t)v5);
    swift_storeEnumTagMultiPayload();
    sub_16830();
    sub_16950();
    sub_182C0();
    sub_16ABC((uint64_t)v11);
  }
  else if (v16 == enum case for ShazamSnippetRole.noMatch(_:))
  {
    sub_18650();
    sub_169A4((unint64_t *)&unk_21070, (void (*)(uint64_t))&type metadata accessor for Context);
    *uint64_t v5 = sub_18250();
    v5[1] = v25;
    swift_storeEnumTagMultiPayload();
    sub_16830();
    sub_16950();
    sub_182C0();
  }
  else
  {
    sub_18780();
    __break(1u);
  }
}

uint64_t sub_164C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(a1 - 8);
  sub_169EC(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SiriAudioShazamSnippet);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_166E0((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4);
  sub_75D8(&qword_21260);
  sub_167B4();
  return sub_18530();
}

uint64_t sub_165F0()
{
  uint64_t v1 = (int *)(type metadata accessor for SiriAudioShazamSnippet(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_180F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_166E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriAudioShazamSnippet(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_16744(uint64_t a1@<X8>)
{
  type metadata accessor for SiriAudioShazamSnippet(0);

  sub_15E6C(a1);
}

unint64_t sub_167B4()
{
  unint64_t result = qword_21268;
  if (!qword_21268)
  {
    sub_98E8(&qword_21260);
    sub_16830();
    sub_16950();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21268);
  }
  return result;
}

unint64_t sub_16830()
{
  unint64_t result = qword_21270;
  if (!qword_21270)
  {
    sub_98E8(&qword_21278);
    sub_168DC();
    sub_169A4(&qword_21288, (void (*)(uint64_t))type metadata accessor for ShazamSuccessfulMatchView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21270);
  }
  return result;
}

unint64_t sub_168DC()
{
  unint64_t result = qword_21280;
  if (!qword_21280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21280);
  }
  return result;
}

uint64_t type metadata accessor for ShazamSuccessfulMatchView(uint64_t a1)
{
  return sub_141F4(a1, qword_21300);
}

unint64_t sub_16950()
{
  unint64_t result = qword_21290;
  if (!qword_21290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21290);
  }
  return result;
}

uint64_t sub_169A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_169EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_16A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_75D8(&qword_21278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_16ABC(uint64_t a1)
{
  uint64_t v2 = sub_75D8(&qword_21278);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_16B1C(uint64_t a1)
{
  uint64_t matched = type metadata accessor for ShazamSuccessfulMatchView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(matched - 8) + 8))(a1, matched);
  return a1;
}

void *initializeBufferWithCopyOfBuffer for ShazamNoMatchView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for ShazamNoMatchView(id *a1)
{
}

uint64_t assignWithCopy for ShazamNoMatchView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

__n128 initializeWithTake for ShazamNoMatchView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ShazamNoMatchView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for ShazamNoMatchView()
{
  return &type metadata for ShazamNoMatchView;
}

uint64_t *sub_16C60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_16C78(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t *sub_16C78(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(void))
{
  int v6 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    uint64_t v8 = a4(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    int v11 = (char *)a2 + v9;
    uint64_t v13 = *(void **)v11;
    uint64_t v12 = *((void *)v11 + 1);
    *uint64_t v10 = v13;
    v10[1] = v12;
    id v14 = v13;
  }
  return a1;
}

void sub_16D54(uint64_t a1, uint64_t a2)
{
}

void sub_16D6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  int v6 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_16DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16DFC(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t sub_16DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = a2 + v8;
  uint64_t v12 = *(void **)v10;
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = v12;
  v9[1] = v11;
  id v13 = v12;
  return a1;
}

uint64_t sub_16E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16EA0(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t sub_16EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(a1, a2, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = a2 + v8;
  uint64_t v11 = *(void **)(a1 + v8);
  uint64_t v12 = *(void **)v10;
  *uint64_t v9 = *(void *)v10;
  id v13 = v12;

  v9[1] = *(void *)(v10 + 8);
  return a1;
}

uint64_t sub_16F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16F54(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t sub_16F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_16FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_16FEC(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t sub_16FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(a1, a2, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = *(void **)(a1 + v8);
  *uint64_t v9 = *v10;

  v9[1] = v10[1];
  return a1;
}

uint64_t sub_17084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_17098);
}

uint64_t sub_17098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_170B0(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t sub_170B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = a4(0);
  uint64_t v8 = *(void *)(v7 - 8);
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v9(a1, a2, v7);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_17180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_17194);
}

uint64_t sub_17194(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_171AC(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t sub_171AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  uint64_t v10 = *(void *)(result - 8);
  if (*(_DWORD *)(v10 + 84) == a3)
  {
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v11(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t sub_1726C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_17284(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for ShazamSuccessfulMatchViewModel);
}

uint64_t sub_17284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s13AudioUIPlugin17ShazamNoMatchViewVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s13AudioUIPlugin17ShazamNoMatchViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShazamListeningView()
{
  return &type metadata for ShazamListeningView;
}

unint64_t sub_173DC()
{
  unint64_t result = qword_21338;
  if (!qword_21338)
  {
    sub_98E8(&qword_21340);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21338);
  }
  return result;
}

uint64_t sub_17438()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_17454@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_17E40();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_17E50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t *)((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_17E80();
  swift_allocObject();
  sub_17E70();
  *uint64_t v9 = 0;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, enum case for MatchingFlowState.noMatch(_:), v6);
  sub_17E60();
  swift_retain();
  sub_17E30();
  LOBYTE(v6) = sub_18390();
  sub_181E0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  swift_release();
  uint64_t v18 = a1 + *(int *)(sub_75D8(&qword_21348) + 36);
  *(unsigned char *)uint64_t v18 = v6;
  *(void *)(v18 + 8) = v11;
  *(void *)(v18 + 16) = v13;
  *(void *)(v18 + 24) = v15;
  *(void *)(v18 + 32) = v17;
  *(unsigned char *)(v18 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_17674@<X0>(uint64_t a1@<X8>)
{
  return sub_17454(a1);
}

uint64_t sub_1767C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_17698@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v37 = a1;
  uint64_t v3 = sub_17E40();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  __chkstk_darwin(v3);
  unint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_17E50();
  uint64_t v6 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_17E20();
  uint64_t v9 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_18140();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_17CB0();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v2, v12);
  uint64_t v16 = (void *)sub_186B0();
  sub_17E80();
  swift_allocObject();
  sub_17E70();
  sub_18130();
  id v17 = v16;
  sub_17E10();
  sub_17E00();
  uint64_t v18 = v33;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v8, v11, v33);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for MatchingFlowState.match(_:), v34);
  sub_17E60();
  swift_retain();
  sub_17E30();
  LOBYTE(v12) = sub_18390();
  sub_181E0();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v35;
  uint64_t v27 = v36;
  uint64_t v29 = v37;
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v37, v5, v36);

  swift_release();
  uint64_t v30 = v29 + *(int *)(sub_75D8(&qword_21348) + 36);
  *(unsigned char *)uint64_t v30 = v12;
  *(void *)(v30 + 8) = v20;
  *(void *)(v30 + 16) = v22;
  *(void *)(v30 + 24) = v24;
  *(void *)(v30 + 32) = v26;
  *(unsigned char *)(v30 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v27);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_17A70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_17A8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_17E40();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_17E50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_17E80();
  swift_allocObject();
  sub_17E70();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for MatchingFlowState.listening(_:), v6);
  sub_17E60();
  swift_retain();
  sub_17E30();
  LOBYTE(v6) = sub_18390();
  sub_181E0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  swift_release();
  uint64_t v18 = a1 + *(int *)(sub_75D8(&qword_21348) + 36);
  *(unsigned char *)uint64_t v18 = v6;
  *(void *)(v18 + 8) = v11;
  *(void *)(v18 + 16) = v13;
  *(void *)(v18 + 24) = v15;
  *(void *)(v18 + 32) = v17;
  *(unsigned char *)(v18 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_17CA8@<X0>(uint64_t a1@<X8>)
{
  return sub_17A8C(a1);
}

unint64_t sub_17CB0()
{
  unint64_t result = qword_21350;
  if (!qword_21350)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_21350);
  }
  return result;
}

unint64_t sub_17CF4()
{
  unint64_t result = qword_21358;
  if (!qword_21358)
  {
    sub_98E8(&qword_21348);
    sub_169A4((unint64_t *)&unk_21360, (void (*)(uint64_t))&type metadata accessor for MatchingFlowView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_21358);
  }
  return result;
}

uint64_t sub_17DB0()
{
  return type metadata accessor for URL();
}

uint64_t sub_17DC0()
{
  return type metadata accessor for SeparatorStyle();
}

uint64_t sub_17DD0()
{
  return static RFImage.url(_:dark:)();
}

uint64_t sub_17DE0()
{
  return static RFImage.appIcon(_:)();
}

uint64_t sub_17DF0()
{
  return type metadata accessor for RFImage();
}

uint64_t sub_17E00()
{
  return MatchResult.showStreamingServiceLink.setter();
}

uint64_t sub_17E10()
{
  return MatchResult.init(mediaItem:)();
}

uint64_t sub_17E20()
{
  return type metadata accessor for MatchResult();
}

uint64_t sub_17E30()
{
  return MatchingFlowView.init(viewModel:)();
}

uint64_t sub_17E40()
{
  return type metadata accessor for MatchingFlowView();
}

uint64_t sub_17E50()
{
  return type metadata accessor for MatchingFlowState();
}

uint64_t sub_17E60()
{
  return dispatch thunk of MatchingFlowViewModel.state.setter();
}

uint64_t sub_17E70()
{
  return MatchingFlowViewModel.init()();
}

uint64_t sub_17E80()
{
  return type metadata accessor for MatchingFlowViewModel();
}

uint64_t sub_17E90()
{
  return type metadata accessor for ShazamSnippetRole();
}

uint64_t sub_17EA0()
{
  return SiriAudioAlternativeItemModel.id.getter();
}

uint64_t sub_17EB0()
{
  return SiriAudioAlternativeItemModel.title.getter();
}

uint64_t sub_17EC0()
{
  return SiriAudioAlternativeItemModel.command.getter();
}

uint64_t sub_17ED0()
{
  return SiriAudioAlternativeItemModel.imageURL.getter();
}

uint64_t sub_17EE0()
{
  return SiriAudioAlternativeItemModel.subtitle.getter();
}

uint64_t sub_17EF0()
{
  return type metadata accessor for SiriAudioAlternativeItemModel();
}

uint64_t sub_17F00()
{
  return SiriAudioDisambiguationItemModel.id.getter();
}

uint64_t sub_17F10()
{
  return SiriAudioDisambiguationItemModel.title.getter();
}

uint64_t sub_17F20()
{
  return SiriAudioDisambiguationItemModel.imageURL.getter();
}

uint64_t sub_17F30()
{
  return SiriAudioDisambiguationItemModel.subtitle.getter();
}

uint64_t sub_17F40()
{
  return type metadata accessor for SiriAudioDisambiguationItemModel();
}

uint64_t sub_17F50()
{
  return type metadata accessor for SiriAudioSnippets();
}

uint64_t sub_17F60()
{
  return SiriAudioSimpleTextSnippetModel.text.getter();
}

uint64_t sub_17F70()
{
  return type metadata accessor for SiriAudioSimpleTextSnippetModel();
}

uint64_t sub_17F80()
{
  return SiriAudioAlternativeSnippetModel.isSnippetInDarkMode.getter();
}

uint64_t sub_17F90()
{
  return SiriAudioAlternativeSnippetModel.items.getter();
}

uint64_t sub_17FA0()
{
  return SiriAudioAlternativeSnippetModel.title.getter();
}

uint64_t sub_17FB0()
{
  return SiriAudioAlternativeSnippetModel.subtitle.getter();
}

uint64_t sub_17FC0()
{
  return type metadata accessor for SiriAudioAlternativeSnippetModel();
}

uint64_t sub_17FD0()
{
  return SiriAudioMediaPlayerSnippetModel.alternativesModel.getter();
}

uint64_t sub_17FE0()
{
  return SiriAudioMediaPlayerSnippetModel.mediaPlayerModel.getter();
}

uint64_t sub_17FF0()
{
  return type metadata accessor for SiriAudioMediaPlayerSnippetModel();
}

uint64_t sub_18000()
{
  return type metadata accessor for SiriAudioActionButtonSnippetRole();
}

uint64_t sub_18010()
{
  return SiriAudioActionButtonSnippetModel.buttonRole.getter();
}

uint64_t sub_18020()
{
  return SiriAudioActionButtonSnippetModel.buttonLabel.getter();
}

uint64_t sub_18030()
{
  return SiriAudioActionButtonSnippetModel.buttonStyle.getter();
}

uint64_t sub_18040()
{
  return SiriAudioActionButtonSnippetModel.buttonCommand.getter();
}

uint64_t sub_18050()
{
  return type metadata accessor for SiriAudioActionButtonSnippetModel();
}

uint64_t sub_18060()
{
  return type metadata accessor for SiriAudioActionButtonSnippetStyle();
}

uint64_t sub_18070()
{
  return SiriAudioConfirmationSnippetModel.isDestructive.getter();
}

uint64_t sub_18080()
{
  return type metadata accessor for SiriAudioConfirmationSnippetModel();
}

uint64_t sub_18090()
{
  return SiriAudioDisambiguationSnippetModel.isAppDisambiguation.getter();
}

uint64_t sub_180A0()
{
  return SiriAudioDisambiguationSnippetModel.directInvocation.getter();
}

uint64_t sub_180B0()
{
  return SiriAudioDisambiguationSnippetModel.items.getter();
}

uint64_t sub_180C0()
{
  return SiriAudioDisambiguationSnippetModel.title.getter();
}

uint64_t sub_180D0()
{
  return type metadata accessor for SiriAudioDisambiguationSnippetModel();
}

uint64_t sub_180E0()
{
  return SiriAudioShazamSnippetModel.role.getter();
}

uint64_t sub_180F0()
{
  return type metadata accessor for SiriAudioShazamSnippetModel();
}

uint64_t sub_18100()
{
  return MediaPlayerModel.bundleID.getter();
}

uint64_t sub_18110()
{
  return MediaPlayerModel.routeUID.getter();
}

uint64_t sub_18120()
{
  return type metadata accessor for MediaPlayerModel();
}

uint64_t sub_18130()
{
  return ShazamSuccessfulMatchViewModel.subscriptionStatus.getter();
}

uint64_t sub_18140()
{
  return type metadata accessor for ShazamSuccessfulMatchViewModel();
}

uint64_t sub_18150()
{
  return Logger.logObject.getter();
}

uint64_t sub_18160()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_18170()
{
  return type metadata accessor for Logger();
}

uint64_t sub_18180()
{
  return Logger.init(_:)();
}

uint64_t sub_18190()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_181A0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_181B0()
{
  return static Published.subscript.getter();
}

uint64_t sub_181C0()
{
  return static Published.subscript.setter();
}

uint64_t sub_181D0()
{
  return type metadata accessor for Published();
}

uint64_t sub_181E0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_181F0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_18200()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_18210()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_18220()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_18230()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_18240()
{
  return EnvironmentObject.error()();
}

uint64_t sub_18250()
{
  return EnvironmentObject.init()();
}

uint64_t sub_18260()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_18270()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_18280()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_18290()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_182A0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_182B0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_182C0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_182D0()
{
  return static PrimitiveButtonStyle<>.rfButton.getter();
}

uint64_t sub_182E0()
{
  return static PrimitiveButtonStyle<>.rfButtonCircularIconOnly.getter();
}

uint64_t sub_182F0()
{
  return static PrimitiveButtonStyle<>.rfButtonCircularIconAndTitle.getter();
}

uint64_t sub_18300()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_18310()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_18320()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_18340()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_18350()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_18360()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_18380()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t sub_18390()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_183A0()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_183B0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_183C0()
{
  return View.eraseToAnyView()();
}

uint64_t sub_183D0()
{
  return View.buttonRole(_:)();
}

uint64_t sub_183E0()
{
  return View.separators(_:isOverride:)();
}

uint64_t sub_183F0()
{
  return View.componentTapped(isNavigation:perform:)();
}

uint64_t sub_18400()
{
  return View.imageAspectRatio(width:height:)();
}

uint64_t sub_18410()
{
  return View.setHostBackground(_:)();
}

uint64_t sub_18420()
{
  return View.lastComponentBottomSpacing(_:)();
}

uint64_t sub_18430()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_18440()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_18450()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_18460()
{
  return View.labelsHidden()();
}

uint64_t sub_18470()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_18480()
{
  return static Color.black.getter();
}

uint64_t sub_18490()
{
  return Label.init(title:icon:)();
}

uint64_t sub_184A0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_184B0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_184C0()
{
  return Button.init(action:label:)();
}

uint64_t sub_184D0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_184E0()
{
  return static Alignment.center.getter();
}

uint64_t sub_184F0()
{
  return type metadata accessor for ButtonItemButtonStyle.Role();
}

uint64_t sub_18500()
{
  return type metadata accessor for RFImageView();
}

uint64_t sub_18510()
{
  return RFImageView.init(_:)();
}

uint64_t sub_18520()
{
  return type metadata accessor for RFButtonStyle();
}

uint64_t sub_18530()
{
  return ComponentStack.init(content:)();
}

uint64_t sub_18540()
{
  return type metadata accessor for HostBackground();
}

uint64_t sub_18550()
{
  return BinaryButtonView.init(primaryButton:secondaryButton:)();
}

uint64_t sub_18560()
{
  return type metadata accessor for BinaryButtonView();
}

uint64_t sub_18570()
{
  return SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)();
}

uint64_t sub_18580()
{
  return type metadata accessor for SimpleItemRichView();
}

uint64_t sub_18590()
{
  return PrimaryHeaderRichView.init(text1:text2:text3:text4:thumbnail:addTint:)();
}

uint64_t sub_185A0()
{
  return type metadata accessor for PrimaryHeaderRichView();
}

uint64_t sub_185B0()
{
  return ExpandableStandardView.init(_:expandableContent:)();
}

uint64_t sub_185C0()
{
  return SimpleItemStandardView.init(text1:text2:text3:text4:text5:text6:)();
}

uint64_t sub_185D0()
{
  return type metadata accessor for SimpleItemStandardView();
}

uint64_t sub_185E0()
{
  return SummaryItemStandardView.init(text1:text2:text3:text4:thumbnail:)();
}

uint64_t sub_185F0()
{
  return type metadata accessor for SummaryItemStandardView();
}

uint64_t sub_18600()
{
  return DisambiguationStandardView.init(header:content:)();
}

uint64_t sub_18610()
{
  return type metadata accessor for ComponentStackBottomSpacing();
}

uint64_t sub_18620()
{
  return dispatch thunk of Context.snippetWidth.getter();
}

uint64_t sub_18630()
{
  return dispatch thunk of Context.perform(aceCommand:)();
}

uint64_t sub_18640()
{
  return dispatch thunk of Context.perform(directInvocation:payload:)();
}

uint64_t sub_18650()
{
  return type metadata accessor for Context();
}

NSString sub_18660()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_18670()
{
  return String.init<A>(describing:)();
}

uint64_t sub_18680()
{
  return String.lowercased()()._countAndFlagsBits;
}

Swift::Int sub_18690()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_186A0()
{
  return String.init<A>(_:)();
}

uint64_t sub_186B0()
{
  return SHMediaItem.init(from:)();
}

uint64_t sub_186C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_186D0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_186E0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_186F0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_18700(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_18710()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_18720()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_18730()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_18740()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_18750()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_18760()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_18770()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_18780()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_18790()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_187A0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_187B0()
{
  return Error._code.getter();
}

uint64_t sub_187C0()
{
  return Error._domain.getter();
}

uint64_t sub_187D0()
{
  return Error._userInfo.getter();
}

uint64_t sub_187E0()
{
  return Hasher.init(_seed:)();
}

void sub_187F0(Swift::UInt a1)
{
}

Swift::Int sub_18800()
{
  return Hasher._finalize()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}