id SAHWorkaroundInitialize(void)
{
  return (id)[NSString string];
}

uint64_t variable initialization expression of ArtistNameParameterBuilder.parameterName()
{
  return 1;
}

uint64_t variable initialization expression of SearchMusicAppIntent._searchSource()
{
  return 0;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.songIsDisliked()
{
  return 2;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.songIsLiked()
{
  return 2;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.mediaItemType()
{
  return 0;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.queueIsPlayingShuffled()
{
  return 2;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.queueLength()
{
  return 0;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent()
{
  return 0;
}

uint64_t variable initialization expression of InternalSignalsManager.lock()
{
  return sub_2355BC140();
}

void type metadata accessor for INMediaAffinityType(uint64_t a1)
{
}

void type metadata accessor for INMediaItemType(uint64_t a1)
{
}

unint64_t sub_2355704B8()
{
  unint64_t result = qword_26880C1A8;
  if (!qword_26880C1A8)
  {
    type metadata accessor for INMediaItemType(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C1A8);
  }
  return result;
}

void *sub_235570510@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_235570520()
{
  return sub_2355BD390();
}

uint64_t sub_235570568()
{
  return sub_2355BD380();
}

uint64_t sub_235570594()
{
  return sub_2355BD390();
}

BOOL sub_2355705D8(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_2355705EC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_235570600(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for FavoriteEntityChangeRequestAction(uint64_t a1)
{
}

void type metadata accessor for INPlaybackQueueLocation(uint64_t a1)
{
}

void sub_235570634(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_235570688()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1C8);
  sub_2355BBEB0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2355BDC90;
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  uint64_t result = sub_2355BBEA0();
  qword_26880D0C0 = v0;
  return result;
}

uint64_t sub_2355708B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1C8);
  sub_2355BBEB0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2355BDCA0;
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  sub_2355BBEA0();
  uint64_t result = sub_2355BBEA0();
  qword_26880D0C8 = v0;
  return result;
}

uint64_t sub_235570DEC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1C0);
  uint64_t v0 = sub_2355BC9C0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2355BDCB0;
  unint64_t v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x263F74908], v0);
  v6(v5 + v2, *MEMORY[0x263F748F8], v0);
  v6(v5 + 2 * v2, *MEMORY[0x263F74900], v0);
  v6(v5 + 3 * v2, *MEMORY[0x263F748F0], v0);
  v6(v5 + 4 * v2, *MEMORY[0x263F748E8], v0);
  v6(v5 + 5 * v2, *MEMORY[0x263F74920], v0);
  v6(v5 + 6 * v2, *MEMORY[0x263F74910], v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 7 * v2, *MEMORY[0x263F74918], v0);
  qword_26880D0D0 = v4;
  return result;
}

unint64_t sub_235570FD8(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
    case 2:
      return result;
    case 3:
      unint64_t result = 0x646E61702E6D6F63;
      break;
    case 4:
      unint64_t result = 0xD000000000000020;
      break;
    default:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
  }
  return result;
}

uint64_t sub_235571094()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for AudioSuggestionsConstants()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t INLocalSearchProvider.init(localSearch:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235571114(a1, a2);
}

uint64_t sub_235571114(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void INLocalSearchProvider.search(for:requesterSharedUserID:bundleIdentifier:intent:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void), uint64_t a8)
{
  uint64_t v129 = a6;
  uint64_t v127 = a5;
  uint64_t v126 = a4;
  uint64_t v131 = a2;
  uint64_t v132 = a3;
  v11 = (uint8_t *)sub_2355BCB80();
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v15 = (char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v128 = (uint8_t *)&v119 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v124 = (char *)&v119 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v22 = (char *)&v119 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  v123 = (char *)&v119 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v121 = (char *)&v119 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v139 = (uint8_t *)&v119 - v28;
  MEMORY[0x270FA5388](v27);
  v30 = (char *)&v119 - v29;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v31 = __swift_project_value_buffer((uint64_t)v11, (uint64_t)qword_26880D108);
  v32 = *(void (**)(uint8_t *, uint64_t, uint8_t *))(v12 + 16);
  uint64_t v136 = v31;
  v137 = v32;
  uint64_t v138 = v12 + 16;
  ((void (*)(char *))v32)(v30);
  id v33 = a1;
  v34 = sub_2355BCB60();
  os_log_type_t v35 = sub_2355BCF80();
  v141 = (uint8_t *)a1;
  os_log_type_t v36 = v35;
  BOOL v37 = os_log_type_enabled(v34, v35);
  v125 = v22;
  id v134 = v33;
  if (v37)
  {
    v130 = a7;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v133 = a8;
    v39 = (uint8_t *)v38;
    uint64_t v40 = swift_slowAlloc();
    v41 = v33;
    uint64_t v42 = v40;
    *(_DWORD *)v39 = 136315138;
    v122 = v15;
    v142 = v141;
    v143[0] = v40;
    id v43 = v41;
    uint64_t v120 = v12;
    id v44 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1D0);
    uint64_t v45 = sub_2355BCC60();
    v142 = (uint8_t *)sub_2355745F0(v45, v46, v143);
    v15 = v122;
    sub_2355BD1B0();

    uint64_t v12 = v120;
    a7 = v130;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v34, v36, "INLocalSearchProvider#search Request for local search with INMediaSearch: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v42, -1, -1);
    v47 = v39;
    a8 = v133;
    MEMORY[0x237DE3BF0](v47, -1, -1);
  }
  else
  {
  }
  v48 = *(void (**)(char *, uint8_t *))(v12 + 8);
  v48(v30, v11);
  v49 = v141;
  v140 = v48;
  if (v141)
  {
    uint64_t v50 = a8;
    v51 = a7;
    id v52 = v134;
    id v53 = v134;
    BOOL v54 = sub_235572118(v53);

    if (v54) {
      goto LABEL_23;
    }
    uint64_t v55 = sub_2355BCF90();
    id v56 = objc_msgSend(v53, sel_mediaType);
    a7 = v51;
    a8 = v50;
    v48 = v140;
  }
  else
  {
    uint64_t v55 = sub_2355BCF90();
    id v56 = 0;
  }
  char v57 = sub_235571FEC((uint64_t)v56, v55);
  swift_bridgeObjectRelease();
  if (v57)
  {
LABEL_17:
    sub_2355744C4();
    v61 = (void *)sub_2355BCED0();
    v137(v139, v136, v11);
    id v62 = v61;
    v63 = sub_2355BCB60();
    os_log_type_t v64 = sub_2355BCF80();
    if (os_log_type_enabled(v63, v64))
    {
      v130 = a7;
      v65 = (uint8_t *)swift_slowAlloc();
      v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = a8;
      v141 = v66;
      *(_DWORD *)v65 = 138412290;
      v143[0] = (uint64_t)v62;
      id v67 = v62;
      a7 = v130;
      sub_2355BD1B0();
      v68 = v141;
      *(void *)v141 = v62;

      v48 = v140;
      _os_log_impl(&dword_23556D000, v63, v64, "INLocalSearchProvider#search Request for local search with podcastShow type (or Podcasts app identifier), falling back with synthetic item: %@", v65, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v68, -1, -1);
      MEMORY[0x237DE3BF0](v65, -1, -1);
    }
    else
    {
    }
    v48((char *)v139, v11);
    id v69 = v62;
    a7(v62);
LABEL_21:

    return;
  }
  uint64_t v58 = sub_2355BC570();
  if (v127)
  {
    if (v58 == v126 && v59 == v127)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    char v60 = sub_2355BD2F0();
    swift_bridgeObjectRelease();
    if (v60) {
      goto LABEL_17;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v50 = a8;
  v51 = a7;
  id v52 = v134;
  if (!v49)
  {
    sub_2355744C4();
    v87 = (void *)sub_2355BCEB0();
    v137((uint8_t *)v15, v136, v11);
    id v88 = v87;
    v89 = sub_2355BCB60();
    uint64_t v90 = sub_2355BCF80();
    if (os_log_type_enabled(v89, (os_log_type_t)v90))
    {
      v130 = v51;
      v91 = (uint8_t *)swift_slowAlloc();
      v92 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = v50;
      v93 = v92;
      v139 = v92;
      v122 = v15;
      v141 = v91;
      *(_DWORD *)v91 = 138412290;
      v143[0] = (uint64_t)v88;
      id v94 = v88;
      v51 = v130;
      v15 = v122;
      sub_2355BD1B0();
      *(void *)v93 = v88;

      v96 = v140;
      v95 = v141;
      _os_log_impl(&dword_23556D000, v89, (os_log_type_t)v90, "INLocalSearchProvider#search Request for local search with nil INMediaSearch, falling back with synthetic item: %@", v141, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
      v97 = v139;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v97, -1, -1);
      MEMORY[0x237DE3BF0](v95, -1, -1);
    }
    else
    {

      v96 = v140;
    }
    v96(v15, v11);
    id v69 = v88;
    v51(v88);
    goto LABEL_21;
  }
LABEL_23:
  id v70 = v52;
  if (sub_2355BD0E0())
  {
    v137(v128, v136, v11);
    v71 = sub_2355BCB60();
    os_log_type_t v72 = sub_2355BCF60();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_23556D000, v71, v72, "INLocalSearchProvider#search SkipWholeLibraryFallbackForPlayThis internal signal present. Returning no results.", v73, 2u);
      MEMORY[0x237DE3BF0](v73, -1, -1);
    }

    v140((char *)v128, v11);
    v51(0);

    return;
  }
  v74 = (void (*)(id))v51;
  if (!sub_235572118(v70))
  {
    if ((sub_235571FEC((uint64_t)objc_msgSend(v70, sel_mediaType), (uint64_t)&unk_26E8AFE70) & 1) == 0)
    {
      sub_2355744C4();
      objc_msgSend(v70, sel_mediaType);
      v105 = (void *)sub_2355BCEB0();
      v106 = v125;
      v137((uint8_t *)v125, v136, v11);
      id v107 = v105;
      v108 = sub_2355BCB60();
      os_log_type_t v109 = sub_2355BCF80();
      if (os_log_type_enabled(v108, v109))
      {
        uint64_t v133 = v50;
        v110 = (uint8_t *)swift_slowAlloc();
        v111 = (void *)swift_slowAlloc();
        uint64_t v138 = (uint64_t)v111;
        v130 = v51;
        v139 = v110;
        *(_DWORD *)v110 = 138412290;
        uint64_t v120 = v12;
        v141 = v11;
        v143[0] = (uint64_t)v107;
        id v112 = v107;
        v113 = v140;
        v11 = v141;
        v74 = (void (*)(id))v130;
        sub_2355BD1B0();
        void *v111 = v107;

        v114 = v139;
        _os_log_impl(&dword_23556D000, v108, v109, "INLocalSearchProvider#search Request for non-specific local INMediaSearch, falling back with synthetic item: %@", v139, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
        uint64_t v115 = v138;
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v115, -1, -1);
        v116 = v114;
        v106 = v125;
        MEMORY[0x237DE3BF0](v116, -1, -1);
      }
      else
      {

        v113 = v140;
      }
      v113(v106, v11);
      id v69 = v107;
      v74(v107);

      goto LABEL_21;
    }
    v82 = v124;
    v137((uint8_t *)v124, v136, v11);
    v83 = sub_2355BCB60();
    os_log_type_t v84 = sub_2355BCF60();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v85 = 0;
      _os_log_impl(&dword_23556D000, v83, v84, "INLocalSearchProvider#search Specified type without search parameter, not searching locally and instead will prompt for value", v85, 2u);
      v86 = v85;
      v82 = v124;
      MEMORY[0x237DE3BF0](v86, -1, -1);
    }

    v140(v82, v11);
    goto LABEL_36;
  }
  if (sub_2355BD000())
  {
    v75 = v123;
    v137((uint8_t *)v123, v136, v11);
    v76 = sub_2355BCB60();
    os_log_type_t v77 = sub_2355BCF80();
    BOOL v78 = os_log_type_enabled(v76, v77);
    v79 = v140;
    if (v78)
    {
      v80 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_23556D000, v76, v77, "INLocalSearchProvider#search Skipping actual local search as isPommesResponse=true", v80, 2u);
      v81 = v80;
      v75 = v123;
      MEMORY[0x237DE3BF0](v81, -1, -1);
    }

    v79(v75, v11);
LABEL_36:
    v51(0);

    return;
  }
  v98 = v140;
  uint64_t v133 = v50;
  v99 = v121;
  v137((uint8_t *)v121, v136, v11);
  v100 = sub_2355BCB60();
  os_log_type_t v101 = sub_2355BCF60();
  if (os_log_type_enabled(v100, v101))
  {
    v102 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v102 = 0;
    _os_log_impl(&dword_23556D000, v100, v101, "INLocalSearchProvider#search using actual local search (likely CoreSpotlight...", v102, 2u);
    MEMORY[0x237DE3BF0](v102, -1, -1);
  }

  v98(v99, v11);
  sub_235574CD0(v135, (uint64_t)v143);
  v140 = (void (*)(char *, uint8_t *))v143[4];
  v141 = (uint8_t *)__swift_project_boxed_opaque_existential_1(v143, v143[3]);
  v139 = (uint8_t *)sub_2355BCF30();
  uint64_t v138 = sub_2355BCF40();
  sub_2355BCF20();
  id v103 = objc_msgSend(v70, sel_genreNames);
  if (v103)
  {
    v104 = v103;
    sub_2355BCDB0();
  }
  objc_msgSend(v70, sel_mediaType);
  v117 = (void *)swift_allocObject();
  v117[2] = v74;
  v117[3] = v133;
  v117[4] = v70;
  id v118 = v70;
  swift_retain();
  sub_2355BC7F0();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v143);
}

uint64_t sub_235571FEC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_235572050(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_2355BD2F0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2355BD2F0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

BOOL sub_235572118(void *a1)
{
  id v2 = objc_msgSend(a1, sel_mediaName);
  if (v2)
  {
    uint64_t v3 = sub_2355BCC50();
    unint64_t v5 = v4;

    id v2 = (id)(v3 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v5 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v6 = (uint64_t)v2;
  }
  if (v6) {
    return 1;
  }
  id v7 = objc_msgSend(a1, sel_artistName);
  if (v7)
  {
    uint64_t v8 = sub_2355BCC50();
    unint64_t v10 = v9;

    id v7 = (id)(v8 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v10 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = (uint64_t)v7;
  }
  if (v11) {
    return 1;
  }
  id v13 = objc_msgSend(a1, sel_genreNames);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = sub_2355BCDB0();

    uint64_t v16 = *(void *)(v15 + 16);
    swift_bridgeObjectRelease();
    if (v16) {
      return 1;
    }
  }
  id v17 = objc_msgSend(a1, sel_moodNames);
  if (v17
    && (uint64_t v18 = v17,
        uint64_t v19 = sub_2355BCDB0(),
        v18,
        uint64_t v20 = *(void *)(v19 + 16),
        swift_bridgeObjectRelease(),
        v20))
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, sel_mediaType) == (id)20;
  }
}

void sub_235572294(unint64_t a1, void (*a2)(void), uint64_t a3, void *a4)
{
  id v260 = a4;
  uint64_t v277 = sub_2355BC0A0();
  uint64_t v262 = *(void *)(v277 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v277);
  v275 = (char *)&v237 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v276 = (char *)&v237 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v270 = (char *)&v237 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v269 = (char *)&v237 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v257 = (char *)&v237 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v259 = (char *)&v237 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v237 - v20;
  MEMORY[0x270FA5388](v19);
  v261 = (char *)&v237 - v22;
  uint64_t v273 = sub_2355BC340();
  uint64_t v23 = *(void *)(v273 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v273);
  v272 = (char *)&v237 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v271 = (void (*)(char *, uint64_t, uint64_t))((char *)&v237 - v26);
  v264 = (char *)sub_2355BCB80();
  uint64_t v27 = *((void *)v264 - 1);
  uint64_t v28 = MEMORY[0x270FA5388](v264);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  v32 = (char *)&v237 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  os_log_type_t v35 = (char *)&v237 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v37 = MEMORY[0x270FA5388]((char *)&v237 - v36);
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  uint64_t v40 = MEMORY[0x270FA5388](v39);
  uint64_t v41 = MEMORY[0x270FA5388](v40);
  uint64_t v42 = MEMORY[0x270FA5388](v41);
  uint64_t v43 = MEMORY[0x270FA5388](v42);
  uint64_t v44 = MEMORY[0x270FA5388](v43);
  unint64_t v46 = (uint8_t *)&v237 - v45;
  uint64_t v47 = MEMORY[0x270FA5388](v44);
  uint64_t v58 = (char *)&v237 - v57;
  if (!a1)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v87 = (uint64_t)v264;
    uint64_t v88 = __swift_project_value_buffer((uint64_t)v264, (uint64_t)qword_26880D108);
    uint64_t v89 = v27;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v58, v88, v87);
    uint64_t v90 = sub_2355BCB60();
    os_log_type_t v91 = sub_2355BCF80();
    if (os_log_type_enabled(v90, v91))
    {
      v92 = a2;
      v93 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v93 = 0;
      _os_log_impl(&dword_23556D000, v90, v91, "INLocalSearchProvider#search Missing result from local search", v93, 2u);
      id v94 = v93;
      a2 = v92;
      MEMORY[0x237DE3BF0](v94, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v89 + 8))(v58, v87);
    a2(0);
    return;
  }
  uint64_t v255 = a3;
  v256 = (void (*)(void *))a2;
  unint64_t v279 = a1;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v95 = v27;
    uint64_t v96 = qword_26880C108;
    swift_bridgeObjectRetain();
    if (v96 != -1) {
      swift_once();
    }
    uint64_t v97 = (uint64_t)v264;
    uint64_t v98 = __swift_project_value_buffer((uint64_t)v264, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v32, v98, v97);
    v99 = sub_2355BCB60();
    os_log_type_t v100 = sub_2355BCF80();
    if (os_log_type_enabled(v99, v100))
    {
      os_log_type_t v101 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v101 = 0;
      _os_log_impl(&dword_23556D000, v99, v100, "INLocalSearchProvider#search Results from search non-nil, but empty", v101, 2u);
      MEMORY[0x237DE3BF0](v101, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v95 + 8))(v32, v97);
    v256(0);
    goto LABEL_101;
  }
  uint64_t v254 = v53;
  uint64_t v252 = v52;
  uint64_t v245 = v51;
  uint64_t v253 = v50;
  uint64_t v246 = v49;
  uint64_t v242 = v48;
  uint64_t v244 = v47;
  uint64_t v247 = v56;
  uint64_t v243 = v55;
  uint64_t v241 = v54;
  unint64_t v258 = (*(unsigned __int8 *)(v262 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v262 + 80);
  swift_bridgeObjectRetain();
  uint64_t v59 = v271;
  sub_2355BC040();
  uint64_t v60 = *MEMORY[0x263F6CB28];
  v61 = *(void (**)(char *, void, uint64_t))(v23 + 104);
  id v62 = v272;
  uint64_t v63 = v273;
  uint64_t v267 = v23 + 104;
  v266 = v61;
  v61(v272, v60, v273);
  sub_235575260();
  char v64 = sub_2355BCC30();
  v66 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v65 = v23 + 8;
  v66(v62, v63);
  uint64_t v268 = v65;
  v265 = v66;
  v66((char *)v59, v63);
  if (v64)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v21 = v264;
    uint64_t v67 = __swift_project_value_buffer((uint64_t)v264, (uint64_t)qword_26880D108);
    uint64_t v68 = v27;
    (*(void (**)(char *, uint64_t, char *))(v27 + 16))(v35, v67, v21);
    uint64_t v27 = sub_2355BCB60();
    os_log_type_t v69 = sub_2355BCF80();
    BOOL v70 = os_log_type_enabled((os_log_t)v27, v69);
    unint64_t v71 = v258;
    if (v70)
    {
      unint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v46 = 0;
      _os_log_impl(&dword_23556D000, (os_log_t)v27, v69, "INLocalSearchProvider#search Found playlist item as first in results", v46, 2u);
      MEMORY[0x237DE3BF0](v46, -1, -1);
    }

    (*(void (**)(char *, char *))(v68 + 8))(v35, v21);
    unint64_t v72 = sub_2355744C4();
    v73 = v261;
    if (*(void *)(v279 + 16))
    {
      v274 = (void (*)(char *, char *))v72;
      uint64_t v74 = v279 + v71;
      uint64_t v21 = (char *)(v262 + 16);
      uint64_t v59 = *(void (**)(char *, uint64_t, uint64_t))(v262 + 16);
      unint64_t v75 = v71;
      uint64_t v76 = v262;
      id v62 = (char *)v277;
      v59(v261, v74, v277);
      uint64_t v273 = sub_2355BC030();
      unint64_t v46 = v77;
      uint64_t v27 = *(void *)(v76 + 8);
      ((void (*)(char *, char *))v27)(v73, v62);
      if (*(void *)(v279 + 16))
      {
        BOOL v78 = v276;
        v59(v276, v279 + v75, (uint64_t)v62);
        v272 = (char *)sub_2355BC070();
        ((void (*)(char *, char *))v27)(v78, v62);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1E0);
        uint64_t v79 = swift_allocObject();
        *(_OWORD *)(v79 + 16) = xmmword_2355BDD10;
        if (*(void *)(v279 + 16))
        {
          uint64_t v80 = v79;
          uint64_t v81 = v279 + v75;
          v82 = v275;
          v59(v275, v81, (uint64_t)v62);
          uint64_t v83 = sub_2355BC030();
          uint64_t v85 = v84;
          ((void (*)(char *, char *))v27)(v82, v62);
          *(void *)(v80 + 32) = v83;
          *(void *)(v80 + 40) = v85;
          v86 = (void *)sub_2355BCE90();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v256(v86);

LABEL_101:
          swift_bridgeObjectRelease();
          return;
        }
        __break(1u);
        goto LABEL_116;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    id v62 = (char *)v277;
    if (*(void *)(v279 + 16))
    {
      uint64_t v102 = v262;
      uint64_t v59 = (void (*)(char *, uint64_t, uint64_t))(v262 + 16);
      id v103 = v261;
      v276 = *(char **)(v262 + 16);
      ((void (*)(char *, unint64_t, uint64_t))v276)(v261, v279 + v258, v277);
      uint64_t v104 = sub_2355BC030();
      v105 = v62;
      uint64_t v65 = v104;
      id v62 = v106;
      v274 = *(void (**)(char *, char *))(v102 + 8);
      v275 = (char *)(v102 + 8);
      v274(v103, v105);
      if (qword_26880C108 == -1) {
        goto LABEL_24;
      }
      goto LABEL_114;
    }
  }
  __break(1u);
LABEL_114:
  swift_once();
LABEL_24:
  uint64_t v107 = __swift_project_value_buffer((uint64_t)v264, (uint64_t)qword_26880D108);
  v108 = *(void (**)(uint64_t, uint64_t, char *))(v27 + 16);
  uint64_t v249 = v107;
  uint64_t v251 = v27 + 16;
  v250 = v108;
  ((void (*)(uint8_t *))v108)(v46);
  os_log_type_t v109 = sub_2355BCB60();
  os_log_type_t v110 = sub_2355BCF80();
  if (os_log_type_enabled(v109, v110))
  {
    v111 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v111 = 0;
    _os_log_impl(&dword_23556D000, v109, v110, "INLocalSearchProvider#search Evaluating what the title/artist/sort of INMediaItem should be from results and input", v111, 2u);
    MEMORY[0x237DE3BF0](v111, -1, -1);
  }

  v113 = *(void (**)(uint64_t, char *))(v27 + 8);
  uint64_t v112 = v27 + 8;
  v248 = v113;
  v113((uint64_t)v46, v264);
  unint64_t v114 = v279;
  BOOL v115 = *(void *)(v279 + 16) == 1;
  v240 = v62;
  uint64_t v239 = v65;
  if (v115)
  {
    unint64_t v116 = v258;
    v117 = v261;
    id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
    uint64_t v119 = v277;
    ((void (*)(char *, unint64_t, uint64_t))v276)(v261, v279 + v258, v277);
    uint64_t v237 = sub_2355BC070();
    uint64_t v238 = v120;
    v121 = (void (*)(char *, uint64_t))v274;
    v274(v117, (char *)v119);
    if (!*(void *)(v279 + 16))
    {
LABEL_116:
      __break(1u);
      goto LABEL_117;
    }
    v118(v117, v279 + v116, v119);
    uint64_t v245 = sub_2355BC090();
    uint64_t v246 = v122;
    v121(v117, v119);
    v250(v254, v249, v264);
    v123 = sub_2355BCB60();
    os_log_type_t v124 = sub_2355BCF80();
    if (os_log_type_enabled(v123, v124))
    {
      v125 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v125 = 0;
      _os_log_impl(&dword_23556D000, v123, v124, "INLocalSearchProvider#search Using single-result title/artist", v125, 2u);
      MEMORY[0x237DE3BF0](v125, -1, -1);
    }

    v248(v254, v264);
    goto LABEL_32;
  }
  id v128 = v260;
  id v129 = objc_msgSend(v260, sel_albumName);
  v130 = (void (*)(char *, uint64_t))v274;
  if (v129)
  {

    if (*(void *)(v114 + 16))
    {
      unint64_t v127 = v258;
      unint64_t v131 = v114 + v258;
      uint64_t v132 = v261;
      id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
      uint64_t v133 = v277;
      ((void (*)(char *, unint64_t, uint64_t))v276)(v261, v131, v277);
      uint64_t v237 = sub_2355BC050();
      uint64_t v238 = v134;
      v130(v132, v133);
      if (*(void *)(v279 + 16))
      {
        v118(v132, v279 + v127, v133);
        uint64_t v245 = sub_2355BC090();
        uint64_t v246 = v135;
        v130(v132, v133);
        v250(v252, v249, v264);
        uint64_t v136 = sub_2355BCB60();
        os_log_type_t v137 = sub_2355BCF80();
        if (os_log_type_enabled(v136, v137))
        {
          uint64_t v138 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v138 = 0;
          _os_log_impl(&dword_23556D000, v136, v137, "INLocalSearchProvider#search Using album from search request", v138, 2u);
          MEMORY[0x237DE3BF0](v138, -1, -1);
        }

        uint64_t v139 = (uint64_t)v264;
        v248(v252, v264);
        v250(v253, v249, (char *)v139);
        v140 = sub_2355BCB60();
        os_log_type_t v141 = sub_2355BCF80();
        if (os_log_type_enabled(v140, v141))
        {
          v142 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v142 = 0;
          _os_log_impl(&dword_23556D000, v140, v141, "INLocalSearchProvider#search Sorting by album, track", v142, 2u);
          MEMORY[0x237DE3BF0](v142, -1, -1);
        }

        v248(v253, v264);
        sub_2355743DC(&v279);
LABEL_78:
        while (1)
        {
          uint64_t v126 = v262;
LABEL_79:
          uint64_t v193 = MEMORY[0x263F8EE78];
          uint64_t v278 = MEMORY[0x263F8EE78];
          uint64_t v194 = *(void *)(v279 + 16);
          uint64_t v195 = swift_bridgeObjectRetain();
          v264 = (char *)v194;
          if (!v194) {
            break;
          }
          v196 = 0;
          v261 = (char *)(v195 + v127);
          LODWORD(v260) = *MEMORY[0x263F6CB20];
          v259 = (char *)(v126 + 32);
          v197 = v257;
          v263 = v59;
          uint64_t v262 = v195;
          uint64_t v198 = v277;
          v199 = v265;
          while ((unint64_t)v196 < *(void *)(v195 + 16))
          {
            uint64_t v200 = *(void *)(v126 + 72);
            v118(v197, (unint64_t)&v261[v200 * (void)v196], v198);
            v201 = (char *)v271;
            sub_2355BC040();
            v202 = v272;
            uint64_t v203 = v126;
            uint64_t v204 = v273;
            v266(v272, v260, v273);
            char v205 = sub_2355BC330();
            v199(v202, v204);
            v199(v201, v204);
            if (v205)
            {
              uint64_t v126 = v203;
              v206 = *(void (**)(unint64_t, char *, uint64_t))v259;
              (*(void (**)(char *, char *, uint64_t))v259)(v269, v197, v198);
              uint64_t v207 = v278;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_2355B7370(0, *(void *)(v207 + 16) + 1, 1);
                uint64_t v207 = v278;
              }
              unint64_t v209 = *(void *)(v207 + 16);
              unint64_t v208 = *(void *)(v207 + 24);
              if (v209 >= v208 >> 1)
              {
                sub_2355B7370(v208 > 1, v209 + 1, 1);
                uint64_t v207 = v278;
              }
              *(void *)(v207 + 16) = v209 + 1;
              v206(v207 + v258 + v209 * v200, v269, v277);
              uint64_t v278 = v207;
              v197 = v257;
            }
            else
            {
              v274(v197, (char *)v198);
              uint64_t v126 = v203;
            }
            ++v196;
            uint64_t v59 = v263;
            id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
            uint64_t v195 = v262;
            if (v264 == v196)
            {
              uint64_t v193 = v278;
              unint64_t v127 = v258;
              goto LABEL_91;
            }
          }
          __break(1u);
LABEL_103:
          char v223 = sub_2355BD2F0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v127 = v258;
          v176 = v261;
          if (v223)
          {
LABEL_104:
            if (!*(void *)(v279 + 16)) {
              goto LABEL_124;
            }
            id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
            uint64_t v224 = v277;
            ((void (*)(char *, unint64_t, uint64_t))v276)(v176, v279 + v127, v277);
            v225 = v176;
            uint64_t v237 = sub_2355BC050();
            uint64_t v238 = v226;
            v227 = v176;
            v228 = (void (*)(char *, uint64_t))v274;
            v274(v227, (char *)v224);
            if (!*(void *)(v279 + 16)) {
              goto LABEL_125;
            }
            v118(v225, v279 + v127, v224);
            uint64_t v245 = sub_2355BC090();
            uint64_t v246 = v229;
            v228(v225, v224);
            v250(v242, v249, v264);
            v230 = sub_2355BCB60();
            os_log_type_t v231 = sub_2355BCF80();
            if (os_log_type_enabled(v230, v231))
            {
              v232 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v232 = 0;
              _os_log_impl(&dword_23556D000, v230, v231, "INLocalSearchProvider#search Matching album from results to trigger album response", v232, 2u);
              MEMORY[0x237DE3BF0](v232, -1, -1);
            }

            uint64_t v233 = (uint64_t)v264;
            v248(v242, v264);
            v250(v243, v249, (char *)v233);
            v234 = sub_2355BCB60();
            os_log_type_t v235 = sub_2355BCF80();
            if (os_log_type_enabled(v234, v235))
            {
              v236 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v236 = 0;
              _os_log_impl(&dword_23556D000, v234, v235, "INLocalSearchProvider#search Sorting by album, track", v236, 2u);
              MEMORY[0x237DE3BF0](v236, -1, -1);
            }

            v248(v243, v264);
            sub_2355743DC(&v279);
          }
          else
          {
LABEL_69:
            id v184 = objc_msgSend(v260, sel_mediaName, v237, v238, v239, v240);
            if (v184)
            {
              v185 = v184;
              uint64_t v237 = sub_2355BCC50();
              uint64_t v238 = v186;
            }
            else
            {
              uint64_t v237 = 0;
              uint64_t v238 = 0;
            }
            id v187 = objc_msgSend(v260, sel_artistName, v237, v238);
            if (v187)
            {
              v188 = v187;
              uint64_t v245 = sub_2355BCC50();
              uint64_t v246 = v189;
            }
            else
            {
              uint64_t v245 = 0;
              uint64_t v246 = 0;
            }
            id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
            v250(v244, v249, v264);
            v190 = sub_2355BCB60();
            os_log_type_t v191 = sub_2355BCF80();
            if (os_log_type_enabled(v190, v191))
            {
              v192 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v192 = 0;
              _os_log_impl(&dword_23556D000, v190, v191, "INLocalSearchProvider#search Falling back on media name for title", v192, 2u);
              MEMORY[0x237DE3BF0](v192, -1, -1);
            }

            v248(v244, v264);
          }
        }
LABEL_91:
        swift_bridgeObjectRelease();
        uint64_t v210 = *(void *)(v193 + 16);
        if (v210)
        {
          unint64_t v211 = v193 + v127;
          uint64_t v212 = *(void *)(v126 + 72);
          uint64_t v273 = v193;
          swift_retain();
          v213 = (void *)MEMORY[0x263F8EE78];
          uint64_t v214 = v277;
          do
          {
            v215 = v270;
            v118(v270, v211, v214);
            uint64_t v216 = sub_2355BC030();
            uint64_t v218 = v217;
            v274(v215, (char *)v214);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v213 = sub_2355B6DE0(0, v213[2] + 1, 1, v213);
            }
            unint64_t v220 = v213[2];
            unint64_t v219 = v213[3];
            if (v220 >= v219 >> 1) {
              v213 = sub_2355B6DE0((void *)(v219 > 1), v220 + 1, 1, v213);
            }
            v213[2] = v220 + 1;
            v221 = &v213[2 * v220];
            v221[4] = v216;
            v221[5] = v218;
            v211 += v212;
            --v210;
            id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
          }
          while (v210);
          swift_release_n();
        }
        else
        {
          swift_release();
        }
        sub_2355744C4();
        v222 = (void *)sub_2355BCE90();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v256(v222);

        goto LABEL_101;
      }
      goto LABEL_118;
    }
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
    goto LABEL_121;
  }
  id v143 = objc_msgSend(v128, sel_artistName);
  if (v143)
  {

    id v144 = objc_msgSend(v128, sel_mediaName);
    if (v144)
    {

      goto LABEL_44;
    }
    if (!*(void *)(v114 + 16))
    {
LABEL_121:
      __break(1u);
      goto LABEL_122;
    }
    unint64_t v177 = v114 + v258;
    v178 = v261;
    id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
    uint64_t v179 = v277;
    ((void (*)(char *, unint64_t, uint64_t))v276)(v261, v177, v277);
    uint64_t v237 = sub_2355BC090();
    uint64_t v238 = v180;
    v130(v178, v179);
    v250(v245, v249, v264);
    v181 = sub_2355BCB60();
    os_log_type_t v182 = sub_2355BCF80();
    if (os_log_type_enabled(v181, v182))
    {
      v183 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v183 = 0;
      _os_log_impl(&dword_23556D000, v181, v182, "INLocalSearchProvider#search Using artist from search request", v183, 2u);
      MEMORY[0x237DE3BF0](v183, -1, -1);
    }

    v248(v245, v264);
    uint64_t v245 = 0;
    uint64_t v246 = 0;
LABEL_32:
    uint64_t v126 = v262;
    unint64_t v127 = v258;
    goto LABEL_79;
  }
LABEL_44:
  uint64_t v145 = v112;
  id v146 = objc_msgSend(v128, sel_genreNames);
  if (v146)
  {
    v147 = v146;
    uint64_t v148 = sub_2355BCDB0();

    uint64_t v149 = *(void *)(v148 + 16);
    swift_bridgeObjectRelease();
    if (v149)
    {
      unint64_t v127 = v258;
      if (*(void *)(v114 + 16))
      {
        unint64_t v150 = v114 + v258;
        v151 = v261;
        id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
        uint64_t v152 = v277;
        ((void (*)(char *, unint64_t, uint64_t))v276)(v261, v150, v277);
        uint64_t v237 = sub_2355BC060();
        uint64_t v238 = v153;
        v274(v151, (char *)v152);
        v250(v246, v249, v264);
        v154 = sub_2355BCB60();
        os_log_type_t v155 = sub_2355BCF80();
        if (os_log_type_enabled(v154, v155))
        {
          v156 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v156 = 0;
          _os_log_impl(&dword_23556D000, v154, v155, "INLocalSearchProvider#search Using genre title/artist", v156, 2u);
          MEMORY[0x237DE3BF0](v156, -1, -1);
        }

        v248(v246, v264);
        uint64_t v245 = 0;
        uint64_t v246 = 0;
        goto LABEL_78;
      }
      goto LABEL_119;
    }
  }
  id v157 = objc_msgSend(v260, sel_mediaName);
  unint64_t v127 = v258;
  if (!v157)
  {
    uint64_t v245 = 0;
    uint64_t v246 = 0;
    uint64_t v237 = 0;
    uint64_t v238 = 0;
    uint64_t v126 = v262;
    id v118 = (void (*)(char *, unint64_t, uint64_t))v276;
    goto LABEL_79;
  }

  if (!*(void *)(v114 + 16)) {
    goto LABEL_120;
  }
  v158 = v261;
  uint64_t v159 = v277;
  ((void (*)(char *, unint64_t, uint64_t))v276)(v261, v114 + v127, v277);
  sub_2355BC050();
  uint64_t v161 = v160;
  v274(v158, (char *)v159);
  swift_bridgeObjectRelease();
  uint64_t v254 = v145;
  if (!v161) {
    goto LABEL_69;
  }
  if (*(void *)(v279 + 16))
  {
    unint64_t v162 = v258;
    v163 = v21;
    v164 = (void (*)(char *, unint64_t, uint64_t))v276;
    uint64_t v165 = v277;
    ((void (*)(char *, unint64_t, uint64_t))v276)(v21, v279 + v258, v277);
    uint64_t v166 = sub_2355BC050();
    uint64_t v168 = v167;
    v169 = (void (*)(char *, uint64_t))v274;
    v274(v163, (char *)v165);
    uint64_t v170 = *(void *)(v279 + 16);
    if (v170)
    {
      unint64_t v171 = v279 + v162 + *(void *)(v262 + 72) * (v170 - 1);
      v172 = v259;
      v164(v259, v171, v165);
      uint64_t v173 = sub_2355BC050();
      uint64_t v175 = v174;
      v169(v172, v165);
      if (v168)
      {
        if (v175)
        {
          if (v166 == v173 && v168 == v175)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            unint64_t v127 = v258;
            v176 = v261;
            goto LABEL_104;
          }
          goto LABEL_103;
        }
        unint64_t v127 = v258;
      }
      else
      {
        unint64_t v127 = v258;
        v176 = v261;
        if (!v175) {
          goto LABEL_104;
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_69;
    }
    goto LABEL_123;
  }
LABEL_122:
  __break(1u);
LABEL_123:
  __break(1u);
LABEL_124:
  __break(1u);
LABEL_125:
  __break(1u);
}

char *sub_2355743DC(unint64_t *a1)
{
  uint64_t v2 = *(void *)(sub_2355BC0A0() - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_2355A00A4(v3);
  }
  uint64_t v4 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_2355752B8(v6);
  *a1 = v3;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_2355744C4()
{
  unint64_t result = qword_26880C210;
  if (!qword_26880C210)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26880C210);
  }
  return result;
}

uint64_t sub_235574504(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_235574514(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_235574550(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_235574578(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2355745F0(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2355BD1B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2355745F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2355746C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_235575200((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_235575200((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2355746C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2355BD1C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_235574880(a5, a6);
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
  uint64_t v8 = sub_2355BD260();
  if (!v8)
  {
    sub_2355BD270();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2355BD2B0();
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

uint64_t sub_235574880(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_235574918(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_235574A90(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_235574A90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235574918(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23557B5F8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2355BD230();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2355BD270();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2355BCCE0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2355BD2B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2355BD270();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_235574A90(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C310);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

unsigned char **sub_235574BE0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_235574BF0(uint64_t (*a1)(void))
{
  return a1();
}

void sub_235574C18(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2355BD1B0();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_235574CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_235574D78()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_235574DB8(unint64_t a1)
{
  sub_235572294(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t initializeBufferWithCopyOfBuffer for INLocalSearchProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for INLocalSearchProvider(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1Tm(a1);
}

uint64_t initializeWithCopy for INLocalSearchProvider(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for INLocalSearchProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        size_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for INLocalSearchProvider(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for INLocalSearchProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for INLocalSearchProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for INLocalSearchProvider()
{
  return &type metadata for INLocalSearchProvider;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_235575200(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_235575260()
{
  unint64_t result = qword_26880C1D8;
  if (!qword_26880C1D8)
  {
    sub_2355BC340();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C1D8);
  }
  return result;
}

char *sub_2355752B8(uint64_t *a1)
{
  uint64_t v2 = sub_2355BC0A0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v165 = (char *)&v157 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v179 = (char *)&v157 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v157 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v157 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v169 = (char *)&v157 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v157 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v161 = (char *)&v157 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v160 = (char *)&v157 - v21;
  v183 = a1;
  uint64_t v22 = a1[1];
  unint64_t result = (char *)sub_2355BD2D0();
  if ((uint64_t)result >= v22)
  {
    if (v22 < 0) {
      goto LABEL_169;
    }
    if (v22) {
      return sub_235576044(0, v22, 1, v183);
    }
    return result;
  }
  if (v22 >= 0) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = v22 + 1;
  }
  if (v22 < -1) {
    goto LABEL_177;
  }
  uint64_t v168 = v18;
  uint64_t v159 = result;
  if (v22 < 2)
  {
    uint64_t v28 = (char *)MEMORY[0x263F8EE78];
    unint64_t v167 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v158 = MEMORY[0x263F8EE78];
    if (v22 != 1)
    {
      unint64_t v30 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_136:
      uint64_t v150 = v170;
      if (v30 >= 2)
      {
        uint64_t v151 = *v183;
        do
        {
          unint64_t v152 = v30 - 2;
          if (v30 < 2) {
            goto LABEL_164;
          }
          if (!v151) {
            goto LABEL_176;
          }
          uint64_t v153 = *(void *)&v28[16 * v152 + 32];
          uint64_t v154 = *(void *)&v28[16 * v30 + 24];
          sub_2355763E8(v151 + *(void *)(v3 + 72) * v153, v151 + *(void *)(v3 + 72) * *(void *)&v28[16 * v30 + 16], v151 + *(void *)(v3 + 72) * v154, v167);
          if (v150) {
            break;
          }
          if (v154 < v153) {
            goto LABEL_165;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v28 = sub_235576CFC((uint64_t)v28);
          }
          if (v152 >= *((void *)v28 + 2)) {
            goto LABEL_166;
          }
          os_log_type_t v155 = &v28[16 * v152 + 32];
          *(void *)os_log_type_t v155 = v153;
          *((void *)v155 + 1) = v154;
          unint64_t v156 = *((void *)v28 + 2);
          if (v30 > v156) {
            goto LABEL_167;
          }
          memmove(&v28[16 * v30 + 16], &v28[16 * v30 + 32], 16 * (v156 - v30));
          *((void *)v28 + 2) = v156 - 1;
          unint64_t v30 = v156 - 1;
        }
        while (v156 > 2);
      }
LABEL_147:
      swift_bridgeObjectRelease();
      *(void *)(v158 + 16) = 0;
      return (char *)swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v25 = v24 >> 1;
    uint64_t v26 = sub_2355BCDF0();
    *(void *)(v26 + 16) = v25;
    unint64_t v27 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v158 = v26;
    unint64_t v167 = v26 + v27;
  }
  uint64_t v29 = 0;
  uint64_t v175 = (void (**)(char *, uint64_t))(v3 + 8);
  v181 = (void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  uint64_t v28 = (char *)MEMORY[0x263F8EE78];
  uint64_t v162 = v3;
  uint64_t v184 = v2;
  unint64_t v177 = v13;
  v178 = v10;
  uint64_t v171 = v3 + 16;
LABEL_15:
  uint64_t v31 = (char *)(v29 + 1);
  v163 = v28;
  uint64_t v166 = v29;
  if (v29 + 1 >= v22)
  {
    uint64_t v45 = v29 + 1;
    goto LABEL_68;
  }
  uint64_t v180 = v22;
  uint64_t v32 = v29;
  uint64_t v33 = *v183;
  uint64_t v34 = v3;
  uint64_t v35 = *(void *)(v3 + 72);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
  v36(v160, *v183 + v35 * (void)v31, v2);
  uint64_t v173 = v33;
  uint64_t v182 = v35;
  v36(v161, v33 + v35 * v32, v2);
  sub_2355BC050();
  if (!v37)
  {
    LODWORD(v176) = 1;
    uint64_t v3 = v162;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  sub_2355BC050();
  uint64_t v3 = v162;
  if (!v38) {
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  uint64_t v39 = sub_2355BC080();
  if (v40)
  {
    BOOL v44 = 1;
    goto LABEL_25;
  }
  uint64_t v41 = v39;
  uint64_t v42 = sub_2355BC080();
  if (v43)
  {
LABEL_23:
    LODWORD(v176) = 0;
    goto LABEL_26;
  }
  BOOL v44 = v42 < v41;
LABEL_25:
  LODWORD(v176) = v44;
LABEL_26:
  unint64_t v46 = *v175;
  (*v175)(v161, v2);
  v46(v160, v2);
  uint64_t v29 = v166;
  uint64_t v45 = v166 + 2;
  if (v166 + 2 < v180)
  {
    uint64_t v174 = v182 * (void)v31;
    uint64_t v47 = v173;
    uint64_t v48 = v182 * v45;
    while (1)
    {
      uint64_t v49 = v45;
      uint64_t v50 = v184;
      v36(v168, v47 + v48, v184);
      v36(v169, v47 + v174, v50);
      sub_2355BC050();
      if (!v51) {
        break;
      }
      swift_bridgeObjectRelease();
      sub_2355BC050();
      if (v52)
      {
        swift_bridgeObjectRelease();
        uint64_t v53 = sub_2355BC080();
        if (v54) {
          break;
        }
        BOOL v55 = sub_2355BC080() < v53;
        int v57 = (v56 & 1) == 0 && v55;
      }
      else
      {
        int v57 = 0;
      }
LABEL_36:
      uint64_t v58 = v184;
      v46(v169, v184);
      v46(v168, v58);
      if (v176 != v57)
      {
        uint64_t v3 = v162;
        uint64_t v2 = v184;
        uint64_t v28 = v163;
        uint64_t v45 = v49;
        uint64_t v29 = v166;
        goto LABEL_40;
      }
      uint64_t v45 = v49 + 1;
      v47 += v182;
      if (v180 == v49 + 1)
      {
        uint64_t v59 = (char *)v180;
        uint64_t v45 = v180;
        uint64_t v3 = v162;
        uint64_t v2 = v184;
        uint64_t v28 = v163;
        uint64_t v29 = v166;
        goto LABEL_41;
      }
    }
    int v57 = 1;
    goto LABEL_36;
  }
LABEL_40:
  uint64_t v59 = (char *)v180;
LABEL_41:
  uint64_t v60 = v177;
  v61 = v178;
  if (!v176) {
    goto LABEL_54;
  }
  if (v45 < v29) {
    goto LABEL_170;
  }
  if (v29 < v45)
  {
    uint64_t v62 = 0;
    uint64_t v63 = v182 * (v45 - 1);
    uint64_t v64 = v45 * v182;
    uint64_t v65 = v29;
    uint64_t v66 = v29 * v182;
    do
    {
      if (v65 != v45 + v62 - 1)
      {
        uint64_t v68 = v173;
        if (!v173) {
          goto LABEL_175;
        }
        unint64_t v69 = v173 + v66;
        uint64_t v70 = v173 + v63;
        v176 = *v181;
        v176(v165, v173 + v66, v184);
        if (v66 < v63 || v69 >= v68 + v64)
        {
          uint64_t v67 = v184;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v67 = v184;
          if (v66 != v63) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v176((char *)v70, (uint64_t)v165, v67);
        uint64_t v3 = v162;
        uint64_t v28 = v163;
      }
      ++v65;
      --v62;
      v63 -= v182;
      v64 -= v182;
      v66 += v182;
    }
    while (v65 < v45 + v62);
    uint64_t v2 = v184;
    uint64_t v60 = v177;
    v61 = v178;
    uint64_t v29 = v166;
    uint64_t v59 = (char *)v180;
    if (v45 >= v180) {
      goto LABEL_68;
    }
  }
  else
  {
LABEL_54:
    if (v45 >= (uint64_t)v59) {
      goto LABEL_68;
    }
  }
  if (__OFSUB__(v45, v29)) {
    goto LABEL_168;
  }
  if (v45 - v29 >= (uint64_t)v159)
  {
    uint64_t v29 = v166;
LABEL_68:
    if (v45 < v29) {
      goto LABEL_163;
    }
    goto LABEL_69;
  }
  if (__OFADD__(v166, v159)) {
    goto LABEL_171;
  }
  if ((uint64_t)&v159[v166] >= (uint64_t)v59) {
    unint64_t v71 = v59;
  }
  else {
    unint64_t v71 = &v159[v166];
  }
  if ((uint64_t)v71 >= v166)
  {
    if ((char *)v45 == v71)
    {
      if (v45 < v166) {
        goto LABEL_163;
      }
      goto LABEL_69;
    }
    uint64_t v124 = *(void *)(v3 + 72);
    v172 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v173 = v124;
    uint64_t v182 = v124 * (v45 - 1);
    uint64_t v125 = v45 * v124;
    v164 = v71;
LABEL_120:
    uint64_t v128 = 0;
    id v129 = (void (*)(char *, uint64_t, uint64_t))v166;
    v176 = (void (*)(char *, uint64_t, uint64_t))v45;
    uint64_t v174 = v125;
    while (1)
    {
      uint64_t v130 = *v183;
      uint64_t v180 = v125 + v128;
      uint64_t v131 = v125 + v128 + v130;
      uint64_t v132 = v172;
      v172(v60, v131, v2);
      v132(v61, v182 + v128 + v130, v2);
      sub_2355BC050();
      if (!v133) {
        goto LABEL_128;
      }
      swift_bridgeObjectRelease();
      sub_2355BC050();
      if (!v134)
      {
        uint64_t v126 = *v175;
LABEL_117:
        uint64_t v2 = v184;
        v126(v61, v184);
        uint64_t v60 = v177;
        v126(v177, v2);
LABEL_118:
        unint64_t v127 = v176;
        uint64_t v125 = v174;
LABEL_119:
        uint64_t v45 = (uint64_t)v127 + 1;
        v182 += v173;
        v125 += v173;
        if ((char *)v45 != v164) {
          goto LABEL_120;
        }
        uint64_t v45 = (uint64_t)v164;
        uint64_t v3 = v162;
        uint64_t v28 = v163;
        if ((uint64_t)v164 < v166) {
          goto LABEL_163;
        }
LABEL_69:
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v176 = (void (*)(char *, uint64_t, uint64_t))v45;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v28 = sub_235576AC0(0, *((void *)v28 + 2) + 1, 1, v28);
        }
        unint64_t v74 = *((void *)v28 + 2);
        unint64_t v73 = *((void *)v28 + 3);
        unint64_t v30 = v74 + 1;
        if (v74 >= v73 >> 1) {
          uint64_t v28 = sub_235576AC0((char *)(v73 > 1), v74 + 1, 1, v28);
        }
        *((void *)v28 + 2) = v30;
        unint64_t v75 = v28 + 32;
        uint64_t v76 = &v28[16 * v74 + 32];
        os_log_type_t v77 = v176;
        *(void *)uint64_t v76 = v166;
        *((void *)v76 + 1) = v77;
        if (v74)
        {
LABEL_74:
          unint64_t v78 = v30 - 1;
          if (v30 >= 4)
          {
            uint64_t v83 = &v75[16 * v30];
            uint64_t v84 = *((void *)v83 - 8);
            uint64_t v85 = *((void *)v83 - 7);
            BOOL v89 = __OFSUB__(v85, v84);
            uint64_t v86 = v85 - v84;
            if (v89) {
              goto LABEL_152;
            }
            uint64_t v88 = *((void *)v83 - 6);
            uint64_t v87 = *((void *)v83 - 5);
            BOOL v89 = __OFSUB__(v87, v88);
            uint64_t v81 = v87 - v88;
            char v82 = v89;
            if (v89) {
              goto LABEL_153;
            }
            unint64_t v90 = v30 - 2;
            os_log_type_t v91 = &v75[16 * v30 - 32];
            uint64_t v93 = *(void *)v91;
            uint64_t v92 = *((void *)v91 + 1);
            BOOL v89 = __OFSUB__(v92, v93);
            uint64_t v94 = v92 - v93;
            if (v89) {
              goto LABEL_155;
            }
            BOOL v89 = __OFADD__(v81, v94);
            uint64_t v95 = v81 + v94;
            if (v89) {
              goto LABEL_158;
            }
            if (v95 >= v86)
            {
              v113 = &v75[16 * v78];
              uint64_t v115 = *(void *)v113;
              uint64_t v114 = *((void *)v113 + 1);
              BOOL v89 = __OFSUB__(v114, v115);
              uint64_t v116 = v114 - v115;
              if (v89) {
                goto LABEL_162;
              }
              BOOL v106 = v81 < v116;
            }
            else
            {
LABEL_87:
              if (v82) {
                goto LABEL_154;
              }
              unint64_t v90 = v30 - 2;
              uint64_t v96 = &v75[16 * v30 - 32];
              uint64_t v98 = *(void *)v96;
              uint64_t v97 = *((void *)v96 + 1);
              BOOL v99 = __OFSUB__(v97, v98);
              uint64_t v100 = v97 - v98;
              char v101 = v99;
              if (v99) {
                goto LABEL_157;
              }
              uint64_t v102 = &v75[16 * v78];
              uint64_t v104 = *(void *)v102;
              uint64_t v103 = *((void *)v102 + 1);
              BOOL v89 = __OFSUB__(v103, v104);
              uint64_t v105 = v103 - v104;
              if (v89) {
                goto LABEL_160;
              }
              if (__OFADD__(v100, v105)) {
                goto LABEL_161;
              }
              if (v100 + v105 < v81) {
                goto LABEL_99;
              }
              BOOL v106 = v81 < v105;
            }
            if (v106) {
              unint64_t v78 = v90;
            }
          }
          else
          {
            if (v30 == 3)
            {
              uint64_t v80 = *((void *)v28 + 4);
              uint64_t v79 = *((void *)v28 + 5);
              BOOL v89 = __OFSUB__(v79, v80);
              uint64_t v81 = v79 - v80;
              char v82 = v89;
              goto LABEL_87;
            }
            uint64_t v107 = *((void *)v28 + 4);
            uint64_t v108 = *((void *)v28 + 5);
            BOOL v89 = __OFSUB__(v108, v107);
            uint64_t v100 = v108 - v107;
            char v101 = v89;
LABEL_99:
            if (v101) {
              goto LABEL_156;
            }
            os_log_type_t v109 = &v75[16 * v78];
            uint64_t v111 = *(void *)v109;
            uint64_t v110 = *((void *)v109 + 1);
            BOOL v89 = __OFSUB__(v110, v111);
            uint64_t v112 = v110 - v111;
            if (v89) {
              goto LABEL_159;
            }
            if (v112 < v100) {
              goto LABEL_14;
            }
          }
          unint64_t v117 = v78 - 1;
          if (v78 - 1 >= v30)
          {
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
LABEL_160:
            __break(1u);
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
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
            break;
          }
          if (!*v183) {
            goto LABEL_174;
          }
          id v118 = &v75[16 * v117];
          uint64_t v119 = *(void *)v118;
          uint64_t v120 = &v75[16 * v78];
          uint64_t v121 = *((void *)v120 + 1);
          uint64_t v122 = v170;
          sub_2355763E8(*v183 + *(void *)(v3 + 72) * *(void *)v118, *v183 + *(void *)(v3 + 72) * *(void *)v120, *v183 + *(void *)(v3 + 72) * v121, v167);
          uint64_t v170 = v122;
          if (v122) {
            goto LABEL_147;
          }
          if (v121 < v119) {
            goto LABEL_149;
          }
          if (v78 > *((void *)v28 + 2)) {
            goto LABEL_150;
          }
          *(void *)id v118 = v119;
          *(void *)&v75[16 * v117 + 8] = v121;
          unint64_t v123 = *((void *)v28 + 2);
          if (v78 >= v123) {
            goto LABEL_151;
          }
          unint64_t v30 = v123 - 1;
          memmove(&v75[16 * v78], v120 + 16, 16 * (v123 - 1 - v78));
          *((void *)v28 + 2) = v123 - 1;
          uint64_t v2 = v184;
          if (v123 <= 2) {
            goto LABEL_14;
          }
          goto LABEL_74;
        }
        unint64_t v30 = 1;
LABEL_14:
        uint64_t v22 = v183[1];
        uint64_t v29 = (uint64_t)v176;
        if ((uint64_t)v176 >= v22) {
          goto LABEL_136;
        }
        goto LABEL_15;
      }
      swift_bridgeObjectRelease();
      uint64_t v135 = sub_2355BC080();
      if (v136)
      {
LABEL_128:
        id v144 = *v175;
        uint64_t v145 = v184;
        (*v175)(v61, v184);
        v144(v60, v145);
      }
      else
      {
        uint64_t v137 = v135;
        uint64_t v138 = sub_2355BC080();
        uint64_t v126 = *v175;
        if (v139) {
          goto LABEL_117;
        }
        uint64_t v140 = v138;
        os_log_type_t v141 = v61;
        uint64_t v142 = v184;
        v126(v141, v184);
        uint64_t v143 = v142;
        v61 = v178;
        v126(v60, v143);
        if (v140 >= v137)
        {
          uint64_t v2 = v184;
          goto LABEL_118;
        }
      }
      uint64_t v146 = *v183;
      uint64_t v125 = v174;
      if (!*v183) {
        goto LABEL_173;
      }
      v147 = (char *)(v146 + v182 + v128);
      uint64_t v148 = *v181;
      uint64_t v149 = v184;
      (*v181)(v179, v146 + v174 + v128, v184);
      uint64_t v2 = v149;
      swift_arrayInitWithTakeFrontToBack();
      v148(v147, (uint64_t)v179, v149);
      v128 -= v173;
      id v129 = (void (*)(char *, uint64_t, uint64_t))((char *)v129 + 1);
      unint64_t v127 = v176;
      uint64_t v60 = v177;
      v61 = v178;
      if (v176 == v129) {
        goto LABEL_119;
      }
    }
  }
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  unint64_t result = (char *)sub_2355BD270();
  __break(1u);
  return result;
}

char *sub_235576044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  char v54 = a4;
  uint64_t v42 = a1;
  uint64_t v6 = sub_2355BC0A0();
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v52 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v40 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t result = (char *)&v40 - v12;
  uint64_t v49 = a3;
  uint64_t v41 = a2;
  if (a3 != a2)
  {
    uint64_t v17 = *(void (**)(void))(v13 + 16);
    uint64_t v15 = v13 + 16;
    uint64_t v16 = v17;
    uint64_t v18 = *(void *)(v15 + 56);
    uint64_t v45 = (void (**)(char *, uint64_t))(v15 - 8);
    uint64_t v46 = v15;
    uint64_t v50 = v11;
    uint64_t v51 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v19 = v18 * (v49 - 1);
    uint64_t v47 = v18;
    uint64_t v56 = v18 * v49;
    BOOL v55 = (char *)&v40 - v12;
    char v43 = v17;
LABEL_7:
    uint64_t v23 = 0;
    uint64_t v24 = v42;
    uint64_t v48 = v19;
    while (1)
    {
      uint64_t v25 = *v54;
      uint64_t v53 = v56 + v23;
      v16();
      ((void (*)(char *, uint64_t, uint64_t))v16)(v11, v19 + v23 + v25, v6);
      uint64_t v26 = v55;
      sub_2355BC050();
      if (!v27) {
        goto LABEL_15;
      }
      swift_bridgeObjectRelease();
      sub_2355BC050();
      if (!v28)
      {
        uint64_t v20 = *v45;
LABEL_5:
        uint64_t v21 = v50;
        v20(v50, v6);
        uint64_t v22 = v55;
        v20(v55, v6);
        uint64_t v11 = v21;
        unint64_t result = v22;
        uint64_t v19 = v48;
LABEL_6:
        v19 += v47;
        v56 += v47;
        if (++v49 == v41) {
          return result;
        }
        goto LABEL_7;
      }
      swift_bridgeObjectRelease();
      uint64_t v29 = sub_2355BC080();
      if (v30)
      {
LABEL_15:
        uint64_t v36 = *v45;
        (*v45)(v11, v6);
        unint64_t result = (char *)((uint64_t (*)(char *, uint64_t))v36)(v26, v6);
        uint64_t v19 = v48;
      }
      else
      {
        uint64_t v44 = v19 + v23;
        uint64_t v31 = v29;
        uint64_t v32 = sub_2355BC080();
        uint64_t v20 = *v45;
        if (v33) {
          goto LABEL_5;
        }
        uint64_t v34 = v32;
        uint64_t v35 = v50;
        v20(v50, v6);
        v20(v26, v6);
        uint64_t v11 = v35;
        unint64_t result = v26;
        uint64_t v19 = v48;
        uint64_t v16 = v43;
        if (v34 >= v31) {
          goto LABEL_6;
        }
      }
      uint64_t v37 = *v54;
      if (!*v54) {
        break;
      }
      uint64_t v38 = (char *)(v37 + v19 + v23);
      uint64_t v39 = *v51;
      (*v51)(v52, v37 + v56 + v23, v6);
      swift_arrayInitWithTakeFrontToBack();
      v39(v38, (uint64_t)v52, v6);
      v23 -= v47;
      ++v24;
      uint64_t v11 = v50;
      unint64_t result = v55;
      if (v49 == v24) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2355763E8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  unint64_t v78 = a3;
  uint64_t v9 = sub_2355BC0A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v76 = (char *)v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v70 - v15;
  MEMORY[0x270FA5388](v14);
  unint64_t v75 = (char *)v70 - v18;
  uint64_t v77 = *(void *)(v19 + 72);
  if (!v77)
  {
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  if (a2 - a1 == 0x8000000000000000 && v77 == -1) {
    goto LABEL_85;
  }
  int64_t v20 = v78 - a2;
  if (v78 - a2 == 0x8000000000000000 && v77 == -1) {
    goto LABEL_86;
  }
  uint64_t v21 = (uint64_t)(a2 - a1) / v77;
  unint64_t v81 = a1;
  unint64_t v80 = a4;
  uint64_t v22 = v20 / v77;
  v70[1] = v5;
  if (v21 >= v20 / v77)
  {
    if (v22 < 0) {
      goto LABEL_87;
    }
    unint64_t v75 = v17;
    uint64_t v24 = v22 * v77;
    if (a4 < a2 || a2 + v24 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v44 = a4 + v24;
    unint64_t v79 = a4 + v24;
    unint64_t v81 = a2;
    if (v24 < 1 || a1 >= a2)
    {
LABEL_83:
      sub_235576BBC(&v81, &v80, (uint64_t *)&v79);
      return 1;
    }
    uint64_t v46 = -v77;
    uint64_t v48 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
    uint64_t v47 = v10 + 16;
    unint64_t v73 = (void (*)(char *, unint64_t, uint64_t))(v47 - 8);
    unint64_t v74 = v48;
    uint64_t v77 = v47;
    unint64_t v71 = a1;
    unint64_t v72 = a4;
    uint64_t v49 = (void (**)(char *, uint64_t))(v47 - 8);
    while (1)
    {
      uint64_t v50 = v74;
      v74(v75, v44 + v46, v9);
      unint64_t v51 = a2 + v46;
      v50(v76, a2 + v46, v9);
      sub_2355BC050();
      if (v52)
      {
        swift_bridgeObjectRelease();
        sub_2355BC050();
        unint64_t v53 = v78;
        if (!v54) {
          goto LABEL_62;
        }
        swift_bridgeObjectRelease();
        uint64_t v55 = sub_2355BC080();
        if (v56)
        {
          BOOL v60 = 1;
          goto LABEL_64;
        }
        uint64_t v57 = v55;
        uint64_t v58 = sub_2355BC080();
        if (v59) {
LABEL_62:
        }
          BOOL v60 = 0;
        else {
          BOOL v60 = v58 < v57;
        }
      }
      else
      {
        BOOL v60 = 1;
        unint64_t v53 = v78;
      }
LABEL_64:
      unint64_t v61 = v53 + v46;
      unint64_t v62 = v53;
      uint64_t v63 = *v49;
      (*v49)(v76, v9);
      v63(v75, v9);
      if (v60)
      {
        unint64_t v64 = v72;
        if (v62 < a2 || v61 >= a2)
        {
          swift_arrayInitWithTakeFrontToBack();
          unint64_t v66 = v71;
        }
        else
        {
          BOOL v65 = v62 == a2;
          unint64_t v66 = v71;
          if (!v65) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v81 += v46;
      }
      else
      {
        unint64_t v67 = v79;
        v79 += v46;
        BOOL v68 = v62 < v67 || v61 >= v67;
        unint64_t v64 = v72;
        if (v68)
        {
          swift_arrayInitWithTakeFrontToBack();
          unint64_t v51 = a2;
        }
        else
        {
          if (v62 != v67) {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v51 = a2;
        }
        unint64_t v66 = v71;
      }
      unint64_t v44 = v79;
      if (v79 > v64)
      {
        a2 = v51;
        unint64_t v78 = v61;
        if (v51 > v66) {
          continue;
        }
      }
      goto LABEL_83;
    }
  }
  if ((v21 & 0x8000000000000000) == 0)
  {
    uint64_t v23 = v21 * v77;
    uint64_t v76 = v16;
    if (a4 < a1 || a1 + v23 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v74 = (void (*)(char *, unint64_t, uint64_t))(a4 + v23);
    unint64_t v79 = a4 + v23;
    if (v23 >= 1 && a2 < v78)
    {
      unint64_t v73 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
      uint64_t v26 = (void (**)(char *, uint64_t))(v10 + 8);
      uint64_t v27 = v75;
      while (1)
      {
        uint64_t v28 = v73;
        v73(v27, a2, v9);
        uint64_t v29 = v76;
        v28(v76, a4, v9);
        sub_2355BC050();
        if (!v30) {
          goto LABEL_29;
        }
        swift_bridgeObjectRelease();
        sub_2355BC050();
        if (!v31)
        {
          uint64_t v36 = *v26;
LABEL_39:
          v36(v76, v9);
          v36(v27, v9);
LABEL_40:
          unint64_t v40 = v81;
          unint64_t v43 = v80 + v77;
          if (v81 < v80 || v81 >= v43)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v81 != v80)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v80 = v43;
          unint64_t v41 = a2;
          goto LABEL_47;
        }
        swift_bridgeObjectRelease();
        uint64_t v29 = v76;
        uint64_t v32 = sub_2355BC080();
        if (v33)
        {
LABEL_29:
          uint64_t v39 = *v26;
          (*v26)(v29, v9);
          v39(v27, v9);
        }
        else
        {
          uint64_t v34 = v32;
          uint64_t v35 = sub_2355BC080();
          uint64_t v36 = *v26;
          if (v37) {
            goto LABEL_39;
          }
          uint64_t v38 = v35;
          v36(v76, v9);
          v36(v27, v9);
          if (v38 >= v34) {
            goto LABEL_40;
          }
        }
        unint64_t v40 = v81;
        unint64_t v41 = a2 + v77;
        if (v81 < a2 || v81 >= v41)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v81 == a2)
        {
          unint64_t v40 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_47:
        unint64_t v81 = v40 + v77;
        a4 = v80;
        if (v80 < (unint64_t)v74)
        {
          a2 = v41;
          if (v41 < v78) {
            continue;
          }
        }
        goto LABEL_83;
      }
    }
    goto LABEL_83;
  }
LABEL_87:
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

char *sub_235576AC0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1E8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

uint64_t sub_235576BBC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_2355BC0A0();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_2355BD2B0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_235576CFC(uint64_t a1)
{
  return sub_235576AC0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235576D10()
{
  uint64_t v0 = sub_2355BD110();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2355BCC10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355BCC00();
  sub_2355BD100();
  uint64_t v8 = MEMORY[0x237DE25F0](0xD000000000000029, 0x80000002355BED70, v7, v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  qword_26880C1F0 = v8;
  return result;
}

id INUpdateMediaAffinityIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id INUpdateMediaAffinityIntentHandler.init()()
{
  uint64_t v0 = sub_2355BC5D0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v12 - v5;
  sub_2355BC7C0();
  sub_2355BC7B0();
  sub_2355BC5C0();
  sub_2355BC900();
  swift_allocObject();
  uint64_t v7 = sub_2355BC8F0();
  sub_2355BCAE0();
  uint64_t v8 = sub_2355BCAD0();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  uint64_t v9 = swift_retain();
  id v10 = sub_23557C000(v9, (uint64_t)v4, v7, v8);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

uint64_t INUpdateMediaAffinityIntentHandler.resolveMediaItems(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_2355BCB80();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = sub_2355BCB60();
  os_log_type_t v14 = sub_2355BCF80();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_23556D000, v13, v14, "INUpdateMediaAffinityIntentHandler#resolveMediaItems...", v15, 2u);
    MEMORY[0x237DE3BF0](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  id v16 = objc_msgSend(a1, sel_mediaSearch);
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = objc_msgSend(v16, sel_mediaType);
  }
  else
  {
    id v18 = 0;
  }
  __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider), *(void *)(v4 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider + 24));
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = a3;
  *(void *)(v19 + 32) = a1;
  *(void *)(v19 + 40) = v18;
  *(unsigned char *)(v19 + 48) = v17 == 0;
  swift_retain();
  id v20 = a1;
  sub_2355BC6B0();
  return swift_release();
}

uint64_t sub_23557748C(NSObject *a1, void (*a2)(NSObject *), uint64_t a3, uint64_t a4, uint8_t *a5, int a6)
{
  int v162 = a6;
  v163 = a5;
  uint64_t v158 = a4;
  uint64_t v168 = a3;
  os_log_t v169 = a1;
  v172 = a2;
  uint64_t v6 = sub_2355BC320();
  unint64_t v167 = *(char **)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v164 = (char *)&v155 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  os_log_type_t v155 = (char *)&v155 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v161 = (char *)&v155 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v156 = (char *)&v155 - v14;
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v155 - v15;
  uint64_t v173 = sub_2355BCB80();
  uint64_t v171 = *(void *)(v173 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v173);
  uint64_t v165 = (char *)&v155 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v166 = (uint8_t *)&v155 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v157 = (char *)&v155 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v159 = (char *)&v155 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v155 - v25;
  uint64_t v27 = sub_2355BC690();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v160 = (char *)&v155 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v170 = (char *)&v155 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v155 - v34;
  MEMORY[0x270FA5388](v33);
  char v37 = (char *)&v155 - v36;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C320);
  MEMORY[0x270FA5388](v38);
  unint64_t v40 = (char *)&v155 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23557DFE4((uint64_t)v169, (uint64_t)v40, (uint64_t *)&unk_26880C320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v166 = (uint8_t *)v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v37, v40, v27);
    unint64_t v41 = v27;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v42 = v173;
    uint64_t v43 = __swift_project_value_buffer(v173, (uint64_t)qword_26880D108);
    uint64_t v44 = v171;
    (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v26, v43, v42);
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
    unint64_t v167 = v37;
    v45(v35, v37, v27);
    uint64_t v46 = sub_2355BCB60();
    os_log_type_t v47 = sub_2355BCF70();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      os_log_t v169 = v41;
      uint64_t v50 = v49;
      v176 = v49;
      *(_DWORD *)uint64_t v48 = 136446210;
      uint64_t v165 = (char *)(v48 + 4);
      sub_23557E048((unint64_t *)&unk_26880C340, MEMORY[0x263F6CBB0]);
      uint64_t v51 = sub_2355BD320();
      uint64_t v174 = sub_2355745F0(v51, v52, (uint64_t *)&v176);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      unint64_t v53 = *(void (**)(char *, os_log_t))(v28 + 8);
      v53(v35, v169);
      _os_log_impl(&dword_23556D000, v46, v47, "INUpdateMediaAffinityIntentHandler#resolveMediaItems resolveNowPlayingMediaItem nowPlaying item error: %{public}s", v48, 0xCu);
      swift_arrayDestroy();
      uint64_t v54 = v50;
      unint64_t v41 = v169;
      MEMORY[0x237DE3BF0](v54, -1, -1);
      MEMORY[0x237DE3BF0](v48, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v26, v173);
    }
    else
    {
      unint64_t v53 = *(void (**)(char *, os_log_t))(v28 + 8);
      v53(v35, v41);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v26, v42);
    }
    uint64_t v70 = *(void (**)(char *, void, NSObject *))(v28 + 104);
    v70(v170, *MEMORY[0x263F6CBA8], v41);
    sub_23557E048(&qword_26880C338, MEMORY[0x263F6CBB0]);
    unint64_t v71 = v167;
    sub_2355BCD70();
    sub_2355BCD70();
    if (v176 == v174 && v177 == v175)
    {
      swift_bridgeObjectRelease_n();
      v53(v170, v41);
LABEL_18:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v73 = swift_allocObject();
      *(_OWORD *)(v73 + 16) = xmmword_2355BDD80;
      sub_23557DC00(0, &qword_26880C2C0);
      *(void *)(v73 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      v176 = v73;
      sub_2355BCDD0();
      v172(v176);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, NSObject *))v53)(v71, v41);
    }
    char v72 = sub_2355BD2F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v53(v170, v41);
    if (v72) {
      goto LABEL_18;
    }
    BOOL v89 = v160;
    v70(v160, *MEMORY[0x263F6CBA0], v41);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v176 == v174 && v177 == v175)
    {
      swift_bridgeObjectRelease_n();
      v53(v89, v41);
      unint64_t v90 = v172;
    }
    else
    {
      char v119 = sub_2355BD2F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v53(v89, v41);
      unint64_t v90 = v172;
      if ((v119 & 1) == 0) {
        return ((uint64_t (*)(char *, NSObject *))v53)(v71, v41);
      }
    }
    sub_2355BD170();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v120 = swift_allocObject();
    *(_OWORD *)(v120 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, &qword_26880C2C0);
    *(void *)(v120 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v176 = v120;
    sub_2355BCDD0();
    v90(v176);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, NSObject *))v53)(v71, v41);
  }
  uint64_t v55 = v172;
  char v56 = v167;
  (*((void (**)(char *, char *, uint64_t))v167 + 4))(v16, v40, v6);
  uint64_t v57 = (char *)v6;
  uint64_t v58 = v164;
  char v59 = v166;
  char v60 = v162;
  if (v162) {
    goto LABEL_11;
  }
  if (v163 == (uint8_t *)2)
  {
    uint64_t v91 = sub_2355BC300();
    if (v92)
    {
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v136 = v173;
      uint64_t v137 = __swift_project_value_buffer(v173, (uint64_t)qword_26880D108);
      uint64_t v138 = v171;
      (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v157, v137, v136);
      char v139 = (void (*)(char *, char *, char *))*((void *)v56 + 2);
      uint64_t v140 = v155;
      v139(v155, v16, v57);
      os_log_type_t v141 = sub_2355BCB60();
      os_log_type_t v142 = sub_2355BCF70();
      os_log_t v169 = v141;
      if (os_log_type_enabled(v141, v142))
      {
        uint64_t v143 = (uint8_t *)swift_slowAlloc();
        uint64_t v144 = swift_slowAlloc();
        uint64_t v170 = v16;
        uint64_t v145 = v144;
        v176 = v144;
        uint64_t v166 = v143;
        *(_DWORD *)uint64_t v143 = 136315138;
        uint64_t v165 = (char *)(v143 + 4);
        v139(v161, v140, v57);
        uint64_t v146 = sub_2355BCC60();
        uint64_t v174 = sub_2355745F0(v146, v147, (uint64_t *)&v176);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        uint64_t v148 = (void (*)(char *, char *))*((void *)v56 + 1);
        v148(v140, v57);
        os_log_t v149 = v169;
        os_log_type_t v150 = v142;
        uint64_t v151 = v166;
        _os_log_impl(&dword_23556D000, v169, v150, "INUpdateMediaAffinityIntentHandler#resolveMediaItems missing albumId from nowPlayingInfo: %s", v166, 0xCu);
        swift_arrayDestroy();
        uint64_t v152 = v145;
        uint64_t v55 = v172;
        id v16 = v170;
        MEMORY[0x237DE3BF0](v152, -1, -1);
        MEMORY[0x237DE3BF0](v151, -1, -1);
      }
      else
      {
        uint64_t v148 = (void (*)(char *, char *))*((void *)v56 + 1);
        v148(v140, v57);
      }
      (*(void (**)(char *, uint64_t))(v138 + 8))(v157, v173);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v154 = swift_allocObject();
      *(_OWORD *)(v154 + 16) = xmmword_2355BDD80;
      sub_23557DC00(0, &qword_26880C2C0);
      *(void *)(v154 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      v176 = v154;
      sub_2355BCDD0();
      v55(v176);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, char *))v148)(v16, v57);
    }
    uint64_t v65 = v91;
    char v66 = v60;
    uint64_t v170 = v57;
    sub_2355BC2D0();
LABEL_28:
    uint64_t v93 = v67;
    v176 = v65;
    sub_2355BD2E0();
    if (v66) {
      uint64_t v94 = 1;
    }
    else {
      uint64_t v94 = (uint64_t)v163;
    }
    sub_2355BC2B0();
    uint64_t v96 = v95;
    uint64_t v97 = (void *)sub_2355BCC40();
    swift_bridgeObjectRelease();
    if (v93)
    {
      uint64_t v98 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
      if (v96)
      {
LABEL_33:
        BOOL v99 = (void *)sub_2355BCC40();
        swift_bridgeObjectRelease();
LABEL_36:
        uint64_t v100 = v173;
        id v101 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FC40]), sel_initWithIdentifier_title_type_artwork_artist_, v97, v98, v94, 0, v99);

        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v102 = __swift_project_value_buffer(v100, (uint64_t)qword_26880D108);
        (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v165, v102, v100);
        uint64_t v103 = v101;
        uint64_t v104 = sub_2355BCB60();
        os_log_type_t v105 = sub_2355BCF80();
        if (os_log_type_enabled(v104, v105))
        {
          BOOL v106 = (uint8_t *)swift_slowAlloc();
          uint64_t v107 = (void *)swift_slowAlloc();
          *(_DWORD *)BOOL v106 = 138412290;
          v176 = v103;
          uint64_t v108 = v16;
          os_log_type_t v109 = v103;
          sub_2355BD1B0();
          *uint64_t v107 = v103;

          id v16 = v108;
          _os_log_impl(&dword_23556D000, v104, v105, "INUpdateMediaAffinityIntentHandler#resolveMediaItems resolved mediaItem: %@", v106, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
          swift_arrayDestroy();
          uint64_t v110 = v107;
          uint64_t v100 = v173;
          MEMORY[0x237DE3BF0](v110, -1, -1);
          MEMORY[0x237DE3BF0](v106, -1, -1);
        }
        else
        {

          uint64_t v104 = v103;
        }
        uint64_t v111 = v167;

        (*(void (**)(char *, uint64_t))(v171 + 8))(v165, v100);
        uint64_t v112 = self;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v113 = swift_allocObject();
        *(_OWORD *)(v113 + 16) = xmmword_2355BDD80;
        *(void *)(v113 + 32) = v103;
        v176 = v113;
        sub_2355BCDD0();
        sub_23557DC00(0, (unint64_t *)&qword_26880C210);
        uint64_t v114 = v103;
        uint64_t v115 = (void *)sub_2355BCD90();
        swift_bridgeObjectRelease();
        id v116 = objc_msgSend(v112, sel_successesWithResolvedMediaItems_, v115);

        sub_23557DC00(0, &qword_26880C2C0);
        uint64_t v117 = sub_2355BCDB0();

        v172(v117);
        swift_bridgeObjectRelease();
        return (*((uint64_t (**)(char *, char *))v111 + 1))(v16, v170);
      }
    }
    else
    {
      uint64_t v98 = 0;
      if (v96) {
        goto LABEL_33;
      }
    }
    BOOL v99 = 0;
    goto LABEL_36;
  }
  if (v163 != (uint8_t *)3)
  {
LABEL_11:
    uint64_t v68 = sub_2355BC2F0();
    if (v69)
    {
      uint64_t v170 = v16;
      unint64_t v75 = v57;
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v76 = v173;
      uint64_t v77 = __swift_project_value_buffer(v173, (uint64_t)qword_26880D108);
      uint64_t v78 = v171;
      (*(void (**)(uint8_t *, uint64_t, uint64_t))(v171 + 16))(v59, v77, v76);
      unint64_t v79 = (void (*)(char *, char *, char *))*((void *)v56 + 2);
      v79(v58, v170, v75);
      unint64_t v80 = v59;
      unint64_t v81 = sub_2355BCB60();
      os_log_type_t v82 = sub_2355BCF70();
      os_log_t v169 = v81;
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = (uint8_t *)swift_slowAlloc();
        uint64_t v165 = (char *)swift_slowAlloc();
        v176 = v165;
        *(_DWORD *)uint64_t v83 = 136315138;
        v163 = v83 + 4;
        v79(v161, v58, v75);
        uint64_t v84 = sub_2355BCC60();
        uint64_t v174 = sub_2355745F0(v84, v85, (uint64_t *)&v176);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        uint64_t v86 = (void (*)(char *, char *))*((void *)v56 + 1);
        v86(v58, v75);
        os_log_t v87 = v169;
        _os_log_impl(&dword_23556D000, v169, v82, "INUpdateMediaAffinityIntentHandler#resolveMediaItems missing songId from nowPlayingInfo: %s", v83, 0xCu);
        uint64_t v88 = v165;
        swift_arrayDestroy();
        uint64_t v55 = v172;
        MEMORY[0x237DE3BF0](v88, -1, -1);
        MEMORY[0x237DE3BF0](v83, -1, -1);

        (*(void (**)(uint8_t *, uint64_t))(v78 + 8))(v166, v173);
      }
      else
      {
        uint64_t v86 = (void (*)(char *, char *))*((void *)v56 + 1);
        v86(v58, v75);

        (*(void (**)(uint8_t *, uint64_t))(v78 + 8))(v80, v173);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v118 = swift_allocObject();
      *(_OWORD *)(v118 + 16) = xmmword_2355BDD80;
      sub_23557DC00(0, &qword_26880C2C0);
      *(void *)(v118 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      v176 = v118;
      sub_2355BCDD0();
      v55(v176);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, char *))v86)(v170, v75);
    }
    uint64_t v65 = v68;
    char v66 = v60;
    uint64_t v170 = v57;
    sub_2355BC2E0();
    goto LABEL_28;
  }
  uint64_t v61 = sub_2355BC310();
  unint64_t v62 = v159;
  uint64_t v63 = v156;
  if ((v64 & 1) == 0)
  {
    uint64_t v65 = v61;
    char v66 = v60;
    uint64_t v170 = v57;
    sub_2355BC2B0();
    goto LABEL_28;
  }
  uint64_t v170 = v16;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v121 = v173;
  uint64_t v122 = __swift_project_value_buffer(v173, (uint64_t)qword_26880D108);
  uint64_t v123 = v171;
  (*(void (**)(char *, uint64_t, uint64_t))(v171 + 16))(v62, v122, v121);
  uint64_t v124 = v56;
  uint64_t v125 = (void (*)(char *, char *, char *))*((void *)v56 + 2);
  v125(v63, v170, v57);
  uint64_t v126 = sub_2355BCB60();
  os_log_type_t v127 = sub_2355BCF70();
  uint64_t v128 = v63;
  int v129 = v127;
  os_log_t v169 = v126;
  if (os_log_type_enabled(v126, v127))
  {
    uint64_t v130 = (uint8_t *)swift_slowAlloc();
    uint64_t v131 = swift_slowAlloc();
    v176 = v131;
    LODWORD(v166) = v129;
    *(_DWORD *)uint64_t v130 = 136315138;
    uint64_t v165 = (char *)(v130 + 4);
    v125(v161, v128, v57);
    uint64_t v132 = sub_2355BCC60();
    uint64_t v174 = sub_2355745F0(v132, v133, (uint64_t *)&v176);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    uint64_t v134 = (void (*)(char *, char *))*((void *)v124 + 1);
    v134(v128, v57);
    os_log_t v135 = v169;
    _os_log_impl(&dword_23556D000, v169, (os_log_type_t)v166, "INUpdateMediaAffinityIntentHandler#resolveMediaItems missing artistId from nowPlayingInfo: %s", v130, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v131, -1, -1);
    MEMORY[0x237DE3BF0](v130, -1, -1);

    (*(void (**)(char *, uint64_t))(v123 + 8))(v159, v173);
  }
  else
  {
    uint64_t v134 = (void (*)(char *, char *))*((void *)v124 + 1);
    v134(v128, v57);

    (*(void (**)(char *, uint64_t))(v123 + 8))(v62, v121);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v153 = swift_allocObject();
  *(_OWORD *)(v153 + 16) = xmmword_2355BDD80;
  sub_23557DC00(0, &qword_26880C2C0);
  *(void *)(v153 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
  v176 = v153;
  sub_2355BCDD0();
  v172(v176);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, char *))v134)(v170, v57);
}

void sub_235578B00(uint64_t a1, uint64_t a2)
{
  sub_23557DC00(0, &qword_26880C2C0);
  id v3 = (id)sub_2355BCD90();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

void INUpdateMediaAffinityIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(id), uint64_t a3)
{
  uint64_t v129 = a3;
  uint64_t v130 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C200);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v115 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C520);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)sub_2355BCB80();
  uint64_t v11 = (void (*)(void))*(v10 - 1);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v125 = (char *)&v115 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v123 = (char *)&v115 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v121 = (char *)&v115 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  char v119 = (char *)&v115 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v115 - v20;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer((uint64_t)v10, (uint64_t)qword_26880D108);
  uint64_t v23 = (uint8_t *)*((void *)v11 + 2);
  uint64_t v126 = (uint8_t *)v22;
  os_log_type_t v127 = v23;
  uint64_t v128 = (uint64_t)v11 + 16;
  ((void (*)(char *))v23)(v21);
  id v24 = a1;
  uint64_t v25 = sub_2355BCB60();
  os_log_type_t v26 = sub_2355BCF80();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v118 = v9;
  if (v27)
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v120 = v10;
    uint64_t v30 = v29;
    v131[0] = v29;
    uint64_t v122 = v6;
    *(_DWORD *)uint64_t v28 = 136315138;
    uint64_t v124 = v11;
    v132[0] = objc_msgSend(v24, sel_affinityType);
    type metadata accessor for INMediaAffinityType(0);
    uint64_t v31 = sub_2355BCC60();
    v132[0] = (id)sub_2355745F0(v31, v32, v131);
    uint64_t v33 = v130;
    uint64_t v11 = v124;
    uint64_t v6 = v122;
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v25, v26, "INUpdateMediaAffinityIntentHandler#handle affinityType: %s", v28, 0xCu);
    swift_arrayDestroy();
    uint64_t v34 = v30;
    uint64_t v10 = v120;
    MEMORY[0x237DE3BF0](v34, -1, -1);
    MEMORY[0x237DE3BF0](v28, -1, -1);

    uint64_t v35 = (void (*)(char *, void *))*((void *)v11 + 1);
    v35(v21, v10);
  }
  else
  {

    uint64_t v35 = (void (*)(char *, void *))*((void *)v11 + 1);
    v35(v21, v10);
    uint64_t v33 = v130;
  }
  id v36 = objc_msgSend(v24, sel_mediaSearch);
  char v37 = v36;
  if (v36)
  {
    id v38 = objc_msgSend(v36, sel_mediaType);
  }
  else
  {
    id v38 = 0;
  }
  uint64_t v39 = (char *)objc_msgSend(v24, sel_affinityType);
  if ((unint64_t)(v39 - 1) > 1)
  {
    uint64_t v50 = v125;
    ((void (*)(char *, uint8_t *, void *))v127)(v125, v126, v10);
    uint64_t v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF70();
    if (os_log_type_enabled(v51, v52))
    {
      unint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v53 = 134217984;
      v131[0] = (uint64_t)v39;
      sub_2355BD1B0();
      _os_log_impl(&dword_23556D000, v51, v52, "INUpdateMediaAffinityIntentHandler#handle unknown affinityType: %ld)", v53, 0xCu);
      uint64_t v54 = v53;
      uint64_t v50 = v125;
      MEMORY[0x237DE3BF0](v54, -1, -1);
    }

    v35(v50, v10);
    id v55 = objc_allocWithZone(MEMORY[0x263F08D38]);
    char v56 = (void *)sub_2355BCC40();
    id v57 = objc_msgSend(v55, sel_initWithActivityType_, v56);

    goto LABEL_57;
  }
  id v116 = v24;
  id v40 = objc_msgSend(v24, sel_mediaItems);
  if (!v40)
  {
LABEL_54:
    uint64_t v110 = v123;
    ((void (*)(char *, uint8_t *, void *))v127)(v123, v126, v10);
    uint64_t v111 = sub_2355BCB60();
    os_log_type_t v112 = sub_2355BCF70();
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v113 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v113 = 0;
      _os_log_impl(&dword_23556D000, v111, v112, "INUpdateMediaAffinityIntentHandler#handle missing mediaItem", v113, 2u);
      MEMORY[0x237DE3BF0](v113, -1, -1);
    }

    v35(v110, v10);
    uint64_t v114 = sub_2355BC690();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56))(v6, 1, 1, v114);
    id v57 = sub_23557C1C0((uint64_t)v39, (uint64_t)v6);
    sub_23557DE84((uint64_t)v6, (uint64_t *)&unk_26880C200);
LABEL_57:
    id v104 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F100A8]), sel_initWithCode_userActivity_, 4, v57);

    v33(v104);
    goto LABEL_58;
  }
  unint64_t v41 = v40;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v42 = sub_2355BCDB0();

  if (!(v42 >> 62))
  {
    id v43 = *(id *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v43) {
      goto LABEL_13;
    }
    goto LABEL_53;
  }
  swift_bridgeObjectRetain();
  id v43 = (id)sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v43)
  {
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
LABEL_13:
  uint64_t v124 = v11;
  uint64_t v122 = v6;
  if ((v42 & 0xC000000000000001) != 0)
  {
    uint64_t v44 = (char *)MEMORY[0x237DE35A0](0, v42);
  }
  else
  {
    if (!*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_61;
    }
    uint64_t v44 = (char *)*(id *)(v42 + 32);
  }
  uint64_t v125 = v44;
  id v115 = v38;
  swift_bridgeObjectRelease();
  id v45 = objc_msgSend(v125, sel_identifier);
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = sub_2355BCC50();
    unint64_t v49 = v48;
  }
  else
  {
    uint64_t v47 = 0;
    unint64_t v49 = 0xE000000000000000;
  }
  uint64_t v58 = v121;
  sub_235579A98(v47, v49);
  if ((v59 & 1) == 0)
  {
    uint64_t v123 = v39;
    char v60 = v10;
    sub_2355BC4D0();
    swift_allocObject();
    sub_2355BC4C0();
    id v61 = v125;
    objc_msgSend(v125, sel_type);
    id v62 = objc_msgSend(v61, sel_artist);
    if (v62)
    {
      uint64_t v63 = v62;
      sub_2355BCC50();
    }
    unint64_t v74 = (void *)sub_2355BC4B0();
    swift_release();
    swift_bridgeObjectRelease();
    unint64_t v75 = v119;
    uint64_t v76 = v60;
    ((void (*)(char *, uint8_t *, void *))v127)(v119, v126, v60);
    id v77 = v74;
    uint64_t v78 = sub_2355BCB60();
    os_log_type_t v79 = sub_2355BCF50();
    if (os_log_type_enabled(v78, v79))
    {
      unint64_t v80 = (uint8_t *)swift_slowAlloc();
      uint64_t v128 = swift_slowAlloc();
      v131[0] = v128;
      os_log_type_t v127 = v80;
      *(_DWORD *)unint64_t v80 = 136315138;
      uint64_t v126 = v80 + 4;
      id v81 = v77;
      uint64_t v120 = v76;
      id v82 = v81;
      id v83 = objc_msgSend(v81, sel_description);
      uint64_t v84 = sub_2355BCC50();
      unint64_t v86 = v85;

      v132[0] = (id)sub_2355745F0(v84, v86, v131);
      sub_2355BD1B0();

      swift_bridgeObjectRelease();
      os_log_t v87 = v127;
      _os_log_impl(&dword_23556D000, v78, v79, "INUpdateMediaAffinityIntentHandler#handle model object is %s", v127, 0xCu);
      uint64_t v88 = v128;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v88, -1, -1);
      MEMORY[0x237DE3BF0](v87, -1, -1);

      BOOL v89 = v119;
      unint64_t v90 = v120;
    }
    else
    {

      BOOL v89 = v75;
      unint64_t v90 = v60;
    }
    v35(v89, v90);
    uint64_t v91 = (void (*)(void))v130;
    uint64_t v10 = v117;
    id v92 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v93 = v123;
    uint64_t v94 = (void *)sub_2355BCC40();
    id v43 = objc_msgSend(v92, sel_initWithActivityType_, v94);

    __swift_project_boxed_opaque_existential_1((void *)((char *)v10+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider), *(void *)((char *)v10+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider+ 24));
    uint64_t v33 = (void (*)(id))v77;
    sub_2355BC910();
    if (v37) {
      BOOL v95 = v93 == (char *)2;
    }
    else {
      BOOL v95 = 0;
    }
    BOOL v96 = v95 && v115 == (id)1;
    LODWORD(v6) = v96;
    if (!v96)
    {
      if (v93 == (char *)1)
      {
        uint64_t v98 = 3;
LABEL_48:
        sub_23557A200(v33, v98, (int)v6);
        uint64_t v99 = (uint64_t)v118;
        sub_2355BCE40();
        uint64_t v100 = sub_2355BCE60();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v99, 0, 1, v100);
        id v101 = (void *)swift_allocObject();
        v101[2] = 0;
        v101[3] = 0;
        uint64_t v102 = v116;
        v101[4] = v116;
        id v103 = v102;
        sub_235579FC8(v99, (uint64_t)&unk_26880C230, (uint64_t)v101);
        swift_release();
        id v104 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F100A8]), sel_initWithCode_userActivity_, 3, v43);
        v91();

        goto LABEL_58;
      }
LABEL_47:
      uint64_t v98 = 1;
      goto LABEL_48;
    }
    uint64_t v11 = v91;
    __swift_project_boxed_opaque_existential_1((void *)((char *)v10+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider), *(void *)((char *)v10+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider+ 24));
    if (qword_26880C0E8 == -1)
    {
LABEL_44:
      *(void *)(swift_allocObject() + 16) = v10;
      uint64_t v97 = v10;
      sub_2355BC820();
      swift_release();
      uint64_t v91 = v11;
      goto LABEL_47;
    }
LABEL_61:
    swift_once();
    goto LABEL_44;
  }
  ((void (*)(char *, uint8_t *, void *))v127)(v58, v126, v10);
  char v64 = v125;
  uint64_t v65 = sub_2355BCB60();
  os_log_type_t v66 = sub_2355BCF70();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v123 = v39;
    uint64_t v120 = v10;
    uint64_t v67 = (uint8_t *)swift_slowAlloc();
    id v68 = (id)swift_slowAlloc();
    v132[0] = v68;
    *(_DWORD *)uint64_t v67 = 136315138;
    id v69 = objc_msgSend(v64, sel_identifier);
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = sub_2355BCC50();
      uint64_t v73 = v72;
    }
    else
    {
      uint64_t v71 = 0;
      uint64_t v73 = 0;
    }
    v131[0] = v71;
    v131[1] = v73;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
    uint64_t v105 = sub_2355BCC60();
    v131[0] = sub_2355745F0(v105, v106, (uint64_t *)v132);
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v65, v66, "INUpdateMediaAffinityIntentHandler#handle failed to convert identifier: %s into Int64 entityId", v67, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v68, -1, -1);
    MEMORY[0x237DE3BF0](v67, -1, -1);

    v35(v121, v120);
    uint64_t v33 = v130;
    uint64_t v39 = v123;
  }
  else
  {

    v35(v58, v10);
  }
  uint64_t v107 = sub_2355BC690();
  uint64_t v108 = (uint64_t)v122;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v107 - 8) + 56))(v122, 1, 1, v107);
  id v109 = sub_23557C1C0((uint64_t)v39, v108);
  sub_23557DE84(v108, (uint64_t *)&unk_26880C200);
  id v104 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F100A8]), sel_initWithCode_userActivity_, 4, v109);

  v33(v104);
LABEL_58:
}

uint64_t sub_235579A98(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_2355BD260();
      }
      uint64_t v7 = (uint64_t)sub_23557B898(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_23557B7B0(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_235579CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 96) = a4;
  return MEMORY[0x270FA2498](sub_235579D08, 0, 0);
}

uint64_t sub_235579D08()
{
  sub_2355BBFC0();
  if (sub_2355BBFB0())
  {
    sub_2355BBFA0();
    swift_release();
    uint64_t v1 = sub_2355BCAA0();
    uint64_t v3 = v2;
    swift_release();
  }
  else
  {
    uint64_t v1 = 0;
    uint64_t v3 = 0;
  }
  v0[13] = v3;
  sub_2355BC980();
  sub_2355BC970();
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[11];
  uint64_t v6 = __swift_project_boxed_opaque_existential_1(v0 + 7, v4);
  v0[5] = v4;
  uint64_t v7 = *(void *)(v5 + 16);
  v0[6] = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_1, v6, v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  unsigned int v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_26880C3E8
                                                                                     + dword_26880C3E8);
  char v9 = (void *)swift_task_alloc();
  v0[14] = (uint64_t)v9;
  void *v9 = v0;
  v9[1] = sub_235579EAC;
  uint64_t v10 = v0[12];
  return v12(v10, v1, v3, (uint64_t)boxed_opaque_existential_1, v4, v7);
}

uint64_t sub_235579EAC()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_235579FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2355BCE60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2355BCE50();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_23557DE84(a1, &qword_26880C520);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2355BCE10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23557A200(void *a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  int v28 = a3;
  uint64_t v7 = sub_2355BCB80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2355BBFD0())
  {
    sub_2355BBF90();
    swift_release();
    sub_2355BBF60();
    swift_release();
  }
  else
  {
    uint64_t v33 = 0;
    memset(v32, 0, sizeof(v32));
  }
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  unsigned int v12 = sub_2355BCB60();
  os_log_type_t v13 = sub_2355BCF60();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v27 = a2;
  if (v14)
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    os_log_type_t v26 = v4;
    uint64_t v17 = v16;
    uint64_t v29 = a2;
    v30[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    type metadata accessor for FavoriteEntityChangeRequestAction(0);
    uint64_t v18 = sub_2355BCC60();
    uint64_t v29 = sub_2355745F0(v18, v19, v30);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v29) = v28 & 1;
    sub_2355BD1B0();
    _os_log_impl(&dword_23556D000, v12, v13, "INUpdateMediaAffinityIntentHandler#registerCorrection Registering correction/undo with %s, movedToNextTrack: %{BOOL}d", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    uint64_t v20 = v17;
    uint64_t v4 = v26;
    MEMORY[0x237DE3BF0](v20, -1, -1);
    MEMORY[0x237DE3BF0](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_23557DFE4((uint64_t)v32, (uint64_t)v30, &qword_26880C2E8);
  if (v31)
  {
    __swift_project_boxed_opaque_existential_1(v30, v31);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v27;
    *(void *)(v21 + 24) = v4;
    *(void *)(v21 + 32) = a1;
    *(unsigned char *)(v21 + 40) = v28 & 1;
    id v22 = v4;
    id v23 = a1;
    sub_2355BBF50();
    swift_release();
    sub_23557DE84((uint64_t)v32, &qword_26880C2E8);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  }
  else
  {
    sub_23557DE84((uint64_t)v32, &qword_26880C2E8);
    return sub_23557DE84((uint64_t)v30, &qword_26880C2E8);
  }
}

uint64_t sub_23557A588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 96) = a5;
  *(void *)(v5 + 48) = a3;
  *(void *)(v5 + 56) = a4;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  uint64_t v6 = sub_2355BCB80();
  *(void *)(v5 + 64) = v6;
  *(void *)(v5 + 72) = *(void *)(v6 - 8);
  *(void *)(v5 + 80) = swift_task_alloc();
  *(void *)(v5 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23557A660, 0, 0);
}

uint64_t sub_23557A660()
{
  uint64_t v35 = v0;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26880D108);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  uint64_t v6 = sub_2355BCB60();
  os_log_type_t v7 = sub_2355BCF60();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 64);
  uint64_t v11 = *(void *)(v0 + 72);
  if (v8)
  {
    unint64_t v32 = v5;
    uint64_t v12 = *(void *)(v0 + 40);
    uint64_t v31 = *(void *)(v0 + 88);
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = v4;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v14 = v34;
    *(_DWORD *)os_log_type_t v13 = 136315138;
    *(void *)(v0 + 16) = v12;
    type metadata accessor for FavoriteEntityChangeRequestAction(0);
    uint64_t v15 = sub_2355BCC60();
    *(void *)(v0 + 24) = sub_2355745F0(v15, v16, &v34);
    sub_2355BD1B0();
    uint64_t v5 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v6, v7, "INUpdateMediaAffinityIntentHandler#registerCorrection executing %s as a correction/undo", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v14;
    uint64_t v4 = v33;
    MEMORY[0x237DE3BF0](v17, -1, -1);
    MEMORY[0x237DE3BF0](v13, -1, -1);

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v18(v31, v10);
  }
  else
  {

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v18(v9, v10);
  }
  int v19 = *(unsigned __int8 *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 48)+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider), *(void *)(*(void *)(v0 + 48)+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider+ 24));
  sub_2355BC910();
  if (v19 == 1)
  {
    v5(*(void *)(v0 + 80), v4, *(void *)(v0 + 64));
    uint64_t v20 = sub_2355BCB60();
    os_log_type_t v21 = sub_2355BCF60();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_23556D000, v20, v21, "INUpdateMediaAffinityIntentHandler#registerCorrection moving to previous track as a correction/undo", v22, 2u);
      MEMORY[0x237DE3BF0](v22, -1, -1);
    }
    uint64_t v23 = *(void *)(v0 + 80);
    uint64_t v24 = *(void *)(v0 + 64);
    uint64_t v25 = *(void *)(v0 + 48);

    v18(v23, v24);
    __swift_project_boxed_opaque_existential_1((void *)(v25 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController), *(void *)(v25 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController + 24));
    sub_2355BCAF0();
  }
  uint64_t v26 = *(void *)(v0 + 32);
  *(void *)(v26 + 32) = 0;
  *(_OWORD *)uint64_t v26 = 0u;
  *(_OWORD *)(v26 + 16) = 0u;
  uint64_t v27 = *MEMORY[0x263F6FD88];
  uint64_t v28 = sub_2355BBF80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v26, v27, v28);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
  return v29();
}

uint64_t sub_23557AA3C(uint64_t a1)
{
  uint64_t v2 = sub_2355BCB00();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)&v35 - v6;
  uint64_t v8 = sub_2355BCB80();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v40 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (char *)&v35 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C300);
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23557DFE4(a1, (uint64_t)v16, &qword_26880C300);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v7, v16, v2);
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v8, (uint64_t)qword_26880D108);
    uint64_t v18 = v9;
    int v19 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v40, v17, v8);
    uint64_t v20 = v39;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v39, v7, v2);
    os_log_type_t v21 = sub_2355BCB60();
    os_log_type_t v22 = sub_2355BCF70();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v37 = v18;
      id v38 = v7;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v36;
      *(_DWORD *)uint64_t v24 = 136446210;
      uint64_t v35 = v24 + 4;
      sub_23557E048(&qword_26880C308, MEMORY[0x263F73AC0]);
      uint64_t v25 = sub_2355BD320();
      uint64_t v41 = sub_2355745F0(v25, v26, &v42);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v3 + 8);
      v27(v20, v2);
      _os_log_impl(&dword_23556D000, v21, v22, "INUpdateMediaAffinityIntentHandler#registerCorrection error sending previous track command %{public}s", v24, 0xCu);
      uint64_t v28 = v36;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v28, -1, -1);
      MEMORY[0x237DE3BF0](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v8);
      return ((uint64_t (*)(char *, uint64_t))v27)(v38, v2);
    }
    else
    {

      uint64_t v34 = *(void (**)(char *, uint64_t))(v3 + 8);
      v34(v20, v2);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v8);
      return ((uint64_t (*)(char *, uint64_t))v34)(v7, v2);
    }
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v8, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v30, v8);
    uint64_t v31 = sub_2355BCB60();
    os_log_type_t v32 = sub_2355BCF60();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_23556D000, v31, v32, "INUpdateMediaAffinityIntentHandler#registerCorrection successfully moved to previous track", v33, 2u);
      MEMORY[0x237DE3BF0](v33, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
}

uint64_t sub_23557AF98(uint64_t a1)
{
  uint64_t v2 = sub_2355BCB80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_23557D690(a1);
  if (v7)
  {
    uint64_t v8 = (void *)result;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    id v10 = v8;
    id v11 = v8;
    uint64_t v12 = sub_2355BCB60();
    os_log_type_t v13 = sub_2355BCF70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v19 = v15;
      *(_DWORD *)uint64_t v14 = 136446210;
      v18[1] = v14 + 4;
      swift_getErrorValue();
      uint64_t v16 = sub_2355BD320();
      v18[2] = sub_2355745F0(v16, v17, &v19);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      sub_23557DBA0(v8, 1);
      sub_23557DBA0(v8, 1);
      _os_log_impl(&dword_23556D000, v12, v13, "INUpdateMediaAffinityIntentHandler#handle error sending next track command %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v15, -1, -1);
      MEMORY[0x237DE3BF0](v14, -1, -1);

      sub_23557DBA0(v8, 1);
    }
    else
    {
      sub_23557DBA0(v8, 1);
      sub_23557DBA0(v8, 1);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

id INUpdateMediaAffinityIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INUpdateMediaAffinityIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static MRCommandError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t MRCommandError.hash(into:)()
{
  return sub_2355BD380();
}

uint64_t MRCommandError.hashValue.getter()
{
  return sub_2355BD390();
}

uint64_t sub_23557B360()
{
  return 1;
}

uint64_t sub_23557B368()
{
  return sub_2355BD390();
}

uint64_t sub_23557B3AC()
{
  return sub_2355BD380();
}

uint64_t sub_23557B3D4()
{
  return sub_2355BD390();
}

uint64_t sub_23557B424(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_23557B500;
  return v6(a1);
}

uint64_t sub_23557B500()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_23557B5F8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C310);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23557B660(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2355BCD30();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x237DE3050](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

void *sub_23557B6DC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_2355BD2B0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_23557B780@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unsigned __int8 *sub_23557B7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2355BCD50();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_23557BB14();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_2355BD260();
  }
LABEL_7:
  uint64_t v11 = sub_23557B898(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_23557B898(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_23557BB14()
{
  unint64_t v0 = sub_2355BCD60();
  uint64_t v4 = sub_23557BB94(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23557BB94(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_23557BCEC(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_23557B5F8(v9, 0);
      unint64_t v12 = sub_23557BDEC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_2355BD260();
LABEL_4:
        JUMPOUT(0x237DE2FE0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x237DE2FE0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x237DE2FE0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_23557BCEC(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_23557B660(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_23557B660(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_23557BDEC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_23557B660(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_2355BCD20();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_2355BD260();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_23557B660(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_2355BCCF0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id sub_23557C000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v18[3] = sub_2355BCAE0();
  v18[4] = MEMORY[0x263F73A60];
  v18[0] = a4;
  v17[3] = sub_2355BC7C0();
  v17[4] = MEMORY[0x263F6CC08];
  v17[0] = a1;
  uint64_t v8 = sub_2355BC5D0();
  v16[3] = v8;
  v16[4] = MEMORY[0x263F6CB80];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(boxed_opaque_existential_1, a2, v8);
  v15[3] = sub_2355BC900();
  v15[4] = MEMORY[0x263F6CC48];
  v15[0] = a3;
  unint64_t v10 = (objc_class *)type metadata accessor for INUpdateMediaAffinityIntentHandler();
  id v11 = objc_allocWithZone(v10);
  sub_235574CD0((uint64_t)v17, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider);
  sub_235574CD0((uint64_t)v16, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider);
  sub_235574CD0((uint64_t)v15, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider);
  sub_235574CD0((uint64_t)v18, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController);
  v14.receiver = v11;
  v14.super_class = v10;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  return v12;
}

uint64_t sub_23557C170()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_23557C1B0(NSObject *a1)
{
  return sub_23557748C(a1, *(void (**))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(uint8_t **)(v1 + 40), *(unsigned __int8 *)(v1 + 48));
}

id sub_23557C1C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C200);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2355BC690();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone(MEMORY[0x263F08D38]);
  id v11 = (void *)sub_2355BCC40();
  id v12 = objc_msgSend(v10, sel_initWithActivityType_, v11);

  sub_23557DFE4(a2, (uint64_t)v5, (uint64_t *)&unk_26880C200);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_23557DE84((uint64_t)v5, (uint64_t *)&unk_26880C200);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C318);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2355BDD10;
    v19[1] = 0x726F727265;
    v19[2] = 0xE500000000000000;
    uint64_t v14 = MEMORY[0x263F8D310];
    sub_2355BD200();
    uint64_t v15 = sub_2355BC680();
    *(void *)(inited + 96) = v14;
    *(void *)(inited + 72) = v15;
    *(void *)(inited + 80) = v16;
    sub_23557F8F0(inited);
    unint64_t v17 = (void *)sub_2355BCC20();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setUserInfo_, v17);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v12;
}

uint64_t sub_23557C470()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_23557E098;
  v3[12] = v2;
  return MEMORY[0x270FA2498](sub_235579D08, 0, 0);
}

uint64_t sub_23557C51C(uint64_t a1)
{
  return sub_23557AF98(a1);
}

uint64_t type metadata accessor for INUpdateMediaAffinityIntentHandler()
{
  return self;
}

unint64_t sub_23557C54C()
{
  unint64_t result = qword_26880C240;
  if (!qword_26880C240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C240);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MRCommandError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MRCommandError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x23557C694);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23557C6BC()
{
  return 0;
}

ValueMetadata *type metadata accessor for MRCommandError()
{
  return &type metadata for MRCommandError;
}

void sub_23557C6D8(void *a1, char *a2, void (**a3)(id, id))
{
  uint64_t v126 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C520);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v112 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C200);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v121 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2355BCB80();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v122 = (char *)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v118 = (char *)&v112 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v117 = (char *)&v112 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v120 = (char *)&v112 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v112 - v20;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v10, (uint64_t)qword_26880D108);
  unint64_t v23 = *(void (**)(char *, uint8_t *, uint64_t))(v11 + 16);
  uint64_t v123 = (uint8_t *)v22;
  uint64_t v124 = v23;
  uint64_t v125 = (void (**)(id, id))(v11 + 16);
  ((void (*)(char *))v23)(v21);
  id v24 = a1;
  uint64_t v25 = sub_2355BCB60();
  os_log_type_t v26 = sub_2355BCF80();
  BOOL v27 = os_log_type_enabled(v25, v26);
  id v115 = a2;
  id v116 = v7;
  if (v27)
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v119 = v11;
    uint64_t v29 = (uint8_t *)v28;
    uint64_t v30 = swift_slowAlloc();
    v127[0] = v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v114 = v29 + 4;
    id v128 = objc_msgSend(v24, sel_affinityType);
    type metadata accessor for INMediaAffinityType(0);
    uint64_t v31 = sub_2355BCC60();
    id v128 = (id)sub_2355745F0(v31, v32, v127);
    sub_2355BD1B0();

    uint64_t v33 = v126;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v25, v26, "INUpdateMediaAffinityIntentHandler#handle affinityType: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v30, -1, -1);
    uint64_t v34 = v29;
    uint64_t v11 = v119;
    MEMORY[0x237DE3BF0](v34, -1, -1);

    uint64_t v35 = *(char **)(v11 + 8);
    ((void (*)(char *, uint64_t))v35)(v21, v10);
    uint64_t v36 = v24;
  }
  else
  {

    uint64_t v35 = *(char **)(v11 + 8);
    ((void (*)(char *, uint64_t))v35)(v21, v10);
    uint64_t v36 = v24;
    uint64_t v33 = v126;
  }
  id v37 = objc_msgSend(v36, sel_mediaSearch);
  id v38 = v37;
  if (v37)
  {
    id v39 = objc_msgSend(v37, sel_mediaType);
  }
  else
  {
    id v39 = 0;
  }
  id v40 = (uint8_t *)objc_msgSend(v36, sel_affinityType);
  if ((unint64_t)(v40 - 1) > 1)
  {
    uint64_t v51 = v122;
    v124(v122, v123, v10);
    os_log_type_t v52 = sub_2355BCB60();
    os_log_type_t v53 = sub_2355BCF70();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v54 = 134217984;
      v127[0] = (uint64_t)v40;
      sub_2355BD1B0();
      _os_log_impl(&dword_23556D000, v52, v53, "INUpdateMediaAffinityIntentHandler#handle unknown affinityType: %ld)", v54, 0xCu);
      MEMORY[0x237DE3BF0](v54, -1, -1);
    }

    ((void (*)(char *, uint64_t))v35)(v51, v10);
    id v55 = objc_allocWithZone(MEMORY[0x263F08D38]);
    char v56 = (void *)sub_2355BCC40();
    id v57 = objc_msgSend(v55, sel_initWithActivityType_, v56);

    goto LABEL_57;
  }
  id v41 = objc_msgSend(v36, sel_mediaItems);
  if (!v41)
  {
LABEL_54:
    unint64_t v106 = v120;
    v124(v120, v123, v10);
    uint64_t v107 = sub_2355BCB60();
    os_log_type_t v108 = sub_2355BCF70();
    if (os_log_type_enabled(v107, v108))
    {
      id v109 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v109 = 0;
      _os_log_impl(&dword_23556D000, v107, v108, "INUpdateMediaAffinityIntentHandler#handle missing mediaItem", v109, 2u);
      MEMORY[0x237DE3BF0](v109, -1, -1);
    }

    ((void (*)(char *, uint64_t))v35)(v106, v10);
    uint64_t v110 = sub_2355BC690();
    uint64_t v111 = (uint64_t)v121;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v121, 1, 1, v110);
    id v57 = sub_23557C1C0((uint64_t)v40, v111);
    sub_23557DE84(v111, (uint64_t *)&unk_26880C200);
LABEL_57:
    id v99 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F100A8]), sel_initWithCode_userActivity_, 4, v57);

    v33[2](v33, v99);
    goto LABEL_58;
  }
  uint64_t v42 = v41;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v43 = sub_2355BCDB0();

  if (!(v43 >> 62))
  {
    if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_13;
    }
    goto LABEL_53;
  }
  swift_bridgeObjectRetain();
  uint64_t v105 = sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v105)
  {
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
LABEL_13:
  id v112 = v39;
  uint64_t v113 = v36;
  if ((v43 & 0xC000000000000001) != 0)
  {
    uint64_t v44 = (char *)MEMORY[0x237DE35A0](0, v43);
  }
  else
  {
    if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_61;
    }
    uint64_t v44 = (char *)*(id *)(v43 + 32);
  }
  id v45 = v44;
  swift_bridgeObjectRelease();
  uint64_t v122 = v45;
  id v46 = objc_msgSend(v45, sel_identifier);
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = sub_2355BCC50();
    unint64_t v50 = v49;
  }
  else
  {
    uint64_t v48 = 0;
    unint64_t v50 = 0xE000000000000000;
  }
  sub_235579A98(v48, v50);
  uint64_t v114 = v40;
  if ((v58 & 1) == 0)
  {
    uint64_t v120 = v35;
    sub_2355BC4D0();
    swift_allocObject();
    sub_2355BC4C0();
    id v59 = v122;
    objc_msgSend(v122, sel_type);
    id v60 = objc_msgSend(v59, sel_artist);
    if (v60)
    {
      id v61 = v60;
      sub_2355BCC50();
    }
    uint64_t v73 = (void *)sub_2355BC4B0();
    swift_release();
    swift_bridgeObjectRelease();
    unint64_t v74 = v118;
    v124(v118, v123, v10);
    uint64_t v33 = v73;
    unint64_t v75 = sub_2355BCB60();
    os_log_type_t v76 = sub_2355BCF50();
    if (os_log_type_enabled(v75, v76))
    {
      id v77 = (uint8_t *)swift_slowAlloc();
      uint64_t v124 = (void (*)(char *, uint8_t *, uint64_t))swift_slowAlloc();
      v127[0] = (uint64_t)v124;
      *(_DWORD *)id v77 = 136315138;
      uint64_t v123 = v77 + 4;
      uint64_t v78 = v33;
      uint64_t v125 = v33;
      os_log_type_t v79 = v78;
      id v80 = objc_msgSend(v78, sel_description);
      uint64_t v119 = v11;
      id v81 = v80;
      uint64_t v82 = sub_2355BCC50();
      unint64_t v84 = v83;

      id v128 = (id)sub_2355745F0(v82, v84, v127);
      sub_2355BD1B0();

      uint64_t v33 = v125;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v75, v76, "INUpdateMediaAffinityIntentHandler#handle model object is %s", v77, 0xCu);
      unint64_t v85 = v124;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v85, -1, -1);
      MEMORY[0x237DE3BF0](v77, -1, -1);

      unint64_t v86 = v118;
    }
    else
    {

      unint64_t v86 = v74;
    }
    ((void (*)(char *, uint64_t))v120)(v86, v10);
    uint64_t v10 = (uint64_t)v126;
    uint64_t v35 = v115;
    id v87 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v88 = (uint64_t)v114;
    BOOL v89 = (void *)sub_2355BCC40();
    id v39 = objc_msgSend(v87, sel_initWithActivityType_, v89);

    __swift_project_boxed_opaque_existential_1(&v35[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider], *(void *)&v35[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider+ 24]);
    sub_2355BC910();
    if (v38) {
      BOOL v90 = v88 == 2;
    }
    else {
      BOOL v90 = 0;
    }
    BOOL v91 = v90 && v112 == (id)1;
    LODWORD(v38) = v91;
    if (!v91)
    {
      if (v88 == 1)
      {
        uint64_t v93 = 3;
LABEL_48:
        uint64_t v94 = v113;
        sub_23557A200(v33, v93, (int)v38);
        uint64_t v95 = (uint64_t)v116;
        sub_2355BCE40();
        uint64_t v96 = sub_2355BCE60();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v95, 0, 1, v96);
        uint64_t v97 = (void *)swift_allocObject();
        v97[2] = 0;
        v97[3] = 0;
        v97[4] = v94;
        id v98 = v94;
        sub_235579FC8(v95, (uint64_t)&unk_26880C2B8, (uint64_t)v97);
        swift_release();
        id v99 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F100A8]), sel_initWithCode_userActivity_, 3, v39);
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v99);

        goto LABEL_58;
      }
LABEL_47:
      uint64_t v93 = 1;
      goto LABEL_48;
    }
    __swift_project_boxed_opaque_existential_1(&v35[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider], *(void *)&v35[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider+ 24]);
    if (qword_26880C0E8 == -1)
    {
LABEL_44:
      *(void *)(swift_allocObject() + 16) = v35;
      id v92 = v35;
      sub_2355BC820();
      swift_release();
      goto LABEL_47;
    }
LABEL_61:
    swift_once();
    goto LABEL_44;
  }
  id v62 = v117;
  v124(v117, v123, v10);
  uint64_t v63 = v122;
  char v64 = sub_2355BCB60();
  os_log_type_t v65 = sub_2355BCF70();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v119 = v11;
    uint64_t v120 = v35;
    uint64_t v125 = (void (**)(id, id))v10;
    os_log_type_t v66 = (uint8_t *)swift_slowAlloc();
    id v67 = (id)swift_slowAlloc();
    id v128 = v67;
    *(_DWORD *)os_log_type_t v66 = 136315138;
    id v68 = objc_msgSend(v63, sel_identifier);
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = sub_2355BCC50();
      uint64_t v72 = v71;
    }
    else
    {
      uint64_t v70 = 0;
      uint64_t v72 = 0;
    }
    v127[0] = v70;
    v127[1] = v72;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
    uint64_t v100 = sub_2355BCC60();
    v127[0] = sub_2355745F0(v100, v101, (uint64_t *)&v128);
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v64, v65, "INUpdateMediaAffinityIntentHandler#handle failed to convert identifier: %s into Int64 entityId", v66, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v67, -1, -1);
    MEMORY[0x237DE3BF0](v66, -1, -1);

    ((void (*)(char *, void))v120)(v117, v125);
  }
  else
  {

    ((void (*)(char *, uint64_t))v35)(v62, v10);
  }
  uint64_t v102 = sub_2355BC690();
  uint64_t v103 = (uint64_t)v121;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v102 - 8) + 56))(v121, 1, 1, v102);
  id v104 = sub_23557C1C0((uint64_t)v114, v103);
  sub_23557DE84(v103, (uint64_t *)&unk_26880C200);
  id v99 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F100A8]), sel_initWithCode_userActivity_, 4, v104);

  v33[2](v33, v99);
LABEL_58:
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23557D618()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23557D650()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_23557D688(uint64_t a1)
{
  sub_235578B00(a1, *(void *)(v1 + 16));
}

uint64_t sub_23557D690(uint64_t a1)
{
  uint64_t v47 = a1;
  uint64_t v1 = sub_2355BCB80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v45 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v45 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v45 - v12;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v1, (uint64_t)qword_26880D108);
  uint64_t v15 = *(void (**)(char *))(v2 + 16);
  uint64_t v46 = v14;
  v15(v13);
  uint64_t v16 = sub_2355BCB60();
  os_log_type_t v17 = sub_2355BCF60();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = v2 + 16;
    uint64_t v19 = v5;
    uint64_t v20 = v1;
    uint64_t v21 = v15;
    uint64_t v22 = v11;
    unint64_t v23 = v8;
    uint64_t v24 = v2;
    uint64_t v25 = v18;
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_23556D000, v16, v17, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult handling statuses from affinity MRMediaRemoteCommand", v18, 2u);
    os_log_type_t v26 = v25;
    uint64_t v2 = v24;
    uint64_t v8 = v23;
    uint64_t v11 = v22;
    uint64_t v15 = v21;
    uint64_t v1 = v20;
    uint64_t v5 = v19;
    MEMORY[0x237DE3BF0](v26, -1, -1);
  }

  BOOL v27 = *(void (**)(char *, uint64_t))(v2 + 8);
  v27(v13, v1);
  if (!v47 || (v48 = 0, sub_23557DC00(0, &qword_26880C2D0), uint64_t result = sub_2355BCDA0(), (v29 = v48) == 0))
  {
    ((void (*)(char *, uint64_t, uint64_t))v15)(v5, v46, v1);
    id v37 = sub_2355BCB60();
    os_log_type_t v38 = sub_2355BCF60();
    if (os_log_type_enabled(v37, v38))
    {
      id v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v39 = 0;
      _os_log_impl(&dword_23556D000, v37, v38, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult command statuses are nil, command failed", v39, 2u);
      MEMORY[0x237DE3BF0](v39, -1, -1);
    }

    id v40 = v5;
    goto LABEL_24;
  }
  if (!(v48 >> 62))
  {
    if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_9;
    }
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    ((void (*)(char *, uint64_t, uint64_t))v15)(v11, v46, v1);
    uint64_t v42 = sub_2355BCB60();
    os_log_type_t v43 = sub_2355BCF60();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_23556D000, v42, v43, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult command statuses are empty or non-zero, command failed", v44, 2u);
      MEMORY[0x237DE3BF0](v44, -1, -1);
    }

    id v40 = v11;
LABEL_24:
    v27(v40, v1);
    sub_23557DBAC();
    return swift_allocError();
  }
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_2355BD280();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v41) {
    goto LABEL_20;
  }
LABEL_9:
  if ((v29 & 0xC000000000000001) != 0)
  {
    id v30 = (id)MEMORY[0x237DE35A0](0, v29);
  }
  else
  {
    if (!*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v30 = *(id *)(v29 + 32);
  }
  uint64_t v31 = v30;
  swift_bridgeObjectRelease();
  id v32 = objc_msgSend(v31, sel_integerValue);

  if (v32) {
    goto LABEL_21;
  }
  ((void (*)(char *, uint64_t, uint64_t))v15)(v8, v46, v1);
  uint64_t v33 = v8;
  uint64_t v34 = sub_2355BCB60();
  os_log_type_t v35 = sub_2355BCF60();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_23556D000, v34, v35, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult command succeeded", v36, 2u);
    MEMORY[0x237DE3BF0](v36, -1, -1);
  }

  v27(v33, v1);
  return 0;
}

void sub_23557DBA0(id a1, char a2)
{
  if (a2) {
}
  }

unint64_t sub_23557DBAC()
{
  unint64_t result = qword_26880C2C8;
  if (!qword_26880C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C2C8);
  }
  return result;
}

uint64_t sub_23557DC00(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23557DC3C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23557DC74(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_23557DD2C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26880C2D8 + dword_26880C2D8);
  return v6(a1, v4);
}

uint64_t sub_23557DD2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_23557DE84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23557DEE0()
{
  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_23557DF20(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_23557DD2C;
  return sub_23557A588(a1, v4, v5, v6, v7);
}

uint64_t sub_23557DFE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23557E048(unint64_t *a1, void (*a2)(uint64_t))
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

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArtistNameParameterBuilder(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtistNameParameterBuilder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x23557E218);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArtistNameParameterBuilder()
{
  return &type metadata for ArtistNameParameterBuilder;
}

void sub_23557E250()
{
  static SearchMusicAppIntent.bundleIdentifier = 0x6C7070612E6D6F63;
  unk_26880D0E0 = 0xEF636973754D2E65;
}

uint64_t *SearchMusicAppIntent.bundleIdentifier.unsafeMutableAddressor()
{
  if (qword_26880C0F0 != -1) {
    swift_once();
  }
  return &static SearchMusicAppIntent.bundleIdentifier;
}

uint64_t static SearchMusicAppIntent.bundleIdentifier.getter()
{
  if (qword_26880C0F0 != -1) {
    swift_once();
  }
  uint64_t v0 = static SearchMusicAppIntent.bundleIdentifier;
  swift_bridgeObjectRetain();
  return v0;
}

void *SearchMusicAppIntent.actionIdentifier.unsafeMutableAddressor()
{
  return &static SearchMusicAppIntent.actionIdentifier;
}

unint64_t static SearchMusicAppIntent.actionIdentifier.getter()
{
  return 0xD000000000000014;
}

uint64_t property wrapper backing initializer of SearchMusicAppIntent.criteria()
{
  return sub_2355BC950();
}

uint64_t property wrapper backing initializer of SearchMusicAppIntent.searchSource()
{
  return sub_2355BC950();
}

uint64_t SearchMusicAppIntent.init(criteria:searchSource:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3B8);
  swift_allocObject();
  sub_2355BC950();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3B0);
  swift_allocObject();
  swift_retain();
  uint64_t v0 = sub_2355BC950();
  swift_retain();
  sub_2355BC960();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_23557E4C4()
{
  if (qword_26880C0F0 != -1) {
    swift_once();
  }
  uint64_t v0 = static SearchMusicAppIntent.bundleIdentifier;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_23557E52C()
{
  return 0xD000000000000014;
}

uint64_t destroy for SearchMusicAppIntent()
{
  swift_release();
  return swift_release();
}

void *_s17SiriAudioInternal20SearchMusicAppIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SearchMusicAppIntent(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SearchMusicAppIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchMusicAppIntent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchMusicAppIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchMusicAppIntent()
{
  return &type metadata for SearchMusicAppIntent;
}

uint64_t sub_23557E704()
{
  uint64_t v0 = sub_2355BCB80();
  __swift_allocate_value_buffer(v0, static Logger.audio);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.audio);
  return sub_2355BCB70();
}

uint64_t Logger.audio.unsafeMutableAddressor()
{
  if (qword_26880C0F8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2355BCB80();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.audio);
}

uint64_t static Logger.audio.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26880C0F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2355BCB80();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.audio);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t INSearchForMediaIntentHandler.resolveMediaItems(for:with:)(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_privateSearchForMediaIntentData);
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  id v10 = objc_msgSend(v8, sel_audioSearchResults);

  if (!v10) {
    goto LABEL_21;
  }
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v11 = sub_2355BCDB0();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_2355BD280();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
  uint64_t v12 = *(void **)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12)
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
    *(void *)(v40 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v50[0] = v40;
    sub_2355BCDD0();
    a2(v50[0]);
    goto LABEL_22;
  }
LABEL_5:
  if ((v11 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x237DE35A0](0, v11);
  }
  else
  {
    if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_27;
    }
    id v13 = *(id *)(v11 + 32);
  }
  uint64_t v12 = v13;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_privateMediaItemValueData);
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_punchoutURI);

    if (v16)
    {
      uint64_t v17 = sub_2355BCC50();
      unint64_t v19 = v18;

      swift_bridgeObjectRelease();
      uint64_t v20 = HIBYTE(v19) & 0xF;
      if ((v19 & 0x2000000000000000) == 0) {
        uint64_t v20 = v17 & 0xFFFFFFFFFFFFLL;
      }
      if (v20)
      {
        if (qword_26880C108 == -1)
        {
LABEL_14:
          uint64_t v21 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
          (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v21, v4);
          id v22 = v12;
          unint64_t v23 = sub_2355BCB60();
          os_log_type_t v24 = sub_2355BCF60();
          int v25 = v24;
          if (os_log_type_enabled(v23, v24))
          {
            os_log_t v48 = v23;
            uint64_t v26 = swift_slowAlloc();
            int v46 = v25;
            BOOL v27 = (uint8_t *)v26;
            uint64_t v47 = swift_slowAlloc();
            v50[0] = v47;
            uint64_t v45 = v27;
            *(_DWORD *)BOOL v27 = 136315138;
            uint64_t v44 = v27 + 4;
            id v28 = v22;
            id v29 = objc_msgSend(v28, sel_description);
            id v43 = v22;
            id v30 = v29;
            uint64_t v42 = sub_2355BCC50();
            unint64_t v32 = v31;

            id v22 = v43;
            uint64_t v49 = sub_2355745F0(v42, v32, v50);
            sub_2355BD1B0();

            swift_bridgeObjectRelease();
            os_log_t v33 = v48;
            uint64_t v34 = v45;
            _os_log_impl(&dword_23556D000, v48, (os_log_type_t)v46, "INSearchForMediaIntentHandler#resolveMediaItems resolving item: %s", v45, 0xCu);
            uint64_t v35 = v47;
            swift_arrayDestroy();
            MEMORY[0x237DE3BF0](v35, -1, -1);
            MEMORY[0x237DE3BF0](v34, -1, -1);
          }
          else
          {
          }
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          v50[3] = sub_23557DC00(0, &qword_26880C3D8);
          v50[4] = MEMORY[0x263F6CC70];
          v50[0] = (uint64_t)a1;
          id v37 = a1;
          sub_2355BCEF0();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
          uint64_t v38 = swift_allocObject();
          *(_OWORD *)(v38 + 16) = xmmword_2355BDD80;
          sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
          *(void *)(v38 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v22);
          v50[0] = v38;
          sub_2355BCDD0();
          a2(v50[0]);

          return swift_bridgeObjectRelease();
        }
LABEL_27:
        swift_once();
        goto LABEL_14;
      }
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_2355BDD80;
  sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
  *(void *)(v36 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
  v50[0] = v36;
  sub_2355BCDD0();
  a2(v50[0]);

LABEL_22:
  return swift_bridgeObjectRelease();
}

void INSearchForMediaIntentHandler.handle(intent:completion:)(uint64_t a1, void (*a2)(void))
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 4, 0);
  a2();
}

id INSearchForMediaIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id INSearchForMediaIntentHandler.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSearchForMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_init);
}

id INSearchForMediaIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSearchForMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for INSearchForMediaIntentHandler()
{
  return self;
}

void sub_23557F1A8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_privateSearchForMediaIntentData);
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  id v10 = objc_msgSend(v8, sel_audioSearchResults);

  if (!v10) {
    goto LABEL_21;
  }
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v11 = sub_2355BCDB0();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_2355BD280();
    swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
  uint64_t v12 = *(void **)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v12)
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
    *(void *)(v42 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v51[0] = v42;
    sub_2355BCDD0();
    uint64_t v49 = sub_2355BCD90();
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v49);
    goto LABEL_22;
  }
LABEL_5:
  if ((v11 & 0xC000000000000001) != 0)
  {
    id v13 = (id)MEMORY[0x237DE35A0](0, v11);
  }
  else
  {
    if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_27;
    }
    id v13 = *(id *)(v11 + 32);
  }
  uint64_t v12 = v13;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_privateMediaItemValueData);
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_punchoutURI);

    if (v16)
    {
      uint64_t v17 = sub_2355BCC50();
      unint64_t v19 = v18;

      swift_bridgeObjectRelease();
      uint64_t v20 = HIBYTE(v19) & 0xF;
      if ((v19 & 0x2000000000000000) == 0) {
        uint64_t v20 = v17 & 0xFFFFFFFFFFFFLL;
      }
      if (v20)
      {
        if (qword_26880C108 == -1)
        {
LABEL_14:
          uint64_t v21 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
          (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v21, v4);
          id v22 = v12;
          unint64_t v23 = sub_2355BCB60();
          os_log_type_t v24 = sub_2355BCF60();
          int v25 = v24;
          if (os_log_type_enabled(v23, v24))
          {
            os_log_t v48 = v23;
            uint64_t v26 = swift_slowAlloc();
            int v46 = v25;
            BOOL v27 = (uint8_t *)v26;
            uint64_t v47 = swift_slowAlloc();
            v51[0] = v47;
            uint64_t v45 = v27;
            *(_DWORD *)BOOL v27 = 136315138;
            uint64_t v44 = v27 + 4;
            id v28 = v22;
            id v29 = objc_msgSend(v28, sel_description);
            uint64_t v30 = sub_2355BCC50();
            uint64_t v49 = (uint64_t)v22;
            uint64_t v31 = v30;
            unint64_t v33 = v32;

            uint64_t v34 = v31;
            id v22 = (id)v49;
            uint64_t v50 = sub_2355745F0(v34, v33, v51);
            sub_2355BD1B0();

            swift_bridgeObjectRelease();
            os_log_t v35 = v48;
            uint64_t v36 = v45;
            _os_log_impl(&dword_23556D000, v48, (os_log_type_t)v46, "INSearchForMediaIntentHandler#resolveMediaItems resolving item: %s", v45, 0xCu);
            uint64_t v37 = v47;
            swift_arrayDestroy();
            MEMORY[0x237DE3BF0](v37, -1, -1);
            MEMORY[0x237DE3BF0](v36, -1, -1);
          }
          else
          {
          }
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          v51[3] = sub_23557DC00(0, &qword_26880C3D8);
          v51[4] = MEMORY[0x263F6CC70];
          v51[0] = (uint64_t)a1;
          id v39 = a1;
          sub_2355BCEF0();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
          uint64_t v40 = swift_allocObject();
          *(_OWORD *)(v40 + 16) = xmmword_2355BDD80;
          sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
          *(void *)(v40 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v22);
          v51[0] = v40;
          sub_2355BCDD0();
          uint64_t v41 = (void *)sub_2355BCD90();
          (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v41);

          swift_bridgeObjectRelease();
          return;
        }
LABEL_27:
        swift_once();
        goto LABEL_14;
      }
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_2355BDD80;
  sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
  *(void *)(v38 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
  v51[0] = v38;
  sub_2355BCDD0();
  uint64_t v49 = sub_2355BCD90();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v49);

LABEL_22:
  swift_bridgeObjectRelease();
  id v43 = (void *)v49;
}

uint64_t static SuggestionsDonationProvider.donateIntentForEngagement(intent:currentRequestId:suggestionsAPIClient:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = a4[3];
  uint64_t v9 = a4[4];
  id v10 = __swift_project_boxed_opaque_existential_1(a4, v8);
  id v13 = (char *)&dword_26880C3E8 + dword_26880C3E8;
  unint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v11;
  void *v11 = v4;
  v11[1] = sub_23557DD2C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))v13)(a1, a2, a3, v10, v8, v9);
}

unint64_t sub_23557F8F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C478);
  uint64_t v2 = sub_2355BD2A0();
  id v3 = (void *)v2;
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
    sub_23557DFE4(v6, (uint64_t)v15, (uint64_t *)&unk_26880C480);
    unint64_t result = sub_23558347C((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_235585F48(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_23557FA34(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C460);
  uint64_t v2 = (void *)sub_2355BD2A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2355834C0(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
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

unint64_t sub_23557FB38(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C468);
  uint64_t v2 = (void *)sub_2355BD2A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_235583548(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_23557FC5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C448);
  uint64_t v2 = (void *)sub_2355BD2A0();
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
    unint64_t result = sub_235583548(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

unint64_t sub_23557FD78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C408);
  uint64_t v2 = sub_2355BD2A0();
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
    sub_23557DFE4(v6, (uint64_t)&v15, &qword_26880C410);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_235583548(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_235585C00(v17, (_OWORD *)(v3[7] + 48 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 64;
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

uint64_t sub_23557FEBC()
{
  uint64_t result = sub_235585334((uint64_t)&unk_26E8AFF88);
  qword_26880D100 = result;
  return result;
}

uint64_t sub_23557FEE4(uint64_t a1)
{
  v1[23] = a1;
  uint64_t v2 = sub_2355BCB80();
  v1[24] = v2;
  v1[25] = *(void *)(v2 - 8);
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  uint64_t v3 = sub_2355BCB50();
  v1[28] = v3;
  v1[29] = *(void *)(v3 - 8);
  v1[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_235580010, 0, 0);
}

uint64_t sub_235580010()
{
  if (sub_2355BBFD0()
    && (sub_2355BBFA0(),
        swift_release(),
        uint64_t v1 = sub_2355BCAA0(),
        uint64_t v3 = v2,
        swift_release(),
        v0[31] = v1,
        (v0[32] = v3) != 0))
  {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F54820]), sel_init);
    v0[33] = v4;
    unint64_t v18 = (char *)&dword_26880C3F8 + dword_26880C3F8;
    uint64_t v5 = (void *)swift_task_alloc();
    v0[34] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_23558026C;
    return ((uint64_t (*)(void *, id))v18)(v0 + 17, v4);
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v7 = v0[27];
    uint64_t v8 = v0[24];
    uint64_t v9 = v0[25];
    uint64_t v10 = __swift_project_value_buffer(v8, (uint64_t)qword_26880D108);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v10, v8);
    uint64_t v11 = sub_2355BCB60();
    os_log_type_t v12 = sub_2355BCF70();
    if (os_log_type_enabled(v11, v12))
    {
      BOOL v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl(&dword_23556D000, v11, v12, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions Unable to get requestId. Not donating intent to SiriSuggestions", v13, 2u);
      MEMORY[0x237DE3BF0](v13, -1, -1);
    }
    uint64_t v14 = v0[27];
    uint64_t v15 = v0[24];
    uint64_t v16 = v0[25];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
}

uint64_t sub_23558026C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 280) = v0;
  swift_task_dealloc();

  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_235580644;
  }
  else
  {
    uint64_t v3 = sub_2355803B0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2355803B0()
{
  id v1 = objc_msgSend(*(id *)(v0 + 184), sel_mediaItems);
  if (!v1) {
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v3 = sub_2355BCDB0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_2355BD280();
    uint64_t v4 = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    uint64_t v18 = *(void *)(v0 + 184);
    uint64_t v19 = swift_task_alloc();
    *(void *)(v0 + 288) = v19;
    *(void *)(v19 + 16) = v18;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_235580890;
    unint64_t v8 = 0x80000002355BEE80;
    uint64_t v11 = MEMORY[0x263F8D4F8];
    uint64_t v9 = sub_235585BF8;
    uint64_t v4 = v0 + 130;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    unint64_t v7 = 0xD00000000000001FLL;
    uint64_t v10 = v19;
    goto LABEL_11;
  }
LABEL_4:
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x237DE35A0](0, v3);
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return MEMORY[0x270FA2360](v4, v5, v6, v7, v8, v9, v10, v11);
    }
    id v12 = *(id *)(v3 + 32);
  }
  BOOL v13 = v12;
  uint64_t v14 = *(void *)(v0 + 184);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 312) = objc_msgSend(v13, sel_type);

  uint64_t v15 = swift_task_alloc();
  *(void *)(v0 + 320) = v15;
  *(void *)(v15 + 16) = v14;
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_235580F04;
  unint64_t v8 = 0x80000002355BEE80;
  uint64_t v11 = MEMORY[0x263F8D4F8];
  uint64_t v9 = sub_235586008;
  uint64_t v4 = v0 + 131;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unint64_t v7 = 0xD00000000000001FLL;
  uint64_t v10 = v15;
LABEL_11:
  return MEMORY[0x270FA2360](v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_235580644()
{
  id v1 = (void *)v0[35];
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[24];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  unint64_t v8 = sub_2355BCB60();
  os_log_type_t v9 = sub_2355BCF70();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v13;
    sub_2355BD1B0();
    void *v11 = v13;

    _os_log_impl(&dword_23556D000, v8, v9, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v11, -1, -1);
    MEMORY[0x237DE3BF0](v10, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_235580890()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_235580CA4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2355809AC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2355809AC()
{
  char v24 = *(unsigned char *)(v0 + 130);
  sub_2355BD140();
  if (qword_26880C118 != -1) {
    swift_once();
  }
  uint64_t v26 = *(void *)(v0 + 256);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void **)(v0 + 184);
  sub_2355BCB40();
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v22 = MEMORY[0x263F8EE78];
  LOBYTE(v21) = 2;
  sub_2355BCB10();
  id v6 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  *(void *)(v0 + 344) = v6;
  *(void *)(v0 + 352) = (v1 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v2, v3);
  sub_2355BC980();
  sub_2355BC970();
  uint64_t v7 = *(void *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v7);
  LOWORD(v1) = *(_WORD *)(v0 + 136);
  char v8 = *(unsigned char *)(v0 + 153);
  uint64_t v9 = *(void *)(v0 + 160);
  char v23 = *(unsigned char *)(v0 + 168);
  uint64_t v10 = sub_2355BC9D0();
  swift_allocObject();
  uint64_t v11 = MEMORY[0x237DE2D30](0x6964754169726953, 0xE90000000000006FLL);
  *(void *)(v0 + 40) = v10;
  *(void *)(v0 + 48) = sub_235585F00(&qword_26880C400, MEMORY[0x263F749E0]);
  *(void *)(v0 + 16) = v11;
  unint64_t v12 = sub_23557FD78(v5);
  *(void *)(v0 + 360) = v12;
  id v13 = objc_msgSend(v4, sel_verb, 21, v21, v22);
  uint64_t v14 = sub_2355BCC50();
  uint64_t v16 = v15;

  *(void *)(v0 + 368) = v16;
  *(_WORD *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = 0;
  *(unsigned char *)(v0 + 112) = 0;
  *(unsigned char *)(v0 + 113) = v8;
  *(void *)(v0 + 120) = v9;
  *(unsigned char *)(v0 + 128) = v23;
  *(unsigned char *)(v0 + 129) = v24;
  unint64_t v17 = sub_23558BBE4();
  *(void *)(v0 + 376) = v17;
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_235581584;
  uint64_t v19 = *(void *)(v0 + 248);
  return MEMORY[0x270F71688](v19, v26, v0 + 16, v12, v14, v16, v17, v7);
}

uint64_t sub_235580CA4()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = (void *)v0[38];
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[24];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  char v8 = sub_2355BCB60();
  os_log_type_t v9 = sub_2355BCF70();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v13;
    sub_2355BD1B0();
    void *v11 = v13;

    _os_log_impl(&dword_23556D000, v8, v9, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v11, -1, -1);
    MEMORY[0x237DE3BF0](v10, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_235580F04()
{
  *(void *)(*(void *)v1 + 336) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_235581324;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_235581020;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_235581020()
{
  char v25 = *(unsigned char *)(v0 + 131);
  uint64_t v24 = *(void *)(v0 + 312);
  sub_2355BD140();
  if (qword_26880C118 != -1) {
    swift_once();
  }
  uint64_t v27 = *(void *)(v0 + 256);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void **)(v0 + 184);
  sub_2355BCB40();
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v22 = MEMORY[0x263F8EE78];
  LOBYTE(v21) = 2;
  sub_2355BCB10();
  id v6 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  *(void *)(v0 + 344) = v6;
  *(void *)(v0 + 352) = (v1 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v2, v3);
  sub_2355BC980();
  sub_2355BC970();
  uint64_t v7 = *(void *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v7);
  LOWORD(v1) = *(_WORD *)(v0 + 136);
  char v23 = *(unsigned char *)(v0 + 153);
  uint64_t v8 = *(void *)(v0 + 160);
  char v9 = *(unsigned char *)(v0 + 168);
  uint64_t v10 = sub_2355BC9D0();
  swift_allocObject();
  uint64_t v11 = MEMORY[0x237DE2D30](0x6964754169726953, 0xE90000000000006FLL);
  *(void *)(v0 + 40) = v10;
  *(void *)(v0 + 48) = sub_235585F00(&qword_26880C400, MEMORY[0x263F749E0]);
  *(void *)(v0 + 16) = v11;
  unint64_t v12 = sub_23557FD78(v5);
  *(void *)(v0 + 360) = v12;
  id v13 = objc_msgSend(v4, sel_verb, 21, v21, v22);
  uint64_t v14 = sub_2355BCC50();
  uint64_t v16 = v15;

  *(void *)(v0 + 368) = v16;
  *(_WORD *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = v24;
  *(unsigned char *)(v0 + 112) = 0;
  *(unsigned char *)(v0 + 113) = v23;
  *(void *)(v0 + 120) = v8;
  *(unsigned char *)(v0 + 128) = v9;
  *(unsigned char *)(v0 + 129) = v25;
  unint64_t v17 = sub_23558BBE4();
  *(void *)(v0 + 376) = v17;
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_235581584;
  uint64_t v19 = *(void *)(v0 + 248);
  return MEMORY[0x270F71688](v19, v27, v0 + 16, v12, v14, v16, v17, v7);
}

uint64_t sub_235581324()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = (void *)v0[42];
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v3 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[24];
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2355BCB60();
  os_log_type_t v9 = sub_2355BCF70();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v13;
    sub_2355BD1B0();
    void *v11 = v13;

    _os_log_impl(&dword_23556D000, v8, v9, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v11, -1, -1);
    MEMORY[0x237DE3BF0](v10, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_235581584()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v3 = sub_2355817E4;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 16);
    uint64_t v3 = sub_2355816FC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2355816FC()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[43];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[28];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  sub_2355BD130();
  sub_2355BCB40();
  sub_2355BCB20();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2355817E4()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[43];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[28];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  sub_2355BD130();
  sub_2355BCB40();
  sub_2355BCB20();
  v1(v2, v3);
  uint64_t v4 = (void *)v0[49];
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v6 = v0[25];
  uint64_t v5 = v0[26];
  uint64_t v7 = v0[24];
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26880D108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  id v9 = v4;
  id v10 = v4;
  uint64_t v11 = sub_2355BCB60();
  os_log_type_t v12 = sub_2355BCF70();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    id v15 = v4;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v16;
    sub_2355BD1B0();
    *uint64_t v14 = v16;

    _os_log_impl(&dword_23556D000, v11, v12, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v14, -1, -1);
    MEMORY[0x237DE3BF0](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_235581AA0(uint64_t a1, void *a2)
{
  uint64_t v22 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C418);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v21 = v5;
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2355BC890();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2355BC710();
  uint64_t v23 = *(void *)(v11 - 8);
  uint64_t v24 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355BC700();
  char v25 = a2;
  uint64_t v26 = a2;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F6CC40], v7);
  sub_23557DC00(0, &qword_26880C420);
  sub_2355BC8B0();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v15)
  {
    sub_2355BCC70();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v3);
  unint64_t v16 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = v25;
  *(void *)(v17 + 16) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v17 + v16, v6, v3);
  id v19 = v18;
  sub_2355BC6F0();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v24);
}

uint64_t sub_235581DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v86 = a1;
  uint64_t v5 = sub_2355BC120();
  uint64_t v85 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  os_log_type_t v79 = (char *)&v73 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v73 - v11;
  uint64_t v13 = sub_2355BCB80();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v87 = (void (**)(char *, uint64_t))((char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  id v80 = (char *)&v73 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  id v81 = (char *)&v73 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v73 - v22;
  MEMORY[0x270FA5388](v21);
  char v25 = (char *)&v73 - v24;
  uint64_t v26 = MEMORY[0x237DE2890](a2);
  if (!v27)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v38 = __swift_project_value_buffer(v13, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v25, v38, v13);
    id v39 = sub_2355BCB60();
    os_log_type_t v40 = sub_2355BCF60();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_23556D000, v39, v40, "SuggestionsDonationService#supportsAffinityIntent returning false since there is no localBundleIdentifier", v41, 2u);
      MEMORY[0x237DE3BF0](v41, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v25, v13);
LABEL_27:
    LOBYTE(v90) = 0;
LABEL_28:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C418);
    return sub_2355BCE30();
  }
  uint64_t v28 = v26;
  unint64_t v29 = v27;
  unint64_t v75 = v12;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v88 = v5;
  uint64_t v30 = __swift_project_value_buffer(v13, (uint64_t)qword_26880D108);
  uint64_t v31 = *(void (**)(void (**)(char *, uint64_t), uint64_t, uint64_t))(v14 + 16);
  uint64_t v82 = v30;
  unint64_t v83 = v31;
  uint64_t v84 = v14 + 16;
  ((void (*)(char *))v31)(v23);
  swift_bridgeObjectRetain_n();
  unint64_t v32 = sub_2355BCB60();
  os_log_type_t v33 = sub_2355BCF60();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v77 = a3;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v76 = v14;
    os_log_t v35 = (uint8_t *)v34;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v90 = v36;
    uint64_t v78 = v13;
    *(_DWORD *)os_log_t v35 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v89 = sub_2355745F0(v28, v29, &v90);
    a3 = v77;
    uint64_t v13 = v78;
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v32, v33, "SuggestionsDonationService#supportsAffinityIntent for bundleID: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v36, -1, -1);
    uint64_t v37 = v35;
    uint64_t v14 = v76;
    MEMORY[0x237DE3BF0](v37, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v42 = *(void (**)(char *, uint64_t))(v14 + 8);
  v42(v23, v13);
  id v43 = (void *)sub_2355BC550();
  char v44 = sub_235572050(v28, v29, v43);
  swift_bridgeObjectRelease();
  if (v44)
  {
    swift_bridgeObjectRelease();
    uint64_t v45 = v87;
    v83(v87, v82, v13);
    int v46 = sub_2355BCB60();
    os_log_type_t v47 = sub_2355BCF60();
    if (os_log_type_enabled(v46, v47))
    {
      os_log_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_t v48 = 0;
      _os_log_impl(&dword_23556D000, v46, v47, "SuggestionsDonationService#supportsAffinityIntent returning true for first party app.", v48, 2u);
      MEMORY[0x237DE3BF0](v48, -1, -1);
    }

    v42((char *)v45, v13);
    LOBYTE(v90) = 1;
    goto LABEL_28;
  }
  uint64_t v49 = *(void *)(v86 + 16);
  if (!v49)
  {
    swift_bridgeObjectRelease();
LABEL_24:
    char v56 = v81;
    v83((void (**)(char *, uint64_t))v81, v82, v13);
    id v57 = sub_2355BCB60();
    os_log_type_t v58 = sub_2355BCF60();
    if (os_log_type_enabled(v57, v58))
    {
      id v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v59 = 0;
      _os_log_impl(&dword_23556D000, v57, v58, "SuggestionsDonationService#supportsAffinityIntent returning false since third party app was not found in installed apps.", v59, 2u);
      MEMORY[0x237DE3BF0](v59, -1, -1);
    }

    v42(v56, v13);
    goto LABEL_27;
  }
  unint64_t v74 = v42;
  uint64_t v76 = v14;
  uint64_t v77 = a3;
  uint64_t v78 = v13;
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
  uint64_t v51 = v86 + ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80));
  id v87 = (void (**)(char *, uint64_t))(v85 + 8);
  uint64_t v52 = *(void *)(v85 + 72);
  swift_bridgeObjectRetain();
  uint64_t v53 = v88;
  while (1)
  {
    v50(v8, v51, v53);
    if (sub_2355BC100() == v28 && v29 == v54)
    {
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    char v55 = sub_2355BD2F0();
    swift_bridgeObjectRelease();
    if (v55) {
      break;
    }
    uint64_t v53 = v88;
    (*v87)(v8, v88);
    v51 += v52;
    if (!--v49)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = v78;
      uint64_t v42 = v74;
      goto LABEL_24;
    }
  }
  uint64_t v53 = v88;
LABEL_31:
  swift_bridgeObjectRelease();
  id v61 = *(void (**)(char *, char *, uint64_t))(v85 + 32);
  id v62 = v79;
  v61(v79, v8, v53);
  v61(v75, v62, v53);
  uint64_t v63 = (void *)sub_2355BC110();
  char v64 = sub_235572050(0xD00000000000001BLL, 0x80000002355BEEE0, v63);
  swift_bridgeObjectRelease();
  os_log_type_t v65 = v80;
  uint64_t v66 = v78;
  v83((void (**)(char *, uint64_t))v80, v82, v78);
  swift_bridgeObjectRetain();
  id v67 = sub_2355BCB60();
  os_log_type_t v68 = sub_2355BCF60();
  if (os_log_type_enabled(v67, v68))
  {
    uint64_t v69 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    uint64_t v90 = v70;
    *(_DWORD *)uint64_t v69 = 67109378;
    LODWORD(v89) = v64 & 1;
    sub_2355BD1B0();
    *(_WORD *)(v69 + 8) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v89 = sub_2355745F0(v28, v29, &v90);
    uint64_t v53 = v88;
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v67, v68, "SuggestionsDonationService#supportsAffinityIntent returning: %{BOOL}d for third party app: %s.", (uint8_t *)v69, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v70, -1, -1);
    MEMORY[0x237DE3BF0](v69, -1, -1);

    uint64_t v71 = v65;
    uint64_t v72 = v78;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v71 = v65;
    uint64_t v72 = v66;
  }
  v74(v71, v72);
  LOBYTE(v90) = v64 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C418);
  sub_2355BCE30();
  return ((uint64_t (*)(char *, uint64_t))*v87)(v75, v53);
}

BOOL sub_2355827A4(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_2355BD370();
  sub_2355BD380();
  uint64_t v4 = sub_2355BD390();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_235582894(uint64_t a1, void *a2)
{
  uint64_t v25 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C438);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2355BCB80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v12 = sub_2355BCB60();
  os_log_type_t v13 = sub_2355BCF50();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = v3;
    uint64_t v16 = a2;
    uint64_t v17 = v14;
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_23556D000, v12, v13, "SuggestionsDonationService#createExecutionParameters Creating execution parameters for Siri Suggestions", v14, 2u);
    uint64_t v18 = v17;
    a2 = v16;
    uint64_t v3 = v15;
    unint64_t v6 = v24;
    MEMORY[0x237DE3BF0](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v25, v3);
  unint64_t v19 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v20 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v20 + v19, v6, v3);
  aBlock[4] = sub_235585DFC;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2355833F0;
  aBlock[3] = &block_descriptor;
  uint64_t v21 = _Block_copy(aBlock);
  swift_release();
  id v22 = objc_msgSend(a2, sel_performWithCompletion_, v21);
  _Block_release(v21);
  return swift_unknownObjectRelease();
}

void sub_235582BCC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_2355BCB80();
  uint64_t v7 = *(void (***)(void, uint64_t, uint64_t))(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v64[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v64[-v11];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C440);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = &v64[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = &v64[-v17];
  uint64_t v19 = sub_2355BBEE0();
  MEMORY[0x270FA5388](v19);
  id v22 = &v64[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    os_log_type_t v79 = a2;
    id v23 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C438);
    sub_2355BCE20();
    return;
  }
  uint64_t v24 = v20;
  uint64_t v66 = v12;
  id v67 = v7;
  uint64_t v70 = v10;
  uint64_t v71 = v6;
  uint64_t v68 = a3;
  if (!a1)
  {
    LOWORD(v79) = 514;
    uint64_t v80 = 0;
    char v81 = 1;
    char v85 = 0;
    uint64_t v27 = v20;
    goto LABEL_8;
  }
  uint64_t v25 = v22;
  id v26 = objc_msgSend(a1, sel_tracklist);
  LOWORD(v79) = 514;
  uint64_t v80 = 0;
  char v81 = 1;
  char v85 = 0;
  uint64_t v27 = v24;
  if (!v26)
  {
LABEL_8:
    unsigned __int8 v33 = 1;
    char v82 = 1;
    id v83 = 0;
    char v84 = 1;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v18, 1, 1, v19);
    id v29 = 0;
    uint64_t v28 = 0;
    char v34 = 1;
    uint64_t v31 = v70;
LABEL_12:
    os_log_t v35 = v66;
    sub_23557DE84((uint64_t)v18, &qword_26880C440);
    uint64_t v36 = v67;
LABEL_13:
    id v69 = v29;
    unint64_t v37 = 0x26880C000uLL;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v38 = v71;
    uint64_t v39 = __swift_project_value_buffer(v71, (uint64_t)qword_26880D108);
    ((void (**)(uint8_t *, uint64_t, uint64_t))v36)[2](v35, v39, v38);
    os_log_type_t v40 = sub_2355BCB60();
    os_log_type_t v41 = sub_2355BCF70();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = v28;
      id v43 = v31;
      unsigned __int8 v44 = v33;
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_23556D000, v40, v41, "SuggestionsDonationService#createExecutionParameters Unable to query currently playing song.", v45, 2u);
      int v46 = v45;
      unsigned __int8 v33 = v44;
      uint64_t v31 = v43;
      uint64_t v28 = v42;
      MEMORY[0x237DE3BF0](v46, -1, -1);
    }

    ((void (*)(uint8_t *, uint64_t))v36[1])(v35, v71);
    goto LABEL_18;
  }
  uint64_t v28 = v26;
  BOOL v65 = objc_msgSend(v26, sel_shuffleType) != 0;
  char v82 = v65;
  id v29 = objc_msgSend(v28, sel_globalItemCount);
  id v83 = v29;
  char v84 = 0;
  id v30 = objc_msgSend(v28, sel_playingItemIndexPath);
  uint64_t v31 = v70;
  if (v30)
  {
    unint64_t v32 = v30;
    sub_2355BBED0();

    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v27 + 56))(v16, 0, 1, v19);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v16, 1, 1, v19);
  }
  sub_235585E98((uint64_t)v16, (uint64_t)v18);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v27 + 48))(v18, 1, v19) == 1)
  {
    unsigned __int8 v33 = 0;
    char v34 = v65;
    goto LABEL_12;
  }
  id v69 = v29;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v27 + 32))(v25, v18, v19);
  id v58 = objc_msgSend(v28, sel_items);
  id v59 = (void *)sub_2355BBEC0();
  id v60 = objc_msgSend(v58, sel_itemAtIndexPath_, v59);

  id v61 = objc_msgSend(v60, sel_metadataObject);
  if (!v61 || (id v62 = objc_msgSend(v61, sel_song), v61, !v62))
  {
    (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v25, v19);
    unsigned __int8 v33 = 0;
    os_log_t v35 = v66;
    uint64_t v36 = v67;
    char v34 = v65;
    id v29 = v69;
    goto LABEL_13;
  }
  LOBYTE(v79) = objc_msgSend(v62, sel_isDisliked);
  unsigned __int8 v63 = objc_msgSend(v62, sel_isFavorite);

  (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v25, v19);
  BYTE1(v79) = v63;
  unsigned __int8 v33 = 0;
  uint64_t v36 = v67;
  char v34 = v65;
  unint64_t v37 = 0x26880C000;
LABEL_18:
  id v67 = (void (**)(void, uint64_t, uint64_t))v28;
  if (*(void *)(v37 + 264) != -1) {
    swift_once();
  }
  uint64_t v47 = v71;
  uint64_t v48 = __swift_project_value_buffer(v71, (uint64_t)qword_26880D108);
  ((void (**)(unsigned char *, uint64_t, uint64_t))v36)[2](v31, v48, v47);
  char v49 = (char)v79;
  char v50 = BYTE1(v79);
  uint64_t v51 = sub_2355BCB60();
  os_log_type_t v52 = sub_2355BCF50();
  if (os_log_type_enabled(v51, v52))
  {
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)uint64_t v53 = 136315138;
    v78[0] = v54;
    uint64_t v66 = v53 + 4;
    LOBYTE(v72) = v49;
    BYTE1(v72) = v50;
    uint64_t v73 = 0;
    char v74 = 1;
    char v75 = v34;
    id v55 = v69;
    id v76 = v69;
    __int16 v77 = v33;
    uint64_t v56 = sub_2355BCC60();
    uint64_t v72 = sub_2355745F0(v56, v57, v78);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v51, v52, "SuggestionsDonationService#createExecutionParameters Created execution parameters: %s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v54, -1, -1);
    MEMORY[0x237DE3BF0](v53, -1, -1);

    ((void (*)(unsigned char *, uint64_t))v36[1])(v70, v71);
  }
  else
  {

    ((void (*)(unsigned char *, uint64_t))v36[1])(v31, v71);
    id v55 = v69;
  }
  swift_beginAccess();
  LOWORD(v72) = (_WORD)v79;
  uint64_t v73 = 0;
  char v74 = 1;
  char v75 = v34;
  id v76 = v55;
  __int16 v77 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C438);
  sub_2355BCE30();
}

void sub_2355833F0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t sub_23558347C(uint64_t a1)
{
  uint64_t v2 = sub_2355BD1E0();
  return sub_2355835C0(a1, v2);
}

unint64_t sub_2355834C0(char a1)
{
  sub_2355BD370();
  sub_2355A35C0(a1);
  sub_2355BCCA0();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_2355BD390();
  return sub_235583688(a1, v2);
}

unint64_t sub_235583548(uint64_t a1, uint64_t a2)
{
  sub_2355BD370();
  sub_2355BCCA0();
  uint64_t v4 = sub_2355BD390();
  return sub_235583B6C(a1, a2, v4);
}

unint64_t sub_2355835C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_235585F58(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x237DE3540](v9, a1);
      sub_235585FB4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_235583688(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x80000002355BE720;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x6E69666661736964;
          unint64_t v7 = 0xEB00000000797469;
          break;
        case 2:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 2036427888;
          break;
        case 3:
          unint64_t v8 = 0x646F504179616C70;
          unint64_t v7 = 0xEC00000074736163;
          break;
        case 4:
          break;
        case 5:
          unint64_t v8 = 0x6973754D79616C70;
          unint64_t v7 = 0xE900000000000063;
          break;
        case 6:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x5979425879616C70;
          break;
        case 7:
          unint64_t v8 = 0x6974724179616C70;
          unint64_t v7 = 0xEA00000000007473;
          break;
        case 8:
          unint64_t v7 = 0xE90000000000006FLL;
          unint64_t v8 = 0x6964615279616C70;
          break;
        case 9:
          unint64_t v7 = 0xEC0000007473696CLL;
          unint64_t v8 = 0x79616C5079616C70;
          break;
        case 0xA:
          unint64_t v8 = 0x4E65685479616C70;
          unint64_t v7 = 0xEB00000000737765;
          break;
        case 0xB:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x6572616873;
          break;
        case 0xC:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x656C6666756873;
          break;
        case 0xD:
          unint64_t v8 = 0x676E6F5374616877;
          unint64_t v7 = 0xEE00736968547349;
          break;
        default:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x7974696E69666661;
          break;
      }
      unint64_t v9 = 0x80000002355BE720;
      unint64_t v10 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          uint64_t v11 = 0x6E69666661736964;
          uint64_t v12 = 7959657;
          goto LABEL_36;
        case 2:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 2036427888) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 3:
          unint64_t v9 = 0xEC00000074736163;
          if (v8 != 0x646F504179616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 4:
          goto LABEL_41;
        case 5:
          unint64_t v9 = 0xE900000000000063;
          if (v8 != 0x6973754D79616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 6:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x5979425879616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 7:
          unint64_t v9 = 0xEA00000000007473;
          if (v8 != 0x6974724179616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 8:
          unint64_t v9 = 0xE90000000000006FLL;
          if (v8 != 0x6964615279616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 9:
          unint64_t v9 = 0xEC0000007473696CLL;
          if (v8 != 0x79616C5079616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 10:
          uint64_t v11 = 0x4E65685479616C70;
          uint64_t v12 = 7567205;
LABEL_36:
          unint64_t v9 = v12 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          if (v8 != v11) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 11:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x6572616873) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 12:
          unint64_t v9 = 0xE700000000000000;
          unint64_t v10 = 0x656C6666756873;
LABEL_41:
          if (v8 == v10) {
            goto LABEL_42;
          }
          goto LABEL_43;
        case 13:
          unint64_t v9 = 0xEE00736968547349;
          if (v8 != 0x676E6F5374616877) {
            goto LABEL_43;
          }
          goto LABEL_42;
        default:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x7974696E69666661) {
            goto LABEL_43;
          }
LABEL_42:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_43:
          char v13 = sub_2355BD2F0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v13) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_235583B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2355BD2F0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2355BD2F0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_235583C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[11] = a5;
  v6[12] = a6;
  v6[9] = a2;
  v6[10] = a3;
  v6[8] = a1;
  uint64_t v8 = sub_2355BC240();
  v6[13] = v8;
  v6[14] = *(void *)(v8 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  uint64_t v9 = sub_2355BC1E0();
  v6[17] = v9;
  v6[18] = *(void *)(v9 - 8);
  v6[19] = swift_task_alloc();
  uint64_t v10 = sub_2355BCB50();
  v6[20] = v10;
  v6[21] = *(void *)(v10 - 8);
  v6[22] = swift_task_alloc();
  uint64_t v11 = sub_2355BCA40();
  v6[23] = v11;
  v6[24] = *(void *)(v11 - 8);
  v6[25] = swift_task_alloc();
  uint64_t v12 = sub_2355BCB80();
  v6[26] = v12;
  v6[27] = *(void *)(v12 - 8);
  v6[28] = swift_task_alloc();
  v6[29] = swift_task_alloc();
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C450);
  v6[33] = swift_task_alloc();
  uint64_t v13 = sub_2355BBE90();
  v6[34] = v13;
  v6[35] = *(void *)(v13 - 8);
  v6[36] = swift_task_alloc();
  uint64_t v14 = *(void *)(a5 - 8);
  v6[37] = v14;
  v6[38] = swift_task_alloc();
  (*(void (**)(void))(v14 + 16))();
  return MEMORY[0x270FA2498](sub_235583FD8, 0, 0);
}

uint64_t sub_235583FD8()
{
  id v98 = v0;
  uint64_t v1 = v0;
  if (!v0[10])
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v13 = v0[32];
    uint64_t v14 = v0[26];
    uint64_t v15 = v0[27];
    uint64_t v16 = __swift_project_value_buffer(v1[26], (uint64_t)qword_26880D108);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v16, v14);
    uint64_t v9 = sub_2355BCB60();
    os_log_type_t v17 = sub_2355BCF70();
    if (os_log_type_enabled(v9, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_23556D000, v9, v17, "SuggestionsDonationProvider#donateIntentForEngagement Unable to get requestId. Not donating engagement to SiriSuggestions", v18, 2u);
      MEMORY[0x237DE3BF0](v18, -1, -1);
    }
    uint64_t v12 = v1[32];
    goto LABEL_13;
  }
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[35];
  uint64_t v4 = v1[33];
  sub_2355BBE80();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    sub_23557DE84(v1[33], &qword_26880C450);
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v5 = v1[31];
    uint64_t v6 = v1[26];
    uint64_t v7 = v1[27];
    uint64_t v8 = __swift_project_value_buffer(v6, (uint64_t)qword_26880D108);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
    uint64_t v9 = sub_2355BCB60();
    os_log_type_t v10 = sub_2355BCF70();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_23556D000, v9, v10, "SuggestionsDonationProvider#donateIntentForEngagement Unable to convert requestId to UUID. Not donating engagement to SiriSuggestions", v11, 2u);
      MEMORY[0x237DE3BF0](v11, -1, -1);
    }
    uint64_t v12 = v1[31];
LABEL_13:
    uint64_t v19 = v1[26];
    uint64_t v20 = v1[27];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v12, v19);
LABEL_14:
    (*(void (**)(void, void))(v1[37] + 8))(v1[38], v1[11]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v1[1];
    return v21();
  }
  id v23 = (id *)(v1 + 8);
  (*(void (**)(void, void, void))(v1[35] + 32))(v1[36], v1[33], v1[34]);
  self;
  uint64_t v24 = swift_dynamicCastObjCClass();
  if (!v24)
  {
    self;
    uint64_t v29 = swift_dynamicCastObjCClass();
    if (!v29)
    {
LABEL_51:
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v74 = v1[27];
      uint64_t v75 = v1[28];
      uint64_t v76 = v1[26];
      uint64_t v77 = __swift_project_value_buffer(v76, (uint64_t)qword_26880D108);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(v75, v77, v76);
      uint64_t v78 = sub_2355BCB60();
      os_log_type_t v79 = sub_2355BCF50();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v80 = 0;
        _os_log_impl(&dword_23556D000, v78, v79, "SuggestionsDonationProvider#donateIntentForEngagement Unable to match intent to a SiriSuggestion. Not donating an engagement", v80, 2u);
        MEMORY[0x237DE3BF0](v80, -1, -1);
      }
      uint64_t v82 = v1[35];
      uint64_t v81 = v1[36];
      uint64_t v83 = v1[34];
      uint64_t v85 = v1[27];
      uint64_t v84 = v1[28];
      uint64_t v86 = v1[26];

      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v84, v86);
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v81, v83);
      goto LABEL_14;
    }
    id v30 = (void *)v29;
    id v31 = *v23;
    id v32 = objc_msgSend(v30, sel_mediaItems);
    if (!v32) {
      goto LABEL_49;
    }
    id v27 = v32;
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    unint64_t v33 = sub_2355BCDB0();

    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_2355BD280();
      swift_bridgeObjectRelease();
      if (v94)
      {
LABEL_26:
        if ((v33 & 0xC000000000000001) != 0)
        {
          id v34 = (id)MEMORY[0x237DE35A0](0, v33);
        }
        else
        {
          if (!*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_77;
          }
          id v34 = *(id *)(v33 + 32);
        }
        id v27 = v34;
        swift_bridgeObjectRelease();
        id v35 = objc_msgSend(v27, sel_identifier);
        if (v35)
        {
          uint64_t v36 = v35;
          sub_2355BCC50();

          sub_2355BC250();
          swift_allocObject();
          if (sub_2355BC260())
          {
            uint64_t v38 = v1[18];
            uint64_t v37 = v1[19];
            uint64_t v39 = v1[17];
            uint64_t v40 = v1[14];
            uint64_t v95 = v1[15];
            uint64_t v41 = v1[13];
            sub_2355BC1F0();
            sub_2355BC1D0();
            (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
            (*(void (**)(uint64_t, void, uint64_t))(v40 + 104))(v95, *MEMORY[0x263F6CAD0], v41);
            sub_235585F00(&qword_26880C458, MEMORY[0x263F6CAF8]);
            sub_2355BCD70();
            sub_2355BCD70();
            uint64_t v42 = v1[15];
            uint64_t v43 = v1[16];
            uint64_t v45 = v1[13];
            uint64_t v44 = v1[14];
            if (v1[2] == v1[4] && v1[3] == v1[5])
            {
              swift_bridgeObjectRelease_n();
              int v46 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
              v46(v42, v45);
              v46(v43, v45);
LABEL_57:
              if (qword_26880C130 != -1) {
                swift_once();
              }
              id v89 = *v23;
              unint64_t v47 = sub_2355A35C0(word_26880D2F0);
              unint64_t v49 = v90;

              swift_release();
              goto LABEL_39;
            }
            char v87 = sub_2355BD2F0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
            v88(v42, v45);
            v88(v43, v45);
            if (v87) {
              goto LABEL_57;
            }
            swift_release();
          }
        }
        if (objc_msgSend(v27, sel_type) != (id)20 && objc_msgSend(v27, sel_type) != (id)6)
        {
          if (qword_26880C100 != -1) {
            swift_once();
          }
          if (!sub_2355827A4((uint64_t)objc_msgSend(v27, sel_type), qword_26880D100))
          {

            goto LABEL_50;
          }
          if (qword_26880C138 != -1) {
            swift_once();
          }
          id v91 = *v23;
          char v92 = word_26880D3A8;
LABEL_65:
          unint64_t v47 = sub_2355A35C0(v92);
          unint64_t v49 = v93;

          goto LABEL_39;
        }
        if (qword_26880C140 == -1)
        {
LABEL_64:
          id v91 = *v23;
          char v92 = word_26880D460;
          goto LABEL_65;
        }
LABEL_77:
        swift_once();
        goto LABEL_64;
      }
    }
    else if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_26;
    }
    id v27 = *v23;
    swift_bridgeObjectRelease();
    goto LABEL_50;
  }
  uint64_t v25 = (void *)v24;
  id v26 = (id)v1[8];
  if (objc_msgSend(v25, sel_affinityType) != (id)1)
  {
    if (objc_msgSend(v25, sel_affinityType) == (id)2)
    {
      if (qword_26880C128 != -1) {
        swift_once();
      }
      id v27 = *v23;
      char v28 = word_26880D238;
      goto LABEL_38;
    }
LABEL_49:
    id v27 = *v23;
LABEL_50:

    goto LABEL_51;
  }
  if (qword_26880C120 != -1) {
    swift_once();
  }
  id v27 = *v23;
  char v28 = word_26880D180;
LABEL_38:
  unint64_t v47 = sub_2355A35C0(v28);
  unint64_t v49 = v48;
LABEL_39:

  swift_bridgeObjectRetain();
  sub_23557FB38(MEMORY[0x263F8EE78]);
  sub_2355BCA30();
  sub_2355BD140();
  if (qword_26880C118 != -1) {
    swift_once();
  }
  uint64_t v50 = v1[21];
  uint64_t v51 = v1[22];
  uint64_t v52 = v1[20];
  sub_2355BCB40();
  sub_2355BCB10();
  uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
  v1[39] = v53;
  v1[40] = (v50 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v53(v51, v52);
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v54 = v1[30];
  uint64_t v55 = v1[26];
  uint64_t v56 = v1[27];
  uint64_t v57 = __swift_project_value_buffer(v55, (uint64_t)qword_26880D108);
  v1[41] = v57;
  id v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16);
  v1[42] = v58;
  v1[43] = (v56 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v58(v54, v57, v55);
  swift_bridgeObjectRetain();
  id v59 = sub_2355BCB60();
  os_log_type_t v60 = sub_2355BCF50();
  BOOL v61 = os_log_type_enabled(v59, v60);
  uint64_t v62 = v1[30];
  uint64_t v64 = v1[26];
  uint64_t v63 = v1[27];
  if (v61)
  {
    uint64_t v96 = v1[30];
    BOOL v65 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = v47;
    uint64_t v67 = swift_slowAlloc();
    uint64_t v97 = v67;
    *(_DWORD *)BOOL v65 = 136315138;
    swift_bridgeObjectRetain();
    v1[7] = sub_2355745F0(v66, v49, &v97);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v59, v60, "Submitting engagement for actionId: %s", v65, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v67, -1, -1);
    MEMORY[0x237DE3BF0](v65, -1, -1);

    uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v68(v96, v64);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v68(v62, v64);
  }
  v1[44] = v68;
  id v69 = (void *)swift_task_alloc();
  v1[45] = v69;
  *id v69 = v1;
  v69[1] = sub_235584CF0;
  uint64_t v70 = v1[36];
  uint64_t v71 = v1[11];
  uint64_t v72 = v1[12];
  uint64_t v73 = v1[25];
  return MEMORY[0x270F716A0](v73, v70, v71, v72);
}

uint64_t sub_235584CF0()
{
  *(void *)(*(void *)v1 + 368) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_235584FCC;
  }
  else {
    uint64_t v2 = sub_235584E04;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_235584E04()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[39];
  uint64_t v2 = v0[35];
  uint64_t v11 = v0[36];
  uint64_t v10 = v0[34];
  uint64_t v4 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v6 = v0[22];
  uint64_t v5 = v0[23];
  uint64_t v7 = v0[20];
  sub_2355BD130();
  sub_2355BCB40();
  sub_2355BCB20();
  v1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v11, v10);
  (*(void (**)(void, void))(v0[37] + 8))(v0[38], v0[11]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_235584FCC()
{
  uint64_t v1 = *(void **)(v0 + 368);
  char v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
  uint64_t v27 = *(void *)(v0 + 328);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v6 = *(void *)(v0 + 160);
  sub_2355BD130();
  sub_2355BCB40();
  sub_2355BCB20();
  v2(v5, v6);
  v28(v3, v27, v4);
  id v7 = v1;
  id v8 = v1;
  uint64_t v9 = sub_2355BCB60();
  os_log_type_t v10 = sub_2355BCF70();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void **)(v0 + 368);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v15;
    sub_2355BD1B0();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_23556D000, v9, v10, "SuggestionsDonationProvider#donateIntentForEngagement Error donating engagement to SiriSuggestions: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v13, -1, -1);
    MEMORY[0x237DE3BF0](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 368);
  }
  os_log_type_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
  uint64_t v18 = *(void *)(v0 + 280);
  uint64_t v29 = *(void *)(v0 + 288);
  uint64_t v19 = *(void *)(v0 + 272);
  uint64_t v20 = *(void *)(v0 + 232);
  uint64_t v21 = *(void *)(v0 + 208);
  uint64_t v22 = *(void *)(v0 + 192);
  uint64_t v23 = *(void *)(v0 + 200);
  uint64_t v24 = *(void *)(v0 + 184);

  v17(v20, v21);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v29, v19);
  (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

ValueMetadata *type metadata accessor for SuggestionsDonationProvider()
{
  return &type metadata for SuggestionsDonationProvider;
}

uint64_t sub_235585334(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C470);
    uint64_t v3 = sub_2355BD210();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      uint64_t v7 = *(void *)(v6 + 8 * v4);
      sub_2355BD370();
      sub_2355BD380();
      uint64_t result = sub_2355BD390();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(void *)(v14 + 8 * v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(void *)(v14 + 8 * v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(void *)(v14 + 8 * v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_235585478(uint64_t a1, uint64_t a2)
{
  v2[14] = a1;
  v2[15] = a2;
  uint64_t v3 = sub_2355BCB50();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_235585538, 0, 0);
}

uint64_t sub_235585538()
{
  sub_2355BD140();
  if (qword_26880C118 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = (void *)v0[15];
  uint64_t v4 = v0[16];
  sub_2355BCB40();
  uint64_t v22 = MEMORY[0x263F8EE78];
  LOBYTE(v21) = 2;
  sub_2355BCB10();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[19] = v5;
  v0[20] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v4);
  objc_msgSend(v3, sel_setTracklistRange_, 1, 1, 21, v21, v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C428);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2355BDD10;
  *(void *)(inited + 32) = sub_2355BCC50();
  *(void *)(inited + 40) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1E0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2355BDFC0;
  *(void *)(v8 + 32) = sub_2355BCC50();
  *(void *)(v8 + 40) = v9;
  *(void *)(v8 + 48) = sub_2355BCC50();
  *(void *)(v8 + 56) = v10;
  *(void *)(v8 + 64) = sub_2355BCC50();
  *(void *)(v8 + 72) = v11;
  uint64_t v12 = (void *)sub_2355BCD90();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_propertySetWithProperties_, v12);

  *(void *)(inited + 48) = v13;
  sub_23557FC5C(inited);
  id v14 = objc_allocWithZone(MEMORY[0x263F12180]);
  sub_23557DC00(0, &qword_26880C430);
  uint64_t v15 = (void *)sub_2355BCC20();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v14, sel_initWithProperties_relationships_, 0, v15);
  v0[21] = v16;

  id v17 = v16;
  objc_msgSend(v3, sel_setPlayingItemProperties_, v17);
  objc_msgSend(v3, sel_setQueueItemProperties_, v17);

  uint64_t v18 = swift_task_alloc();
  v0[22] = v18;
  *(void *)(v18 + 16) = v3;
  uint64_t v19 = (void *)swift_task_alloc();
  v0[23] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_2355858C0;
  return MEMORY[0x270FA2360](v0 + 9, 0, 0, 0xD000000000000020, 0x80000002355BEF20, sub_235585D60, v18, &type metadata for AudioSuggestionsExecutionParameters);
}

uint64_t sub_2355858C0()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_235585B18;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2355859DC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2355859DC()
{
  uint64_t v1 = *(void *)(v0 + 144);
  id v13 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);

  __int16 v4 = *(_WORD *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 80);
  char v6 = *(unsigned char *)(v0 + 88);
  char v7 = *(unsigned char *)(v0 + 89);
  uint64_t v12 = *(void *)(v0 + 96);
  char v10 = *(unsigned char *)(v0 + 105);
  char v11 = *(unsigned char *)(v0 + 104);
  sub_2355BD130();
  sub_2355BCB40();
  sub_2355BCB20();
  v13(v1, v2);
  swift_task_dealloc();
  *(_WORD *)uint64_t v3 = v4;
  *(void *)(v3 + 8) = v5;
  *(unsigned char *)(v3 + 16) = v6;
  *(unsigned char *)(v3 + 17) = v7;
  *(void *)(v3 + 24) = v12;
  *(unsigned char *)(v3 + 32) = v11;
  *(unsigned char *)(v3 + 33) = v10;
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_235585B18()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);

  swift_task_dealloc();
  sub_2355BD130();
  sub_2355BCB40();
  sub_2355BCB20();
  v1(v2, v3);
  swift_task_dealloc();
  __int16 v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_235585BF8(uint64_t a1)
{
  return sub_235581AA0(a1, *(void **)(v1 + 16));
}

_OWORD *sub_235585C00(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_235585C18()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C418);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_235585CE8(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26880C418) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_235581DD8(a1, v4, v5);
}

uint64_t sub_235585D60(uint64_t a1)
{
  return sub_235582894(a1, *(void **)(v1 + 16));
}

uint64_t sub_235585D68()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C438);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_235585DFC(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26880C438) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  sub_235582BCC(a1, a2, v6);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_235585E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235585F00(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_235585F48(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_235585F58(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_235585FB4(uint64_t a1)
{
  return a1;
}

id INSearchForMediaAppIntentHandler.__allocating_init(featureFlagProvider:appIntentInvoker:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  sub_235574CD0(a1, (uint64_t)v5 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider);
  sub_235574CD0(a2, (uint64_t)v5 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
  v8.receiver = v5;
  v8.super_class = v2;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v6;
}

id INSearchForMediaAppIntentHandler.init(featureFlagProvider:appIntentInvoker:)(uint64_t a1, uint64_t a2)
{
  sub_235574CD0(a1, (uint64_t)v2 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider);
  sub_235574CD0(a2, (uint64_t)v2 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for INSearchForMediaAppIntentHandler();
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v5;
}

uint64_t type metadata accessor for INSearchForMediaAppIntentHandler()
{
  return self;
}

uint64_t INSearchForMediaAppIntentHandler.resolveMediaItems(for:)(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_26880C4A8 + dword_26880C4A8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2355861F4;
  return v5(a1);
}

uint64_t sub_2355861F4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_23558646C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  char v10 = (uint64_t (*)(uint64_t))((char *)&dword_26880C4A8 + dword_26880C4A8);
  id v6 = a1;
  id v7 = a3;
  objc_super v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *objc_super v8 = v3;
  v8[1] = sub_235586540;
  return v10((uint64_t)v6);
}

uint64_t sub_235586540()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  long long v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
  uint64_t v4 = (void *)sub_2355BCD90();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v4);

  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t INSearchForMediaAppIntentHandler.handle(intent:)(uint64_t a1)
{
  v2[27] = a1;
  v2[28] = v1;
  uint64_t v3 = sub_2355BCB80();
  v2[29] = v3;
  v2[30] = *(void *)(v3 - 8);
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23558684C, 0, 0);
}

uint64_t sub_23558684C()
{
  v178 = v0;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[30];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26880D108);
  v0[47] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[48] = v5;
  v0[49] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  id v6 = sub_2355BCB60();
  os_log_type_t v7 = sub_2355BCF60();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_23556D000, v6, v7, "INSearchForMediaAppIntentHandler#handle ...", v8, 2u);
    MEMORY[0x237DE3BF0](v8, -1, -1);
  }
  uint64_t v175 = v0;
  char v10 = v0 + 27;
  uint64_t v9 = (void *)v0[27];
  uint64_t v11 = v0[46];
  id v13 = (void *)v0[29];
  uint64_t v12 = v0[30];

  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v10[23] = v14;
  v10[24] = (v12 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v176 = v14;
  v14(v11, (uint64_t)v13);
  id v15 = objc_msgSend(v9, sel_mediaItems);
  if (!v15) {
    goto LABEL_40;
  }
  id v16 = v15;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v17 = sub_2355BCDB0();

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_2355BD280();
    swift_bridgeObjectRelease();
    if (v77) {
      goto LABEL_8;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_39;
  }
LABEL_8:
  if ((v17 & 0xC000000000000001) != 0)
  {
    id v18 = (id)MEMORY[0x237DE35A0](0, v17);
  }
  else
  {
    if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_79;
    }
    id v18 = *(id *)(v17 + 32);
  }
  uint64_t v19 = v18;
  v175[52] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_2355BCF90();
  char v21 = sub_235571FEC((uint64_t)objc_msgSend(v19, sel_type), v20);
  swift_bridgeObjectRelease();
  if (v21)
  {
    v5(v175[45], v4, v175[29]);
    uint64_t v22 = sub_2355BCB60();
    os_log_type_t v23 = sub_2355BCF60();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_23556D000, v22, v23, "INSearchForMediaAppIntentHandler#handle using Podcasts open intent", v24, 2u);
      MEMORY[0x237DE3BF0](v24, -1, -1);
    }
    uint64_t v25 = v175[45];
    uint64_t v26 = v175[29];

    v176(v25, v26);
    id v27 = objc_msgSend(v19, sel_identifier);
    if (v27)
    {
      char v28 = v27;
      uint64_t v29 = sub_2355BCC50();
      unint64_t v31 = v30;

      v175[53] = v31;
      id v32 = objc_msgSend(v19, sel_type);
      if (v32 == (id)7)
      {
        unint64_t v48 = v175;
        v5(v175[43], v4, v175[29]);
        swift_bridgeObjectRetain_n();
        unint64_t v49 = sub_2355BCB60();
        os_log_type_t v50 = sub_2355BCF60();
        BOOL v51 = os_log_type_enabled(v49, v50);
        uint64_t v52 = v175[43];
        uint64_t v53 = v175[29];
        if (v51)
        {
          uint64_t v166 = v175[43];
          uint64_t v54 = (uint8_t *)swift_slowAlloc();
          uint64_t v55 = swift_slowAlloc();
          uint64_t v177 = v55;
          *(_DWORD *)uint64_t v54 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v56 = v29;
          v175[25] = sub_2355745F0(v29, v31, &v177);
          unint64_t v48 = v175;
          sub_2355BD1B0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_23556D000, v49, v50, "INSearchForMediaAppIntentHandler#handle invoking OpenPodcastEpisodeAppIntent with identifier: %s", v54, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v55, -1, -1);
          MEMORY[0x237DE3BF0](v54, -1, -1);

          v176(v166, v53);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v176(v52, v53);
          uint64_t v56 = v29;
        }
        uint64_t v72 = (void *)(v48[28] + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
        uint64_t v73 = v72[3];
        uint64_t v74 = v72[4];
        __swift_project_boxed_opaque_existential_1(v72, v73);
        uint64_t v75 = (void *)swift_task_alloc();
        v48[56] = v75;
        void *v75 = v48;
        v75[1] = sub_2355880B8;
        return MEMORY[0x270F63F38](v56, v31, v73, v74);
      }
      else
      {
        if (v32 == (id)6)
        {
          unint64_t v33 = v175;
          v5(v175[44], v4, v175[29]);
          swift_bridgeObjectRetain_n();
          id v34 = sub_2355BCB60();
          os_log_type_t v35 = sub_2355BCF60();
          BOOL v36 = os_log_type_enabled(v34, v35);
          uint64_t v37 = v175[44];
          uint64_t v38 = v175[29];
          uint64_t v39 = v29;
          if (v36)
          {
            uint64_t v172 = v175[44];
            uint64_t v40 = (uint8_t *)swift_slowAlloc();
            uint64_t v41 = swift_slowAlloc();
            uint64_t v177 = v41;
            *(_DWORD *)uint64_t v40 = 136315138;
            swift_bridgeObjectRetain();
            v175[26] = sub_2355745F0(v39, v31, &v177);
            unint64_t v33 = v175;
            sub_2355BD1B0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_23556D000, v34, v35, "INSearchForMediaAppIntentHandler#handle invoking OpenPodcastShowAppIntent with identifier: %s", v40, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x237DE3BF0](v41, -1, -1);
            MEMORY[0x237DE3BF0](v40, -1, -1);

            uint64_t v42 = v172;
          }
          else
          {
            swift_bridgeObjectRelease_n();

            uint64_t v42 = v37;
          }
          v176(v42, v38);
          uint64_t v67 = (void *)(v33[28]
                         + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
          uint64_t v68 = v67[3];
          uint64_t v69 = v67[4];
          __swift_project_boxed_opaque_existential_1(v67, v68);
          uint64_t v70 = (void *)swift_task_alloc();
          v33[54] = v70;
          *uint64_t v70 = v33;
          uint64_t v71 = sub_235587E2C;
        }
        else
        {
          uint64_t v57 = v175;
          v5(v175[42], v4, v175[29]);
          swift_bridgeObjectRetain_n();
          id v58 = sub_2355BCB60();
          os_log_type_t v59 = sub_2355BCF60();
          BOOL v60 = os_log_type_enabled(v58, v59);
          uint64_t v61 = v175[42];
          uint64_t v62 = v175[29];
          uint64_t v39 = v29;
          if (v60)
          {
            uint64_t v169 = v175[42];
            uint64_t v63 = (uint8_t *)swift_slowAlloc();
            uint64_t v64 = swift_slowAlloc();
            uint64_t v177 = v64;
            *(_DWORD *)uint64_t v63 = 136315138;
            swift_bridgeObjectRetain();
            v175[24] = sub_2355745F0(v29, v31, &v177);
            uint64_t v57 = v175;
            sub_2355BD1B0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_23556D000, v58, v59, "INSearchForMediaAppIntentHandler#handle mediaType is not podcastShow or podcastEpisode, defaulting to invoke OpenPodcastShowAppIntent with identifier: %s", v63, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x237DE3BF0](v64, -1, -1);
            MEMORY[0x237DE3BF0](v63, -1, -1);

            uint64_t v66 = v62;
            uint64_t v65 = v169;
          }
          else
          {
            swift_bridgeObjectRelease_n();

            uint64_t v65 = v61;
            uint64_t v66 = v62;
          }
          v176(v65, v66);
          uint64_t v76 = (void *)(v57[28]
                         + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
          uint64_t v68 = v76[3];
          uint64_t v69 = v76[4];
          __swift_project_boxed_opaque_existential_1(v76, v68);
          uint64_t v70 = (void *)swift_task_alloc();
          v57[58] = v70;
          *uint64_t v70 = v57;
          uint64_t v71 = sub_2355881E8;
        }
        v70[1] = v71;
        return MEMORY[0x270F63F30](v39, v31, v68, v69);
      }
    }
    v5(v175[41], v4, v175[29]);
    uint64_t v43 = sub_2355BCB60();
    os_log_type_t v44 = sub_2355BCF70();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_23556D000, v43, v44, "INSearchForMediaAppIntentHandler#handle failed to get identifier from mediaItem", v45, 2u);
      MEMORY[0x237DE3BF0](v45, -1, -1);
    }
    uint64_t v46 = v175[41];
    uint64_t v47 = v175[29];

    v176(v46, v47);
    id v165 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);

    id v13 = v175;
    goto LABEL_85;
  }

LABEL_40:
  id v13 = v175;
  __swift_project_boxed_opaque_existential_1((void *)(v175[28] + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider), *(void *)(v175[28] + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider + 24));
  char v78 = sub_2355BC6E0();
  uint64_t v79 = v175[29];
  if ((v78 & 1) == 0)
  {
    v5(v175[37], v4, v79);
    uint64_t v113 = sub_2355BCB60();
    os_log_type_t v114 = sub_2355BCF60();
    if (os_log_type_enabled(v113, v114))
    {
      id v115 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v115 = 0;
      _os_log_impl(&dword_23556D000, v113, v114, "INSearchForMediaAppIntentHandler#handle using SearchForMusicIntent", v115, 2u);
      MEMORY[0x237DE3BF0](v115, -1, -1);
    }
    uint64_t v116 = v175[37];
    uint64_t v117 = v175[29];
    uint64_t v118 = (void *)v175[27];

    v176(v116, v117);
    id v119 = objc_msgSend(v118, sel_mediaSearch);
    v175[63] = v119;
    if (!v119)
    {
      v5(v175[34], v4, v175[29]);
      os_log_type_t v141 = sub_2355BCB60();
      os_log_type_t v142 = sub_2355BCF70();
      if (os_log_type_enabled(v141, v142))
      {
        uint64_t v143 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v143 = 0;
        _os_log_impl(&dword_23556D000, v141, v142, "INSearchForMediaAppIntentHandler#handle mediaSearch is nil", v143, 2u);
        MEMORY[0x237DE3BF0](v143, -1, -1);
      }
      uint64_t v144 = v175[34];
      goto LABEL_84;
    }
    uint64_t v120 = v119;
    uint64_t v121 = sub_2355BCF10();
    v175[64] = v122;
    uint64_t v123 = v175[29];
    if (!v122)
    {
      v5(v175[35], v4, v175[29]);
      uint64_t v145 = sub_2355BCB60();
      os_log_type_t v146 = sub_2355BCF70();
      if (os_log_type_enabled(v145, v146))
      {
        unint64_t v147 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v147 = 0;
        _os_log_impl(&dword_23556D000, v145, v146, "INSearchForMediaAppIntentHandler#handle failed to get criteria from mediaSearch", v147, 2u);
        MEMORY[0x237DE3BF0](v147, -1, -1);
      }
      uint64_t v148 = v175[35];
      uint64_t v149 = v175[29];

      v176(v148, v149);
      id v165 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);

      goto LABEL_85;
    }
    unint64_t v124 = v122;
    uint64_t v174 = v121;
    uint64_t v125 = v175[36];
    id v126 = objc_msgSend(v120, sel_reference);
    v175[65] = v126;
    uint64_t v127 = 0x7972617262696CLL;
    if (v126 != (id)2) {
      uint64_t v127 = 0;
    }
    uint64_t v171 = v127;
    if (v126 == (id)2) {
      unint64_t v128 = 0xE700000000000000;
    }
    else {
      unint64_t v128 = 0;
    }
    id v129 = objc_msgSend(v120, sel_mediaType);
    v5(v125, v4, v123);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v130 = sub_2355BCB60();
    os_log_type_t v131 = sub_2355BCF60();
    BOOL v132 = os_log_type_enabled(v130, v131);
    uint64_t v133 = v175[36];
    uint64_t v134 = v175[29];
    if (v132)
    {
      id v168 = v129;
      uint64_t v135 = swift_slowAlloc();
      uint64_t v164 = swift_slowAlloc();
      uint64_t v177 = v164;
      *(_DWORD *)uint64_t v135 = 136315650;
      swift_bridgeObjectRetain();
      v175[13] = sub_2355745F0(v174, v124, &v177);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v135 + 12) = 2080;
      v175[11] = v171;
      v175[12] = v128;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
      uint64_t v136 = sub_2355BCC60();
      v175[14] = sub_2355745F0(v136, v137, &v177);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v135 + 22) = 2080;
      v175[15] = v168;
      type metadata accessor for INMediaItemType(0);
      uint64_t v138 = sub_2355BCC60();
      v175[16] = sub_2355745F0(v138, v139, &v177);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v130, v131, "INSearchForMediaAppIntentHandler#handle invoking SearchMusicAppIntent with criteria: %s, searchSource: %s, and mediaType: %s", (uint8_t *)v135, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v164, -1, -1);
      uint64_t v140 = v135;
      id v129 = v168;
      MEMORY[0x237DE3BF0](v140, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v176(v133, v134);
    os_log_type_t v150 = (void *)(v175[28] + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
    uint64_t v151 = v150[3];
    uint64_t v152 = v150[4];
    __swift_project_boxed_opaque_existential_1(v150, v151);
    uint64_t v153 = (void *)swift_task_alloc();
    v175[66] = v153;
    *uint64_t v153 = v175;
    v153[1] = sub_235588588;
    uint64_t v90 = v171;
    uint64_t v88 = v174;
    unint64_t v89 = v124;
    unint64_t v91 = v128;
    id v92 = v129;
    uint64_t v93 = 0;
    uint64_t v94 = v151;
    uint64_t v95 = v152;
    return MEMORY[0x270F63F28](v88, v89, v90, v91, v92, v93, v94, v95);
  }
  v5(v175[40], v4, v79);
  uint64_t v80 = sub_2355BCB60();
  os_log_type_t v81 = sub_2355BCF60();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v82 = 0;
    _os_log_impl(&dword_23556D000, v80, v81, "INSearchForMediaAppIntentHandler#handle using OpenMusicItemIntent", v82, 2u);
    MEMORY[0x237DE3BF0](v82, -1, -1);
  }
  uint64_t v83 = v175[40];
  uint64_t v84 = v175[29];
  uint64_t v85 = (void *)v175[27];

  v176(v83, v84);
  id v86 = objc_msgSend(v85, sel_mediaItems);
  if (!v86) {
    goto LABEL_81;
  }
  char v87 = v86;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v17 = sub_2355BCDB0();

  if (!(v17 >> 62))
  {
    if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_46;
    }
LABEL_80:
    swift_bridgeObjectRelease();
    goto LABEL_81;
  }
LABEL_79:
  swift_bridgeObjectRetain();
  uint64_t v158 = sub_2355BD280();
  uint64_t v88 = swift_bridgeObjectRelease();
  if (!v158) {
    goto LABEL_80;
  }
LABEL_46:
  if ((v17 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v96 = *(id *)(v17 + 32);
      goto LABEL_49;
    }
    __break(1u);
    return MEMORY[0x270F63F28](v88, v89, v90, v91, v92, v93, v94, v95);
  }
  id v96 = (id)MEMORY[0x237DE35A0](0, v17);
LABEL_49:
  uint64_t v97 = v96;
  swift_bridgeObjectRelease();
  id v98 = objc_msgSend(v97, sel_identifier);

  if (!v98)
  {
LABEL_81:
    v5(v13[38], v4, v13[29]);
    os_log_type_t v141 = sub_2355BCB60();
    os_log_type_t v159 = sub_2355BCF70();
    if (os_log_type_enabled(v141, v159))
    {
      uint64_t v160 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v160 = 0;
      _os_log_impl(&dword_23556D000, v141, v159, "INSearchForMediaAppIntentHandler#handle failed to get identifier from mediaItem", v160, 2u);
      MEMORY[0x237DE3BF0](v160, -1, -1);
    }
    uint64_t v144 = v13[38];
LABEL_84:
    uint64_t v161 = v13[29];

    v176(v144, v161);
    id v165 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);
LABEL_85:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v162 = (uint64_t (*)(id))v13[1];
    return v162(v165);
  }
  uint64_t v99 = v13[39];
  uint64_t v100 = v13;
  uint64_t v101 = v13[29];
  uint64_t v173 = sub_2355BCC50();
  unint64_t v103 = v102;

  v100[60] = v103;
  v5(v99, v4, v101);
  swift_bridgeObjectRetain_n();
  id v104 = sub_2355BCB60();
  os_log_type_t v105 = sub_2355BCF60();
  BOOL v106 = os_log_type_enabled(v104, v105);
  uint64_t v107 = v100[39];
  uint64_t v108 = v100[29];
  if (v106)
  {
    uint64_t v170 = v100[39];
    uint64_t v167 = v100[29];
    id v109 = (uint8_t *)swift_slowAlloc();
    uint64_t v110 = swift_slowAlloc();
    uint64_t v177 = v110;
    *(_DWORD *)id v109 = 136315138;
    swift_bridgeObjectRetain();
    v100[20] = sub_2355745F0(v173, v103, &v177);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v104, v105, "INSearchForMediaAppIntentHandler#handle invoking OpenMusicItemAppIntent with identifier: %s", v109, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v110, -1, -1);
    MEMORY[0x237DE3BF0](v109, -1, -1);

    uint64_t v112 = v167;
    uint64_t v111 = v170;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v111 = v107;
    uint64_t v112 = v108;
  }
  v176(v111, v112);
  uint64_t v154 = (void *)(v100[28] + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
  uint64_t v156 = v154[3];
  uint64_t v155 = v154[4];
  __swift_project_boxed_opaque_existential_1(v154, v156);
  uint64_t v157 = (void *)swift_task_alloc();
  v100[61] = v157;
  *uint64_t v157 = v100;
  v157[1] = sub_235588318;
  return MEMORY[0x270F63F40](v173, v103, v156, v155);
}

uint64_t sub_235587E2C()
{
  *(void *)(*(void *)v1 + 440) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_235588818;
  }
  else {
    uint64_t v2 = sub_235587F5C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_235587F5C()
{
  uint64_t v1 = *(void **)(v0 + 416);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 4, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v4);
}

uint64_t sub_2355880B8()
{
  *(void *)(*(void *)v1 + 456) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_235588B1C;
  }
  else {
    uint64_t v2 = sub_23558B734;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2355881E8()
{
  *(void *)(*(void *)v1 + 472) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_235588E20;
  }
  else {
    uint64_t v2 = sub_23558B734;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_235588318()
{
  *(void *)(*(void *)v1 + 496) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_235589124;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_235588434;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_235588434()
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 4, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(id))(v0 + 8);
  return v1(v3);
}

uint64_t sub_235588588()
{
  *(void *)(*(void *)v1 + 536) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_235589440;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2355886BC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2355886BC()
{
  uint64_t v1 = *(void **)(v0 + 504);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 4, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v4);
}

uint64_t sub_235588818()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void **)(v0 + 440);
  (*(void (**)(void, void, void))(v0 + 384))(*(void *)(v0 + 264), *(void *)(v0 + 376), *(void *)(v0 + 232));
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_2355BCB60();
  os_log_type_t v5 = sub_2355BCF70();
  if (os_log_type_enabled(v4, v5))
  {
    id v18 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v16 = *(void *)(v0 + 232);
    uint64_t v17 = *(void *)(v0 + 264);
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v20 = v7;
    *(_DWORD *)id v6 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = sub_2355BD320();
    *(void *)(v0 + 184) = sub_2355745F0(v8, v9, &v20);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23556D000, v4, v5, "INSearchForMediaAppIntentHandler#handle threw an error: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v7, -1, -1);
    MEMORY[0x237DE3BF0](v6, -1, -1);

    v18(v17, v16);
  }
  else
  {
    char v10 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v11 = *(void *)(v0 + 264);
    uint64_t v12 = *(void *)(v0 + 232);

    v10(v11, v12);
  }
  id v13 = *(void **)(v0 + 416);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(id))(v0 + 8);
  return v14(v19);
}

uint64_t sub_235588B1C()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void **)(v0 + 456);
  (*(void (**)(void, void, void))(v0 + 384))(*(void *)(v0 + 264), *(void *)(v0 + 376), *(void *)(v0 + 232));
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_2355BCB60();
  os_log_type_t v5 = sub_2355BCF70();
  if (os_log_type_enabled(v4, v5))
  {
    id v18 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v16 = *(void *)(v0 + 232);
    uint64_t v17 = *(void *)(v0 + 264);
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v20 = v7;
    *(_DWORD *)id v6 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = sub_2355BD320();
    *(void *)(v0 + 184) = sub_2355745F0(v8, v9, &v20);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23556D000, v4, v5, "INSearchForMediaAppIntentHandler#handle threw an error: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v7, -1, -1);
    MEMORY[0x237DE3BF0](v6, -1, -1);

    v18(v17, v16);
  }
  else
  {
    char v10 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v11 = *(void *)(v0 + 264);
    uint64_t v12 = *(void *)(v0 + 232);

    v10(v11, v12);
  }
  id v13 = *(void **)(v0 + 416);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(id))(v0 + 8);
  return v14(v19);
}

uint64_t sub_235588E20()
{
  uint64_t v21 = v0;
  uint64_t v1 = *(void **)(v0 + 472);
  (*(void (**)(void, void, void))(v0 + 384))(*(void *)(v0 + 264), *(void *)(v0 + 376), *(void *)(v0 + 232));
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_2355BCB60();
  os_log_type_t v5 = sub_2355BCF70();
  if (os_log_type_enabled(v4, v5))
  {
    id v18 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v16 = *(void *)(v0 + 232);
    uint64_t v17 = *(void *)(v0 + 264);
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v20 = v7;
    *(_DWORD *)id v6 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = sub_2355BD320();
    *(void *)(v0 + 184) = sub_2355745F0(v8, v9, &v20);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23556D000, v4, v5, "INSearchForMediaAppIntentHandler#handle threw an error: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v7, -1, -1);
    MEMORY[0x237DE3BF0](v6, -1, -1);

    v18(v17, v16);
  }
  else
  {
    char v10 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v11 = *(void *)(v0 + 264);
    uint64_t v12 = *(void *)(v0 + 232);

    v10(v11, v12);
  }
  id v13 = *(void **)(v0 + 416);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(id))(v0 + 8);
  return v14(v19);
}

uint64_t sub_235589124()
{
  id v27 = v0;
  uint64_t v1 = (void *)v0[62];
  id v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[48];
  uint64_t v3 = v0[47];
  uint64_t v4 = v0[32];
  uint64_t v5 = v0[29];
  swift_bridgeObjectRelease();
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2355BCB60();
  os_log_type_t v9 = sub_2355BCF70();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = (void *)v0[62];
    uint64_t v24 = (void (*)(uint64_t, uint64_t))v0[50];
    uint64_t v22 = v0[29];
    uint64_t v23 = v0[32];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v26 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_getErrorValue();
    uint64_t v13 = sub_2355BD320();
    v0[19] = sub_2355745F0(v13, v14, &v26);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23556D000, v8, v9, "INSearchForMediaAppIntentHandler#handle threw an error: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v12, -1, -1);
    MEMORY[0x237DE3BF0](v11, -1, -1);

    v24(v23, v22);
  }
  else
  {
    id v15 = (void *)v0[62];
    uint64_t v16 = (void (*)(uint64_t, uint64_t))v0[50];
    uint64_t v17 = v0[32];
    uint64_t v18 = v0[29];

    v16(v17, v18);
  }
  id v19 = (void *)v0[62];
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(id))v0[1];
  return v20(v25);
}

uint64_t sub_235589440()
{
  uint64_t v27 = v0;
  uint64_t v1 = *(void **)(v0 + 536);
  id v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v4 = *(void *)(v0 + 248);
  uint64_t v5 = *(void *)(v0 + 232);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2(v4, v3, v5);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2355BCB60();
  os_log_type_t v9 = sub_2355BCF70();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = *(void **)(v0 + 536);
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v22 = *(void *)(v0 + 232);
    uint64_t v23 = *(void *)(v0 + 248);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v26 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_getErrorValue();
    uint64_t v13 = sub_2355BD320();
    *(void *)(v0 + 176) = sub_2355745F0(v13, v14, &v26);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23556D000, v8, v9, "INSearchForMediaAppIntentHandler#handle threw an error: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v12, -1, -1);
    MEMORY[0x237DE3BF0](v11, -1, -1);

    v24(v23, v22);
  }
  else
  {
    id v15 = *(void **)(v0 + 536);
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    uint64_t v17 = *(void *)(v0 + 248);
    uint64_t v18 = *(void *)(v0 + 232);

    v16(v17, v18);
  }
  id v19 = *(void **)(v0 + 536);
  id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FE70]), sel_initWithCode_userActivity_, 5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(id))(v0 + 8);
  return v20(v25);
}

uint64_t sub_2355898F4(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  id v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *id v7 = v3;
  v7[1] = sub_2355899B8;
  return INSearchForMediaAppIntentHandler.handle(intent:)((uint64_t)v6);
}

uint64_t sub_2355899B8(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 32);
  uint64_t v4 = *(void **)(*v1 + 24);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  id v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

id INSearchForMediaAppIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void INSearchForMediaAppIntentHandler.init()()
{
}

id INSearchForMediaAppIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSearchForMediaAppIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235589C30(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_23557E098;
  return v6();
}

uint64_t sub_235589CFC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_23557E098;
  return v7();
}

uint64_t sub_235589DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2355BCE60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2355BCE50();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_23558B49C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2355BCE10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_235589F6C(uint64_t a1)
{
  v1[15] = a1;
  uint64_t v2 = sub_2355BC240();
  v1[16] = v2;
  v1[17] = *(void *)(v2 - 8);
  v1[18] = swift_task_alloc();
  uint64_t v3 = sub_2355BC1E0();
  v1[19] = v3;
  v1[20] = *(void *)(v3 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  uint64_t v4 = sub_2355BCB80();
  v1[23] = v4;
  v1[24] = *(void *)(v4 - 8);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23558A140, 0, 0);
}

void sub_23558A140()
{
  os_log_type_t v150 = v0;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v4 = __swift_project_value_buffer(v2, (uint64_t)qword_26880D108);
  uint64_t v145 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v145(v1, v4, v2);
  uint64_t v5 = sub_2355BCB60();
  os_log_type_t v6 = sub_2355BCF60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_23556D000, v5, v6, "INSearchForMediaAppIntentHandler#resolveMediaItems ...", v7, 2u);
    MEMORY[0x237DE3BF0](v7, -1, -1);
  }
  uint64_t v8 = (void *)v0[15];
  uint64_t v9 = (void *)v0[31];
  uint64_t v10 = v0[23];
  uint64_t v11 = v0[24];

  uint64_t v12 = *(void (**)(id, uint64_t))(v11 + 8);
  v12(v9, v10);
  id v13 = objc_msgSend(v8, sel_privateSearchForMediaIntentData);
  if (!v13) {
    goto LABEL_58;
  }
  unint64_t v14 = v13;
  id v15 = objc_msgSend(v13, sel_audioSearchResults);

  if (!v15) {
    goto LABEL_58;
  }
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v16 = sub_2355BCDB0();

  if (!(v16 >> 62))
  {
    if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_9;
    }
    goto LABEL_57;
  }
  swift_bridgeObjectRetain();
  uint64_t v118 = sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v118)
  {
LABEL_57:
    swift_bridgeObjectRelease();
LABEL_58:
    v145(v0[25], v4, v0[23]);
    id v119 = sub_2355BCB60();
    os_log_type_t v120 = sub_2355BCF70();
    if (os_log_type_enabled(v119, v120))
    {
      uint64_t v121 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v121 = 0;
      _os_log_impl(&dword_23556D000, v119, v120, "INSearchForMediaAppIntentHandler#resolveMediaItems missing search results", v121, 2u);
      MEMORY[0x237DE3BF0](v121, -1, -1);
    }
    unint64_t v122 = (void *)v0[25];
    uint64_t v123 = v0[23];

    v12(v122, v123);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v124 = swift_allocObject();
    *(_OWORD *)(v124 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
    *(void *)(v124 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    uint64_t v149 = v124;
    sub_2355BCDD0();
    uint64_t v147 = v124;
    goto LABEL_61;
  }
LABEL_9:
  if ((v16 & 0xC000000000000001) != 0)
  {
    id v17 = (id)MEMORY[0x237DE35A0](0, v16);
  }
  else
  {
    if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v17 = *(id *)(v16 + 32);
  }
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v18, sel_identifier);
  if (!v19 || (uint64_t v20 = v19, sub_2355BCC50(), v20, sub_2355BC250(), swift_allocObject(), !sub_2355BC260()))
  {
    v145(v0[26], v4, v0[23]);
    id v30 = v18;
    unint64_t v31 = sub_2355BCB60();
    os_log_type_t v32 = sub_2355BCF70();
    BOOL v33 = os_log_type_enabled(v31, v32);
    id v34 = (void *)v0[26];
    uint64_t v35 = v0[23];
    if (v33)
    {
      id v141 = (id)v0[26];
      uint64_t v138 = v0[23];
      BOOL v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v132 = swift_slowAlloc();
      uint64_t v149 = v132;
      *(_DWORD *)BOOL v36 = 136446210;
      id v146 = v30;
      id v37 = v30;
      id v38 = objc_msgSend(v37, sel_description);
      uint64_t v39 = sub_2355BCC50();
      uint64_t v144 = v12;
      unint64_t v41 = v40;

      v0[11] = sub_2355745F0(v39, v41, &v149);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();

      id v30 = v146;
      _os_log_impl(&dword_23556D000, v31, v32, "INSearchForMediaAppIntentHandler#resolveMediaItems failed to convert identifier to PlaybackItem for mediaItem: %{public}s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v132, -1, -1);
      MEMORY[0x237DE3BF0](v36, -1, -1);

      v144(v141, v138);
    }
    else
    {

      v12(v34, v35);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
    *(void *)(v42 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    uint64_t v149 = v42;
    sub_2355BCDD0();
    uint64_t v147 = v149;

    goto LABEL_61;
  }
  uint64_t v143 = (void (*)(uint64_t, uint64_t))v12;
  id v140 = v18;
  uint64_t v22 = v0[21];
  uint64_t v21 = v0[22];
  uint64_t v23 = v0[19];
  uint64_t v24 = v0[20];
  sub_2355BC1F0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v21, v22, v23);
  uint64_t v25 = sub_2355BCF90();
  LOBYTE(v22) = sub_235571FEC((uint64_t)objc_msgSend(v140, sel_type), v25);
  swift_bridgeObjectRelease();
  if ((v22 & 1) == 0)
  {
    uint64_t v44 = v0[17];
    uint64_t v43 = v0[18];
    uint64_t v45 = v0[16];
    sub_2355BC1D0();
    sub_2355BC220();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
    uint64_t v46 = sub_2355BC1A0();
    uint64_t v48 = v0[23];
    if (!v47)
    {
      v145(v0[27], v4, v48);
      os_log_type_t v59 = sub_2355BCB60();
      os_log_type_t v60 = sub_2355BCF70();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v61 = 0;
        _os_log_impl(&dword_23556D000, v59, v60, "INSearchForMediaAppIntentHandler#resolveMediaItems failed to get MusicSiriRepresentation", v61, 2u);
        MEMORY[0x237DE3BF0](v61, -1, -1);
      }
      uint64_t v62 = v0[27];
      uint64_t v63 = v0[22];
      uint64_t v64 = v0[23];
      uint64_t v65 = v0[19];
      uint64_t v66 = v0[20];

      v143(v62, v64);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v67 = swift_allocObject();
      *(_OWORD *)(v67 + 16) = xmmword_2355BDD80;
      sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
      *(void *)(v67 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      uint64_t v149 = v67;
      sub_2355BCDD0();
      uint64_t v147 = v67;

      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v63, v65);
      goto LABEL_61;
    }
    unint64_t v49 = v47;
    uint64_t v133 = v46;
    v145(v0[29], v4, v48);
    swift_bridgeObjectRetain_n();
    os_log_type_t v50 = sub_2355BCB60();
    os_log_type_t v51 = sub_2355BCF60();
    log = v50;
    BOOL v52 = os_log_type_enabled(v50, v51);
    uint64_t v126 = v0[23];
    uint64_t v127 = v0[29];
    if (v52)
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v149 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      swift_bridgeObjectRetain();
      v0[13] = sub_2355745F0(v133, v49, &v149);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, log, v51, "INSearchForMediaAppIntentHandler#resolveMediaItems with musicSiriRepresentationString = %s", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v54, -1, -1);
      MEMORY[0x237DE3BF0](v53, -1, -1);

      v143(v127, v126);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      v143(v127, v126);
    }
    id v85 = objc_msgSend(v140, sel_title);
    if (v85)
    {
      id v86 = v85;
      sub_2355BCC50();
      uint64_t v88 = v87;
    }
    else
    {
      uint64_t v88 = 0;
    }
    id v89 = objc_msgSend(v140, sel_type);
    id v139 = objc_msgSend(v140, sel_artwork);
    id v90 = objc_msgSend(v140, sel_artist);
    if (v90)
    {
      unint64_t v91 = v90;
      sub_2355BCC50();
      uint64_t v93 = v92;
    }
    else
    {
      uint64_t v93 = 0;
    }
    uint64_t v94 = (void *)sub_2355BCC40();
    swift_bridgeObjectRelease();
    if (v88)
    {
      uint64_t v95 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v95 = 0;
    }
    if (v93)
    {
      id v96 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v96 = 0;
    }
    uint64_t v97 = v0[28];
    uint64_t v136 = v0[23];
    id v98 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FC40]), sel_initWithIdentifier_title_type_artwork_artist_, v94, v95, v89, v139, v96);

    v0[10] = v98;
    v145(v97, v4, v136);
    id v72 = v98;
    uint64_t v73 = sub_2355BCB60();
    os_log_type_t v99 = sub_2355BCF60();
    BOOL v100 = os_log_type_enabled(v73, v99);
    uint64_t v76 = v0[28];
    uint64_t v77 = v0[23];
    if (v100)
    {
      uint64_t v148 = v0[23];
      uint64_t v101 = (uint8_t *)swift_slowAlloc();
      uint64_t v137 = swift_slowAlloc();
      uint64_t v149 = v137;
      *(_DWORD *)uint64_t v101 = 136315138;
      id v102 = v72;
      id v103 = objc_msgSend(v102, sel_description);
      uint64_t v104 = sub_2355BCC50();
      unint64_t v106 = v105;

      v0[12] = sub_2355745F0(v104, v106, &v149);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23556D000, v73, v99, "INSearchForMediaAppIntentHandler#resolveMediaItems resolving item: %s", v101, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v137, -1, -1);
      MEMORY[0x237DE3BF0](v101, -1, -1);

      uint64_t v84 = v76;
      goto LABEL_53;
    }
LABEL_54:

    uint64_t v84 = v76;
    uint64_t v107 = v77;
    goto LABEL_55;
  }
  sub_2355BC1B0();
  id v26 = objc_msgSend(v140, sel_title);
  if (v26)
  {
    uint64_t v27 = v26;
    sub_2355BCC50();
    uint64_t v29 = v28;
  }
  else
  {
    uint64_t v29 = 0;
  }
  id v142 = objc_msgSend(v140, sel_type);
  os_log_t loga = (os_log_t)objc_msgSend(v140, sel_artwork);
  id v55 = objc_msgSend(v140, sel_artist);
  if (v55)
  {
    uint64_t v56 = v55;
    sub_2355BCC50();
    uint64_t v58 = v57;
  }
  else
  {
    uint64_t v58 = 0;
  }
  uint64_t v68 = (void *)sub_2355BCC40();
  swift_bridgeObjectRelease();
  if (v29)
  {
    uint64_t v69 = (void *)sub_2355BCC40();
    swift_bridgeObjectRelease();
    if (v58)
    {
LABEL_33:
      uint64_t v70 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v69 = 0;
    if (v58) {
      goto LABEL_33;
    }
  }
  uint64_t v70 = 0;
LABEL_36:
  uint64_t v128 = v0[30];
  uint64_t v134 = v0[23];
  id v71 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FC40]), sel_initWithIdentifier_title_type_artwork_artist_, v68, v69, v142, loga, v70);

  v0[10] = v71;
  v145(v128, v4, v134);
  id v72 = v71;
  uint64_t v73 = sub_2355BCB60();
  os_log_type_t v74 = sub_2355BCF60();
  BOOL v75 = os_log_type_enabled(v73, v74);
  uint64_t v76 = v0[30];
  uint64_t v77 = v0[23];
  if (!v75) {
    goto LABEL_54;
  }
  uint64_t v148 = v0[23];
  char v78 = (uint8_t *)swift_slowAlloc();
  uint64_t v135 = swift_slowAlloc();
  uint64_t v149 = v135;
  *(_DWORD *)char v78 = 136315138;
  logb = v78;
  id v79 = v72;
  id v80 = objc_msgSend(v79, sel_description);
  uint64_t v81 = sub_2355BCC50();
  unint64_t v83 = v82;

  v0[14] = sub_2355745F0(v81, v83, &v149);
  sub_2355BD1B0();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_23556D000, v73, v74, "INSearchForMediaAppIntentHandler#resolveMediaItems resolving podcast item: %s", logb, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x237DE3BF0](v135, -1, -1);
  MEMORY[0x237DE3BF0](logb, -1, -1);

  uint64_t v84 = v76;
LABEL_53:
  uint64_t v107 = v148;
LABEL_55:
  v143(v84, v107);
  uint64_t v108 = v0[22];
  uint64_t v109 = v0[19];
  uint64_t v110 = v0[20];
  uint64_t v111 = (void *)v0[15];
  uint64_t v112 = sub_23557DC00(0, &qword_26880C3D8);
  uint64_t v113 = MEMORY[0x263F6CC70];
  v0[5] = v112;
  v0[6] = v113;
  v0[2] = v111;
  id v114 = v111;
  sub_2355BCEF0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v115 = swift_allocObject();
  *(_OWORD *)(v115 + 16) = xmmword_2355BDD80;
  sub_23557DC00(0, (unint64_t *)&unk_26880C3C8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_beginAccess();
  uint64_t v117 = (void *)v0[10];
  *(void *)(v115 + 32) = objc_msgSend(ObjCClassFromMetadata, sel_successWithResolvedMediaItem_, v117);
  uint64_t v149 = v115;
  sub_2355BCDD0();
  uint64_t v147 = v149;

  (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v108, v109);
LABEL_61:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v125 = (void (*)(uint64_t))v0[1];
  v125(v147);
}

uint64_t sub_23558B254()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_23557E098;
  os_log_type_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_26880C528 + dword_26880C528);
  return v6(v2, v3, v4);
}

uint64_t sub_23558B30C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_23557E098;
  os_log_type_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_26880C538 + dword_26880C538);
  return v6(v2, v3, v4);
}

uint64_t sub_23558B3D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  os_log_type_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_23557E098;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_26880C548 + dword_26880C548);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_23558B49C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C520);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23558B4FC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23558B534(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_23557DD2C;
  os_log_type_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26880C558 + dword_26880C558);
  return v6(a1, v4);
}

uint64_t objectdestroyTm()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23558B638()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_23557DD2C;
  os_log_type_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_26880C568 + dword_26880C568);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_11Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23558B738()
{
  uint64_t v0 = sub_2355BCB80();
  __swift_allocate_value_buffer(v0, qword_26880D108);
  __swift_project_value_buffer(v0, (uint64_t)qword_26880D108);
  if (qword_26880C118 != -1) {
    swift_once();
  }
  id v1 = (id)logObject;
  return sub_2355BCB90();
}

uint64_t sub_23558B7C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 0:
      uint64_t v8 = (unsigned int *)MEMORY[0x263F6CC00];
      goto LABEL_11;
    case 1:
      uint64_t v8 = (unsigned int *)MEMORY[0x263F6CBE8];
      goto LABEL_11;
    case 2:
      uint64_t v8 = (unsigned int *)MEMORY[0x263F6CBF0];
      goto LABEL_11;
    case 3:
      uint64_t v8 = (unsigned int *)MEMORY[0x263F6CBF8];
LABEL_11:
      uint64_t v19 = *v8;
      uint64_t v20 = sub_2355BC790();
      uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104);
      uint64_t result = v21(a2, v19, v20);
      break;
    default:
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v9 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
      uint64_t v10 = sub_2355BCB60();
      os_log_type_t v11 = sub_2355BCF70();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        uint64_t v23 = a1;
        uint64_t v24 = v13;
        *(_DWORD *)uint64_t v12 = 136315138;
        v22[1] = v12 + 4;
        type metadata accessor for INPlaybackQueueLocation(0);
        uint64_t v14 = sub_2355BCC60();
        uint64_t v23 = sub_2355745F0(v14, v15, &v24);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23556D000, v10, v11, "Unknown INPlaybackQueueLocation: %s", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v13, -1, -1);
        MEMORY[0x237DE3BF0](v12, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v16 = *MEMORY[0x263F6CBE0];
      uint64_t v17 = sub_2355BC790();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(a2, v16, v17);
      break;
  }
  return result;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestionsExecutionParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 34)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 33);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestionsExecutionParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 34) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 34) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 33) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestionsExecutionParameters()
{
  return &type metadata for AudioSuggestionsExecutionParameters;
}

unint64_t sub_23558BBE4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C588);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2355BE0C0;
  strcpy((char *)(inited + 32), "songIsDisliked");
  *(unsigned char *)(inited + 47) = -18;
  sub_23558BFC0(v0, (uint64_t)&v16, &qword_26880C590);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C590);
  *(void *)(inited + 72) = v2;
  uint64_t v3 = sub_23558BF60(&qword_26880C598, &qword_26880C590);
  *(void *)(inited + 80) = v3;
  uint64_t v4 = sub_23558BF60(&qword_26880C5A0, &qword_26880C590);
  *(void *)(inited + 88) = v4;
  sub_23558BFC0((uint64_t)&v16, inited + 48, &qword_26880C590);
  *(void *)(inited + 96) = 0x694C7349676E6F73;
  *(void *)(inited + 104) = 0xEB0000000064656BLL;
  sub_23558BFC0(v0 + 1, (uint64_t)&v15, &qword_26880C590);
  *(void *)(inited + 136) = v2;
  *(void *)(inited + 144) = v3;
  *(void *)(inited + 152) = v4;
  sub_23558BFC0((uint64_t)&v15, inited + 112, &qword_26880C590);
  strcpy((char *)(inited + 160), "mediaItemType");
  *(_WORD *)(inited + 174) = -4864;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C5A8);
  *(void *)(inited + 200) = v5;
  uint64_t v6 = sub_23558BF60(&qword_26880C5B0, &qword_26880C5A8);
  *(void *)(inited + 208) = v6;
  uint64_t v7 = sub_23558BF60(&qword_26880C5B8, &qword_26880C5A8);
  *(void *)(inited + 216) = v7;
  sub_23558BFC0(v0 + 8, (uint64_t)v14, &qword_26880C5C0);
  sub_23558BFC0((uint64_t)v14, (uint64_t)&v17, &qword_26880C5C0);
  char v8 = v18;
  uint64_t v9 = v17;
  if (v18) {
    uint64_t v9 = 0;
  }
  *(void *)(inited + 176) = v9;
  *(unsigned char *)(inited + 184) = v8;
  *(void *)(inited + 224) = 0xD000000000000016;
  *(void *)(inited + 232) = 0x80000002355BF0F0;
  sub_23558BFC0(v0 + 17, (uint64_t)&v13, &qword_26880C590);
  *(void *)(inited + 264) = v2;
  *(void *)(inited + 272) = v3;
  *(void *)(inited + 280) = v4;
  sub_23558BFC0((uint64_t)&v13, inited + 240, &qword_26880C590);
  *(void *)(inited + 288) = 0x6E654C6575657571;
  *(void *)(inited + 296) = 0xEB00000000687467;
  sub_23558BFC0(v0 + 24, (uint64_t)v12, &qword_26880C5A8);
  *(void *)(inited + 328) = v5;
  *(void *)(inited + 336) = v6;
  *(void *)(inited + 344) = v7;
  sub_23558BFC0((uint64_t)v12, inited + 304, &qword_26880C5A8);
  *(void *)(inited + 352) = 0xD000000000000016;
  *(void *)(inited + 360) = 0x80000002355BF110;
  char v10 = *(unsigned char *)(v0 + 33);
  *(void *)(inited + 392) = MEMORY[0x263F8D4F8];
  *(void *)(inited + 400) = MEMORY[0x263F8D518];
  *(void *)(inited + 408) = MEMORY[0x263F8D500];
  *(unsigned char *)(inited + 368) = v10;
  return sub_23557FD78(inited);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_23558BF60(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23558BFC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id INAddMediaIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id INAddMediaIntentHandler.init()()
{
  uint64_t v54 = sub_2355BC7E0();
  uint64_t v53 = *(void *)(v54 - 8);
  uint64_t v0 = MEMORY[0x270FA5388](v54);
  BOOL v52 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  uint64_t v48 = (char *)&v39 - v2;
  uint64_t v51 = sub_2355BC730();
  uint64_t v50 = *(void *)(v51 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v51);
  unint64_t v49 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v39 - v5;
  uint64_t v47 = sub_2355BC5D0();
  uint64_t v55 = *(void *)(v47 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v47);
  uint64_t v46 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v39 - v9;
  uint64_t v11 = sub_2355BC390();
  uint64_t v44 = v11;
  uint64_t v45 = *(void *)(v11 - 8);
  uint64_t v12 = v45;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v40 = v15;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v39 - v16;
  id v18 = objc_msgSend(self, sel_defaultMediaLibrary);
  v65[3] = sub_2355BC810();
  v65[4] = MEMORY[0x263F6CC18];
  __swift_allocate_boxed_opaque_existential_1(v65);
  sub_2355BC800();
  uint64_t v19 = sub_2355BC900();
  swift_allocObject();
  uint64_t v20 = sub_2355BC8F0();
  *((void *)&v63 + 1) = v19;
  uint64_t v64 = MEMORY[0x263F6CC48];
  *(void *)&long long v62 = v20;
  id v21 = objc_msgSend(self, sel_systemMusicPlayer);
  uint64_t v43 = v17;
  sub_2355BC380();
  uint64_t v42 = v10;
  sub_2355BC5C0();
  uint64_t v22 = v6;
  unint64_t v41 = v6;
  sub_2355BC720();
  sub_2355BBF70();
  sub_2355BC3F0();
  swift_allocObject();
  uint64_t v23 = sub_2355BC3E0();
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v24 = sub_2355BCAC0();
  uint64_t v25 = sub_2355BCAB0();
  uint64_t v60 = v24;
  uint64_t v61 = MEMORY[0x263F740F8];
  uint64_t v59 = v25;
  uint64_t v26 = sub_2355BC020();
  swift_allocObject();
  uint64_t v27 = sub_2355BC010();
  uint64_t v57 = v26;
  uint64_t v58 = MEMORY[0x263F6CA58];
  uint64_t v56 = v27;
  uint64_t v28 = v48;
  sub_2355BC7D0();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  uint64_t v29 = (uint64_t)v46;
  uint64_t v30 = v47;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v46, v10, v47);
  uint64_t v31 = v50;
  os_log_type_t v32 = v49;
  uint64_t v33 = v51;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v22, v51);
  uint64_t v34 = v53;
  uint64_t v35 = (uint64_t)v52;
  uint64_t v36 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v28, v54);
  swift_retain();
  id v37 = sub_2355969AC((uint64_t)v40, v29, v32, (uint64_t)v65, v23, (uint64_t)&v62, v35);
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v36);
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v33);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v42, v30);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v44);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v37;
}

uint64_t sub_23558C6E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = a3[3];
  uint64_t v8 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v7);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_23559DB78;
  *(void *)(v9 + 24) = v6;
  char v10 = *(void (**)(uint64_t (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  v10(sub_23559DF94, v9, v7, v8);
  return swift_release();
}

uint64_t sub_23558C7D4(uint64_t a1, void *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v8 = sub_2355BCB80();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
    id v13 = a2;
    id v14 = a2;
    char v15 = sub_2355BCB60();
    os_log_type_t v16 = sub_2355BCF70();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v27 = a3;
      id v18 = (uint8_t *)v17;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v30 = v19;
      v26[1] = a4;
      *(_DWORD *)id v18 = 136446210;
      v26[0] = v18 + 4;
      swift_getErrorValue();
      uint64_t v28 = sub_2355BD320();
      uint64_t v29 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
      uint64_t v21 = sub_2355BCC60();
      uint64_t v28 = sub_2355745F0(v21, v22, &v30);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23556D000, v15, v16, "INAddMediaIntentHandler#init Unexpected error initializing podcasts controller: %{public}s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v19, -1, -1);
      uint64_t v23 = v18;
      a3 = v27;
      MEMORY[0x237DE3BF0](v23, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = a1;
  }
  return a3(v24);
}

uint64_t INAddMediaIntentHandler.resolveMediaItems(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  uint64_t v5 = sub_2355BCB50();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = qword_26880C118;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  id v14 = (id)logObject;
  sub_2355BCB30();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = "addMediaIntentHandlerResolveMediaItems";
  *(void *)(v17 + 24) = 38;
  *(unsigned char *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  id v18 = (void *)(v17 + v16);
  *id v18 = sub_235596E28;
  v18[1] = v12;
  swift_retain();
  sub_2355BD140();
  sub_2355BCB20();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_235596E58;
  *(void *)(v19 + 24) = v17;
  swift_retain();
  sub_23558CD44((uint64_t)sub_235596F00, v19, v21);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

uint64_t sub_23558CD44(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_2355BCB80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  uint64_t v24 = v10;
  uint64_t v11 = qword_26880C108;
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v6, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v12, v6);
  uint64_t v13 = a3;
  id v14 = sub_2355BCB60();
  os_log_type_t v15 = sub_2355BCF60();
  if (os_log_type_enabled(v14, v15))
  {
    unint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    unint64_t v22 = v16;
    uint64_t v23 = v9;
    *(_DWORD *)unint64_t v16 = 138412290;
    v21[1] = v16 + 4;
    uint64_t v25 = v13;
    id v18 = v13;
    uint64_t v9 = v23;
    sub_2355BD1B0();
    *uint64_t v17 = v13;

    uint64_t v19 = v22;
    _os_log_impl(&dword_23556D000, v14, v15, "INAddMediaIntentHandler#resolveMediaItems for intent: %@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v17, -1, -1);
    MEMORY[0x237DE3BF0](v19, -1, -1);
  }
  else
  {

    id v14 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  INAddMediaIntentHandler.mediaItem(for:with:)(v13, (uint64_t)sub_23559DFFC, v24);
  return swift_release();
}

void sub_23558D048(uint64_t a1, uint64_t a2)
{
  sub_23557DC00(0, &qword_26880C690);
  id v3 = (id)sub_2355BCD90();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

uint64_t INAddMediaIntentHandler.mediaItem(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v58 = a3;
  uint64_t v59 = a2;
  uint64_t v6 = sub_2355BCB80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v57 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v53 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  os_log_type_t v15 = (char *)&v53 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v53 - v16;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v6, (uint64_t)qword_26880D108);
  uint64_t v60 = v7;
  uint64_t v61 = v18;
  long long v62 = *(void (**)(char *))(v7 + 16);
  uint64_t v63 = v7 + 16;
  v62(v17);
  uint64_t v19 = a1;
  uint64_t v20 = sub_2355BCB60();
  os_log_type_t v21 = sub_2355BCF60();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v55 = v12;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v56 = v4;
    uint64_t v53 = (void *)v24;
    *(_DWORD *)uint64_t v23 = 138412290;
    uint64_t v64 = v19;
    uint64_t v25 = v19;
    uint64_t v54 = v15;
    uint64_t v26 = v25;
    sub_2355BD1B0();
    uint64_t v27 = v53;
    *uint64_t v53 = v19;

    os_log_type_t v15 = v54;
    _os_log_impl(&dword_23556D000, v20, v21, "INAddMediaIntentHandler#mediaItem searching resolving media item for intent: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    uint64_t v4 = v56;
    MEMORY[0x237DE3BF0](v27, -1, -1);
    uint64_t v28 = v23;
    uint64_t v12 = v55;
    MEMORY[0x237DE3BF0](v28, -1, -1);
  }
  else
  {

    uint64_t v20 = v19;
  }

  uint64_t v29 = *(void (**)(char *, uint64_t))(v60 + 8);
  v29(v17, v6);
  id v30 = [v19 backingStore];
  self;
  uint64_t v31 = (void *)swift_dynamicCastObjCClass();
  if (!v31) {

  }
  id v32 = objc_msgSend(v31, sel_mediaDestination);
  id v33 = [v19 mediaSearch];
  if (v33 && (v34 = v33, id v35 = objc_msgSend(v33, sel_reference), v34, v35 == (id)1))
  {
    ((void (*)(char *, uint64_t, uint64_t))v62)(v12, v61, v6);
    uint64_t v36 = sub_2355BCB60();
    os_log_type_t v37 = sub_2355BCF60();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v38 = 0;
      _os_log_impl(&dword_23556D000, v36, v37, "INAddMediaIntentHandler#mediaItem referring to currently playing...", v38, 2u);
      MEMORY[0x237DE3BF0](v38, -1, -1);
    }

    v29(v12, v6);
    ((void (*)(char *, uint64_t, uint64_t))v62)(v57, v61, v6);
    uint64_t v39 = sub_2355BCB60();
    os_log_type_t v40 = sub_2355BCF60();
    if (os_log_type_enabled(v39, v40))
    {
      unint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v41 = 0;
      _os_log_impl(&dword_23556D000, v39, v40, "INAddMediaIntentHandler#mediaItem trying to resolve from audioSearchResults first...", v41, 2u);
      MEMORY[0x237DE3BF0](v41, -1, -1);
    }

    v29(v57, v6);
    uint64_t v42 = (void *)swift_allocObject();
    v42[2] = v4;
    v42[3] = v19;
    uint64_t v43 = v58;
    v42[4] = v59;
    v42[5] = v43;
    uint64_t v44 = v19;
    id v45 = v4;
    swift_retain();
    uint64_t v46 = sub_23559A26C;
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v62)(v15, v61, v6);
    uint64_t v47 = sub_2355BCB60();
    os_log_type_t v48 = sub_2355BCF60();
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v49 = 0;
      _os_log_impl(&dword_23556D000, v47, v48, "INAddMediaIntentHandler#mediaItem from search result...", v49, 2u);
      MEMORY[0x237DE3BF0](v49, -1, -1);
    }

    v29(v15, v6);
    uint64_t v42 = (void *)swift_allocObject();
    v42[2] = v4;
    v42[3] = v19;
    uint64_t v50 = v58;
    v42[4] = v59;
    v42[5] = v50;
    uint64_t v44 = v19;
    id v51 = v4;
    swift_retain();
    uint64_t v46 = sub_235596F40;
  }
  sub_235599FF4(v44, v32, (uint64_t)v46, (uint64_t)v42);

  return swift_release();
}

uint64_t sub_23558D708(void *a1, char a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = sub_2355BCB80();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v51 - v17;
  if (a2)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v39 = __swift_project_value_buffer(v12, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v39, v12);
    os_log_type_t v40 = sub_2355BCB60();
    os_log_type_t v41 = sub_2355BCF60();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = a5;
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_23556D000, v40, v41, "INAddMediaIntentHandler#mediaItem from now playing", v43, 2u);
      uint64_t v44 = v43;
      a5 = v42;
      MEMORY[0x237DE3BF0](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    id v45 = (void *)swift_allocObject();
    v45[2] = a3;
    v45[3] = a4;
    v45[4] = a5;
    v45[5] = a6;
    id v46 = a3;
    id v47 = a4;
    swift_retain();
    sub_2355920B8(v47, (uint64_t)sub_23559DC4C, (uint64_t)v45);
    return swift_release();
  }
  else
  {
    uint64_t v58 = a1;
    uint64_t v59 = a3;
    uint64_t v19 = qword_26880C108;
    id v20 = a1;
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v12, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v21, v12);
    id v22 = v20;
    uint64_t v23 = sub_2355BCB60();
    os_log_type_t v24 = sub_2355BCF60();
    int v25 = v24;
    if (os_log_type_enabled(v23, v24))
    {
      os_log_t v55 = v23;
      uint64_t v26 = swift_slowAlloc();
      int v53 = v25;
      uint64_t v27 = (uint8_t *)v26;
      uint64_t v54 = swift_slowAlloc();
      uint64_t v61 = v54;
      uint64_t v56 = a4;
      *(_DWORD *)uint64_t v27 = 136315138;
      v51[1] = v27 + 4;
      BOOL v52 = v27;
      id v28 = v22;
      uint64_t v57 = a6;
      id v29 = v28;
      id v30 = v22;
      uint64_t v31 = a5;
      id v32 = objc_msgSend(v28, sel_description);
      uint64_t v33 = sub_2355BCC50();
      unint64_t v35 = v34;

      a5 = v31;
      id v22 = v30;
      uint64_t v60 = sub_2355745F0(v33, v35, &v61);
      a4 = v56;
      sub_2355BD1B0();

      a6 = v57;
      swift_bridgeObjectRelease();
      os_log_t v36 = v55;
      os_log_type_t v37 = v52;
      _os_log_impl(&dword_23556D000, v55, (os_log_type_t)v53, "INAddMediaIntentHandler#mediaItem resolved item from audioSearch results item %s", v52, 0xCu);
      uint64_t v38 = v54;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v38, -1, -1);
      MEMORY[0x237DE3BF0](v37, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    uint64_t v49 = swift_allocObject();
    *(void *)(v49 + 16) = a5;
    *(void *)(v49 + 24) = a6;
    MEMORY[0x270FA5388](v49);
    v51[-4] = v58;
    LOBYTE(v51[-3]) = 0;
    uint64_t v50 = v59;
    v51[-2] = a4;
    v51[-1] = v50;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C6B0);
    sub_2355BC0D0();

    return swift_release();
  }
}

uint64_t sub_23558DC20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a5;
  *(void *)(v8 + 24) = a6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C6B0);
  sub_2355BC0D0();
  return swift_release();
}

uint64_t INAddMediaIntentHandler.resolveMediaDestination(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  v20[0] = a1;
  uint64_t v5 = sub_2355BCB50();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v20 - v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = qword_26880C118;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  id v14 = (id)logObject;
  sub_2355BCB30();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = "addMediaIntentHandlerResolveMediaDestination";
  *(void *)(v17 + 24) = 44;
  *(unsigned char *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  uint64_t v18 = (void *)(v17 + v16);
  *uint64_t v18 = sub_23559A27C;
  v18[1] = v12;
  swift_retain();
  sub_2355BD140();
  sub_2355BCB20();
  swift_retain();
  sub_23559A34C(v20[0], (uint64_t)v20[1], (void (*)(void *))sub_23559A2AC, v17);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

void sub_23558DF6C(void *a1, uint64_t a2, unint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v33 = a2;
  uint64_t v9 = sub_2355BCBD0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (void *)((char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_2355BCB80();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 && (id v17 = objc_msgSend(a1, sel_name)) != 0)
  {
    uint64_t v18 = v17;
    uint64_t v19 = sub_2355BCC50();
    uint64_t v21 = v20;

    sub_23557DC00(0, &qword_26880C6A8);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    *uint64_t v12 = v19;
    v12[1] = v21;
    (*(void (**)(uint64_t *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F8F1D0], v9);
    uint64_t v23 = (void *)sub_2355BCBB0();
    (*(void (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
    id v24 = objc_msgSend(ObjCClassFromMetadata, sel_successWithResolvedMediaDestination_, v23);
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v13, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v25, v13);
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_2355BCB60();
    os_log_type_t v27 = sub_2355BCF70();
    if (os_log_type_enabled(v26, v27))
    {
      id v32 = a4;
      id v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v31[1] = a5;
      uint64_t v30 = v29;
      uint64_t v35 = v29;
      *(_DWORD *)id v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_2355745F0(v33, a3, &v35);
      a4 = v32;
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v26, v27, "INAddMediaIntentHandler#resolveMediaDestination didn't find playlist in library: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v30, -1, -1);
      MEMORY[0x237DE3BF0](v28, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    id v24 = objc_msgSend(self, sel_unsupportedForReason_, 1);
  }
  a4(v24);
}

uint64_t INAddMediaIntentHandler.handle(intent:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  v20[0] = a1;
  uint64_t v5 = sub_2355BCB50();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v20 - v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = qword_26880C118;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  id v14 = (id)logObject;
  sub_2355BCB30();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = "addMediaIntentHandlerHandle";
  *(void *)(v17 + 24) = 27;
  *(unsigned char *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  uint64_t v18 = (void *)(v17 + v16);
  *uint64_t v18 = sub_23559DFA0;
  v18[1] = v12;
  swift_retain();
  sub_2355BD140();
  sub_2355BCB20();
  swift_retain();
  sub_23559AFB8(v20[0], (char *)v20[1], (void (*)(uint64_t *))sub_23559A2AC, v17);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

void sub_23558E608(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    id v10 = objc_msgSend(v5, sel_subscriptionController);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a4;
    *(void *)(v11 + 24) = a5;
    v13[4] = sub_23559DB58;
    v13[5] = v11;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_23558ED6C;
    v13[3] = &block_descriptor_0;
    uint64_t v12 = _Block_copy(v13);
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_subscribeToStoreId_siriContext_completion_, a2, a3, v12);
    swift_unknownObjectRelease();
    _Block_release(v12);
  }
}

void sub_23558E728(uint64_t a1, void (*a2)(void *))
{
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v14 = (char *)&v43 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v43 - v15;
  if (a1 == 3)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v25, v4);
    uint64_t v26 = sub_2355BCB60();
    os_log_type_t v27 = sub_2355BCF70();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_23556D000, v26, v27, "INAddMediaIntentHandler#handle not authorized to subscribe", v28, 2u);
      MEMORY[0x237DE3BF0](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    id v29 = objc_allocWithZone(MEMORY[0x263F08D38]);
    goto LABEL_24;
  }
  if (a1 != 1)
  {
    if (!a1)
    {
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v17 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v16, v17, v4);
      uint64_t v18 = sub_2355BCB60();
      os_log_type_t v19 = sub_2355BCF60();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_23556D000, v18, v19, "INAddMediaIntentHandler#handle successfully subscribed to the podcast", v20, 2u);
        MEMORY[0x237DE3BF0](v20, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
      id v21 = objc_allocWithZone(MEMORY[0x263F08D38]);
      id v22 = (void *)sub_2355BCC40();
      id v23 = objc_msgSend(v21, sel_initWithActivityType_, v22);

      id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 3, v23);
      goto LABEL_25;
    }
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v37 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v37, v4);
    uint64_t v38 = sub_2355BCB60();
    os_log_type_t v39 = sub_2355BCF70();
    if (os_log_type_enabled(v38, v39))
    {
      os_log_type_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v40 = 0;
      _os_log_impl(&dword_23556D000, v38, v39, "INAddMediaIntentHandler#handle failed to subscribe to the podcast", v40, 2u);
      MEMORY[0x237DE3BF0](v40, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    id v29 = objc_allocWithZone(MEMORY[0x263F08D38]);
LABEL_24:
    os_log_type_t v41 = (void *)sub_2355BCC40();
    id v23 = objc_msgSend(v29, sel_initWithActivityType_, v41);

    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v23);
    goto LABEL_25;
  }
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v30, v4);
  uint64_t v31 = sub_2355BCB60();
  os_log_type_t v32 = sub_2355BCF70();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_23556D000, v31, v32, "INAddMediaIntentHandler#handle already subscribed to the podcast", v33, 2u);
    MEMORY[0x237DE3BF0](v33, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
  uint64_t v34 = *MEMORY[0x263F101B8];
  id v35 = objc_allocWithZone(MEMORY[0x263F08D38]);
  os_log_t v36 = (void *)sub_2355BCC40();
  id v23 = objc_msgSend(v35, sel_initWithActivityType_, v36);

  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, v34, v23);
LABEL_25:
  uint64_t v42 = v24;

  a2(v42);
}

uint64_t sub_23558ED6C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_23558EDC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void *), uint64_t a7)
{
  uint64_t v65 = a7;
  uint64_t v66 = a6;
  uint64_t v61 = a5;
  unint64_t v63 = a3;
  uint64_t v64 = a4;
  uint64_t v57 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C6A0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v62 = (uint64_t)&v52 - v12;
  uint64_t v13 = sub_2355BC1E0();
  uint64_t v59 = *(void *)(v13 - 8);
  uint64_t v60 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v58 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2355BCB80();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  os_log_type_t v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v52 - v20;
  uint64_t v22 = sub_2355BC880();
  uint64_t v23 = *(void *)(v22 - 8);
  id v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  if (v24(a1, 1, v22) == 1)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v15, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v21, v25, v15);
    uint64_t v26 = sub_2355BCB60();
    os_log_type_t v27 = sub_2355BCF60();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_23556D000, v26, v27, "INAddMediaIntentHandler#handle successfully added item into library", v28, 2u);
      MEMORY[0x237DE3BF0](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    sub_23557DFE4(v64 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v68, &qword_26880C698);
    if (v69)
    {
      __swift_project_boxed_opaque_existential_1(v68, v69);
      id v29 = v58;
      sub_2355BC1F0();
      sub_2355BC1B0();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v29, v60);
      sub_2355BC740();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
    }
    else
    {
      sub_23557DE84((uint64_t)v68, &qword_26880C698);
    }
    id v42 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v43 = (void *)sub_2355BCC40();
    id v44 = objc_msgSend(v42, sel_initWithActivityType_, v43);

    id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 3, v44);
  }
  else
  {
    uint64_t v56 = v11;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v15, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v30, v15);
    uint64_t v31 = a1;
    os_log_type_t v32 = v19;
    uint64_t v33 = v62;
    sub_23557DFE4(v31, v62, &qword_26880C6A0);
    swift_bridgeObjectRetain_n();
    uint64_t v34 = sub_2355BCB60();
    int v55 = sub_2355BCF70();
    if (os_log_type_enabled(v34, (os_log_type_t)v55))
    {
      uint64_t v54 = v32;
      id v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      v68[0] = v53;
      *(_DWORD *)id v35 = 136315138;
      uint64_t v36 = v33;
      uint64_t v37 = (uint64_t)v56;
      sub_23557DFE4(v36, (uint64_t)v56, &qword_26880C6A0);
      if (v24(v37, 1, v22) == 1)
      {
        sub_23557DE84(v37, &qword_26880C6A0);
        unint64_t v38 = v63;
        swift_bridgeObjectRetain();
        unint64_t v39 = v38;
        os_log_type_t v40 = v54;
        uint64_t v41 = v57;
      }
      else
      {
        uint64_t v41 = sub_2355BC870();
        unint64_t v39 = v46;
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v37, v22);
        os_log_type_t v40 = v54;
      }
      uint64_t v67 = sub_2355745F0(v41, v39, v68);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23557DE84(v62, &qword_26880C6A0);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v34, (os_log_type_t)v55, "INAddMediaIntentHandler#handle failed to added item into library, %s", v35, 0xCu);
      uint64_t v47 = v53;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v47, -1, -1);
      MEMORY[0x237DE3BF0](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v16 + 8))(v40, v15);
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_23557DE84(v33, &qword_26880C6A0);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v32, v15);
    }
    sub_23557DFE4(v64 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v68, &qword_26880C698);
    if (v69)
    {
      __swift_project_boxed_opaque_existential_1(v68, v69);
      os_log_type_t v48 = v58;
      sub_2355BC1F0();
      sub_2355BC1B0();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v48, v60);
      sub_2355BC740();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
    }
    else
    {
      sub_23557DE84((uint64_t)v68, &qword_26880C698);
    }
    id v49 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v50 = (void *)sub_2355BCC40();
    id v44 = objc_msgSend(v49, sel_initWithActivityType_, v50);

    id v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v44);
  }
  id v51 = v45;

  v66(v51);
}

void sub_23558F5B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(void *), uint64_t a11)
{
  unint64_t v71 = a7;
  uint64_t v72 = a8;
  uint64_t v62 = a6;
  uint64_t v63 = a4;
  unint64_t v64 = a5;
  uint64_t v69 = a1;
  uint64_t v70 = a2;
  uint64_t v73 = a10;
  uint64_t v74 = a11;
  uint64_t v68 = a9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C6A0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v75 = (uint64_t)&v57 - v16;
  uint64_t v17 = sub_2355BC1E0();
  uint64_t v66 = *(void *)(v17 - 8);
  uint64_t v67 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v65 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2355BCB80();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v57 - v24;
  uint64_t v26 = sub_2355BC880();
  uint64_t v27 = *(void *)(v26 - 8);
  id v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48);
  if (v28(a3, 1, v26) == 1)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v29 = __swift_project_value_buffer(v19, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v25, v29, v19);
    uint64_t v30 = sub_2355BCB60();
    os_log_type_t v31 = sub_2355BCF60();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v32 = 0;
      _os_log_impl(&dword_23556D000, v30, v31, "INAddMediaIntentHandler#handle successfully added item into playlist", v32, 2u);
      MEMORY[0x237DE3BF0](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v25, v19);
    sub_23557DFE4(v72 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v77, &qword_26880C698);
    if (v78)
    {
      __swift_project_boxed_opaque_existential_1(v77, v78);
      uint64_t v33 = v65;
      sub_2355BC1F0();
      sub_2355BC1B0();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v33, v67);
      sub_2355BC740();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
    }
    else
    {
      sub_23557DE84((uint64_t)v77, &qword_26880C698);
    }
    id v47 = objc_allocWithZone(MEMORY[0x263F08D38]);
    os_log_type_t v48 = (void *)sub_2355BCC40();
    id v49 = objc_msgSend(v47, sel_initWithActivityType_, v48);

    id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 3, v49);
  }
  else
  {
    uint64_t v61 = v15;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v34 = __swift_project_value_buffer(v19, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v34, v19);
    uint64_t v35 = a3;
    uint64_t v36 = v23;
    sub_23557DFE4(v35, v75, &qword_26880C6A0);
    unint64_t v37 = v64;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v38 = v19;
    unint64_t v39 = sub_2355BCB60();
    int v60 = sub_2355BCF70();
    if (os_log_type_enabled(v39, (os_log_type_t)v60))
    {
      uint64_t v57 = v20;
      uint64_t v58 = v38;
      uint64_t v59 = v36;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v77[0] = v41;
      *(_DWORD *)uint64_t v40 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_2355745F0(v63, v37, v77);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v40 + 12) = 2080;
      uint64_t v42 = (uint64_t)v61;
      sub_23557DFE4(v75, (uint64_t)v61, &qword_26880C6A0);
      if (v28(v42, 1, v26) == 1)
      {
        sub_23557DE84(v42, &qword_26880C6A0);
        unint64_t v43 = v71;
        swift_bridgeObjectRetain();
        unint64_t v44 = v43;
        id v45 = v59;
        uint64_t v46 = v62;
      }
      else
      {
        uint64_t v46 = sub_2355BC870();
        unint64_t v44 = v51;
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v42, v26);
        id v45 = v59;
      }
      uint64_t v52 = v57;
      uint64_t v76 = sub_2355745F0(v46, v44, v77);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23557DE84(v75, &qword_26880C6A0);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v39, (os_log_type_t)v60, "INAddMediaIntentHandler#handle failed to added item into playlist %s, %s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v41, -1, -1);
      MEMORY[0x237DE3BF0](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v45, v58);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_23557DE84(v75, &qword_26880C6A0);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v36, v38);
    }
    sub_23557DFE4(v72 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v77, &qword_26880C698);
    if (v78)
    {
      __swift_project_boxed_opaque_existential_1(v77, v78);
      uint64_t v53 = v65;
      sub_2355BC1F0();
      sub_2355BC1B0();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v53, v67);
      sub_2355BC740();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
    }
    else
    {
      sub_23557DE84((uint64_t)v77, &qword_26880C698);
    }
    id v54 = objc_allocWithZone(MEMORY[0x263F08D38]);
    int v55 = (void *)sub_2355BCC40();
    id v49 = objc_msgSend(v54, sel_initWithActivityType_, v55);

    id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v49);
  }
  uint64_t v56 = v50;

  v73(v56);
}

void sub_23558FE58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(void *), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v59 = a8;
  unint64_t v60 = a3;
  uint64_t v63 = a7;
  unint64_t v64 = a6;
  unint64_t v61 = a5;
  uint64_t v57 = a4;
  uint64_t v58 = a2;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C6A0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v51 - v14;
  uint64_t v16 = sub_2355BCB80();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v62 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v51 - v20;
  uint64_t v22 = sub_2355BC880();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  if (v24(a1, 1, v22) == 1)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v16, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v25, v16);
    uint64_t v26 = sub_2355BCB60();
    os_log_type_t v27 = sub_2355BCF60();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_23556D000, v26, v27, "INAddMediaIntentHandler#handle successfully added item into playlist", v28, 2u);
      MEMORY[0x237DE3BF0](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v16);
    id v29 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v30 = (void *)sub_2355BCC40();
    id v31 = objc_msgSend(v29, sel_initWithActivityType_, v30);

    id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 3, v31);
  }
  else
  {
    int v55 = v13;
    uint64_t v59 = a9;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v16, (uint64_t)qword_26880D108);
    uint64_t v34 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v62, v33, v16);
    sub_23557DFE4(a1, (uint64_t)v15, &qword_26880C6A0);
    uint64_t v35 = v16;
    unint64_t v36 = v60;
    swift_bridgeObjectRetain_n();
    uint64_t v56 = v15;
    swift_bridgeObjectRetain_n();
    unint64_t v37 = sub_2355BCB60();
    int v54 = sub_2355BCF70();
    if (os_log_type_enabled(v37, (os_log_type_t)v54))
    {
      uint64_t v52 = v17;
      os_log_t v53 = v37;
      uint64_t v38 = v35;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v66 = v40;
      *(_DWORD *)uint64_t v39 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_2355745F0(v58, v36, &v66);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v39 + 12) = 2080;
      uint64_t v41 = (uint64_t)v55;
      uint64_t v42 = (uint64_t)v56;
      sub_23557DFE4((uint64_t)v56, (uint64_t)v55, &qword_26880C6A0);
      if (v24(v41, 1, v22) == 1)
      {
        sub_23557DE84(v41, &qword_26880C6A0);
        unint64_t v43 = v61;
        swift_bridgeObjectRetain();
        unint64_t v44 = v43;
        uint64_t v45 = v57;
      }
      else
      {
        uint64_t v45 = sub_2355BC870();
        unint64_t v44 = v46;
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v41, v22);
      }
      uint64_t v65 = sub_2355745F0(v45, v44, &v66);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23557DE84(v42, &qword_26880C6A0);
      swift_bridgeObjectRelease();
      os_log_t v47 = v53;
      _os_log_impl(&dword_23556D000, v53, (os_log_type_t)v54, "INAddMediaIntentHandler#handle failed to added item into playlist %s, %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v40, -1, -1);
      MEMORY[0x237DE3BF0](v39, -1, -1);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v62, v38);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_23557DE84((uint64_t)v56, &qword_26880C6A0);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v34, v35);
    }
    id v48 = objc_allocWithZone(MEMORY[0x263F08D38]);
    id v49 = (void *)sub_2355BCC40();
    id v31 = objc_msgSend(v48, sel_initWithActivityType_, v49);

    id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v31);
  }
  id v50 = v32;

  v64(v50);
}

uint64_t sub_235590504(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

void sub_2355905AC(void (*a1)(NSObject **), uint64_t a2, void *a3, char a4, NSObject *a5, char *a6)
{
  uint64_t v132 = a6;
  uint64_t v135 = a5;
  uint64_t v10 = sub_2355BCBD0();
  uint64_t v126 = *(void *)(v10 - 8);
  uint64_t v127 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v124 = (char *)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v125 = (char *)&v116 - v13;
  uint64_t v129 = sub_2355BC200();
  uint64_t v131 = *(void *)(v129 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v129);
  unint64_t v122 = (char *)&v116 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v123 = (char *)&v116 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v116 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v116 - v21;
  uint64_t v130 = sub_2355BC1E0();
  uint64_t v133 = *(void *)(v130 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v130);
  uint64_t v25 = (char *)&v116 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  os_log_type_t v27 = (char *)&v116 - v26;
  uint64_t v28 = sub_2355BCB80();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v138 = v28;
  uint64_t v139 = v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  id v32 = (char *)&v116 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v134 = (uint64_t *)((char *)&v116 - v34);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v128 = (char *)&v116 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)&v116 - v37;
  uint64_t v39 = swift_allocObject();
  uint64_t v136 = a2;
  uint64_t v137 = a1;
  *(void *)(v39 + 16) = a1;
  *(void *)(v39 + 24) = a2;
  uint64_t v40 = v39;
  swift_retain();
  if ((a4 & 1) == 0)
  {
    id v41 = a3;
    uint64_t v42 = a3;
    if (objc_msgSend(v41, sel_type) == (id)6)
    {
      swift_release();
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v43 = v138;
      uint64_t v44 = __swift_project_value_buffer(v138, (uint64_t)qword_26880D108);
      (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v32, v44, v43);
      uint64_t v45 = v41;
      unint64_t v46 = sub_2355BCB60();
      os_log_type_t v47 = sub_2355BCF80();
      if (os_log_type_enabled(v46, v47))
      {
        id v48 = (uint8_t *)swift_slowAlloc();
        uint64_t v134 = (void *)swift_slowAlloc();
        *(_DWORD *)id v48 = 138543362;
        id v140 = v45;
        id v49 = v45;
        id v50 = v45;
        sub_2355BD1B0();
        uint64_t v51 = v134;
        *uint64_t v134 = v42;

        uint64_t v45 = v49;
        uint64_t v43 = v138;
        _os_log_impl(&dword_23556D000, v46, v47, "INAddMediaIntentHandlerresolveMediaItem successfully resolved podcast show: %{public}@", v48, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v51, -1, -1);
        MEMORY[0x237DE3BF0](v48, -1, -1);
      }
      else
      {

        unint64_t v46 = v45;
      }
      uint64_t v72 = v137;
      uint64_t v73 = v135;

      (*(void (**)(char *, uint64_t))(v139 + 8))(v32, v43);
      uint64_t v142 = sub_23557DC00(0, &qword_26880C678);
      uint64_t v143 = MEMORY[0x263F6CC50];
      id v140 = v73;
      uint64_t v74 = v73;
      sub_2355BCEF0();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v75 = swift_allocObject();
      *(_OWORD *)(v75 + 16) = xmmword_2355BDD80;
      sub_23557DC00(0, &qword_26880C690);
      *(void *)(v75 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v45);
      id v140 = v75;
      sub_2355BCDD0();
      v72(&v140);
      swift_bridgeObjectRelease();

      return;
    }
    uint64_t v121 = a3;
    id v120 = v41;
    id v62 = objc_msgSend(v41, sel_identifier);
    if (!v62) {
      goto LABEL_34;
    }
    uint64_t v63 = v62;
    sub_2355BCC50();

    sub_2355BC250();
    swift_allocObject();
    uint64_t v64 = sub_2355BC260();
    if (!v64) {
      goto LABEL_34;
    }
    uint64_t v119 = v64;
    sub_2355BC1F0();
    sub_2355BC1C0();
    uint64_t v65 = *(void (**)(char *, uint64_t))(v133 + 8);
    v133 += 8;
    uint64_t v118 = v65;
    v65(v27, v130);
    uint64_t v66 = *MEMORY[0x263F6CAB0];
    uint64_t v67 = v129;
    uint64_t v117 = *(void (**)(char *, uint64_t, uint64_t))(v131 + 104);
    v117(v20, v66, v129);
    sub_23559DD1C((unint64_t *)&unk_26880C6B8, MEMORY[0x263F6CAC0]);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v140 == v144 && v141 == v145) {
      char v68 = 1;
    }
    else {
      char v68 = sub_2355BD2F0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v76 = *(void (**)(char *, uint64_t))(v131 + 8);
    v76(v20, v67);
    v76(v22, v67);
    if ((v68 & 1) == 0)
    {
      sub_2355BC1F0();
      uint64_t v77 = v123;
      sub_2355BC1C0();
      v118(v25, v130);
      uint64_t v78 = v122;
      v117(v122, *MEMORY[0x263F6CAB8], v67);
      sub_2355BCD70();
      sub_2355BCD70();
      if (v140 == v144 && v141 == v145)
      {
        swift_bridgeObjectRelease_n();
        v76(v78, v67);
        v76(v77, v67);
      }
      else
      {
        uint64_t v79 = v67;
        char v80 = sub_2355BD2F0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v76(v78, v79);
        v76(v77, v79);
        if ((v80 & 1) == 0) {
          goto LABEL_32;
        }
      }
    }
    uint64_t v81 = v135;
    id v82 = [v135 mediaDestination];
    if (v82)
    {
      unint64_t v83 = v82;
      uint64_t v84 = v124;
      sub_2355BCBC0();

      uint64_t v86 = v126;
      uint64_t v85 = v127;
      uint64_t v87 = v125;
      (*(void (**)(char *, char *, uint64_t))(v126 + 32))(v125, v84, v127);
      if ((*(unsigned int (**)(char *, uint64_t))(v86 + 88))(v87, v85) == *MEMORY[0x263F8F1D0])
      {
        swift_release();
        (*(void (**)(char *, uint64_t))(v86 + 96))(v87, v85);
        swift_bridgeObjectRelease();
        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v88 = v138;
        uint64_t v89 = __swift_project_value_buffer(v138, (uint64_t)qword_26880D108);
        (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v128, v89, v88);
        id v90 = v120;
        unint64_t v91 = sub_2355BCB60();
        os_log_type_t v92 = sub_2355BCF80();
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v93 = (uint8_t *)swift_slowAlloc();
          uint64_t v94 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v93 = 138543362;
          id v140 = v90;
          uint64_t v95 = v90;
          uint64_t v81 = v135;
          sub_2355BD1B0();
          *uint64_t v94 = v121;

          _os_log_impl(&dword_23556D000, v91, v92, "INAddMediaIntentHandler#resolveMediaItem successfully resolved music item: %{public}@ without checking subscription or iCloudLibrarySync status", v93, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v94, -1, -1);
          MEMORY[0x237DE3BF0](v93, -1, -1);
        }
        else
        {

          unint64_t v91 = v90;
        }
        uint64_t v113 = v137;

        (*(void (**)(char *, uint64_t))(v139 + 8))(v128, v88);
        uint64_t v142 = sub_23557DC00(0, &qword_26880C678);
        uint64_t v143 = MEMORY[0x263F6CC50];
        id v140 = v81;
        id v114 = v81;
        sub_2355BCEF0();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v115 = swift_allocObject();
        *(_OWORD *)(v115 + 16) = xmmword_2355BDD80;
        sub_23557DC00(0, &qword_26880C690);
        *(void *)(v115 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v90);
        id v140 = v115;
        sub_2355BCDD0();
        v113(&v140);
        swift_bridgeObjectRelease();

LABEL_40:
        swift_release();
        return;
      }
      swift_release();
      (*(void (**)(char *, uint64_t))(v86 + 8))(v87, v85);
LABEL_34:
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v96 = v40;
      uint64_t v97 = v138;
      uint64_t v98 = __swift_project_value_buffer(v138, (uint64_t)qword_26880D108);
      os_log_type_t v99 = v134;
      (*(void (**)(void *, uint64_t, uint64_t))(v139 + 16))(v134, v98, v97);
      BOOL v100 = v120;
      uint64_t v101 = sub_2355BCB60();
      os_log_type_t v102 = sub_2355BCF80();
      if (os_log_type_enabled(v101, v102))
      {
        id v103 = (uint8_t *)swift_slowAlloc();
        uint64_t v104 = (void *)swift_slowAlloc();
        *(_DWORD *)id v103 = 138543362;
        id v140 = v100;
        unint64_t v105 = v100;
        sub_2355BD1B0();
        void *v104 = v121;

        uint64_t v97 = v138;
        _os_log_impl(&dword_23556D000, v101, v102, "INAddMediaIntentHandler#resolveMediaItem for music item: %{public}@...", v103, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v104, -1, -1);
        unint64_t v106 = v103;
        os_log_type_t v99 = v134;
        MEMORY[0x237DE3BF0](v106, -1, -1);
      }
      else
      {

        uint64_t v101 = v100;
      }
      uint64_t v107 = v132;

      (*(void (**)(void *, uint64_t))(v139 + 8))(v99, v97);
      __swift_project_boxed_opaque_existential_1(&v107[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription], *(void *)&v107[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription + 24]);
      uint64_t v108 = (void *)swift_allocObject();
      v108[2] = sub_23559DB78;
      v108[3] = v96;
      uint64_t v109 = v135;
      v108[4] = v107;
      v108[5] = v109;
      v108[6] = v100;
      uint64_t v110 = v100;
      uint64_t v111 = v109;
      uint64_t v112 = v107;
      sub_2355BC7A0();

      goto LABEL_40;
    }
LABEL_32:
    swift_release();
    goto LABEL_34;
  }
  swift_release();
  uint64_t v52 = qword_26880C108;
  id v53 = a3;
  if (v52 != -1) {
    swift_once();
  }
  uint64_t v54 = v138;
  uint64_t v55 = __swift_project_value_buffer(v138, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v38, v55, v54);
  uint64_t v56 = v53;
  uint64_t v57 = sub_2355BCB60();
  os_log_type_t v58 = sub_2355BCF70();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v121 = a3;
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    unint64_t v60 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 138543362;
    id v140 = v56;
    unint64_t v61 = v56;
    sub_2355BD1B0();
    *unint64_t v60 = v121;

    uint64_t v54 = v138;
    _os_log_impl(&dword_23556D000, v57, v58, "INAddMediaIntentHandlerresolveMediaItem received failure result: %{public}@", v59, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v60, -1, -1);
    MEMORY[0x237DE3BF0](v59, -1, -1);
  }
  else
  {

    uint64_t v57 = v56;
  }
  uint64_t v69 = v137;

  (*(void (**)(char *, uint64_t))(v139 + 8))(v38, v54);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v70 = swift_allocObject();
  *(_OWORD *)(v70 + 16) = xmmword_2355BDD80;
  *(void *)(v70 + 32) = v56;
  id v140 = v70;
  sub_2355BCDD0();
  unint64_t v71 = v56;
  v69(&v140);
  swift_bridgeObjectRelease();
}

uint64_t sub_2355916BC(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v44 = a6;
  uint64_t v45 = a2;
  uint64_t v39 = a4;
  uint64_t v40 = a5;
  uint64_t v46 = a3;
  uint64_t v6 = sub_2355BCB80();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  MEMORY[0x270FA5388](v6);
  id v41 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2355BC890();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2355BC830();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v39 - v17;
  sub_2355BC6D0();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, *MEMORY[0x263F6CC20], v12);
  sub_23559DD1C(&qword_26880C6C8, MEMORY[0x263F6CC28]);
  sub_2355BCD70();
  sub_2355BCD70();
  uint64_t v20 = v47;
  uint64_t v19 = v48;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  v21(v16, v12);
  v21(v18, v12);
  if (v19 == v20)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v39 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(void *)(v39 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24));
    uint64_t v22 = v40;
    uint64_t v48 = (uint64_t)v40;
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F6CC40], v8);
    sub_23557DC00(0, &qword_26880C678);
    sub_2355BC8B0();
    uint64_t v24 = v23;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if (v24)
    {
      sub_2355BCC70();
      swift_bridgeObjectRelease();
    }
    uint64_t v34 = (void *)swift_allocObject();
    uint64_t v35 = v46;
    v34[2] = v45;
    v34[3] = v35;
    uint64_t v36 = v44;
    v34[4] = v44;
    v34[5] = v22;
    swift_bridgeObjectRetain();
    swift_retain();
    id v37 = v36;
    id v38 = v22;
    sub_2355BC440();
    swift_bridgeObjectRelease_n();
    return swift_release();
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v25 = v43;
    uint64_t v26 = __swift_project_value_buffer(v43, (uint64_t)qword_26880D108);
    uint64_t v28 = v41;
    uint64_t v27 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v41, v26, v25);
    uint64_t v29 = sub_2355BCB60();
    os_log_type_t v30 = sub_2355BCF70();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_23556D000, v29, v30, "INAddMediaIntentHandler#resolveMediaItem the user is not a subscriber", v31, 2u);
      MEMORY[0x237DE3BF0](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v25);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_2355BDD80;
    *(void *)(v32 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 2, v39);
    uint64_t v48 = v32;
    sub_2355BCDD0();
    v45(v48);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_235591C20(char a1, void (*a2)(void), uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = sub_2355BCB80();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - v15;
  if (a1)
  {
    uint64_t v39 = a3;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v10, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v17, v10);
    uint64_t v18 = a4;
    uint64_t v19 = sub_2355BCB60();
    os_log_type_t v20 = sub_2355BCF80();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      id v37 = a5;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v35 = (void *)swift_slowAlloc();
      uint64_t v36 = v22;
      *(_DWORD *)uint64_t v22 = 138543362;
      v40[0] = v18;
      uint64_t v23 = v18;
      id v38 = a2;
      uint64_t v24 = v23;
      sub_2355BD1B0();
      uint64_t v25 = v35;
      *uint64_t v35 = v18;

      a2 = v38;
      uint64_t v26 = v36;
      _os_log_impl(&dword_23556D000, v19, v20, "INAddMediaIntentHandler#resolveMediaItem successfully resolved music item: %{public}@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v25, -1, -1);
      a5 = v37;
      MEMORY[0x237DE3BF0](v26, -1, -1);
    }
    else
    {

      uint64_t v19 = v18;
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    v40[3] = sub_23557DC00(0, &qword_26880C678);
    v40[4] = MEMORY[0x263F6CC50];
    v40[0] = a5;
    id v33 = a5;
    sub_2355BCEF0();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, &qword_26880C690);
    id v32 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v18);
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v10, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v27, v10);
    uint64_t v28 = sub_2355BCB60();
    os_log_type_t v29 = sub_2355BCF70();
    if (os_log_type_enabled(v28, v29))
    {
      os_log_type_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v30 = 0;
      _os_log_impl(&dword_23556D000, v28, v29, "INAddMediaIntentHandler#resolveMediaItem iCloud library sync required", v30, 2u);
      MEMORY[0x237DE3BF0](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_2355BDD80;
    id v32 = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F101C8]);
  }
  *(void *)(v31 + 32) = v32;
  v40[0] = v31;
  sub_2355BCDD0();
  a2(v40[0]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2355920B8(void *a1, uint64_t a2, uint64_t a3)
{
  v21[0] = a1;
  uint64_t v5 = sub_2355BCB50();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = qword_26880C118;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  id v14 = (id)logObject;
  sub_2355BCB30();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = "addMediaIntentHandlerResolveNowPlayingItem";
  *(void *)(v17 + 24) = 42;
  *(unsigned char *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  uint64_t v18 = (uint64_t (**)(uint64_t))(v17 + v16);
  *uint64_t v18 = sub_23559D5E0;
  v18[1] = (uint64_t (*)(uint64_t))v12;
  swift_retain();
  sub_2355BD140();
  sub_2355BCB20();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_23559D5E8;
  *(void *)(v19 + 24) = v17;
  swift_retain();
  sub_23559235C((uint64_t)sub_23559D5EC, v19, (char *)v21[1], v21[0]);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

uint64_t sub_23559235C(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v8 = sub_2355BCB80();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a2;
  uint64_t v13 = qword_26880C108;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  unint64_t v15 = sub_2355BCB60();
  os_log_type_t v16 = sub_2355BCF60();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_23556D000, v15, v16, "INAddMediaIntentHandler#resolveNowPlayingItem resolving...", v17, 2u);
    MEMORY[0x237DE3BF0](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_project_boxed_opaque_existential_1(&a3[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying], *(void *)&a3[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying + 24]);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = sub_23559D630;
  void v18[3] = v12;
  v18[4] = a3;
  void v18[5] = a4;
  uint64_t v19 = a3;
  id v20 = a4;
  sub_2355BC6A0();
  return swift_release();
}

void sub_2355925AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void), uint64_t a9, char *a10, void *a11)
{
  uint64_t v14 = sub_2355BCB80();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    __swift_project_boxed_opaque_existential_1(&a10[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying], *(void *)&a10[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying + 24]);
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = a8;
    void v18[3] = a9;
    v18[4] = a10;
    void v18[5] = a3;
    v18[6] = a4;
    v18[7] = a11;
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v19 = a10;
    id v20 = a11;
    sub_2355BC6C0();
    swift_release();
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v14, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v21, v14);
    uint64_t v22 = sub_2355BCB60();
    os_log_type_t v23 = sub_2355BCF70();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_23556D000, v22, v23, "INAddMediaIntentHandler#resolveNowPlayingItem could not resolve currently playing app from device", v24, 2u);
      MEMORY[0x237DE3BF0](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    id v25 = objc_msgSend(self, sel_unsupportedForReason_, 6);
    a8();
  }
}

void sub_23559284C(int a1, void (*a2)(void), uint64_t a3, char *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v34 = a4;
  uint64_t v35 = a7;
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  uint64_t v36 = a2;
  uint64_t v37 = a3;
  int v38 = a1;
  uint64_t v7 = sub_2355BCB80();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v32 - v12;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_26880D108);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v15(v13, v14, v7);
  uint64_t v16 = sub_2355BCB60();
  os_log_type_t v17 = sub_2355BCF50();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 67240192;
    int v39 = v38;
    sub_2355BD1B0();
    _os_log_impl(&dword_23556D000, v16, v17, "INAddMediaIntentHandler#resolveNowPlayingItem playback state: %{public}u", v18, 8u);
    MEMORY[0x237DE3BF0](v18, -1, -1);
  }

  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v13, v7);
  int v20 = v38;
  if (v38 && v38 != 3)
  {
    id v25 = v34;
    __swift_project_boxed_opaque_existential_1(&v34[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying], *(void *)&v34[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying + 24]);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = v35;
    void v26[2] = v36;
    uint64_t v28 = v32;
    uint64_t v29 = v33;
    v26[3] = v37;
    v26[4] = v28;
    v26[5] = v29;
    v26[6] = v25;
    v26[7] = v27;
    swift_retain();
    swift_bridgeObjectRetain();
    id v30 = v25;
    id v31 = v27;
    sub_2355BC6B0();
    swift_release();
  }
  else
  {
    v15(v11, v14, v7);
    uint64_t v21 = sub_2355BCB60();
    os_log_type_t v22 = sub_2355BCF70();
    if (os_log_type_enabled(v21, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v23 = 67240192;
      int v40 = v20;
      sub_2355BD1B0();
      _os_log_impl(&dword_23556D000, v21, v22, "INAddMediaIntentHandler#resolveNowPlayingItem nothing playing - state: %{public}u", v23, 8u);
      MEMORY[0x237DE3BF0](v23, -1, -1);
    }

    v19(v11, v7);
    id v24 = objc_msgSend(self, sel_unsupportedForReason_, 6);
    v36();
  }
}

void sub_235592BF4(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint8_t *a5, char *a6, void *a7)
{
  uint64_t v194 = a7;
  uint64_t v195 = a6;
  uint64_t v207 = a4;
  unint64_t v208 = a5;
  unint64_t v209 = a2;
  uint64_t v210 = a3;
  uint64_t v211 = a1;
  uint64_t v7 = sub_2355BC200();
  uint64_t v200 = *(void *)(v7 - 8);
  uint64_t v201 = v7;
  MEMORY[0x270FA5388](v7);
  v199 = &v170[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v204 = sub_2355BC240();
  uint64_t v198 = *(void *)(v204 - 8);
  MEMORY[0x270FA5388](v204);
  v197 = &v170[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v192 = sub_2355BC890();
  uint64_t v191 = *(void *)(v192 - 8);
  MEMORY[0x270FA5388](v192);
  v190 = &v170[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_2355BCB80();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v214 = v11;
  uint64_t v215 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v196 = &v170[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v203 = &v170[-v16];
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  id v187 = &v170[-v18];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v170[-v20];
  MEMORY[0x270FA5388](v19);
  os_log_type_t v23 = &v170[-v22];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C320);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = &v170[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v27 = sub_2355BC320();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v189 = &v170[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v206 = &v170[-v32];
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v212 = &v170[-v34];
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  char v205 = &v170[-v36];
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  int v39 = &v170[-v38];
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  uint64_t v42 = &v170[-v41];
  uint64_t v186 = v43;
  MEMORY[0x270FA5388](v40);
  uint64_t v45 = &v170[-v44];
  sub_23557DFE4(v211, (uint64_t)v26, (uint64_t *)&unk_26880C320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23557DE84((uint64_t)v26, (uint64_t *)&unk_26880C320);
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v46 = v214;
    uint64_t v47 = __swift_project_value_buffer(v214, (uint64_t)qword_26880D108);
    uint64_t v48 = v215;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v215 + 16))(v23, v47, v46);
    id v49 = sub_2355BCB60();
    os_log_type_t v50 = sub_2355BCF70();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_23556D000, v49, v50, "INAddMediaIntentHandler#resolveNowPlayingItem nowPlaying item error", v51, 2u);
      MEMORY[0x237DE3BF0](v51, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v48 + 8))(v23, v46);
    id v52 = objc_msgSend(self, sel_unsupportedForReason_, 6);
    v209();

    return;
  }
  id v53 = v21;
  uint64_t v54 = *(void (**)(char *, unsigned char *, uint64_t))(v28 + 32);
  uint64_t v179 = v28 + 32;
  v178 = v54;
  v54(v45, v26, v27);
  uint64_t v177 = sub_2355BC2E0();
  uint64_t v184 = v55;
  uint64_t v176 = sub_2355BC2B0();
  uint64_t v188 = v56;
  sub_2355BC2D0();
  swift_bridgeObjectRelease();
  uint64_t v57 = sub_2355BC2F0();
  char v59 = v58;
  sub_2355BC300();
  uint64_t v60 = sub_2355BC2C0();
  uint64_t v61 = v27;
  uint64_t v62 = v28;
  uint64_t v63 = (uint64_t)v45;
  if (v64)
  {
    uint64_t v65 = v215;
    if (v59)
    {
LABEL_10:
      uint64_t v66 = v65;
      uint64_t v67 = 0;
      int v68 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v65 = v215;
    if ((v59 & 1) == 0 && v60 == v57) {
      goto LABEL_10;
    }
  }
  uint64_t v66 = v65;
  uint64_t v67 = sub_2355BC2C0();
  int v68 = v69 & 1;
LABEL_13:
  int v181 = v68;
  uint64_t v180 = v67;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v70 = __swift_project_value_buffer(v214, (uint64_t)qword_26880D108);
  unint64_t v71 = *(void (**)(void))(v66 + 16);
  uint64_t v72 = v53;
  uint64_t v193 = v70;
  uint64_t v183 = v66 + 16;
  uint64_t v182 = (void (*)(unsigned char *, uint64_t, uint64_t))v71;
  v71(v53);
  uint64_t v73 = v28 + 16;
  uint64_t v74 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v28 + 16);
  v74(v42, v63, v61);
  v74(v39, v63, v61);
  uint64_t v75 = v39;
  uint64_t v76 = v205;
  v74(v205, v63, v61);
  v74(v212, v63, v61);
  uint64_t v77 = v206;
  uint64_t v211 = v63;
  uint64_t v175 = v73;
  uint64_t v174 = v74;
  v74(v206, v63, v61);
  v185 = v72;
  uint64_t v78 = sub_2355BCB60();
  os_log_type_t v79 = sub_2355BCF80();
  int v80 = v79;
  BOOL v81 = os_log_type_enabled(v78, v79);
  uint64_t v213 = v61;
  uint64_t v202 = v62;
  if (v81)
  {
    uint64_t v82 = swift_slowAlloc();
    os_log_t v172 = v78;
    uint64_t v83 = v82;
    uint64_t v173 = swift_slowAlloc();
    uint64_t v218 = v173;
    *(_DWORD *)uint64_t v83 = 136447234;
    int v171 = v80;
    uint64_t v216 = sub_2355BC2E0();
    uint64_t v217 = v84;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
    uint64_t v85 = sub_2355BCC60();
    uint64_t v216 = sub_2355745F0(v85, v86, &v218);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    uint64_t v87 = *(void (**)(unsigned char *, uint64_t))(v202 + 8);
    v87(v42, v213);
    *(_WORD *)(v83 + 12) = 2082;
    uint64_t v216 = sub_2355BC2B0();
    uint64_t v217 = v88;
    uint64_t v89 = sub_2355BCC60();
    uint64_t v216 = sub_2355745F0(v89, v90, &v218);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    v87(v75, v213);
    *(_WORD *)(v83 + 22) = 2082;
    uint64_t v216 = sub_2355BC2D0();
    uint64_t v217 = v91;
    uint64_t v92 = sub_2355BCC60();
    uint64_t v216 = sub_2355745F0(v92, v93, &v218);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    v87(v76, v213);
    *(_WORD *)(v83 + 32) = 2082;
    uint64_t v94 = v212;
    uint64_t v216 = sub_2355BC2F0();
    LOBYTE(v217) = v95 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C688);
    uint64_t v96 = sub_2355BCC60();
    uint64_t v216 = sub_2355745F0(v96, v97, &v218);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    v87(v94, v213);
    *(_WORD *)(v83 + 42) = 2082;
    uint64_t v216 = sub_2355BC300();
    LOBYTE(v217) = v98 & 1;
    uint64_t v99 = sub_2355BCC60();
    uint64_t v216 = sub_2355745F0(v99, v100, &v218);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    v87(v77, v213);
    uint64_t v62 = v202;
    uint64_t v61 = v213;
    os_log_t v101 = v172;
    _os_log_impl(&dword_23556D000, v172, (os_log_type_t)v171, "INAddMediaIntentHandler#resolveNowPlayingItem now playing: title:%{public}s trackArtist:%{public}s album:%{public}s songId:%{public}s albumId:%{public}s", (uint8_t *)v83, 0x34u);
    uint64_t v102 = v173;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v102, -1, -1);
    MEMORY[0x237DE3BF0](v83, -1, -1);
  }
  else
  {
    unint64_t v105 = *(void (**)(unsigned char *, uint64_t))(v62 + 8);
    v105(v42, v61);
    v105(v75, v61);
    v105(v76, v61);
    v105(v212, v61);
    v105(v77, v61);
  }
  uint64_t v103 = v214;
  uint64_t v212 = *(unsigned char **)(v215 + 8);
  ((void (*)(unsigned char *, uint64_t))v212)(v185, v214);
  uint64_t v104 = v208;
  uint64_t v106 = sub_2355BC570();
  uint64_t v108 = v207;
  if (v106 == v207 && v107 == v104)
  {
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v110 = v203;
    uint64_t v111 = v182;
    v182(v203, v193, v103);
    uint64_t v112 = sub_2355BCB60();
    os_log_type_t v113 = sub_2355BCF60();
    if (os_log_type_enabled(v112, v113))
    {
      id v114 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v114 = 0;
      _os_log_impl(&dword_23556D000, v112, v113, "INAddMediaIntentHandler#resolveNowPlayingItem choosing podcast type", v114, 2u);
      MEMORY[0x237DE3BF0](v114, -1, -1);
    }

    uint64_t v115 = (void (*)(unsigned char *, uint64_t))v212;
    ((void (*)(unsigned char *, uint64_t))v212)(v110, v103);
    uint64_t v116 = v211;
    uint64_t v117 = sub_2355BC300();
    if (v118)
    {
      uint64_t v126 = v196;
      v111(v196, v193, v103);
      uint64_t v127 = sub_2355BCB60();
      os_log_type_t v128 = sub_2355BCF70();
      if (os_log_type_enabled(v127, v128))
      {
        uint64_t v129 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v129 = 0;
        _os_log_impl(&dword_23556D000, v127, v128, "INAddMediaIntentHandler#resolveNowPlayingItem Unexpected nil album identifier.", v129, 2u);
        uint64_t v130 = v129;
        uint64_t v115 = (void (*)(unsigned char *, uint64_t))v212;
        MEMORY[0x237DE3BF0](v130, -1, -1);
      }

      v115(v126, v103);
      id v131 = objc_msgSend(self, sel_unsupportedForReason_, 6);
      v209();

      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v211, v213);
    }
    else
    {
      uint64_t v119 = v117;
      uint64_t v215 = sub_23557DC00(0, (unint64_t *)&qword_26880C210);
      uint64_t v216 = v119;
      sub_2355BD2E0();
      sub_2355BC2B0();
      uint64_t v120 = v198;
      uint64_t v121 = v197;
      (*(void (**)(unsigned char *, void, uint64_t))(v198 + 104))(v197, *MEMORY[0x263F6CAE0], v204);
      unint64_t v122 = v199;
      uint64_t v123 = v200;
      uint64_t v124 = v201;
      (*(void (**)(unsigned char *, void, uint64_t))(v200 + 104))(v199, *MEMORY[0x263F6CAA8], v201);
      uint64_t v125 = (void *)sub_2355BCEA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v123 + 8))(v122, v124);
      (*(void (**)(unsigned char *, uint64_t))(v120 + 8))(v121, v204);
      ((void (*)(void *, void))v209)(v125, 0);

      (*(void (**)(uint64_t, uint64_t))(v202 + 8))(v116, v213);
    }
    return;
  }
  char v109 = sub_2355BD2F0();
  swift_bridgeObjectRelease();
  if (v109) {
    goto LABEL_22;
  }
  if (v181)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v132 = v211;
    sub_2355949F8(v194, v211, v209, v210);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v132, v61);
    return;
  }
  if (sub_2355BC560() == v108 && v133 == v104)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v134 = sub_2355BD2F0();
    swift_bridgeObjectRelease();
    if ((v134 & 1) == 0) {
      goto LABEL_30;
    }
  }
  uint64_t v135 = v187;
  v182(v187, v193, v103);
  uint64_t v136 = sub_2355BCB60();
  os_log_type_t v137 = sub_2355BCF60();
  if (os_log_type_enabled(v136, v137))
  {
    uint64_t v138 = (uint8_t *)swift_slowAlloc();
    uint64_t v139 = v103;
    uint64_t v140 = swift_slowAlloc();
    uint64_t v216 = v140;
    *(_DWORD *)uint64_t v138 = 136315138;
    unint64_t v208 = v138 + 4;
    uint64_t v141 = v180;
    uint64_t v218 = v180;
    uint64_t v142 = sub_2355BD2E0();
    uint64_t v218 = sub_2355745F0(v142, v143, &v216);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v136, v137, "INAddMediaIntentHandler#resolveNowPlayingItem has persistentId, resolving to song using persistentId %s", v138, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v140, -1, -1);
    MEMORY[0x237DE3BF0](v138, -1, -1);

    ((void (*)(unsigned char *, uint64_t))v212)(v135, v139);
  }
  else
  {

    ((void (*)(unsigned char *, uint64_t))v212)(v135, v103);
    uint64_t v141 = v180;
  }
  uint64_t v144 = *(void *)&v195[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
  uint64_t v145 = *(unsigned char **)&v195[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 32];
  id v146 = __swift_project_boxed_opaque_existential_1(&v195[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], v144);
  uint64_t v216 = v141;
  uint64_t v147 = sub_2355BD2E0();
  uint64_t v149 = v148;
  uint64_t v216 = (uint64_t)v194;
  uint64_t v150 = v191;
  uint64_t v151 = v190;
  uint64_t v152 = v192;
  (*(void (**)(unsigned char *, void, uint64_t))(v191 + 104))(v190, *MEMORY[0x263F6CC40], v192);
  sub_23557DC00(0, &qword_26880C678);
  sub_2355BC8B0();
  uint64_t v154 = v153;
  (*(void (**)(unsigned char *, uint64_t))(v150 + 8))(v151, v152);
  uint64_t v214 = v144;
  uint64_t v215 = (uint64_t)v146;
  uint64_t v212 = v145;
  uint64_t v207 = v147;
  unint64_t v208 = v149;
  if (v154)
  {
    sub_2355BCC70();
    swift_bridgeObjectRelease();
  }
  uint64_t v155 = v189;
  uint64_t v156 = v211;
  uint64_t v157 = v213;
  v174(v189, v211, v213);
  uint64_t v158 = v202;
  unint64_t v159 = (*(unsigned __int8 *)(v202 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v202 + 80);
  uint64_t v160 = (void *)swift_allocObject();
  uint64_t v161 = v194;
  uint64_t v162 = v180;
  v160[2] = v194;
  v160[3] = v162;
  uint64_t v163 = v210;
  v160[4] = v209;
  v160[5] = v163;
  uint64_t v164 = v184;
  v160[6] = v177;
  v160[7] = v164;
  uint64_t v165 = v188;
  v160[8] = v176;
  v160[9] = v165;
  uint64_t v166 = (char *)v160 + v159;
  uint64_t v167 = v195;
  v160[10] = v195;
  v178(v166, v155, v157);
  swift_bridgeObjectRetain();
  id v168 = v161;
  swift_retain();
  id v169 = v167;
  sub_2355BC450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v156, v157);
}

void sub_235594028(char a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v77 = a7;
  uint64_t v78 = a8;
  void v70[2] = a6;
  uint64_t v80 = a5;
  BOOL v81 = a4;
  uint64_t v79 = a3;
  uint64_t v13 = sub_2355BC240();
  uint64_t v71 = *(void *)(v13 - 8);
  uint64_t v72 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v75 = (char *)v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_2355BC200();
  uint64_t v74 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v73 = (char *)v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2355BCB80();
  uint64_t v82 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)v70 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)v70 - v23;
  uint64_t v25 = sub_2355BCBD0();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)v70 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)v70 - v30;
  if (a1)
  {
    id v32 = objc_msgSend(a2, sel_mediaDestination);
    if (v32
      && (uint64_t v33 = v32,
          sub_2355BCBC0(),
          v33,
          (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v31, v29, v25),
          LODWORD(v33) = (*(uint64_t (**)(char *, uint64_t))(v26 + 88))(v31, v25),
          int v34 = *MEMORY[0x263F8F1C8],
          (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v25),
          v33 == v34))
    {
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v35 = __swift_project_value_buffer(v16, (uint64_t)qword_26880D108);
      uint64_t v36 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v24, v35, v16);
      uint64_t v37 = sub_2355BCB60();
      os_log_type_t v38 = sub_2355BCF60();
      if (os_log_type_enabled(v37, v38))
      {
        int v39 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        *(_DWORD *)int v39 = 136446210;
        uint64_t v83 = v79;
        v84[0] = v40;
        uint64_t v41 = sub_2355BD2E0();
        uint64_t v83 = sub_2355745F0(v41, v42, v84);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23556D000, v37, v38, "INAddMediaIntentHandler#resolveNowPlayingItem The item %{public}s asked to add to library and exists in library, returning error dialog.", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v40, -1, -1);
        MEMORY[0x237DE3BF0](v39, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v36 + 8))(v24, v16);
      id v43 = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F101C0]);
      v81();
    }
    else
    {
      if (qword_26880C108 != -1) {
        swift_once();
      }
      v70[1] = a9;
      uint64_t v54 = __swift_project_value_buffer(v16, (uint64_t)qword_26880D108);
      uint64_t v55 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v22, v54, v16);
      uint64_t v56 = sub_2355BCB60();
      os_log_type_t v57 = sub_2355BCF60();
      if (os_log_type_enabled(v56, v57))
      {
        char v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        *(_DWORD *)char v58 = 136446210;
        v70[0] = v58 + 4;
        uint64_t v60 = v79;
        uint64_t v83 = v79;
        v84[0] = v59;
        uint64_t v61 = sub_2355BD2E0();
        uint64_t v83 = sub_2355745F0(v61, v62, v84);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23556D000, v56, v57, "INAddMediaIntentHandler#resolveNowPlayingItem The item %{public}s exists in library and target is not library.", v58, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v59, -1, -1);
        MEMORY[0x237DE3BF0](v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v55 + 8))(v22, v16);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v55 + 8))(v22, v16);
        uint64_t v60 = v79;
      }
      uint64_t v64 = v71;
      uint64_t v63 = v72;
      sub_23557DC00(0, (unint64_t *)&qword_26880C210);
      v84[0] = v60;
      sub_2355BD2E0();
      uint64_t v66 = v73;
      uint64_t v65 = v74;
      uint64_t v67 = v76;
      (*(void (**)(char *, void, uint64_t))(v74 + 104))(v73, *MEMORY[0x263F6CAB0], v76);
      int v68 = v75;
      (*(void (**)(char *, void, uint64_t))(v64 + 104))(v75, *MEMORY[0x263F6CAE0], v63);
      char v69 = (void *)sub_2355BCEA0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v68, v63);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v67);
      ((void (*)(void *, void))v81)(v69, 0);
    }
  }
  else
  {
    uint64_t v78 = a2;
    uint64_t v44 = a11;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v45 = __swift_project_value_buffer(v16, (uint64_t)qword_26880D108);
    uint64_t v46 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v19, v45, v16);
    uint64_t v47 = sub_2355BCB60();
    os_log_type_t v48 = sub_2355BCF60();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v77 = a11;
      id v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v76 = v16;
      uint64_t v51 = v50;
      *(_DWORD *)id v49 = 136446210;
      uint64_t v83 = v79;
      v84[0] = v50;
      uint64_t v52 = sub_2355BD2E0();
      uint64_t v83 = sub_2355745F0(v52, v53, v84);
      uint64_t v44 = v77;
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v47, v48, "INAddMediaIntentHandler#resolveNowPlayingItem The item %{public}s doesn't exist in the library and target is library or playlist. This can happen if the persistentID is present due to cached content", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v51, -1, -1);
      MEMORY[0x237DE3BF0](v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v46 + 8))(v19, v76);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v46 + 8))(v19, v16);
    }
    sub_2355949F8(v78, v44, v81, v80);
  }
}

void sub_2355949F8(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  char v98 = a3;
  uint64_t v99 = a4;
  uint64_t v5 = sub_2355BC890();
  uint64_t v89 = *(void *)(v5 - 8);
  uint64_t v90 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v88 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2355BCB80();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v83 = (char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  BOOL v81 = (char *)&v78 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v80 = (char *)&v78 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v85 = (char *)&v78 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v84 = (char *)&v78 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v78 - v19;
  uint64_t v86 = sub_2355BC2E0();
  uint64_t v95 = v21;
  uint64_t v91 = sub_2355BC2B0();
  uint64_t v97 = v22;
  uint64_t v78 = sub_2355BC2D0();
  uint64_t v96 = v23;
  uint64_t v93 = sub_2355BC2F0();
  int v92 = v24;
  uint64_t v82 = sub_2355BC300();
  int v79 = v25;
  uint64_t v94 = a1;
  id v26 = objc_msgSend(a1, sel_mediaSearch);
  if (v26)
  {
    uint64_t v27 = v26;
    unint64_t v28 = (unint64_t)objc_msgSend(v26, sel_mediaType);
  }
  else
  {
    unint64_t v28 = 0;
  }
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v29 = __swift_project_value_buffer(v7, (uint64_t)qword_26880D108);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v30(v20, v29, v7);
  uint64_t v31 = sub_2355BCB60();
  os_log_type_t v32 = sub_2355BCF60();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 134349056;
    unint64_t v100 = v28;
    sub_2355BD1B0();
    _os_log_impl(&dword_23556D000, v31, v32, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId choosing music type for search type: %{public}ld", v33, 0xCu);
    MEMORY[0x237DE3BF0](v33, -1, -1);
  }

  int v34 = *(void (**)(char *, uint64_t))(v8 + 8);
  v34(v20, v7);
  if (v28 > 0x12) {
    goto LABEL_24;
  }
  if (((1 << v28) & 0x40023) == 0)
  {
    if (v28 == 2)
    {
      swift_bridgeObjectRelease();
      if ((v79 & 1) == 0)
      {
        v30(v80, v29, v7);
        id v49 = sub_2355BCB60();
        os_log_type_t v50 = sub_2355BCF60();
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v51 = 0;
          _os_log_impl(&dword_23556D000, v49, v50, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId building album item from now playing...", v51, 2u);
          MEMORY[0x237DE3BF0](v51, -1, -1);
        }

        v34(v80, v7);
        __swift_project_boxed_opaque_existential_1((void *)(v87 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(void *)(v87 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24));
        unint64_t v100 = v82;
        sub_2355BD2E0();
        unint64_t v100 = (unint64_t)v94;
        unint64_t v53 = v88;
        uint64_t v52 = v89;
        uint64_t v54 = v90;
        (*(void (**)(char *, void, uint64_t))(v89 + 104))(v88, *MEMORY[0x263F6CC40], v90);
        sub_23557DC00(0, &qword_26880C678);
        sub_2355BC8B0();
        uint64_t v56 = v55;
        (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
        if (v56)
        {
          sub_2355BCC70();
          swift_bridgeObjectRelease();
        }
        uint64_t v71 = (void *)swift_allocObject();
        uint64_t v72 = v94;
        uint64_t v73 = v82;
        v71[2] = v94;
        v71[3] = v73;
        uint64_t v74 = v99;
        v71[4] = v98;
        v71[5] = v74;
        uint64_t v75 = v96;
        v71[6] = v78;
        v71[7] = v75;
        uint64_t v76 = v97;
        v71[8] = v91;
        v71[9] = v76;
        swift_bridgeObjectRetain();
        id v77 = v72;
        swift_retain();
        goto LABEL_33;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v30(v81, v29, v7);
      uint64_t v67 = sub_2355BCB60();
      os_log_type_t v68 = sub_2355BCF70();
      if (os_log_type_enabled(v67, v68))
      {
        char v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v69 = 0;
        _os_log_impl(&dword_23556D000, v67, v68, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId Unexpected nil album identifier for album request", v69, 2u);
        MEMORY[0x237DE3BF0](v69, -1, -1);
      }

      v34(v81, v7);
      id v48 = objc_msgSend(self, sel_unsupportedForReason_, 6);
LABEL_31:
      id v70 = v48;
      v98();

      return;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30(v83, v29, v7);
    os_log_type_t v57 = sub_2355BCB60();
    os_log_type_t v58 = sub_2355BCF70();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v59 = 134349056;
      unint64_t v100 = v28;
      sub_2355BD1B0();
      _os_log_impl(&dword_23556D000, v57, v58, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId unexpected media type to add: %{public}ld", v59, 0xCu);
      MEMORY[0x237DE3BF0](v59, -1, -1);
    }

    v34(v83, v7);
    id v48 = objc_msgSend(self, sel_unsupportedForReason_, 3);
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  if (v92)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v44 = v85;
    v30(v85, v29, v7);
    uint64_t v45 = sub_2355BCB60();
    os_log_type_t v46 = sub_2355BCF70();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_23556D000, v45, v46, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId Unexpected nil song identifier for song request", v47, 2u);
      MEMORY[0x237DE3BF0](v47, -1, -1);
    }

    v34(v44, v7);
    id v48 = objc_msgSend(self, sel_unsupportedForReason_, 6);
    goto LABEL_31;
  }
  uint64_t v35 = v84;
  v30(v84, v29, v7);
  uint64_t v36 = sub_2355BCB60();
  os_log_type_t v37 = sub_2355BCF60();
  if (os_log_type_enabled(v36, v37))
  {
    os_log_type_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v38 = 0;
    _os_log_impl(&dword_23556D000, v36, v37, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId building song item from now playing...", v38, 2u);
    MEMORY[0x237DE3BF0](v38, -1, -1);
  }

  v34(v35, v7);
  __swift_project_boxed_opaque_existential_1((void *)(v87 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(void *)(v87 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24));
  unint64_t v100 = v93;
  sub_2355BD2E0();
  unint64_t v100 = (unint64_t)v94;
  uint64_t v40 = v88;
  uint64_t v39 = v89;
  uint64_t v41 = v90;
  (*(void (**)(char *, void, uint64_t))(v89 + 104))(v88, *MEMORY[0x263F6CC40], v90);
  sub_23557DC00(0, &qword_26880C678);
  sub_2355BC8B0();
  uint64_t v43 = v42;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
  if (v43)
  {
    sub_2355BCC70();
    swift_bridgeObjectRelease();
  }
  uint64_t v60 = (void *)swift_allocObject();
  uint64_t v61 = v93;
  unint64_t v62 = v94;
  v60[2] = v94;
  v60[3] = v61;
  uint64_t v63 = v99;
  v60[4] = v98;
  v60[5] = v63;
  uint64_t v64 = v95;
  v60[6] = v86;
  v60[7] = v64;
  uint64_t v65 = v97;
  v60[8] = v91;
  v60[9] = v65;
  swift_bridgeObjectRetain();
  id v66 = v62;
  swift_retain();
LABEL_33:
  sub_2355BC450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
}

void sub_2355954F8(char a1, void *a2, uint64_t a3, void (*a4)(id, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v48 = a7;
  uint64_t v49 = a8;
  uint64_t v47 = a6;
  uint64_t v52 = a5;
  unint64_t v53 = a4;
  uint64_t v51 = a3;
  uint64_t v50 = sub_2355BC200();
  uint64_t v10 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_2355BC240();
  uint64_t v13 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2355BCB80();
  uint64_t v43 = *(void *)(v16 - 8);
  uint64_t v44 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v45 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2355BCBD0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  int v24 = (char *)&v42 - v23;
  if ((a1 & 1) == 0) {
    goto LABEL_8;
  }
  id v25 = objc_msgSend(a2, sel_mediaDestination);
  if (!v25) {
    goto LABEL_8;
  }
  id v26 = v25;
  sub_2355BCBC0();

  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v22, v18);
  LODWORD(v26) = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v24, v18);
  int v27 = *MEMORY[0x263F8F1C8];
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v18);
  if (v26 == v27)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v28 = v44;
    uint64_t v29 = __swift_project_value_buffer(v44, (uint64_t)qword_26880D108);
    uint64_t v30 = v43;
    uint64_t v31 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v45, v29, v28);
    os_log_type_t v32 = sub_2355BCB60();
    os_log_type_t v33 = sub_2355BCF60();
    if (os_log_type_enabled(v32, v33))
    {
      int v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)int v34 = 136446210;
      uint64_t v54 = v51;
      uint64_t v55 = v35;
      uint64_t v36 = sub_2355BD2E0();
      uint64_t v54 = sub_2355745F0(v36, v37, &v55);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v32, v33, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId The item %{public}s asked to add to library and exists in library, returning error dialog.", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v35, -1, -1);
      MEMORY[0x237DE3BF0](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v45, v28);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v28);
    }
    id v40 = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F101C0]);
    uint64_t v41 = 1;
  }
  else
  {
LABEL_8:
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    uint64_t v55 = v51;
    sub_2355BD2E0();
    uint64_t v38 = v46;
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F6CAE0], v46);
    uint64_t v39 = v50;
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F6CAA8], v50);
    id v40 = (id)sub_2355BCEA0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v39);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v38);
    uint64_t v41 = 0;
  }
  v53(v40, v41);
}

void sub_235595AE8(char a1, void *a2, uint64_t a3, void (*a4)(id, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, char *a8, uint64_t a9)
{
  uint64_t v68 = a6;
  char v69 = a8;
  uint64_t v62 = a7;
  uint64_t v71 = a5;
  uint64_t v72 = a4;
  uint64_t v63 = sub_2355BC200();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  id v66 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_2355BC240();
  uint64_t v65 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v64 = (char *)v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2355BCB80();
  uint64_t v70 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v60 - v18;
  uint64_t v20 = sub_2355BCBD0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  int v24 = (char *)v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  id v26 = (char *)v60 - v25;
  if ((a1 & 1) == 0) {
    goto LABEL_8;
  }
  id v27 = objc_msgSend(a2, sel_mediaDestination);
  if (!v27) {
    goto LABEL_8;
  }
  uint64_t v28 = v27;
  sub_2355BCBC0();

  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v26, v24, v20);
  LODWORD(v28) = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v26, v20);
  int v29 = *MEMORY[0x263F8F1C8];
  (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
  if (v28 == v29)
  {
    uint64_t v30 = a3;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v31 = v14;
    uint64_t v32 = __swift_project_value_buffer(v14, (uint64_t)qword_26880D108);
    uint64_t v33 = v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v19, v32, v31);
    int v34 = sub_2355BCB60();
    os_log_type_t v35 = sub_2355BCF60();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      char v69 = v19;
      unint64_t v37 = (uint8_t *)v36;
      uint64_t v38 = swift_slowAlloc();
      uint64_t v73 = v30;
      uint64_t v74 = v38;
      *(_DWORD *)unint64_t v37 = 136446210;
      uint64_t v39 = sub_2355BD2E0();
      uint64_t v73 = sub_2355745F0(v39, v40, &v74);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v34, v35, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId The item %{public}s asked to add to library and exists in library, returning error dialog.", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v38, -1, -1);
      MEMORY[0x237DE3BF0](v37, -1, -1);

      (*(void (**)(char *, uint64_t))(v33 + 8))(v69, v31);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v31);
    }
    id v58 = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F101C0]);
    uint64_t v59 = 1;
  }
  else
  {
LABEL_8:
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v41 = v14;
    uint64_t v42 = __swift_project_value_buffer(v14, (uint64_t)qword_26880D108);
    uint64_t v43 = v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v17, v42, v14);
    uint64_t v44 = sub_2355BCB60();
    os_log_type_t v45 = sub_2355BCF60();
    BOOL v46 = os_log_type_enabled(v44, v45);
    v60[1] = a9;
    if (v46)
    {
      uint64_t v47 = swift_slowAlloc();
      v60[0] = a3;
      uint64_t v48 = (uint8_t *)v47;
      uint64_t v49 = swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 136446210;
      uint64_t v73 = v60[0];
      uint64_t v74 = v49;
      uint64_t v50 = sub_2355BD2E0();
      uint64_t v73 = sub_2355745F0(v50, v51, &v74);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v44, v45, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId The item %{public}s does not exists in library.", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v49, -1, -1);
      MEMORY[0x237DE3BF0](v48, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v41);
      a3 = v60[0];
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v43 + 8))(v17, v14);
    }
    uint64_t v52 = v63;
    uint64_t v53 = v61;
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    uint64_t v74 = a3;
    sub_2355BD2E0();
    uint64_t v55 = v64;
    uint64_t v54 = v65;
    uint64_t v56 = v67;
    (*(void (**)(char *, void, uint64_t))(v65 + 104))(v64, *MEMORY[0x263F6CAE0], v67);
    os_log_type_t v57 = v66;
    (*(void (**)(char *, void, uint64_t))(v53 + 104))(v66, *MEMORY[0x263F6CAA8], v52);
    id v58 = (id)sub_2355BCEA0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v57, v52);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
    uint64_t v59 = 0;
  }
  v72(v58, v59);
}

id INAddMediaIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INAddMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2355963D0()
{
  id v0 = objc_msgSend(self, sel_playlistsQuery);
  return v0;
}

id sub_235596410()
{
  id v0 = objc_msgSend(self, sel_songsQuery);
  return v0;
}

id sub_235596450()
{
  id v0 = objc_msgSend(self, sel_albumsQuery);
  return v0;
}

id sub_235596490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v16 = sub_2355BC390();
  v37[3] = v16;
  v37[4] = MEMORY[0x263F6CB40];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(boxed_opaque_existential_1, a1, v16);
  uint64_t v18 = sub_2355BC5D0();
  v36[3] = v18;
  v36[4] = MEMORY[0x263F6CB80];
  uint64_t v19 = __swift_allocate_boxed_opaque_existential_1(v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v19, a2, v18);
  uint64_t v20 = sub_2355BC730();
  v35[3] = v20;
  v35[4] = MEMORY[0x263F6CBC8];
  uint64_t v21 = __swift_allocate_boxed_opaque_existential_1(v35);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v21, a3, v20);
  uint64_t v33 = &type metadata for PodcastLibraryProvider;
  int v34 = &protocol witness table for PodcastLibraryProvider;
  v31[3] = sub_2355BC3F0();
  v31[4] = MEMORY[0x263F6CB48];
  v31[0] = a5;
  uint64_t v22 = sub_2355BC7E0();
  uint64_t v30[3] = v22;
  v30[4] = MEMORY[0x263F6CC10];
  uint64_t v23 = __swift_allocate_boxed_opaque_existential_1(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v23, a7, v22);
  sub_235574CD0((uint64_t)v37, (uint64_t)a8 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library);
  sub_235574CD0((uint64_t)v36, (uint64_t)a8 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying);
  sub_235574CD0((uint64_t)v35, (uint64_t)a8 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription);
  sub_235574CD0(a4, (uint64_t)a8 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_aceServiceInvoker);
  sub_235574CD0((uint64_t)v31, (uint64_t)a8 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_appIntentInvoker);
  sub_235574CD0((uint64_t)v32, (uint64_t)a8 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_provider);
  sub_235574CD0((uint64_t)v32, (uint64_t)v29);
  uint64_t v24 = swift_allocObject();
  sub_235571114(v29, v24 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C6D8);
  swift_allocObject();
  uint64_t v25 = a8;
  *(void *)&v25[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_instanceReference] = sub_2355BC0C0();
  sub_23557DFE4(a6, (uint64_t)&v25[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider], &qword_26880C698);
  sub_235574CD0((uint64_t)v30, (uint64_t)&v25[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_onscreenEntityProvider]);

  v28.receiver = v25;
  v28.super_class = (Class)type metadata accessor for INAddMediaIntentHandler();
  id v26 = objc_msgSendSuper2(&v28, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  sub_23557DE84(a6, &qword_26880C698);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1Tm(a4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
  return v26;
}

uint64_t sub_23559680C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *))
{
  uint64_t v8 = *a1;
  sub_2355BD130();
  if (qword_26880C118 != -1) {
    swift_once();
  }
  sub_2355BCB20();
  return a6(&v8);
}

uint64_t sub_2355968D8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *))
{
  char v7 = *((unsigned char *)a1 + 8);
  uint64_t v9 = *a1;
  char v10 = v7;
  sub_2355BD130();
  if (qword_26880C118 != -1) {
    swift_once();
  }
  sub_2355BCB20();
  return a6(&v9);
}

id sub_2355969AC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v55 = a7;
  uint64_t v56 = a5;
  uint64_t v57 = a4;
  uint64_t v58 = a6;
  id v52 = a3;
  uint64_t v49 = a1;
  uint64_t v50 = a2;
  uint64_t v54 = sub_2355BC7E0();
  uint64_t v51 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2355BC730();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v48 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = sub_2355BC5D0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v40 - v18;
  uint64_t v20 = sub_2355BC390();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  id v26 = (char *)&v40 - v25;
  id v27 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
  uint64_t v46 = v20;
  v27((char *)&v40 - v25, v49, v20);
  uint64_t v44 = v14;
  uint64_t v45 = v15;
  objc_super v28 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 32);
  uint64_t v43 = v19;
  v28(v19, v50, v14);
  uint64_t v41 = v8;
  uint64_t v42 = v9;
  int v29 = *(void (**)(char *, id, uint64_t))(v9 + 32);
  unint64_t v40 = v13;
  v29(v13, v52, v8);
  id v52 = objc_allocWithZone((Class)type metadata accessor for INAddMediaIntentHandler());
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v31 = (uint64_t)v47;
  v30(v47, v19, v14);
  uint64_t v32 = (uint64_t)v48;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v48, v13, v8);
  uint64_t v33 = v51;
  uint64_t v34 = (uint64_t)v53;
  uint64_t v35 = v54;
  uint64_t v36 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v53, v55, v54);
  uint64_t v37 = v56;
  swift_retain();
  id v38 = sub_235596490((uint64_t)v24, v31, v32, v57, v37, v58, v34, v52);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v36, v35);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v43, v44);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v46);
  return v38;
}

uint64_t sub_235596DF0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_235596E28(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_235596E58(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_2355BCB50() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(uint64_t (**)(uint64_t *))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *(unsigned __int8 *)(v1 + 32);
  return sub_23559680C(a1, v5, v6, v8, v1 + v4, v7);
}

uint64_t sub_235596F00(uint64_t *a1)
{
  objc_super v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = *a1;
  return v2(&v4);
}

uint64_t sub_235596F40(uint64_t a1, char a2)
{
  return sub_23559DC80(a1, a2);
}

void sub_235596F74(void *a1, void *a2, void (*a3)(id *), uint64_t a4)
{
  id v373 = a2;
  uint64_t v7 = sub_2355BC240();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v340 = (char *)&v328 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v361 = (char *)&v328 - v11;
  uint64_t v12 = sub_2355BC200();
  uint64_t v377 = *(void *)(v12 - 8);
  uint64_t v378 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  v345 = (char *)&v328 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v348 = (char *)&v328 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v364 = (char *)&v328 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v351 = (char *)&v328 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v360 = (char *)&v328 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v359 = (char *)&v328 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v343 = (char *)&v328 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v342 = (char *)&v328 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v362 = (char *)&v328 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v363 = (char *)&v328 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v357 = (char *)&v328 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v369 = (char *)&v328 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v353 = (char *)&v328 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v366 = (char *)&v328 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  v371 = (char *)&v328 - v42;
  MEMORY[0x270FA5388](v41);
  v370 = (char *)&v328 - v43;
  uint64_t v376 = sub_2355BC1E0();
  uint64_t v374 = *(void *)(v376 - 8);
  uint64_t v44 = MEMORY[0x270FA5388](v376);
  v344 = (char *)&v328 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v339 = (char *)&v328 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  v355 = (char *)&v328 - v49;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  v350 = (char *)&v328 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v358 = (char *)&v328 - v53;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v341 = (char *)&v328 - v55;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v349 = (char *)&v328 - v57;
  uint64_t v58 = MEMORY[0x270FA5388](v56);
  v356 = (char *)&v328 - v59;
  uint64_t v60 = MEMORY[0x270FA5388](v58);
  v352 = (char *)&v328 - v61;
  MEMORY[0x270FA5388](v60);
  v367 = (char *)&v328 - v62;
  uint64_t v63 = sub_2355BCB80();
  uint64_t v64 = *(void *)(v63 - 8);
  uint64_t v65 = MEMORY[0x270FA5388](v63);
  v384 = (char *)&v328 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = MEMORY[0x270FA5388](v65);
  v338 = (char *)&v328 - v68;
  uint64_t v69 = MEMORY[0x270FA5388](v67);
  v346 = (char *)&v328 - v70;
  uint64_t v71 = MEMORY[0x270FA5388](v69);
  v347 = (char *)&v328 - v72;
  uint64_t v73 = MEMORY[0x270FA5388](v71);
  v368 = (char *)&v328 - v74;
  uint64_t v75 = MEMORY[0x270FA5388](v73);
  v354 = (char *)&v328 - v76;
  uint64_t v77 = MEMORY[0x270FA5388](v75);
  v365 = (char *)&v328 - v78;
  uint64_t v79 = MEMORY[0x270FA5388](v77);
  v372 = (char *)&v328 - v80;
  uint64_t v81 = MEMORY[0x270FA5388](v79);
  v380 = (char *)&v328 - v82;
  uint64_t v83 = MEMORY[0x270FA5388](v81);
  v375 = (char *)&v328 - v84;
  uint64_t v85 = MEMORY[0x270FA5388](v83);
  v381 = (char *)&v328 - v86;
  uint64_t v87 = MEMORY[0x270FA5388](v85);
  v379 = (char *)&v328 - v88;
  uint64_t v89 = MEMORY[0x270FA5388](v87);
  v382 = (char *)&v328 - v90;
  uint64_t v91 = MEMORY[0x270FA5388](v89);
  uint64_t v93 = (char *)&v328 - v92;
  MEMORY[0x270FA5388](v91);
  uint64_t v95 = (char *)&v328 - v94;
  id v383 = a1;
  id v96 = objc_msgSend(a1, sel_privateAddMediaIntentData);
  if (!v96) {
    goto LABEL_164;
  }
  uint64_t v97 = v96;
  id v98 = objc_msgSend(v96, sel_audioSearchResults);

  if (!v98) {
    goto LABEL_164;
  }
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v99 = sub_2355BCDB0();

  if (!(v99 >> 62))
  {
    if (*(void *)((v99 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
    goto LABEL_163;
  }
  swift_bridgeObjectRetain();
  uint64_t v317 = sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v317)
  {
LABEL_163:
    swift_bridgeObjectRelease();
LABEL_164:
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v318 = __swift_project_value_buffer(v63, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v95, v318, v63);
    v319 = sub_2355BCB60();
    os_log_type_t v320 = sub_2355BCF70();
    if (os_log_type_enabled(v319, v320))
    {
      uint64_t v321 = v64;
      v322 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v322 = 0;
      _os_log_impl(&dword_23556D000, v319, v320, "INAddMediaIntentHandler#resolveSearchItem empty media item in privateAddMediaIntent data", v322, 2u);
      v323 = v322;
      uint64_t v64 = v321;
      MEMORY[0x237DE3BF0](v323, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v64 + 8))(v95, v63);
    sub_23557DC00(0, &qword_26880C690);
    id v260 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    id v387 = v260;
    LOBYTE(v388) = 1;
    a3(&v387);
    goto LABEL_169;
  }
LABEL_5:
  if ((v99 & 0xC000000000000001) != 0)
  {
    unint64_t v100 = (char *)MEMORY[0x237DE35A0](0, v99);
LABEL_8:
    uint64_t v95 = v100;
    uint64_t v329 = v8;
    uint64_t v330 = v7;
    uint64_t v334 = a4;
    swift_bridgeObjectRelease();
    if (qword_26880C108 == -1) {
      goto LABEL_9;
    }
    goto LABEL_172;
  }
  if (*(void *)((v99 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    unint64_t v100 = (char *)*(id *)(v99 + 32);
    goto LABEL_8;
  }
  __break(1u);
LABEL_172:
  swift_once();
LABEL_9:
  uint64_t v101 = __swift_project_value_buffer(v63, (uint64_t)qword_26880D108);
  uint64_t v102 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 16);
  uint64_t v336 = v64 + 16;
  v335 = v102;
  v102(v93, v101, v63);
  uint64_t v103 = v95;
  uint64_t v104 = sub_2355BCB60();
  uint64_t v105 = v63;
  os_log_type_t v106 = sub_2355BCF60();
  BOOL v107 = os_log_type_enabled(v104, v106);
  uint64_t v337 = v105;
  if (v107)
  {
    uint64_t v108 = swift_slowAlloc();
    v331 = a3;
    char v109 = (uint8_t *)v108;
    uint64_t v110 = swift_slowAlloc();
    uint64_t v333 = v101;
    uint64_t v111 = v110;
    id v387 = (id)v110;
    *(_DWORD *)char v109 = 136446210;
    uint64_t v112 = sub_2355BCEE0();
    uint64_t v385 = sub_2355745F0(v112, v113, (uint64_t *)&v387);
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v104, v106, "INAddMediaIntentHandler#resolveSearchItem resolving from item: %{public}s", v109, 0xCu);
    swift_arrayDestroy();
    uint64_t v114 = v111;
    uint64_t v101 = v333;
    MEMORY[0x237DE3BF0](v114, -1, -1);
    uint64_t v115 = v109;
    a3 = v331;
    MEMORY[0x237DE3BF0](v115, -1, -1);

    uint64_t v116 = (void *)v64;
    uint64_t v117 = *(void (**)(char *, uint64_t))(v64 + 8);
    v117(v93, v337);
  }
  else
  {

    uint64_t v116 = (void *)v64;
    uint64_t v117 = *(void (**)(char *, uint64_t))(v64 + 8);
    v117(v93, v105);
  }
  id v118 = objc_msgSend(v103, sel_type);
  if ((sub_235571FEC((uint64_t)v118, (uint64_t)&unk_26E8AFFC0) & 1) == 0)
  {
    v332 = v103;
    id v135 = objc_msgSend(v383, sel_backingStore);
    self;
    uint64_t v136 = (void *)swift_dynamicCastObjCClass();
    if (!v136
      || (os_log_type_t v137 = v136,
          (id v138 = objc_msgSend(v136, sel_privateAddMediaIntentData)) == 0))
    {

LABEL_176:
      v335(v384, v101, v337);
      v325 = sub_2355BCB60();
      os_log_type_t v326 = sub_2355BCF70();
      if (os_log_type_enabled(v325, v326))
      {
        v327 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v327 = 134349056;
        id v387 = v118;
        sub_2355BD1B0();
        _os_log_impl(&dword_23556D000, v325, v326, "INAddMediaIntentHandler#resolveSearchItem is of unsupported media type=%{public}ld", v327, 0xCu);
        MEMORY[0x237DE3BF0](v327, -1, -1);
      }

      v117(v384, v337);
      id v173 = objc_msgSend(self, sel_unsupportedForReason_, 3);
      id v387 = v173;
      LOBYTE(v388) = 1;
      goto LABEL_179;
    }
    uint64_t v139 = v138;
    uint64_t v140 = v101;
    id v141 = objc_msgSend(v138, sel_audioSearchResults);

    if (v141)
    {
      sub_23557DC00(0, &qword_26880C6D0);
      unint64_t v142 = sub_2355BCDB0();

      if (v142 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v324 = sub_2355BD280();
        swift_bridgeObjectRelease();
        if (v324) {
          goto LABEL_21;
        }
      }
      else if (*(void *)((v142 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_21:
        if ((v142 & 0xC000000000000001) != 0)
        {
          id v143 = (id)MEMORY[0x237DE35A0](0, v142);
        }
        else
        {
          if (!*(void *)((v142 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v143 = *(id *)(v142 + 32);
        }
        uint64_t v144 = v143;
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v145 = swift_allocObject();
        *(_OWORD *)(v145 + 16) = xmmword_2355BDD80;
        *(void *)(v145 + 32) = v144;
        id v387 = (id)v145;
        sub_2355BCDD0();
        id v146 = v144;
        uint64_t v147 = (void *)sub_2355BCD90();
        swift_bridgeObjectRelease();
        objc_msgSend(v137, sel_setMediaItems_, v147);

        goto LABEL_175;
      }

      swift_bridgeObjectRelease();
    }
    else
    {
    }
LABEL_175:
    uint64_t v101 = v140;
    goto LABEL_176;
  }
  id v119 = objc_msgSend(v103, sel_identifier);
  uint64_t v120 = v116;
  if (!v119)
  {
    uint64_t v148 = v103;
    uint64_t v149 = v379;
    v335(v379, v101, v337);
    uint64_t v150 = sub_2355BCB60();
    os_log_type_t v151 = sub_2355BCF70();
    if (os_log_type_enabled(v150, v151))
    {
      uint64_t v152 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v152 = 0;
      _os_log_impl(&dword_23556D000, v150, v151, "INAddMediaIntentHandler#resolveSearchItem could not find item identifier", v152, 2u);
      MEMORY[0x237DE3BF0](v152, -1, -1);
    }

    v117(v149, v337);
    sub_23557DC00(0, &qword_26880C690);
    id v153 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    id v387 = v153;
    LOBYTE(v388) = 1;
    a3(&v387);

    return;
  }
  uint64_t v121 = v119;
  v384 = (char *)sub_2355BCC50();
  unint64_t v123 = v122;

  uint64_t v124 = v382;
  uint64_t v333 = v101;
  uint64_t v125 = v101;
  uint64_t v126 = v337;
  v335(v382, v125, v337);
  swift_bridgeObjectRetain_n();
  uint64_t v127 = sub_2355BCB60();
  os_log_type_t v128 = sub_2355BCF60();
  BOOL v129 = os_log_type_enabled(v127, v128);
  v328 = v117;
  v332 = v103;
  if (v129)
  {
    uint64_t v130 = a3;
    id v131 = (uint8_t *)swift_slowAlloc();
    uint64_t v132 = swift_slowAlloc();
    id v387 = (id)v132;
    *(_DWORD *)id v131 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v385 = sub_2355745F0((uint64_t)v384, v123, (uint64_t *)&v387);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v127, v128, "INAddMediaIntentHandler#media item identifier: %{public}s", v131, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v132, -1, -1);
    uint64_t v133 = v131;
    a3 = v130;
    uint64_t v117 = v328;
    MEMORY[0x237DE3BF0](v133, -1, -1);

    char v134 = v382;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    char v134 = v124;
  }
  v117(v134, v126);
  uint64_t v154 = v381;
  sub_2355BC250();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v155 = (uint64_t)v384;
  uint64_t v156 = sub_2355BC260();
  uint64_t v157 = v333;
  if (!v156)
  {
    swift_bridgeObjectRelease();
    id v169 = v375;
    v335(v375, v157, v337);
    uint64_t v170 = sub_2355BCB60();
    os_log_type_t v171 = sub_2355BCF70();
    if (os_log_type_enabled(v170, v171))
    {
      os_log_t v172 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_t v172 = 0;
      _os_log_impl(&dword_23556D000, v170, v171, "INAddMediaIntentHandler#resolveSearchItem could not parse remote item identifier", v172, 2u);
      MEMORY[0x237DE3BF0](v172, -1, -1);
    }

    v117(v169, v337);
    id v173 = objc_msgSend(self, sel_unsupportedForReason_, 3);
    id v387 = v173;
    LOBYTE(v388) = 1;
LABEL_179:
    a3(&v387);

    return;
  }
  uint64_t v158 = (char *)v156;
  id v383 = v120;
  uint64_t v159 = v337;
  v335(v154, v333, v337);
  uint64_t v160 = v332;
  swift_bridgeObjectRetain();
  uint64_t v161 = sub_2355BCB60();
  os_log_type_t v162 = sub_2355BCF80();
  if (os_log_type_enabled(v161, v162))
  {
    uint64_t v163 = swift_slowAlloc();
    uint64_t v164 = swift_slowAlloc();
    v382 = v158;
    v331 = a3;
    uint64_t v165 = v164;
    id v387 = (id)v164;
    *(_DWORD *)uint64_t v163 = 134349314;
    id v166 = objc_msgSend(v160, sel_type);

    uint64_t v385 = (uint64_t)v166;
    sub_2355BD1B0();

    *(_WORD *)(v163 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v385 = sub_2355745F0(v155, v123, (uint64_t *)&v387);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v161, v162, "INAddMediaIntentHandler#resolveSearchItem for item with type: %{public}ld identifier: %{public}s", (uint8_t *)v163, 0x16u);
    swift_arrayDestroy();
    uint64_t v167 = v165;
    a3 = v331;
    uint64_t v158 = v382;
    MEMORY[0x237DE3BF0](v167, -1, -1);
    MEMORY[0x237DE3BF0](v163, -1, -1);

    id v168 = v328;
    v328(v381, v337);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v174 = v159;
    id v168 = v328;
    v328(v154, v174);
  }
  if (objc_msgSend(v160, sel_type, v328) == (id)6)
  {
    v335(v380, v333, v337);
    uint64_t v175 = sub_2355BCB60();
    os_log_type_t v176 = sub_2355BCF80();
    if (os_log_type_enabled(v175, v176))
    {
      uint64_t v177 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v177 = 0;
      _os_log_impl(&dword_23556D000, v175, v176, "INAddMediaIntentHandler#resolveSearchItem empty media item in privateAddMediaIntent data", v177, 2u);
      MEMORY[0x237DE3BF0](v177, -1, -1);
    }

    v168(v380, v337);
    sub_2355BC210();
    id v178 = objc_msgSend(v160, sel_title);
    if (v178)
    {
      uint64_t v179 = v178;
      sub_2355BCC50();
      uint64_t v181 = v180;
    }
    else
    {
      uint64_t v181 = 0;
    }
    id v187 = v160;
    id v188 = objc_msgSend(v160, sel_artist);
    if (v188)
    {
      uint64_t v189 = v188;
      sub_2355BCC50();
      uint64_t v191 = v190;
    }
    else
    {
      uint64_t v191 = 0;
    }
    v196 = (void *)sub_2355BCC40();
    swift_bridgeObjectRelease();
    uint64_t v160 = v187;
    if (v181)
    {
      v197 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      v197 = 0;
    }
    if (v191)
    {
      uint64_t v198 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v198 = 0;
    }
    id v199 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FC40]), sel_initWithIdentifier_title_type_artwork_artist_, v196, v197, 6, 0, v198);

    id v387 = v199;
    LOBYTE(v388) = 0;
    a3(&v387);

LABEL_62:
    swift_release();

    return;
  }
  if (!v373)
  {
    v335(v372, v333, v337);
    uint64_t v192 = sub_2355BCB60();
    os_log_type_t v193 = sub_2355BCF70();
    if (os_log_type_enabled(v192, v193))
    {
      uint64_t v194 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v194 = 0;
      _os_log_impl(&dword_23556D000, v192, v193, "INAddMediaIntentHandler#resolveSearchItem Unexpected empty destination", v194, 2u);
      MEMORY[0x237DE3BF0](v194, -1, -1);
    }

    v168(v372, v337);
    id v195 = objc_msgSend(self, sel_unsupportedForReason_, 6);
    id v387 = v195;
    LOBYTE(v388) = 1;
    a3(&v387);

    goto LABEL_62;
  }
  v381 = v160;
  v382 = v158;
  v331 = a3;
  uint64_t v182 = &off_264C5D000;
  v384 = (char *)v373;
  if (objc_msgSend(v384, sel_mediaDestinationType) == 2)
  {
    uint64_t v183 = v367;
    sub_2355BC1F0();
    sub_2355BC1C0();
    uint64_t v184 = *(void (**)(char *, uint64_t))(v374 + 8);
    v184(v183, v376);
    v185 = *(void (**)(char *, void, uint64_t))(v377 + 104);
    v185(v371, *MEMORY[0x263F6CAA0], v378);
    sub_23559DD1C((unint64_t *)&unk_26880C6B8, MEMORY[0x263F6CAC0]);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v387 == (id)v385 && v388 == v386) {
      char v186 = 1;
    }
    else {
      char v186 = sub_2355BD2F0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v200 = v378;
    uint64_t v201 = *(void (**)(char *, uint64_t))(v377 + 8);
    v201(v371, v378);
    v201(v370, v200);
    if (v186) {
      goto LABEL_69;
    }
    uint64_t v202 = v352;
    sub_2355BC1F0();
    sub_2355BC1C0();
    v184(v202, v376);
    uint64_t v203 = v353;
    uint64_t v204 = v378;
    v185(v353, *MEMORY[0x263F6CAB0], v378);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v387 == (id)v385 && v388 == v386)
    {
      swift_bridgeObjectRelease_n();
      v201(v203, v204);
      v201(v366, v204);
LABEL_69:
      v206 = v365;
      uint64_t v207 = v337;
      v335(v365, v333, v337);
      unint64_t v208 = sub_2355BCB60();
      os_log_type_t v209 = sub_2355BCF80();
      if (os_log_type_enabled(v208, v209))
      {
        uint64_t v210 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v210 = 0;
        _os_log_impl(&dword_23556D000, v208, v209, "INAddMediaIntentHandler#resolveSearchItem adding local item with ulid to playlist.", v210, 2u);
        MEMORY[0x237DE3BF0](v210, -1, -1);
      }

      v328(v206, v207);
      sub_2355BC210();
      id v211 = v381;
      id v212 = objc_msgSend(v381, sel_title);
      if (v212)
      {
        uint64_t v213 = v212;
        sub_2355BCC50();
        uint64_t v215 = v214;
      }
      else
      {
        uint64_t v215 = 0;
      }
      id v220 = objc_msgSend(v211, sel_artist);
      if (v220)
      {
        v221 = v220;
        sub_2355BCC50();
        uint64_t v223 = v222;
      }
      else
      {
        uint64_t v223 = 0;
      }
      uint64_t v224 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
      if (v215)
      {
        v225 = (void *)sub_2355BCC40();
        swift_bridgeObjectRelease();
      }
      else
      {
        v225 = 0;
      }
      if (v223)
      {
        uint64_t v226 = (void *)sub_2355BCC40();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v226 = 0;
      }
      id v227 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FC40]), sel_initWithIdentifier_title_type_artwork_artist_, v224, v225, 1, 0, v226);

      id v387 = v227;
      LOBYTE(v388) = 0;
      v331(&v387);

      goto LABEL_99;
    }
    char v205 = sub_2355BD2F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v201(v203, v204);
    v201(v366, v204);
    uint64_t v182 = &off_264C5D000;
    if (v205) {
      goto LABEL_69;
    }
  }
  if ([v384 (SEL)v182[132]] == 1)
  {
    uint64_t v216 = v356;
    sub_2355BC1F0();
    sub_2355BC1C0();
    v380 = *(char **)(v374 + 8);
    ((void (*)(char *, uint64_t))v380)(v216, v376);
    uint64_t v217 = *(void (**)(char *, void, uint64_t))(v377 + 104);
    uint64_t v218 = v357;
    v217(v357, *MEMORY[0x263F6CAB0], v378);
    sub_23559DD1C((unint64_t *)&unk_26880C6B8, MEMORY[0x263F6CAC0]);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v387 == (id)v385 && v388 == v386) {
      char v219 = 1;
    }
    else {
      char v219 = sub_2355BD2F0();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v228 = v378;
    uint64_t v229 = *(void (**)(char *, uint64_t))(v377 + 8);
    v229(v218, v378);
    v229(v369, v228);
    if (v219) {
      goto LABEL_95;
    }
    v230 = v349;
    sub_2355BC1F0();
    sub_2355BC1C0();
    ((void (*)(char *, uint64_t))v380)(v230, v376);
    uint64_t v231 = v378;
    v217(v362, *MEMORY[0x263F6CAA0], v378);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v387 == (id)v385 && v388 == v386)
    {
      swift_bridgeObjectRelease_n();
LABEL_93:
      v229(v362, v231);
      v229(v363, v231);
LABEL_95:
      uint64_t v233 = v354;
      uint64_t v234 = v337;
      v335(v354, v333, v337);
      os_log_type_t v235 = sub_2355BCB60();
      os_log_type_t v236 = sub_2355BCF70();
      if (os_log_type_enabled(v235, v236))
      {
        uint64_t v237 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v237 = 0;
        _os_log_impl(&dword_23556D000, v235, v236, "INAddMediaIntentHandler#resolveSearchItem content source is .store or .ulid, the item is already in library.", v237, 2u);
        MEMORY[0x237DE3BF0](v237, -1, -1);
      }

      v328(v233, v234);
      id v238 = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F101C0]);
LABEL_98:
      id v239 = v238;
      id v387 = v239;
      LOBYTE(v388) = 1;
      v331(&v387);

LABEL_99:
      swift_release();

      return;
    }
    char v232 = sub_2355BD2F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v229(v362, v231);
    v229(v363, v231);
    if (v232) {
      goto LABEL_95;
    }
    v240 = v341;
    sub_2355BC1F0();
    uint64_t v241 = v342;
    sub_2355BC1C0();
    ((void (*)(char *, uint64_t))v380)(v240, v376);
    uint64_t v242 = v343;
    uint64_t v231 = v378;
    v217(v343, *MEMORY[0x263F6CAB8], v378);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v387 == (id)v385 && v388 == v386)
    {
      swift_bridgeObjectRelease_n();
      v362 = v242;
      v363 = v241;
      goto LABEL_93;
    }
    char v243 = sub_2355BD2F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v229(v242, v231);
    v229(v241, v231);
    if (v243) {
      goto LABEL_95;
    }
  }
  uint64_t v244 = v358;
  sub_2355BC1F0();
  uint64_t v245 = v359;
  sub_2355BC1C0();
  uint64_t v246 = *(char **)(v374 + 8);
  v374 += 8;
  v380 = v246;
  ((void (*)(char *, uint64_t))v246)(v244, v376);
  uint64_t v247 = *(void (**)(char *, void, uint64_t))(v377 + 104);
  v248 = v360;
  v247(v360, *MEMORY[0x263F6CAA8], v378);
  sub_23559DD1C((unint64_t *)&unk_26880C6B8, MEMORY[0x263F6CAC0]);
  sub_2355BCD70();
  sub_2355BCD70();
  if (v387 == (id)v385 && v388 == v386) {
    char v249 = 1;
  }
  else {
    char v249 = sub_2355BD2F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v250 = *(void (**)(char *, uint64_t))(v377 + 8);
  uint64_t v251 = v248;
  uint64_t v252 = v378;
  v250(v251, v378);
  v250(v245, v252);
  uint64_t v253 = v337;
  if (v249) {
    goto LABEL_117;
  }
  uint64_t v254 = v350;
  sub_2355BC1F0();
  uint64_t v255 = v351;
  sub_2355BC1C0();
  ((void (*)(char *, uint64_t))v380)(v254, v376);
  v247(v364, *MEMORY[0x263F6CAB8], v252);
  sub_2355BCD70();
  sub_2355BCD70();
  if (v387 == (id)v385 && v388 == v386)
  {
    swift_bridgeObjectRelease_n();
LABEL_116:
    v250(v364, v252);
    v250(v255, v252);
    uint64_t v253 = v337;
    goto LABEL_117;
  }
  char v256 = sub_2355BD2F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v250(v364, v252);
  v250(v255, v252);
  uint64_t v253 = v337;
  if ((v256 & 1) == 0)
  {
    v257 = v344;
    sub_2355BC1F0();
    sub_2355BC1C0();
    ((void (*)(char *, uint64_t))v380)(v257, v376);
    unint64_t v258 = v345;
    v247(v345, *MEMORY[0x263F6CAB0], v252);
    sub_2355BCD70();
    sub_2355BCD70();
    if (v387 != (id)v385 || v388 != v386)
    {
      char v311 = sub_2355BD2F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v250(v258, v252);
      v250(v348, v252);
      uint64_t v253 = v337;
      if ((v311 & 1) == 0)
      {
        v312 = v338;
        v335(v338, v333, v337);
        v313 = sub_2355BCB60();
        os_log_type_t v314 = sub_2355BCF70();
        if (os_log_type_enabled(v313, v314))
        {
          v315 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v315 = 0;
          _os_log_impl(&dword_23556D000, v313, v314, "INAddMediaIntentHandler#resolveSearchItem unexpected content source is not from store.", v315, 2u);
          MEMORY[0x237DE3BF0](v315, -1, -1);
        }

        v328(v312, v337);
        id v238 = objc_msgSend(self, sel_unsupportedForReason_, 6);
        goto LABEL_98;
      }
      goto LABEL_117;
    }
    swift_bridgeObjectRelease_n();
    v364 = v258;
    uint64_t v255 = v348;
    goto LABEL_116;
  }
LABEL_117:
  uint64_t v259 = v333;
  v335(v368, v333, v253);
  id v260 = v381;
  v261 = sub_2355BCB60();
  os_log_type_t v262 = sub_2355BCF60();
  if (os_log_type_enabled(v261, v262))
  {
    v263 = (uint8_t *)swift_slowAlloc();
    v264 = (void *)swift_slowAlloc();
    *(_DWORD *)v263 = 138543362;
    id v387 = v260;
    v265 = v260;
    sub_2355BD1B0();
    void *v264 = v260;

    _os_log_impl(&dword_23556D000, v261, v262, "INAddMediaIntentHandler#resolveSearchItem Constructing media item to add from item: %{public}@", v263, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    v266 = v264;
    uint64_t v259 = v333;
    MEMORY[0x237DE3BF0](v266, -1, -1);
    MEMORY[0x237DE3BF0](v263, -1, -1);
  }
  else
  {

    v261 = v260;
  }
  uint64_t v267 = v330;

  v328(v368, v337);
  uint64_t v268 = v355;
  sub_2355BC1F0();
  v269 = v361;
  sub_2355BC1D0();
  ((void (*)(char *, uint64_t))v380)(v268, v376);
  int v270 = (*(uint64_t (**)(char *, uint64_t))(v329 + 88))(v269, v267);
  if (v270 == *MEMORY[0x263F6CAE8])
  {
    sub_2355BC210();
    id v271 = [v260 title];
    if (v271)
    {
      v272 = v271;
      sub_2355BCC50();
      uint64_t v274 = v273;
    }
    else
    {
      uint64_t v274 = 0;
    }
    id v284 = [v260 artist];
    if (v284)
    {
      v285 = v284;
      sub_2355BCC50();
      uint64_t v287 = v286;
    }
    else
    {
      uint64_t v287 = 0;
    }
    v288 = (void *)sub_2355BCC40();
    swift_bridgeObjectRelease();
    if (v274)
    {
      v289 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      v289 = 0;
    }
    if (v287)
    {
      v290 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      v290 = 0;
    }
    id v291 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FC40]), sel_initWithIdentifier_title_type_artwork_artist_, v288, v289, 2, 0, v290);
LABEL_154:
    v310 = v291;

    id v387 = v310;
    LOBYTE(v388) = 0;
    v331(&v387);

LABEL_155:
    swift_release();
LABEL_169:

    return;
  }
  if (v270 == *MEMORY[0x263F6CAE0])
  {
    sub_2355BC210();
    id v275 = [v260 title];
    if (v275)
    {
      v276 = v275;
      sub_2355BCC50();
      uint64_t v278 = v277;
    }
    else
    {
      uint64_t v278 = 0;
    }
    id v306 = [v260 artist];
    if (v306)
    {
      v307 = v306;
      sub_2355BCC50();
      uint64_t v309 = v308;
    }
    else
    {
      uint64_t v309 = 0;
    }
    v288 = (void *)sub_2355BCC40();
    swift_bridgeObjectRelease();
    if (v278)
    {
      v289 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      v289 = 0;
    }
    if (v309)
    {
      v290 = (void *)sub_2355BCC40();
      swift_bridgeObjectRelease();
    }
    else
    {
      v290 = 0;
    }
    id v291 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FC40]), sel_initWithIdentifier_title_type_artwork_artist_, v288, v289, 1, 0, v290);
    goto LABEL_154;
  }
  unint64_t v279 = v331;
  if (v270 == *MEMORY[0x263F6CAF0])
  {
    v335(v347, v259, v337);
    v280 = sub_2355BCB60();
    os_log_type_t v281 = sub_2355BCF50();
    if (os_log_type_enabled(v280, v281))
    {
      v282 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v282 = 0;
      _os_log_impl(&dword_23556D000, v280, v281, "INAddMediaIntentHandler#resolveSearchItem the item is already in library with library scheme result", v282, 2u);
      MEMORY[0x237DE3BF0](v282, -1, -1);
    }

    v328(v347, v337);
    id v283 = objc_msgSend(self, sel_unsupportedForReason_, 6);
    id v387 = v283;
    LOBYTE(v388) = 1;
    v279(&v387);

    goto LABEL_155;
  }
  v292 = v346;
  uint64_t v293 = v337;
  v335(v346, v259, v337);
  swift_retain_n();
  v294 = sub_2355BCB60();
  os_log_type_t v295 = sub_2355BCF50();
  if (os_log_type_enabled(v294, v295))
  {
    v296 = (uint8_t *)swift_slowAlloc();
    id v383 = (id)swift_slowAlloc();
    id v387 = v383;
    *(_DWORD *)v296 = 136315138;
    v381 = (char *)(v296 + 4);
    v297 = v339;
    sub_2355BC1F0();
    v298 = v340;
    sub_2355BC1D0();
    ((void (*)(char *, uint64_t))v380)(v297, v376);
    uint64_t v299 = sub_2355BC230();
    unint64_t v301 = v300;
    uint64_t v302 = v329;
    (*(void (**)(char *, uint64_t))(v329 + 8))(v298, v330);
    uint64_t v385 = sub_2355745F0(v299, v301, (uint64_t *)&v387);
    sub_2355BD1B0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v294, v295, "INAddMediaIntentHandler#resolveSearchItem unsupported scheme: %s", v296, 0xCu);
    id v303 = v383;
    swift_arrayDestroy();
    unint64_t v279 = v331;
    MEMORY[0x237DE3BF0](v303, -1, -1);
    v304 = v296;
    uint64_t v305 = v330;
    MEMORY[0x237DE3BF0](v304, -1, -1);

    v328(v346, v337);
  }
  else
  {

    swift_release_n();
    v328(v292, v293);
    uint64_t v305 = v330;
    uint64_t v302 = v329;
  }
  sub_23557DC00(0, &qword_26880C690);
  id v316 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
  id v387 = v316;
  LOBYTE(v388) = 1;
  v279(&v387);

  swift_release();
  (*(void (**)(char *, uint64_t))(v302 + 8))(v361, v305);
}

uint64_t sub_235599FF4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v6 = sub_2355BCB50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  uint64_t v14 = qword_26880C118;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  id v15 = (id)logObject;
  sub_2355BCB30();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = "addMediaIntentHandlerResolveSearchItem";
  *(void *)(v18 + 24) = 38;
  *(unsigned char *)(v18 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v16, v10, v6);
  uint64_t v19 = (uint64_t (**)(uint64_t))(v18 + v17);
  *uint64_t v19 = sub_23559D5E0;
  v19[1] = (uint64_t (*)(uint64_t))v13;
  swift_retain();
  sub_2355BD140();
  sub_2355BCB20();
  swift_retain();
  sub_235596F74(v21, v22, (void (*)(id *))sub_23559D5E8, v18);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  return swift_release();
}

uint64_t sub_23559A26C(void *a1, char a2)
{
  return sub_23558D708(a1, a2 & 1, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_23559A27C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_23559A2B0(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_2355BCB50() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_23559680C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), v1 + v4, *(uint64_t (**)(uint64_t *))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_23559A34C(void *a1, uint64_t a2, void (*a3)(void *), uint64_t a4)
{
  uint64_t v99 = a2;
  id v114 = a1;
  uint64_t v6 = sub_2355BC890();
  uint64_t v101 = *(void *)(v6 - 8);
  uint64_t v102 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v100 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2355BCBD0();
  uint64_t v112 = *(void *)(v8 - 8);
  uint64_t v113 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v105 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  BOOL v107 = (char *)&v97 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v97 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v115 = (char *)&v97 - v16;
  uint64_t v17 = sub_2355BCB80();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  id v98 = (char *)&v97 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v104 = (char *)&v97 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v103 = (char *)&v97 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  os_log_type_t v106 = (char *)&v97 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v97 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v97 - v30;
  uint64_t v32 = swift_allocObject();
  char v109 = a3;
  *(void *)(v32 + 16) = a3;
  *(void *)(v32 + 24) = a4;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = sub_23559D938;
  *(void *)(v33 + 24) = v32;
  uint64_t v110 = v33;
  uint64_t v34 = qword_26880C108;
  uint64_t v108 = a4;
  swift_retain();
  uint64_t v111 = v32;
  swift_retain();
  if (v34 != -1) {
    swift_once();
  }
  uint64_t v35 = __swift_project_value_buffer(v17, (uint64_t)qword_26880D108);
  uint64_t v36 = v18;
  uint64_t v116 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v116(v31, v35, v17);
  uint64_t v37 = sub_2355BCB60();
  os_log_type_t v38 = sub_2355BCF60();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl(&dword_23556D000, v37, v38, "INAddMediaIntentHandler#resolveMediaDestination", v39, 2u);
    MEMORY[0x237DE3BF0](v39, -1, -1);
  }

  uint64_t v40 = *(void (**)(char *, uint64_t))(v36 + 8);
  v40(v31, v17);
  id v41 = objc_msgSend(v114, sel_mediaDestination);
  if (!v41)
  {
    swift_release();
    uint64_t v60 = v106;
    v116(v106, v35, v17);
    uint64_t v61 = sub_2355BCB60();
    os_log_type_t v62 = sub_2355BCF80();
    BOOL v63 = os_log_type_enabled(v61, v62);
    uint64_t v64 = v112;
    if (v63)
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v65 = 0;
      _os_log_impl(&dword_23556D000, v61, v62, "INAddMediaIntentHandler#resolveMediaDestination missing destination, defaulting to library", v65, 2u);
      MEMORY[0x237DE3BF0](v65, -1, -1);
    }

    v40(v60, v17);
    sub_23557DC00(0, &qword_26880C6A8);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    uint64_t v67 = v105;
    uint64_t v68 = v113;
    (*(void (**)(char *, void, uint64_t))(v64 + 104))(v105, *MEMORY[0x263F8F1C8], v113);
    uint64_t v69 = (void *)sub_2355BCBB0();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v67, v68);
    id v70 = objc_msgSend(ObjCClassFromMetadata, sel_successWithResolvedMediaDestination_, v69);

    v117[0] = v70;
    v109(v117);
    goto LABEL_28;
  }
  uint64_t v42 = v41;
  os_log_type_t v106 = (char *)(v36 + 8);
  sub_2355BCBC0();

  uint64_t v44 = v112;
  uint64_t v43 = v113;
  uint64_t v45 = v115;
  (*(void (**)(char *, char *, uint64_t))(v112 + 32))(v115, v15, v113);
  v116(v29, v35, v17);
  uint64_t v46 = sub_2355BCB60();
  os_log_type_t v47 = sub_2355BCF60();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v48 = 0;
    _os_log_impl(&dword_23556D000, v46, v47, "INAddMediaIntentHandler#resolveMediaDestination resolving present destination...", v48, 2u);
    uint64_t v49 = v48;
    uint64_t v45 = v115;
    MEMORY[0x237DE3BF0](v49, -1, -1);
  }

  v40(v29, v17);
  uint64_t v50 = v107;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v107, v45, v43);
  int v51 = (*(uint64_t (**)(char *, uint64_t))(v44 + 88))(v50, v43);
  if (v51 != *MEMORY[0x263F8F1D0])
  {
    int v71 = v51;
    uint64_t v72 = *MEMORY[0x263F8F1C8];
    swift_release();
    if (v71 != v72)
    {
      uint64_t v80 = v104;
      v116(v104, v35, v17);
      uint64_t v81 = sub_2355BCB60();
      os_log_type_t v82 = sub_2355BCF80();
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v83 = 0;
        _os_log_impl(&dword_23556D000, v81, v82, "INAddMediaIntentHandler#resolveMediaDestination defaulting to library, unsupported destination", v83, 2u);
        uint64_t v84 = v83;
        uint64_t v80 = v104;
        MEMORY[0x237DE3BF0](v84, -1, -1);
      }

      v40(v80, v17);
      sub_23557DC00(0, &qword_26880C6A8);
      uint64_t v85 = (void *)swift_getObjCClassFromMetadata();
      uint64_t v86 = v105;
      (*(void (**)(char *, uint64_t, uint64_t))(v44 + 104))(v105, v72, v43);
      uint64_t v87 = (void *)sub_2355BCBB0();
      uint64_t v88 = *(void (**)(char *, uint64_t))(v44 + 8);
      v88(v86, v43);
      id v89 = objc_msgSend(v85, sel_successWithResolvedMediaDestination_, v87);

      v117[0] = v89;
      v109(v117);
      v88(v115, v43);

      v88(v107, v43);
      goto LABEL_30;
    }
    uint64_t v73 = v103;
    v116(v103, v35, v17);
    uint64_t v74 = sub_2355BCB60();
    os_log_type_t v75 = sub_2355BCF80();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v76 = 0;
      _os_log_impl(&dword_23556D000, v74, v75, "INAddMediaIntentHandler#resolveMediaDestination success with library", v76, 2u);
      uint64_t v77 = v76;
      uint64_t v73 = v103;
      MEMORY[0x237DE3BF0](v77, -1, -1);
    }

    v40(v73, v17);
    sub_23557DC00(0, &qword_26880C6A8);
    uint64_t v78 = (void *)swift_getObjCClassFromMetadata();
    uint64_t v79 = (void *)sub_2355BCBB0();
    id v70 = objc_msgSend(v78, sel_successWithResolvedMediaDestination_, v79);

    v117[0] = v70;
    goto LABEL_27;
  }
  (*(void (**)(char *, uint64_t))(v44 + 96))(v50, v43);
  uint64_t v53 = *(void *)v50;
  unint64_t v52 = *((void *)v50 + 1);
  uint64_t v54 = HIBYTE(v52) & 0xF;
  if ((v52 & 0x2000000000000000) == 0) {
    uint64_t v54 = v53 & 0xFFFFFFFFFFFFLL;
  }
  if (!v54)
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v90 = v98;
    v116(v98, v35, v17);
    uint64_t v91 = sub_2355BCB60();
    os_log_type_t v92 = sub_2355BCF80();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v93 = 0;
      _os_log_impl(&dword_23556D000, v91, v92, "INAddMediaIntentHandler#resolveMediaDestination asking for playlist title", v93, 2u);
      uint64_t v94 = v93;
      uint64_t v90 = v98;
      MEMORY[0x237DE3BF0](v94, -1, -1);
    }

    v40(v90, v17);
    sub_23557DC00(0, &qword_26880C6A8);
    id v70 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
    v117[0] = v70;
LABEL_27:
    v109(v117);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v43);
LABEL_28:
    swift_release();

    return;
  }
  uint64_t v116 = (void (*)(char *, uint64_t, uint64_t))__swift_project_boxed_opaque_existential_1((void *)(v99+ OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(void *)(v99+ OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library+ 24));
  v117[0] = v114;
  uint64_t v55 = v100;
  uint64_t v56 = v101;
  uint64_t v57 = v102;
  (*(void (**)(char *, void, uint64_t))(v101 + 104))(v100, *MEMORY[0x263F6CC40], v102);
  sub_23557DC00(0, &qword_26880C678);
  sub_2355BC8B0();
  uint64_t v59 = v58;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v55, v57);
  if (v59)
  {
    sub_2355BCC70();
    swift_bridgeObjectRelease();
  }
  uint64_t v95 = (void *)swift_allocObject();
  v95[2] = v53;
  v95[3] = v52;
  uint64_t v96 = v110;
  v95[4] = sub_23559DB78;
  v95[5] = v96;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2355BC4A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v115, v113);
LABEL_30:
  swift_release();
}

void sub_23559AFB8(void *a1, char *a2, void (*a3)(uint64_t *), uint64_t a4)
{
  v276 = a2;
  id v288 = a1;
  uint64_t v270 = sub_2355BC200();
  uint64_t v269 = *(void *)(v270 - 8);
  MEMORY[0x270FA5388](v270);
  uint64_t v268 = (char *)&v252 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v274 = sub_2355BC890();
  uint64_t v275 = *(void *)(v274 - 8);
  MEMORY[0x270FA5388](v274);
  uint64_t v273 = (char *)&v252 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v277 = sub_2355BC1E0();
  uint64_t v280 = *(void *)(v277 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v277);
  v264 = (char *)&v252 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v260 = (char *)&v252 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v261 = (char *)&v252 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v267 = (char *)&v252 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v263 = (char *)&v252 - v17;
  MEMORY[0x270FA5388](v16);
  id v271 = (char *)&v252 - v18;
  uint64_t v19 = sub_2355BCBD0();
  uint64_t v285 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  v272 = (char **)((char *)&v252 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  id v284 = (char *)&v252 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v252 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v252 - v27;
  uint64_t v29 = (void *)sub_2355BCB80();
  uint64_t v30 = *(v29 - 1);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  os_log_type_t v281 = (char *)&v252 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v259 = (char *)&v252 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  os_log_type_t v262 = (char *)&v252 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  v266 = (char *)&v252 - v38;
  uint64_t v39 = MEMORY[0x270FA5388](v37);
  v265 = (char *)&v252 - v40;
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  unint64_t v279 = (char *)&v252 - v42;
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  uint64_t v278 = (char *)&v252 - v44;
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  v282 = (void (*)(char *, uint64_t))((char *)&v252 - v46);
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  uint64_t v292 = (uint64_t)&v252 - v48;
  MEMORY[0x270FA5388](v47);
  uint64_t v50 = (char *)&v252 - v49;
  uint64_t v51 = swift_allocObject();
  uint64_t v287 = a3;
  *(void *)(v51 + 16) = a3;
  *(void *)(v51 + 24) = a4;
  uint64_t v52 = swift_allocObject();
  *(void *)(v52 + 16) = sub_23559D938;
  *(void *)(v52 + 24) = v51;
  uint64_t v53 = qword_26880C108;
  uint64_t v286 = a4;
  swift_retain();
  uint64_t v293 = v51;
  swift_retain();
  if (v53 != -1) {
    swift_once();
  }
  uint64_t v54 = __swift_project_value_buffer((uint64_t)v29, (uint64_t)qword_26880D108);
  uint64_t v55 = *(void (**)(void))(v30 + 16);
  uint64_t v289 = v54;
  v290 = (void (*)(uint64_t, uint64_t, void *))v55;
  v294 = v29;
  id v291 = (void *)(v30 + 16);
  v55(v50);
  uint64_t v56 = sub_2355BCB60();
  os_log_type_t v57 = sub_2355BCF60();
  uint64_t v58 = v28;
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v59 = 0;
    _os_log_impl(&dword_23556D000, v56, v57, "INAddMediaIntentHandler#handle", v59, 2u);
    MEMORY[0x237DE3BF0](v59, -1, -1);
  }

  os_log_type_t v62 = *(char **)(v30 + 8);
  uint64_t v60 = v30 + 8;
  uint64_t v61 = v62;
  BOOL v63 = v294;
  ((void (*)(char *, void *))v62)(v50, v294);
  id v64 = v288;
  id v65 = objc_msgSend(v288, sel_mediaItems);
  if (!v65)
  {
    swift_release();
LABEL_73:
    uint64_t v240 = v292;
    v290(v292, v289, v63);
    uint64_t v241 = v64;
    uint64_t v242 = sub_2355BCB60();
    os_log_type_t v243 = sub_2355BCF70();
    if (os_log_type_enabled(v242, v243))
    {
      uint64_t v283 = v60;
      uint64_t v244 = (uint8_t *)swift_slowAlloc();
      uint64_t v245 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v244 = 138543362;
      uint64_t v296 = (uint64_t)v241;
      uint64_t v246 = v241;
      BOOL v63 = v294;
      sub_2355BD1B0();
      *uint64_t v245 = v241;

      _os_log_impl(&dword_23556D000, v242, v243, "INAddMediaIntentHandler#handle missing expected mediaItem or destination in intent: %{public}@", v244, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
      swift_arrayDestroy();
      uint64_t v247 = v245;
      uint64_t v240 = v292;
      MEMORY[0x237DE3BF0](v247, -1, -1);
      MEMORY[0x237DE3BF0](v244, -1, -1);
    }
    else
    {

      uint64_t v242 = v241;
    }
    v248 = v287;

    ((void (*)(uint64_t, void *))v61)(v240, v63);
    id v249 = objc_allocWithZone(MEMORY[0x263F08D38]);
    v250 = (void *)sub_2355BCC40();
    id v251 = objc_msgSend(v249, sel_initWithActivityType_, v250);

    id v166 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v251);
    uint64_t v296 = (uint64_t)v166;
    v248(&v296);
LABEL_77:
    swift_release();

    return;
  }
  uint64_t v66 = v65;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v67 = sub_2355BCDB0();

  if (!(v67 >> 62))
  {
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
LABEL_72:
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_73;
  }
  swift_bridgeObjectRetain();
  uint64_t v239 = sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v239) {
    goto LABEL_72;
  }
LABEL_8:
  if ((v67 & 0xC000000000000001) != 0)
  {
    id v69 = (id)MEMORY[0x237DE35A0](0, v67);
    uint64_t v68 = (char **)v284;
  }
  else
  {
    uint64_t v68 = (char **)v284;
    if (!*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v69 = *(id *)(v67 + 32);
  }
  swift_bridgeObjectRelease();
  id v70 = objc_msgSend(v64, sel_mediaDestination);
  if (!v70)
  {

    swift_release();
    BOOL v63 = v294;
    goto LABEL_73;
  }
  int v71 = v70;
  sub_2355BCBC0();

  (*(void (**)(char *, char *, uint64_t))(v285 + 32))(v58, v26, v19);
  id v72 = objc_msgSend(v69, sel_identifier);
  uint64_t v292 = v19;
  uint64_t v283 = v60;
  if (v72)
  {
    uint64_t v73 = v72;
    sub_2355BCC50();

    sub_2355BC250();
    swift_allocObject();
    uint64_t v74 = v292;
    uint64_t v75 = sub_2355BC260();
    if (v75)
    {
      uint64_t v76 = v75;
      os_log_type_t v281 = v61;
      v290((uint64_t)v282, v289, v294);
      uint64_t v77 = v285;
      uint64_t v78 = *(void (**)(char **, char *, uint64_t))(v285 + 16);
      uint64_t v257 = v285 + 16;
      char v256 = v78;
      v78(v68, v58, v74);
      uint64_t v79 = (char *)v68;
      id v80 = v69;
      uint64_t v81 = sub_2355BCB60();
      os_log_type_t v82 = sub_2355BCF80();
      BOOL v83 = os_log_type_enabled(v81, v82);
      uint64_t v258 = v52;
      if (v83)
      {
        uint64_t v84 = swift_slowAlloc();
        uint64_t v85 = (void *)swift_slowAlloc();
        uint64_t v252 = v85;
        uint64_t v254 = swift_slowAlloc();
        uint64_t v295 = (uint64_t)v80;
        uint64_t v296 = v254;
        *(_DWORD *)uint64_t v84 = 138543618;
        os_log_t v253 = v81;
        id v86 = v80;
        uint64_t v255 = v76;
        uint64_t v87 = v77;
        id v88 = v86;
        sub_2355BD1B0();
        void *v85 = v80;

        *(_WORD *)(v84 + 12) = 2080;
        id v89 = v284;
        uint64_t v90 = sub_2355BCBA0();
        uint64_t v295 = sub_2355745F0(v90, v91, &v296);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        uint64_t v92 = v87;
        uint64_t v76 = v255;
        uint64_t v93 = *(void (**)(char *, uint64_t))(v92 + 8);
        v93(v89, v292);
        os_log_t v94 = v253;
        _os_log_impl(&dword_23556D000, v253, v82, "INAddMediaIntentHandler#handle item: %{public}@ and destination: %s", (uint8_t *)v84, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
        uint64_t v95 = v252;
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v95, -1, -1);
        uint64_t v96 = v254;
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v96, -1, -1);
        uint64_t v97 = v84;
        uint64_t v74 = v292;
        MEMORY[0x237DE3BF0](v97, -1, -1);
      }
      else
      {

        uint64_t v93 = *(void (**)(char *, uint64_t))(v77 + 8);
        v93(v79, v74);
      }
      uint64_t v111 = v294;
      ((void (*)(void, void *))v281)(v282, v294);
      id v112 = objc_msgSend(v80, sel_type);
      uint64_t v113 = v280;
      if (v112 != (id)6)
      {
        v290((uint64_t)v279, v289, v111);
        os_log_type_t v128 = sub_2355BCB60();
        os_log_type_t v129 = sub_2355BCF60();
        if (os_log_type_enabled(v128, v129))
        {
          uint64_t v130 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v130 = 0;
          _os_log_impl(&dword_23556D000, v128, v129, "INAddMediaIntentHandler#handle adding for music...", v130, 2u);
          id v131 = v130;
          uint64_t v74 = v292;
          MEMORY[0x237DE3BF0](v131, -1, -1);
        }

        ((void (*)(char *, void *))v281)(v279, v111);
        uint64_t v132 = v272;
        v256(v272, v58, v74);
        uint64_t v133 = v285;
        int v134 = (*(uint64_t (**)(char **, uint64_t))(v285 + 88))(v132, v74);
        if (v134 != *MEMORY[0x263F8F1D0])
        {
          if (v134 == *MEMORY[0x263F8F1C8])
          {
            v294 = v80;
            id v284 = v58;
            uint64_t v150 = *(void *)&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
            v290 = *(void (**)(uint64_t, uint64_t, void *))&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library
                                                                          + 32];
            id v291 = __swift_project_boxed_opaque_existential_1(&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], v150);
            os_log_type_t v151 = v263;
            uint64_t v152 = v76;
            sub_2355BC1F0();
            sub_2355BC1B0();
            (*(void (**)(char *, uint64_t))(v113 + 8))(v151, v277);
            uint64_t v296 = (uint64_t)v288;
            uint64_t v153 = v275;
            uint64_t v154 = v273;
            uint64_t v155 = v274;
            (*(void (**)(char *, void, uint64_t))(v275 + 104))(v273, *MEMORY[0x263F6CC40], v274);
            sub_23557DC00(0, &qword_26880C678);
            sub_2355BC8B0();
            uint64_t v157 = v156;
            (*(void (**)(char *, uint64_t))(v153 + 8))(v154, v155);
            uint64_t v158 = v93;
            if (v157)
            {
              sub_2355BCC70();
              swift_bridgeObjectRelease();
            }
            uint64_t v202 = (void *)swift_allocObject();
            v202[2] = 0xD00000000000002ALL;
            v202[3] = 0x80000002355BF2E0;
            uint64_t v203 = v276;
            v202[4] = v276;
            v202[5] = v152;
            uint64_t v204 = v258;
            v202[6] = sub_23559DFFC;
            v202[7] = v204;
            swift_bridgeObjectRetain();
            id v205 = v203;
            swift_retain();
            sub_2355BC430();

            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_release();
            v158(v284, v292);
          }
          else
          {
            swift_release();
            v290((uint64_t)v266, v289, v111);
            uint64_t v177 = sub_2355BCB60();
            os_log_type_t v178 = sub_2355BCF60();
            if (os_log_type_enabled(v177, v178))
            {
              uint64_t v179 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v179 = 0;
              _os_log_impl(&dword_23556D000, v177, v178, "INAddMediaIntentHandler#handle unexpected destination for add intent", v179, 2u);
              MEMORY[0x237DE3BF0](v179, -1, -1);
            }

            ((void (*)(char *, void *))v281)(v266, v111);
            id v180 = objc_allocWithZone(MEMORY[0x263F08D38]);
            uint64_t v181 = (void *)sub_2355BCC40();
            id v182 = objc_msgSend(v180, sel_initWithActivityType_, v181);

            id v183 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v182);
            uint64_t v296 = (uint64_t)v183;
            v287(&v296);

            swift_release();
            v93(v58, v74);

            v93((char *)v272, v74);
          }
          goto LABEL_69;
        }
        v282 = v93;
        id v284 = v58;
        (*(void (**)(char **, uint64_t))(v133 + 96))(v132, v74);
        id v135 = v132[1];
        uint64_t v278 = *v132;
        unint64_t v279 = v135;
        uint64_t v136 = v267;
        sub_2355BC1F0();
        os_log_type_t v137 = v268;
        sub_2355BC1C0();
        id v138 = *(void (**)(char *, uint64_t))(v113 + 8);
        uint64_t v139 = v136;
        uint64_t v140 = v277;
        v138(v139, v277);
        int v141 = (*(uint64_t (**)(char *, uint64_t))(v269 + 88))(v137, v270);
        if (v141 == *MEMORY[0x263F6CAB0])
        {
          v294 = v80;
          uint64_t v142 = *(void *)&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
          v290 = *(void (**)(uint64_t, uint64_t, void *))&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library
                                                                        + 32];
          id v291 = __swift_project_boxed_opaque_existential_1(&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], v142);
          id v143 = v264;
          sub_2355BC1F0();
          sub_2355BC1B0();
          v138(v143, v140);
          uint64_t v296 = (uint64_t)v288;
          uint64_t v144 = v275;
          uint64_t v145 = v273;
          uint64_t v146 = v274;
          (*(void (**)(char *, void, uint64_t))(v275 + 104))(v273, *MEMORY[0x263F6CC40], v274);
          sub_23557DC00(0, &qword_26880C678);
          sub_2355BC8B0();
          uint64_t v148 = v147;
          (*(void (**)(char *, uint64_t))(v144 + 8))(v145, v146);
          uint64_t v149 = v282;
          if (v148)
          {
            sub_2355BCC70();
            swift_bridgeObjectRelease();
          }
          id v199 = (void *)swift_allocObject();
          uint64_t v200 = v279;
          v199[2] = v278;
          v199[3] = v200;
          v199[4] = 0xD00000000000002ALL;
          v199[5] = 0x80000002355BF2E0;
          uint64_t v201 = v258;
          v199[6] = sub_23559DFFC;
          v199[7] = v201;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_2355BC490();

          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          swift_release();
          v149(v284, v292);
          goto LABEL_69;
        }
        uint64_t v93 = v282;
        if (v141 == *MEMORY[0x263F6CAB8])
        {
          uint64_t v167 = v271;
          sub_2355BC1F0();
          uint64_t v292 = sub_2355BC190();
          uint64_t v168 = v140;
          unint64_t v170 = v169;
          v138(v167, v168);
          os_log_type_t v171 = v262;
          v290((uint64_t)v262, v289, v111);
          swift_bridgeObjectRetain_n();
          os_log_t v172 = sub_2355BCB60();
          os_log_type_t v173 = sub_2355BCF80();
          BOOL v174 = os_log_type_enabled(v172, v173);
          uint64_t v255 = v76;
          uint64_t v287 = (void (*)(uint64_t *))v170;
          if (v174)
          {
            uint64_t v175 = (uint8_t *)swift_slowAlloc();
            uint64_t v176 = swift_slowAlloc();
            uint64_t v296 = v176;
            *(_DWORD *)uint64_t v175 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v295 = sub_2355745F0(v292, v170, &v296);
            sub_2355BD1B0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_23556D000, v172, v173, "INAddMediaIntentHandler#handle trying to add item with siriSyncID: %s", v175, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x237DE3BF0](v176, -1, -1);
            MEMORY[0x237DE3BF0](v175, -1, -1);

            ((void (*)(char *, void *))v281)(v171, v294);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            ((void (*)(char *, void *))v281)(v171, v111);
          }
          v206 = *(void **)&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
          __swift_project_boxed_opaque_existential_1(&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], (uint64_t)v206);
          uint64_t v296 = (uint64_t)v288;
          uint64_t v207 = v275;
          unint64_t v208 = v273;
          uint64_t v209 = v274;
          (*(void (**)(char *, void, uint64_t))(v275 + 104))(v273, *MEMORY[0x263F6CC40], v274);
          sub_23557DC00(0, &qword_26880C678);
          sub_2355BC8B0();
          uint64_t v211 = v210;
          (*(void (**)(char *, uint64_t))(v207 + 8))(v208, v209);
          v294 = v206;
          if (v211)
          {
            sub_2355BCC70();
            swift_bridgeObjectRelease();
          }
          char v219 = v279;
          id v220 = (void *)swift_allocObject();
          v220[2] = v278;
          v220[3] = v219;
          v220[4] = 0xD00000000000002ALL;
          v220[5] = 0x80000002355BF2E0;
          uint64_t v221 = v258;
          v220[6] = sub_23559DFFC;
          v220[7] = v221;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_2355BC460();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
        }
        else
        {
          if (v141 != *MEMORY[0x263F6CAA8])
          {
            if (v141 != *MEMORY[0x263F6CAA0])
            {
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v222 = v259;
              v290((uint64_t)v259, v289, v111);
              uint64_t v223 = sub_2355BCB60();
              os_log_type_t v224 = sub_2355BCF60();
              if (os_log_type_enabled(v223, v224))
              {
                v225 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v225 = 0;
                _os_log_impl(&dword_23556D000, v223, v224, "INAddMediaIntentHandler#handle unexpected content origin for add intent", v225, 2u);
                MEMORY[0x237DE3BF0](v225, -1, -1);
              }

              ((void (*)(char *, void *))v281)(v222, v111);
              id v226 = objc_allocWithZone(MEMORY[0x263F08D38]);
              id v227 = (void *)sub_2355BCC40();
              id v228 = objc_msgSend(v226, sel_initWithActivityType_, v227);

              id v229 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v228);
              uint64_t v296 = (uint64_t)v229;
              v287(&v296);

              swift_release();
              v93(v284, v74);

              (*(void (**)(char *, uint64_t))(v269 + 8))(v268, v270);
              goto LABEL_69;
            }
            uint64_t v212 = *(void *)&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
            uint64_t v292 = *(void *)&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 32];
            v294 = __swift_project_boxed_opaque_existential_1(&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], v212);
            uint64_t v213 = v260;
            uint64_t v255 = v76;
            sub_2355BC1F0();
            id v291 = (void *)sub_2355BC1B0();
            v138(v213, v140);
            uint64_t v296 = (uint64_t)v288;
            uint64_t v214 = v275;
            uint64_t v215 = v273;
            uint64_t v216 = v274;
            (*(void (**)(char *, void, uint64_t))(v275 + 104))(v273, *MEMORY[0x263F6CC40], v274);
            sub_23557DC00(0, &qword_26880C678);
            sub_2355BC8B0();
            uint64_t v218 = v217;
            (*(void (**)(char *, uint64_t))(v214 + 8))(v215, v216);
            if (v218)
            {
              sub_2355BCC70();
              swift_bridgeObjectRelease();
            }
            os_log_type_t v236 = (void *)swift_allocObject();
            uint64_t v237 = v279;
            v236[2] = v278;
            v236[3] = v237;
            v236[4] = 0xD00000000000002ALL;
            v236[5] = 0x80000002355BF2E0;
            uint64_t v238 = v258;
            v236[6] = sub_23559DFFC;
            v236[7] = v238;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_2355BC470();

            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            swift_release();
            uint64_t v190 = v284;
            uint64_t v191 = v74;
            goto LABEL_51;
          }
          uint64_t v192 = *(void *)&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
          id v291 = *(void **)&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 32];
          uint64_t v292 = v192;
          v294 = __swift_project_boxed_opaque_existential_1(&v276[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], v192);
          os_log_type_t v193 = v261;
          uint64_t v255 = v76;
          sub_2355BC1F0();
          v290 = (void (*)(uint64_t, uint64_t, void *))sub_2355BC1B0();
          v138(v193, v140);
          uint64_t v296 = (uint64_t)v288;
          uint64_t v194 = v275;
          id v195 = v273;
          uint64_t v196 = v274;
          (*(void (**)(char *, void, uint64_t))(v275 + 104))(v273, *MEMORY[0x263F6CC40], v274);
          sub_23557DC00(0, &qword_26880C678);
          sub_2355BC8B0();
          uint64_t v198 = v197;
          (*(void (**)(char *, uint64_t))(v194 + 8))(v195, v196);
          if (v198)
          {
            sub_2355BCC70();
            swift_bridgeObjectRelease();
          }
          v230 = (void *)swift_allocObject();
          uint64_t v231 = v279;
          v230[2] = v278;
          v230[3] = v231;
          v230[4] = 0xD00000000000002ALL;
          v230[5] = 0x80000002355BF2E0;
          char v232 = v276;
          uint64_t v233 = v255;
          v230[6] = v276;
          v230[7] = v233;
          uint64_t v234 = v258;
          v230[8] = sub_23559DFFC;
          v230[9] = v234;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          id v235 = v232;
          swift_retain();
          sub_2355BC480();

          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease_n();
        swift_release();
        v282(v284, v74);
        goto LABEL_69;
      }
      v290((uint64_t)v278, v289, v111);
      id v114 = sub_2355BCB60();
      os_log_type_t v115 = sub_2355BCF60();
      if (os_log_type_enabled(v114, v115))
      {
        uint64_t v116 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v116 = 0;
        _os_log_impl(&dword_23556D000, v114, v115, "INAddMediaIntentHandler#handle subscribing to podcast...", v116, 2u);
        MEMORY[0x237DE3BF0](v116, -1, -1);
      }

      ((void (*)(char *, void *))v281)(v278, v111);
      uint64_t v117 = v271;
      sub_2355BC1F0();
      sub_2355BC1B0();
      (*(void (**)(char *, uint64_t))(v113 + 8))(v117, v277);
      id v118 = objc_allocWithZone((Class)sub_2355BBF00());
      uint64_t v119 = sub_2355BBEF0();
      if (v119)
      {
        uint64_t v120 = (void *)v119;
        uint64_t v296 = (uint64_t)v288;
        uint64_t v121 = v275;
        unint64_t v122 = v273;
        uint64_t v123 = v274;
        (*(void (**)(char *, void, uint64_t))(v275 + 104))(v273, *MEMORY[0x263F6CC40], v274);
        sub_23557DC00(0, &qword_26880C678);
        sub_2355BC8B0();
        (*(void (**)(char *, uint64_t))(v121 + 8))(v122, v123);
        id v124 = objc_msgSend(v80, sel_privateMediaItemValueData);
        uint64_t v125 = v124;
        if (v124)
        {
          id v126 = v80;
          id v127 = objc_msgSend(v124, sel_sharedUserIdFromPlayableMusicAccount);

          if (v127)
          {
            sub_2355BCC50();
          }
          id v80 = v126;
        }
        id v184 = objc_allocWithZone((Class)sub_2355BBF20());
        v185 = (void *)sub_2355BBF10();
        char v186 = (void *)swift_allocObject();
        v186[2] = v120;
        v186[3] = v185;
        uint64_t v187 = v258;
        v186[4] = sub_23559DFFC;
        v186[5] = v187;
        id v188 = v120;
        id v189 = v185;
        sub_2355BC0B0();

        swift_release();
        swift_release();
        uint64_t v190 = v58;
        uint64_t v191 = v292;
LABEL_51:
        v93(v190, v191);
LABEL_69:
        swift_release();
        return;
      }
      swift_release();
      uint64_t v159 = v265;
      v290((uint64_t)v265, v289, v111);
      uint64_t v160 = sub_2355BCB60();
      os_log_type_t v161 = sub_2355BCF70();
      if (os_log_type_enabled(v160, v161))
      {
        os_log_type_t v162 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v162 = 0;
        _os_log_impl(&dword_23556D000, v160, v161, "Failed to get store id", v162, 2u);
        MEMORY[0x237DE3BF0](v162, -1, -1);
      }

      ((void (*)(char *, void *))v281)(v159, v111);
      id v163 = objc_allocWithZone(MEMORY[0x263F08D38]);
      uint64_t v164 = (void *)sub_2355BCC40();
      id v165 = objc_msgSend(v163, sel_initWithActivityType_, v164);

      id v166 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v165);
      uint64_t v296 = (uint64_t)v166;
      v287(&v296);

      swift_release();
      v93(v58, v292);
      goto LABEL_77;
    }
  }
  swift_release();
  id v98 = v281;
  v290((uint64_t)v281, v289, v294);
  uint64_t v99 = v69;
  unint64_t v100 = sub_2355BCB60();
  os_log_type_t v101 = sub_2355BCF70();
  if (os_log_type_enabled(v100, v101))
  {
    id v284 = v58;
    uint64_t v102 = (uint8_t *)swift_slowAlloc();
    id v291 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v102 = 138543362;
    uint64_t v296 = (uint64_t)v99;
    uint64_t v103 = v61;
    uint64_t v104 = v99;
    uint64_t v58 = v284;
    sub_2355BD1B0();
    uint64_t v105 = v291;
    *id v291 = v99;

    uint64_t v61 = v103;
    uint64_t v106 = v285;
    _os_log_impl(&dword_23556D000, v100, v101, "INAddMediaIntentHandler#handle item missing identifier: %{public}@, or create PlaybackItem failed.", v102, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v105, -1, -1);
    MEMORY[0x237DE3BF0](v102, -1, -1);
  }
  else
  {

    unint64_t v100 = v99;
    uint64_t v106 = v285;
  }

  ((void (*)(char *, void *))v61)(v98, v294);
  id v107 = objc_allocWithZone(MEMORY[0x263F08D38]);
  uint64_t v108 = (void *)sub_2355BCC40();
  id v109 = objc_msgSend(v107, sel_initWithActivityType_, v108);

  id v110 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F940]), sel_initWithCode_userActivity_, 5, v109);
  uint64_t v296 = (uint64_t)v110;
  v287(&v296);

  (*(void (**)(char *, uint64_t))(v106 + 8))(v58, v292);
  swift_release();
}

uint64_t type metadata accessor for INAddMediaIntentHandler()
{
  return self;
}

uint64_t sub_23559D520(uint64_t a1)
{
  return sub_23559D5A4(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))sub_2355954F8);
}

uint64_t objectdestroy_31Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_23559D58C(uint64_t a1)
{
  return sub_23559D5A4(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))sub_235595AE8);
}

uint64_t sub_23559D5A4(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9]);
}

uint64_t sub_23559D5EC(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v5 = *a1;
  char v6 = v3;
  return v2(&v5);
}

uint64_t sub_23559D630(uint64_t a1, char a2)
{
  char v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v5 = a1;
  char v6 = a2 & 1;
  return v3(&v5);
}

void sub_23559D674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_2355925AC(a1, a2, a3, a4, a5, a6, a7, *(void (**)(void))(v7 + 16), *(void *)(v7 + 24), *(char **)(v7 + 32), *(void **)(v7 + 40));
}

uint64_t sub_23559D6A8()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_23559D6F8(int a1)
{
  sub_23559284C(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(char **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void **)(v1 + 56));
}

uint64_t sub_23559D708()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_23559D758(uint64_t a1)
{
  return sub_23559DB30(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_235592BF4);
}

uint64_t sub_23559D770()
{
  uint64_t v1 = sub_2355BC320();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 88) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_23559D85C(char a1)
{
  uint64_t v3 = *(void *)(sub_2355BC320() - 8);
  sub_235594028(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), v1 + ((*(unsigned __int8 *)(v3 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

uint64_t sub_23559D8E4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23559D91C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_23559D930(uint64_t a1)
{
  sub_23558D048(a1, *(void *)(v1 + 16));
}

void sub_23559D940(uint64_t a1)
{
}

void sub_23559D968(uint64_t a1)
{
}

uint64_t objectdestroy_76Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_23559D9D8(uint64_t a1)
{
}

void sub_23559D9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23558FE58(a1, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void (**)(void *))(v3 + 48), *(void *)(v3 + 56), a2, a3);
}

uint64_t sub_23559DA34()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_23559DA8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23558F5B4(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), *(void (**)(void *))(v3 + 64), *(void *)(v3 + 72));
}

uint64_t sub_23559DAC8()
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_23559DB18(uint64_t a1)
{
  return sub_23559DB30(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_23558EDC0);
}

uint64_t sub_23559DB30(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

void sub_23559DB4C(void **a1)
{
  sub_23558E608(a1, v1[2], v1[3], v1[4], v1[5]);
}

void sub_23559DB58(uint64_t a1)
{
  sub_23558E728(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23559DB78(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_23559DBB0()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_23559DBF0(void *a1)
{
  sub_23558DF6C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t objectdestroy_8Tm()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23559DC4C(uint64_t a1, char a2)
{
  return sub_23559DC80(a1, a2);
}

uint64_t sub_23559DC80(uint64_t a1, char a2)
{
  return sub_23558DC20(a1, a2 & 1, v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_23559DCBC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23559DD0C(uint64_t a1)
{
  return sub_2355916BC(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_23559DD1C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroy_49Tm()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23559DDB0(char a1)
{
  return sub_235591C20(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_23559DDBC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t objectdestroy_2Tm_0()
{
  uint64_t v1 = sub_2355BCB50();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 33) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_23559DE9C(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_2355BCB50() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(uint64_t (**)(uint64_t *))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *(unsigned __int8 *)(v1 + 32);
  return sub_2355968D8(a1, v5, v6, v8, v1 + v4, v7);
}

void sub_23559DF44(void (*a1)(NSObject **), uint64_t a2)
{
  sub_2355905AC(a1, a2, *(void **)(v2 + 16), *(unsigned char *)(v2 + 24), *(NSObject **)(v2 + 32), *(char **)(v2 + 40));
}

uint64_t sub_23559DF54()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23559DF8C(uint64_t a1, uint64_t a2)
{
  return sub_23558C6E4(a1, a2, (void *)(v2 + 16));
}

uint64_t sub_23559DF94(uint64_t a1, void *a2)
{
  return sub_23558C7D4(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24));
}

uint64_t INMediaItem.isInternalSignalPresent(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = &off_264C5D000;
    uint64_t v6 = &off_264C5D000;
    uint64_t v24 = v2;
    while (1)
    {
      uint64_t v7 = (uint64_t *)(v3 + 16 * v4);
      uint64_t v9 = *v7;
      uint64_t v8 = v7[1];
      swift_bridgeObjectRetain();
      id v10 = [v1 (SEL)v5[96]];
      if (!v10) {
        goto LABEL_21;
      }
      uint64_t v11 = v10;
      id v12 = [v10 (SEL)v6[136]];

      if (!v12) {
        goto LABEL_21;
      }
      uint64_t v13 = (void *)sub_2355BCDB0();

      uint64_t v14 = v13[2];
      if (!v14) {
        break;
      }
      BOOL v15 = v13[4] == v9 && v13[5] == v8;
      if (v15 || (v16 = v1, v17 = v3, uint64_t result = sub_2355BD2F0(), (result & 1) != 0))
      {
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v23 = 1;
        goto LABEL_27;
      }
      if (v14 != 1)
      {
        uint64_t v19 = v13 + 7;
        uint64_t v20 = 1;
        while (1)
        {
          uint64_t v21 = v20 + 1;
          if (__OFADD__(v20, 1)) {
            break;
          }
          if (*(v19 - 1) == v9 && *v19 == v8) {
            goto LABEL_25;
          }
          uint64_t result = sub_2355BD2F0();
          if (result) {
            goto LABEL_25;
          }
          v19 += 2;
          ++v20;
          if (v21 == v14) {
            goto LABEL_20;
          }
        }
        __break(1u);
        return result;
      }
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = v17;
      uint64_t v1 = v16;
      uint64_t v2 = v24;
      uint64_t v5 = &off_264C5D000;
      uint64_t v6 = &off_264C5D000;
LABEL_22:
      if (++v4 == v2)
      {
        uint64_t v23 = 0;
LABEL_27:
        swift_bridgeObjectRelease();
        return v23;
      }
    }
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  return 0;
}

uint64_t sub_23559E1CC()
{
  type metadata accessor for InternalSignalsManager();
  uint64_t v0 = swift_allocObject();
  sub_2355BBFF0();
  sub_2355BBFE0();
  sub_2355BC160();
  swift_allocObject();
  uint64_t result = sub_2355BC140();
  *(void *)(v0 + 16) = result;
  off_26880C6E0 = (_UNKNOWN *)v0;
  return result;
}

uint64_t static InternalSignalsManager.doesIntent(_:haveInternalSignalWith:)(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v42 = a2;
  unint64_t v5 = sub_2355BCB80();
  unint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v37 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v37 - v13;
  if (qword_26880C110 != -1) {
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v37 = v12;
    swift_retain();
    sub_2355BC130();
    swift_release();
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v38 = v9;
    uint64_t v15 = __swift_project_value_buffer(v5, (uint64_t)qword_26880D108);
    uint64_t v41 = *(void (**)(char *, uint64_t, unint64_t))(v6 + 16);
    v41(v14, v15, v5);
    uint64_t v16 = sub_2355BCB60();
    os_log_type_t v17 = sub_2355BCF80();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_23556D000, v16, v17, "InternalSignalsManager#doesIntent#haveInternalSignalWith (lock aquired)", v18, 2u);
      MEMORY[0x237DE3BF0](v18, -1, -1);
    }

    uint64_t v19 = *(void (**)(char *, unint64_t))(v6 + 8);
    unint64_t v20 = v6 + 8;
    unint64_t v6 = v5;
    uint64_t v39 = v19;
    unint64_t v40 = v20;
    v19(v14, v5);
    uint64_t v21 = (char *)_s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(a1);
    id v12 = v21;
    uint64_t v9 = (char *)*((void *)v21 + 2);
    if (!v9) {
      break;
    }
    uint64_t v14 = (char *)*((void *)v21 + 4);
    a1 = (void *)*((void *)v21 + 5);
    swift_bridgeObjectRetain();
    if (sub_2355BCD40())
    {
LABEL_8:
      swift_bridgeObjectRelease();
      uint64_t v22 = v37;
      v41(v37, v15, v6);
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_2355BCB60();
      os_log_type_t v24 = sub_2355BCF80();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        uint64_t v44 = v26;
        *(_DWORD *)uint64_t v25 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_2355745F0((uint64_t)v14, (unint64_t)a1, &v44);
        sub_2355BD1B0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23556D000, v23, v24, "InternalSignalsManager#doesIntent#haveInternalSignalWith %s is present. (unlock)", v25, 0xCu);
        uint64_t v27 = 1;
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v26, -1, -1);
        MEMORY[0x237DE3BF0](v25, -1, -1);

        v39(v37, v6);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v39(v22, v6);
        uint64_t v27 = 1;
      }
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    if (v9 == (char *)1) {
      break;
    }
    uint64_t v28 = (void **)(v12 + 56);
    unint64_t v5 = 1;
    while (v5 < *((void *)v12 + 2))
    {
      uint64_t v14 = (char *)*(v28 - 1);
      a1 = *v28;
      swift_bridgeObjectRetain();
      if (sub_2355BCD40()) {
        goto LABEL_8;
      }
      swift_bridgeObjectRelease();
      ++v5;
      v28 += 2;
      if (v9 == (char *)v5) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_22:
    swift_once();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v29 = v38;
  v41(v38, v15, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_2355BCB60();
  os_log_type_t v31 = sub_2355BCF80();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = v29;
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v44 = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_2355745F0(v42, a3, &v44);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v30, v31, "InternalSignalsManager#doesIntenthaveInternalSignalWith prefix: %s is not present in intent. (unlock)", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v34, -1, -1);
    MEMORY[0x237DE3BF0](v33, -1, -1);

    uint64_t v35 = v32;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v35 = v29;
  }
  v39(v35, v6);
  uint64_t v27 = 0;
LABEL_20:
  swift_retain();
  sub_2355BC150();
  swift_release();
  return v27;
}

uint64_t static InternalSignalsManager.getSignal(with:from:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v4 = sub_2355BCB80();
  unint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v41 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v41 - v12;
  if (qword_26880C110 != -1) {
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v41 = v11;
    swift_retain();
    sub_2355BC130();
    swift_release();
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v42 = v8;
    uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
    uint64_t v8 = *(char **)(v5 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v8)(v13, v14, v4);
    uint64_t v15 = sub_2355BCB60();
    os_log_type_t v16 = sub_2355BCF80();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v17 = 0;
      _os_log_impl(&dword_23556D000, v15, v16, "InternalSignalsManager#getSignal (lock aquired)", v17, 2u);
      MEMORY[0x237DE3BF0](v17, -1, -1);
    }

    uint64_t v43 = *(void (**)(char *, uint64_t))(v5 + 8);
    unint64_t v44 = v5 + 8;
    v43(v13, v4);
    uint64_t v18 = (char *)_s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(a3);
    uint64_t v11 = v18;
    uint64_t v19 = *((void *)v18 + 2);
    if (!v19) {
      break;
    }
    uint64_t v13 = (char *)*((void *)v18 + 4);
    a3 = (void *)*((void *)v18 + 5);
    swift_bridgeObjectRetain();
    if (sub_2355BCD40())
    {
LABEL_8:
      swift_bridgeObjectRelease();
      unint64_t v20 = v41;
      ((void (*)(char *, uint64_t, uint64_t))v8)(v41, v14, v4);
      swift_bridgeObjectRetain_n();
      uint64_t v21 = sub_2355BCB60();
      os_log_type_t v22 = sub_2355BCF80();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        uint64_t v48 = v24;
        *(_DWORD *)uint64_t v23 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v47 = sub_2355745F0((uint64_t)v13, (unint64_t)a3, &v48);
        sub_2355BD1B0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23556D000, v21, v22, "InternalSignalsManager#getSignal returning signal: %s. (unlock)", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v24, -1, -1);
        MEMORY[0x237DE3BF0](v23, -1, -1);

        uint64_t v25 = v41;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v25 = v20;
      }
      v43(v25, v4);
      swift_retain();
      sub_2355BC150();
      swift_release();
      unint64_t v32 = sub_2355BCCB0();
      unint64_t v33 = sub_2355A07D4(v32, (uint64_t)v13, (unint64_t)a3);
      uint64_t v35 = v34;
      uint64_t v37 = v36;
      uint64_t v39 = v38;
      swift_bridgeObjectRelease();
      uint64_t v31 = MEMORY[0x237DE2FD0](v33, v35, v37, v39);
      swift_bridgeObjectRelease();
      return v31;
    }
    swift_bridgeObjectRelease();
    if (v19 == 1) {
      break;
    }
    uint64_t v26 = (void **)(v11 + 56);
    unint64_t v5 = 1;
    while (v5 < *((void *)v11 + 2))
    {
      uint64_t v13 = (char *)*(v26 - 1);
      a3 = *v26;
      swift_bridgeObjectRetain();
      if (sub_2355BCD40()) {
        goto LABEL_8;
      }
      swift_bridgeObjectRelease();
      ++v5;
      v26 += 2;
      if (v19 == v5) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_22:
    swift_once();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v27 = v42;
  ((void (*)(char *, uint64_t, uint64_t))v8)(v42, v14, v4);
  uint64_t v28 = sub_2355BCB60();
  os_log_type_t v29 = sub_2355BCF80();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_23556D000, v28, v29, "InternalSignalsManager#getSignal could not find signal. (unlock)", v30, 2u);
    MEMORY[0x237DE3BF0](v30, -1, -1);
  }

  v43(v27, v4);
  swift_retain();
  sub_2355BC150();
  swift_release();
  return 0;
}

void static InternalSignalsManager.add(_:to:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6 = sub_2355BCB80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v56 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v47 - v10;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v6, (uint64_t)qword_26880D108);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v54 = v12;
  uint64_t v55 = v7 + 16;
  uint64_t v53 = v13;
  ((void (*)(char *))v13)(v11);
  swift_bridgeObjectRetain_n();
  id v14 = a3;
  uint64_t v15 = sub_2355BCB60();
  os_log_type_t v16 = sub_2355BCF80();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v51 = v7;
    uint64_t v18 = v17;
    uint64_t v48 = (void *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v58 = v49;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v52 = v6;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_2355745F0(a1, a2, &v58);
    uint64_t v50 = v11;
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2112;
    uint64_t v57 = (uint64_t)v14;
    uint64_t v19 = a1;
    unint64_t v20 = a2;
    id v21 = v14;
    uint64_t v6 = v52;
    sub_2355BD1B0();
    os_log_type_t v22 = v48;
    *uint64_t v48 = v14;

    a2 = v20;
    a1 = v19;
    _os_log_impl(&dword_23556D000, v15, v16, "InternalSignalsManager#add signal: %s, to intent: %@...", (uint8_t *)v18, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v22, -1, -1);
    uint64_t v23 = v49;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v23, -1, -1);
    uint64_t v24 = v18;
    uint64_t v25 = v51;
    MEMORY[0x237DE3BF0](v24, -1, -1);

    uint64_t v26 = *(void (**)(char *, uint64_t))(v25 + 8);
    v26(v50, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v7 + 8);
    v26(v11, v6);
  }
  self;
  uint64_t v27 = swift_dynamicCastObjCClass();
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = qword_26880C110;
    id v30 = v14;
    if (v29 != -1) {
      swift_once();
    }
    sub_23559F3D4(a1, a2, v28);
  }
  else
  {
    self;
    uint64_t v31 = swift_dynamicCastObjCClass();
    if (v31)
    {
      unint64_t v32 = (void *)v31;
      uint64_t v33 = qword_26880C110;
      id v34 = v14;
      if (v33 != -1) {
        swift_once();
      }
      sub_2355A0884(a1, a2, v32);
    }
    else
    {
      self;
      uint64_t v35 = swift_dynamicCastObjCClass();
      if (v35)
      {
        uint64_t v36 = (void *)v35;
        uint64_t v37 = qword_26880C110;
        id v38 = v14;
        if (v37 != -1) {
          swift_once();
        }
        sub_2355A0E30(a1, a2, v36);
      }
      else
      {
        self;
        uint64_t v39 = swift_dynamicCastObjCClass();
        if (v39)
        {
          unint64_t v40 = (void *)v39;
          uint64_t v41 = qword_26880C110;
          id v42 = v14;
          if (v41 != -1) {
            swift_once();
          }
          sub_2355A13DC(a1, a2, v40);
        }
        else
        {
          uint64_t v43 = v56;
          v53(v56, v54, v6);
          unint64_t v44 = sub_2355BCB60();
          os_log_type_t v45 = sub_2355BCF70();
          if (os_log_type_enabled(v44, v45))
          {
            uint64_t v46 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v46 = 0;
            _os_log_impl(&dword_23556D000, v44, v45, "InternalSignalsManager#add Unexpected intent type when adding internal signal", v46, 2u);
            MEMORY[0x237DE3BF0](v46, -1, -1);
          }

          v26(v43, v6);
        }
      }
    }
  }
}

uint64_t sub_23559F3D4(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v52 = a2;
  uint64_t v53 = a1;
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v49 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v49 - v12;
  if (qword_26880C110 != -1) {
    swift_once();
  }
  uint64_t v54 = v11;
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v15(v13, v14, v4);
  os_log_type_t v16 = sub_2355BCB60();
  os_log_type_t v17 = sub_2355BCF80();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = (void (*)(char *, uint64_t))(v5 + 16);
    uint64_t v19 = v4;
    uint64_t v20 = v14;
    id v21 = v15;
    os_log_type_t v22 = v8;
    uint64_t v23 = a3;
    uint64_t v24 = v5;
    uint64_t v25 = v18;
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_23556D000, v16, v17, "InternalSignalsManager#add#fromPlayMediaIntent (lock aquired)", v18, 2u);
    uint64_t v26 = v25;
    uint64_t v5 = v24;
    a3 = v23;
    uint64_t v8 = v22;
    uint64_t v15 = v21;
    uint64_t v14 = v20;
    uint64_t v4 = v19;
    MEMORY[0x237DE3BF0](v26, -1, -1);
  }

  uint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v28 = v5 + 8;
  uint64_t v27 = v29;
  v29(v13, v4);
  id v30 = objc_msgSend(a3, sel_backingStore);
  self;
  uint64_t v31 = (void *)swift_dynamicCastObjCClass();
  if (v31)
  {
    unint64_t v32 = v31;
    uint64_t v50 = v27;
    uint64_t v51 = v28;
    id v33 = objc_msgSend(v31, sel_privatePlayMediaIntentData);

    if (!v33)
    {
      id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10158]), sel_init);
      objc_msgSend(v32, sel_setPrivatePlayMediaIntentData_, v34);
    }
    id v35 = objc_msgSend(v32, sel_privatePlayMediaIntentData);
    unint64_t v36 = v52;
    if (v35)
    {
      uint64_t v37 = v35;
      id v38 = (void *)sub_2355BCC40();
      objc_msgSend(v37, sel_addInternalSignal_, v38);
    }
    uint64_t v39 = v54;
    v15(v54, v14, v4);
    swift_bridgeObjectRetain_n();
    unint64_t v40 = sub_2355BCB60();
    os_log_type_t v41 = sub_2355BCF80();
    if (os_log_type_enabled(v40, v41))
    {
      id v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v56 = v43;
      *(_DWORD *)id v42 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v55 = sub_2355745F0(v53, v36, &v56);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v40, v41, "InternalSignalsManager#add#fromPlayMediaIntent added %s to playMediaIntent. (unlock)", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v43, -1, -1);
      MEMORY[0x237DE3BF0](v42, -1, -1);

      unint64_t v44 = v54;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v44 = v39;
    }
    v50(v44, v4);
    swift_retain();
    sub_2355BC150();

    return swift_release();
  }
  else
  {

    v15(v8, v14, v4);
    os_log_type_t v45 = sub_2355BCB60();
    os_log_type_t v46 = sub_2355BCF70();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_23556D000, v45, v46, "InternalSignalsManager#add#fromPlayMediaIntent Unexpected backing store error adding internal signal. (unlock)", v47, 2u);
      MEMORY[0x237DE3BF0](v47, -1, -1);
    }

    v27(v8, v4);
    return sub_2355BC150();
  }
}

void static InternalSignalsManager.remove(_:from:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6 = sub_2355BCB80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v47 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v43 - v10;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v6, (uint64_t)qword_26880D108);
  uint64_t v13 = v7 + 16;
  os_log_type_t v45 = *(void (**)(char *))(v7 + 16);
  uint64_t v46 = v12;
  v45(v11);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_2355BCB60();
  os_log_type_t v15 = sub_2355BCF80();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v48 = a1;
    os_log_type_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v44 = v7;
    uint64_t v19 = v18;
    uint64_t v50 = v18;
    uint64_t v43 = v13;
    *(_DWORD *)os_log_type_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_2355745F0(v48, a2, &v50);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23556D000, v14, v15, "InternalSignalsManager#remove %s...", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v19;
    uint64_t v7 = v44;
    MEMORY[0x237DE3BF0](v20, -1, -1);
    id v21 = v17;
    a1 = v48;
    MEMORY[0x237DE3BF0](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  v22(v11, v6);
  self;
  uint64_t v23 = swift_dynamicCastObjCClass();
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v25 = qword_26880C110;
    id v26 = a3;
    if (v25 != -1) {
      swift_once();
    }
    sub_2355A1988(a1, a2, v24);
  }
  else
  {
    self;
    uint64_t v27 = swift_dynamicCastObjCClass();
    if (v27)
    {
      uint64_t v28 = (void *)v27;
      uint64_t v29 = qword_26880C110;
      id v30 = a3;
      if (v29 != -1) {
        swift_once();
      }
      sub_2355A1FE4(a1, a2, v28);
    }
    else
    {
      self;
      uint64_t v31 = swift_dynamicCastObjCClass();
      if (v31)
      {
        unint64_t v32 = (void *)v31;
        uint64_t v33 = qword_26880C110;
        id v34 = a3;
        if (v33 != -1) {
          swift_once();
        }
        sub_2355A2640(a1, a2, v32);
      }
      else
      {
        self;
        uint64_t v35 = swift_dynamicCastObjCClass();
        if (v35)
        {
          unint64_t v36 = (void *)v35;
          uint64_t v37 = qword_26880C110;
          id v38 = a3;
          if (v37 != -1) {
            swift_once();
          }
          sub_2355A2C9C(a1, a2, v36);
        }
        else
        {
          uint64_t v39 = v47;
          ((void (*)(char *, uint64_t, uint64_t))v45)(v47, v46, v6);
          unint64_t v40 = sub_2355BCB60();
          os_log_type_t v41 = sub_2355BCF70();
          if (os_log_type_enabled(v40, v41))
          {
            id v42 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v42 = 0;
            _os_log_impl(&dword_23556D000, v40, v41, "InternalSignalsManager#remove Unexpected intent type when removing internal signal", v42, 2u);
            MEMORY[0x237DE3BF0](v42, -1, -1);
          }

          v22(v39, v6);
        }
      }
    }
  }
}

uint64_t sub_23559FE84(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_2355BD2F0() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_2355BD2F0();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

uint64_t sub_23559FF6C(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_2355A00B8(v3);
  }
  unint64_t v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      BOOL v7 = &v3[2 * a1];
      uint64_t v8 = v7[4];
      memmove(v7 + 4, v7 + 6, 16 * v6);
      v3[2] = v5;
      void *v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

uint64_t InternalSignalsManager.deinit()
{
  swift_release();
  return v0;
}

uint64_t InternalSignalsManager.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2355A00A4(unint64_t a1)
{
  return sub_2355B6EF0(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_2355A00B8(void *a1)
{
  return sub_2355B6DE0(0, a1[2], 0, a1);
}

uint64_t _s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(void *a1)
{
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = a1;
    id v5 = objc_msgSend(v3, sel_privatePlayMediaIntentData);
    if (v5) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v14 = MEMORY[0x263F8EE78];
    goto LABEL_15;
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    BOOL v7 = (void *)v6;
    id v4 = a1;
    id v5 = objc_msgSend(v7, sel_privateAddMediaIntentData);
    if (!v5) {
      goto LABEL_14;
    }
  }
  else
  {
    self;
    uint64_t v8 = swift_dynamicCastObjCClass();
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      id v4 = a1;
      id v5 = objc_msgSend(v9, sel_privateUpdateMediaAffinityIntentData);
      if (!v5) {
        goto LABEL_14;
      }
    }
    else
    {
      self;
      uint64_t v10 = swift_dynamicCastObjCClass();
      if (!v10) {
        return MEMORY[0x263F8EE78];
      }
      uint64_t v11 = (void *)v10;
      id v4 = a1;
      id v5 = objc_msgSend(v11, sel_privateSearchForMediaIntentData);
      if (!v5) {
        goto LABEL_14;
      }
    }
  }
LABEL_12:
  uint64_t v12 = v5;
  id v13 = objc_msgSend(v5, sel_internalSignals);

  if (!v13) {
    goto LABEL_14;
  }
  uint64_t v14 = sub_2355BCDB0();

  id v4 = v13;
LABEL_15:

  return v14;
}

uint64_t _s17SiriAudioInternal0C14SignalsManagerC10doesIntent_4haveSbSo8INIntentC_SaySSGtFZ_0(void *a1, uint64_t a2)
{
  id v4 = (void *)sub_2355BCB80();
  uint64_t v5 = *(v4 - 1);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v38 - v9;
  if (qword_26880C110 != -1) {
    goto LABEL_40;
  }
  while (1)
  {
    os_log_type_t v45 = v8;
    swift_retain();
    sub_2355BC130();
    swift_release();
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer((uint64_t)v4, (uint64_t)qword_26880D108);
    os_log_type_t v41 = *(void (**)(char *))(v5 + 16);
    uint64_t v42 = v11;
    v41(v10);
    uint64_t v12 = sub_2355BCB60();
    os_log_type_t v13 = sub_2355BCF80();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_23556D000, v12, v13, "InternalSignalsManager#doesIntent#have (lock aquired)", v14, 2u);
      MEMORY[0x237DE3BF0](v14, -1, -1);
    }

    uint64_t v16 = *(void (**)(char *, void *))(v5 + 8);
    uint64_t v15 = v5 + 8;
    uint64_t v43 = v16;
    v16(v10, v4);
    uint64_t v17 = _s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(a1);
    uint64_t v8 = (char *)v17;
    uint64_t v18 = *(void *)(a2 + 16);
    if (!v18) {
      break;
    }
    v38[2] = v15;
    uint64_t v39 = v4;
    uint64_t v19 = 0;
    v38[1] = a2;
    uint64_t v44 = a2 + 32;
    uint64_t v5 = *(void *)(v17 + 16);
    unint64_t v40 = (void *)(v17 + 56);
    while (1)
    {
      if (v5)
      {
        uint64_t v20 = v44 + 16 * v19;
        a1 = *(void **)v20;
        uint64_t v10 = *(char **)(v20 + 8);
        BOOL v21 = *((void *)v8 + 4) == *(void *)v20 && *((void *)v8 + 5) == (void)v10;
        if (v21 || (sub_2355BD2F0() & 1) != 0)
        {
LABEL_25:
          swift_bridgeObjectRelease();
          uint64_t v24 = 1;
LABEL_26:
          id v4 = v39;
          uint64_t v25 = v45;
          goto LABEL_28;
        }
        if (v5 != 1) {
          break;
        }
      }
LABEL_8:
      if (++v19 == v18)
      {
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        goto LABEL_26;
      }
    }
    id v4 = v40;
    uint64_t v22 = 1;
    while (1)
    {
      a2 = v22 + 1;
      if (__OFADD__(v22, 1)) {
        break;
      }
      BOOL v23 = (void *)*(v4 - 1) == a1 && *v4 == (void)v10;
      if (v23 || (sub_2355BD2F0() & 1) != 0) {
        goto LABEL_25;
      }
      v4 += 2;
      ++v22;
      if (a2 == v5) {
        goto LABEL_8;
      }
    }
    __break(1u);
LABEL_40:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = 0;
  uint64_t v25 = v45;
LABEL_28:
  ((void (*)(char *, uint64_t, void *))v41)(v25, v42, v4);
  swift_bridgeObjectRetain_n();
  id v26 = sub_2355BCB60();
  os_log_type_t v27 = sub_2355BCF80();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    uint64_t v47 = v44;
    *(_DWORD *)uint64_t v28 = 136315394;
    uint64_t v29 = swift_bridgeObjectRetain();
    uint64_t v30 = MEMORY[0x237DE3110](v29, MEMORY[0x263F8D310]);
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_2355745F0(v30, v32, &v47);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    if (v24) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = 7630702;
    }
    if (v24) {
      unint64_t v34 = 0xE000000000000000;
    }
    else {
      unint64_t v34 = 0xE300000000000000;
    }
    uint64_t v46 = sub_2355745F0(v33, v34, &v47);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v26, v27, "InternalSignalsManager#doesIntent signals: %s %s present in intent. (unlock)", (uint8_t *)v28, 0x16u);
    uint64_t v35 = v44;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v35, -1, -1);
    MEMORY[0x237DE3BF0](v28, -1, -1);

    unint64_t v36 = v45;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    unint64_t v36 = v25;
  }
  v43(v36, v4);
  swift_retain();
  sub_2355BC150();
  swift_release();
  return v24;
}

unint64_t sub_2355A07D4(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  uint64_t result = sub_2355BCCC0();
  if (v6) {
    uint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }
  return sub_2355BCD60();
}

uint64_t sub_2355A0884(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v48 = a2;
  uint64_t v49 = a1;
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v50 = (char *)&v47 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v47 - v11;
  if (qword_26880C110 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, v13, v4);
  uint64_t v15 = sub_2355BCB60();
  os_log_type_t v16 = sub_2355BCF80();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = v5 + 16;
    uint64_t v18 = v4;
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    BOOL v21 = v8;
    uint64_t v22 = a3;
    uint64_t v23 = v5;
    uint64_t v24 = v17;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_23556D000, v15, v16, "InternalSignalsManager#add#fromAddMediaIntent (lock aquired)", v17, 2u);
    uint64_t v25 = v24;
    uint64_t v5 = v23;
    a3 = v22;
    uint64_t v8 = v21;
    uint64_t v14 = v20;
    uint64_t v13 = v19;
    uint64_t v4 = v18;
    MEMORY[0x237DE3BF0](v25, -1, -1);
  }

  uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v26 = v5 + 8;
  os_log_type_t v27 = v28;
  v28(v12, v4);
  id v29 = objc_msgSend(a3, sel_backingStore);
  self;
  uint64_t v30 = (void *)swift_dynamicCastObjCClass();
  if (v30)
  {
    unint64_t v31 = v30;
    uint64_t v47 = v26;
    id v32 = objc_msgSend(v30, sel_privateAddMediaIntentData);

    if (!v32)
    {
      id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10140]), sel_init);
      objc_msgSend(v31, sel_setPrivateAddMediaIntentData_, v33);
    }
    id v34 = objc_msgSend(v31, sel_privateAddMediaIntentData);
    unint64_t v35 = v48;
    if (v34)
    {
      unint64_t v36 = v34;
      uint64_t v37 = (void *)sub_2355BCC40();
      objc_msgSend(v36, sel_addInternalSignal_, v37);
    }
    id v38 = v50;
    v14(v50, v13, v4);
    swift_bridgeObjectRetain_n();
    uint64_t v39 = sub_2355BCB60();
    os_log_type_t v40 = sub_2355BCF80();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_type_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v52 = v42;
      *(_DWORD *)os_log_type_t v41 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_2355745F0(v49, v35, &v52);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v39, v40, "InternalSignalsManager#add#fromAddMediaIntent added %s to addMediaIntent. (unlock)", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v42, -1, -1);
      MEMORY[0x237DE3BF0](v41, -1, -1);

      v27(v50, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v27(v38, v4);
    }
    swift_retain();
    sub_2355BC150();
  }
  else
  {

    v14(v8, v13, v4);
    uint64_t v43 = sub_2355BCB60();
    os_log_type_t v44 = sub_2355BCF70();
    if (os_log_type_enabled(v43, v44))
    {
      os_log_type_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v45 = 0;
      _os_log_impl(&dword_23556D000, v43, v44, "InternalSignalsManager#add#fromAddMediaIntent Unexpected backing store error while adding internal signal. (unlock)", v45, 2u);
      MEMORY[0x237DE3BF0](v45, -1, -1);
    }

    v27(v8, v4);
    swift_retain();
    sub_2355BC150();
  }
  return swift_release();
}

uint64_t sub_2355A0E30(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v48 = a2;
  uint64_t v49 = a1;
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v50 = (char *)&v47 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v47 - v11;
  if (qword_26880C110 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, v13, v4);
  uint64_t v15 = sub_2355BCB60();
  os_log_type_t v16 = sub_2355BCF80();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = v5 + 16;
    uint64_t v18 = v4;
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    BOOL v21 = v8;
    uint64_t v22 = a3;
    uint64_t v23 = v5;
    uint64_t v24 = v17;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_23556D000, v15, v16, "InternalSignalsManager#add#fromUpdateMediaAffinityIntent (lock aquired)", v17, 2u);
    uint64_t v25 = v24;
    uint64_t v5 = v23;
    a3 = v22;
    uint64_t v8 = v21;
    uint64_t v14 = v20;
    uint64_t v13 = v19;
    uint64_t v4 = v18;
    MEMORY[0x237DE3BF0](v25, -1, -1);
  }

  uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v26 = v5 + 8;
  os_log_type_t v27 = v28;
  v28(v12, v4);
  id v29 = objc_msgSend(a3, sel_backingStore);
  self;
  uint64_t v30 = (void *)swift_dynamicCastObjCClass();
  if (v30)
  {
    unint64_t v31 = v30;
    uint64_t v47 = v26;
    id v32 = objc_msgSend(v30, sel_privateUpdateMediaAffinityIntentData);

    if (!v32)
    {
      id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10168]), sel_init);
      objc_msgSend(v31, sel_setPrivateUpdateMediaAffinityIntentData_, v33);
    }
    id v34 = objc_msgSend(v31, sel_privateUpdateMediaAffinityIntentData);
    unint64_t v35 = v48;
    if (v34)
    {
      unint64_t v36 = v34;
      uint64_t v37 = (void *)sub_2355BCC40();
      objc_msgSend(v36, sel_addInternalSignal_, v37);
    }
    id v38 = v50;
    v14(v50, v13, v4);
    swift_bridgeObjectRetain_n();
    uint64_t v39 = sub_2355BCB60();
    os_log_type_t v40 = sub_2355BCF80();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_type_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v52 = v42;
      *(_DWORD *)os_log_type_t v41 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_2355745F0(v49, v35, &v52);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v39, v40, "InternalSignalsManager#add#fromUpdateMediaAffinityIntent added %s to updateMediaIntent. (unlock)", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v42, -1, -1);
      MEMORY[0x237DE3BF0](v41, -1, -1);

      v27(v50, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v27(v38, v4);
    }
    swift_retain();
    sub_2355BC150();
  }
  else
  {

    v14(v8, v13, v4);
    uint64_t v43 = sub_2355BCB60();
    os_log_type_t v44 = sub_2355BCF70();
    if (os_log_type_enabled(v43, v44))
    {
      os_log_type_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v45 = 0;
      _os_log_impl(&dword_23556D000, v43, v44, "InternalSignalsManager#add#fromUpdateMediaAffinityIntent Unexpected backing store error while adding internal signal. (unlock)", v45, 2u);
      MEMORY[0x237DE3BF0](v45, -1, -1);
    }

    v27(v8, v4);
    swift_retain();
    sub_2355BC150();
  }
  return swift_release();
}

uint64_t sub_2355A13DC(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v48 = a2;
  uint64_t v49 = a1;
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v50 = (char *)&v47 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v47 - v11;
  if (qword_26880C110 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, v13, v4);
  uint64_t v15 = sub_2355BCB60();
  os_log_type_t v16 = sub_2355BCF80();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = v5 + 16;
    uint64_t v18 = v4;
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    BOOL v21 = v8;
    uint64_t v22 = a3;
    uint64_t v23 = v5;
    uint64_t v24 = v17;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_23556D000, v15, v16, "InternalSignalsManager#add#fromSearchMediaIntent (lock aquired)", v17, 2u);
    uint64_t v25 = v24;
    uint64_t v5 = v23;
    a3 = v22;
    uint64_t v8 = v21;
    uint64_t v14 = v20;
    uint64_t v13 = v19;
    uint64_t v4 = v18;
    MEMORY[0x237DE3BF0](v25, -1, -1);
  }

  uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v26 = v5 + 8;
  os_log_type_t v27 = v28;
  v28(v12, v4);
  id v29 = objc_msgSend(a3, sel_backingStore);
  self;
  uint64_t v30 = (void *)swift_dynamicCastObjCClass();
  if (v30)
  {
    unint64_t v31 = v30;
    uint64_t v47 = v26;
    id v32 = objc_msgSend(v30, sel_privateSearchForMediaIntentData);

    if (!v32)
    {
      id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10160]), sel_init);
      objc_msgSend(v31, sel_setPrivateSearchForMediaIntentData_, v33);
    }
    id v34 = objc_msgSend(v31, sel_privateSearchForMediaIntentData);
    unint64_t v35 = v48;
    if (v34)
    {
      unint64_t v36 = v34;
      uint64_t v37 = (void *)sub_2355BCC40();
      objc_msgSend(v36, sel_addInternalSignal_, v37);
    }
    id v38 = v50;
    v14(v50, v13, v4);
    swift_bridgeObjectRetain_n();
    uint64_t v39 = sub_2355BCB60();
    os_log_type_t v40 = sub_2355BCF80();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_type_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v52 = v42;
      *(_DWORD *)os_log_type_t v41 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_2355745F0(v49, v35, &v52);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v39, v40, "InternalSignalsManager#add#fromSearchMediaIntent added %s to searchMediaIntent. (unlock)", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v42, -1, -1);
      MEMORY[0x237DE3BF0](v41, -1, -1);

      v27(v50, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v27(v38, v4);
    }
    swift_retain();
    sub_2355BC150();
  }
  else
  {

    v14(v8, v13, v4);
    uint64_t v43 = sub_2355BCB60();
    os_log_type_t v44 = sub_2355BCF70();
    if (os_log_type_enabled(v43, v44))
    {
      os_log_type_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v45 = 0;
      _os_log_impl(&dword_23556D000, v43, v44, "InternalSignalsManager#add#fromSearchMediaIntent Unexpected backing store error while adding internal signal. (unlock)", v45, 2u);
      MEMORY[0x237DE3BF0](v45, -1, -1);
    }

    v27(v8, v4);
    swift_retain();
    sub_2355BC150();
  }
  return swift_release();
}

uint64_t sub_2355A1988(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v60 = a1;
  uint64_t v5 = sub_2355BCB80();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v57 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (void (*)(char *, uint64_t, uint64_t))((char *)&v57 - v13);
  if (qword_26880C110 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v5, (uint64_t)qword_26880D108);
  os_log_type_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v61 = v15;
  os_log_type_t v62 = v16;
  ((void (*)(void (*)(char *, uint64_t, uint64_t)))v16)(v14);
  uint64_t v17 = sub_2355BCB60();
  os_log_type_t v18 = sub_2355BCF80();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = (void (*)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 16);
    uint64_t v20 = v9;
    uint64_t v21 = v5;
    uint64_t v22 = a3;
    unint64_t v23 = a2;
    uint64_t v24 = v12;
    uint64_t v25 = v6;
    uint64_t v26 = v19;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_23556D000, v17, v18, "InternalSignalsManager#remove#fromPlayMediaIntent (lock aquired)", v19, 2u);
    os_log_type_t v27 = v26;
    uint64_t v6 = v25;
    uint64_t v12 = v24;
    a2 = v23;
    a3 = v22;
    uint64_t v5 = v21;
    uint64_t v9 = v20;
    MEMORY[0x237DE3BF0](v27, -1, -1);
  }

  uint64_t v30 = *(void (**)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 8);
  uint64_t v28 = v6 + 8;
  id v29 = v30;
  v30(v14, v5);
  id v31 = objc_msgSend(a3, sel_backingStore);
  self;
  id v32 = (void *)swift_dynamicCastObjCClass();
  if (v32)
  {
    id v33 = v32;
    uint64_t v59 = v29;
    id v34 = objc_msgSend(v32, sel_privatePlayMediaIntentData);
    if (v34)
    {
      unint64_t v35 = v34;
      id v36 = objc_msgSend(v34, sel_internalSignals);

      if (v36)
      {
        uint64_t v37 = sub_2355BCDB0();
        uint64_t v58 = v28;
        id v38 = (void *)v37;

        unint64_t v39 = sub_23559FE84(v60, a2, v38);
        char v41 = v40;
        uint64_t v28 = v58;
        swift_bridgeObjectRelease();
        if ((v41 & 1) == 0)
        {
          id v42 = objc_msgSend(v33, sel_privatePlayMediaIntentData);
          if (v42)
          {
            uint64_t v43 = v42;
            id v44 = objc_msgSend(v42, sel_internalSignals);
            if (v44)
            {
              os_log_type_t v45 = v44;
              uint64_t v46 = sub_2355BCDB0();

              uint64_t v64 = v46;
              sub_23559FF6C(v39);
              if (v64)
              {
                uint64_t v47 = (void *)sub_2355BCD90();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v47 = 0;
              }
              uint64_t v28 = v58;
              objc_msgSend(v43, sel_setInternalSignals_, v47);
              swift_bridgeObjectRelease();
            }
            else
            {
              objc_msgSend(v43, sel_setInternalSignals_, 0);
            }
          }
        }
      }
    }
    v62(v12, v61, v5);
    swift_bridgeObjectRetain_n();
    uint64_t v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF80();
    if (os_log_type_enabled(v51, v52))
    {
      os_log_type_t v62 = (void (*)(char *, uint64_t, uint64_t))v12;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v58 = v28;
      uint64_t v55 = v54;
      uint64_t v64 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_2355745F0(v60, a2, &v64);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v51, v52, "InternalSignalsManager#remove#fromPlayMediaIntent removed %s from playMediaIntent. (unlock)", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v55, -1, -1);
      MEMORY[0x237DE3BF0](v53, -1, -1);

      v59(v62, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v59((void (*)(char *, uint64_t, uint64_t))v12, v5);
    }
    swift_retain();
    sub_2355BC150();
  }
  else
  {

    v62(v9, v61, v5);
    unint64_t v48 = sub_2355BCB60();
    os_log_type_t v49 = sub_2355BCF70();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_23556D000, v48, v49, "InternalSignalsManager#remove#fromPlayMediaIntent Unexpected backing store error adding internal signal. (unlock)", v50, 2u);
      MEMORY[0x237DE3BF0](v50, -1, -1);
    }

    v29((void (*)(char *, uint64_t, uint64_t))v9, v5);
    swift_retain();
    sub_2355BC150();
  }
  return swift_release();
}

uint64_t sub_2355A1FE4(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v60 = a1;
  uint64_t v5 = sub_2355BCB80();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v57 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (void (*)(char *, uint64_t, uint64_t))((char *)&v57 - v13);
  if (qword_26880C110 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v5, (uint64_t)qword_26880D108);
  os_log_type_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v61 = v15;
  os_log_type_t v62 = v16;
  ((void (*)(void (*)(char *, uint64_t, uint64_t)))v16)(v14);
  uint64_t v17 = sub_2355BCB60();
  os_log_type_t v18 = sub_2355BCF80();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = (void (*)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 16);
    uint64_t v20 = v9;
    uint64_t v21 = v5;
    uint64_t v22 = a3;
    unint64_t v23 = a2;
    uint64_t v24 = v12;
    uint64_t v25 = v6;
    uint64_t v26 = v19;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_23556D000, v17, v18, "InternalSignalsManager#remove#fromAddMediaIntent (lock aquired)", v19, 2u);
    os_log_type_t v27 = v26;
    uint64_t v6 = v25;
    uint64_t v12 = v24;
    a2 = v23;
    a3 = v22;
    uint64_t v5 = v21;
    uint64_t v9 = v20;
    MEMORY[0x237DE3BF0](v27, -1, -1);
  }

  uint64_t v30 = *(void (**)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 8);
  uint64_t v28 = v6 + 8;
  id v29 = v30;
  v30(v14, v5);
  id v31 = objc_msgSend(a3, sel_backingStore);
  self;
  id v32 = (void *)swift_dynamicCastObjCClass();
  if (v32)
  {
    id v33 = v32;
    uint64_t v59 = v29;
    id v34 = objc_msgSend(v32, sel_privateAddMediaIntentData);
    if (v34)
    {
      unint64_t v35 = v34;
      id v36 = objc_msgSend(v34, sel_internalSignals);

      if (v36)
      {
        uint64_t v37 = sub_2355BCDB0();
        uint64_t v58 = v28;
        id v38 = (void *)v37;

        unint64_t v39 = sub_23559FE84(v60, a2, v38);
        char v41 = v40;
        uint64_t v28 = v58;
        swift_bridgeObjectRelease();
        if ((v41 & 1) == 0)
        {
          id v42 = objc_msgSend(v33, sel_privateAddMediaIntentData);
          if (v42)
          {
            uint64_t v43 = v42;
            id v44 = objc_msgSend(v42, sel_internalSignals);
            if (v44)
            {
              os_log_type_t v45 = v44;
              uint64_t v46 = sub_2355BCDB0();

              uint64_t v64 = v46;
              sub_23559FF6C(v39);
              if (v64)
              {
                uint64_t v47 = (void *)sub_2355BCD90();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v47 = 0;
              }
              uint64_t v28 = v58;
              objc_msgSend(v43, sel_setInternalSignals_, v47);
              swift_bridgeObjectRelease();
            }
            else
            {
              objc_msgSend(v43, sel_setInternalSignals_, 0);
            }
          }
        }
      }
    }
    v62(v12, v61, v5);
    swift_bridgeObjectRetain_n();
    uint64_t v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF80();
    if (os_log_type_enabled(v51, v52))
    {
      os_log_type_t v62 = (void (*)(char *, uint64_t, uint64_t))v12;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v58 = v28;
      uint64_t v55 = v54;
      uint64_t v64 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_2355745F0(v60, a2, &v64);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v51, v52, "InternalSignalsManager#remove#fromAddMediaIntent removed %s from addMediaIntent. (unlock)", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v55, -1, -1);
      MEMORY[0x237DE3BF0](v53, -1, -1);

      v59(v62, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v59((void (*)(char *, uint64_t, uint64_t))v12, v5);
    }
    swift_retain();
    sub_2355BC150();
  }
  else
  {

    v62(v9, v61, v5);
    unint64_t v48 = sub_2355BCB60();
    os_log_type_t v49 = sub_2355BCF70();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_23556D000, v48, v49, "InternalSignalsManager#remove#fromAddMediaIntent Unexpected backing store error adding internal signal. (unlock)", v50, 2u);
      MEMORY[0x237DE3BF0](v50, -1, -1);
    }

    v29((void (*)(char *, uint64_t, uint64_t))v9, v5);
    swift_retain();
    sub_2355BC150();
  }
  return swift_release();
}

uint64_t sub_2355A2640(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v60 = a1;
  uint64_t v5 = sub_2355BCB80();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v57 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (void (*)(char *, uint64_t, uint64_t))((char *)&v57 - v13);
  if (qword_26880C110 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v5, (uint64_t)qword_26880D108);
  os_log_type_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v61 = v15;
  os_log_type_t v62 = v16;
  ((void (*)(void (*)(char *, uint64_t, uint64_t)))v16)(v14);
  uint64_t v17 = sub_2355BCB60();
  os_log_type_t v18 = sub_2355BCF80();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = (void (*)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 16);
    uint64_t v20 = v9;
    uint64_t v21 = v5;
    uint64_t v22 = a3;
    unint64_t v23 = a2;
    uint64_t v24 = v12;
    uint64_t v25 = v6;
    uint64_t v26 = v19;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_23556D000, v17, v18, "InternalSignalsManager#remove#fromUpdateMediaIntent (lock aquired)", v19, 2u);
    os_log_type_t v27 = v26;
    uint64_t v6 = v25;
    uint64_t v12 = v24;
    a2 = v23;
    a3 = v22;
    uint64_t v5 = v21;
    uint64_t v9 = v20;
    MEMORY[0x237DE3BF0](v27, -1, -1);
  }

  uint64_t v30 = *(void (**)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 8);
  uint64_t v28 = v6 + 8;
  id v29 = v30;
  v30(v14, v5);
  id v31 = objc_msgSend(a3, sel_backingStore);
  self;
  id v32 = (void *)swift_dynamicCastObjCClass();
  if (v32)
  {
    id v33 = v32;
    uint64_t v59 = v29;
    id v34 = objc_msgSend(v32, sel_privateUpdateMediaAffinityIntentData);
    if (v34)
    {
      unint64_t v35 = v34;
      id v36 = objc_msgSend(v34, sel_internalSignals);

      if (v36)
      {
        uint64_t v37 = sub_2355BCDB0();
        uint64_t v58 = v28;
        id v38 = (void *)v37;

        unint64_t v39 = sub_23559FE84(v60, a2, v38);
        char v41 = v40;
        uint64_t v28 = v58;
        swift_bridgeObjectRelease();
        if ((v41 & 1) == 0)
        {
          id v42 = objc_msgSend(v33, sel_privateUpdateMediaAffinityIntentData);
          if (v42)
          {
            uint64_t v43 = v42;
            id v44 = objc_msgSend(v42, sel_internalSignals);
            if (v44)
            {
              os_log_type_t v45 = v44;
              uint64_t v46 = sub_2355BCDB0();

              uint64_t v64 = v46;
              sub_23559FF6C(v39);
              if (v64)
              {
                uint64_t v47 = (void *)sub_2355BCD90();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v47 = 0;
              }
              uint64_t v28 = v58;
              objc_msgSend(v43, sel_setInternalSignals_, v47);
              swift_bridgeObjectRelease();
            }
            else
            {
              objc_msgSend(v43, sel_setInternalSignals_, 0);
            }
          }
        }
      }
    }
    v62(v12, v61, v5);
    swift_bridgeObjectRetain_n();
    uint64_t v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF80();
    if (os_log_type_enabled(v51, v52))
    {
      os_log_type_t v62 = (void (*)(char *, uint64_t, uint64_t))v12;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v58 = v28;
      uint64_t v55 = v54;
      uint64_t v64 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_2355745F0(v60, a2, &v64);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v51, v52, "InternalSignalsManager#remove#fromUpdateMediaIntent removed %s from updateMediaIntent. (unlock)", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v55, -1, -1);
      MEMORY[0x237DE3BF0](v53, -1, -1);

      v59(v62, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v59((void (*)(char *, uint64_t, uint64_t))v12, v5);
    }
    swift_retain();
    sub_2355BC150();
  }
  else
  {

    v62(v9, v61, v5);
    unint64_t v48 = sub_2355BCB60();
    os_log_type_t v49 = sub_2355BCF70();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_23556D000, v48, v49, "InternalSignalsManager#remove#fromUpdateMediaIntent Unexpected backing store error adding internal signal. (unlock)", v50, 2u);
      MEMORY[0x237DE3BF0](v50, -1, -1);
    }

    v29((void (*)(char *, uint64_t, uint64_t))v9, v5);
    swift_retain();
    sub_2355BC150();
  }
  return swift_release();
}

uint64_t sub_2355A2C9C(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v60 = a1;
  uint64_t v5 = sub_2355BCB80();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v57 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (void (*)(char *, uint64_t, uint64_t))((char *)&v57 - v13);
  if (qword_26880C110 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2355BC130();
  swift_release();
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v5, (uint64_t)qword_26880D108);
  os_log_type_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v61 = v15;
  os_log_type_t v62 = v16;
  ((void (*)(void (*)(char *, uint64_t, uint64_t)))v16)(v14);
  uint64_t v17 = sub_2355BCB60();
  os_log_type_t v18 = sub_2355BCF80();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = (void (*)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 16);
    uint64_t v20 = v9;
    uint64_t v21 = v5;
    uint64_t v22 = a3;
    unint64_t v23 = a2;
    uint64_t v24 = v12;
    uint64_t v25 = v6;
    uint64_t v26 = v19;
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_23556D000, v17, v18, "InternalSignalsManager#remove#fromSearchMediaIntent (lock aquired)", v19, 2u);
    os_log_type_t v27 = v26;
    uint64_t v6 = v25;
    uint64_t v12 = v24;
    a2 = v23;
    a3 = v22;
    uint64_t v5 = v21;
    uint64_t v9 = v20;
    MEMORY[0x237DE3BF0](v27, -1, -1);
  }

  uint64_t v30 = *(void (**)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v6 + 8);
  uint64_t v28 = v6 + 8;
  id v29 = v30;
  v30(v14, v5);
  id v31 = objc_msgSend(a3, sel_backingStore);
  self;
  id v32 = (void *)swift_dynamicCastObjCClass();
  if (v32)
  {
    id v33 = v32;
    uint64_t v59 = v29;
    id v34 = objc_msgSend(v32, sel_privateSearchForMediaIntentData);
    if (v34)
    {
      unint64_t v35 = v34;
      id v36 = objc_msgSend(v34, sel_internalSignals);

      if (v36)
      {
        uint64_t v37 = sub_2355BCDB0();
        uint64_t v58 = v28;
        id v38 = (void *)v37;

        unint64_t v39 = sub_23559FE84(v60, a2, v38);
        char v41 = v40;
        uint64_t v28 = v58;
        swift_bridgeObjectRelease();
        if ((v41 & 1) == 0)
        {
          id v42 = objc_msgSend(v33, sel_privateSearchForMediaIntentData);
          if (v42)
          {
            uint64_t v43 = v42;
            id v44 = objc_msgSend(v42, sel_internalSignals);
            if (v44)
            {
              os_log_type_t v45 = v44;
              uint64_t v46 = sub_2355BCDB0();

              uint64_t v64 = v46;
              sub_23559FF6C(v39);
              if (v64)
              {
                uint64_t v47 = (void *)sub_2355BCD90();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v47 = 0;
              }
              uint64_t v28 = v58;
              objc_msgSend(v43, sel_setInternalSignals_, v47);
              swift_bridgeObjectRelease();
            }
            else
            {
              objc_msgSend(v43, sel_setInternalSignals_, 0);
            }
          }
        }
      }
    }
    v62(v12, v61, v5);
    swift_bridgeObjectRetain_n();
    uint64_t v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF80();
    if (os_log_type_enabled(v51, v52))
    {
      os_log_type_t v62 = (void (*)(char *, uint64_t, uint64_t))v12;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v58 = v28;
      uint64_t v55 = v54;
      uint64_t v64 = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_2355745F0(v60, a2, &v64);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23556D000, v51, v52, "InternalSignalsManager#remove#fromSearchMediaIntent removed %s from searchMediaIntent. (unlock)", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v55, -1, -1);
      MEMORY[0x237DE3BF0](v53, -1, -1);

      v59(v62, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v59((void (*)(char *, uint64_t, uint64_t))v12, v5);
    }
    swift_retain();
    sub_2355BC150();
  }
  else
  {

    v62(v9, v61, v5);
    unint64_t v48 = sub_2355BCB60();
    os_log_type_t v49 = sub_2355BCF70();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_23556D000, v48, v49, "InternalSignalsManager#remove#fromSearchMediaIntent Unexpected backing store error adding internal signal. (unlock)", v50, 2u);
      MEMORY[0x237DE3BF0](v50, -1, -1);
    }

    v29((void (*)(char *, uint64_t, uint64_t))v9, v5);
    swift_retain();
    sub_2355BC150();
  }
  return swift_release();
}

uint64_t type metadata accessor for InternalSignalsManager()
{
  return self;
}

uint64_t *logObject.unsafeMutableAddressor()
{
  if (qword_26880C118 != -1) {
    swift_once();
  }
  return &logObject;
}

uint64_t sub_2355A3368()
{
  sub_2355A33D0();
  uint64_t result = sub_2355BD1A0();
  logObject = result;
  return result;
}

unint64_t sub_2355A33D0()
{
  unint64_t result = qword_26880C6E8;
  if (!qword_26880C6E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26880C6E8);
  }
  return result;
}

uint64_t sub_2355A3410(char a1, char a2)
{
  if (*(void *)&aSongnameartist[8 * a1] == *(void *)&aSongnameartist[8 * a2]
    && *(void *)&aSongnameartist[8 * a1 + 40] == *(void *)&aSongnameartist[8 * a2 + 40])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_2355BD2F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2355A3498()
{
  return sub_2355BD390();
}

uint64_t sub_2355A3504()
{
  sub_2355BCCA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2355A3558()
{
  return sub_2355BD390();
}

unint64_t sub_2355A35C0(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E69666661736964;
      break;
    case 2:
      unint64_t result = 2036427888;
      break;
    case 3:
      unint64_t result = 0x646F504179616C70;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0x6973754D79616C70;
      break;
    case 6:
      unint64_t result = 0x5979425879616C70;
      break;
    case 7:
      unint64_t result = 0x6974724179616C70;
      break;
    case 8:
      unint64_t result = 0x6964615279616C70;
      break;
    case 9:
      unint64_t result = 0x79616C5079616C70;
      break;
    case 10:
      unint64_t result = 0x4E65685479616C70;
      break;
    case 11:
      unint64_t result = 0x6572616873;
      break;
    case 12:
      unint64_t result = 0x656C6666756873;
      break;
    case 13:
      unint64_t result = 0x676E6F5374616877;
      break;
    default:
      unint64_t result = 0x7974696E69666661;
      break;
  }
  return result;
}

uint64_t sub_2355A37A4(char a1)
{
  return *(void *)&aSongnameartist[8 * a1];
}

uint64_t sub_2355A37C4()
{
  char v1 = *v0;
  sub_2355BD370();
  sub_2355A35C0(v1);
  sub_2355BCCA0();
  swift_bridgeObjectRelease();
  return sub_2355BD390();
}

uint64_t sub_2355A3828()
{
  sub_2355A35C0(*v0);
  sub_2355BCCA0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2355A387C()
{
  char v1 = *v0;
  sub_2355BD370();
  sub_2355A35C0(v1);
  sub_2355BCCA0();
  swift_bridgeObjectRelease();
  return sub_2355BD390();
}

uint64_t sub_2355A38DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2355A5A44();
  *a1 = result;
  return result;
}

unint64_t sub_2355A390C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2355A35C0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2355A3938(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_2355A35C0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_2355A35C0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2355BD2F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2355A39C4()
{
  return sub_2355A3498();
}

uint64_t sub_2355A39CC()
{
  return sub_2355A3504();
}

uint64_t sub_2355A39D4()
{
  return sub_2355A3558();
}

uint64_t sub_2355A39DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2355A5A90();
  *a1 = result;
  return result;
}

uint64_t sub_2355A3A0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2355A37A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2355A3A38(char *a1, char *a2)
{
  return sub_2355A3410(*a1, *a2);
}

uint64_t sub_2355A3A44()
{
  if (qword_26880C0D8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26880D0C8;
  uint64_t v1 = qword_26880C0E0;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26880D0D0;
  uint64_t v3 = qword_26880C148;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = off_26880C6F0;
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (*((void *)off_26880C6F0 + 2))
  {
    unint64_t v6 = sub_2355834C0(0);
    if (v7)
    {
      uint64_t v8 = *(void *)(v4[7] + 8 * v6);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v8 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C730);
  sub_2355BCA10();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2355BDD10;
  sub_2355BCA20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C738);
  uint64_t v10 = sub_2355BCA00();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2355BDD10;
  unint64_t v14 = v13 + v12;
  uint64_t v15 = *MEMORY[0x263F74848];
  uint64_t v16 = sub_2355BC9B0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x263F74B60], v10);
  qword_26880D128 = 0xD000000000000019;
  unk_26880D130 = 0x80000002355BF450;
  qword_26880D138 = 0xD000000000000056;
  unk_26880D140 = 0x80000002355BF470;
  qword_26880D148 = v0;
  unk_26880D150 = v2;
  qword_26880D158 = v8;
  unk_26880D160 = 0x7974696E69666661;
  qword_26880D168 = 0xE800000000000000;
  unk_26880D170 = 0xD000000000000010;
  qword_26880D178 = 0x80000002355BF4D0;
  word_26880D180 = 256;
  qword_26880D188 = 0;
  unk_26880D190 = 0;
  qword_26880D198 = (uint64_t)&unk_26E8AFEA8;
  unk_26880D1A0 = v9;
  qword_26880D1A8 = v13;
  unk_26880D1B0 = sub_2355A3DC0;
  qword_26880D1B8 = 0;
  unk_26880D1C0 = 0;
  qword_26880D1C8 = 0xE000000000000000;
  unk_26880D1D0 = v5;
  qword_26880D1D8 = v5;
  return result;
}

uint64_t sub_2355A3DC0(uint64_t a1)
{
  sub_2355A5ADC(a1 + 1, (uint64_t)&v6);
  sub_2355A5ADC((uint64_t)&v6, (uint64_t)&v7);
  if ((v7 == 2 || (sub_2355A5ADC((uint64_t)&v6, (uint64_t)&v3), (v3 & 1) == 0))
    && ((sub_2355A5ADC(a1, (uint64_t)&v5), sub_2355A5ADC((uint64_t)&v5, (uint64_t)&v8), v8 == 2)
     || (sub_2355A5ADC((uint64_t)&v5, (uint64_t)&v4), (v4 & 1) == 0)))
  {
    return *(unsigned __int8 *)(a1 + 33);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_2355A3E64()
{
  if (qword_26880C0D8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26880D0C8;
  uint64_t v1 = qword_26880C0E0;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26880D0D0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C730);
  sub_2355BCA10();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2355BDD10;
  swift_bridgeObjectRetain();
  sub_2355BCA20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C738);
  uint64_t v4 = sub_2355BCA00();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2355BDD10;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = *MEMORY[0x263F74848];
  uint64_t v10 = sub_2355BC9B0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F74B60], v4);
  qword_26880D1E0 = 0xD00000000000001CLL;
  *(void *)algn_26880D1E8 = 0x80000002355BF4F0;
  qword_26880D1F0 = 0xD000000000000056;
  unk_26880D1F8 = 0x80000002355BF470;
  qword_26880D200 = v0;
  unk_26880D208 = v2;
  qword_26880D210 = MEMORY[0x263F8EE78];
  unk_26880D218 = 0x6E69666661736964;
  qword_26880D220 = 0xEB00000000797469;
  unk_26880D228 = 0xD000000000000010;
  qword_26880D230 = 0x80000002355BF4D0;
  word_26880D238 = 257;
  qword_26880D240 = 0;
  unk_26880D248 = 0;
  qword_26880D250 = (uint64_t)&unk_26E8AFF00;
  unk_26880D258 = v3;
  qword_26880D260 = v7;
  unk_26880D268 = sub_23557C6BC;
  qword_26880D270 = 0;
  unk_26880D278 = 0;
  qword_26880D280 = 0xE000000000000000;
  unk_26880D288 = MEMORY[0x263F8EE78];
  qword_26880D290 = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_2355A4170()
{
  if (qword_26880C0D8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26880D0C8;
  uint64_t v1 = qword_26880C0E0;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26880D0D0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C730);
  sub_2355BCA10();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2355BDD10;
  swift_bridgeObjectRetain();
  sub_2355BCA20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C738);
  uint64_t v4 = sub_2355BCA00();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2355BDD10;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = *MEMORY[0x263F74848];
  uint64_t v10 = sub_2355BC9B0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x263F74B60], v4);
  qword_26880D298 = 0xD000000000000021;
  unk_26880D2A0 = 0x80000002355BF510;
  qword_26880D2A8 = 0xD000000000000056;
  unk_26880D2B0 = 0x80000002355BF470;
  qword_26880D2B8 = v0;
  unk_26880D2C0 = v2;
  qword_26880D2C8 = MEMORY[0x263F8EE78];
  unk_26880D2D0 = 0xD000000000000010;
  qword_26880D2D8 = 0x80000002355BE720;
  unk_26880D2E0 = 0xD000000000000010;
  qword_26880D2E8 = 0x80000002355BF4D0;
  word_26880D2F0 = 260;
  qword_26880D2F8 = 0;
  unk_26880D300 = 0;
  qword_26880D308 = (uint64_t)&unk_26E8AFF38;
  unk_26880D310 = v3;
  qword_26880D318 = v7;
  unk_26880D320 = sub_23557B360;
  qword_26880D328 = 0;
  unk_26880D330 = 0xD000000000000024;
  qword_26880D338 = 0x80000002355BF540;
  unk_26880D340 = MEMORY[0x263F8EE78];
  qword_26880D348 = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_2355A4480()
{
  if (qword_26880C0D0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26880D0C0;
  uint64_t v1 = qword_26880C0E0;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26880D0D0;
  uint64_t v3 = qword_26880C148;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (*((void *)off_26880C6F0 + 2))
  {
    sub_2355834C0(5);
    if (v5) {
      uint64_t result = swift_bridgeObjectRetain();
    }
    else {
      uint64_t result = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t result = MEMORY[0x263F8EE78];
  }
  qword_26880D350 = 0xD00000000000001ALL;
  *(void *)algn_26880D358 = 0x80000002355BF590;
  qword_26880D360 = 0xD000000000000056;
  unk_26880D368 = 0x80000002355BF470;
  qword_26880D370 = v0;
  unk_26880D378 = v2;
  qword_26880D380 = result;
  unk_26880D388 = 0x6973754D79616C70;
  qword_26880D390 = 0xE900000000000063;
  unk_26880D398 = 0xD000000000000010;
  qword_26880D3A0 = 0x80000002355BF4D0;
  word_26880D3A8 = 261;
  qword_26880D3B0 = 0xD000000000000011;
  unk_26880D3B8 = 0x80000002355BF5B0;
  qword_26880D3C8 = 0;
  unk_26880D3D0 = 0;
  qword_26880D3C0 = 0;
  qword_26880D3D8 = (uint64_t)sub_23557B360;
  unk_26880D3E0 = 0;
  qword_26880D3E8 = 0xD000000000000024;
  unk_26880D3F0 = 0x80000002355BF540;
  qword_26880D3F8 = v4;
  unk_26880D400 = v4;
  return result;
}

double sub_2355A4670()
{
  if (qword_26880C0D0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26880D0C0;
  uint64_t v1 = qword_26880C0E0;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26880D0D0;
  uint64_t v3 = qword_26880C148;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (*((void *)off_26880C6F0 + 2))
  {
    sub_2355834C0(10);
    if (v5) {
      uint64_t v6 = swift_bridgeObjectRetain();
    }
    else {
      uint64_t v6 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  qword_26880D408 = 0xD00000000000001CLL;
  unk_26880D410 = 0x80000002355BF570;
  qword_26880D418 = 0xD000000000000056;
  unk_26880D420 = 0x80000002355BF470;
  qword_26880D428 = v0;
  unk_26880D430 = v2;
  qword_26880D438 = v6;
  unk_26880D440 = 0x4E65685479616C70;
  qword_26880D448 = 0xEB00000000737765;
  unk_26880D450 = 0xD000000000000010;
  qword_26880D458 = 0x80000002355BF4D0;
  word_26880D460 = 266;
  double result = 0.0;
  xmmword_26880D468 = 0u;
  unk_26880D478 = 0u;
  qword_26880D488 = 0;
  unk_26880D490 = sub_23557B360;
  qword_26880D498 = 0;
  unk_26880D4A0 = 0xD000000000000024;
  qword_26880D4A8 = 0x80000002355BF540;
  unk_26880D4B0 = v4;
  qword_26880D4B8 = v4;
  return result;
}

uint64_t type metadata accessor for AudioSuggestions()
{
  return self;
}

uint64_t destroy for AudioSuggestion()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v10 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v10;
  uint64_t v12 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v12;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy184_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(void *)(a1 + 176) = *((void *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 184)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 184) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 184) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion()
{
  return &type metadata for AudioSuggestion;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.ParameterName(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AudioSuggestion.ParameterName(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x2355A4FA8);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.ParameterName()
{
  return &type metadata for AudioSuggestion.ParameterName;
}

unint64_t sub_2355A4FE4()
{
  unint64_t result = qword_26880C728;
  if (!qword_26880C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C728);
  }
  return result;
}

void *sub_2355A5038()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C740);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2355BE260;
  *(unsigned char *)(inited + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2355BDD80;
  if (qword_26880C150 != -1) {
    swift_once();
  }
  *(void *)(v1 + 32) = qword_26880C6F8;
  sub_2355BCDD0();
  *(void *)(inited + 40) = v1;
  *(unsigned char *)(inited + 48) = 2;
  uint64_t v2 = qword_26880C178;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_26880C720;
  swift_retain_n();
  uint64_t v3 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v3);
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 56) = v16;
  *(unsigned char *)(inited + 64) = 3;
  uint64_t v4 = qword_26880C720;
  if (qword_26880C158 != -1) {
    swift_once();
  }
  swift_retain_n();
  uint64_t v5 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v5);
  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 72) = v4;
  *(unsigned char *)(inited + 80) = 5;
  uint64_t v17 = qword_26880C720;
  swift_retain_n();
  uint64_t v6 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v6);
  if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 88) = v17;
  *(unsigned char *)(inited + 96) = 4;
  uint64_t v18 = qword_26880C720;
  swift_retain_n();
  uint64_t v7 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v7);
  if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 104) = v18;
  *(unsigned char *)(inited + 112) = 6;
  uint64_t v19 = qword_26880C720;
  swift_retain_n();
  uint64_t v8 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v8);
  if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 120) = v19;
  *(unsigned char *)(inited + 128) = 7;
  uint64_t v20 = qword_26880C720;
  swift_retain_n();
  uint64_t v9 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v9);
  if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 136) = v20;
  *(unsigned char *)(inited + 144) = 8;
  uint64_t v21 = qword_26880C720;
  swift_retain_n();
  uint64_t v10 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v10);
  if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 152) = v21;
  *(unsigned char *)(inited + 160) = 9;
  uint64_t v22 = qword_26880C720;
  swift_retain_n();
  uint64_t v11 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v11);
  if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 168) = v22;
  *(unsigned char *)(inited + 176) = 10;
  uint64_t v12 = qword_26880C720;
  *(void *)(inited + 184) = qword_26880C720;
  *(unsigned char *)(inited + 192) = 13;
  swift_retain_n();
  uint64_t v13 = swift_bridgeObjectRetain_n();
  MEMORY[0x237DE30D0](v13);
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 200) = v12;
  *(unsigned char *)(inited + 208) = 12;
  uint64_t v23 = qword_26880C720;
  swift_retain_n();
  uint64_t v14 = swift_bridgeObjectRetain();
  MEMORY[0x237DE30D0](v14);
  if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2355BCDE0();
  }
  sub_2355BCE00();
  sub_2355BCDD0();
  swift_release();
  *(void *)(inited + 216) = v23;
  unint64_t result = (void *)sub_23557FA34(inited);
  off_26880C6F0 = result;
  return result;
}

uint64_t sub_2355A56F4()
{
  uint64_t v0 = sub_2355BC9F0();
  v3[3] = v0;
  v3[4] = sub_2355A5B44();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F74B00], v0);
  sub_2355BCA90();
  uint64_t result = sub_2355BCA60();
  qword_26880C6F8 = result;
  return result;
}

uint64_t sub_2355A57B4()
{
  sub_2355BCA90();
  uint64_t v0 = sub_2355BC9F0();
  v3[3] = v0;
  v3[4] = sub_2355A5B44();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F74B00], v0);
  uint64_t result = sub_2355BCA60();
  qword_26880C700 = result;
  return result;
}

uint64_t sub_2355A586C()
{
  sub_2355BCA90();
  uint64_t result = sub_2355BCA70();
  qword_26880C708 = result;
  return result;
}

uint64_t sub_2355A58A0()
{
  sub_2355BCA90();
  uint64_t result = sub_2355BCA80();
  qword_26880C710 = result;
  return result;
}

uint64_t sub_2355A58D4()
{
  sub_2355BCA90();
  uint64_t result = sub_2355BCA50();
  qword_26880C718 = result;
  return result;
}

uint64_t sub_2355A5908()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2355BE270;
  if (qword_26880C160 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_26880C708;
  uint64_t v1 = qword_26880C168;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_26880C710;
  uint64_t v2 = qword_26880C170;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v0 + 48) = qword_26880C718;
  sub_2355BCDD0();
  qword_26880C720 = v0;
  return swift_retain();
}

uint64_t sub_2355A5A44()
{
  unint64_t v0 = sub_2355BD2C0();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE) {
    return 14;
  }
  else {
    return v0;
  }
}

uint64_t sub_2355A5A90()
{
  unint64_t v0 = sub_2355BD2C0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_2355A5ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2355A5B44()
{
  unint64_t result = qword_26880C748;
  if (!qword_26880C748)
  {
    sub_2355BC9F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C748);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.SuggestionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AudioSuggestion.SuggestionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x2355A5CF8);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

uint64_t sub_2355A5D20(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2355A5D28(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.SuggestionType()
{
  return &type metadata for AudioSuggestion.SuggestionType;
}

unint64_t sub_2355A5D44()
{
  unint64_t result = qword_26880C750;
  if (!qword_26880C750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C750);
  }
  return result;
}

uint64_t PodcastLibraryProvider.createLibraryController(completion:)()
{
  uint64_t v0 = sub_2355BCB50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26880C118 != -1) {
    swift_once();
  }
  id v4 = (id)logObject;
  sub_2355BCB30();
  sub_2355BD140();
  sub_2355BCB20();
  sub_2355BBF40();
  sub_2355BBF30();
  sub_2355BD130();
  sub_2355BCB20();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_2355A5F2C()
{
  uint64_t v0 = sub_2355BCB50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26880C118 != -1) {
    swift_once();
  }
  id v4 = (id)logObject;
  sub_2355BCB30();
  sub_2355BD140();
  sub_2355BCB20();
  sub_2355BBF40();
  sub_2355BBF30();
  sub_2355BD130();
  sub_2355BCB20();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

ValueMetadata *type metadata accessor for PodcastLibraryProvider()
{
  return &type metadata for PodcastLibraryProvider;
}

unint64_t sub_2355A60C4(char a1)
{
  unint64_t result = 0xD000000000000033;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000031;
      break;
    case 3:
      unint64_t result = 0xD000000000000034;
      break;
    case 4:
      unint64_t result = 0xD000000000000030;
      break;
    case 5:
      unint64_t result = 0xD000000000000029;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2355A6184(unint64_t a1)
{
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_2355BD280())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x237DE35A0](i - 4, a1) : *(id *)(a1 + 8 * i);
      uint64_t v5 = v4;
      uint64_t v6 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      uint64_t v7 = sub_2355B48A0(v4);

      if (v7)
      {
        MEMORY[0x237DE30D0]();
        if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2355BCDE0();
        }
        sub_2355BCE00();
        sub_2355BCDD0();
      }
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

Swift::String __swiftcall INPlayMediaMediaItemResolutionResult.getAndClearExtraErrorInfo()()
{
  uint64_t v0 = qword_26880C760;
  uint64_t v1 = (void *)qword_26880C768;
  qword_26880C760 = 0;
  qword_26880C768 = 0xE000000000000000;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::Void __swiftcall INPlayMediaMediaItemResolutionResult.setExtraErrorInfo(extraErrorInfo:)(Swift::String extraErrorInfo)
{
  xmmword_26880C760 = (__int128)extraErrorInfo;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
}

uint64_t sub_2355A6344()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C918);
  swift_allocObject();
  uint64_t result = sub_2355BC410();
  qword_26880C770 = result;
  return result;
}

uint64_t sub_2355A63A0()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C920);
  swift_allocObject();
  uint64_t result = sub_2355BC0C0();
  qword_26880C778 = result;
  return result;
}

uint64_t sub_2355A6414(void (*a1)(char *))
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C6A0);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2355BC880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  a1(v4);
  return sub_23557DE84((uint64_t)v4, &qword_26880C6A0);
}

uint64_t sub_2355A64E8()
{
  uint64_t v0 = sub_2355BCC10();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2355BCC00();
  uint64_t v4 = sub_2355BC290();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_26880C780 = v4;
  return result;
}

id INPlayMediaIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id INPlayMediaIntentHandler.init()()
{
  uint64_t v0 = sub_2355BC7E0();
  uint64_t v55 = *(void *)(v0 - 8);
  uint64_t v56 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v54 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v39 - v3;
  uint64_t v5 = sub_2355BC670();
  uint64_t v53 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  os_log_type_t v52 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v39 - v8;
  uint64_t v59 = sub_2355BC5D0();
  uint64_t v57 = *(void *)(v59 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v59);
  uint64_t v51 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - v12;
  uint64_t v58 = sub_2355BC280();
  uint64_t v45 = *(void *)(v58 - 8);
  uint64_t v14 = v45;
  uint64_t v15 = MEMORY[0x270FA5388](v58);
  os_log_type_t v49 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v39 - v17;
  sub_2355BC3D0();
  uint64_t v50 = sub_2355BC3C0();
  uint64_t v19 = sub_2355BC780();
  uint64_t v20 = sub_2355BC770();
  v66[3] = v19;
  v66[4] = MEMORY[0x263F6CBD8];
  v66[0] = v20;
  id v44 = v18;
  sub_2355BC270();
  uint64_t v43 = v13;
  sub_2355BC5C0();
  sub_2355BC4F0();
  uint64_t v48 = sub_2355BC4E0();
  sub_2355BC660();
  uint64_t v64 = v5;
  uint64_t v65 = MEMORY[0x263F6CB98];
  uint64_t v42 = v5;
  __swift_allocate_boxed_opaque_existential_1(v63);
  sub_2355BC660();
  uint64_t v21 = sub_2355BBFF0();
  uint64_t v22 = sub_2355BBFE0();
  uint64_t v61 = v21;
  uint64_t v62 = MEMORY[0x263F6CA50];
  uint64_t v60 = v22;
  sub_2355BC850();
  swift_allocObject();
  uint64_t v47 = sub_2355BC840();
  sub_2355BC5B0();
  uint64_t v46 = sub_2355BC5A0();
  uint64_t v23 = sub_2355BCAC0();
  uint64_t v24 = sub_2355BCAB0();
  uint64_t v64 = v23;
  uint64_t v65 = MEMORY[0x263F740F8];
  v63[0] = v24;
  uint64_t v25 = sub_2355BC020();
  swift_allocObject();
  uint64_t v26 = sub_2355BC010();
  uint64_t v61 = v25;
  uint64_t v62 = MEMORY[0x263F6CA58];
  uint64_t v60 = v26;
  unint64_t v39 = v4;
  sub_2355BC7D0();
  sub_2355BC360();
  uint64_t v41 = sub_2355BC350();
  uint64_t v40 = sub_2355BBFE0();
  sub_2355A6E94((uint64_t)v66, (uint64_t)v63);
  uint64_t v27 = (uint64_t)v49;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v49, v18, v58);
  uint64_t v28 = (uint64_t)v51;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v51, v13, v59);
  uint64_t v29 = v53;
  uint64_t v30 = v52;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v9, v5);
  uint64_t v32 = v55;
  uint64_t v31 = v56;
  uint64_t v33 = (uint64_t)v54;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v54, v4, v56);
  uint64_t v34 = v48;
  swift_retain();
  uint64_t v35 = v47;
  swift_retain();
  uint64_t v36 = swift_retain();
  id v37 = sub_2355B8384(v50, (uint64_t)v63, v27, v28, v34, v41, v30, v35, v36, v40, v33);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v39, v31);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v42);
  swift_release();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v43, v59);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v58);
  sub_2355B88BC((uint64_t)v66);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v37;
}

id INPlayMediaIntentHandler.__allocating_init(playbackService:localSearch:deviceProvider:nowPlaying:seDeviceProvider:accountProvider:featureFlagProvider:appleMediaServicesProvider:nearDeviceProvider:siriKitTaskLoggingProvider:onscreenEntityProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v42 = *(void *)(a2 + 32);
  uint64_t v43 = *(void *)(a2 + 24);
  uint64_t v46 = __swift_mutable_project_boxed_opaque_existential_1(a2, v43);
  uint64_t v52 = a3;
  uint64_t v41 = *(void *)(a3 + 24);
  uint64_t v39 = *(void *)(a3 + 32);
  uint64_t v44 = __swift_mutable_project_boxed_opaque_existential_1(a3, v41);
  uint64_t v50 = a4;
  uint64_t v36 = *(void *)(a4 + 24);
  uint64_t v34 = *(void *)(a4 + 32);
  uint64_t v40 = __swift_mutable_project_boxed_opaque_existential_1(a4, v36);
  uint64_t v47 = a5;
  uint64_t v16 = *(void *)(a5 + 24);
  uint64_t v33 = *(void *)(a5 + 32);
  uint64_t v37 = __swift_mutable_project_boxed_opaque_existential_1(a5, v16);
  uint64_t v45 = a7;
  uint64_t v17 = *(void *)(a7 + 24);
  uint64_t v31 = *(void *)(a7 + 32);
  uint64_t v35 = __swift_mutable_project_boxed_opaque_existential_1(a7, v17);
  uint64_t v38 = a8;
  uint64_t v18 = *(void *)(a8 + 24);
  uint64_t v30 = *(void *)(a8 + 32);
  uint64_t v32 = __swift_mutable_project_boxed_opaque_existential_1(a8, v18);
  uint64_t v19 = *(void *)(a9 + 24);
  uint64_t v20 = *(void *)(a9 + 32);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1(a9, v19);
  uint64_t v23 = *(void *)(a11 + 24);
  uint64_t v22 = *(void *)(a11 + 32);
  uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_1(a11, v23);
  *((void *)&v29 + 1) = v20;
  *((void *)&v28 + 1) = v31;
  *(void *)&long long v29 = v42;
  *(void *)&long long v28 = v33;
  *(void *)&long long v27 = v30;
  *((void *)&v27 + 1) = v39;
  id v25 = sub_2355B8960(a1, v46, v44, v40, v37, a6, v35, v32, v21, a10, v24, v49, v18, v41, v16, v17, v43, v19, v36,
          v23,
          v27,
          v28,
          v29,
          v34,
          v22);
  __swift_destroy_boxed_opaque_existential_1Tm(a11);
  __swift_destroy_boxed_opaque_existential_1Tm(a9);
  __swift_destroy_boxed_opaque_existential_1Tm(v38);
  __swift_destroy_boxed_opaque_existential_1Tm(v45);
  __swift_destroy_boxed_opaque_existential_1Tm(v47);
  __swift_destroy_boxed_opaque_existential_1Tm(v50);
  __swift_destroy_boxed_opaque_existential_1Tm(v52);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v25;
}

uint64_t sub_2355A6E94(uint64_t a1, uint64_t a2)
{
  return a2;
}

id INPlayMediaIntentHandler.init(playbackService:localSearch:deviceProvider:nowPlaying:seDeviceProvider:accountProvider:featureFlagProvider:appleMediaServicesProvider:nearDeviceProvider:siriKitTaskLoggingProvider:onscreenEntityProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v80 = a6;
  uint64_t v78 = a1;
  uint64_t v81 = a2;
  uint64_t v82 = a11;
  uint64_t v16 = *(void *)(a2 + 24);
  uint64_t v75 = *(void *)(a2 + 32);
  uint64_t v76 = a10;
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1(a2, v16);
  uint64_t v72 = v16;
  MEMORY[0x270FA5388](v17);
  uint64_t v74 = (uint64_t)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v19 + 16))();
  uint64_t v20 = a3;
  uint64_t v77 = a3;
  uint64_t v21 = *(void *)(a3 + 24);
  uint64_t v71 = *(void *)(v20 + 32);
  uint64_t v22 = __swift_mutable_project_boxed_opaque_existential_1(v20, v21);
  uint64_t v69 = v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v70 = (uint64_t)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v24 + 16))();
  uint64_t v73 = a4;
  uint64_t v25 = *(void *)(a4 + 24);
  uint64_t v67 = *(void *)(a4 + 32);
  uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1(a4, v25);
  uint64_t v65 = v25;
  MEMORY[0x270FA5388](v26);
  uint64_t v66 = (uint64_t)&v56 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v28 + 16))();
  uint64_t v68 = a5;
  uint64_t v29 = *(void *)(a5 + 24);
  uint64_t v63 = *(void *)(a5 + 32);
  uint64_t v30 = __swift_mutable_project_boxed_opaque_existential_1(a5, v29);
  MEMORY[0x270FA5388](v30);
  uint64_t v62 = (uint64_t)&v56 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v32 + 16))();
  uint64_t v64 = a7;
  uint64_t v33 = *(void *)(a7 + 24);
  uint64_t v60 = *(void *)(a7 + 32);
  uint64_t v34 = __swift_mutable_project_boxed_opaque_existential_1(a7, v33);
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (char *)&v56 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v37 + 16))(v36);
  uint64_t v61 = a8;
  uint64_t v38 = *(void *)(a8 + 24);
  uint64_t v59 = *(void *)(a8 + 32);
  uint64_t v39 = __swift_mutable_project_boxed_opaque_existential_1(a8, v38);
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)&v56 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v42 + 16))(v41);
  uint64_t v58 = a9;
  uint64_t v43 = *(void *)(a9 + 24);
  uint64_t v57 = *(void *)(a9 + 32);
  uint64_t v44 = __swift_mutable_project_boxed_opaque_existential_1(a9, v43);
  MEMORY[0x270FA5388](v44);
  uint64_t v46 = (char *)&v56 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v47 + 16))(v46);
  uint64_t v48 = *(void *)(v82 + 24);
  uint64_t v49 = *(void *)(v82 + 32);
  uint64_t v50 = __swift_mutable_project_boxed_opaque_existential_1(v82, v48);
  MEMORY[0x270FA5388](v50);
  uint64_t v52 = (char *)&v56 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v53 + 16))(v52);
  id v54 = sub_2355B7978(v78, v74, v70, v66, v62, v80, (uint64_t)v36, (uint64_t)v41, (uint64_t)v46, v76, (uint64_t)v52, v79, v38, v69, v29, v33, v72, v43, v65,
          v48,
          v59,
          v71,
          v63,
          v60,
          v75,
          v57,
          v67,
          v49);
  __swift_destroy_boxed_opaque_existential_1Tm(v82);
  __swift_destroy_boxed_opaque_existential_1Tm(v58);
  __swift_destroy_boxed_opaque_existential_1Tm(v61);
  __swift_destroy_boxed_opaque_existential_1Tm(v64);
  __swift_destroy_boxed_opaque_existential_1Tm(v68);
  __swift_destroy_boxed_opaque_existential_1Tm(v73);
  __swift_destroy_boxed_opaque_existential_1Tm(v77);
  __swift_destroy_boxed_opaque_existential_1Tm(v81);
  return v54;
}

uint64_t static INPlayMediaIntentHandler.removeContinuation(for:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_2355BCB80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v31 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v31 - v12;
  if (a2)
  {
    uint64_t v14 = qword_26880C180;
    swift_bridgeObjectRetain();
    if (v14 != -1) {
      swift_once();
    }
    v34[0] = a1;
    v34[1] = a2;
    uint64_t v15 = sub_2355BC400();
    if (v15)
    {
      uint64_t v16 = v15;
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v17 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v17, v4);
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_2355BCB60();
      os_log_type_t v19 = sub_2355BCF60();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        v34[0] = v32;
        *(_DWORD *)uint64_t v20 = 136315138;
        v31[1] = v20 + 4;
        swift_bridgeObjectRetain();
        uint64_t v33 = sub_2355745F0(a1, a2, v34);
        sub_2355BD1B0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23556D000, v18, v19, "INPlayMediaIntentHandler#removeContinuation retrieved continuation for identifier: %s", v20, 0xCu);
        uint64_t v21 = v32;
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v21, -1, -1);
        MEMORY[0x237DE3BF0](v20, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      return v16;
    }
    swift_bridgeObjectRelease();
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v26, v4);
    uint64_t v27 = sub_2355BCB60();
    os_log_type_t v28 = sub_2355BCF60();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_23556D000, v27, v28, "INPlayMediaIntentHandler#removeContinuation no continuation for identifier, returning no-op continuation", v29, 2u);
      MEMORY[0x237DE3BF0](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v4, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v22, v4);
    uint64_t v23 = sub_2355BCB60();
    os_log_type_t v24 = sub_2355BCF60();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_23556D000, v23, v24, "INPlayMediaIntentHandler#removeContinuation no identifier, returning no-op continuation", v25, 2u);
      MEMORY[0x237DE3BF0](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  if (qword_26880C188 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_26880C778;
  swift_retain();
  return v16;
}

uint64_t INPlayMediaIntentHandler.resolveMediaItems(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v4 = sub_2355BCBE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2355BCC10();
  uint64_t v42 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v41 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2355BCB80();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  id v15 = a1;
  uint64_t v16 = sub_2355BCB60();
  os_log_type_t v17 = sub_2355BCF70();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v43 = v7;
  uint64_t v44 = v8;
  if (v18)
  {
    uint64_t v37 = v5;
    uint64_t v38 = v4;
    os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    aBlock[0] = v36;
    *(_DWORD *)os_log_type_t v19 = 136315138;
    id v20 = objc_msgSend(v15, sel_privatePlayMediaIntentData);
    uint64_t v21 = v20;
    if (v20)
    {
      id v22 = objc_msgSend(v20, sel_audioSearchResults);

      if (v22)
      {
        sub_23557DC00(0, (unint64_t *)&qword_26880C210);
        uint64_t v21 = (void *)sub_2355BCDB0();
      }
      else
      {
        uint64_t v21 = 0;
      }
    }
    uint64_t v45 = (uint64_t)v21;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C7A0);
    uint64_t v23 = sub_2355BCC60();
    uint64_t v45 = sub_2355745F0(v23, v24, aBlock);
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v16, v17, "INPlayMediaIntentHandler#resolveMediaItems looking at search results: %s", v19, 0xCu);
    uint64_t v25 = v36;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v25, -1, -1);
    MEMORY[0x237DE3BF0](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v5 = v37;
    uint64_t v4 = v38;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  if (qword_26880C190 != -1) {
    swift_once();
  }
  uint64_t v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v27 = (void *)swift_allocObject();
  uint64_t v28 = v39;
  uint64_t v29 = v40;
  v27[2] = v26;
  v27[3] = v28;
  v27[4] = v29;
  v27[5] = v15;
  aBlock[4] = (uint64_t)sub_2355B905C;
  aBlock[5] = (uint64_t)v27;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2355AF38C;
  aBlock[3] = (uint64_t)&block_descriptor_1;
  uint64_t v30 = _Block_copy(aBlock);
  id v31 = v15;
  swift_retain();
  swift_retain();
  uint64_t v32 = v41;
  sub_2355BCBF0();
  uint64_t v45 = MEMORY[0x263F8EE78];
  sub_2355B9854(&qword_26880C788, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C790);
  sub_2355B9080();
  uint64_t v33 = v43;
  sub_2355BD1D0();
  MEMORY[0x237DE3470](0, v32, v33, v30);
  _Block_release(v30);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v33, v4);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v44);
  swift_release();
  return swift_release();
}

uint64_t sub_2355A804C(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v6 = sub_2355BCB50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v41 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v40 - v10;
  uint64_t v12 = sub_2355BCB80();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  BOOL v18 = (char *)v40 - v17;
  swift_beginAccess();
  uint64_t v19 = MEMORY[0x237DE3CB0](a1 + 16);
  if (v19)
  {
    v40[0] = v19;
    v40[1] = a4;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v12, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v20, v12);
    uint64_t v21 = sub_2355BCB60();
    os_log_type_t v22 = sub_2355BCF80();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = v6;
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_23556D000, v21, v22, "INPlayMediaIntentHandler#resolveMediaItems...", v24, 2u);
      uint64_t v25 = v24;
      uint64_t v6 = v23;
      MEMORY[0x237DE3BF0](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v42;
    *(void *)(v26 + 24) = v43;
    uint64_t v27 = qword_26880C118;
    swift_retain();
    if (v27 != -1) {
      swift_once();
    }
    id v28 = (id)logObject;
    sub_2355BCB30();
    uint64_t v29 = v41;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v41, v11, v6);
    unint64_t v30 = (*(unsigned __int8 *)(v7 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = "playMediaIntentHandlerResolveMediaItems";
    *(void *)(v31 + 24) = 39;
    *(unsigned char *)(v31 + 32) = 2;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v31 + v30, v29, v6);
    uint64_t v32 = (void *)(v31 + ((v8 + v30 + 7) & 0xFFFFFFFFFFFFFFF8));
    void *v32 = sub_235596E28;
    v32[1] = v26;
    swift_retain();
    sub_2355BD140();
    sub_2355BCB10();
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = sub_2355B90E0;
    *(void *)(v33 + 24) = v31;
    MEMORY[0x270FA5388](v33);
    uint64_t v34 = (void *)v40[0];
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8F0);
    sub_2355BC0D0();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);

    return swift_release();
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v36 = __swift_project_value_buffer(v12, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v36, v12);
    uint64_t v37 = sub_2355BCB60();
    os_log_type_t v38 = sub_2355BCF70();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_23556D000, v37, v38, "INPlayMediaIntentHandler#resolveMediaItems self deallocated", v39, 2u);
      MEMORY[0x237DE3BF0](v39, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    return v42(MEMORY[0x263F8EE78]);
  }
}

void sub_2355A8648(void (*a1)(uint64_t *), uint64_t a2, void *a3, char *a4)
{
  uint64_t v116 = a4;
  uint64_t v7 = (void *)sub_2355BCB80();
  uint64_t v8 = *(v7 - 1);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  os_log_type_t v115 = (char *)&v112 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v112 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v113 = (char *)&v112 - v18;
  MEMORY[0x270FA5388](v17);
  id v126 = (char *)&v112 - v19;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = a2;
  uint64_t v121 = v20;
  v128[0] = (uint64_t)a3;
  sub_23557DC00(0, &qword_26880C420);
  swift_retain();
  if (sub_2355BC620())
  {
    sub_2355BC8E0();
    sub_2355BC8D0();
    sub_2355BC8C0();
    swift_release();
  }
  self;
  uint64_t v21 = swift_dynamicCastObjCClass();
  uint64_t v119 = a2;
  uint64_t v120 = a1;
  if (v21)
  {
    os_log_type_t v22 = (void *)v21;
    id v23 = a3;
    id v24 = objc_msgSend(v22, sel_privatePlayMediaIntentData);
    if (!v24) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  self;
  uint64_t v25 = swift_dynamicCastObjCClass();
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    id v23 = a3;
    id v24 = objc_msgSend(v26, sel_privateAddMediaIntentData);
    if (!v24) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  self;
  uint64_t v27 = swift_dynamicCastObjCClass();
  if (v27)
  {
    id v28 = (void *)v27;
    id v23 = a3;
    id v24 = objc_msgSend(v28, sel_privateUpdateMediaAffinityIntentData);
    if (!v24) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  self;
  uint64_t v29 = swift_dynamicCastObjCClass();
  if (v29)
  {
    unint64_t v30 = (void *)v29;
    id v23 = a3;
    id v24 = objc_msgSend(v30, sel_privateSearchForMediaIntentData);
    if (!v24) {
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v31 = v24;
    id v32 = objc_msgSend(v24, sel_internalSignals);

    if (v32)
    {
      uint64_t v33 = sub_2355BCDB0();

      id v23 = v32;
LABEL_17:
      uint64_t v34 = v126;

      goto LABEL_18;
    }
LABEL_16:
    uint64_t v33 = MEMORY[0x263F8EE78];
    goto LABEL_17;
  }
  uint64_t v33 = MEMORY[0x263F8EE78];
  uint64_t v34 = v126;
LABEL_18:
  id v118 = v11;
  uint64_t v125 = a3;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v35 = __swift_project_value_buffer((uint64_t)v7, (uint64_t)qword_26880D108);
  uint64_t v36 = *(void (**)(void))(v8 + 16);
  uint64_t v122 = v35;
  uint64_t v123 = (void (*)(char *, uint64_t, void *))v36;
  uint64_t v124 = v8 + 16;
  v36(v34);
  swift_bridgeObjectRetain_n();
  uint64_t v37 = sub_2355BCB60();
  os_log_type_t v38 = sub_2355BCF80();
  BOOL v39 = os_log_type_enabled(v37, v38);
  id v114 = v16;
  if (v39)
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v117 = v7;
    uint64_t v42 = v41;
    v128[0] = v41;
    *(_DWORD *)uint64_t v40 = 136315138;
    uint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v44 = MEMORY[0x237DE3110](v43, MEMORY[0x263F8D310]);
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    v127[0] = sub_2355745F0(v44, v46, v128);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v37, v38, "INPlayMediaIntentHandler#resolveMediaItems sees private intent signals: %s", v40, 0xCu);
    swift_arrayDestroy();
    uint64_t v47 = v42;
    uint64_t v7 = v117;
    MEMORY[0x237DE3BF0](v47, -1, -1);
    MEMORY[0x237DE3BF0](v40, -1, -1);

    uint64_t v48 = *(char **)(v8 + 8);
    ((void (*)(char *, void *))v48)(v126, v7);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v48 = *(char **)(v8 + 8);
    ((void (*)(char *, void *))v48)(v34, v7);
  }
  uint64_t v49 = v125;
  if (sub_2355BCFF0())
  {
    swift_release();
    uint64_t v50 = v118;
    v123(v118, v122, v7);
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF70();
    if (os_log_type_enabled(v51, v52))
    {
      id v126 = v48;
      uint64_t v112 = v8;
      uint64_t v117 = v7;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      v128[0] = v54;
      *(_DWORD *)uint64_t v53 = 136315138;
      uint64_t v55 = swift_bridgeObjectRetain();
      uint64_t v56 = MEMORY[0x237DE3110](v55, MEMORY[0x263F8D310]);
      unint64_t v58 = v57;
      swift_bridgeObjectRelease();
      v127[0] = sub_2355745F0(v56, v58, v128);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v51, v52, "INPlayMediaIntentHandler#resolveMediaItems got signal to immediately error as this is a follow up request that did not succeed, internal signals: %s", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v54, -1, -1);
      MEMORY[0x237DE3BF0](v53, -1, -1);

      ((void (*)(char *, void *))v126)(v50, v117);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, void *))v48)(v50, v7);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v76 = swift_allocObject();
    *(_OWORD *)(v76 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, &qword_26880C8C0);
    *(void *)(v76 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v128[0] = v76;
    sub_2355BCDD0();
    v120(v128);
LABEL_67:
    swift_bridgeObjectRelease();
    return;
  }
  id v126 = v48;
  if (sub_2355BD040())
  {
    __swift_project_boxed_opaque_existential_1(&v116[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider], *(void *)&v116[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider + 24]);
    uint64_t v59 = v33;
    id v60 = objc_msgSend(v49, sel_typeName);
    sub_2355BCC50();

    uint64_t v33 = v59;
    sub_2355BC000();
    swift_bridgeObjectRelease();
  }
  uint64_t v61 = swift_allocObject();
  *(void *)(v61 + 16) = 0;
  uint64_t v62 = (void **)(v61 + 16);
  if ((sub_2355BD0B0() & 1) == 0) {
    goto LABEL_63;
  }
  uint64_t v63 = objc_msgSend(v49, sel_backingStore);
  self;
  uint64_t v64 = swift_dynamicCastObjCClass();
  if (v64)
  {
    uint64_t v65 = (void *)v64;
    uint64_t v117 = v63;
    id v118 = (char *)v33;
    uint64_t v66 = v113;
    uint64_t v67 = v7;
    v123(v113, v122, v7);
    uint64_t v68 = sub_2355BCB60();
    os_log_type_t v69 = sub_2355BCF80();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v70 = 0;
      _os_log_impl(&dword_23556D000, v68, v69, "INPlayMediaIntentHandler#resolveMediaItems fallback: implicit recommendation signal detected", v70, 2u);
      MEMORY[0x237DE3BF0](v70, -1, -1);
    }

    uint64_t v112 = v8;
    ((void (*)(char *, void *))v126)(v66, v67);
    id v71 = objc_msgSend(v65, sel_privatePlayMediaIntentData);
    if (!v71)
    {
      id v73 = 0;
LABEL_45:
      uint64_t v77 = *v62;
      *uint64_t v62 = v73;

      id v78 = objc_msgSend(v65, sel_privatePlayMediaIntentData);
      if (v78)
      {
        uint64_t v79 = v78;
        sub_23557DC00(0, &qword_26880C6D0);
        uint64_t v80 = (void *)sub_2355BCD90();
        objc_msgSend(v79, sel_setAudioSearchResults_, v80);
      }
      uint64_t v81 = v114;
      uint64_t v7 = v67;
      v123(v114, v122, v67);
      swift_retain_n();
      uint64_t v82 = sub_2355BCB60();
      int v83 = sub_2355BCF80();
      BOOL v84 = os_log_type_enabled(v82, (os_log_type_t)v83);
      uint64_t v49 = v125;
      if (!v84)
      {

        swift_release_n();
        uint64_t v93 = v81;
        os_log_t v94 = v67;
LABEL_62:
        ((void (*)(char *, void *))v126)(v93, v94);
        uint64_t v33 = (uint64_t)v118;
        goto LABEL_63;
      }
      uint64_t v85 = swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      v129[0] = v86;
      *(_DWORD *)uint64_t v85 = 136446466;
      swift_beginAccess();
      uint64_t v87 = *v62;
      LODWORD(v113) = v83;
      if (v87)
      {
        id v88 = objc_msgSend(v87, sel_identifier);
        if (v88)
        {
          id v89 = v88;
          uint64_t v90 = sub_2355BCC50();
          uint64_t v92 = v91;
        }
        else
        {
          uint64_t v90 = 0;
          uint64_t v92 = 0;
        }
        uint64_t v49 = v125;
      }
      else
      {
        uint64_t v90 = 0;
        uint64_t v92 = 0;
      }
      v127[0] = v90;
      v127[1] = v92;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
      uint64_t v95 = sub_2355BCC60();
      v127[0] = sub_2355745F0(v95, v96, v129);
      sub_2355BD1B0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v85 + 12) = 2080;
      uint64_t v97 = *(void **)(v61 + 16);
      if (v97)
      {
        id v98 = objc_msgSend(v97, sel_privateMediaItemValueData);
        uint64_t v99 = v98;
        if (!v98)
        {
LABEL_61:
          v127[0] = v99;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8F8);
          uint64_t v101 = sub_2355BCC60();
          v127[0] = sub_2355745F0(v101, v102, v129);
          sub_2355BD1B0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v82, (os_log_type_t)v113, "INPlayMediaIntentHandler#resolveMediaItems fallback: found fallback media item: %{public}s with internal signals: %s", (uint8_t *)v85, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v86, -1, -1);
          MEMORY[0x237DE3BF0](v85, -1, -1);

          uint64_t v93 = v114;
          uint64_t v7 = v67;
          os_log_t v94 = v67;
          goto LABEL_62;
        }
        id v100 = objc_msgSend(v98, sel_internalSignals);

        if (v100)
        {
          uint64_t v99 = (void *)sub_2355BCDB0();

          goto LABEL_61;
        }
      }
      uint64_t v99 = 0;
      goto LABEL_61;
    }
    uint64_t v72 = v71;
    id v73 = objc_msgSend(v71, sel_audioSearchResults);

    if (!v73) {
      goto LABEL_45;
    }
    sub_23557DC00(0, &qword_26880C6D0);
    unint64_t v74 = sub_2355BCDB0();

    if (v74 >> 62)
    {
      swift_bridgeObjectRetain();
      id v73 = (id)sub_2355BD280();
      swift_bridgeObjectRelease();
      if (v73) {
        goto LABEL_36;
      }
    }
    else
    {
      id v73 = *(id *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v73)
      {
LABEL_36:
        if ((v74 & 0xC000000000000001) != 0)
        {
          id v75 = (id)MEMORY[0x237DE35A0](0, v74);
        }
        else
        {
          if (!*(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v75 = *(id *)(v74 + 32);
        }
        id v73 = v75;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }

LABEL_63:
  if (_s17SiriAudioInternal0C14SignalsManagerC10doesIntent_4haveSbSo8INIntentC_SaySSGtFZ_0(v49, (uint64_t)&unk_26E8B0200))
  {
    swift_bridgeObjectRelease();
    swift_release();
    v123(v115, v122, v7);
    uint64_t v103 = sub_2355BCB60();
    os_log_type_t v104 = sub_2355BCF60();
    if (os_log_type_enabled(v103, v104))
    {
      uint64_t v105 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v105 = 0;
      _os_log_impl(&dword_23556D000, v103, v104, "INPlayMediaIntentHandler#resolveMediaItems received audio search direct action intent requiring prompt for value", v105, 2u);
      MEMORY[0x237DE3BF0](v105, -1, -1);
    }

    ((void (*)(char *, void *))v126)(v115, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v106 = swift_allocObject();
    *(_OWORD *)(v106 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, &qword_26880C8C0);
    *(void *)(v106 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
    v127[0] = v106;
    sub_2355BCDD0();
    v120(v127);
    swift_release();
    goto LABEL_67;
  }
  id v107 = v116;
  __swift_project_boxed_opaque_existential_1(&v116[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider], *(void *)&v116[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider + 24]);
  uint64_t v108 = (void *)swift_allocObject();
  v108[2] = v107;
  v108[3] = v49;
  uint64_t v109 = v121;
  v108[4] = sub_23559DB78;
  v108[5] = v109;
  v108[6] = v33;
  v108[7] = v61;
  id v110 = v49;
  swift_retain();
  id v111 = v107;
  sub_2355BC8A0();
  swift_release();
  swift_release();
}

uint64_t sub_2355A95EC(int a1, void *a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13 = a3;
  swift_retain();
  id v14 = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2355BB664(v13, v14, v13, a4, a5, a1, v14, a6, a7);

  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2355A96BC(unint64_t a1, id a2, void (*a3)(uint64_t), uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v180 = a8;
  uint64_t v184 = a7;
  uint64_t v185 = a6;
  uint64_t v187 = a3;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C8C8);
  MEMORY[0x270FA5388](v12 - 8);
  id v183 = (uint64_t *)((char *)&v169 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C880);
  uint64_t v181 = *(void *)(v14 - 8);
  uint64_t v182 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v179 = (uint64_t *)((char *)&v169 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = (char *)sub_2355BCB80();
  unint64_t v188 = *((void *)v16 - 1);
  id v189 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v169 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  os_log_type_t v22 = (char *)&v169 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v169 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  id v28 = (char *)&v169 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v31 = (char *)&v169 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v169 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = MEMORY[0x270FA5388](v35);
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  MEMORY[0x270FA5388](v37);
  if (!a1)
  {
LABEL_63:
    if ((sub_2355BCFA0() & 1) == 0)
    {
      char v150 = sub_2355BCFB0();
      unint64_t v152 = v188;
      os_log_type_t v151 = v189;
      if (v150)
      {
        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v153 = __swift_project_value_buffer((uint64_t)v151, (uint64_t)qword_26880D108);
        (*(void (**)(char *, uint64_t, char *))(v152 + 16))(v22, v153, v151);
        uint64_t v154 = sub_2355BCB60();
        os_log_type_t v155 = sub_2355BCF80();
        if (os_log_type_enabled(v154, v155))
        {
          uint64_t v156 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v156 = 0;
          _os_log_impl(&dword_23556D000, v154, v155, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local, have AmpError", v156, 2u);
          MEMORY[0x237DE3BF0](v156, -1, -1);
        }

        (*(void (**)(char *, char *))(v152 + 8))(v22, v151);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v148 = swift_allocObject();
        *(_OWORD *)(v148 + 16) = xmmword_2355BDD80;
        id v149 = objc_msgSend(self, sel_unsupportedForReason_, 7);
      }
      else if (sub_2355BD020())
      {
        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v157 = __swift_project_value_buffer((uint64_t)v151, (uint64_t)qword_26880D108);
        (*(void (**)(char *, uint64_t, char *))(v152 + 16))(v25, v157, v151);
        uint64_t v158 = sub_2355BCB60();
        os_log_type_t v159 = sub_2355BCF70();
        if (os_log_type_enabled(v158, v159))
        {
          uint64_t v160 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v160 = 0;
          _os_log_impl(&dword_23556D000, v158, v159, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local, have invalid AMP token", v160, 2u);
          MEMORY[0x237DE3BF0](v160, -1, -1);
        }

        (*(void (**)(char *, char *))(v152 + 8))(v25, v151);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v148 = swift_allocObject();
        *(_OWORD *)(v148 + 16) = xmmword_2355BDD80;
        id v149 = objc_msgSend(self, sel_unsupportedForReason_, 1);
      }
      else if (sub_2355BD010())
      {
        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v161 = __swift_project_value_buffer((uint64_t)v151, (uint64_t)qword_26880D108);
        (*(void (**)(char *, uint64_t, char *))(v152 + 16))(v28, v161, v151);
        os_log_type_t v162 = sub_2355BCB60();
        os_log_type_t v163 = sub_2355BCF50();
        if (os_log_type_enabled(v162, v163))
        {
          uint64_t v164 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v164 = 0;
          _os_log_impl(&dword_23556D000, v162, v163, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local, have unsafe self harm signal. Return unsupported.", v164, 2u);
          MEMORY[0x237DE3BF0](v164, -1, -1);
        }

        (*(void (**)(char *, char *))(v152 + 8))(v28, v151);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v148 = swift_allocObject();
        *(_OWORD *)(v148 + 16) = xmmword_2355BDD80;
        sub_23557DC00(0, &qword_26880C8C0);
        id v149 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      }
      else
      {
        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v165 = __swift_project_value_buffer((uint64_t)v151, (uint64_t)qword_26880D108);
        (*(void (**)(char *, uint64_t, char *))(v152 + 16))(v31, v165, v151);
        id v166 = sub_2355BCB60();
        os_log_type_t v167 = sub_2355BCF70();
        if (os_log_type_enabled(v166, v167))
        {
          uint64_t v168 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v168 = 0;
          _os_log_impl(&dword_23556D000, v166, v167, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local, returning unsupported", v168, 2u);
          MEMORY[0x237DE3BF0](v168, -1, -1);
        }

        (*(void (**)(char *, char *))(v152 + 8))(v31, v151);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v148 = swift_allocObject();
        *(_OWORD *)(v148 + 16) = xmmword_2355BDD80;
        sub_23557DC00(0, &qword_26880C8C0);
        id v149 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      }
      goto LABEL_91;
    }
    a1 = v188;
    uint64_t v34 = v189;
    if (qword_26880C108 == -1)
    {
LABEL_65:
      uint64_t v144 = __swift_project_value_buffer((uint64_t)v34, (uint64_t)qword_26880D108);
      (*(void (**)(char *, uint64_t, char *))(a1 + 16))(v19, v144, v34);
      uint64_t v145 = sub_2355BCB60();
      os_log_type_t v146 = sub_2355BCF60();
      if (os_log_type_enabled(v145, v146))
      {
        uint64_t v147 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v147 = 0;
        _os_log_impl(&dword_23556D000, v145, v146, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local and meets criteria for prompting for value", v147, 2u);
        MEMORY[0x237DE3BF0](v147, -1, -1);
      }

      (*(void (**)(char *, char *))(a1 + 8))(v19, v34);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v148 = swift_allocObject();
      *(_OWORD *)(v148 + 16) = xmmword_2355BDD80;
      sub_23557DC00(0, &qword_26880C8C0);
      id v149 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
LABEL_91:
      *(void *)(v148 + 32) = v149;
      uint64_t v191 = v148;
      sub_2355BCDD0();
      v187(v191);
      return swift_bridgeObjectRelease();
    }
LABEL_95:
    swift_once();
    goto LABEL_65;
  }
  os_log_type_t v178 = (char *)&v169 - v38;
  uint64_t v174 = v41;
  uint64_t v175 = v39;
  uint64_t v176 = v40;
  uint64_t v186 = a4;
  unint64_t v177 = a1 >> 62;
  if (!(a1 >> 62))
  {
    uint64_t v42 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v42) {
      goto LABEL_4;
    }
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  if (!sub_2355BD280())
  {
LABEL_62:
    swift_bridgeObjectRelease();
    goto LABEL_63;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v43 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_95;
  }
  id v43 = (id)MEMORY[0x237DE35A0](0, a1);
LABEL_7:
  uint64_t v44 = v43;
  uint64_t v193 = sub_23557DC00(0, &qword_26880C420);
  uint64_t v194 = MEMORY[0x263F6CC60];
  uint64_t v191 = (uint64_t)a2;
  id v45 = a2;
  sub_2355BCEF0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v191);
  if (a5)
  {
    swift_bridgeObjectRelease();
    if (qword_26880C108 != -1) {
      swift_once();
    }
    unint64_t v46 = v189;
    uint64_t v47 = __swift_project_value_buffer((uint64_t)v189, (uint64_t)qword_26880D108);
    unint64_t v48 = v188;
    (*(void (**)(char *, uint64_t, char *))(v188 + 16))(v34, v47, v46);
    uint64_t v49 = sub_2355BCB60();
    os_log_type_t v50 = sub_2355BCF60();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_23556D000, v49, v50, "INPlayMediaIntentHandler#resolveMediaItems User needs to sign GDPR returning unsupported to allow for the GDPR dialog", v51, 2u);
      MEMORY[0x237DE3BF0](v51, -1, -1);
    }

    (*(void (**)(char *, char *))(v48 + 8))(v34, v189);
    sub_2355BCFD0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, &qword_26880C8C0);
    *(void *)(v52 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    uint64_t v191 = v52;
    sub_2355BCDD0();
    v187(v191);

    return swift_bridgeObjectRelease();
  }
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v53 = v189;
  uint64_t v54 = __swift_project_value_buffer((uint64_t)v189, (uint64_t)qword_26880D108);
  unint64_t v55 = v188;
  uint64_t v56 = *(void (**)(char *))(v188 + 16);
  unint64_t v57 = v178;
  uint64_t v171 = v54;
  v56(v178);
  id v58 = v44;
  uint64_t v59 = sub_2355BCB60();
  os_log_type_t v60 = sub_2355BCF80();
  if (os_log_type_enabled(v59, v60))
  {
    unint64_t v170 = v56;
    os_log_type_t v61 = v60;
    os_log_type_t v173 = v59;
    uint64_t v62 = swift_slowAlloc();
    os_log_t v172 = (void (*)(void, void))swift_slowAlloc();
    uint64_t v190 = v172;
    *(_DWORD *)uint64_t v62 = 136446466;
    id v63 = objc_msgSend(v58, sel_identifier);
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = sub_2355BCC50();
      uint64_t v67 = v66;
    }
    else
    {
      uint64_t v65 = 0;
      uint64_t v67 = 0;
    }
    uint64_t v191 = v65;
    uint64_t v192 = v67;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
    uint64_t v68 = sub_2355BCC60();
    uint64_t v191 = sub_2355745F0(v68, v69, (uint64_t *)&v190);
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2050;
    id v70 = objc_msgSend(v58, sel_privateMediaItemValueData);
    if (v70)
    {
      id v71 = v70;
      id v72 = objc_msgSend(v70, sel_mediaSubItems);

      if (v72)
      {
        sub_23557DC00(0, &qword_26880C898);
        unint64_t v73 = sub_2355BCDB0();

        if (v73 >> 62)
        {
          swift_bridgeObjectRetain();
          id v72 = (id)sub_2355BD280();

          swift_bridgeObjectRelease_n();
        }
        else
        {
          id v72 = *(id *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);

          swift_bridgeObjectRelease();
        }
      }
      else
      {
      }
    }
    else
    {

      id v72 = 0;
    }
    uint64_t v191 = (uint64_t)v72;
    sub_2355BD1B0();

    unint64_t v74 = v173;
    _os_log_impl(&dword_23556D000, v173, v61, "INPlayMediaIntentHandler#resolveMediaItems resolved item with identifier: %{public}s and sub items: %{public}ld", (uint8_t *)v62, 0x16u);
    id v75 = v172;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v75, -1, -1);
    MEMORY[0x237DE3BF0](v62, -1, -1);

    os_log_t v172 = *(void (**)(void, void))(v188 + 8);
    v172(v178, v53);
    uint64_t v56 = v170;
  }
  else
  {

    os_log_t v172 = *(void (**)(void, void))(v55 + 8);
    v172(v57, v53);
  }
  id v76 = objc_msgSend(v45, sel_privatePlayMediaIntentData);
  uint64_t v77 = (void (*)(char *))objc_msgSend(v76, sel_entityConfidenceSignalsEnabled);

  id v78 = objc_msgSend(v45, sel_privatePlayMediaIntentData);
  os_log_type_t v178 = (char *)objc_msgSend(v78, sel_entityConfidenceSignalsFrequencyDenominatorProd);

  id v79 = objc_msgSend(v45, sel_privatePlayMediaIntentData);
  os_log_type_t v173 = objc_msgSend(v79, sel_entityConfidenceSignalsFrequencyDenominatorInternal);

  if (v177)
  {
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2355BD280();
    swift_bridgeObjectRelease();
    if (v80 == 1) {
      goto LABEL_38;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
  {
    goto LABEL_38;
  }
  if (sub_2355B57F4(v77, v173, v178))
  {
    id v81 = objc_msgSend(v45, sel_privatePlayMediaIntentData);
    unint64_t v170 = v77;
    if (v81
      && (uint64_t v82 = v81,
          id v83 = objc_msgSend(v81, sel_entityConfidenceSignalsMaxItemsToDisambiguate),
          v82,
          v83)
      && (uint64_t v191 = 0, LOBYTE(v192) = 1, sub_2355BCE80(), v83, v192 != 1))
    {
      uint64_t v84 = v191;
    }
    else
    {
      uint64_t v84 = 5;
    }
    uint64_t v185 = v84;
    uint64_t v85 = sub_2355B91DC(v84, a1);
    uint64_t v87 = v86;
    uint64_t v89 = v88;
    unint64_t v91 = v90;
    swift_bridgeObjectRelease();
    if (v91)
    {
      sub_2355BD300();
      swift_unknownObjectRetain_n();
      uint64_t v118 = swift_dynamicCastClass();
      if (!v118)
      {
        swift_unknownObjectRelease();
        uint64_t v118 = MEMORY[0x263F8EE78];
      }
      uint64_t v119 = *(void *)(v118 + 16);
      swift_release();
      if (__OFSUB__(v91 >> 1, v89))
      {
        __break(1u);
      }
      else if (v119 == (v91 >> 1) - v89)
      {
        unint64_t v92 = swift_dynamicCastClass();
        if (!v92)
        {
          swift_unknownObjectRelease();
          unint64_t v92 = MEMORY[0x263F8EE78];
        }
        goto LABEL_54;
      }
      swift_unknownObjectRelease();
    }
    unint64_t v92 = sub_2355B71DC(v85, v87, v89, v91);
LABEL_54:
    swift_unknownObjectRelease();
    uint64_t v120 = v175;
    uint64_t v121 = v189;
    ((void (*)(uint64_t, uint64_t, char *))v56)(v175, v171, v189);
    uint64_t v122 = sub_2355BCB60();
    os_log_type_t v123 = sub_2355BCF60();
    if (os_log_type_enabled(v122, v123))
    {
      uint64_t v124 = (uint8_t *)swift_slowAlloc();
      uint64_t v125 = swift_slowAlloc();
      *(_DWORD *)uint64_t v124 = 136446210;
      uint64_t v190 = (void (*)(void, void))v185;
      uint64_t v191 = v125;
      uint64_t v126 = sub_2355BD2E0();
      uint64_t v190 = (void (*)(void, void))sub_2355745F0(v126, v127, &v191);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v122, v123, "INPlayMediaIntentHandler#resolveMediaItems Disambiguating with %{public}s results", v124, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v125, -1, -1);
      MEMORY[0x237DE3BF0](v124, -1, -1);

      os_log_type_t v128 = v189;
      uint64_t v129 = v120;
    }
    else
    {

      uint64_t v129 = v120;
      os_log_type_t v128 = v121;
    }
    v172(v129, v128);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v130 = swift_allocObject();
    *(_OWORD *)(v130 + 16) = xmmword_2355BDD80;
    sub_2355AAF88(v92);
    swift_release();
    id v131 = (void *)sub_2355BCD90();
    swift_bridgeObjectRelease();
    id v132 = objc_msgSend(self, sel_resolutionResultDisambiguationWithItemsToDisambiguate_, v131);

    *(void *)(v130 + 32) = v132;
    uint64_t v191 = v130;
    sub_2355BCDD0();
    v187(v191);

    goto LABEL_58;
  }
LABEL_38:
  if (sub_2355BD080() & 1) != 0 || (sub_2355BD0A0())
  {
    swift_bridgeObjectRelease();
    uint64_t v93 = v176;
    ((void (*)(uint64_t, uint64_t, char *))v56)(v176, v171, v53);
    swift_bridgeObjectRetain_n();
    os_log_t v94 = sub_2355BCB60();
    os_log_type_t v95 = sub_2355BCF70();
    if (os_log_type_enabled(v94, v95))
    {
      unint64_t v96 = (uint8_t *)swift_slowAlloc();
      uint64_t v97 = swift_slowAlloc();
      unint64_t v170 = v77;
      uint64_t v98 = v97;
      uint64_t v191 = v97;
      uint64_t v185 = (uint64_t)v58;
      *(_DWORD *)unint64_t v96 = 136315138;
      uint64_t v99 = swift_bridgeObjectRetain();
      uint64_t v100 = MEMORY[0x237DE3110](v99, MEMORY[0x263F8D310]);
      unint64_t v102 = v101;
      swift_bridgeObjectRelease();
      uint64_t v190 = (void (*)(void, void))sub_2355745F0(v100, v102, &v191);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v94, v95, "INPlayMediaIntentHandler#resolveMediaItems got signal to immediately error as UnsupportedNonSubscriber or AcousticIdFollowUpSubscriptionNotActive present, internal signals: %s", v96, 0xCu);
      swift_arrayDestroy();
      uint64_t v103 = v98;
      uint64_t v77 = v170;
      MEMORY[0x237DE3BF0](v103, -1, -1);
      MEMORY[0x237DE3BF0](v96, -1, -1);

      os_log_type_t v104 = v189;
      uint64_t v105 = v93;
      id v58 = (id)v185;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v105 = v93;
      os_log_type_t v104 = v53;
    }
    v172(v105, v104);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v106 = swift_allocObject();
    *(_OWORD *)(v106 + 16) = xmmword_2355BDD80;
    *(void *)(v106 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 2);
    uint64_t v191 = v106;
    sub_2355BCDD0();
    v187(v191);

LABEL_58:
    return swift_bridgeObjectRelease();
  }
  unint64_t v170 = v77;
  id v107 = (char *)v58;
  uint64_t v108 = v183;
  uint64_t v109 = v58;
  id v110 = (void *)v185;
  sub_2355B3764(v109, v45, v183);

  uint64_t v111 = v182;
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v181 + 48))(v108, 1, v182) != 1)
  {
    uint64_t v133 = *(int *)(v111 + 48);
    uint64_t v134 = (uint64_t)v179;
    id v135 = (char *)v179 + v133;
    id v189 = v107;
    uint64_t v136 = (char *)v108 + v133;
    *uint64_t v179 = *v108;
    uint64_t v137 = sub_2355BC600();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 32))(v135, v136, v137);
    id v138 = (void *)swift_allocObject();
    v138[2] = v45;
    v138[3] = a1;
    uint64_t v139 = v186;
    v138[4] = v187;
    v138[5] = v139;
    uint64_t v140 = v180;
    v138[6] = v184;
    v138[7] = v140;
    v138[8] = v110;
    id v141 = v45;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    id v142 = v110;
    sub_2355BC3B0();

    swift_release();
    swift_release();

    return sub_23557DE84(v134, &qword_26880C880);
  }
  swift_bridgeObjectRelease();
  sub_23557DE84((uint64_t)v108, (uint64_t *)&unk_26880C8C8);
  ((void (*)(uint64_t, uint64_t, char *))v56)(v174, v171, v53);
  uint64_t v112 = sub_2355BCB60();
  os_log_type_t v113 = sub_2355BCF50();
  if (os_log_type_enabled(v112, v113))
  {
    id v114 = v107;
    os_log_type_t v115 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v115 = 0;
    _os_log_impl(&dword_23556D000, v112, v113, "INPlayMediaIntentHandler#resolveMediaItems Problem converting intent to Playback objects", v115, 2u);
    uint64_t v116 = v115;
    id v107 = v114;
    MEMORY[0x237DE3BF0](v116, -1, -1);
  }

  v172(v174, v53);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v117 = swift_allocObject();
  *(_OWORD *)(v117 + 16) = xmmword_2355BDD80;
  sub_23557DC00(0, &qword_26880C8C0);
  *(void *)(v117 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
  uint64_t v191 = v117;
  sub_2355BCDD0();
  v187(v191);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2355AAF88(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2355BD280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2355B7390(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x237DE35A0](i, a1);
        sub_23557DC00(0, (unint64_t *)&qword_26880C210);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2355B7390(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_2355B7390(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_235585F48(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_23557DC00(0, (unint64_t *)&qword_26880C210);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2355B7390(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_2355B7390(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_235585F48(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2355AB1EC(uint64_t a1, void *a2, void (*a3)(char *, char *, uint64_t), void (*a4)(os_log_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v469 = a8;
  uint64_t v471 = a7;
  uint64_t v488 = a6;
  uint64_t v510 = a5;
  v511 = a4;
  v521 = a3;
  v503 = a2;
  v520 = a1;
  v515 = (void *)sub_2355BC180();
  uint64_t v507 = *(v515 - 1);
  uint64_t v8 = MEMORY[0x270FA5388](v515);
  v475 = (char *)&v465 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v498 = (char *)&v465 - v11;
  MEMORY[0x270FA5388](v10);
  v508 = (char *)&v465 - v12;
  uint64_t v13 = sub_2355BC880();
  v519 = *(char **)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v500 = (char *)&v465 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v474 = (char *)&v465 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v473 = (char *)&v465 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v479 = (char *)&v465 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v490 = (char *)&v465 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v496 = (char *)&v465 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v494 = (char *)&v465 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v492 = (char *)&v465 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v482 = (char *)&v465 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v485 = (char *)&v465 - v33;
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v465 - v34;
  uint64_t v36 = sub_2355BCB50();
  isa = (uint8_t *)v36[-1].isa;
  os_log_t v514 = v36;
  MEMORY[0x270FA5388](v36);
  v512 = (char *)&v465 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8B8);
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char **)((char *)&v465 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v41 = sub_2355BCB80();
  uint64_t v42 = *(NSObject **)(v41 - 8);
  uint64_t v43 = MEMORY[0x270FA5388](v41);
  v499 = (char *)&v465 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  v477 = (char *)&v465 - v46;
  uint64_t v47 = MEMORY[0x270FA5388](v45);
  v476 = (char *)&v465 - v48;
  uint64_t v49 = MEMORY[0x270FA5388](v47);
  v480 = (char *)&v465 - v50;
  uint64_t v51 = MEMORY[0x270FA5388](v49);
  v491 = (char *)&v465 - v52;
  uint64_t v53 = MEMORY[0x270FA5388](v51);
  v497 = (char *)&v465 - v54;
  uint64_t v55 = MEMORY[0x270FA5388](v53);
  v495 = (char *)&v465 - v56;
  uint64_t v57 = MEMORY[0x270FA5388](v55);
  v493 = (char *)&v465 - v58;
  uint64_t v59 = MEMORY[0x270FA5388](v57);
  v468 = (char *)&v465 - v60;
  uint64_t v61 = MEMORY[0x270FA5388](v59);
  v470 = (char *)&v465 - v62;
  uint64_t v63 = MEMORY[0x270FA5388](v61);
  v467 = (char *)&v465 - v64;
  uint64_t v65 = MEMORY[0x270FA5388](v63);
  v472 = (char *)&v465 - v66;
  uint64_t v67 = MEMORY[0x270FA5388](v65);
  v478 = (char *)&v465 - v68;
  uint64_t v69 = MEMORY[0x270FA5388](v67);
  v481 = (char *)&v465 - v70;
  uint64_t v71 = MEMORY[0x270FA5388](v69);
  v484 = (char *)&v465 - v72;
  uint64_t v73 = MEMORY[0x270FA5388](v71);
  v486 = (char *)&v465 - v74;
  uint64_t v75 = MEMORY[0x270FA5388](v73);
  v487 = (char *)&v465 - v76;
  uint64_t v77 = MEMORY[0x270FA5388](v75);
  v483 = (char *)&v465 - v78;
  uint64_t v79 = MEMORY[0x270FA5388](v77);
  v489 = (char *)&v465 - v80;
  uint64_t v81 = MEMORY[0x270FA5388](v79);
  v506 = (char *)&v465 - v82;
  uint64_t v83 = MEMORY[0x270FA5388](v81);
  v505 = (char *)&v465 - v84;
  uint64_t v85 = MEMORY[0x270FA5388](v83);
  v501 = (char *)&v465 - v86;
  MEMORY[0x270FA5388](v85);
  uint64_t v88 = (char *)&v465 - v87;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v89 = __swift_project_value_buffer(v41, (uint64_t)qword_26880D108);
  unint64_t v90 = (void (*)(char *, uint64_t, uint64_t))v42[2].isa;
  uint64_t v516 = v89;
  v517 = v90;
  os_log_t v518 = v42 + 2;
  ((void (*)(char *))v90)(v88);
  unint64_t v91 = sub_2355BCB60();
  os_log_type_t v92 = sub_2355BCF50();
  if (os_log_type_enabled(v91, v92))
  {
    uint64_t v93 = v41;
    os_log_t v94 = v42;
    os_log_type_t v95 = v35;
    uint64_t v96 = v13;
    uint64_t v97 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v97 = 0;
    _os_log_impl(&dword_23556D000, v91, v92, "INPlayMediaIntentHandler#resolveMediaItems completed for INPlayMediaIntent (possibly success or failure)", v97, 2u);
    uint64_t v98 = v97;
    uint64_t v13 = v96;
    uint64_t v35 = v95;
    uint64_t v42 = v94;
    uint64_t v41 = v93;
    MEMORY[0x237DE3BF0](v98, -1, -1);
  }

  uint64_t v99 = (void (*)(char *, uint64_t))v42[1].isa;
  v99(v88, v41);
  sub_23557DFE4((uint64_t)v520, (uint64_t)v40, &qword_26880C8B8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v520 = v42 + 1;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v504 = v41;
    v502 = v99;
    unint64_t v101 = (void (*)(char *, char **, uint64_t))*((void *)v519 + 4);
    uint64_t v509 = v13;
    v101(v35, v40, v13);
    unint64_t v102 = v508;
    sub_2355BC860();
    uint64_t v103 = sub_2355BC170();
    uint64_t v105 = v104;
    uint64_t v106 = (v507 + 8);
    id v107 = *(void (**)(char *, char *, uint64_t))(v507 + 8);
    uint64_t v108 = v515;
    ((void (*)(char *, void *))v107)(v102, v515);
    sub_2355BD150();
    uint64_t v109 = v35;
    if (qword_26880C118 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C908);
    uint64_t v110 = swift_allocObject();
    *(_OWORD *)(v110 + 16) = xmmword_2355BDD10;
    *(void *)(v110 + 56) = MEMORY[0x263F8D310];
    *(void *)(v110 + 64) = sub_2355BBCD8();
    *(void *)(v110 + 32) = v103;
    *(void *)(v110 + 40) = v105;
    swift_bridgeObjectRetain();
    uint64_t v111 = v512;
    sub_2355BCB40();
    sub_2355BCB10();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, os_log_t))isa + 1))(v111, v514);
    swift_bridgeObjectRelease();
    sub_2355BC0F0();
    sub_2355BC860();
    char v112 = MEMORY[0x237DE2430](v102);
    ((void (*)(char *, void *))v107)(v102, v108);
    os_log_type_t v113 = v102;
    id v114 = v106;
    os_log_type_t v115 = v35;
    v521 = v107;
    if (v112)
    {
      os_log_t v514 = v114;
      uint64_t v116 = v499;
      uint64_t v117 = v504;
      v517(v499, v516, v504);
      uint64_t v118 = v519;
      uint64_t v119 = (void (*)(char *, char *, uint64_t))*((void *)v519 + 2);
      uint64_t v120 = v500;
      v466 = v109;
      v119(v500, v109, v509);
      uint64_t v121 = sub_2355BCB60();
      os_log_type_t v122 = sub_2355BCF70();
      if (os_log_type_enabled(v121, v122))
      {
        os_log_type_t v123 = (uint8_t *)swift_slowAlloc();
        os_log_t v518 = (os_log_t)swift_slowAlloc();
        os_log_t v524 = v518;
        *(_DWORD *)os_log_type_t v123 = 136446210;
        v517 = (void (*)(char *, uint64_t, uint64_t))(v123 + 4);
        uint64_t v124 = v508;
        sub_2355BC860();
        uint64_t v125 = sub_2355BC170();
        unint64_t v127 = v126;
        os_log_type_t v128 = v521;
        ((void (*)(char *, void *))v521)(v124, v515);
        v522[0] = sub_2355745F0(v125, v127, (uint64_t *)&v524);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        uint64_t v129 = (void (*)(char *, uint64_t))*((void *)v118 + 1);
        v129(v500, v509);
        uint64_t v130 = v128;
        os_log_type_t v131 = v122;
        id v132 = v129;
        _os_log_impl(&dword_23556D000, v121, v131, "INPlayMediaIntentHandler#resolveMediaItems identified PFSQ terminating error warming content with code: %{public}s", v123, 0xCu);
        os_log_t v133 = v518;
        swift_arrayDestroy();
        uint64_t v134 = v515;
        MEMORY[0x237DE3BF0](v133, -1, -1);
        MEMORY[0x237DE3BF0](v123, -1, -1);

        v502(v499, v504);
      }
      else
      {
        id v132 = (void (*)(char *, uint64_t))*((void *)v118 + 1);
        v132(v120, v509);

        v502(v116, v117);
        uint64_t v134 = v515;
        uint64_t v124 = v508;
        uint64_t v130 = v521;
      }
      sub_23557DC00(0, &qword_26880C8C0);
      id v183 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      uint64_t v184 = v466;
      sub_2355BC860();
      uint64_t v185 = sub_2355BC170();
      uint64_t v187 = v186;
      ((void (*)(char *, void *))v130)(v124, v134);
      *(void *)&xmmword_26880C760 = v185;
      *((void *)&xmmword_26880C760 + 1) = v187;
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v188 = swift_allocObject();
      *(_OWORD *)(v188 + 16) = xmmword_2355BDD80;
      *(void *)(v188 + 32) = v183;
      os_log_t v524 = (os_log_t)v188;
      sub_2355BCDD0();
      os_log_t v189 = v524;
      id v190 = v183;
      v511(v189);

      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v132)(v184, v509);
    }
    id v149 = v498;
    sub_2355BC860();
    int v150 = (*(uint64_t (**)(char *, void *))(v507 + 88))(v149, v108);
    os_log_type_t v151 = (void (**)(char *, char *, uint64_t))v519;
    uint64_t v152 = v509;
    uint64_t v153 = v504;
    if (v150 == *MEMORY[0x263F6CA60])
    {
      v517(v497, v516, v504);
      uint64_t v154 = v496;
      v151[2](v496, v115, v152);
      os_log_type_t v155 = sub_2355BCB60();
      os_log_type_t v156 = sub_2355BCF70();
      if (os_log_type_enabled(v155, v156))
      {
        uint64_t v157 = swift_slowAlloc();
        os_log_t v514 = v114;
        uint64_t v158 = (_DWORD *)v157;
        os_log_t v518 = (os_log_t)swift_slowAlloc();
        os_log_t v524 = v518;
        os_log_type_t v159 = (uint8_t *)v158;
        _DWORD *v158 = 136446210;
        v517 = (void (*)(char *, uint64_t, uint64_t))(v158 + 1);
        sub_2355BC860();
        uint64_t v160 = sub_2355BC170();
        uint64_t v161 = v151;
        v466 = v115;
        unint64_t v163 = v162;
        ((void (*)(char *, void *))v521)(v113, v515);
        v522[0] = sub_2355745F0(v160, v163, (uint64_t *)&v524);
        sub_2355BD1B0();
        os_log_type_t v115 = v466;
        swift_bridgeObjectRelease();
        uint64_t v164 = v161[1];
        ((void (*)(char *, uint64_t))v164)(v154, v509);
        _os_log_impl(&dword_23556D000, v155, v156, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, unsupported playback queue location", v159, 0xCu);
        os_log_t v165 = v518;
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v165, -1, -1);
        id v166 = v159;
        uint64_t v167 = v509;
        MEMORY[0x237DE3BF0](v166, -1, -1);

        uint64_t v168 = v497;
        uint64_t v169 = v504;
      }
      else
      {
        uint64_t v208 = v153;
        uint64_t v167 = v152;
        uint64_t v164 = v151[1];
        ((void (*)(char *, uint64_t))v164)(v154, v167);

        uint64_t v168 = v497;
        uint64_t v169 = v208;
      }
      v502(v168, v169);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v209 = swift_allocObject();
      *(_OWORD *)(v209 + 16) = xmmword_2355BDD80;
      *(void *)(v209 + 32) = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F102A0]);
      os_log_t v524 = (os_log_t)v209;
      sub_2355BCDD0();
      v511(v524);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v164)(v115, v167);
    }
    uint64_t v192 = v502;
    if (v150 == *MEMORY[0x263F6CA80])
    {
      v517(v495, v516, v504);
      uint64_t v193 = v494;
      v151[2](v494, v115, v152);
      uint64_t v194 = sub_2355BCB60();
      os_log_type_t v195 = sub_2355BCF70();
      if (os_log_type_enabled(v194, v195))
      {
        uint64_t v196 = swift_slowAlloc();
        os_log_t v514 = v114;
        uint64_t v197 = v115;
        uint64_t v198 = v196;
        uint64_t v199 = swift_slowAlloc();
        os_log_t v524 = (os_log_t)v199;
        *(_DWORD *)uint64_t v198 = 136446210;
        os_log_t v518 = (os_log_t)(v198 + 4);
        sub_2355BC860();
        uint64_t v200 = sub_2355BC170();
        uint64_t v201 = v151;
        unint64_t v203 = v202;
        ((void (*)(char *, void *))v521)(v113, v515);
        v522[0] = sub_2355745F0(v200, v203, (uint64_t *)&v524);
        sub_2355BD1B0();
        uint64_t v204 = v197;
        swift_bridgeObjectRelease();
        id v205 = v201[1];
        ((void (*)(char *, uint64_t))v205)(v494, v509);
        _os_log_impl(&dword_23556D000, v194, v195, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, create radio failed", (uint8_t *)v198, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v199, -1, -1);
        MEMORY[0x237DE3BF0](v198, -1, -1);

        v206 = v495;
        uint64_t v207 = v504;
      }
      else
      {
        id v205 = v151[1];
        uint64_t v204 = v115;
        ((void (*)(char *, uint64_t))v205)(v193, v509);

        v206 = v495;
        uint64_t v207 = v153;
      }
      v502(v206, v207);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v242 = swift_allocObject();
      *(_OWORD *)(v242 + 16) = xmmword_2355BDD80;
      id v243 = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F10288]);
LABEL_70:
      *(void *)(v242 + 32) = v243;
      os_log_t v524 = (os_log_t)v242;
      sub_2355BCDD0();
      v511(v524);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v205)(v204, v509);
    }
    if (v150 == *MEMORY[0x263F6CA88])
    {
      v517(v493, v516, v504);
      uint64_t v210 = v492;
      v151[2](v492, v115, v152);
      uint64_t v211 = sub_2355BCB60();
      os_log_type_t v212 = sub_2355BCF70();
      if (os_log_type_enabled(v211, v212))
      {
        uint64_t v213 = swift_slowAlloc();
        os_log_t v514 = v114;
        uint64_t v214 = v115;
        uint64_t v215 = v213;
        uint64_t v216 = swift_slowAlloc();
        os_log_t v524 = (os_log_t)v216;
        *(_DWORD *)uint64_t v215 = 136446210;
        os_log_t v518 = (os_log_t)(v215 + 4);
        sub_2355BC860();
        uint64_t v217 = sub_2355BC170();
        uint64_t v218 = v151;
        unint64_t v220 = v219;
        ((void (*)(char *, void *))v521)(v113, v515);
        v522[0] = sub_2355745F0(v217, v220, (uint64_t *)&v524);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        uint64_t v221 = v218[1];
        uint64_t v222 = v509;
        ((void (*)(char *))v221)(v492);
        _os_log_impl(&dword_23556D000, v211, v212, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, playback device not found", (uint8_t *)v215, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v216, -1, -1);
        uint64_t v223 = v215;
        os_log_type_t v115 = v214;
        MEMORY[0x237DE3BF0](v223, -1, -1);

        os_log_type_t v224 = v493;
        uint64_t v225 = v504;
      }
      else
      {
        uint64_t v258 = v152;
        uint64_t v221 = v151[1];
        uint64_t v222 = v258;
        ((void (*)(char *, uint64_t))v221)(v210, v258);

        os_log_type_t v224 = v493;
        uint64_t v225 = v153;
      }
      v502(v224, v225);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v259 = swift_allocObject();
      *(_OWORD *)(v259 + 16) = xmmword_2355BDD80;
      id v260 = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F10298]);
LABEL_64:
      *(void *)(v259 + 32) = v260;
      os_log_t v524 = (os_log_t)v259;
      sub_2355BCDD0();
      v511(v524);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v221)(v115, v222);
    }
    if (v150 == *MEMORY[0x263F6CA90])
    {
      uint64_t v244 = v491;
      v517(v491, v516, v504);
      uint64_t v245 = v490;
      v151[2](v490, v115, v152);
      uint64_t v246 = sub_2355BCB60();
      os_log_type_t v247 = sub_2355BCF70();
      if (os_log_type_enabled(v246, v247))
      {
        os_log_t v518 = v246;
        uint64_t v248 = swift_slowAlloc();
        os_log_t v514 = v114;
        id v249 = v115;
        v250 = (uint8_t *)v248;
        uint64_t v251 = swift_slowAlloc();
        os_log_t v524 = (os_log_t)v251;
        *(_DWORD *)v250 = 136446210;
        v517 = (void (*)(char *, uint64_t, uint64_t))(v250 + 4);
        sub_2355BC860();
        uint64_t v252 = sub_2355BC170();
        os_log_t v253 = v151;
        unint64_t v255 = v254;
        ((void (*)(char *, void *))v521)(v113, v515);
        v522[0] = sub_2355745F0(v252, v255, (uint64_t *)&v524);
        sub_2355BD1B0();
        uint64_t v204 = v249;
        swift_bridgeObjectRelease();
        id v205 = v253[1];
        ((void (*)(char *, uint64_t))v205)(v245, v509);
        os_log_t v256 = v518;
        _os_log_impl(&dword_23556D000, v518, v247, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, explicit content disabled", v250, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v251, -1, -1);
        MEMORY[0x237DE3BF0](v250, -1, -1);

        uint64_t v257 = v491;
      }
      else
      {
        id v205 = v151[1];
        uint64_t v204 = v115;
        ((void (*)(char *, uint64_t))v205)(v245, v509);

        uint64_t v257 = v244;
      }
      v502(v257, v504);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v242 = swift_allocObject();
      *(_OWORD *)(v242 + 16) = xmmword_2355BDD80;
      id v243 = objc_msgSend(self, sel_unsupportedForReason_, 4);
      goto LABEL_70;
    }
    if (v150 == *MEMORY[0x263F6CA98])
    {
      v517(v489, v516, v504);
      v261 = v485;
      v151[2](v485, v115, v152);
      os_log_type_t v262 = sub_2355BCB60();
      os_log_type_t v263 = sub_2355BCF70();
      BOOL v264 = os_log_type_enabled(v262, v263);
      v466 = v115;
      if (v264)
      {
        isa = (uint8_t *)v262;
        uint64_t v265 = swift_slowAlloc();
        os_log_t v514 = v114;
        v266 = (uint8_t *)v265;
        uint64_t v267 = swift_slowAlloc();
        os_log_t v524 = (os_log_t)v267;
        *(_DWORD *)v266 = 136446210;
        sub_2355BC860();
        uint64_t v268 = sub_2355BC170();
        unint64_t v270 = v269;
        ((void (*)(char *, void *))v521)(v113, v515);
        v522[0] = sub_2355745F0(v268, v270, (uint64_t *)&v524);
        uint64_t v271 = v509;
        uint64_t v153 = v504;
        v272 = v502;
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        uint64_t v273 = (void (*)(char *, char *, uint64_t))*((void *)v519 + 1);
        ((void (*)(char *, uint64_t))v273)(v261, v271);
        uint64_t v274 = isa;
        _os_log_impl(&dword_23556D000, (os_log_t)isa, v263, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, requested content not found", v266, 0xCu);
        swift_arrayDestroy();
        uint64_t v275 = v267;
        uint64_t v192 = v272;
        uint64_t v152 = v271;
        MEMORY[0x237DE3BF0](v275, -1, -1);
        MEMORY[0x237DE3BF0](v266, -1, -1);
      }
      else
      {
        uint64_t v273 = v151[1];
        ((void (*)(char *, uint64_t))v273)(v261, v152);
      }
      v192(v489, v153);
      id v291 = v487;
      char v292 = sub_2355BD020();
      uint64_t v293 = v486;
      if (v292)
      {
        v294 = v483;
        v517(v483, v516, v153);
        swift_bridgeObjectRetain_n();
        uint64_t v295 = sub_2355BCB60();
        os_log_type_t v296 = sub_2355BCF70();
        if (os_log_type_enabled(v295, v296))
        {
          v297 = (_DWORD *)swift_slowAlloc();
          os_log_t v518 = (os_log_t)swift_slowAlloc();
          os_log_t v524 = v518;
          v521 = v273;
          _DWORD *v297 = 136315138;
          v517 = (void (*)(char *, uint64_t, uint64_t))(v297 + 1);
          v298 = (uint8_t *)v297;
          uint64_t v299 = swift_bridgeObjectRetain();
          uint64_t v300 = MEMORY[0x237DE3110](v299, MEMORY[0x263F8D310]);
          unint64_t v302 = v301;
          swift_bridgeObjectRelease();
          v522[0] = sub_2355745F0(v300, v302, (uint64_t *)&v524);
          uint64_t v273 = v521;
          sub_2355BD1B0();
          swift_bridgeObjectRelease_n();
          id v303 = v466;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v295, v296, "INPlayMediaIntentHandler#resolveMediaItems (notFound) got signal indicating invalid AMP token for user(s) - %s", v298, 0xCu);
          os_log_t v304 = v518;
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v304, -1, -1);
          MEMORY[0x237DE3BF0](v298, -1, -1);

          v502(v294, v504);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v192(v294, v153);
          id v303 = v466;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v344 = swift_allocObject();
        *(_OWORD *)(v344 + 16) = xmmword_2355BDD80;
        id v345 = objc_msgSend(self, sel_unsupportedForReason_, 1);
      }
      else if (sub_2355BCFB0())
      {
        v517(v291, v516, v153);
        swift_bridgeObjectRetain_n();
        os_log_type_t v320 = v291;
        uint64_t v321 = sub_2355BCB60();
        os_log_type_t v322 = sub_2355BCF70();
        if (os_log_type_enabled(v321, v322))
        {
          uint64_t v323 = swift_slowAlloc();
          uint64_t v324 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v324;
          v521 = v273;
          *(_DWORD *)uint64_t v323 = 136315138;
          os_log_t v518 = (os_log_t)(v323 + 4);
          uint64_t v325 = swift_bridgeObjectRetain();
          uint64_t v326 = MEMORY[0x237DE3110](v325, MEMORY[0x263F8D310]);
          unint64_t v328 = v327;
          swift_bridgeObjectRelease();
          v522[0] = sub_2355745F0(v326, v328, (uint64_t *)&v524);
          uint64_t v273 = v521;
          sub_2355BD1B0();
          swift_bridgeObjectRelease_n();
          id v303 = v466;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v321, v322, "INPlayMediaIntentHandler#resolveMediaItems (notFound) got signal indicating have AmpError for user(s) - %s", (uint8_t *)v323, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v324, -1, -1);
          MEMORY[0x237DE3BF0](v323, -1, -1);

          v502(v487, v504);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v192(v320, v153);
          id v303 = v466;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v344 = swift_allocObject();
        *(_OWORD *)(v344 + 16) = xmmword_2355BDD80;
        id v345 = objc_msgSend(self, sel_unsupportedForReason_, 7);
      }
      else
      {
        if ((sub_2355BD010() & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
          uint64_t v405 = swift_allocObject();
          *(_OWORD *)(v405 + 16) = xmmword_2355BDD80;
          sub_23557DC00(0, &qword_26880C8C0);
          *(void *)(v405 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
          os_log_t v524 = (os_log_t)v405;
          sub_2355BCDD0();
          v511(v524);
          swift_bridgeObjectRelease();
          v406 = v466;
          return ((uint64_t (*)(char *, uint64_t))v273)(v406, v152);
        }
        v517(v293, v516, v153);
        swift_bridgeObjectRetain_n();
        v365 = v293;
        v366 = sub_2355BCB60();
        os_log_type_t v367 = sub_2355BCF50();
        if (os_log_type_enabled(v366, v367))
        {
          uint64_t v368 = swift_slowAlloc();
          uint64_t v369 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v369;
          v521 = v273;
          *(_DWORD *)uint64_t v368 = 136315138;
          os_log_t v518 = (os_log_t)(v368 + 4);
          uint64_t v370 = swift_bridgeObjectRetain();
          uint64_t v371 = MEMORY[0x237DE3110](v370, MEMORY[0x263F8D310]);
          unint64_t v373 = v372;
          swift_bridgeObjectRelease();
          v522[0] = sub_2355745F0(v371, v373, (uint64_t *)&v524);
          uint64_t v273 = v521;
          sub_2355BD1B0();
          swift_bridgeObjectRelease_n();
          id v303 = v466;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v366, v367, "INPlayMediaIntentHandler#resolveMediaItems (notFound) got signal indicating unsafe self harm query - %s", (uint8_t *)v368, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v369, -1, -1);
          MEMORY[0x237DE3BF0](v368, -1, -1);

          v502(v486, v504);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v192(v365, v153);
          id v303 = v466;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v344 = swift_allocObject();
        *(_OWORD *)(v344 + 16) = xmmword_2355BDD80;
        sub_23557DC00(0, &qword_26880C8C0);
        id v345 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      }
      *(void *)(v344 + 32) = v345;
      os_log_t v524 = (os_log_t)v344;
      sub_2355BCDD0();
      v511(v524);
      swift_bridgeObjectRelease();
      v406 = v303;
      return ((uint64_t (*)(char *, uint64_t))v273)(v406, v152);
    }
    if (v150 == *MEMORY[0x263F6CA68])
    {
      v517(v484, v516, v504);
      v276 = v482;
      v151[2](v482, v115, v152);
      uint64_t v277 = sub_2355BCB60();
      os_log_type_t v278 = sub_2355BCF70();
      BOOL v279 = os_log_type_enabled(v277, v278);
      v466 = v115;
      if (v279)
      {
        os_log_t v514 = v277;
        uint64_t v280 = (uint8_t *)swift_slowAlloc();
        uint64_t v281 = swift_slowAlloc();
        os_log_t v524 = (os_log_t)v281;
        isa = v280;
        *(_DWORD *)uint64_t v280 = 136446210;
        sub_2355BC860();
        uint64_t v282 = sub_2355BC170();
        unint64_t v284 = v283;
        ((void (*)(char *, void *))v521)(v113, v515);
        v522[0] = sub_2355745F0(v282, v284, (uint64_t *)&v524);
        uint64_t v285 = v509;
        uint64_t v153 = v504;
        uint64_t v286 = v502;
        sub_2355BD1B0();
        uint64_t v287 = v519;
        swift_bridgeObjectRelease();
        v521 = (void (*)(char *, char *, uint64_t))*((void *)v287 + 1);
        ((void (*)(char *, uint64_t))v521)(v276, v285);
        uint64_t v289 = isa;
        os_log_t v288 = v514;
        _os_log_impl(&dword_23556D000, v514, v278, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, empty library", isa, 0xCu);
        swift_arrayDestroy();
        uint64_t v290 = v281;
        uint64_t v192 = v286;
        uint64_t v152 = v285;
        MEMORY[0x237DE3BF0](v290, -1, -1);
        MEMORY[0x237DE3BF0](v289, -1, -1);

        v286(v484, v153);
      }
      else
      {
        v521 = v151[1];
        ((void (*)(char *, uint64_t))v521)(v276, v152);

        v192(v484, v153);
      }
      uint64_t v329 = v503;
      if (sub_2355BD020())
      {
        uint64_t v330 = v481;
        v517(v481, v516, v153);
        swift_bridgeObjectRetain_n();
        v331 = sub_2355BCB60();
        os_log_type_t v332 = sub_2355BCF70();
        if (os_log_type_enabled(v331, v332))
        {
          uint64_t v333 = v153;
          uint64_t v334 = swift_slowAlloc();
          uint64_t v335 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v335;
          *(_DWORD *)uint64_t v334 = 136315138;
          os_log_t v518 = (os_log_t)(v334 + 4);
          uint64_t v336 = swift_bridgeObjectRetain();
          uint64_t v337 = v152;
          uint64_t v338 = MEMORY[0x237DE3110](v336, MEMORY[0x263F8D310]);
          unint64_t v340 = v339;
          swift_bridgeObjectRelease();
          uint64_t v341 = v338;
          uint64_t v152 = v337;
          v522[0] = sub_2355745F0(v341, v340, (uint64_t *)&v524);
          sub_2355BD1B0();
          swift_bridgeObjectRelease_n();
          v342 = v466;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v331, v332, "INPlayMediaIntentHandler#resolveMediaItems (emptyLibrary) got signal indicating invalid AMP token for user(s) - %s", (uint8_t *)v334, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v335, -1, -1);
          MEMORY[0x237DE3BF0](v334, -1, -1);

          v502(v481, v333);
          v343 = v521;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v192(v330, v153);
          v343 = v521;
          v342 = v466;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v387 = swift_allocObject();
        *(_OWORD *)(v387 + 16) = xmmword_2355BDD80;
        id v388 = objc_msgSend(self, sel_unsupportedForReason_, 1);
LABEL_127:
        *(void *)(v387 + 32) = v388;
        os_log_t v524 = (os_log_t)v387;
        sub_2355BCDD0();
        v511(v524);
        swift_bridgeObjectRelease();
        return ((uint64_t (*)(char *, uint64_t))v343)(v342, v152);
      }
      if (sub_2355BCFB0())
      {
        uint64_t v374 = v478;
        v517(v478, v516, v153);
        swift_bridgeObjectRetain_n();
        v375 = sub_2355BCB60();
        os_log_type_t v376 = sub_2355BCF70();
        if (os_log_type_enabled(v375, v376))
        {
          uint64_t v377 = v153;
          uint64_t v378 = swift_slowAlloc();
          uint64_t v379 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v379;
          *(_DWORD *)uint64_t v378 = 136315138;
          os_log_t v518 = (os_log_t)(v378 + 4);
          uint64_t v380 = swift_bridgeObjectRetain();
          uint64_t v381 = v152;
          uint64_t v382 = MEMORY[0x237DE3110](v380, MEMORY[0x263F8D310]);
          unint64_t v384 = v383;
          swift_bridgeObjectRelease();
          uint64_t v385 = v382;
          uint64_t v152 = v381;
          v522[0] = sub_2355745F0(v385, v384, (uint64_t *)&v524);
          sub_2355BD1B0();
          swift_bridgeObjectRelease_n();
          v342 = v466;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v375, v376, "INPlayMediaIntentHandler#resolveMediaItems (emptyLibrary) got signal indicating have AmpError for user(s) - %s", (uint8_t *)v378, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v379, -1, -1);
          MEMORY[0x237DE3BF0](v378, -1, -1);

          v502(v478, v377);
          v343 = v521;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v192(v374, v153);
          v343 = v521;
          v342 = v466;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v387 = swift_allocObject();
        *(_OWORD *)(v387 + 16) = xmmword_2355BDD80;
        id v388 = objc_msgSend(self, sel_unsupportedForReason_, 7);
        goto LABEL_127;
      }
      if (sub_2355BD010())
      {
        v407 = v472;
        v517(v472, v516, v153);
        swift_bridgeObjectRetain_n();
        v408 = sub_2355BCB60();
        os_log_type_t v409 = sub_2355BCF50();
        if (os_log_type_enabled(v408, v409))
        {
          uint64_t v410 = v153;
          uint64_t v411 = swift_slowAlloc();
          uint64_t v412 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v412;
          *(_DWORD *)uint64_t v411 = 136315138;
          os_log_t v518 = (os_log_t)(v411 + 4);
          uint64_t v413 = swift_bridgeObjectRetain();
          uint64_t v414 = v152;
          uint64_t v415 = MEMORY[0x237DE3110](v413, MEMORY[0x263F8D310]);
          unint64_t v417 = v416;
          swift_bridgeObjectRelease();
          uint64_t v418 = v415;
          uint64_t v152 = v414;
          v522[0] = sub_2355745F0(v418, v417, (uint64_t *)&v524);
          sub_2355BD1B0();
          swift_bridgeObjectRelease_n();
          v342 = v466;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v408, v409, "INPlayMediaIntentHandler#resolveMediaItems (emptyLibrary) got signal indicating unsafe self harm query - %s", (uint8_t *)v411, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v412, -1, -1);
          MEMORY[0x237DE3BF0](v411, -1, -1);

          v502(v472, v410);
          v343 = v521;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v192(v407, v153);
          v343 = v521;
          v342 = v466;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v387 = swift_allocObject();
        *(_OWORD *)(v387 + 16) = xmmword_2355BDD80;
        sub_23557DC00(0, &qword_26880C8C0);
        id v388 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
        goto LABEL_127;
      }
      v427 = (void **)(v471 + 16);
      swift_beginAccess();
      v428 = *v427;
      if (v428)
      {
        v429 = v470;
        v517(v470, v516, v153);
        v430 = v428;
        v431 = sub_2355BCB60();
        os_log_type_t v432 = sub_2355BCF80();
        BOOL v433 = os_log_type_enabled(v431, v432);
        v515 = v430;
        if (v433)
        {
          v434 = (uint8_t *)swift_slowAlloc();
          uint64_t v435 = swift_slowAlloc();
          uint64_t v523 = v435;
          *(_DWORD *)v434 = 136446210;
          id v436 = objc_msgSend(v430, sel_identifier);
          if (v436)
          {
            v437 = v436;
            uint64_t v438 = sub_2355BCC50();
            uint64_t v440 = v439;
          }
          else
          {
            uint64_t v438 = 0;
            uint64_t v440 = 0;
          }
          v522[0] = v438;
          v522[1] = v440;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
          uint64_t v446 = sub_2355BCC60();
          v522[0] = sub_2355745F0(v446, v447, &v523);
          sub_2355BD1B0();
          v430 = v515;

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v431, v432, "INPlayMediaIntentHandler#resolveMediaItems fallback item available for implicit recommendation: %{public}s", v434, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v435, -1, -1);
          MEMORY[0x237DE3BF0](v434, -1, -1);

          v192(v470, v153);
          uint64_t v152 = v509;
          uint64_t v329 = v503;
        }
        else
        {

          v192(v429, v153);
        }
        id v448 = objc_msgSend(v329, sel_backingStore);
        self;
        uint64_t v449 = swift_dynamicCastObjCClass();
        if (v449)
        {
          v450 = (void *)v449;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
          uint64_t v451 = swift_allocObject();
          *(_OWORD *)(v451 + 16) = xmmword_2355BDD80;
          *(void *)(v451 + 32) = v430;
          v522[0] = v451;
          sub_2355BCDD0();
          sub_23557DC00(0, &qword_26880C6D0);
          v452 = v430;
          uint64_t v453 = sub_2355BCD90();
          swift_bridgeObjectRelease();
          objc_msgSend(v450, sel_setMediaItems_, v453);

          id v448 = (id)v453;
          uint64_t v329 = v503;
        }

        sub_2355BD0C0();
        v454 = v468;
        v517(v468, v516, v153);
        id v455 = v329;
        v456 = sub_2355BCB60();
        os_log_type_t v457 = sub_2355BCF80();
        if (os_log_type_enabled(v456, v457))
        {
          v458 = (uint8_t *)swift_slowAlloc();
          uint64_t v459 = swift_slowAlloc();
          v522[0] = v459;
          *(_DWORD *)v458 = 136446210;
          uint64_t v460 = sub_2355BCFE0();
          uint64_t v523 = sub_2355745F0(v460, v461, v522);
          v462 = v466;
          sub_2355BD1B0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v456, v457, "INPlayMediaIntentHandler#resolveMediaItems restarting resolveMediaItems with intent: %{public}s", v458, 0xCu);
          swift_arrayDestroy();
          uint64_t v463 = v459;
          uint64_t v152 = v509;
          MEMORY[0x237DE3BF0](v463, -1, -1);
          MEMORY[0x237DE3BF0](v458, -1, -1);

          v502(v454, v504);
          v464 = v521;
        }
        else
        {

          v502(v454, v153);
          v464 = v521;
          v462 = v466;
        }
        INPlayMediaIntentHandler.resolveMediaItems(for:with:)(v455, v511, v510);

        return ((uint64_t (*)(char *, uint64_t))v464)(v462, v152);
      }
      else
      {
        v441 = v467;
        v517(v467, v516, v153);
        v442 = sub_2355BCB60();
        os_log_type_t v443 = sub_2355BCF70();
        if (os_log_type_enabled(v442, v443))
        {
          v444 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v444 = 0;
          _os_log_impl(&dword_23556D000, v442, v443, "INPlayMediaIntentHandler#resolveMediaItems no fallback search item available for empty library result", v444, 2u);
          MEMORY[0x237DE3BF0](v444, -1, -1);
        }

        v192(v441, v153);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v445 = swift_allocObject();
        *(_OWORD *)(v445 + 16) = xmmword_2355BDD80;
        *(void *)(v445 + 32) = objc_msgSend(self, sel_unsupportedForReason_, *MEMORY[0x263F10290]);
        v522[0] = v445;
        sub_2355BCDD0();
        v511((os_log_t)v522[0]);
        swift_bridgeObjectRelease();
        return ((uint64_t (*)(char *, uint64_t))v521)(v466, v152);
      }
    }
    else
    {
      if (v150 == *MEMORY[0x263F6CA70])
      {
        uint64_t v305 = v480;
        v517(v480, v516, v504);
        id v306 = v479;
        v151[2](v479, v115, v152);
        v307 = sub_2355BCB60();
        os_log_type_t v308 = sub_2355BCF70();
        if (os_log_type_enabled(v307, v308))
        {
          os_log_t v518 = v307;
          uint64_t v309 = swift_slowAlloc();
          os_log_t v514 = v114;
          v310 = v115;
          char v311 = (uint8_t *)v309;
          uint64_t v312 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v312;
          *(_DWORD *)char v311 = 136446210;
          v517 = (void (*)(char *, uint64_t, uint64_t))(v311 + 4);
          sub_2355BC860();
          uint64_t v313 = sub_2355BC170();
          os_log_type_t v314 = v151;
          unint64_t v316 = v315;
          ((void (*)(char *, void *))v521)(v113, v515);
          v522[0] = sub_2355745F0(v313, v316, (uint64_t *)&v524);
          sub_2355BD1B0();
          swift_bridgeObjectRelease();
          uint64_t v221 = v314[1];
          uint64_t v222 = v509;
          ((void (*)(char *))v221)(v306);
          os_log_t v317 = v518;
          _os_log_impl(&dword_23556D000, v518, v308, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, need network to play content", v311, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v312, -1, -1);
          uint64_t v318 = v311;
          os_log_type_t v115 = v310;
          MEMORY[0x237DE3BF0](v318, -1, -1);

          v319 = v480;
        }
        else
        {
          uint64_t v386 = v152;
          uint64_t v221 = v151[1];
          uint64_t v222 = v386;
          ((void (*)(char *, uint64_t))v221)(v306, v386);

          v319 = v305;
        }
        v502(v319, v504);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v259 = swift_allocObject();
        *(_OWORD *)(v259 + 16) = xmmword_2355BDD80;
        id v260 = objc_msgSend(self, sel_unsupportedForReason_, 5);
        goto LABEL_64;
      }
      v346 = (void (**)(char *, char *, uint64_t))(v519 + 16);
      if (v150 == *MEMORY[0x263F6CA78])
      {
        v347 = v476;
        v517(v476, v516, v504);
        v348 = v473;
        (*v346)(v473, v115, v152);
        v349 = sub_2355BCB60();
        os_log_type_t v350 = sub_2355BCF70();
        if (os_log_type_enabled(v349, v350))
        {
          os_log_t v518 = v349;
          uint64_t v351 = swift_slowAlloc();
          os_log_t v514 = v114;
          v352 = v115;
          v353 = (uint8_t *)v351;
          uint64_t v354 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v354;
          *(_DWORD *)v353 = 136446210;
          v517 = (void (*)(char *, uint64_t, uint64_t))(v353 + 4);
          sub_2355BC860();
          uint64_t v355 = sub_2355BC170();
          v356 = v151;
          unint64_t v358 = v357;
          ((void (*)(char *, void *))v521)(v113, v515);
          v522[0] = sub_2355745F0(v355, v358, (uint64_t *)&v524);
          sub_2355BD1B0();
          v359 = v352;
          swift_bridgeObjectRelease();
          v360 = v356[1];
          v361 = v348;
          uint64_t v362 = v509;
          ((void (*)(char *, uint64_t))v360)(v361, v509);
          os_log_t v363 = v518;
          _os_log_impl(&dword_23556D000, v518, v350, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, need subscription to play podcast content", v353, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v354, -1, -1);
          MEMORY[0x237DE3BF0](v353, -1, -1);

          v364 = v476;
        }
        else
        {
          v360 = v151[1];
          v359 = v115;
          v419 = v348;
          uint64_t v362 = v509;
          ((void (*)(char *, uint64_t))v360)(v419, v509);

          v364 = v347;
        }
        v502(v364, v504);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v420 = swift_allocObject();
        *(_OWORD *)(v420 + 16) = xmmword_2355BDD80;
        *(void *)(v420 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 2);
        os_log_t v524 = (os_log_t)v420;
        sub_2355BCDD0();
        v511(v524);
        swift_bridgeObjectRelease();
        return ((uint64_t (*)(char *, uint64_t))v360)(v359, v362);
      }
      else
      {
        uint64_t v389 = v504;
        v390 = v477;
        v517(v477, v516, v504);
        v391 = *v346;
        v392 = v115;
        v393 = v474;
        uint64_t v394 = v389;
        v466 = v392;
        ((void (*)(char *))v391)(v474);
        v395 = sub_2355BCB60();
        os_log_type_t v396 = sub_2355BCF70();
        if (os_log_type_enabled(v395, v396))
        {
          v397 = v393;
          v398 = (uint8_t *)swift_slowAlloc();
          uint64_t v399 = swift_slowAlloc();
          os_log_t v524 = (os_log_t)v399;
          *(_DWORD *)v398 = 136446210;
          sub_2355BC860();
          uint64_t v400 = sub_2355BC170();
          unint64_t v402 = v401;
          ((void (*)(char *, void *))v521)(v508, v515);
          v522[0] = sub_2355745F0(v400, v402, (uint64_t *)&v524);
          sub_2355BD1B0();
          swift_bridgeObjectRelease();
          v403 = (char *)*((void *)v519 + 1);
          os_log_t v518 = (os_log_t)((unint64_t)(v519 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
          v519 = v403;
          ((void (*)(char *, uint64_t))v403)(v397, v509);
          _os_log_impl(&dword_23556D000, v395, v396, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, returning temporary failure type: restrictedContent", v398, 0xCu);
          swift_arrayDestroy();
          uint64_t v404 = v399;
          os_log_type_t v113 = v508;
          MEMORY[0x237DE3BF0](v404, -1, -1);
          MEMORY[0x237DE3BF0](v398, -1, -1);

          v502(v477, v504);
        }
        else
        {
          v421 = (char *)*((void *)v519 + 1);
          os_log_t v518 = (os_log_t)((unint64_t)(v519 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
          v519 = v421;
          ((void (*)(char *, uint64_t))v421)(v393, v509);

          v192(v390, v394);
        }
        v520 = sub_2355BC640();
        v422 = v466;
        sub_2355BC860();
        sub_2355BC170();
        v423 = v515;
        v424 = v521;
        ((void (*)(char *, void *))v521)(v113, v515);
        os_log_t v524 = 0;
        unint64_t v525 = 0xE000000000000000;
        sub_2355BD220();
        sub_2355BCCD0();
        v425 = v475;
        sub_2355BC860();
        sub_2355BC170();
        ((void (*)(char *, void *))v424)(v425, v423);
        sub_2355BCCD0();
        swift_bridgeObjectRelease();
        sub_2355BC630();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
        uint64_t v426 = swift_allocObject();
        *(_OWORD *)(v426 + 16) = xmmword_2355BDD80;
        *(void *)(v426 + 32) = objc_msgSend(self, sel_unsupportedForReason_, 6);
        os_log_t v524 = (os_log_t)v426;
        sub_2355BCDD0();
        v511(v524);
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v519)(v422, v509);
        return ((uint64_t (*)(char *, void *))v424)(v498, v423);
      }
    }
  }
  else
  {
    v519 = *v40;
    sub_2355BD150();
    id v135 = v503;
    if (qword_26880C118 != -1) {
      swift_once();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C908);
    uint64_t v136 = swift_allocObject();
    *(_OWORD *)(v136 + 16) = xmmword_2355BDD10;
    *(void *)(v136 + 56) = MEMORY[0x263F8D310];
    *(void *)(v136 + 64) = sub_2355BBCD8();
    *(void *)(v136 + 32) = 0x73736563637573;
    *(void *)(v136 + 40) = 0xE700000000000000;
    uint64_t v137 = v512;
    sub_2355BCB40();
    sub_2355BCB10();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, os_log_t))isa + 1))(v137, v514);
    id v138 = objc_msgSend(v135, sel_intentId);
    unint64_t v139 = (unint64_t)v517;
    uint64_t v140 = v516;
    if (!v138)
    {
      v517(v501, v516, v41);
      unint64_t v170 = sub_2355BCB60();
      os_log_type_t v171 = sub_2355BCF70();
      BOOL v172 = os_log_type_enabled(v170, v171);
      uint64_t v148 = (uint64_t)v506;
      if (v172)
      {
        os_log_type_t v173 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v173 = 0;
        _os_log_impl(&dword_23556D000, v170, v171, "INPlayMediaIntentHandler#resolveMediaItems NO intentId for intent - not tracking continuation", v173, 2u);
        MEMORY[0x237DE3BF0](v173, -1, -1);
      }

      v99(v501, v41);
      goto LABEL_28;
    }
    id v141 = v138;
    id v142 = sub_2355BCC50();
    uint64_t v144 = v143;

    ((void (*)(char *, uint64_t, uint64_t))v139)(v505, v140, v41);
    uint64_t v145 = sub_2355BCB60();
    os_log_type_t v146 = sub_2355BCF50();
    if (os_log_type_enabled(v145, v146))
    {
      uint64_t v147 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v147 = 0;
      _os_log_impl(&dword_23556D000, v145, v146, "INPlayMediaIntentHandler#resolveMediaItems FOUND intentId for intent - tracking continuation", v147, 2u);
      MEMORY[0x237DE3BF0](v147, -1, -1);
    }

    v99(v505, v41);
    uint64_t v148 = (uint64_t)v506;
    if (qword_26880C180 != -1) {
      swift_once();
    }
    if (v519) {
      goto LABEL_21;
    }
    if (qword_26880C188 != -1) {
      goto LABEL_134;
    }
    while (1)
    {
      swift_retain();
LABEL_21:
      os_log_t v524 = v142;
      unint64_t v525 = (unint64_t)v144;
      swift_retain();
      sub_2355BC420();
LABEL_28:
      ((void (*)(uint64_t, uint64_t, uint64_t))v139)(v148, v140, v41);
      unint64_t v139 = (unint64_t)v521;
      swift_bridgeObjectRetain_n();
      id v142 = sub_2355BCB60();
      int v174 = sub_2355BCF80();
      if (!os_log_type_enabled(v142, (os_log_type_t)v174))
      {

        swift_bridgeObjectRelease_n();
        v99((char *)v148, v41);
        goto LABEL_56;
      }
      uint64_t v144 = (uint8_t *)swift_slowAlloc();
      uint64_t v148 = swift_slowAlloc();
      os_log_t v524 = (os_log_t)v148;
      *(_DWORD *)uint64_t v144 = 136446210;
      if (v139 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v175 = sub_2355BD280();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v175 = *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v140 = MEMORY[0x263F8EE78];
      LODWORD(v518) = v174;
      v517 = (void (*)(char *, uint64_t, uint64_t))v148;
      if (!v175) {
        break;
      }
      v522[0] = MEMORY[0x263F8EE78];
      sub_2355B73B0(0, v175 & ~(v175 >> 63), 0);
      if ((v175 & 0x8000000000000000) == 0)
      {
        v502 = v99;
        uint64_t v504 = v41;
        uint64_t v140 = v522[0];
        if ((v139 & 0xC000000000000001) != 0)
        {
          uint64_t v176 = 0;
          do
          {
            MEMORY[0x237DE35A0](v176, v521);
            uint64_t v177 = sub_2355BCEE0();
            uint64_t v179 = v178;
            swift_unknownObjectRelease();
            v522[0] = v140;
            unint64_t v181 = *(void *)(v140 + 16);
            unint64_t v180 = *(void *)(v140 + 24);
            if (v181 >= v180 >> 1)
            {
              sub_2355B73B0(v180 > 1, v181 + 1, 1);
              uint64_t v140 = v522[0];
            }
            ++v176;
            *(void *)(v140 + 16) = v181 + 1;
            uint64_t v182 = v140 + 16 * v181;
            *(void *)(v182 + 32) = v177;
            *(void *)(v182 + 40) = v179;
          }
          while (v175 != v176);
        }
        else
        {
          id v226 = (id *)(v139 + 32);
          do
          {
            id v227 = *v226;
            uint64_t v228 = sub_2355BCEE0();
            uint64_t v230 = v229;

            v522[0] = v140;
            unint64_t v232 = *(void *)(v140 + 16);
            unint64_t v231 = *(void *)(v140 + 24);
            if (v232 >= v231 >> 1)
            {
              sub_2355B73B0(v231 > 1, v232 + 1, 1);
              uint64_t v140 = v522[0];
            }
            *(void *)(v140 + 16) = v232 + 1;
            uint64_t v233 = v140 + 16 * v232;
            *(void *)(v233 + 32) = v228;
            *(void *)(v233 + 40) = v230;
            ++v226;
            --v175;
          }
          while (v175);
        }
        uint64_t v41 = v504;
        uint64_t v99 = v502;
        break;
      }
      __break(1u);
LABEL_134:
      swift_once();
    }
    uint64_t v234 = MEMORY[0x237DE3110](v140, MEMORY[0x263F8D310]);
    unint64_t v236 = v235;
    swift_bridgeObjectRelease();
    v522[0] = sub_2355745F0(v234, v236, (uint64_t *)&v524);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v142, (os_log_type_t)v518, "INPlayMediaIntentHandler#resolveMediaItems completed successfully with items: %{public}s", v144, 0xCu);
    uint64_t v237 = v517;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v237, -1, -1);
    MEMORY[0x237DE3BF0](v144, -1, -1);

    v99(v506, v41);
LABEL_56:
    uint64_t v238 = self;
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    uint64_t v239 = (void *)sub_2355BCD90();
    id v240 = objc_msgSend(v238, sel_successesWithResolvedMediaItems_, v239);

    sub_23557DC00(0, &qword_26880C8C0);
    uint64_t v241 = sub_2355BCDB0();

    v511((os_log_t)v241);
    swift_bridgeObjectRelease();
    return swift_release();
  }
}

uint64_t sub_2355AF38C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2355AF404(uint64_t a1, uint64_t a2)
{
  sub_23557DC00(0, &qword_26880C8C0);
  id v3 = (id)sub_2355BCD90();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

uint64_t sub_2355AF480(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v60 = a3;
  uint64_t v61 = a2;
  uint64_t v4 = sub_2355BC320();
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v55 = (char *)v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v57 = (char *)v53 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v53 - v9;
  uint64_t v11 = sub_2355BCB80();
  uint64_t v62 = *(void *)(v11 - 8);
  uint64_t v63 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v59 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v58 = (char *)v53 - v14;
  uint64_t v15 = sub_2355BC690();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v53 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C320);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23557DFE4(a1, (uint64_t)v24, (uint64_t *)&unk_26880C320);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v24, v15);
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v25 = v63;
    uint64_t v26 = __swift_project_value_buffer(v63, (uint64_t)qword_26880D108);
    uint64_t v27 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v58, v26, v25);
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    uint64_t v59 = v21;
    v28(v19, v21, v15);
    uint64_t v29 = sub_2355BCB60();
    os_log_type_t v30 = sub_2355BCF70();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = (char *)swift_slowAlloc();
      uint64_t v65 = v57;
      *(_DWORD *)uint64_t v31 = 136446210;
      sub_2355B9854((unint64_t *)&unk_26880C340, MEMORY[0x263F6CBB0]);
      uint64_t v32 = sub_2355BD320();
      uint64_t v64 = sub_2355745F0(v32, v33, (uint64_t *)&v65);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      uint64_t v34 = *(void (**)(char *, uint64_t))(v16 + 8);
      v34(v19, v15);
      _os_log_impl(&dword_23556D000, v29, v30, "INPlayMediaIntentHandler: resolveNowPlayingMediaItem nowPlaying item error: %{public}s", v31, 0xCu);
      uint64_t v35 = v57;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v35, -1, -1);
      MEMORY[0x237DE3BF0](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v58, v63);
    }
    else
    {
      uint64_t v34 = *(void (**)(char *, uint64_t))(v16 + 8);
      v34(v19, v15);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v58, v25);
    }
    v61(0);
    return ((uint64_t (*)(char *, uint64_t))v34)(v59, v15);
  }
  else
  {
    uint64_t v36 = v56;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v10, v24, v4);
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v37 = v63;
    uint64_t v38 = __swift_project_value_buffer(v63, (uint64_t)qword_26880D108);
    uint64_t v39 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v59, v38, v37);
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
    uint64_t v41 = v57;
    uint64_t v58 = v10;
    v40(v57, v10, v4);
    uint64_t v42 = sub_2355BCB60();
    os_log_type_t v43 = sub_2355BCF80();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v65 = (char *)v54;
      *(_DWORD *)uint64_t v44 = 136446210;
      v53[1] = v44 + 4;
      v40(v55, v41, v4);
      uint64_t v45 = sub_2355BCC60();
      uint64_t v64 = sub_2355745F0(v45, v46, (uint64_t *)&v65);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      uint64_t v57 = *(char **)(v36 + 8);
      ((void (*)(char *, uint64_t))v57)(v41, v4);
      uint64_t v47 = v4;
      _os_log_impl(&dword_23556D000, v42, v43, "INPlayMediaIntentHandler: resolveNowPlayingMediaItem now playing: %{public}s", v44, 0xCu);
      uint64_t v48 = v54;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v48, -1, -1);
      MEMORY[0x237DE3BF0](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v62 + 8))(v59, v63);
    }
    else
    {
      uint64_t v57 = *(char **)(v36 + 8);
      ((void (*)(char *, uint64_t))v57)(v41, v4);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v59, v37);
      uint64_t v47 = v4;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    uint64_t v51 = v58;
    sub_2355BC2E0();
    sub_2355BC2B0();
    uint64_t v52 = sub_2355BCEC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v50 + 32) = v52;
    uint64_t v65 = (char *)v50;
    sub_2355BCDD0();
    v61(v65);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v57)(v51, v47);
  }
}

uint64_t INPlayMediaIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a1;
  uint64_t v35 = sub_2355BCB50();
  uint64_t v33 = *(void *)(v35 - 8);
  uint64_t v5 = *(void *)(v33 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v35);
  uint64_t v7 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v32 = (char *)&v31 - v8;
  uint64_t v9 = sub_2355BCB80();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v9, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  uint64_t v14 = sub_2355BCB60();
  os_log_type_t v15 = sub_2355BCF80();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = a3;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_23556D000, v14, v15, "INPlayMediaIntentHandler#handle...", v17, 2u);
    uint64_t v18 = v17;
    a3 = v16;
    MEMORY[0x237DE3BF0](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = a3;
  uint64_t v20 = qword_26880C118;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  id v21 = (id)logObject;
  uint64_t v22 = v32;
  sub_2355BCB30();
  uint64_t v23 = v33;
  uint64_t v24 = v35;
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v7, v22, v35);
  unint64_t v25 = (*(unsigned __int8 *)(v23 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  unint64_t v26 = (v5 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = "playMediaIntentHandlerHandle";
  *(void *)(v27 + 24) = 28;
  *(unsigned char *)(v27 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v27 + v25, v7, v24);
  uint64_t v28 = (void *)(v27 + v26);
  *uint64_t v28 = sub_23559A27C;
  v28[1] = v19;
  swift_retain();
  sub_2355BD140();
  sub_2355BCB10();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_2355B90E0;
  *(void *)(v29 + 24) = v27;
  MEMORY[0x270FA5388](v29);
  sub_23557DC00(0, &qword_26880C7B0);
  swift_retain();
  sub_2355BC0D0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v35);
  return swift_release();
}

void sub_2355B0198(void (*a1)(id *), uint64_t a2, void *a3, void *a4)
{
  uint64_t v88 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C8C8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (void *)((char *)v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C880);
  uint64_t v87 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v87 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v83 = (void *)((char *)v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  uint64_t v84 = (void *)((char *)v82 - v13);
  uint64_t v14 = sub_2355BCB80();
  uint64_t v85 = *(void *)(v14 - 8);
  uint64_t v86 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)v82 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v82 - v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a1;
  *(void *)(v23 + 24) = a2;
  swift_retain();
  uint64_t v89 = a3;
  id v24 = objc_msgSend(a3, sel_mediaItems);
  if (!v24)
  {
    swift_release();
    if (qword_26880C108 == -1)
    {
LABEL_15:
      uint64_t v42 = v86;
      uint64_t v43 = __swift_project_value_buffer(v86, (uint64_t)qword_26880D108);
      uint64_t v44 = v85;
      (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v22, v43, v42);
      uint64_t v45 = sub_2355BCB60();
      os_log_type_t v46 = sub_2355BCF70();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v47 = 0;
        _os_log_impl(&dword_23556D000, v45, v46, "INPlayMediaIntentHandler#handle Unexpected nil or empty items in handle", v47, 2u);
        MEMORY[0x237DE3BF0](v47, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v44 + 8))(v22, v42);
      id v48 = objc_allocWithZone(MEMORY[0x263F08D38]);
      uint64_t v49 = (void *)sub_2355BCC40();
      id v50 = objc_msgSend(v48, sel_initWithActivityType_, v49);

      id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD50]), sel_initWithCode_userActivity_, 6, v50);
      id v90 = v41;
      goto LABEL_29;
    }
LABEL_37:
    swift_once();
    goto LABEL_15;
  }
  unint64_t v25 = v24;
  v82[1] = a2;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v26 = sub_2355BCDB0();

  if (!(v26 >> 62))
  {
    uint64_t v22 = *(char **)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v22) {
      goto LABEL_4;
    }
LABEL_23:
    swift_bridgeObjectRelease_n();
    uint64_t v52 = 0;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = (char *)sub_2355BD280();
  if (!v22) {
    goto LABEL_23;
  }
LABEL_4:
  v82[0] = a1;
  a1 = (void (*)(id *))(v26 & 0xC000000000000001);
  if ((v26 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v27 = *(id *)(v26 + 32);
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_37;
  }
  id v27 = (id)MEMORY[0x237DE35A0](0, v26);
LABEL_7:
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(v28, sel_type);

  if (v29 == (id)18 && (sub_2355BD050() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v30 = v86;
    uint64_t v31 = __swift_project_value_buffer(v86, (uint64_t)qword_26880D108);
    uint64_t v32 = v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v17, v31, v30);
    uint64_t v33 = sub_2355BCB60();
    os_log_type_t v34 = sub_2355BCF70();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = (void (*)(id *))v82[0];
    if (v35)
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_23556D000, v33, v34, "INPlayMediaIntentHandler#convert Unexpected music result for news podcast request", v37, 2u);
      MEMORY[0x237DE3BF0](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v32 + 8))(v17, v30);
    id v38 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v39 = (void *)sub_2355BCC40();
    id v40 = objc_msgSend(v38, sel_initWithActivityType_, v39);

    id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD50]), sel_initWithCode_userActivity_, 6, v40);
    id v90 = v41;
    v36(&v90);
    goto LABEL_30;
  }
  if (a1)
  {
    id v51 = (id)MEMORY[0x237DE35A0](0, v26);
  }
  else
  {
    if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_40;
    }
    id v51 = *(id *)(v26 + 32);
  }
  uint64_t v52 = v51;
  swift_bridgeObjectRelease();
  a1 = (void (*)(id *))v82[0];
LABEL_24:
  uint64_t v53 = v89;
  sub_2355B3764(v52, v89, v9);

  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v87 + 48))(v9, 1, v10) == 1)
  {
    swift_release();
    sub_23557DE84((uint64_t)v9, (uint64_t *)&unk_26880C8C8);
    if (qword_26880C108 == -1)
    {
LABEL_26:
      uint64_t v54 = v86;
      uint64_t v55 = __swift_project_value_buffer(v86, (uint64_t)qword_26880D108);
      uint64_t v56 = v85;
      (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v20, v55, v54);
      uint64_t v57 = sub_2355BCB60();
      os_log_type_t v58 = sub_2355BCF50();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v59 = 0;
        _os_log_impl(&dword_23556D000, v57, v58, "INPlayMediaIntentHandler#handle Problem converting intent to Playback objects", v59, 2u);
        MEMORY[0x237DE3BF0](v59, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v56 + 8))(v20, v54);
      id v60 = objc_allocWithZone(MEMORY[0x263F08D38]);
      uint64_t v61 = (void *)sub_2355BCC40();
      id v62 = objc_msgSend(v60, sel_initWithActivityType_, v61);

      id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD50]), sel_initWithCode_userActivity_, 6, v62);
      id v90 = v41;
LABEL_29:
      a1(&v90);
LABEL_30:

      return;
    }
LABEL_40:
    swift_once();
    goto LABEL_26;
  }
  uint64_t v63 = *(int *)(v10 + 48);
  uint64_t v64 = (uint64_t)v84 + v63;
  uint64_t v65 = (char *)v9 + v63;
  uint64_t v66 = *v9;
  *uint64_t v84 = v66;
  uint64_t v67 = sub_2355BC600();
  uint64_t v68 = *(void *)(v67 - 8);
  (*(void (**)(uint64_t, char *, uint64_t))(v68 + 32))(v64, v65, v67);
  swift_retain();
  id v69 = objc_msgSend(v53, sel_intentId);
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v86 = sub_2355BCC50();
    uint64_t v72 = v71;
  }
  else
  {
    uint64_t v86 = 0;
    uint64_t v72 = 0;
  }
  uint64_t v73 = (uint64_t)v83;
  uint64_t v74 = (char *)v83 + *(int *)(v10 + 48);
  uint64_t *v83 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v74, v64, v67);
  unint64_t v75 = (*(unsigned __int8 *)(v87 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
  unint64_t v76 = (v11 + v75 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v77 = (void *)swift_allocObject();
  v77[2] = sub_23559DB78;
  uint64_t v77[3] = v23;
  uint64_t v78 = v89;
  v77[4] = v89;
  sub_2355B99F8(v73, (uint64_t)v77 + v75);
  uint64_t v79 = v88;
  *(void *)((char *)v77 + v76) = v88;
  swift_retain();
  id v80 = v78;
  id v81 = v79;
  sub_2355B32C0(v86, v72, v66, v64, (void (*)(uint64_t *))sub_2355B9A60, (uint64_t)v77);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23557DE84((uint64_t)v84, &qword_26880C880);
}

void sub_2355B0B80(uint64_t a1, void (*a2)(id), uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v100 = a6;
  uint64_t v104 = a5;
  id v105 = a4;
  uint64_t v106 = a2;
  uint64_t v107 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C520);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v101 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C880);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char **)((char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_2355BCB80();
  uint64_t v108 = *(void *)(v12 - 8);
  uint64_t v109 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v102 = (char *)&v99 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v103 = (char *)&v99 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v99 = (char *)&v99 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v99 - v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8B8);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  id v27 = (char *)&v99 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v99 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (uint64_t *)((char *)&v99 - v31);
  sub_23557DFE4(a1, (uint64_t)&v99 - v31, &qword_26880C8B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23557DE84((uint64_t)v32, &qword_26880C8B8);
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v33 = v109;
    uint64_t v34 = __swift_project_value_buffer(v109, (uint64_t)qword_26880D108);
    uint64_t v35 = v108;
    (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v23, v34, v33);
    sub_23557DFE4(a1, (uint64_t)v30, &qword_26880C8B8);
    uint64_t v36 = sub_2355BCB60();
    os_log_type_t v37 = sub_2355BCF70();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (uint8_t *)swift_slowAlloc();
      id v105 = (id)swift_slowAlloc();
      v110[0] = (uint64_t)v105;
      *(_DWORD *)id v38 = 136315138;
      uint64_t v104 = v38 + 4;
      sub_23557DFE4((uint64_t)v30, (uint64_t)v27, &qword_26880C8B8);
      uint64_t v39 = sub_2355BCC60();
      v110[2] = sub_2355745F0(v39, v40, v110);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      sub_23557DE84((uint64_t)v30, &qword_26880C8B8);
      _os_log_impl(&dword_23556D000, v36, v37, "INPlayMediaIntentHandler#handle Error ensureWarm for content, returning temporary failure type: restrictedContent: %s", v38, 0xCu);
      id v41 = v105;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v41, -1, -1);
      MEMORY[0x237DE3BF0](v38, -1, -1);
    }
    else
    {
      sub_23557DE84((uint64_t)v30, &qword_26880C8B8);
    }

    (*(void (**)(char *, uint64_t))(v35 + 8))(v23, v33);
    uint64_t v54 = v106;
    id v55 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v56 = (void *)sub_2355BCC40();
    id v57 = objc_msgSend(v55, sel_initWithActivityType_, v56);

    id v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD50]), sel_initWithCode_userActivity_, 10, v57);
    v54(v58);
  }
  else
  {
    uint64_t v42 = *v32;
    id v43 = v105;
    if (sub_2355BCFC0())
    {
      uint64_t v45 = v108;
      uint64_t v44 = v109;
      if (qword_26880C108 != -1) {
        swift_once();
      }
      uint64_t v46 = __swift_project_value_buffer(v44, (uint64_t)qword_26880D108);
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v15, v46, v44);
      uint64_t v47 = sub_2355BCB60();
      os_log_type_t v48 = sub_2355BCF50();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v49 = 0;
        _os_log_impl(&dword_23556D000, v47, v48, "INPlayMediaIntentHandler#resolveMediaItems GDPR needed, not immediately starting playback", v49, 2u);
        MEMORY[0x237DE3BF0](v49, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v44);
      id v50 = objc_allocWithZone(MEMORY[0x263F08D38]);
      id v51 = (void *)sub_2355BCC40();
      id v52 = objc_msgSend(v50, sel_initWithActivityType_, v51);

      id v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD50]), sel_initWithCode_userActivity_, 2, v52);
      v106(v53);
    }
    else
    {
      uint64_t v59 = v43;
      uint64_t v60 = *(int *)(v9 + 48);
      uint64_t v61 = (char *)v11 + v60;
      id v62 = (char *)v104 + v60;
      void *v11 = *v104;
      uint64_t v63 = sub_2355BC600();
      uint64_t v64 = *(void *)(v63 - 8);
      (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v61, v62, v63);
      char v65 = sub_2355BC5E0();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v61, v63);
      uint64_t v67 = v108;
      uint64_t v66 = v109;
      if (v65)
      {
        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v68 = __swift_project_value_buffer(v66, (uint64_t)qword_26880D108);
        id v69 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 16);
        v69(v103, v68, v66);
        swift_retain();
        uint64_t v70 = sub_2355BCB60();
        os_log_type_t v71 = sub_2355BCF50();
        if (os_log_type_enabled(v70, v71))
        {
          uint64_t v72 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v72 = 67109120;
          LODWORD(v110[0]) = v42 != 0;
          sub_2355BD1B0();
          swift_release();
          _os_log_impl(&dword_23556D000, v70, v71, "INPlayMediaIntentHandler#handle Playback was started during 'warm' phase, skipping specific-play, continuation? %{BOOL}d", v72, 8u);
          MEMORY[0x237DE3BF0](v72, -1, -1);
        }
        else
        {

          swift_release();
        }
        uint64_t v83 = *(void (**)(char *, uint64_t))(v67 + 8);
        v83(v103, v66);
        id v84 = objc_msgSend(v105, sel_intentId);
        if (v84)
        {
          uint64_t v85 = v84;
          uint64_t v86 = sub_2355BCC50();
          uint64_t v88 = v87;

          v69(v102, v68, v66);
          uint64_t v89 = sub_2355BCB60();
          os_log_type_t v90 = sub_2355BCF50();
          if (os_log_type_enabled(v89, v90))
          {
            unint64_t v91 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v91 = 0;
            _os_log_impl(&dword_23556D000, v89, v90, "INPlayMediaIntentHandler#handle FOUND identifier for intent - tracking continuation for wrapper flow frame", v91, 2u);
            MEMORY[0x237DE3BF0](v91, -1, -1);
          }

          v83(v102, v66);
          if (qword_26880C180 != -1) {
            swift_once();
          }
          if (!v42)
          {
            if (qword_26880C188 != -1) {
              swift_once();
            }
            swift_retain();
          }
          v110[0] = v86;
          v110[1] = v88;
          swift_retain();
          sub_2355BC420();
        }
        uint64_t v92 = swift_allocObject();
        uint64_t v93 = v107;
        *(void *)(v92 + 16) = v106;
        *(void *)(v92 + 24) = v93;
        uint64_t v94 = sub_2355BCE60();
        uint64_t v95 = (uint64_t)v101;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v101, 1, 1, v94);
        uint64_t v96 = (void *)swift_allocObject();
        v96[2] = 0;
        v96[3] = 0;
        id v97 = v105;
        v96[4] = v105;
        v96[5] = sub_2355BBE30;
        v96[6] = v92;
        id v98 = v97;
        swift_retain();
        swift_retain();
        sub_235579FC8(v95, (uint64_t)&unk_26880C8E0, (uint64_t)v96);
        swift_release();
        swift_release();
      }
      else
      {
        if (qword_26880C108 != -1) {
          swift_once();
        }
        uint64_t v73 = __swift_project_value_buffer(v66, (uint64_t)qword_26880D108);
        uint64_t v74 = v99;
        (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v99, v73, v66);
        unint64_t v75 = sub_2355BCB60();
        os_log_type_t v76 = sub_2355BCF50();
        if (os_log_type_enabled(v75, v76))
        {
          uint64_t v77 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v77 = 0;
          _os_log_impl(&dword_23556D000, v75, v76, "INPlayMediaIntentHandler#play ensureWarm complete - moving to play", v77, 2u);
          MEMORY[0x237DE3BF0](v77, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v67 + 8))(v74, v66);
        uint64_t v78 = v100;
        uint64_t v79 = (void *)swift_allocObject();
        v79[2] = v59;
        v79[3] = v78;
        uint64_t v80 = v107;
        v79[4] = v106;
        v79[5] = v80;
        id v81 = v59;
        id v82 = v78;
        swift_retain();
        sub_2355BC3A0();
        swift_release();
      }
    }
    swift_release();
  }
}

uint64_t sub_2355B17A0(uint64_t a1, char *a2, uint64_t a3, void (*a4)(id), uint64_t a5)
{
  unint64_t v91 = a2;
  uint64_t v92 = a4;
  uint64_t v7 = sub_2355BC880();
  uint64_t v90 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v85 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v88 = (char *)&v84 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v84 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C520);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v89 = (char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2355BCB80();
  uint64_t v94 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v87 = (char *)&v84 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v84 - v22;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8B8);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (uint64_t *)((char *)&v84 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23557DFE4(a1, (uint64_t)v26, &qword_26880C8B8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v93 = a5;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v28 = v90;
    (*(void (**)(char *, uint64_t *, uint64_t))(v90 + 32))(v13, v26, v7);
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v29 = v16;
    uint64_t v30 = __swift_project_value_buffer(v16, (uint64_t)qword_26880D108);
    uint64_t v31 = v94;
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v94 + 16);
    uint64_t v86 = v29;
    v32(v19, v30, v29);
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
    uint64_t v34 = v88;
    unint64_t v91 = v13;
    v33(v88, v13, v7);
    uint64_t v35 = sub_2355BCB60();
    os_log_type_t v36 = sub_2355BCF70();
    if (os_log_type_enabled(v35, v36))
    {
      os_log_type_t v37 = v34;
      uint64_t v38 = v7;
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v89 = (char *)swift_slowAlloc();
      v95[0] = (uint64_t)v89;
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v87 = (char *)(v39 + 4);
      v33(v85, v37, v38);
      uint64_t v40 = sub_2355BCC60();
      uint64_t v96 = sub_2355745F0(v40, v41, v95);
      uint64_t v42 = v90;
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      id v43 = *(void (**)(char *, uint64_t))(v42 + 8);
      v43(v37, v38);
      _os_log_impl(&dword_23556D000, v35, v36, "INPlayMediaIntentHandler#play Unexpected error playing content, code: %s", v39, 0xCu);
      uint64_t v44 = v89;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v44, -1, -1);
      uint64_t v45 = v39;
      uint64_t v7 = v38;
      MEMORY[0x237DE3BF0](v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v94 + 8))(v19, v86);
    }
    else
    {
      id v43 = *(void (**)(char *, uint64_t))(v28 + 8);
      v43(v34, v7);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v86);
    }
    id v55 = objc_allocWithZone(MEMORY[0x263F08D38]);
    uint64_t v56 = (void *)sub_2355BCC40();
    id v57 = objc_msgSend(v55, sel_initWithActivityType_, v56);

    id v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD50]), sel_initWithCode_userActivity_, 6, v57);
    v92(v58);

    return ((uint64_t (*)(char *, uint64_t))v43)(v91, v7);
  }
  else
  {
    uint64_t v46 = *v26;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v47 = v16;
    uint64_t v48 = __swift_project_value_buffer(v16, (uint64_t)qword_26880D108);
    uint64_t v49 = v94;
    id v50 = *(void (**)(void))(v94 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v50)(v23, v48, v16);
    swift_retain();
    id v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF50();
    if (os_log_type_enabled(v51, v52))
    {
      id v53 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v53 = 67109120;
      LODWORD(v95[0]) = v46 != 0;
      sub_2355BD1B0();
      swift_release();
      _os_log_impl(&dword_23556D000, v51, v52, " Successfully played content, continuation? %{BOOL}d", v53, 8u);
      uint64_t v54 = v53;
      uint64_t v49 = v94;
      MEMORY[0x237DE3BF0](v54, -1, -1);
    }
    else
    {

      swift_release();
    }
    id v62 = *(char **)(v49 + 8);
    uint64_t v61 = v49 + 8;
    uint64_t v60 = v62;
    ((void (*)(char *, uint64_t))v62)(v23, v47);
    id v63 = objc_msgSend(v91, sel_intentId);
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v88 = v60;
      uint64_t v94 = v61;
      uint64_t v65 = sub_2355BCC50();
      unint64_t v67 = v66;

      uint64_t v68 = v87;
      v50();
      swift_bridgeObjectRetain_n();
      id v69 = sub_2355BCB60();
      os_log_type_t v70 = sub_2355BCF50();
      BOOL v71 = os_log_type_enabled(v69, v70);
      uint64_t v90 = v65;
      if (v71)
      {
        uint64_t v86 = v47;
        uint64_t v72 = (uint8_t *)swift_slowAlloc();
        uint64_t v73 = swift_slowAlloc();
        v95[0] = v73;
        *(_DWORD *)uint64_t v72 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v96 = sub_2355745F0(v65, v67, v95);
        sub_2355BD1B0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23556D000, v69, v70, "INPlayMediaIntentHandler#play FOUND intentId for intent: %{public}s - tracking continuation for wrapper flow frame", v72, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v73, -1, -1);
        MEMORY[0x237DE3BF0](v72, -1, -1);

        uint64_t v74 = v68;
        uint64_t v75 = v86;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v74 = v68;
        uint64_t v75 = v47;
      }
      ((void (*)(char *, uint64_t))v88)(v74, v75);
      if (qword_26880C180 != -1) {
        swift_once();
      }
      uint64_t v76 = v90;
      if (!v46)
      {
        if (qword_26880C188 != -1) {
          swift_once();
        }
        swift_retain();
      }
      v95[0] = v76;
      v95[1] = v67;
      swift_retain();
      sub_2355BC420();
    }
    uint64_t v77 = swift_allocObject();
    uint64_t v78 = v93;
    *(void *)(v77 + 16) = v92;
    *(void *)(v77 + 24) = v78;
    uint64_t v79 = sub_2355BCE60();
    uint64_t v80 = (uint64_t)v89;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v89, 1, 1, v79);
    id v81 = (void *)swift_allocObject();
    v81[2] = 0;
    v81[3] = 0;
    id v82 = v91;
    v81[4] = v91;
    v81[5] = sub_2355B9C28;
    v81[6] = v77;
    swift_retain();
    uint64_t v83 = v82;
    swift_retain();
    sub_235579FC8(v80, (uint64_t)&unk_26880C8E8, (uint64_t)v81);
    swift_release();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_2355B219C(void (*a1)(id))
{
  uint64_t v2 = sub_2355BCB80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_allocWithZone(MEMORY[0x263F08D38]);
  uint64_t v7 = (void *)sub_2355BCC40();
  id v8 = objc_msgSend(v6, sel_initWithActivityType_, v7);

  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0FD50]), sel_initWithCode_userActivity_, 4, v8);
  a1(v9);

  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
  uint64_t v11 = sub_2355BCB60();
  os_log_type_t v12 = sub_2355BCF50();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_23556D000, v11, v12, "INPlayMediaIntentHandler#play completion called", v13, 2u);
    MEMORY[0x237DE3BF0](v13, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2355B23F0(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

uint64_t sub_2355B2498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  uint64_t v6[2] = a4;
  uint64_t v7 = sub_2355BC670();
  v6[5] = v7;
  v6[6] = *(void *)(v7 - 8);
  v6[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2355B255C, 0, 0);
}

uint64_t sub_2355B255C()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);
  sub_2355BC660();
  char v4 = sub_2355BC650();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    id v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v6;
    *id v6 = v0;
    v6[1] = sub_2355B2678;
    uint64_t v7 = *(void *)(v0 + 16);
    return sub_23557FEE4(v7);
  }
  else
  {
    (*(void (**)(uint64_t))(v0 + 24))(v5);
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_2355B2678()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2355B2774, 0, 0);
}

uint64_t sub_2355B2774()
{
  (*(void (**)(void))(v0 + 24))();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2355B27E4(void *a1, void (*a2)(unint64_t), uint64_t a3)
{
  id v94 = a1;
  uint64_t v5 = sub_2355BCB80();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v90 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v88 = (char *)&v84 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v92 = (char *)&v84 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v84 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v89 = (char *)&v84 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v84 - v18;
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v5, (uint64_t)qword_26880D108);
  uint64_t v21 = *(uint8_t **)(v6 + 16);
  uint64_t v95 = v20;
  uint64_t v96 = v21;
  ((void (*)(char *))v21)(v19);
  uint64_t v22 = sub_2355BCB60();
  os_log_type_t v23 = sub_2355BCF60();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_23556D000, v22, v23, "INPlayMediaIntentHandler#item looking in private audiosearch results...", v24, 2u);
    MEMORY[0x237DE3BF0](v24, -1, -1);
  }

  unint64_t v91 = *(void (**)(char *, uint64_t))(v6 + 8);
  v91(v19, v5);
  id v25 = objc_msgSend(v94, sel_privatePlayMediaIntentData);
  uint64_t v93 = v6 + 8;
  if (!v25
    || (uint64_t v26 = v25,
        id v27 = objc_msgSend(v25, sel_audioSearchResults),
        v26,
        !v27))
  {
LABEL_29:
    ((void (*)(char *, uint64_t, uint64_t))v96)(v15, v95, v5);
    id v53 = sub_2355BCB60();
    os_log_type_t v54 = sub_2355BCF70();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v86 = v5;
      uint64_t v55 = swift_slowAlloc();
      uint64_t v87 = a3;
      uint64_t v56 = (uint8_t *)v55;
      uint64_t v57 = swift_slowAlloc();
      unint64_t v98 = v57;
      *(_DWORD *)uint64_t v56 = 136446210;
      uint64_t v58 = sub_2355BC930();
      uint64_t v97 = sub_2355745F0(v58, v59, (uint64_t *)&v98);
      sub_2355BD1B0();
      uint64_t v5 = v86;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v53, v54, "INPlayMediaIntentHandler#item %{public}s Intent has missing or invalid audioSearchResults (possibly expected for createRadio or wholeLibrary queries)", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v57, -1, -1);
      uint64_t v60 = v56;
      a3 = v87;
      MEMORY[0x237DE3BF0](v60, -1, -1);
    }

    uint64_t v61 = v91;
    v91(v15, v5);
    id v62 = v90;
    ((void (*)(char *, uint64_t, uint64_t))v96)(v92, v95, v5);
    id v63 = sub_2355BCB60();
    os_log_type_t v64 = sub_2355BCF60();
    BOOL v65 = os_log_type_enabled(v63, v64);
    id v66 = v94;
    if (v65)
    {
      uint64_t v67 = v5;
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v68 = 0;
      _os_log_impl(&dword_23556D000, v63, v64, "INPlayMediaIntentHandler#item evaluating if create radio...", v68, 2u);
      id v69 = v68;
      uint64_t v5 = v67;
      MEMORY[0x237DE3BF0](v69, -1, -1);
    }

    v61(v92, v5);
    char v70 = sub_2355BD0D0();
    if (sub_2355BD0F0())
    {
      char v71 = sub_2355BD070();
      if ((v70 & 1) == 0)
      {
        if ((v71 & 1) != 0 && (sub_2355BD0B0() & 1) == 0) {
          return sub_2355B9380((uint64_t)a2, a3);
        }
        goto LABEL_41;
      }
    }
    else if ((v70 & 1) == 0)
    {
LABEL_41:
      uint64_t v79 = v88;
      ((void (*)(char *, uint64_t, uint64_t))v96)(v88, v95, v5);
      uint64_t v80 = sub_2355BCB60();
      os_log_type_t v81 = sub_2355BCF80();
      if (os_log_type_enabled(v80, v81))
      {
        id v82 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v82 = 0;
        _os_log_impl(&dword_23556D000, v80, v81, "INPlayMediaIntentHandler#item not create radio, trying local search as fallback", v82, 2u);
        MEMORY[0x237DE3BF0](v82, -1, -1);
      }

      v61(v79, v5);
      return sub_2355B61FC(v66, 0, 0, (uint64_t)a2, a3);
    }
    ((void (*)(char *, uint64_t, uint64_t))v96)(v62, v95, v5);
    uint64_t v72 = sub_2355BCB60();
    os_log_type_t v73 = sub_2355BCF80();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = (uint8_t *)swift_slowAlloc();
      uint64_t v75 = v5;
      uint64_t v76 = swift_slowAlloc();
      unint64_t v98 = v76;
      *(_DWORD *)uint64_t v74 = 136446210;
      uint64_t v77 = sub_2355BC930();
      uint64_t v97 = sub_2355745F0(v77, v78, (uint64_t *)&v98);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v72, v73, "INPlayMediaIntentHandler#item %{public}s Creating radio station from currently playing item", v74, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v76, -1, -1);
      MEMORY[0x237DE3BF0](v74, -1, -1);

      v91(v90, v75);
    }
    else
    {

      v61(v62, v5);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v83 = swift_allocObject();
    *(_OWORD *)(v83 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    *(void *)(v83 + 32) = sub_2355BCEC0();
    unint64_t v98 = v83;
    sub_2355BCDD0();
    unint64_t v29 = v98;
    goto LABEL_46;
  }
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v28 = sub_2355BCDB0();

  if (!(v28 >> 62))
  {
    if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v52)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
LABEL_9:
  unint64_t v29 = sub_2355BCF00();
  swift_bridgeObjectRelease();
  uint64_t v30 = v89;
  ((void (*)(char *, uint64_t, uint64_t))v96)(v89, v95, v5);
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_2355BCB60();
  int v32 = sub_2355BCF80();
  if (!os_log_type_enabled(v31, (os_log_type_t)v32))
  {

    swift_bridgeObjectRelease_n();
    v91(v30, v5);
LABEL_46:
    a2(v29);
    return swift_bridgeObjectRelease();
  }
  uint64_t v87 = a3;
  uint64_t v33 = (uint8_t *)swift_slowAlloc();
  uint64_t v34 = (void *)swift_slowAlloc();
  unint64_t v98 = (unint64_t)v34;
  uint64_t v96 = v33;
  *(_DWORD *)uint64_t v33 = 136315138;
  uint64_t v86 = v5;
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2355BD280();
    uint64_t v35 = result;
  }
  else
  {
    uint64_t v35 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v85 = a2;
  LODWORD(v95) = v32;
  id v94 = v34;
  if (!v35)
  {
    uint64_t v38 = (void *)MEMORY[0x263F8EE78];
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v47 = v96;
    uint64_t v48 = MEMORY[0x237DE3110](v38, MEMORY[0x263F8D310]);
    unint64_t v50 = v49;
    swift_bridgeObjectRelease();
    uint64_t v97 = sub_2355745F0(v48, v50, (uint64_t *)&v98);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v31, (os_log_type_t)v95, "INPlayMediaIntentHandler#item using unique private server search results: %s", v47, 0xCu);
    id v51 = v94;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v51, -1, -1);
    MEMORY[0x237DE3BF0](v47, -1, -1);

    v91(v89, v86);
    v85(v29);
    return swift_bridgeObjectRelease();
  }
  if (v35 >= 1)
  {
    uint64_t v37 = 0;
    uint64_t v38 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v29 & 0xC000000000000001) != 0) {
        id v39 = (id)MEMORY[0x237DE35A0](v37, v29);
      }
      else {
        id v39 = *(id *)(v29 + 8 * v37 + 32);
      }
      uint64_t v40 = v39;
      uint64_t v41 = sub_2355BCEE0();
      uint64_t v43 = v42;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v38 = sub_2355B6DE0(0, v38[2] + 1, 1, v38);
      }
      unint64_t v45 = v38[2];
      unint64_t v44 = v38[3];
      if (v45 >= v44 >> 1) {
        uint64_t v38 = sub_2355B6DE0((void *)(v44 > 1), v45 + 1, 1, v38);
      }
      ++v37;
      v38[2] = v45 + 1;
      uint64_t v46 = &v38[2 * v45];
      v46[4] = v41;
      v46[5] = v43;
    }
    while (v35 != v37);
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_2355B32C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *), uint64_t a6)
{
  uint64_t v35 = a4;
  os_log_type_t v36 = a5;
  uint64_t v37 = a6;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8B8);
  MEMORY[0x270FA5388](v33);
  uint64_t v9 = (void *)((char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_2355BCB80();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v32 - v15;
  if (!a2) {
    goto LABEL_9;
  }
  if (qword_26880C180 != -1) {
    swift_once();
  }
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v17 = sub_2355BC400();
  if (v17)
  {
    uint64_t v18 = v17;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v10, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v19, v10);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_2355BCB60();
    os_log_type_t v21 = sub_2355BCF50();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v38 = v35;
      uint64_t v39 = a1;
      uint64_t v34 = v22;
      *(_DWORD *)uint64_t v22 = 136446210;
      v32[1] = v22 + 4;
      uint64_t v40 = a2;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C680);
      uint64_t v23 = sub_2355BCC60();
      uint64_t v39 = sub_2355745F0(v23, v24, &v38);
      sub_2355BD1B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      id v25 = v34;
      _os_log_impl(&dword_23556D000, v20, v21, "INPlayMediaIntentHandler#ensureWarm Found continuation from previous 'resolve' for intentId: %{public}s", v34, 0xCu);
      uint64_t v26 = v35;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v26, -1, -1);
      MEMORY[0x237DE3BF0](v25, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    uint64_t *v9 = v18;
    swift_storeEnumTagMultiPayload();
    swift_retain();
    v36(v9);
    swift_release();
    return sub_23557DE84((uint64_t)v9, &qword_26880C8B8);
  }
  else
  {
LABEL_9:
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v10, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v27, v10);
    unint64_t v28 = sub_2355BCB60();
    os_log_type_t v29 = sub_2355BCF50();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_23556D000, v28, v29, "INPlayMediaIntentHandler#ensureWarm No result present from previous call to warm, ensuring warmup before handle...", v30, 2u);
      MEMORY[0x237DE3BF0](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    return sub_2355BC3B0();
  }
}

uint64_t sub_2355B3764@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v141 = a2;
  id v142 = a3;
  uint64_t v4 = sub_2355BC600();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v129 = (char *)&v119 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v144 = (char *)&v119 - v8;
  uint64_t v9 = sub_2355BC610();
  uint64_t v137 = *(void *)(v9 - 8);
  uint64_t v138 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v143 = (char *)&v119 - v13;
  uint64_t v14 = sub_2355BC790();
  uint64_t v140 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  unint64_t v139 = (char *)&v119 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v119 - v17;
  uint64_t v19 = sub_2355BCB80();
  uint64_t v20 = *(void (***)(char *, uint64_t, uint64_t))(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v119 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  unint64_t v127 = (char *)&v119 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  id v132 = (char *)&v119 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v119 - v32;
  if (!a1)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v49 = __swift_project_value_buffer(v19, (uint64_t)qword_26880D108);
    v20[2](v23, v49, v19);
    unint64_t v50 = sub_2355BCB60();
    os_log_type_t v51 = sub_2355BCF70();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_23556D000, v50, v51, "INPlayMediaIntentHandler#convert Unexpected missing item to convert", v52, 2u);
      MEMORY[0x237DE3BF0](v52, -1, -1);
    }

    ((void (*)(char *, uint64_t))v20[1])(v23, v19);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C880);
    os_log_type_t v54 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56);
    uint64_t v55 = v142;
    goto LABEL_30;
  }
  uint64_t v119 = v31;
  os_log_type_t v123 = v12;
  unint64_t v126 = v30;
  os_log_t v133 = v18;
  uint64_t v125 = v5;
  uint64_t v34 = qword_26880C108;
  id v35 = a1;
  if (v34 != -1) {
    swift_once();
  }
  uint64_t v36 = __swift_project_value_buffer(v19, (uint64_t)qword_26880D108);
  uint64_t v37 = v20[2];
  uint64_t v134 = v36;
  id v135 = v37;
  uint64_t v136 = (char *)(v20 + 2);
  ((void (*)(char *))v37)(v33);
  uint64_t v38 = v35;
  uint64_t v39 = sub_2355BCB60();
  os_log_type_t v40 = sub_2355BCF60();
  BOOL v41 = os_log_type_enabled(v39, v40);
  uint64_t v131 = v4;
  uint64_t v128 = v14;
  if (v41)
  {
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    v146[0] = v43;
    *(_DWORD *)uint64_t v42 = 136446466;
    uint64_t v44 = sub_2355BC920();
    uint64_t v124 = (void (*)(char *, uint64_t))v19;
    uint64_t v145 = sub_2355745F0(v44, v45, v146);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2082;
    uint64_t v46 = sub_2355BCEE0();
    uint64_t v145 = sub_2355745F0(v46, v47, v146);
    uint64_t v19 = (uint64_t)v124;
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v39, v40, "INPlayMediaIntentHandler#convert %{public}s converting mediaItem: %{public}s", (uint8_t *)v42, 0x16u);
    swift_arrayDestroy();
    uint64_t v48 = v43;
    uint64_t v14 = v128;
    MEMORY[0x237DE3BF0](v48, -1, -1);
    MEMORY[0x237DE3BF0](v42, -1, -1);
  }
  else
  {
  }
  uint64_t v56 = v20[1];
  ((void (*)(char *, uint64_t))v56)(v33, v19);
  id v57 = [v38 privateMediaItemValueData];
  uint64_t v58 = (uint64_t)v133;
  if (v57
    && (unint64_t v59 = v57, v60 = objc_msgSend(v57, sel_mediaSubItems),
                   v59,
                   v60))
  {
    sub_23557DC00(0, &qword_26880C898);
    unint64_t v61 = sub_2355BCDB0();
  }
  else
  {
    unint64_t v61 = MEMORY[0x263F8EE78];
  }
  unint64_t v62 = sub_2355A6184(v61);
  swift_bridgeObjectRelease();
  uint64_t v63 = sub_2355B4BD4(v38, v62);
  swift_bridgeObjectRelease();
  if (!v63)
  {
    uint64_t v67 = v127;
    v135(v127, v134, v19);
    uint64_t v68 = sub_2355BCB60();
    os_log_type_t v69 = sub_2355BCF70();
    if (os_log_type_enabled(v68, v69))
    {
      char v70 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v70 = 0;
      _os_log_impl(&dword_23556D000, v68, v69, "INPlayMediaIntentHandler#convert Unexpected nil PlaybackItem transforming from INMediaItem for container", v70, 2u);
      MEMORY[0x237DE3BF0](v70, -1, -1);
      char v71 = v38;
    }
    else
    {
      char v71 = v68;
      uint64_t v68 = v38;
    }
    uint64_t v80 = v142;

    ((void (*)(char *, uint64_t))v56)(v67, v19);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C880);
    os_log_type_t v54 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56);
    uint64_t v55 = v80;
LABEL_30:
    uint64_t v81 = 1;
    return v54(v55, v81, 1, v53);
  }
  id v64 = v141;
  id v65 = objc_msgSend(v141, sel_playShuffled);
  uint64_t v124 = (void (*)(char *, uint64_t))v56;
  if (v65)
  {
    id v66 = v65;
    unsigned int v120 = objc_msgSend(v65, sel_BOOLValue);
  }
  else
  {
    unsigned int v120 = 0;
  }
  char v72 = sub_2355BD0D0();
  uint64_t v121 = v38;
  if ((v72 & 1) != 0 && (sub_2355BD070() & 1) == 0)
  {
    id v73 = objc_msgSend(v64, sel_backingStore);
    self;
    uint64_t v74 = swift_dynamicCastObjCClass();
    if (v74)
    {
      uint64_t v75 = (void *)v74;
      v135(v119, v134, v19);
      uint64_t v76 = sub_2355BCB60();
      os_log_type_t v77 = sub_2355BCF60();
      if (os_log_type_enabled(v76, v77))
      {
        unint64_t v78 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v78 = 0;
        _os_log_impl(&dword_23556D000, v76, v77, "INPlayMediaIntentHandler#convert User is asking to create station from currently playing and we received a station from server. Add that to up next", v78, 2u);
        uint64_t v79 = v78;
        id v64 = v141;
        MEMORY[0x237DE3BF0](v79, -1, -1);
      }

      v124(v119, v19);
      (*(void (**)(uint64_t, void, uint64_t))(v140 + 104))(v58, *MEMORY[0x263F6CBF0], v14);
      objc_msgSend(v75, sel_setPlaybackQueueLocation_, 2);

      goto LABEL_33;
    }
  }
  sub_23558B7C8((uint64_t)objc_msgSend(v64, sel_playbackQueueLocation), v58);
LABEL_33:
  unint64_t v127 = (char *)v20;
  objc_msgSend(v64, sel_playbackRepeatMode);
  sub_2355BD160();
  id v82 = (void *)(v130 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider);
  __swift_project_boxed_opaque_existential_1((void *)(v130 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider), *(void *)(v130 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider + 24));
  if (sub_2355BC580())
  {
    __swift_project_boxed_opaque_existential_1(v82, v82[3]);
    sub_2355BC590();
  }
  id v83 = v141;
  id v84 = objc_msgSend(v141, sel_privatePlayMediaIntentData);
  uint64_t v85 = v84;
  if (v84)
  {
    id v86 = objc_msgSend(v84, sel_privateMediaIntentData);

    if (v86)
    {
      id v87 = objc_msgSend(v86, sel_speakerIDInfo);

      if (v87)
      {
        id v88 = objc_msgSend(v87, sel_sharedUserID);

        if (v88)
        {
          sub_2355BCC50();

          id v83 = v141;
          sub_2355BCC70();
          uint64_t v58 = (uint64_t)v133;
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v140 + 16))(v139, v58, v14);
  sub_2355BD030();
  id v89 = objc_msgSend(v83, sel_hashedRouteUIDs);
  if (v89)
  {
    uint64_t v90 = v89;
    sub_2355BCDB0();
  }
  sub_2355BD060();
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v123, v143, v138);
  sub_2355BC5F0();
  unint64_t v91 = v126;
  v135(v126, v134, v19);
  swift_retain_n();
  uint64_t v92 = sub_2355BCB60();
  os_log_type_t v93 = sub_2355BCF60();
  BOOL v94 = os_log_type_enabled(v92, v93);
  uint64_t v122 = v63;
  if (v94)
  {
    uint64_t v95 = swift_slowAlloc();
    uint64_t v96 = swift_slowAlloc();
    v146[0] = v96;
    *(_DWORD *)uint64_t v95 = 136446466;
    uint64_t v97 = sub_2355BC920();
    uint64_t v145 = sub_2355745F0(v97, v98, v146);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v95 + 12) = 2082;
    uint64_t v145 = v63;
    sub_2355BC750();
    sub_2355B9854(&qword_26880C890, MEMORY[0x263F6CBD0]);
    uint64_t v99 = sub_2355BD2E0();
    uint64_t v145 = sub_2355745F0(v99, v100, v146);
    sub_2355BD1B0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v92, v93, "INPlayMediaIntentHandler#convert %{public}s PlaybackItem: %{public}s", (uint8_t *)v95, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v96, -1, -1);
    MEMORY[0x237DE3BF0](v95, -1, -1);

    unint64_t v101 = v126;
  }
  else
  {

    swift_release_n();
    unint64_t v101 = v91;
  }
  unint64_t v102 = v124;
  v124(v101, v19);
  uint64_t v104 = v131;
  uint64_t v103 = v132;
  uint64_t v105 = v125;
  uint64_t v106 = v129;
  v135(v132, v134, v19);
  (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v106, v144, v104);
  uint64_t v107 = sub_2355BCB60();
  os_log_type_t v108 = sub_2355BCF60();
  if (os_log_type_enabled(v107, v108))
  {
    uint64_t v109 = swift_slowAlloc();
    uint64_t v110 = swift_slowAlloc();
    v146[0] = v110;
    *(_DWORD *)uint64_t v109 = 136446466;
    uint64_t v111 = sub_2355BC920();
    uint64_t v145 = sub_2355745F0(v111, v112, v146);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v109 + 12) = 2082;
    sub_2355B9854(&qword_26880C888, MEMORY[0x263F6CB88]);
    uint64_t v113 = sub_2355BD2E0();
    uint64_t v145 = sub_2355745F0(v113, v114, v146);
    uint64_t v105 = v125;
    uint64_t v104 = v131;
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v105 + 8))(v106, v104);
    _os_log_impl(&dword_23556D000, v107, v108, "INPlayMediaIntentHandler#convert %{public}s PlaybackAttributes: %{public}s", (uint8_t *)v109, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v110, -1, -1);
    MEMORY[0x237DE3BF0](v109, -1, -1);

    v124(v132, v19);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v105 + 8))(v106, v104);
    v102(v103, v19);
  }
  (*(void (**)(char *, uint64_t))(v137 + 8))(v143, v138);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v133, v128);
  os_log_type_t v115 = v142;
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C880);
  uint64_t v117 = (char *)v115 + *(int *)(v116 + 48);
  *os_log_type_t v115 = v122;
  (*(void (**)(char *, char *, uint64_t))(v105 + 32))(v117, v144, v104);
  os_log_type_t v54 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v116 - 8) + 56);
  uint64_t v55 = v115;
  uint64_t v81 = 0;
  uint64_t v53 = v116;
  return v54(v55, v81, 1, v53);
}

uint64_t sub_2355B48A0(void *a1)
{
  uint64_t v2 = sub_2355BCB80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_identifier);
  if (v6)
  {
    uint64_t v7 = v6;
    sub_2355BCC50();

    id v8 = objc_msgSend(a1, sel_assetInfo);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_2355BCC50();
    }
    sub_2355BC250();
    swift_allocObject();
    return sub_2355BC260();
  }
  else
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
    id v11 = a1;
    uint64_t v12 = sub_2355BCB60();
    os_log_type_t v13 = sub_2355BCF70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v28 = v26;
      uint64_t v25 = v14;
      *(_DWORD *)uint64_t v14 = 136446210;
      v24[1] = v14 + 4;
      id v15 = v11;
      id v16 = objc_msgSend(v15, sel_description);
      uint64_t v17 = sub_2355BCC50();
      unint64_t v19 = v18;

      uint64_t v27 = sub_2355745F0(v17, v19, &v28);
      sub_2355BD1B0();

      swift_bridgeObjectRelease();
      os_log_type_t v20 = v13;
      uint64_t v21 = v25;
      _os_log_impl(&dword_23556D000, v12, v20, "INPlayMediaIntentHandler#convert identifier nil for mediaSubItem: %{public}s", v25, 0xCu);
      uint64_t v22 = v26;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v22, -1, -1);
      MEMORY[0x237DE3BF0](v21, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
}

uint64_t sub_2355B4BD4(void *a1, unint64_t a2)
{
  unint64_t v87 = a2;
  uint64_t v3 = sub_2355BC240();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8A0);
  MEMORY[0x270FA5388](v88);
  id v8 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2355BC1E0();
  uint64_t v85 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C8A8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v84 = (uint64_t)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v80 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v80 - v18;
  uint64_t v20 = sub_2355BCB80();
  uint64_t v89 = *(void *)(v20 - 8);
  uint64_t v90 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  id v82 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v80 - v23;
  id v91 = a1;
  id v25 = objc_msgSend(a1, sel_identifier);
  if (!v25)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v33 = v90;
    uint64_t v34 = __swift_project_value_buffer(v90, (uint64_t)qword_26880D108);
    uint64_t v35 = v89;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v24, v34, v33);
    id v36 = v91;
    uint64_t v37 = sub_2355BCB60();
    os_log_type_t v38 = sub_2355BCF70();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v93 = v40;
      *(_DWORD *)uint64_t v39 = 136446210;
      id v91 = v39 + 4;
      id v41 = v36;
      id v42 = objc_msgSend(v41, sel_description);
      uint64_t v43 = sub_2355BCC50();
      unint64_t v45 = v44;

      uint64_t v92 = sub_2355745F0(v43, v45, &v93);
      sub_2355BD1B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v37, v38, "INPlayMediaIntentHandler#convert identifier nil for mediaItem: %{public}s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v40, -1, -1);
      MEMORY[0x237DE3BF0](v39, -1, -1);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v24, v90);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v33);
    }
    return 0;
  }
  uint64_t v26 = v25;
  uint64_t v81 = v6;
  uint64_t v27 = v4;
  uint64_t v28 = sub_2355BCC50();
  uint64_t v30 = v29;

  sub_2355BC250();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v83 = v28;
  uint64_t v86 = v30;
  if (sub_2355BC260())
  {
    sub_2355BC1F0();
    swift_release();
    sub_2355BC1D0();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v11, v9);
    uint64_t v31 = v27;
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    v32(v19, 0, 1, v3);
  }
  else
  {
    uint64_t v31 = v27;
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    v32(v19, 1, 1, v3);
  }
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v17, *MEMORY[0x263F6CAD8], v3);
  v32(v17, 0, 1, v3);
  uint64_t v46 = (uint64_t)&v8[*(int *)(v88 + 48)];
  sub_23557DFE4((uint64_t)v19, (uint64_t)v8, &qword_26880C8A8);
  sub_23557DFE4((uint64_t)v17, v46, &qword_26880C8A8);
  unint64_t v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  if (v47((uint64_t)v8, 1, v3) == 1)
  {
    sub_23557DE84((uint64_t)v17, &qword_26880C8A8);
    sub_23557DE84((uint64_t)v19, &qword_26880C8A8);
    if (v47(v46, 1, v3) == 1)
    {
      sub_23557DE84((uint64_t)v8, &qword_26880C8A8);
      unint64_t v48 = v87;
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  uint64_t v49 = v84;
  sub_23557DFE4((uint64_t)v8, v84, &qword_26880C8A8);
  if (v47(v46, 1, v3) == 1)
  {
    sub_23557DE84((uint64_t)v17, &qword_26880C8A8);
    sub_23557DE84((uint64_t)v19, &qword_26880C8A8);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v49, v3);
LABEL_14:
    sub_23557DE84((uint64_t)v8, &qword_26880C8A0);
    goto LABEL_24;
  }
  os_log_type_t v51 = v81;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v81, v46, v3);
  sub_2355B9854(&qword_26880C8B0, MEMORY[0x263F6CAF8]);
  char v52 = sub_2355BCC30();
  uint64_t v53 = *(void (**)(char *, uint64_t))(v31 + 8);
  v53(v51, v3);
  sub_23557DE84((uint64_t)v17, &qword_26880C8A8);
  sub_23557DE84((uint64_t)v19, &qword_26880C8A8);
  v53((char *)v49, v3);
  sub_23557DE84((uint64_t)v8, &qword_26880C8A8);
  unint64_t v48 = v87;
  if (v52)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    id v54 = v91;
    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_2355BD280()) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v55 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v55)
      {
LABEL_20:
        if ((v48 & 0xC000000000000001) != 0)
        {
          MEMORY[0x237DE35A0](0, v48);
          goto LABEL_23;
        }
        if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          swift_retain();
LABEL_23:
          swift_bridgeObjectRelease();
          uint64_t v83 = sub_2355BC210();
          uint64_t v86 = v56;
          swift_release();
          goto LABEL_25;
        }
        __break(1u);
LABEL_42:
        swift_once();
LABEL_37:
        uint64_t v66 = v90;
        uint64_t v67 = __swift_project_value_buffer(v90, (uint64_t)qword_26880D108);
        uint64_t v68 = v89;
        os_log_type_t v69 = v82;
        (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v82, v67, v66);
        id v70 = v54;
        char v71 = sub_2355BCB60();
        os_log_type_t v72 = sub_2355BCF70();
        if (os_log_type_enabled(v71, v72))
        {
          id v73 = (uint8_t *)swift_slowAlloc();
          uint64_t v74 = swift_slowAlloc();
          uint64_t v93 = v74;
          *(_DWORD *)id v73 = 136446210;
          id v91 = v73 + 4;
          id v75 = v70;
          id v76 = objc_msgSend(v75, sel_description);
          uint64_t v77 = sub_2355BCC50();
          unint64_t v79 = v78;

          uint64_t v92 = sub_2355745F0(v77, v79, &v93);
          sub_2355BD1B0();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23556D000, v71, v72, "INPlayMediaIntentHandler#convert subItems empty for classicalRecording mediaItem: %{public}s", v73, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237DE3BF0](v74, -1, -1);
          MEMORY[0x237DE3BF0](v73, -1, -1);

          (*(void (**)(char *, uint64_t))(v68 + 8))(v82, v90);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v66);
        }
        return 0;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_26880C108 == -1) {
      goto LABEL_37;
    }
    goto LABEL_42;
  }
LABEL_24:
  id v54 = v91;
LABEL_25:
  id v57 = objc_msgSend(v54, sel_privateMediaItemValueData);
  uint64_t v58 = v57;
  if (v57)
  {
    id v59 = objc_msgSend(v57, sel_assetInfo);

    if (v59)
    {
      sub_2355BCC50();
    }
  }
  id v60 = objc_msgSend(v54, sel_privateMediaItemValueData);
  unint64_t v61 = v60;
  if (v60)
  {
    id v62 = objc_msgSend(v60, sel_recommendationId);

    if (v62)
    {
      sub_2355BCC50();
    }
  }
  id v63 = objc_msgSend(v54, sel_privateMediaItemValueData);
  id v64 = v63;
  if (v63)
  {
    id v65 = objc_msgSend(v63, sel_sharedUserIdFromPlayableMusicAccount);

    if (v65)
    {
      sub_2355BCC50();

      sub_2355BCC70();
      swift_bridgeObjectRelease();
    }
  }
  sub_2355BC750();
  swift_allocObject();
  swift_bridgeObjectRetain();
  return sub_2355BC760();
}

BOOL sub_2355B57F4(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  id v91 = (void *)sub_2355BCB80();
  uint64_t v8 = *(v91 - 1);
  uint64_t v9 = MEMORY[0x270FA5388](v91);
  id v11 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v84 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v90 = (char *)&v84 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v89 = (char *)&v84 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v84 - v19;
  sub_23557DC00(0, &qword_26880C2D0);
  uint64_t v21 = (void *)sub_2355BD180();
  uint64_t v22 = v21;
  if (!a1)
  {

    goto LABEL_11;
  }
  id v23 = a1;
  char v24 = sub_2355BD190();

  if ((v24 & 1) == 0)
  {
LABEL_11:
    if (qword_26880C108 != -1) {
      swift_once();
    }
    unint64_t v44 = (void (*)(void, void))v91;
    uint64_t v45 = __swift_project_value_buffer((uint64_t)v91, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, void (*)(void, void)))(v8 + 16))(v11, v45, v44);
    uint64_t v46 = sub_2355BCB60();
    os_log_type_t v47 = sub_2355BCF60();
    if (os_log_type_enabled(v46, v47))
    {
      unint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v48 = 0;
      _os_log_impl(&dword_23556D000, v46, v47, "INPlayMediaIntentHandler#shouldDisambiguate Entity confidence disabled", v48, 2u);
      MEMORY[0x237DE3BF0](v48, -1, -1);
    }

    (*(void (**)(char *, void))(v8 + 8))(v11, v44);
    return 0;
  }
  if (!a2 || !a3)
  {
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v49 = (void (*)(void, void))v91;
    uint64_t v50 = __swift_project_value_buffer((uint64_t)v91, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, void (*)(void, void)))(v8 + 16))(v14, v50, v49);
    os_log_type_t v51 = sub_2355BCB60();
    os_log_type_t v52 = sub_2355BCF70();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v53 = 0;
      _os_log_impl(&dword_23556D000, v51, v52, "INPlayMediaIntentHandler#shouldDisambiguate No ratios for internal / production", v53, 2u);
      MEMORY[0x237DE3BF0](v53, -1, -1);
    }

    (*(void (**)(char *, void))(v8 + 8))(v14, v49);
    return 0;
  }
  __swift_project_boxed_opaque_existential_1((void *)(v4 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider), *(void *)(v4 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider + 24));
  id v25 = a2;
  id v26 = a3;
  char v27 = sub_2355BC370();
  unint64_t v28 = 0x26880C000uLL;
  id v87 = v26;
  id v88 = v25;
  uint64_t v86 = v8;
  if (v27)
  {
    uint64_t v29 = (void (*)(void, void))v91;
    uint64_t v30 = v8;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v31 = __swift_project_value_buffer((uint64_t)v29, (uint64_t)qword_26880D108);
    uint64_t v85 = *(void (**)(char *, uint64_t, void (*)(void, void)))(v8 + 16);
    v85(v20, v31, v29);
    id v32 = v25;
    uint64_t v33 = sub_2355BCB60();
    os_log_type_t v34 = sub_2355BCF60();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v93 = v36;
      *(_DWORD *)uint64_t v35 = 136315138;
      uint64_t v89 = (char *)(v35 + 4);
      id v37 = v32;
      id v38 = objc_msgSend(v37, sel_description);
      uint64_t v39 = sub_2355BCC50();
      unint64_t v41 = v40;

      uint64_t v92 = sub_2355745F0(v39, v41, &v93);
      sub_2355BD1B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v33, v34, "INPlayMediaIntentHandler#shouldDisambiguate On internal build with ratio 1/%s", v35, 0xCu);
      swift_arrayDestroy();
      uint64_t v42 = v36;
      uint64_t v29 = (void (*)(void, void))v91;
      MEMORY[0x237DE3BF0](v42, -1, -1);
      uint64_t v43 = v35;
      unint64_t v28 = 0x26880C000;
      MEMORY[0x237DE3BF0](v43, -1, -1);

      uint64_t v30 = v86;
    }
    else
    {
    }
    os_log_type_t v72 = *(void **)(v30 + 8);
    ((void (*)(char *, void))v72)(v20, v29);
    id v73 = v90;
    uint64_t v58 = v85;
  }
  else
  {
    uint64_t v29 = (void (*)(void, void))v91;
    uint64_t v56 = v8;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v57 = __swift_project_value_buffer((uint64_t)v29, (uint64_t)qword_26880D108);
    uint64_t v58 = *(void (**)(char *, uint64_t, void (*)(void, void)))(v8 + 16);
    id v59 = v89;
    v58(v89, v57, v29);
    id v60 = v26;
    unint64_t v61 = sub_2355BCB60();
    os_log_type_t v62 = sub_2355BCF60();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = swift_slowAlloc();
      uint64_t v85 = v58;
      id v64 = (uint8_t *)v63;
      uint64_t v65 = swift_slowAlloc();
      uint64_t v93 = v65;
      *(_DWORD *)id v64 = 136315138;
      id v66 = v60;
      id v67 = objc_msgSend(v66, sel_description);
      uint64_t v68 = sub_2355BCC50();
      unint64_t v70 = v69;

      uint64_t v92 = sub_2355745F0(v68, v70, &v93);
      sub_2355BD1B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v61, v62, "INPlayMediaIntentHandler#shouldDisambiguate On prod build with ratio 1/%s", v64, 0xCu);
      swift_arrayDestroy();
      uint64_t v71 = v65;
      uint64_t v29 = (void (*)(void, void))v91;
      MEMORY[0x237DE3BF0](v71, -1, -1);
      uint64_t v58 = v85;
      MEMORY[0x237DE3BF0](v64, -1, -1);

      os_log_type_t v72 = *(void **)(v86 + 8);
      ((void (*)(char *, void))v72)(v89, v29);
    }
    else
    {

      os_log_type_t v72 = *(void **)(v56 + 8);
      ((void (*)(char *, void))v72)(v59, v29);
    }
    id v73 = v90;
    unint64_t v28 = 0x26880C000uLL;
  }
  sub_2355BCE70();
  double v75 = 1.0 / v74;
  double v76 = (double)sub_2355B78EC(0x20000000000001uLL) * 1.11022302e-16 + 0.0;
  BOOL v54 = v76 < v75;
  if (*(void *)(v28 + 264) != -1) {
    swift_once();
  }
  uint64_t v77 = __swift_project_value_buffer((uint64_t)v29, (uint64_t)qword_26880D108);
  v58(v73, v77, v29);
  unint64_t v78 = sub_2355BCB60();
  os_log_type_t v79 = sub_2355BCF60();
  if (os_log_type_enabled(v78, v79))
  {
    uint64_t v80 = swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    uint64_t v93 = v81;
    *(_DWORD *)uint64_t v80 = 134218498;
    uint64_t v92 = *(void *)&v76;
    sub_2355BD1B0();
    *(_WORD *)(v80 + 12) = 2048;
    uint64_t v92 = *(void *)&v75;
    sub_2355BD1B0();
    *(_WORD *)(v80 + 22) = 2080;
    if (v76 >= v75) {
      uint64_t v82 = 0x65736C6166;
    }
    else {
      uint64_t v82 = 1702195828;
    }
    if (v76 >= v75) {
      unint64_t v83 = 0xE500000000000000;
    }
    else {
      unint64_t v83 = 0xE400000000000000;
    }
    id v91 = v72;
    uint64_t v92 = sub_2355745F0(v82, v83, &v93);
    sub_2355BD1B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v78, v79, "INPlayMediaIntentHandler#shouldDisambiguate Random number: %f Chance: %f Should disambiguate? %s", (uint8_t *)v80, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v81, -1, -1);
    MEMORY[0x237DE3BF0](v80, -1, -1);

    ((void (*)(char *, void))v91)(v73, v29);
  }
  else
  {

    ((void (*)(char *, void))v72)(v73, v29);
  }
  return v54;
}

uint64_t sub_2355B61FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  uint64_t v42 = a5;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v9 = sub_2355BCB80();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(a1, sel_privatePlayMediaIntentData);
  if (v13
    && (uint64_t v14 = v13,
        id v15 = objc_msgSend(v13, sel_privateMediaIntentData),
        v14,
        v15)
    && (id v16 = objc_msgSend(v15, sel_speakerIDInfo), v15, v16)
    && (id v17 = objc_msgSend(v16, sel_sharedUserID), v16, v17))
  {
    sub_2355BCC50();

    uint64_t v37 = sub_2355BCC70();
    uint64_t v38 = v18;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v38 = 0;
  }
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v9, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v19, v9);
  uint64_t v20 = a1;
  uint64_t v21 = sub_2355BCB60();
  os_log_type_t v22 = sub_2355BCF80();
  if (os_log_type_enabled(v21, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    unint64_t v41 = v6;
    char v24 = v23;
    *(_DWORD *)id v23 = 67109120;
    LOBYTE(v45) = sub_2355BD000() & 1;
    int v45 = v45;
    sub_2355BD1B0();

    _os_log_impl(&dword_23556D000, v21, v22, "INPlayMediaIntentHandler#searchSpotlight executing local spotlight search, isPommesResponse=%{BOOL}d", v24, 8u);
    id v25 = v24;
    id v6 = v41;
    MEMORY[0x237DE3BF0](v25, -1, -1);
  }
  else
  {

    uint64_t v21 = v20;
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v26 = *(void *)((char *)v6 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch + 32);
  uint64_t v40 = *(void *)((char *)v6 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch + 24);
  unint64_t v41 = __swift_project_boxed_opaque_existential_1((void *)((char *)v6 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch), v40);
  id v27 = [v20 mediaSearch];
  uint64_t v39 = MEMORY[0x237DE2890](v20);
  uint64_t v29 = v28;
  uint64_t v30 = (void *)swift_allocObject();
  uint64_t v32 = v43;
  uint64_t v31 = v44;
  v30[2] = v43;
  uint64_t v30[3] = v31;
  v30[4] = a4;
  uint64_t v30[5] = v42;
  v30[6] = v20;
  uint64_t v33 = *(void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, NSObject *, uint64_t (*)(void *), void *, uint64_t, uint64_t))(v26 + 8);
  os_log_type_t v34 = v20;
  sub_2355B91BC(v32);
  swift_retain();
  v33(v27, v37, v38, v39, v29, v34, sub_2355B91AC, v30, v40, v26);

  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2355B65D0(void *a1, void (*a2)(void, void, void), NSObject *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6)
{
  double v75 = a4;
  uint64_t v11 = sub_2355BCB80();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v66 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v66 - v19;
  if (a1)
  {
    uint64_t v21 = qword_26880C108;
    id v22 = a1;
    if (v21 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v11, (uint64_t)qword_26880D108);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, v23, v11);
    id v24 = v22;
    uint64_t v25 = v11;
    id v26 = v24;
    id v27 = sub_2355BCB60();
    os_log_type_t v28 = sub_2355BCF50();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v73 = a5;
      uint64_t v30 = v29;
      unint64_t v70 = (void *)swift_slowAlloc();
      os_log_type_t v72 = (void (*)(void, void, void))swift_slowAlloc();
      uint64_t v77 = v72;
      *(_DWORD *)uint64_t v30 = 136446466;
      os_log_t v69 = v27;
      uint64_t v31 = sub_2355BC930();
      uint64_t v76 = sub_2355745F0(v31, v32, (uint64_t *)&v77);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2114;
      uint64_t v76 = (uint64_t)v26;
      id v33 = v26;
      uint64_t v74 = v25;
      id v34 = v33;
      sub_2355BD1B0();
      uint64_t v35 = v70;
      *unint64_t v70 = a1;

      os_log_t v36 = v69;
      _os_log_impl(&dword_23556D000, v69, v28, "INPlayMediaIntentHandler#item %{public}s Successful search result: %{public}@", (uint8_t *)v30, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C330);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v35, -1, -1);
      uint64_t v37 = v72;
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v37, -1, -1);
      MEMORY[0x237DE3BF0](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v74);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v25);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_2355BDD80;
    *(void *)(v51 + 32) = v26;
    uint64_t v77 = (void (*)(void, void, void))v51;
    sub_2355BCDD0();
    uint64_t v52 = (uint64_t)v77;
    id v53 = v26;
    v75(v52);

    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v68 = a6;
    os_log_type_t v72 = a2;
    if (qword_26880C108 != -1) {
      swift_once();
    }
    uint64_t v38 = __swift_project_value_buffer(v11, (uint64_t)qword_26880D108);
    unint64_t v70 = *(void **)(v12 + 16);
    ((void (*)(char *, uint64_t, uint64_t))v70)(v20, v38, v11);
    uint64_t v39 = sub_2355BCB60();
    os_log_type_t v40 = sub_2355BCF70();
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v71 = v12;
    if (v41)
    {
      uint64_t v74 = v11;
      uint64_t v42 = swift_slowAlloc();
      uint64_t v73 = a5;
      uint64_t v43 = (uint8_t *)v42;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v67 = v38;
      uint64_t v45 = v44;
      uint64_t v77 = (void (*)(void, void, void))v44;
      os_log_t v69 = a3;
      *(_DWORD *)uint64_t v43 = 136446210;
      uint64_t v46 = sub_2355BC930();
      uint64_t v76 = sub_2355745F0(v46, v47, (uint64_t *)&v77);
      uint64_t v11 = v74;
      a3 = v69;
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v39, v40, "INPlayMediaIntentHandler#searchSpotlight %{public}s No results from local search", v43, 0xCu);
      swift_arrayDestroy();
      uint64_t v48 = v45;
      uint64_t v38 = v67;
      MEMORY[0x237DE3BF0](v48, -1, -1);
      uint64_t v49 = v43;
      a5 = v73;
      MEMORY[0x237DE3BF0](v49, -1, -1);

      uint64_t v50 = v71;
    }
    else
    {

      uint64_t v50 = v12;
    }
    uint64_t v55 = *(void (**)(char *, uint64_t))(v50 + 8);
    v55(v20, v11);
    if (v72)
    {
      ((void (*)(char *, uint64_t, uint64_t))v70)(v15, v38, v11);
      swift_retain();
      uint64_t v56 = sub_2355BCB60();
      os_log_type_t v57 = sub_2355BCF70();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = swift_slowAlloc();
        os_log_t v69 = a3;
        id v59 = (uint8_t *)v58;
        uint64_t v60 = swift_slowAlloc();
        uint64_t v77 = (void (*)(void, void, void))v60;
        uint64_t v74 = v11;
        *(_DWORD *)id v59 = 136446210;
        uint64_t v61 = sub_2355BC930();
        uint64_t v76 = sub_2355745F0(v61, v62, (uint64_t *)&v77);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23556D000, v56, v57, "INPlayMediaIntentHandler#searchSpotlight %{public}s Local search using fallback completion due to nil result", v59, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v60, -1, -1);
        MEMORY[0x237DE3BF0](v59, -1, -1);

        uint64_t v63 = v15;
        uint64_t v64 = v74;
      }
      else
      {

        uint64_t v63 = v15;
        uint64_t v64 = v11;
      }
      v55(v63, v64);
      uint64_t v65 = (uint64_t)v72;
      v72(v68, v75, a5);
      return sub_2355B91CC(v65);
    }
    else
    {
      return ((uint64_t (*)(void))v75)(0);
    }
  }
}

id INPlayMediaIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INPlayMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_2355B6DE0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1E0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2355B8290(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2355B6EF0(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C930);
  uint64_t v10 = *(void *)(sub_2355BC0A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2355BD270();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2355BC0A0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2355B8138(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2355B7158(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_2355B7184(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2355B71AC@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2355B71DC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
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
        sub_23557DC00(0, (unint64_t *)&qword_26880C210);
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

uint64_t sub_2355B7370(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2355B73D0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2355B7390(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2355B7610(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2355B73B0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2355B7780(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2355B73D0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26880C930);
  uint64_t v10 = *(void *)(sub_2355BC0A0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2355BC0A0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

uint64_t sub_2355B7610(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C900);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

uint64_t sub_2355B7780(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C1E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

unint64_t sub_2355B78EC(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x237DE3C00](&v3, 8);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x237DE3C00](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2355B7978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  v54[3] = a17;
  v54[4] = a25;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v54);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a17 - 8) + 32))(boxed_opaque_existential_1, a2, a17);
  v53[3] = a14;
  v53[4] = a22;
  uint64_t v30 = __swift_allocate_boxed_opaque_existential_1(v53);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a14 - 8) + 32))(v30, a3, a14);
  v52[3] = a19;
  v52[4] = a27;
  uint64_t v31 = __swift_allocate_boxed_opaque_existential_1(v52);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a19 - 8) + 32))(v31, a4, a19);
  v51[3] = a15;
  v51[4] = a23;
  unint64_t v32 = __swift_allocate_boxed_opaque_existential_1(v51);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a15 - 8) + 32))(v32, a5, a15);
  v50[3] = a16;
  v50[4] = a24;
  id v33 = __swift_allocate_boxed_opaque_existential_1(v50);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a16 - 8) + 32))(v33, a7, a16);
  v49[3] = a13;
  v49[4] = a21;
  id v34 = __swift_allocate_boxed_opaque_existential_1(v49);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a13 - 8) + 32))(v34, a8, a13);
  v48[3] = a18;
  v48[4] = a26;
  uint64_t v35 = __swift_allocate_boxed_opaque_existential_1(v48);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a18 - 8) + 32))(v35, a9, a18);
  v47[3] = a20;
  v47[4] = a28;
  os_log_t v36 = __swift_allocate_boxed_opaque_existential_1(v47);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a20 - 8) + 32))(v36, a11, a20);
  *(void *)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_playbackService] = a1;
  sub_235574CD0((uint64_t)v54, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch]);
  sub_235574CD0((uint64_t)v53, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider]);
  sub_235574CD0((uint64_t)v52, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying]);
  sub_235574CD0((uint64_t)v51, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider]);
  sub_235574CD0((uint64_t)v49, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider]);
  sub_235574CD0(a6, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_accountProvider]);
  sub_235574CD0((uint64_t)v50, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_featureFlagProvider]);
  sub_235574CD0((uint64_t)v48, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nearDeviceProvider]);
  sub_235574CD0(a10, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider]);
  sub_235574CD0((uint64_t)v47, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_onscreenEntityProvider]);
  v46.receiver = a12;
  v46.super_class = (Class)type metadata accessor for INPlayMediaIntentHandler();
  id v37 = objc_msgSendSuper2(&v46, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1Tm(a10);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1Tm(a6);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
  return v37;
}

id sub_2355B7D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12)
{
  v42[3] = sub_2355BC360();
  v42[4] = MEMORY[0x263F6CB38];
  v42[0] = a6;
  v41[3] = sub_2355BBFF0();
  v41[4] = MEMORY[0x263F6CA50];
  v41[0] = a10;
  v40[3] = &type metadata for INLocalSearchProvider;
  v40[4] = &protocol witness table for INLocalSearchProvider;
  uint64_t v19 = swift_allocObject();
  v40[0] = v19;
  long long v20 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v19 + 32) = v20;
  *(void *)(v19 + 48) = *(void *)(a2 + 32);
  uint64_t v21 = sub_2355BC280();
  v39[3] = v21;
  v39[4] = MEMORY[0x263F6CB18];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v39);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(boxed_opaque_existential_1, a3, v21);
  uint64_t v23 = sub_2355BC5D0();
  void v38[3] = v23;
  v38[4] = MEMORY[0x263F6CB80];
  id v24 = __swift_allocate_boxed_opaque_existential_1(v38);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v24, a4, v23);
  v37[3] = sub_2355BC4F0();
  v37[4] = MEMORY[0x263F6CB50];
  v37[0] = a5;
  uint64_t v25 = sub_2355BC670();
  v36[3] = v25;
  v36[4] = MEMORY[0x263F6CB98];
  id v26 = __swift_allocate_boxed_opaque_existential_1(v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 32))(v26, a7, v25);
  v35[3] = sub_2355BC850();
  v35[4] = MEMORY[0x263F6CC38];
  v35[0] = a8;
  v34[3] = sub_2355BC5B0();
  v34[4] = MEMORY[0x263F6CB78];
  v34[0] = a9;
  uint64_t v27 = sub_2355BC7E0();
  v33[3] = v27;
  v33[4] = MEMORY[0x263F6CC10];
  os_log_type_t v28 = __swift_allocate_boxed_opaque_existential_1(v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v28, a11, v27);
  *(void *)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_playbackService] = a1;
  sub_235574CD0((uint64_t)v40, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch]);
  sub_235574CD0((uint64_t)v39, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider]);
  sub_235574CD0((uint64_t)v38, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying]);
  sub_235574CD0((uint64_t)v37, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider]);
  sub_235574CD0((uint64_t)v35, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider]);
  sub_235574CD0((uint64_t)v42, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_accountProvider]);
  sub_235574CD0((uint64_t)v36, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_featureFlagProvider]);
  sub_235574CD0((uint64_t)v34, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nearDeviceProvider]);
  sub_235574CD0((uint64_t)v41, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider]);
  sub_235574CD0((uint64_t)v33, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_onscreenEntityProvider]);
  v32.receiver = a12;
  v32.super_class = (Class)type metadata accessor for INPlayMediaIntentHandler();
  id v29 = objc_msgSendSuper2(&v32, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
  return v29;
}

uint64_t sub_2355B8138(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2355BC0A0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

uint64_t sub_2355B8290(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2355BD2B0();
  __break(1u);
  return result;
}

id sub_2355B8384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v67 = a8;
  uint64_t v60 = a7;
  uint64_t v70 = a6;
  uint64_t v65 = a5;
  uint64_t v59 = a4;
  uint64_t v57 = a3;
  uint64_t v68 = a10;
  uint64_t v69 = a1;
  uint64_t v66 = a9;
  uint64_t v64 = a11;
  uint64_t v63 = sub_2355BC7E0();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  unint64_t v62 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_2355BC670();
  uint64_t v13 = *(void *)(v71 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v71);
  uint64_t v58 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v49 - v16;
  uint64_t v18 = sub_2355BC5D0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v56 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v49 - v22;
  uint64_t v24 = sub_2355BC280();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  os_log_type_t v28 = (char *)&v49 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = v28;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v49 - v29;
  long long v31 = *(_OWORD *)(a2 + 16);
  v73[0] = *(_OWORD *)a2;
  v73[1] = v31;
  uint64_t v74 = *(void *)(a2 + 32);
  objc_super v32 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 32);
  uint64_t v55 = v24;
  v32((char *)&v49 - v29, v57, v24);
  uint64_t v54 = v19;
  id v33 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 32);
  uint64_t v52 = v23;
  uint64_t v53 = v18;
  v33(v23, v59, v18);
  uint64_t v34 = v13;
  uint64_t v51 = v13;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  uint64_t v50 = v17;
  uint64_t v36 = v71;
  v35(v17, v60, v71);
  uint64_t v60 = (char *)objc_allocWithZone((Class)type metadata accessor for INPlayMediaIntentHandler());
  sub_2355A6E94((uint64_t)v73, (uint64_t)v72);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v28, v30, v24);
  id v37 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  uint64_t v38 = (uint64_t)v56;
  v37(v56, v23, v18);
  uint64_t v39 = (uint64_t)v58;
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v58, v17, v36);
  uint64_t v41 = v61;
  uint64_t v40 = (uint64_t)v62;
  uint64_t v43 = v63;
  uint64_t v42 = v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v64, v63);
  uint64_t v44 = v65;
  swift_retain();
  uint64_t v45 = v67;
  swift_retain();
  uint64_t v46 = swift_retain();
  id v47 = sub_2355B7D8C(v69, (uint64_t)v72, (uint64_t)v49, v38, v44, v70, v39, v45, v46, v68, v40, v60);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v43);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v71);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v52, v53);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v30, v55);
  sub_2355B88BC((uint64_t)v73);
  return v47;
}

uint64_t sub_2355B88BC(uint64_t a1)
{
  return a1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

id sub_2355B8960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21,long long a22,long long a23,uint64_t a24,uint64_t a25)
{
  uint64_t v88 = a8;
  uint64_t v85 = a7;
  uint64_t v97 = a6;
  uint64_t v83 = a5;
  uint64_t v81 = a4;
  uint64_t v79 = a3;
  uint64_t v77 = a2;
  long long v93 = a22;
  long long v94 = a21;
  long long v92 = a23;
  uint64_t v90 = a25;
  uint64_t v91 = a24;
  uint64_t v89 = a11;
  uint64_t v95 = a10;
  uint64_t v96 = a1;
  uint64_t v87 = a9;
  uint64_t v70 = a15;
  uint64_t v72 = a16;
  uint64_t v64 = a14;
  uint64_t v75 = a13;
  uint64_t v86 = a20;
  uint64_t v84 = *(void *)(a20 - 8);
  uint64_t v80 = a18;
  uint64_t v25 = MEMORY[0x270FA5388](a16);
  uint64_t v82 = (char *)&v62 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = *(void *)(v27 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v76 = (char *)&v62 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v73 = (char *)&v62 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = *(void *)(v31 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v98 = (uint64_t)&v62 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v33);
  uint64_t v39 = (char *)&v62 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = v39;
  uint64_t v63 = a19;
  uint64_t v40 = *(void *)(a19 - 8);
  uint64_t v41 = MEMORY[0x270FA5388](v37);
  uint64_t v43 = (char *)&v62 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = v43;
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = MEMORY[0x270FA5388](v41);
  uint64_t v48 = (char *)&v62 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = v48;
  uint64_t v67 = a17;
  uint64_t v49 = *(void *)(a17 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v51 = (char *)&v62 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = (char *)objc_allocWithZone((Class)type metadata accessor for INPlayMediaIntentHandler());
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v51, v77, a17);
  uint64_t v52 = v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v48, v79, v64);
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v43, v81, a19);
  uint64_t v53 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v39, v83, v70);
  uint64_t v54 = v72;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 16))(v98, v85, v72);
  uint64_t v55 = (uint64_t)v73;
  uint64_t v56 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v73, v88, v75);
  uint64_t v57 = (uint64_t)v76;
  uint64_t v58 = v80;
  (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v76, v87, v80);
  uint64_t v59 = (uint64_t)v82;
  uint64_t v60 = v86;
  (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v82, v89, v86);
  return sub_2355B7978(v96, (uint64_t)v51, (uint64_t)v68, (uint64_t)v66, (uint64_t)v65, v97, v98, v55, v57, v95, v59, v69, v56, v52, v53, v54, v67, v58, v63,
           v60,
           v94,
           *((uint64_t *)&v94 + 1),
           v93,
           *((uint64_t *)&v93 + 1),
           v92,
           *((uint64_t *)&v92 + 1),
           v91,
           v90);
}

uint64_t sub_2355B8FDC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2355B9014()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2355B905C()
{
  return sub_2355A804C(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_2355B9080()
{
  unint64_t result = qword_26880C798;
  if (!qword_26880C798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26880C790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C798);
  }
  return result;
}

uint64_t sub_2355B90E0(uint64_t a1)
{
  return sub_2355B9D5C(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23559680C);
}

uint64_t sub_2355B90F8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2355B9130(void (*a1)(id *), uint64_t a2)
{
  sub_2355B0198(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t type metadata accessor for INPlayMediaIntentHandler()
{
  return self;
}

uint64_t sub_2355B915C()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2355B91AC(void *a1)
{
  return sub_2355B65D0(a1, *(void (**)(void, void, void))(v1 + 16), *(NSObject **)(v1 + 24), *(void (**)(uint64_t))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_2355B91BC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2355B91CC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2355B91DC(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2355BD280();
  unint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2355BD280();
    unint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2355BD280();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v10 + 1;
      sub_2355BD240();
      uint64_t v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2355BD290();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

uint64_t sub_2355B9380(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = sub_2355BCB80();
  uint64_t v36 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2355BCB50();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v31 - v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  uint64_t v14 = qword_26880C118;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  id v15 = (id)logObject;
  sub_2355BCB30();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = "playMediaIntentHandlerResolveNowPlayingItem";
  *(void *)(v18 + 24) = 43;
  *(unsigned char *)(v18 + 32) = 2;
  uint64_t v19 = *(void (**)(unint64_t, char *))(v7 + 32);
  uint64_t v35 = v6;
  v19(v18 + v16, v10);
  uint64_t v20 = (void *)(v18 + v17);
  *uint64_t v20 = sub_2355B981C;
  v20[1] = v13;
  swift_retain();
  sub_2355BD140();
  uint64_t v33 = v12;
  sub_2355BCB20();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_2355B90E0;
  *(void *)(v21 + 24) = v18;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_235596F00;
  *(void *)(v22 + 24) = v21;
  uint64_t v23 = qword_26880C108;
  swift_retain();
  swift_retain();
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v24 = v32;
  uint64_t v25 = __swift_project_value_buffer(v32, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v5, v25, v24);
  uint64_t v26 = sub_2355BCB60();
  os_log_type_t v27 = sub_2355BCF60();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_23556D000, v26, v27, "INPlayMediaIntentHandler: resolveNowPlayingItem resolving...", v28, 2u);
    MEMORY[0x237DE3BF0](v28, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v36 + 8))(v5, v24);
  __swift_project_boxed_opaque_existential_1((void *)(v34 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying), *(void *)(v34 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying + 24));
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_23559DB78;
  *(void *)(v29 + 24) = v22;
  sub_2355BC6B0();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v33, v35);
  return swift_release();
}

uint64_t sub_2355B981C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_2355B984C(uint64_t a1)
{
  return sub_2355AF480(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2355B9854(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2355B989C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2355B98D4(uint64_t a1)
{
  sub_2355AF404(a1, *(void *)(v1 + 16));
}

uint64_t sub_2355B98DC()
{
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26880C880) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();

  swift_release();
  uint64_t v6 = v0 + v3 + v1[14];
  uint64_t v7 = sub_2355BC600();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t sub_2355B99F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26880C880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2355B9A60(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26880C880) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (void (*)(id))v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (void *)v1[4];
  uint64_t v8 = *(void **)((char *)v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_2355B0B80(a1, v5, v6, v7, (void *)((char *)v1 + v4), v8);
}

uint64_t sub_2355B9B08()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2355B9B50(uint64_t a1)
{
  return sub_2355B17A0(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void (**)(id))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_2355B9B60(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_23557E098;
  return sub_2355B2498(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2355B9C28()
{
  return sub_2355B219C(*(void (**)(id))(v0 + 16));
}

uint64_t objectdestroy_56Tm()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2355B9C90(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_23557DD2C;
  return sub_2355B2498(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2355B9D5C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(sub_2355BCB50() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + v5;
  uint64_t v9 = (uint64_t *)(v2 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = *(unsigned __int8 *)(v2 + 32);
  return a2(a1, v6, v7, v12, v8, v10, v11);
}

void sub_2355B9E18(void (*a1)(uint64_t *), uint64_t a2)
{
  sub_2355A8648(a1, a2, *(void **)(v2 + 16), *(char **)(v2 + 24));
}

uint64_t sub_2355B9E20()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2355B9E58()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2355B9EB0(int a1)
{
  return sub_2355A95EC(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void (**)(uint64_t))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_2355B9EC0(void *a1, uint64_t a2, void *a3, void (*a4)(uint64_t), uint64_t a5, int a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v103 = a2;
  id v117 = a1;
  uint64_t v15 = sub_2355BCB80();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  unint64_t v102 = (char *)&v100 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v112 = (char *)&v100 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v104 = (char *)&v100 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v116 = (char *)&v100 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  unint64_t v114 = (char *)&v100 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v100 - v27;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = a3;
  *(void *)(v29 + 24) = a4;
  os_log_type_t v108 = a4;
  *(void *)(v29 + 32) = a5;
  int v107 = a6;
  *(unsigned char *)(v29 + 40) = a6;
  *(void *)(v29 + 48) = a7;
  *(void *)(v29 + 56) = a8;
  uint64_t v115 = v29;
  *(void *)(v29 + 64) = a9;
  uint64_t v30 = qword_26880C108;
  id v106 = a3;
  uint64_t v109 = a5;
  swift_retain();
  id v105 = a7;
  uint64_t v111 = a8;
  swift_bridgeObjectRetain();
  uint64_t v110 = a9;
  swift_retain();
  if (v30 != -1) {
    swift_once();
  }
  uint64_t v31 = __swift_project_value_buffer(v15, (uint64_t)qword_26880D108);
  uint64_t v118 = *(uint8_t **)(v16 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v118)(v28, v31, v15);
  uint64_t v32 = sub_2355BCB60();
  os_log_type_t v33 = sub_2355BCF60();
  uint64_t v34 = v15;
  uint64_t v35 = v16;
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl(&dword_23556D000, v32, v33, "INPlayMediaIntentHandler#item looking in private audiosearch results...", v36, 2u);
    uint64_t v37 = v36;
    uint64_t v34 = v15;
    uint64_t v35 = v16;
    MEMORY[0x237DE3BF0](v37, -1, -1);
  }

  uint64_t v39 = *(void (**)(char *, uint64_t))(v35 + 8);
  uint64_t v38 = v35 + 8;
  uint64_t v113 = v39;
  v39(v28, v34);
  id v40 = v117;
  id v41 = objc_msgSend(v117, sel_privatePlayMediaIntentData);
  uint64_t v42 = v114;
  uint64_t v43 = v115;
  if (!v41
    || (uint64_t v44 = v41,
        id v45 = objc_msgSend(v41, sel_audioSearchResults),
        v44,
        !v45))
  {
LABEL_30:
    ((void (*)(char *, uint64_t, uint64_t))v118)(v42, v31, v34);
    uint64_t v71 = sub_2355BCB60();
    os_log_type_t v72 = sub_2355BCF70();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      uint64_t v74 = swift_slowAlloc();
      uint64_t v101 = v34;
      uint64_t v75 = v74;
      v120[0] = v74;
      *(_DWORD *)uint64_t v73 = 136446210;
      uint64_t v76 = sub_2355BC930();
      uint64_t v119 = sub_2355745F0(v76, v77, v120);
      id v40 = v117;
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v71, v72, "INPlayMediaIntentHandler#item %{public}s Intent has missing or invalid audioSearchResults (possibly expected for createRadio or wholeLibrary queries)", v73, 0xCu);
      swift_arrayDestroy();
      uint64_t v78 = v75;
      uint64_t v34 = v101;
      MEMORY[0x237DE3BF0](v78, -1, -1);
      uint64_t v79 = v73;
      uint64_t v43 = v115;
      MEMORY[0x237DE3BF0](v79, -1, -1);

      uint64_t v80 = v113;
      v113(v114, v34);
    }
    else
    {

      uint64_t v80 = v113;
      v113(v42, v34);
    }
    ((void (*)(char *, uint64_t, uint64_t))v118)(v116, v31, v34);
    uint64_t v81 = sub_2355BCB60();
    os_log_type_t v82 = sub_2355BCF60();
    if (os_log_type_enabled(v81, v82))
    {
      uint64_t v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v83 = 0;
      _os_log_impl(&dword_23556D000, v81, v82, "INPlayMediaIntentHandler#item evaluating if create radio...", v83, 2u);
      MEMORY[0x237DE3BF0](v83, -1, -1);
    }

    v80(v116, v34);
    char v84 = sub_2355BD0D0();
    if (sub_2355BD0F0())
    {
      char v85 = sub_2355BD070();
      if ((v84 & 1) == 0)
      {
        if ((v85 & 1) != 0 && (sub_2355BD0B0() & 1) == 0)
        {
          sub_2355B9380((uint64_t)sub_2355BBD30, v43);
          return swift_release();
        }
LABEL_43:
        ((void (*)(char *, uint64_t, uint64_t))v118)(v112, v31, v34);
        long long v93 = sub_2355BCB60();
        os_log_type_t v94 = sub_2355BCF80();
        if (os_log_type_enabled(v93, v94))
        {
          uint64_t v95 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v95 = 0;
          _os_log_impl(&dword_23556D000, v93, v94, "INPlayMediaIntentHandler#item not create radio, trying local search as fallback", v95, 2u);
          MEMORY[0x237DE3BF0](v95, -1, -1);
        }

        v80(v112, v34);
        sub_2355B61FC(v40, 0, 0, (uint64_t)sub_2355BBD30, v43);
        return swift_release();
      }
    }
    else if ((v84 & 1) == 0)
    {
      goto LABEL_43;
    }
    uint64_t v86 = v104;
    ((void (*)(char *, uint64_t, uint64_t))v118)(v104, v31, v34);
    uint64_t v87 = sub_2355BCB60();
    os_log_type_t v88 = sub_2355BCF80();
    if (os_log_type_enabled(v87, v88))
    {
      uint64_t v89 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      v120[0] = v90;
      *(_DWORD *)uint64_t v89 = 136446210;
      uint64_t v91 = sub_2355BC930();
      uint64_t v119 = sub_2355745F0(v91, v92, v120);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v87, v88, "INPlayMediaIntentHandler#item %{public}s Creating radio station from currently playing item", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v90, -1, -1);
      MEMORY[0x237DE3BF0](v89, -1, -1);

      v113(v104, v34);
    }
    else
    {

      v80(v86, v34);
    }
    uint64_t v96 = v111;
    uint64_t v98 = (uint64_t)v105;
    id v97 = v106;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v99 = swift_allocObject();
    *(_OWORD *)(v99 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    *(void *)(v99 + 32) = sub_2355BCEC0();
    v120[0] = v99;
    sub_2355BCDD0();
    sub_2355A96BC(v120[0], v97, v108, v109, v107 & 1, v98, v96, v110);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v46 = sub_2355BCDB0();

  if (!(v46 >> 62))
  {
    if (*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  uint64_t v70 = sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v70)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    id v40 = v117;
    goto LABEL_30;
  }
LABEL_9:
  unint64_t v47 = sub_2355BCF00();
  swift_bridgeObjectRelease();
  uint64_t v48 = v102;
  ((void (*)(char *, uint64_t, uint64_t))v118)(v102, v31, v34);
  swift_bridgeObjectRetain_n();
  uint64_t v49 = sub_2355BCB60();
  int v50 = sub_2355BCF80();
  if (!os_log_type_enabled(v49, (os_log_type_t)v50))
  {

    swift_bridgeObjectRelease_n();
    v113(v48, v34);
LABEL_27:
    sub_2355A96BC(v47, v106, v108, v109, v107 & 1, (uint64_t)v105, v111, v110);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  uint64_t v51 = (uint8_t *)swift_slowAlloc();
  uint64_t v52 = swift_slowAlloc();
  v120[0] = v52;
  uint64_t v118 = v51;
  *(_DWORD *)uint64_t v51 = 136315138;
  uint64_t v101 = v34;
  if (v47 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2355BD280();
    uint64_t v53 = result;
  }
  else
  {
    uint64_t v53 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v100 = v38;
  LODWORD(v117) = v50;
  uint64_t v116 = (char *)v52;
  if (!v53)
  {
    uint64_t v56 = (void *)MEMORY[0x263F8EE78];
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v65 = v118;
    uint64_t v66 = MEMORY[0x237DE3110](v56, MEMORY[0x263F8D310]);
    unint64_t v68 = v67;
    swift_bridgeObjectRelease();
    uint64_t v119 = sub_2355745F0(v66, v68, v120);
    sub_2355BD1B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23556D000, v49, (os_log_type_t)v117, "INPlayMediaIntentHandler#item using unique private server search results: %s", v65, 0xCu);
    uint64_t v69 = v116;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v69, -1, -1);
    MEMORY[0x237DE3BF0](v65, -1, -1);

    v113(v102, v101);
    goto LABEL_27;
  }
  if (v53 >= 1)
  {
    uint64_t v55 = 0;
    uint64_t v56 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v47 & 0xC000000000000001) != 0) {
        id v57 = (id)MEMORY[0x237DE35A0](v55, v47);
      }
      else {
        id v57 = *(id *)(v47 + 8 * v55 + 32);
      }
      uint64_t v58 = v57;
      uint64_t v59 = sub_2355BCEE0();
      uint64_t v61 = v60;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v56 = sub_2355B6DE0(0, v56[2] + 1, 1, v56);
      }
      unint64_t v63 = v56[2];
      unint64_t v62 = v56[3];
      if (v63 >= v62 >> 1) {
        uint64_t v56 = sub_2355B6DE0((void *)(v62 > 1), v63 + 1, 1, v56);
      }
      ++v55;
      v56[2] = v63 + 1;
      uint64_t v64 = &v56[2 * v63];
      v64[4] = v59;
      v64[5] = v61;
    }
    while (v53 != v55);
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_2355BAAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2355BCB50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2355BCB80();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26880C108 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_26880D108);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = sub_2355BCB60();
  os_log_type_t v14 = sub_2355BCF60();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = v7;
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    uint64_t v18 = a1;
    uint64_t v19 = a2;
    uint64_t v20 = v15;
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_23556D000, v13, v14, "INPlayMediaIntentHandler#logSpotlightResult", v15, 2u);
    uint64_t v21 = v20;
    a2 = v19;
    a1 = v18;
    uint64_t v4 = v17;
    uint64_t v5 = v16;
    uint64_t v7 = v27;
    MEMORY[0x237DE3BF0](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_2355BD150();
  if (qword_26880C118 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C908);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_2355BE520;
  uint64_t v23 = MEMORY[0x263F8D6C8];
  uint64_t v24 = MEMORY[0x263F8D750];
  *(void *)(v22 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v22 + 64) = v24;
  *(void *)(v22 + 32) = a1;
  *(void *)(v22 + 96) = v23;
  *(void *)(v22 + 104) = v24;
  *(void *)(v22 + 72) = a2;
  sub_2355BCB40();
  sub_2355BCB10();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2355BAE1C(void *a1, void *a2, void *a3, void (*a4)(uint64_t), uint64_t a5, int a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v81 = a2;
  os_log_type_t v88 = a1;
  uint64_t v15 = sub_2355BCB80();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v78 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v77 = (char *)&v76 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v89 = (char *)&v76 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v76 - v23;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a3;
  *(void *)(v25 + 24) = a4;
  uint64_t v80 = a4;
  *(void *)(v25 + 32) = a5;
  int v79 = a6;
  *(unsigned char *)(v25 + 40) = a6;
  *(void *)(v25 + 48) = a7;
  *(void *)(v25 + 56) = a8;
  uint64_t v83 = v25;
  *(void *)(v25 + 64) = a9;
  uint64_t v26 = qword_26880C108;
  id v27 = a3;
  uint64_t v87 = a5;
  swift_retain_n();
  id v28 = a7;
  uint64_t v86 = a8;
  swift_bridgeObjectRetain_n();
  uint64_t v85 = a9;
  swift_retain_n();
  id v84 = v27;
  id v82 = v28;
  if (v26 != -1) {
    swift_once();
  }
  uint64_t v29 = __swift_project_value_buffer(v15, (uint64_t)qword_26880D108);
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v30(v24, v29, v15);
  uint64_t v31 = sub_2355BCB60();
  os_log_type_t v32 = sub_2355BCF60();
  uint64_t v33 = v15;
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_23556D000, v31, v32, "INPlayMediaIntentHandler#searchMediaItem working to resolve item to play...", v34, 2u);
    uint64_t v35 = v34;
    uint64_t v33 = v15;
    MEMORY[0x237DE3BF0](v35, -1, -1);
  }

  uint64_t v38 = *(char **)(v16 + 8);
  uint64_t v36 = (char *)(v16 + 8);
  uint64_t v37 = v38;
  ((void (*)(char *, uint64_t))v38)(v24, v33);
  v30(v89, v29, v33);
  uint64_t v39 = sub_2355BCB60();
  os_log_type_t v40 = sub_2355BCF60();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = v33;
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v42 = 0;
    _os_log_impl(&dword_23556D000, v39, v40, "INPlayMediaIntentHandler#searchMediaItem evaluating if create radio and server search was suppressed (we have to handle on client)...", v42, 2u);
    uint64_t v43 = v42;
    uint64_t v33 = v41;
    MEMORY[0x237DE3BF0](v43, -1, -1);
  }

  ((void (*)(char *, uint64_t))v37)(v89, v33);
  uint64_t v44 = v88;
  if (sub_2355BD0D0() & 1) != 0 && (sub_2355BD070())
  {
    id v45 = v77;
    v30(v77, v29, v33);
    unint64_t v46 = sub_2355BCB60();
    os_log_type_t v47 = sub_2355BCF80();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = v45;
      uint64_t v50 = swift_slowAlloc();
      unint64_t v91 = v50;
      uint64_t v89 = v36;
      *(_DWORD *)uint64_t v48 = 136446210;
      uint64_t v51 = sub_2355BC930();
      uint64_t v90 = sub_2355745F0(v51, v52, (uint64_t *)&v91);
      sub_2355BD1B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23556D000, v46, v47, "INPlayMediaIntentHandler#searchMediaItem %{public}s Creating radio station from currently playing item when server search was suppressed", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DE3BF0](v50, -1, -1);
      MEMORY[0x237DE3BF0](v48, -1, -1);

      ((void (*)(char *, uint64_t))v37)(v49, v33);
    }
    else
    {

      ((void (*)(char *, uint64_t))v37)(v45, v33);
    }
    uint64_t v72 = v87;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
    uint64_t v73 = swift_allocObject();
    *(_OWORD *)(v73 + 16) = xmmword_2355BDD80;
    sub_23557DC00(0, (unint64_t *)&qword_26880C210);
    *(void *)(v73 + 32) = sub_2355BCEC0();
    unint64_t v91 = v73;
    sub_2355BCDD0();
    id v74 = v84;
    id v59 = v82;
    sub_2355A96BC(v91, v84, v80, v72, v79 & 1, (uint64_t)v82, v86, v85);

    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v53 = swift_allocObject();
    uint64_t v54 = v81;
    *(void *)(v53 + 16) = v81;
    id v55 = v54;
    if (sub_2355BD090())
    {
      uint64_t v81 = (void *)v53;
      uint64_t v89 = v37;
      uint64_t v56 = v78;
      v30(v78, v29, v33);
      id v57 = sub_2355BCB60();
      os_log_type_t v58 = sub_2355BCF80();
      if (os_log_type_enabled(v57, v58))
      {
        id v59 = v82;
        uint64_t v60 = swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        unint64_t v91 = v61;
        *(_DWORD *)uint64_t v60 = 136446210;
        uint64_t v80 = (void (*)(uint64_t))(v60 + 4);
        uint64_t v62 = sub_2355BC930();
        uint64_t v90 = sub_2355745F0(v62, v63, (uint64_t *)&v91);
        sub_2355BD1B0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23556D000, v57, v58, "INPlayMediaIntentHandler#searchMediaItem %{public}s Executing local search as force spotlight search flag was present", (uint8_t *)v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DE3BF0](v61, -1, -1);
        MEMORY[0x237DE3BF0](v60, -1, -1);

        uint64_t v64 = v78;
      }
      else
      {
        id v59 = v82;

        uint64_t v64 = v56;
      }
      ((void (*)(char *, uint64_t))v89)(v64, v33);
      uint64_t v70 = v83;
      uint64_t v71 = (uint64_t)v81;
      sub_2355BAAD4(1, 0);
      swift_retain();
      sub_2355B61FC(v88, (uint64_t)sub_2355BBD34, v71, (uint64_t)sub_2355BBD30, v70);

      swift_release();
      swift_release_n();
    }
    else
    {
      id v65 = v84;
      uint64_t v66 = v87;
      swift_retain();
      id v59 = v82;
      id v67 = v82;
      uint64_t v68 = v86;
      swift_bridgeObjectRetain();
      uint64_t v69 = v85;
      swift_retain();
      sub_2355B9EC0(v44, (uint64_t)v55, v65, v80, v66, v79 & 1, v67, v68, v69);
      swift_release();
      swift_release();

      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
    }
  }
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

void sub_2355BB664(void *a1, void *a2, void *a3, void (*a4)(uint64_t), uint64_t a5, int a6, void *a7, uint64_t a8, uint64_t a9)
{
  int v59 = a6;
  uint64_t v60 = a4;
  id v57 = a2;
  uint64_t v14 = sub_2355BCB80();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v56 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v53 - v18;
  uint64_t v20 = qword_26880C108;
  id v58 = a3;
  uint64_t v62 = a5;
  swift_retain();
  id v61 = a7;
  swift_bridgeObjectRetain();
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = (uint8_t *)__swift_project_value_buffer(v14, (uint64_t)qword_26880D108);
  uint64_t v54 = *(void (**)(char *))(v15 + 16);
  id v55 = v21;
  v54(v19);
  uint64_t v22 = sub_2355BCB60();
  os_log_type_t v23 = sub_2355BCF60();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_23556D000, v22, v23, "INPlayMediaIntentHandler#item working to resolve item to play...", v24, 2u);
    MEMORY[0x237DE3BF0](v24, -1, -1);
  }

  uint64_t v25 = *(void (**)(char *, uint64_t))(v15 + 8);
  v25(v19, v14);
  id v26 = objc_msgSend(a1, sel_mediaItems);
  if (!v26) {
    goto LABEL_22;
  }
  id v27 = v26;
  uint64_t v53 = v25;
  sub_23557DC00(0, (unint64_t *)&qword_26880C210);
  unint64_t v28 = sub_2355BCDB0();

  if (!(v28 >> 62))
  {
    uint64_t v29 = *(void **)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v29) {
      goto LABEL_8;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = (void *)sub_2355BD280();
  swift_bridgeObjectRelease();
  if (!v29) {
    goto LABEL_21;
  }
LABEL_8:
  if ((v28 & 0xC000000000000001) != 0)
  {
    id v30 = (id)MEMORY[0x237DE35A0](0, v28);
  }
  else
  {
    if (!*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_26;
    }
    id v30 = *(id *)(v28 + 32);
  }
  uint64_t v29 = v30;
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(a1, sel_mediaItems);
  if (!v31)
  {
LABEL_17:

LABEL_22:
    id v50 = v58;
    uint64_t v51 = v62;
    swift_retain();
    id v49 = v61;
    id v52 = v61;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2355BAE1C(a1, v57, v50, v60, v51, v59 & 1, v52, a8, a9);

    swift_release_n();
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_23;
  }
  os_log_type_t v32 = v31;
  unint64_t v33 = sub_2355BCDB0();

  if (!(v33 >> 62))
  {
    uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_14;
  }
LABEL_26:
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_2355BD280();
  swift_bridgeObjectRelease();
LABEL_14:
  swift_bridgeObjectRelease();
  if (v34 != 1) {
    goto LABEL_17;
  }
  uint64_t v35 = v56;
  ((void (*)(char *, uint8_t *, uint64_t))v54)(v56, v55, v14);
  uint64_t v36 = v35;
  id v37 = v29;
  uint64_t v38 = sub_2355BCB60();
  os_log_type_t v39 = sub_2355BCF80();
  if (os_log_type_enabled(v38, v39))
  {
    os_log_type_t v40 = (uint8_t *)swift_slowAlloc();
    id v57 = (void *)swift_slowAlloc();
    unint64_t v64 = (unint64_t)v57;
    id v55 = v40;
    *(_DWORD *)os_log_type_t v40 = 136446210;
    uint64_t v54 = (void (*)(char *))(v40 + 4);
    uint64_t v41 = sub_2355BCEE0();
    uint64_t v63 = sub_2355745F0(v41, v42, (uint64_t *)&v64);
    sub_2355BD1B0();

    swift_bridgeObjectRelease();
    uint64_t v43 = v55;
    _os_log_impl(&dword_23556D000, v38, v39, "INPlayMediaIntentHandler#item Overriding results with disambiguation selected item: %{public}s", v55, 0xCu);
    uint64_t v44 = v57;
    swift_arrayDestroy();
    MEMORY[0x237DE3BF0](v44, -1, -1);
    MEMORY[0x237DE3BF0](v43, -1, -1);
  }
  else
  {
  }
  v53(v36, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26880C3C0);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_2355BDD80;
  *(void *)(v45 + 32) = v37;
  unint64_t v64 = v45;
  sub_2355BCDD0();
  unint64_t v46 = v64;
  id v47 = v37;
  id v48 = v58;
  id v49 = v61;
  sub_2355A96BC(v46, v58, v60, v62, v59 & 1, (uint64_t)v61, a8, a9);
  swift_release();

  swift_bridgeObjectRelease();
LABEL_23:
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_2355BBC64()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2355BBCC4(uint64_t a1)
{
  return sub_2355AB1EC(a1, *(void **)(v1 + 16), *(void (**)(char *, char *, uint64_t))(v1 + 24), *(void (**)(os_log_t))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

unint64_t sub_2355BBCD8()
{
  unint64_t result = qword_26880C910;
  if (!qword_26880C910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26880C910);
  }
  return result;
}

uint64_t sub_2355BBD34(void *a1, void (*a2)(unint64_t), uint64_t a3)
{
  return sub_2355B27E4(a1, a2, a3);
}

uint64_t objectdestroy_90Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2355BBDE0(unint64_t a1)
{
  return sub_2355A96BC(a1, *(id *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_2355BBDF8()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2355BBE68(char a1)
{
  return *(void *)&aMirt100[8 * a1];
}

uint64_t sub_2355BBE80()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2355BBE90()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2355BBEA0()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_2355BBEB0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2355BBEC0()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_2355BBED0()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_2355BBEE0()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_2355BBEF0()
{
  return MEMORY[0x270F547B0]();
}

uint64_t sub_2355BBF00()
{
  return MEMORY[0x270F547B8]();
}

uint64_t sub_2355BBF10()
{
  return MEMORY[0x270F547D0]();
}

uint64_t sub_2355BBF20()
{
  return MEMORY[0x270F547D8]();
}

uint64_t sub_2355BBF30()
{
  return MEMORY[0x270F54810]();
}

uint64_t sub_2355BBF40()
{
  return MEMORY[0x270F54820]();
}

uint64_t sub_2355BBF50()
{
  return MEMORY[0x270F66C60]();
}

uint64_t sub_2355BBF60()
{
  return MEMORY[0x270F66C80]();
}

uint64_t sub_2355BBF70()
{
  return MEMORY[0x270F670A8]();
}

uint64_t sub_2355BBF80()
{
  return MEMORY[0x270F67E20]();
}

uint64_t sub_2355BBF90()
{
  return MEMORY[0x270F683E0]();
}

uint64_t sub_2355BBFA0()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_2355BBFB0()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_2355BBFC0()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_2355BBFD0()
{
  return MEMORY[0x270F63C90]();
}

uint64_t sub_2355BBFE0()
{
  return MEMORY[0x270F63C98]();
}

uint64_t sub_2355BBFF0()
{
  return MEMORY[0x270F63CA0]();
}

uint64_t sub_2355BC000()
{
  return MEMORY[0x270F63CA8]();
}

uint64_t sub_2355BC010()
{
  return MEMORY[0x270F63CB0]();
}

uint64_t sub_2355BC020()
{
  return MEMORY[0x270F63CB8]();
}

uint64_t sub_2355BC030()
{
  return MEMORY[0x270F63CC0]();
}

uint64_t sub_2355BC040()
{
  return MEMORY[0x270F63CC8]();
}

uint64_t sub_2355BC050()
{
  return MEMORY[0x270F63CD0]();
}

uint64_t sub_2355BC060()
{
  return MEMORY[0x270F63CD8]();
}

uint64_t sub_2355BC070()
{
  return MEMORY[0x270F63CE0]();
}

uint64_t sub_2355BC080()
{
  return MEMORY[0x270F63CE8]();
}

uint64_t sub_2355BC090()
{
  return MEMORY[0x270F63CF0]();
}

uint64_t sub_2355BC0A0()
{
  return MEMORY[0x270F63CF8]();
}

uint64_t sub_2355BC0B0()
{
  return MEMORY[0x270F63D00]();
}

uint64_t sub_2355BC0C0()
{
  return MEMORY[0x270F63D08]();
}

uint64_t sub_2355BC0D0()
{
  return MEMORY[0x270F63D10]();
}

uint64_t sub_2355BC0E0()
{
  return MEMORY[0x270F63D18]();
}

uint64_t sub_2355BC0F0()
{
  return MEMORY[0x270F63D20]();
}

uint64_t sub_2355BC100()
{
  return MEMORY[0x270F63D28]();
}

uint64_t sub_2355BC110()
{
  return MEMORY[0x270F63D30]();
}

uint64_t sub_2355BC120()
{
  return MEMORY[0x270F63D38]();
}

uint64_t sub_2355BC130()
{
  return MEMORY[0x270F63D40]();
}

uint64_t sub_2355BC140()
{
  return MEMORY[0x270F63D48]();
}

uint64_t sub_2355BC150()
{
  return MEMORY[0x270F63D50]();
}

uint64_t sub_2355BC160()
{
  return MEMORY[0x270F63D58]();
}

uint64_t sub_2355BC170()
{
  return MEMORY[0x270F63D60]();
}

uint64_t sub_2355BC180()
{
  return MEMORY[0x270F63D68]();
}

uint64_t sub_2355BC190()
{
  return MEMORY[0x270F63D70]();
}

uint64_t sub_2355BC1A0()
{
  return MEMORY[0x270F63D78]();
}

uint64_t sub_2355BC1B0()
{
  return MEMORY[0x270F63D80]();
}

uint64_t sub_2355BC1C0()
{
  return MEMORY[0x270F63D88]();
}

uint64_t sub_2355BC1D0()
{
  return MEMORY[0x270F63D90]();
}

uint64_t sub_2355BC1E0()
{
  return MEMORY[0x270F63D98]();
}

uint64_t sub_2355BC1F0()
{
  return MEMORY[0x270F63DA0]();
}

uint64_t sub_2355BC200()
{
  return MEMORY[0x270F63DA8]();
}

uint64_t sub_2355BC210()
{
  return MEMORY[0x270F63DB0]();
}

uint64_t sub_2355BC220()
{
  return MEMORY[0x270F63DB8]();
}

uint64_t sub_2355BC230()
{
  return MEMORY[0x270F63DC0]();
}

uint64_t sub_2355BC240()
{
  return MEMORY[0x270F63DC8]();
}

uint64_t sub_2355BC250()
{
  return MEMORY[0x270F63DD0]();
}

uint64_t sub_2355BC260()
{
  return MEMORY[0x270F63DD8]();
}

uint64_t sub_2355BC270()
{
  return MEMORY[0x270F63DE0]();
}

uint64_t sub_2355BC280()
{
  return MEMORY[0x270F63DE8]();
}

uint64_t sub_2355BC290()
{
  return MEMORY[0x270F63DF0]();
}

uint64_t sub_2355BC2A0()
{
  return MEMORY[0x270F63DF8]();
}

uint64_t sub_2355BC2B0()
{
  return MEMORY[0x270F63E00]();
}

uint64_t sub_2355BC2C0()
{
  return MEMORY[0x270F63E08]();
}

uint64_t sub_2355BC2D0()
{
  return MEMORY[0x270F63E10]();
}

uint64_t sub_2355BC2E0()
{
  return MEMORY[0x270F63E18]();
}

uint64_t sub_2355BC2F0()
{
  return MEMORY[0x270F63E20]();
}

uint64_t sub_2355BC300()
{
  return MEMORY[0x270F63E28]();
}

uint64_t sub_2355BC310()
{
  return MEMORY[0x270F63E30]();
}

uint64_t sub_2355BC320()
{
  return MEMORY[0x270F63E38]();
}

uint64_t sub_2355BC330()
{
  return MEMORY[0x270F63E40]();
}

uint64_t sub_2355BC340()
{
  return MEMORY[0x270F63E48]();
}

uint64_t sub_2355BC350()
{
  return MEMORY[0x270F63E50]();
}

uint64_t sub_2355BC360()
{
  return MEMORY[0x270F63E58]();
}

uint64_t sub_2355BC370()
{
  return MEMORY[0x270F63E60]();
}

uint64_t sub_2355BC380()
{
  return MEMORY[0x270F63E68]();
}

uint64_t sub_2355BC390()
{
  return MEMORY[0x270F63E70]();
}

uint64_t sub_2355BC3A0()
{
  return MEMORY[0x270F63E78]();
}

uint64_t sub_2355BC3B0()
{
  return MEMORY[0x270F63E80]();
}

uint64_t sub_2355BC3C0()
{
  return MEMORY[0x270F63E88]();
}

uint64_t sub_2355BC3D0()
{
  return MEMORY[0x270F63E90]();
}

uint64_t sub_2355BC3E0()
{
  return MEMORY[0x270F63E98]();
}

uint64_t sub_2355BC3F0()
{
  return MEMORY[0x270F63EA0]();
}

uint64_t sub_2355BC400()
{
  return MEMORY[0x270F63EA8]();
}

uint64_t sub_2355BC410()
{
  return MEMORY[0x270F63EB0]();
}

uint64_t sub_2355BC420()
{
  return MEMORY[0x270F63EB8]();
}

uint64_t sub_2355BC430()
{
  return MEMORY[0x270F63EC0]();
}

uint64_t sub_2355BC440()
{
  return MEMORY[0x270F63EC8]();
}

uint64_t sub_2355BC450()
{
  return MEMORY[0x270F63ED0]();
}

uint64_t sub_2355BC460()
{
  return MEMORY[0x270F63ED8]();
}

uint64_t sub_2355BC470()
{
  return MEMORY[0x270F63EE0]();
}

uint64_t sub_2355BC480()
{
  return MEMORY[0x270F63EE8]();
}

uint64_t sub_2355BC490()
{
  return MEMORY[0x270F63EF0]();
}

uint64_t sub_2355BC4A0()
{
  return MEMORY[0x270F63EF8]();
}

uint64_t sub_2355BC4B0()
{
  return MEMORY[0x270F63F00]();
}

uint64_t sub_2355BC4C0()
{
  return MEMORY[0x270F63F08]();
}

uint64_t sub_2355BC4D0()
{
  return MEMORY[0x270F63F10]();
}

uint64_t sub_2355BC4E0()
{
  return MEMORY[0x270F63F18]();
}

uint64_t sub_2355BC4F0()
{
  return MEMORY[0x270F63F20]();
}

uint64_t sub_2355BC540()
{
  return MEMORY[0x270F63F48]();
}

uint64_t sub_2355BC550()
{
  return MEMORY[0x270F63F50]();
}

uint64_t sub_2355BC560()
{
  return MEMORY[0x270F63F58]();
}

uint64_t sub_2355BC570()
{
  return MEMORY[0x270F63F60]();
}

uint64_t sub_2355BC580()
{
  return MEMORY[0x270F63F68]();
}

uint64_t sub_2355BC590()
{
  return MEMORY[0x270F63F70]();
}

uint64_t sub_2355BC5A0()
{
  return MEMORY[0x270F63F78]();
}

uint64_t sub_2355BC5B0()
{
  return MEMORY[0x270F63F80]();
}

uint64_t sub_2355BC5C0()
{
  return MEMORY[0x270F63F88]();
}

uint64_t sub_2355BC5D0()
{
  return MEMORY[0x270F63F90]();
}

uint64_t sub_2355BC5E0()
{
  return MEMORY[0x270F63F98]();
}

uint64_t sub_2355BC5F0()
{
  return MEMORY[0x270F63FA0]();
}

uint64_t sub_2355BC600()
{
  return MEMORY[0x270F63FA8]();
}

uint64_t sub_2355BC610()
{
  return MEMORY[0x270F63FB0]();
}

uint64_t sub_2355BC620()
{
  return MEMORY[0x270F63FB8]();
}

uint64_t sub_2355BC630()
{
  return MEMORY[0x270F63FC0]();
}

uint64_t sub_2355BC640()
{
  return MEMORY[0x270F63FC8]();
}

uint64_t sub_2355BC650()
{
  return MEMORY[0x270F63FD0]();
}

uint64_t sub_2355BC660()
{
  return MEMORY[0x270F63FD8]();
}

uint64_t sub_2355BC670()
{
  return MEMORY[0x270F63FE0]();
}

uint64_t sub_2355BC680()
{
  return MEMORY[0x270F63FE8]();
}

uint64_t sub_2355BC690()
{
  return MEMORY[0x270F63FF0]();
}

uint64_t sub_2355BC6A0()
{
  return MEMORY[0x270F63FF8]();
}

uint64_t sub_2355BC6B0()
{
  return MEMORY[0x270F64000]();
}

uint64_t sub_2355BC6C0()
{
  return MEMORY[0x270F64008]();
}

uint64_t sub_2355BC6D0()
{
  return MEMORY[0x270F64010]();
}

uint64_t sub_2355BC6E0()
{
  return MEMORY[0x270F64018]();
}

uint64_t sub_2355BC6F0()
{
  return MEMORY[0x270F64020]();
}

uint64_t sub_2355BC700()
{
  return MEMORY[0x270F64028]();
}

uint64_t sub_2355BC710()
{
  return MEMORY[0x270F64030]();
}

uint64_t sub_2355BC720()
{
  return MEMORY[0x270F64038]();
}

uint64_t sub_2355BC730()
{
  return MEMORY[0x270F64040]();
}

uint64_t sub_2355BC740()
{
  return MEMORY[0x270F64048]();
}

uint64_t sub_2355BC750()
{
  return MEMORY[0x270F64050]();
}

uint64_t sub_2355BC760()
{
  return MEMORY[0x270F64058]();
}

uint64_t sub_2355BC770()
{
  return MEMORY[0x270F64060]();
}

uint64_t sub_2355BC780()
{
  return MEMORY[0x270F64068]();
}

uint64_t sub_2355BC790()
{
  return MEMORY[0x270F64070]();
}

uint64_t sub_2355BC7A0()
{
  return MEMORY[0x270F64078]();
}

uint64_t sub_2355BC7B0()
{
  return MEMORY[0x270F64080]();
}

uint64_t sub_2355BC7C0()
{
  return MEMORY[0x270F64088]();
}

uint64_t sub_2355BC7D0()
{
  return MEMORY[0x270F64090]();
}

uint64_t sub_2355BC7E0()
{
  return MEMORY[0x270F64098]();
}

uint64_t sub_2355BC7F0()
{
  return MEMORY[0x270F640A0]();
}

uint64_t sub_2355BC800()
{
  return MEMORY[0x270F640A8]();
}

uint64_t sub_2355BC810()
{
  return MEMORY[0x270F640B0]();
}

uint64_t sub_2355BC820()
{
  return MEMORY[0x270F640B8]();
}

uint64_t sub_2355BC830()
{
  return MEMORY[0x270F640C0]();
}

uint64_t sub_2355BC840()
{
  return MEMORY[0x270F640C8]();
}

uint64_t sub_2355BC850()
{
  return MEMORY[0x270F640D0]();
}

uint64_t sub_2355BC860()
{
  return MEMORY[0x270F640D8]();
}

uint64_t sub_2355BC870()
{
  return MEMORY[0x270F640E0]();
}

uint64_t sub_2355BC880()
{
  return MEMORY[0x270F640E8]();
}

uint64_t sub_2355BC890()
{
  return MEMORY[0x270F640F0]();
}

uint64_t sub_2355BC8A0()
{
  return MEMORY[0x270F640F8]();
}

uint64_t sub_2355BC8B0()
{
  return MEMORY[0x270F64100]();
}

uint64_t sub_2355BC8C0()
{
  return MEMORY[0x270F64108]();
}

uint64_t sub_2355BC8D0()
{
  return MEMORY[0x270F64110]();
}

uint64_t sub_2355BC8E0()
{
  return MEMORY[0x270F64118]();
}

uint64_t sub_2355BC8F0()
{
  return MEMORY[0x270F64120]();
}

uint64_t sub_2355BC900()
{
  return MEMORY[0x270F64128]();
}

uint64_t sub_2355BC910()
{
  return MEMORY[0x270F64130]();
}

uint64_t sub_2355BC920()
{
  return MEMORY[0x270F64138]();
}

uint64_t sub_2355BC930()
{
  return MEMORY[0x270F64140]();
}

uint64_t sub_2355BC940()
{
  return MEMORY[0x270F0CA30]();
}

uint64_t sub_2355BC950()
{
  return MEMORY[0x270F0CB10]();
}

uint64_t sub_2355BC960()
{
  return MEMORY[0x270F0CB48]();
}

uint64_t sub_2355BC970()
{
  return MEMORY[0x270F71678]();
}

uint64_t sub_2355BC980()
{
  return MEMORY[0x270F71680]();
}

uint64_t sub_2355BC9B0()
{
  return MEMORY[0x270F717C8]();
}

uint64_t sub_2355BC9C0()
{
  return MEMORY[0x270F71890]();
}

uint64_t sub_2355BC9D0()
{
  return MEMORY[0x270F718D0]();
}

uint64_t sub_2355BC9E0()
{
  return MEMORY[0x270F718D8]();
}

uint64_t sub_2355BC9F0()
{
  return MEMORY[0x270F71A50]();
}

uint64_t sub_2355BCA00()
{
  return MEMORY[0x270F71A70]();
}

uint64_t sub_2355BCA10()
{
  return MEMORY[0x270F71BD0]();
}

uint64_t sub_2355BCA20()
{
  return MEMORY[0x270F71C10]();
}

uint64_t sub_2355BCA30()
{
  return MEMORY[0x270F71CC8]();
}

uint64_t sub_2355BCA40()
{
  return MEMORY[0x270F71CE0]();
}

uint64_t sub_2355BCA50()
{
  return MEMORY[0x270F71D60]();
}

uint64_t sub_2355BCA60()
{
  return MEMORY[0x270F71D68]();
}

uint64_t sub_2355BCA70()
{
  return MEMORY[0x270F71D80]();
}

uint64_t sub_2355BCA80()
{
  return MEMORY[0x270F71D90]();
}

uint64_t sub_2355BCA90()
{
  return MEMORY[0x270F71D98]();
}

uint64_t sub_2355BCAA0()
{
  return MEMORY[0x270F652D0]();
}

uint64_t sub_2355BCAB0()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_2355BCAC0()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_2355BCAD0()
{
  return MEMORY[0x270F6FAE8]();
}

uint64_t sub_2355BCAE0()
{
  return MEMORY[0x270F6FAF0]();
}

uint64_t sub_2355BCAF0()
{
  return MEMORY[0x270F6FBF8]();
}

uint64_t sub_2355BCB00()
{
  return MEMORY[0x270F6FC28]();
}

uint64_t sub_2355BCB10()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_2355BCB20()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_2355BCB30()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2355BCB40()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2355BCB50()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2355BCB60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2355BCB70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2355BCB80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2355BCB90()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2355BCBA0()
{
  return MEMORY[0x270FA1040]();
}

uint64_t sub_2355BCBB0()
{
  return MEMORY[0x270FA1048]();
}

uint64_t sub_2355BCBC0()
{
  return MEMORY[0x270FA1050]();
}

uint64_t sub_2355BCBD0()
{
  return MEMORY[0x270FA1058]();
}

uint64_t sub_2355BCBE0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2355BCBF0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2355BCC00()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_2355BCC10()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2355BCC20()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2355BCC30()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2355BCC40()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2355BCC50()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2355BCC60()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2355BCC70()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2355BCC80()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2355BCC90()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2355BCCA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2355BCCB0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2355BCCC0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2355BCCD0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2355BCCE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2355BCCF0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2355BCD00()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2355BCD20()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2355BCD30()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2355BCD40()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2355BCD50()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2355BCD60()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2355BCD70()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2355BCD80()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2355BCD90()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2355BCDA0()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_2355BCDB0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2355BCDC0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2355BCDD0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2355BCDE0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2355BCDF0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2355BCE00()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2355BCE10()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2355BCE20()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2355BCE30()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2355BCE40()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_2355BCE50()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2355BCE60()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2355BCE70()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_2355BCE80()
{
  return MEMORY[0x270EF1CF8]();
}

uint64_t sub_2355BCE90()
{
  return MEMORY[0x270F64148]();
}

uint64_t sub_2355BCEA0()
{
  return MEMORY[0x270F64150]();
}

uint64_t sub_2355BCEB0()
{
  return MEMORY[0x270F64158]();
}

uint64_t sub_2355BCEC0()
{
  return MEMORY[0x270F64160]();
}

uint64_t sub_2355BCED0()
{
  return MEMORY[0x270F64168]();
}

uint64_t sub_2355BCEE0()
{
  return MEMORY[0x270F64170]();
}

uint64_t sub_2355BCEF0()
{
  return MEMORY[0x270F64178]();
}

uint64_t sub_2355BCF00()
{
  return MEMORY[0x270F64180]();
}

uint64_t sub_2355BCF10()
{
  return MEMORY[0x270F64188]();
}

uint64_t sub_2355BCF20()
{
  return MEMORY[0x270F64190]();
}

uint64_t sub_2355BCF30()
{
  return MEMORY[0x270F64198]();
}

uint64_t sub_2355BCF40()
{
  return MEMORY[0x270F641A0]();
}

uint64_t sub_2355BCF50()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2355BCF60()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2355BCF70()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2355BCF80()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2355BCF90()
{
  return MEMORY[0x270F71528]();
}

uint64_t sub_2355BCFA0()
{
  return MEMORY[0x270F641A8]();
}

uint64_t sub_2355BCFB0()
{
  return MEMORY[0x270F641B0]();
}

uint64_t sub_2355BCFC0()
{
  return MEMORY[0x270F641B8]();
}

uint64_t sub_2355BCFD0()
{
  return MEMORY[0x270F641C0]();
}

uint64_t sub_2355BCFE0()
{
  return MEMORY[0x270F641C8]();
}

uint64_t sub_2355BCFF0()
{
  return MEMORY[0x270F641D0]();
}

uint64_t sub_2355BD000()
{
  return MEMORY[0x270F641D8]();
}

uint64_t sub_2355BD010()
{
  return MEMORY[0x270F641E0]();
}

uint64_t sub_2355BD020()
{
  return MEMORY[0x270F641E8]();
}

uint64_t sub_2355BD030()
{
  return MEMORY[0x270F641F0]();
}

uint64_t sub_2355BD040()
{
  return MEMORY[0x270F641F8]();
}

uint64_t sub_2355BD050()
{
  return MEMORY[0x270F64200]();
}

uint64_t sub_2355BD060()
{
  return MEMORY[0x270F64208]();
}

uint64_t sub_2355BD070()
{
  return MEMORY[0x270F64210]();
}

uint64_t sub_2355BD080()
{
  return MEMORY[0x270F64218]();
}

uint64_t sub_2355BD090()
{
  return MEMORY[0x270F64220]();
}

uint64_t sub_2355BD0A0()
{
  return MEMORY[0x270F64228]();
}

uint64_t sub_2355BD0B0()
{
  return MEMORY[0x270F64230]();
}

uint64_t sub_2355BD0C0()
{
  return MEMORY[0x270F64238]();
}

uint64_t sub_2355BD0D0()
{
  return MEMORY[0x270F64240]();
}

uint64_t sub_2355BD0E0()
{
  return MEMORY[0x270F64248]();
}

uint64_t sub_2355BD0F0()
{
  return MEMORY[0x270F64250]();
}

uint64_t sub_2355BD100()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_2355BD110()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2355BD120()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2355BD130()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2355BD140()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2355BD150()
{
  return MEMORY[0x270FA2EB8]();
}

uint64_t sub_2355BD160()
{
  return MEMORY[0x270F64258]();
}

uint64_t sub_2355BD170()
{
  return MEMORY[0x270F64260]();
}

uint64_t sub_2355BD180()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_2355BD190()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2355BD1A0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2355BD1B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2355BD1C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2355BD1D0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2355BD1E0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2355BD1F0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2355BD200()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2355BD210()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2355BD220()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2355BD230()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2355BD240()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_2355BD250()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2355BD260()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2355BD270()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2355BD280()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2355BD290()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_2355BD2A0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2355BD2B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2355BD2C0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2355BD2D0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2355BD2E0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2355BD2F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2355BD300()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2355BD320()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2355BD330()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2355BD340()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2355BD350()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2355BD360()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2355BD370()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2355BD380()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2355BD390()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}