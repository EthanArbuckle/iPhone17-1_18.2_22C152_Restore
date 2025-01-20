BOOL static EntropyError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EntropyError.hash(into:)()
{
  return sub_256D2E060();
}

uint64_t EntropyError.hashValue.getter()
{
  return sub_256D2E070();
}

BOOL sub_256D29A00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_256D29A18()
{
  return sub_256D2E070();
}

uint64_t sub_256D29A60()
{
  return sub_256D2E060();
}

uint64_t sub_256D29A8C()
{
  return sub_256D2E070();
}

uint64_t sub_256D29AE0()
{
  uint64_t v0 = sub_256D2DE70();
  __swift_allocate_value_buffer(v0, qword_269FDB700);
  __swift_project_value_buffer(v0, (uint64_t)qword_269FDB700);
  return sub_256D2DE60();
}

uint64_t ModelMonitoringLighthouseWorker.doWork(context:durationThreshold:)(uint64_t a1, double a2)
{
  *(double *)(v2 + 104) = a2;
  *(void *)(v2 + 96) = a1;
  uint64_t v3 = sub_256D2DF60();
  *(void *)(v2 + 112) = v3;
  *(void *)(v2 + 120) = *(void *)(v3 - 8);
  *(void *)(v2 + 128) = swift_task_alloc();
  *(void *)(v2 + 136) = swift_task_alloc();
  uint64_t v4 = sub_256D2DF80();
  *(void *)(v2 + 144) = v4;
  *(void *)(v2 + 152) = *(void *)(v4 - 8);
  *(void *)(v2 + 160) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_256D29C98, 0, 0);
}

uint64_t sub_256D29C98()
{
  uint64_t v38 = v0;
  if (sub_256D2DEE0())
  {
    if (qword_269FDB570 != -1) {
      swift_once();
    }
    v1 = *(void **)(v0 + 96);
    uint64_t v2 = sub_256D2DE70();
    __swift_project_value_buffer(v2, (uint64_t)qword_269FDB700);
    id v3 = v1;
    uint64_t v4 = sub_256D2DE50();
    os_log_type_t v5 = sub_256D2DEF0();
    BOOL v6 = os_log_type_enabled(v4, v5);
    v7 = *(void **)(v0 + 96);
    if (v6)
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      v37[0] = v35;
      *(_DWORD *)uint64_t v8 = 136315394;
      uint64_t v9 = sub_256D2DE30();
      *(void *)(v0 + 80) = sub_256D2BB08(v9, v10, v37);
      sub_256D2DF10();
      swift_bridgeObjectRelease();

      *(_WORD *)(v8 + 12) = 2080;
      uint64_t v11 = sub_256D2DE40();
      *(void *)(v0 + 88) = sub_256D2BB08(v11, v12, v37);
      sub_256D2DF10();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_256D28000, v4, v5, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2AF230](v35, -1, -1);
      MEMORY[0x25A2AF230](v8, -1, -1);
    }
    else
    {
    }
    sub_256D2DED0();
    sub_256D2C160(&qword_269FDB538, MEMORY[0x263F8F488]);
    swift_allocError();
    sub_256D2DE80();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v25 = *(uint64_t (**)(void))(v0 + 8);
LABEL_18:
    return v25(0);
  }
  if (sub_256D2DEE0())
  {
    if (qword_269FDB570 != -1) {
      swift_once();
    }
    v13 = *(void **)(v0 + 96);
    uint64_t v14 = sub_256D2DE70();
    __swift_project_value_buffer(v14, (uint64_t)qword_269FDB700);
    id v15 = v13;
    v16 = sub_256D2DE50();
    os_log_type_t v17 = sub_256D2DEF0();
    BOOL v18 = os_log_type_enabled(v16, v17);
    v19 = *(void **)(v0 + 96);
    if (v18)
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v37[0] = v36;
      *(_DWORD *)uint64_t v20 = 136315650;
      uint64_t v21 = sub_256D2DE30();
      *(void *)(v0 + 56) = sub_256D2BB08(v21, v22, v37);
      sub_256D2DF10();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v23 = sub_256D2DE40();
      *(void *)(v0 + 64) = sub_256D2BB08(v23, v24, v37);
      sub_256D2DF10();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 22) = 2048;
      *(void *)(v0 + 72) = 0;
      sub_256D2DF10();
      _os_log_impl(&dword_256D28000, v16, v17, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25A2AF230](v36, -1, -1);
      MEMORY[0x25A2AF230](v20, -1, -1);
    }
    else
    {
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v25 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_18;
  }
  *(void *)(v0 + 168) = 0;
  uint64_t v27 = *(void *)(v0 + 120);
  uint64_t v26 = *(void *)(v0 + 128);
  uint64_t v28 = *(void *)(v0 + 112);
  sub_256D2DF70();
  *(_OWORD *)(v0 + 40) = xmmword_256D2E410;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v29 = sub_256D2C160(&qword_269FDB528, MEMORY[0x263F8F710]);
  sub_256D2DFF0();
  sub_256D2C160(&qword_269FDB530, MEMORY[0x263F8F6D8]);
  sub_256D2DF90();
  v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(void *)(v0 + 176) = v30;
  *(void *)(v0 + 184) = (v27 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v30(v26, v28);
  v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v31;
  void *v31 = v0;
  v31[1] = sub_256D2A2E8;
  uint64_t v33 = *(void *)(v0 + 136);
  uint64_t v32 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2380](v33, v0 + 16, v32, v29);
}

uint64_t sub_256D2A2E8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 176))(*(void *)(v2 + 136), *(void *)(v2 + 112));
    id v3 = sub_256D2A86C;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v6 = *(void *)(v2 + 144);
    (*(void (**)(void, void))(v2 + 176))(*(void *)(v2 + 136), *(void *)(v2 + 112));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    id v3 = sub_256D2A440;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_256D2A440()
{
  uint64_t v27 = v0;
  double v1 = *(double *)(v0 + 104);
  double v2 = *(double *)(v0 + 168) + 0.25;
  if (v2 >= v1 || (sub_256D2DEE0() & 1) != 0)
  {
    if (qword_269FDB570 != -1) {
      swift_once();
    }
    id v3 = *(void **)(v0 + 96);
    uint64_t v4 = sub_256D2DE70();
    __swift_project_value_buffer(v4, (uint64_t)qword_269FDB700);
    id v5 = v3;
    uint64_t v6 = sub_256D2DE50();
    os_log_type_t v7 = sub_256D2DEF0();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = *(void **)(v0 + 96);
    if (v8)
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v26 = v11;
      *(_DWORD *)uint64_t v10 = 136315650;
      uint64_t v12 = sub_256D2DE30();
      *(void *)(v0 + 56) = sub_256D2BB08(v12, v13, &v26);
      sub_256D2DF10();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 12) = 2080;
      uint64_t v14 = sub_256D2DE40();
      *(void *)(v0 + 64) = sub_256D2BB08(v14, v15, &v26);
      sub_256D2DF10();
      swift_bridgeObjectRelease();

      *(_WORD *)(v10 + 22) = 2048;
      *(double *)(v0 + 72) = v2;
      sub_256D2DF10();
      _os_log_impl(&dword_256D28000, v6, v7, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25A2AF230](v11, -1, -1);
      MEMORY[0x25A2AF230](v10, -1, -1);
    }
    else
    {
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v16 = *(uint64_t (**)(BOOL))(v0 + 8);
    return v16(v2 >= v1);
  }
  else
  {
    *(double *)(v0 + 168) = v2;
    uint64_t v19 = *(void *)(v0 + 120);
    uint64_t v18 = *(void *)(v0 + 128);
    uint64_t v20 = *(void *)(v0 + 112);
    sub_256D2DF70();
    *(_OWORD *)(v0 + 40) = xmmword_256D2E410;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v21 = sub_256D2C160(&qword_269FDB528, MEMORY[0x263F8F710]);
    sub_256D2DFF0();
    sub_256D2C160(&qword_269FDB530, MEMORY[0x263F8F6D8]);
    sub_256D2DF90();
    unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    *(void *)(v0 + 176) = v22;
    *(void *)(v0 + 184) = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v22(v18, v20);
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_256D2A2E8;
    uint64_t v25 = *(void *)(v0 + 136);
    uint64_t v24 = *(void *)(v0 + 144);
    return MEMORY[0x270FA2380](v25, v0 + 16, v24, v21);
  }
}

uint64_t sub_256D2A86C()
{
  uint64_t v21 = v0;
  (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
  if (qword_269FDB570 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_256D2DE70();
  __swift_project_value_buffer(v1, (uint64_t)qword_269FDB700);
  double v2 = sub_256D2DE50();
  os_log_type_t v3 = sub_256D2DF00();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_256D28000, v2, v3, "Task interruped while sleeping.", v4, 2u);
    MEMORY[0x25A2AF230](v4, -1, -1);
  }

  uint64_t v5 = *(void *)(v0 + 168);
  if (qword_269FDB570 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void **)(v0 + 96);
  __swift_project_value_buffer(v1, (uint64_t)qword_269FDB700);
  id v7 = v6;
  BOOL v8 = sub_256D2DE50();
  os_log_type_t v9 = sub_256D2DEF0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void **)(v0 + 96);
  if (v10)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v20 = v13;
    *(_DWORD *)uint64_t v12 = 136315650;
    uint64_t v14 = sub_256D2DE30();
    *(void *)(v0 + 56) = sub_256D2BB08(v14, v15, &v20);
    sub_256D2DF10();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v16 = sub_256D2DE40();
    *(void *)(v0 + 64) = sub_256D2BB08(v16, v17, &v20);
    sub_256D2DF10();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 22) = 2048;
    *(void *)(v0 + 72) = v5;
    sub_256D2DF10();
    _os_log_impl(&dword_256D28000, v8, v9, "TaskId: %s, TaskName: %s: currentDuration: %f", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25A2AF230](v13, -1, -1);
    MEMORY[0x25A2AF230](v12, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18(0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

Swift::Double __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ModelMonitoringLighthouseWorker.xLogx(x:)(Swift::Double x)
{
  BOOL v1 = x == 0.0;
  if (x >= 0.0)
  {
    Swift::Double result = 0.0;
    if (!v1) {
      return log(x) * x;
    }
  }
  else
  {
    sub_256D2C1A8();
    swift_allocError();
    *double v2 = 0;
    swift_willThrow();
  }
  return result;
}

Swift::Double __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ModelMonitoringLighthouseWorker.entropy(nums:)(Swift::OpaquePointer nums)
{
  unint64_t v2 = *((void *)nums._rawValue + 2);
  if (v2 > 1)
  {
    uint64_t v4 = (double *)((char *)nums._rawValue + 32);
    if (*((double *)nums._rawValue + 4) >= 0.0)
    {
      uint64_t v7 = 0;
      while (*((double *)nums._rawValue + v7 + 5) >= 0.0)
      {
        if (v2 - 1 == ++v7)
        {
          uint64_t v8 = v2 & 0x7FFFFFFFFFFFFFFELL;
          os_log_type_t v9 = (double *)((char *)nums._rawValue + 40);
          double v1 = 0.0;
          uint64_t v10 = v2 & 0x7FFFFFFFFFFFFFFELL;
          do
          {
            double v1 = v1 + *(v9 - 1) + *v9;
            v9 += 2;
            v10 -= 2;
          }
          while (v10);
          if (v2 != v8)
          {
            unint64_t v11 = v2 - v8;
            uint64_t v12 = (double *)((char *)nums._rawValue + 8 * v8 + 32);
            do
            {
              double v13 = *v12++;
              double v1 = v1 + v13;
              --v11;
            }
            while (v11);
          }
          uint64_t v22 = MEMORY[0x263F8EE78];
          sub_256D2C1FC(0, v2, 0);
          unint64_t v14 = *(void *)(v22 + 16);
          do
          {
            double v15 = *v4;
            unint64_t v16 = *(void *)(v22 + 24);
            unint64_t v17 = v14 + 1;
            if (v14 >= v16 >> 1) {
              sub_256D2C1FC(v16 > 1, v14 + 1, 1);
            }
            Swift::Double result = v15 / v1;
            *(void *)(v22 + 16) = v17;
            *(double *)(v22 + 8 * v14 + 32) = v15 / v1;
            ++v4;
            ++v14;
            --v2;
          }
          while (v2);
          long double v18 = *(double *)(v22 + 32);
          if (v18 < 0.0)
          {
LABEL_27:
            sub_256D2C1A8();
            swift_allocError();
            *uint64_t v21 = 0;
            swift_willThrow();
            swift_bridgeObjectRelease();
            return v1;
          }
          uint64_t v19 = 0;
          unint64_t v20 = v17 - 1;
          double v1 = 0.0;
          while (1)
          {
            if (v18 != 0.0)
            {
              Swift::Double result = v18 * log(v18);
              double v1 = v1 - result;
            }
            if (v20 == v19)
            {
              swift_bridgeObjectRelease();
              return v1;
            }
            if (v19 + 1 > v20) {
              break;
            }
            if (__OFADD__(v19 + 1, 1)) {
              goto LABEL_30;
            }
            long double v18 = *(double *)(v22 + 8 * v19++ + 40);
            if (v18 < 0.0) {
              goto LABEL_27;
            }
          }
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
      }
    }
    sub_256D2C1A8();
    swift_allocError();
    *uint64_t v5 = 0;
  }
  else
  {
    sub_256D2C1A8();
    swift_allocError();
    *os_log_type_t v3 = 1;
  }
  swift_willThrow();
  return v1;
}

Swift::tuple_peopleSuggestionsSize_Int_numNoScore_Int_numMeanDeviations_Int_numEntropyDeviations_Int __swiftcall ModelMonitoringLighthouseWorker.monitorScores(mean:std:entropyMean:entropySd:)(Swift::Double mean, Swift::Double std, Swift::Double entropyMean, Swift::Double entropySd)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  id v12 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v13 = objc_msgSend(v12, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v14 = objc_msgSend(v13, sel_Inference);
  swift_unknownObjectRelease();
  id v15 = objc_msgSend(v14, sel_PeopleSuggestions);
  swift_unknownObjectRelease();
  id v16 = objc_msgSend(v15, sel_publisher);

  v46 = (void (*)(void *))nullsub_1;
  uint64_t v47 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v43 = 1107296256;
  v44 = sub_256D2B604;
  v45 = &block_descriptor;
  unint64_t v17 = _Block_copy(&aBlock);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v9;
  *(Swift::Double *)(v18 + 24) = mean;
  *(Swift::Double *)(v18 + 32) = std;
  *(void *)(v18 + 40) = v10;
  *(Swift::Double *)(v18 + 48) = entropyMean;
  *(Swift::Double *)(v18 + 56) = entropySd;
  *(void *)(v18 + 64) = v11;
  *(void *)(v18 + 72) = v8;
  v46 = sub_256D2C294;
  uint64_t v47 = v18;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v43 = 1107296256;
  v44 = sub_256D2B604;
  v45 = &block_descriptor_11;
  uint64_t v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  id v20 = objc_msgSend(v16, sel_sinkWithCompletion_receiveInput_, v17, v19);
  _Block_release(v19);
  _Block_release(v17);

  if (qword_269FDB570 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_256D2DE70();
  __swift_project_value_buffer(v21, (uint64_t)qword_269FDB700);
  swift_retain();
  uint64_t v22 = sub_256D2DE50();
  os_log_type_t v23 = sub_256D2DEF0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 134217984;
    swift_beginAccess();
    uint64_t aBlock = *(void *)(v8 + 16);
    sub_256D2DF10();
    swift_release();
    _os_log_impl(&dword_256D28000, v22, v23, "mm plugin: peopleSuggestionsSize is %ld.", v24, 0xCu);
    MEMORY[0x25A2AF230](v24, -1, -1);
  }
  else
  {

    swift_release();
  }
  swift_retain();
  uint64_t v25 = sub_256D2DE50();
  os_log_type_t v26 = sub_256D2DEF0();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 134217984;
    swift_beginAccess();
    uint64_t aBlock = *(void *)(v9 + 16);
    sub_256D2DF10();
    swift_release();
    _os_log_impl(&dword_256D28000, v25, v26, "mm plugin: numNoScore is %ld.", v27, 0xCu);
    MEMORY[0x25A2AF230](v27, -1, -1);
  }
  else
  {

    swift_release();
  }
  swift_retain();
  uint64_t v28 = sub_256D2DE50();
  os_log_type_t v29 = sub_256D2DEF0();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v30 = 134217984;
    swift_beginAccess();
    uint64_t aBlock = *(void *)(v10 + 16);
    sub_256D2DF10();
    swift_release();
    _os_log_impl(&dword_256D28000, v28, v29, "mm plugin: numMeanDeviations is %ld.", v30, 0xCu);
    MEMORY[0x25A2AF230](v30, -1, -1);
  }
  else
  {

    swift_release();
  }
  swift_retain();
  v31 = sub_256D2DE50();
  os_log_type_t v32 = sub_256D2DEF0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 134217984;
    swift_beginAccess();
    uint64_t aBlock = *(void *)(v11 + 16);
    sub_256D2DF10();
    swift_release();
    _os_log_impl(&dword_256D28000, v31, v32, "mm plugin: numEntropyDeviations is %ld.", v33, 0xCu);
    MEMORY[0x25A2AF230](v33, -1, -1);
  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  Swift::Int v34 = *(void *)(v8 + 16);
  swift_beginAccess();
  Swift::Int v35 = *(void *)(v9 + 16);
  swift_beginAccess();
  Swift::Int v36 = *(void *)(v10 + 16);
  swift_beginAccess();
  Swift::Int v37 = *(void *)(v11 + 16);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  Swift::Int v38 = v34;
  Swift::Int v39 = v35;
  Swift::Int v40 = v36;
  Swift::Int v41 = v37;
  result.numEntropyDeviations = v41;
  result.numMeanDeviations = v40;
  result.numNoScore = v39;
  result.peopleSuggestionsSize = v38;
  return result;
}

int64_t sub_256D2B608(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

Swift::Int __swiftcall ModelMonitoringLighthouseWorker.monitorVirtualFeatureStore()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  id v1 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v2 = objc_msgSend(v1, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v3 = objc_msgSend(v2, sel_VirtualFeatureStore);
  swift_unknownObjectRelease();
  id v4 = objc_msgSend(v3, sel_publisher);

  uint64_t v18 = nullsub_1;
  uint64_t v19 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  id v16 = sub_256D2B604;
  unint64_t v17 = &block_descriptor_15;
  uint64_t v5 = _Block_copy(&aBlock);
  uint64_t v18 = sub_256D2CB08;
  uint64_t v19 = v0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  id v16 = sub_256D2B604;
  unint64_t v17 = &block_descriptor_18;
  uint64_t v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v7 = objc_msgSend(v4, sel_sinkWithCompletion_receiveInput_, v5, v6);
  _Block_release(v6);
  _Block_release(v5);

  if (qword_269FDB570 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_256D2DE70();
  __swift_project_value_buffer(v8, (uint64_t)qword_269FDB700);
  swift_retain();
  uint64_t v9 = sub_256D2DE50();
  os_log_type_t v10 = sub_256D2DEF0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134217984;
    swift_beginAccess();
    uint64_t aBlock = *(void *)(v0 + 16);
    sub_256D2DF10();
    swift_release();
    _os_log_impl(&dword_256D28000, v9, v10, "mm plugin: featureStoreSize is %ld.", v11, 0xCu);
    MEMORY[0x25A2AF230](v11, -1, -1);
  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  Swift::Int v12 = *(void *)(v0 + 16);
  swift_release();
  return v12;
}

void sub_256D2B990(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void *sub_256D2B9F8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269FDB558);
      os_log_type_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      os_log_type_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_256D2DC1C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_256D2BB08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_256D2BBDC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_256D2DD58((uint64_t)v12, *a3);
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
      sub_256D2DD58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_256D2BBDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_256D2DF20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_256D2BD98(a5, a6);
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
  uint64_t v8 = sub_256D2DF50();
  if (!v8)
  {
    sub_256D2DFA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_256D2DFC0();
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

uint64_t sub_256D2BD98(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_256D2BE30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_256D2C010(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_256D2C010(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_256D2BE30(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_256D2BFA8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_256D2DF30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_256D2DFA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_256D2DE90();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_256D2DFC0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_256D2DFA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_256D2BFA8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269FDB568);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_256D2C010(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FDB568);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_256D2DFC0();
  __break(1u);
  return result;
}

uint64_t sub_256D2C160(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_256D2C1A8()
{
  unint64_t result = qword_269FDB540;
  if (!qword_269FDB540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FDB540);
  }
  return result;
}

uint64_t sub_256D2C1FC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_256D2CDB8(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_256D2C21C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_256D2C244()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_256D2C294(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  double v5 = *(double *)(v1 + 24);
  double v6 = *(double *)(v1 + 32);
  uint64_t v63 = *(void *)(v1 + 40);
  double v7 = *(double *)(v1 + 48);
  double v8 = *(double *)(v1 + 56);
  os_log_t v9 = *(os_log_t *)(v1 + 64);
  uint64_t v10 = *(void *)(v1 + 72);
  id v11 = objc_msgSend(a1, sel_eventBody);
  if (!v11)
  {
    if (qword_269FDB570 != -1) {
LABEL_81:
    }
      swift_once();
    uint64_t v21 = sub_256D2DE70();
    __swift_project_value_buffer(v21, (uint64_t)qword_269FDB700);
    osloga = sub_256D2DE50();
    os_log_type_t v22 = sub_256D2DF00();
    if (os_log_type_enabled(osloga, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v23 = 0;
      _os_log_impl(&dword_256D28000, osloga, v22, "incorrect item in stream", v23, 2u);
      MEMORY[0x25A2AF230](v23, -1, -1);
    }

    return;
  }
  v64 = v11;
  id v12 = objc_msgSend(v11, sel_peopleSuggestions);
  sub_256D2CD78();
  unint64_t v13 = sub_256D2DEA0();

  uint64_t v69 = MEMORY[0x263F8EE78];
  if (v13 >> 62) {
    goto LABEL_77;
  }
  uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    os_log_t v62 = v9;
    os_log_t oslog = (os_log_t)v4;
    if (v14)
    {
      if (v14 < 1) {
        goto LABEL_80;
      }
      uint64_t v4 = 0;
      uint64_t v15 = (void *)MEMORY[0x263F8EE78];
      do
      {
        if ((v13 & 0xC000000000000001) != 0) {
          id v16 = (id)MEMORY[0x25A2AEE30](v4, v13);
        }
        else {
          id v16 = *(id *)(v13 + 8 * v4 + 32);
        }
        uint64_t v2 = v16;
        objc_msgSend(v16, sel_score);
        uint64_t v18 = v17;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v15 = sub_256D2B9F8(0, v15[2] + 1, 1, v15);
        }
        unint64_t v20 = v15[2];
        unint64_t v19 = v15[3];
        unint64_t v3 = v20 + 1;
        if (v20 >= v19 >> 1) {
          uint64_t v15 = sub_256D2B9F8((void *)(v19 > 1), v20 + 1, 1, v15);
        }
        ++v4;
        v15[2] = v3;
        v15[v20 + 4] = v18;
      }
      while (v14 != v4);
      swift_bridgeObjectRelease();
      uint64_t v69 = (uint64_t)v15;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (qword_269FDB570 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_256D2DE70();
    unint64_t v13 = __swift_project_value_buffer(v24, (uint64_t)qword_269FDB700);
    uint64_t v25 = sub_256D2DE50();
    os_log_type_t v26 = sub_256D2DEF0();
    uint64_t v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v4 = swift_slowAlloc();
      uint64_t v2 = (void *)swift_slowAlloc();
      v68 = v2;
      *(_DWORD *)uint64_t v4 = 136315138;
      unint64_t v3 = v4 + 12;
      swift_beginAccess();
      uint64_t v28 = swift_bridgeObjectRetain();
      uint64_t v29 = v10;
      uint64_t v30 = MEMORY[0x25A2AEDA0](v28, MEMORY[0x263F8D538]);
      unint64_t v32 = v31;
      swift_bridgeObjectRelease();
      uint64_t v33 = v30;
      uint64_t v10 = v29;
      v67[0] = COERCE_DOUBLE(sub_256D2BB08(v33, v32, (uint64_t *)&v68));
      sub_256D2DF10();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_256D28000, v25, (os_log_type_t)v27, "mm plugin: scores are %s", (uint8_t *)v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2AF230](v2, -1, -1);
      MEMORY[0x25A2AF230](v4, -1, -1);
    }

    os_log_t v9 = oslog;
    swift_beginAccess();
    uint64_t v34 = *(void *)(v69 + 16);
    if (!v34)
    {
LABEL_34:

      swift_beginAccess();
      if (!__OFADD__(oslog[2].isa, 1))
      {
        ++oslog[2].isa;
        goto LABEL_74;
      }
      goto LABEL_79;
    }
    if (*(double *)(v69 + 32) != -1.0) {
      break;
    }
    if (v34 == 1) {
      goto LABEL_34;
    }
    uint64_t v35 = 5;
    while (1)
    {
      uint64_t v36 = v35 - 3;
      if (__OFADD__(v35 - 4, 1)) {
        break;
      }
      if (*(double *)(v69 + 8 * v35) != -1.0) {
        goto LABEL_36;
      }
      ++v35;
      if (v36 == v34) {
        goto LABEL_34;
      }
    }
    __break(1u);
LABEL_77:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_256D2DFB0();
    swift_bridgeObjectRelease();
  }
LABEL_36:
  if ((unint64_t)v34 < 2)
  {
    uint64_t v37 = 0;
    double v38 = 0.0;
    goto LABEL_41;
  }
  uint64_t v37 = v34 & 0x7FFFFFFFFFFFFFFELL;
  Swift::Int v39 = (double *)(v69 + 40);
  double v38 = 0.0;
  uint64_t v40 = v34 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v38 = v38 + *(v39 - 1) + *v39;
    v39 += 2;
    v40 -= 2;
  }
  while (v40);
  if (v34 != v37)
  {
LABEL_41:
    uint64_t v41 = v34 - v37;
    v42 = (double *)(v69 + 8 * v37 + 32);
    do
    {
      double v43 = *v42++;
      double v38 = v38 + v43;
      --v41;
    }
    while (v41);
  }
  double v44 = v38 / (double)v34;
  if (v5 + v6 + v6 < v44 || v44 < v5 - (v6 + v6))
  {
    swift_beginAccess();
    if (!__OFADD__(*(void *)(v63 + 16), 1))
    {
      ++*(void *)(v63 + 16);
      goto LABEL_50;
    }
    __break(1u);
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
LABEL_50:
  v46 = sub_256D2DE50();
  os_log_type_t v47 = sub_256D2DEF0();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v48 = 134217984;
    v67[0] = v44;
    sub_256D2DF10();
    _os_log_impl(&dword_256D28000, v46, v47, "mm plugin: mean score is %f.", v48, 0xCu);
    MEMORY[0x25A2AF230](v48, -1, -1);
  }

  v67[0] = *(double *)&v69;
  swift_bridgeObjectRetain_n();
  sub_256D2CF18((uint64_t *)v67);
  swift_bridgeObjectRelease();
  if (*(void *)(*(void *)&v67[0] + 16) >= 5uLL) {
    int64_t v49 = 5;
  }
  else {
    int64_t v49 = *(void *)(*(void *)&v67[0] + 16);
  }
  uint64_t v4 = sub_256D2B608(v49, *(uint64_t *)&v67[0]);
  uint64_t v27 = v50;
  uint64_t v2 = v51;
  unint64_t v3 = v52;
  if ((v52 & 1) == 0)
  {
LABEL_56:
    uint64_t v53 = sub_256D2CF84(v4, v27, (uint64_t)v2, v3);
    goto LABEL_63;
  }
  sub_256D2DFE0();
  swift_unknownObjectRetain_n();
  uint64_t v54 = swift_dynamicCastClass();
  if (!v54)
  {
    swift_unknownObjectRelease();
    uint64_t v54 = MEMORY[0x263F8EE78];
  }
  uint64_t v55 = *(void *)(v54 + 16);
  swift_release();
  if (__OFSUB__(v3 >> 1, v2)) {
    goto LABEL_83;
  }
  if (v55 != (v3 >> 1) - (void)v2)
  {
LABEL_84:
    swift_unknownObjectRelease();
    goto LABEL_56;
  }
  uint64_t v53 = swift_dynamicCastClass();
  if (!v53)
  {
    swift_unknownObjectRelease();
    uint64_t v53 = MEMORY[0x263F8EE78];
  }
LABEL_63:
  swift_unknownObjectRelease();
  double v57 = ModelMonitoringLighthouseWorker.entropy(nums:)((Swift::OpaquePointer)v53);
  swift_release();
  if (v56)
  {
    v58 = sub_256D2DE50();
    os_log_type_t v59 = sub_256D2DF00();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v60 = 0;
      _os_log_impl(&dword_256D28000, v58, v59, "mm plugin: Not able to compute the entropy.", v60, 2u);
      MEMORY[0x25A2AF230](v60, -1, -1);
    }

LABEL_74:
    swift_beginAccess();
    if (!__OFADD__(*(void *)(v10 + 16), 1))
    {
      ++*(void *)(v10 + 16);
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }

  if (v7 + v8 >= v57 && v57 >= v7 - v8) {
    goto LABEL_74;
  }
  swift_beginAccess();
  if (!__OFADD__(v62[2].isa, 1))
  {
    ++v62[2].isa;
    goto LABEL_74;
  }
  __break(1u);
  swift_release();
  __break(1u);
}

uint64_t sub_256D2CB08()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 16);
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3) {
    __break(1u);
  }
  else {
    *(void *)(v0 + 16) = v4;
  }
  return result;
}

unint64_t sub_256D2CB5C()
{
  unint64_t result = qword_269FDB548;
  if (!qword_269FDB548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269FDB548);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EntropyError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for EntropyError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x256D2CD1CLL);
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

uint64_t sub_256D2CD44(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_256D2CD4C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EntropyError()
{
  return &type metadata for EntropyError;
}

ValueMetadata *type metadata accessor for ModelMonitoringLighthouseWorker()
{
  return &type metadata for ModelMonitoringLighthouseWorker;
}

unint64_t sub_256D2CD78()
{
  unint64_t result = qword_269FDB550;
  if (!qword_269FDB550)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269FDB550);
  }
  return result;
}

uint64_t sub_256D2CDB8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FDB558);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_256D2DFC0();
  __break(1u);
  return result;
}

uint64_t sub_256D2CF18(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_256D2DC08(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_256D2D138(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_256D2CF84(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v8 = 8 * v5;
    if (v5 <= 0)
    {
      uint64_t v9 = (char *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        uint64_t v12 = v9 + 32;
        unint64_t v13 = (char *)(a2 + 8 * a3);
        if (v13 < &v9[v8 + 32] && v12 < &v13[v8]) {
          goto LABEL_19;
        }
        memcpy(v12, v13, 8 * v5);
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269FDB558);
      uint64_t v9 = (char *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      *((void *)v9 + 2) = v5;
      *((void *)v9 + 3) = 2 * (v11 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_256D2DFC0();
  __break(1u);
  return result;
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

uint64_t sub_256D2D138(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_256D2DFD0();
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
          if (*(double *)v85 >= v83) {
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
  uint64_t v97 = result;
  uint64_t v98 = v3;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      uint64_t v96 = v8;
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
          v88 = v11;
          v89 = v11 + 32;
          uint64_t v90 = *(void *)&v11[16 * v87 + 32];
          uint64_t v91 = *(void *)&v11[16 * v12 + 24];
          sub_256D2D7CC((double *)(v86 + 8 * v90), (double *)(v86 + 8 * *(void *)&v89[16 * v12 - 16]), v86 + 8 * v91, __dst);
          if (v1) {
            break;
          }
          if (v91 < v90) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v88 = sub_256D2DBF4((uint64_t)v88);
          }
          if (v87 >= *((void *)v88 + 2)) {
            goto LABEL_133;
          }
          v92 = &v88[16 * v87 + 32];
          *(void *)v92 = v90;
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
      *(void *)(v96 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v96 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_256D2DEC0();
    *(void *)(v7 + 16) = v6;
    uint64_t v3 = v98;
    uint64_t v96 = v7;
    __dst = (double *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *v2;
  v94 = v2;
  uint64_t v95 = *v2 - 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v99 = *v2;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 < v3)
    {
      double v14 = *(double *)(v10 + 8 * v9);
      double v15 = *(double *)(v10 + 8 * v13);
      uint64_t v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        double v16 = v14;
        while (1)
        {
          double v17 = v16;
          double v16 = *(double *)(v10 + 8 * v9);
          if (v15 < v14 == v17 >= v16) {
            break;
          }
          if (v3 == ++v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v15 < v14)
      {
        if (v9 < v13) {
          goto LABEL_137;
        }
        if (v13 < v9)
        {
          uint64_t v18 = (uint64_t *)(v95 + 8 * v9);
          uint64_t v19 = v9;
          uint64_t v20 = v13;
          uint64_t v21 = (uint64_t *)(v10 + 8 * v13);
          do
          {
            if (v20 != --v19)
            {
              if (!v10) {
                goto LABEL_143;
              }
              uint64_t v22 = *v21;
              *uint64_t v21 = *v18;
              *uint64_t v18 = v22;
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
    uint64_t v23 = v13 + v97;
    if (__OFADD__(v13, v97)) {
      goto LABEL_138;
    }
    if (v23 >= v3) {
      uint64_t v23 = v3;
    }
    if (v23 < v13) {
      break;
    }
    if (v9 != v23)
    {
      uint64_t v24 = (double *)(v95 + 8 * v9);
      do
      {
        double v25 = *(double *)(v10 + 8 * v9);
        uint64_t v26 = v13;
        uint64_t v27 = v24;
        do
        {
          double v28 = *v27;
          if (*v27 >= v25) {
            break;
          }
          if (!v10) {
            goto LABEL_141;
          }
          *uint64_t v27 = v25;
          v27[1] = v28;
          --v27;
          ++v26;
        }
        while (v9 != v26);
        ++v9;
        ++v24;
      }
      while (v9 != v23);
      uint64_t v9 = v23;
    }
LABEL_46:
    if (v9 < v13) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_256D2DA3C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v30 = *((void *)v11 + 2);
    unint64_t v29 = *((void *)v11 + 3);
    unint64_t v12 = v30 + 1;
    uint64_t v10 = v99;
    if (v30 >= v29 >> 1)
    {
      v79 = sub_256D2DA3C((char *)(v29 > 1), v30 + 1, 1, v11);
      uint64_t v10 = v99;
      uint64_t v11 = v79;
    }
    *((void *)v11 + 2) = v12;
    unint64_t v31 = v11 + 32;
    unint64_t v32 = &v11[16 * v30 + 32];
    *(void *)unint64_t v32 = v13;
    *((void *)v32 + 1) = v9;
    if (v30)
    {
      while (1)
      {
        unint64_t v33 = v12 - 1;
        if (v12 >= 4)
        {
          double v38 = &v31[16 * v12];
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
          v46 = &v31[16 * v12 - 32];
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
            v68 = &v31[16 * v33];
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
        v51 = &v31[16 * v12 - 32];
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
        v64 = &v31[16 * v33];
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
        v73 = &v31[16 * v72];
        uint64_t v74 = *(void *)v73;
        v75 = v31;
        v76 = &v31[16 * v33];
        uint64_t v77 = *((void *)v76 + 1);
        sub_256D2D7CC((double *)(v10 + 8 * *(void *)v73), (double *)(v10 + 8 * *(void *)v76), v10 + 8 * v77, __dst);
        if (v1) {
          goto LABEL_113;
        }
        if (v77 < v74) {
          goto LABEL_116;
        }
        if (v33 > *((void *)v11 + 2)) {
          goto LABEL_117;
        }
        *(void *)v73 = v74;
        *(void *)&v75[16 * v72 + 8] = v77;
        unint64_t v78 = *((void *)v11 + 2);
        if (v33 >= v78) {
          goto LABEL_118;
        }
        unint64_t v12 = v78 - 1;
        memmove(v76, v76 + 16, 16 * (v78 - 1 - v33));
        unint64_t v31 = v75;
        *((void *)v11 + 2) = v78 - 1;
        uint64_t v10 = v99;
        if (v78 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v98;
    if (v9 >= v98)
    {
      uint64_t v8 = v96;
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
  uint64_t result = sub_256D2DFA0();
  __break(1u);
  return result;
}

uint64_t sub_256D2D7CC(double *__src, double *a2, unint64_t a3, double *__dst)
{
  unint64_t v4 = __dst;
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
  uint64_t v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      double v16 = &v4[v13];
      uint64_t v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        double v17 = (double *)(a3 - 8);
        while (1)
        {
          uint64_t v18 = v17 + 1;
          uint64_t v19 = v6 - 1;
          double v20 = *(v6 - 1);
          if (v20 >= *(v16 - 1))
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
            uint64_t v24 = --v6;
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
        if (*v4 >= *v6)
        {
          if (v7 != v4) {
            double *v7 = *v4;
          }
          uint64_t v23 = ++v4;
          double v15 = v6;
        }
        else
        {
          double v15 = v6 + 1;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            double *v7 = *v6;
          }
        }
        ++v7;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }
LABEL_42:
    sub_256D2DB38((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_256D2DFC0();
  __break(1u);
  return result;
}

char *sub_256D2DA3C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269FDB560);
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

char *sub_256D2DB38(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_256D2DFC0();
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

char *sub_256D2DBF4(uint64_t a1)
{
  return sub_256D2DA3C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_256D2DC08(uint64_t a1)
{
  return sub_256D2CDB8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_256D2DC1C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_256D2DFC0();
  __break(1u);
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

uint64_t sub_256D2DD58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_256D2DE30()
{
  return MEMORY[0x270F472A0]();
}

uint64_t sub_256D2DE40()
{
  return MEMORY[0x270F472A8]();
}

uint64_t sub_256D2DE50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_256D2DE60()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_256D2DE70()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_256D2DE80()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_256D2DE90()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_256D2DEA0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_256D2DEB0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_256D2DEC0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_256D2DED0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_256D2DEE0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_256D2DEF0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_256D2DF00()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_256D2DF10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_256D2DF20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_256D2DF30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_256D2DF40()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_256D2DF50()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_256D2DF60()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_256D2DF70()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_256D2DF80()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_256D2DF90()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_256D2DFA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_256D2DFB0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_256D2DFC0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_256D2DFD0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_256D2DFE0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_256D2DFF0()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_256D2E010()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_256D2E020()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_256D2E030()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_256D2E040()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_256D2E050()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_256D2E060()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_256D2E070()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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