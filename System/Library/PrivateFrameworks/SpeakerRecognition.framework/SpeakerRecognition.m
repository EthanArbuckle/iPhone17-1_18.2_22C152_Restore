uint64_t variable initialization expression of VTUITrainingSpeechDonation.audioFormat()
{
  return 0;
}

uint64_t variable initialization expression of VTUITrainingSpeechDonation.defaultUUID()
{
  return sub_21C92C2B8();
}

id VTUITrainingSpeechDonation.__allocating_init(donorBundleID:recordingDate:locale:transcription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7 = v6;
  v13 = (char *)objc_allocWithZone(v7);
  *(void *)&v13[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_audioFormat] = 0;
  v14 = v13;
  sub_21C92C2B8();
  v15 = &v14[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_donorBundleID];
  *(void *)v15 = a1;
  *((void *)v15 + 1) = a2;
  v16 = &v14[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_recordingDate];
  uint64_t v17 = sub_21C92C288();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a3, v17);
  v19 = &v14[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_locale];
  uint64_t v20 = sub_21C92C2F8();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v19, a4, v20);
  v22 = &v14[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_transcription];
  *(void *)v22 = a5;
  *((void *)v22 + 1) = a6;

  v26.receiver = v14;
  v26.super_class = v7;
  id v23 = objc_msgSendSuper2(&v26, sel_init, 0);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a4, v20);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a3, v17);
  return v23;
}

id VTUITrainingSpeechDonation.init(donorBundleID:recordingDate:locale:transcription:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)&v6[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_audioFormat] = 0;
  v13 = v6;
  sub_21C92C2B8();
  v14 = &v13[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_donorBundleID];
  *(void *)v14 = a1;
  *((void *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_recordingDate];
  uint64_t v16 = sub_21C92C288();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a3, v16);
  uint64_t v18 = &v13[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_locale];
  uint64_t v19 = sub_21C92C2F8();
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v18, a4, v19);
  uint64_t v21 = &v13[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_transcription];
  *(void *)uint64_t v21 = a5;
  *((void *)v21 + 1) = a6;

  v24.receiver = v13;
  v24.super_class = (Class)type metadata accessor for VTUITrainingSpeechDonation();
  id v22 = objc_msgSendSuper2(&v24, sel_init, 0);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a4, v19);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, v16);
  return v22;
}

uint64_t type metadata accessor for VTUITrainingSpeechDonation()
{
  uint64_t result = qword_267C92128;
  if (!qword_267C92128) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t VTUITrainingSpeechDonation.donate(audioBuffer:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v52 = a1;
  v55 = a2;
  uint64_t v49 = sub_21C92C2D8();
  uint64_t v54 = *(void *)(v49 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v53 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C920E0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v50 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C920E8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v51 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C920F0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v48 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C920F8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v44 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_21C92C2F8();
  uint64_t v8 = *(void *)(v43 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[0] = v10;
  uint64_t v11 = sub_21C92C288();
  uint64_t v12 = *(void *)(v11 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[1] = v14;
  uint64_t v45 = sub_21C92C368();
  uint64_t v15 = *(void *)(v45 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  uint64_t v17 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v46 = (char *)v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v42 - v18;
  uint64_t v20 = swift_allocBox();
  uint64_t v56 = v21;
  uint64_t v57 = v20;
  sub_21C92C2C8();
  dispatch_semaphore_t v47 = dispatch_semaphore_create(0);
  v42[2] = *(void *)&v2[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_donorBundleID];
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, &v2[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_recordingDate], v11);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, &v2[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_locale], v43);
  uint64_t v43 = *(void *)&v2[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_transcription];
  uint64_t v22 = sub_21C92C338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v44, 1, 1, v22);
  uint64_t v23 = sub_21C92C378();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v48, 1, 1, v23);
  uint64_t v24 = sub_21C92C318();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v51, 1, 1, v24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = v45;
  sub_21C92C328();
  uint64_t v26 = sub_21C92C3D8();
  uint64_t v27 = (uint64_t)v50;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v50, 1, 1, v26);
  v28 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v29 = v46;
  v51 = v19;
  v28(v46, v19, v25);
  unint64_t v30 = (*(unsigned __int8 *)(v15 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v31 = (v16 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  v32 = (char *)swift_allocObject();
  *((void *)v32 + 2) = 0;
  *((void *)v32 + 3) = 0;
  *((void *)v32 + 4) = v57;
  uint64_t v52 = v15;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v32[v30], v29, v25);
  *(void *)&v32[v31] = v2;
  dispatch_semaphore_t v33 = v47;
  *(void *)&v32[(v31 + 15) & 0xFFFFFFFFFFFFFFF8] = v47;
  swift_retain();
  v2;
  v34 = v33;
  sub_21C8A94D4(v27, (uint64_t)&unk_267C92108, (uint64_t)v32);
  swift_release();
  sub_21C92C3F8();
  uint64_t v35 = v56;
  swift_beginAccess();
  v37 = v53;
  uint64_t v36 = v54;
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v54 + 16);
  uint64_t v39 = v49;
  v38(v53, v35, v49);
  sub_21C8A9680();
  LOBYTE(v35) = sub_21C92C388();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v39);
  if (v35)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v25);
  }
  else
  {
    id v40 = (id)*MEMORY[0x263F38100];
    sub_21C92C3E8();
    sub_21C92C308();

    (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v25);
  }
  v38(v55, v56, v39);
  return swift_release();
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

uint64_t sub_21C8A8E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C92140);
  uint64_t v8 = swift_task_alloc();
  v7[7] = v8;
  uint64_t v9 = sub_21C92C2D8();
  v7[8] = v9;
  v7[9] = *(void *)(v9 - 8);
  v7[10] = swift_task_alloc();
  v7[11] = swift_projectBox();
  v10 = (void *)swift_task_alloc();
  v7[12] = v10;
  void *v10 = v7;
  v10[1] = sub_21C8A8F60;
  return MEMORY[0x270EFE1C8](v8);
}

uint64_t sub_21C8A8F60()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21C8A905C, 0, 0);
}

uint64_t sub_21C8A905C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[7];
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = v0[10];
  if (v4 == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v5, v0[5] + OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_defaultUUID, v1);
    sub_21C8AAB08(v3, &qword_267C92140);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v5, v3, v1);
  }
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[8];
  uint64_t v9 = v0[9];
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 40))(v7, v6, v8);
  sub_21C92C408();
  swift_task_dealloc();
  swift_task_dealloc();
  v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_21C8A919C()
{
  uint64_t v1 = sub_21C92C368();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

uint64_t sub_21C8A929C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_21C92C368() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = (uint64_t)v1 + v5;
  uint64_t v11 = *(void *)((char *)v1 + v6);
  uint64_t v12 = *(void *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  void *v13 = v2;
  v13[1] = sub_21C8A93E0;
  return sub_21C8A8E18(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_21C8A93E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21C8A94D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21C92C3D8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21C92C3C8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21C8AAB08(a1, &qword_267C920E0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21C92C3B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_21C8A9680()
{
  unint64_t result = qword_267C92110;
  if (!qword_267C92110)
  {
    sub_21C92C2D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267C92110);
  }
  return result;
}

uint64_t VTUITrainingSpeechDonation.donate(audioBuffer:speechId:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  unint64_t v5 = v4;
  uint64_t v64 = a2;
  uint64_t v65 = a3;
  v63 = a1;
  v68 = a4;
  uint64_t v61 = sub_21C92C2D8();
  uint64_t v67 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v66 = (char *)v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C920E0);
  MEMORY[0x270FA5388](v7 - 8);
  v62 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C920E8);
  MEMORY[0x270FA5388](v9 - 8);
  v60 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C920F0);
  MEMORY[0x270FA5388](v11 - 8);
  v58 = (char *)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C920F8);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v54 = (char *)v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21C92C2F8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_21C92C288();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_21C92C368();
  uint64_t v57 = *(void *)(v69 - 8);
  uint64_t v23 = *(void *)(v57 + 64);
  uint64_t v24 = MEMORY[0x270FA5388](v69);
  uint64_t v56 = (char *)v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)v53 - v25;
  uint64_t v27 = swift_allocBox();
  uint64_t v70 = v28;
  uint64_t v71 = v27;
  sub_21C92C2C8();
  dispatch_semaphore_t v59 = dispatch_semaphore_create(0);
  v53[1] = *(void *)&v5[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_donorBundleID];
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v22, &v5[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_recordingDate], v19);
  v55 = v5;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v18, &v5[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_locale], v15);
  v53[0] = *(void *)&v5[OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_transcription];
  uint64_t v29 = sub_21C92C338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v54, 1, 1, v29);
  uint64_t v30 = sub_21C92C378();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v58, 1, 1, v30);
  uint64_t v31 = sub_21C92C318();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v60, 1, 1, v31);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v32 = v69;
  sub_21C92C328();
  uint64_t v33 = sub_21C92C3D8();
  uint64_t v34 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v62, 1, 1, v33);
  uint64_t v35 = v56;
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  v63 = v26;
  v37 = v26;
  uint64_t v38 = v57;
  v36(v56, v37, v32);
  unint64_t v39 = (*(unsigned __int8 *)(v38 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  unint64_t v40 = (v23 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v41 = (char *)swift_allocObject();
  *((void *)v41 + 2) = 0;
  *((void *)v41 + 3) = 0;
  uint64_t v42 = v65;
  *((void *)v41 + 4) = v64;
  *((void *)v41 + 5) = v42;
  *((void *)v41 + 6) = v71;
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v41[v39], v35, v32);
  uint64_t v43 = v55;
  *(void *)&v41[v40] = v55;
  dispatch_semaphore_t v44 = v59;
  *(void *)&v41[(v40 + 15) & 0xFFFFFFFFFFFFFFF8] = v59;
  swift_bridgeObjectRetain();
  swift_retain();
  v43;
  uint64_t v45 = v44;
  sub_21C8A94D4(v34, (uint64_t)&unk_267C92120, (uint64_t)v41);
  swift_release();
  sub_21C92C3F8();
  uint64_t v46 = v70;
  swift_beginAccess();
  v48 = v66;
  uint64_t v47 = v67;
  uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 16);
  uint64_t v50 = v61;
  v49(v66, v46, v61);
  sub_21C8A9680();
  LOBYTE(v46) = sub_21C92C388();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v50);
  if (v46)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v63, v69);
  }
  else
  {
    id v51 = (id)*MEMORY[0x263F38100];
    sub_21C92C3E8();
    sub_21C92C308();

    (*(void (**)(char *, uint64_t))(v38 + 8))(v63, v69);
  }
  v49(v68, v70, v50);
  return swift_release();
}

uint64_t sub_21C8A9FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a8;
  v8[9] = v12;
  v8[6] = a5;
  v8[7] = a7;
  v8[5] = a4;
  uint64_t v9 = sub_21C92C2D8();
  v8[10] = v9;
  v8[11] = *(void *)(v9 - 8);
  v8[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C92140);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_21C8AA0EC, 0, 0);
}

uint64_t sub_21C8AA0EC()
{
  sub_21C92C298();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[16] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21C8AA194;
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  return MEMORY[0x270EFE1C0](v2, v3);
}

uint64_t sub_21C8AA194()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_21C8AA290, 0, 0);
}

uint64_t sub_21C8AA290()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[12];
  if (v4 == 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v0[8] + OBJC_IVAR____TtC18SpeakerRecognition26VTUITrainingSpeechDonation_defaultUUID, v2);
    sub_21C8AAB08(v1, &qword_267C92140);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v5, v1, v2);
  }
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[15];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[11];
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40))(v7, v8, v9);
  sub_21C92C408();
  sub_21C8AAB08(v6, &qword_267C92140);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_21C8AA3F4()
{
  uint64_t v1 = sub_21C92C368();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

uint64_t sub_21C8AA4FC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_21C92C368() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[6];
  uint64_t v11 = (uint64_t)v1 + v5;
  uint64_t v12 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  void *v13 = v2;
  v13[1] = sub_21C8AAE28;
  return sub_21C8A9FCC(a1, v6, v7, v8, v9, v10, v11, v12);
}

id VTUITrainingSpeechDonation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void VTUITrainingSpeechDonation.init()()
{
}

id VTUITrainingSpeechDonation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VTUITrainingSpeechDonation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C8AA9A4()
{
  return type metadata accessor for VTUITrainingSpeechDonation();
}

uint64_t sub_21C8AA9AC()
{
  uint64_t result = sub_21C92C288();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_21C92C2F8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_21C92C2D8();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

unint64_t sub_21C8AAAC8()
{
  unint64_t result = qword_267C92138;
  if (!qword_267C92138)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267C92138);
  }
  return result;
}

uint64_t sub_21C8AAB08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21C8AAB64(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21C8AAC40;
  return v6(a1);
}

uint64_t sub_21C8AAC40()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21C8AAD38()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21C8AAD70(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_21C8A93E0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267C92148 + dword_267C92148);
  return v6(a1, v4);
}

uint64_t _vtPhraseTypeDidChangeNotificationReceived(uint64_t a1, void *a2)
{
  return [a2 vtPhraseTypeDidChangeNotificationReceived];
}

void CSSecureLogInitIfNeeded()
{
  if (CSSecureLogInitIfNeeded_once != -1) {
    dispatch_once(&CSSecureLogInitIfNeeded_once, &__block_literal_global_34);
  }
}

void __CSSecureLogInitIfNeeded_block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  os_log_t v0 = os_log_create("com.apple.corespeech", "ExclaveKit");
  uint64_t v1 = (void *)CSLogContextFacilityCoreSpeechExclave;
  CSLogContextFacilityCoreSpeechExclave = (uint64_t)v0;

  uint64_t v2 = CSLogContextFacilityCoreSpeechExclave;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "CSSecureLogInitIfNeeded_block_invoke";
    _os_log_impl(&dword_21C8A5000, v2, OS_LOG_TYPE_DEFAULT, "%s ::: CoreSpeech Secure logging initialized", (uint8_t *)&v3, 0xCu);
  }
}

void sub_21C8AFAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8AFCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8B01A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21C8B0724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_21C8B09C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8B0B58(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_21C8B0F74(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2)
  {
    uint64_t v12 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      uint64_t v13 = NSString;
      (*(void (**)(void *))(*(void *)v12 + 16))(v12);
      uint64_t v14 = [v13 stringWithFormat:@"Exception adding audio: %s"];
      uint64_t v15 = *MEMORY[0x263F37FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "-[SSRSpeakerAnalyzerPSR processAudioData:]";
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = v14;
        _os_log_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&buf, 0x16u);
      }

      __cxa_end_catch();
    }
    else
    {
      uint64_t v16 = *MEMORY[0x263F37FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[SSRSpeakerAnalyzerPSR processAudioData:]";
        _os_log_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Unknown Exception adding audio:", (uint8_t *)&buf, 0xCu);
      }
      __cxa_end_catch();
    }
    JUMPOUT(0x21C8B0F40);
  }
  _Unwind_Resume(a1);
}

void sub_21C8B15A8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, long long buf)
{
  if (a2)
  {

    uint64_t v20 = __cxa_begin_catch(a1);
    uint64_t v21 = *MEMORY[0x263F37FA0];
    BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT);
    if (a2 == 2)
    {
      if (v22)
      {
        uint64_t v23 = *(uint64_t (**)(void *))(*(void *)v20 + 16);
        uint64_t v24 = v21;
        uint64_t v25 = v23(v20);
        LODWORD(buf) = 136315394;
        *(void *)((char *)&buf + 4) = "-[SSRSpeakerAnalyzerPSR initWithVoiceRecognitionContext:delegate:]";
        WORD6(buf) = 2080;
        *(void *)((char *)&buf + 14) = v25;
        _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s ERR: Exception creating EARSyncPSRAudioProcessor: %s", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v22)
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[SSRSpeakerAnalyzerPSR initWithVoiceRecognitionContext:delegate:]";
      _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s ERR: Unknown exception creating EARSyncPSRAudioProcessor", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v26 = [v13 logAggregator];
    [v26 setSpeakerRecognitionPSRProcessingStatus:103];

    __cxa_end_catch();
    JUMPOUT(0x21C8B1558);
  }
  _Unwind_Resume(a1);
}

void sub_21C8B3B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21C8B4184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21C8B5A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__761(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__762(uint64_t a1)
{
}

void sub_21C8B7FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__876(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__877(uint64_t a1)
{
}

void sub_21C8B89D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8B908C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8B92BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1003(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1004(uint64_t a1)
{
}

void sub_21C8BA77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8BC954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1208(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1209(uint64_t a1)
{
}

void sub_21C8BEC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1351(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1352(uint64_t a1)
{
}

void sub_21C8BF0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8C1EAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21C8C2670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1500(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1501(uint64_t a1)
{
}

void sub_21C8C2CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8C4C6C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    uint64_t v10 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "-[SSRSpeakerRecognitionScorer getSpeakerVectorAtIndex:]";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = v9;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s ERR: Exception in getting vector at index %u", (uint8_t *)&a9, 0x12u);
    }
    objc_end_catch();
    JUMPOUT(0x21C8C4B8CLL);
  }
  _Unwind_Resume(a1);
}

void sub_21C8C5598(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    uint64_t v10 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "-[SSRSpeakerRecognitionScorer scoreSpeakerVector:withDimensions:withThresholdType:]";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = v9;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s ERR: Exception in getting score for vector with %u dimensions", (uint8_t *)&a9, 0x12u);
    }
    objc_end_catch();
    JUMPOUT(0x21C8C5558);
  }
  _Unwind_Resume(a1);
}

void sub_21C8C5A5C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2)
  {
    objc_begin_catch(a1);
    uint64_t v10 = *MEMORY[0x263F37FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA0], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 136315394;
      *(void *)((char *)&a9 + 4) = "-[SSRSpeakerRecognitionScorer analyzeSpeakerVector:withDimensions:withThresholdType:]";
      WORD6(a9) = 1024;
      *(_DWORD *)((char *)&a9 + 14) = v9;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s ERR: Exception in getting score for vector with %u dimensions", (uint8_t *)&a9, 0x12u);
    }
    objc_end_catch();
    JUMPOUT(0x21C8C5A1CLL);
  }
  _Unwind_Resume(a1);
}

void sub_21C8C65EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8CA194(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2124(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2125(uint64_t a1)
{
}

void sub_21C8CDFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v27 - 192), 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2372(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2373(uint64_t a1)
{
}

void sub_21C8CEEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2536(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2537(uint64_t a1)
{
}

void sub_21C8CF8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_21C8D1204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8D1674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SSRSpeakerProfileEmbeddingServiceGetXPCInterface()
{
  os_log_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD49FA0];
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_refreshEmbeddingsforLanguageCode_withCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t SSRSpeakerProfileEmbeddingServiceDelegateGetXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD5A2C8];
}

void sub_21C8D3E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21C8D42FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v21 - 144), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3223(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3224(uint64_t a1)
{
}

void sub_21C8D45D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8D4784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_21C8D49A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21C8D4C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21C8D5054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21C8D5864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_21C8D6438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_21C8D6774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8D7234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_21C8D7C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8D7D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8D7F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8D8330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21C8D9ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t __Block_byref_object_copy__3793(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3794(uint64_t a1)
{
}

void sub_21C8DD794(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3950(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3951(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__4111(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4112(uint64_t a1)
{
}

void sub_21C8E1018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8E144C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8E1C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v26 - 128));
  _Unwind_Resume(a1);
}

void sub_21C8E63EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {

    __cxa_begin_catch(exception_object);
    uint64_t v15 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[SSRTriggerPhraseDetectorQuasar endAudio]";
      _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s ERR: endAudio failed", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x21C8E63A4);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C8E6638(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {

    __cxa_begin_catch(exception_object);
    uint64_t v15 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = "-[SSRTriggerPhraseDetectorQuasar analyzeWavData:numSamples:]";
      _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s ERR: processAudioChunk failed", (uint8_t *)&a9, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x21C8E65E8);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C8E6908(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    uint64_t v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[SSRTriggerPhraseDetectorQuasar initWithLocale:configPath:resourcePath:]";
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Failed initialization in _EARSyncSpeechRecognizer initWithConfiguration", (uint8_t *)&buf, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x21C8E68C0);
  }
  _Unwind_Resume(a1);
}

void sub_21C8E7BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21C8E8278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4887(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4888(uint64_t a1)
{
}

void sub_21C8E90D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21C8EA170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8EA9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SSRShouldUseTDTIWithAsset(void *a1)
{
  id v1 = a1;
  if (CSIsCommunalDevice())
  {
    uint64_t v2 = 1;
  }
  else if ((CSIsIOS() & 1) != 0 || CSIsAppleSiliconMac())
  {
    [v1 psrCombinationWeight];
    float v4 = v3;
    unsigned int v5 = [v1 useTDTIEnrollment];
    if (v4 == 1.0) {
      uint64_t v2 = v5;
    }
    else {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id SSRVTUITrainingServiceGetXPCInterface()
{
  v17[1] = *MEMORY[0x263EF8340];
  os_log_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD491F0];
  id v1 = (void *)MEMORY[0x263EFFA08];
  v17[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  float v3 = [v1 setWithArray:v2];
  [v0 setClasses:v3 forSelector:sel_trainUtteranceViaXPC_shouldUseASR_completion_ argumentIndex:3 ofReply:1];

  float v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  unsigned int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  uint64_t v6 = [v4 setWithArray:v5];
  [v0 setClasses:v6 forSelector:sel_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult_ argumentIndex:0 ofReply:1];

  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  int v9 = [v7 setWithArray:v8];
  [v0 setClasses:v9 forSelector:sel_trainUtteranceViaXPC_shouldUseASR_mhUUID_completionWithResult_ argumentIndex:2 ofReply:1];

  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  uint64_t v12 = [v10 setWithArray:v11];
  [v0 setClasses:v12 forSelector:sel_voiceProfileWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t SSRVTUITrainingServiceDelegateGetXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD48FD8];
}

void sub_21C8EF594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C8EFBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5217(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5218(uint64_t a1)
{
}

void sub_21C8F02C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_21C8F1D0C(_Unwind_Exception *a1)
{
}

void sub_21C8F2154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5344(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5345(uint64_t a1)
{
}

void sub_21C8F34D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__5538(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5539(uint64_t a1)
{
}

void sub_21C8F4190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5731(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5732(uint64_t a1)
{
}

void sub_21C8F5E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8F7A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C8FC09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

uint64_t __Block_byref_object_copy__6789(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6790(uint64_t a1)
{
}

void sub_21C90193C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C902FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 176), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21C903F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C9064B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C907E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_21C90B5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_21C90BF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C90D65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_21C90F054(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

void sub_21C9106B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_21C9140C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7215(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7216(uint64_t a1)
{
}

void sub_21C91439C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7329(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7330(uint64_t a1)
{
}

void sub_21C915EA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_21C916DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7553(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7554(uint64_t a1)
{
}

void sub_21C91A4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43)
{
}

uint64_t __Block_byref_object_copy__7928(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7929(uint64_t a1)
{
}

void sub_21C91C7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21C91DE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__87(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x21D4B2740](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__88(uint64_t a1)
{
}

void sub_21C91E8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21C9203FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

void sub_21C921D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C924BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBKDeviceClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getBKDeviceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SSRBiometricMatch.m", 18, @"Unable to find class %s", "BKDevice");

    __break(1u);
  }
}

void __getBKDeviceManagerClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BKDeviceManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getBKDeviceManagerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SSRBiometricMatch.m", 19, @"Unable to find class %s", "BKDeviceManager");

    __break(1u);
  }
}

void BiometricKitLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __BiometricKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26442A5B0;
    uint64_t v5 = 0;
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *BiometricKitLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"SSRBiometricMatch.m", 17, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  os_log_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __BiometricKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiometricKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __Block_byref_object_copy__8421(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8422(uint64_t a1)
{
}

uint64_t _SSRVoiceProfileStorePrefsSynchronize()
{
  return CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
}

void _SSRVoiceProfileStorePrefsSetValueForKey(CFPropertyListRef value, CFStringRef key)
{
}

id _SSRVoiceProfileStorePrefsValueForKey(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyAppValue(a1, @"com.apple.speakerrecognition");

  return v1;
}

id _SSRVoiceProfileStorePrefsValueForKeyFromRoot(const __CFString *a1)
{
  uint64_t v1 = (void *)CFPreferencesCopyValue(a1, @"com.apple.speakerrecognition", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);

  return v1;
}

uint64_t SSRRPISamplingXPCGetInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD46B88];
}

uint64_t sub_21C92C278()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21C92C288()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21C92C298()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_21C92C2A8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_21C92C2B8()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_21C92C2C8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21C92C2D8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21C92C2E8()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_21C92C2F8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_21C92C308()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_21C92C318()
{
  return MEMORY[0x270EFE198]();
}

uint64_t sub_21C92C328()
{
  return MEMORY[0x270EFE1A0]();
}

uint64_t sub_21C92C338()
{
  return MEMORY[0x270EFE1B8]();
}

uint64_t sub_21C92C368()
{
  return MEMORY[0x270EFE1D8]();
}

uint64_t sub_21C92C378()
{
  return MEMORY[0x270EFE2D0]();
}

uint64_t sub_21C92C388()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21C92C398()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21C92C3A8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21C92C3B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21C92C3C8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21C92C3D8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21C92C3E8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21C92C3F8()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_21C92C408()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x270F0EEB8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x270F0FCE8](inAudioFile);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x270F0FCF0](inFileRef, inPermissions, *(void *)&inFileTypeHint, outAudioFile);
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AE8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t CSIsASMacWithAOP()
{
  return MEMORY[0x270F235D0]();
}

uint64_t CSIsAppleSiliconMac()
{
  return MEMORY[0x270F235D8]();
}

uint64_t CSIsCommunalDevice()
{
  return MEMORY[0x270F235E0]();
}

uint64_t CSIsGibraltarMac()
{
  return MEMORY[0x270F235E8]();
}

uint64_t CSIsHorseman()
{
  return MEMORY[0x270F235F0]();
}

uint64_t CSIsIOS()
{
  return MEMORY[0x270F235F8]();
}

uint64_t CSIsIPad()
{
  return MEMORY[0x270F23600]();
}

uint64_t CSIsInternalBuild()
{
  return MEMORY[0x270F23608]();
}

uint64_t CSIsMac()
{
  return MEMORY[0x270F23610]();
}

uint64_t CSIsOSX()
{
  return MEMORY[0x270F23618]();
}

uint64_t CSIsTV()
{
  return MEMORY[0x270F23620]();
}

uint64_t CSIsWatch()
{
  return MEMORY[0x270F23628]();
}

uint64_t CSMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x270F23630]();
}

uint64_t CSMachAbsoluteTimeToMachContinuousTime()
{
  return MEMORY[0x270F23638]();
}

uint64_t CSNotBackedupInternalPreferencesSynchronize()
{
  return MEMORY[0x270F23640]();
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x270F0FDC8](inExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x270F0FDE0](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270F0FDF0](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrapAudioFileID(AudioFileID inFileID, Boolean inForWriting, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x270F0FE00](inFileID, inForWriting, outExtAudioFile);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SSRLogInitIfNeeded()
{
  return MEMORY[0x270F23648]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CSNotBackedupPreferencesSetValueForKey()
{
  return MEMORY[0x270F23650]();
}

uint64_t _CSNotBackedupPreferencesValueForKey()
{
  return MEMORY[0x270F23658]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t nd_addresource()
{
  return MEMORY[0x270F84950]();
}

uint64_t nd_close()
{
  return MEMORY[0x270F84958]();
}

uint64_t nd_create()
{
  return MEMORY[0x270F84960]();
}

uint64_t nd_endwavedata()
{
  return MEMORY[0x270F84968]();
}

uint64_t nd_error()
{
  return MEMORY[0x270F84970]();
}

uint64_t nd_getoption()
{
  return MEMORY[0x270F84978]();
}

uint64_t nd_getphraseresults()
{
  return MEMORY[0x270F84980]();
}

uint64_t nd_getresults()
{
  return MEMORY[0x270F84988]();
}

uint64_t nd_getsupervector()
{
  return MEMORY[0x270F84990]();
}

uint64_t nd_initialize()
{
  return MEMORY[0x270F84998]();
}

uint64_t nd_phrasecount()
{
  return MEMORY[0x270F849A0]();
}

uint64_t nd_reset()
{
  return MEMORY[0x270F849A8]();
}

uint64_t nd_sat_analyze()
{
  return MEMORY[0x270F849B0]();
}

uint64_t nd_sat_deletevector()
{
  return MEMORY[0x270F849B8]();
}

uint64_t nd_sat_getspeakervector()
{
  return MEMORY[0x270F849C0]();
}

uint64_t nd_sat_initialize()
{
  return MEMORY[0x270F849C8]();
}

uint64_t nd_sat_update()
{
  return MEMORY[0x270F849D0]();
}

uint64_t nd_sat_vectorcount()
{
  return MEMORY[0x270F849D8]();
}

uint64_t nd_wavedata()
{
  return MEMORY[0x270F849E0]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

uint64_t remote_device_cancel()
{
  return MEMORY[0x270F5A948]();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return MEMORY[0x270F5A950]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x270F5A968]();
}

uint64_t remote_device_copy_unique_of_type()
{
  return MEMORY[0x270F5A978]();
}

uint64_t remote_device_get_type()
{
  return MEMORY[0x270F5A990]();
}

uint64_t remote_device_set_connected_callback()
{
  return MEMORY[0x270F5A998]();
}

uint64_t remote_device_set_disconnected_callback()
{
  return MEMORY[0x270F5A9A0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_file_transfer_create_with_path()
{
  return MEMORY[0x270EDC1E0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x270F5AA38]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x270F5AA48]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x270F5AA60]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x270F5AA68]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x270F5AA70]();
}

uint64_t xpc_remote_connection_send_message_with_reply_sync()
{
  return MEMORY[0x270F5AA78]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x270F5AA90]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}