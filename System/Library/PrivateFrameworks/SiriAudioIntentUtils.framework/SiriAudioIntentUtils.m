uint64_t AudioMediaItem.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioMediaItem.title.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void AudioMediaItem.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

uint64_t AudioMediaItem.artist.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall AudioMediaItem.init(identifier:title:type:artist:)(SiriAudioIntentUtils::AudioMediaItem *__return_ptr retstr, Swift::String_optional identifier, Swift::String_optional title, SiriAudioIntentUtils::CommonAudio::MediaType type, Swift::String_optional artist)
{
  SiriAudioIntentUtils::CommonAudio::MediaType v5 = *(unsigned char *)type;
  retstr->identifier = identifier;
  retstr->title = title;
  retstr->type = v5;
  retstr->artist = artist;
}

uint64_t initializeBufferWithCopyOfBuffer for AudioMediaItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AudioMediaItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioMediaItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AudioMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioMediaItem(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioMediaItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioMediaItem()
{
  return &type metadata for AudioMediaItem;
}

uint64_t UsoEntity_common_App.bundleIdentifier.getter()
{
  uint64_t v93 = sub_25C56E8E0();
  v86 = *(void (***)(char *, uint64_t))(v93 - 8);
  MEMORY[0x270FA5388](v93);
  v77 = (char *)&v72 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0458);
  MEMORY[0x270FA5388](v84);
  uint64_t v92 = (uint64_t)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0460);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v83 = (uint64_t)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v96 = (uint64_t)&v72 - v7;
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v72 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v16 = (char *)&v72 - v15;
  MEMORY[0x270FA5388](v14);
  v18 = (char *)&v72 - v17;
  uint64_t v19 = sub_25C56E920();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v94 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v95 = (char *)&v72 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v27 = (char *)&v72 - v26;
  MEMORY[0x270FA5388](v25);
  v75 = (char *)&v72 - v28;
  uint64_t v29 = sub_25C56E990();
  v91 = v9;
  v81 = v18;
  uint64_t v82 = v20;
  v79 = v13;
  v80 = v16;
  if (!v29)
  {
    v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
    v38(v16, 1, 1, v19);
    uint64_t v39 = v84;
    goto LABEL_16;
  }
  uint64_t v30 = *(void *)(v29 + 16);
  v90 = v0;
  if (!v30)
  {
LABEL_12:
    v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
    v38(v16, 1, 1, v19);
    goto LABEL_14;
  }
  v31 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 16);
  unint64_t v32 = v29 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  v33 = (void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v34 = *(void *)(v20 + 72);
  uint64_t v89 = v29;
  swift_bridgeObjectRetain();
  while (1)
  {
    v31(v27, v32, v19);
    uint64_t v36 = sub_25C56E910();
    if (!v37) {
      goto LABEL_5;
    }
    if (v36 == 0x6C646E7542707061 && v37 == 0xEB00000000644965) {
      break;
    }
    char v35 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    if (v35) {
      goto LABEL_13;
    }
LABEL_5:
    (*v33)(v27, v19);
    v32 += v34;
    if (!--v30)
    {
      swift_bridgeObjectRelease();
      v18 = v81;
      uint64_t v20 = v82;
      v13 = v79;
      v16 = v80;
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  uint64_t v20 = v82;
  v16 = v80;
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v80, v27, v19);
  v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  v38(v16, 0, 1, v19);
  v18 = v81;
  v13 = v79;
LABEL_14:
  uint64_t v39 = v84;
  v9 = v91;
  swift_bridgeObjectRelease();
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v40(v16, 1, v19) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v18, v16, v19);
    v38(v18, 0, 1, v19);
    goto LABEL_52;
  }
  uint64_t v0 = v90;
LABEL_16:
  uint64_t v41 = sub_25C56E990();
  if (!v41)
  {
    v38(v13, 1, 1, v19);
    goto LABEL_32;
  }
  uint64_t v42 = *(void *)(v41 + 16);
  if (!v42)
  {
    uint64_t v89 = v41;
    uint64_t v51 = 1;
    v9 = v91;
    goto LABEL_31;
  }
  v90 = v0;
  v74 = v38;
  v43 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 16);
  unint64_t v44 = v41 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  v45 = (void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v46 = *(void *)(v20 + 72);
  uint64_t v89 = v41;
  swift_bridgeObjectRetain();
  v47 = v95;
  while (2)
  {
    v43(v47, v44, v19);
    uint64_t v49 = sub_25C56E910();
    if (!v50)
    {
LABEL_20:
      v47 = v95;
      (*v45)(v95, v19);
      v44 += v46;
      if (!--v42)
      {
        swift_bridgeObjectRelease();
        uint64_t v51 = 1;
        v18 = v81;
        uint64_t v20 = v82;
        v13 = v79;
        v16 = v80;
        goto LABEL_30;
      }
      continue;
    }
    break;
  }
  if (v49 != 0x64695F6D657469 || v50 != 0xE700000000000000)
  {
    char v48 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    if (v48) {
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
LABEL_29:
  swift_bridgeObjectRelease();
  uint64_t v20 = v82;
  v13 = v79;
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v79, v95, v19);
  uint64_t v51 = 0;
  v16 = v80;
  v18 = v81;
LABEL_30:
  uint64_t v39 = v84;
  v9 = v91;
  v38 = v74;
LABEL_31:
  v38(v13, v51, 1, v19);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v13, 1, v19) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v18, v13, v19);
    v38(v18, 0, 1, v19);
    goto LABEL_51;
  }
LABEL_32:
  uint64_t v52 = sub_25C56E990();
  if (!v52)
  {
    v38(v18, 1, 1, v19);
    goto LABEL_50;
  }
  v74 = v38;
  uint64_t v72 = v52;
  uint64_t v53 = *(void *)(v52 + 16);
  uint64_t v54 = v92;
  if (!v53)
  {
LABEL_45:
    v18 = v81;
    uint64_t v20 = v82;
    v67 = v81;
    uint64_t v68 = 1;
    goto LABEL_49;
  }
  v90 = *(void (**)(void, void, void))(v82 + 16);
  unint64_t v55 = v72 + ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80));
  LODWORD(v89) = *MEMORY[0x263F726D8];
  v87 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v86 + 7);
  v88 = (void (**)(uint64_t, void, uint64_t))(v86 + 13);
  v56 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v86 + 6);
  v73 = (void (**)(char *, uint64_t, uint64_t))(v86 + 4);
  v78 = (void (**)(uint64_t, uint64_t))(v86 + 1);
  v95 = (char *)(v82 + 16);
  uint64_t v85 = *(void *)(v82 + 72);
  v86 = (void (**)(char *, uint64_t))(v82 + 8);
  v90(v94, v55, v19);
  while (2)
  {
    sub_25C56E8F0();
    uint64_t v58 = v96;
    uint64_t v59 = v93;
    (*v88)(v96, v89, v93);
    (*v87)(v58, 0, 1, v59);
    uint64_t v60 = v54 + *(int *)(v39 + 48);
    sub_25C546250((uint64_t)v9, v54);
    sub_25C546250(v58, v60);
    uint64_t v61 = v54;
    v62 = *v56;
    if ((*v56)(v61, 1, v59) != 1)
    {
      uint64_t v63 = v83;
      sub_25C546250(v61, v83);
      if (v62(v60, 1, v59) == 1)
      {
        (*v78)(v63, v59);
        v9 = v91;
LABEL_36:
        uint64_t v54 = v92;
        sub_25C5462B8(v92, &qword_26A5B0458);
        sub_25C5462B8(v96, &qword_26A5B0460);
        sub_25C5462B8((uint64_t)v9, &qword_26A5B0460);
      }
      else
      {
        v64 = v77;
        (*v73)(v77, v60, v59);
        sub_25C546314();
        int v76 = sub_25C56ED90();
        v65 = *v78;
        (*v78)(v63, v59);
        v66 = v64;
        uint64_t v39 = v84;
        v65((uint64_t)v66, v59);
        sub_25C5462B8(v61, &qword_26A5B0460);
        sub_25C5462B8(v96, &qword_26A5B0460);
        v9 = v91;
        sub_25C5462B8((uint64_t)v91, &qword_26A5B0460);
        uint64_t v54 = v61;
        if (v76) {
          goto LABEL_48;
        }
      }
      v57 = v94;
      (*v86)(v94, v19);
      v55 += v85;
      if (!--v53) {
        goto LABEL_45;
      }
      v90(v57, v55, v19);
      continue;
    }
    break;
  }
  if (v62(v60, 1, v59) != 1) {
    goto LABEL_36;
  }
  sub_25C5462B8(v92, &qword_26A5B0460);
  sub_25C5462B8(v96, &qword_26A5B0460);
  sub_25C5462B8((uint64_t)v9, &qword_26A5B0460);
LABEL_48:
  v18 = v81;
  uint64_t v20 = v82;
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v81, v94, v19);
  v67 = v18;
  uint64_t v68 = 0;
LABEL_49:
  v74(v67, v68, 1, v19);
  swift_bridgeObjectRelease();
  v13 = v79;
  v16 = v80;
LABEL_50:
  sub_25C5462B8((uint64_t)v13, &qword_26A5B0468);
LABEL_51:
  sub_25C5462B8((uint64_t)v16, &qword_26A5B0468);
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
LABEL_52:
  if (v40(v18, 1, v19) == 1)
  {
    sub_25C5462B8((uint64_t)v18, &qword_26A5B0468);
    return 0;
  }
  else
  {
    v70 = v75;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v75, v18, v19);
    uint64_t v69 = sub_25C56E900();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v70, v19);
  }
  return v69;
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

uint64_t sub_25C546250(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C5462B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25C546314()
{
  unint64_t result = qword_26A5B0470;
  if (!qword_26A5B0470)
  {
    sub_25C56E8E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0470);
  }
  return result;
}

unint64_t AudioUsoIntent.UsoNamespace.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
    case 0x12:
    case 0x17:
    case 0x19:
      return result;
    case 2:
      unint64_t result = 0x6E6547636973756DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0xD000000000000014;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 9:
      unint64_t result = 0x7473696C79616C70;
      break;
    case 0xA:
    case 0xB:
      unint64_t result = 0x5474736163646F70;
      break;
    case 0xC:
      unint64_t result = 0x696669746E656469;
      break;
    case 0xD:
      unint64_t result = 1701605234;
      break;
    case 0xE:
      unint64_t result = 0x6C646E7542707061;
      break;
    case 0xF:
      unint64_t result = 0xD000000000000019;
      break;
    case 0x10:
      unint64_t result = 0x657449616964656DLL;
      break;
    case 0x11:
      unint64_t result = 0xD000000000000010;
      break;
    case 0x13:
    case 0x14:
      unint64_t result = 0x54776F6853707061;
      break;
    case 0x15:
      unint64_t result = 0xD000000000000011;
      break;
    case 0x16:
      unint64_t result = 0xD000000000000013;
      break;
    case 0x18:
      unint64_t result = 0xD000000000000014;
      break;
    case 0x1A:
      unint64_t result = 0xD000000000000014;
      break;
    case 0x1B:
      unint64_t result = 0x64695F6D657469;
      break;
    default:
      unint64_t result = 0x616C50616964656DLL;
      break;
  }
  return result;
}

unint64_t static AudioUsoIntent.pegasusAppBundle.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_25C54667C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 185);
  return result;
}

uint64_t sub_25C5466C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 186);
  return result;
}

uint64_t sub_25C546704@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 187);
  return result;
}

uint64_t sub_25C546748(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 192) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_25C5467A8()
{
  return swift_retain();
}

uint64_t sub_25C5467E0(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 192) = a1;
  return swift_release();
}

uint64_t (*sub_25C546828())()
{
  return j_j__swift_endAccess;
}

double sub_25C54687C()
{
  *(void *)(v0 + 176) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 160) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_DWORD *)(v0 + 184) = 67244801;
  *(_OWORD *)(v0 + 192) = xmmword_25C56F330;
  *(int64x2_t *)(v0 + 208) = vdupq_n_s64(1uLL);
  *(_OWORD *)(v0 + 224) = xmmword_25C56F340;
  *(_WORD *)(v0 + 240) = 7710;
  *(_OWORD *)(v0 + 248) = xmmword_25C56F330;
  *(void *)(v0 + 328) = 0;
  *(_OWORD *)(v0 + 296) = 0u;
  *(_OWORD *)(v0 + 312) = 0u;
  *(_OWORD *)(v0 + 264) = 0u;
  *(_OWORD *)(v0 + 280) = 0u;
  *(unsigned char *)(v0 + 336) = 3;
  *(void *)(v0 + 344) = 1;
  *(_OWORD *)(v0 + 352) = 0u;
  *(_OWORD *)(v0 + 368) = 0u;
  *(_OWORD *)(v0 + 384) = 0u;
  *(_OWORD *)(v0 + 400) = xmmword_25C56F340;
  *(void *)(v0 + 416) = 1;
  *(void *)(v0 + 440) = 0;
  *(_OWORD *)(v0 + 424) = 0u;
  *(_OWORD *)(v0 + 448) = xmmword_25C56F340;
  *(void *)(v0 + 464) = 1;
  *(_OWORD *)(v0 + 472) = 0u;
  *(_WORD *)(v0 + 488) = 2572;
  *(void *)(v0 + 496) = 0;
  *(unsigned char *)(v0 + 504) = 3;
  *(void *)(v0 + 528) = 0;
  *(_OWORD *)(v0 + 512) = 0u;
  *(unsigned char *)(v0 + 536) = 3;
  *(void *)(v0 + 544) = 0;
  *(_WORD *)(v0 + 552) = 256;
  *(void *)(v0 + 560) = 0;
  *(unsigned char *)(v0 + 568) = 2;
  *(_OWORD *)(v0 + 576) = 0u;
  return result;
}

uint64_t AudioUsoIntent.__allocating_init(task:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  AudioUsoIntent.init(task:)(a1);
  return v2;
}

uint64_t AudioUsoIntent.init(task:)(uint64_t a1)
{
  uint64_t v2 = v1;
  *(_OWORD *)(v2 + 16) = 0u;
  *(void *)(v2 + 176) = 0;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_DWORD *)(v2 + 184) = 67244801;
  *(_OWORD *)(v2 + 192) = xmmword_25C56F330;
  *(int64x2_t *)(v2 + 208) = vdupq_n_s64(1uLL);
  *(_OWORD *)(v2 + 224) = xmmword_25C56F340;
  *(_WORD *)(v2 + 240) = 7710;
  *(_OWORD *)(v2 + 248) = xmmword_25C56F330;
  *(void *)(v2 + 328) = 0;
  *(_OWORD *)(v2 + 296) = 0u;
  *(_OWORD *)(v2 + 312) = 0u;
  *(_OWORD *)(v2 + 280) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  *(unsigned char *)(v2 + 336) = 3;
  *(void *)(v2 + 344) = 1;
  *(_OWORD *)(v2 + 352) = 0u;
  *(_OWORD *)(v2 + 368) = 0u;
  *(_OWORD *)(v2 + 384) = 0u;
  *(_OWORD *)(v2 + 400) = xmmword_25C56F340;
  *(void *)(v2 + 416) = 1;
  *(void *)(v2 + 440) = 0;
  *(_OWORD *)(v2 + 424) = 0u;
  *(_OWORD *)(v2 + 448) = xmmword_25C56F340;
  *(void *)(v2 + 464) = 1;
  *(_OWORD *)(v2 + 472) = 0u;
  *(_WORD *)(v2 + 488) = 2572;
  *(void *)(v2 + 496) = 0;
  *(unsigned char *)(v2 + 504) = 3;
  *(void *)(v2 + 528) = 0;
  *(_OWORD *)(v2 + 512) = 0u;
  *(unsigned char *)(v2 + 536) = 3;
  *(void *)(v2 + 544) = 0;
  *(_WORD *)(v2 + 552) = 256;
  *(void *)(v2 + 560) = 0;
  *(unsigned char *)(v2 + 568) = 2;
  *(_OWORD *)(v2 + 576) = 0u;
  if (a1)
  {
    swift_beginAccess();
    *(void *)(v2 + 192) = a1;
    swift_retain_n();
    swift_release();
    v4._countAndFlagsBits = sub_25C56ED30();
    CommonAudio.Verb.init(rawValue:)(v4);
    swift_beginAccess();
    *(unsigned char *)(v2 + 185) = v12[0];
    sub_25C56ED40();
    uint64_t v5 = sub_25C56EF80();
    swift_bridgeObjectRelease();
    if (v5 == 1) {
      char v6 = 1;
    }
    else {
      char v6 = 2;
    }
    if (v5) {
      char v7 = v6;
    }
    else {
      char v7 = 0;
    }
    swift_beginAccess();
    *(unsigned char *)(v2 + 186) = v7;
    swift_retain();
    sub_25C56E9B0();
    swift_release_n();
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EB40();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 16) = v9;
LABEL_91:
        swift_release();
        return v2;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56E9E0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 24) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EAD0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 32) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EBF0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 40) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EC10();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 48) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56ED20();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 56) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EC60();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 64) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56ED10();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 72) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EBC0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 80) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EBB0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 88) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EBD0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 96) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56E9D0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 120) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EB10();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 128) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56E9C0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 136) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EC00();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 144) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EAE0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 152) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EC70();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 160) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EBE0();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 168) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EB20();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 104) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C55E72C((uint64_t)v12, (uint64_t)v10, &qword_26A5B0478);
    if (v11)
    {
      sub_25C56EA60();
      if (swift_dynamicCast())
      {
        sub_25C5462B8((uint64_t)v12, &qword_26A5B0478);
        *(void *)(v2 + 112) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    sub_25C5474B4((uint64_t)v12, (uint64_t)v10);
    if (v11)
    {
      sub_25C56EB30();
      if (swift_dynamicCast())
      {
        *(void *)(v2 + 176) = v9;
        goto LABEL_91;
      }
    }
    else
    {
      sub_25C5462B8((uint64_t)v10, &qword_26A5B0478);
    }
    *(unsigned char *)(v2 + 184) = 0;
  }
  return v2;
}

uint64_t sub_25C5474B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0478);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t AudioUsoIntent.__allocating_init(userDialogAct:)(uint64_t a1)
{
  uint64_t v2 = sub_25C56ED60();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v6 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v28[-v7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0480);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_25C56E880();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25C55E72C(a1, (uint64_t)v11, &qword_26A5B0480);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25C5462B8((uint64_t)v11, &qword_26A5B0480);
    type metadata accessor for AudioUsoIntent();
    uint64_t v16 = swift_allocObject();
    sub_25C54687C();
    if (qword_26A5B0420 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5B2000);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v8, v17, v2);
    v18 = sub_25C56ED50();
    os_log_type_t v19 = sub_25C56EE40();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_25C543000, v18, v19, "AudioUsoIntent#init received nil userDialogAct", v20, 2u);
      MEMORY[0x26118A090](v20, -1, -1);
    }

    sub_25C5462B8(a1, &qword_26A5B0480);
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
    return v16;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v13 + 32))(v15, v11, v12);
  if (sub_25C56E850())
  {
    sub_25C5462B8(a1, &qword_26A5B0480);
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
    type metadata accessor for AudioUsoIntent();
    uint64_t v16 = swift_allocObject();
    sub_25C54687C();
    swift_beginAccess();
    *(unsigned char *)(v16 + 187) = 0;
    if (*(unsigned char *)(v16 + 184)) {
      return v16;
    }
    goto LABEL_29;
  }
  if (sub_25C56E860())
  {
    sub_25C5462B8(a1, &qword_26A5B0480);
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
    type metadata accessor for AudioUsoIntent();
    uint64_t v16 = swift_allocObject();
    sub_25C54687C();
    swift_beginAccess();
    *(unsigned char *)(v16 + 187) = 1;
    if (*(unsigned char *)(v16 + 184)) {
      return v16;
    }
    goto LABEL_29;
  }
  if (sub_25C56E870())
  {
    sub_25C5462B8(a1, &qword_26A5B0480);
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
    type metadata accessor for AudioUsoIntent();
    uint64_t v16 = swift_allocObject();
    sub_25C54687C();
    swift_beginAccess();
    *(unsigned char *)(v16 + 187) = 2;
    if (*(unsigned char *)(v16 + 184)) {
      return v16;
    }
LABEL_29:
    swift_release();
    return 0;
  }
  if ((sub_25C56E840() & 1) == 0)
  {
    if (qword_26A5B0420 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v2, (uint64_t)qword_26A5B2000);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v6, v22, v2);
    uint64_t v23 = sub_25C56ED50();
    os_log_type_t v24 = sub_25C56EE40();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_25C543000, v23, v24, "AudioUsoIntent#init unexpected userDialogAct", v25, 2u);
      MEMORY[0x26118A090](v25, -1, -1);
    }

    sub_25C5462B8(a1, &qword_26A5B0480);
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
    (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
    return 0;
  }
  unint64_t result = sub_25C56E890();
  unint64_t v26 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_25C56EF50();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v27)
    {
LABEL_28:
      swift_bridgeObjectRelease();
      type metadata accessor for AudioUsoIntent();
      uint64_t v16 = swift_allocObject();
      AudioUsoIntent.init(task:)(v27);
      sub_25C5462B8(a1, &qword_26A5B0480);
      (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
      if (*(unsigned char *)(v16 + 184)) {
        return v16;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v27 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v27) {
      goto LABEL_28;
    }
  }
  if ((v26 & 0xC000000000000001) != 0)
  {
    uint64_t v27 = MEMORY[0x261189CD0](0, v26);
    goto LABEL_28;
  }
  if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v27 = *(void *)(v26 + 32);
    swift_retain();
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AudioUsoIntent()
{
  return self;
}

uint64_t sub_25C547BF0()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v1;
  if (v1 == 1)
  {
    uint64_t v2 = sub_25C547C50(v0);
    uint64_t v3 = v0[25];
    v0[25] = v2;
    swift_retain();
    sub_25C55C7F4(v3);
  }
  sub_25C55E664(v1);
  return v2;
}

uint64_t sub_25C547C50(void *a1)
{
  if (a1[2]) {
    goto LABEL_2;
  }
  if (!a1[3] && !a1[4])
  {
    if (!a1[5])
    {
      if (a1[6])
      {
        swift_retain();
        sub_25C56ECD0();
        goto LABEL_3;
      }
      if (!a1[7])
      {
        if (a1[8])
        {
          swift_retain();
          sub_25C56ECA0();
          goto LABEL_3;
        }
        if (a1[9] || a1[10]) {
          goto LABEL_16;
        }
        if (!a1[11])
        {
          if (a1[12])
          {
            swift_retain();
            sub_25C56E8B0();
            goto LABEL_3;
          }
          if (a1[15]) {
            return 0;
          }
          if (a1[16] || a1[18])
          {
LABEL_16:
            swift_retain();
            sub_25C56EA80();
            goto LABEL_3;
          }
          if (!a1[20] && !a1[21])
          {
            if (!a1[22]) {
              return 0;
            }
            goto LABEL_16;
          }
        }
      }
    }
LABEL_2:
    swift_retain();
    sub_25C56ED00();
LABEL_3:
    swift_release();
    return v2;
  }
  return 0;
}

uint64_t sub_25C547D74()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v1;
  if (v1 == 1)
  {
    uint64_t v2 = sub_25C547DD4(v0);
    uint64_t v3 = v0[26];
    v0[26] = v2;
    swift_retain();
    sub_25C55C7F4(v3);
  }
  sub_25C55E664(v1);
  return v2;
}

uint64_t sub_25C547DD4(void *a1)
{
  if (!a1[2]) {
    goto LABEL_8;
  }
  swift_retain();
  unint64_t v1 = sub_25C56ECF0();
  a1 = (void *)swift_release();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v1 >> 62) {
    goto LABEL_49;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_67;
  }
LABEL_5:
  if ((v1 & 0xC000000000000001) != 0)
  {
LABEL_88:
    MEMORY[0x261189CD0](0, v1);
    goto LABEL_29;
  }
  if (*(void *)(v2 + 16)) {
    goto LABEL_28;
  }
  __break(1u);
LABEL_8:
  if (!a1[3]) {
    goto LABEL_15;
  }
  swift_retain();
  unint64_t v1 = sub_25C56ECF0();
  a1 = (void *)swift_release();
  if (!v1) {
    return 0;
  }
  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_12;
    }
LABEL_67:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25C56EF50();
  a1 = (void *)swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_67;
  }
LABEL_12:
  if ((v1 & 0xC000000000000001) != 0) {
    goto LABEL_88;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_28;
  }
  __break(1u);
LABEL_15:
  if (a1[4])
  {
    swift_retain();
    unint64_t v1 = sub_25C56ECF0();
    a1 = (void *)swift_release();
    if (v1)
    {
      uint64_t v3 = v1 & 0xFFFFFFFFFFFFFF8;
      if (v1 >> 62) {
        goto LABEL_64;
      }
      if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_19;
      }
      goto LABEL_67;
    }
    return 0;
  }
  while (1)
  {
    if (a1[5])
    {
      swift_retain();
      unint64_t v1 = sub_25C56ECF0();
      swift_release();
      if (!v1) {
        return 0;
      }
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (v1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_25C56EF50();
        swift_bridgeObjectRelease();
        if (!v9) {
          goto LABEL_67;
        }
      }
      else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_67;
      }
      if ((v1 & 0xC000000000000001) != 0) {
        goto LABEL_88;
      }
      if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_28;
      }
      __break(1u);
LABEL_70:
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_25C56EF50();
      a1 = (void *)swift_bridgeObjectRelease();
      if (!v10) {
        goto LABEL_67;
      }
      goto LABEL_36;
    }
    if (a1[6]) {
      return 0;
    }
    if (!a1[7]) {
      goto LABEL_39;
    }
    swift_retain();
    unint64_t v1 = sub_25C56ECF0();
    a1 = (void *)swift_release();
    if (!v1) {
      return 0;
    }
    uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
    if (v1 >> 62) {
      goto LABEL_70;
    }
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_67;
    }
LABEL_36:
    if ((v1 & 0xC000000000000001) != 0) {
      goto LABEL_88;
    }
    if (*(void *)(v4 + 16)) {
      goto LABEL_28;
    }
    __break(1u);
LABEL_39:
    if (a1[8] || a1[9] || a1[10]) {
      return 0;
    }
    if (a1[11])
    {
      swift_retain();
      unint64_t v1 = sub_25C56ECF0();
      swift_release();
      if (!v1) {
        return 0;
      }
      uint64_t v2 = v1 & 0xFFFFFFFFFFFFFF8;
      if (v1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_25C56EF50();
        swift_bridgeObjectRelease();
        if (!v11) {
          goto LABEL_67;
        }
      }
      else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_67;
      }
      if ((v1 & 0xC000000000000001) != 0) {
        goto LABEL_88;
      }
      if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_28;
      }
      __break(1u);
LABEL_49:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_25C56EF50();
      a1 = (void *)swift_bridgeObjectRelease();
      if (v6) {
        goto LABEL_5;
      }
      goto LABEL_67;
    }
    if (a1[12] || a1[15] || a1[16] || a1[18]) {
      return 0;
    }
    if (!a1[20]) {
      break;
    }
    swift_retain();
    unint64_t v1 = sub_25C56ECF0();
    swift_release();
    if (!v1) {
      return 0;
    }
    uint64_t v3 = v1 & 0xFFFFFFFFFFFFFF8;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_25C56EF50();
      swift_bridgeObjectRelease();
      if (!v12) {
        goto LABEL_67;
      }
    }
    else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_67;
    }
    if ((v1 & 0xC000000000000001) != 0) {
      goto LABEL_88;
    }
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_28;
    }
    __break(1u);
LABEL_64:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25C56EF50();
    a1 = (void *)swift_bridgeObjectRelease();
    if (!v8) {
      goto LABEL_67;
    }
LABEL_19:
    if ((v1 & 0xC000000000000001) != 0) {
      goto LABEL_88;
    }
    if (*(void *)(v3 + 16)) {
      goto LABEL_28;
    }
    __break(1u);
  }
  if (a1[21])
  {
    swift_retain();
    unint64_t v1 = sub_25C56ECF0();
    a1 = (void *)swift_release();
    if (!v1) {
      return 0;
    }
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_25C56EF50();
      a1 = (void *)swift_bridgeObjectRelease();
      if (!v13) {
        goto LABEL_67;
      }
    }
    else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_67;
    }
    if ((v1 & 0xC000000000000001) != 0) {
      goto LABEL_88;
    }
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_28;
    }
    __break(1u);
  }
  if (a1[13])
  {
    swift_retain();
    sub_25C56E8B0();
    goto LABEL_30;
  }
  if (!a1[14]) {
    return 0;
  }
  swift_retain();
  unint64_t v1 = sub_25C56ECF0();
  swift_release();
  if (!v1) {
    return 0;
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25C56EF50();
    swift_bridgeObjectRelease();
    if (!v14) {
      goto LABEL_67;
    }
  }
  else if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_67;
  }
  if ((v1 & 0xC000000000000001) != 0) {
    goto LABEL_88;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_88;
  }
LABEL_28:
  swift_retain();
LABEL_29:
  swift_bridgeObjectRelease();
  sub_25C56E930();
LABEL_30:
  swift_release();
  return v15;
}

uint64_t sub_25C5482DC()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v1;
  if (v1 == 1)
  {
    uint64_t v2 = sub_25C54833C(v0);
    uint64_t v3 = v0[27];
    v0[27] = v2;
    swift_bridgeObjectRetain();
    sub_25C55C804(v3);
  }
  sub_25C55E654(v1);
  return v2;
}

uint64_t sub_25C54833C(void *a1)
{
  if (!a1[2] && !a1[3] && !a1[4] && !a1[5])
  {
    if (a1[6])
    {
      swift_retain();
      uint64_t v1 = sub_25C56ECB0();
      goto LABEL_6;
    }
    if (!a1[7])
    {
      if (a1[8])
      {
        swift_retain();
        uint64_t v1 = sub_25C56EC80();
        goto LABEL_6;
      }
      if (a1[9] || a1[10])
      {
LABEL_15:
        swift_retain();
        uint64_t v1 = sub_25C56EA70();
        goto LABEL_6;
      }
      if (!a1[11])
      {
        if (a1[12] || a1[15]) {
          goto LABEL_19;
        }
        if (a1[16] || a1[18]) {
          goto LABEL_15;
        }
        if (!a1[20] && !a1[21])
        {
          if (a1[13])
          {
LABEL_19:
            swift_retain();
            uint64_t v1 = sub_25C56E8A0();
            goto LABEL_6;
          }
          if (!a1[14])
          {
            if (!a1[22]) {
              return 0;
            }
            goto LABEL_15;
          }
        }
      }
    }
  }
  swift_retain();
  uint64_t v1 = sub_25C56ECE0();
LABEL_6:
  uint64_t v2 = v1;
  swift_release();
  return v2;
}

uint64_t sub_25C548454()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v1;
  if (v1 == 1)
  {
    uint64_t v2 = sub_25C5484B4(v0);
    uint64_t v3 = v0[28];
    v0[28] = v2;
    swift_retain();
    sub_25C55C7F4(v3);
  }
  sub_25C55E664(v1);
  return v2;
}

uint64_t sub_25C5484B4(void *a1)
{
  if (a1[2] || a1[3] || a1[4] || !a1[6]) {
    return 0;
  }
  swift_retain();
  sub_25C56ECC0();
  swift_release();
  return v2;
}

uint64_t sub_25C54851C()
{
  if (*(void *)(v0 + 232))
  {
    uint64_t v1 = *(void *)(v0 + 232);
  }
  else
  {
    uint64_t v1 = sub_25C54857C();
    *(void *)(v0 + 232) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C54857C()
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (sub_25C547BF0())
  {
    uint64_t v0 = swift_retain();
    MEMORY[0x261189BE0](v0);
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25C56EE10();
    }
    sub_25C56EE20();
    sub_25C56EE00();
    swift_release();
  }
  if (sub_25C548454())
  {
    uint64_t v1 = swift_retain();
    MEMORY[0x261189BE0](v1);
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25C56EE10();
    }
    sub_25C56EE20();
    sub_25C56EE00();
    swift_release();
  }
  return v3;
}

uint64_t sub_25C548694@<X0>(unsigned char *a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + 240);
  if (v3 == 30)
  {
    uint64_t result = sub_25C5486E0(&v5);
    LOBYTE(v3) = v5;
    *(unsigned char *)(v1 + 240) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_25C5486E0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  char v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v12 - v6;
  if (sub_25C547BF0())
  {
    if (sub_25C56EA00())
    {
      sub_25C56EB50();
      swift_release();
    }
    else
    {
      uint64_t v9 = sub_25C56EB60();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
    }
    static CommonAudio.MediaType.from(_:)((uint64_t)v7, a1);
    swift_release();
    uint64_t v10 = (uint64_t)v7;
  }
  else
  {
    uint64_t result = sub_25C548454();
    if (!result)
    {
      *a1 = 29;
      return result;
    }
    if (sub_25C56EA00())
    {
      sub_25C56EB50();
      swift_release();
    }
    else
    {
      uint64_t v11 = sub_25C56EB60();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
    }
    static CommonAudio.MediaType.from(_:)((uint64_t)v5, a1);
    swift_release();
    uint64_t v10 = (uint64_t)v5;
  }
  return sub_25C5462B8(v10, &qword_26A5B0488);
}

uint64_t sub_25C5488AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t result = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = *(unsigned __int8 *)(v1 + 241);
  if (v7 == 30)
  {
    uint64_t result = sub_25C548454();
    if (result)
    {
      if (sub_25C56EA00())
      {
        sub_25C56EB50();
        swift_release();
      }
      else
      {
        uint64_t v8 = sub_25C56EB60();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
      }
      static CommonAudio.MediaType.from(_:)((uint64_t)v6, &v10);
      swift_release();
      uint64_t result = sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
      LOBYTE(v7) = v10;
    }
    else
    {
      LOBYTE(v7) = 29;
    }
    *(unsigned char *)(v1 + 241) = v7;
  }
  *a1 = v7;
  return result;
}

uint64_t sub_25C5489E4()
{
  if (*(void *)(v0 + 248))
  {
    uint64_t v1 = *(void *)(v0 + 248);
  }
  else
  {
    uint64_t v1 = sub_25C548A44();
    *(void *)(v0 + 248) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C548A44()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C548BF8, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C548BF8()
{
  uint64_t v0 = sub_25C56EA30();
  if (v1)
  {
    uint64_t v2 = v0;
    unint64_t v3 = v1;
    swift_bridgeObjectRelease();
    uint64_t v4 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0) {
      uint64_t v4 = v2 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  uint64_t v6 = *(void *)(sub_25C56E8C0() + 16);
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if (v5 && !v6)
  {
    if (sub_25C56EA00())
    {
      swift_release();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_25C548C88()
{
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v2 = v1;
  if (v1 == 1)
  {
    uint64_t v2 = sub_25C548CE8();
    uint64_t v3 = *(void *)(v0 + 256);
    *(void *)(v0 + 256) = v2;
    swift_retain();
    sub_25C55C7F4(v3);
  }
  sub_25C55E664(v1);
  return v2;
}

uint64_t sub_25C548CE8()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = v0;
  if (v0 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C56EF50();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      uint64_t v3 = 4;
      uint64_t v4 = MEMORY[0x263F8EE78];
      do
      {
        uint64_t v5 = v3 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = MEMORY[0x261189CD0](v3 - 4, v1);
          uint64_t v7 = v3 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v6 = *(void *)(v1 + 8 * v3);
          swift_retain();
          uint64_t v7 = v3 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        uint64_t v8 = sub_25C5617A8(v4, v6);
        swift_release();
        if (v8) {
          goto LABEL_12;
        }
        ++v3;
      }
      while (v7 != v2);
    }
  }
  uint64_t v8 = 0;
LABEL_12:
  swift_bridgeObjectRelease_n();
  return v8;
}

uint64_t sub_25C548DF4()
{
  if (*(void *)(v0 + 264))
  {
    uint64_t v1 = *(void *)(v0 + 264);
  }
  else
  {
    unint64_t v2 = sub_25C54851C();
    uint64_t v1 = sub_25C564890(v2, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C548E90, 0);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 264) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_25C548E90()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v31 - v5;
  uint64_t v7 = sub_25C56EA30();
  if (v8)
  {
    uint64_t v9 = v7;
    unint64_t v10 = v8;
    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 1;
  }
  uint64_t v13 = sub_25C56E8C0();
  uint64_t v14 = *(void *)(v13 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  BOOL v32 = v12;
  uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  uint64_t v16 = v1 + 16;
  uint64_t v15 = v17;
  unint64_t v18 = v13 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
  os_log_type_t v19 = (void (**)(char *, uint64_t))(v16 - 8);
  uint64_t v33 = *(void *)(v16 + 56);
  v31[1] = v13;
  swift_bridgeObjectRetain();
  while (1)
  {
    v15(v6, v18, v0);
    uint64_t v22 = sub_25C56E910();
    if (!v23)
    {
      v15(v4, (unint64_t)v6, v0);
LABEL_21:
      uint64_t v28 = *v19;
      (*v19)(v4, v0);
      v28(v6, v0);
      goto LABEL_9;
    }
    if (v22 == 1701605234 && v23 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      v15(v4, (unint64_t)v6, v0);
    }
    else
    {
      char v24 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      v15(v4, (unint64_t)v6, v0);
      if ((v24 & 1) == 0) {
        goto LABEL_21;
      }
    }
    uint64_t v25 = sub_25C56E900();
    uint64_t v27 = v26;
    if (qword_26A5B03D0 != -1) {
      swift_once();
    }
    if (v25 == qword_26A5B05B0 && v27 == *(void *)algn_26A5B05B8) {
      break;
    }
    char v20 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    uint64_t v21 = *v19;
    (*v19)(v4, v0);
    v21(v6, v0);
    if (v20) {
      goto LABEL_24;
    }
LABEL_9:
    v18 += v33;
    if (!--v14)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v29 = *v19;
  (*v19)(v4, v0);
  v29(v6, v0);
LABEL_24:
  swift_bridgeObjectRelease_n();
  return !v32;
}

uint64_t sub_25C549204()
{
  if (v0[34])
  {
    uint64_t v1 = v0[34];
  }
  else
  {
    uint64_t v1 = sub_25C549264(v0);
    v0[34] = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C549264(void *a1)
{
  if (a1[15])
  {
    swift_retain();
    sub_25C56E8B0();
    swift_release();
    uint64_t v2 = v12;
    if (v12) {
      goto LABEL_20;
    }
  }
  if (a1[5])
  {
    swift_retain();
    sub_25C56ED00();
    swift_release();
    if (v12)
    {
      uint64_t v2 = sub_25C56E960();
      swift_release();
      if (v2) {
        goto LABEL_20;
      }
    }
  }
  if (a1[4])
  {
    swift_retain();
    sub_25C56ED00();
    swift_release();
    if (v12)
    {
      uint64_t v2 = sub_25C56E960();
      swift_release();
      if (v2) {
        goto LABEL_20;
      }
    }
  }
  if (a1[13])
  {
    swift_retain();
    sub_25C56E8B0();
    swift_release();
    if (v12)
    {
      uint64_t v2 = sub_25C56E960();
      swift_release();
      if (v2) {
        goto LABEL_20;
      }
    }
  }
  if (a1[14])
  {
    swift_retain();
    sub_25C56ED00();
    swift_release();
    if (v12)
    {
      uint64_t v2 = sub_25C56E960();
      swift_release();
      if (v2) {
        goto LABEL_20;
      }
    }
  }
  if (sub_25C548454() && (uint64_t v2 = sub_25C56E960(), swift_release(), v2)
    || a1[20] && (swift_retain(), sub_25C56ED00(), swift_release(), v12) && (uint64_t v2 = sub_25C56E960(), swift_release(), v2))
  {
LABEL_20:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0508);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_25C56F350;
    *(void *)(v3 + 32) = v2;
    uint64_t v13 = v3;
    sub_25C56EE00();
    return v13;
  }
  unint64_t v6 = sub_25C54851C();
  unint64_t v7 = v6;
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (!(v6 >> 62))
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_24;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_37:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v8 = result;
  if (!result) {
    goto LABEL_36;
  }
LABEL_24:
  if (v8 >= 1)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if ((v7 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](i, v7);
      }
      else {
        swift_retain();
      }
      uint64_t v10 = sub_25C56E960();
      uint64_t v11 = swift_release();
      if (v10)
      {
        MEMORY[0x261189BE0](v11);
        if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25C56EE10();
        }
        sub_25C56EE20();
        sub_25C56EE00();
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v4 = v14;
    goto LABEL_37;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5495A4()
{
  if (*(void *)(v0 + 280))
  {
    uint64_t v1 = *(void *)(v0 + 280);
  }
  else
  {
    uint64_t v1 = sub_25C549604();
    *(void *)(v0 + 280) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C549604()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], sub_25C5497B8, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        unint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5497B8(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v56[0] = (char *)v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v60);
  uint64_t v63 = (char *)v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v56 - v11;
  MEMORY[0x270FA5388](v10);
  v64 = (char *)v56 - v13;
  uint64_t v14 = sub_25C56E920();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  char v20 = (char *)v56 - v19;
  uint64_t v66 = a1;
  uint64_t v21 = sub_25C56EA30();
  uint64_t v61 = v12;
  uint64_t v62 = v3;
  uint64_t v58 = v9;
  if (v22)
  {
    uint64_t v23 = v21;
    unint64_t v24 = v22;
    swift_bridgeObjectRelease();
    uint64_t v25 = HIBYTE(v24) & 0xF;
    if ((v24 & 0x2000000000000000) == 0) {
      uint64_t v25 = v23 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v26 = v25 == 0;
  }
  else
  {
    BOOL v26 = 1;
  }
  uint64_t v27 = sub_25C56E8C0();
  uint64_t v28 = *(void *)(v27 + 16);
  if (!v28)
  {
    swift_bridgeObjectRelease();
    uint64_t v42 = v62;
    uint64_t v43 = (uint64_t)v63;
    uint64_t v44 = (uint64_t)v64;
    if (!v26)
    {
LABEL_24:
      uint64_t v45 = 1;
      goto LABEL_29;
    }
    return 0;
  }
  BOOL v57 = v26;
  uint64_t v59 = v2;
  v31 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  uint64_t v29 = v15 + 16;
  uint64_t v30 = v31;
  unint64_t v32 = v27 + ((*(unsigned __int8 *)(v29 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 64));
  uint64_t v70 = *(void *)(v29 + 56);
  v71 = (void (**)(char *, uint64_t))(v29 - 8);
  v56[1] = v27;
  swift_bridgeObjectRetain();
  uint64_t v68 = "appAudiobookTitleId";
  unint64_t v65 = 0x800000025C570AA0;
  uint64_t v69 = "appMusicArtistNameId";
  unint64_t v67 = 0x800000025C570AE0;
  while (1)
  {
    v30(v20, v32, v14);
    uint64_t v36 = sub_25C56E910();
    if (!v37)
    {
      v30(v18, (unint64_t)v20, v14);
      goto LABEL_16;
    }
    if (v36 == 0xD000000000000012 && v37 == v67) {
      break;
    }
    char v38 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    v30(v18, (unint64_t)v20, v14);
    if (v38) {
      goto LABEL_26;
    }
LABEL_16:
    uint64_t v39 = sub_25C56E910();
    if (v40)
    {
      if (v39 == 0xD000000000000012 && v40 == v65)
      {
        v47 = *v71;
        (*v71)(v18, v14);
        swift_bridgeObjectRelease();
        v47(v20, v14);
        goto LABEL_27;
      }
      int v72 = sub_25C56EF90();
      uint64_t v33 = v30;
      uint64_t v34 = v29;
      char v35 = *v71;
      (*v71)(v18, v14);
      swift_bridgeObjectRelease();
      v35(v20, v14);
      uint64_t v29 = v34;
      uint64_t v30 = v33;
      if (v72) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v41 = *v71;
      (*v71)(v18, v14);
      v41(v20, v14);
    }
    v32 += v70;
    if (!--v28)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v2 = v59;
      uint64_t v42 = v62;
      uint64_t v43 = (uint64_t)v63;
      uint64_t v44 = (uint64_t)v64;
      if (v57) {
        return 0;
      }
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  v30(v18, (unint64_t)v20, v14);
LABEL_26:
  uint64_t v46 = *v71;
  (*v71)(v18, v14);
  v46(v20, v14);
LABEL_27:
  swift_bridgeObjectRelease_n();
  uint64_t v2 = v59;
  uint64_t v42 = v62;
  uint64_t v43 = (uint64_t)v63;
  uint64_t v44 = (uint64_t)v64;
  if (v57) {
    return 0;
  }
  uint64_t v45 = 0;
LABEL_29:
  if (sub_25C56EA00())
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v44, 1, 1, v2);
  }
  uint64_t v48 = (uint64_t)v61;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v61, *MEMORY[0x263F72FF0], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v48, 0, 1, v2);
  uint64_t v49 = v43 + *(int *)(v60 + 48);
  sub_25C55E72C(v44, v43, &qword_26A5B0488);
  sub_25C55E72C(v48, v49, &qword_26A5B0488);
  uint64_t v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48);
  if (v50(v43, 1, v2) != 1)
  {
    uint64_t v51 = (uint64_t)v58;
    sub_25C55E72C(v43, (uint64_t)v58, &qword_26A5B0488);
    if (v50(v49, 1, v2) != 1)
    {
      uint64_t v52 = v56[0];
      (*(void (**)(void, uint64_t, uint64_t))(v42 + 32))(v56[0], v49, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      char v53 = sub_25C56ED90();
      uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
      v54(v52, v2);
      sub_25C5462B8((uint64_t)v61, &qword_26A5B0488);
      sub_25C5462B8(v44, &qword_26A5B0488);
      v54(v51, v2);
      sub_25C5462B8(v43, &qword_26A5B0488);
      if (v53) {
        return v45;
      }
      return 0;
    }
    sub_25C5462B8((uint64_t)v61, &qword_26A5B0488);
    sub_25C5462B8(v44, &qword_26A5B0488);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v51, v2);
LABEL_37:
    sub_25C5462B8(v43, &qword_26A5B04E8);
    return 0;
  }
  sub_25C5462B8(v48, &qword_26A5B0488);
  sub_25C5462B8(v44, &qword_26A5B0488);
  if (v50(v49, 1, v2) != 1) {
    goto LABEL_37;
  }
  sub_25C5462B8(v43, &qword_26A5B0488);
  return v45;
}

uint64_t sub_25C549FCC()
{
  if (*(void *)(v0 + 288))
  {
    uint64_t v1 = *(void *)(v0 + 288);
  }
  else
  {
    uint64_t v1 = sub_25C54A02C();
    *(void *)(v0 + 288) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C54A02C()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], sub_25C54A1E0, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C54A1E0(uint64_t a1)
{
  return sub_25C550418(a1, MEMORY[0x263F72FC8]);
}

void *sub_25C54A1EC()
{
  if (*(void *)(v0 + 296))
  {
    unint64_t v1 = *(void **)(v0 + 296);
  }
  else
  {
    unint64_t v1 = sub_25C54A24C();
    *(void *)(v0 + 296) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_25C54A24C()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v69 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  unint64_t v65 = (char *)&v59 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  unint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v59 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v59 - v16;
  MEMORY[0x270FA5388](v15);
  v71 = (char *)&v59 - v18;
  unint64_t v19 = sub_25C54851C();
  unint64_t v20 = sub_25C564890(v19, MEMORY[0x263F8EE78], sub_25C54AB08, 0);
  swift_bridgeObjectRelease();
  if (v20 >> 62)
  {
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25C56EF50();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v61 = v20;
  if (v21)
  {
    unint64_t v64 = v20 & 0xC000000000000001;
    unint64_t v59 = v20 + 32;
    uint64_t v84 = v69 + 16;
    unint64_t v20 = v69 + 8;
    int v72 = (void (**)(char *, char *, uint64_t))(v69 + 32);
    v74 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
    v75 = (unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48);
    uint64_t v60 = (void *)MEMORY[0x263F8EE78];
    uint64_t v83 = "ce_source";
    unint64_t v81 = 0x800000025C570A10;
    uint64_t v82 = "appPlaylistTitle";
    unint64_t v80 = 0x800000025C570A30;
    uint64_t v63 = v11;
    unint64_t v22 = 0;
    uint64_t v68 = v14;
    uint64_t v70 = v17;
    uint64_t v62 = v21;
    while (1)
    {
      if (v64)
      {
        uint64_t v24 = MEMORY[0x261189CD0](v22, v61);
        BOOL v25 = __OFADD__(v22, 1);
        unint64_t v11 = v22 + 1;
        if (v25) {
          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v24 = *(void *)(v59 + 8 * (void)v22);
        swift_retain();
        BOOL v25 = __OFADD__(v22, 1);
        unint64_t v11 = v22 + 1;
        if (v25)
        {
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
      }
      int v76 = v11;
      uint64_t v26 = sub_25C56E8C0();
      uint64_t v27 = *(void *)(v26 + 16);
      uint64_t v78 = v26;
      uint64_t v79 = v24;
      if (!v27)
      {
LABEL_22:
        uint64_t v34 = *v74;
        uint64_t v35 = (uint64_t)v71;
        (*v74)(v71, 1, 1, v0);
        goto LABEL_24;
      }
      unint64_t v28 = v26 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v29 = *(void *)(v69 + 72);
      uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v30(v7, v28, v0);
        uint64_t v32 = sub_25C56E910();
        if (!v33) {
          goto LABEL_16;
        }
        if (v32 == 0xD000000000000012 && v33 == v80) {
          break;
        }
        char v31 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        if (v31) {
          goto LABEL_23;
        }
LABEL_16:
        (*(void (**)(char *, uint64_t))v20)(v7, v0);
        v28 += v29;
        if (!--v27)
        {
          swift_bridgeObjectRelease();
          uint64_t v14 = v68;
          uint64_t v17 = v70;
          goto LABEL_22;
        }
      }
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      uint64_t v35 = (uint64_t)v71;
      (*v72)(v71, v7, v0);
      uint64_t v34 = *v74;
      (*v74)((char *)v35, 0, 1, v0);
      uint64_t v14 = v68;
      uint64_t v17 = v70;
LABEL_24:
      swift_bridgeObjectRelease();
      sub_25C55E72C(v35, (uint64_t)v17, &qword_26A5B0468);
      v73 = *v75;
      if (v73(v17, 1, v0) == 1)
      {
        uint64_t v66 = 0;
        uint64_t v78 = 0;
      }
      else
      {
        uint64_t v36 = v65;
        (*v72)(v65, v17, v0);
        uint64_t v66 = sub_25C56E900();
        uint64_t v78 = v37;
        char v38 = v36;
        uint64_t v35 = (uint64_t)v71;
        (*(void (**)(char *, uint64_t))v20)(v38, v0);
      }
      sub_25C5462B8(v35, &qword_26A5B0468);
      uint64_t v39 = sub_25C56E8C0();
      uint64_t v40 = *(void *)(v39 + 16);
      uint64_t v77 = v39;
      if (!v40)
      {
        uint64_t v47 = 1;
        uint64_t v48 = (uint64_t)v63;
        goto LABEL_39;
      }
      unint64_t v67 = v34;
      unint64_t v41 = v39 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v42 = *(void *)(v69 + 72);
      uint64_t v43 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (2)
      {
        v43(v3, v41, v0);
        uint64_t v45 = sub_25C56E910();
        if (!v46) {
          goto LABEL_30;
        }
        if (v45 != 0xD000000000000010 || v46 != v81)
        {
          char v44 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          if (v44) {
            goto LABEL_37;
          }
LABEL_30:
          (*(void (**)(char *, uint64_t))v20)(v3, v0);
          v41 += v42;
          if (!--v40)
          {
            swift_bridgeObjectRelease();
            uint64_t v47 = 1;
            uint64_t v48 = (uint64_t)v63;
            uint64_t v14 = v68;
            goto LABEL_38;
          }
          continue;
        }
        break;
      }
      swift_bridgeObjectRelease();
LABEL_37:
      swift_bridgeObjectRelease();
      uint64_t v14 = v68;
      (*v72)(v68, v3, v0);
      uint64_t v47 = 0;
      uint64_t v48 = (uint64_t)v63;
LABEL_38:
      uint64_t v17 = v70;
      uint64_t v34 = v67;
LABEL_39:
      v34(v14, v47, 1, v0);
      swift_bridgeObjectRelease();
      sub_25C55E72C((uint64_t)v14, v48, &qword_26A5B0468);
      if (v73((char *)v48, 1, v0) == 1)
      {
        sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
        unint64_t v22 = v76;
LABEL_6:
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v23 = v62;
        goto LABEL_7;
      }
      uint64_t v49 = v65;
      (*v72)(v65, (char *)v48, v0);
      uint64_t v50 = sub_25C56E900();
      uint64_t v52 = v51;
      (*(void (**)(char *, uint64_t))v20)(v49, v0);
      sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
      if (!v78)
      {
        unint64_t v22 = v76;
        goto LABEL_6;
      }
      unint64_t v22 = v76;
      if (!v52) {
        goto LABEL_6;
      }
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v60 = sub_25C563B24(0, v60[2] + 1, 1, v60);
      }
      unint64_t v54 = v60[2];
      unint64_t v53 = v60[3];
      if (v54 >= v53 >> 1) {
        uint64_t v60 = sub_25C563B24((void *)(v53 > 1), v54 + 1, 1, v60);
      }
      unint64_t v55 = v60;
      v60[2] = v54 + 1;
      v56 = &v55[4 * v54];
      v56[4] = v50;
      v56[5] = v52;
      uint64_t v57 = v78;
      v56[6] = v66;
      v56[7] = v57;
      uint64_t v17 = v70;
      uint64_t v23 = v62;
      unint64_t v22 = v76;
LABEL_7:
      if (v22 == (char *)v23) {
        goto LABEL_50;
      }
    }
  }
  uint64_t v60 = (void *)MEMORY[0x263F8EE78];
LABEL_50:
  swift_bridgeObjectRelease_n();
  return v60;
}

uint64_t sub_25C54AB08(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v46 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v54);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v45 - v11;
  MEMORY[0x270FA5388](v10);
  v56 = (char *)&v45 - v13;
  uint64_t v14 = sub_25C56E920();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25C56EA30();
  unint64_t v55 = v12;
  if (v19)
  {
    uint64_t v20 = v18;
    unint64_t v21 = v19;
    swift_bridgeObjectRelease();
    uint64_t v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0) {
      uint64_t v22 = v20 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v23 = v22 == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  uint64_t v53 = a1;
  uint64_t v24 = sub_25C56E8C0();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)v55;
    uint64_t v36 = (uint64_t)v56;
    if (!v23)
    {
LABEL_18:
      uint64_t v37 = 0;
      goto LABEL_21;
    }
    return 0;
  }
  BOOL v48 = v23;
  uint64_t v49 = v3;
  uint64_t v50 = v6;
  uint64_t v51 = v2;
  unint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  uint64_t v26 = v15 + 16;
  uint64_t v27 = v28;
  unint64_t v29 = v24 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  uint64_t v30 = (void (**)(char *, uint64_t))(v26 - 8);
  uint64_t v31 = *(void *)(v26 + 56);
  uint64_t v47 = v24;
  swift_bridgeObjectRetain();
  uint64_t v58 = "ce_source";
  unint64_t v57 = 0x800000025C570A10;
  while (1)
  {
    v27(v17, v29, v14);
    uint64_t v33 = sub_25C56E910();
    if (!v34)
    {
      (*v30)(v17, v14);
      goto LABEL_9;
    }
    if (v33 == 0xD000000000000010 && v34 == v57) {
      break;
    }
    char v32 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    (*v30)(v17, v14);
    if (v32) {
      goto LABEL_19;
    }
LABEL_9:
    v29 += v31;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v6 = v50;
      uint64_t v2 = v51;
      uint64_t v3 = v49;
      uint64_t v35 = (uint64_t)v55;
      uint64_t v36 = (uint64_t)v56;
      if (v48) {
        return 0;
      }
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  (*v30)(v17, v14);
LABEL_19:
  swift_bridgeObjectRelease_n();
  uint64_t v6 = v50;
  uint64_t v2 = v51;
  uint64_t v3 = v49;
  uint64_t v35 = (uint64_t)v55;
  uint64_t v36 = (uint64_t)v56;
  if (v48) {
    return 0;
  }
  uint64_t v37 = 1;
LABEL_21:
  if (sub_25C56EA00())
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v36, 1, 1, v2);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v35, *MEMORY[0x263F73040], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v35, 0, 1, v2);
  uint64_t v38 = (uint64_t)&v6[*(int *)(v54 + 48)];
  sub_25C55E72C(v36, (uint64_t)v6, &qword_26A5B0488);
  sub_25C55E72C(v35, v38, &qword_26A5B0488);
  uint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v39((uint64_t)v6, 1, v2) != 1)
  {
    uint64_t v40 = v52;
    sub_25C55E72C((uint64_t)v6, v52, &qword_26A5B0488);
    if (v39(v38, 1, v2) != 1)
    {
      unint64_t v41 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v46, v38, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      char v42 = sub_25C56ED90();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v3 + 8);
      v43(v41, v2);
      sub_25C5462B8(v35, &qword_26A5B0488);
      sub_25C5462B8(v36, &qword_26A5B0488);
      v43((char *)v40, v2);
      sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
      if (v42) {
        return v37;
      }
      return 0;
    }
    sub_25C5462B8(v35, &qword_26A5B0488);
    sub_25C5462B8(v36, &qword_26A5B0488);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v40, v2);
LABEL_29:
    sub_25C5462B8((uint64_t)v6, &qword_26A5B04E8);
    return 0;
  }
  sub_25C5462B8(v35, &qword_26A5B0488);
  sub_25C5462B8(v36, &qword_26A5B0488);
  if (v39(v38, 1, v2) != 1) {
    goto LABEL_29;
  }
  sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
  return v37;
}

void *sub_25C54B190()
{
  if (*(void *)(v0 + 304))
  {
    uint64_t v1 = *(void **)(v0 + 304);
  }
  else
  {
    uint64_t v1 = sub_25C54B1F0();
    *(void *)(v0 + 304) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_25C54B1F0()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v69 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  unint64_t v65 = (char *)&v59 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v59 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v59 - v16;
  MEMORY[0x270FA5388](v15);
  v71 = (char *)&v59 - v18;
  unint64_t v19 = sub_25C54851C();
  unint64_t v20 = sub_25C564890(v19, MEMORY[0x263F8EE78], sub_25C54BAA0, 0);
  swift_bridgeObjectRelease();
  if (v20 >> 62)
  {
LABEL_49:
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_25C56EF50();
    swift_bridgeObjectRelease();
    unint64_t v61 = v20;
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    unint64_t v61 = v20;
    if (v21)
    {
LABEL_3:
      unint64_t v64 = v20 & 0xC000000000000001;
      unint64_t v59 = v20 + 32;
      uint64_t v80 = v69 + 16;
      unint64_t v20 = v69 + 8;
      int v72 = (void (**)(char *, char *, uint64_t))(v69 + 32);
      v74 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
      v75 = (unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48);
      uint64_t v60 = (void *)MEMORY[0x263F8EE78];
      uint64_t v62 = v21;
      uint64_t v63 = v11;
      uint64_t v22 = 0;
      uint64_t v68 = v14;
      uint64_t v70 = v17;
      while (1)
      {
        if (v64)
        {
          uint64_t v24 = MEMORY[0x261189CD0](v22, v61);
          BOOL v25 = __OFADD__(v22, 1);
          uint64_t v11 = v22 + 1;
          if (v25) {
            goto LABEL_48;
          }
        }
        else
        {
          uint64_t v24 = *(void *)(v59 + 8 * (void)v22);
          swift_retain();
          BOOL v25 = __OFADD__(v22, 1);
          uint64_t v11 = v22 + 1;
          if (v25)
          {
LABEL_48:
            __break(1u);
            goto LABEL_49;
          }
        }
        int v76 = v11;
        uint64_t v26 = sub_25C56E8C0();
        uint64_t v27 = *(void *)(v26 + 16);
        uint64_t v78 = v26;
        uint64_t v79 = v24;
        if (!v27)
        {
LABEL_21:
          uint64_t v34 = *v74;
          uint64_t v35 = (uint64_t)v71;
          (*v74)(v71, 1, 1, v0);
          goto LABEL_23;
        }
        unint64_t v28 = v26 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
        uint64_t v29 = *(void *)(v69 + 72);
        uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
        swift_bridgeObjectRetain();
        while (1)
        {
          v30(v7, v28, v0);
          uint64_t v32 = sub_25C56E910();
          if (!v33) {
            goto LABEL_15;
          }
          if (v32 == 0x54776F6853707061 && v33 == 0xEE006449656C7469) {
            break;
          }
          char v31 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          if (v31) {
            goto LABEL_22;
          }
LABEL_15:
          (*(void (**)(char *, uint64_t))v20)(v7, v0);
          v28 += v29;
          if (!--v27)
          {
            swift_bridgeObjectRelease();
            uint64_t v14 = v68;
            uint64_t v17 = v70;
            goto LABEL_21;
          }
        }
        swift_bridgeObjectRelease();
LABEL_22:
        swift_bridgeObjectRelease();
        uint64_t v35 = (uint64_t)v71;
        (*v72)(v71, v7, v0);
        uint64_t v34 = *v74;
        (*v74)((char *)v35, 0, 1, v0);
        uint64_t v14 = v68;
        uint64_t v17 = v70;
LABEL_23:
        swift_bridgeObjectRelease();
        sub_25C55E72C(v35, (uint64_t)v17, &qword_26A5B0468);
        v73 = *v75;
        if (v73(v17, 1, v0) == 1)
        {
          uint64_t v66 = 0;
          uint64_t v78 = 0;
        }
        else
        {
          uint64_t v36 = v65;
          (*v72)(v65, v17, v0);
          uint64_t v66 = sub_25C56E900();
          uint64_t v78 = v37;
          uint64_t v38 = v36;
          uint64_t v35 = (uint64_t)v71;
          (*(void (**)(char *, uint64_t))v20)(v38, v0);
        }
        sub_25C5462B8(v35, &qword_26A5B0468);
        uint64_t v39 = sub_25C56E8C0();
        uint64_t v40 = *(void *)(v39 + 16);
        uint64_t v77 = v39;
        if (!v40)
        {
          uint64_t v47 = 1;
          uint64_t v48 = (uint64_t)v63;
          goto LABEL_38;
        }
        unint64_t v67 = v34;
        unint64_t v41 = v39 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
        uint64_t v42 = *(void *)(v69 + 72);
        uint64_t v43 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
        swift_bridgeObjectRetain();
        while (2)
        {
          v43(v3, v41, v0);
          uint64_t v45 = sub_25C56E910();
          if (!v46) {
            goto LABEL_29;
          }
          if (v45 != 0x54776F6853707061 || v46 != 0xEC000000656C7469)
          {
            char v44 = sub_25C56EF90();
            swift_bridgeObjectRelease();
            if (v44) {
              goto LABEL_36;
            }
LABEL_29:
            (*(void (**)(char *, uint64_t))v20)(v3, v0);
            v41 += v42;
            if (!--v40)
            {
              swift_bridgeObjectRelease();
              uint64_t v47 = 1;
              uint64_t v48 = (uint64_t)v63;
              uint64_t v14 = v68;
              goto LABEL_37;
            }
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_36:
        swift_bridgeObjectRelease();
        uint64_t v14 = v68;
        (*v72)(v68, v3, v0);
        uint64_t v47 = 0;
        uint64_t v48 = (uint64_t)v63;
LABEL_37:
        uint64_t v17 = v70;
        uint64_t v34 = v67;
LABEL_38:
        v34(v14, v47, 1, v0);
        swift_bridgeObjectRelease();
        sub_25C55E72C((uint64_t)v14, v48, &qword_26A5B0468);
        if (v73((char *)v48, 1, v0) == 1)
        {
          sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
          uint64_t v22 = v76;
LABEL_5:
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v23 = v62;
          goto LABEL_6;
        }
        uint64_t v49 = v65;
        (*v72)(v65, (char *)v48, v0);
        uint64_t v50 = sub_25C56E900();
        uint64_t v52 = v51;
        (*(void (**)(char *, uint64_t))v20)(v49, v0);
        sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
        if (!v78)
        {
          uint64_t v22 = v76;
          goto LABEL_5;
        }
        uint64_t v22 = v76;
        if (!v52) {
          goto LABEL_5;
        }
        swift_release();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v60 = sub_25C563B24(0, v60[2] + 1, 1, v60);
        }
        unint64_t v54 = v60[2];
        unint64_t v53 = v60[3];
        if (v54 >= v53 >> 1) {
          uint64_t v60 = sub_25C563B24((void *)(v53 > 1), v54 + 1, 1, v60);
        }
        unint64_t v55 = v60;
        v60[2] = v54 + 1;
        v56 = &v55[4 * v54];
        v56[4] = v50;
        v56[5] = v52;
        uint64_t v57 = v78;
        v56[6] = v66;
        v56[7] = v57;
        uint64_t v17 = v70;
        uint64_t v23 = v62;
        uint64_t v22 = v76;
LABEL_6:
        if (v22 == (char *)v23) {
          goto LABEL_51;
        }
      }
    }
  }
  uint64_t v60 = (void *)MEMORY[0x263F8EE78];
LABEL_51:
  swift_bridgeObjectRelease_n();
  return v60;
}

uint64_t sub_25C54BAA0(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v46 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v54);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v45 - v11;
  MEMORY[0x270FA5388](v10);
  v56 = (char *)&v45 - v13;
  uint64_t v14 = sub_25C56E920();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25C56EA30();
  unint64_t v55 = v12;
  if (v19)
  {
    uint64_t v20 = v18;
    unint64_t v21 = v19;
    swift_bridgeObjectRelease();
    uint64_t v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0) {
      uint64_t v22 = v20 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v23 = v22 == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  uint64_t v53 = a1;
  uint64_t v24 = sub_25C56E8C0();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)v55;
    uint64_t v36 = (uint64_t)v56;
    if (!v23)
    {
LABEL_18:
      uint64_t v37 = 0;
      goto LABEL_21;
    }
    return 0;
  }
  BOOL v48 = v23;
  uint64_t v49 = v3;
  uint64_t v50 = v6;
  uint64_t v51 = v2;
  unint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  uint64_t v26 = v15 + 16;
  uint64_t v27 = v28;
  unint64_t v29 = v24 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  uint64_t v30 = (void (**)(char *, uint64_t))(v26 - 8);
  uint64_t v31 = *(void *)(v26 + 56);
  uint64_t v47 = v24;
  swift_bridgeObjectRetain();
  while (1)
  {
    v27(v17, v29, v14);
    uint64_t v33 = sub_25C56E910();
    if (!v34)
    {
      (*v30)(v17, v14);
      goto LABEL_9;
    }
    if (v33 == 0x54776F6853707061 && v34 == 0xEC000000656C7469) {
      break;
    }
    char v32 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    (*v30)(v17, v14);
    if (v32) {
      goto LABEL_19;
    }
LABEL_9:
    v29 += v31;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v6 = v50;
      uint64_t v2 = v51;
      uint64_t v3 = v49;
      uint64_t v35 = (uint64_t)v55;
      uint64_t v36 = (uint64_t)v56;
      if (v48) {
        return 0;
      }
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  (*v30)(v17, v14);
LABEL_19:
  swift_bridgeObjectRelease_n();
  uint64_t v6 = v50;
  uint64_t v2 = v51;
  uint64_t v3 = v49;
  uint64_t v35 = (uint64_t)v55;
  uint64_t v36 = (uint64_t)v56;
  if (v48) {
    return 0;
  }
  uint64_t v37 = 1;
LABEL_21:
  if (sub_25C56EA00())
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v36, 1, 1, v2);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v35, *MEMORY[0x263F72FB8], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v35, 0, 1, v2);
  uint64_t v38 = (uint64_t)&v6[*(int *)(v54 + 48)];
  sub_25C55E72C(v36, (uint64_t)v6, &qword_26A5B0488);
  sub_25C55E72C(v35, v38, &qword_26A5B0488);
  uint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v39((uint64_t)v6, 1, v2) != 1)
  {
    uint64_t v40 = v52;
    sub_25C55E72C((uint64_t)v6, v52, &qword_26A5B0488);
    if (v39(v38, 1, v2) != 1)
    {
      unint64_t v41 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v46, v38, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      char v42 = sub_25C56ED90();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v3 + 8);
      v43(v41, v2);
      sub_25C5462B8(v35, &qword_26A5B0488);
      sub_25C5462B8(v36, &qword_26A5B0488);
      v43((char *)v40, v2);
      sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
      if (v42) {
        return v37;
      }
      return 0;
    }
    sub_25C5462B8(v35, &qword_26A5B0488);
    sub_25C5462B8(v36, &qword_26A5B0488);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v40, v2);
LABEL_29:
    sub_25C5462B8((uint64_t)v6, &qword_26A5B04E8);
    return 0;
  }
  sub_25C5462B8(v35, &qword_26A5B0488);
  sub_25C5462B8(v36, &qword_26A5B0488);
  if (v39(v38, 1, v2) != 1) {
    goto LABEL_29;
  }
  sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
  return v37;
}

void *sub_25C54C12C()
{
  if (*(void *)(v0 + 312))
  {
    uint64_t v1 = *(void **)(v0 + 312);
  }
  else
  {
    uint64_t v1 = sub_25C54C18C();
    *(void *)(v0 + 312) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_25C54C18C()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v69 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  unint64_t v65 = (char *)&v59 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v59 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v59 - v16;
  MEMORY[0x270FA5388](v15);
  v71 = (char *)&v59 - v18;
  unint64_t v19 = sub_25C54851C();
  unint64_t v20 = sub_25C564890(v19, MEMORY[0x263F8EE78], sub_25C54CA48, 0);
  swift_bridgeObjectRelease();
  if (v20 >> 62)
  {
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25C56EF50();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v61 = v20;
  if (v21)
  {
    unint64_t v64 = v20 & 0xC000000000000001;
    unint64_t v59 = v20 + 32;
    uint64_t v84 = v69 + 16;
    unint64_t v20 = v69 + 8;
    int v72 = (void (**)(char *, char *, uint64_t))(v69 + 32);
    v74 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
    v75 = (unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48);
    uint64_t v60 = (void *)MEMORY[0x263F8EE78];
    uint64_t v83 = "Id";
    unint64_t v81 = 0x800000025C570A60;
    uint64_t v82 = "appAudiobookTitle";
    unint64_t v80 = 0x800000025C570A80;
    uint64_t v63 = v11;
    uint64_t v22 = 0;
    uint64_t v68 = v14;
    uint64_t v70 = v17;
    uint64_t v62 = v21;
    while (1)
    {
      if (v64)
      {
        uint64_t v24 = MEMORY[0x261189CD0](v22, v61);
        BOOL v25 = __OFADD__(v22, 1);
        uint64_t v11 = v22 + 1;
        if (v25) {
          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v24 = *(void *)(v59 + 8 * (void)v22);
        swift_retain();
        BOOL v25 = __OFADD__(v22, 1);
        uint64_t v11 = v22 + 1;
        if (v25)
        {
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
      }
      int v76 = v11;
      uint64_t v26 = sub_25C56E8C0();
      uint64_t v27 = *(void *)(v26 + 16);
      uint64_t v78 = v26;
      uint64_t v79 = v24;
      if (!v27)
      {
LABEL_22:
        uint64_t v34 = *v74;
        uint64_t v35 = (uint64_t)v71;
        (*v74)(v71, 1, 1, v0);
        goto LABEL_24;
      }
      unint64_t v28 = v26 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v29 = *(void *)(v69 + 72);
      uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v30(v7, v28, v0);
        uint64_t v32 = sub_25C56E910();
        if (!v33) {
          goto LABEL_16;
        }
        if (v32 == 0xD000000000000013 && v33 == v80) {
          break;
        }
        char v31 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        if (v31) {
          goto LABEL_23;
        }
LABEL_16:
        (*(void (**)(char *, uint64_t))v20)(v7, v0);
        v28 += v29;
        if (!--v27)
        {
          swift_bridgeObjectRelease();
          uint64_t v14 = v68;
          uint64_t v17 = v70;
          goto LABEL_22;
        }
      }
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      uint64_t v35 = (uint64_t)v71;
      (*v72)(v71, v7, v0);
      uint64_t v34 = *v74;
      (*v74)((char *)v35, 0, 1, v0);
      uint64_t v14 = v68;
      uint64_t v17 = v70;
LABEL_24:
      swift_bridgeObjectRelease();
      sub_25C55E72C(v35, (uint64_t)v17, &qword_26A5B0468);
      v73 = *v75;
      if (v73(v17, 1, v0) == 1)
      {
        uint64_t v66 = 0;
        uint64_t v78 = 0;
      }
      else
      {
        uint64_t v36 = v65;
        (*v72)(v65, v17, v0);
        uint64_t v66 = sub_25C56E900();
        uint64_t v78 = v37;
        uint64_t v38 = v36;
        uint64_t v35 = (uint64_t)v71;
        (*(void (**)(char *, uint64_t))v20)(v38, v0);
      }
      sub_25C5462B8(v35, &qword_26A5B0468);
      uint64_t v39 = sub_25C56E8C0();
      uint64_t v40 = *(void *)(v39 + 16);
      uint64_t v77 = v39;
      if (!v40)
      {
        uint64_t v47 = 1;
        uint64_t v48 = (uint64_t)v63;
        goto LABEL_39;
      }
      unint64_t v67 = v34;
      unint64_t v41 = v39 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v42 = *(void *)(v69 + 72);
      uint64_t v43 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (2)
      {
        v43(v3, v41, v0);
        uint64_t v45 = sub_25C56E910();
        if (!v46) {
          goto LABEL_30;
        }
        if (v45 != 0xD000000000000011 || v46 != v81)
        {
          char v44 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          if (v44) {
            goto LABEL_37;
          }
LABEL_30:
          (*(void (**)(char *, uint64_t))v20)(v3, v0);
          v41 += v42;
          if (!--v40)
          {
            swift_bridgeObjectRelease();
            uint64_t v47 = 1;
            uint64_t v48 = (uint64_t)v63;
            uint64_t v14 = v68;
            goto LABEL_38;
          }
          continue;
        }
        break;
      }
      swift_bridgeObjectRelease();
LABEL_37:
      swift_bridgeObjectRelease();
      uint64_t v14 = v68;
      (*v72)(v68, v3, v0);
      uint64_t v47 = 0;
      uint64_t v48 = (uint64_t)v63;
LABEL_38:
      uint64_t v17 = v70;
      uint64_t v34 = v67;
LABEL_39:
      v34(v14, v47, 1, v0);
      swift_bridgeObjectRelease();
      sub_25C55E72C((uint64_t)v14, v48, &qword_26A5B0468);
      if (v73((char *)v48, 1, v0) == 1)
      {
        sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
        uint64_t v22 = v76;
LABEL_6:
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v23 = v62;
        goto LABEL_7;
      }
      uint64_t v49 = v65;
      (*v72)(v65, (char *)v48, v0);
      uint64_t v50 = sub_25C56E900();
      uint64_t v52 = v51;
      (*(void (**)(char *, uint64_t))v20)(v49, v0);
      sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
      if (!v78)
      {
        uint64_t v22 = v76;
        goto LABEL_6;
      }
      uint64_t v22 = v76;
      if (!v52) {
        goto LABEL_6;
      }
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v60 = sub_25C563B24(0, v60[2] + 1, 1, v60);
      }
      unint64_t v54 = v60[2];
      unint64_t v53 = v60[3];
      if (v54 >= v53 >> 1) {
        uint64_t v60 = sub_25C563B24((void *)(v53 > 1), v54 + 1, 1, v60);
      }
      unint64_t v55 = v60;
      v60[2] = v54 + 1;
      v56 = &v55[4 * v54];
      v56[4] = v50;
      v56[5] = v52;
      uint64_t v57 = v78;
      v56[6] = v66;
      v56[7] = v57;
      uint64_t v17 = v70;
      uint64_t v23 = v62;
      uint64_t v22 = v76;
LABEL_7:
      if (v22 == (char *)v23) {
        goto LABEL_50;
      }
    }
  }
  uint64_t v60 = (void *)MEMORY[0x263F8EE78];
LABEL_50:
  swift_bridgeObjectRelease_n();
  return v60;
}

uint64_t sub_25C54CA48(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v46 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v54);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v45 - v11;
  MEMORY[0x270FA5388](v10);
  v56 = (char *)&v45 - v13;
  uint64_t v14 = sub_25C56E920();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25C56EA30();
  unint64_t v55 = v12;
  if (v19)
  {
    uint64_t v20 = v18;
    unint64_t v21 = v19;
    swift_bridgeObjectRelease();
    uint64_t v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0) {
      uint64_t v22 = v20 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v23 = v22 == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  uint64_t v53 = a1;
  uint64_t v24 = sub_25C56E8C0();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)v55;
    uint64_t v36 = (uint64_t)v56;
    if (!v23)
    {
LABEL_18:
      uint64_t v37 = 0;
      goto LABEL_21;
    }
    return 0;
  }
  BOOL v48 = v23;
  uint64_t v49 = v3;
  uint64_t v50 = v6;
  uint64_t v51 = v2;
  unint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  uint64_t v26 = v15 + 16;
  uint64_t v27 = v28;
  unint64_t v29 = v24 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  uint64_t v30 = (void (**)(char *, uint64_t))(v26 - 8);
  uint64_t v31 = *(void *)(v26 + 56);
  uint64_t v47 = v24;
  swift_bridgeObjectRetain();
  uint64_t v58 = "Id";
  unint64_t v57 = 0x800000025C570A60;
  while (1)
  {
    v27(v17, v29, v14);
    uint64_t v33 = sub_25C56E910();
    if (!v34)
    {
      (*v30)(v17, v14);
      goto LABEL_9;
    }
    if (v33 == 0xD000000000000011 && v34 == v57) {
      break;
    }
    char v32 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    (*v30)(v17, v14);
    if (v32) {
      goto LABEL_19;
    }
LABEL_9:
    v29 += v31;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v6 = v50;
      uint64_t v2 = v51;
      uint64_t v3 = v49;
      uint64_t v35 = (uint64_t)v55;
      uint64_t v36 = (uint64_t)v56;
      if (v48) {
        return 0;
      }
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  (*v30)(v17, v14);
LABEL_19:
  swift_bridgeObjectRelease_n();
  uint64_t v6 = v50;
  uint64_t v2 = v51;
  uint64_t v3 = v49;
  uint64_t v35 = (uint64_t)v55;
  uint64_t v36 = (uint64_t)v56;
  if (v48) {
    return 0;
  }
  uint64_t v37 = 1;
LABEL_21:
  if (sub_25C56EA00())
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v36, 1, 1, v2);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v35, *MEMORY[0x263F72F58], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v35, 0, 1, v2);
  uint64_t v38 = (uint64_t)&v6[*(int *)(v54 + 48)];
  sub_25C55E72C(v36, (uint64_t)v6, &qword_26A5B0488);
  sub_25C55E72C(v35, v38, &qword_26A5B0488);
  uint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v39((uint64_t)v6, 1, v2) != 1)
  {
    uint64_t v40 = v52;
    sub_25C55E72C((uint64_t)v6, v52, &qword_26A5B0488);
    if (v39(v38, 1, v2) != 1)
    {
      unint64_t v41 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v46, v38, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      char v42 = sub_25C56ED90();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v3 + 8);
      v43(v41, v2);
      sub_25C5462B8(v35, &qword_26A5B0488);
      sub_25C5462B8(v36, &qword_26A5B0488);
      v43((char *)v40, v2);
      sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
      if (v42) {
        return v37;
      }
      return 0;
    }
    sub_25C5462B8(v35, &qword_26A5B0488);
    sub_25C5462B8(v36, &qword_26A5B0488);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v40, v2);
LABEL_29:
    sub_25C5462B8((uint64_t)v6, &qword_26A5B04E8);
    return 0;
  }
  sub_25C5462B8(v35, &qword_26A5B0488);
  sub_25C5462B8(v36, &qword_26A5B0488);
  if (v39(v38, 1, v2) != 1) {
    goto LABEL_29;
  }
  sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
  return v37;
}

void *sub_25C54D0D0()
{
  if (*(void *)(v0 + 320))
  {
    uint64_t v1 = *(void **)(v0 + 320);
  }
  else
  {
    uint64_t v1 = sub_25C54D130();
    *(void *)(v0 + 320) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_25C54D130()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v69 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  unint64_t v65 = (char *)&v59 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v59 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v59 - v16;
  MEMORY[0x270FA5388](v15);
  v71 = (char *)&v59 - v18;
  unint64_t v19 = sub_25C54851C();
  unint64_t v20 = sub_25C564890(v19, MEMORY[0x263F8EE78], sub_25C54D9EC, 0);
  swift_bridgeObjectRelease();
  if (v20 >> 62)
  {
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25C56EF50();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v61 = v20;
  if (v21)
  {
    unint64_t v64 = v20 & 0xC000000000000001;
    unint64_t v59 = v20 + 32;
    uint64_t v84 = v69 + 16;
    unint64_t v20 = v69 + 8;
    int v72 = (void (**)(char *, char *, uint64_t))(v69 + 32);
    v74 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
    v75 = (unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48);
    uint64_t v60 = (void *)MEMORY[0x263F8EE78];
    uint64_t v83 = "appAudiobookTitleId";
    unint64_t v81 = 0x800000025C570AA0;
    uint64_t v82 = "appMusicArtistName";
    unint64_t v80 = 0x800000025C570AC0;
    uint64_t v63 = v11;
    uint64_t v22 = 0;
    uint64_t v68 = v14;
    uint64_t v70 = v17;
    uint64_t v62 = v21;
    while (1)
    {
      if (v64)
      {
        uint64_t v24 = MEMORY[0x261189CD0](v22, v61);
        BOOL v25 = __OFADD__(v22, 1);
        uint64_t v11 = v22 + 1;
        if (v25) {
          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v24 = *(void *)(v59 + 8 * (void)v22);
        swift_retain();
        BOOL v25 = __OFADD__(v22, 1);
        uint64_t v11 = v22 + 1;
        if (v25)
        {
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
      }
      int v76 = v11;
      uint64_t v26 = sub_25C56E8C0();
      uint64_t v27 = *(void *)(v26 + 16);
      uint64_t v78 = v26;
      uint64_t v79 = v24;
      if (!v27)
      {
LABEL_22:
        uint64_t v34 = *v74;
        uint64_t v35 = (uint64_t)v71;
        (*v74)(v71, 1, 1, v0);
        goto LABEL_24;
      }
      unint64_t v28 = v26 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v29 = *(void *)(v69 + 72);
      uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v30(v7, v28, v0);
        uint64_t v32 = sub_25C56E910();
        if (!v33) {
          goto LABEL_16;
        }
        if (v32 == 0xD000000000000014 && v33 == v80) {
          break;
        }
        char v31 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        if (v31) {
          goto LABEL_23;
        }
LABEL_16:
        (*(void (**)(char *, uint64_t))v20)(v7, v0);
        v28 += v29;
        if (!--v27)
        {
          swift_bridgeObjectRelease();
          uint64_t v14 = v68;
          uint64_t v17 = v70;
          goto LABEL_22;
        }
      }
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      uint64_t v35 = (uint64_t)v71;
      (*v72)(v71, v7, v0);
      uint64_t v34 = *v74;
      (*v74)((char *)v35, 0, 1, v0);
      uint64_t v14 = v68;
      uint64_t v17 = v70;
LABEL_24:
      swift_bridgeObjectRelease();
      sub_25C55E72C(v35, (uint64_t)v17, &qword_26A5B0468);
      v73 = *v75;
      if (v73(v17, 1, v0) == 1)
      {
        uint64_t v66 = 0;
        uint64_t v78 = 0;
      }
      else
      {
        uint64_t v36 = v65;
        (*v72)(v65, v17, v0);
        uint64_t v66 = sub_25C56E900();
        uint64_t v78 = v37;
        uint64_t v38 = v36;
        uint64_t v35 = (uint64_t)v71;
        (*(void (**)(char *, uint64_t))v20)(v38, v0);
      }
      sub_25C5462B8(v35, &qword_26A5B0468);
      uint64_t v39 = sub_25C56E8C0();
      uint64_t v40 = *(void *)(v39 + 16);
      uint64_t v77 = v39;
      if (!v40)
      {
        uint64_t v47 = 1;
        uint64_t v48 = (uint64_t)v63;
        goto LABEL_39;
      }
      unint64_t v67 = v34;
      unint64_t v41 = v39 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v42 = *(void *)(v69 + 72);
      uint64_t v43 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (2)
      {
        v43(v3, v41, v0);
        uint64_t v45 = sub_25C56E910();
        if (!v46) {
          goto LABEL_30;
        }
        if (v45 != 0xD000000000000012 || v46 != v81)
        {
          char v44 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          if (v44) {
            goto LABEL_37;
          }
LABEL_30:
          (*(void (**)(char *, uint64_t))v20)(v3, v0);
          v41 += v42;
          if (!--v40)
          {
            swift_bridgeObjectRelease();
            uint64_t v47 = 1;
            uint64_t v48 = (uint64_t)v63;
            uint64_t v14 = v68;
            goto LABEL_38;
          }
          continue;
        }
        break;
      }
      swift_bridgeObjectRelease();
LABEL_37:
      swift_bridgeObjectRelease();
      uint64_t v14 = v68;
      (*v72)(v68, v3, v0);
      uint64_t v47 = 0;
      uint64_t v48 = (uint64_t)v63;
LABEL_38:
      uint64_t v17 = v70;
      uint64_t v34 = v67;
LABEL_39:
      v34(v14, v47, 1, v0);
      swift_bridgeObjectRelease();
      sub_25C55E72C((uint64_t)v14, v48, &qword_26A5B0468);
      if (v73((char *)v48, 1, v0) == 1)
      {
        sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
        uint64_t v22 = v76;
LABEL_6:
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v23 = v62;
        goto LABEL_7;
      }
      uint64_t v49 = v65;
      (*v72)(v65, (char *)v48, v0);
      uint64_t v50 = sub_25C56E900();
      uint64_t v52 = v51;
      (*(void (**)(char *, uint64_t))v20)(v49, v0);
      sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
      if (!v78)
      {
        uint64_t v22 = v76;
        goto LABEL_6;
      }
      uint64_t v22 = v76;
      if (!v52) {
        goto LABEL_6;
      }
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v60 = sub_25C563B24(0, v60[2] + 1, 1, v60);
      }
      unint64_t v54 = v60[2];
      unint64_t v53 = v60[3];
      if (v54 >= v53 >> 1) {
        uint64_t v60 = sub_25C563B24((void *)(v53 > 1), v54 + 1, 1, v60);
      }
      unint64_t v55 = v60;
      v60[2] = v54 + 1;
      v56 = &v55[4 * v54];
      v56[4] = v50;
      v56[5] = v52;
      uint64_t v57 = v78;
      v56[6] = v66;
      v56[7] = v57;
      uint64_t v17 = v70;
      uint64_t v23 = v62;
      uint64_t v22 = v76;
LABEL_7:
      if (v22 == (char *)v23) {
        goto LABEL_50;
      }
    }
  }
  uint64_t v60 = (void *)MEMORY[0x263F8EE78];
LABEL_50:
  swift_bridgeObjectRelease_n();
  return v60;
}

uint64_t sub_25C54D9EC(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v46 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v54);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v45 - v11;
  MEMORY[0x270FA5388](v10);
  v56 = (char *)&v45 - v13;
  uint64_t v14 = sub_25C56E920();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25C56EA30();
  unint64_t v55 = v12;
  if (v19)
  {
    uint64_t v20 = v18;
    unint64_t v21 = v19;
    swift_bridgeObjectRelease();
    uint64_t v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0) {
      uint64_t v22 = v20 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v23 = v22 == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  uint64_t v53 = a1;
  uint64_t v24 = sub_25C56E8C0();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)v55;
    uint64_t v36 = (uint64_t)v56;
    if (!v23)
    {
LABEL_18:
      uint64_t v37 = 0;
      goto LABEL_21;
    }
    return 0;
  }
  BOOL v48 = v23;
  uint64_t v49 = v3;
  uint64_t v50 = v6;
  uint64_t v51 = v2;
  unint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  uint64_t v26 = v15 + 16;
  uint64_t v27 = v28;
  unint64_t v29 = v24 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  uint64_t v30 = (void (**)(char *, uint64_t))(v26 - 8);
  uint64_t v31 = *(void *)(v26 + 56);
  uint64_t v47 = v24;
  swift_bridgeObjectRetain();
  uint64_t v58 = "appAudiobookTitleId";
  unint64_t v57 = 0x800000025C570AA0;
  while (1)
  {
    v27(v17, v29, v14);
    uint64_t v33 = sub_25C56E910();
    if (!v34)
    {
      (*v30)(v17, v14);
      goto LABEL_9;
    }
    if (v33 == 0xD000000000000012 && v34 == v57) {
      break;
    }
    char v32 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    (*v30)(v17, v14);
    if (v32) {
      goto LABEL_19;
    }
LABEL_9:
    v29 += v31;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v6 = v50;
      uint64_t v2 = v51;
      uint64_t v3 = v49;
      uint64_t v35 = (uint64_t)v55;
      uint64_t v36 = (uint64_t)v56;
      if (v48) {
        return 0;
      }
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  (*v30)(v17, v14);
LABEL_19:
  swift_bridgeObjectRelease_n();
  uint64_t v6 = v50;
  uint64_t v2 = v51;
  uint64_t v3 = v49;
  uint64_t v35 = (uint64_t)v55;
  uint64_t v36 = (uint64_t)v56;
  if (v48) {
    return 0;
  }
  uint64_t v37 = 1;
LABEL_21:
  if (sub_25C56EA00())
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v36, 1, 1, v2);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v35, *MEMORY[0x263F72FF0], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v35, 0, 1, v2);
  uint64_t v38 = (uint64_t)&v6[*(int *)(v54 + 48)];
  sub_25C55E72C(v36, (uint64_t)v6, &qword_26A5B0488);
  sub_25C55E72C(v35, v38, &qword_26A5B0488);
  uint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v39((uint64_t)v6, 1, v2) != 1)
  {
    uint64_t v40 = v52;
    sub_25C55E72C((uint64_t)v6, v52, &qword_26A5B0488);
    if (v39(v38, 1, v2) != 1)
    {
      unint64_t v41 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v46, v38, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      char v42 = sub_25C56ED90();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v3 + 8);
      v43(v41, v2);
      sub_25C5462B8(v35, &qword_26A5B0488);
      sub_25C5462B8(v36, &qword_26A5B0488);
      v43((char *)v40, v2);
      sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
      if (v42) {
        return v37;
      }
      return 0;
    }
    sub_25C5462B8(v35, &qword_26A5B0488);
    sub_25C5462B8(v36, &qword_26A5B0488);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v40, v2);
LABEL_29:
    sub_25C5462B8((uint64_t)v6, &qword_26A5B04E8);
    return 0;
  }
  sub_25C5462B8(v35, &qword_26A5B0488);
  sub_25C5462B8(v36, &qword_26A5B0488);
  if (v39(v38, 1, v2) != 1) {
    goto LABEL_29;
  }
  sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
  return v37;
}

void *sub_25C54E074()
{
  if (*(void *)(v0 + 328))
  {
    uint64_t v1 = *(void **)(v0 + 328);
  }
  else
  {
    uint64_t v1 = sub_25C54E0D4();
    *(void *)(v0 + 328) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

void *sub_25C54E0D4()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v69 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  unint64_t v65 = (char *)&v59 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v59 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v59 - v16;
  MEMORY[0x270FA5388](v15);
  v71 = (char *)&v59 - v18;
  unint64_t v19 = sub_25C54851C();
  unint64_t v20 = sub_25C564890(v19, MEMORY[0x263F8EE78], sub_25C54E990, 0);
  swift_bridgeObjectRelease();
  if (v20 >> 62)
  {
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_25C56EF50();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v61 = v20;
  if (v21)
  {
    unint64_t v64 = v20 & 0xC000000000000001;
    unint64_t v59 = v20 + 32;
    uint64_t v84 = v69 + 16;
    unint64_t v20 = v69 + 8;
    int v72 = (void (**)(char *, char *, uint64_t))(v69 + 32);
    v74 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v69 + 56);
    v75 = (unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48);
    uint64_t v60 = (void *)MEMORY[0x263F8EE78];
    uint64_t v83 = "appMusicArtistNameId";
    unint64_t v81 = 0x800000025C570AE0;
    uint64_t v82 = "appAudiobookAuthor";
    unint64_t v80 = 0x800000025C570B00;
    uint64_t v63 = v11;
    uint64_t v22 = 0;
    uint64_t v68 = v14;
    uint64_t v70 = v17;
    uint64_t v62 = v21;
    while (1)
    {
      if (v64)
      {
        uint64_t v24 = MEMORY[0x261189CD0](v22, v61);
        BOOL v25 = __OFADD__(v22, 1);
        uint64_t v11 = v22 + 1;
        if (v25) {
          goto LABEL_51;
        }
      }
      else
      {
        uint64_t v24 = *(void *)(v59 + 8 * (void)v22);
        swift_retain();
        BOOL v25 = __OFADD__(v22, 1);
        uint64_t v11 = v22 + 1;
        if (v25)
        {
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
      }
      int v76 = v11;
      uint64_t v26 = sub_25C56E8C0();
      uint64_t v27 = *(void *)(v26 + 16);
      uint64_t v78 = v26;
      uint64_t v79 = v24;
      if (!v27)
      {
LABEL_22:
        uint64_t v34 = *v74;
        uint64_t v35 = (uint64_t)v71;
        (*v74)(v71, 1, 1, v0);
        goto LABEL_24;
      }
      unint64_t v28 = v26 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v29 = *(void *)(v69 + 72);
      uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (1)
      {
        v30(v7, v28, v0);
        uint64_t v32 = sub_25C56E910();
        if (!v33) {
          goto LABEL_16;
        }
        if (v32 == 0xD000000000000014 && v33 == v80) {
          break;
        }
        char v31 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        if (v31) {
          goto LABEL_23;
        }
LABEL_16:
        (*(void (**)(char *, uint64_t))v20)(v7, v0);
        v28 += v29;
        if (!--v27)
        {
          swift_bridgeObjectRelease();
          uint64_t v14 = v68;
          uint64_t v17 = v70;
          goto LABEL_22;
        }
      }
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      uint64_t v35 = (uint64_t)v71;
      (*v72)(v71, v7, v0);
      uint64_t v34 = *v74;
      (*v74)((char *)v35, 0, 1, v0);
      uint64_t v14 = v68;
      uint64_t v17 = v70;
LABEL_24:
      swift_bridgeObjectRelease();
      sub_25C55E72C(v35, (uint64_t)v17, &qword_26A5B0468);
      v73 = *v75;
      if (v73(v17, 1, v0) == 1)
      {
        uint64_t v66 = 0;
        uint64_t v78 = 0;
      }
      else
      {
        uint64_t v36 = v65;
        (*v72)(v65, v17, v0);
        uint64_t v66 = sub_25C56E900();
        uint64_t v78 = v37;
        uint64_t v38 = v36;
        uint64_t v35 = (uint64_t)v71;
        (*(void (**)(char *, uint64_t))v20)(v38, v0);
      }
      sub_25C5462B8(v35, &qword_26A5B0468);
      uint64_t v39 = sub_25C56E8C0();
      uint64_t v40 = *(void *)(v39 + 16);
      uint64_t v77 = v39;
      if (!v40)
      {
        uint64_t v47 = 1;
        uint64_t v48 = (uint64_t)v63;
        goto LABEL_39;
      }
      unint64_t v67 = v34;
      unint64_t v41 = v39 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
      uint64_t v42 = *(void *)(v69 + 72);
      uint64_t v43 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      swift_bridgeObjectRetain();
      while (2)
      {
        v43(v3, v41, v0);
        uint64_t v45 = sub_25C56E910();
        if (!v46) {
          goto LABEL_30;
        }
        if (v45 != 0xD000000000000012 || v46 != v81)
        {
          char v44 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          if (v44) {
            goto LABEL_37;
          }
LABEL_30:
          (*(void (**)(char *, uint64_t))v20)(v3, v0);
          v41 += v42;
          if (!--v40)
          {
            swift_bridgeObjectRelease();
            uint64_t v47 = 1;
            uint64_t v48 = (uint64_t)v63;
            uint64_t v14 = v68;
            goto LABEL_38;
          }
          continue;
        }
        break;
      }
      swift_bridgeObjectRelease();
LABEL_37:
      swift_bridgeObjectRelease();
      uint64_t v14 = v68;
      (*v72)(v68, v3, v0);
      uint64_t v47 = 0;
      uint64_t v48 = (uint64_t)v63;
LABEL_38:
      uint64_t v17 = v70;
      uint64_t v34 = v67;
LABEL_39:
      v34(v14, v47, 1, v0);
      swift_bridgeObjectRelease();
      sub_25C55E72C((uint64_t)v14, v48, &qword_26A5B0468);
      if (v73((char *)v48, 1, v0) == 1)
      {
        sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
        uint64_t v22 = v76;
LABEL_6:
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v23 = v62;
        goto LABEL_7;
      }
      uint64_t v49 = v65;
      (*v72)(v65, (char *)v48, v0);
      uint64_t v50 = sub_25C56E900();
      uint64_t v52 = v51;
      (*(void (**)(char *, uint64_t))v20)(v49, v0);
      sub_25C5462B8((uint64_t)v14, &qword_26A5B0468);
      if (!v78)
      {
        uint64_t v22 = v76;
        goto LABEL_6;
      }
      uint64_t v22 = v76;
      if (!v52) {
        goto LABEL_6;
      }
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v60 = sub_25C563B24(0, v60[2] + 1, 1, v60);
      }
      unint64_t v54 = v60[2];
      unint64_t v53 = v60[3];
      if (v54 >= v53 >> 1) {
        uint64_t v60 = sub_25C563B24((void *)(v53 > 1), v54 + 1, 1, v60);
      }
      unint64_t v55 = v60;
      v60[2] = v54 + 1;
      v56 = &v55[4 * v54];
      v56[4] = v50;
      v56[5] = v52;
      uint64_t v57 = v78;
      v56[6] = v66;
      v56[7] = v57;
      uint64_t v17 = v70;
      uint64_t v23 = v62;
      uint64_t v22 = v76;
LABEL_7:
      if (v22 == (char *)v23) {
        goto LABEL_50;
      }
    }
  }
  uint64_t v60 = (void *)MEMORY[0x263F8EE78];
LABEL_50:
  swift_bridgeObjectRelease_n();
  return v60;
}

uint64_t sub_25C54E990(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v46 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v54);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v45 - v11;
  MEMORY[0x270FA5388](v10);
  v56 = (char *)&v45 - v13;
  uint64_t v14 = sub_25C56E920();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_25C56EA30();
  unint64_t v55 = v12;
  if (v19)
  {
    uint64_t v20 = v18;
    unint64_t v21 = v19;
    swift_bridgeObjectRelease();
    uint64_t v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0) {
      uint64_t v22 = v20 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v23 = v22 == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  uint64_t v53 = a1;
  uint64_t v24 = sub_25C56E8C0();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)v55;
    uint64_t v36 = (uint64_t)v56;
    if (!v23)
    {
LABEL_18:
      uint64_t v37 = 0;
      goto LABEL_21;
    }
    return 0;
  }
  BOOL v48 = v23;
  uint64_t v49 = v3;
  uint64_t v50 = v6;
  uint64_t v51 = v2;
  unint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  uint64_t v26 = v15 + 16;
  uint64_t v27 = v28;
  unint64_t v29 = v24 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  uint64_t v30 = (void (**)(char *, uint64_t))(v26 - 8);
  uint64_t v31 = *(void *)(v26 + 56);
  uint64_t v47 = v24;
  swift_bridgeObjectRetain();
  uint64_t v58 = "appMusicArtistNameId";
  unint64_t v57 = 0x800000025C570AE0;
  while (1)
  {
    v27(v17, v29, v14);
    uint64_t v33 = sub_25C56E910();
    if (!v34)
    {
      (*v30)(v17, v14);
      goto LABEL_9;
    }
    if (v33 == 0xD000000000000012 && v34 == v57) {
      break;
    }
    char v32 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    (*v30)(v17, v14);
    if (v32) {
      goto LABEL_19;
    }
LABEL_9:
    v29 += v31;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v6 = v50;
      uint64_t v2 = v51;
      uint64_t v3 = v49;
      uint64_t v35 = (uint64_t)v55;
      uint64_t v36 = (uint64_t)v56;
      if (v48) {
        return 0;
      }
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  (*v30)(v17, v14);
LABEL_19:
  swift_bridgeObjectRelease_n();
  uint64_t v6 = v50;
  uint64_t v2 = v51;
  uint64_t v3 = v49;
  uint64_t v35 = (uint64_t)v55;
  uint64_t v36 = (uint64_t)v56;
  if (v48) {
    return 0;
  }
  uint64_t v37 = 1;
LABEL_21:
  if (sub_25C56EA00())
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v36, 1, 1, v2);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v35, *MEMORY[0x263F72FF0], v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v35, 0, 1, v2);
  uint64_t v38 = (uint64_t)&v6[*(int *)(v54 + 48)];
  sub_25C55E72C(v36, (uint64_t)v6, &qword_26A5B0488);
  sub_25C55E72C(v35, v38, &qword_26A5B0488);
  uint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v39((uint64_t)v6, 1, v2) != 1)
  {
    uint64_t v40 = v52;
    sub_25C55E72C((uint64_t)v6, v52, &qword_26A5B0488);
    if (v39(v38, 1, v2) != 1)
    {
      unint64_t v41 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v46, v38, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      char v42 = sub_25C56ED90();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v3 + 8);
      v43(v41, v2);
      sub_25C5462B8(v35, &qword_26A5B0488);
      sub_25C5462B8(v36, &qword_26A5B0488);
      v43((char *)v40, v2);
      sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
      if (v42) {
        return v37;
      }
      return 0;
    }
    sub_25C5462B8(v35, &qword_26A5B0488);
    sub_25C5462B8(v36, &qword_26A5B0488);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v40, v2);
LABEL_29:
    sub_25C5462B8((uint64_t)v6, &qword_26A5B04E8);
    return 0;
  }
  sub_25C5462B8(v35, &qword_26A5B0488);
  sub_25C5462B8(v36, &qword_26A5B0488);
  if (v39(v38, 1, v2) != 1) {
    goto LABEL_29;
  }
  sub_25C5462B8((uint64_t)v6, &qword_26A5B0488);
  return v37;
}

uint64_t sub_25C54F018@<X0>(unsigned char *a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + 336);
  if (v3 == 3)
  {
    uint64_t result = sub_25C54F064(v1, (uint64_t)&v5);
    LOBYTE(v3) = v5;
    *(unsigned char *)(v1 + 336) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_25C54F064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v44[0] = a2;
  uint64_t v3 = sub_25C56E920();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v44 - v7;
  uint64_t v53 = a1;
  unint64_t v9 = sub_25C54851C();
  unint64_t v10 = v9;
  if (v9 >> 62) {
    goto LABEL_47;
  }
  uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (uint64_t i = v6; v11; uint64_t i = v6)
  {
    uint64_t v12 = 4;
    uint64_t v13 = MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v14 = v12 - 4;
      if ((v10 & 0xC000000000000001) != 0)
      {
        uint64_t v15 = MEMORY[0x261189CD0](v12 - 4, v10);
        uint64_t v6 = (char *)(v12 - 3);
        if (__OFADD__(v14, 1)) {
          break;
        }
        goto LABEL_9;
      }
      uint64_t v15 = *(void *)(v10 + 8 * v12);
      swift_retain();
      uint64_t v6 = (char *)(v12 - 3);
      if (__OFADD__(v14, 1)) {
        break;
      }
LABEL_9:
      uint64_t v16 = sub_25C56190C(v13, v15);
      swift_release();
      if (v16)
      {
        swift_bridgeObjectRelease_n();
        uint64_t result = swift_release();
        char v42 = 0;
        goto LABEL_59;
      }
      ++v12;
      BOOL v17 = v6 == (char *)v11;
      uint64_t v6 = i;
      if (v17) {
        goto LABEL_12;
      }
    }
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25C56EF50();
  }
LABEL_12:
  uint64_t v18 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease_n();
  unint64_t v10 = sub_25C54851C();
  uint64_t v19 = sub_25C564890(v10, v18, (uint64_t (*)(uint64_t))sub_25C54F6A8, 0);
  swift_bridgeObjectRelease();
  uint64_t v55 = v18;
  if ((unint64_t)v19 >> 62)
  {
    if (v19 < 0) {
      unint64_t v10 = v19;
    }
    else {
      unint64_t v10 = v19 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_25C56EF50();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_14;
    }
LABEL_53:
    swift_bridgeObjectRelease();
    uint64_t v40 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_54;
  }
  uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v20) {
    goto LABEL_53;
  }
LABEL_14:
  unint64_t v21 = 0;
  unint64_t v49 = v19 & 0xC000000000000001;
  v44[1] = v19 + 32;
  uint64_t v45 = v19 & 0xFFFFFFFFFFFFFF8;
  uint64_t v22 = (void (**)(char *, uint64_t))(v48 + 8);
  uint64_t v46 = v20;
  uint64_t v47 = v19;
  do
  {
    while (1)
    {
      if (v49)
      {
        uint64_t v23 = MEMORY[0x261189CD0](v21, v19);
        BOOL v24 = __OFADD__(v21++, 1);
        if (v24) {
          goto LABEL_44;
        }
      }
      else
      {
        if (v21 >= *(void *)(v45 + 16)) {
          goto LABEL_46;
        }
        uint64_t v23 = swift_retain();
        BOOL v24 = __OFADD__(v21++, 1);
        if (v24)
        {
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
      }
      uint64_t v25 = v23;
      uint64_t v26 = sub_25C56E8C0();
      unint64_t v10 = *(void *)(v26 + 16);
      if (v10) {
        break;
      }
      unint64_t v10 = v26;
      swift_release();
      swift_bridgeObjectRelease();
      if (v21 == v20) {
        goto LABEL_41;
      }
    }
    uint64_t v51 = v25;
    unint64_t v52 = v21;
    unint64_t v27 = v26 + ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80));
    uint64_t v53 = *(void *)(v48 + 72);
    unint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v48 + 16);
    uint64_t v50 = v26;
    swift_bridgeObjectRetain();
    while (1)
    {
      v28(v8, v27, v3);
      uint64_t v31 = sub_25C56E910();
      if (!v32)
      {
        v28(v6, (unint64_t)v8, v3);
LABEL_37:
        uint64_t v38 = *v22;
        (*v22)(v6, v3);
        v38(v8, v3);
        goto LABEL_25;
      }
      if (v31 == 0x616C50616964656DLL && v32 == 0xEF6E756F4E726579)
      {
        swift_bridgeObjectRelease();
        v28(v6, (unint64_t)v8, v3);
      }
      else
      {
        char v33 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        v28(v6, (unint64_t)v8, v3);
        if ((v33 & 1) == 0) {
          goto LABEL_37;
        }
      }
      sub_25C56E900();
      uint64_t v34 = sub_25C56EDB0();
      uint64_t v36 = v35;
      swift_bridgeObjectRelease();
      if (qword_26A5B03C8 != -1) {
        swift_once();
      }
      if (v34 == sub_25C56EDB0() && v36 == v37) {
        break;
      }
      char v29 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v30 = *v22;
      (*v22)(i, v3);
      v30(v8, v3);
      if (v29) {
        goto LABEL_39;
      }
LABEL_25:
      uint64_t v6 = i;
      v27 += v53;
      if (!--v10)
      {
        swift_release();
        swift_bridgeObjectRelease_n();
        goto LABEL_40;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v39 = *v22;
    (*v22)(i, v3);
    v39(v8, v3);
LABEL_39:
    swift_bridgeObjectRelease_n();
    sub_25C56EF00();
    unint64_t v10 = *(void *)(v55 + 16);
    sub_25C56EF20();
    sub_25C56EF30();
    sub_25C56EF10();
    uint64_t v6 = i;
LABEL_40:
    uint64_t v20 = v46;
    uint64_t v19 = v47;
    unint64_t v21 = v52;
  }
  while (v52 != v46);
LABEL_41:
  swift_bridgeObjectRelease();
  uint64_t v40 = v55;
  if (v55 < 0)
  {
LABEL_60:
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_25C56EF50();
    swift_release();
    goto LABEL_56;
  }
LABEL_54:
  if ((v40 & 0x4000000000000000) != 0) {
    goto LABEL_60;
  }
  uint64_t v43 = *(void *)(v40 + 16);
LABEL_56:
  uint64_t result = swift_release();
  if (v43) {
    char v42 = 1;
  }
  else {
    char v42 = 2;
  }
LABEL_59:
  *(unsigned char *)v44[0] = v42;
  return result;
}

uint64_t sub_25C54F69C(uint64_t a1)
{
  return sub_25C54FDE4(a1, MEMORY[0x263F73028]);
}

uint64_t sub_25C54F6AC()
{
  uint64_t v1 = *(void *)(v0 + 344);
  uint64_t v2 = v1;
  if (v1 == 1)
  {
    uint64_t v2 = sub_25C54F70C();
    uint64_t v3 = *(void *)(v0 + 344);
    *(void *)(v0 + 344) = v2;
    swift_retain();
    sub_25C55C7F4(v3);
  }
  sub_25C55E664(v1);
  return v2;
}

uint64_t sub_25C54F70C()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = v0;
  if (v0 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C56EF50();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      uint64_t v3 = 4;
      uint64_t v4 = MEMORY[0x263F8EE78];
      do
      {
        uint64_t v5 = v3 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = MEMORY[0x261189CD0](v3 - 4, v1);
          uint64_t v7 = v3 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v6 = *(void *)(v1 + 8 * v3);
          swift_retain();
          uint64_t v7 = v3 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        uint64_t v8 = sub_25C561938(v4, v6);
        swift_release();
        if (v8)
        {
          swift_bridgeObjectRelease_n();
          swift_retain();
          uint64_t v10 = sub_25C56EA40();
          swift_release_n();
          return v10;
        }
        ++v3;
      }
      while (v7 != v2);
    }
  }
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t sub_25C54F848()
{
  if (*(void *)(v0 + 352))
  {
    uint64_t v1 = *(void *)(v0 + 352);
  }
  else
  {
    uint64_t v1 = sub_25C54F8A8(v0);
    *(void *)(v0 + 352) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C54F8A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04F8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v24 - v6;
  uint64_t v27 = MEMORY[0x263F8EE88];
  unint64_t v8 = sub_25C54851C();
  unint64_t v9 = sub_25C564890(v8, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C54FD70, 0);
  swift_bridgeObjectRelease();
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C56EF50();
    uint64_t v10 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_38:
    swift_bridgeObjectRelease_n();
    if (*(void *)(a1 + 48))
    {
      swift_retain();
      sub_25C56ECD0();
      swift_release();
      if (v26[0])
      {
        uint64_t v19 = sub_25C561AA8(MEMORY[0x263F8EE78], v26[0]);
        swift_release();
        if (v19)
        {
          sub_25C557468(v26, 3);
          swift_release();
        }
      }
    }
    if (*(void *)(a1 + 64))
    {
      swift_retain();
      sub_25C56EC90();
      swift_release();
      if (v26[0])
      {
        sub_25C56EA30();
        uint64_t v21 = v20;
        swift_bridgeObjectRelease();
        if (v21) {
          sub_25C557468(v26, 11);
        }
        uint64_t v22 = sub_25C56EA40();
        swift_release();
        if (v22) {
          sub_25C557468(v26, 13);
        }
        uint64_t v23 = sub_25C56EA10();
        swift_release();
        if (v23) {
          sub_25C557468(v26, 14);
        }
        swift_release();
      }
    }
    return v27;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_38;
  }
LABEL_3:
  if (v10 >= 1)
  {
    uint64_t v12 = 0;
    int v13 = *MEMORY[0x263F72EC0];
    int v25 = *MEMORY[0x263F72E48];
    while (1)
    {
      if ((v9 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v12, v9);
      }
      else {
        swift_retain();
      }
      if (UsoEntity_common_MediaItem.isFromArtist()()) {
        break;
      }
      if (UsoEntity_common_MediaItem.isFromSong()())
      {
        uint64_t v14 = 1;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isFromAlbum()())
      {
        uint64_t v14 = 2;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isRecommended()())
      {
        uint64_t v14 = 7;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isAffinity()())
      {
        uint64_t v14 = 6;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isDiscover()())
      {
        uint64_t v14 = 8;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isAddToUnspecifiedPlaylist()())
      {
        uint64_t v14 = 9;
        goto LABEL_22;
      }
      if (sub_25C56E950())
      {
        swift_release();
        if (sub_25C56E950())
        {
          int v24 = v13;
          sub_25C56EAF0();
          swift_release();
          uint64_t v15 = sub_25C56EB00();
          uint64_t v16 = *(void *)(v15 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15) == 1) {
            goto LABEL_29;
          }
          sub_25C55E72C((uint64_t)v7, (uint64_t)v5, &qword_26A5B04F8);
          int v17 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v5, v15);
          if (v17 == v24)
          {
            uint64_t v18 = 12;
            goto LABEL_34;
          }
          if (v17 == v25)
          {
            uint64_t v18 = 10;
LABEL_34:
            sub_25C5462B8((uint64_t)v7, &qword_26A5B04F8);
            sub_25C557468(v26, v18);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v15);
LABEL_29:
            sub_25C5462B8((uint64_t)v7, &qword_26A5B04F8);
          }
          swift_release();
          int v13 = v24;
          goto LABEL_24;
        }
      }
LABEL_23:
      swift_release();
LABEL_24:
      if (v10 == ++v12) {
        goto LABEL_38;
      }
    }
    uint64_t v14 = 0;
LABEL_22:
    sub_25C557468(v26, v14);
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C54FD70()
{
  if (!UsoEntity_common_MediaItem.isFromArtist()()
    && !UsoEntity_common_MediaItem.isFromSong()()
    && !UsoEntity_common_MediaItem.isFromAlbum()()
    && !UsoEntity_common_MediaItem.isRecommended()()
    && !UsoEntity_common_MediaItem.isAffinity()()
    && !UsoEntity_common_MediaItem.isDiscover()()
    && !UsoEntity_common_MediaItem.isAddToUnspecifiedPlaylist()())
  {
    uint64_t result = sub_25C56E950();
    if (!result) {
      return result;
    }
    swift_release();
  }
  return 1;
}

uint64_t sub_25C54FDD8(uint64_t a1)
{
  return sub_25C54FDE4(a1, MEMORY[0x263F73010]);
}

uint64_t sub_25C54FDE4(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = sub_25C56EB60();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v27 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v26 - v14;
  MEMORY[0x270FA5388](v13);
  int v17 = (char *)&v26 - v16;
  if (sub_25C56EA00())
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v17, 1, 1, v3);
  }
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v15, *a2, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v15, 0, 1, v3);
  uint64_t v18 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_25C55E72C((uint64_t)v17, (uint64_t)v8, &qword_26A5B0488);
  sub_25C55E72C((uint64_t)v15, v18, &qword_26A5B0488);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v19((uint64_t)v8, 1, v3) == 1)
  {
    sub_25C5462B8((uint64_t)v15, &qword_26A5B0488);
    sub_25C5462B8((uint64_t)v17, &qword_26A5B0488);
    int v20 = v19(v18, 1, v3);
    if (v20 == 1) {
      uint64_t v21 = &qword_26A5B0488;
    }
    else {
      uint64_t v21 = &qword_26A5B04E8;
    }
    if (v20 == 1) {
      char v22 = -1;
    }
    else {
      char v22 = 0;
    }
  }
  else
  {
    sub_25C55E72C((uint64_t)v8, (uint64_t)v12, &qword_26A5B0488);
    if (v19(v18, 1, v3) == 1)
    {
      sub_25C5462B8((uint64_t)v15, &qword_26A5B0488);
      sub_25C5462B8((uint64_t)v17, &qword_26A5B0488);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
      char v22 = 0;
      uint64_t v21 = &qword_26A5B04E8;
    }
    else
    {
      uint64_t v23 = v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v27, v18, v3);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      char v22 = sub_25C56ED90();
      int v24 = *(void (**)(char *, uint64_t))(v4 + 8);
      v24(v23, v3);
      uint64_t v21 = &qword_26A5B0488;
      sub_25C5462B8((uint64_t)v15, &qword_26A5B0488);
      sub_25C5462B8((uint64_t)v17, &qword_26A5B0488);
      v24(v12, v3);
    }
  }
  sub_25C5462B8((uint64_t)v8, v21);
  return v22 & 1;
}

uint64_t sub_25C5501F8()
{
  if (*(void *)(v0 + 360))
  {
    uint64_t v1 = *(void *)(v0 + 360);
  }
  else
  {
    uint64_t v1 = sub_25C550258();
    *(void *)(v0 + 360) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C550258()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], sub_25C55040C, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C55040C(uint64_t a1)
{
  return sub_25C550418(a1, MEMORY[0x263F72FC0]);
}

uint64_t sub_25C550418(uint64_t a1, unsigned int *a2)
{
  uint64_t v31 = a2;
  uint64_t v2 = sub_25C56EB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v30 = (uint64_t)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v30 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v30 - v15;
  uint64_t v17 = sub_25C56EA30();
  if (!v18) {
    goto LABEL_7;
  }
  uint64_t v19 = v17;
  unint64_t v20 = v18;
  swift_bridgeObjectRelease();
  uint64_t v21 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v21 = v19 & 0xFFFFFFFFFFFFLL;
  }
  if (v21)
  {
    if (sub_25C56EA00())
    {
      sub_25C56EB50();
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v16, 1, 1, v2);
    }
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v14, *v31, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v14, 0, 1, v2);
    uint64_t v23 = (uint64_t)&v8[*(int *)(v6 + 48)];
    sub_25C55E72C((uint64_t)v16, (uint64_t)v8, &qword_26A5B0488);
    sub_25C55E72C((uint64_t)v14, v23, &qword_26A5B0488);
    int v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
    if (v24((uint64_t)v8, 1, v2) == 1)
    {
      sub_25C5462B8((uint64_t)v14, &qword_26A5B0488);
      sub_25C5462B8((uint64_t)v16, &qword_26A5B0488);
      int v25 = v24(v23, 1, v2);
      if (v25 == 1) {
        uint64_t v26 = &qword_26A5B0488;
      }
      else {
        uint64_t v26 = &qword_26A5B04E8;
      }
      if (v25 == 1) {
        char v22 = -1;
      }
      else {
        char v22 = 0;
      }
    }
    else
    {
      uint64_t v27 = v30;
      sub_25C55E72C((uint64_t)v8, v30, &qword_26A5B0488);
      if (v24(v23, 1, v2) == 1)
      {
        sub_25C5462B8((uint64_t)v14, &qword_26A5B0488);
        sub_25C5462B8((uint64_t)v16, &qword_26A5B0488);
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v27, v2);
        char v22 = 0;
        uint64_t v26 = &qword_26A5B04E8;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v23, v2);
        sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
        char v22 = sub_25C56ED90();
        unint64_t v28 = *(void (**)(char *, uint64_t))(v3 + 8);
        v28(v5, v2);
        uint64_t v26 = &qword_26A5B0488;
        sub_25C5462B8((uint64_t)v14, &qword_26A5B0488);
        sub_25C5462B8((uint64_t)v16, &qword_26A5B0488);
        v28((char *)v27, v2);
      }
    }
    sub_25C5462B8((uint64_t)v8, v26);
  }
  else
  {
LABEL_7:
    char v22 = 0;
  }
  return v22 & 1;
}

uint64_t sub_25C550864()
{
  if (*(void *)(v0 + 368))
  {
    uint64_t v1 = *(void *)(v0 + 368);
  }
  else
  {
    uint64_t v1 = sub_25C5508C4();
    *(void *)(v0 + 368) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C5508C4()
{
  unint64_t v0 = sub_25C550A3C();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C550A3C()
{
  if (*(void *)(v0 + 376))
  {
    uint64_t v1 = *(void *)(v0 + 376);
  }
  else
  {
    unint64_t v2 = sub_25C54851C();
    uint64_t v1 = sub_25C564890(v2, MEMORY[0x263F8EE78], sub_25C559218, 0);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 376) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C550AD8()
{
  if (*(void *)(v0 + 384))
  {
    uint64_t v1 = *(void *)(v0 + 384);
  }
  else
  {
    uint64_t v1 = sub_25C55BC14();
    *(void *)(v0 + 384) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C550B38()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v4 = v2;
  if (v3 != 1) {
    goto LABEL_11;
  }
  unint64_t v5 = sub_25C549204();
  unint64_t v6 = v5;
  if (!(v5 >> 62))
  {
    uint64_t result = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_4;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v4 = 0;
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t result = sub_25C56EF50();
  if (!result) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v6 & 0xC000000000000001) != 0)
  {
    MEMORY[0x261189CD0](0, v6);
    goto LABEL_7;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_25C56E9A0();
    uint64_t v9 = v8;
    swift_release();
LABEL_10:
    uint64_t v10 = *(void *)(v1 + 392);
    uint64_t v11 = *(void *)(v1 + 400);
    *(void *)(v1 + 392) = v4;
    *(void *)(v1 + 400) = v9;
    swift_bridgeObjectRetain();
    sub_25C55BDC8(v10, v11);
LABEL_11:
    sub_25C55BDDC(v2, v3);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C550C54()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 408);
  uint64_t v3 = *(void *)(v0 + 416);
  uint64_t v4 = v2;
  if (v3 != 1) {
    goto LABEL_11;
  }
  unint64_t v5 = sub_25C549204();
  unint64_t v6 = v5;
  if (!(v5 >> 62))
  {
    uint64_t result = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_4;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v4 = 0;
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t result = sub_25C56EF50();
  if (!result) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v6 & 0xC000000000000001) != 0)
  {
    MEMORY[0x261189CD0](0, v6);
    goto LABEL_7;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t v4 = UsoEntity_common_App.bundleIdentifier.getter();
    uint64_t v9 = v8;
    swift_release();
LABEL_10:
    uint64_t v10 = *(void *)(v1 + 408);
    uint64_t v11 = *(void *)(v1 + 416);
    *(void *)(v1 + 408) = v4;
    *(void *)(v1 + 416) = v9;
    swift_bridgeObjectRetain();
    sub_25C55BDC8(v10, v11);
LABEL_11:
    sub_25C55BDDC(v2, v3);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C550D70()
{
  if (*(void *)(v0 + 424))
  {
    uint64_t v1 = *(void *)(v0 + 424);
  }
  else
  {
    uint64_t v1 = sub_25C550DD0();
    *(void *)(v0 + 424) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C550DD0()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], sub_25C550F84, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    unint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          unint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        unint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C550F84(uint64_t a1)
{
  return sub_25C550418(a1, MEMORY[0x263F72F60]);
}

uint64_t sub_25C550F90()
{
  if (*(void *)(v0 + 432))
  {
    uint64_t v1 = *(void *)(v0 + 432);
  }
  else
  {
    uint64_t v1 = sub_25C55BDF0();
    *(void *)(v0 + 432) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C550FF0()
{
  uint64_t v1 = *(void *)(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 448);
  uint64_t v3 = v1;
  if (v2 == 1)
  {
    uint64_t v3 = sub_25C55BFA4(v0, 11);
    uint64_t v4 = *(void *)(v0 + 440);
    uint64_t v5 = *(void *)(v0 + 448);
    *(void *)(v0 + 440) = v3;
    *(void *)(v0 + 448) = v6;
    swift_bridgeObjectRetain();
    sub_25C55BDC8(v4, v5);
  }
  sub_25C55BDDC(v1, v2);
  return v3;
}

uint64_t sub_25C55107C()
{
  uint64_t v1 = *(void *)(v0 + 456);
  uint64_t v2 = *(void *)(v0 + 464);
  uint64_t v3 = v1;
  if (v2 == 1)
  {
    uint64_t v3 = sub_25C55BFA4(v0, 12);
    uint64_t v4 = *(void *)(v0 + 456);
    uint64_t v5 = *(void *)(v0 + 464);
    *(void *)(v0 + 456) = v3;
    *(void *)(v0 + 464) = v6;
    swift_bridgeObjectRetain();
    sub_25C55BDC8(v4, v5);
  }
  sub_25C55BDDC(v1, v2);
  return v3;
}

uint64_t sub_25C551108()
{
  if (*(void *)(v0 + 472))
  {
    uint64_t v1 = *(void *)(v0 + 472);
  }
  else
  {
    uint64_t v1 = sub_25C55C640();
    *(void *)(v0 + 472) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C551168()
{
  if (*(void *)(v0 + 480))
  {
    uint64_t v1 = *(void *)(v0 + 480);
  }
  else
  {
    uint64_t v1 = sub_25C5511C8();
    *(void *)(v0 + 480) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C5511C8()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], sub_25C55137C, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C55137C(uint64_t a1)
{
  return sub_25C550418(a1, MEMORY[0x263F72F78]);
}

uint64_t sub_25C551388@<X0>(unsigned char *a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + 488);
  if (v3 == 12)
  {
    uint64_t result = sub_25C5513D4(&v5);
    LOBYTE(v3) = v5;
    *(unsigned char *)(v1 + 488) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_25C5513D4@<X0>(unsigned char *a1@<X8>)
{
  unint64_t v67 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (uint64_t)v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v69 = (char *)v66 - v5;
  uint64_t v6 = sub_25C56E920();
  uint64_t v75 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v79 = (char *)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v80 = (char *)v66 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v66 - v11;
  unint64_t v13 = sub_25C54851C();
  unint64_t v14 = sub_25C564890(v13, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C54F6A8, 0);
  swift_bridgeObjectRelease();
  if (v14 >> 62)
  {
LABEL_74:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C56EF50();
    uint64_t v15 = result;
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  unint64_t v18 = v79;
  uint64_t v70 = v4;
  if (v15)
  {
    if (v15 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v19 = 0;
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v14 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v19, v14);
      }
      else {
        swift_retain();
      }
      uint64_t v21 = sub_25C56E8C0();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v20 = sub_25C563C34(0, v20[2] + 1, 1, v20);
      }
      char v22 = v20;
      unint64_t v23 = v20[2];
      int v24 = v22;
      unint64_t v25 = v22[3];
      uint64_t v4 = v23 + 1;
      if (v23 >= v25 >> 1) {
        int v24 = sub_25C563C34((void *)(v25 > 1), v23 + 1, 1, v24);
      }
      ++v19;
      v24[2] = v4;
      uint64_t v26 = &v24[v23];
      unint64_t v20 = v24;
      v26[4] = v21;
      unint64_t v18 = v79;
    }
    while (v15 != v19);
  }
  else
  {
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v81 = v17;
  uint64_t v73 = v20[2];
  if (v73)
  {
    unint64_t v27 = 0;
    v71 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v14;
    int v72 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 4);
    unint64_t v28 = (void (**)(char *, uint64_t))(v75 + 8);
    uint64_t v77 = "";
    unint64_t v78 = 0x800000025C5708D0;
    uint64_t v68 = (void (**)(char *, char *, uint64_t))v20;
    while (1)
    {
      if (v27 >= v20[2])
      {
        __break(1u);
        goto LABEL_74;
      }
      char v29 = v72[v27];
      uint64_t v30 = *((void *)v29 + 2);
      if (!v30) {
        goto LABEL_20;
      }
      unint64_t v74 = v27;
      uint64_t v31 = (char *)v29 + ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80));
      uint64_t v32 = *(void *)(v75 + 72);
      char v33 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
      int v76 = (char *)v29;
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v33(v12, v31, v6);
        uint64_t v37 = sub_25C56E910();
        if (!v38)
        {
          uint64_t v34 = v80;
          v33(v80, v12, v6);
          goto LABEL_25;
        }
        if (v37 == 0xD000000000000012 && v38 == v78) {
          break;
        }
        uint64_t v4 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        uint64_t v34 = v80;
        v33(v80, v12, v6);
        if (v4) {
          goto LABEL_33;
        }
LABEL_25:
        uint64_t v35 = v34;
        uint64_t v36 = *v28;
        (*v28)(v35, v6);
LABEL_26:
        v36(v12, v6);
LABEL_27:
        v31 += v32;
        if (!--v30)
        {
          swift_bridgeObjectRelease_n();
          unint64_t v18 = v79;
          unint64_t v14 = (unint64_t)v71;
          unint64_t v20 = v68;
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      v33(v80, v12, v6);
LABEL_33:
      if (!sub_25C56E900() && v39 == 0xE000000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v36 = *v28;
        (*v28)(v80, v6);
        goto LABEL_26;
      }
      uint64_t v4 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      uint64_t v40 = *v28;
      (*v28)(v80, v6);
      v40(v12, v6);
      if (v4) {
        goto LABEL_27;
      }
      swift_bridgeObjectRelease();
      uint64_t v41 = v81;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C564168(0, *(void *)(v41 + 16) + 1, 1);
        uint64_t v41 = v81;
      }
      unint64_t v14 = (unint64_t)v71;
      unint64_t v20 = v68;
      unint64_t v43 = *(void *)(v41 + 16);
      unint64_t v42 = *(void *)(v41 + 24);
      uint64_t v4 = v43 + 1;
      char v44 = v76;
      if (v43 >= v42 >> 1)
      {
        sub_25C564168(v42 > 1, v43 + 1, 1);
        char v44 = v76;
        uint64_t v41 = v81;
      }
      *(void *)(v41 + 16) = v4;
      *(void *)(v41 + 8 * v43 + 32) = v44;
      unint64_t v18 = v79;
LABEL_19:
      unint64_t v27 = v74;
LABEL_20:
      if (++v27 == v73)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v45 = v81;
        goto LABEL_44;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v45 = MEMORY[0x263F8EE78];
LABEL_44:
  uint64_t v47 = (uint64_t)v69;
  uint64_t v46 = v70;
  unint64_t v74 = *(void *)(v45 + 16);
  if (v74)
  {
    uint64_t v48 = (void (**)(char *, uint64_t))(v75 + 8);
    uint64_t v68 = (void (**)(char *, char *, uint64_t))(v75 + 32);
    int v72 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v75 + 56);
    uint64_t v73 = v45 + 32;
    v71 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48);
    v66[1] = v45;
    swift_retain();
    uint64_t v49 = 0;
    uint64_t v50 = (char *)MEMORY[0x263F8EE78];
    unint64_t v80 = "";
    unint64_t v78 = 0x800000025C5708D0;
    while (1)
    {
      int v76 = v50;
      uint64_t v51 = *(void *)(v73 + 8 * v49);
      uint64_t v52 = *(void *)(v51 + 16);
      uint64_t v77 = (char *)v51;
      if (!v52)
      {
        swift_bridgeObjectRetain();
        uint64_t v59 = 1;
        uint64_t v50 = v76;
        goto LABEL_60;
      }
      uint64_t v53 = v51 + ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80));
      uint64_t v54 = *(void *)(v75 + 72);
      uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v75 + 16);
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v55(v18, v53, v6);
        uint64_t v57 = sub_25C56E910();
        if (!v58) {
          goto LABEL_51;
        }
        if (v57 == 0xD000000000000012 && v58 == v78) {
          break;
        }
        char v56 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        if (v56) {
          goto LABEL_58;
        }
LABEL_51:
        unint64_t v18 = v79;
        (*v48)(v79, v6);
        v53 += v54;
        if (!--v52)
        {
          swift_bridgeObjectRelease();
          uint64_t v59 = 1;
          uint64_t v47 = (uint64_t)v69;
          uint64_t v46 = v70;
          goto LABEL_59;
        }
      }
      swift_bridgeObjectRelease();
LABEL_58:
      swift_bridgeObjectRelease();
      uint64_t v47 = (uint64_t)v69;
      (*v68)(v69, v79, v6);
      uint64_t v59 = 0;
      uint64_t v46 = v70;
LABEL_59:
      uint64_t v50 = v76;
LABEL_60:
      (*v72)(v47, v59, 1, v6);
      sub_25C55E72C(v47, v46, &qword_26A5B0468);
      if ((*v71)(v46, 1, v6) == 1)
      {
        sub_25C5462B8(v46, &qword_26A5B0468);
        uint64_t v60 = 0;
        uint64_t v61 = 0;
      }
      else
      {
        uint64_t v60 = sub_25C56E900();
        uint64_t v61 = v62;
        (*v48)((char *)v46, v6);
      }
      static CommonAudio.Decade.from(_:)(v60, v61, (char *)&v81);
      swift_bridgeObjectRelease();
      sub_25C5462B8(v47, &qword_26A5B0468);
      swift_bridgeObjectRelease();
      char v63 = v81;
      if (v81 == 11)
      {
        unint64_t v18 = v79;
      }
      else
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v50 = sub_25C563D44(0, *((void *)v50 + 2) + 1, 1, v50);
        }
        unint64_t v65 = *((void *)v50 + 2);
        unint64_t v64 = *((void *)v50 + 3);
        if (v65 >= v64 >> 1) {
          uint64_t v50 = sub_25C563D44((char *)(v64 > 1), v65 + 1, 1, v50);
        }
        *((void *)v50 + 2) = v65 + 1;
        v50[v65 + 32] = v63;
        unint64_t v18 = v79;
      }
      if (++v49 == v74)
      {
        swift_release_n();
        if (*((void *)v50 + 2)) {
          goto LABEL_70;
        }
LABEL_72:
        uint64_t result = swift_bridgeObjectRelease();
        unsigned char *v67 = 11;
        return result;
      }
    }
  }
  swift_release();
  uint64_t v50 = (char *)MEMORY[0x263F8EE78];
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_72;
  }
LABEL_70:
  unsigned char *v67 = v50[32];
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C551D28@<X0>(unsigned char *a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + 489);
  if (v3 == 10)
  {
    uint64_t result = sub_25C551D74(&v5);
    LOBYTE(v3) = v5;
    *(unsigned char *)(v1 + 489) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_25C551D74@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  char v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v25 - v6;
  unint64_t v8 = sub_25C54851C();
  uint64_t v9 = v8;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25C56EF50();
    if (v10) {
      goto LABEL_3;
    }
LABEL_35:
    swift_bridgeObjectRelease_n();
    goto LABEL_36;
  }
  uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_35;
  }
LABEL_3:
  v25[0] = (uint64_t)v5;
  uint64_t v11 = a1;
  uint64_t v12 = 4;
  uint64_t v13 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v14 = v12 - 4;
    if ((v9 & 0xC000000000000001) != 0)
    {
      uint64_t v15 = MEMORY[0x261189CD0](v12 - 4, v9);
      uint64_t v16 = v15;
      a1 = (char *)(v12 - 3);
      if (__OFADD__(v14, 1)) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(v9 + 8 * v12);
      LODWORD(v15) = swift_retain();
      a1 = (char *)(v12 - 3);
      if (__OFADD__(v14, 1))
      {
LABEL_28:
        __break(1u);
LABEL_29:
        if (v15 == *MEMORY[0x263F730C0])
        {
          char v22 = 1;
          goto LABEL_38;
        }
        if (v15 != *MEMORY[0x263F730C8])
        {
          if (v15 == *MEMORY[0x263F730E8])
          {
            char v22 = 5;
          }
          else if (v15 == *MEMORY[0x263F730D0])
          {
            char v22 = 2;
          }
          else if (v15 == *MEMORY[0x263F730F8])
          {
            char v22 = 7;
          }
          else
          {
            if (v15 != *MEMORY[0x263F73100])
            {
              (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v25[0], v9);
              goto LABEL_37;
            }
            char v22 = 6;
          }
LABEL_38:
          *a1 = v22;
          return sub_25C5462B8((uint64_t)v7, &qword_26A5B04E0);
        }
LABEL_27:
        char v22 = 0;
        goto LABEL_38;
      }
    }
    uint64_t v17 = sub_25C561AD4(v13, v16);
    swift_release();
    if (v17) {
      break;
    }
    ++v12;
    if (a1 == (char *)v10)
    {
      swift_bridgeObjectRelease_n();
      a1 = v11;
      goto LABEL_36;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_retain();
  uint64_t v18 = sub_25C56E980();
  swift_release();
  a1 = v11;
  if (!v18 || (v19 = sub_25C56EC50(), uint64_t result = swift_release(), !v19))
  {
LABEL_23:
    swift_release();
    goto LABEL_36;
  }
  if (!(v19 >> 62))
  {
    if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_16;
    }
LABEL_46:
    swift_release();
    swift_bridgeObjectRelease();
LABEL_36:
    uint64_t v23 = sub_25C56EBA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v7, 1, 1, v23);
LABEL_37:
    char v22 = 9;
    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_25C56EF50();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_46;
  }
LABEL_16:
  if ((v19 & 0xC000000000000001) != 0)
  {
    MEMORY[0x261189CD0](0, v19);
LABEL_19:
    swift_bridgeObjectRelease();
    sub_25C56E930();
    swift_release();
    if (v25[1])
    {
      sub_25C56EB90();
      swift_release();
      swift_release();
      uint64_t v9 = sub_25C56EBA0();
      uint64_t v14 = *(void *)(v9 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v9) == 1) {
        goto LABEL_37;
      }
      uint64_t v21 = v25[0];
      sub_25C55E72C((uint64_t)v7, v25[0], &qword_26A5B04E0);
      LODWORD(v15) = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 88))(v21, v9);
      if (v15 == *MEMORY[0x263F730E0])
      {
        char v22 = 4;
        goto LABEL_38;
      }
      if (v15 == *MEMORY[0x263F730D8])
      {
        char v22 = 3;
        goto LABEL_38;
      }
      if (v15 == *MEMORY[0x263F730F0]) {
        goto LABEL_27;
      }
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C55221C()
{
  uint64_t result = sub_25C56E980();
  if (!result) {
    return result;
  }
  unint64_t v1 = sub_25C56EC50();
  uint64_t result = swift_release();
  if (!v1) {
    return 0;
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25C56EF50();
    uint64_t result = swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_5:
  if ((v1 & 0xC000000000000001) != 0)
  {
    MEMORY[0x261189CD0](0, v1);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_25C56E930();
  swift_release();
  uint64_t result = v3;
  if (v3)
  {
    swift_release();
    return 1;
  }
  return result;
}

uint64_t sub_25C552314()
{
  if (*(void *)(v0 + 496))
  {
    uint64_t v1 = *(void *)(v0 + 496);
  }
  else
  {
    uint64_t v1 = sub_25C552374();
    *(void *)(v0 + 496) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C552374()
{
  uint64_t v0 = (uint64_t *)sub_25C56EAC0();
  uint64_t v1 = (unsigned int (**)(uint64_t, uint64_t, uint64_t *))*(v0 - 1);
  MEMORY[0x270FA5388](v0);
  int v76 = (char *)&v74 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04A8);
  MEMORY[0x270FA5388](v87);
  uint64_t v4 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04B0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  unint64_t v8 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v101 = (uint64_t)&v74 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v102 = (uint64_t)&v74 - v11;
  uint64_t v99 = sub_25C56EAA0();
  uint64_t v12 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  unint64_t v78 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04B8);
  MEMORY[0x270FA5388](v100);
  uint64_t v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04C0);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  unint64_t v19 = (unint64_t)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  v91 = (char *)&v74 - v21;
  MEMORY[0x270FA5388](v20);
  v104 = (char *)&v74 - v22;
  unint64_t v23 = sub_25C54851C();
  unint64_t v24 = sub_25C564890(v23, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C5533F4, 0);
  swift_bridgeObjectRelease();
  if (v24 >> 62)
  {
LABEL_84:
    swift_bridgeObjectRetain_n();
    uint64_t v25 = sub_25C56EF50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v88 = v24;
  if (!v25)
  {
    uint64_t v12 = MEMORY[0x263F8EE88];
LABEL_80:
    swift_bridgeObjectRelease_n();
    return v12;
  }
  unint64_t v80 = v8;
  unint64_t v24 = 0;
  unint64_t v98 = v88 & 0xC000000000000001;
  unint64_t v81 = v88 + 32;
  uint64_t v96 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  unsigned int v95 = *MEMORY[0x263F72C90];
  v94 = (void (**)(char *, void, uint64_t))(v12 + 104);
  uint64_t v26 = (uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v77 = (void (**)(char *, uint64_t, uint64_t))(v12 + 32);
  uint64_t v82 = (void (**)(unint64_t, uint64_t))(v12 + 8);
  uint64_t v85 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v1 + 7);
  unsigned int v84 = *MEMORY[0x263F72CC8];
  uint64_t v83 = (void (**)(uint64_t, void, uint64_t *))(v1 + 13);
  uint64_t v89 = v1 + 6;
  uint64_t v75 = (void (**)(char *, uint64_t, uint64_t *))(v1 + 4);
  uint64_t v79 = (void (**)(uint64_t, uint64_t *))(v1 + 1);
  uint64_t v12 = MEMORY[0x263F8EE88];
  v86 = v0;
  v90 = v4;
  unint64_t v92 = v19;
  unint64_t v8 = v91;
  uint64_t v4 = v104;
  v103 = v15;
  uint64_t v97 = v25;
  uint64_t v93 = v26;
  while (1)
  {
    if (v98)
    {
      uint64_t v28 = MEMORY[0x261189CD0](v24, v88);
      BOOL v29 = __OFADD__(v24++, 1);
      if (v29) {
        goto LABEL_81;
      }
    }
    else
    {
      uint64_t v28 = swift_retain();
      BOOL v29 = __OFADD__(v24++, 1);
      if (v29)
      {
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
    }
    v105 = (unsigned int (**)(uint64_t, uint64_t, uint64_t *))v28;
    if (sub_25C56E940())
    {
      sub_25C56EA90();
      swift_release();
      uint64_t v30 = v96;
      uint64_t v31 = v99;
    }
    else
    {
      uint64_t v30 = v96;
      uint64_t v31 = v99;
      (*v96)(v4, 1, 1, v99);
    }
    (*v94)(v8, v95, v31);
    (*v30)(v8, 0, 1, v31);
    uint64_t v32 = (uint64_t)&v15[*(int *)(v100 + 48)];
    sub_25C55E72C((uint64_t)v4, (uint64_t)v15, &qword_26A5B04C0);
    sub_25C55E72C((uint64_t)v8, v32, &qword_26A5B04C0);
    uint64_t v1 = (unsigned int (**)(uint64_t, uint64_t, uint64_t *))v15;
    char v33 = *v93;
    if ((*v93)(v15, 1, v31) == 1)
    {
      int v34 = v33((char *)v32, 1, v31);
      uint64_t v35 = v102;
      if (v34 == 1)
      {
        uint64_t v15 = v103;
        sub_25C5462B8((uint64_t)v103, &qword_26A5B04C0);
        sub_25C5462B8((uint64_t)v8, &qword_26A5B04C0);
        sub_25C5462B8((uint64_t)v104, &qword_26A5B04C0);
LABEL_34:
        sub_25C56EFC0();
        swift_bridgeObjectRetain();
        sub_25C56EDC0();
        uint64_t v49 = sub_25C56EFE0();
        uint64_t v50 = -1 << *(unsigned char *)(v12 + 32);
        unint64_t v19 = v49 & ~v50;
        uint64_t v0 = (uint64_t *)(v12 + 56);
        if ((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
        {
          uint64_t v51 = ~v50;
          while ((*(unsigned char *)(*(void *)(v12 + 48) + v19) & 1) != 0)
          {
            char v52 = sub_25C56EF90();
            swift_bridgeObjectRelease();
            if (v52) {
              goto LABEL_5;
            }
            unint64_t v19 = (v19 + 1) & v51;
            if (((*(unint64_t *)((char *)v0 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
              goto LABEL_49;
            }
          }
LABEL_54:
          swift_bridgeObjectRelease();
LABEL_5:
          swift_bridgeObjectRelease();
          swift_release();
          unint64_t v19 = v92;
          uint64_t v4 = v104;
          goto LABEL_6;
        }
LABEL_49:
        swift_bridgeObjectRelease();
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v106 = v12;
        if (*(void *)(v12 + 24) <= *(void *)(v12 + 16))
        {
          uint64_t v4 = v104;
          if (isUniquelyReferenced_nonNull_native) {
            sub_25C557EDC();
          }
          else {
            sub_25C558F4C();
          }
          uint64_t v12 = v106;
          sub_25C56EFC0();
          sub_25C56EDC0();
          uint64_t v62 = sub_25C56EFE0();
          uint64_t v63 = -1 << *(unsigned char *)(v12 + 32);
          unint64_t v19 = v62 & ~v63;
          uint64_t v0 = (uint64_t *)(v12 + 56);
          if ((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
          {
            uint64_t v64 = ~v63;
            while ((*(unsigned char *)(*(void *)(v12 + 48) + v19) & 1) != 0)
            {
              char v65 = sub_25C56EF90();
              swift_bridgeObjectRelease();
              if (v65) {
                goto LABEL_86;
              }
              unint64_t v19 = (v19 + 1) & v64;
              if (((*(unint64_t *)((char *)v0 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
              {
                uint64_t v4 = v104;
                goto LABEL_64;
              }
            }
            goto LABEL_85;
          }
LABEL_64:
          uint64_t v27 = v97;
          uint64_t v1 = v105;
        }
        else
        {
          uint64_t v4 = v104;
          uint64_t v1 = v105;
          uint64_t v27 = v97;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_25C55893C();
            uint64_t v27 = v97;
            uint64_t v12 = v106;
          }
        }
        *(void *)(v12 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v19;
        *(unsigned char *)(*(void *)(v12 + 48) + v19) = 0;
        uint64_t v66 = *(void *)(v12 + 16);
        BOOL v29 = __OFADD__(v66, 1);
        uint64_t v67 = v66 + 1;
        if (v29) {
          goto LABEL_82;
        }
LABEL_78:
        *(void *)(v12 + 16) = v67;
        swift_release();
        swift_bridgeObjectRelease();
        unint64_t v19 = v92;
        goto LABEL_7;
      }
      goto LABEL_21;
    }
    sub_25C55E72C((uint64_t)v15, v19, &qword_26A5B04C0);
    if (v33((char *)v32, 1, v31) == 1)
    {
      (*v82)(v19, v31);
      uint64_t v35 = v102;
LABEL_21:
      sub_25C5462B8((uint64_t)v103, &qword_26A5B04B8);
      sub_25C5462B8((uint64_t)v8, &qword_26A5B04C0);
      sub_25C5462B8((uint64_t)v104, &qword_26A5B04C0);
      uint64_t v1 = v89;
      uint64_t v0 = &qword_26A5B04B0;
      uint64_t v36 = v101;
      goto LABEL_22;
    }
    uint64_t v45 = v78;
    (*v77)(v78, v32, v31);
    sub_25C55E6E4(&qword_26A5B04D0, MEMORY[0x263F72CB0]);
    char v46 = sub_25C56ED90();
    uint64_t v47 = *v82;
    (*v82)(v19, v31);
    uint64_t v48 = v45;
    unint64_t v8 = v91;
    v47((unint64_t)v48, v31);
    sub_25C5462B8((uint64_t)v15, &qword_26A5B04C0);
    sub_25C5462B8((uint64_t)v8, &qword_26A5B04C0);
    sub_25C5462B8((uint64_t)v104, &qword_26A5B04C0);
    uint64_t v36 = v101;
    uint64_t v35 = v102;
    uint64_t v1 = v89;
    uint64_t v0 = &qword_26A5B04B0;
    if (v46) {
      goto LABEL_34;
    }
LABEL_22:
    if (sub_25C56E980() && (uint64_t v37 = sub_25C56EC20(), swift_release(), v37))
    {
      sub_25C56EAB0();
      swift_release();
      uint64_t v38 = v85;
      uint64_t v39 = v86;
    }
    else
    {
      uint64_t v38 = v85;
      uint64_t v39 = v86;
      (*v85)(v35, 1, 1, v86);
    }
    (*v83)(v36, v84, v39);
    (*v38)(v36, 0, 1, v39);
    uint64_t v40 = (uint64_t)v90;
    uint64_t v41 = (uint64_t)&v90[*(int *)(v87 + 48)];
    sub_25C55E72C(v35, (uint64_t)v90, &qword_26A5B04B0);
    sub_25C55E72C(v36, v41, &qword_26A5B04B0);
    uint64_t v42 = v35;
    unint64_t v43 = *v1;
    if ((*v1)(v40, 1, v39) == 1) {
      break;
    }
    uint64_t v44 = (uint64_t)v80;
    sub_25C55E72C(v40, (uint64_t)v80, &qword_26A5B04B0);
    if (v43(v41, 1, v39) == 1)
    {
      sub_25C5462B8(v101, &qword_26A5B04B0);
      sub_25C5462B8(v102, &qword_26A5B04B0);
      (*v79)(v44, v39);
      goto LABEL_31;
    }
    uint64_t v53 = v76;
    (*v75)(v76, v41, v39);
    sub_25C55E6E4(&qword_26A5B04C8, MEMORY[0x263F72CD0]);
    char v54 = sub_25C56ED90();
    uint64_t v1 = (unsigned int (**)(uint64_t, uint64_t, uint64_t *))v79;
    uint64_t v55 = *v79;
    (*v79)((uint64_t)v53, v39);
    sub_25C5462B8(v101, &qword_26A5B04B0);
    sub_25C5462B8(v102, &qword_26A5B04B0);
    v55(v44, v39);
    sub_25C5462B8((uint64_t)v90, &qword_26A5B04B0);
    unint64_t v8 = v91;
    uint64_t v15 = v103;
    uint64_t v4 = v104;
    if (v54) {
      goto LABEL_41;
    }
LABEL_32:
    swift_release();
    unint64_t v19 = v92;
LABEL_6:
    uint64_t v27 = v97;
LABEL_7:
    if (v24 == v27) {
      goto LABEL_80;
    }
  }
  sub_25C5462B8(v36, &qword_26A5B04B0);
  sub_25C5462B8(v42, &qword_26A5B04B0);
  if (v43(v41, 1, v39) != 1)
  {
LABEL_31:
    sub_25C5462B8(v40, &qword_26A5B04A8);
    unint64_t v8 = v91;
    uint64_t v15 = v103;
    uint64_t v4 = v104;
    goto LABEL_32;
  }
  sub_25C5462B8(v40, &qword_26A5B04B0);
  unint64_t v8 = v91;
  uint64_t v15 = v103;
LABEL_41:
  sub_25C56EFC0();
  swift_bridgeObjectRetain();
  sub_25C56EDC0();
  uint64_t v56 = sub_25C56EFE0();
  uint64_t v57 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v19 = v56 & ~v57;
  uint64_t v0 = (uint64_t *)(v12 + 56);
  if ((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
  {
    uint64_t v58 = ~v57;
    while (*(unsigned char *)(*(void *)(v12 + 48) + v19) != 1)
    {
      char v59 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      if (v59) {
        goto LABEL_5;
      }
      unint64_t v19 = (v19 + 1) & v58;
      if (((*(unint64_t *)((char *)v0 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        goto LABEL_46;
      }
    }
    goto LABEL_54;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  int v60 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v106 = v12;
  if (*(void *)(v12 + 24) > *(void *)(v12 + 16))
  {
    uint64_t v4 = v104;
    uint64_t v1 = v105;
    uint64_t v27 = v97;
    if ((v60 & 1) == 0)
    {
      sub_25C55893C();
      uint64_t v27 = v97;
      uint64_t v12 = v106;
    }
    goto LABEL_77;
  }
  uint64_t v4 = v104;
  if (v60) {
    sub_25C557EDC();
  }
  else {
    sub_25C558F4C();
  }
  uint64_t v12 = v106;
  sub_25C56EFC0();
  sub_25C56EDC0();
  uint64_t v68 = sub_25C56EFE0();
  uint64_t v69 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v19 = v68 & ~v69;
  uint64_t v0 = (uint64_t *)(v12 + 56);
  if (((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
  {
LABEL_76:
    uint64_t v27 = v97;
    uint64_t v1 = v105;
LABEL_77:
    *(void *)(v12 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v19;
    *(unsigned char *)(*(void *)(v12 + 48) + v19) = 1;
    uint64_t v72 = *(void *)(v12 + 16);
    BOOL v29 = __OFADD__(v72, 1);
    uint64_t v67 = v72 + 1;
    if (v29) {
      goto LABEL_83;
    }
    goto LABEL_78;
  }
  uint64_t v70 = ~v69;
  while (*(unsigned char *)(*(void *)(v12 + 48) + v19) != 1)
  {
    char v71 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    if (v71) {
      goto LABEL_86;
    }
    unint64_t v19 = (v19 + 1) & v70;
    if (((*(unint64_t *)((char *)v0 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
    {
      uint64_t v4 = v104;
      goto LABEL_76;
    }
  }
LABEL_85:
  swift_bridgeObjectRelease();
LABEL_86:
  uint64_t result = sub_25C56EFB0();
  __break(1u);
  return result;
}

BOOL sub_25C5533F4()
{
  return UsoEntity_common_MediaItem.isMoreOf()() || UsoEntity_common_MediaItem.isDifferentThan()();
}

uint64_t sub_25C55342C@<X0>(unsigned char *a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + 504);
  if (v3 == 3)
  {
    uint64_t result = sub_25C553478(&v5);
    LOBYTE(v3) = v5;
    *(unsigned char *)(v1 + 504) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_25C553478@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04A0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  char v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v24 - v6;
  unint64_t v8 = sub_25C54851C();
  unint64_t v9 = v8;
  if (!(v8 >> 62))
  {
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10) {
      goto LABEL_3;
    }
LABEL_22:
    swift_bridgeObjectRelease_n();
LABEL_23:
    uint64_t v22 = sub_25C56EB80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v7, 1, 1, v22);
    goto LABEL_24;
  }
LABEL_21:
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_25C56EF50();
  if (!v10) {
    goto LABEL_22;
  }
LABEL_3:
  uint64_t v25 = v5;
  char v5 = a1;
  uint64_t v11 = 4;
  uint64_t v12 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v13 = v11 - 4;
    if ((v9 & 0xC000000000000001) != 0)
    {
      uint64_t v14 = MEMORY[0x261189CD0](v11 - 4, v9);
      a1 = (char *)(v11 - 3);
      if (__OFADD__(v13, 1)) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v14 = *(void *)(v9 + 8 * v11);
      swift_retain();
      a1 = (char *)(v11 - 3);
      if (__OFADD__(v13, 1))
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
    }
    uint64_t v15 = sub_25C561C74(v12, v14);
    swift_release();
    if (v15) {
      break;
    }
    ++v11;
    if (a1 == (char *)v10)
    {
      swift_bridgeObjectRelease_n();
      a1 = v5;
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_retain();
  uint64_t v16 = sub_25C56E970();
  swift_release();
  a1 = v5;
  if (!v16)
  {
    swift_release();
    goto LABEL_23;
  }
  sub_25C56EB70();
  swift_release();
  swift_release();
  uint64_t v17 = sub_25C56EB80();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v7, 1, v17) == 1) {
    goto LABEL_24;
  }
  uint64_t v19 = (uint64_t)v25;
  sub_25C55E72C((uint64_t)v7, (uint64_t)v25, &qword_26A5B04A0);
  int v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 88))(v19, v17);
  if (v20 == *MEMORY[0x263F73098])
  {
    char v21 = 1;
    goto LABEL_25;
  }
  if (v20 == *MEMORY[0x263F730A0])
  {
    char v21 = 0;
    goto LABEL_25;
  }
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v17);
LABEL_24:
  char v21 = 2;
LABEL_25:
  *a1 = v21;
  return sub_25C5462B8((uint64_t)v7, &qword_26A5B04A0);
}

uint64_t sub_25C5537A4()
{
  if (*(void *)(v0 + 512))
  {
    uint64_t v1 = *(void *)(v0 + 512);
  }
  else
  {
    uint64_t v1 = sub_25C553804();
    *(void *)(v0 + 512) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C553804()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v66 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v61 = (char *)&v59 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v68 = (char *)&v59 - v7;
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v59 - v8;
  unint64_t v10 = sub_25C54851C();
  unint64_t v11 = sub_25C564890(v10, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C54F6A8, 0);
  swift_bridgeObjectRelease();
  if (v11 >> 62)
  {
LABEL_64:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C56EF50();
    uint64_t v12 = result;
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v14 = (void *)MEMORY[0x263F8EE78];
  if (v12)
  {
    if (v12 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v15 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v15, v11);
      }
      else {
        swift_retain();
      }
      uint64_t v16 = sub_25C56E8C0();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_25C563C34(0, v14[2] + 1, 1, v14);
      }
      uint64_t v17 = v14;
      unint64_t v18 = v14[2];
      uint64_t v19 = v17;
      unint64_t v20 = v17[3];
      if (v18 >= v20 >> 1) {
        uint64_t v19 = sub_25C563C34((void *)(v20 > 1), v18 + 1, 1, v19);
      }
      ++v15;
      v19[2] = v18 + 1;
      char v21 = &v19[v18];
      uint64_t v14 = v19;
      v21[4] = v16;
    }
    while (v12 != v15);
  }
  swift_bridgeObjectRelease();
  uint64_t v69 = (char *)MEMORY[0x263F8EE78];
  uint64_t v64 = v14[2];
  if (v64)
  {
    unint64_t v59 = v11;
    int v60 = v3;
    unint64_t v22 = 0;
    uint64_t v62 = v14;
    uint64_t v63 = v14 + 4;
    uint64_t v3 = (char *)(v66 + 16);
    unint64_t v23 = (void (**)(char *, uint64_t))(v66 + 8);
    while (1)
    {
      if (v22 >= v14[2])
      {
        __break(1u);
        goto LABEL_64;
      }
      uint64_t v24 = v63[v22];
      unint64_t v11 = *(void *)(v24 + 16);
      if (!v11) {
        goto LABEL_18;
      }
      uint64_t v65 = v22;
      uint64_t v25 = v24 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
      uint64_t v26 = *(void *)(v66 + 72);
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
      uint64_t v67 = v24;
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v27(v9, v25, v0);
        uint64_t v31 = sub_25C56E910();
        if (!v32)
        {
          uint64_t v28 = v68;
          v27(v68, (uint64_t)v9, v0);
          goto LABEL_23;
        }
        if (v31 == 0x6E6547636973756DLL && v32 == 0xEA00000000006572) {
          break;
        }
        char v33 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        uint64_t v28 = v68;
        v27(v68, (uint64_t)v9, v0);
        if (v33) {
          goto LABEL_31;
        }
LABEL_23:
        BOOL v29 = v28;
        uint64_t v30 = *v23;
        (*v23)(v29, v0);
LABEL_24:
        v30(v9, v0);
LABEL_25:
        v25 += v26;
        if (!--v11)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v14 = v62;
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();
      v27(v68, (uint64_t)v9, v0);
LABEL_31:
      if (!sub_25C56E900() && v34 == 0xE000000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v30 = *v23;
        (*v23)(v68, v0);
        goto LABEL_24;
      }
      char v35 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      uint64_t v36 = *v23;
      (*v23)(v68, v0);
      v36(v9, v0);
      if (v35) {
        goto LABEL_25;
      }
      swift_bridgeObjectRelease();
      uint64_t v37 = v69;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C564168(0, *((void *)v37 + 2) + 1, 1);
        uint64_t v37 = v69;
      }
      uint64_t v14 = v62;
      unint64_t v11 = *((void *)v37 + 2);
      unint64_t v38 = *((void *)v37 + 3);
      if (v11 >= v38 >> 1)
      {
        sub_25C564168(v38 > 1, v11 + 1, 1);
        uint64_t v37 = v69;
      }
      *((void *)v37 + 2) = v11 + 1;
      *(void *)&v37[8 * v11 + 32] = v67;
LABEL_17:
      unint64_t v22 = v65;
LABEL_18:
      if (++v22 == v64)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v39 = v69;
        uint64_t v3 = v60;
        goto LABEL_42;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v39 = (char *)MEMORY[0x263F8EE78];
LABEL_42:
  uint64_t v64 = *((void *)v39 + 2);
  if (!v64)
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v40 = (void (**)(char *, uint64_t))(v66 + 8);
  uint64_t v62 = (void *)(v66 + 32);
  uint64_t v63 = v39 + 32;
  int v60 = v39;
  swift_retain();
  uint64_t v41 = 0;
  uint64_t v42 = (char *)MEMORY[0x263F8EE78];
  while (2)
  {
    uint64_t v43 = v63[v41];
    uint64_t v44 = *(void *)(v43 + 16);
    if (!v44) {
      goto LABEL_46;
    }
    uint64_t v67 = v41;
    uint64_t v68 = v42;
    uint64_t v45 = v43 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
    uint64_t v46 = *(void *)(v66 + 72);
    uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
    uint64_t v65 = v43;
    swift_bridgeObjectRetain_n();
    while (1)
    {
      v47(v3, v45, v0);
      uint64_t v49 = v3;
      uint64_t v50 = sub_25C56E910();
      if (!v51) {
        goto LABEL_50;
      }
      if (v50 == 0x6E6547636973756DLL && v51 == 0xEA00000000006572) {
        break;
      }
      char v48 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      if (v48) {
        goto LABEL_55;
      }
LABEL_50:
      uint64_t v3 = v49;
      (*v40)(v49, v0);
      v45 += v46;
      if (!--v44)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v42 = v68;
        goto LABEL_45;
      }
    }
    swift_bridgeObjectRelease();
LABEL_55:
    swift_bridgeObjectRelease();
    char v52 = v61;
    uint64_t v3 = v49;
    ((void (*)(char *, char *, uint64_t))*v62)(v61, v49, v0);
    uint64_t v53 = sub_25C56E900();
    uint64_t v55 = v54;
    (*v40)(v52, v0);
    swift_bridgeObjectRelease();
    uint64_t v42 = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v42 = (char *)sub_25C563A14(0, *((void *)v42 + 2) + 1, 1, v42);
    }
    unint64_t v57 = *((void *)v42 + 2);
    unint64_t v56 = *((void *)v42 + 3);
    if (v57 >= v56 >> 1) {
      uint64_t v42 = (char *)sub_25C563A14((void *)(v56 > 1), v57 + 1, 1, v42);
    }
    *((void *)v42 + 2) = v57 + 1;
    uint64_t v58 = &v42[16 * v57];
    *((void *)v58 + 4) = v53;
    *((void *)v58 + 5) = v55;
LABEL_45:
    uint64_t v41 = v67;
LABEL_46:
    if (++v41 != v64) {
      continue;
    }
    break;
  }
  swift_release_n();
  return (uint64_t)v42;
}

uint64_t sub_25C553FD8()
{
  if (*(void *)(v0 + 520))
  {
    uint64_t v1 = *(void *)(v0 + 520);
  }
  else
  {
    uint64_t v1 = sub_25C554038();
    *(void *)(v0 + 520) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C554038()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v66 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v61 = (char *)&v59 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v68 = (char *)&v59 - v7;
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v59 - v8;
  unint64_t v10 = sub_25C54851C();
  unint64_t v11 = sub_25C564890(v10, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C54F6A8, 0);
  swift_bridgeObjectRelease();
  if (v11 >> 62)
  {
LABEL_64:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C56EF50();
    uint64_t v12 = result;
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v14 = (void *)MEMORY[0x263F8EE78];
  if (v12)
  {
    if (v12 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v15 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v15, v11);
      }
      else {
        swift_retain();
      }
      uint64_t v16 = sub_25C56E8C0();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_25C563C34(0, v14[2] + 1, 1, v14);
      }
      uint64_t v17 = v14;
      unint64_t v18 = v14[2];
      uint64_t v19 = v17;
      unint64_t v20 = v17[3];
      if (v18 >= v20 >> 1) {
        uint64_t v19 = sub_25C563C34((void *)(v20 > 1), v18 + 1, 1, v19);
      }
      ++v15;
      v19[2] = v18 + 1;
      char v21 = &v19[v18];
      uint64_t v14 = v19;
      v21[4] = v16;
    }
    while (v12 != v15);
  }
  swift_bridgeObjectRelease();
  uint64_t v69 = (char *)MEMORY[0x263F8EE78];
  uint64_t v64 = v14[2];
  if (v64)
  {
    unint64_t v59 = v11;
    int v60 = v3;
    unint64_t v22 = 0;
    uint64_t v62 = v14;
    uint64_t v63 = v14 + 4;
    uint64_t v3 = (char *)(v66 + 16);
    unint64_t v23 = (void (**)(char *, uint64_t))(v66 + 8);
    while (1)
    {
      if (v22 >= v14[2])
      {
        __break(1u);
        goto LABEL_64;
      }
      uint64_t v24 = v63[v22];
      unint64_t v11 = *(void *)(v24 + 16);
      if (!v11) {
        goto LABEL_18;
      }
      uint64_t v65 = v22;
      uint64_t v25 = v24 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
      uint64_t v26 = *(void *)(v66 + 72);
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
      uint64_t v67 = v24;
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v27(v9, v25, v0);
        uint64_t v31 = sub_25C56E910();
        if (!v32)
        {
          uint64_t v28 = v68;
          v27(v68, (uint64_t)v9, v0);
          goto LABEL_23;
        }
        if (v31 == 0x616C50616964656DLL && v32 == 0xEF646F6F4D726579) {
          break;
        }
        char v33 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        uint64_t v28 = v68;
        v27(v68, (uint64_t)v9, v0);
        if (v33) {
          goto LABEL_31;
        }
LABEL_23:
        BOOL v29 = v28;
        uint64_t v30 = *v23;
        (*v23)(v29, v0);
LABEL_24:
        v30(v9, v0);
LABEL_25:
        v25 += v26;
        if (!--v11)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v14 = v62;
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();
      v27(v68, (uint64_t)v9, v0);
LABEL_31:
      if (!sub_25C56E900() && v34 == 0xE000000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v30 = *v23;
        (*v23)(v68, v0);
        goto LABEL_24;
      }
      char v35 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      uint64_t v36 = *v23;
      (*v23)(v68, v0);
      v36(v9, v0);
      if (v35) {
        goto LABEL_25;
      }
      swift_bridgeObjectRelease();
      uint64_t v37 = v69;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C564168(0, *((void *)v37 + 2) + 1, 1);
        uint64_t v37 = v69;
      }
      uint64_t v14 = v62;
      unint64_t v11 = *((void *)v37 + 2);
      unint64_t v38 = *((void *)v37 + 3);
      if (v11 >= v38 >> 1)
      {
        sub_25C564168(v38 > 1, v11 + 1, 1);
        uint64_t v37 = v69;
      }
      *((void *)v37 + 2) = v11 + 1;
      *(void *)&v37[8 * v11 + 32] = v67;
LABEL_17:
      unint64_t v22 = v65;
LABEL_18:
      if (++v22 == v64)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v39 = v69;
        uint64_t v3 = v60;
        goto LABEL_42;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v39 = (char *)MEMORY[0x263F8EE78];
LABEL_42:
  uint64_t v64 = *((void *)v39 + 2);
  if (!v64)
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v40 = (void (**)(char *, uint64_t))(v66 + 8);
  uint64_t v62 = (void *)(v66 + 32);
  uint64_t v63 = v39 + 32;
  int v60 = v39;
  swift_retain();
  uint64_t v41 = 0;
  uint64_t v42 = (char *)MEMORY[0x263F8EE78];
  while (2)
  {
    uint64_t v43 = v63[v41];
    uint64_t v44 = *(void *)(v43 + 16);
    if (!v44) {
      goto LABEL_46;
    }
    uint64_t v67 = v41;
    uint64_t v68 = v42;
    uint64_t v45 = v43 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
    uint64_t v46 = *(void *)(v66 + 72);
    uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
    uint64_t v65 = v43;
    swift_bridgeObjectRetain_n();
    while (1)
    {
      v47(v3, v45, v0);
      uint64_t v49 = v3;
      uint64_t v50 = sub_25C56E910();
      if (!v51) {
        goto LABEL_50;
      }
      if (v50 == 0x616C50616964656DLL && v51 == 0xEF646F6F4D726579) {
        break;
      }
      char v48 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      if (v48) {
        goto LABEL_55;
      }
LABEL_50:
      uint64_t v3 = v49;
      (*v40)(v49, v0);
      v45 += v46;
      if (!--v44)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v42 = v68;
        goto LABEL_45;
      }
    }
    swift_bridgeObjectRelease();
LABEL_55:
    swift_bridgeObjectRelease();
    char v52 = v61;
    uint64_t v3 = v49;
    ((void (*)(char *, char *, uint64_t))*v62)(v61, v49, v0);
    uint64_t v53 = sub_25C56E900();
    uint64_t v55 = v54;
    (*v40)(v52, v0);
    swift_bridgeObjectRelease();
    uint64_t v42 = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v42 = (char *)sub_25C563A14(0, *((void *)v42 + 2) + 1, 1, v42);
    }
    unint64_t v57 = *((void *)v42 + 2);
    unint64_t v56 = *((void *)v42 + 3);
    if (v57 >= v56 >> 1) {
      uint64_t v42 = (char *)sub_25C563A14((void *)(v56 > 1), v57 + 1, 1, v42);
    }
    *((void *)v42 + 2) = v57 + 1;
    uint64_t v58 = &v42[16 * v57];
    *((void *)v58 + 4) = v53;
    *((void *)v58 + 5) = v55;
LABEL_45:
    uint64_t v41 = v67;
LABEL_46:
    if (++v41 != v64) {
      continue;
    }
    break;
  }
  swift_release_n();
  return (uint64_t)v42;
}

uint64_t sub_25C55482C()
{
  if (*(void *)(v0 + 528))
  {
    uint64_t v1 = *(void *)(v0 + 528);
  }
  else
  {
    uint64_t v1 = sub_25C55488C();
    *(void *)(v0 + 528) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C55488C()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v66 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v61 = (char *)&v59 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v70 = (char *)&v59 - v7;
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v59 - v8;
  unint64_t v10 = sub_25C54851C();
  unint64_t v11 = sub_25C564890(v10, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C54F6A8, 0);
  swift_bridgeObjectRelease();
  if (v11 >> 62)
  {
LABEL_64:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C56EF50();
    uint64_t v12 = result;
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v14 = (void *)MEMORY[0x263F8EE78];
  if (v12)
  {
    if (v12 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v15 = 0;
    do
    {
      if ((v11 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v15, v11);
      }
      else {
        swift_retain();
      }
      uint64_t v16 = sub_25C56E8C0();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_25C563C34(0, v14[2] + 1, 1, v14);
      }
      uint64_t v17 = v14;
      unint64_t v18 = v14[2];
      uint64_t v19 = v17;
      unint64_t v20 = v17[3];
      if (v18 >= v20 >> 1) {
        uint64_t v19 = sub_25C563C34((void *)(v20 > 1), v18 + 1, 1, v19);
      }
      ++v15;
      v19[2] = v18 + 1;
      char v21 = &v19[v18];
      uint64_t v14 = v19;
      v21[4] = v16;
    }
    while (v12 != v15);
  }
  swift_bridgeObjectRelease();
  char v71 = (char *)MEMORY[0x263F8EE78];
  uint64_t v64 = v14[2];
  if (v64)
  {
    unint64_t v59 = v11;
    int v60 = v3;
    unint64_t v22 = 0;
    uint64_t v62 = v14;
    uint64_t v63 = v14 + 4;
    uint64_t v3 = (char *)(v66 + 16);
    unint64_t v23 = (void (**)(char *, uint64_t))(v66 + 8);
    uint64_t v68 = "de";
    unint64_t v69 = 0x800000025C570900;
    while (1)
    {
      if (v22 >= v14[2])
      {
        __break(1u);
        goto LABEL_64;
      }
      uint64_t v24 = v63[v22];
      unint64_t v11 = *(void *)(v24 + 16);
      if (!v11) {
        goto LABEL_18;
      }
      uint64_t v65 = v22;
      uint64_t v25 = v24 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
      uint64_t v26 = *(void *)(v66 + 72);
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
      uint64_t v67 = v24;
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v27(v9, v25, v0);
        uint64_t v31 = sub_25C56E910();
        if (!v32)
        {
          uint64_t v28 = v70;
          v27(v70, (uint64_t)v9, v0);
          goto LABEL_23;
        }
        if (v31 == 0xD000000000000013 && v32 == v69) {
          break;
        }
        char v33 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        uint64_t v28 = v70;
        v27(v70, (uint64_t)v9, v0);
        if (v33) {
          goto LABEL_31;
        }
LABEL_23:
        BOOL v29 = v28;
        uint64_t v30 = *v23;
        (*v23)(v29, v0);
LABEL_24:
        v30(v9, v0);
LABEL_25:
        v25 += v26;
        if (!--v11)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v14 = v62;
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();
      v27(v70, (uint64_t)v9, v0);
LABEL_31:
      if (!sub_25C56E900() && v34 == 0xE000000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v30 = *v23;
        (*v23)(v70, v0);
        goto LABEL_24;
      }
      char v35 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      uint64_t v36 = *v23;
      (*v23)(v70, v0);
      v36(v9, v0);
      if (v35) {
        goto LABEL_25;
      }
      swift_bridgeObjectRelease();
      uint64_t v37 = v71;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C564168(0, *((void *)v37 + 2) + 1, 1);
        uint64_t v37 = v71;
      }
      uint64_t v14 = v62;
      unint64_t v11 = *((void *)v37 + 2);
      unint64_t v38 = *((void *)v37 + 3);
      if (v11 >= v38 >> 1)
      {
        sub_25C564168(v38 > 1, v11 + 1, 1);
        uint64_t v37 = v71;
      }
      *((void *)v37 + 2) = v11 + 1;
      *(void *)&v37[8 * v11 + 32] = v67;
LABEL_17:
      unint64_t v22 = v65;
LABEL_18:
      if (++v22 == v64)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v39 = v71;
        uint64_t v3 = v60;
        goto LABEL_42;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v39 = (char *)MEMORY[0x263F8EE78];
LABEL_42:
  uint64_t v64 = *((void *)v39 + 2);
  if (!v64)
  {
    swift_release();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v40 = (void (**)(char *, uint64_t))(v66 + 8);
  uint64_t v62 = (void *)(v66 + 32);
  uint64_t v63 = v39 + 32;
  int v60 = v39;
  swift_retain();
  uint64_t v41 = 0;
  uint64_t v42 = (char *)MEMORY[0x263F8EE78];
  uint64_t v70 = "de";
  unint64_t v69 = 0x800000025C570900;
  while (2)
  {
    uint64_t v43 = v63[v41];
    uint64_t v44 = *(void *)(v43 + 16);
    if (!v44) {
      goto LABEL_46;
    }
    uint64_t v67 = v41;
    uint64_t v68 = v42;
    uint64_t v45 = v43 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
    uint64_t v46 = *(void *)(v66 + 72);
    uint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
    uint64_t v65 = v43;
    swift_bridgeObjectRetain_n();
    while (1)
    {
      v47(v3, v45, v0);
      uint64_t v49 = v3;
      uint64_t v50 = sub_25C56E910();
      if (!v51) {
        goto LABEL_50;
      }
      if (v50 == 0xD000000000000013 && v51 == v69) {
        break;
      }
      char v48 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      if (v48) {
        goto LABEL_55;
      }
LABEL_50:
      uint64_t v3 = v49;
      (*v40)(v49, v0);
      v45 += v46;
      if (!--v44)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v42 = v68;
        goto LABEL_45;
      }
    }
    swift_bridgeObjectRelease();
LABEL_55:
    swift_bridgeObjectRelease();
    char v52 = v61;
    uint64_t v3 = v49;
    ((void (*)(char *, char *, uint64_t))*v62)(v61, v49, v0);
    uint64_t v53 = sub_25C56E900();
    uint64_t v55 = v54;
    (*v40)(v52, v0);
    swift_bridgeObjectRelease();
    uint64_t v42 = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v42 = (char *)sub_25C563A14(0, *((void *)v42 + 2) + 1, 1, v42);
    }
    unint64_t v57 = *((void *)v42 + 2);
    unint64_t v56 = *((void *)v42 + 3);
    if (v57 >= v56 >> 1) {
      uint64_t v42 = (char *)sub_25C563A14((void *)(v56 > 1), v57 + 1, 1, v42);
    }
    *((void *)v42 + 2) = v57 + 1;
    uint64_t v58 = &v42[16 * v57];
    *((void *)v58 + 4) = v53;
    *((void *)v58 + 5) = v55;
LABEL_45:
    uint64_t v41 = v67;
LABEL_46:
    if (++v41 != v64) {
      continue;
    }
    break;
  }
  swift_release_n();
  return (uint64_t)v42;
}

uint64_t sub_25C555068@<X0>(unsigned char *a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + 536);
  if (v3 == 3)
  {
    uint64_t result = sub_25C5550B4(&v5);
    LOBYTE(v3) = v5;
    *(unsigned char *)(v1 + 536) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_25C5550B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = (uint64_t)v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v74 = (char *)v64 - v5;
  uint64_t v6 = sub_25C56E920();
  uint64_t v72 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v77 = (char *)v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v78 = (char *)v64 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v64 - v11;
  unint64_t v13 = sub_25C54851C();
  unint64_t v14 = sub_25C564890(v13, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C54F6A8, 0);
  swift_bridgeObjectRelease();
  if (v14 >> 62)
  {
LABEL_76:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C56EF50();
    uint64_t v15 = result;
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  unint64_t v18 = v77;
  uint64_t v67 = v4;
  if (v15)
  {
    if (v15 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v19 = 0;
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v14 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v19, v14);
      }
      else {
        swift_retain();
      }
      uint64_t v21 = sub_25C56E8C0();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v20 = sub_25C563C34(0, v20[2] + 1, 1, v20);
      }
      unint64_t v22 = v20;
      unint64_t v23 = v20[2];
      uint64_t v24 = v22;
      unint64_t v25 = v22[3];
      uint64_t v4 = v23 + 1;
      if (v23 >= v25 >> 1) {
        uint64_t v24 = sub_25C563C34((void *)(v25 > 1), v23 + 1, 1, v24);
      }
      ++v19;
      v24[2] = v4;
      uint64_t v26 = &v24[v23];
      unint64_t v20 = v24;
      v26[4] = v21;
      unint64_t v18 = v77;
    }
    while (v15 != v19);
  }
  else
  {
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v79 = v17;
  uint64_t v70 = v20[2];
  if (v70)
  {
    unint64_t v27 = 0;
    uint64_t v68 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v14;
    unint64_t v69 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 4);
    uint64_t v28 = (void (**)(const char *, uint64_t))(v72 + 8);
    uint64_t v75 = "mediaPlayerActivity";
    unint64_t v76 = 0x800000025C570920;
    uint64_t v66 = (void (**)(char *, char *, uint64_t))v20;
    while (1)
    {
      if (v27 >= v20[2])
      {
        __break(1u);
        goto LABEL_76;
      }
      BOOL v29 = v69[v27];
      uint64_t v30 = *((void *)v29 + 2);
      if (!v30) {
        goto LABEL_20;
      }
      unint64_t v71 = v27;
      uint64_t v31 = (char *)v29 + ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80));
      uint64_t v32 = *(void *)(v72 + 72);
      char v33 = *(void (**)(char *, char *, uint64_t))(v72 + 16);
      uint64_t v73 = (char *)v29;
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v33(v12, v31, v6);
        uint64_t v37 = sub_25C56E910();
        if (!v38)
        {
          uint64_t v34 = v78;
          v33((char *)v78, v12, v6);
          goto LABEL_25;
        }
        if (v37 == 0xD000000000000014 && v38 == v76) {
          break;
        }
        uint64_t v4 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        uint64_t v34 = v78;
        v33((char *)v78, v12, v6);
        if (v4) {
          goto LABEL_33;
        }
LABEL_25:
        char v35 = v34;
        uint64_t v36 = *v28;
        (*v28)(v35, v6);
LABEL_26:
        v36(v12, v6);
LABEL_27:
        v31 += v32;
        if (!--v30)
        {
          swift_bridgeObjectRelease_n();
          unint64_t v18 = v77;
          unint64_t v14 = (unint64_t)v68;
          unint64_t v20 = v66;
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      v33((char *)v78, v12, v6);
LABEL_33:
      if (!sub_25C56E900() && v39 == 0xE000000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v36 = *v28;
        (*v28)(v78, v6);
        goto LABEL_26;
      }
      uint64_t v4 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      uint64_t v40 = *v28;
      (*v28)(v78, v6);
      v40(v12, v6);
      if (v4) {
        goto LABEL_27;
      }
      swift_bridgeObjectRelease();
      uint64_t v41 = v79;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C564168(0, *(void *)(v41 + 16) + 1, 1);
        uint64_t v41 = v79;
      }
      unint64_t v14 = (unint64_t)v68;
      unint64_t v20 = v66;
      unint64_t v43 = *(void *)(v41 + 16);
      unint64_t v42 = *(void *)(v41 + 24);
      uint64_t v4 = v43 + 1;
      uint64_t v44 = v73;
      if (v43 >= v42 >> 1)
      {
        sub_25C564168(v42 > 1, v43 + 1, 1);
        uint64_t v44 = v73;
        uint64_t v41 = v79;
      }
      *(void *)(v41 + 16) = v4;
      *(void *)(v41 + 8 * v43 + 32) = v44;
      unint64_t v18 = v77;
LABEL_19:
      unint64_t v27 = v71;
LABEL_20:
      if (++v27 == v70)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v45 = v79;
        goto LABEL_44;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v45 = MEMORY[0x263F8EE78];
LABEL_44:
  uint64_t v46 = v67;
  uint64_t v47 = (uint64_t)v74;
  unint64_t v71 = *(void *)(v45 + 16);
  if (v71)
  {
    char v48 = (void (**)(char *, uint64_t))(v72 + 8);
    uint64_t v66 = (void (**)(char *, char *, uint64_t))(v72 + 32);
    unint64_t v69 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56);
    uint64_t v70 = v45 + 32;
    uint64_t v68 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
    v64[1] = v45;
    swift_retain();
    uint64_t v49 = 0;
    uint64_t v50 = (char *)MEMORY[0x263F8EE78];
    unint64_t v78 = "mediaPlayerActivity";
    unint64_t v76 = 0x800000025C570920;
    while (1)
    {
      uint64_t v51 = *(void *)(v70 + 8 * v49);
      uint64_t v52 = *(void *)(v51 + 16);
      uint64_t v75 = (const char *)v51;
      if (!v52)
      {
        swift_bridgeObjectRetain();
        uint64_t v59 = 1;
        goto LABEL_59;
      }
      uint64_t v73 = v50;
      uint64_t v53 = v51 + ((*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80));
      uint64_t v54 = *(void *)(v72 + 72);
      uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 16);
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v55(v18, v53, v6);
        uint64_t v57 = sub_25C56E910();
        if (!v58) {
          goto LABEL_51;
        }
        if (v57 == 0xD000000000000014 && v58 == v76) {
          break;
        }
        char v56 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        if (v56) {
          goto LABEL_58;
        }
LABEL_51:
        unint64_t v18 = v77;
        (*v48)(v77, v6);
        v53 += v54;
        if (!--v52)
        {
          swift_bridgeObjectRelease();
          uint64_t v59 = 1;
          uint64_t v46 = v67;
          uint64_t v50 = v73;
          uint64_t v47 = (uint64_t)v74;
          goto LABEL_59;
        }
      }
      swift_bridgeObjectRelease();
LABEL_58:
      swift_bridgeObjectRelease();
      uint64_t v47 = (uint64_t)v74;
      (*v66)(v74, v77, v6);
      uint64_t v59 = 0;
      uint64_t v46 = v67;
      uint64_t v50 = v73;
LABEL_59:
      (*v69)(v47, v59, 1, v6);
      sub_25C55E72C(v47, v46, &qword_26A5B0468);
      if ((*v68)(v46, 1, v6) == 1)
      {
        sub_25C5462B8(v46, &qword_26A5B0468);
      }
      else
      {
        sub_25C56E900();
        (*v48)((char *)v46, v6);
      }
      uint64_t v60 = sub_25C56EF80();
      swift_bridgeObjectRelease();
      if (v60)
      {
        if (v60 == 1)
        {
          char v61 = 1;
          goto LABEL_66;
        }
        sub_25C5462B8(v47, &qword_26A5B0468);
        swift_bridgeObjectRelease();
      }
      else
      {
        char v61 = 0;
LABEL_66:
        sub_25C5462B8(v47, &qword_26A5B0468);
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v50 = sub_25C563E40(0, *((void *)v50 + 2) + 1, 1, v50);
        }
        unint64_t v63 = *((void *)v50 + 2);
        unint64_t v62 = *((void *)v50 + 3);
        if (v63 >= v62 >> 1) {
          uint64_t v50 = sub_25C563E40((char *)(v62 > 1), v63 + 1, 1, v50);
        }
        *((void *)v50 + 2) = v63 + 1;
        v50[v63 + 32] = v61;
        uint64_t v47 = (uint64_t)v74;
      }
      ++v49;
      unint64_t v18 = v77;
      if (v49 == v71)
      {
        swift_release_n();
        if (*((void *)v50 + 2)) {
          goto LABEL_72;
        }
LABEL_74:
        uint64_t result = swift_bridgeObjectRelease();
        *uint64_t v65 = 2;
        return result;
      }
    }
  }
  swift_release();
  uint64_t v50 = (char *)MEMORY[0x263F8EE78];
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_74;
  }
LABEL_72:
  *uint64_t v65 = v50[32];
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C555A28()
{
  if ((*(unsigned char *)(v0 + 553) & 1) == 0) {
    return *(void *)(v0 + 544);
  }
  uint64_t result = sub_25C555A78();
  *(void *)(v0 + 544) = result;
  *(unsigned char *)(v0 + 552) = v2 & 1;
  *(unsigned char *)(v0 + 553) = 0;
  return result;
}

uint64_t sub_25C555A78()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (uint64_t)&v72 - v4;
  uint64_t v6 = sub_25C56E920();
  uint64_t v82 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v86 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v87 = (char *)&v72 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v72 - v11;
  unint64_t v13 = sub_25C54851C();
  unint64_t v14 = 0;
  unint64_t v15 = sub_25C564890(v13, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C54F6A8, 0);
  swift_bridgeObjectRelease();
  unint64_t v76 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v15;
  if (v15 >> 62)
  {
LABEL_87:
    swift_bridgeObjectRetain();
    uint64_t result = sub_25C56EF50();
    uint64_t v16 = result;
  }
  else
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v18 = MEMORY[0x263F8EE78];
  uint64_t v79 = v3;
  uint64_t v83 = v5;
  unint64_t v73 = v14;
  if (v16)
  {
    if (v16 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v19 = 0;
    unint64_t v14 = (unint64_t)v76;
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v14 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v19, v14);
      }
      else {
        swift_retain();
      }
      uint64_t v21 = sub_25C56E8C0();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v20 = sub_25C563C34(0, v20[2] + 1, 1, v20);
      }
      unint64_t v22 = v20;
      unint64_t v23 = v20[2];
      uint64_t v24 = v22;
      unint64_t v25 = v22[3];
      uint64_t v5 = v23 + 1;
      if (v23 >= v25 >> 1) {
        uint64_t v24 = sub_25C563C34((void *)(v25 > 1), v23 + 1, 1, v24);
      }
      ++v19;
      v24[2] = v5;
      uint64_t v26 = &v24[v23];
      unint64_t v20 = v24;
      v26[4] = v21;
    }
    while (v16 != v19);
  }
  else
  {
    unint64_t v20 = (void *)MEMORY[0x263F8EE78];
    unint64_t v14 = (unint64_t)v76;
  }
  swift_bridgeObjectRelease();
  uint64_t v88 = v18;
  uint64_t v78 = v20[2];
  if (v78)
  {
    unint64_t v27 = 0;
    uint64_t v77 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 4);
    uint64_t v3 = (char *)(v82 + 8);
    unsigned int v84 = "mediaPlayerReference";
    unint64_t v85 = 0x800000025C570980;
    uint64_t v75 = v20;
    while (1)
    {
      if (v27 >= v20[2])
      {
        __break(1u);
        goto LABEL_87;
      }
      BOOL v29 = v77[v27];
      uint64_t v30 = *((void *)v29 + 2);
      if (!v30) {
        goto LABEL_20;
      }
      unint64_t v80 = v27;
      unint64_t v81 = v29;
      uint64_t v31 = (char *)v29 + ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80));
      uint64_t v32 = *(void *)(v82 + 72);
      char v33 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v33(v12, v31, v6);
        uint64_t v37 = sub_25C56E910();
        if (!v38)
        {
          uint64_t v34 = v87;
          v33((char *)v87, v12, v6);
          goto LABEL_25;
        }
        if (v37 == 0xD000000000000015 && v38 == v85) {
          break;
        }
        uint64_t v5 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        uint64_t v34 = v87;
        v33((char *)v87, v12, v6);
        if (v5) {
          goto LABEL_33;
        }
LABEL_25:
        char v35 = v34;
        uint64_t v36 = *(void (**)(char *, uint64_t))v3;
        (*(void (**)(const char *, uint64_t))v3)(v35, v6);
LABEL_26:
        v36(v12, v6);
LABEL_27:
        v31 += v32;
        if (!--v30)
        {
          swift_bridgeObjectRelease_n();
          unint64_t v20 = v75;
          unint64_t v14 = (unint64_t)v76;
          goto LABEL_19;
        }
      }
      swift_bridgeObjectRelease();
      v33((char *)v87, v12, v6);
LABEL_33:
      if (!sub_25C56E900() && v39 == 0xE000000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v36 = *(void (**)(char *, uint64_t))v3;
        (*(void (**)(const char *, uint64_t))v3)(v87, v6);
        goto LABEL_26;
      }
      uint64_t v5 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      uint64_t v40 = *(void (**)(char *, uint64_t))v3;
      (*(void (**)(const char *, uint64_t))v3)(v87, v6);
      v40(v12, v6);
      if (v5) {
        goto LABEL_27;
      }
      uint64_t v41 = v81;
      swift_bridgeObjectRelease();
      uint64_t v42 = v88;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25C564168(0, *(void *)(v42 + 16) + 1, 1);
        uint64_t v41 = v81;
        uint64_t v42 = v88;
      }
      unint64_t v20 = v75;
      unint64_t v44 = *(void *)(v42 + 16);
      unint64_t v43 = *(void *)(v42 + 24);
      uint64_t v5 = v44 + 1;
      if (v44 >= v43 >> 1)
      {
        sub_25C564168(v43 > 1, v44 + 1, 1);
        uint64_t v41 = v81;
        uint64_t v42 = v88;
      }
      *(void *)(v42 + 16) = v5;
      *(void *)(v42 + 8 * v44 + 32) = v41;
      unint64_t v14 = (unint64_t)v76;
LABEL_19:
      unint64_t v27 = v80;
LABEL_20:
      ++v27;
      uint64_t v28 = v83;
      if (v27 == v78)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v45 = v88;
        goto LABEL_44;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v45 = MEMORY[0x263F8EE78];
  uint64_t v28 = v83;
LABEL_44:
  uint64_t v46 = v86;
  unint64_t v80 = *(void *)(v45 + 16);
  if (v80)
  {
    uint64_t v47 = (void (**)(char *, uint64_t))(v82 + 8);
    uint64_t v77 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56);
    uint64_t v78 = v45 + 32;
    uint64_t v75 = (void *)(v82 + 32);
    unint64_t v76 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48);
    uint64_t v74 = v45;
    swift_retain();
    uint64_t v48 = 0;
    uint64_t v49 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x263F8EE78];
    uint64_t v87 = "mediaPlayerReference";
    unint64_t v85 = 0x800000025C570980;
    while (1)
    {
      uint64_t v50 = *(void *)(v78 + 8 * v48);
      uint64_t v51 = *(void *)(v50 + 16);
      unsigned int v84 = (const char *)v50;
      if (!v51)
      {
        swift_bridgeObjectRetain();
        uint64_t v58 = 1;
        uint64_t v59 = (uint64_t)v79;
        goto LABEL_60;
      }
      unint64_t v81 = v49;
      uint64_t v52 = v50 + ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80));
      uint64_t v53 = *(void *)(v82 + 72);
      uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t))(v82 + 16);
      swift_bridgeObjectRetain_n();
      while (1)
      {
        v54(v46, v52, v6);
        uint64_t v56 = sub_25C56E910();
        if (!v57) {
          goto LABEL_51;
        }
        if (v56 == 0xD000000000000015 && v57 == v85) {
          break;
        }
        char v55 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        if (v55) {
          goto LABEL_58;
        }
LABEL_51:
        uint64_t v46 = v86;
        (*v47)(v86, v6);
        v52 += v53;
        if (!--v51)
        {
          swift_bridgeObjectRelease();
          uint64_t v58 = 1;
          uint64_t v59 = (uint64_t)v79;
          uint64_t v28 = v83;
          goto LABEL_59;
        }
      }
      swift_bridgeObjectRelease();
LABEL_58:
      swift_bridgeObjectRelease();
      uint64_t v28 = v83;
      ((void (*)(uint64_t, char *, uint64_t))*v75)(v83, v86, v6);
      uint64_t v58 = 0;
      uint64_t v59 = (uint64_t)v79;
LABEL_59:
      uint64_t v49 = v81;
LABEL_60:
      (*v77)(v28, v58, 1, v6);
      sub_25C55E72C(v28, v59, &qword_26A5B0468);
      if ((*v76)(v59, 1, v6) == 1)
      {
        uint64_t v60 = sub_25C5462B8(v59, &qword_26A5B0468);
        uint64_t v61 = 0;
        unint64_t v62 = 0xE000000000000000;
      }
      else
      {
        uint64_t v61 = sub_25C56E900();
        unint64_t v62 = v63;
        uint64_t v60 = ((uint64_t (*)(uint64_t, uint64_t))*v47)(v59, v6);
      }
      uint64_t v91 = 0;
      MEMORY[0x270FA5388](v60);
      *(&v72 - 2) = (uint64_t)&v91;
      if ((v62 & 0x1000000000000000) != 0) {
        goto LABEL_80;
      }
      if ((v62 & 0x2000000000000000) == 0)
      {
        if ((v61 & 0x1000000000000000) != 0)
        {
          unint64_t v64 = *(unsigned __int8 *)((v62 & 0xFFFFFFFFFFFFFFFLL) + 0x20);
          if (v64 < 0x21 && ((0x100003E01uLL >> v64) & 1) != 0) {
            goto LABEL_73;
          }
LABEL_71:
          uint64_t v65 = (unsigned char *)_swift_stdlib_strtod_clocale();
          if (!v65) {
            goto LABEL_73;
          }
          BOOL v90 = *v65 == 0;
          goto LABEL_74;
        }
LABEL_80:
        unint64_t v70 = v73;
        sub_25C56EEB0();
        unint64_t v73 = v70;
        goto LABEL_74;
      }
      uint64_t v88 = v61;
      uint64_t v89 = v62 & 0xFFFFFFFFFFFFFFLL;
      if (v61 > 0x20u || ((0x100003E01uLL >> v61) & 1) == 0) {
        goto LABEL_71;
      }
LABEL_73:
      BOOL v90 = 0;
LABEL_74:
      swift_bridgeObjectRelease();
      if (v90)
      {
        uint64_t v66 = v91;
        sub_25C5462B8(v28, &qword_26A5B0468);
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v46 = v86;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v49 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C563F3C(0, *((void *)v49 + 2) + 1, 1, v49);
        }
        unint64_t v69 = *((void *)v49 + 2);
        unint64_t v68 = *((void *)v49 + 3);
        if (v69 >= v68 >> 1) {
          uint64_t v49 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_25C563F3C((void *)(v68 > 1), v69 + 1, 1, v49);
        }
        *((void *)v49 + 2) = v69 + 1;
        *((void *)v49 + v69 + 4) = v66;
      }
      else
      {
        sub_25C5462B8(v28, &qword_26A5B0468);
        swift_bridgeObjectRelease();
        uint64_t v46 = v86;
      }
      if (++v48 == v80)
      {
        swift_release_n();
        if (*((void *)v49 + 2)) {
          goto LABEL_82;
        }
LABEL_84:
        uint64_t v71 = 0;
        goto LABEL_85;
      }
    }
  }
  swift_release();
  uint64_t v49 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x263F8EE78];
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_84;
  }
LABEL_82:
  uint64_t v71 = *((void *)v49 + 4);
LABEL_85:
  swift_bridgeObjectRelease();
  return v71;
}

uint64_t sub_25C5564CC()
{
  uint64_t v0 = sub_25C56EA30();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v0;
  unint64_t v3 = v1;
  swift_bridgeObjectRelease();
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  if (sub_25C56EA00())
  {
    swift_release();
    return 0;
  }
  return 1;
}

char *sub_25C556538()
{
  if (*(void *)(v0 + 560))
  {
    unint64_t v1 = *(char **)(v0 + 560);
  }
  else
  {
    if (sub_25C547D74())
    {
      unint64_t v1 = UsoEntity_common_Setting.usoMediaSettingNames()();
      swift_release();
    }
    else
    {
      unint64_t v1 = (char *)MEMORY[0x263F8EE78];
    }
    *(void *)(v0 + 560) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_25C5565BC()
{
  int v1 = *(unsigned __int8 *)(v0 + 568);
  if (v1 != 2) {
    return v1 & 1;
  }
  unint64_t v2 = sub_25C549204();
  if (v2 >> 62) {
    uint64_t v3 = sub_25C56EF50();
  }
  else {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  BOOL result = v3 == 0;
  *(unsigned char *)(v0 + 568) = result;
  return result;
}

uint64_t sub_25C556638(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 576) = v3;
  *(void *)(v4 + 584) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55669C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 576);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25C5566EC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 576) = a1;
  *(void *)(v2 + 584) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_25C556744())()
{
  return j__swift_endAccess;
}

SiriAudioIntentUtils::AudioUsoIntent::UsoNamespace_optional __swiftcall AudioUsoIntent.UsoNamespace.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_25C56EFA0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 10;
  switch(v3)
  {
    case 0:
      goto LABEL_12;
    case 1:
      char v5 = 1;
      goto LABEL_12;
    case 2:
      char v5 = 2;
      goto LABEL_12;
    case 3:
      char v5 = 3;
      goto LABEL_12;
    case 4:
      char v5 = 4;
      goto LABEL_12;
    case 5:
      char v5 = 5;
      goto LABEL_12;
    case 6:
      char v5 = 6;
      goto LABEL_12;
    case 7:
      char v5 = 7;
      goto LABEL_12;
    case 8:
      char v5 = 8;
      goto LABEL_12;
    case 9:
      char v5 = 9;
LABEL_12:
      char v6 = v5;
      break;
    case 10:
      break;
    case 11:
      char v6 = 11;
      break;
    case 12:
      char v6 = 12;
      break;
    case 13:
      char v6 = 13;
      break;
    case 14:
      char v6 = 14;
      break;
    case 15:
      char v6 = 15;
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    default:
      char v6 = 28;
      break;
  }
  *uint64_t v2 = v6;
  return result;
}

uint64_t sub_25C556970(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C564FA4(*a1, *a2);
}

uint64_t sub_25C55697C()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C5569E4()
{
  AudioUsoIntent.UsoNamespace.rawValue.getter();
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C556A48()
{
  return sub_25C56EFE0();
}

SiriAudioIntentUtils::AudioUsoIntent::UsoNamespace_optional sub_25C556AAC(Swift::String *a1)
{
  return AudioUsoIntent.UsoNamespace.init(rawValue:)(*a1);
}

unint64_t sub_25C556AB8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AudioUsoIntent.UsoNamespace.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static AudioUsoIntent.IterationOptions.== infix(_:_:)()
{
  return 1;
}

uint64_t AudioUsoIntent.IterationOptions.hash(into:)()
{
  return sub_25C56EFD0();
}

uint64_t AudioUsoIntent.IterationOptions.hashValue.getter()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C556B54()
{
  return 1;
}

uint64_t sub_25C556B5C()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C556BA0()
{
  return sub_25C56EFD0();
}

uint64_t sub_25C556BC8()
{
  return sub_25C56EFE0();
}

uint64_t *AudioUsoIntent.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_25C55C7F4(v0[25]);
  sub_25C55C7F4(v0[26]);
  sub_25C55C804(v0[27]);
  sub_25C55C7F4(v0[28]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C55C7F4(v0[32]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C55C7F4(v0[43]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C55BDC8(v0[49], v0[50]);
  sub_25C55BDC8(v0[51], v0[52]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25C55BDC8(v0[55], v0[56]);
  sub_25C55BDC8(v0[57], v0[58]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AudioUsoIntent.__deallocating_deinit()
{
  AudioUsoIntent.deinit();
  return MEMORY[0x270FA0228](v0, 592, 7);
}

uint64_t sub_25C556E24()
{
  return sub_25C55482C();
}

uint64_t sub_25C556E48()
{
  return sub_25C549FCC();
}

void *sub_25C556E6C()
{
  return sub_25C54E074();
}

void *sub_25C556E90()
{
  return sub_25C54C12C();
}

void *sub_25C556EB4()
{
  return sub_25C54D0D0();
}

uint64_t sub_25C556ED8()
{
  return sub_25C550B38();
}

void *sub_25C556EFC()
{
  return sub_25C54A1EC();
}

void *sub_25C556F20()
{
  return sub_25C54B190();
}

uint64_t sub_25C556F44()
{
  return sub_25C550AD8();
}

uint64_t sub_25C556F68()
{
  return sub_25C551108();
}

uint64_t sub_25C556F8C()
{
  return sub_25C549204();
}

uint64_t sub_25C556FB0()
{
  return sub_25C5495A4();
}

uint64_t sub_25C556FD4()
{
  return sub_25C54F848();
}

uint64_t sub_25C556FF8()
{
  return sub_25C54F6AC();
}

uint64_t sub_25C55701C@<X0>(unsigned char *a1@<X8>)
{
  return sub_25C551388(a1);
}

uint64_t sub_25C557040()
{
  return sub_25C5489E4();
}

uint64_t sub_25C557064()
{
  return sub_25C555A28();
}

uint64_t sub_25C55708C()
{
  return sub_25C5537A4();
}

uint64_t sub_25C5570B0()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 576);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_25C557104@<X0>(unsigned char *a1@<X8>)
{
  return sub_25C548694(a1);
}

uint64_t sub_25C557128@<X0>(unsigned char *a1@<X8>)
{
  return sub_25C5488AC(a1);
}

uint64_t sub_25C55714C()
{
  return sub_25C552314();
}

uint64_t sub_25C557170()
{
  return sub_25C553FD8();
}

uint64_t sub_25C557194()
{
  return sub_25C5501F8();
}

uint64_t sub_25C5571B8@<X0>(unsigned char *a1@<X8>)
{
  return sub_25C54F018(a1);
}

uint64_t sub_25C5571DC()
{
  return sub_25C550864();
}

uint64_t sub_25C557200()
{
  return sub_25C550F90();
}

uint64_t sub_25C557224()
{
  return sub_25C550FF0();
}

uint64_t sub_25C557248()
{
  return sub_25C55107C();
}

uint64_t sub_25C55726C()
{
  return sub_25C551168();
}

uint64_t sub_25C557290@<X0>(unsigned char *a1@<X8>)
{
  return sub_25C555068(a1);
}

uint64_t sub_25C5572B4@<X0>(unsigned char *a1@<X8>)
{
  return sub_25C55342C(a1);
}

uint64_t sub_25C5572D8()
{
  return sub_25C548C88();
}

uint64_t sub_25C5572FC()
{
  return sub_25C550D70();
}

uint64_t sub_25C557320@<X0>(unsigned char *a1@<X8>)
{
  return sub_25C551D28(a1);
}

uint64_t sub_25C557344@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v3 + 185);
  return result;
}

char *sub_25C55738C()
{
  return sub_25C556538();
}

BOOL sub_25C5573B0()
{
  return sub_25C5565BC();
}

uint64_t sub_25C5573D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v3 + 187);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25C557458(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25C557468(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_25C56EFC0();
  CommonAudio.Attribute.rawValue.getter();
  swift_bridgeObjectRetain();
  sub_25C56EDC0();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_25C56EFE0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  uint64_t v19 = a2;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_51:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    char v17 = v19;
    sub_25C5581DC(v19, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v21;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_54;
  }
  uint64_t v9 = ~v7;
  uint64_t v10 = a2;
  while (2)
  {
    unint64_t v11 = 0x800000025C570B80;
    unint64_t v12 = 0xD000000000000018;
    switch(*(unsigned char *)(*(void *)(v5 + 48) + v8))
    {
      case 1:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x676E6F536D6F7266;
        break;
      case 2:
        unint64_t v12 = 0x75626C416D6F7266;
        unint64_t v11 = 0xE90000000000006DLL;
        break;
      case 3:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x7478654E79616C70;
        break;
      case 4:
        unint64_t v11 = 0xE700000000000000;
        unint64_t v12 = 0x776F4E79616C70;
        break;
      case 5:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x7473614C79616C70;
        break;
      case 6:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x7974696E69666661;
        break;
      case 7:
        unint64_t v12 = 0x6E656D6D6F636572;
        unint64_t v11 = 0xEB00000000646564;
        break;
      case 8:
        unint64_t v11 = 0xE900000000000079;
        unint64_t v12 = 0x7265766F63736964;
        break;
      case 9:
        break;
      case 0xA:
        unint64_t v11 = 0xE400000000000000;
        unint64_t v12 = 1954047342;
        break;
      case 0xB:
        unint64_t v11 = 0xE500000000000000;
        unint64_t v12 = 0x64656D616ELL;
        break;
      case 0xC:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x73756F6976657270;
        break;
      case 0xD:
        unint64_t v12 = 0x44657361656C6572;
        unint64_t v11 = 0xEB00000000657461;
        break;
      case 0xE:
        unint64_t v11 = 0xE800000000000000;
        unint64_t v12 = 0x6E6F697461727564;
        break;
      default:
        unint64_t v12 = 0x697472416D6F7266;
        unint64_t v11 = 0xEA00000000007473;
        break;
    }
    unint64_t v13 = 0x800000025C570B80;
    unint64_t v14 = 0xD000000000000018;
    switch(v10)
    {
      case 1:
        unint64_t v13 = 0xE800000000000000;
        if (v12 == 0x676E6F536D6F7266) {
          goto LABEL_45;
        }
        goto LABEL_46;
      case 2:
        unint64_t v13 = 0xE90000000000006DLL;
        if (v12 != 0x75626C416D6F7266) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 3:
        unint64_t v13 = 0xE800000000000000;
        if (v12 != 0x7478654E79616C70) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 4:
        unint64_t v13 = 0xE700000000000000;
        if (v12 != 0x776F4E79616C70) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 5:
        unint64_t v13 = 0xE800000000000000;
        if (v12 != 0x7473614C79616C70) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 6:
        unint64_t v13 = 0xE800000000000000;
        if (v12 != 0x7974696E69666661) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 7:
        unint64_t v13 = 0xEB00000000646564;
        if (v12 != 0x6E656D6D6F636572) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 8:
        unint64_t v13 = 0xE900000000000079;
        if (v12 != 0x7265766F63736964) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 9:
        goto LABEL_44;
      case 10:
        unint64_t v13 = 0xE400000000000000;
        if (v12 != 1954047342) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 11:
        unint64_t v13 = 0xE500000000000000;
        if (v12 != 0x64656D616ELL) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 12:
        unint64_t v13 = 0xE800000000000000;
        if (v12 != 0x73756F6976657270) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 13:
        unint64_t v14 = 0x44657361656C6572;
        unint64_t v13 = 0xEB00000000657461;
LABEL_44:
        if (v12 == v14) {
          goto LABEL_45;
        }
        goto LABEL_46;
      case 14:
        unint64_t v13 = 0xE800000000000000;
        if (v12 != 0x6E6F697461727564) {
          goto LABEL_46;
        }
        goto LABEL_45;
      default:
        unint64_t v13 = 0xEA00000000007473;
        if (v12 != 0x697472416D6F7266) {
          goto LABEL_46;
        }
LABEL_45:
        if (v11 != v13)
        {
LABEL_46:
          char v15 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v15) {
            goto LABEL_53;
          }
          unint64_t v8 = (v8 + 1) & v9;
          if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
            goto LABEL_51;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_53:
        swift_bridgeObjectRelease();
        uint64_t result = 0;
        char v17 = *(unsigned char *)(*(void *)(*v3 + 48) + v8);
LABEL_54:
        *a1 = v17;
        return result;
    }
  }
}

uint64_t sub_25C557A28()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0500);
  uint64_t v2 = sub_25C56EEA0();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16)) {
    goto LABEL_38;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  unint64_t v27 = (void *)(v1 + 56);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v8 = v2 + 56;
  swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v15 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v16 = v15 | (v9 << 6);
      goto LABEL_33;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_39;
    }
    if (v17 >= v7) {
      break;
    }
    unint64_t v18 = v27[v17];
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v7) {
        break;
      }
      unint64_t v18 = v27[v9];
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v7) {
          break;
        }
        unint64_t v18 = v27[v9];
        if (!v18)
        {
          int64_t v19 = v17 + 3;
          if (v19 >= v7) {
            break;
          }
          unint64_t v18 = v27[v19];
          if (!v18)
          {
            while (1)
            {
              int64_t v9 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_40;
              }
              if (v9 >= v7) {
                goto LABEL_34;
              }
              unint64_t v18 = v27[v9];
              ++v19;
              if (v18) {
                goto LABEL_32;
              }
            }
          }
          int64_t v9 = v19;
        }
      }
    }
LABEL_32:
    unint64_t v6 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_33:
    char v24 = *(unsigned char *)(*(void *)(v1 + 48) + v16);
    sub_25C56EFC0();
    sub_25C56EDC0();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_25C56EFE0();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    if (((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v20 = 0;
    unint64_t v21 = (unint64_t)(63 - v11) >> 6;
    do
    {
      if (++v13 == v21 && (v20 & 1) != 0)
      {
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        JUMPOUT(0x25C557EA0);
      }
      BOOL v22 = v13 == v21;
      if (v13 == v21) {
        unint64_t v13 = 0;
      }
      v20 |= v22;
      uint64_t v23 = *(void *)(v8 + 8 * v13);
    }
    while (v23 == -1);
    unint64_t v14 = __clz(__rbit64(~v23)) + (v13 << 6);
LABEL_8:
    *(void *)(v8 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(unsigned char *)(*(void *)(v3 + 48) + v14) = v24;
    ++*(void *)(v3 + 16);
  }
LABEL_34:
  swift_release();
  uint64_t v25 = 1 << *(unsigned char *)(v1 + 32);
  if (v25 > 63) {
    bzero(v27, ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v27 = -1 << v25;
  }
  *(void *)(v1 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v0 = v3;
  return result;
}

uint64_t sub_25C557EDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04D8);
  uint64_t v3 = sub_25C56EEA0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
      sub_25C56EFC0();
      sub_25C56EDC0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25C56EFE0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25C5581DC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  unsigned __int8 v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  char v22 = result;
  if (v8 <= v7 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_25C557A28();
    }
    else
    {
      if (v8 > v7)
      {
        uint64_t result = (uint64_t)sub_25C5587A8();
        goto LABEL_58;
      }
      sub_25C558AD0();
    }
    uint64_t v9 = *v3;
    sub_25C56EFC0();
    CommonAudio.Attribute.rawValue.getter();
    sub_25C56EDC0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25C56EFE0();
    uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
    a2 = result & ~v10;
    if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v11 = ~v10;
      uint64_t v12 = v6;
      while (2)
      {
        unint64_t v13 = 0x800000025C570B80;
        unint64_t v14 = 0xD000000000000018;
        switch(*(unsigned char *)(*(void *)(v9 + 48) + a2))
        {
          case 1:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x676E6F536D6F7266;
            break;
          case 2:
            unint64_t v14 = 0x75626C416D6F7266;
            unint64_t v13 = 0xE90000000000006DLL;
            break;
          case 3:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x7478654E79616C70;
            break;
          case 4:
            unint64_t v13 = 0xE700000000000000;
            unint64_t v14 = 0x776F4E79616C70;
            break;
          case 5:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x7473614C79616C70;
            break;
          case 6:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x7974696E69666661;
            break;
          case 7:
            unint64_t v14 = 0x6E656D6D6F636572;
            unint64_t v13 = 0xEB00000000646564;
            break;
          case 8:
            unint64_t v13 = 0xE900000000000079;
            unint64_t v14 = 0x7265766F63736964;
            break;
          case 9:
            break;
          case 0xA:
            unint64_t v13 = 0xE400000000000000;
            unint64_t v14 = 1954047342;
            break;
          case 0xB:
            unint64_t v13 = 0xE500000000000000;
            unint64_t v14 = 0x64656D616ELL;
            break;
          case 0xC:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x73756F6976657270;
            break;
          case 0xD:
            unint64_t v14 = 0x44657361656C6572;
            unint64_t v13 = 0xEB00000000657461;
            break;
          case 0xE:
            unint64_t v13 = 0xE800000000000000;
            unint64_t v14 = 0x6E6F697461727564;
            break;
          default:
            unint64_t v14 = 0x697472416D6F7266;
            unint64_t v13 = 0xEA00000000007473;
            break;
        }
        unint64_t v15 = 0x800000025C570B80;
        unint64_t v16 = 0xD000000000000018;
        switch(v12)
        {
          case 1:
            unint64_t v15 = 0xE800000000000000;
            if (v14 != 0x676E6F536D6F7266) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 2:
            unint64_t v15 = 0xE90000000000006DLL;
            if (v14 != 0x75626C416D6F7266) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 3:
            unint64_t v15 = 0xE800000000000000;
            if (v14 != 0x7478654E79616C70) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 4:
            unint64_t v15 = 0xE700000000000000;
            if (v14 != 0x776F4E79616C70) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 5:
            unint64_t v15 = 0xE800000000000000;
            if (v14 != 0x7473614C79616C70) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 6:
            unint64_t v15 = 0xE800000000000000;
            if (v14 != 0x7974696E69666661) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 7:
            unint64_t v16 = 0x6E656D6D6F636572;
            unint64_t v15 = 0xEB00000000646564;
            goto LABEL_51;
          case 8:
            unint64_t v15 = 0xE900000000000079;
            if (v14 != 0x7265766F63736964) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 9:
LABEL_51:
            if (v14 == v16) {
              goto LABEL_52;
            }
            goto LABEL_53;
          case 10:
            unint64_t v15 = 0xE400000000000000;
            if (v14 != 1954047342) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 11:
            unint64_t v15 = 0xE500000000000000;
            if (v14 != 0x64656D616ELL) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 12:
            unint64_t v15 = 0xE800000000000000;
            if (v14 != 0x73756F6976657270) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 13:
            unint64_t v15 = 0xEB00000000657461;
            if (v14 != 0x44657361656C6572) {
              goto LABEL_53;
            }
            goto LABEL_52;
          case 14:
            unint64_t v15 = 0xE800000000000000;
            if (v14 != 0x6E6F697461727564) {
              goto LABEL_53;
            }
            goto LABEL_52;
          default:
            unint64_t v15 = 0xEA00000000007473;
            if (v14 != 0x697472416D6F7266) {
              goto LABEL_53;
            }
LABEL_52:
            if (v13 == v15) {
              goto LABEL_61;
            }
LABEL_53:
            char v17 = sub_25C56EF90();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v17) {
              goto LABEL_62;
            }
            a2 = (a2 + 1) & v11;
            if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
LABEL_58:
  uint64_t v18 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v18 + 48) + a2) = v22;
  uint64_t v19 = *(void *)(v18 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (v20)
  {
    __break(1u);
LABEL_61:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_62:
    sub_25C56EFB0();
    __break(1u);
    JUMPOUT(0x25C558730);
  }
  *(void *)(v18 + 16) = v21;
  return result;
}

void *sub_25C5587A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0500);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C56EE90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25C55893C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25C56EE90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25C558AD0()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0500);
  uint64_t v2 = sub_25C56EEA0();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_36;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v5 = v1 + 56;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v1 + 56);
  int64_t v26 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v8 = v2 + 56;
  swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v15 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v16 = v15 | (v9 << 6);
      goto LABEL_33;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_37;
    }
    if (v17 >= v26) {
      break;
    }
    unint64_t v18 = *(void *)(v5 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v26) {
        break;
      }
      unint64_t v18 = *(void *)(v5 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v26) {
          break;
        }
        unint64_t v18 = *(void *)(v5 + 8 * v9);
        if (!v18)
        {
          int64_t v19 = v17 + 3;
          if (v19 >= v26) {
            break;
          }
          unint64_t v18 = *(void *)(v5 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v9 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_38;
              }
              if (v9 >= v26) {
                goto LABEL_34;
              }
              unint64_t v18 = *(void *)(v5 + 8 * v9);
              ++v19;
              if (v18) {
                goto LABEL_32;
              }
            }
          }
          int64_t v9 = v19;
        }
      }
    }
LABEL_32:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_33:
    char v24 = *(unsigned char *)(*(void *)(v1 + 48) + v16);
    sub_25C56EFC0();
    sub_25C56EDC0();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_25C56EFE0();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    if (((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v20 = 0;
    unint64_t v21 = (unint64_t)(63 - v11) >> 6;
    do
    {
      if (++v13 == v21 && (v20 & 1) != 0)
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        JUMPOUT(0x25C558F10);
      }
      BOOL v22 = v13 == v21;
      if (v13 == v21) {
        unint64_t v13 = 0;
      }
      v20 |= v22;
      uint64_t v23 = *(void *)(v8 + 8 * v13);
    }
    while (v23 == -1);
    unint64_t v14 = __clz(__rbit64(~v23)) + (v13 << 6);
LABEL_8:
    *(void *)(v8 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(unsigned char *)(*(void *)(v3 + 48) + v14) = v24;
    ++*(void *)(v3 + 16);
  }
LABEL_34:
  uint64_t result = swift_release_n();
LABEL_36:
  *uint64_t v0 = v3;
  return result;
}

uint64_t sub_25C558F4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04D8);
  uint64_t v3 = sub_25C56EEA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    sub_25C56EFC0();
    sub_25C56EDC0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25C56EFE0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25C559218(uint64_t a1)
{
  uint64_t v2 = sub_25C56E920();
  uint64_t v102 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v106 = &v89[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v89[-v6];
  MEMORY[0x270FA5388](v5);
  v108 = &v89[-v8];
  uint64_t v9 = sub_25C56EB60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v93 = &v89[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  uint64_t v12 = MEMORY[0x270FA5388](v107);
  v104 = &v89[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = &v89[-v14];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  unint64_t v92 = &v89[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v101 = &v89[-v20];
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v99 = &v89[-v22];
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  BOOL v25 = &v89[-v24];
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = &v89[-v27];
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = &v89[-v29];
  uint64_t v103 = a1;
  uint64_t v31 = sub_25C56EA30();
  if (v32)
  {
    uint64_t v33 = v31;
    unint64_t v34 = v32;
    swift_bridgeObjectRelease();
    uint64_t v35 = HIBYTE(v34) & 0xF;
    if ((v34 & 0x2000000000000000) == 0) {
      uint64_t v35 = v33 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v36 = v35 == 0;
  }
  else
  {
    BOOL v36 = 1;
  }
  int v98 = v36;
  uint64_t v37 = sub_25C56EA00();
  v105 = v7;
  if (v37)
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v30, 1, 1, v9);
  }
  uint64_t v38 = *MEMORY[0x263F73040];
  uint64_t v39 = *(void (**)(unsigned char *, void, uint64_t))(v10 + 104);
  uint64_t v96 = v10 + 104;
  v94 = v39;
  v39(v28, v38, v9);
  uint64_t v40 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56);
  uint64_t v97 = v10 + 56;
  unsigned int v95 = v40;
  v40(v28, 0, 1, v9);
  uint64_t v41 = (uint64_t)&v15[*(int *)(v107 + 48)];
  sub_25C55E72C((uint64_t)v30, (uint64_t)v15, &qword_26A5B0488);
  uint64_t v42 = (uint64_t)v15;
  sub_25C55E72C((uint64_t)v28, v41, &qword_26A5B0488);
  uint64_t v100 = v10;
  unint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v43((uint64_t)v15, 1, v9) != 1)
  {
    sub_25C55E72C((uint64_t)v15, (uint64_t)v25, &qword_26A5B0488);
    uint64_t v91 = v43;
    if (v43(v41, 1, v9) != 1)
    {
      uint64_t v49 = v100;
      uint64_t v50 = v93;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v100 + 32))(v93, v41, v9);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      int v90 = sub_25C56ED90();
      uint64_t v51 = *(void (**)(unsigned char *, uint64_t))(v49 + 8);
      v51(v50, v9);
      sub_25C5462B8((uint64_t)v28, &qword_26A5B0488);
      sub_25C5462B8((uint64_t)v30, &qword_26A5B0488);
      v51(v25, v9);
      uint64_t v48 = v101;
      sub_25C5462B8((uint64_t)v15, &qword_26A5B0488);
      uint64_t v46 = v108;
      uint64_t v47 = (uint64_t)v99;
      unint64_t v44 = v91;
      if (v90)
      {
        LODWORD(v99) = 1;
        goto LABEL_27;
      }
LABEL_17:
      if (sub_25C56EA00())
      {
        sub_25C56EB50();
        swift_release();
        uint64_t v52 = v95;
      }
      else
      {
        uint64_t v52 = v95;
        v95((unsigned char *)v47, 1, 1, v9);
      }
      v94(v48, *MEMORY[0x263F72F80], v9);
      v52(v48, 0, 1, v9);
      uint64_t v53 = v104;
      uint64_t v54 = (uint64_t)&v104[*(int *)(v107 + 48)];
      sub_25C55E72C(v47, (uint64_t)v104, &qword_26A5B0488);
      sub_25C55E72C((uint64_t)v48, v54, &qword_26A5B0488);
      if (v44((uint64_t)v53, 1, v9) == 1)
      {
        sub_25C5462B8((uint64_t)v48, &qword_26A5B0488);
        sub_25C5462B8(v47, &qword_26A5B0488);
        int v55 = v44(v54, 1, v9);
        uint64_t v45 = v105;
        if (v55 == 1)
        {
          sub_25C5462B8((uint64_t)v104, &qword_26A5B0488);
          LODWORD(v99) = 1;
          goto LABEL_28;
        }
LABEL_25:
        sub_25C5462B8((uint64_t)v104, &qword_26A5B04E8);
        LODWORD(v99) = 0;
        goto LABEL_28;
      }
      uint64_t v56 = v92;
      sub_25C55E72C((uint64_t)v104, (uint64_t)v92, &qword_26A5B0488);
      if (v44(v54, 1, v9) == 1)
      {
        sub_25C5462B8((uint64_t)v101, &qword_26A5B0488);
        sub_25C5462B8(v47, &qword_26A5B0488);
        (*(void (**)(unsigned char *, uint64_t))(v100 + 8))(v56, v9);
        uint64_t v45 = v105;
        goto LABEL_25;
      }
      uint64_t v57 = v100;
      uint64_t v58 = v47;
      uint64_t v59 = v93;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v100 + 32))(v93, v54, v9);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      LODWORD(v99) = sub_25C56ED90();
      uint64_t v60 = *(void (**)(unsigned char *, uint64_t))(v57 + 8);
      v60(v59, v9);
      sub_25C5462B8((uint64_t)v101, &qword_26A5B0488);
      sub_25C5462B8(v58, &qword_26A5B0488);
      v60(v56, v9);
      sub_25C5462B8((uint64_t)v104, &qword_26A5B0488);
LABEL_27:
      uint64_t v45 = v105;
      goto LABEL_28;
    }
    sub_25C5462B8((uint64_t)v28, &qword_26A5B0488);
    sub_25C5462B8((uint64_t)v30, &qword_26A5B0488);
    (*(void (**)(unsigned char *, uint64_t))(v100 + 8))(v25, v9);
    unint64_t v44 = v91;
LABEL_14:
    sub_25C5462B8(v42, &qword_26A5B04E8);
    uint64_t v46 = v108;
    uint64_t v47 = (uint64_t)v99;
    uint64_t v48 = v101;
    goto LABEL_17;
  }
  sub_25C5462B8((uint64_t)v28, &qword_26A5B0488);
  uint64_t v42 = (uint64_t)v15;
  sub_25C5462B8((uint64_t)v30, &qword_26A5B0488);
  unint64_t v44 = v43;
  if (v43(v41, 1, v9) != 1) {
    goto LABEL_14;
  }
  sub_25C5462B8((uint64_t)v15, &qword_26A5B0488);
  LODWORD(v99) = 1;
  uint64_t v45 = v105;
  uint64_t v46 = v108;
LABEL_28:
  uint64_t v61 = (unsigned char *)sub_25C56E8C0();
  uint64_t v62 = *((void *)v61 + 2);
  if (!v62)
  {
    swift_bridgeObjectRelease();
    int v76 = 1;
    goto LABEL_45;
  }
  unint64_t v63 = *(void (**)(char *, unsigned char *, uint64_t))(v102 + 16);
  unint64_t v64 = &v61[(*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80)];
  uint64_t v65 = (void (**)(char *, uint64_t))(v102 + 8);
  uint64_t v107 = *(void *)(v102 + 72);
  uint64_t v101 = v61;
  swift_bridgeObjectRetain();
  v104 = (unsigned char *)0x800000025C570DC0;
  while (1)
  {
    v63(v46, v64, v2);
    uint64_t v68 = sub_25C56E910();
    if (!v69)
    {
      v63(v45, v46, v2);
LABEL_41:
      uint64_t v75 = *v65;
      (*v65)(v45, v2);
      v75(v46, v2);
      goto LABEL_31;
    }
    if (v68 == 0x7473696C79616C70 && v69 == 0xED0000656C746954)
    {
      swift_bridgeObjectRelease();
      v63(v45, v46, v2);
    }
    else
    {
      char v70 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      v63(v45, v46, v2);
      if ((v70 & 1) == 0) {
        goto LABEL_41;
      }
    }
    sub_25C56E8D0();
    uint64_t v71 = sub_25C56EDB0();
    uint64_t v73 = v72;
    swift_bridgeObjectRelease();
    if (v71 == sub_25C56EDB0() && v73 == v74) {
      break;
    }
    char v66 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v67 = *v65;
    uint64_t v45 = v105;
    (*v65)(v105, v2);
    v67(v108, v2);
    if (v66) {
      goto LABEL_44;
    }
LABEL_31:
    uint64_t v46 = v108;
    v64 += v107;
    if (!--v62)
    {
      swift_bridgeObjectRelease_n();
      int v76 = 1;
      goto LABEL_45;
    }
  }
  swift_bridgeObjectRelease_n();
  uint64_t v77 = *v65;
  (*v65)(v105, v2);
  v77(v108, v2);
LABEL_44:
  swift_bridgeObjectRelease_n();
  int v76 = 0;
LABEL_45:
  uint64_t v78 = sub_25C56E8C0();
  uint64_t v79 = *(void *)(v78 + 16);
  if (!v79)
  {
    swift_bridgeObjectRelease();
    return v99 & v76 & ~v98;
  }
  LODWORD(v104) = v76;
  unint64_t v80 = *(void (**)(unsigned char *, unint64_t, uint64_t))(v102 + 16);
  unint64_t v81 = v78 + ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80));
  uint64_t v82 = (void (**)(unsigned char *, uint64_t))(v102 + 8);
  uint64_t v83 = *(void *)(v102 + 72);
  v105 = (char *)v78;
  swift_bridgeObjectRetain();
  v108 = "ce_source";
  uint64_t v107 = 0x800000025C570A10;
  unsigned int v84 = v106;
  while (2)
  {
    v80(v84, v81, v2);
    uint64_t v86 = sub_25C56E910();
    if (!v87)
    {
      (*v82)(v84, v2);
LABEL_48:
      v81 += v83;
      if (!--v79)
      {
        swift_bridgeObjectRelease_n();
        int v76 = (int)v104;
        return v99 & v76 & ~v98;
      }
      continue;
    }
    break;
  }
  if (v86 != 0xD000000000000010 || v87 != v107)
  {
    char v85 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    unsigned int v84 = v106;
    (*v82)(v106, v2);
    if (v85) {
      goto LABEL_57;
    }
    goto LABEL_48;
  }
  swift_bridgeObjectRelease();
  (*v82)(v106, v2);
LABEL_57:
  swift_bridgeObjectRelease_n();
  return 0;
}

BOOL sub_25C559F30(uint64_t a1)
{
  uint64_t v2 = sub_25C56E920();
  uint64_t v103 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v107 = &v90[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v90[-v6];
  MEMORY[0x270FA5388](v5);
  v109 = &v90[-v8];
  uint64_t v9 = sub_25C56EB60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v94 = &v90[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  uint64_t v12 = MEMORY[0x270FA5388](v108);
  v105 = &v90[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = &v90[-v14];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v93 = &v90[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v102 = &v90[-v20];
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v99 = &v90[-v22];
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  BOOL v25 = &v90[-v24];
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = &v90[-v27];
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = &v90[-v29];
  uint64_t v104 = a1;
  uint64_t v31 = sub_25C56EA30();
  if (v32)
  {
    uint64_t v33 = v31;
    unint64_t v34 = v32;
    swift_bridgeObjectRelease();
    uint64_t v35 = HIBYTE(v34) & 0xF;
    if ((v34 & 0x2000000000000000) == 0) {
      uint64_t v35 = v33 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v36 = v35 == 0;
  }
  else
  {
    BOOL v36 = 1;
  }
  BOOL v101 = v36;
  uint64_t v37 = sub_25C56EA00();
  uint64_t v106 = v7;
  if (v37)
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v30, 1, 1, v9);
  }
  uint64_t v38 = *MEMORY[0x263F73040];
  uint64_t v39 = *(void (**)(unsigned char *, void, uint64_t))(v10 + 104);
  uint64_t v97 = v10 + 104;
  unsigned int v95 = v39;
  v39(v28, v38, v9);
  uint64_t v40 = *(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56);
  uint64_t v98 = v10 + 56;
  uint64_t v96 = v40;
  v40(v28, 0, 1, v9);
  uint64_t v41 = (uint64_t)&v15[*(int *)(v108 + 48)];
  sub_25C55E72C((uint64_t)v30, (uint64_t)v15, &qword_26A5B0488);
  uint64_t v42 = (uint64_t)v15;
  sub_25C55E72C((uint64_t)v28, v41, &qword_26A5B0488);
  uint64_t v100 = v10;
  unint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v43((uint64_t)v15, 1, v9) != 1)
  {
    sub_25C55E72C((uint64_t)v15, (uint64_t)v25, &qword_26A5B0488);
    unint64_t v92 = v43;
    if (v43(v41, 1, v9) != 1)
    {
      uint64_t v49 = v100;
      uint64_t v50 = v94;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v100 + 32))(v94, v41, v9);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      int v91 = sub_25C56ED90();
      uint64_t v51 = *(void (**)(unsigned char *, uint64_t))(v49 + 8);
      v51(v50, v9);
      sub_25C5462B8((uint64_t)v28, &qword_26A5B0488);
      sub_25C5462B8((uint64_t)v30, &qword_26A5B0488);
      v51(v25, v9);
      uint64_t v48 = v102;
      sub_25C5462B8((uint64_t)v15, &qword_26A5B0488);
      uint64_t v46 = v109;
      uint64_t v47 = (uint64_t)v99;
      unint64_t v44 = v92;
      if (v91)
      {
        LODWORD(v102) = 0;
        goto LABEL_27;
      }
LABEL_17:
      if (sub_25C56EA00())
      {
        sub_25C56EB50();
        swift_release();
        uint64_t v52 = v96;
      }
      else
      {
        uint64_t v52 = v96;
        v96((unsigned char *)v47, 1, 1, v9);
      }
      v95(v48, *MEMORY[0x263F72F80], v9);
      v52(v48, 0, 1, v9);
      uint64_t v53 = v105;
      uint64_t v54 = (uint64_t)&v105[*(int *)(v108 + 48)];
      sub_25C55E72C(v47, (uint64_t)v105, &qword_26A5B0488);
      sub_25C55E72C((uint64_t)v48, v54, &qword_26A5B0488);
      if (v44((uint64_t)v53, 1, v9) == 1)
      {
        sub_25C5462B8((uint64_t)v48, &qword_26A5B0488);
        sub_25C5462B8(v47, &qword_26A5B0488);
        int v55 = v44(v54, 1, v9);
        uint64_t v45 = v106;
        if (v55 == 1)
        {
          sub_25C5462B8((uint64_t)v105, &qword_26A5B0488);
          LODWORD(v102) = 0;
          goto LABEL_28;
        }
LABEL_25:
        sub_25C5462B8((uint64_t)v105, &qword_26A5B04E8);
        LODWORD(v102) = 1;
        goto LABEL_28;
      }
      uint64_t v56 = v93;
      sub_25C55E72C((uint64_t)v105, (uint64_t)v93, &qword_26A5B0488);
      if (v44(v54, 1, v9) == 1)
      {
        sub_25C5462B8((uint64_t)v102, &qword_26A5B0488);
        sub_25C5462B8(v47, &qword_26A5B0488);
        (*(void (**)(unsigned char *, uint64_t))(v100 + 8))(v56, v9);
        uint64_t v45 = v106;
        goto LABEL_25;
      }
      uint64_t v57 = v47;
      uint64_t v58 = v100;
      uint64_t v59 = v94;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v100 + 32))(v94, v54, v9);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      int v60 = sub_25C56ED90();
      uint64_t v61 = *(void (**)(unsigned char *, uint64_t))(v58 + 8);
      v61(v59, v9);
      sub_25C5462B8((uint64_t)v102, &qword_26A5B0488);
      sub_25C5462B8(v57, &qword_26A5B0488);
      v61(v56, v9);
      sub_25C5462B8((uint64_t)v105, &qword_26A5B0488);
      LODWORD(v102) = v60 ^ 1;
LABEL_27:
      uint64_t v45 = v106;
      goto LABEL_28;
    }
    sub_25C5462B8((uint64_t)v28, &qword_26A5B0488);
    sub_25C5462B8((uint64_t)v30, &qword_26A5B0488);
    (*(void (**)(unsigned char *, uint64_t))(v100 + 8))(v25, v9);
    unint64_t v44 = v92;
LABEL_14:
    sub_25C5462B8(v42, &qword_26A5B04E8);
    uint64_t v46 = v109;
    uint64_t v47 = (uint64_t)v99;
    uint64_t v48 = v102;
    goto LABEL_17;
  }
  sub_25C5462B8((uint64_t)v28, &qword_26A5B0488);
  uint64_t v42 = (uint64_t)v15;
  sub_25C5462B8((uint64_t)v30, &qword_26A5B0488);
  unint64_t v44 = v43;
  if (v43(v41, 1, v9) != 1) {
    goto LABEL_14;
  }
  sub_25C5462B8((uint64_t)v15, &qword_26A5B0488);
  LODWORD(v102) = 0;
  uint64_t v45 = v106;
  uint64_t v46 = v109;
LABEL_28:
  uint64_t v62 = sub_25C56E8C0();
  uint64_t v63 = *(void *)(v62 + 16);
  if (!v63)
  {
    swift_bridgeObjectRelease();
    int v77 = 1;
    goto LABEL_45;
  }
  unint64_t v64 = *(void (**)(char *, unint64_t, uint64_t))(v103 + 16);
  unint64_t v65 = v62 + ((*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80));
  char v66 = (void (**)(char *, uint64_t))(v103 + 8);
  uint64_t v108 = *(void *)(v103 + 72);
  uint64_t v100 = v62;
  swift_bridgeObjectRetain();
  v105 = (unsigned char *)0x800000025C570DC0;
  while (1)
  {
    v64(v46, v65, v2);
    uint64_t v69 = sub_25C56E910();
    if (!v70)
    {
      v64(v45, (unint64_t)v46, v2);
LABEL_41:
      int v76 = *v66;
      (*v66)(v45, v2);
      v76(v46, v2);
      goto LABEL_31;
    }
    if (v69 == 0x7473696C79616C70 && v70 == 0xED0000656C746954)
    {
      swift_bridgeObjectRelease();
      v64(v45, (unint64_t)v46, v2);
    }
    else
    {
      char v71 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      v64(v45, (unint64_t)v46, v2);
      if ((v71 & 1) == 0) {
        goto LABEL_41;
      }
    }
    sub_25C56E8D0();
    uint64_t v72 = sub_25C56EDB0();
    uint64_t v74 = v73;
    swift_bridgeObjectRelease();
    if (v72 == sub_25C56EDB0() && v74 == v75) {
      break;
    }
    char v67 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v68 = *v66;
    uint64_t v45 = v106;
    (*v66)(v106, v2);
    v68(v109, v2);
    if (v67) {
      goto LABEL_44;
    }
LABEL_31:
    uint64_t v46 = v109;
    v65 += v108;
    if (!--v63)
    {
      swift_bridgeObjectRelease_n();
      int v77 = 1;
      goto LABEL_45;
    }
  }
  swift_bridgeObjectRelease_n();
  uint64_t v78 = *v66;
  (*v66)(v106, v2);
  v78(v109, v2);
LABEL_44:
  swift_bridgeObjectRelease_n();
  int v77 = 0;
LABEL_45:
  uint64_t v79 = (unsigned char *)sub_25C56E8C0();
  uint64_t v80 = *((void *)v79 + 2);
  if (v80)
  {
    LODWORD(v106) = v77;
    unint64_t v81 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v103 + 16);
    uint64_t v82 = &v79[(*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80)];
    uint64_t v83 = (void (**)(unsigned char *, uint64_t))(v103 + 8);
    uint64_t v84 = *(void *)(v103 + 72);
    v105 = v79;
    swift_bridgeObjectRetain();
    v109 = "ce_source";
    uint64_t v108 = 0x800000025C570A10;
    char v85 = v107;
    while (1)
    {
      v81(v85, v82, v2);
      uint64_t v87 = sub_25C56E910();
      if (v88)
      {
        if (v87 == 0xD000000000000010 && v88 == v108)
        {
          swift_bridgeObjectRelease();
          (*v83)(v107, v2);
LABEL_58:
          swift_bridgeObjectRelease_n();
          return 0;
        }
        char v86 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        char v85 = v107;
        (*v83)(v107, v2);
        if (v86) {
          goto LABEL_58;
        }
      }
      else
      {
        (*v83)(v85, v2);
      }
      v82 += v84;
      if (!--v80)
      {
        swift_bridgeObjectRelease_n();
        int v77 = (int)v106;
        return ((v101 | v102 | v77) & 1) == 0;
      }
    }
  }
  swift_bridgeObjectRelease();
  return ((v101 | v102 | v77) & 1) == 0;
}

uint64_t sub_25C55AC60(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v62 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v53[0] = (char *)v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v58);
  uint64_t v5 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v57 = (uint64_t)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v53 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v61 = (char *)v53 - v12;
  uint64_t v13 = sub_25C56E920();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v53 - v18;
  uint64_t v20 = sub_25C56EA30();
  if (v21)
  {
    uint64_t v22 = v20;
    unint64_t v23 = v21;
    swift_bridgeObjectRelease();
    uint64_t v24 = HIBYTE(v23) & 0xF;
    if ((v23 & 0x2000000000000000) == 0) {
      uint64_t v24 = v22 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v25 = v24 == 0;
  }
  else
  {
    BOOL v25 = 1;
  }
  BOOL v59 = v25;
  uint64_t v60 = a1;
  uint64_t v26 = sub_25C56E8C0();
  uint64_t v27 = *(void *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    uint64_t v43 = v62;
LABEL_22:
    uint64_t v44 = (uint64_t)v61;
    if (!v59)
    {
      uint64_t v45 = 1;
      goto LABEL_25;
    }
    return 0;
  }
  uint64_t v54 = v11;
  int v55 = v5;
  uint64_t v56 = v2;
  uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
  uint64_t v28 = v14 + 16;
  uint64_t v29 = v30;
  unint64_t v31 = v26 + ((*(unsigned __int8 *)(v28 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 64));
  unint64_t v32 = (void (**)(char *, uint64_t))(v28 - 8);
  uint64_t v64 = *(void *)(v28 + 56);
  v53[1] = v26;
  swift_bridgeObjectRetain();
  unint64_t v63 = 0x800000025C570DC0;
  uint64_t v65 = v28;
  while (1)
  {
    v29(v19, v31, v13);
    uint64_t v35 = sub_25C56E910();
    if (!v36)
    {
      v29(v17, (unint64_t)v19, v13);
LABEL_19:
      uint64_t v42 = *v32;
      (*v32)(v17, v13);
      v42(v19, v13);
      goto LABEL_9;
    }
    if (v35 == 0x5474736163646F70 && v36 == 0xEC000000656C7469)
    {
      swift_bridgeObjectRelease();
      v29(v17, (unint64_t)v19, v13);
    }
    else
    {
      char v37 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      v29(v17, (unint64_t)v19, v13);
      if ((v37 & 1) == 0) {
        goto LABEL_19;
      }
    }
    sub_25C56E8D0();
    uint64_t v38 = sub_25C56EDB0();
    uint64_t v40 = v39;
    swift_bridgeObjectRelease();
    if (v38 == sub_25C56EDB0() && v40 == v41) {
      break;
    }
    char v33 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v34 = *v32;
    (*v32)(v17, v13);
    v34(v19, v13);
    if (v33) {
      goto LABEL_24;
    }
LABEL_9:
    v31 += v64;
    if (!--v27)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v5 = v55;
      uint64_t v2 = v56;
      uint64_t v43 = v62;
      uint64_t v11 = v54;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease_n();
  uint64_t v46 = *v32;
  (*v32)(v17, v13);
  v46(v19, v13);
LABEL_24:
  swift_bridgeObjectRelease_n();
  uint64_t v45 = 0;
  uint64_t v5 = v55;
  uint64_t v2 = v56;
  uint64_t v44 = (uint64_t)v61;
  uint64_t v43 = v62;
  uint64_t v11 = v54;
  if (!v59)
  {
LABEL_25:
    if (sub_25C56EA00())
    {
      sub_25C56EB50();
      swift_release();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v43 + 56))(v44, 1, 1, v2);
    }
    (*(void (**)(char *, void, uint64_t))(v43 + 104))(v11, *MEMORY[0x263F73030], v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v11, 0, 1, v2);
    uint64_t v47 = (uint64_t)&v5[*(int *)(v58 + 48)];
    sub_25C55E72C(v44, (uint64_t)v5, &qword_26A5B0488);
    sub_25C55E72C((uint64_t)v11, v47, &qword_26A5B0488);
    uint64_t v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
    if (v48((uint64_t)v5, 1, v2) == 1)
    {
      sub_25C5462B8((uint64_t)v11, &qword_26A5B0488);
      sub_25C5462B8(v44, &qword_26A5B0488);
      if (v48(v47, 1, v2) == 1)
      {
        sub_25C5462B8((uint64_t)v5, &qword_26A5B0488);
        return v45;
      }
LABEL_33:
      sub_25C5462B8((uint64_t)v5, &qword_26A5B04E8);
    }
    else
    {
      uint64_t v49 = v57;
      sub_25C55E72C((uint64_t)v5, v57, &qword_26A5B0488);
      if (v48(v47, 1, v2) == 1)
      {
        sub_25C5462B8((uint64_t)v11, &qword_26A5B0488);
        sub_25C5462B8(v44, &qword_26A5B0488);
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v49, v2);
        goto LABEL_33;
      }
      uint64_t v50 = v53[0];
      (*(void (**)(void, uint64_t, uint64_t))(v43 + 32))(v53[0], v47, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      LODWORD(v65) = sub_25C56ED90();
      uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
      v51(v50, v2);
      sub_25C5462B8((uint64_t)v11, &qword_26A5B0488);
      sub_25C5462B8(v44, &qword_26A5B0488);
      v51(v49, v2);
      sub_25C5462B8((uint64_t)v5, &qword_26A5B0488);
      if (v65) {
        return v45;
      }
    }
    return 0;
  }
  return v45;
}

uint64_t sub_25C55B434(uint64_t a1)
{
  uint64_t v2 = sub_25C56EB60();
  uint64_t v62 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v53[0] = (char *)v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v58);
  uint64_t v5 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v57 = (uint64_t)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v53 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v61 = (char *)v53 - v12;
  uint64_t v13 = sub_25C56E920();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v53 - v18;
  uint64_t v20 = sub_25C56EA30();
  if (v21)
  {
    uint64_t v22 = v20;
    unint64_t v23 = v21;
    swift_bridgeObjectRelease();
    uint64_t v24 = HIBYTE(v23) & 0xF;
    if ((v23 & 0x2000000000000000) == 0) {
      uint64_t v24 = v22 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v25 = v24 == 0;
  }
  else
  {
    BOOL v25 = 1;
  }
  BOOL v59 = v25;
  uint64_t v60 = a1;
  uint64_t v26 = sub_25C56E8C0();
  uint64_t v27 = *(void *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    uint64_t v43 = v62;
LABEL_22:
    uint64_t v44 = (uint64_t)v61;
    if (v59) {
      return 0;
    }
    uint64_t v45 = 0;
    if (!sub_25C56EA00()) {
      goto LABEL_27;
    }
LABEL_24:
    sub_25C56EB50();
    swift_release();
    goto LABEL_28;
  }
  uint64_t v54 = v11;
  int v55 = v5;
  uint64_t v56 = v2;
  uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
  uint64_t v28 = v14 + 16;
  uint64_t v29 = v30;
  unint64_t v31 = v26 + ((*(unsigned __int8 *)(v28 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 64));
  unint64_t v32 = (void (**)(char *, uint64_t))(v28 - 8);
  uint64_t v64 = *(void *)(v28 + 56);
  v53[1] = v26;
  swift_bridgeObjectRetain();
  unint64_t v63 = 0x800000025C570DC0;
  uint64_t v65 = v28;
  while (1)
  {
    v29(v19, v31, v13);
    uint64_t v35 = sub_25C56E910();
    if (!v36)
    {
      v29(v17, (unint64_t)v19, v13);
LABEL_19:
      uint64_t v42 = *v32;
      (*v32)(v17, v13);
      v42(v19, v13);
      goto LABEL_9;
    }
    if (v35 == 0x5474736163646F70 && v36 == 0xEC000000656C7469)
    {
      swift_bridgeObjectRelease();
      v29(v17, (unint64_t)v19, v13);
    }
    else
    {
      char v37 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      v29(v17, (unint64_t)v19, v13);
      if ((v37 & 1) == 0) {
        goto LABEL_19;
      }
    }
    sub_25C56E8D0();
    uint64_t v38 = sub_25C56EDB0();
    uint64_t v40 = v39;
    swift_bridgeObjectRelease();
    if (v38 == sub_25C56EDB0() && v40 == v41) {
      break;
    }
    char v33 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v34 = *v32;
    (*v32)(v17, v13);
    v34(v19, v13);
    if (v33) {
      goto LABEL_25;
    }
LABEL_9:
    v31 += v64;
    if (!--v27)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v5 = v55;
      uint64_t v2 = v56;
      uint64_t v43 = v62;
      uint64_t v11 = v54;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease_n();
  uint64_t v46 = *v32;
  (*v32)(v17, v13);
  v46(v19, v13);
LABEL_25:
  swift_bridgeObjectRelease_n();
  uint64_t v5 = v55;
  uint64_t v2 = v56;
  uint64_t v44 = (uint64_t)v61;
  uint64_t v43 = v62;
  uint64_t v11 = v54;
  if (v59) {
    return 0;
  }
  uint64_t v45 = 1;
  if (sub_25C56EA00()) {
    goto LABEL_24;
  }
LABEL_27:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v43 + 56))(v44, 1, 1, v2);
LABEL_28:
  (*(void (**)(char *, void, uint64_t))(v43 + 104))(v11, *MEMORY[0x263F73030], v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v11, 0, 1, v2);
  uint64_t v47 = (uint64_t)&v5[*(int *)(v58 + 48)];
  sub_25C55E72C(v44, (uint64_t)v5, &qword_26A5B0488);
  sub_25C55E72C((uint64_t)v11, v47, &qword_26A5B0488);
  uint64_t v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
  if (v48((uint64_t)v5, 1, v2) != 1)
  {
    uint64_t v49 = v57;
    sub_25C55E72C((uint64_t)v5, v57, &qword_26A5B0488);
    if (v48(v47, 1, v2) != 1)
    {
      uint64_t v50 = v53[0];
      (*(void (**)(void, uint64_t, uint64_t))(v43 + 32))(v53[0], v47, v2);
      sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
      LODWORD(v65) = sub_25C56ED90();
      uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
      v51(v50, v2);
      sub_25C5462B8((uint64_t)v11, &qword_26A5B0488);
      sub_25C5462B8(v44, &qword_26A5B0488);
      v51(v49, v2);
      sub_25C5462B8((uint64_t)v5, &qword_26A5B0488);
      if (v65) {
        return v45;
      }
      return 0;
    }
    sub_25C5462B8((uint64_t)v11, &qword_26A5B0488);
    sub_25C5462B8(v44, &qword_26A5B0488);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v49, v2);
LABEL_33:
    sub_25C5462B8((uint64_t)v5, &qword_26A5B04E8);
    return 0;
  }
  sub_25C5462B8((uint64_t)v11, &qword_26A5B0488);
  sub_25C5462B8(v44, &qword_26A5B0488);
  if (v48(v47, 1, v2) != 1) {
    goto LABEL_33;
  }
  sub_25C5462B8((uint64_t)v5, &qword_26A5B0488);
  return v45;
}

uint64_t sub_25C55BC14()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], (uint64_t (*)(uint64_t))sub_25C559F30, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C55BDC8(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25C55BDDC(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25C55BDF0()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], sub_25C55AC60, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C55BFA4(uint64_t a1, int a2)
{
  int v44 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0468);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v45 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25C56E920();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25C56EB60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v46 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v40 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v40 - v21;
  uint64_t v48 = a1;
  uint64_t v23 = sub_25C547BF0();
  if (!v23) {
    return 0;
  }
  uint64_t v47 = v23;
  uint64_t v24 = sub_25C56EA00();
  uint64_t v41 = v6;
  uint64_t v42 = v5;
  if (v24)
  {
    sub_25C56EB50();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v22, 1, 1, v8);
  }
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v20, *MEMORY[0x263F72FB0], v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v20, 0, 1, v8);
  uint64_t v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_25C55E72C((uint64_t)v22, (uint64_t)v13, &qword_26A5B0488);
  sub_25C55E72C((uint64_t)v20, v25, &qword_26A5B0488);
  uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v26((uint64_t)v13, 1, v8) == 1)
  {
    sub_25C5462B8((uint64_t)v20, &qword_26A5B0488);
    sub_25C5462B8((uint64_t)v22, &qword_26A5B0488);
    if (v26(v25, 1, v8) == 1)
    {
      sub_25C5462B8((uint64_t)v13, &qword_26A5B0488);
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  sub_25C55E72C((uint64_t)v13, (uint64_t)v17, &qword_26A5B0488);
  if (v26(v25, 1, v8) == 1)
  {
    sub_25C5462B8((uint64_t)v20, &qword_26A5B0488);
    sub_25C5462B8((uint64_t)v22, &qword_26A5B0488);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
LABEL_10:
    sub_25C5462B8((uint64_t)v13, &qword_26A5B04E8);
LABEL_15:
    swift_release();
    return 0;
  }
  uint64_t v27 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v46, v25, v8);
  sub_25C55E6E4(&qword_26A5B04F0, MEMORY[0x263F73058]);
  char v28 = sub_25C56ED90();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
  v29(v27, v8);
  sub_25C5462B8((uint64_t)v20, &qword_26A5B0488);
  sub_25C5462B8((uint64_t)v22, &qword_26A5B0488);
  v29(v17, v8);
  sub_25C5462B8((uint64_t)v13, &qword_26A5B0488);
  if ((v28 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  if (!sub_25C548454()) {
    goto LABEL_15;
  }
  unsigned __int8 v49 = v44;
  uint64_t v30 = sub_25C56EDB0();
  uint64_t v32 = UsoEntity_common_MediaItem.identifiers(forNamespace:appBundleId:)(&v49, v30, v31);
  swift_bridgeObjectRelease();
  if (*(void *)(v32 + 16))
  {
    uint64_t v34 = v41;
    uint64_t v33 = v42;
    uint64_t v35 = (uint64_t)v45;
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v45, v32 + ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80)), v42);
    uint64_t v36 = 0;
  }
  else
  {
    uint64_t v36 = 1;
    uint64_t v34 = v41;
    uint64_t v33 = v42;
    uint64_t v35 = (uint64_t)v45;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v35, v36, 1, v33);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v35, 1, v33) != 1)
  {
    uint64_t v39 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v43, v35, v33);
    uint64_t v37 = sub_25C56E900();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v39, v33);
    return v37;
  }
  swift_release();
  swift_release();
  sub_25C5462B8(v35, &qword_26A5B0468);
  return 0;
}

uint64_t sub_25C55C640()
{
  unint64_t v0 = sub_25C54851C();
  unint64_t v1 = sub_25C564890(v0, MEMORY[0x263F8EE78], sub_25C55B434, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25C56EF50();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](v4, v1);
      }
      else {
        swift_retain();
      }
      uint64_t v7 = sub_25C56EA30();
      uint64_t v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25C563A14(0, v5[2] + 1, 1, v5);
        }
        unint64_t v11 = v5[2];
        unint64_t v10 = v5[3];
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_25C563A14((void *)(v10 > 1), v11 + 1, 1, v5);
        }
        v5[2] = v11 + 1;
        uint64_t v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C55C7F4(uint64_t result)
{
  if (result != 1) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25C55C804(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_25C55C818()
{
  unint64_t result = qword_26A5B0490;
  if (!qword_26A5B0490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0490);
  }
  return result;
}

unint64_t sub_25C55C870()
{
  unint64_t result = qword_26A5B0498;
  if (!qword_26A5B0498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0498);
  }
  return result;
}

uint64_t sub_25C55C8C4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 185);
  return result;
}

uint64_t sub_25C55C90C(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 185) = v2;
  return result;
}

uint64_t sub_25C55C950@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 186);
  return result;
}

uint64_t sub_25C55C998(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 186) = v2;
  return result;
}

uint64_t sub_25C55C9DC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 187);
  return result;
}

uint64_t sub_25C55CA24(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 187) = v2;
  return result;
}

uint64_t sub_25C55CA68@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 192);
  return swift_retain();
}

uint64_t sub_25C55CAB8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C548694(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_25C55CAF4(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 240) = *result;
  return result;
}

uint64_t sub_25C55CB04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C5488AC(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_25C55CB40(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 241) = *result;
  return result;
}

uint64_t sub_25C55CB50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5489E4();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CB7C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 248) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55CBC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C548C88();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CBEC(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a2 + 256);
  *(void *)(*(void *)a2 + 256) = *a1;
  swift_retain();
  return sub_25C55C7F4(v2);
}

uint64_t sub_25C55CC30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C548DF4();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CC5C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 264) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55CCA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C549204();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CCCC(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 272) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55CD10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5495A4();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CD3C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 280) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55CD80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C549FCC();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CDAC(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 288) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void *sub_25C55CDF0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25C54A1EC();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CE1C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 296) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void *sub_25C55CE60@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25C54B190();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CE8C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 304) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void *sub_25C55CED0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25C54C12C();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CEFC(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 312) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void *sub_25C55CF40@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25C54D0D0();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CF6C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 320) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void *sub_25C55CFB0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_25C54E074();
  *a1 = result;
  return result;
}

uint64_t sub_25C55CFDC(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 328) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D020@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C54F018(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_25C55D05C(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 336) = *result;
  return result;
}

uint64_t sub_25C55D06C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C54F6AC();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D098(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a2 + 344);
  *(void *)(*(void *)a2 + 344) = *a1;
  swift_retain();
  return sub_25C55C7F4(v2);
}

uint64_t sub_25C55D0DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C54F848();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D108(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 352) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D14C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5501F8();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D178(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 360) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D1BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550864();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D1E8(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 368) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D22C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550A3C();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D258(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 376) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D29C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550AD8();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D2C8(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 384) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D30C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550B38();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C55D338(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 392);
  uint64_t v6 = *(void *)(*a2 + 400);
  *(void *)(v4 + 392) = v3;
  *(void *)(v4 + 400) = v2;
  swift_bridgeObjectRetain();
  return sub_25C55BDC8(v5, v6);
}

uint64_t sub_25C55D380@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550C54();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C55D3AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 408);
  uint64_t v6 = *(void *)(*a2 + 416);
  *(void *)(v4 + 408) = v3;
  *(void *)(v4 + 416) = v2;
  swift_bridgeObjectRetain();
  return sub_25C55BDC8(v5, v6);
}

uint64_t sub_25C55D3F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550D70();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D420(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 424) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D464@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550F90();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D490(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 432) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D4D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C550FF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C55D500(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 440);
  uint64_t v6 = *(void *)(*a2 + 448);
  *(void *)(v4 + 440) = v3;
  *(void *)(v4 + 448) = v2;
  swift_bridgeObjectRetain();
  return sub_25C55BDC8(v5, v6);
}

uint64_t sub_25C55D548@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C55107C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C55D574(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 456);
  uint64_t v6 = *(void *)(*a2 + 464);
  *(void *)(v4 + 456) = v3;
  *(void *)(v4 + 464) = v2;
  swift_bridgeObjectRetain();
  return sub_25C55BDC8(v5, v6);
}

uint64_t sub_25C55D5BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C551108();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D5E8(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 472) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D62C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C551168();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D658(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 480) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D69C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C551388(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_25C55D6D8(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 488) = *result;
  return result;
}

uint64_t sub_25C55D6E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C551D28(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_25C55D724(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 489) = *result;
  return result;
}

uint64_t sub_25C55D734@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C552314();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D760(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 496) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D7A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C55342C(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_25C55D7E0(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 504) = *result;
  return result;
}

uint64_t sub_25C55D7F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C5537A4();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D81C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 512) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C553FD8();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D88C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 520) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D8D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25C55482C();
  *a1 = result;
  return result;
}

uint64_t sub_25C55D8FC(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 528) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C55D940@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25C555068(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_25C55D97C(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 536) = *result;
  return result;
}

uint64_t sub_25C55D98C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_25C555A28();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_25C55D9C0(uint64_t result, uint64_t *a2)
{
  unsigned __int8 v2 = *(unsigned char *)(result + 8);
  uint64_t v3 = *a2;
  *(void *)(v3 + 544) = *(void *)result;
  *(_WORD *)(v3 + 552) = v2;
  return result;
}

char *sub_25C55D9DC@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_25C556538();
  *a1 = result;
  return result;
}

uint64_t sub_25C55DA08(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 560) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

BOOL sub_25C55DA4C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_25C5565BC();
  *a1 = result;
  return result;
}

unsigned char *sub_25C55DA7C(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 568) = *result;
  return result;
}

uint64_t sub_25C55DA8C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 584);
  *a2 = *(void *)(v3 + 576);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for AudioUsoIntent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudioUsoIntent);
}

uint64_t dispatch thunk of AudioUsoIntent.verb.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1176))();
}

uint64_t dispatch thunk of AudioUsoIntent.baseEntity.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1200))();
}

uint64_t dispatch thunk of AudioUsoIntent.confirmationState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1224))();
}

uint64_t dispatch thunk of AudioUsoIntent.usoTask.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1248))();
}

uint64_t dispatch thunk of AudioUsoIntent.usoTask.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1256))();
}

uint64_t dispatch thunk of AudioUsoIntent.usoTask.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1264))();
}

uint64_t dispatch thunk of AudioUsoIntent.__allocating_init(task:)()
{
  return (*(uint64_t (**)(void))(v0 + 1280))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1408))();
}

uint64_t dispatch thunk of AudioUsoIntent.targetMediaType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1432))();
}

uint64_t dispatch thunk of AudioUsoIntent.entities.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1456))();
}

uint64_t dispatch thunk of AudioUsoIntent.resolvedReference.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1480))();
}

uint64_t dispatch thunk of AudioUsoIntent.disambiguationEntities.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1504))();
}

uint64_t dispatch thunk of AudioUsoIntent.apps.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1528))();
}

uint64_t dispatch thunk of AudioUsoIntent.artists.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1552))();
}

uint64_t dispatch thunk of AudioUsoIntent.albums.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1576))();
}

uint64_t dispatch thunk of AudioUsoIntent.appPlaylistTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1600))();
}

uint64_t dispatch thunk of AudioUsoIntent.appShowTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1624))();
}

uint64_t dispatch thunk of AudioUsoIntent.appAudiobookTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1648))();
}

uint64_t dispatch thunk of AudioUsoIntent.appMusicArtistNames.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1672))();
}

uint64_t dispatch thunk of AudioUsoIntent.appAudiobookAuthors.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1696))();
}

uint64_t dispatch thunk of AudioUsoIntent.noun.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1720))();
}

uint64_t dispatch thunk of AudioUsoIntent.dateTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1744))();
}

uint64_t dispatch thunk of AudioUsoIntent.attributes.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1768))();
}

uint64_t dispatch thunk of AudioUsoIntent.musicTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1792))();
}

uint64_t dispatch thunk of AudioUsoIntent.playlistTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1816))();
}

uint64_t dispatch thunk of AudioUsoIntent.playlistMediaItems.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1840))();
}

uint64_t dispatch thunk of AudioUsoIntent.applePlaylistTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1864))();
}

uint64_t dispatch thunk of AudioUsoIntent.appName.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1888))();
}

uint64_t dispatch thunk of AudioUsoIntent.appBundleId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1912))();
}

uint64_t dispatch thunk of AudioUsoIntent.showTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1936))();
}

uint64_t dispatch thunk of AudioUsoIntent.podcastTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1960))();
}

uint64_t dispatch thunk of AudioUsoIntent.newsPodcastTopicId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1984))();
}

uint64_t dispatch thunk of AudioUsoIntent.newsPodcastIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2008))();
}

uint64_t dispatch thunk of AudioUsoIntent.applePodcastTitles.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2032))();
}

uint64_t dispatch thunk of AudioUsoIntent.radioStationNames.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2056))();
}

uint64_t dispatch thunk of AudioUsoIntent.decade.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2080))();
}

uint64_t dispatch thunk of AudioUsoIntent.sort.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2104))();
}

uint64_t dispatch thunk of AudioUsoIntent.modifiers.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2128))();
}

uint64_t dispatch thunk of AudioUsoIntent.reference.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2152))();
}

uint64_t dispatch thunk of AudioUsoIntent.genres.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2176))();
}

uint64_t dispatch thunk of AudioUsoIntent.moods.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2200))();
}

uint64_t dispatch thunk of AudioUsoIntent.activities.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2224))();
}

uint64_t dispatch thunk of AudioUsoIntent.radioType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2248))();
}

uint64_t dispatch thunk of AudioUsoIntent.frequency.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2272))();
}

uint64_t dispatch thunk of AudioUsoIntent.audioSettingNames.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2296))();
}

uint64_t dispatch thunk of AudioUsoIntent.appInferred.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2320))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2344))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2352))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 2360))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *BOOL result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioUsoIntent.UsoNamespace(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE5) {
    goto LABEL_17;
  }
  if (a2 + 27 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 27) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 27;
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
      return (*a1 | (v4 << 8)) - 27;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 27;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1C;
  int v8 = v6 - 28;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AudioUsoIntent.UsoNamespace(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 27 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 27) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE4)
  {
    unsigned int v6 = ((a2 - 229) >> 8) + 1;
    *BOOL result = a2 + 27;
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
        JUMPOUT(0x25C55E4D8);
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
          *BOOL result = a2 + 27;
        break;
    }
  }
  return result;
}

uint64_t sub_25C55E500(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25C55E50C(unsigned char *result, char a2)
{
  *BOOL result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioUsoIntent.UsoNamespace()
{
  return &type metadata for AudioUsoIntent.UsoNamespace;
}

uint64_t getEnumTagSinglePayload for AudioUsoIntent.IterationOptions(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AudioUsoIntent.IterationOptions(unsigned char *result, int a2, int a3)
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
        *BOOL result = a2;
        return result;
      case 2:
        *(_WORD *)BOOL result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)BOOL result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *BOOL result = 0;
      break;
    case 2:
      *(_WORD *)BOOL result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C55E614);
    case 4:
      *(_DWORD *)BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25C55E63C()
{
  return 0;
}

ValueMetadata *type metadata accessor for AudioUsoIntent.IterationOptions()
{
  return &type metadata for AudioUsoIntent.IterationOptions;
}

uint64_t sub_25C55E654(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25C55E664(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

unsigned char *sub_25C55E674@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (BOOL result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_25C55E6E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C55E72C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25C55E794()
{
  sub_25C55E7F8();
  uint64_t result = sub_25C56EE60();
  qword_26A5B1FE0 = result;
  return result;
}

unint64_t sub_25C55E7F8()
{
  unint64_t result = qword_26A5B0510;
  if (!qword_26A5B0510)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A5B0510);
  }
  return result;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.hasNonEmptyName()()
{
  uint64_t v0 = sub_25C56EA30();
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v0;
  unint64_t v3 = v1;
  swift_bridgeObjectRelease();
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = v2 & 0xFFFFFFFFFFFFLL;
  }
  return v4 != 0;
}

uint64_t Array<A>.findAll(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, unint64_t a4)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v8 = sub_25C564890(a4, a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_release();
  return v8;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isResolvedReference()()
{
  uint64_t v1 = sub_25C56E920();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v45 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)v39 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v39 - v8;
  uint64_t v10 = sub_25C56E8C0();
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11)
  {
    swift_bridgeObjectRelease();
    int v24 = 0;
    goto LABEL_19;
  }
  v39[2] = v0;
  uint64_t v40 = v2;
  uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  uint64_t v13 = v2 + 16;
  uint64_t v12 = v14;
  unint64_t v15 = v10 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
  uint64_t v16 = (void (**)(char *, uint64_t))(v13 - 8);
  uint64_t v46 = *(const char **)(v13 + 56);
  v39[1] = v10;
  swift_bridgeObjectRetain();
  uint64_t v42 = "identifier";
  unint64_t v43 = 0x800000025C5709E0;
  int v44 = "media_controls";
  unint64_t v41 = 0x800000025C570DC0;
  while (1)
  {
    v12(v9, v15, v1);
    uint64_t v19 = sub_25C56E910();
    if (!v20)
    {
      v12(v7, (unint64_t)v9, v1);
LABEL_14:
      uint64_t v23 = *v16;
      (*v16)(v7, v1);
      v23(v9, v1);
      goto LABEL_4;
    }
    if (v19 == 0xD000000000000019 && v20 == v43)
    {
      swift_bridgeObjectRelease();
      v12(v7, (unint64_t)v9, v1);
    }
    else
    {
      char v21 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      v12(v7, (unint64_t)v9, v1);
      if ((v21 & 1) == 0) {
        goto LABEL_14;
      }
    }
    if (sub_25C56E8D0() == 0xD00000000000001CLL && v22 == v41) {
      break;
    }
    char v17 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    uint64_t v18 = *v16;
    (*v16)(v7, v1);
    v18(v9, v1);
    if (v17) {
      goto LABEL_17;
    }
LABEL_4:
    v15 += (unint64_t)v46;
    if (!--v11)
    {
      swift_bridgeObjectRelease_n();
      int v24 = 0;
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v25 = *v16;
  (*v16)(v7, v1);
  v25(v9, v1);
LABEL_17:
  swift_bridgeObjectRelease_n();
  int v24 = 1;
LABEL_18:
  uint64_t v2 = v40;
LABEL_19:
  uint64_t v26 = sub_25C56E8C0();
  uint64_t v27 = *(void *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  LODWORD(v43) = v24;
  uint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  uint64_t v29 = v2 + 16;
  char v28 = v30;
  unint64_t v31 = v26 + ((*(unsigned __int8 *)(v29 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 64));
  uint64_t v32 = (void (**)(char *, uint64_t))(v29 - 8);
  uint64_t v33 = *(void *)(v29 + 56);
  uint64_t v42 = (const char *)v26;
  swift_bridgeObjectRetain();
  uint64_t v46 = "mediaPlayerAttributes";
  int v44 = (const char *)0x800000025C570960;
  uint64_t v34 = v45;
  while (2)
  {
    v28(v34, v31, v1);
    uint64_t v36 = sub_25C56E910();
    if (!v37)
    {
      (*v32)(v34, v1);
LABEL_22:
      v31 += v33;
      if (!--v27)
      {
        swift_bridgeObjectRelease_n();
        return 0;
      }
      continue;
    }
    break;
  }
  if (v36 != 0xD000000000000014 || v37 != v44)
  {
    char v35 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    uint64_t v34 = v45;
    (*v32)(v45, v1);
    if (v35) {
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  (*v32)(v45, v1);
LABEL_30:
  swift_bridgeObjectRelease_n();
  return (v43 & 1) != 0;
}

uint64_t Array<A>.findFirst(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, unint64_t a4)
{
  if (a4 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25C56EF50();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v9 = 4;
      do
      {
        uint64_t v10 = v9 - 4;
        if ((a4 & 0xC000000000000001) != 0)
        {
          MEMORY[0x261189CD0](v9 - 4, a4);
          uint64_t v11 = v9 - 3;
          if (__OFADD__(v10, 1)) {
            goto LABEL_13;
          }
        }
        else
        {
          swift_retain();
          uint64_t v11 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        uint64_t v12 = UsoEntity_common_MediaItem.findFirst(options:with:)(a1, a2, a3);
        swift_release();
        if (v12) {
          goto LABEL_12;
        }
        ++v9;
      }
      while (v11 != v8);
    }
  }
  uint64_t v12 = 0;
LABEL_12:
  swift_bridgeObjectRelease();
  return v12;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isFromArtist()()
{
  uint64_t v1 = sub_25C56EB60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v56);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v53 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v48 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v58 = (char *)&v48 - v12;
  uint64_t v13 = sub_25C56E920();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  char v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t v55 = v0;
  uint64_t v20 = sub_25C56E8C0();
  uint64_t v21 = *(void *)(v20 + 16);
  if (v21)
  {
    unsigned __int8 v49 = v4;
    uint64_t v50 = v2;
    uint64_t v51 = v6;
    uint64_t v52 = v1;
    int v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    uint64_t v23 = v14 + 16;
    uint64_t v22 = v24;
    unint64_t v25 = v20 + ((*(unsigned __int8 *)(v23 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 64));
    uint64_t v26 = (void (**)(char *, uint64_t))(v23 - 8);
    uint64_t v61 = *(void *)(v23 + 56);
    uint64_t v54 = v20;
    swift_bridgeObjectRetain();
    BOOL v59 = "mediaPlayerRadioType";
    unint64_t v60 = 0x800000025C570940;
    while (1)
    {
      v22(v19, v25, v13);
      uint64_t v29 = sub_25C56E910();
      if (!v30) {
        break;
      }
      if (v29 == 0xD000000000000015 && v30 == v60)
      {
        swift_bridgeObjectRelease();
        v22(v17, (unint64_t)v19, v13);
      }
      else
      {
        char v31 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        v22(v17, (unint64_t)v19, v13);
        if ((v31 & 1) == 0) {
          goto LABEL_14;
        }
      }
      if (sub_25C56E900() == 0x697472416D6F7266 && v32 == 0xEA00000000007473)
      {
        swift_bridgeObjectRelease();
        char v35 = *v26;
        (*v26)(v17, v13);
        v35(v19, v13);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_25C56EA00())
        {
          uint64_t v36 = (uint64_t)v58;
          sub_25C56EB50();
          swift_release();
          uint64_t v38 = (uint64_t)v51;
          uint64_t v37 = v52;
          uint64_t v39 = v50;
        }
        else
        {
          uint64_t v39 = v50;
          uint64_t v36 = (uint64_t)v58;
          uint64_t v37 = v52;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v58, 1, 1, v52);
          uint64_t v38 = (uint64_t)v51;
        }
        uint64_t v40 = (uint64_t)v57;
        (*(void (**)(char *, void, uint64_t))(v39 + 104))(v57, *MEMORY[0x263F72FF0], v37);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v37);
        uint64_t v41 = v38 + *(int *)(v56 + 48);
        sub_25C55E72C(v36, v38, &qword_26A5B0488);
        sub_25C55E72C(v40, v41, &qword_26A5B0488);
        uint64_t v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
        if (v42(v38, 1, v37) == 1)
        {
          sub_25C5462B8(v40, &qword_26A5B0488);
          sub_25C5462B8(v36, &qword_26A5B0488);
          if (v42(v41, 1, v37) == 1)
          {
            sub_25C5462B8(v38, &qword_26A5B0488);
            char v34 = 1;
            return v34 & 1;
          }
        }
        else
        {
          uint64_t v43 = v53;
          sub_25C55E72C(v38, v53, &qword_26A5B0488);
          if (v42(v41, 1, v37) != 1)
          {
            uint64_t v44 = v43;
            uint64_t v45 = v49;
            (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v49, v41, v37);
            sub_25C5649D4(&qword_26A5B04F0, MEMORY[0x263F73058]);
            char v34 = sub_25C56ED90();
            uint64_t v46 = *(void (**)(char *, uint64_t))(v39 + 8);
            v46(v45, v37);
            sub_25C5462B8(v40, &qword_26A5B0488);
            sub_25C5462B8(v36, &qword_26A5B0488);
            v46((char *)v44, v37);
            sub_25C5462B8(v38, &qword_26A5B0488);
            return v34 & 1;
          }
          sub_25C5462B8(v40, &qword_26A5B0488);
          sub_25C5462B8(v36, &qword_26A5B0488);
          (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v37);
        }
        sub_25C5462B8(v38, &qword_26A5B04E8);
        char v34 = 0;
        return v34 & 1;
      }
      char v27 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      char v28 = *v26;
      (*v26)(v17, v13);
      v28(v19, v13);
      if (v27) {
        goto LABEL_17;
      }
LABEL_4:
      v25 += v61;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        char v34 = 0;
        return v34 & 1;
      }
    }
    v22(v17, (unint64_t)v19, v13);
LABEL_14:
    uint64_t v33 = *v26;
    (*v26)(v17, v13);
    v33(v19, v13);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  char v34 = 0;
  return v34 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isFromSong()()
{
  uint64_t v1 = sub_25C56EB60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v56);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v53 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v48 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v58 = (char *)&v48 - v12;
  uint64_t v13 = sub_25C56E920();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  char v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t v55 = v0;
  uint64_t v20 = sub_25C56E8C0();
  uint64_t v21 = *(void *)(v20 + 16);
  if (v21)
  {
    unsigned __int8 v49 = v4;
    uint64_t v50 = v2;
    uint64_t v51 = v6;
    uint64_t v52 = v1;
    int v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    uint64_t v23 = v14 + 16;
    uint64_t v22 = v24;
    unint64_t v25 = v20 + ((*(unsigned __int8 *)(v23 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 64));
    uint64_t v26 = (void (**)(char *, uint64_t))(v23 - 8);
    uint64_t v61 = *(void *)(v23 + 56);
    uint64_t v54 = v20;
    swift_bridgeObjectRetain();
    BOOL v59 = "mediaPlayerRadioType";
    unint64_t v60 = 0x800000025C570940;
    while (1)
    {
      v22(v19, v25, v13);
      uint64_t v29 = sub_25C56E910();
      if (!v30) {
        break;
      }
      if (v29 == 0xD000000000000015 && v30 == v60)
      {
        swift_bridgeObjectRelease();
        v22(v17, (unint64_t)v19, v13);
      }
      else
      {
        char v31 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        v22(v17, (unint64_t)v19, v13);
        if ((v31 & 1) == 0) {
          goto LABEL_14;
        }
      }
      if (sub_25C56E900() == 0x676E6F536D6F7266 && v32 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
        char v35 = *v26;
        (*v26)(v17, v13);
        v35(v19, v13);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_25C56EA00())
        {
          uint64_t v36 = (uint64_t)v58;
          sub_25C56EB50();
          swift_release();
          uint64_t v38 = (uint64_t)v51;
          uint64_t v37 = v52;
          uint64_t v39 = v50;
        }
        else
        {
          uint64_t v39 = v50;
          uint64_t v36 = (uint64_t)v58;
          uint64_t v37 = v52;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v58, 1, 1, v52);
          uint64_t v38 = (uint64_t)v51;
        }
        uint64_t v40 = (uint64_t)v57;
        (*(void (**)(char *, void, uint64_t))(v39 + 104))(v57, *MEMORY[0x263F72FC0], v37);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v37);
        uint64_t v41 = v38 + *(int *)(v56 + 48);
        sub_25C55E72C(v36, v38, &qword_26A5B0488);
        sub_25C55E72C(v40, v41, &qword_26A5B0488);
        uint64_t v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
        if (v42(v38, 1, v37) == 1)
        {
          sub_25C5462B8(v40, &qword_26A5B0488);
          sub_25C5462B8(v36, &qword_26A5B0488);
          if (v42(v41, 1, v37) == 1)
          {
            sub_25C5462B8(v38, &qword_26A5B0488);
            char v34 = 1;
            return v34 & 1;
          }
        }
        else
        {
          uint64_t v43 = v53;
          sub_25C55E72C(v38, v53, &qword_26A5B0488);
          if (v42(v41, 1, v37) != 1)
          {
            uint64_t v44 = v43;
            uint64_t v45 = v49;
            (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v49, v41, v37);
            sub_25C5649D4(&qword_26A5B04F0, MEMORY[0x263F73058]);
            char v34 = sub_25C56ED90();
            uint64_t v46 = *(void (**)(char *, uint64_t))(v39 + 8);
            v46(v45, v37);
            sub_25C5462B8(v40, &qword_26A5B0488);
            sub_25C5462B8(v36, &qword_26A5B0488);
            v46((char *)v44, v37);
            sub_25C5462B8(v38, &qword_26A5B0488);
            return v34 & 1;
          }
          sub_25C5462B8(v40, &qword_26A5B0488);
          sub_25C5462B8(v36, &qword_26A5B0488);
          (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v37);
        }
        sub_25C5462B8(v38, &qword_26A5B04E8);
        char v34 = 0;
        return v34 & 1;
      }
      char v27 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      char v28 = *v26;
      (*v26)(v17, v13);
      v28(v19, v13);
      if (v27) {
        goto LABEL_17;
      }
LABEL_4:
      v25 += v61;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        char v34 = 0;
        return v34 & 1;
      }
    }
    v22(v17, (unint64_t)v19, v13);
LABEL_14:
    uint64_t v33 = *v26;
    (*v26)(v17, v13);
    v33(v19, v13);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  char v34 = 0;
  return v34 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isFromAlbum()()
{
  uint64_t v1 = sub_25C56EB60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v56);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v53 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v48 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v58 = (char *)&v48 - v12;
  uint64_t v13 = sub_25C56E920();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  char v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t v55 = v0;
  uint64_t v20 = sub_25C56E8C0();
  uint64_t v21 = *(void *)(v20 + 16);
  if (v21)
  {
    unsigned __int8 v49 = v4;
    uint64_t v50 = v2;
    uint64_t v51 = v6;
    uint64_t v52 = v1;
    int v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    uint64_t v23 = v14 + 16;
    uint64_t v22 = v24;
    unint64_t v25 = v20 + ((*(unsigned __int8 *)(v23 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 64));
    uint64_t v26 = (void (**)(char *, uint64_t))(v23 - 8);
    uint64_t v61 = *(void *)(v23 + 56);
    uint64_t v54 = v20;
    swift_bridgeObjectRetain();
    BOOL v59 = "mediaPlayerRadioType";
    unint64_t v60 = 0x800000025C570940;
    while (1)
    {
      v22(v19, v25, v13);
      uint64_t v29 = sub_25C56E910();
      if (!v30) {
        break;
      }
      if (v29 == 0xD000000000000015 && v30 == v60)
      {
        swift_bridgeObjectRelease();
        v22(v17, (unint64_t)v19, v13);
      }
      else
      {
        char v31 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        v22(v17, (unint64_t)v19, v13);
        if ((v31 & 1) == 0) {
          goto LABEL_14;
        }
      }
      if (sub_25C56E900() == 0x75626C416D6F7266 && v32 == 0xE90000000000006DLL)
      {
        swift_bridgeObjectRelease();
        char v35 = *v26;
        (*v26)(v17, v13);
        v35(v19, v13);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_25C56EA00())
        {
          uint64_t v36 = (uint64_t)v58;
          sub_25C56EB50();
          swift_release();
          uint64_t v38 = (uint64_t)v51;
          uint64_t v37 = v52;
          uint64_t v39 = v50;
        }
        else
        {
          uint64_t v39 = v50;
          uint64_t v36 = (uint64_t)v58;
          uint64_t v37 = v52;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56))(v58, 1, 1, v52);
          uint64_t v38 = (uint64_t)v51;
        }
        uint64_t v40 = (uint64_t)v57;
        (*(void (**)(char *, void, uint64_t))(v39 + 104))(v57, *MEMORY[0x263F72FC8], v37);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v37);
        uint64_t v41 = v38 + *(int *)(v56 + 48);
        sub_25C55E72C(v36, v38, &qword_26A5B0488);
        sub_25C55E72C(v40, v41, &qword_26A5B0488);
        uint64_t v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
        if (v42(v38, 1, v37) == 1)
        {
          sub_25C5462B8(v40, &qword_26A5B0488);
          sub_25C5462B8(v36, &qword_26A5B0488);
          if (v42(v41, 1, v37) == 1)
          {
            sub_25C5462B8(v38, &qword_26A5B0488);
            char v34 = 1;
            return v34 & 1;
          }
        }
        else
        {
          uint64_t v43 = v53;
          sub_25C55E72C(v38, v53, &qword_26A5B0488);
          if (v42(v41, 1, v37) != 1)
          {
            uint64_t v44 = v43;
            uint64_t v45 = v49;
            (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v49, v41, v37);
            sub_25C5649D4(&qword_26A5B04F0, MEMORY[0x263F73058]);
            char v34 = sub_25C56ED90();
            uint64_t v46 = *(void (**)(char *, uint64_t))(v39 + 8);
            v46(v45, v37);
            sub_25C5462B8(v40, &qword_26A5B0488);
            sub_25C5462B8(v36, &qword_26A5B0488);
            v46((char *)v44, v37);
            sub_25C5462B8(v38, &qword_26A5B0488);
            return v34 & 1;
          }
          sub_25C5462B8(v40, &qword_26A5B0488);
          sub_25C5462B8(v36, &qword_26A5B0488);
          (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v37);
        }
        sub_25C5462B8(v38, &qword_26A5B04E8);
        char v34 = 0;
        return v34 & 1;
      }
      char v27 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      char v28 = *v26;
      (*v26)(v17, v13);
      v28(v19, v13);
      if (v27) {
        goto LABEL_17;
      }
LABEL_4:
      v25 += v61;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        char v34 = 0;
        return v34 & 1;
      }
    }
    v22(v17, (unint64_t)v19, v13);
LABEL_14:
    uint64_t v33 = *v26;
    (*v26)(v17, v13);
    v33(v19, v13);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  char v34 = 0;
  return v34 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isRecommended()()
{
  uint64_t v0 = sub_25C56EBA0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v29 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0518);
  MEMORY[0x270FA5388](v41);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v27 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v27 - v12;
  if (!sub_25C56E980()) {
    return 0;
  }
  unint64_t v14 = sub_25C56EC50();
  swift_release();
  if (!v14) {
    return 0;
  }
  if (v14 >> 62) {
    goto LABEL_25;
  }
  uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v15; uint64_t v15 = sub_25C56EF50())
  {
    uint64_t v42 = v4;
    uint64_t v33 = v8;
    unint64_t v40 = v14 & 0xC000000000000001;
    char v35 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
    unsigned int v37 = *MEMORY[0x263F730C8];
    uint64_t v38 = (void (**)(char *, void, uint64_t))(v1 + 104);
    unint64_t v39 = v1 + 48;
    char v28 = (void (**)(char *, uint64_t, uint64_t))(v1 + 32);
    char v31 = (void (**)(uint64_t, uint64_t))(v1 + 8);
    uint64_t v32 = v13;
    uint64_t v8 = 4;
    unint64_t v36 = v14;
    uint64_t v34 = v15;
    uint64_t v16 = (uint64_t)v4;
    while (1)
    {
      if (v40)
      {
        uint64_t v4 = (char *)MEMORY[0x261189CD0](v8 - 4, v14);
      }
      else
      {
        uint64_t v4 = *(char **)(v14 + 8 * v8);
        swift_retain();
      }
      uint64_t v1 = v8 - 3;
      unint64_t v14 = v39;
      if (__OFADD__(v8 - 4, 1)) {
        break;
      }
      sub_25C56E930();
      uint64_t v43 = v4;
      if (v44)
      {
        sub_25C56EB90();
        swift_release();
        uint64_t v18 = v35;
      }
      else
      {
        uint64_t v18 = v35;
        (*v35)(v13, 1, 1, v0);
      }
      (*v38)(v11, v37, v0);
      (*v18)(v11, 0, 1, v0);
      uint64_t v19 = v16 + *(int *)(v41 + 48);
      sub_25C55E72C((uint64_t)v13, v16, &qword_26A5B04E0);
      uint64_t v20 = (uint64_t)v11;
      sub_25C55E72C((uint64_t)v11, v19, &qword_26A5B04E0);
      uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v14;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v14)(v16, 1, v0) == 1)
      {
        int v17 = v21(v19, 1, v0);
        unint64_t v14 = v36;
        if (v17 == 1)
        {
          sub_25C5462B8((uint64_t)v42, &qword_26A5B04E0);
          sub_25C5462B8(v20, &qword_26A5B04E0);
          sub_25C5462B8((uint64_t)v13, &qword_26A5B04E0);
          swift_release();
LABEL_23:
          Swift::Bool v25 = 1;
          goto LABEL_27;
        }
        goto LABEL_7;
      }
      uint64_t v22 = v33;
      sub_25C55E72C(v16, v33, &qword_26A5B04E0);
      if (v21(v19, 1, v0) == 1)
      {
        (*v31)(v22, v0);
        unint64_t v14 = v36;
        uint64_t v13 = v32;
LABEL_7:
        sub_25C5462B8((uint64_t)v42, &qword_26A5B0518);
        uint64_t v11 = (char *)v20;
        sub_25C5462B8(v20, &qword_26A5B04E0);
        sub_25C5462B8((uint64_t)v13, &qword_26A5B04E0);
        swift_release();
        goto LABEL_8;
      }
      uint64_t v23 = v29;
      (*v28)(v29, v19, v0);
      sub_25C5649D4(&qword_26A5B0520, MEMORY[0x263F73108]);
      int v30 = sub_25C56ED90();
      int v24 = *v31;
      (*v31)(v22, v0);
      v24((uint64_t)v23, v0);
      sub_25C5462B8(v16, &qword_26A5B04E0);
      uint64_t v11 = (char *)v20;
      sub_25C5462B8(v20, &qword_26A5B04E0);
      uint64_t v13 = v32;
      sub_25C5462B8((uint64_t)v32, &qword_26A5B04E0);
      swift_release();
      unint64_t v14 = v36;
      if (v30) {
        goto LABEL_23;
      }
LABEL_8:
      ++v8;
      if (v1 == v34) {
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
  }
LABEL_26:
  Swift::Bool v25 = 0;
LABEL_27:
  swift_bridgeObjectRelease_n();
  return v25;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isAffinity()()
{
  return sub_25C560A54(MEMORY[0x263F732C8]);
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isDiscover()()
{
  return sub_25C560A54(MEMORY[0x263F732D0]);
}

uint64_t sub_25C560A54(unsigned int *a1)
{
  uint64_t v2 = sub_25C56EC40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v26 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0528);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0530);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  unint64_t v14 = (char *)&v25 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v25 - v15;
  if (sub_25C56E980())
  {
    sub_25C56EC30();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v16, 1, 1, v2);
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v14, *a1, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v14, 0, 1, v2);
  uint64_t v17 = (uint64_t)&v7[*(int *)(v5 + 48)];
  sub_25C55E72C((uint64_t)v16, (uint64_t)v7, &qword_26A5B0530);
  sub_25C55E72C((uint64_t)v14, v17, &qword_26A5B0530);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v18((uint64_t)v7, 1, v2) == 1)
  {
    sub_25C5462B8((uint64_t)v14, &qword_26A5B0530);
    sub_25C5462B8((uint64_t)v16, &qword_26A5B0530);
    int v19 = v18(v17, 1, v2);
    if (v19 == 1) {
      uint64_t v20 = &qword_26A5B0530;
    }
    else {
      uint64_t v20 = &qword_26A5B0528;
    }
    if (v19 == 1) {
      char v21 = -1;
    }
    else {
      char v21 = 0;
    }
  }
  else
  {
    sub_25C55E72C((uint64_t)v7, (uint64_t)v11, &qword_26A5B0530);
    if (v18(v17, 1, v2) == 1)
    {
      sub_25C5462B8((uint64_t)v14, &qword_26A5B0530);
      sub_25C5462B8((uint64_t)v16, &qword_26A5B0530);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      char v21 = 0;
      uint64_t v20 = &qword_26A5B0528;
    }
    else
    {
      uint64_t v22 = v26;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v26, v17, v2);
      sub_25C5649D4(&qword_26A5B0538, MEMORY[0x263F732D8]);
      char v21 = sub_25C56ED90();
      uint64_t v23 = *(void (**)(char *, uint64_t))(v3 + 8);
      v23(v22, v2);
      uint64_t v20 = &qword_26A5B0530;
      sub_25C5462B8((uint64_t)v14, &qword_26A5B0530);
      sub_25C5462B8((uint64_t)v16, &qword_26A5B0530);
      v23(v11, v2);
    }
  }
  sub_25C5462B8((uint64_t)v7, v20);
  return v21 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isAddToUnspecifiedPlaylist()()
{
  uint64_t v1 = sub_25C56EB60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v52 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04E8);
  MEMORY[0x270FA5388](v55);
  uint64_t v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v53 = (uint64_t)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v56 = (char *)&v47 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v57 = (char *)&v47 - v11;
  uint64_t v12 = sub_25C56E920();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v47 - v17;
  uint64_t v19 = sub_25C56E8C0();
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    uint64_t v50 = v1;
    uint64_t v51 = v0;
    uint64_t v48 = v2;
    unsigned __int8 v49 = v5;
    uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
    uint64_t v22 = v13 + 16;
    char v21 = v23;
    unint64_t v24 = v19 + ((*(unsigned __int8 *)(v22 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 64));
    uint64_t v25 = (void (**)(char *, uint64_t))(v22 - 8);
    uint64_t v62 = *(void *)(v22 + 56);
    uint64_t v54 = v19;
    swift_bridgeObjectRetain();
    BOOL v59 = "mediaPlayerRadioType";
    unint64_t v60 = "commended";
    unint64_t v61 = 0x800000025C570940;
    unint64_t v58 = 0x800000025C570B80;
    while (1)
    {
      v21(v18, v24, v12);
      uint64_t v28 = sub_25C56E910();
      if (!v29) {
        break;
      }
      if (v28 == 0xD000000000000015 && v29 == v61)
      {
        swift_bridgeObjectRelease();
        v21(v16, (unint64_t)v18, v12);
      }
      else
      {
        char v30 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        v21(v16, (unint64_t)v18, v12);
        if ((v30 & 1) == 0) {
          goto LABEL_14;
        }
      }
      if (sub_25C56E900() == 0xD000000000000018 && v31 == v58)
      {
        swift_bridgeObjectRelease();
        uint64_t v34 = *v25;
        (*v25)(v16, v12);
        v34(v18, v12);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_25C56EA00())
        {
          uint64_t v35 = (uint64_t)v57;
          sub_25C56EB50();
          swift_release();
          uint64_t v37 = (uint64_t)v49;
          uint64_t v36 = v50;
          uint64_t v38 = v48;
        }
        else
        {
          uint64_t v38 = v48;
          uint64_t v35 = (uint64_t)v57;
          uint64_t v36 = v50;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56))(v57, 1, 1, v50);
          uint64_t v37 = (uint64_t)v49;
        }
        uint64_t v39 = (uint64_t)v56;
        (*(void (**)(char *, void, uint64_t))(v38 + 104))(v56, *MEMORY[0x263F73040], v36);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v38 + 56))(v39, 0, 1, v36);
        uint64_t v40 = v37 + *(int *)(v55 + 48);
        sub_25C55E72C(v35, v37, &qword_26A5B0488);
        sub_25C55E72C(v39, v40, &qword_26A5B0488);
        uint64_t v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
        if (v41(v37, 1, v36) == 1)
        {
          sub_25C5462B8(v39, &qword_26A5B0488);
          sub_25C5462B8(v35, &qword_26A5B0488);
          if (v41(v40, 1, v36) == 1)
          {
            sub_25C5462B8(v37, &qword_26A5B0488);
            char v33 = 1;
            return v33 & 1;
          }
        }
        else
        {
          uint64_t v42 = v53;
          sub_25C55E72C(v37, v53, &qword_26A5B0488);
          if (v41(v40, 1, v36) != 1)
          {
            uint64_t v43 = v42;
            uint64_t v44 = v52;
            (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v52, v40, v36);
            sub_25C5649D4(&qword_26A5B04F0, MEMORY[0x263F73058]);
            char v33 = sub_25C56ED90();
            uint64_t v45 = *(void (**)(char *, uint64_t))(v38 + 8);
            v45(v44, v36);
            sub_25C5462B8(v39, &qword_26A5B0488);
            sub_25C5462B8(v35, &qword_26A5B0488);
            v45((char *)v43, v36);
            sub_25C5462B8(v37, &qword_26A5B0488);
            return v33 & 1;
          }
          sub_25C5462B8(v39, &qword_26A5B0488);
          sub_25C5462B8(v35, &qword_26A5B0488);
          (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v36);
        }
        sub_25C5462B8(v37, &qword_26A5B04E8);
        char v33 = 0;
        return v33 & 1;
      }
      char v26 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      uint64_t v27 = *v25;
      (*v25)(v16, v12);
      v27(v18, v12);
      if (v26) {
        goto LABEL_17;
      }
LABEL_4:
      v24 += v62;
      if (!--v20)
      {
        swift_bridgeObjectRelease_n();
        char v33 = 0;
        return v33 & 1;
      }
    }
    v21(v16, (unint64_t)v18, v12);
LABEL_14:
    uint64_t v32 = *v25;
    (*v25)(v16, v12);
    v32(v18, v12);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  char v33 = 0;
  return v33 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.hasListPosition()()
{
  uint64_t v0 = sub_25C56E950();
  if (v0) {
    swift_release();
  }
  return v0 != 0;
}

SiriAudioIntentUtils::CommonAudio::Attribute_optional __swiftcall UsoEntity_common_MediaItem.getListPosition()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04F8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v14 - v6;
  uint64_t v8 = sub_25C56E950();
  if (v8)
  {
    sub_25C56EAF0();
    swift_release();
    uint64_t v9 = sub_25C56EB00();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
    {
      sub_25C55E72C((uint64_t)v7, (uint64_t)v5, &qword_26A5B04F8);
      int v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v5, v9);
      if (v11 == *MEMORY[0x263F72EC0])
      {
        char v12 = 12;
LABEL_10:
        *uint64_t v1 = v12;
        LOBYTE(v8) = sub_25C5462B8((uint64_t)v7, &qword_26A5B04F8);
        return (SiriAudioIntentUtils::CommonAudio::Attribute_optional)v8;
      }
      if (v11 == *MEMORY[0x263F72E48])
      {
        char v12 = 10;
        goto LABEL_10;
      }
      (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
    }
    char v12 = 15;
    goto LABEL_10;
  }
  *uint64_t v1 = 15;
  return (SiriAudioIntentUtils::CommonAudio::Attribute_optional)v8;
}

uint64_t sub_25C5617A8(uint64_t a1, uint64_t a2)
{
  if (!UsoEntity_common_MediaItem.isResolvedReference()())
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16)))
    {
      unint64_t v4 = sub_25C56E9F0();
      if (v4)
      {
        unint64_t v5 = v4;
        if (v4 >> 62) {
          goto LABEL_22;
        }
        for (uint64_t i = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_25C56EF50())
        {
          uint64_t v7 = 4;
          while (1)
          {
            uint64_t v8 = v7 - 4;
            if ((v5 & 0xC000000000000001) == 0) {
              break;
            }
            MEMORY[0x261189CD0](v7 - 4, v5);
            uint64_t v9 = v7 - 3;
            if (__OFADD__(v8, 1)) {
              goto LABEL_21;
            }
LABEL_18:
            sub_25C56E930();
            if (v11)
            {
              a2 = ((uint64_t (*)(uint64_t))sub_25C5617A8)(a1);
              swift_release();
              swift_release();
              if (a2)
              {
                swift_bridgeObjectRelease();
                return a2;
              }
            }
            else
            {
              swift_release();
            }
            ++v7;
            if (v9 == i) {
              goto LABEL_23;
            }
          }
          swift_retain();
          uint64_t v9 = v7 - 3;
          if (!__OFADD__(v8, 1)) {
            goto LABEL_18;
          }
LABEL_21:
          __break(1u);
LABEL_22:
          ;
        }
LABEL_23:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  swift_retain();
  return a2;
}

uint64_t sub_25C56190C(uint64_t a1, uint64_t a2)
{
  return sub_25C561B00(a1, a2, sub_25C54F69C, (uint64_t (*)(uint64_t))sub_25C56190C);
}

uint64_t sub_25C561938(uint64_t a1, uint64_t a2)
{
  if (sub_25C56EA40())
  {
    swift_release();
    swift_retain();
  }
  else
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16)))
    {
      unint64_t v4 = sub_25C56E9F0();
      if (v4)
      {
        unint64_t v5 = v4;
        if (v4 >> 62) {
          goto LABEL_23;
        }
        uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v6)
        {
LABEL_24:
          swift_bridgeObjectRelease();
          return 0;
        }
LABEL_10:
        uint64_t v7 = 4;
        while (1)
        {
          uint64_t v8 = v7 - 4;
          if ((v5 & 0xC000000000000001) != 0)
          {
            MEMORY[0x261189CD0](v7 - 4, v5);
            uint64_t v9 = v7 - 3;
            if (__OFADD__(v8, 1)) {
              goto LABEL_22;
            }
          }
          else
          {
            swift_retain();
            uint64_t v9 = v7 - 3;
            if (__OFADD__(v8, 1))
            {
LABEL_22:
              __break(1u);
LABEL_23:
              uint64_t v6 = sub_25C56EF50();
              if (!v6) {
                goto LABEL_24;
              }
              goto LABEL_10;
            }
          }
          sub_25C56E930();
          if (v11)
          {
            a2 = ((uint64_t (*)(uint64_t))sub_25C561938)(a1);
            swift_release();
            swift_release();
            if (a2)
            {
              swift_bridgeObjectRelease();
              return a2;
            }
          }
          else
          {
            swift_release();
          }
          ++v7;
          if (v9 == v6) {
            goto LABEL_24;
          }
        }
      }
    }
    return 0;
  }
  return a2;
}

uint64_t sub_25C561AA8(uint64_t a1, uint64_t a2)
{
  return sub_25C561B00(a1, a2, sub_25C54FDD8, (uint64_t (*)(uint64_t))sub_25C561AA8);
}

uint64_t sub_25C561AD4(uint64_t a1, uint64_t a2)
{
  return sub_25C561B00(a1, a2, (uint64_t (*)(uint64_t))sub_25C55221C, (uint64_t (*)(uint64_t))sub_25C561AD4);
}

uint64_t sub_25C561B00(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = a2;
  if ((a3(a2) & 1) == 0)
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16)))
    {
      unint64_t v7 = sub_25C56E9F0();
      if (v7)
      {
        unint64_t v8 = v7;
        if (v7 >> 62) {
          goto LABEL_22;
        }
        for (uint64_t i = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_25C56EF50())
        {
          uint64_t v10 = 4;
          while (1)
          {
            uint64_t v11 = v10 - 4;
            if ((v8 & 0xC000000000000001) == 0) {
              break;
            }
            MEMORY[0x261189CD0](v10 - 4, v8);
            uint64_t v12 = v10 - 3;
            if (__OFADD__(v11, 1)) {
              goto LABEL_21;
            }
LABEL_18:
            sub_25C56E930();
            if (v14)
            {
              uint64_t v5 = a4(a1);
              swift_release();
              swift_release();
              if (v5)
              {
                swift_bridgeObjectRelease();
                return v5;
              }
            }
            else
            {
              swift_release();
            }
            ++v10;
            if (v12 == i) {
              goto LABEL_23;
            }
          }
          swift_retain();
          uint64_t v12 = v10 - 3;
          if (!__OFADD__(v11, 1)) {
            goto LABEL_18;
          }
LABEL_21:
          __break(1u);
LABEL_22:
          ;
        }
LABEL_23:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  swift_retain();
  return v5;
}

uint64_t sub_25C561C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04A0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!sub_25C56E970())
  {
    uint64_t v8 = sub_25C56EB80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
LABEL_5:
    sub_25C5462B8((uint64_t)v6, &qword_26A5B04A0);
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16)))
    {
      unint64_t v9 = sub_25C56E9F0();
      if (v9)
      {
        unint64_t v10 = v9;
        if (v9 >> 62) {
          goto LABEL_24;
        }
        for (uint64_t i = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_25C56EF50())
        {
          uint64_t v12 = 4;
          while (1)
          {
            uint64_t v13 = v12 - 4;
            if ((v10 & 0xC000000000000001) == 0) {
              break;
            }
            MEMORY[0x261189CD0](v12 - 4, v10);
            uint64_t v14 = v12 - 3;
            if (__OFADD__(v13, 1)) {
              goto LABEL_23;
            }
LABEL_20:
            sub_25C56E930();
            if (v17)
            {
              a2 = sub_25C561C74(a1, v17);
              swift_release();
              swift_release();
              if (a2)
              {
                swift_bridgeObjectRelease();
                return a2;
              }
            }
            else
            {
              swift_release();
            }
            ++v12;
            if (v14 == i) {
              goto LABEL_25;
            }
          }
          swift_retain();
          uint64_t v14 = v12 - 3;
          if (!__OFADD__(v13, 1)) {
            goto LABEL_20;
          }
LABEL_23:
          __break(1u);
LABEL_24:
          ;
        }
LABEL_25:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  sub_25C56EB70();
  swift_release();
  uint64_t v7 = sub_25C56EB80();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1) {
    goto LABEL_5;
  }
  sub_25C5462B8((uint64_t)v6, &qword_26A5B04A0);
  swift_retain();
  return a2;
}

uint64_t UsoEntity_common_MediaItem.findFirst(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  if ((a2(v3) & 1) == 0)
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(void *)(a1 + 16)))
    {
      unint64_t v7 = sub_25C56E9F0();
      if (v7)
      {
        unint64_t v8 = v7;
        if (v7 >> 62) {
          goto LABEL_22;
        }
        for (uint64_t i = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_25C56EF50())
        {
          uint64_t v10 = 4;
          while (1)
          {
            uint64_t v11 = v10 - 4;
            if ((v8 & 0xC000000000000001) == 0) {
              break;
            }
            MEMORY[0x261189CD0](v10 - 4, v8);
            uint64_t v12 = v10 - 3;
            if (__OFADD__(v11, 1)) {
              goto LABEL_21;
            }
LABEL_18:
            sub_25C56E930();
            if (v15)
            {
              uint64_t v4 = UsoEntity_common_MediaItem.findFirst(options:with:)(a1, a2, a3);
              swift_release();
              swift_release();
              if (v4)
              {
                swift_bridgeObjectRelease();
                return v4;
              }
            }
            else
            {
              swift_release();
            }
            ++v10;
            if (v12 == i) {
              goto LABEL_23;
            }
          }
          swift_retain();
          uint64_t v12 = v10 - 3;
          if (!__OFADD__(v11, 1)) {
            goto LABEL_18;
          }
LABEL_21:
          __break(1u);
LABEL_22:
          ;
        }
LABEL_23:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  swift_retain();
  return v4;
}

uint64_t UsoEntity_common_MediaItem.identifiers(forNamespace:appBundleId:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = a3;
  uint64_t v39 = a2;
  uint64_t v4 = sub_25C56E920();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v39 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unsigned __int8 v49 = (char *)&v39 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v39 - v12;
  int v46 = *a1;
  uint64_t result = sub_25C56E8C0();
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v52 = MEMORY[0x263F8EE78];
  uint64_t v45 = *(void *)(result + 16);
  if (!v45)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    return v15;
  }
  unint64_t v16 = 0;
  uint64_t v17 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v41 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v50 = v5 + 16;
  uint64_t v43 = result;
  uint64_t v44 = v5;
  while (v16 < *(void *)(result + 16))
  {
    unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v47 = *(void *)(v5 + 72);
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v19(v13, result + v18 + v47 * v16, v4);
    uint64_t v20 = sub_25C56E910();
    uint64_t v22 = v21;
    char v51 = v46;
    unint64_t v23 = AudioUsoIntent.UsoNamespace.rawValue.getter();
    if (!v22)
    {
      swift_bridgeObjectRelease();
      uint64_t v25 = v49;
      v19(v49, (unint64_t)v13, v4);
      char v26 = 0;
      goto LABEL_18;
    }
    if (v20 == v23 && v22 == v24)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v19(v49, (unint64_t)v13, v4);
    }
    else
    {
      char v27 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v25 = v49;
      v19(v49, (unint64_t)v13, v4);
      char v26 = 0;
      if ((v27 & 1) == 0) {
        goto LABEL_18;
      }
    }
    if (sub_25C56E900() || v28 != 0xE000000000000000)
    {
      char v29 = sub_25C56EF90();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      char v29 = 1;
    }
    char v26 = v29 ^ 1;
    uint64_t v25 = v49;
LABEL_18:
    char v30 = *v17;
    (*v17)(v25, v4);
    if (v48)
    {
      uint64_t v31 = v40;
      v19(v40, (unint64_t)v13, v4);
      if (v26)
      {
        if (sub_25C56E8D0() == v39 && v32 == v48)
        {
          swift_bridgeObjectRelease();
          v30(v31, v4);
LABEL_26:
          uint64_t v35 = *v41;
          (*v41)(v42, v13, v4);
          uint64_t v36 = v52;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_25C564148(0, *(void *)(v36 + 16) + 1, 1);
            uint64_t v36 = v52;
          }
          unint64_t v38 = *(void *)(v36 + 16);
          unint64_t v37 = *(void *)(v36 + 24);
          if (v38 >= v37 >> 1)
          {
            sub_25C564148(v37 > 1, v38 + 1, 1);
            uint64_t v36 = v52;
          }
          *(void *)(v36 + 16) = v38 + 1;
          v35((char *)(v36 + v18 + v38 * v47), v42, v4);
          uint64_t v52 = v36;
          goto LABEL_5;
        }
        char v33 = v31;
        char v34 = sub_25C56EF90();
        swift_bridgeObjectRelease();
        v30(v33, v4);
        if (v34) {
          goto LABEL_26;
        }
      }
      else
      {
        v30(v31, v4);
      }
    }
    else if (v26)
    {
      goto LABEL_26;
    }
    v30(v13, v4);
LABEL_5:
    ++v16;
    uint64_t v5 = v44;
    uint64_t result = v43;
    if (v45 == v16)
    {
      uint64_t v15 = v52;
      goto LABEL_32;
    }
  }
  __break(1u);
  return result;
}

uint64_t Array<A>.identifiers(forNamespace:)(unsigned __int8 *a1, void (**a2)(unint64_t, uint64_t))
{
  uint64_t v4 = sub_25C56E920();
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unint64_t v7 = (unint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v37 - v8;
  uint64_t v45 = *a1;
  if ((unint64_t)a2 >> 62) {
    goto LABEL_87;
  }
  uint64_t v10 = *(void *)(((unint64_t)a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    if (v10)
    {
      if (v10 < 1)
      {
        __break(1u);
        JUMPOUT(0x25C562D28);
      }
      for (uint64_t i = 0; i != v10; ++i)
      {
        uint64_t v13 = v11;
        if (((unint64_t)a2 & 0xC000000000000001) != 0) {
          MEMORY[0x261189CD0](i, a2);
        }
        else {
          swift_retain();
        }
        uint64_t v14 = sub_25C56E8C0();
        swift_release();
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v11 = v13;
        }
        else {
          uint64_t v11 = sub_25C563C34(0, v13[2] + 1, 1, v13);
        }
        unint64_t v16 = v11[2];
        unint64_t v15 = v11[3];
        if (v16 >= v15 >> 1) {
          uint64_t v11 = sub_25C563C34((void *)(v15 > 1), v16 + 1, 1, v11);
        }
        v11[2] = v16 + 1;
        v11[v16 + 4] = v14;
      }
    }
    uint64_t v39 = v11;
    swift_bridgeObjectRelease();
    uint64_t v17 = v39;
    uint64_t v48 = MEMORY[0x263F8EE78];
    uint64_t v41 = v39[2];
    if (!v41) {
      break;
    }
    unint64_t v18 = 0;
    uint64_t v40 = v39 + 4;
    uint64_t v47 = v38 + 16;
    a2 = (void (**)(unint64_t, uint64_t))(v38 + 8);
    unint64_t v44 = (unint64_t)"";
    unint64_t v19 = v7;
    while (v18 < v17[2])
    {
      uint64_t v20 = v40[v18];
      uint64_t v21 = *(void *)(v20 + 16);
      if (!v21) {
        goto LABEL_20;
      }
      unint64_t v42 = v18;
      uint64_t v43 = v20;
      uint64_t v22 = v20 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80));
      uint64_t v46 = *(void *)(v38 + 72);
      unint64_t v7 = *(void *)(v38 + 16);
      swift_bridgeObjectRetain_n();
      while (2)
      {
        ((void (*)(char *, uint64_t, uint64_t))v7)(v9, v22, v4);
        uint64_t v24 = sub_25C56E910();
        unint64_t v26 = v44 | 0x8000000000000000;
        unint64_t v27 = 0xD000000000000012;
        switch(v45)
        {
          case 1:
            goto LABEL_67;
          case 2:
            unint64_t v27 = 0x6E6547636973756DLL;
            unint64_t v26 = 0xEA00000000006572;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 3:
            unint64_t v26 = 0xEF646F6F4D726579;
            goto LABEL_32;
          case 4:
            unint64_t v27 = 0xD000000000000013;
            uint64_t v28 = "mediaPlayerActivity";
            goto LABEL_66;
          case 5:
            unint64_t v27 = 0xD000000000000014;
            uint64_t v28 = "mediaPlayerRadioType";
            goto LABEL_66;
          case 6:
            unint64_t v27 = 0xD000000000000015;
            uint64_t v28 = "mediaPlayerAttributes";
            goto LABEL_66;
          case 7:
            unint64_t v27 = 0xD000000000000014;
            uint64_t v28 = "mediaPlayerReference";
            goto LABEL_66;
          case 8:
            unint64_t v27 = 0xD000000000000015;
            uint64_t v28 = "radioStationFrequency";
            goto LABEL_66;
          case 9:
            unint64_t v26 = 0xED0000656C746954;
            unint64_t v27 = 0x7473696C79616C70;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 10:
            unint64_t v27 = 0x5474736163646F70;
            goto LABEL_56;
          case 11:
            unint64_t v26 = 0xEE0064496369706FLL;
            unint64_t v27 = 0x5474736163646F70;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 12:
            unint64_t v26 = 0xEA00000000007265;
            unint64_t v27 = 0x696669746E656469;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 13:
            unint64_t v26 = 0xE400000000000000;
            unint64_t v27 = 1701605234;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 14:
            unint64_t v27 = 0x6C646E7542707061;
            unint64_t v26 = 0xEB00000000644965;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 15:
            unint64_t v27 = 0xD000000000000019;
            uint64_t v28 = "resolved_reference_source";
            goto LABEL_66;
          case 16:
            unint64_t v26 = 0xEB0000000064496DLL;
            unint64_t v27 = 0x657449616964656DLL;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 17:
            unint64_t v27 = 0xD000000000000010;
            uint64_t v28 = "appPlaylistTitle";
            goto LABEL_66;
          case 18:
            uint64_t v28 = "appPlaylistTitleId";
            goto LABEL_66;
          case 19:
            unint64_t v27 = 0x54776F6853707061;
LABEL_56:
            unint64_t v26 = 0xEC000000656C7469;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 20:
            unint64_t v26 = 0xEE006449656C7469;
            unint64_t v27 = 0x54776F6853707061;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          case 21:
            unint64_t v27 = 0xD000000000000011;
            uint64_t v28 = "appAudiobookTitle";
            goto LABEL_66;
          case 22:
            unint64_t v27 = 0xD000000000000013;
            uint64_t v28 = "appAudiobookTitleId";
            goto LABEL_66;
          case 23:
            uint64_t v28 = "appMusicArtistName";
            goto LABEL_66;
          case 24:
            unint64_t v27 = 0xD000000000000014;
            uint64_t v28 = "appMusicArtistNameId";
            goto LABEL_66;
          case 25:
            uint64_t v28 = "appAudiobookAuthor";
            goto LABEL_66;
          case 26:
            unint64_t v27 = 0xD000000000000014;
            uint64_t v28 = "appAudiobookAuthorId";
LABEL_66:
            unint64_t v26 = (unint64_t)(v28 - 32) | 0x8000000000000000;
LABEL_67:
            if (v25) {
              goto LABEL_68;
            }
            goto LABEL_24;
          case 27:
            unint64_t v26 = 0xE700000000000000;
            unint64_t v27 = 0x64695F6D657469;
            if (!v25) {
              goto LABEL_24;
            }
            goto LABEL_68;
          default:
            unint64_t v26 = 0xEF6E756F4E726579;
LABEL_32:
            unint64_t v27 = 0x616C50616964656DLL;
            if (!v25)
            {
LABEL_24:
              swift_bridgeObjectRelease();
              ((void (*)(unint64_t, char *, uint64_t))v7)(v19, v9, v4);
              goto LABEL_25;
            }
LABEL_68:
            if (v24 != v27 || v25 != v26)
            {
              char v29 = sub_25C56EF90();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              ((void (*)(unint64_t, char *, uint64_t))v7)(v19, v9, v4);
              if (v29) {
                goto LABEL_72;
              }
LABEL_25:
              unint64_t v23 = *a2;
              (*a2)(v19, v4);
              v23((unint64_t)v9, v4);
LABEL_26:
              v22 += v46;
              if (!--v21)
              {
                swift_bridgeObjectRelease_n();
                uint64_t v17 = v39;
                goto LABEL_19;
              }
              continue;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            ((void (*)(unint64_t, char *, uint64_t))v7)(v19, v9, v4);
LABEL_72:
            if (!sub_25C56E900() && v30 == 0xE000000000000000)
            {
              swift_bridgeObjectRelease();
              goto LABEL_25;
            }
            char v31 = sub_25C56EF90();
            swift_bridgeObjectRelease();
            uint64_t v32 = *a2;
            (*a2)(v19, v4);
            v32((unint64_t)v9, v4);
            if (v31) {
              goto LABEL_26;
            }
            swift_bridgeObjectRelease();
            uint64_t v33 = v48;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_25C564168(0, *(void *)(v33 + 16) + 1, 1);
              uint64_t v33 = v48;
            }
            uint64_t v17 = v39;
            unint64_t v7 = *(void *)(v33 + 16);
            unint64_t v35 = *(void *)(v33 + 24);
            if (v7 >= v35 >> 1)
            {
              sub_25C564168(v35 > 1, v7 + 1, 1);
              uint64_t v17 = v39;
              uint64_t v33 = v48;
            }
            *(void *)(v33 + 16) = v7 + 1;
            *(void *)(v33 + 8 * v7 + 32) = v43;
LABEL_19:
            unint64_t v18 = v42;
LABEL_20:
            if (++v18 == v41)
            {
              swift_bridgeObjectRelease();
              return v48;
            }
            break;
        }
        break;
      }
    }
    __break(1u);
LABEL_87:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25C56EF50();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isMoreOf()()
{
  uint64_t v0 = sub_25C56EAA0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v24 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04B8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04C0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v23 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v23 - v13;
  if (sub_25C56E940())
  {
    sub_25C56EA90();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v14, 1, 1, v0);
  }
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v12, *MEMORY[0x263F72C90], v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v12, 0, 1, v0);
  uint64_t v15 = (uint64_t)&v5[*(int *)(v3 + 48)];
  sub_25C55E72C((uint64_t)v14, (uint64_t)v5, &qword_26A5B04C0);
  sub_25C55E72C((uint64_t)v12, v15, &qword_26A5B04C0);
  unint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v16((uint64_t)v5, 1, v0) == 1)
  {
    sub_25C5462B8((uint64_t)v12, &qword_26A5B04C0);
    sub_25C5462B8((uint64_t)v14, &qword_26A5B04C0);
    int v17 = v16(v15, 1, v0);
    if (v17 == 1) {
      unint64_t v18 = &qword_26A5B04C0;
    }
    else {
      unint64_t v18 = &qword_26A5B04B8;
    }
    if (v17 == 1) {
      char v19 = -1;
    }
    else {
      char v19 = 0;
    }
  }
  else
  {
    sub_25C55E72C((uint64_t)v5, (uint64_t)v9, &qword_26A5B04C0);
    if (v16(v15, 1, v0) == 1)
    {
      sub_25C5462B8((uint64_t)v12, &qword_26A5B04C0);
      sub_25C5462B8((uint64_t)v14, &qword_26A5B04C0);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
      char v19 = 0;
      unint64_t v18 = &qword_26A5B04B8;
    }
    else
    {
      uint64_t v20 = v24;
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v24, v15, v0);
      sub_25C5649D4(&qword_26A5B04D0, MEMORY[0x263F72CB0]);
      char v19 = sub_25C56ED90();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v1 + 8);
      v21(v20, v0);
      unint64_t v18 = &qword_26A5B04C0;
      sub_25C5462B8((uint64_t)v12, &qword_26A5B04C0);
      sub_25C5462B8((uint64_t)v14, &qword_26A5B04C0);
      v21(v9, v0);
    }
  }
  sub_25C5462B8((uint64_t)v5, v18);
  return v19 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isDifferentThan()()
{
  uint64_t v0 = sub_25C56EAC0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04A8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B04B0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v26 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v26 - v14;
  uint64_t v16 = sub_25C56E980();
  unint64_t v27 = v3;
  if (v16 && (uint64_t v17 = sub_25C56EC20(), swift_release(), v17))
  {
    sub_25C56EAB0();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v15, 1, 1, v0);
  }
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v13, *MEMORY[0x263F72CC8], v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  uint64_t v18 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_25C55E72C((uint64_t)v15, (uint64_t)v6, &qword_26A5B04B0);
  sub_25C55E72C((uint64_t)v13, v18, &qword_26A5B04B0);
  char v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v19((uint64_t)v6, 1, v0) == 1)
  {
    sub_25C5462B8((uint64_t)v13, &qword_26A5B04B0);
    sub_25C5462B8((uint64_t)v15, &qword_26A5B04B0);
    int v20 = v19(v18, 1, v0);
    if (v20 == 1) {
      uint64_t v21 = &qword_26A5B04B0;
    }
    else {
      uint64_t v21 = &qword_26A5B04A8;
    }
    if (v20 == 1) {
      char v22 = -1;
    }
    else {
      char v22 = 0;
    }
  }
  else
  {
    sub_25C55E72C((uint64_t)v6, (uint64_t)v10, &qword_26A5B04B0);
    if (v19(v18, 1, v0) == 1)
    {
      sub_25C5462B8((uint64_t)v13, &qword_26A5B04B0);
      sub_25C5462B8((uint64_t)v15, &qword_26A5B04B0);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      char v22 = 0;
      uint64_t v21 = &qword_26A5B04A8;
    }
    else
    {
      uint64_t v23 = v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v27, v18, v0);
      sub_25C5649D4(&qword_26A5B04C8, MEMORY[0x263F72CD0]);
      char v22 = sub_25C56ED90();
      uint64_t v24 = *(void (**)(char *, uint64_t))(v1 + 8);
      v24(v23, v0);
      uint64_t v21 = &qword_26A5B04B0;
      sub_25C5462B8((uint64_t)v13, &qword_26A5B04B0);
      sub_25C5462B8((uint64_t)v15, &qword_26A5B04B0);
      v24(v10, v0);
    }
  }
  sub_25C5462B8((uint64_t)v6, v21);
  return v22 & 1;
}

unint64_t UsoEntity_common_MediaItem.findAll(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a2(v3))
  {
    uint64_t v7 = swift_retain();
    MEMORY[0x261189BE0](v7);
    if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25C56EE10();
    }
    sub_25C56EE20();
    sub_25C56EE00();
  }
  if (UsoEntity_common_MediaItem.isResolvedReference()() && !*(void *)(a1 + 16)) {
    return v14;
  }
  unint64_t result = sub_25C56E9F0();
  if (!result) {
    return v14;
  }
  unint64_t v9 = result;
  if (!(result >> 62))
  {
    uint64_t v10 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_10;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    return v14;
  }
  unint64_t result = sub_25C56EF50();
  uint64_t v10 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_10:
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0) {
        MEMORY[0x261189CD0](i, v9);
      }
      else {
        swift_retain();
      }
      sub_25C56E930();
      swift_release();
      if (v13)
      {
        sub_25C56E930();
        unint64_t v12 = UsoEntity_common_MediaItem.findAll(options:with:)(a1, a2, a3);
        swift_release();
        sub_25C5637B4(v12);
      }
      swift_release();
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C5637B4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25C56EF50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25C56EF50();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x261189CE0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_25C564554(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25C56EF50();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_25C56EE00();
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.hasMediaTypeOnly()()
{
  uint64_t v0 = sub_25C56EA00();
  swift_release();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = sub_25C56EA20();
  swift_release();
  if (v1) {
    return 0;
  }
  uint64_t v2 = sub_25C56E970();
  swift_release();
  if (v2) {
    return 0;
  }
  uint64_t v3 = sub_25C56E940();
  swift_release();
  if (v3) {
    return 0;
  }
  uint64_t v4 = sub_25C56E9F0();
  swift_bridgeObjectRelease();
  if (v4) {
    return 0;
  }
  uint64_t v5 = sub_25C56E960();
  swift_release();
  if (v5) {
    return 0;
  }
  if (sub_25C56E950())
  {
    swift_release();
    return 0;
  }
  return 1;
}

void *sub_25C563A14(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0568);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      BOOL v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      BOOL v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25C564AC0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25C563B24(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0590);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      BOOL v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      BOOL v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25C564BB4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25C563C34(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0570);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      BOOL v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      BOOL v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25C564CC0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25C563D44(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0580);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25C564DCC(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25C563E40(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0560);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25C564DCC(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25C563F3C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0558);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      BOOL v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      BOOL v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25C564EB4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25C56404C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0550);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25C564DCC(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C564148(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C564188(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25C564168(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25C5643C8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25C564188(char a1, int64_t a2, char a3, void *a4)
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
    BOOL v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0588);
  uint64_t v10 = *(void *)(sub_25C56E920() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(sub_25C56E920() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  char v19 = (char *)a4 + v17;
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
  uint64_t result = sub_25C56EF70();
  __break(1u);
  return result;
}

uint64_t sub_25C5643C8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0570);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0578);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25C56EF70();
  __break(1u);
  return result;
}

uint64_t sub_25C564554(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25C56EF50();
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
    uint64_t v10 = sub_25C56EF50();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25C564A1C();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0540);
          uint64_t v12 = sub_25C564758(v16, i, a3);
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
    sub_25C56EA50();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25C56EF70();
  __break(1u);
  return result;
}

void (*sub_25C564758(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25C564808(v6, a2, a3);
  return sub_25C5647C0;
}

void sub_25C5647C0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_25C564808(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x261189CD0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_25C564888;
  }
  __break(1u);
  return result;
}

uint64_t sub_25C564888()
{
  return swift_release();
}

uint64_t sub_25C564890(unint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_12:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25C56EF50();
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v9 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          MEMORY[0x261189CD0](i - 4, a1);
          uint64_t v10 = i - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_11;
          }
        }
        else
        {
          swift_retain();
          uint64_t v10 = i - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_11:
            __break(1u);
            goto LABEL_12;
          }
        }
        unint64_t v11 = UsoEntity_common_MediaItem.findAll(options:with:)(a2, a3, a4);
        swift_release();
        sub_25C5637B4(v11);
        if (v10 == v7)
        {
          swift_bridgeObjectRelease();
          return v14;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25C5649D4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25C564A1C()
{
  unint64_t result = qword_26A5B0548;
  if (!qword_26A5B0548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A5B0540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0548);
  }
  return result;
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

uint64_t sub_25C564AC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25C56EF70();
  __break(1u);
  return result;
}

uint64_t sub_25C564BB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0598);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25C56EF70();
  __break(1u);
  return result;
}

uint64_t sub_25C564CC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0578);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25C56EF70();
  __break(1u);
  return result;
}

char *sub_25C564DCC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_25C56EF70();
  __break(1u);
  return result;
}

char *sub_25C564EB4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25C56EF70();
  __break(1u);
  return result;
}

uint64_t sub_25C564FA4(uint64_t a1, uint64_t a2)
{
  return sub_25C5652D8(a1, a2, (uint64_t (*)(void))AudioUsoIntent.UsoNamespace.rawValue.getter);
}

uint64_t sub_25C564FBC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000010;
  }
  else {
    unint64_t v3 = 0x6E456F4E5F6F7375;
  }
  if (v2) {
    unint64_t v4 = 0xEC00000079746974;
  }
  else {
    unint64_t v4 = 0x800000025C5708A0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000010;
  }
  else {
    unint64_t v5 = 0x6E456F4E5F6F7375;
  }
  if (a2) {
    unint64_t v6 = 0x800000025C5708A0;
  }
  else {
    unint64_t v6 = 0xEC00000079746974;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25C56506C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x696E696665646E69;
  }
  else {
    uint64_t v3 = 0x6574696E69666564;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0xEA00000000006574;
  }
  if (a2) {
    uint64_t v5 = 0x696E696665646E69;
  }
  else {
    uint64_t v5 = 0x6574696E69666564;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000006574;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25C565114(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 28001;
  }
  else {
    uint64_t v2 = 28006;
  }
  if (a2) {
    uint64_t v3 = 28001;
  }
  else {
    uint64_t v3 = 28006;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_25C56517C(uint64_t a1, uint64_t a2)
{
  return sub_25C5652D8(a1, a2, (uint64_t (*)(void))CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_25C565194(uint64_t a1, uint64_t a2)
{
  return sub_25C5652D8(a1, a2, (uint64_t (*)(void))CommonAudio.Attribute.rawValue.getter);
}

uint64_t sub_25C5651AC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6E65726566666964;
  }
  else {
    uint64_t v3 = 0x664F65726F6DLL;
  }
  if (v2) {
    unint64_t v4 = 0xE600000000000000;
  }
  else {
    unint64_t v4 = 0xED00006E61685474;
  }
  if (a2) {
    uint64_t v5 = 0x6E65726566666964;
  }
  else {
    uint64_t v5 = 0x664F65726F6DLL;
  }
  if (a2) {
    unint64_t v6 = 0xED00006E61685474;
  }
  else {
    unint64_t v6 = 0xE600000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25C565258(char a1, char a2)
{
  if (*(void *)&a1920s_1[8 * a1] == *(void *)&a1920s_1[8 * a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_25C5652C0(uint64_t a1, uint64_t a2)
{
  return sub_25C5652D8(a1, a2, (uint64_t (*)(void))CommonAudio.Verb.rawValue.getter);
}

uint64_t sub_25C5652D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25C56537C(char a1, char a2)
{
  if (*(void *)&aPopular_1[8 * a1] == *(void *)&aPopular_1[8 * a2]
    && *(void *)&aMediocregreate[8 * a1 + 16] == *(void *)&aMediocregreate[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25C565404(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x317374616562;
  }
  else {
    uint64_t v3 = 0x7972617262696CLL;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0xE600000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x317374616562;
  }
  else {
    uint64_t v5 = 0x7972617262696CLL;
  }
  if (a2) {
    unint64_t v6 = 0xE600000000000000;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25C5654A4(char a1, char a2)
{
  if (qword_25C56F8C0[a1] == qword_25C56F8C0[a2] && qword_25C56F8E0[a1] == qword_25C56F8E0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_25C56EF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25C56552C(char a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (2)
  {
    uint64_t v6 = a2 + v5++;
    unint64_t v7 = 0x800000025C570CD0;
    uint64_t v8 = 0xD000000000000015;
    switch(*(unsigned char *)(v6 + 32))
    {
      case 1:
        unint64_t v7 = 0xE600000000000000;
        uint64_t v8 = 0x747369747261;
        break;
      case 2:
        unint64_t v7 = 0xE500000000000000;
        uint64_t v8 = 0x6F65646976;
        break;
      case 3:
        unint64_t v7 = 0xE800000000000000;
        uint64_t v8 = 0x7473696C79616C70;
        break;
      case 4:
        unint64_t v7 = 0xE700000000000000;
        uint64_t v9 = 0x6F6974617473;
        goto LABEL_32;
      case 5:
        break;
      case 6:
        uint64_t v8 = 0x6F68536F69646172;
        unint64_t v7 = 0xE900000000000077;
        break;
      case 7:
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1735290739;
        break;
      case 8:
        unint64_t v7 = 0xE700000000000000;
        uint64_t v8 = 0x5573656E755469;
        break;
      case 9:
        unint64_t v7 = 0xE700000000000000;
        uint64_t v8 = 0x74736163646F70;
        break;
      case 0xA:
        unint64_t v7 = 0xEA00000000006F65;
        uint64_t v8 = 0x646956636973756DLL;
        break;
      case 0xB:
        unint64_t v7 = 0xE500000000000000;
        uint64_t v8 = 0x636973756DLL;
        break;
      case 0xC:
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1937204590;
        break;
      case 0xD:
        unint64_t v7 = 0xE600000000000000;
        uint64_t v8 = 0x776F68537674;
        break;
      case 0xE:
        unint64_t v7 = 0xE500000000000000;
        uint64_t v8 = 0x6D75626C61;
        break;
      case 0xF:
        unint64_t v7 = 0xE800000000000000;
        uint64_t v8 = 0x656E6F74676E6972;
        break;
      case 0x10:
        unint64_t v7 = 0xE200000000000000;
        uint64_t v8 = 28780;
        break;
      case 0x11:
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 2003789939;
        break;
      case 0x12:
        unint64_t v7 = 0xEC0000006E6F6974;
        uint64_t v8 = 0x6174536F69646172;
        break;
      case 0x13:
        unint64_t v7 = 0xE200000000000000;
        uint64_t v8 = 28773;
        break;
      case 0x14:
        unint64_t v7 = 0xE600000000000000;
        uint64_t v8 = 0x656C676E6973;
        break;
      case 0x15:
        unint64_t v7 = 0xE700000000000000;
        uint64_t v8 = 0x65646F73697065;
        break;
      case 0x16:
        unint64_t v7 = 0xEE006E6F69746174;
        uint64_t v8 = 0x5374736163646F70;
        break;
      case 0x17:
        unint64_t v7 = 0xE600000000000000;
        uint64_t v8 = 0x73646E756F73;
        break;
      case 0x18:
        unint64_t v7 = 0xEB000000006E6F69;
        uint64_t v8 = 0x74616C69706D6F63;
        break;
      case 0x19:
        unint64_t v7 = 0xE500000000000000;
        uint64_t v8 = 0x6569766F6DLL;
        break;
      case 0x1A:
        uint64_t v8 = 0x6F6F426F69647561;
        unint64_t v7 = 0xE90000000000006BLL;
        break;
      case 0x1B:
        unint64_t v7 = 0xED00007473696C79;
        uint64_t v8 = 0x616C50636973756DLL;
        break;
      case 0x1C:
        unint64_t v7 = 0xE700000000000000;
        uint64_t v9 = 0x776F6E6B6E75;
LABEL_32:
        uint64_t v8 = v9 & 0xFFFFFFFFFFFFLL | 0x6E000000000000;
        break;
      default:
        unint64_t v7 = 0xE500000000000000;
        uint64_t v8 = 0x65726E6567;
        break;
    }
    unint64_t v10 = 0x800000025C570CD0;
    unint64_t v11 = 0xD000000000000015;
    switch(a1)
    {
      case 1:
        unint64_t v10 = 0xE600000000000000;
        if (v8 == 0x747369747261) {
          goto LABEL_87;
        }
        goto LABEL_88;
      case 2:
        unint64_t v10 = 0xE500000000000000;
        if (v8 != 0x6F65646976) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 3:
        unint64_t v10 = 0xE800000000000000;
        if (v8 != 0x7473696C79616C70) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 4:
        unint64_t v10 = 0xE700000000000000;
        uint64_t v13 = 0x6F6974617473;
        goto LABEL_92;
      case 5:
        goto LABEL_86;
      case 6:
        unint64_t v10 = 0xE900000000000077;
        if (v8 != 0x6F68536F69646172) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 7:
        unint64_t v10 = 0xE400000000000000;
        if (v8 != 1735290739) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 8:
        unint64_t v10 = 0xE700000000000000;
        if (v8 != 0x5573656E755469) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 9:
        unint64_t v10 = 0xE700000000000000;
        if (v8 != 0x74736163646F70) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 10:
        unint64_t v10 = 0xEA00000000006F65;
        if (v8 != 0x646956636973756DLL) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 11:
        unint64_t v10 = 0xE500000000000000;
        if (v8 != 0x636973756DLL) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 12:
        unint64_t v10 = 0xE400000000000000;
        if (v8 != 1937204590) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 13:
        unint64_t v10 = 0xE600000000000000;
        if (v8 != 0x776F68537674) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 14:
        unint64_t v10 = 0xE500000000000000;
        if (v8 != 0x6D75626C61) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 15:
        unint64_t v10 = 0xE800000000000000;
        if (v8 != 0x656E6F74676E6972) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 16:
        unint64_t v10 = 0xE200000000000000;
        if (v8 != 28780) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 17:
        unint64_t v10 = 0xE400000000000000;
        if (v8 != 2003789939) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 18:
        unint64_t v10 = 0xEC0000006E6F6974;
        if (v8 != 0x6174536F69646172) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 19:
        unint64_t v10 = 0xE200000000000000;
        if (v8 != 28773) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 20:
        unint64_t v10 = 0xE600000000000000;
        if (v8 != 0x656C676E6973) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 21:
        unint64_t v10 = 0xE700000000000000;
        if (v8 != 0x65646F73697065) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 22:
        unint64_t v10 = 0xEE006E6F69746174;
        if (v8 != 0x5374736163646F70) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 23:
        unint64_t v10 = 0xE600000000000000;
        if (v8 != 0x73646E756F73) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 24:
        unint64_t v10 = 0xEB000000006E6F69;
        if (v8 != 0x74616C69706D6F63) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 25:
        unint64_t v10 = 0xE500000000000000;
        uint64_t v12 = 1769369453;
        goto LABEL_81;
      case 26:
        unint64_t v10 = 0xE90000000000006BLL;
        if (v8 != 0x6F6F426F69647561) {
          goto LABEL_88;
        }
        goto LABEL_87;
      case 27:
        unint64_t v10 = 0xED00007473696C79;
        unint64_t v11 = 0x616C50636973756DLL;
LABEL_86:
        if (v8 == v11) {
          goto LABEL_87;
        }
        goto LABEL_88;
      case 28:
        unint64_t v10 = 0xE700000000000000;
        uint64_t v13 = 0x776F6E6B6E75;
LABEL_92:
        if (v8 != (v13 & 0xFFFFFFFFFFFFLL | 0x6E000000000000)) {
          goto LABEL_88;
        }
        goto LABEL_87;
      default:
        unint64_t v10 = 0xE500000000000000;
        uint64_t v12 = 1919837543;
LABEL_81:
        if (v8 != (v12 & 0xFFFF0000FFFFFFFFLL | 0x6500000000)) {
          goto LABEL_88;
        }
LABEL_87:
        if (v7 != v10)
        {
LABEL_88:
          char v14 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v14) {
            goto LABEL_95;
          }
          if (v2 == v5)
          {
            swift_bridgeObjectRelease();
            return 0;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_95:
        swift_bridgeObjectRelease();
        return 1;
    }
  }
}

Swift::Bool __swiftcall AudioIntent.hasResolvedReference()()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 272))();
  if (v1) {
    swift_release();
  }
  return v1 != 0;
}

Swift::Bool __swiftcall AudioIntent.isReferringToCurrentlyPlayingForAdd()()
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  uint64_t v6 = *(void *)(v0 - 8);
  uint64_t v7 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  uint64_t v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = &v24[-v11];
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(v13 + 296))(&v25, v10);
  if (v25 == 19)
  {
    return 0;
  }
  else
  {
    v24[14] = v25;
    v24[13] = 7;
    unint64_t v15 = CommonAudio.Verb.rawValue.getter();
    uint64_t v17 = v16;
    if (v15 == CommonAudio.Verb.rawValue.getter() && v17 == v18)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v19 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v14 = 0;
      if ((v19 & 1) == 0) {
        return v14;
      }
    }
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 272))(v5, v4);
    swift_release();
    uint64_t v21 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16);
    v21(v12, v3, v5);
    if (v20) {
      LOBYTE(v20) = AudioIntent.isWithoutTitlesAndArtist()();
    }
    unint64_t v22 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
    v22(v12, v5);
    v21(v9, v3, v5);
    BOOL v14 = (v20 & 1) != 0 || AudioIntent.isWithoutTitlesAndArtistAndGenre()();
    v22(v9, v5);
  }
  return v14;
}

Swift::Bool __swiftcall AudioIntent.isWithoutTitlesAndArtist()()
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  uint64_t v6 = *(void *)(v0 - 8);
  uint64_t v7 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  uint64_t v24 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  BOOL v14 = (char *)&v23 - v13;
  uint64_t v16 = *(void *)((*(uint64_t (**)(uint64_t))(v15 + 136))(v12) + 16);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v17(v14, v3, v5);
  if (v16)
  {
    LODWORD(v18) = 0;
  }
  else
  {
    uint64_t v18 = *(void *)(v4[25](v5, v4) + 16);
    swift_bridgeObjectRelease();
    LODWORD(v18) = v18 == 0;
  }
  char v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v14, v5);
  v17(v11, v3, v5);
  if (v18)
  {
    uint64_t v20 = *(void *)(v4[13](v5, v4) + 16);
    swift_bridgeObjectRelease();
    v19(v11, v5);
    uint64_t v21 = v24;
    v17(v24, v3, v5);
    if (v20)
    {
      LOBYTE(v18) = 0;
    }
    else
    {
      uint64_t v18 = *(void *)(v4[3](v5, v4) + 16);
      swift_bridgeObjectRelease();
      LOBYTE(v18) = v18 == 0;
    }
  }
  else
  {
    v19(v11, v5);
    uint64_t v21 = v24;
    v17(v24, v3, v5);
  }
  v19(v21, v5);
  return v18;
}

Swift::Bool __swiftcall AudioIntent.isWithoutTitlesAndArtistAndGenre()()
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  uint64_t v6 = *(void *)(v0 - 8);
  uint64_t v7 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  uint64_t v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v24[-v10];
  Swift::Bool v12 = AudioIntent.isWithoutTitlesAndArtist()();
  uint64_t v13 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16);
  v13(v11, v3, v5);
  if (v12)
  {
    uint64_t v14 = *(void *)((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 152))(v5, v4) + 16);
    swift_bridgeObjectRelease();
    BOOL v15 = v14 == 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  uint64_t v16 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v16(v11, v5);
  v13(v9, v3, v5);
  if (v15)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 168))(&v25, v5, v4);
    if (v25 == 29)
    {
      char v17 = 0;
    }
    else
    {
      v24[14] = v25;
      v24[13] = 0;
      unint64_t v19 = CommonAudio.MediaType.rawValue.getter();
      uint64_t v21 = v20;
      if (v19 == CommonAudio.MediaType.rawValue.getter() && v21 == v22) {
        char v17 = 1;
      }
      else {
        char v17 = sub_25C56EF90();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v16(v9, v5);
    char v18 = v17 ^ 1;
  }
  else
  {
    v16(v9, v5);
    char v18 = 0;
  }
  return v18 & 1;
}

Swift::Bool __swiftcall AudioIntent.isBeats1Only()()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(v0 - 8);
  ((void (*)())MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::Bool v6 = AudioIntent.hasBeats1ItemOrRadioStationNameOnly()();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  BOOL v7 = v6 || AudioIntent.hasBeats1NounOnly()();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

Swift::Bool __swiftcall AudioIntent.hasBeats1ItemOrRadioStationNameOnly()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = (void *)(*(uint64_t (**)(void))(v1 + 136))();
  if (v4[2])
  {
    uint64_t v6 = v4[4];
    unint64_t v5 = v4[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  BOOL v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 248))(v3, v2);
  if (v7[2])
  {
    uint64_t v9 = v7[4];
    unint64_t v8 = v7[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = v5 & 0x2000000000000000;
  uint64_t v11 = HIBYTE(v5) & 0xF;
  uint64_t v12 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v5 & 0x2000000000000000) != 0) {
    uint64_t v13 = HIBYTE(v5) & 0xF;
  }
  else {
    uint64_t v13 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (v13)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = v8 & 0x2000000000000000;
    uint64_t v11 = HIBYTE(v8) & 0xF;
    uint64_t v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v10) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v12;
  }
  if (v14)
  {
    uint64_t v15 = sub_25C56EDB0();
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    if (qword_26A5B03C8 != -1) {
      swift_once();
    }
    if (v15 == sub_25C56EDB0() && v17 == v18) {
      char v19 = 1;
    }
    else {
      char v19 = sub_25C56EF90();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = 0;
  }
  swift_bridgeObjectRelease();
  return v19 & 1;
}

Swift::Bool __swiftcall AudioIntent.hasBeats1NounOnly()()
{
  uint64_t v3 = v1;
  uint64_t v4 = v0;
  uint64_t v5 = *(void *)(v0 - 8);
  uint64_t v6 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))(v9 + 136))(v6);
  if (v10[2])
  {
    uint64_t v12 = v10[4];
    unint64_t v11 = v10[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v13 = v12 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    unint64_t v11 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  if ((v11 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(v11) & 0xF;
  }
  else {
    uint64_t v14 = v13;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, v4);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    char v15 = 0;
  }
  else
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 208))(&v18, v4, v3);
    if (v18 == 2)
    {
      char v15 = 0;
    }
    else
    {
      if (v18) {
        char v15 = 1;
      }
      else {
        char v15 = sub_25C56EF90();
      }
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return v15 & 1;
}

Swift::Bool __swiftcall AudioIntent.isReferencedPlayRequest()()
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  uint64_t v6 = *(void *)(v0 - 8);
  uint64_t v7 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  char v15 = (char *)&v28 - v14;
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(v16 + 296))(&v32, v13);
  if (v32 == 19)
  {
    char v17 = 0;
  }
  else
  {
    uint64_t v28 = v9;
    char v30 = v32;
    char v29 = 0;
    unint64_t v18 = CommonAudio.Verb.rawValue.getter();
    uint64_t v20 = v19;
    if (v18 == CommonAudio.Verb.rawValue.getter() && v20 == v21) {
      char v17 = 1;
    }
    else {
      char v17 = sub_25C56EF90();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v28;
  }
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v22(v15, v3, v5);
  if ((v17 & 1) == 0)
  {
    uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
    v23(v15, v5);
    v22(v12, v3, v5);
LABEL_12:
    v23(v12, v5);
    LOBYTE(v25) = 0;
    return v25;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 264))(&v31, v5, v4);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v15, v5);
  int v24 = v31;
  v22(v12, v3, v5);
  if (v24 == 2) {
    goto LABEL_12;
  }
  v22(v9, (uint64_t)v12, v5);
  type metadata accessor for AudioUsoIntent();
  if (swift_dynamicCast())
  {
    unint64_t v25 = sub_25C5482DC();
    swift_release();
    if (v25)
    {
      if (v25 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_25C56EF50();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      LOBYTE(v25) = v26 != 0;
    }
  }
  else
  {
    LOBYTE(v25) = 0;
  }
  v23(v12, v5);
  return v25;
}

Swift::Bool __swiftcall AudioIntent.isPlayRequest()()
{
  void (*v21)(uint64_t *__return_ptr, uint64_t);
  int v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  char *v28;
  char *v29;
  char v30;
  uint64_t v32;
  void (*v33)(uint64_t *__return_ptr, uint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t *__return_ptr, uint64_t);
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  void (*v66)(char *, uint64_t, uint64_t);
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  uint64_t v75;

  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v0;
  uint64_t v6 = *(void *)(v0 - 8);
  uint64_t v7 = v6;
  uint64_t v8 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  unint64_t v63 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v62 = (char *)&v57 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v65 = (char *)&v57 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v64 = (char *)&v57 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v57 - v17;
  uint64_t v20 = v19 + 296;
  uint64_t v21 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v19 + 296);
  v21((uint64_t *)((char *)&v75 + 4), v16);
  uint64_t v22 = BYTE4(v75);
  char v66 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v66(v18, v3, v5);
  if (v22 != 19)
  {
    unint64_t v58 = v4;
    BOOL v59 = v21;
    unint64_t v61 = v20;
    ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v21)((uint64_t *)((char *)&v75 + 3), v5, v4);
    unint64_t v60 = v6;
    if (BYTE3(v75) == 19)
    {
      uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
      v23(v18, v5);
      unint64_t v25 = v64;
      int v24 = v3;
      v66(v64, v3, v5);
    }
    else
    {
      uint64_t v68 = BYTE3(v75);
      char v67 = 0;
      char v34 = CommonAudio.Verb.rawValue.getter();
      uint64_t v36 = v35;
      uint64_t v37 = CommonAudio.Verb.rawValue.getter();
      int v24 = v3;
      unint64_t v25 = v64;
      if (v34 == v37 && v36 == v38)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
        v23(v18, v5);
        goto LABEL_3;
      }
      uint64_t v43 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
      v23(v18, v5);
      uint64_t v26 = v66;
      v66(v25, v3, v5);
      if (v43) {
        goto LABEL_4;
      }
    }
    uint64_t v32 = v58;
    uint64_t v33 = (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v59;
    ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v59)((uint64_t *)((char *)&v75 + 2), v5, v58);
    if (BYTE2(v75) == 19)
    {
      v23(v25, v5);
      char v29 = v65;
      v66(v65, v24, v5);
    }
    else
    {
      uint64_t v70 = BYTE2(v75);
      uint64_t v69 = 5;
      uint64_t v39 = CommonAudio.Verb.rawValue.getter();
      uint64_t v41 = v40;
      if (v39 == CommonAudio.Verb.rawValue.getter() && v41 == v42)
      {
        swift_bridgeObjectRelease_n();
        v23(v25, v5);
        uint64_t v28 = v62;
        unint64_t v27 = v63;
        uint64_t v26 = v66;
        goto LABEL_5;
      }
      unsigned __int8 v49 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23(v25, v5);
      char v29 = v65;
      uint64_t v26 = v66;
      v66(v65, v24, v5);
      if (v49)
      {
        uint64_t v28 = v62;
        unint64_t v27 = v63;
        goto LABEL_6;
      }
    }
    v33((uint64_t *)((char *)&v75 + 1), v5, v32);
    if (BYTE1(v75) == 19)
    {
      v23(v29, v5);
      uint64_t v28 = v62;
      v66(v62, v24, v5);
      unint64_t v27 = v63;
    }
    else
    {
      uint64_t v72 = BYTE1(v75);
      char v71 = 4;
      unint64_t v44 = CommonAudio.Verb.rawValue.getter();
      uint64_t v46 = v45;
      uint64_t v47 = CommonAudio.Verb.rawValue.getter();
      uint64_t v28 = v62;
      unint64_t v27 = v63;
      if (v44 == v47 && v46 == v48)
      {
        swift_bridgeObjectRelease_n();
        v23(v65, v5);
        uint64_t v26 = v66;
        v66(v28, v24, v5);
        goto LABEL_7;
      }
      uint64_t v54 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23(v65, v5);
      uint64_t v26 = v66;
      v66(v28, v24, v5);
      if (v54) {
        goto LABEL_7;
      }
    }
    ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v59)(&v75, v5, v32);
    if (v75 == 19)
    {
      v23(v28, v5);
      v66(v27, v24, v5);
    }
    else
    {
      uint64_t v74 = v75;
      uint64_t v73 = 9;
      uint64_t v50 = CommonAudio.Verb.rawValue.getter();
      uint64_t v52 = v51;
      if (v50 == CommonAudio.Verb.rawValue.getter() && v52 == v53)
      {
        swift_bridgeObjectRelease_n();
        v23(v28, v5);
        v66(v27, v24, v5);
        goto LABEL_8;
      }
      uint64_t v55 = sub_25C56EF90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23(v28, v5);
      v66(v27, v24, v5);
      if (v55) {
        goto LABEL_8;
      }
    }
    uint64_t v56 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 112))(v5, v32);
    char v30 = sub_25C568130(3u, v56);
    swift_bridgeObjectRelease();
    v23(v27, v5);
    return v30 & 1;
  }
  uint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v18, v5);
  int v24 = v3;
  unint64_t v25 = v64;
LABEL_3:
  uint64_t v26 = v66;
  v66(v25, v24, v5);
LABEL_4:
  uint64_t v28 = v62;
  unint64_t v27 = v63;
  v23(v25, v5);
LABEL_5:
  char v29 = v65;
  v26(v65, v24, v5);
LABEL_6:
  v23(v29, v5);
  v26(v28, v24, v5);
LABEL_7:
  v23(v28, v5);
  v26(v27, v24, v5);
LABEL_8:
  v23(v27, v5);
  char v30 = 1;
  return v30 & 1;
}

Swift::Bool __swiftcall AudioIntent.hasAttribute(_:)(SiriAudioIntentUtils::CommonAudio::Attribute a1)
{
  unsigned __int8 v2 = *(unsigned char *)a1;
  uint64_t v3 = (*(uint64_t (**)())(v1 + 112))();
  char v4 = sub_25C568130(v2, v3);
  swift_bridgeObjectRelease();
  return v4 & 1;
}

Swift::Bool __swiftcall AudioIntent.isAddToUpNext()()
{
  void (*v12)(uint64_t *__return_ptr, uint64_t);
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(unsigned char *, uint64_t, uint64_t);
  void (*v19)(unsigned char *, uint64_t);
  unsigned char *v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned char v28[4];
  int v29;
  unsigned char *v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  char v35;
  uint64_t v36;

  uint64_t v3 = v1;
  uint64_t v4 = v0;
  uint64_t v5 = *(void *)(v0 - 8);
  uint64_t v6 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  char v30 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v28[-v9];
  uint64_t v12 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v11 + 296);
  uint64_t v31 = v2;
  v12((uint64_t *)((char *)&v36 + 1), v8);
  if (BYTE1(v36) == 19)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v33 = BYTE1(v36);
    uint64_t v32 = 0;
    uint64_t v14 = CommonAudio.Verb.rawValue.getter();
    uint64_t v16 = v15;
    if (v14 == CommonAudio.Verb.rawValue.getter() && v16 == v17) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = sub_25C56EF90();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  unint64_t v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16);
  v18(v10, v31, v4);
  if (v13) {
    goto LABEL_9;
  }
  ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v12)(&v36, v4, v3);
  if (v36 == 19)
  {
    uint64_t v19 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
    v19(v10, v4);
    uint64_t v20 = v30;
    v18(v30, v31, v4);
    goto LABEL_17;
  }
  unint64_t v35 = v36;
  char v34 = 7;
  uint64_t v23 = CommonAudio.Verb.rawValue.getter();
  unint64_t v25 = v24;
  if (v23 != CommonAudio.Verb.rawValue.getter() || v25 != v26)
  {
    char v29 = sub_25C56EF90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
    v19(v10, v4);
    uint64_t v20 = v30;
    v18(v30, v31, v4);
    if (v29) {
      goto LABEL_10;
    }
LABEL_17:
    v19(v20, v4);
    uint64_t v22 = 0;
    return v22 & 1;
  }
  swift_bridgeObjectRelease_n();
LABEL_9:
  uint64_t v19 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v19(v10, v4);
  uint64_t v20 = v30;
  v18(v30, v31, v4);
LABEL_10:
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 112))(v4, v3);
  uint64_t v22 = sub_25C568130(3u, v21);
  swift_bridgeObjectRelease();
  v19(v20, v4);
  return v22 & 1;
}

BOOL AudioIntent.hasAnyAttribute(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 112))(a2, a3);
  LOBYTE(a1) = sub_25C567874(a1, v4);
  swift_bridgeObjectRelease();
  return (a1 & 1) == 0;
}

uint64_t sub_25C567874(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 1;
  }
  if (v2 >= v3) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = a2;
  }
  if (v2 >= v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a1;
  }
  uint64_t v31 = v4 + 56;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 56);
  int64_t v30 = (unint64_t)(63 - v6) >> 6;
  uint64_t v9 = v5 + 56;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v29 = v4;
  while (2)
  {
    while (2)
    {
      while (2)
      {
        while (1)
        {
          int64_t v11 = v10;
          if (!v8) {
            break;
          }
          unint64_t v12 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
          unint64_t v13 = v12 | (v10 << 6);
          if (*(void *)(v5 + 16)) {
            goto LABEL_30;
          }
        }
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
          goto LABEL_87;
        }
        if (v14 >= v30) {
          goto LABEL_85;
        }
        unint64_t v15 = *(void *)(v31 + 8 * v14);
        ++v10;
        if (v15) {
          goto LABEL_29;
        }
        int64_t v10 = v11 + 2;
        if (v11 + 2 >= v30) {
          goto LABEL_85;
        }
        unint64_t v15 = *(void *)(v31 + 8 * v10);
        if (v15) {
          goto LABEL_29;
        }
        int64_t v10 = v11 + 3;
        if (v11 + 3 >= v30) {
          goto LABEL_85;
        }
        unint64_t v15 = *(void *)(v31 + 8 * v10);
        if (v15) {
          goto LABEL_29;
        }
        int64_t v16 = v11 + 4;
        if (v11 + 4 >= v30)
        {
LABEL_85:
          swift_bridgeObjectRelease();
          uint64_t v27 = 1;
          goto LABEL_83;
        }
        unint64_t v15 = *(void *)(v31 + 8 * v16);
        if (!v15)
        {
          while (1)
          {
            int64_t v10 = v16 + 1;
            if (__OFADD__(v16, 1)) {
              break;
            }
            if (v10 >= v30) {
              goto LABEL_85;
            }
            unint64_t v15 = *(void *)(v31 + 8 * v10);
            ++v16;
            if (v15) {
              goto LABEL_29;
            }
          }
LABEL_87:
          __break(1u);
          JUMPOUT(0x25C56807CLL);
        }
        int64_t v10 = v11 + 4;
LABEL_29:
        unint64_t v8 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
        if (!*(void *)(v5 + 16)) {
          continue;
        }
        break;
      }
LABEL_30:
      unint64_t v32 = v8;
      uint64_t v17 = *(unsigned __int8 *)(*(void *)(v4 + 48) + v13);
      sub_25C56EFC0();
      sub_25C56EDC0();
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_25C56EFE0();
      uint64_t v19 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v20 = v18 & ~v19;
      if (((*(void *)(v9 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
        continue;
      }
      break;
    }
    uint64_t v21 = ~v19;
LABEL_32:
    unint64_t v22 = 0x800000025C570B80;
    unint64_t v23 = 0xD000000000000018;
    switch(*(unsigned char *)(*(void *)(v5 + 48) + v20))
    {
      case 1:
        unint64_t v22 = 0xE800000000000000;
        unint64_t v23 = 0x676E6F536D6F7266;
        break;
      case 2:
        unint64_t v23 = 0x75626C416D6F7266;
        unint64_t v22 = 0xE90000000000006DLL;
        break;
      case 3:
        unint64_t v22 = 0xE800000000000000;
        unint64_t v23 = 0x7478654E79616C70;
        break;
      case 4:
        unint64_t v22 = 0xE700000000000000;
        unint64_t v23 = 0x776F4E79616C70;
        break;
      case 5:
        unint64_t v22 = 0xE800000000000000;
        unint64_t v23 = 0x7473614C79616C70;
        break;
      case 6:
        unint64_t v22 = 0xE800000000000000;
        unint64_t v23 = 0x7974696E69666661;
        break;
      case 7:
        unint64_t v23 = 0x6E656D6D6F636572;
        unint64_t v22 = 0xEB00000000646564;
        break;
      case 8:
        unint64_t v22 = 0xE900000000000079;
        unint64_t v23 = 0x7265766F63736964;
        break;
      case 9:
        break;
      case 0xA:
        unint64_t v22 = 0xE400000000000000;
        unint64_t v23 = 1954047342;
        break;
      case 0xB:
        unint64_t v22 = 0xE500000000000000;
        unint64_t v23 = 0x64656D616ELL;
        break;
      case 0xC:
        unint64_t v22 = 0xE800000000000000;
        unint64_t v23 = 0x73756F6976657270;
        break;
      case 0xD:
        unint64_t v23 = 0x44657361656C6572;
        unint64_t v22 = 0xEB00000000657461;
        break;
      case 0xE:
        unint64_t v22 = 0xE800000000000000;
        unint64_t v23 = 0x6E6F697461727564;
        break;
      default:
        unint64_t v23 = 0x697472416D6F7266;
        unint64_t v22 = 0xEA00000000007473;
        break;
    }
    unint64_t v24 = 0x800000025C570B80;
    unint64_t v25 = 0xD000000000000018;
    switch(v17)
    {
      case 1:
        unint64_t v24 = 0xE800000000000000;
        if (v23 != 0x676E6F536D6F7266) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 2:
        unint64_t v24 = 0xE90000000000006DLL;
        if (v23 != 0x75626C416D6F7266) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 3:
        unint64_t v24 = 0xE800000000000000;
        if (v23 != 0x7478654E79616C70) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 4:
        unint64_t v24 = 0xE700000000000000;
        if (v23 != 0x776F4E79616C70) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 5:
        unint64_t v24 = 0xE800000000000000;
        if (v23 != 0x7473614C79616C70) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 6:
        unint64_t v24 = 0xE800000000000000;
        if (v23 != 0x7974696E69666661) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 7:
        unint64_t v24 = 0xEB00000000646564;
        if (v23 != 0x6E656D6D6F636572) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 8:
        unint64_t v24 = 0xE900000000000079;
        if (v23 != 0x7265766F63736964) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 9:
        goto LABEL_73;
      case 10:
        unint64_t v24 = 0xE400000000000000;
        if (v23 != 1954047342) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 11:
        unint64_t v24 = 0xE500000000000000;
        if (v23 != 0x64656D616ELL) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 12:
        unint64_t v24 = 0xE800000000000000;
        if (v23 != 0x73756F6976657270) {
          goto LABEL_75;
        }
        goto LABEL_74;
      case 13:
        unint64_t v25 = 0x44657361656C6572;
        unint64_t v24 = 0xEB00000000657461;
LABEL_73:
        if (v23 == v25) {
          goto LABEL_74;
        }
        goto LABEL_75;
      case 14:
        unint64_t v24 = 0xE800000000000000;
        if (v23 != 0x6E6F697461727564) {
          goto LABEL_75;
        }
        goto LABEL_74;
      default:
        unint64_t v24 = 0xEA00000000007473;
        if (v23 != 0x697472416D6F7266) {
          goto LABEL_75;
        }
LABEL_74:
        if (v22 != v24)
        {
LABEL_75:
          char v26 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v26) {
            goto LABEL_82;
          }
          unint64_t v20 = (v20 + 1) & v21;
          if (((*(void *)(v9 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
          {
            uint64_t v4 = v29;
            unint64_t v8 = v32;
            continue;
          }
          goto LABEL_32;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_82:
        swift_bridgeObjectRelease();
        uint64_t v27 = 0;
LABEL_83:
        sub_25C568AB8();
        return v27;
    }
  }
}

uint64_t sub_25C568130(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_25C56EFC0();
    CommonAudio.Attribute.rawValue.getter();
    sub_25C56EDC0();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_25C56EFE0();
    uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v6 = v4 & ~v5;
    if ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
    {
      uint64_t v7 = ~v5;
      uint64_t v8 = a1;
      while (1)
      {
        unint64_t v9 = 0x800000025C570B80;
        unint64_t v10 = 0xD000000000000018;
        switch(*(unsigned char *)(*(void *)(a2 + 48) + v6))
        {
          case 1:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x676E6F536D6F7266;
            break;
          case 2:
            unint64_t v10 = 0x75626C416D6F7266;
            unint64_t v9 = 0xE90000000000006DLL;
            break;
          case 3:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x7478654E79616C70;
            break;
          case 4:
            unint64_t v9 = 0xE700000000000000;
            unint64_t v10 = 0x776F4E79616C70;
            break;
          case 5:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x7473614C79616C70;
            break;
          case 6:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x7974696E69666661;
            break;
          case 7:
            unint64_t v10 = 0x6E656D6D6F636572;
            unint64_t v9 = 0xEB00000000646564;
            break;
          case 8:
            unint64_t v9 = 0xE900000000000079;
            unint64_t v10 = 0x7265766F63736964;
            break;
          case 9:
            break;
          case 0xA:
            unint64_t v9 = 0xE400000000000000;
            unint64_t v10 = 1954047342;
            break;
          case 0xB:
            unint64_t v9 = 0xE500000000000000;
            unint64_t v10 = 0x64656D616ELL;
            break;
          case 0xC:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x73756F6976657270;
            break;
          case 0xD:
            unint64_t v10 = 0x44657361656C6572;
            unint64_t v9 = 0xEB00000000657461;
            break;
          case 0xE:
            unint64_t v9 = 0xE800000000000000;
            unint64_t v10 = 0x6E6F697461727564;
            break;
          default:
            unint64_t v10 = 0x697472416D6F7266;
            unint64_t v9 = 0xEA00000000007473;
            break;
        }
        unint64_t v11 = 0x800000025C570B80;
        unint64_t v12 = 0xD000000000000018;
        switch(v8)
        {
          case 1:
            unint64_t v11 = 0xE800000000000000;
            if (v10 == 0x676E6F536D6F7266) {
              goto LABEL_46;
            }
            goto LABEL_47;
          case 2:
            unint64_t v11 = 0xE90000000000006DLL;
            if (v10 != 0x75626C416D6F7266) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 3:
            unint64_t v11 = 0xE800000000000000;
            if (v10 != 0x7478654E79616C70) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 4:
            unint64_t v11 = 0xE700000000000000;
            if (v10 != 0x776F4E79616C70) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 5:
            unint64_t v11 = 0xE800000000000000;
            if (v10 != 0x7473614C79616C70) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 6:
            unint64_t v11 = 0xE800000000000000;
            if (v10 != 0x7974696E69666661) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 7:
            unint64_t v11 = 0xEB00000000646564;
            if (v10 != 0x6E656D6D6F636572) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 8:
            unint64_t v11 = 0xE900000000000079;
            if (v10 != 0x7265766F63736964) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 9:
            goto LABEL_45;
          case 10:
            unint64_t v11 = 0xE400000000000000;
            if (v10 != 1954047342) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 11:
            unint64_t v11 = 0xE500000000000000;
            if (v10 != 0x64656D616ELL) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 12:
            unint64_t v11 = 0xE800000000000000;
            if (v10 != 0x73756F6976657270) {
              goto LABEL_47;
            }
            goto LABEL_46;
          case 13:
            unint64_t v12 = 0x44657361656C6572;
            unint64_t v11 = 0xEB00000000657461;
LABEL_45:
            if (v10 == v12) {
              goto LABEL_46;
            }
            goto LABEL_47;
          case 14:
            unint64_t v11 = 0xE800000000000000;
            if (v10 != 0x6E6F697461727564) {
              goto LABEL_47;
            }
            goto LABEL_46;
          default:
            unint64_t v11 = 0xEA00000000007473;
            if (v10 != 0x697472416D6F7266) {
              goto LABEL_47;
            }
LABEL_46:
            if (v9 == v11)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              char v13 = 1;
              return v13 & 1;
            }
LABEL_47:
            char v13 = sub_25C56EF90();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v13) {
              return v13 & 1;
            }
            unint64_t v6 = (v6 + 1) & v7;
            if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
              return v13 & 1;
            }
            break;
        }
      }
    }
  }
  char v13 = 0;
  return v13 & 1;
}

Swift::Bool __swiftcall AudioIntent.isAirPlayMusicWithoutAppName()()
{
  uint64_t v3 = v1;
  uint64_t v4 = v0;
  uint64_t v5 = *(void *)(v0 - 8);
  uint64_t v6 = ((uint64_t (*)())MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)((*(uint64_t (**)(uint64_t))(v9 + 304))(v6) + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, v4);
  if (v10) {
    char v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 312))(v4, v3);
  }
  else {
    char v11 = 0;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v11 & 1;
}

uint64_t dispatch thunk of AudioIntent.activities.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AudioIntent.albums.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AudioIntent.appAudiobookAuthors.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AudioIntent.appAudiobookTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AudioIntent.appMusicArtistNames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AudioIntent.appName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AudioIntent.appPlaylistTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AudioIntent.appShowTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of AudioIntent.applePlaylistTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AudioIntent.applePodcastTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of AudioIntent.apps.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of AudioIntent.artists.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of AudioIntent.attributes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of AudioIntent.dateTime.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of AudioIntent.decade.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of AudioIntent.entities.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of AudioIntent.frequency.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of AudioIntent.genres.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of AudioIntent.mediaIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of AudioIntent.mediaType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of AudioIntent.targetMediaType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of AudioIntent.modifiers.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 184))();
}

uint64_t dispatch thunk of AudioIntent.moods.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of AudioIntent.musicTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of AudioIntent.noun.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of AudioIntent.playlistTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 216))();
}

uint64_t dispatch thunk of AudioIntent.podcastTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 224))();
}

uint64_t dispatch thunk of AudioIntent.newsPodcastTopicId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of AudioIntent.newsPodcastIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 240))();
}

uint64_t dispatch thunk of AudioIntent.radioStationNames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 248))();
}

uint64_t dispatch thunk of AudioIntent.radioType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of AudioIntent.reference.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 264))();
}

uint64_t dispatch thunk of AudioIntent.resolvedReference.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 272))();
}

uint64_t dispatch thunk of AudioIntent.showTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 280))();
}

uint64_t dispatch thunk of AudioIntent.sort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 288))();
}

uint64_t dispatch thunk of AudioIntent.verb.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 296))();
}

uint64_t dispatch thunk of AudioIntent.audioSettingNames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of AudioIntent.appInferred.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 312))();
}

uint64_t sub_25C568AB8()
{
  return swift_release();
}

char *UsoEntity_common_Setting.usoMediaSettingNames()()
{
  uint64_t v0 = sub_25C56E920();
  uint64_t v46 = *(char **)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25C56ED60();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v42 - v8;
  if (qword_26A5B0410 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25C56E990();
  if (v10)
  {
    uint64_t v11 = v10;
    if (qword_26A5B0420 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5B2000);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v12, v3);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_25C56ED50();
    os_log_type_t v14 = sub_25C56EE50();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      unint64_t v44 = (char *)swift_slowAlloc();
      uint64_t v48 = v44;
      uint64_t v43 = v15;
      *(_DWORD *)unint64_t v15 = 136315138;
      v42[1] = v15 + 4;
      uint64_t v16 = swift_bridgeObjectRetain();
      uint64_t v17 = MEMORY[0x261189BF0](v16, v0);
      unint64_t v45 = v3;
      uint64_t v18 = v17;
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      uint64_t v47 = sub_25C56BB2C(v18, v20, (uint64_t *)&v48);
      sub_25C56EE70();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v21 = v43;
      _os_log_impl(&dword_25C543000, v13, v14, "UsoMediaSettingNames: Found identifiers for name: %s", v43, 0xCu);
      unint64_t v22 = v44;
      swift_arrayDestroy();
      MEMORY[0x26118A090](v22, -1, -1);
      MEMORY[0x26118A090](v21, -1, -1);

      (*(void (**)(char *, unint64_t))(v4 + 8))(v9, v45);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    }
    uint64_t v27 = *(void *)(v11 + 16);
    if (v27)
    {
      uint64_t v28 = (void (*)(char *, unint64_t, uint64_t))*((void *)v46 + 2);
      unint64_t v29 = v11 + ((v46[80] + 32) & ~(unint64_t)v46[80]);
      uint64_t v30 = *((void *)v46 + 9);
      uint64_t v31 = (uint8_t *)v11;
      unint64_t v32 = v46 + 8;
      uint64_t v43 = v31;
      swift_bridgeObjectRetain();
      unint64_t v44 = "with negative count";
      unint64_t v45 = 0x800000025C571880;
      uint64_t v46 = (char *)MEMORY[0x263F8EE78];
      while (1)
      {
        v28(v2, v29, v0);
        uint64_t v33 = sub_25C56E910();
        if (v34)
        {
          if (v33 == 0xD000000000000010 && v34 == v45)
          {
            swift_bridgeObjectRelease();
LABEL_23:
            sub_25C56E900();
            uint64_t v36 = sub_25C56EF80();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))v32)(v2, v0);
            if (!v36)
            {
              if (swift_isUniquelyReferenced_nonNull_native()) {
                uint64_t v37 = v46;
              }
              else {
                uint64_t v37 = sub_25C56404C(0, *((void *)v46 + 2) + 1, 1, v46);
              }
              unint64_t v39 = *((void *)v37 + 2);
              unint64_t v38 = *((void *)v37 + 3);
              unint64_t v40 = v39 + 1;
              if (v39 >= v38 >> 1) {
                uint64_t v37 = sub_25C56404C((char *)(v38 > 1), v39 + 1, 1, v37);
              }
              uint64_t v46 = v37;
              *((void *)v37 + 2) = v40;
            }
            goto LABEL_17;
          }
          char v35 = sub_25C56EF90();
          swift_bridgeObjectRelease();
          if (v35) {
            goto LABEL_23;
          }
        }
        (*(void (**)(char *, uint64_t))v32)(v2, v0);
LABEL_17:
        v29 += v30;
        if (!--v27)
        {
          swift_bridgeObjectRelease_n();
          return v46;
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26A5B0420 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5B2000);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v23, v3);
    unint64_t v24 = sub_25C56ED50();
    os_log_type_t v25 = sub_25C56EE50();
    if (os_log_type_enabled(v24, v25))
    {
      char v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v26 = 0;
      _os_log_impl(&dword_25C543000, v24, v25, "UsoMediaSettingNames: Found no identifiers for name", v26, 2u);
      MEMORY[0x26118A090](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return (char *)MEMORY[0x263F8EE78];
}

SiriAudioIntentUtils::CommonAudio::Verb_optional __swiftcall CommonAudio.Verb.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25C56EFA0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 19;
  if (v3 < 0x13) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

SiriAudioIntentUtils::CommonAudio::UsoEntity_optional __swiftcall CommonAudio.UsoEntity.init(rawValue:)(Swift::String rawValue)
{
  return (SiriAudioIntentUtils::CommonAudio::UsoEntity_optional)sub_25C56A930(v1);
}

uint64_t static CommonAudio.MediaType.from(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_25C56ED60();
  uint64_t v33 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  uint64_t v6 = MEMORY[0x270FA5388](v32);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v31 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v31 - v12;
  uint64_t v14 = sub_25C56EB60();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C55E72C(a1, (uint64_t)v13, &qword_26A5B0488);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_25C56BACC((uint64_t)v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    if (qword_26A5B03E8 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_26A5B1FF8;
    if (*(void *)(qword_26A5B1FF8 + 16))
    {
      unint64_t v19 = sub_25C56C194((uint64_t)v17);
      if (v20)
      {
        char v21 = *(unsigned char *)(*(void *)(v18 + 56) + v19);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        goto LABEL_15;
      }
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  uint64_t v23 = v33;
  if (qword_26A5B0420 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v3, (uint64_t)qword_26A5B2000);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v5, v24, v3);
  sub_25C55E72C(a1, (uint64_t)v11, &qword_26A5B0488);
  os_log_type_t v25 = sub_25C56ED50();
  os_log_type_t v26 = sub_25C56EE30();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v31 = v3;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v36 = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_25C55E72C((uint64_t)v11, (uint64_t)v8, &qword_26A5B0488);
    uint64_t v29 = sub_25C56EDA0();
    uint64_t v35 = sub_25C56BB2C(v29, v30, &v36);
    sub_25C56EE70();
    swift_bridgeObjectRelease();
    sub_25C56BACC((uint64_t)v11);
    _os_log_impl(&dword_25C543000, v25, v26, "AudioUsoIntent#MediaType#from received unregistered type: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26118A090](v28, -1, -1);
    MEMORY[0x26118A090](v27, -1, -1);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v5, v31);
  }
  else
  {
    sub_25C56BACC((uint64_t)v11);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v5, v3);
  }
  char v21 = 29;
LABEL_15:
  *uint64_t v34 = v21;
  return result;
}

uint64_t static CommonAudio.Decade.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = sub_25C56ED60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v10 = qword_26A5B03D8;
    swift_bridgeObjectRetain();
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_26A5B1FE8;
    if (*(void *)(qword_26A5B1FE8 + 16))
    {
      unint64_t v12 = sub_25C56C218(a1, a2);
      if (v13)
      {
        char v14 = *(unsigned char *)(*(void *)(v11 + 56) + v12);
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26A5B0420 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v6, (uint64_t)qword_26A5B2000);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_25C56ED50();
  os_log_type_t v18 = sub_25C56EE30();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    os_log_type_t v26 = a3;
    char v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v28 = a2;
    uint64_t v29 = v21;
    *(_DWORD *)char v20 = 136315138;
    v25[1] = v20 + 4;
    uint64_t v27 = a1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B05C0);
    uint64_t v22 = sub_25C56EDA0();
    uint64_t v27 = sub_25C56BB2C(v22, v23, &v29);
    sub_25C56EE70();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C543000, v17, v18, "CommonAudio#Decade#from received unregistered decade: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x26118A090](v21, -1, -1);
    uint64_t v24 = v20;
    a3 = v26;
    MEMORY[0x26118A090](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v14 = 11;
LABEL_14:
  *a3 = v14;
  return result;
}

SiriAudioIntentUtils::CommonAudio::RadioType_optional __swiftcall CommonAudio.RadioType.init(rawValue:)(Swift::String rawValue)
{
  return (SiriAudioIntentUtils::CommonAudio::RadioType_optional)sub_25C56A930(v1);
}

unint64_t CommonAudio.Attribute.rawValue.getter()
{
  unint64_t result = 0xD000000000000018;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x676E6F536D6F7266;
      break;
    case 2:
      unint64_t result = 0x75626C416D6F7266;
      break;
    case 3:
      unint64_t result = 0x7478654E79616C70;
      break;
    case 4:
      unint64_t result = 0x776F4E79616C70;
      break;
    case 5:
      unint64_t result = 0x7473614C79616C70;
      break;
    case 6:
      unint64_t result = 0x7974696E69666661;
      break;
    case 7:
      unint64_t result = 0x6E656D6D6F636572;
      break;
    case 8:
      unint64_t result = 0x7265766F63736964;
      break;
    case 9:
      return result;
    case 0xA:
      unint64_t result = 1954047342;
      break;
    case 0xB:
      unint64_t result = 0x64656D616ELL;
      break;
    case 0xC:
      unint64_t result = 0x73756F6976657270;
      break;
    case 0xD:
      unint64_t result = 0x44657361656C6572;
      break;
    case 0xE:
      unint64_t result = 0x6E6F697461727564;
      break;
    default:
      unint64_t result = 0x697472416D6F7266;
      break;
  }
  return result;
}

void sub_25C569B00()
{
  qword_26A5B05A0 = 0x31207374616542;
  *(void *)algn_26A5B05A8 = 0xE700000000000000;
}

uint64_t static CommonAudio.beatsOne.getter()
{
  return sub_25C569BA4(&qword_26A5B03C8, &qword_26A5B05A0);
}

void sub_25C569B4C()
{
  algn_26A5B05B8[7] = -18;
}

uint64_t static CommonAudio.disambiguationRole.getter()
{
  return sub_25C569BA4(&qword_26A5B03D0, &qword_26A5B05B0);
}

uint64_t sub_25C569BA4(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t CommonAudio.Verb.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6269726373627573;
      break;
    case 2:
      unint64_t result = 0x776F6C6C6F66;
      break;
    case 3:
      unint64_t result = 1701538156;
      break;
    case 4:
      unint64_t result = 0x656C6666756873;
      break;
    case 5:
      unint64_t result = 0x746165706572;
      break;
    case 6:
      unint64_t result = 0x656D75736572;
      break;
    case 7:
      unint64_t result = 0x657461647075;
      break;
    case 8:
      unint64_t result = 0x736972616D6D7573;
      break;
    case 9:
      unint64_t result = 0x7472617473;
      break;
    case 0xA:
      unint64_t result = 0x656B696C6E75;
      break;
    case 0xB:
      unint64_t result = 0x74736575716572;
      break;
    case 0xC:
      unint64_t result = 1852141679;
      break;
    case 0xD:
      unint64_t result = 0x6E696D7265746564;
      break;
    case 0xE:
      return result;
    case 0xF:
      unint64_t result = 6579297;
      break;
    case 0x10:
      unint64_t result = 0x656C62616E65;
      break;
    case 0x11:
      unint64_t result = 0x656C6261736964;
      break;
    case 0x12:
      unint64_t result = 0x796669646F6DLL;
      break;
    default:
      unint64_t result = 2036427888;
      break;
  }
  return result;
}

uint64_t sub_25C569DEC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C5652C0(*a1, *a2);
}

uint64_t sub_25C569DF8(uint64_t a1, uint64_t a2)
{
  return sub_25C56B74C(a1, a2, (void (*)(uint64_t))CommonAudio.Verb.rawValue.getter);
}

uint64_t sub_25C569E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56B7D4(a1, a2, a3, (void (*)(void))CommonAudio.Verb.rawValue.getter);
}

uint64_t sub_25C569E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56B854(a1, a2, a3, (void (*)(uint64_t))CommonAudio.Verb.rawValue.getter);
}

SiriAudioIntentUtils::CommonAudio::Verb_optional sub_25C569E40(Swift::String *a1)
{
  return CommonAudio.Verb.init(rawValue:)(*a1);
}

unint64_t sub_25C569E4C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CommonAudio.Verb.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t CommonAudio.UsoEntity.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0x6E456F4E5F6F7375;
  }
}

uint64_t sub_25C569EBC(char *a1, char *a2)
{
  return sub_25C564FBC(*a1, *a2);
}

uint64_t sub_25C569EC8()
{
  return sub_25C56D680();
}

uint64_t sub_25C569ED0()
{
  return sub_25C56D970();
}

uint64_t sub_25C569ED8()
{
  return sub_25C56DEA8();
}

SiriAudioIntentUtils::CommonAudio::UsoEntity_optional sub_25C569EE0(Swift::String *a1)
{
  return CommonAudio.UsoEntity.init(rawValue:)(*a1);
}

uint64_t sub_25C569EEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.UsoEntity.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Attribute_optional __swiftcall CommonAudio.Attribute.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25C56EF80();
  result.value = swift_bridgeObjectRelease();
  char v5 = 15;
  if (v3 < 0xF) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_25C569F70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C565194(*a1, *a2);
}

uint64_t sub_25C569F7C(uint64_t a1, uint64_t a2)
{
  return sub_25C56B74C(a1, a2, (void (*)(uint64_t))CommonAudio.Attribute.rawValue.getter);
}

uint64_t sub_25C569F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56B7D4(a1, a2, a3, (void (*)(void))CommonAudio.Attribute.rawValue.getter);
}

uint64_t sub_25C569FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56B854(a1, a2, a3, (void (*)(uint64_t))CommonAudio.Attribute.rawValue.getter);
}

SiriAudioIntentUtils::CommonAudio::Attribute_optional sub_25C569FC4(Swift::String *a1)
{
  return CommonAudio.Attribute.init(rawValue:)(*a1);
}

unint64_t sub_25C569FD0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CommonAudio.Attribute.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Modifier_optional __swiftcall CommonAudio.Modifier.init(rawValue:)(Swift::String rawValue)
{
  return (SiriAudioIntentUtils::CommonAudio::Modifier_optional)sub_25C56A930(v1);
}

uint64_t CommonAudio.Modifier.rawValue.getter()
{
  if (*v0) {
    return 0x6E65726566666964;
  }
  else {
    return 0x664F65726F6DLL;
  }
}

uint64_t sub_25C56A048(char *a1, char *a2)
{
  return sub_25C5651AC(*a1, *a2);
}

uint64_t sub_25C56A054()
{
  return sub_25C56D710();
}

uint64_t sub_25C56A05C()
{
  return sub_25C56DA98();
}

uint64_t sub_25C56A064()
{
  return sub_25C56DD40();
}

SiriAudioIntentUtils::CommonAudio::Modifier_optional sub_25C56A06C(Swift::String *a1)
{
  return CommonAudio.Modifier.init(rawValue:)(*a1);
}

uint64_t sub_25C56A078@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.Modifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Noun_optional __swiftcall CommonAudio.Noun.init(rawValue:)(Swift::String rawValue)
{
  return (SiriAudioIntentUtils::CommonAudio::Noun_optional)sub_25C56A930(v1);
}

uint64_t CommonAudio.Noun.rawValue.getter()
{
  if (*v0) {
    return 0x317374616562;
  }
  else {
    return 0x7972617262696CLL;
  }
}

uint64_t sub_25C56A0E4(char *a1, char *a2)
{
  return sub_25C565404(*a1, *a2);
}

uint64_t sub_25C56A0F0()
{
  return sub_25C56D79C();
}

uint64_t sub_25C56A0F8()
{
  return sub_25C56DBA0();
}

uint64_t sub_25C56A100()
{
  return sub_25C56DCC4();
}

SiriAudioIntentUtils::CommonAudio::Noun_optional sub_25C56A108(Swift::String *a1)
{
  return CommonAudio.Noun.init(rawValue:)(*a1);
}

uint64_t sub_25C56A114@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.Noun.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t CommonAudio.RadioType.rawValue.getter()
{
  if (*v0) {
    return 28001;
  }
  else {
    return 28006;
  }
}

uint64_t sub_25C56A158(char *a1, char *a2)
{
  return sub_25C565114(*a1, *a2);
}

uint64_t sub_25C56A164()
{
  return sub_25C56D81C();
}

uint64_t sub_25C56A16C()
{
  return sub_25C56DA58();
}

uint64_t sub_25C56A174()
{
  return sub_25C56DDC8();
}

SiriAudioIntentUtils::CommonAudio::RadioType_optional sub_25C56A17C(Swift::String *a1)
{
  return CommonAudio.RadioType.init(rawValue:)(*a1);
}

uint64_t sub_25C56A188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.RadioType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Confirmation_optional __swiftcall CommonAudio.Confirmation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25C56EF80();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CommonAudio.Confirmation.rawValue.getter()
{
  return *(void *)&aYes_1[8 * *v0];
}

uint64_t sub_25C56A230(char *a1, char *a2)
{
  return sub_25C5654A4(*a1, *a2);
}

uint64_t sub_25C56A23C()
{
  return sub_25C56D87C();
}

uint64_t sub_25C56A244()
{
  return sub_25C56DC08();
}

uint64_t sub_25C56A24C()
{
  return sub_25C56DC5C();
}

SiriAudioIntentUtils::CommonAudio::Confirmation_optional sub_25C56A254(Swift::String *a1)
{
  return CommonAudio.Confirmation.init(rawValue:)(*a1);
}

uint64_t sub_25C56A260@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.Confirmation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_25C56A288()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0628);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C56F910;
  *(void *)(inited + 32) = 0x7330323931;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(unsigned char *)(inited + 48) = 0;
  *(void *)(inited + 56) = 0x7330333931;
  *(void *)(inited + 64) = 0xE500000000000000;
  *(unsigned char *)(inited + 72) = 1;
  *(void *)(inited + 80) = 0x7330343931;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(unsigned char *)(inited + 96) = 2;
  *(void *)(inited + 104) = 0x7330353931;
  *(void *)(inited + 112) = 0xE500000000000000;
  *(unsigned char *)(inited + 120) = 3;
  *(void *)(inited + 128) = 0x7330363931;
  *(void *)(inited + 136) = 0xE500000000000000;
  *(unsigned char *)(inited + 144) = 4;
  *(void *)(inited + 152) = 0x7330373931;
  *(void *)(inited + 160) = 0xE500000000000000;
  *(unsigned char *)(inited + 168) = 5;
  *(void *)(inited + 176) = 0x7330383931;
  *(void *)(inited + 184) = 0xE500000000000000;
  *(unsigned char *)(inited + 192) = 6;
  *(void *)(inited + 200) = 0x7330393931;
  *(void *)(inited + 208) = 0xE500000000000000;
  *(unsigned char *)(inited + 216) = 7;
  *(void *)(inited + 224) = 0x7330303032;
  *(void *)(inited + 232) = 0xE500000000000000;
  *(unsigned char *)(inited + 240) = 8;
  *(void *)(inited + 248) = 0x7330313032;
  *(void *)(inited + 256) = 0xE500000000000000;
  *(unsigned char *)(inited + 264) = 9;
  *(void *)(inited + 272) = 0x7330323032;
  *(void *)(inited + 280) = 0xE500000000000000;
  *(unsigned char *)(inited + 288) = 10;
  unint64_t result = sub_25C56A590(inited);
  qword_26A5B1FE8 = result;
  return result;
}

unint64_t sub_25C56A39C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0648);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0650);
  uint64_t v6 = sub_25C56EF60();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25C55E72C(v12, (uint64_t)v5, &qword_26A5B0648);
    unint64_t result = sub_25C56C194((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25C56EB60();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(unsigned char *)(v7[7] + v16) = v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_25C56A590(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0630);
  uint64_t v2 = (void *)sub_25C56EF60();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25C56C218(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

SiriAudioIntentUtils::CommonAudio::Decade_optional __swiftcall CommonAudio.Decade.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25C56EF80();
  result.value = swift_bridgeObjectRelease();
  char v5 = 11;
  if (v3 < 0xB) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CommonAudio.Decade.rawValue.getter()
{
  return *(void *)&a1920s_2[8 * *v0];
}

uint64_t sub_25C56A718(char *a1, char *a2)
{
  return sub_25C565258(*a1, *a2);
}

uint64_t sub_25C56A724(uint64_t a1, uint64_t a2)
{
  return sub_25C56A834(a1, a2, (void (*)(unsigned char *, uint64_t))sub_25C56DB0C);
}

uint64_t sub_25C56A73C()
{
  return sub_25C56DB0C();
}

uint64_t sub_25C56A744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56A8A4(a1, a2, a3, (void (*)(unsigned char *, uint64_t))sub_25C56DB0C);
}

SiriAudioIntentUtils::CommonAudio::Decade_optional sub_25C56A75C(Swift::String *a1)
{
  return CommonAudio.Decade.init(rawValue:)(*a1);
}

uint64_t sub_25C56A768@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.Decade.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Sort_optional __swiftcall CommonAudio.Sort.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25C56EF80();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t CommonAudio.Sort.rawValue.getter()
{
  return *(void *)&aPopular_2[8 * *v0];
}

uint64_t sub_25C56A810(char *a1, char *a2)
{
  return sub_25C56537C(*a1, *a2);
}

uint64_t sub_25C56A81C(uint64_t a1, uint64_t a2)
{
  return sub_25C56A834(a1, a2, (void (*)(unsigned char *, uint64_t))sub_25C56DB4C);
}

uint64_t sub_25C56A834(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  uint64_t v5 = *v3;
  sub_25C56EFC0();
  a3(v7, v5);
  return sub_25C56EFE0();
}

uint64_t sub_25C56A884()
{
  return sub_25C56DB4C();
}

uint64_t sub_25C56A88C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56A8A4(a1, a2, a3, (void (*)(unsigned char *, uint64_t))sub_25C56DB4C);
}

uint64_t sub_25C56A8A4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *, uint64_t))
{
  uint64_t v6 = *v4;
  sub_25C56EFC0();
  a4(v8, v6);
  return sub_25C56EFE0();
}

SiriAudioIntentUtils::CommonAudio::Sort_optional sub_25C56A8F0(Swift::String *a1)
{
  return CommonAudio.Sort.init(rawValue:)(*a1);
}

uint64_t sub_25C56A8FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.Sort.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Reference_optional __swiftcall CommonAudio.Reference.init(rawValue:)(Swift::String rawValue)
{
  return (SiriAudioIntentUtils::CommonAudio::Reference_optional)sub_25C56A930(v1);
}

uint64_t sub_25C56A930@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_25C56EF80();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t CommonAudio.Reference.rawValue.getter()
{
  if (*v0) {
    return 0x696E696665646E69;
  }
  else {
    return 0x6574696E69666564;
  }
}

uint64_t sub_25C56A9D0(char *a1, char *a2)
{
  return sub_25C56506C(*a1, *a2);
}

uint64_t sub_25C56A9DC()
{
  return sub_25C56D8E8();
}

uint64_t sub_25C56A9E4()
{
  return sub_25C56D9E8();
}

uint64_t sub_25C56A9EC()
{
  return sub_25C56DE24();
}

SiriAudioIntentUtils::CommonAudio::Reference_optional sub_25C56A9F4(Swift::String *a1)
{
  return CommonAudio.Reference.init(rawValue:)(*a1);
}

uint64_t sub_25C56AA00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.Reference.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_25C56AA28()
{
  qword_26A5B1FF0 = (uint64_t)&unk_2709BEAC0;
}

unint64_t sub_25C56AA3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0640);
  uint64_t v0 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0648) - 8);
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25C56F920;
  unint64_t v4 = v3 + v2;
  uint64_t v5 = v0[14];
  uint64_t v6 = *MEMORY[0x263F72FD0];
  uint64_t v7 = sub_25C56EB60();
  uint64_t v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104);
  v8(v4, v6, v7);
  *(unsigned char *)(v4 + v5) = 0;
  uint64_t v9 = v0[14];
  v8(v4 + v1, *MEMORY[0x263F72FF0], v7);
  *(unsigned char *)(v4 + v1 + v9) = 1;
  uint64_t v10 = v0[14];
  v8(v4 + 2 * v1, *MEMORY[0x263F72FE8], v7);
  *(unsigned char *)(v4 + 2 * v1 + v10) = 2;
  uint64_t v11 = v0[14];
  v8(v4 + 3 * v1, *MEMORY[0x263F73040], v7);
  *(unsigned char *)(v4 + 3 * v1 + v11) = 3;
  uint64_t v12 = v0[14];
  v8(v4 + 4 * v1, *MEMORY[0x263F73038], v7);
  *(unsigned char *)(v4 + 4 * v1 + v12) = 4;
  uint64_t v13 = v0[14];
  v8(v4 + 5 * v1, *MEMORY[0x263F72F98], v7);
  *(unsigned char *)(v4 + 5 * v1 + v13) = 5;
  uint64_t v14 = v0[14];
  v8(v4 + 6 * v1, *MEMORY[0x263F72F60], v7);
  *(unsigned char *)(v4 + 6 * v1 + v14) = 6;
  uint64_t v15 = v0[14];
  v8(v4 + 7 * v1, *MEMORY[0x263F72FC0], v7);
  *(unsigned char *)(v4 + 7 * v1 + v15) = 7;
  uint64_t v16 = v0[14];
  v8(v4 + 8 * v1, *MEMORY[0x263F73020], v7);
  *(unsigned char *)(v4 + 8 * v1 + v16) = 8;
  uint64_t v17 = v0[14];
  v8(v4 + 9 * v1, *MEMORY[0x263F73030], v7);
  *(unsigned char *)(v4 + 9 * v1 + v17) = 9;
  uint64_t v18 = v0[14];
  v8(v4 + 10 * v1, *MEMORY[0x263F72F68], v7);
  *(unsigned char *)(v4 + 10 * v1 + v18) = 10;
  uint64_t v19 = v0[14];
  v8(v4 + 11 * v1, *MEMORY[0x263F72FE0], v7);
  *(unsigned char *)(v4 + 11 * v1 + v19) = 11;
  uint64_t v20 = v0[14];
  v8(v4 + 12 * v1, *MEMORY[0x263F72FB0], v7);
  *(unsigned char *)(v4 + 12 * v1 + v20) = 12;
  uint64_t v21 = v0[14];
  v8(v4 + 13 * v1, *MEMORY[0x263F73008], v7);
  *(unsigned char *)(v4 + 13 * v1 + v21) = 13;
  uint64_t v22 = v0[14];
  v8(v4 + 14 * v1, *MEMORY[0x263F72FC8], v7);
  *(unsigned char *)(v4 + 14 * v1 + v22) = 14;
  uint64_t v23 = v0[14];
  v8(v4 + 15 * v1, *MEMORY[0x263F73048], v7);
  *(unsigned char *)(v4 + 15 * v1 + v23) = 15;
  uint64_t v24 = v0[14];
  v8(v4 + 16 * v1, *MEMORY[0x263F72FA8], v7);
  *(unsigned char *)(v4 + 16 * v1 + v24) = 16;
  uint64_t v25 = v0[14];
  v8(v4 + 17 * v1, *MEMORY[0x263F72FB8], v7);
  *(unsigned char *)(v4 + 17 * v1 + v25) = 17;
  uint64_t v26 = v0[14];
  v8(v4 + 18 * v1, *MEMORY[0x263F72F78], v7);
  *(unsigned char *)(v4 + 18 * v1 + v26) = 18;
  uint64_t v27 = v0[14];
  v8(v4 + 19 * v1, *MEMORY[0x263F72FA0], v7);
  *(unsigned char *)(v4 + 19 * v1 + v27) = 19;
  uint64_t v28 = v0[14];
  v8(v4 + 20 * v1, *MEMORY[0x263F72FF8], v7);
  *(unsigned char *)(v4 + 20 * v1 + v28) = 20;
  uint64_t v29 = v0[14];
  v8(v4 + 21 * v1, *MEMORY[0x263F73018], v7);
  *(unsigned char *)(v4 + 21 * v1 + v29) = 21;
  uint64_t v30 = v0[14];
  v8(v4 + 22 * v1, *MEMORY[0x263F72F88], v7);
  *(unsigned char *)(v4 + 22 * v1 + v30) = 22;
  uint64_t v31 = v0[14];
  v8(v4 + 23 * v1, *MEMORY[0x263F73000], v7);
  *(unsigned char *)(v4 + 23 * v1 + v31) = 23;
  uint64_t v32 = v0[14];
  v8(v4 + 24 * v1, *MEMORY[0x263F72F70], v7);
  *(unsigned char *)(v4 + 24 * v1 + v32) = 24;
  uint64_t v33 = v0[14];
  v8(v4 + 25 * v1, *MEMORY[0x263F72FD8], v7);
  *(unsigned char *)(v4 + 25 * v1 + v33) = 25;
  uint64_t v34 = v0[14];
  v8(v4 + 26 * v1, *MEMORY[0x263F72F58], v7);
  *(unsigned char *)(v4 + 26 * v1 + v34) = 26;
  uint64_t v35 = v0[14];
  v8(v4 + 27 * v1, *MEMORY[0x263F72F80], v7);
  *(unsigned char *)(v4 + 27 * v1 + v35) = 27;
  uint64_t v36 = v0[14];
  v8(v4 + 28 * v1, *MEMORY[0x263F73010], v7);
  *(unsigned char *)(v4 + 28 * v1 + v36) = 29;
  uint64_t v37 = v0[14];
  v8(v4 + 29 * v1, *MEMORY[0x263F73028], v7);
  *(unsigned char *)(v4 + 29 * v1 + v37) = 29;
  uint64_t v38 = v0[14];
  v8(v4 + 30 * v1, *MEMORY[0x263F72F90], v7);
  *(unsigned char *)(v4 + 30 * v1 + v38) = 29;
  unint64_t v39 = v4 + 31 * v1;
  uint64_t v40 = v0[14];
  v8(v39, *MEMORY[0x263F73050], v7);
  *(unsigned char *)(v39 + v40) = 29;
  unint64_t result = sub_25C56A39C(v3);
  qword_26A5B1FF8 = result;
  return result;
}

Swift::Bool __swiftcall CommonAudio.MediaType.isStation()()
{
  return (*v0 < 0x17uLL) & (0x440010u >> *v0);
}

Swift::Bool __swiftcall CommonAudio.MediaType.isPodcastType()()
{
  char v1 = *v0;
  if (qword_26A5B03E0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26A5B1FF0;
  swift_bridgeObjectRetain();
  char v3 = sub_25C56552C(v1, v2);
  swift_bridgeObjectRelease();
  return v3 & 1;
}

SiriAudioIntentUtils::CommonAudio::MediaType_optional __swiftcall CommonAudio.MediaType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_25C56EFA0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 11;
  switch(v3)
  {
    case 0:
      goto LABEL_13;
    case 1:
      char v5 = 1;
      goto LABEL_13;
    case 2:
      char v5 = 2;
      goto LABEL_13;
    case 3:
      char v5 = 3;
      goto LABEL_13;
    case 4:
      char v5 = 4;
      goto LABEL_13;
    case 5:
      char v5 = 5;
      goto LABEL_13;
    case 6:
      char v5 = 6;
      goto LABEL_13;
    case 7:
      char v5 = 7;
      goto LABEL_13;
    case 8:
      char v5 = 8;
      goto LABEL_13;
    case 9:
      char v5 = 9;
      goto LABEL_13;
    case 10:
      char v5 = 10;
LABEL_13:
      char v6 = v5;
      break;
    case 11:
      break;
    case 12:
      char v6 = 12;
      break;
    case 13:
      char v6 = 13;
      break;
    case 14:
      char v6 = 14;
      break;
    case 15:
      char v6 = 15;
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    default:
      char v6 = 29;
      break;
  }
  *uint64_t v2 = v6;
  return result;
}

unint64_t CommonAudio.MediaType.rawValue.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x747369747261;
      break;
    case 2:
      unint64_t result = 0x6F65646976;
      break;
    case 3:
      unint64_t result = 0x7473696C79616C70;
      break;
    case 4:
      unint64_t result = 0x6E6F6974617473;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x6F68536F69646172;
      break;
    case 7:
      unint64_t result = 1735290739;
      break;
    case 8:
      unint64_t result = 0x5573656E755469;
      break;
    case 9:
      unint64_t result = 0x74736163646F70;
      break;
    case 0xA:
      unint64_t result = 0x646956636973756DLL;
      break;
    case 0xB:
      unint64_t result = 0x636973756DLL;
      break;
    case 0xC:
      unint64_t result = 1937204590;
      break;
    case 0xD:
      unint64_t result = 0x776F68537674;
      break;
    case 0xE:
      unint64_t result = 0x6D75626C61;
      break;
    case 0xF:
      unint64_t result = 0x656E6F74676E6972;
      break;
    case 0x10:
      unint64_t result = 28780;
      break;
    case 0x11:
      unint64_t result = 2003789939;
      break;
    case 0x12:
      unint64_t result = 0x6174536F69646172;
      break;
    case 0x13:
      unint64_t result = 28773;
      break;
    case 0x14:
      unint64_t result = 0x656C676E6973;
      break;
    case 0x15:
      unint64_t result = 0x65646F73697065;
      break;
    case 0x16:
      unint64_t result = 0x5374736163646F70;
      break;
    case 0x17:
      unint64_t result = 0x73646E756F73;
      break;
    case 0x18:
      unint64_t result = 0x74616C69706D6F63;
      break;
    case 0x19:
      unint64_t result = 0x6569766F6DLL;
      break;
    case 0x1A:
      unint64_t result = 0x6F6F426F69647561;
      break;
    case 0x1B:
      unint64_t result = 0x616C50636973756DLL;
      break;
    case 0x1C:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 0x65726E6567;
      break;
  }
  return result;
}

uint64_t sub_25C56B728(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25C56517C(*a1, *a2);
}

uint64_t sub_25C56B734(uint64_t a1, uint64_t a2)
{
  return sub_25C56B74C(a1, a2, (void (*)(uint64_t))CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_25C56B74C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_25C56EFC0();
  a3(v4);
  sub_25C56EDC0();
  swift_bridgeObjectRelease();
  return sub_25C56EFE0();
}

uint64_t sub_25C56B7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56B7D4(a1, a2, a3, (void (*)(void))CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_25C56B7D4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56B83C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25C56B854(a1, a2, a3, (void (*)(uint64_t))CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_25C56B854(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_25C56EFC0();
  a4(v5);
  sub_25C56EDC0();
  swift_bridgeObjectRelease();
  return sub_25C56EFE0();
}

SiriAudioIntentUtils::CommonAudio::MediaType_optional sub_25C56B8C0(Swift::String *a1)
{
  return CommonAudio.MediaType.init(rawValue:)(*a1);
}

unint64_t sub_25C56B8CC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CommonAudio.MediaType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t CommonAudio.MediaSettingName.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25C56EF80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t CommonAudio.MediaSettingName.rawValue.getter()
{
  return 0x79616C70726961;
}

uint64_t sub_25C56B974@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25C56EF80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25C56B9C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CommonAudio.MediaSettingName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25C56B9F0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25C56BA2C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25C56BA54(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25C56BB2C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25C56EE70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25C56BACC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25C56BB2C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25C56BC00(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25C56D618((uint64_t)v12, *a3);
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
      sub_25C56D618((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_25C56BC00(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25C56EE80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25C56BDBC(a5, a6);
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
  uint64_t v8 = sub_25C56EEF0();
  if (!v8)
  {
    sub_25C56EF40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25C56EF70();
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

uint64_t sub_25C56BDBC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25C56BE54(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25C56C034(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25C56C034(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25C56BE54(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25C56BFCC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25C56EEC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25C56EF40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25C56EDD0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25C56EF70();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25C56EF40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25C56BFCC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0658);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25C56C034(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A5B0658);
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
  uint64_t result = sub_25C56EF70();
  __break(1u);
  return result;
}

unsigned char **sub_25C56C184(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_25C56C194(uint64_t a1)
{
  sub_25C56EB60();
  sub_25C56D584(&qword_26A5B0638);
  uint64_t v2 = sub_25C56ED80();
  return sub_25C56D2F4(a1, v2);
}

unint64_t sub_25C56C218(uint64_t a1, uint64_t a2)
{
  sub_25C56EFC0();
  sub_25C56EDC0();
  uint64_t v4 = sub_25C56EFE0();
  return sub_25C56D4A0(a1, a2, v4);
}

unint64_t sub_25C56C294()
{
  unint64_t result = qword_26A5B05C8;
  if (!qword_26A5B05C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B05C8);
  }
  return result;
}

unint64_t sub_25C56C2EC()
{
  unint64_t result = qword_26A5B05D0;
  if (!qword_26A5B05D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B05D0);
  }
  return result;
}

unint64_t sub_25C56C344()
{
  unint64_t result = qword_26A5B05D8;
  if (!qword_26A5B05D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B05D8);
  }
  return result;
}

unint64_t sub_25C56C39C()
{
  unint64_t result = qword_26A5B05E0;
  if (!qword_26A5B05E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B05E0);
  }
  return result;
}

unint64_t sub_25C56C3F4()
{
  unint64_t result = qword_26A5B05E8;
  if (!qword_26A5B05E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B05E8);
  }
  return result;
}

unint64_t sub_25C56C44C()
{
  unint64_t result = qword_26A5B05F0;
  if (!qword_26A5B05F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B05F0);
  }
  return result;
}

unint64_t sub_25C56C4A4()
{
  unint64_t result = qword_26A5B05F8;
  if (!qword_26A5B05F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B05F8);
  }
  return result;
}

unint64_t sub_25C56C4FC()
{
  unint64_t result = qword_26A5B0600;
  if (!qword_26A5B0600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0600);
  }
  return result;
}

unint64_t sub_25C56C554()
{
  unint64_t result = qword_26A5B0608;
  if (!qword_26A5B0608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0608);
  }
  return result;
}

unint64_t sub_25C56C5AC()
{
  unint64_t result = qword_26A5B0610;
  if (!qword_26A5B0610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0610);
  }
  return result;
}

unint64_t sub_25C56C604()
{
  unint64_t result = qword_26A5B0618;
  if (!qword_26A5B0618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0618);
  }
  return result;
}

unint64_t sub_25C56C65C()
{
  unint64_t result = qword_26A5B0620;
  if (!qword_26A5B0620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B0620);
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio()
{
  return &type metadata for CommonAudio;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Verb(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CommonAudio.Verb(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x25C56C81CLL);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Verb()
{
  return &type metadata for CommonAudio.Verb;
}

ValueMetadata *type metadata accessor for CommonAudio.UsoEntity()
{
  return &type metadata for CommonAudio.UsoEntity;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Attribute(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CommonAudio.Attribute(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x25C56C9C8);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Attribute()
{
  return &type metadata for CommonAudio.Attribute;
}

ValueMetadata *type metadata accessor for CommonAudio.Modifier()
{
  return &type metadata for CommonAudio.Modifier;
}

unsigned char *sub_25C56CA10(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Noun()
{
  return &type metadata for CommonAudio.Noun;
}

ValueMetadata *type metadata accessor for CommonAudio.RadioType()
{
  return &type metadata for CommonAudio.RadioType;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Confirmation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CommonAudio.Confirmation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C56CB98);
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

ValueMetadata *type metadata accessor for CommonAudio.Confirmation()
{
  return &type metadata for CommonAudio.Confirmation;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Decade(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CommonAudio.Decade(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x25C56CD2CLL);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Decade()
{
  return &type metadata for CommonAudio.Decade;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Sort(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CommonAudio.Sort(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C56CEC0);
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

ValueMetadata *type metadata accessor for CommonAudio.Sort()
{
  return &type metadata for CommonAudio.Sort;
}

uint64_t _s20SiriAudioIntentUtils11CommonAudioV9UsoEntityOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s20SiriAudioIntentUtils11CommonAudioV9UsoEntityOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x25C56D054);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Reference()
{
  return &type metadata for CommonAudio.Reference;
}

uint64_t getEnumTagSinglePayload for CommonAudio.MediaType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE4) {
    goto LABEL_17;
  }
  if (a2 + 28 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 28) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 28;
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
      return (*a1 | (v4 << 8)) - 28;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 28;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1D;
  int v8 = v6 - 29;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CommonAudio.MediaType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 28 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 28) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE3)
  {
    unsigned int v6 = ((a2 - 228) >> 8) + 1;
    *unint64_t result = a2 + 28;
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
        JUMPOUT(0x25C56D1E8);
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
          *unint64_t result = a2 + 28;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.MediaType()
{
  return &type metadata for CommonAudio.MediaType;
}

unsigned char *storeEnumTagSinglePayload for CommonAudio.MediaSettingName(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C56D2BCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.MediaSettingName()
{
  return &type metadata for CommonAudio.MediaSettingName;
}

unint64_t sub_25C56D2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25C56EB60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    size_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25C56D584(&qword_26A5B04F0);
      char v15 = sub_25C56ED90();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_25C56D4A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25C56EF90() & 1) == 0)
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
      while (!v14 && (sub_25C56EF90() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25C56D584(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25C56EB60();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25C56D618(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25C56D680()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56D710()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56D79C()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56D81C()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56D87C()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56D8E8()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56D970()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56D9E8()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56DA58()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56DA98()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56DB0C()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56DB4C()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56DBA0()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56DC08()
{
  sub_25C56EDC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25C56DC5C()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56DCC4()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56DD40()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56DDC8()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56DE24()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56DEA8()
{
  return sub_25C56EFE0();
}

uint64_t UsoMediaSettingName.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_25C56E2AC(a1);
}

void sub_25C56DF40()
{
  algn_26A5B0668[5] = 0;
  *(_WORD *)&algn_26A5B0668[6] = -5120;
}

uint64_t static UsoEntity.noEntity.getter()
{
  return sub_25C569BA4(&qword_26A5B03F0, &qword_26A5B0660);
}

void sub_25C56DF94()
{
  qword_26A5B0670 = 2036427888;
  *(void *)algn_26A5B0678 = 0xE400000000000000;
}

uint64_t static UsoVerb.play.getter()
{
  return sub_25C569BA4(&qword_26A5B03F8, &qword_26A5B0670);
}

void sub_25C56DFD8()
{
  qword_26A5B0680 = 1701538156;
  *(void *)algn_26A5B0688 = 0xE400000000000000;
}

uint64_t static UsoVerb.like.getter()
{
  return sub_25C569BA4(&qword_26A5B0400, &qword_26A5B0680);
}

void sub_25C56E01C()
{
  qword_26A5B0690 = 0x656B696C6E75;
  *(void *)algn_26A5B0698 = 0xE600000000000000;
}

uint64_t static UsoVerb.unlike.getter()
{
  return sub_25C569BA4(&qword_26A5B0408, &qword_26A5B0690);
}

uint64_t Domain.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_25C56E2AC(a1);
}

uint64_t Domain.rawValue.getter()
{
  return 0x6F635F616964656DLL;
}

uint64_t sub_25C56E094()
{
  return sub_25C56E698();
}

uint64_t sub_25C56E0D0()
{
  return sub_25C56E634();
}

uint64_t sub_25C56E108@<X0>(BOOL *a1@<X8>)
{
  return sub_25C56E488(a1);
}

uint64_t sub_25C56E114@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Domain.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_25C56E13C()
{
  qword_26A5B06A0 = 1701667182;
  *(void *)algn_26A5B06A8 = 0xE400000000000000;
}

uint64_t static UsoMediaSettingName.settingNameField.getter()
{
  return sub_25C569BA4(&qword_26A5B0410, &qword_26A5B06A0);
}

unint64_t static UsoMediaSettingName.namespace.getter()
{
  return 0xD000000000000010;
}

uint64_t UsoMediaSettingName.rawValue.getter()
{
  return 0x79616C70726961;
}

uint64_t sub_25C56E1B4()
{
  return sub_25C56E698();
}

uint64_t sub_25C56E1E0()
{
  return sub_25C56E634();
}

uint64_t sub_25C56E20C@<X0>(BOOL *a1@<X8>)
{
  return sub_25C56E488(a1);
}

uint64_t sub_25C56E218@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UsoMediaSettingName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_25C56E240()
{
  qword_26A5B06B0 = 1701667182;
  *(void *)algn_26A5B06B8 = 0xE400000000000000;
}

uint64_t static UsoMediaPlayerAttributes.mediaPlayerNameField.getter()
{
  return sub_25C569BA4(&qword_26A5B0418, &qword_26A5B06B0);
}

unint64_t static UsoMediaPlayerAttributes.namespace.getter()
{
  return 0xD000000000000015;
}

uint64_t UsoMediaPlayerAttributes.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_25C56E2AC(a1);
}

uint64_t sub_25C56E2AC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25C56EF80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t UsoMediaPlayerAttributes.rawValue.getter()
{
  return 0x64656C6666756873;
}

unint64_t sub_25C56E31C()
{
  unint64_t result = qword_26A5B06C0;
  if (!qword_26A5B06C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B06C0);
  }
  return result;
}

unint64_t sub_25C56E374()
{
  unint64_t result = qword_26A5B06C8;
  if (!qword_26A5B06C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B06C8);
  }
  return result;
}

unint64_t sub_25C56E3CC()
{
  unint64_t result = qword_26A5B06D0;
  if (!qword_26A5B06D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A5B06D0);
  }
  return result;
}

uint64_t sub_25C56E420()
{
  return sub_25C56E698();
}

uint64_t sub_25C56E450()
{
  return sub_25C56E634();
}

uint64_t sub_25C56E47C@<X0>(BOOL *a1@<X8>)
{
  return sub_25C56E488(a1);
}

uint64_t sub_25C56E488@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25C56EF80();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_25C56E4D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UsoMediaPlayerAttributes.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for UsoEntity()
{
  return &type metadata for UsoEntity;
}

ValueMetadata *type metadata accessor for UsoVerb()
{
  return &type metadata for UsoVerb;
}

ValueMetadata *type metadata accessor for Domain()
{
  return &type metadata for Domain;
}

ValueMetadata *type metadata accessor for UsoMediaSettingName()
{
  return &type metadata for UsoMediaSettingName;
}

unsigned char *_s20SiriAudioIntentUtils19UsoMediaSettingNameOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C56E5E4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UsoMediaPlayerAttributes()
{
  return &type metadata for UsoMediaPlayerAttributes;
}

uint64_t sub_25C56E61C()
{
  return sub_25C56E634();
}

uint64_t sub_25C56E634()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56E680()
{
  return sub_25C56E698();
}

uint64_t sub_25C56E698()
{
  return sub_25C56EFE0();
}

uint64_t sub_25C56E6E8()
{
  return sub_25C56EDC0();
}

uint64_t sub_25C56E70C()
{
  return sub_25C56EDC0();
}

uint64_t sub_25C56E724()
{
  return sub_25C56EDC0();
}

uint64_t dispatch thunk of ConfirmableIntent.confirmationState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_25C56E750()
{
  uint64_t v0 = sub_25C56ED60();
  __swift_allocate_value_buffer(v0, qword_26A5B2000);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A5B2000);
  if (qword_26A5B03C0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26A5B1FE0;
  return sub_25C56ED70();
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

uint64_t sub_25C56E840()
{
  return MEMORY[0x270F6A758]();
}

uint64_t sub_25C56E850()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_25C56E860()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_25C56E870()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_25C56E880()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_25C56E890()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t sub_25C56E8A0()
{
  return MEMORY[0x270F6BFB8]();
}

uint64_t sub_25C56E8B0()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_25C56E8C0()
{
  return MEMORY[0x270F6C830]();
}

uint64_t sub_25C56E8D0()
{
  return MEMORY[0x270F6C960]();
}

uint64_t sub_25C56E8E0()
{
  return MEMORY[0x270F6C970]();
}

uint64_t sub_25C56E8F0()
{
  return MEMORY[0x270F6C980]();
}

uint64_t sub_25C56E900()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t sub_25C56E910()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t sub_25C56E920()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_25C56E930()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_25C56E940()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_25C56E950()
{
  return MEMORY[0x270F6CD30]();
}

uint64_t sub_25C56E960()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t sub_25C56E970()
{
  return MEMORY[0x270F6CD40]();
}

uint64_t sub_25C56E980()
{
  return MEMORY[0x270F6CD50]();
}

uint64_t sub_25C56E990()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t sub_25C56E9A0()
{
  return MEMORY[0x270F6CE38]();
}

uint64_t sub_25C56E9B0()
{
  return MEMORY[0x270F6D200]();
}

uint64_t sub_25C56E9C0()
{
  return MEMORY[0x270F6D340]();
}

uint64_t sub_25C56E9D0()
{
  return MEMORY[0x270F6D348]();
}

uint64_t sub_25C56E9E0()
{
  return MEMORY[0x270F6D358]();
}

uint64_t sub_25C56E9F0()
{
  return MEMORY[0x270F6D430]();
}

uint64_t sub_25C56EA00()
{
  return MEMORY[0x270F6D438]();
}

uint64_t sub_25C56EA10()
{
  return MEMORY[0x270F6D448]();
}

uint64_t sub_25C56EA20()
{
  return MEMORY[0x270F6D450]();
}

uint64_t sub_25C56EA30()
{
  return MEMORY[0x270F6D458]();
}

uint64_t sub_25C56EA40()
{
  return MEMORY[0x270F6D460]();
}

uint64_t sub_25C56EA50()
{
  return MEMORY[0x270F6D468]();
}

uint64_t sub_25C56EA60()
{
  return MEMORY[0x270F6D4F8]();
}

uint64_t sub_25C56EA70()
{
  return MEMORY[0x270F6D508]();
}

uint64_t sub_25C56EA80()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_25C56EA90()
{
  return MEMORY[0x270F6D5B8]();
}

uint64_t sub_25C56EAA0()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_25C56EAB0()
{
  return MEMORY[0x270F6D5D0]();
}

uint64_t sub_25C56EAC0()
{
  return MEMORY[0x270F6D5D8]();
}

uint64_t sub_25C56EAD0()
{
  return MEMORY[0x270F6D660]();
}

uint64_t sub_25C56EAE0()
{
  return MEMORY[0x270F6D688]();
}

uint64_t sub_25C56EAF0()
{
  return MEMORY[0x270F6D968]();
}

uint64_t sub_25C56EB00()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_25C56EB10()
{
  return MEMORY[0x270F6DA50]();
}

uint64_t sub_25C56EB20()
{
  return MEMORY[0x270F6DA68]();
}

uint64_t sub_25C56EB30()
{
  return MEMORY[0x270F6DA80]();
}

uint64_t sub_25C56EB40()
{
  return MEMORY[0x270F6DA88]();
}

uint64_t sub_25C56EB50()
{
  return MEMORY[0x270F6DC20]();
}

uint64_t sub_25C56EB60()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t sub_25C56EB70()
{
  return MEMORY[0x270F6DCA8]();
}

uint64_t sub_25C56EB80()
{
  return MEMORY[0x270F6DCB8]();
}

uint64_t sub_25C56EB90()
{
  return MEMORY[0x270F6DCC8]();
}

uint64_t sub_25C56EBA0()
{
  return MEMORY[0x270F6DCD0]();
}

uint64_t sub_25C56EBB0()
{
  return MEMORY[0x270F6DD28]();
}

uint64_t sub_25C56EBC0()
{
  return MEMORY[0x270F6DF28]();
}

uint64_t sub_25C56EBD0()
{
  return MEMORY[0x270F6DF30]();
}

uint64_t sub_25C56EBE0()
{
  return MEMORY[0x270F6DF48]();
}

uint64_t sub_25C56EBF0()
{
  return MEMORY[0x270F6DF58]();
}

uint64_t sub_25C56EC00()
{
  return MEMORY[0x270F6DF70]();
}

uint64_t sub_25C56EC10()
{
  return MEMORY[0x270F6DF78]();
}

uint64_t sub_25C56EC20()
{
  return MEMORY[0x270F6E0F8]();
}

uint64_t sub_25C56EC30()
{
  return MEMORY[0x270F6E100]();
}

uint64_t sub_25C56EC40()
{
  return MEMORY[0x270F6E108]();
}

uint64_t sub_25C56EC50()
{
  return MEMORY[0x270F6E110]();
}

uint64_t sub_25C56EC60()
{
  return MEMORY[0x270F6E188]();
}

uint64_t sub_25C56EC70()
{
  return MEMORY[0x270F6E1A8]();
}

uint64_t sub_25C56EC80()
{
  return MEMORY[0x270F6E1E0]();
}

uint64_t sub_25C56EC90()
{
  return MEMORY[0x270F6E1E8]();
}

uint64_t sub_25C56ECA0()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_25C56ECB0()
{
  return MEMORY[0x270F6E1F8]();
}

uint64_t sub_25C56ECC0()
{
  return MEMORY[0x270F6E200]();
}

uint64_t sub_25C56ECD0()
{
  return MEMORY[0x270F6E208]();
}

uint64_t sub_25C56ECE0()
{
  return MEMORY[0x270F6E3F0]();
}

uint64_t sub_25C56ECF0()
{
  return MEMORY[0x270F6E400]();
}

uint64_t sub_25C56ED00()
{
  return MEMORY[0x270F6E408]();
}

uint64_t sub_25C56ED10()
{
  return MEMORY[0x270F6E588]();
}

uint64_t sub_25C56ED20()
{
  return MEMORY[0x270F6E590]();
}

uint64_t sub_25C56ED30()
{
  return MEMORY[0x270F6F340]();
}

uint64_t sub_25C56ED40()
{
  return MEMORY[0x270F6F348]();
}

uint64_t sub_25C56ED50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25C56ED60()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25C56ED70()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_25C56ED80()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25C56ED90()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25C56EDA0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25C56EDB0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25C56EDC0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25C56EDD0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25C56EDE0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25C56EDF0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25C56EE00()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25C56EE10()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25C56EE20()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25C56EE30()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25C56EE40()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25C56EE50()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25C56EE60()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_25C56EE70()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25C56EE80()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25C56EE90()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25C56EEA0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25C56EEB0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25C56EEC0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25C56EED0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25C56EEE0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25C56EEF0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25C56EF00()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25C56EF10()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25C56EF20()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25C56EF30()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25C56EF40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25C56EF50()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25C56EF60()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25C56EF70()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25C56EF80()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25C56EF90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25C56EFA0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25C56EFB0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25C56EFC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25C56EFD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25C56EFE0()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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