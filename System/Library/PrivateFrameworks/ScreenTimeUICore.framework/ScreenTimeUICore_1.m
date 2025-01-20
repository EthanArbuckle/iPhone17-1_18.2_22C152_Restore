uint64_t sub_2189A3784()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189A37A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = type metadata accessor for UsageOverviewTabView(0);
  uint64_t v43 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v44 = v4;
  uint64_t v46 = (uint64_t)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2189CD528();
  uint64_t v38 = *(void *)(v5 - 8);
  uint64_t v39 = v5;
  MEMORY[0x270FA5388](v5);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v10 = (char *)&v38 - v9;
  uint64_t v11 = sub_2189CD3A8();
  uint64_t v48 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UsageOverviewTabView.Model(0);
  MEMORY[0x270FA5388](v18);
  v20 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE31F0);
  uint64_t v41 = *(void *)(v21 - 8);
  uint64_t v42 = v21;
  MEMORY[0x270FA5388](v21);
  v40 = (char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189A53AC(a1, (uint64_t)v20, type metadata accessor for UsageOverviewTabView.Model);
  uint64_t v45 = a1;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
  MEMORY[0x21D4773A0](v23);
  uint64_t v24 = *(int *)(v15 + 28);
  uint64_t v25 = type metadata accessor for ActivityNavigationState.DateAndBounds(0);
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v13, &v17[v24 + *(int *)(v25 + 20)], v11);
  uint64_t v26 = (uint64_t)v17;
  uint64_t v27 = v39;
  sub_2189A534C(v26, type metadata accessor for ActivityNavigationState);
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  sub_2189CD348();
  uint64_t v28 = Calendar.startOfEachWeek(fromWeekContaining:throughWeekExcluding:)((uint64_t)v10, (uint64_t)v7);
  v29 = *(void (**)(char *, uint64_t))(v38 + 8);
  v29(v7, v27);
  uint64_t v30 = ((uint64_t (*)(char *, uint64_t))v29)(v10, v27);
  if (v28)
  {
    MEMORY[0x270FA5388](v30);
    uint64_t v37 = (uint64_t)v20;
    uint64_t v31 = sub_2189AB288((void (*)(uint64_t))sub_2189A532C, (uint64_t)(&v38 - 4), v28, (uint64_t)v50);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v13, v11);
    sub_2189A534C((uint64_t)v20, type metadata accessor for UsageOverviewTabView.Model);
    uint64_t v49 = v31;
    uint64_t v32 = v46;
    sub_2189A53AC(v45, v46, type metadata accessor for UsageOverviewTabView);
    unint64_t v33 = (*(unsigned __int8 *)(v43 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    uint64_t v34 = swift_allocObject();
    sub_2189A5684(v32, v34 + v33, type metadata accessor for UsageOverviewTabView);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3208);
    type metadata accessor for UsageOverviewChart(0);
    sub_218901074(&qword_267BE3210, &qword_267BE3208);
    sub_2189A56EC(&qword_267BE1FD8, (void (*)(uint64_t))type metadata accessor for UsageOverviewChart);
    uint64_t v37 = sub_2189A56EC(&qword_267BE3218, (void (*)(uint64_t))type metadata accessor for UsageOverviewChart.Model);
    v35 = v40;
    sub_2189CE788();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 32))(v47, v35, v42);
  }
  else
  {
    uint64_t result = sub_2189CEC18();
    __break(1u);
  }
  return result;
}

uint64_t sub_2189A3DE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v28);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - v7;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
  MEMORY[0x270FA5388](v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for UsageOverviewChart.Model(0);
  MEMORY[0x270FA5388](v18 - 8);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189A53AC(a1, (uint64_t)v20, type metadata accessor for UsageOverviewChart.Model);
  type metadata accessor for UsageOverviewTabView(0);
  sub_2189CE708();
  swift_getKeyPath();
  sub_2189CE6F8();
  swift_release();
  sub_218900AE4((uint64_t)v17, &qword_267BE2118);
  sub_2189CD678();
  uint64_t v21 = (int *)type metadata accessor for UsageOverviewChart(0);
  uint64_t v22 = sub_2189CD528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 1, 1, v22);
  sub_218916808((uint64_t)v8, (uint64_t)v5);
  sub_2189CE628();
  sub_218900AE4((uint64_t)v8, &qword_267BE1AE0);
  *(void *)(a2 + v21[8]) = 0;
  uint64_t v23 = (void *)(a2 + v21[9]);
  uint64_t v31 = 0x40BC200000000000;
  sub_2189CE628();
  uint64_t v24 = v33;
  *uint64_t v23 = v32;
  v23[1] = v24;
  uint64_t v25 = (void *)(a2 + v21[10]);
  uint64_t v31 = 0;
  sub_2189CE628();
  uint64_t v26 = v33;
  *uint64_t v25 = v32;
  v25[1] = v26;
  sub_2189A5684((uint64_t)v20, a2 + v21[5], type metadata accessor for UsageOverviewChart.Model);
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(a2, v11, v30);
  return sub_218987D94((uint64_t)v14, a2 + v21[7]);
}

uint64_t sub_2189A41B0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE31A0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_2189CE158();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE31A8);
  sub_2189A3310(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_218901074(&qword_267BE31B0, &qword_267BE31A0);
  sub_2189CE4C8();
  return sub_218900AE4((uint64_t)v3, &qword_267BE31A0);
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageOverviewTabView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(type metadata accessor for UsageOverviewTabView.Model(0) + 20);
    uint64_t v9 = (char *)v7 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2189CD6B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = (uint64_t *)((char *)v7 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13);
    uint64_t v17 = *(uint64_t *)((char *)a2 + v13 + 8);
    *uint64_t v14 = v16;
    v14[1] = v17;
    swift_retain();
    swift_retain();
    uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
    uint64_t v19 = (char *)v14 + v18;
    v20 = &v15[v18];
    *(void *)((char *)v14 + v18) = *(void *)&v15[v18];
    uint64_t v21 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v22 = *(int *)(v21 + 20);
    uint64_t v23 = &v19[v22];
    uint64_t v24 = &v20[v22];
    uint64_t v25 = sub_2189CD528();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    uint64_t v26 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v27 = &v23[v26];
    uint64_t v28 = &v24[v26];
    uint64_t v29 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    v12(&v19[*(int *)(v21 + 24)], &v20[*(int *)(v21 + 24)], v11);
  }
  return v7;
}

uint64_t destroy for UsageOverviewTabView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for UsageOverviewTabView.Model(0) + 20);
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v15)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v7 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v8 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v9 = v7 + *(int *)(v8 + 20);
  uint64_t v10 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v9 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v12 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = v7 + *(int *)(v8 + 24);

  return v15(v13, v5);
}

void *initializeWithCopy for UsageOverviewTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(type metadata accessor for UsageOverviewTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_retain();
  uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v16 = (char *)v12 + v15;
  uint64_t v17 = (char *)v13 + v15;
  *(void *)((char *)v12 + v15) = *(void *)((char *)v13 + v15);
  uint64_t v18 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v19 = *(int *)(v18 + 20);
  v20 = &v16[v19];
  uint64_t v21 = &v17[v19];
  uint64_t v22 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  uint64_t v23 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v24 = &v20[v23];
  uint64_t v25 = &v21[v23];
  uint64_t v26 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  v10(&v16[*(int *)(v18 + 24)], &v17[*(int *)(v18 + 24)], v9);
  return a1;
}

void *assignWithCopy for UsageOverviewTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for UsageOverviewTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (void *)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = *v13;
  swift_retain();
  swift_release();
  *((void *)v12 + 1) = v13[1];
  swift_retain();
  swift_release();
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v15 = &v12[v14];
  uint64_t v16 = (char *)v13 + v14;
  *(void *)&v12[v14] = *(void *)((char *)v13 + v14);
  uint64_t v17 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v15[v18];
  v20 = &v16[v18];
  uint64_t v21 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  uint64_t v22 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v23 = &v19[v22];
  uint64_t v24 = &v20[v22];
  uint64_t v25 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 24))(v23, v24, v25);
  v10(&v15[*(int *)(v17 + 24)], &v16[*(int *)(v17 + 24)], v9);
  return a1;
}

void *initializeWithTake for UsageOverviewTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(type metadata accessor for UsageOverviewTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v16 = (char *)v12 + v15;
  uint64_t v17 = (char *)v13 + v15;
  *(void *)((char *)v12 + v15) = *(void *)((char *)v13 + v15);
  uint64_t v18 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v19 = *(int *)(v18 + 20);
  v20 = &v16[v19];
  uint64_t v21 = &v17[v19];
  uint64_t v22 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v24 = &v20[v23];
  uint64_t v25 = &v21[v23];
  uint64_t v26 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  v10(&v16[*(int *)(v18 + 24)], &v17[*(int *)(v18 + 24)], v9);
  return a1;
}

void *assignWithTake for UsageOverviewTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for UsageOverviewTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (void *)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = *v13;
  swift_release();
  *((void *)v12 + 1) = v13[1];
  swift_release();
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v15 = &v12[v14];
  uint64_t v16 = (char *)v13 + v14;
  *(void *)&v12[v14] = *(void *)((char *)v13 + v14);
  uint64_t v17 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v15[v18];
  v20 = &v16[v18];
  uint64_t v21 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  uint64_t v22 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v23 = &v19[v22];
  uint64_t v24 = &v20[v22];
  uint64_t v25 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  v10(&v15[*(int *)(v17 + 24)], &v16[*(int *)(v17 + 24)], v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageOverviewTabView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189A4D24);
}

uint64_t sub_2189A4D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UsageOverviewTabView.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for UsageOverviewTabView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189A4E34);
}

uint64_t sub_2189A4E34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UsageOverviewTabView.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for UsageOverviewTabView(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE31B8);
}

void sub_2189A4F5C()
{
  type metadata accessor for UsageOverviewTabView.Model(319);
  if (v0 <= 0x3F)
  {
    sub_21892CCE0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for UsageOverviewTabView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189A5038);
}

uint64_t sub_2189A5038(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2189CD6B8();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for UsageOverviewTabView.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189A50FC);
}

void *sub_2189A50FC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2189CD6B8();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

unint64_t sub_2189A51A8()
{
  unint64_t result = qword_267BE31D8;
  if (!qword_267BE31D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE31E0);
    sub_218901074(&qword_267BE31B0, &qword_267BE31A0);
    sub_2189A56EC((unint64_t *)&qword_267BE1D68, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE31D8);
  }
  return result;
}

uint64_t sub_2189A5280@<X0>(uint64_t a1@<X8>)
{
  return sub_2189A37A0(*(void *)(v1 + 16), a1);
}

unint64_t sub_2189A5288()
{
  unint64_t result = qword_267BE31F8;
  if (!qword_267BE31F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE31F0);
    sub_2189A56EC(&qword_267BE1FD8, (void (*)(uint64_t))type metadata accessor for UsageOverviewChart);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE31F8);
  }
  return result;
}

uint64_t sub_2189A532C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2189A20F8(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_2189A534C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2189A53AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189A5414()
{
  uint64_t v1 = (int *)(type metadata accessor for UsageOverviewTabView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = v6 + *(int *)(type metadata accessor for UsageOverviewTabView.Model(0) + 20);
  uint64_t v8 = sub_2189CD6B8();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  uint64_t v10 = v6 + v1[7];
  swift_release();
  swift_release();
  uint64_t v11 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v12 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v13 = v11 + *(int *)(v12 + 20);
  uint64_t v14 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = v13 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v16 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v9(v11 + *(int *)(v12 + 24), v8);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2189A55FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for UsageOverviewTabView(0);

  return sub_2189A3DE4(a1, a2);
}

uint64_t sub_2189A5684(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189A56EC(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_2189A5738(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for DateModePicker(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for DateModePicker(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for DateModePicker()
{
  return &type metadata for DateModePicker;
}

uint64_t sub_2189A5838()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189A5854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a4;
  uint64_t v7 = sub_2189CE1B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v18 = v7;
  uint64_t v19 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3228);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3238);
  sub_2189CE708();
  type metadata accessor for STActivityMode(0);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3240);
  sub_2189A5E58();
  sub_218901074(&qword_267BE3250, &qword_267BE3240);
  sub_2189CE6A8();
  swift_release();
  swift_release();
  sub_2189CE1A8();
  sub_218901074(&qword_267BE3230, &qword_267BE3228);
  uint64_t v15 = v18;
  sub_2189CE488();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_2189A5B04@<X0>(uint64_t a1@<X8>)
{
  sub_2189CE118();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundle);
  LOWORD(v19) = 2;
  uint64_t v4 = sub_2189CE3B8();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_2189CE118();
  id v11 = objc_msgSend(v2, sel_bundle, 12, v19);
  uint64_t v12 = sub_2189CE3B8();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = 1;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 1;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v15 & 1;
  *(void *)(a1 + 88) = v17;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(_WORD *)(a1 + 120) = 0;
  sub_218900AC4(v4, v6, v10);
  swift_bridgeObjectRetain();
  sub_218900AC4(v12, v14, v16);
  swift_bridgeObjectRetain();
  sub_218900AD4(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_218900AD4(v4, v6, v10);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2189A5D10()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3220);
  MEMORY[0x270FA5388](v1);
  sub_2189A5854(*v0, v0[1], v0[2], (uint64_t)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3228);
  uint64_t v4 = sub_2189CE1B8();
  uint64_t v5 = sub_218901074(&qword_267BE3230, &qword_267BE3228);
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v5;
  v7[3] = MEMORY[0x263F19C00];
  swift_getOpaqueTypeConformance2();
  return sub_2189CE7A8();
}

unint64_t sub_2189A5E58()
{
  unint64_t result = qword_267BE3248;
  if (!qword_267BE3248)
  {
    type metadata accessor for STActivityMode(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3248);
  }
  return result;
}

unint64_t sub_2189A5EB4()
{
  unint64_t result = qword_267BE3258;
  if (!qword_267BE3258)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3260);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3228);
    sub_2189CE1B8();
    sub_218901074(&qword_267BE3230, &qword_267BE3228);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3258);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeltaView()
{
  return &type metadata for DeltaView;
}

uint64_t sub_2189A5FBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189A5FD8@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v47 = a1;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3268);
  MEMORY[0x270FA5388](v44);
  uint64_t v45 = (uint64_t)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3270);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v46 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3278);
  uint64_t v39 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3280);
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v42 = v9;
  MEMORY[0x270FA5388](v9);
  id v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3288);
  MEMORY[0x270FA5388](v43);
  v40 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  char v15 = (char *)&v38 - v14;
  id v16 = objc_msgSend(self, sel_bundle);
  sub_2189CD3F8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2778);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2189CF710;
  uint64_t v18 = self;
  id v19 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, fabs(a2));
  id v20 = objc_msgSend(v18, sel_localizedStringFromNumber_numberStyle_, v19, 3);

  uint64_t v21 = sub_2189CE988();
  uint64_t v23 = v22;

  *(void *)(v17 + 56) = MEMORY[0x263F8D310];
  *(void *)(v17 + 64) = sub_21896A310();
  *(void *)(v17 + 32) = v21;
  *(void *)(v17 + 40) = v23;
  uint64_t v24 = sub_2189CE978();
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a2 >= 0.05 && a2 <= 2.0)
  {
    uint64_t v48 = v24;
    uint64_t v49 = v26;
    sub_2189096A8();
    sub_2189CE618();
    uint64_t v48 = 0x400C000000000000;
    uint64_t v27 = sub_218901074(&qword_267BE3298, &qword_267BE3278);
    unint64_t v28 = sub_2189A6818();
    sub_2189CE468();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v6);
    if (qword_267BE1920 == -1) {
      goto LABEL_8;
    }
    goto LABEL_12;
  }
  if (a2 <= -0.05 && a2 >= -0.9)
  {
    uint64_t v48 = v24;
    uint64_t v49 = v26;
    sub_2189096A8();
    sub_2189CE618();
    uint64_t v48 = 0x400C000000000000;
    uint64_t v27 = sub_218901074(&qword_267BE3298, &qword_267BE3278);
    unint64_t v28 = sub_2189A6818();
    sub_2189CE468();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v6);
    if (qword_267BE1920 == -1)
    {
LABEL_8:
      uint64_t v48 = v6;
      uint64_t v49 = &type metadata for DeltaLabelSpacing;
      uint64_t v50 = v27;
      unint64_t v51 = v28;
      swift_getOpaqueTypeConformance2();
      uint64_t v29 = (uint64_t)v40;
      uint64_t v30 = v42;
      sub_2189CE4C8();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v30);
      sub_218912B98(v29, (uint64_t)v15, &qword_267BE3288);
      sub_218900A60((uint64_t)v15, v45, &qword_267BE3288);
      swift_storeEnumTagMultiPayload();
      sub_2189A686C();
      uint64_t v31 = (uint64_t)v46;
      sub_2189CE188();
      sub_218900AE4((uint64_t)v15, &qword_267BE3288);
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3290);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 0, 1, v32);
      return sub_218912B98(v31, v47, &qword_267BE3270);
    }
LABEL_12:
    swift_once();
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3290);
  v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
  uint64_t v36 = v34;
  uint64_t v37 = v47;

  return v35(v37, 1, 1, v36);
}

uint64_t sub_2189A6810@<X0>(uint64_t a1@<X8>)
{
  return sub_2189A5FD8(a1, *v1);
}

unint64_t sub_2189A6818()
{
  unint64_t result = qword_267BE32A0;
  if (!qword_267BE32A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE32A0);
  }
  return result;
}

unint64_t sub_2189A686C()
{
  unint64_t result = qword_267BE32A8;
  if (!qword_267BE32A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3288);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3278);
    sub_218901074(&qword_267BE3298, &qword_267BE3278);
    sub_2189A6818();
    swift_getOpaqueTypeConformance2();
    sub_21892E6E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE32A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeltaLabelSpacing()
{
  return &type metadata for DeltaLabelSpacing;
}

unint64_t sub_2189A6970()
{
  unint64_t result = qword_267BE32B0;
  if (!qword_267BE32B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3270);
    sub_2189A69E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE32B0);
  }
  return result;
}

unint64_t sub_2189A69E4()
{
  unint64_t result = qword_267BE32B8;
  if (!qword_267BE32B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3290);
    sub_2189A686C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE32B8);
  }
  return result;
}

uint64_t sub_2189A6A58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189A6A74@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE32C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (double *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE32C8);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_2189CE098();
  v6[1] = a2;
  *((unsigned char *)v6 + 16) = 0;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE32D0);
  sub_2189A6C20((char *)v6 + *(int *)(v11 + 44));
  uint64_t v12 = sub_2189CE2D8();
  uint64_t KeyPath = swift_getKeyPath();
  sub_218900A60((uint64_t)v6, (uint64_t)v10, &qword_267BE32C0);
  uint64_t v14 = (uint64_t *)&v10[*(int *)(v8 + 44)];
  *uint64_t v14 = KeyPath;
  v14[1] = v12;
  sub_218900AE4((uint64_t)v6, &qword_267BE32C0);
  id v15 = objc_msgSend(self, sel_secondaryLabelColor);
  uint64_t v16 = MEMORY[0x21D477270](v15);
  sub_218900A60((uint64_t)v10, a1, &qword_267BE32C8);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE32D8) + 36)) = v16;
  return sub_218900AE4((uint64_t)v10, &qword_267BE32C8);
}

uint64_t sub_2189A6C20@<X0>(char *a1@<X8>)
{
  unint64_t v28 = a1;
  uint64_t v1 = sub_2189CE238();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v25 = v1;
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v25 - v6;
  uint64_t v8 = sub_2189CE218();
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v9 = v27;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v25 - v13;
  sub_2189CE228();
  sub_2189CE248();
  id v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v11, v14, v8);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v16(v4, v7, v1);
  uint64_t v17 = v28;
  v15(v28, v11, v8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE32E0);
  uint64_t v19 = v25;
  v16(&v17[*(int *)(v18 + 48)], v4, v25);
  id v20 = *(void (**)(char *, uint64_t))(v26 + 8);
  uint64_t v21 = v7;
  uint64_t v22 = v19;
  v20(v21, v19);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v27 + 8);
  v23(v14, v8);
  v20(v4, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v11, v8);
}

uint64_t sub_2189A6EA4@<X0>(uint64_t a1@<X8>)
{
  return sub_2189A6A74(a1, *v1);
}

unint64_t sub_2189A6EB8()
{
  unint64_t result = qword_267BE32E8;
  if (!qword_267BE32E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE32D8);
    sub_2189A6F58();
    sub_218901074(&qword_267BE2650, qword_267BE2658);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE32E8);
  }
  return result;
}

unint64_t sub_2189A6F58()
{
  unint64_t result = qword_267BE32F0;
  if (!qword_267BE32F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE32C8);
    sub_218901074(&qword_267BE32F8, &qword_267BE32C0);
    sub_218901074(&qword_267BE1A78, &qword_267BE1A80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE32F0);
  }
  return result;
}

double STCommunicationSafetyToggleFooter.body.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_2189A70A0(a1);
}

double sub_2189A7038@<D0>(uint64_t a1@<X8>)
{
  return STCommunicationSafetyToggleFooter.body.getter(a1);
}

double STCommunicationSafetyViewChildSafetyResourcesFooter.body.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_2189A70A0(a1);
}

double sub_2189A706C@<D0>(uint64_t a1@<X8>)
{
  return STCommunicationSafetyViewChildSafetyResourcesFooter.body.getter(a1);
}

double STCommunicationSafetyAnalyticsFooter.body.getter@<D0>(uint64_t a1@<X8>)
{
  return sub_2189A70A0(a1);
}

double sub_2189A70A0@<D0>(uint64_t a1@<X8>)
{
  sub_2189CE118();
  id v2 = objc_msgSend(self, sel_bundle);
  uint64_t v3 = sub_2189CE3B8();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_2189CE358();
  uint64_t v8 = sub_2189CE3A8();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  swift_release();
  sub_218900AD4(v3, v5, v7);
  swift_bridgeObjectRelease();
  char v15 = sub_2189CE2A8();
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v12 & 1;
  *(void *)(a1 + 24) = v14;
  *(unsigned char *)(a1 + 32) = v15;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(unsigned char *)(a1 + 72) = 1;
  return result;
}

uint64_t sub_2189A71D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189A71F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189A720C()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2189A7228@<D0>(uint64_t a1@<X8>)
{
  return STCommunicationSafetyAnalyticsFooter.body.getter(a1);
}

ValueMetadata *type metadata accessor for STCommunicationSafetyToggleFooter()
{
  return &type metadata for STCommunicationSafetyToggleFooter;
}

ValueMetadata *type metadata accessor for STCommunicationSafetyViewChildSafetyResourcesFooter()
{
  return &type metadata for STCommunicationSafetyViewChildSafetyResourcesFooter;
}

ValueMetadata *type metadata accessor for STCommunicationSafetyAnalyticsFooter()
{
  return &type metadata for STCommunicationSafetyAnalyticsFooter;
}

unint64_t sub_2189A7274()
{
  unint64_t result = qword_267BE3300;
  if (!qword_267BE3300)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3300);
  }
  return result;
}

uint64_t sub_2189A72E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1E00);
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = *(void *)(a2 + 64);
  uint64_t v26 = a2 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v27 = (unint64_t)(v11 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  if (!v13) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = sub_2189CD528();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v9, v21 + *(void *)(*(void *)(v22 - 8) + 72) * i, v22);
    *(void *)&v9[*(int *)(v4 + 48)] = *(void *)(*(void *)(a2 + 56) + 8 * i);
    uint64_t result = sub_218912B98((uint64_t)v9, (uint64_t)v6, &qword_267BE1E00);
    uint64_t v23 = *(void *)&v6[*(int *)(v4 + 48)];
    BOOL v24 = __OFADD__(a1, v23);
    a1 += v23;
    if (v24)
    {
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    uint64_t result = sub_218900AE4((uint64_t)v6, &qword_267BE1E00);
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v18 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      goto LABEL_26;
    }
    if (v18 >= v27) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v26 + 8 * v18);
    ++v15;
    if (!v19)
    {
      int64_t v15 = v18 + 1;
      if (v18 + 1 >= v27) {
        goto LABEL_24;
      }
      unint64_t v19 = *(void *)(v26 + 8 * v15);
      if (!v19)
      {
        int64_t v15 = v18 + 2;
        if (v18 + 2 >= v27) {
          goto LABEL_24;
        }
        unint64_t v19 = *(void *)(v26 + 8 * v15);
        if (!v19)
        {
          int64_t v15 = v18 + 3;
          if (v18 + 3 >= v27) {
            goto LABEL_24;
          }
          unint64_t v19 = *(void *)(v26 + 8 * v15);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v13 = (v19 - 1) & v19;
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v27)
  {
LABEL_24:
    swift_release();
    return a1;
  }
  unint64_t v19 = *(void *)(v26 + 8 * v20);
  if (v19)
  {
    int64_t v15 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v15 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v26 + 8 * v15);
    ++v20;
    if (v19) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

__n128 sub_2189A7588@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2189CEB08();
    uint64_t v23 = (void *)sub_2189CE268();
    sub_2189CD968();
  }
  sub_2189CDF08();
  sub_218900A60(v13, a9, &qword_267BE2F88);
  BOOL v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2F90) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *BOOL v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_2189A7748@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2189CEB08();
    uint64_t v25 = (void *)sub_2189CE268();
    sub_2189CD968();
  }
  sub_2189CDF08();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;

  return swift_retain();
}

__n128 sub_2189A7904@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2189CEB08();
    uint64_t v23 = (void *)sub_2189CE268();
    sub_2189CD968();
  }
  sub_2189CDF08();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE3380) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t NotificationsLegendView.Model.init(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(int *)(type metadata accessor for NotificationsLegendView.Model(0) + 20);
  *(void *)(a2 + v4) = sub_21896D0D4(MEMORY[0x263F8EE78]);
  uint64_t v5 = sub_2189CD6B8();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);

  return v6(a2, a1, v5);
}

uint64_t type metadata accessor for NotificationsLegendView.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3320);
}

uint64_t sub_2189A7BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2189CD3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_2189CD528();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v23[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1 == 1)
  {
    uint64_t v14 = type metadata accessor for NotificationsLegendView.Model(0);
    uint64_t v15 = *(void *)(v3 + *(int *)(v14 + 20));
    MEMORY[0x270FA5388](v14);
    uint64_t v22 = a2;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_218926418((uint64_t)sub_2189AAF10, (uint64_t)&v23[-32], v15);
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_2189A72E8(0, v16);
    swift_release();
    return v17;
  }
  if (!a1)
  {
    sub_2189CD318();
    _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v18 = *(void *)(v3 + *(int *)(type metadata accessor for NotificationsLegendView.Model(0) + 20));
    if (*(void *)(v18 + 16) && (unint64_t v19 = sub_218921204((uint64_t)v13), (v20 & 1) != 0)) {
      uint64_t v17 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
    }
    else {
      uint64_t v17 = 0;
    }
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);
    return v17;
  }
  uint64_t result = sub_2189CEC18();
  __break(1u);
  return result;
}

uint64_t sub_2189A7E54(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1E00);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a2;
  uint64_t v9 = sub_2189CD528();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, a1, v9);
  *(void *)&v7[*(int *)(v5 + 56)] = v8;
  char v10 = sub_2189CD388();
  sub_218900AE4((uint64_t)v7, &qword_267BE1E00);
  return v10 & 1;
}

uint64_t NotificationsLegendView.init(model:mode:dateInterval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for NotificationsLegendView(0);
  uint64_t v9 = a4 + v8[7];
  uint64_t v10 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (void *)(a4 + v8[8]);
  *uint64_t v11 = 0;
  v11[1] = 0;
  v11[2] = 0;
  sub_2189A8598(a1, a4, type metadata accessor for NotificationsLegendView.Model);
  *(void *)(a4 + v8[5]) = a2;
  uint64_t v12 = a4 + v8[6];
  uint64_t v13 = sub_2189CD3A8();
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32);

  return v14(v12, a3, v13);
}

uint64_t type metadata accessor for NotificationsLegendView(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3310);
}

uint64_t NotificationsLegendView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for NotificationsLegendView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = sub_2189CE548();
  uint64_t v7 = sub_2189CE7E8();
  sub_2189A7748(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v31, 0.0, 1, INFINITY, 0, v7, v8, v6);
  swift_release();
  uint64_t v30 = v31[0];
  uint64_t v29 = v31[1];
  char v9 = v32;
  uint64_t v28 = v33;
  char v10 = v34;
  uint64_t v27 = v35;
  int v21 = v36;
  uint64_t v26 = v37;
  LOBYTE(v6) = v38;
  uint64_t v25 = v39;
  char v11 = v40;
  uint64_t v24 = v41;
  char v12 = v42;
  uint64_t v23 = v43;
  uint64_t v22 = v44;
  sub_2189A8530(v1, (uint64_t)&v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  sub_2189A8598((uint64_t)&v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v14 + v13, type metadata accessor for NotificationsLegendView);
  uint64_t result = sub_2189CE7E8();
  char v16 = v21;
  uint64_t v17 = v29;
  *(void *)a1 = v30;
  *(void *)(a1 + 8) = v17;
  *(unsigned char *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v28;
  *(unsigned char *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v27;
  *(unsigned char *)(a1 + 48) = v16;
  *(void *)(a1 + 56) = v26;
  *(unsigned char *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v25;
  *(unsigned char *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v24;
  *(unsigned char *)(a1 + 96) = v12;
  uint64_t v18 = v22;
  *(void *)(a1 + 104) = v23;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = sub_2189A8600;
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = result;
  *(void *)(a1 + 144) = v19;
  return result;
}

uint64_t sub_2189A8338@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1A40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3360);
  MEMORY[0x270FA5388](v7 - 8);
  char v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_2189CDE58();
  if ((~*(void *)&v11 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v11 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v11 < 9.22337204e18)
  {
    uint64_t v12 = (uint64_t)v11;
    *(void *)char v9 = sub_2189CE0A8();
    *((void *)v9 + 1) = 0x4034000000000000;
    v9[16] = 0;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3368);
    sub_2189A8620(a1, v12, (uint64_t)&v9[*(int *)(v13 + 44)]);
    uint64_t v14 = sub_2189CE2E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
    uint64_t v15 = sub_2189CE318();
    sub_218900AE4((uint64_t)v6, &qword_267BE1A40);
    uint64_t KeyPath = swift_getKeyPath();
    sub_218900A60((uint64_t)v9, a2, &qword_267BE3360);
    uint64_t v17 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE3370) + 36));
    uint64_t *v17 = KeyPath;
    v17[1] = v15;
    return sub_218900AE4((uint64_t)v9, &qword_267BE3360);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2189A8530(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationsLegendView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2189A8598(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189A8604()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189A8620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v46 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3378);
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3380);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2189CD528();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3388);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v48 = (uint64_t)v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v47 = (uint64_t)v40 - v21;
  uint64_t v22 = type metadata accessor for NotificationsLegendView(0);
  if (*(void *)(a1 + *(int *)(v22 + 32) + 8))
  {
    uint64_t v41 = v7;
    uint64_t v23 = *(int *)(v22 + 28);
    uint64_t v42 = a1;
    sub_218900A60(a1 + v23, (uint64_t)v13, &qword_267BE1AE0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
    {
      uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
      v40[1] = v40;
      MEMORY[0x270FA5388](v25);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3398);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BE33A0);
      sub_2189AAC78();
      sub_2189AAD18();
      sub_2189CE608();
      double v26 = (double)(v43 / 2);
      sub_2189CE7F8();
      __n128 v27 = sub_2189A7904(0.0, 1, 0.0, 1, v26, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1);
      (*(void (**)(char *, uint64_t, __n128))(v44 + 8))(v6, v45, v27);
      uint64_t v24 = v47;
      sub_218912B98((uint64_t)v10, v47, &qword_267BE3380);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v24, 0, 1, v41);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      a1 = v42;
      goto LABEL_6;
    }
    sub_218900AE4((uint64_t)v13, &qword_267BE1AE0);
    uint64_t v7 = v41;
    a1 = v42;
  }
  uint64_t v24 = v47;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v47, 1, 1, v7);
LABEL_6:
  uint64_t v45 = sub_2189CE168();
  sub_2189A913C(a1, (uint64_t)v49);
  uint64_t v28 = v49[0];
  uint64_t v29 = v49[1];
  char v30 = v50;
  uint64_t v32 = v51;
  uint64_t v31 = v52;
  uint64_t v33 = v53;
  char v34 = v54;
  uint64_t v44 = v55;
  uint64_t v35 = v48;
  sub_218900A60(v24, v48, &qword_267BE3388);
  uint64_t v36 = v46;
  sub_218900A60(v35, v46, &qword_267BE3388);
  uint64_t v37 = v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE3390) + 48);
  uint64_t v38 = v44;
  *(void *)uint64_t v37 = v45;
  *(void *)(v37 + 8) = 0x4014000000000000;
  *(unsigned char *)(v37 + 16) = 0;
  *(void *)(v37 + 24) = v28;
  *(void *)(v37 + 32) = v29;
  *(unsigned char *)(v37 + 40) = v30;
  *(void *)(v37 + 48) = v32;
  *(void *)(v37 + 56) = v31;
  *(void *)(v37 + 64) = v33;
  *(unsigned char *)(v37 + 72) = v34;
  *(void *)(v37 + 80) = v38;
  sub_218900AC4(v28, v29, v30);
  swift_bridgeObjectRetain();
  sub_218900AC4(v31, v33, v34);
  swift_bridgeObjectRetain();
  sub_218900AE4(v47, &qword_267BE3388);
  sub_218900AD4(v28, v29, v30);
  swift_bridgeObjectRelease();
  sub_218900AD4(v31, v33, v34);
  swift_bridgeObjectRelease();
  return sub_218900AE4(v48, &qword_267BE3388);
}

double sub_2189A8BEC@<D0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_2189CE168();
  sub_2189A8CCC(a1, a2, (uint64_t)v16);
  uint64_t v7 = v16[0];
  uint64_t v8 = v16[1];
  char v9 = v17;
  long long v15 = v18;
  uint64_t v10 = v19;
  char v11 = v20;
  uint64_t v12 = v21;
  char v13 = sub_2189CE288();
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = 0x4014000000000000;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v7;
  *(void *)(a3 + 32) = v8;
  *(unsigned char *)(a3 + 40) = v9;
  *(_OWORD *)(a3 + 48) = v15;
  *(void *)(a3 + 64) = v10;
  *(unsigned char *)(a3 + 72) = v11;
  *(void *)(a3 + 80) = v12;
  *(unsigned char *)(a3 + 88) = v13;
  double result = 0.0;
  *(_OWORD *)(a3 + 96) = xmmword_2189D1DE0;
  *(void *)(a3 + 112) = 0;
  *(void *)(a3 + 120) = 0;
  *(unsigned char *)(a3 + 128) = 0;
  return result;
}

uint64_t sub_2189A8CCC@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  sub_2189096A8();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2189CE3C8();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_2189CE1F8();
  uint64_t v10 = sub_2189CE398();
  uint64_t v12 = v11;
  char v14 = v13;
  uint64_t v16 = v15;
  sub_218900AD4(v5, v7, v9);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16)) {
    sub_218921204(a2);
  }
  sub_21896A2BC();
  sub_2189CEB98();
  uint64_t v17 = sub_2189CE3C8();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  *(void *)a3 = v10;
  *(void *)(a3 + 8) = v12;
  *(unsigned char *)(a3 + 16) = v14 & 1;
  *(void *)(a3 + 24) = v16;
  *(void *)(a3 + 32) = v17;
  *(void *)(a3 + 40) = v18;
  *(unsigned char *)(a3 + 48) = v20 & 1;
  *(void *)(a3 + 56) = v22;
  sub_218900AC4(v10, v12, v14 & 1);
  swift_bridgeObjectRetain();
  sub_218900AC4(v17, v19, v21);
  swift_bridgeObjectRetain();
  sub_218900AD4(v17, v19, v21);
  swift_bridgeObjectRelease();
  sub_218900AD4(v10, v12, v14 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2189A8E9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2F20);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_2189CE5E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE33D0);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  char v13 = (uint64_t *)((char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_2189CE5C8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B538], v6);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 36), v9, v6);
  *uint64_t v5 = KeyPath;
  sub_218900A60((uint64_t)v5, (uint64_t)v13 + *(int *)(v11 + 44), &qword_267BE2F20);
  uint64_t *v13 = v14;
  swift_retain();
  sub_218900AE4((uint64_t)v5, &qword_267BE2F20);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  id v16 = objc_msgSend(self, sel_systemRedColor);
  uint64_t v17 = MEMORY[0x21D477270](v16);
  uint64_t v18 = swift_getKeyPath();
  sub_218900A60((uint64_t)v13, a1, &qword_267BE33D0);
  uint64_t v19 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE33A0) + 36));
  *uint64_t v19 = v18;
  v19[1] = v17;
  return sub_218900AE4((uint64_t)v13, &qword_267BE33D0);
}

uint64_t sub_2189A913C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2189CE118();
  id v4 = objc_msgSend(self, sel_bundle);
  uint64_t v5 = sub_2189CE3B8();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_2189CE528();
  uint64_t v10 = sub_2189CE398();
  uint64_t v12 = v11;
  uint64_t v23 = v13;
  char v15 = v14 & 1;
  sub_218900AD4(v5, v7, v9);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v16 = type metadata accessor for NotificationsLegendView(0);
  sub_2189A7BA0(*(void *)(a1 + *(int *)(v16 + 20)), a1 + *(int *)(v16 + 24));
  sub_21896A2BC();
  sub_2189CEB98();
  sub_2189096A8();
  uint64_t v17 = sub_2189CE3C8();
  uint64_t v19 = v18;
  LOBYTE(v7) = v20 & 1;
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  *(unsigned char *)(a2 + 16) = v15;
  *(void *)(a2 + 24) = v23;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v18;
  *(unsigned char *)(a2 + 48) = v20 & 1;
  *(void *)(a2 + 56) = v21;
  sub_218900AC4(v10, v12, v15);
  swift_bridgeObjectRetain();
  sub_218900AC4(v17, v19, v7);
  swift_bridgeObjectRetain();
  sub_218900AD4(v17, v19, v7);
  swift_bridgeObjectRelease();
  sub_218900AD4(v10, v12, v15);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2189A9358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  uint64_t v6 = sub_2189CE548();
  uint64_t v7 = sub_2189CE7E8();
  sub_2189A7748(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v31, 0.0, 1, INFINITY, 0, v7, v8, v6);
  swift_release();
  uint64_t v30 = v31[0];
  uint64_t v29 = v31[1];
  char v9 = v32;
  uint64_t v28 = v33;
  char v10 = v34;
  uint64_t v27 = v35;
  int v21 = v36;
  uint64_t v26 = v37;
  LOBYTE(v6) = v38;
  uint64_t v25 = v39;
  char v11 = v40;
  uint64_t v24 = v41;
  char v12 = v42;
  uint64_t v23 = v43;
  uint64_t v22 = v44;
  sub_2189A8530(v2, (uint64_t)&v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  sub_2189A8598((uint64_t)&v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v14 + v13, type metadata accessor for NotificationsLegendView);
  uint64_t result = sub_2189CE7E8();
  char v16 = v21;
  uint64_t v17 = v29;
  *(void *)a2 = v30;
  *(void *)(a2 + 8) = v17;
  *(unsigned char *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v28;
  *(unsigned char *)(a2 + 32) = v10;
  *(void *)(a2 + 40) = v27;
  *(unsigned char *)(a2 + 48) = v16;
  *(void *)(a2 + 56) = v26;
  *(unsigned char *)(a2 + 64) = v6;
  *(void *)(a2 + 72) = v25;
  *(unsigned char *)(a2 + 80) = v11;
  *(void *)(a2 + 88) = v24;
  *(unsigned char *)(a2 + 96) = v12;
  uint64_t v18 = v22;
  *(void *)(a2 + 104) = v23;
  *(void *)(a2 + 112) = v18;
  *(void *)(a2 + 120) = sub_2189A8600;
  *(void *)(a2 + 128) = v14;
  *(void *)(a2 + 136) = result;
  *(void *)(a2 + 144) = v19;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NotificationsLegendView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2189CD6B8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for NotificationsLegendView.Model(0);
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    uint64_t v9 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    char v10 = (char *)a1 + v9;
    char v11 = (char *)a2 + v9;
    uint64_t v12 = sub_2189CD3A8();
    unint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[7];
    char v15 = (char *)a1 + v14;
    char v16 = (char *)a2 + v14;
    uint64_t v17 = sub_2189CD528();
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v21 = a3[8];
    uint64_t v22 = (uint64_t *)((char *)a1 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    if (v24)
    {
      *uint64_t v22 = *v23;
      v22[1] = v24;
      v22[2] = v23[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      v22[2] = v23[2];
    }
  }
  return a1;
}

uint64_t destroy for NotificationsLegendView(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  type metadata accessor for NotificationsLegendView.Model(0);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = sub_2189CD528();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t result = *(void *)(a1 + a2[8] + 8);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for NotificationsLegendView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for NotificationsLegendView.Model(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD3A8();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  char v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_2189CD528();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  if (v22)
  {
    void *v20 = *v21;
    v20[1] = v22;
    v20[2] = v21[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
    v20[2] = v21[2];
  }
  return a1;
}

uint64_t assignWithCopy for NotificationsLegendView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for NotificationsLegendView.Model(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_2189CD528();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = a3[8];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = *(void *)(a1 + v21 + 8);
  uint64_t v25 = v23[1];
  if (v24)
  {
    if (v25)
    {
      *uint64_t v22 = *v23;
      v22[1] = v23[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v22[2] = v23[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21898526C((uint64_t)v22);
      uint64_t v26 = v23[2];
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      v22[2] = v26;
    }
  }
  else if (v25)
  {
    *uint64_t v22 = *v23;
    v22[1] = v23[1];
    v22[2] = v23[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v27 = *(_OWORD *)v23;
    v22[2] = v23[2];
    *(_OWORD *)uint64_t v22 = v27;
  }
  return a1;
}

uint64_t initializeWithTake for NotificationsLegendView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for NotificationsLegendView.Model(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_2189CD528();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *(void *)(v19 + 16) = *(void *)(v20 + 16);
  return a1;
}

uint64_t assignWithTake for NotificationsLegendView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for NotificationsLegendView.Model(0);
  *(void *)(a1 + *(int *)(v7 + 20)) = *(void *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_2189CD528();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  if (!*(void *)(a1 + v21 + 8))
  {
LABEL_11:
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    *(void *)(v22 + 16) = *(void *)(v23 + 16);
    return a1;
  }
  uint64_t v24 = *(void *)(v23 + 8);
  if (!v24)
  {
    sub_21898526C(v22);
    goto LABEL_11;
  }
  *(void *)uint64_t v22 = *(void *)v23;
  *(void *)(v22 + 8) = v24;
  swift_bridgeObjectRelease();
  *(void *)(v22 + 16) = *(void *)(v23 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationsLegendView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189AA334);
}

uint64_t sub_2189AA334(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for NotificationsLegendView.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_2189CD3A8();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[6];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[8] + 8);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  int v17 = v16 - 1;
  if (v17 < 0) {
    int v17 = -1;
  }
  return (v17 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationsLegendView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189AA4BC);
}

uint64_t sub_2189AA4BC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for NotificationsLegendView.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_2189CD3A8();
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[6];
    }
    else
    {
      uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[8] + 8) = a2;
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[7];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_2189AA620()
{
  type metadata accessor for NotificationsLegendView.Model(319);
  if (v0 <= 0x3F)
  {
    sub_2189CD3A8();
    if (v1 <= 0x3F)
    {
      sub_218969EA4();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for NotificationsLegendView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189AA74C);
}

uint64_t sub_2189AA74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD6B8();
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
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for NotificationsLegendView.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189AA820);
}

uint64_t sub_2189AA820(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2189CD6B8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

unint64_t sub_2189AA8E0()
{
  unint64_t result = qword_267BE3330;
  if (!qword_267BE3330)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3338);
    sub_2189AA980();
    sub_218901074(&qword_267BE3350, &qword_267BE3358);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3330);
  }
  return result;
}

unint64_t sub_2189AA980()
{
  unint64_t result = qword_267BE3340;
  if (!qword_267BE3340)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3340);
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationsLegendView.SelectedItem()
{
  return &type metadata for NotificationsLegendView.SelectedItem;
}

uint64_t objectdestroyTm_5()
{
  unint64_t v1 = (int *)type metadata accessor for NotificationsLegendView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  type metadata accessor for NotificationsLegendView.Model(0);
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[6];
  uint64_t v7 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + v3 + v1[7];
  uint64_t v9 = sub_2189CD528();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  if (*(void *)(v0 + v3 + v1[8] + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2189AABE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for NotificationsLegendView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_2189A8338(v4, a1);
}

double sub_2189AAC6C@<D0>(uint64_t a1@<X8>)
{
  return sub_2189A8BEC(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

unint64_t sub_2189AAC78()
{
  unint64_t result = qword_267BE33A8;
  if (!qword_267BE33A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3398);
    sub_218901074(&qword_267BE33B0, &qword_267BE33B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE33A8);
  }
  return result;
}

unint64_t sub_2189AAD18()
{
  unint64_t result = qword_267BE33C0;
  if (!qword_267BE33C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE33A0);
    sub_2189AADB8();
    sub_218901074(&qword_267BE1A88, &qword_267BE1A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE33C0);
  }
  return result;
}

unint64_t sub_2189AADB8()
{
  unint64_t result = qword_267BE33C8;
  if (!qword_267BE33C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE33D0);
    sub_218901074(&qword_267BE2F80, &qword_267BE2F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE33C8);
  }
  return result;
}

uint64_t sub_2189AAE58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2189CDF98();
  *a1 = result;
  return result;
}

uint64_t sub_2189AAE84()
{
  return sub_2189CDFA8();
}

uint64_t sub_2189AAEB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2189CDF98();
  *a1 = result;
  return result;
}

uint64_t sub_2189AAEE4()
{
  return sub_2189CDFA8();
}

uint64_t sub_2189AAF10(uint64_t a1, uint64_t *a2)
{
  return sub_2189A7E54(a1, a2) & 1;
}

uint64_t sub_2189AAF30(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2189AAFD8(a1, a2, a3, a4, type metadata accessor for NotificationsDetailChart.Model, (void (*)(BOOL, unint64_t, uint64_t))sub_21890CC04, type metadata accessor for NotificationsDetailChart.Model);
}

uint64_t sub_2189AAF84(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2189AAFD8(a1, a2, a3, a4, type metadata accessor for PickupsDetailChart.Model, (void (*)(BOOL, unint64_t, uint64_t))sub_21890CC7C, type metadata accessor for PickupsDetailChart.Model);
}

uint64_t sub_2189AAFD8(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), void (*a6)(BOOL, unint64_t, uint64_t), uint64_t (*a7)(void))
{
  uint64_t v26 = a7;
  long long v27 = a1;
  uint64_t v9 = v7;
  uint64_t v28 = a2;
  uint64_t v11 = a5(0);
  uint64_t v12 = *(void *)(v11 - 8);
  __n128 v13 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v15 = (char *)&v23 - v14;
  uint64_t v16 = *(void *)(a3 + 16);
  uint64_t v17 = MEMORY[0x263F8EE78];
  if (v16)
  {
    uint64_t v29 = MEMORY[0x263F8EE78];
    uint64_t v24 = a6;
    ((void (*)(void, uint64_t, void, __n128))a6)(0, v16, 0, v13);
    uint64_t v17 = v29;
    uint64_t v18 = *(void *)(sub_2189CD528() - 8);
    uint64_t v19 = a3 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    uint64_t v25 = *(void *)(v18 + 72);
    while (1)
    {
      v27(v19);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      uint64_t v29 = v17;
      unint64_t v21 = *(void *)(v17 + 16);
      unint64_t v20 = *(void *)(v17 + 24);
      if (v21 >= v20 >> 1)
      {
        v24(v20 > 1, v21 + 1, 1);
        uint64_t v17 = v29;
      }
      *(void *)(v17 + 16) = v21 + 1;
      sub_2189ADA58((uint64_t)v15, v17+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v21, v26);
      v19 += v25;
      if (!--v16) {
        return v17;
      }
    }
    swift_release();
  }
  return v17;
}

uint64_t sub_2189AB1E0(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2189AAFD8(a1, a2, a3, a4, type metadata accessor for NotificationsOverviewChart.Model, (void (*)(BOOL, unint64_t, uint64_t))sub_21890CD30, type metadata accessor for NotificationsOverviewChart.Model);
}

uint64_t sub_2189AB234(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2189AAFD8(a1, a2, a3, a4, type metadata accessor for PickupsOverviewChart.Model, (void (*)(BOOL, unint64_t, uint64_t))sub_21890CD8C, type metadata accessor for PickupsOverviewChart.Model);
}

uint64_t sub_2189AB288(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2189AAFD8(a1, a2, a3, a4, type metadata accessor for UsageOverviewChart.Model, (void (*)(BOOL, unint64_t, uint64_t))sub_21890CE48, type metadata accessor for UsageOverviewChart.Model);
}

uint64_t sub_2189AB2DC()
{
  return sub_2189CD578();
}

uint64_t sub_2189AB324(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = a2;
  uint64_t v24 = a1;
  uint64_t v2 = sub_2189CD3A8();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ActivityNavigationState.DateAndBounds(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2189CD528();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v24 - v14;
  __n128 v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v24 - v18;
  unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v10 + 16);
  v20((char *)&v24 - v18, v24, v9, v17);
  ((void (*)(char *, char *, uint64_t))v20)(v15, v19, v9);
  ((void (*)(char *, char *, uint64_t))v20)(v12, v15, v9);
  uint64_t v21 = v27 + *(int *)(type metadata accessor for ActivityNavigationState(0) + 20);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v4, v21 + *(int *)(v6 + 28), v26);
  sub_218913404((uint64_t)v12, (uint64_t)v4, (uint64_t)v8);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
  v22(v15, v9);
  sub_218916870((uint64_t)v8, v21);
  return ((uint64_t (*)(char *, uint64_t))v22)(v19, v9);
}

uint64_t UsageDetailTabView.Model.init(calendar:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (char *)a2 + *(int *)(type metadata accessor for UsageDetailTabView.Model(0) + 20);
  uint64_t v5 = sub_2189CD6B8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v4, a1, v5);
  *a2 = MEMORY[0x263F8EE78];
  return result;
}

uint64_t type metadata accessor for UsageDetailTabView.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3400);
}

uint64_t sub_2189AB654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v49 = a3;
  uint64_t v53 = a1;
  uint64_t v4 = sub_2189CD6B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v44 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  uint64_t v8 = *((void *)v7 - 1);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for UsageDetailTabView.Model(0);
  MEMORY[0x270FA5388](v43);
  uint64_t v51 = (uint64_t)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2189CD528();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v48 = (char *)v41 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F30);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v46 = v4;
  uint64_t v47 = a2;
  uint64_t v20 = *(void *)a2;
  uint64_t v21 = *(void *)(*(void *)a2 + 16);
  uint64_t v45 = v5;
  uint64_t v50 = v13;
  uint64_t v52 = (uint64_t)v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v21)
  {
    uint64_t v22 = v20 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v23 = (void (**)(char *, uint64_t))(v13 + 8);
    v41[1] = v20;
    uint64_t v42 = v8;
    uint64_t v24 = *(void *)(v8 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_2189AD9F0(v22, (uint64_t)v10, type metadata accessor for UsageDetailChart.Model);
      sub_2189CD578();
      char v25 = sub_2189CD4F8();
      (*v23)(v15, v12);
      if (v25) {
        break;
      }
      sub_2189AD948((uint64_t)v10, type metadata accessor for UsageDetailChart.Model);
      v22 += v24;
      if (!--v21)
      {
        uint64_t v26 = 1;
        goto LABEL_8;
      }
    }
    sub_2189ADA58((uint64_t)v10, v52, type metadata accessor for UsageDetailChart.Model);
    uint64_t v26 = 0;
LABEL_8:
    uint64_t v27 = v47;
    uint64_t v28 = v50;
    uint64_t v29 = v42;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = 1;
    uint64_t v27 = v47;
    uint64_t v28 = v13;
    uint64_t v29 = v8;
  }
  uint64_t v30 = v52;
  (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v29 + 56))(v52, v26, 1, v7);
  swift_bridgeObjectRelease();
  uint64_t v31 = v28 + 16;
  char v32 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
  uint64_t v33 = v48;
  v32(v48, v53, v12);
  sub_2189AD9F0(v27, v51, type metadata accessor for UsageDetailTabView.Model);
  if ((*(unsigned int (**)(uint64_t, uint64_t, int *))(v29 + 48))(v30, 1, v7) == 1)
  {
    v32(v15, (uint64_t)v33, v12);
    uint64_t v34 = v50;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v33, v12);
    uint64_t v35 = v44;
    uint64_t v36 = v51;
    uint64_t v38 = v45;
    uint64_t v37 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v51 + *(int *)(v43 + 20), v46);
    sub_2189AD948(v36, type metadata accessor for UsageDetailTabView.Model);
    uint64_t v39 = v49;
    *(void *)(v49 + v7[7]) = 0x40BC200000000000;
    *(void *)(v39 + v7[8]) = 3;
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v39, v15, v12);
    *(void *)(v39 + v7[5]) = MEMORY[0x263F8EE78];
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v39 + v7[6], v35, v37);
    return sub_218900AE4(v52, &qword_267BE1F30);
  }
  else
  {
    sub_2189AD948(v51, type metadata accessor for UsageDetailTabView.Model);
    (*(void (**)(char *, uint64_t))(v31 - 8))(v33, v12);
    return sub_2189ADA58(v52, v49, type metadata accessor for UsageDetailChart.Model);
  }
}

uint64_t UsageDetailTabView.body.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE33D8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_2189CE158();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE33E0);
  sub_2189ABCEC(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_218901074(&qword_267BE33E8, &qword_267BE33D8);
  sub_2189CE4C8();
  return sub_218900AE4((uint64_t)v3, &qword_267BE33D8);
}

uint64_t sub_2189ABCEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_2189CDEC8();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v27 - v6;
  uint64_t v8 = sub_2189CDEE8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  uint64_t v33 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2158);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3420);
  uint64_t v18 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UsageDetailTabView(0);
  sub_2189CE708();
  swift_getKeyPath();
  sub_2189CE6F8();
  swift_release();
  sub_218900AE4((uint64_t)v14, &qword_267BE2118);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2168);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 0, 1, v21);
  uint64_t v35 = a1;
  sub_2189CD528();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3428);
  sub_2189AD9A8(&qword_267BE1C50, MEMORY[0x263F07490]);
  sub_2189AD884();
  sub_2189CE7D8();
  sub_2189CDEB8();
  uint64_t v22 = v30;
  uint64_t v23 = v31;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v29, v7, v31);
  sub_2189CDED8();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
  sub_218901074(&qword_267BE3438, &qword_267BE3420);
  uint64_t v24 = v28;
  uint64_t v25 = v32;
  sub_2189CE438();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v24);
}

uint64_t sub_2189AC160()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189AC17C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v33 = sub_2189CD528();
  uint64_t v3 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v33 - v7;
  uint64_t v9 = sub_2189CD3A8();
  uint64_t v39 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for UsageDetailTabView.Model(0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3428);
  uint64_t v36 = *(void *)(v19 - 8);
  uint64_t v37 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v35 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189AD9F0(a1, (uint64_t)v18, type metadata accessor for UsageDetailTabView.Model);
  type metadata accessor for UsageDetailTabView(0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
  MEMORY[0x21D4773A0](v21);
  uint64_t v22 = *(int *)(v13 + 28);
  uint64_t v23 = &v15[v22 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20)];
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  uint64_t v34 = v9;
  v24(v11, v23, v9);
  sub_2189AD948((uint64_t)v15, type metadata accessor for ActivityNavigationState);
  uint64_t v25 = v33;
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  sub_2189CD348();
  uint64_t v26 = Calendar.startOfEachDay(fromDayContaining:throughDayExcluding:)();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v3 + 8);
  v27(v5, v25);
  uint64_t v28 = ((uint64_t (*)(char *, uint64_t))v27)(v8, v25);
  if (v26)
  {
    MEMORY[0x270FA5388](v28);
    uint64_t v32 = (uint64_t)v18;
    uint64_t v29 = sub_2189AAFD8((void (*)(uint64_t))sub_2189AD928, (uint64_t)(&v33 - 4), v26, (uint64_t)v41, type metadata accessor for UsageDetailChart.Model, (void (*)(BOOL, unint64_t, uint64_t))sub_21890CE84, type metadata accessor for UsageDetailChart.Model);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v34);
    sub_2189AD948((uint64_t)v18, type metadata accessor for UsageDetailTabView.Model);
    uint64_t v40 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3440);
    type metadata accessor for UsageDetailChart(0);
    sub_218901074(&qword_267BE3448, &qword_267BE3440);
    sub_2189AD9A8(&qword_267BE1FC8, (void (*)(uint64_t))type metadata accessor for UsageDetailChart);
    uint64_t v32 = sub_2189AD9A8(&qword_267BE3450, (void (*)(uint64_t))type metadata accessor for UsageDetailChart.Model);
    uint64_t v30 = v35;
    sub_2189CE788();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v30, v37);
  }
  else
  {
    uint64_t result = sub_2189CEC18();
    __break(1u);
  }
  return result;
}

uint64_t sub_2189AC71C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2189AD9F0(a1, a2, type metadata accessor for UsageDetailChart.Model);
  uint64_t result = type metadata accessor for UsageDetailChart(0);
  *(void *)(a2 + *(int *)(result + 20)) = 0;
  return result;
}

uint64_t sub_2189AC768()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE33D8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_2189CE158();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE33E0);
  sub_2189ABCEC(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_218901074(&qword_267BE33E8, &qword_267BE33D8);
  sub_2189CE4C8();
  return sub_218900AE4((uint64_t)v3, &qword_267BE33D8);
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageDetailTabView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = *(int *)(type metadata accessor for UsageDetailTabView.Model(0) + 20);
    uint64_t v9 = (char *)v7 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2189CD6B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = (uint64_t *)((char *)v7 + v13);
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13);
    uint64_t v17 = *(uint64_t *)((char *)a2 + v13 + 8);
    *uint64_t v14 = v16;
    v14[1] = v17;
    swift_retain();
    swift_retain();
    uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
    uint64_t v19 = (char *)v14 + v18;
    uint64_t v20 = &v15[v18];
    *(void *)((char *)v14 + v18) = *(void *)&v15[v18];
    uint64_t v21 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v22 = *(int *)(v21 + 20);
    uint64_t v23 = &v19[v22];
    uint64_t v24 = &v20[v22];
    uint64_t v25 = sub_2189CD528();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    uint64_t v26 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v27 = &v23[v26];
    uint64_t v28 = &v24[v26];
    uint64_t v29 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    v12(&v19[*(int *)(v21 + 24)], &v20[*(int *)(v21 + 24)], v11);
  }
  return v7;
}

uint64_t destroy for UsageDetailTabView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for UsageDetailTabView.Model(0) + 20);
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v15)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v7 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v8 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v9 = v7 + *(int *)(v8 + 20);
  uint64_t v10 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v9 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v12 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = v7 + *(int *)(v8 + 24);

  return v15(v13, v5);
}

void *initializeWithCopy for UsageDetailTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(type metadata accessor for UsageDetailTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_retain();
  uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v16 = (char *)v12 + v15;
  uint64_t v17 = (char *)v13 + v15;
  *(void *)((char *)v12 + v15) = *(void *)((char *)v13 + v15);
  uint64_t v18 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v19 = *(int *)(v18 + 20);
  uint64_t v20 = &v16[v19];
  uint64_t v21 = &v17[v19];
  uint64_t v22 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
  uint64_t v23 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v24 = &v20[v23];
  uint64_t v25 = &v21[v23];
  uint64_t v26 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  v10(&v16[*(int *)(v18 + 24)], &v17[*(int *)(v18 + 24)], v9);
  return a1;
}

void *assignWithCopy for UsageDetailTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for UsageDetailTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (void *)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = *v13;
  swift_retain();
  swift_release();
  *((void *)v12 + 1) = v13[1];
  swift_retain();
  swift_release();
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v15 = &v12[v14];
  uint64_t v16 = (char *)v13 + v14;
  *(void *)&v12[v14] = *(void *)((char *)v13 + v14);
  uint64_t v17 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v15[v18];
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  uint64_t v22 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v23 = &v19[v22];
  uint64_t v24 = &v20[v22];
  uint64_t v25 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 24))(v23, v24, v25);
  v10(&v15[*(int *)(v17 + 24)], &v16[*(int *)(v17 + 24)], v9);
  return a1;
}

void *initializeWithTake for UsageDetailTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(type metadata accessor for UsageDetailTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v16 = (char *)v12 + v15;
  uint64_t v17 = (char *)v13 + v15;
  *(void *)((char *)v12 + v15) = *(void *)((char *)v13 + v15);
  uint64_t v18 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v19 = *(int *)(v18 + 20);
  uint64_t v20 = &v16[v19];
  uint64_t v21 = &v17[v19];
  uint64_t v22 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
  uint64_t v23 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v24 = &v20[v23];
  uint64_t v25 = &v21[v23];
  uint64_t v26 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  v10(&v16[*(int *)(v18 + 24)], &v17[*(int *)(v18 + 24)], v9);
  return a1;
}

void *assignWithTake for UsageDetailTabView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(type metadata accessor for UsageDetailTabView.Model(0) + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (void *)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = *v13;
  swift_release();
  *((void *)v12 + 1) = v13[1];
  swift_release();
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118) + 32);
  uint64_t v15 = &v12[v14];
  uint64_t v16 = (char *)v13 + v14;
  *(void *)&v12[v14] = *(void *)((char *)v13 + v14);
  uint64_t v17 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v15[v18];
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_2189CD528();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  uint64_t v22 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v23 = &v19[v22];
  uint64_t v24 = &v20[v22];
  uint64_t v25 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  v10(&v15[*(int *)(v17 + 24)], &v16[*(int *)(v17 + 24)], v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageDetailTabView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189AD2DC);
}

uint64_t sub_2189AD2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UsageDetailTabView.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for UsageDetailTabView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189AD3EC);
}

uint64_t sub_2189AD3EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UsageDetailTabView.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2118);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for UsageDetailTabView(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE33F0);
}

void sub_2189AD514()
{
  type metadata accessor for UsageDetailTabView.Model(319);
  if (v0 <= 0x3F)
  {
    sub_21892CCE0();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for UsageDetailTabView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189AD5F0);
}

uint64_t sub_2189AD5F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2189CD6B8();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for UsageDetailTabView.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189AD6B4);
}

void *sub_2189AD6B4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2189CD6B8();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

unint64_t sub_2189AD760()
{
  unint64_t result = qword_267BE3410;
  if (!qword_267BE3410)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3418);
    sub_218901074(&qword_267BE33E8, &qword_267BE33D8);
    sub_2189AD9A8((unint64_t *)&qword_267BE1D68, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3410);
  }
  return result;
}

uint64_t sub_2189AD830()
{
  return sub_2189CD578();
}

uint64_t sub_2189AD87C@<X0>(uint64_t a1@<X8>)
{
  return sub_2189AC17C(*(void *)(v1 + 16), a1);
}

unint64_t sub_2189AD884()
{
  unint64_t result = qword_267BE3430;
  if (!qword_267BE3430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3428);
    sub_2189AD9A8(&qword_267BE1FC8, (void (*)(uint64_t))type metadata accessor for UsageDetailChart);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3430);
  }
  return result;
}

uint64_t sub_2189AD928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2189AB654(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_2189AD948(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2189AD9A8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2189AD9F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189ADA58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t destroy for MostUsedListSectionAppsAndCategories.Model(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 56);
}

uint64_t initializeWithCopy for MostUsedListSectionAppsAndCategories.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  long long v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 56, a2 + 56);
  return a1;
}

void *assignWithCopy for MostUsedListSectionAppsAndCategories.Model(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for MostUsedListSectionAppsAndCategories.Model(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for MostUsedListSectionAppsAndCategories.Model(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MostUsedListSectionAppsAndCategories.Model(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MostUsedListSectionAppsAndCategories.Model()
{
  return &type metadata for MostUsedListSectionAppsAndCategories.Model;
}

uint64_t sub_2189ADDBC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    uint64_t v8 = a2 + 2;
    long long v9 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v9;
    uint64_t v10 = v9;
    uint64_t v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(a1 + 16, v8, v10);
    long long v12 = *((_OWORD *)a2 + 5);
    *(_OWORD *)(a1 + 80) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 56, (uint64_t)(a2 + 7));
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_2189CD3A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = *(int *)(a3 + 24);
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
    *(void *)(v18 + 8) = *(void *)(v19 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_2189ADF68(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_release();
}

uint64_t sub_2189AE010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = a2 + 16;
  long long v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(a1 + 16, v7, v9);
  long long v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 56, a2 + 56);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_retain();
  return a1;
}

void *sub_2189AE170(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  long long v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  long long v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *long long v11 = *v12;
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_2189AE268(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  long long v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  long long v8 = a2[1];
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  long long v11 = (char *)a2 + v9;
  *a1 = *a2;
  a1[1] = v8;
  uint64_t v12 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_2189AE310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)uint64_t v12 = *(unsigned char *)v13;
  *(void *)(v12 + 8) = *(void *)(v13 + 8);
  swift_release();
  return a1;
}

uint64_t sub_2189AE410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189AE424);
}

uint64_t sub_2189AE424(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2189CD3A8();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2189AE4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189AE4E8);
}

void *sub_2189AE4E8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *__n128 result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2189CD3A8();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for MostUsedListSectionAppsAndCategories()
{
  uint64_t result = qword_267BE3458;
  if (!qword_267BE3458) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2189AE5DC()
{
  uint64_t result = sub_2189CD3A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2189AE67C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189AE698(uint64_t a1)
{
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3490);
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v37 = (uint64_t)&v33 - v4;
  MEMORY[0x270FA5388](v5);
  uint64_t v36 = (char *)&v33 - v6;
  uint64_t v43 = MEMORY[0x263F8EE78];
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v34 = a1 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v40 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  uint64_t v13 = v38;
  while (1)
  {
    if (v10)
    {
      uint64_t v41 = (v10 - 1) & v10;
      int64_t v42 = v12;
      unint64_t v14 = __clz(__rbit64(v10)) | (v12 << 6);
      goto LABEL_5;
    }
    int64_t v29 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v29 >= v35) {
      goto LABEL_23;
    }
    unint64_t v30 = *(void *)(v34 + 8 * v29);
    int64_t v31 = v12 + 1;
    if (!v30)
    {
      int64_t v31 = v12 + 2;
      if (v12 + 2 >= v35) {
        goto LABEL_23;
      }
      unint64_t v30 = *(void *)(v34 + 8 * v31);
      if (!v30)
      {
        int64_t v31 = v12 + 3;
        if (v12 + 3 >= v35) {
          goto LABEL_23;
        }
        unint64_t v30 = *(void *)(v34 + 8 * v31);
        if (!v30)
        {
          int64_t v31 = v12 + 4;
          if (v12 + 4 >= v35) {
            goto LABEL_23;
          }
          unint64_t v30 = *(void *)(v34 + 8 * v31);
          if (!v30) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v41 = (v30 - 1) & v30;
    int64_t v42 = v31;
    unint64_t v14 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_5:
    uint64_t v15 = v40;
    uint64_t v16 = *(void *)(v40 + 48);
    uint64_t v17 = sub_2189CD3A8();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = v18;
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 16);
    uint64_t v21 = v36;
    v20(v36, v16 + *(void *)(v18 + 72) * v14, v17);
    uint64_t v22 = *(void *)(*(void *)(v15 + 56) + 8 * v14);
    uint64_t v23 = v39;
    *(void *)&v21[*(int *)(v39 + 48)] = v22;
    uint64_t v24 = (uint64_t)v21;
    uint64_t v25 = v37;
    sub_218912B98(v24, v37, &qword_267BE3490);
    uint64_t v26 = *(int *)(v23 + 48);
    v20(v13, v25, v17);
    uint64_t v27 = *(void *)(v25 + v26);
    *(void *)&v13[v26] = v27;
    uint64_t v28 = *(void (**)(char *, uint64_t))(v19 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28(v13, v17);
    sub_218900AE4(v25, &qword_267BE3490);
    uint64_t result = sub_2189AFE48(v27);
    unint64_t v10 = v41;
    int64_t v12 = v42;
  }
  uint64_t v32 = v12 + 5;
  if (v12 + 5 >= v35)
  {
LABEL_23:
    swift_release();
    return v43;
  }
  unint64_t v30 = *(void *)(v34 + 8 * v32);
  if (v30)
  {
    int64_t v31 = v12 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v31 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v31 >= v35) {
      goto LABEL_23;
    }
    unint64_t v30 = *(void *)(v34 + 8 * v31);
    ++v32;
    if (v30) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2189AEA10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3468);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  uint64_t v7 = (char *)v1 + *(int *)(v6 + 24);
  char v8 = *v7;
  uint64_t v9 = *((void *)v7 + 1);
  char v20 = *v7;
  uint64_t v21 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3470);
  sub_2189CE638();
  if (v22) {
    uint64_t v10 = *v1;
  }
  else {
    uint64_t v10 = v1[1];
  }
  uint64_t v11 = sub_2189AF958(v10, (uint64_t)v1 + *(int *)(v6 + 20));
  char v20 = v8;
  uint64_t v21 = v9;
  sub_2189CE638();
  uint64_t v12 = (uint64_t)v1 + *(int *)(v6 + 20);
  if (v22)
  {
    sub_2189AED84(v12);
    if (*(void *)(v11 + 16))
    {
LABEL_6:
      unint64_t v14 = MEMORY[0x270FA5388](v13).n128_u64[0];
      *(&v19 - 2) = v11;
      *(&v19 - 1) = v14;
      *(void *)uint64_t v5 = sub_2189CE0B8();
      *((void *)v5 + 1) = 0;
      v5[16] = 1;
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3478);
      sub_2189AEEF0((uint64_t)v1, (uint64_t)&v5[*(int *)(v15 + 44)]);
      sub_2189AFD50();
      sub_21892098C();
      sub_2189CE7A8();
      swift_bridgeObjectRelease();
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3488);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a1, 0, 1, v16);
    }
  }
  else
  {
    sub_2189AEC7C(v12);
    if (*(void *)(v11 + 16)) {
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3488);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a1, 1, 1, v18);
}

double sub_2189AEC7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  void v16[2] = a1;
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_218926478((uint64_t)sub_2189AFDAC, (uint64_t)v16, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_2189AE698(v3);
  swift_release();
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    double v7 = 0.0;
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
LABEL_8:
    uint64_t v12 = v5 - v6;
    uint64_t v13 = (double *)(v4 + 56 * v6 + 48);
    do
    {
      double v14 = *v13;
      v13 += 7;
      double v7 = v7 + v14;
      --v12;
    }
    while (v12);
    goto LABEL_10;
  }
  uint64_t v6 = v5 & 0x7FFFFFFFFFFFFFFELL;
  char v8 = (double *)(v4 + 104);
  double v7 = 0.0;
  uint64_t v9 = v5 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v10 = *(v8 - 7);
    double v11 = *v8;
    v8 += 14;
    double v7 = v7 + v10 + v11;
    v9 -= 2;
  }
  while (v9);
  if (v5 != v6) {
    goto LABEL_8;
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return v7;
}

double sub_2189AED84(uint64_t a1)
{
  uint64_t v2 = *v1;
  void v16[2] = a1;
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_218926478((uint64_t)sub_2189B25C8, (uint64_t)v16, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_2189AE698(v3);
  swift_release();
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    double v7 = 0.0;
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
LABEL_8:
    uint64_t v12 = v5 - v6;
    uint64_t v13 = (double *)(v4 + 56 * v6 + 48);
    do
    {
      double v14 = *v13;
      v13 += 7;
      double v7 = v7 + v14;
      --v12;
    }
    while (v12);
    goto LABEL_10;
  }
  uint64_t v6 = v5 & 0x7FFFFFFFFFFFFFFELL;
  char v8 = (double *)(v4 + 104);
  double v7 = 0.0;
  uint64_t v9 = v5 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v10 = *(v8 - 7);
    double v11 = *v8;
    v8 += 14;
    double v7 = v7 + v10 + v11;
    v9 -= 2;
  }
  while (v9);
  if (v5 != v6) {
    goto LABEL_8;
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return v7;
}

double sub_2189AEE8C@<D0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_21899FC5C(v4, (uint64_t)v7, a2);
  swift_bridgeObjectRelease();
  double result = *(double *)v7;
  long long v6 = v7[1];
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = v8;
  return result;
}

uint64_t sub_2189AEEF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v47 = a2;
  uint64_t v2 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v41 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v40 = (uint64_t)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3498);
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  long long v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE34A0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  double v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v44 = (uint64_t)&v40 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2040);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v42 = (uint64_t)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v40 - v16;
  sub_2189CE118();
  id v18 = objc_msgSend(self, sel_bundle);
  uint64_t v19 = sub_2189CE3B8();
  uint64_t v21 = v20;
  uint64_t v49 = v19;
  uint64_t v50 = v20;
  char v23 = v22 & 1;
  char v51 = v22 & 1;
  uint64_t v52 = v24;
  sub_2189CE4C8();
  sub_218900AD4(v19, v21, v23);
  swift_bridgeObjectRelease();
  uint64_t v25 = v43;
  uint64_t v26 = v40;
  sub_2189AFFA4(v43, v40);
  unint64_t v27 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v28 = swift_allocObject();
  sub_2189B0124(v26, v28 + v27);
  uint64_t v48 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE34A8);
  sub_2189B01F0();
  sub_2189CE678();
  uint64_t v29 = sub_2189CE358();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v32 = v45;
  uint64_t v31 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v10, v6, v46);
  uint64_t v33 = (uint64_t *)&v10[*(int *)(v8 + 44)];
  *uint64_t v33 = KeyPath;
  v33[1] = v29;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v31);
  uint64_t v34 = v44;
  sub_218912B98((uint64_t)v10, v44, &qword_267BE34A0);
  uint64_t v35 = v42;
  sub_218900A60((uint64_t)v17, v42, &qword_267BE2040);
  sub_218900A60(v34, (uint64_t)v10, &qword_267BE34A0);
  uint64_t v36 = v47;
  sub_218900A60(v35, v47, &qword_267BE2040);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE34B8);
  uint64_t v38 = v36 + *(int *)(v37 + 48);
  *(void *)uint64_t v38 = 0;
  *(unsigned char *)(v38 + 8) = 1;
  sub_218900A60((uint64_t)v10, v36 + *(int *)(v37 + 64), &qword_267BE34A0);
  sub_218900AE4(v34, &qword_267BE34A0);
  sub_218900AE4((uint64_t)v17, &qword_267BE2040);
  sub_218900AE4((uint64_t)v10, &qword_267BE34A0);
  return sub_218900AE4(v35, &qword_267BE2040);
}

uint64_t sub_2189AF3C4()
{
  return sub_2189CE648();
}

uint64_t sub_2189AF468(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2040);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE34C0);
  MEMORY[0x270FA5388](v8);
  double v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (char *)(a1 + *(int *)(type metadata accessor for MostUsedListSectionAppsAndCategories() + 24));
  char v12 = *v11;
  uint64_t v13 = *((void *)v11 + 1);
  LOBYTE(v30) = v12;
  uint64_t v31 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3470);
  sub_2189CE638();
  if (v34)
  {
    sub_2189CE118();
    id v14 = objc_msgSend(self, sel_bundle);
    uint64_t v15 = sub_2189CE3B8();
    uint64_t v17 = v16;
    uint64_t v30 = v15;
    uint64_t v31 = v16;
    char v19 = v18 & 1;
    char v32 = v18 & 1;
    uint64_t v33 = v20;
    sub_2189CE4C8();
    sub_218900AD4(v15, v17, v19);
    swift_bridgeObjectRelease();
    sub_218900A60((uint64_t)v4, (uint64_t)v10, &qword_267BE2040);
    swift_storeEnumTagMultiPayload();
    sub_2189208E0();
    sub_2189CE188();
    uint64_t v7 = v4;
  }
  else
  {
    sub_2189CE118();
    id v21 = objc_msgSend(self, sel_bundle);
    uint64_t v22 = sub_2189CE3B8();
    uint64_t v24 = v23;
    uint64_t v30 = v22;
    uint64_t v31 = v23;
    char v26 = v25 & 1;
    char v32 = v25 & 1;
    uint64_t v33 = v27;
    sub_2189CE4C8();
    sub_218900AD4(v22, v24, v26);
    swift_bridgeObjectRelease();
    sub_218900A60((uint64_t)v7, (uint64_t)v10, &qword_267BE2040);
    swift_storeEnumTagMultiPayload();
    sub_2189208E0();
    sub_2189CE188();
  }
  return sub_218900AE4((uint64_t)v7, &qword_267BE2040);
}

uint64_t sub_2189AF850(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3490);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a2;
  uint64_t v9 = sub_2189CD3A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, a1, v9);
  *(void *)&v7[*(int *)(v5 + 56)] = v8;
  swift_bridgeObjectRetain();
  char v10 = sub_218950C1C((uint64_t)v7);
  sub_218900AE4((uint64_t)v7, &qword_267BE3490);
  return v10 & 1;
}

uint64_t sub_2189AF958(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = a2;
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_218926478((uint64_t)sub_2189B25C8, (uint64_t)v45, a1);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_2189AE698(v3);
  swift_release();
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = 0;
  if (v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    uint64_t v9 = (char *)(v4 + 32);
    while (1)
    {
      uint64_t v44 = v5;
      long long v14 = *((_OWORD *)v9 + 1);
      long long v13 = *((_OWORD *)v9 + 2);
      long long v15 = *(_OWORD *)v9;
      *(_DWORD *)&v49[15] = *(_DWORD *)(v9 + 47);
      long long v48 = v14;
      *(_OWORD *)uint64_t v49 = v13;
      long long v47 = v15;
      long long v16 = v15;
      uint64_t v17 = swift_allocObject();
      memmove((void *)(v17 + 16), v9, 0x33uLL);
      sub_21892A45C((uint64_t)&v47);
      sub_21892A45C((uint64_t)&v47);
      swift_bridgeObjectRetain();
      sub_21891330C((uint64_t)v6);
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = sub_2189B02B4;
      *(void *)(v18 + 24) = v17;
      sub_21891330C((uint64_t)v7);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v50[0] = (uint64_t)v8;
      unint64_t v21 = sub_21892118C(v16, *((uint64_t *)&v16 + 1));
      uint64_t v22 = v8[2];
      BOOL v23 = (v20 & 1) == 0;
      uint64_t v24 = v22 + v23;
      if (__OFADD__(v22, v23)) {
        break;
      }
      char v25 = v20;
      if (v8[3] >= v24)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_218925DE0();
          uint64_t v8 = (void *)v50[0];
        }
      }
      else
      {
        sub_218923E78(v24, isUniquelyReferenced_nonNull_native);
        uint64_t v8 = (void *)v50[0];
        unint64_t v26 = sub_21892118C(v16, *((uint64_t *)&v16 + 1));
        if ((v25 & 1) != (v27 & 1)) {
          goto LABEL_18;
        }
        unint64_t v21 = v26;
      }
      swift_bridgeObjectRelease();
      if (v25)
      {
        uint64_t v10 = 56 * v21;
      }
      else
      {
        uint64_t v28 = swift_bridgeObjectRetain();
        (*(void (**)(uint64_t *__return_ptr, uint64_t))(v18 + 16))(v50, v28);
        uint64_t v29 = v50[0];
        uint64_t v30 = v50[1];
        uint64_t v31 = v50[2];
        long long v32 = v51;
        uint64_t v33 = v52;
        char v34 = v53 & 1;
        char v35 = v54 & 1;
        char v36 = v55 & 1;
        v8[(v21 >> 6) + 8] |= 1 << v21;
        *(_OWORD *)(v8[6] + 16 * v21) = v16;
        uint64_t v10 = 56 * v21;
        uint64_t v37 = v8[7] + 56 * v21;
        *(void *)uint64_t v37 = v29;
        *(void *)(v37 + 8) = v30;
        *(void *)(v37 + 16) = v31;
        *(_OWORD *)(v37 + 24) = v32;
        *(void *)(v37 + 40) = v33;
        *(unsigned char *)(v37 + 48) = v34;
        *(unsigned char *)(v37 + 49) = v35;
        *(unsigned char *)(v37 + 50) = v36;
        uint64_t v38 = v8[2];
        BOOL v39 = __OFADD__(v38, 1);
        uint64_t v40 = v38 + 1;
        if (v39) {
          goto LABEL_17;
        }
        v8[2] = v40;
      }
      swift_bridgeObjectRetain();
      double v11 = *(double *)&v48;
      uint64_t v12 = v8[7];
      swift_bridgeObjectRelease();
      *(double *)(v12 + v10 + 16) = v11 + *(double *)(v12 + v10 + 16);
      sub_21892A508((uint64_t)&v47);
      swift_bridgeObjectRelease();
      v9 += 56;
      uint64_t v7 = sub_2189B02CC;
      uint64_t v6 = sub_2189B02B4;
      uint64_t v5 = v44 - 1;
      if (v44 == 1) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    sub_2189CECB8();
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    uint64_t v41 = sub_21890BD0C((uint64_t)v8);
    swift_bridgeObjectRelease();
    v50[0] = (uint64_t)v41;
    sub_2189B228C(v50, (uint64_t)&unk_26CA11248);
    swift_bridgeObjectRelease();
    uint64_t v42 = v50[0];
    swift_bridgeObjectRelease();
    sub_21891330C((uint64_t)v6);
    sub_21891330C((uint64_t)v7);
    return v42;
  }
  return result;
}

double sub_2189AFD44@<D0>(uint64_t a1@<X8>)
{
  return sub_2189AEE8C(a1, *(double *)(v1 + 24));
}

unint64_t sub_2189AFD50()
{
  unint64_t result = qword_267BE3480;
  if (!qword_267BE3480)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3480);
  }
  return result;
}

uint64_t sub_2189AFDAC(uint64_t a1, uint64_t *a2)
{
  return sub_2189AF850(a1, a2) & 1;
}

uint64_t sub_2189AFDCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 48);
  *(void *)a2 = *(void *)a1;
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = v4;
  *(void *)(a2 + 40) = v5;
  *(unsigned char *)(a2 + 48) = v6;
  *(_WORD *)(a2 + 49) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_2189AFE30@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  *a3 = *(double *)(a2 + 16) < *(double *)(result + 16);
  return result;
}

uint64_t sub_2189AFE48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_21894345C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[7 * v8 + 4];
  if (a1 + 32 < v9 + 56 * v2 && v9 < a1 + 32 + 56 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2189CEC58();
  __break(1u);
  return result;
}

uint64_t sub_2189AFFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2189B0008()
{
  uint64_t v1 = (int *)(type metadata accessor for MostUsedListSectionAppsAndCategories() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v6 + 16);
  __swift_destroy_boxed_opaque_existential_1(v6 + 56);
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2189B0124(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MostUsedListSectionAppsAndCategories();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2189B0188()
{
  type metadata accessor for MostUsedListSectionAppsAndCategories();

  return sub_2189AF3C4();
}

uint64_t sub_2189B01E8()
{
  return sub_2189AF468(*(void *)(v0 + 16));
}

unint64_t sub_2189B01F0()
{
  unint64_t result = qword_267BE34B0;
  if (!qword_267BE34B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE34A8);
    sub_2189208E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE34B0);
  }
  return result;
}

uint64_t sub_2189B026C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 67, 7);
}

uint64_t sub_2189B02B4@<X0>(uint64_t a1@<X8>)
{
  return sub_2189AFDCC(v1 + 16, a1);
}

uint64_t sub_2189B02BC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double sub_2189B02CC@<D0>(uint64_t a1@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(v1 + 16))(v5);
  long long v3 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v3;
  double result = v6[0];
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v6;
  *(_DWORD *)(a1 + 47) = *(_DWORD *)((char *)&v6[1] + 7);
  return result;
}

uint64_t sub_2189B0320(char *a1, char *__src, unint64_t a3, char *__dst, uint64_t a5)
{
  void (*v18)(void *__return_ptr, void, void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  void (*v26)(char *__return_ptr, uint64_t *, uint64_t *);
  void (*v27)(void *__return_ptr, void, void);
  void (*v28)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *__return_ptr, uint64_t *, uint64_t *);
  void (*v34)(char *__return_ptr, uint64_t *, uint64_t *);
  char *v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(void *__return_ptr, void, void);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(void *__return_ptr, void, void);
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  void (*v61)(void *__return_ptr, void, void);
  void (*v62)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(void *__return_ptr, void, void);
  void (*v69)(char *__return_ptr, uint64_t *, uint64_t *);
  char *v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  uint64_t result;
  char *v78;
  char *v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *__srcb;
  unint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  char v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  char v107;
  char v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  uint64_t v114;
  char v115;
  char v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v123;
  char v124;
  char v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(char *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v132;
  char v133;
  char v134;
  char v135;
  char *v136;
  char *v137;
  char *v138;
  void (*v139)(char *__return_ptr, uint64_t *, uint64_t *);

  uint64_t v5 = __dst;
  unint64_t v6 = a3;
  uint64_t v7 = __src;
  uint64_t v8 = __src - a1;
  uint64_t v9 = (__src - a1) / 56;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 56;
  v138 = a1;
  v137 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -55)
    {
      uint64_t v42 = 56 * v11;
      if (__dst != __src || &__src[v42] <= __dst) {
        memmove(__dst, __src, 56 * v11);
      }
      uint64_t v43 = &v5[v42];
      v136 = &v5[v42];
      v138 = v7;
      uint64_t v44 = a1;
      if (v10 >= 56 && a1 < v7)
      {
        uint64_t v45 = *(void *)(a5 + 16);
        v85 = v45;
        v87 = v5;
        while (1)
        {
          uint64_t v46 = v6 - 56;
          long long v47 = (unint64_t)(v43 - 56);
          if (!v45) {
            goto LABEL_45;
          }
          v112 = *((void *)v43 - 7);
          v79 = v43 - 56;
          v81 = v6 - 56;
          v91 = (char *)v6;
          v93 = v7;
          long long v48 = *((void *)v43 - 6);
          uint64_t v49 = *((void *)v43 - 5);
          long long v51 = *((void *)v43 - 4);
          uint64_t v50 = (void (*)(void *__return_ptr, void, void))*((void *)v43 - 3);
          uint64_t v52 = *((void *)v7 - 6);
          v114 = *((void *)v7 - 7);
          char v53 = *((void *)v43 - 2);
          char v54 = *((void *)v7 - 5);
          char v55 = *((void *)v7 - 4);
          v56 = (void (*)(void *__return_ptr, void, void))*((void *)v7 - 3);
          v78 = v7 - 56;
          v57 = *((void *)v7 - 2);
          v116 = *(v7 - 6);
          v108 = *(v7 - 8);
          v110 = *(v7 - 7);
          v58 = *(v43 - 6);
          v59 = *(v43 - 7);
          v83 = v43;
          v106 = *(v43 - 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          v60 = v116;
          v61 = v50;
          v62 = v56;
          v63 = v53;
          v64 = a5 + 40;
          v65 = v85;
          v102 = v51;
          v104 = v55;
          v100 = v59;
          v96 = v48;
          while (1)
          {
            v98 = v65;
            v139 = *(void (**)(char *__return_ptr, uint64_t *, uint64_t *))(v64 - 8);
            v127 = v112;
            v128 = v48;
            v129 = v49;
            v130 = v51;
            v131 = v61;
            v132 = v63;
            v133 = v106;
            v134 = v59;
            v135 = v58;
            v66 = v58;
            v118 = v114;
            v119 = v52;
            v120 = v54;
            v121 = v55;
            v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v62;
            v123 = v57;
            v124 = v108;
            v125 = v110;
            v126 = v60;
            v67 = v63;
            v68 = v62;
            v69 = v61;
            swift_retain();
            long long v48 = v96;
            v139(&v117, &v127, &v118);
            if (v117) {
              break;
            }
            v127 = v114;
            v128 = v52;
            v129 = v54;
            v130 = v104;
            v131 = v68;
            v132 = v57;
            v133 = v108;
            v134 = v110;
            v135 = v116;
            v118 = v112;
            v119 = v96;
            v120 = v49;
            v121 = v102;
            v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v69;
            v123 = v67;
            v124 = v106;
            v125 = v100;
            v126 = v66;
            v139(&v117, &v127, &v118);
            if (v117 == 1) {
              break;
            }
            swift_release();
            v64 += 16;
            v65 = v98 - 1;
            v62 = v68;
            v61 = v69;
            v63 = v67;
            v60 = v116;
            long long v51 = v102;
            char v55 = v104;
            v58 = v66;
            v59 = v100;
            if (v98 == 1)
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v5 = v87;
              uint64_t v44 = a1;
              unint64_t v6 = (unint64_t)v91;
              uint64_t v7 = v93;
              uint64_t v43 = v83;
              uint64_t v45 = v85;
              long long v47 = (unint64_t)v79;
              uint64_t v46 = v81;
              goto LABEL_45;
            }
          }
          swift_bridgeObjectRelease();
          v127 = v112;
          v128 = v96;
          v129 = v49;
          v130 = v102;
          v131 = v69;
          v132 = v67;
          v133 = v106;
          v134 = v100;
          v135 = v66;
          v118 = v114;
          v119 = v52;
          v120 = v54;
          v121 = v104;
          v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v68;
          v123 = v57;
          v124 = v108;
          v125 = v110;
          v126 = v116;
          v139(&v117, &v127, &v118);
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v5 = v87;
          uint64_t v44 = a1;
          unint64_t v6 = (unint64_t)v91;
          uint64_t v7 = v93;
          uint64_t v43 = v83;
          uint64_t v45 = v85;
          long long v47 = (unint64_t)v79;
          uint64_t v46 = v81;
          if (v117)
          {
            v70 = v78;
            if (v91 != v93 || v81 >= (unint64_t)v93)
            {
              v71 = *(_OWORD *)v78;
              v72 = *((_OWORD *)v78 + 1);
              v73 = *((_OWORD *)v78 + 2);
              *(void *)(v81 + 48) = *((void *)v78 + 6);
              *(_OWORD *)(v81 + 16) = v72;
              *(_OWORD *)(v81 + 32) = v73;
              *(_OWORD *)v81 = v71;
            }
            v138 = v78;
            if (v83 <= v87) {
              goto LABEL_51;
            }
          }
          else
          {
LABEL_45:
            v136 = (char *)v47;
            if (v6 < (unint64_t)v43 || v46 >= (unint64_t)v43 || (char *)v6 != v43)
            {
              v74 = *(_OWORD *)v47;
              v75 = *(_OWORD *)(v47 + 16);
              v76 = *(_OWORD *)(v47 + 32);
              *(void *)(v46 + 48) = *(void *)(v47 + 48);
              *(_OWORD *)(v46 + 16) = v75;
              *(_OWORD *)(v46 + 32) = v76;
              *(_OWORD *)uint64_t v46 = v74;
            }
            v70 = v7;
            uint64_t v43 = (char *)v47;
            if (v47 <= (unint64_t)v5) {
              goto LABEL_51;
            }
          }
          uint64_t v7 = v70;
          unint64_t v6 = v46;
          if (v70 <= v44) {
            goto LABEL_51;
          }
        }
      }
      goto LABEL_51;
    }
  }
  else if (v8 >= -55)
  {
    size_t v12 = 56 * v9;
    uint64_t v13 = a1;
    if (__dst != a1 || &a1[v12] <= __dst) {
      memmove(__dst, a1, v12);
    }
    v80 = &v5[v12];
    v136 = &v5[v12];
    if (v8 >= 56 && (unint64_t)v7 < v6)
    {
      uint64_t v14 = *(void *)(a5 + 16);
      v90 = v6;
      v84 = v14;
      do
      {
        if (!v14) {
          goto LABEL_20;
        }
        __srcb = v13;
        uint64_t v15 = *(void *)v7;
        uint64_t v16 = *((void *)v7 + 1);
        uint64_t v17 = *((void *)v7 + 2);
        uint64_t v18 = (void (*)(void *__return_ptr, void, void))*((void *)v7 + 4);
        char v19 = *((void *)v7 + 5);
        char v20 = *(void *)v5;
        v82 = *((void *)v5 + 1);
        unint64_t v21 = *((void *)v5 + 2);
        v109 = *((void *)v7 + 3);
        v111 = *((void *)v5 + 3);
        uint64_t v22 = *((void *)v5 + 5);
        v139 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))*((void *)v5 + 4);
        v115 = v5[50];
        v113 = v5[49];
        v86 = v5;
        v95 = v5[48];
        BOOL v23 = v7[50];
        uint64_t v24 = v7[49];
        v92 = v7;
        char v25 = v7[48];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        unint64_t v26 = v139;
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        char v27 = v18;
        uint64_t v28 = v26;
        uint64_t v29 = v22;
        uint64_t v30 = a5 + 40;
        uint64_t v31 = v84;
        v107 = v25;
        v105 = v20;
        v103 = v24;
        v101 = v23;
        v99 = v15;
        while (1)
        {
          v97 = v31;
          v139 = *(void (**)(char *__return_ptr, uint64_t *, uint64_t *))(v30 - 8);
          v127 = v15;
          v128 = v16;
          v129 = v17;
          v130 = v109;
          v131 = v27;
          v132 = v19;
          v133 = v25;
          v134 = v24;
          v135 = v23;
          v118 = v20;
          v119 = v82;
          v120 = v21;
          v121 = v111;
          v122 = v28;
          v123 = v29;
          v124 = v95;
          v125 = v113;
          v126 = v115;
          long long v32 = v29;
          uint64_t v33 = v27;
          char v34 = v28;
          swift_retain();
          v139(&v117, &v127, &v118);
          if (v117) {
            break;
          }
          v127 = v105;
          v128 = v82;
          v129 = v21;
          v130 = v111;
          v131 = (void (*)(void *__return_ptr, void, void))v34;
          v132 = v32;
          v133 = v95;
          v134 = v113;
          v135 = v115;
          v118 = v99;
          v119 = v16;
          v120 = v17;
          v121 = v109;
          v122 = (void (*)(char *__return_ptr, uint64_t *, uint64_t *))v33;
          v123 = v19;
          v124 = v107;
          v125 = v103;
          v126 = v101;
          v139(&v117, &v127, &v118);
          if (v117 == 1) {
            break;
          }
          swift_release();
          v30 += 16;
          uint64_t v31 = v97 - 1;
          uint64_t v28 = v34;
          uint64_t v29 = v32;
          char v27 = v33;
          char v20 = v105;
          uint64_t v15 = v99;
          BOOL v23 = v101;
          uint64_t v24 = v103;
          char v25 = v107;
          if (v97 == 1)
          {
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v5 = v86;
            uint64_t v13 = __srcb;
            unint64_t v6 = v90;
            uint64_t v7 = v92;
            uint64_t v14 = v84;
            goto LABEL_20;
          }
        }
        swift_bridgeObjectRelease();
        v127 = v99;
        v128 = v16;
        v129 = v17;
        v130 = v109;
        v131 = v33;
        v132 = v19;
        v133 = v107;
        v134 = v103;
        v135 = v101;
        v118 = v105;
        v119 = v82;
        v120 = v21;
        v121 = v111;
        v122 = v34;
        v123 = v32;
        v124 = v95;
        v125 = v113;
        v126 = v115;
        v139(&v117, &v127, &v118);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v5 = v86;
        uint64_t v13 = __srcb;
        unint64_t v6 = v90;
        uint64_t v7 = v92;
        uint64_t v14 = v84;
        if (v117)
        {
          char v35 = v92 + 56;
          if (__srcb < v92 || __srcb >= v35 || __srcb != v92)
          {
            char v36 = *(_OWORD *)v92;
            uint64_t v37 = *((_OWORD *)v92 + 1);
            uint64_t v38 = *((_OWORD *)v92 + 2);
            *((void *)__srcb + 6) = *((void *)v92 + 6);
            *((_OWORD *)__srcb + 1) = v37;
            *((_OWORD *)__srcb + 2) = v38;
            *(_OWORD *)__srcb = v36;
          }
        }
        else
        {
LABEL_20:
          if (v13 != v5)
          {
            BOOL v39 = *(_OWORD *)v5;
            uint64_t v40 = *((_OWORD *)v5 + 1);
            uint64_t v41 = *((_OWORD *)v5 + 2);
            *((void *)v13 + 6) = *((void *)v5 + 6);
            *((_OWORD *)v13 + 1) = v40;
            *((_OWORD *)v13 + 2) = v41;
            *(_OWORD *)uint64_t v13 = v39;
          }
          v5 += 56;
          v137 = v5;
          char v35 = v7;
        }
        v13 += 56;
        if (v5 >= v80) {
          break;
        }
        uint64_t v7 = v35;
      }
      while ((unint64_t)v35 < v6);
      v138 = v13;
    }
LABEL_51:
    sub_2189217FC((void **)&v138, (const void **)&v137, &v136);
    return 1;
  }
  swift_bridgeObjectRelease();
  double result = sub_2189CEC58();
  __break(1u);
  return result;
}

uint64_t sub_2189B0CA4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  void (*v41)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  char v68;
  int v69;
  uint64_t v70;

  uint64_t v31 = result;
  uint64_t v33 = a3;
  if (a3 != a2)
  {
    uint64_t v37 = *a4;
    uint64_t v34 = *(void *)(a5 + 16);
    uint64_t v32 = a5 + 40;
    do
    {
      if (v34)
      {
        uint64_t v5 = v33;
        do
        {
          unint64_t v6 = (uint64_t *)(v37 + 56 * v5);
          uint64_t v8 = *v6;
          uint64_t v7 = v6[1];
          uint64_t v38 = v5 - 1;
          uint64_t v9 = v6[2];
          uint64_t v10 = v6[4];
          uint64_t v50 = v6[3];
          uint64_t v11 = v6[5];
          v69 = *((unsigned __int8 *)v6 + 48);
          long long v48 = *((unsigned char *)v6 + 50);
          uint64_t v49 = *((unsigned char *)v6 + 49);
          char v35 = v6 - 7;
          char v36 = v6;
          uint64_t v12 = *(v6 - 6);
          uint64_t v13 = *(v6 - 5);
          uint64_t v14 = *(v6 - 3);
          uint64_t v46 = *(v6 - 4);
          long long v47 = *(v6 - 7);
          uint64_t v15 = *(v6 - 2);
          uint64_t v44 = *((unsigned char *)v6 - 7);
          uint64_t v45 = *((unsigned char *)v6 - 8);
          uint64_t v43 = *((unsigned char *)v6 - 6);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          uint64_t v16 = v14;
          uint64_t v17 = v32;
          uint64_t v18 = v34;
          uint64_t v42 = v15;
          uint64_t v39 = v7;
          while (1)
          {
            uint64_t v40 = v18;
            uint64_t v41 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v17 - 8);
            v60 = v8;
            v61 = v7;
            v62 = v9;
            v63 = v50;
            v64 = v10;
            v65 = v11;
            v66 = v69;
            v67 = v49;
            v68 = v48;
            long long v51 = v47;
            uint64_t v52 = v12;
            char v53 = v13;
            char v54 = v46;
            char v55 = v16;
            v56 = v15;
            v57 = v45;
            v58 = v44;
            v59 = v43;
            uint64_t v19 = v16;
            swift_retain();
            uint64_t v20 = v19;
            uint64_t v7 = v39;
            v41(&v70, &v60, &v51);
            if (v70) {
              break;
            }
            v60 = v47;
            v61 = v12;
            v62 = v13;
            v63 = v46;
            v64 = v20;
            v65 = v42;
            v66 = v45;
            v67 = v44;
            v68 = v43;
            long long v51 = v8;
            uint64_t v52 = v39;
            char v53 = v9;
            char v54 = v50;
            char v55 = v10;
            v56 = v11;
            v57 = v69;
            v58 = v49;
            v59 = v48;
            v41(&v70, &v60, &v51);
            if (v70 == 1) {
              break;
            }
            swift_release();
            v17 += 16;
            uint64_t v18 = v40 - 1;
            uint64_t v16 = v20;
            uint64_t v15 = v42;
            if (v40 == 1)
            {
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              double result = swift_bridgeObjectRelease();
              goto LABEL_4;
            }
          }
          swift_bridgeObjectRelease();
          v60 = v8;
          v61 = v39;
          v62 = v9;
          v63 = v50;
          v64 = v10;
          v65 = v11;
          v66 = v69;
          v67 = v49;
          v68 = v48;
          long long v51 = v47;
          uint64_t v52 = v12;
          char v53 = v13;
          char v54 = v46;
          char v55 = v20;
          v56 = v42;
          v57 = v45;
          v58 = v44;
          v59 = v43;
          v41(&v70, &v60, &v51);
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          double result = swift_release();
          uint64_t v5 = v38;
          if ((v70 & 1) == 0) {
            break;
          }
          if (!v37)
          {
            __break(1u);
            return result;
          }
          uint64_t v21 = *v36;
          uint64_t v22 = v36[1];
          uint64_t v23 = v36[2];
          long long v24 = *(_OWORD *)(v36 + 3);
          uint64_t v25 = v36[5];
          char v26 = *((unsigned char *)v36 + 48);
          char v27 = *((unsigned char *)v36 + 49);
          char v28 = *((unsigned char *)v36 + 50);
          long long v29 = *((_OWORD *)v35 + 1);
          *(_OWORD *)char v36 = *(_OWORD *)v35;
          *((_OWORD *)v36 + 1) = v29;
          *((_OWORD *)v36 + 2) = *((_OWORD *)v35 + 2);
          v36[6] = v35[6];
          uint64_t *v35 = v21;
          v35[1] = v22;
          v35[2] = v23;
          *(_OWORD *)(v35 + 3) = v24;
          v35[5] = v25;
          *((unsigned char *)v35 + 48) = v26;
          *((unsigned char *)v35 + 49) = v27;
          *((unsigned char *)v35 + 50) = v28;
        }
        while (v38 != v31);
      }
LABEL_4:
      ++v33;
    }
    while (v33 != a2);
  }
  return result;
}

uint64_t sub_2189B10D4(uint64_t *a1, uint64_t a2)
{
  void (*v31)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  long long v59;
  uint64_t v60;
  char v61;
  char v62;
  char v63;
  long long v64;
  long long v65;
  long long v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  long long v85;
  uint64_t v86;
  char v87;
  char v88;
  char v89;
  long long v90;
  unint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  BOOL v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  BOOL v116;
  uint64_t v117;
  char v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  BOOL v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  unint64_t v138;
  char *v139;
  uint64_t v140;
  char *v141;
  char *v142;
  unint64_t v143;
  unint64_t v144;
  char *v145;
  uint64_t result;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  char *v152;
  unint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  uint64_t v160;
  char *__dst;
  uint64_t v162;
  char v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  char *v169;
  char v170;
  char v171;
  uint64_t v172;
  char v173;
  char v174;
  uint64_t v175;
  uint64_t v176;
  char v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char v187;
  char v188;
  uint64_t v189;
  char v190;
  char v191;
  char v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char v199;
  uint64_t v200;
  uint64_t v201;
  char v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  char v208;
  uint64_t v209;
  uint64_t v210;
  char v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void (*v218)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  char v226;
  char v227;
  char v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  char v235;
  char v236;
  char v237;
  int v238;
  uint64_t v239;

  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_2189CEC68();
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_161;
    }
    if (!v4) {
      return swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRetain();
    sub_2189B0CA4(0, v4, 1, a1, a2);
    if (!v2) {
      return swift_bridgeObjectRelease_n();
    }
LABEL_138:
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  v156 = v5;
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_169;
  }
  v165 = v2;
  v154 = a1;
  if (v4 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v4 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_125:
      v169 = v12;
      v155 = v9;
      if (v13 >= 2)
      {
        v147 = *v154;
        do
        {
          v148 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_156;
          }
          if (!v147) {
            goto LABEL_168;
          }
          v149 = *(void *)&v169[16 * v148 + 32];
          v150 = *(void *)&v169[16 * v13 + 24];
          v151 = (char *)(v147 + 56 * *(void *)&v169[16 * v13 + 16]);
          swift_bridgeObjectRetain();
          sub_2189B0320((char *)(v147 + 56 * v149), v151, v147 + 56 * v150, __dst, a2);
          if (v165) {
            goto LABEL_137;
          }
          swift_bridgeObjectRelease();
          if (v150 < v149) {
            goto LABEL_157;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v169 = sub_218921A14((uint64_t)v169);
          }
          if (v148 >= *((void *)v169 + 2)) {
            goto LABEL_158;
          }
          v152 = &v169[16 * v148 + 32];
          *(void *)v152 = v149;
          *((void *)v152 + 1) = v150;
          v153 = *((void *)v169 + 2);
          if (v13 > v153) {
            goto LABEL_159;
          }
          memmove(&v169[16 * v13 + 16], &v169[16 * v13 + 32], 16 * (v153 - v13));
          *((void *)v169 + 2) = v153 - 1;
          unint64_t v13 = v153 - 1;
        }
        while (v153 > 2);
      }
      swift_bridgeObjectRelease();
      *(void *)(v155 + 16) = 0;
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    v155 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    uint64_t v8 = sub_2189CEA58();
    *(void *)(v8 + 16) = v7;
    v155 = v8;
    __dst = (char *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  v158 = v4;
  v166 = v11;
  while (1)
  {
    v162 = v10;
    uint64_t v14 = v10 + 1;
    v167 = v12;
    if (v10 + 1 >= v4) {
      goto LABEL_51;
    }
    uint64_t v15 = *(void *)(a2 + 16);
    v157 = v15;
    if (!v15)
    {
      uint64_t v32 = v10 + 2;
      if (v10 + 2 < v4)
      {
        v159 = 0;
        goto LABEL_29;
      }
LABEL_50:
      uint64_t v14 = v32;
      goto LABEL_51;
    }
    uint64_t v16 = v11 + 56 * v14;
    uint64_t v17 = *(void *)(v16 + 8);
    v176 = *(void *)v16;
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v19 = *(void *)(v16 + 32);
    v179 = *(void *)(v16 + 24);
    v182 = v10 + 1;
    uint64_t v20 = *(void *)(v16 + 40);
    uint64_t v21 = v11 + 56 * v10;
    uint64_t v23 = *(void *)v21;
    uint64_t v22 = *(void *)(v21 + 8);
    uint64_t v24 = *(void *)(v21 + 16);
    uint64_t v25 = *(void *)(v21 + 24);
    uint64_t v26 = *(void *)(v21 + 32);
    uint64_t v27 = *(void *)(v21 + 40);
    v190 = *(unsigned char *)(v21 + 50);
    v187 = *(unsigned char *)(v21 + 49);
    v173 = *(unsigned char *)(v21 + 48);
    v170 = *(unsigned char *)(v16 + 50);
    v163 = *(unsigned char *)(v16 + 49);
    int v28 = *(unsigned __int8 *)(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v215 = v26;
    swift_bridgeObjectRetain();
    v212 = v27;
    uint64_t v29 = v17;
    swift_retain();
    uint64_t v30 = a2 + 40;
    v206 = v19;
    v209 = v29;
    v203 = v20;
    v238 = v28;
    v197 = v23;
    v200 = v25;
    do
    {
      v193 = v15;
      uint64_t v31 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v30 - 8);
      v229 = v176;
      v230 = v29;
      v231 = v18;
      v232 = v179;
      v233 = v19;
      v234 = v20;
      v235 = v28;
      v236 = v163;
      v237 = v170;
      v220 = v23;
      v221 = v22;
      v222 = v24;
      v223 = v25;
      v224 = v215;
      v225 = v212;
      v226 = v173;
      v227 = v187;
      v228 = v190;
      swift_retain();
      v31(&v239, &v229, &v220);
      if (v239) {
        goto LABEL_25;
      }
      v229 = v197;
      v230 = v22;
      v231 = v24;
      v232 = v200;
      v233 = v215;
      v234 = v212;
      v235 = v173;
      v236 = v187;
      v237 = v190;
      v220 = v176;
      v221 = v209;
      v222 = v18;
      v223 = v179;
      v224 = v206;
      v225 = v203;
      v226 = v238;
      v227 = v163;
      v228 = v170;
      v31(&v239, &v229, &v220);
      if (v239 == 1)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        v229 = v176;
        v230 = v209;
        v231 = v18;
        v232 = v179;
        v233 = v206;
        v234 = v203;
        v235 = v238;
        v236 = v163;
        v237 = v170;
        v220 = v197;
        v221 = v22;
        v222 = v24;
        v223 = v200;
        v224 = v215;
        v225 = v212;
        v226 = v173;
        v227 = v187;
        v228 = v190;
        v31(&v239, &v229, &v220);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        v159 = v239;
        uint64_t v32 = v162 + 2;
        uint64_t v15 = v157;
        uint64_t v4 = v158;
        uint64_t v11 = v166;
        uint64_t v12 = v167;
        uint64_t v14 = v182;
        if (v162 + 2 < v158) {
          goto LABEL_29;
        }
        goto LABEL_41;
      }
      swift_release();
      v30 += 16;
      --v15;
      uint64_t v19 = v206;
      uint64_t v29 = v209;
      uint64_t v25 = v200;
      uint64_t v20 = v203;
      uint64_t v23 = v197;
      LOBYTE(v28) = v238;
    }
    while (v193 != 1);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = v162 + 2;
    uint64_t v4 = v158;
    if (v162 + 2 < v158) {
      break;
    }
    uint64_t v14 = v162 + 2;
    uint64_t v12 = v167;
LABEL_74:
    if (v14 < v162) {
      goto LABEL_155;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_218921630(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    v92 = *((void *)v12 + 2);
    v91 = *((void *)v12 + 3);
    unint64_t v13 = v92 + 1;
    uint64_t v11 = v166;
    if (v92 >= v91 >> 1)
    {
      v145 = sub_218921630((char *)(v91 > 1), v92 + 1, 1, v12);
      uint64_t v11 = v166;
      uint64_t v12 = v145;
    }
    *((void *)v12 + 2) = v13;
    v93 = v12 + 32;
    v94 = &v12[16 * v92 + 32];
    *(void *)v94 = v162;
    *((void *)v94 + 1) = v14;
    v185 = v14;
    if (v92)
    {
      v168 = v12;
      v219 = v12 + 32;
      while (1)
      {
        v95 = v13 - 1;
        if (v13 >= 4)
        {
          v100 = &v93[16 * v13];
          v101 = *((void *)v100 - 8);
          v102 = *((void *)v100 - 7);
          v106 = __OFSUB__(v102, v101);
          v103 = v102 - v101;
          if (v106) {
            goto LABEL_144;
          }
          v105 = *((void *)v100 - 6);
          v104 = *((void *)v100 - 5);
          v106 = __OFSUB__(v104, v105);
          v98 = v104 - v105;
          v99 = v106;
          if (v106) {
            goto LABEL_145;
          }
          v107 = v13 - 2;
          v108 = &v93[16 * v13 - 32];
          v110 = *(void *)v108;
          v109 = *((void *)v108 + 1);
          v106 = __OFSUB__(v109, v110);
          v111 = v109 - v110;
          if (v106) {
            goto LABEL_147;
          }
          v106 = __OFADD__(v98, v111);
          v112 = v98 + v111;
          if (v106) {
            goto LABEL_150;
          }
          if (v112 >= v103)
          {
            v130 = &v93[16 * v95];
            v132 = *(void *)v130;
            v131 = *((void *)v130 + 1);
            v106 = __OFSUB__(v131, v132);
            v133 = v131 - v132;
            if (v106) {
              goto LABEL_154;
            }
            v123 = v98 < v133;
            goto LABEL_112;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v124 = *((void *)v12 + 4);
            v125 = *((void *)v12 + 5);
            v106 = __OFSUB__(v125, v124);
            v117 = v125 - v124;
            v118 = v106;
            goto LABEL_106;
          }
          v97 = *((void *)v12 + 4);
          v96 = *((void *)v12 + 5);
          v106 = __OFSUB__(v96, v97);
          v98 = v96 - v97;
          v99 = v106;
        }
        if (v99) {
          goto LABEL_146;
        }
        v107 = v13 - 2;
        v113 = &v93[16 * v13 - 32];
        v115 = *(void *)v113;
        v114 = *((void *)v113 + 1);
        v116 = __OFSUB__(v114, v115);
        v117 = v114 - v115;
        v118 = v116;
        if (v116) {
          goto LABEL_149;
        }
        v119 = &v93[16 * v95];
        v121 = *(void *)v119;
        v120 = *((void *)v119 + 1);
        v106 = __OFSUB__(v120, v121);
        v122 = v120 - v121;
        if (v106) {
          goto LABEL_152;
        }
        if (__OFADD__(v117, v122)) {
          goto LABEL_153;
        }
        if (v117 + v122 >= v98)
        {
          v123 = v98 < v122;
LABEL_112:
          if (v123) {
            v95 = v107;
          }
          goto LABEL_114;
        }
LABEL_106:
        if (v118) {
          goto LABEL_148;
        }
        v126 = &v93[16 * v95];
        v128 = *(void *)v126;
        v127 = *((void *)v126 + 1);
        v106 = __OFSUB__(v127, v128);
        v129 = v127 - v128;
        if (v106) {
          goto LABEL_151;
        }
        if (v129 < v117) {
          goto LABEL_16;
        }
LABEL_114:
        v134 = v95 - 1;
        if (v95 - 1 >= v13)
        {
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
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
          goto LABEL_163;
        }
        if (!v11) {
          goto LABEL_165;
        }
        v135 = &v93[16 * v134];
        v136 = v93;
        v137 = *(void *)v135;
        v138 = v95;
        v139 = &v136[16 * v95];
        v140 = *((void *)v139 + 1);
        v141 = (char *)(v11 + 56 * *(void *)v135);
        v142 = (char *)(v11 + 56 * *(void *)v139);
        v143 = v11 + 56 * v140;
        swift_bridgeObjectRetain();
        sub_2189B0320(v141, v142, v143, __dst, a2);
        if (v165)
        {
LABEL_137:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(void *)(v155 + 16) = 0;
          goto LABEL_138;
        }
        swift_bridgeObjectRelease();
        if (v140 < v137) {
          goto LABEL_141;
        }
        uint64_t v12 = v168;
        if (v138 > *((void *)v168 + 2)) {
          goto LABEL_142;
        }
        *(void *)v135 = v137;
        v93 = v219;
        *(void *)&v219[16 * v134 + 8] = v140;
        v144 = *((void *)v168 + 2);
        if (v138 >= v144) {
          goto LABEL_143;
        }
        v165 = 0;
        unint64_t v13 = v144 - 1;
        memmove(v139, v139 + 16, 16 * (v144 - 1 - v138));
        *((void *)v168 + 2) = v144 - 1;
        uint64_t v11 = v166;
        if (v144 <= 2) {
          goto LABEL_16;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_16:
    uint64_t v4 = v158;
    uint64_t v10 = v185;
    if (v185 >= v158)
    {
      uint64_t v9 = v155;
      goto LABEL_125;
    }
  }
  v159 = 0;
  uint64_t v11 = v166;
  uint64_t v12 = v167;
  uint64_t v14 = v182;
  uint64_t v15 = v157;
LABEL_29:
  uint64_t v33 = v32;
LABEL_32:
  uint64_t v32 = v33;
  if (!v15) {
    goto LABEL_30;
  }
  v164 = v33;
  uint64_t v34 = v11 + 56 * v33;
  char v35 = *(void *)(v34 + 8);
  char v36 = *(void *)(v34 + 16);
  uint64_t v37 = *(void *)(v34 + 32);
  v180 = *(void *)(v34 + 24);
  v183 = *(void *)v34;
  uint64_t v38 = *(void *)(v34 + 40);
  uint64_t v39 = v11 + 56 * v14;
  uint64_t v41 = *(void *)v39;
  uint64_t v40 = *(void *)(v39 + 8);
  uint64_t v42 = *(void *)(v39 + 16);
  uint64_t v43 = *(void *)(v39 + 24);
  uint64_t v44 = *(void *)(v39 + 32);
  uint64_t v45 = *(void *)(v39 + 40);
  v191 = *(unsigned char *)(v39 + 50);
  v188 = *(unsigned char *)(v39 + 49);
  v177 = *(unsigned char *)(v39 + 48);
  v174 = *(unsigned char *)(v34 + 50);
  v171 = *(unsigned char *)(v34 + 49);
  uint64_t v46 = *(unsigned __int8 *)(v34 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  v216 = v44;
  long long v47 = v35;
  swift_bridgeObjectRetain();
  v213 = v45;
  swift_retain();
  long long v48 = a2 + 40;
  v207 = v37;
  v210 = v47;
  v204 = v38;
  v238 = v46;
  v198 = v41;
  v201 = v43;
  while (1)
  {
    v194 = v15;
    uint64_t v49 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v48 - 8);
    v229 = v183;
    v230 = v47;
    v231 = v36;
    v232 = v180;
    v233 = v37;
    v234 = v38;
    v235 = v46;
    v236 = v171;
    v237 = v174;
    v220 = v41;
    v221 = v40;
    v222 = v42;
    v223 = v43;
    v224 = v216;
    v225 = v213;
    v226 = v177;
    v227 = v188;
    v228 = v191;
    swift_retain();
    v49(&v239, &v229, &v220);
    if (v239) {
      break;
    }
    v229 = v198;
    v230 = v40;
    v231 = v42;
    v232 = v201;
    v233 = v216;
    v234 = v213;
    v235 = v177;
    v236 = v188;
    v237 = v191;
    v220 = v183;
    v221 = v210;
    v222 = v36;
    v223 = v180;
    v224 = v207;
    v225 = v204;
    v226 = v238;
    v227 = v171;
    v228 = v174;
    v49(&v239, &v229, &v220);
    if (v239 == 1) {
      break;
    }
    swift_release();
    v48 += 16;
    --v15;
    uint64_t v37 = v207;
    long long v47 = v210;
    uint64_t v43 = v201;
    uint64_t v38 = v204;
    uint64_t v41 = v198;
    LOBYTE(v46) = v238;
    if (v194 == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v11 = v166;
      uint64_t v12 = v167;
      uint64_t v15 = v157;
      uint64_t v4 = v158;
      uint64_t v32 = v164;
LABEL_30:
      if (v159) {
        goto LABEL_42;
      }
LABEL_31:
      uint64_t v33 = v32 + 1;
      uint64_t v14 = v32;
      if (v32 + 1 >= v4)
      {
        ++v32;
        goto LABEL_41;
      }
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRelease();
  v229 = v183;
  v230 = v210;
  v231 = v36;
  v232 = v180;
  v233 = v207;
  v234 = v204;
  v235 = v238;
  v236 = v171;
  v237 = v174;
  v220 = v198;
  v221 = v40;
  v222 = v42;
  v223 = v201;
  v224 = v216;
  v225 = v213;
  v226 = v177;
  v227 = v188;
  v228 = v191;
  v49(&v239, &v229, &v220);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v11 = v166;
  uint64_t v12 = v167;
  uint64_t v15 = v157;
  uint64_t v4 = v158;
  uint64_t v32 = v164;
  if (v159 == v239) {
    goto LABEL_31;
  }
LABEL_41:
  uint64_t v14 = v32;
  if (v159)
  {
LABEL_42:
    if (v32 < v162) {
      goto LABEL_164;
    }
    if (v162 < v32)
    {
      uint64_t v50 = 56 * v32;
      long long v51 = v32;
      uint64_t v52 = v162;
      char v53 = 56 * v162;
      while (1)
      {
        if (v52 != --v51)
        {
          if (!v11) {
            goto LABEL_167;
          }
          char v54 = v11 + v53;
          char v55 = v11 + v50;
          v56 = *(void *)(v11 + v53);
          v57 = *(void *)(v11 + v53 + 8);
          v58 = *(void *)(v11 + v53 + 16);
          v59 = *(_OWORD *)(v11 + v53 + 24);
          v60 = *(void *)(v11 + v53 + 40);
          v61 = *(unsigned char *)(v11 + v53 + 48);
          v62 = *(unsigned char *)(v11 + v53 + 49);
          v63 = *(unsigned char *)(v11 + v53 + 50);
          v64 = *(_OWORD *)(v11 + v50 - 40);
          v65 = *(_OWORD *)(v11 + v50 - 24);
          v66 = *(_OWORD *)(v11 + v50 - 56);
          *(void *)(v54 + 48) = *(void *)(v11 + v50 - 8);
          *(_OWORD *)(v54 + 16) = v64;
          *(_OWORD *)(v54 + 32) = v65;
          *(_OWORD *)char v54 = v66;
          *(void *)(v55 - 56) = v56;
          *(void *)(v55 - 48) = v57;
          *(void *)(v55 - 40) = v58;
          *(_OWORD *)(v55 - 32) = v59;
          *(void *)(v55 - 16) = v60;
          *(unsigned char *)(v55 - 8) = v61;
          *(unsigned char *)(v55 - 7) = v62;
          *(unsigned char *)(v55 - 6) = v63;
        }
        ++v52;
        v50 -= 56;
        v53 += 56;
        if (v52 >= v51) {
          goto LABEL_50;
        }
      }
    }
    goto LABEL_50;
  }
LABEL_51:
  if (v14 >= v4) {
    goto LABEL_74;
  }
  if (__OFSUB__(v14, v162)) {
    goto LABEL_160;
  }
  if (v14 - v162 >= v156) {
    goto LABEL_74;
  }
  v67 = v162 + v156;
  if (__OFADD__(v162, v156)) {
    goto LABEL_162;
  }
  if (v67 >= v4) {
    v67 = v4;
  }
  if (v67 >= v162)
  {
    if (v14 != v67)
    {
      v172 = *(void *)(a2 + 16);
      v160 = v67;
      do
      {
        if (v172)
        {
          v68 = v14;
          v184 = v14;
          while (1)
          {
            v69 = v11 + 56 * v68;
            v70 = *(void *)(v69 + 8);
            v217 = *(void *)v69;
            v181 = v68 - 1;
            v71 = *(void *)(v69 + 16);
            v72 = *(void *)(v69 + 32);
            v214 = *(void *)(v69 + 24);
            v73 = *(void *)(v69 + 40);
            v211 = *(unsigned char *)(v69 + 48);
            v192 = *(unsigned char *)(v69 + 49);
            v208 = *(unsigned char *)(v69 + 50);
            v205 = *(void *)(v69 - 56);
            v175 = v69 - 56;
            v178 = v69;
            v74 = *(void *)(v69 - 48);
            v75 = *(void *)(v69 - 40);
            v76 = *(void *)(v69 - 24);
            v189 = *(void *)(v69 - 32);
            v77 = *(void *)(v69 - 16);
            v202 = *(unsigned char *)(v69 - 8);
            v199 = *(unsigned char *)(v69 - 7);
            v238 = *(unsigned __int8 *)(v69 - 6);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
            v78 = v76;
            v79 = a2 + 40;
            v80 = v172;
            v196 = v77;
            while (1)
            {
              v195 = v80;
              v218 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v79 - 8);
              v229 = v217;
              v230 = v70;
              v231 = v71;
              v232 = v214;
              v233 = v72;
              v234 = v73;
              v235 = v211;
              v236 = v192;
              v237 = v208;
              v220 = v205;
              v221 = v74;
              v222 = v75;
              v223 = v189;
              v224 = v78;
              v225 = v77;
              v226 = v202;
              v227 = v199;
              v228 = v238;
              v81 = v78;
              swift_retain();
              v218(&v239, &v229, &v220);
              if (v239) {
                break;
              }
              v229 = v205;
              v230 = v74;
              v231 = v75;
              v232 = v189;
              v233 = v81;
              v234 = v196;
              v235 = v202;
              v236 = v199;
              v237 = v238;
              v220 = v217;
              v221 = v70;
              v222 = v71;
              v223 = v214;
              v224 = v72;
              v225 = v73;
              v226 = v211;
              v227 = v192;
              v228 = v208;
              v218(&v239, &v229, &v220);
              if (v239 == 1) {
                break;
              }
              swift_release();
              v79 += 16;
              v80 = v195 - 1;
              v78 = v81;
              v77 = v196;
              if (v195 == 1)
              {
                swift_release();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_release();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_60;
              }
            }
            swift_bridgeObjectRelease();
            v229 = v217;
            v230 = v70;
            v231 = v71;
            v232 = v214;
            v233 = v72;
            v234 = v73;
            v235 = v211;
            v236 = v192;
            v237 = v208;
            v220 = v205;
            v221 = v74;
            v222 = v75;
            v223 = v189;
            v224 = v81;
            v225 = v196;
            v226 = v202;
            v227 = v199;
            v228 = v238;
            v218(&v239, &v229, &v220);
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
            if ((v239 & 1) == 0) {
              break;
            }
            uint64_t v11 = v166;
            uint64_t v12 = v167;
            uint64_t v14 = v184;
            if (!v166) {
              goto LABEL_166;
            }
            v82 = *(void *)v178;
            v83 = *(void *)(v178 + 8);
            v84 = *(void *)(v178 + 16);
            v85 = *(_OWORD *)(v178 + 24);
            v86 = *(void *)(v178 + 40);
            v87 = *(unsigned char *)(v178 + 48);
            v88 = *(unsigned char *)(v178 + 49);
            v89 = *(unsigned char *)(v178 + 50);
            v90 = *(_OWORD *)(v175 + 16);
            *(_OWORD *)v178 = *(_OWORD *)v175;
            *(_OWORD *)(v178 + 16) = v90;
            *(_OWORD *)(v178 + 32) = *(_OWORD *)(v175 + 32);
            *(void *)(v178 + 48) = *(void *)(v175 + 48);
            *(void *)v175 = v82;
            *(void *)(v175 + 8) = v83;
            *(void *)(v175 + 16) = v84;
            *(_OWORD *)(v175 + 24) = v85;
            *(void *)(v175 + 40) = v86;
            *(unsigned char *)(v175 + 48) = v87;
            *(unsigned char *)(v175 + 49) = v88;
            *(unsigned char *)(v175 + 50) = v89;
            v68 = v181;
            if (v181 == v162) {
              goto LABEL_61;
            }
          }
LABEL_60:
          uint64_t v11 = v166;
          uint64_t v12 = v167;
          uint64_t v14 = v184;
        }
LABEL_61:
        ++v14;
      }
      while (v14 != v160);
      uint64_t v14 = v160;
    }
    goto LABEL_74;
  }
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_166:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_167:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_168:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_169:
  swift_bridgeObjectRelease_n();
  double result = sub_2189CEC08();
  __break(1u);
  return result;
}

uint64_t sub_2189B228C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_2189286F4(v4);
  }
  uint64_t v5 = *(void *)(v4 + 16);
  v7[0] = v4 + 32;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  sub_2189B10D4(v7, a2);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

uint64_t initializeWithCopy for MostUsedListSectionAppsAndCategories.Item(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MostUsedListSectionAppsAndCategories.Item(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  return a1;
}

uint64_t assignWithTake for MostUsedListSectionAppsAndCategories.Item(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  return a1;
}

ValueMetadata *type metadata accessor for MostUsedListSectionAppsAndCategories.Item()
{
  return &type metadata for MostUsedListSectionAppsAndCategories.Item;
}

unint64_t sub_2189B24CC()
{
  unint64_t result = qword_267BE34C8;
  if (!qword_267BE34C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE34D0);
    sub_2189B2540();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE34C8);
  }
  return result;
}

unint64_t sub_2189B2540()
{
  unint64_t result = qword_267BE34D8;
  if (!qword_267BE34D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3488);
    sub_2189AFD50();
    sub_21892098C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE34D8);
  }
  return result;
}

uint64_t sub_2189B25C8(uint64_t a1, uint64_t *a2)
{
  return sub_2189AFDAC(a1, a2) & 1;
}

uint64_t PickupsHeaderView.Model.init(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50) - 8;
  MEMORY[0x270FA5388](v41);
  uint64_t v37 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v38 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v49 = (char *)&v34 - v7;
  MEMORY[0x270FA5388](v8);
  char v36 = (char *)&v34 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v13 = sub_2189CD6B8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v34 - v18;
  unint64_t v35 = sub_21896CA2C(MEMORY[0x263F8EE78]);
  uint64_t v43 = v14;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v47 = a1;
  v20(v19, a1, v13);
  uint64_t v21 = sub_2189CD528();
  uint64_t v34 = *(void *)(v21 - 8);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
  v22(v12, 1, 1, v21);
  uint64_t v44 = v19;
  uint64_t v23 = (uint64_t)v36;
  v20(v16, (uint64_t)v19, v13);
  uint64_t v45 = v12;
  uint64_t v24 = (uint64_t)v38;
  sub_218916808((uint64_t)v12, v23);
  uint64_t v25 = v37;
  uint64_t v42 = v16;
  uint64_t v48 = v13;
  v20(v37, (uint64_t)v16, v13);
  uint64_t v26 = v41;
  uint64_t v27 = *(int *)(v41 + 44);
  sub_21896CA2C(MEMORY[0x263F8EE78]);
  uint64_t v39 = &v25[*(int *)(v26 + 52)];
  uint64_t v40 = v22;
  ((void (*)(void))v22)();
  uint64_t v28 = v34;
  swift_bridgeObjectRelease();
  v25[*(int *)(v26 + 48)] = 1;
  *(void *)&v25[v27] = v35;
  uint64_t v29 = (uint64_t)v25;
  sub_218916808(v23, v24);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v24, 1, v21) == 1)
  {
    sub_2189CD518();
    sub_218900AE4(v23, &qword_267BE1AE0);
    uint64_t v30 = *(void (**)(char *, uint64_t))(v43 + 8);
    v30(v42, v48);
    sub_218900AE4(v24, &qword_267BE1AE0);
  }
  else
  {
    sub_218900AE4(v23, &qword_267BE1AE0);
    uint64_t v30 = *(void (**)(char *, uint64_t))(v43 + 8);
    v30(v42, v48);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v49, v24, v21);
  }
  uint64_t v31 = (uint64_t)v49;
  v40(v49, 0, 1, v21);
  sub_21896DFD0(v31, (uint64_t)v39);
  sub_218900AE4((uint64_t)v45, &qword_267BE1AE0);
  uint64_t v32 = v48;
  v30(v44, v48);
  sub_2189B2A50(v29, v46);
  return ((uint64_t (*)(uint64_t, uint64_t))v30)(v47, v32);
}

uint64_t sub_2189B2A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PickupsHeaderView.body.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PickupsHeaderView.Model(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE34E0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189B2CB4(v1, (uint64_t)v4);
  sub_2189B2A50((uint64_t)v4, (uint64_t)v7);
  uint64_t v8 = (int *)type metadata accessor for PickupsHeaderView(0);
  uint64_t v9 = *(void *)(v1 + v8[5]);
  uint64_t v10 = v1 + v8[6];
  uint64_t v11 = &v7[v5[10]];
  uint64_t v12 = sub_2189CD3A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v11, v10, v12);
  uint64_t v13 = *(void *)(v1 + v8[7]);
  *(void *)&v7[v5[9]] = v9;
  uint64_t v14 = &v7[v5[11]];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  *(void *)&v7[v5[12]] = v13;
  uint64_t v15 = &v7[v5[13]];
  *(void *)uint64_t v15 = sub_218991468;
  *((void *)v15 + 1) = 0;
  sub_2189B2D38();
  swift_bridgeObjectRetain();
  sub_2189CE4C8();
  return sub_218900AE4((uint64_t)v7, &qword_267BE34E0);
}

uint64_t type metadata accessor for PickupsHeaderView.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3500);
}

uint64_t sub_2189B2CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PickupsHeaderView.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for PickupsHeaderView(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE34F0);
}

unint64_t sub_2189B2D38()
{
  unint64_t result = qword_267BE34E8;
  if (!qword_267BE34E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE34E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE34E8);
  }
  return result;
}

uint64_t sub_2189B2D94()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for PickupsHeaderView(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2189CD6B8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)((char *)a1 + v8[9]) = *(void *)((char *)a2 + v8[9]);
    *((unsigned char *)a1 + v8[10]) = *((unsigned char *)a2 + v8[10]);
    uint64_t v9 = v8[11];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_2189CD528();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v10, v11, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    uint64_t v17 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PickupsHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(v5 + 44);
  uint64_t v7 = sub_2189CD528();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v9 = a1 + *(int *)(a2 + 24);
  uint64_t v10 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v7[9]) = *(void *)(a2 + v7[9]);
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  uint64_t v8 = v7[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_2189CD528();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v15 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v7[9]) = *(void *)(a2 + v7[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  uint64_t v8 = v7[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_2189CD528();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v17 = a3[6];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v7[9]) = *(void *)(a2 + v7[9]);
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  uint64_t v8 = v7[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_2189CD528();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for PickupsHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v7[9]) = *(void *)(a2 + v7[9]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v7[10]) = *(unsigned char *)(a2 + v7[10]);
  uint64_t v8 = v7[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_2189CD528();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PickupsHeaderView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189B39D8);
}

uint64_t sub_2189B39D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PickupsHeaderView.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_2189CD3A8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for PickupsHeaderView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189B3B0C);
}

uint64_t sub_2189B3B0C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for PickupsHeaderView.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_2189CD3A8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_2189B3C1C()
{
  sub_2189B3CF8();
  if (v0 <= 0x3F)
  {
    sub_2189CD3A8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2189B3CF8()
{
  if (!qword_267BE28B0)
  {
    sub_2189811E4();
    unint64_t v0 = type metadata accessor for ChartHeaderView.Model();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BE28B0);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for PickupsHeaderView.Model(void *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = sub_2189CD6B8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(void *)((char *)a1 + v6[9]) = *(void *)((char *)a2 + v6[9]);
    *((unsigned char *)a1 + v6[10]) = *((unsigned char *)a2 + v6[10]);
    uint64_t v8 = v6[11];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2189CD528();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for PickupsHeaderView.Model(uint64_t a1)
{
  uint64_t v2 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(v3 + 44);
  uint64_t v5 = sub_2189CD528();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
  *(unsigned char *)(a1 + v5[10]) = *(unsigned char *)(a2 + v5[10]);
  uint64_t v6 = v5[11];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2189CD528();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithCopy for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v5[10]) = *(unsigned char *)(a2 + v5[10]);
  uint64_t v6 = v5[11];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_2189CD528();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
  *(unsigned char *)(a1 + v5[10]) = *(unsigned char *)(a2 + v5[10]);
  uint64_t v6 = v5[11];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2189CD528();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for PickupsHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v5[10]) = *(unsigned char *)(a2 + v5[10]);
  uint64_t v6 = v5[11];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_2189CD528();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PickupsHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189B470C);
}

uint64_t sub_2189B470C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PickupsHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189B4790);
}

uint64_t sub_2189B4790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_2189B4804()
{
  sub_2189B3CF8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_2189B4894()
{
  unint64_t result = qword_267BE3510;
  if (!qword_267BE3510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3518);
    sub_2189B2D38();
    sub_21892E6E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3510);
  }
  return result;
}

uint64_t sub_2189B4910(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  return sub_2189B4A14(a1, a2, a3, a4);
}

uint64_t sub_2189B491C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_2189CEC08();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = (void *)sub_2189CEA58();
      v4[2] = a2;
      uint64_t v8 = v4;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        uint64_t v5 = a2 - 2;
        if (v5)
        {
          uint64_t v6 = v4 + 6;
          do
          {
            *v6++ = a1;
            swift_retain();
            --v5;
          }
          while (v5);
        }
        swift_retain();
      }
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
      swift_release();
    }
    sub_2189CEA48();
    return (uint64_t)v8;
  }
  return result;
}

uint64_t sub_2189B4A14(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  if (a3 < 0)
  {
    uint64_t result = sub_2189CEC08();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      uint64_t v8 = sub_2189CEA58();
      uint64_t v9 = v8;
      *(void *)(v8 + 16) = a3;
      *(double *)(v8 + 32) = a4;
      *(void *)(v8 + 40) = a1;
      *(void *)(v8 + 48) = a2;
      if (a3 != 1)
      {
        *(double *)(v8 + 56) = a4;
        *(void *)(v8 + 64) = a1;
        *(void *)(v8 + 72) = a2;
        uint64_t v10 = a3 - 2;
        if (v10)
        {
          uint64_t v11 = (double *)(v8 + 96);
          do
          {
            *(v11 - 2) = a4;
            *((void *)v11 - 1) = a1;
            *(void *)uint64_t v11 = a2;
            swift_bridgeObjectRetain();
            v11 += 3;
            --v10;
          }
          while (v10);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
    return v9;
  }
  return result;
}

uint64_t UsageDetailChart.Model.contains(date:)()
{
  uint64_t v0 = sub_2189CD528();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UsageDetailChart.Model(0);
  sub_2189CD578();
  char v4 = sub_2189CD4F8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t type metadata accessor for UsageDetailChart.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE35A0);
}

uint64_t UsageDetailChart.Model.init(startOfDay:usage:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(void *)(a4 + v8[7]) = 0x40BC200000000000;
  *(void *)(a4 + v8[8]) = 3;
  uint64_t v9 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a4, a1, v9);
  *(void *)(a4 + v8[5]) = a2;
  uint64_t v10 = a4 + v8[6];
  uint64_t v11 = sub_2189CD6B8();
  int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32);

  return v12(v10, a3, v11);
}

uint64_t UsageDetailChart.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + *(int *)(type metadata accessor for UsageDetailChart(0) + 20)) = 0;
  return sub_2189B99C8(a1, a2, type metadata accessor for UsageDetailChart.Model);
}

uint64_t type metadata accessor for UsageDetailChart(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3580);
}

int *UsageDetailChart.HourlyUsage.init(hour:totalUsage:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = sub_2189CD3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  __n128 v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v7 + 16))(v10, a1, v6, v8);
  uint64_t v11 = MEMORY[0x263F8EE78];
  unint64_t v12 = sub_21896C718(MEMORY[0x263F8EE78]);
  unint64_t v13 = sub_21896C718(v11);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a2, v10, v6);
  uint64_t result = (int *)type metadata accessor for UsageDetailChart.HourlyUsage(0);
  *(double *)(a2 + result[5]) = a3;
  *(void *)(a2 + result[6]) = v12;
  *(void *)(a2 + result[7]) = v13;
  return result;
}

uint64_t type metadata accessor for UsageDetailChart.HourlyUsage(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3590);
}

unint64_t sub_2189B4F28(uint64_t a1, void (**a2)(char *, char *, uint64_t))
{
  v95 = a2;
  uint64_t v82 = sub_2189CD5F8();
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  v80 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_2189CD618();
  uint64_t v79 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  v78 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_2189CD5B8();
  uint64_t v77 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  v76 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F38);
  MEMORY[0x270FA5388](v6 - 8);
  v72 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1EA8);
  MEMORY[0x270FA5388](v8 - 8);
  v71 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_2189CD3E8();
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  v92 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v88 = (uint64_t)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2189CD698();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_2189CD528();
  uint64_t v17 = *(void *)(v91 - 8);
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v91);
  v102 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v98 = (char *)&v70 - v21;
  MEMORY[0x270FA5388](v22);
  v73 = (char *)&v70 - v23;
  MEMORY[0x270FA5388](v24);
  v70 = (char *)&v70 - v25;
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v70 - v27;
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v70 - v30;
  uint64_t v94 = a1;
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BE8);
  unint64_t v32 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v97 = *(void *)(v17 + 72);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_2189CF710;
  unint64_t v96 = v32;
  unint64_t v93 = v33;
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  unsigned int v85 = *MEMORY[0x263F07890];
  v84 = *(void (**)(char *))(v14 + 104);
  v84(v16);
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  uint64_t v86 = sub_2189CD6A8();
  uint64_t v87 = v17;
  uint64_t v34 = *(void (**)(char *, uint64_t))(v17 + 8);
  uint64_t v35 = v91;
  v34(v28, v91);
  char v36 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v83 = v14 + 8;
  v36(v16, v13);
  ((void (*)(char *, void, uint64_t))v84)(v16, v85, v13);
  sub_2189CD348();
  uint64_t v37 = v86 | sub_2189CD6A8();
  v34(v28, v35);
  v36(v16, v13);
  uint64_t v100 = v18 + 8;
  v101 = v34;
  v99 = v28;
  if (v37)
  {
    uint64_t v38 = v94;
    uint64_t v39 = v87;
    uint64_t v40 = v35;
  }
  else
  {
    _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
    uint64_t v41 = sub_2189CD6B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v71, 1, 1, v41);
    uint64_t v42 = sub_2189CD6C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v72, 1, 1, v42);
    sub_2189CD3D8();
    uint64_t v43 = v77;
    uint64_t v44 = v76;
    (*(void (**)(char *, void, uint64_t))(v77 + 104))(v76, *MEMORY[0x263F07780], v89);
    uint64_t v45 = v79;
    uint64_t v46 = v78;
    (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, *MEMORY[0x263F07800], v90);
    uint64_t v47 = v81;
    uint64_t v48 = v80;
    uint64_t v49 = v82;
    (*(void (**)(char *, void, uint64_t))(v81 + 104))(v80, *MEMORY[0x263F077E0], v82);
    uint64_t v50 = v88;
    sub_2189CD688();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v90);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v89);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v92, v75);
    uint64_t v51 = v91;
    v101(v99, v91);
    uint64_t v39 = v87;
    int v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v50, 1, v51);
    uint64_t v38 = v94;
    uint64_t v40 = v51;
    if (v52 == 1)
    {
      sub_218900AE4(v88, &qword_267BE1AE0);
    }
    else
    {
      char v53 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 32);
      char v54 = v70;
      v53(v70, v88, v51);
      (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v73, v54, v51);
      unint64_t v56 = *(void *)(v93 + 16);
      unint64_t v55 = *(void *)(v93 + 24);
      if (v56 >= v55 >> 1) {
        unint64_t v93 = sub_218943A4C(v55 > 1, v56 + 1, 1, v93);
      }
      unint64_t v57 = v93;
      *(void *)(v93 + 16) = v56 + 1;
      v53((char *)(v57 + v96 + v56 * v97), (uint64_t)v73, v51);
      v101(v31, v51);
      v58 = v54;
      uint64_t v40 = v51;
      v53(v31, (uint64_t)v58, v51);
    }
  }
  unint64_t v59 = v93;
  v95 = (void (**)(char *, char *, uint64_t))(v39 + 16);
  v60 = (void (**)(unint64_t, char *, uint64_t))(v39 + 32);
  v61 = v101;
  while (1)
  {
    v62 = v99;
    sub_2189CD4E8();
    v63 = v98;
    sub_2189CD348();
    sub_2189B9D70((unint64_t *)&qword_267BE1E40, MEMORY[0x263F07490]);
    char v64 = sub_2189CE8C8();
    v61(v63, v40);
    v61(v62, v40);
    if (v64) {
      break;
    }
    uint64_t v65 = v38;
    sub_2189CD508();
    (*v95)(v102, v31, v40);
    uint64_t v66 = v59;
    unint64_t v68 = *(void *)(v59 + 16);
    unint64_t v67 = *(void *)(v59 + 24);
    if (v68 >= v67 >> 1) {
      uint64_t v66 = sub_218943A4C(v67 > 1, v68 + 1, 1, v59);
    }
    *(void *)(v66 + 16) = v68 + 1;
    unint64_t v59 = v66;
    (*v60)(v66 + v96 + v68 * v97, v102, v40);
    uint64_t v38 = v65;
  }
  v101(v31, v40);
  return v59;
}

uint64_t UsageDetailChart.HourlyUsage.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2189B5B30(MEMORY[0x263F062D0], a1);
}

uint64_t sub_2189B5B00@<X0>(uint64_t a1@<X8>)
{
  return sub_2189B6ED4(MEMORY[0x263F062D0], a1);
}

uint64_t UsageDetailChart.Model.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2189B5B30(MEMORY[0x263F07490], a1);
}

uint64_t sub_2189B5B30@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v2, v4);
}

uint64_t sub_2189B5BA0()
{
  uint64_t v0 = sub_2189CD528();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14 - v5;
  uint64_t v7 = sub_2189CD3A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189CD318();
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  type metadata accessor for UsageDetailChart.Model(0);
  sub_2189CD578();
  char v11 = sub_2189CD4F8();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v3, v0);
  v12(v6, v0);
  return v11 & 1;
}

void sub_2189B5D88()
{
  uint64_t v17 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  uint64_t v1 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - v5;
  uint64_t v7 = *(void *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 20));
  uint64_t v19 = v0;
  swift_bridgeObjectRetain();
  sub_218902118((uint64_t (*)(char *))sub_2189BBBD4, (uint64_t)v18, v7);
  uint64_t v9 = v8;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t v16 = *(void *)(v8 + 16);
  if (v16)
  {
    unint64_t v11 = 0;
    while (v11 < *(void *)(v9 + 16))
    {
      unint64_t v12 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
      uint64_t v13 = *(void *)(v1 + 72);
      sub_2189B9C60(v9 + v12 + v13 * v11, (uint64_t)v6, type metadata accessor for UsageDetailChart.HourlyUsage);
      if (*(void *)(*(void *)&v6[*(int *)(v17 + 24)] + 16))
      {
        sub_2189B99C8((uint64_t)v6, (uint64_t)v3, type metadata accessor for UsageDetailChart.HourlyUsage);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_21890CEC0(0, *(void *)(v10 + 16) + 1, 1);
        }
        uint64_t v10 = v20;
        unint64_t v15 = *(void *)(v20 + 16);
        unint64_t v14 = *(void *)(v20 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_21890CEC0(v14 > 1, v15 + 1, 1);
          uint64_t v10 = v20;
        }
        *(void *)(v10 + 16) = v15 + 1;
        sub_2189B99C8((uint64_t)v3, v10 + v12 + v15 * v13, type metadata accessor for UsageDetailChart.HourlyUsage);
      }
      else
      {
        sub_2189B9CC8((uint64_t)v6, type metadata accessor for UsageDetailChart.HourlyUsage);
      }
      if (v16 == ++v11) {
        goto LABEL_12;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_12:
    swift_bridgeObjectRelease();
    swift_release();
  }
}

uint64_t sub_2189B6010()
{
  uint64_t v60 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  uint64_t v4 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v59 = (uint64_t)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (void *)sub_21896C718(MEMORY[0x263F8EE78]);
  sub_2189B5D88();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 20));
  uint64_t v65 = v0;
  swift_bridgeObjectRetain();
  uint64_t v10 = v9;
  unint64_t v11 = 0;
  sub_218902118((uint64_t (*)(char *))sub_2189BBBD4, (uint64_t)v64, v10);
  uint64_t v53 = 0;
  uint64_t v58 = *(void *)(v12 + 16);
  if (!v58)
  {
    swift_bridgeObjectRelease();
    unint64_t v13 = 0;
    goto LABEL_43;
  }
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  uint64_t v57 = v12 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v15 = 6;
  if ((_BYTE)v8) {
    uint64_t v15 = 7;
  }
  uint64_t v55 = v4;
  uint64_t v56 = v15;
  uint64_t v54 = v12;
  while (2)
  {
    if (v14 >= *(void *)(v12 + 16))
    {
LABEL_63:
      __break(1u);
LABEL_64:
      sub_21890CB94(v3 > 1, v14, 1);
      uint64_t v39 = v66;
LABEL_49:
      v39[2] = v14;
      uint64_t v40 = &v39[2 * isUniquelyReferenced_nonNull_native];
      v40[4] = v1;
      v40[5] = v4;
      if (v8 != 1)
      {
        uint64_t v42 = *(void *)(v11 + 56);
        uint64_t v41 = *(void *)(v11 + 64);
        uint64_t v66 = v39;
        unint64_t v43 = v39[2];
        unint64_t v44 = v39[3];
        swift_bridgeObjectRetain();
        if (v43 >= v44 >> 1)
        {
          sub_21890CB94(v44 > 1, v43 + 1, 1);
          uint64_t v39 = v66;
        }
        v39[2] = v43 + 1;
        uint64_t v45 = &v39[2 * v43];
        v45[4] = v42;
        v45[5] = v41;
        if (v8 != 2)
        {
          uint64_t v47 = *(void *)(v11 + 80);
          uint64_t v46 = *(void *)(v11 + 88);
          uint64_t v66 = v39;
          unint64_t v48 = v39[2];
          unint64_t v49 = v39[3];
          swift_bridgeObjectRetain();
          if (v48 >= v49 >> 1)
          {
            sub_21890CB94(v49 > 1, v48 + 1, 1);
            uint64_t v39 = v66;
          }
          v39[2] = v48 + 1;
          uint64_t v50 = &v39[2 * v48];
          v50[4] = v47;
          v50[5] = v46;
        }
      }
      swift_release();
      goto LABEL_58;
    }
    uint64_t v16 = v59;
    sub_2189B9C60(v57 + *(void *)(v4 + 72) * v14++, v59, type metadata accessor for UsageDetailChart.HourlyUsage);
    unint64_t v61 = v14;
    unint64_t v3 = *(void *)(v16 + *(int *)(v60 + 4 * v56));
    swift_bridgeObjectRetain();
    sub_2189B9CC8(v16, type metadata accessor for UsageDetailChart.HourlyUsage);
    int64_t v1 = 0;
    uint64_t v17 = *(void *)(v3 + 64);
    unint64_t v62 = v3 + 64;
    uint64_t v18 = 1 << *(unsigned char *)(v3 + 32);
    if (v18 < 64) {
      uint64_t v19 = ~(-1 << v18);
    }
    else {
      uint64_t v19 = -1;
    }
    unint64_t v11 = v19 & v17;
    int64_t v63 = (unint64_t)(v18 + 63) >> 6;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v1 << 6);
        goto LABEL_29;
      }
      int64_t v23 = v1 + 1;
      if (__OFADD__(v1, 1)) {
        goto LABEL_61;
      }
      if (v23 >= v63) {
        break;
      }
      unint64_t v24 = *(void *)(v62 + 8 * v23);
      ++v1;
      if (!v24)
      {
        int64_t v1 = v23 + 1;
        if (v23 + 1 >= v63) {
          break;
        }
        unint64_t v24 = *(void *)(v62 + 8 * v1);
        if (!v24)
        {
          int64_t v1 = v23 + 2;
          if (v23 + 2 >= v63) {
            break;
          }
          unint64_t v24 = *(void *)(v62 + 8 * v1);
          if (!v24)
          {
            int64_t v25 = v23 + 3;
            if (v25 >= v63) {
              break;
            }
            unint64_t v24 = *(void *)(v62 + 8 * v25);
            if (!v24)
            {
              while (1)
              {
                int64_t v1 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_62;
                }
                if (v1 >= v63) {
                  goto LABEL_5;
                }
                unint64_t v24 = *(void *)(v62 + 8 * v1);
                ++v25;
                if (v24) {
                  goto LABEL_28;
                }
              }
            }
            int64_t v1 = v25;
          }
        }
      }
LABEL_28:
      unint64_t v11 = (v24 - 1) & v24;
      unint64_t v22 = __clz(__rbit64(v24)) + (v1 << 6);
LABEL_29:
      uint64_t v26 = (unint64_t *)(*(void *)(v3 + 48) + 16 * v22);
      unint64_t v14 = *v26;
      uint64_t v8 = v26[1];
      double v27 = *(double *)(*(void *)(v3 + 56) + 8 * v22);
      swift_bridgeObjectRetain();
      sub_21891330C(v13);
      unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v66 = v6;
      unint64_t v13 = sub_21892118C(v14, v8);
      uint64_t v29 = v6[2];
      BOOL v30 = (v28 & 1) == 0;
      uint64_t v31 = v29 + v30;
      if (__OFADD__(v29, v30))
      {
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
      uint64_t v4 = v28;
      if (v6[3] >= v31)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_218924C1C();
        }
      }
      else
      {
        sub_218921A28(v31, isUniquelyReferenced_nonNull_native);
        unint64_t v32 = sub_21892118C(v14, v8);
        if ((v4 & 1) != (v33 & 1))
        {
          sub_2189CECB8();
          __break(1u);
          goto LABEL_66;
        }
        unint64_t v13 = v32;
      }
      uint64_t v6 = v66;
      swift_bridgeObjectRelease();
      if ((v4 & 1) == 0)
      {
        v6[(v13 >> 6) + 8] |= 1 << v13;
        uint64_t v34 = (unint64_t *)(v6[6] + 16 * v13);
        *uint64_t v34 = v14;
        v34[1] = v8;
        *(void *)(v6[7] + 8 * v13) = 0;
        uint64_t v35 = v6[2];
        uint64_t v36 = v35 + 1;
        uint64_t v4 = __OFADD__(v35, 1);
        swift_bridgeObjectRetain();
        if (v4) {
          goto LABEL_60;
        }
        v6[2] = v36;
      }
      swift_bridgeObjectRetain();
      uint64_t v20 = v6[7];
      swift_bridgeObjectRelease();
      *(double *)(v20 + 8 * v13) = v27 + *(double *)(v20 + 8 * v13);
      swift_bridgeObjectRelease();
      unint64_t v13 = (unint64_t)sub_2188FFBBC;
    }
LABEL_5:
    swift_release();
    unint64_t v14 = v61;
    uint64_t v12 = v54;
    uint64_t v4 = v55;
    if (v61 != v58) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
LABEL_43:
  swift_bridgeObjectRetain_n();
  uint64_t v37 = sub_21890B888((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t v66 = v37;
  uint64_t v38 = v53;
  sub_21890B81C(&v66);
  if (v38)
  {
LABEL_66:
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v11 = (unint64_t)v66;
    if (v66[2] >= 3uLL) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = v66[2];
    }
    if (v8)
    {
      uint64_t v66 = (void *)MEMORY[0x263F8EE78];
      sub_21890CB94(0, v8, 0);
      uint64_t v39 = v66;
      int64_t v1 = *(void *)(v11 + 32);
      uint64_t v4 = *(void *)(v11 + 40);
      unint64_t isUniquelyReferenced_nonNull_native = v66[2];
      unint64_t v3 = v66[3];
      unint64_t v14 = isUniquelyReferenced_nonNull_native + 1;
      swift_bridgeObjectRetain();
      if (isUniquelyReferenced_nonNull_native < v3 >> 1) {
        goto LABEL_49;
      }
      goto LABEL_64;
    }
    swift_release();
    uint64_t v39 = (void *)MEMORY[0x263F8EE78];
LABEL_58:
    swift_bridgeObjectRelease();
    sub_21891330C(v13);
    return (uint64_t)v39;
  }
  return result;
}

uint64_t sub_2189B663C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_2189CD3A8();
  uint64_t v78 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v82 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35D0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v80 = (uint64_t)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  uint64_t v10 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v12 = (uint64_t)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v81 = (uint64_t *)((char *)&v77 - v14);
  MEMORY[0x270FA5388](v15);
  uint64_t v79 = (uint64_t)&v77 - v16;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v77 - v18;
  uint64_t v20 = *(char **)(v2 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 32));
  sub_2189B5D88();
  char v22 = v21;
  uint64_t v83 = v19;
  if (!a2 || (uint64_t v23 = *(void *)(a2 + 16)) == 0)
  {
    double v27 = (void *)sub_2189B6010();
    sub_2189B9C60(a1, (uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
    if (v22) {
      uint64_t v32 = 7;
    }
    else {
      uint64_t v32 = 6;
    }
    uint64_t v28 = v20;
    int64_t v25 = (int *)v84;
    uint64_t v33 = (uint64_t)(v28 + 1);
    if (!__OFADD__(v28, 1)) {
      goto LABEL_11;
    }
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v77 = v6;
  uint64_t v24 = a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  int64_t v25 = (int *)v84;
  uint64_t v26 = swift_bridgeObjectRetain();
  double v27 = sub_21890B980(v26);
  swift_bridgeObjectRelease();
  uint64_t v28 = (char *)v27[2];
  uint64_t v29 = *(void *)(v10 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_2189B9C60(v24, v12, type metadata accessor for UsageDetailChart.HourlyUsage);
    if (sub_2189CD338()) {
      break;
    }
    sub_2189B9CC8(v12, type metadata accessor for UsageDetailChart.HourlyUsage);
    v24 += v29;
    if (!--v23)
    {
      swift_bridgeObjectRelease();
      uint64_t v30 = 1;
      uint64_t v31 = v80;
      goto LABEL_38;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v31 = v80;
  sub_2189B99C8(v12, v80, type metadata accessor for UsageDetailChart.HourlyUsage);
  uint64_t v30 = 0;
LABEL_38:
  (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v10 + 56))(v31, v30, 1, v25);
  uint64_t v12 = (uint64_t)v81;
  sub_2189B9C60(a1, (uint64_t)v81, type metadata accessor for UsageDetailChart.HourlyUsage);
  int v56 = (*(uint64_t (**)(uint64_t, uint64_t, int *))(v10 + 48))(v31, 1, v25);
  uint64_t v19 = v83;
  if (v56 == 1)
  {
    uint64_t v57 = v78;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v82, v12, v77);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1DD8);
    uint64_t result = swift_initStackObject();
    *(_OWORD *)(result + 16) = xmmword_2189CF710;
    if (!v27[2])
    {
LABEL_68:
      __break(1u);
      return result;
    }
    uint64_t v59 = (void *)result;
    uint64_t v61 = v27[4];
    uint64_t v60 = v27[5];
    swift_bridgeObjectRetain();
    swift_release();
    v59[4] = v61;
    v59[5] = v60;
    v59[6] = 0;
    unint64_t v62 = sub_21896C718((uint64_t)v59);
    unint64_t v63 = sub_21896C718(MEMORY[0x263F8EE78]);
    sub_2189B9CC8(v12, type metadata accessor for UsageDetailChart.HourlyUsage);
    uint64_t v64 = v79;
    (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v79, v82, v77);
    *(void *)(v64 + v25[5]) = 0;
    *(void *)(v64 + v25[6]) = v62;
    uint64_t v65 = v64;
    *(void *)(v64 + v25[7]) = v63;
    sub_218900AE4(v31, &qword_267BE35D0);
    uint64_t v19 = v83;
  }
  else
  {
    sub_2189B9CC8(v12, type metadata accessor for UsageDetailChart.HourlyUsage);
    swift_release();
    uint64_t v65 = v79;
    sub_2189B99C8(v31, v79, type metadata accessor for UsageDetailChart.HourlyUsage);
  }
  sub_2189B99C8(v65, (uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
  uint64_t v32 = 6;
  uint64_t v33 = (uint64_t)(v28 + 1);
  if (__OFADD__(v28, 1)) {
    goto LABEL_44;
  }
LABEL_11:
  uint64_t v82 = v28;
  uint64_t v12 = sub_2189B4A14(0x65646E69616D6572, 0xE900000000000072, v33, 0.0);
  uint64_t v34 = *(void *)&v19[v25[v32]];
  uint64_t v35 = v27[2];
  if (!v35)
  {
    double v3 = *(double *)(a1 + v25[5]);
    if (v3 < 0.0)
    {
      swift_bridgeObjectRetain();
      goto LABEL_50;
    }
LABEL_45:
    swift_bridgeObjectRetain();
    if (v3 <= 0.0) {
      goto LABEL_50;
    }
    swift_bridgeObjectRelease();
LABEL_47:
    uint64_t v66 = *(void *)(v12 + 16);
    double v67 = 0.0;
    unint64_t v49 = (unint64_t)v82;
    if (v66)
    {
      if (v66 == 1)
      {
        uint64_t v68 = 0;
      }
      else
      {
        uint64_t v68 = v66 & 0x7FFFFFFFFFFFFFFELL;
        v69 = (double *)(v12 + 56);
        uint64_t v70 = v66 & 0x7FFFFFFFFFFFFFFELL;
        do
        {
          double v71 = *(v69 - 3);
          double v72 = *v69;
          v69 += 6;
          double v67 = v67 + v71 + v72;
          v70 -= 2;
        }
        while (v70);
        if (v66 == v68) {
          goto LABEL_56;
        }
      }
      uint64_t v73 = v66 - v68;
      uint64_t v74 = (double *)(v12 + 24 * v68 + 32);
      do
      {
        double v75 = *v74;
        v74 += 3;
        double v67 = v67 + v75;
        --v73;
      }
      while (v73);
    }
LABEL_56:
    double v76 = round((1.0 - v67) * 100.0) / 100.0;
    if (v76 > 0.0) {
      double v46 = v76;
    }
    else {
      double v46 = 0.0;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result)
    {
      if ((v49 & 0x8000000000000000) == 0) {
        goto LABEL_61;
      }
    }
    else
    {
LABEL_65:
      uint64_t result = (uint64_t)sub_2189B971C((void *)v12);
      uint64_t v12 = result;
      if ((v49 & 0x8000000000000000) == 0)
      {
LABEL_61:
        if (v49 < *(void *)(v12 + 16))
        {
          *(double *)(v12 + 24 * v49 + 32) = v46;
          swift_bridgeObjectRelease();
          sub_2189B9CC8((uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
          return v12;
        }
        goto LABEL_67;
      }
    }
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v36 = 0;
  uint64_t v37 = v27 + 5;
  uint64_t v38 = v35 - 1;
  double v39 = 0.0;
  do
  {
    if (*(void *)(v34 + 16))
    {
      uint64_t v41 = *(v37 - 1);
      uint64_t v40 = *v37;
      swift_bridgeObjectRetain();
      unint64_t v42 = sub_21892118C(v41, v40);
      if (v43)
      {
        double v44 = *(double *)(*(void *)(v34 + 56) + 8 * v42);
        swift_bridgeObjectRelease();
        double v39 = v39 + v44;
        if (v38 == v36) {
          goto LABEL_21;
        }
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
    }
    double v39 = v39 + 0.0;
    if (v38 == v36) {
      goto LABEL_21;
    }
LABEL_19:
    ++v36;
    v37 += 2;
  }
  while (v36 < v27[2]);
  __break(1u);
LABEL_21:
  swift_bridgeObjectRelease();
  uint64_t v19 = v83;
  uint64_t v45 = *(int *)(v84 + 20);
  if (v39 > *(double *)(a1 + v45)) {
    double v46 = v39;
  }
  else {
    double v46 = *(double *)(a1 + v45);
  }
  if (v46 > 0.0)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = 0;
    unint64_t v47 = 0;
    unint64_t v48 = v27 + 5;
    while (1)
    {
      uint64_t v50 = *(v48 - 1);
      unint64_t v49 = *v48;
      uint64_t v51 = *(void *)(v34 + 16);
      swift_bridgeObjectRetain();
      if (v51)
      {
        swift_bridgeObjectRetain();
        unint64_t v52 = sub_21892118C(v50, v49);
        if (v53)
        {
          double v54 = *(double *)(*(void *)(v34 + 56) + 8 * v52);
          swift_bridgeObjectRelease();
          if (swift_isUniquelyReferenced_nonNull_native()) {
            goto LABEL_32;
          }
LABEL_29:
          uint64_t v12 = (uint64_t)sub_2189B971C((void *)v12);
          goto LABEL_32;
        }
        swift_bridgeObjectRelease();
      }
      double v54 = 0.0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        goto LABEL_29;
      }
LABEL_32:
      if (v47 >= *(void *)(v12 + 16))
      {
        __break(1u);
        goto LABEL_65;
      }
      uint64_t v55 = &v19[v12];
      *((double *)v55 + 4) = round(v54 * 100.0 / v46) / 100.0;
      ++v47;
      v48 += 2;
      *((void *)v55 + 5) = v50;
      *((void *)v55 + 6) = v49;
      swift_bridgeObjectRelease();
      v19 += 24;
      if (v35 == v47)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v19 = v83;
        goto LABEL_47;
      }
    }
  }
LABEL_50:
  sub_2189B9CC8((uint64_t)v19, type metadata accessor for UsageDetailChart.HourlyUsage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_2189B6EBC@<X0>(uint64_t a1@<X8>)
{
  return sub_2189B6ED4(MEMORY[0x263F07490], a1);
}

uint64_t sub_2189B6ED4@<X0>(uint64_t (*a1)(void)@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v2, v4);
}

uint64_t UsageDetailChart.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v123 = a1;
  uint64_t v2 = sub_2189CDF28();
  uint64_t v121 = *(void *)(v2 - 8);
  uint64_t v122 = v2;
  MEMORY[0x270FA5388](v2);
  v120 = (char *)&v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_2189CD528();
  uint64_t v93 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  v92 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1B00);
  MEMORY[0x270FA5388](v5 - 8);
  v117 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_2189CD3A8();
  uint64_t v119 = *(void *)(v127 - 8);
  MEMORY[0x270FA5388](v127);
  v95 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v118 = (char *)&v92 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UsageDetailChart(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v107 = (uint64_t)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v92 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3520);
  uint64_t v99 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  char v21 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3528);
  v103 = *(char ***)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  v102 = (char *)&v92 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1CE0);
  uint64_t v105 = *(void *)(v125 - 8);
  MEMORY[0x270FA5388](v125);
  uint64_t v100 = (char *)&v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3530);
  uint64_t v109 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  v126 = (char *)&v92 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3538);
  uint64_t v111 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  v108 = (char *)&v92 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3540);
  uint64_t v115 = *(void *)(v116 - 8);
  MEMORY[0x270FA5388](v116);
  v114 = (char *)&v92 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3548);
  MEMORY[0x270FA5388](v106);
  v112 = (char *)&v92 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for UsageDetailChart.Model(0);
  uint64_t v101 = *(int *)(v28 + 20);
  uint64_t v29 = *(void *)(v1 + v101);
  uint64_t v129 = v1;
  swift_bridgeObjectRetain();
  sub_218902118((uint64_t (*)(char *))sub_2189B9860, (uint64_t)v128, v29);
  uint64_t v130 = v30;
  sub_2189B9C60(v1, (uint64_t)v18, type metadata accessor for UsageDetailChart);
  unint64_t v31 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v32 = swift_allocObject();
  sub_2189B99C8((uint64_t)v18, v32 + v31, type metadata accessor for UsageDetailChart);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3550);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3558);
  sub_218901074(&qword_267BE3560, &qword_267BE3550);
  sub_2189B9AB0();
  sub_2189B9D70(&qword_267BE3570, (void (*)(uint64_t))type metadata accessor for UsageDetailChart.HourlyUsage);
  v98 = v21;
  sub_2189CDBA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1C08);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_2189CF720;
  *(void *)(v33 + 32) = 0;
  UsageDetailChart.Model.maxUsage.getter();
  double v34 = 3600.0;
  if (v35 > 3600.0) {
    double v34 = *(double *)(v1 + *(int *)(v28 + 28));
  }
  uint64_t v124 = v28;
  UsageDetailChart.Model.maxUsage.getter();
  double v37 = v34 * ceil(v36 / v34);
  if (v37 <= v34) {
    double v37 = v34;
  }
  *(double *)(v33 + 40) = v37;
  uint64_t v130 = v33;
  uint64_t v38 = sub_2189CDCA8();
  unint64_t v96 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56);
  uint64_t v97 = v1;
  v96(v12, 1, 1, v38);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1C10);
  uint64_t v40 = sub_218901074(&qword_267BE3578, &qword_267BE3520);
  uint64_t v41 = sub_218909878(&qword_267BE1C18, &qword_267BE1C10);
  unint64_t v42 = v102;
  char v43 = v98;
  sub_2189CE418();
  sub_218900AE4((uint64_t)v12, &qword_267BE1AF8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v43, v19);
  uint64_t v134 = UsageDetailChart.Model.xAxisScale.getter();
  v96(v12, 1, 1, v38);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BF0);
  uint64_t v130 = v19;
  uint64_t v131 = v39;
  uint64_t v132 = v40;
  uint64_t v133 = v41;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v46 = sub_218909878(&qword_267BE1BF8, &qword_267BE1BF0);
  unint64_t v47 = v100;
  uint64_t v48 = v104;
  sub_2189CE408();
  sub_218900AE4((uint64_t)v12, &qword_267BE1AF8);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v103[1])(v42, v48);
  uint64_t v49 = v97;
  uint64_t v50 = UsageDetailChart.Model.yStride.getter();
  uint64_t v51 = v49;
  UsageDetailChart.Model.maxUsage.getter();
  uint64_t v52 = UsageDetailChart.Model.maxUsage.getter();
  v103 = &v92;
  unint64_t v53 = MEMORY[0x270FA5388](v52).n128_u64[0];
  *(&v92 - 6) = (char *)v50;
  *(&v92 - 5) = 0;
  *((unsigned char *)&v92 - 32) = 1;
  *(&v92 - 3) = (char *)v53;
  *((unsigned char *)&v92 - 16) = 0;
  *(&v92 - 1) = v47;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1C30);
  uint64_t v130 = v48;
  uint64_t v131 = v44;
  uint64_t v132 = OpaqueTypeConformance2;
  uint64_t v133 = v46;
  uint64_t v55 = swift_getOpaqueTypeConformance2();
  uint64_t v56 = sub_218901074(&qword_267BE1C38, &qword_267BE1C30);
  uint64_t v57 = v125;
  uint64_t v104 = v54;
  sub_2189CE3E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v47, v57);
  uint64_t v58 = *(void *)(v49 + v101);
  uint64_t v59 = (uint64_t)v118;
  if (*(void *)(v58 + 16))
  {
    uint64_t v60 = *(void *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8);
    uint64_t v61 = v58 + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80));
    uint64_t v62 = v119;
    unint64_t v63 = v95;
    uint64_t v64 = v127;
    (*(void (**)(char *, uint64_t, uint64_t))(v119 + 16))(v95, v61, v127);
    uint64_t v65 = (uint64_t)v117;
    sub_2189CD318();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v64);
    uint64_t v66 = 0;
  }
  else
  {
    uint64_t v64 = v127;
    uint64_t v62 = v119;
    uint64_t v65 = (uint64_t)v117;
    uint64_t v66 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 56))(v65, v66, 1, v64);
  uint64_t v67 = v107;
  sub_2189B9C60(v51, v107, type metadata accessor for UsageDetailChart);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v65, 1, v64) == 1)
  {
    uint64_t v68 = v124;
    uint64_t v69 = (uint64_t)v92;
    sub_2189CD518();
    Calendar.fullDay(for:)(v69, v59);
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v69, v94);
    uint64_t v57 = v125;
    sub_2189B9CC8(v67, type metadata accessor for UsageDetailChart);
    uint64_t v70 = v68;
    sub_218900AE4(v65, &qword_267BE1B00);
  }
  else
  {
    sub_2189B9CC8(v67, type metadata accessor for UsageDetailChart);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32))(v59, v65, v64);
    uint64_t v70 = v124;
  }
  double v71 = v126;
  unint64_t v72 = sub_2189B4F28(v59, (void (**)(char *, char *, uint64_t))(v51 + *(int *)(v70 + 24)));
  MEMORY[0x270FA5388](v72);
  *(&v92 - 2) = v73;
  uint64_t v74 = v59;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1C20);
  uint64_t v130 = v57;
  uint64_t v131 = v104;
  uint64_t v132 = v55;
  uint64_t v133 = v56;
  uint64_t v76 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = sub_218901074(&qword_267BE1C28, &qword_267BE1C20);
  uint64_t v78 = v108;
  uint64_t v79 = v110;
  sub_2189CE3D8();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v74, v127);
  (*(void (**)(char *, uint64_t))(v109 + 8))(v71, v79);
  uint64_t v130 = v79;
  uint64_t v131 = v75;
  uint64_t v132 = v76;
  uint64_t v133 = v77;
  swift_getOpaqueTypeConformance2();
  uint64_t v80 = v114;
  uint64_t v81 = v113;
  sub_2189CE3F8();
  (*(void (**)(char *, uint64_t))(v111 + 8))(v78, v81);
  uint64_t v82 = v120;
  sub_2189CDF18();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v84 = (uint64_t)v112;
  unsigned int v85 = (uint64_t *)&v112[*(int *)(v106 + 36)];
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2608);
  uint64_t v88 = v121;
  uint64_t v87 = v122;
  (*(void (**)(char *, char *, uint64_t))(v121 + 16))((char *)v85 + *(int *)(v86 + 28), v82, v122);
  *unsigned int v85 = KeyPath;
  uint64_t v89 = v115;
  uint64_t v90 = v116;
  (*(void (**)(uint64_t, char *, uint64_t))(v115 + 16))(v84, v80, v116);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v82, v87);
  (*(void (**)(char *, uint64_t))(v89 + 8))(v80, v90);
  return sub_2189B9BF8(v84, v123);
}

uint64_t sub_2189B7FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v5 = type metadata accessor for UsageDetailChart(0);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = sub_2189B663C(a1, *(void *)(a2 + *(int *)(v6 + 28)));
  uint64_t v13 = sub_21899BD30(v12);
  swift_bridgeObjectRelease();
  uint64_t v27 = v13;
  swift_getKeyPath();
  sub_2189B9C60(a1, (uint64_t)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for UsageDetailChart.HourlyUsage);
  sub_2189B9C60(a2, (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for UsageDetailChart);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v15 = (v11 + *(unsigned __int8 *)(v7 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = swift_allocObject();
  sub_2189B99C8((uint64_t)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v14, type metadata accessor for UsageDetailChart.HourlyUsage);
  sub_2189B99C8((uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for UsageDetailChart);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_2189BBA58;
  *(void *)(v17 + 24) = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2618);
  sub_218901074(&qword_267BE35C8, &qword_267BE35C0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE25E0);
  uint64_t v23 = sub_2189CDBC8();
  uint64_t v24 = MEMORY[0x263F1B440];
  uint64_t v25 = MEMORY[0x263EFCD08];
  unint64_t v26 = MEMORY[0x263F1B420];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_2189096A8();
  uint64_t v23 = v18;
  uint64_t v24 = MEMORY[0x263F8D310];
  uint64_t v25 = OpaqueTypeConformance2;
  unint64_t v26 = v20;
  swift_getOpaqueTypeConformance2();
  return sub_2189CE768();
}

uint64_t sub_2189B8358@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v57 = a5;
  uint64_t v58 = a2;
  uint64_t v59 = a3;
  uint64_t v60 = a6;
  unint64_t v56 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1EA0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v48 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1EA8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2189CD698();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_2189CD528();
  uint64_t v44 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1EB0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v61 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_2189CDBC8();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v50 = v22;
  uint64_t v51 = v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v46 = (char *)&v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE25E0);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v54 = v25;
  uint64_t v55 = v26;
  MEMORY[0x270FA5388](v25);
  unint64_t v47 = (char *)&v43 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2618);
  uint64_t v52 = *(void *)(v28 - 8);
  uint64_t v53 = v28;
  MEMORY[0x270FA5388](v28);
  uint64_t v49 = (char *)&v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189CE118();
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F07890], v14);
  uint64_t v30 = sub_2189CD6B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v13, 1, 1, v30);
  sub_2189CDAB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_218900AE4((uint64_t)v13, &qword_267BE1EA8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
  sub_2189CE118();
  double v62 = *(double *)(a4 + *(int *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) + 20)) * a7;
  sub_2189CDAC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(self, sel_currentDevice);
  id v32 = objc_msgSend(v31, sel_model);

  sub_2189CE988();
  sub_2189CEA08();
  swift_bridgeObjectRelease();
  uint64_t v33 = v46;
  sub_2189CDBB8();
  uint64_t v34 = type metadata accessor for UsageDetailChart(0);
  double v62 = COERCE_DOUBLE(UsageDetailChart.Model.orderedStackedBarColors(index:selectedItem:)(v56, *(void *)(v57 + *(int *)(v34 + 20))));
  uint64_t v35 = MEMORY[0x263F1B440];
  uint64_t v36 = MEMORY[0x263EFCD08];
  uint64_t v37 = MEMORY[0x263F1B420];
  uint64_t v38 = v47;
  double v39 = *(double *)&v50;
  sub_2189CDA08();
  swift_release();
  (*(void (**)(char *, double))(v51 + 8))(v33, COERCE_DOUBLE(*(void *)&v39));
  uint64_t v66 = v58;
  uint64_t v67 = v59;
  double v62 = v39;
  uint64_t v63 = v35;
  uint64_t v64 = v36;
  uint64_t v65 = v37;
  swift_getOpaqueTypeConformance2();
  sub_2189096A8();
  uint64_t v40 = v49;
  uint64_t v41 = v54;
  sub_2189CDA18();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v38, v41);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v52 + 32))(v60, v40, v53);
}

void *UsageDetailChart.Model.orderedStackedBarColors(index:selectedItem:)(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 32));
  if (a2)
  {
    if (*(void *)(a2 + 16))
    {
      type metadata accessor for UsageDetailChart.HourlyUsage(0);
      uint64_t v6 = swift_bridgeObjectRetain();
      uint64_t v7 = sub_21890B980(v6);
      swift_bridgeObjectRelease();
      uint64_t v5 = v7[2];
      swift_release();
    }
  }
  uint64_t result = (void *)(v5 + 1);
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_2189BBBF0((uint64_t)result, 1);
  if ((a1 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (result[2] > a1)
  {
    uint64_t v9 = result[a1 + 4];
    swift_retain();
    swift_bridgeObjectRelease();
    return (void *)v9;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t UsageDetailChart.Model.yAxisScale.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1C08);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2189CF720;
  *(void *)(v1 + 32) = 0;
  UsageDetailChart.Model.maxUsage.getter();
  double v2 = 3600.0;
  if (v3 > 3600.0) {
    double v2 = *(double *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 28));
  }
  UsageDetailChart.Model.maxUsage.getter();
  double v5 = v2 * ceil(v4 / v2);
  if (v5 <= v2) {
    double v5 = v2;
  }
  *(double *)(v1 + 40) = v5;
  return v1;
}

uint64_t UsageDetailChart.Model.xAxisScale.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2189CD528();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v23 = v2;
  uint64_t v24 = v3;
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UsageDetailChart.Model(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1B00);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2189CD3A8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v23 - v17;
  uint64_t v19 = *(void *)(v1 + *(int *)(v6 + 20));
  if (*(void *)(v19 + 16))
  {
    uint64_t v20 = *(void *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v15, v19 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80)), v12);
    sub_2189CD318();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_2189B9C60(v1, (uint64_t)v8, type metadata accessor for UsageDetailChart.Model);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_2189CD518();
    Calendar.fullDay(for:)((uint64_t)v5, (uint64_t)v18);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v23);
    sub_2189B9CC8((uint64_t)v8, type metadata accessor for UsageDetailChart.Model);
    sub_218900AE4((uint64_t)v11, &qword_267BE1B00);
  }
  else
  {
    sub_2189B9CC8((uint64_t)v8, type metadata accessor for UsageDetailChart.Model);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BE8);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_2189CF720;
  _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0();
  sub_2189CD348();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  return v21;
}

uint64_t UsageDetailChart.Model.yStride.getter()
{
  UsageDetailChart.Model.maxUsage.getter();
  double v1 = 3600.0;
  if (v2 > 3600.0) {
    double v1 = *(double *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 28));
  }
  UsageDetailChart.Model.maxUsage.getter();
  double v4 = v1 * ceil(v3 / v1);
  if (v4 > v1) {
    double v5 = v4;
  }
  else {
    double v5 = v1;
  }
  uint64_t result = type metadata accessor for UsageDetailChart.Model(0);
  double v7 = v5 * 0.25;
  if (v5 * 0.25 == 0.0) {
    goto LABEL_39;
  }
  double v8 = *(double *)(v0 + *(int *)(result + 28)) * 0.25 + v5;
  BOOL v9 = v8 >= 0.0;
  if (v7 > 0.0) {
    BOOL v9 = v8 <= 0.0;
  }
  if (!v9)
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v10 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_37;
      }
      double v12 = (double)v10 * v7 + 0.0;
      BOOL v13 = v12 <= v8;
      if (v7 > 0.0) {
        BOOL v13 = v8 <= v12;
      }
      ++v11;
      if (v13) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_16:
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_21890CBB4(0, v10 & ~(v10 >> 63), 0);
  uint64_t result = v24;
  if (v10)
  {
    uint64_t v14 = 0;
    double v15 = 0.0;
    while (1)
    {
      BOOL v16 = v15 <= v8;
      if (v7 > 0.0) {
        BOOL v16 = v8 <= v15;
      }
      if (v16) {
        break;
      }
      uint64_t v25 = result;
      unint64_t v18 = *(void *)(result + 16);
      unint64_t v17 = *(void *)(result + 24);
      if (v18 >= v17 >> 1)
      {
        sub_21890CBB4(v17 > 1, v18 + 1, 1);
        uint64_t result = v25;
      }
      double v19 = (double)++v14 * v7 + 0.0;
      *(void *)(result + 16) = v18 + 1;
      *(double *)(result + 8 * v18 + 32) = v15;
      double v15 = v19;
      if (v10 == v14) {
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    return result;
  }
  double v19 = 0.0;
LABEL_26:
  BOOL v20 = v19 <= v8;
  if (v7 > 0.0) {
    BOOL v20 = v8 <= v19;
  }
  if (!v20)
  {
    while (!__OFADD__(v10, 1))
    {
      uint64_t v26 = result;
      unint64_t v22 = *(void *)(result + 16);
      unint64_t v21 = *(void *)(result + 24);
      if (v22 >= v21 >> 1)
      {
        sub_21890CBB4(v21 > 1, v22 + 1, 1);
        uint64_t result = v26;
      }
      *(double *)(result + 8 * v22 + 32) = v19;
      double v19 = (double)(v10 + 1) * v7 + 0.0;
      *(void *)(result + 16) = v22 + 1;
      BOOL v23 = v19 <= v8;
      if (v7 > 0.0) {
        BOOL v23 = v8 <= v19;
      }
      ++v10;
      if (v23) {
        return result;
      }
    }
    goto LABEL_38;
  }
  return result;
}

uint64_t UsageDetailChart.Model.lastY.getter()
{
  UsageDetailChart.Model.maxUsage.getter();
  if (v0 > 3600.0) {
    type metadata accessor for UsageDetailChart.Model(0);
  }
  return UsageDetailChart.Model.maxUsage.getter();
}

uint64_t UsageDetailChart.Model.maxUsage.getter()
{
  uint64_t v1 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  double v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = *(void *)(v0 + *(int *)(type metadata accessor for UsageDetailChart.Model(0) + 20));
  uint64_t v17 = v0;
  swift_bridgeObjectRetain();
  sub_218902118((uint64_t (*)(char *))sub_2189BBBD4, (uint64_t)v16, v5);
  uint64_t v7 = v6;
  int64_t v8 = *(void *)(v6 + 16);
  if (v8)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_21890CBB4(0, v8, 0);
    uint64_t v9 = v7 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    uint64_t v10 = *(void *)(v2 + 72);
    uint64_t v11 = v18;
    do
    {
      sub_2189B9C60(v9, (uint64_t)v4, type metadata accessor for UsageDetailChart.HourlyUsage);
      uint64_t v12 = *(void *)&v4[*(int *)(v1 + 20)];
      sub_2189B9CC8((uint64_t)v4, type metadata accessor for UsageDetailChart.HourlyUsage);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21890CBB4(0, *(void *)(v11 + 16) + 1, 1);
        uint64_t v11 = v18;
      }
      unint64_t v14 = *(void *)(v11 + 16);
      unint64_t v13 = *(void *)(v11 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_21890CBB4(v13 > 1, v14 + 1, 1);
        uint64_t v11 = v18;
      }
      *(void *)(v11 + 16) = v14 + 1;
      *(void *)(v11 + 8 * v14 + 32) = v12;
      v9 += v10;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  sub_218909184(v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2189B9540()
{
  return sub_2189CDFD8();
}

uint64_t sub_2189B9564(uint64_t a1)
{
  uint64_t v2 = sub_2189CDF28();
  __n128 v3 = MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_2189CDFE8();
}

void *sub_2189B962C(void *a1)
{
  return sub_218943004(0, a1[2], 0, a1);
}

void sub_2189B9640()
{
}

uint64_t sub_2189B9654(unint64_t a1)
{
  return sub_218943174(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B9668(unint64_t a1)
{
  return sub_2189431A8(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B967C(unint64_t a1)
{
  return sub_218943470(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B9690(unint64_t a1)
{
  return sub_2189434A4(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B96A4(unint64_t a1)
{
  return sub_2189434D8(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B96B8(unint64_t a1)
{
  return sub_21894350C(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B96CC(unint64_t a1)
{
  return sub_218943540(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B96E0(unint64_t a1)
{
  return sub_218943574(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B96F4(unint64_t a1)
{
  return sub_2189435A8(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2189B9708(unint64_t a1)
{
  return sub_2189435DC(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_2189B971C(void *a1)
{
  return sub_218943E14(0, a1[2], 0, a1);
}

uint64_t _s16ScreenTimeUICore16UsageDetailChartV06HourlyD0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_2189CD338() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for UsageDetailChart.HourlyUsage(0);
  if (*(double *)(a1 + *(int *)(v4 + 20)) != *(double *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = v4;
  if ((sub_218901174(*(void *)(a1 + *(int *)(v4 + 24)), *(void *)(a2 + *(int *)(v4 + 24))) & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(v5 + 28);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a2 + v6);

  return sub_218901174(v7, v8);
}

BOOL _s16ScreenTimeUICore16UsageDetailChartV5ModelV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_2189CD4F8() & 1) != 0
    && (uint64_t v4 = (int *)type metadata accessor for UsageDetailChart.Model(0),
        (sub_218903FBC(*(void *)(a1 + v4[5]), *(void *)(a2 + v4[5])) & 1) != 0)
    && (MEMORY[0x21D476300](a1 + v4[6], a2 + v4[6]) & 1) != 0
    && *(double *)(a1 + v4[7]) == *(double *)(a2 + v4[7]))
  {
    return *(void *)(a1 + v4[8]) == *(void *)(a2 + v4[8]);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_2189B9860()
{
  return sub_2189B5BA0() & 1;
}

uint64_t sub_2189B9880()
{
  uint64_t v1 = *(void *)(type metadata accessor for UsageDetailChart(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = type metadata accessor for UsageDetailChart.Model(0);
  swift_bridgeObjectRelease();
  uint64_t v9 = v6 + *(int *)(v8 + 24);
  uint64_t v10 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2189B99C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189B9A30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for UsageDetailChart(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_2189B7FE4(a1, v6, a2);
}

unint64_t sub_2189B9AB0()
{
  unint64_t result = qword_267BE3568;
  if (!qword_267BE3568)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3558);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE25E0);
    sub_2189CDBC8();
    swift_getOpaqueTypeConformance2();
    sub_2189096A8();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3568);
  }
  return result;
}

uint64_t sub_2189B9BB8@<X0>(uint64_t a1@<X8>)
{
  return sub_21890992C(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(unsigned char *)(v1 + 48), *(void *)(v1 + 56), a1, *(double *)(v1 + 40));
}

uint64_t sub_2189B9BD0()
{
  return sub_2189CDFD8();
}

uint64_t sub_2189B9BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2189B9C60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189B9CC8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2189B9D28()
{
  return sub_2189B9D70(&qword_267BE2080, MEMORY[0x263F062D0]);
}

uint64_t sub_2189B9D70(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2189B9DB8()
{
  return sub_2189B9D70(&qword_267BE1C50, MEMORY[0x263F07490]);
}

uint64_t sub_2189B9E00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageDetailChart(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_2189CD528();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for UsageDetailChart.Model(0);
    *(uint64_t *)((char *)a1 + v8[5]) = *(uint64_t *)((char *)a2 + v8[5]);
    uint64_t v9 = v8[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_2189CD6B8();
    unint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *(uint64_t *)((char *)a1 + v8[7]) = *(uint64_t *)((char *)a2 + v8[7]);
    *(uint64_t *)((char *)a1 + v8[8]) = *(uint64_t *)((char *)a2 + v8[8]);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for UsageDetailChart(uint64_t a1)
{
  uint64_t v2 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = type metadata accessor for UsageDetailChart.Model(0);
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(v3 + 24);
  uint64_t v5 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  uint64_t v8 = v7[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD6B8();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(void *)(a1 + v7[8]) = *(void *)(a2 + v7[8]);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = v7[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(void *)(a1 + v7[8]) = *(void *)(a2 + v7[8]);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  uint64_t v8 = v7[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(void *)(a1 + v7[8]) = *(void *)(a2 + v7[8]);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for UsageDetailChart.Model(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  swift_bridgeObjectRelease();
  uint64_t v8 = v7[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(void *)(a1 + v7[8]) = *(void *)(a2 + v7[8]);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189BA4B0);
}

uint64_t sub_2189BA4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UsageDetailChart.Model(0);
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

uint64_t storeEnumTagSinglePayload for UsageDetailChart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189BA590);
}

uint64_t sub_2189BA590(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UsageDetailChart.Model(0);
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

uint64_t sub_2189BA64C()
{
  uint64_t result = type metadata accessor for UsageDetailChart.Model(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageDetailChart.HourlyUsage(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2189CD3A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for UsageDetailChart.HourlyUsage(uint64_t a1)
{
  uint64_t v2 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189BAAE0);
}

uint64_t sub_2189BAAE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for UsageDetailChart.HourlyUsage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189BABB4);
}

uint64_t sub_2189BABB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2189CD3A8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_2189BAC70()
{
  uint64_t result = sub_2189CD3A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UsageDetailChart.Model(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2189CD528();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2189CD6B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
  }
  return a1;
}

uint64_t initializeWithCopy for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2189CD6B8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  return a1;
}

uint64_t assignWithCopy for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for UsageDetailChart.Model(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageDetailChart.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189BB224);
}

uint64_t sub_2189BB224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_2189CD6B8();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for UsageDetailChart.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189BB364);
}

uint64_t sub_2189BB364(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2189CD528();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_2189CD6B8();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_2189BB490()
{
  uint64_t result = sub_2189CD528();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2189CD6B8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_2189BB578()
{
  unint64_t result = qword_267BE35B0;
  if (!qword_267BE35B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3548);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3538);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3530);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE1C20);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE1CE0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE1C30);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3528);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE1BF0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3520);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE1C10);
    sub_218901074(&qword_267BE3578, &qword_267BE3520);
    sub_218909878(&qword_267BE1C18, &qword_267BE1C10);
    swift_getOpaqueTypeConformance2();
    sub_218909878(&qword_267BE1BF8, &qword_267BE1BF0);
    swift_getOpaqueTypeConformance2();
    sub_218901074(&qword_267BE1C38, &qword_267BE1C30);
    swift_getOpaqueTypeConformance2();
    sub_218901074(&qword_267BE1C28, &qword_267BE1C20);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_218901074(&qword_267BE35B8, &qword_267BE2608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE35B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UsageDetailChart.Model.TopCategoryRatio()
{
  return &type metadata for UsageDetailChart.Model.TopCategoryRatio;
}

uint64_t sub_2189BB854()
{
  uint64_t v1 = *(void *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for UsageDetailChart(0) - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v2 | v6 | 7;
  uint64_t v10 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v0 + v3, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_2189CD528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v0 + v7, v11);
  uint64_t v12 = type metadata accessor for UsageDetailChart.Model(0);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v7 + *(int *)(v12 + 24);
  uint64_t v14 = sub_2189CD6B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_2189BBA58@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v11 = *(void *)(type metadata accessor for UsageDetailChart.HourlyUsage(0) - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = *(void *)(v11 + 64);
  uint64_t v14 = *(void *)(type metadata accessor for UsageDetailChart(0) - 8);
  uint64_t v15 = v5 + ((v12 + v13 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));

  return sub_2189B8358(a1, a2, a3, v5 + v12, v15, a4, a5);
}

uint64_t sub_2189BBB64()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2189BBB9C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double))(v1 + 16))(*(void *)a1, *(void *)(a1 + 16), *(void *)(a1 + 24), *(double *)(a1 + 8));
}

uint64_t sub_2189BBBD4()
{
  return sub_2189B9860() & 1;
}

void *sub_2189BBBF0(uint64_t a1, char a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2450);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2189D2450;
  uint64_t v5 = self;
  *(void *)(inited + 32) = MEMORY[0x21D477270](objc_msgSend(v5, sel_systemBlueColor));
  *(void *)(inited + 40) = MEMORY[0x21D477270](objc_msgSend(v5, sel_systemTealColor));
  *(void *)(inited + 48) = MEMORY[0x21D477270](objc_msgSend(v5, sel_systemOrangeColor));
  if (qword_267BE1930 != -1) {
    swift_once();
  }
  *(void *)(inited + 56) = qword_267BE6A08;
  sub_2189CEA48();
  uint64_t v6 = swift_retain_n();
  uint64_t v7 = sub_2189B491C(v6, a1);
  uint64_t v15 = (void *)v7;
  if ((a2 & 1) != 0 && __OFSUB__(a1--, 1)) {
    goto LABEL_30;
  }
  if (a1 >= 4) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = a1;
  }
  if (v9 < 0)
  {
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    sub_2189B9640();
  }
  if (!v9)
  {
    swift_bridgeObjectRelease();
    return (void *)v7;
  }
  if ((unint64_t)(v9 - 1) >= *(void *)(inited + 16)) {
    goto LABEL_27;
  }
  uint64_t v10 = *(void *)(inited + 32);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_28;
  }
  if (!v15[2]) {
    goto LABEL_29;
  }
  v15[4] = v10;
  swift_release();
  sub_2189CEA48();
  if (v9 == 1) {
    goto LABEL_23;
  }
  uint64_t v11 = *(void *)(inited + 40);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_31;
  }
  if (v15[2] < 2uLL) {
    goto LABEL_29;
  }
  v15[5] = v11;
  swift_release();
  sub_2189CEA48();
  if (v9 == 2) {
    goto LABEL_23;
  }
  uint64_t v12 = *(void *)(inited + 48);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_2189B9640();
  }
  if (v15[2] < 3uLL)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    sub_2189B9640();
  }
  v15[6] = v12;
  swift_release();
  sub_2189CEA48();
  if (v9 != 3)
  {
    uint64_t v13 = *(void *)(inited + 56);
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_2189B9640();
    }
    if (v15[2] >= 4uLL)
    {
      v15[7] = v13;
      swift_release();
      sub_2189CEA48();
      goto LABEL_23;
    }
    goto LABEL_29;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  return v15;
}

void sub_2189BBECC()
{
}

BOOL static ChartFormats.DataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ChartFormats.DataType.hash(into:)()
{
  return sub_2189CECD8();
}

uint64_t ChartFormats.DataType.hashValue.getter()
{
  return sub_2189CECE8();
}

BOOL sub_2189BBF64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ChartFormats.deinit()
{
  return v0;
}

uint64_t ChartFormats.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

unint64_t sub_2189BBF98()
{
  unint64_t result = qword_267BE35D8;
  if (!qword_267BE35D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE35D8);
  }
  return result;
}

uint64_t type metadata accessor for ChartFormats()
{
  return self;
}

uint64_t method lookup function for ChartFormats(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ChartFormats);
}

uint64_t getEnumTagSinglePayload for ChartFormats.DataType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ChartFormats.DataType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2189BC184);
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

unsigned char *sub_2189BC1AC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ChartFormats.DataType()
{
  return &type metadata for ChartFormats.DataType;
}

uint64_t sub_2189BC1C8()
{
  id v0 = objc_msgSend(self, sel_bundle);
  uint64_t result = sub_2189CE598();
  qword_267BE6A08 = result;
  return result;
}

uint64_t sub_2189BC224(uint64_t a1)
{
  return sub_2189BC260(a1, (SEL *)&selRef_labelColor, &qword_267BE6A10);
}

uint64_t sub_2189BC238(uint64_t a1)
{
  return sub_2189BC260(a1, (SEL *)&selRef_quaternaryLabelColor, &qword_267BE6A20);
}

uint64_t sub_2189BC24C(uint64_t a1)
{
  return sub_2189BC260(a1, (SEL *)&selRef_secondaryLabelColor, &qword_267BE6A28);
}

uint64_t sub_2189BC260(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4 = [self *a2];
  uint64_t result = MEMORY[0x21D477270](v4);
  *a3 = result;
  return result;
}

uint64_t sub_2189BC2A8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1A40);
  MEMORY[0x270FA5388](v0 - 8);
  int v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2189CE2E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = sub_2189CE318();
  uint64_t result = sub_218993A1C((uint64_t)v2);
  qword_267BE6A30 = v4;
  return result;
}

uint64_t sub_2189BC378(uint64_t result, double a2, double a3)
{
  if (a3 == 3600.0) {
    int v4 = *(unsigned __int8 *)result;
  }
  else {
    int v4 = 1;
  }
  if (v4) {
    uint64_t v5 = 96;
  }
  else {
    uint64_t v5 = 64;
  }
  if (a2 != a3 && a3 * 0.5 != a2) {
    goto LABEL_20;
  }
  if (*(unsigned char *)result)
  {
    if ((~*(void *)&a2 & 0x7FF0000000000000) != 0)
    {
      if (a2 > -9.22337204e18)
      {
        if (a2 < 9.22337204e18)
        {
          sub_21896A2BC();
          uint64_t v7 = sub_2189CEB98();
          goto LABEL_21;
        }
LABEL_26:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_26;
  }
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  objc_msgSend(v8, sel_setAllowedUnits_, v5);
  objc_msgSend(v8, sel_setUnitsStyle_, 1);
  objc_msgSend(v8, sel_setZeroFormattingBehavior_, 14);
  id v9 = objc_msgSend(v8, sel_stringFromTimeInterval_, a2);
  if (!v9)
  {

LABEL_20:
    uint64_t v7 = 0;
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  uint64_t v7 = sub_2189CE988();

LABEL_21:
  if (a2 == 0.0)
  {
    swift_bridgeObjectRelease();
    return 48;
  }
  return v7;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.App.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.App.localizedName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.App.notificationCount.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_2189BC580()
{
  uint64_t v1 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  uint64_t v2 = sub_21892011C(v0 + *(int *)(v1 + 24));
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 40;
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v9 = *(void *)(v4 - 8);
      uint64_t v10 = *(void *)v4;
      uint64_t v11 = *(void *)(v4 + 16);
      uint64_t v12 = *(void *)(v4 + 24);
      if (v9 != v11 || v10 != v12)
      {
        uint64_t v14 = *(void *)(v4 + 8);
        uint64_t v15 = *(void *)(v4 + 32);
        char v16 = *(unsigned char *)(v4 + 40);
        if ((sub_2189CEC88() & 1) == 0)
        {
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v22 = v14;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_21890CEFC(0, *(void *)(v5 + 16) + 1, 1);
          }
          unint64_t v7 = *(void *)(v5 + 16);
          unint64_t v6 = *(void *)(v5 + 24);
          if (v7 >= v6 >> 1) {
            sub_21890CEFC(v6 > 1, v7 + 1, 1);
          }
          *(void *)(v5 + 16) = v7 + 1;
          uint64_t v8 = v5 + 56 * v7;
          *(void *)(v8 + 32) = v9;
          *(void *)(v8 + 40) = v10;
          *(void *)(v8 + 48) = v22;
          *(void *)(v8 + 56) = v11;
          *(void *)(v8 + 64) = v12;
          *(void *)(v8 + 72) = v15;
          *(unsigned char *)(v8 + 80) = v16;
        }
      }
      v4 += 56;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v5 + 16) >= 3uLL) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = *(void *)(v5 + 16);
  }
  sub_2189CEC98();
  swift_unknownObjectRetain_n();
  uint64_t v18 = swift_dynamicCastClass();
  if (!v18)
  {
    swift_release();
    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  uint64_t v19 = *(void *)(v18 + 16);
  swift_release();
  if (v19 == v17)
  {
    uint64_t v20 = swift_dynamicCastClass();
    if (!v20)
    {
      swift_release();
      uint64_t v20 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    swift_release();
    uint64_t v20 = sub_21890BE08(v5, v5 + 32, 0, (2 * v17) | 1);
  }
  swift_release();
  return v20;
}

uint64_t sub_2189BC7A0()
{
  uint64_t v0 = sub_2189BC580();
  int64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_21890CBD4(0, v1, 0);
    uint64_t v2 = 0;
    uint64_t v3 = v16;
    uint64_t v12 = v0;
    do
    {
      uint64_t v4 = *(void *)(v0 + v2 + 40);
      uint64_t v15 = *(void *)(v0 + v2 + 32);
      uint64_t v5 = *(void *)(v0 + v2 + 48);
      uint64_t v13 = *(void *)(v0 + v2 + 56);
      uint64_t v6 = *(void *)(v0 + v2 + 64);
      uint64_t v7 = *(void *)(v0 + v2 + 72);
      char v14 = *(unsigned char *)(v0 + v2 + 80);
      unint64_t v9 = *(void *)(v16 + 16);
      unint64_t v8 = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      if (v9 >= v8 >> 1) {
        sub_21890CBD4(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v16 + 16) = v9 + 1;
      uint64_t v10 = v16 + 56 * v9;
      *(void *)(v10 + 32) = v15;
      *(void *)(v10 + 40) = v4;
      uint64_t v0 = v12;
      *(void *)(v10 + 48) = v13;
      *(void *)(v10 + 56) = v6;
      *(void *)(v10 + 64) = v7;
      *(double *)(v10 + 72) = (double)v5;
      *(unsigned char *)(v10 + 80) = v14;
      *(_WORD *)(v10 + 81) = 0;
      v2 += 56;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.appsEmittingMostNotifications.getter()
{
  uint64_t v0 = sub_2189BC580();
  int64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    sub_21890CF2C(0, v1, 0);
    uint64_t v2 = v13;
    uint64_t v3 = (uint64_t *)(v0 + 64);
    do
    {
      uint64_t v5 = *(v3 - 4);
      uint64_t v4 = *(v3 - 3);
      uint64_t v6 = *(v3 - 1);
      uint64_t v12 = *(v3 - 2);
      uint64_t v7 = *v3;
      unint64_t v8 = *(void *)(v13 + 16);
      unint64_t v9 = *(void *)(v13 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v8 >= v9 >> 1) {
        sub_21890CF2C(v9 > 1, v8 + 1, 1);
      }
      *(void *)(v13 + 16) = v8 + 1;
      uint64_t v10 = (void *)(v13 + 40 * v8);
      v10[4] = v5;
      v10[5] = v4;
      v10[6] = v6;
      v10[7] = v7;
      v10[8] = v12;
      v3 += 7;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v2;
}

uint64_t ScreenTimeNotificationsAppIntentView.Model.init(allActivityModel:mode:interval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (a2 == 1)
  {
    uint64_t v7 = *(int *)(type metadata accessor for AllActivityView.Model(0) + 96);
  }
  else
  {
    if (a2)
    {
      v17[4] = type metadata accessor for ScreenTimeAppInfoCache();
      v17[5] = &off_26CA11978;
      v17[1] = swift_allocObject();
      v17[9] = type metadata accessor for ScreenTimeAppIconCache();
      v17[10] = &off_26CA11950;
      v17[6] = swift_allocObject();
      v17[0] = sub_21896C82C(MEMORY[0x263F8EE78]);
      goto LABEL_7;
    }
    uint64_t v7 = *(int *)(type metadata accessor for AllActivityView.Model(0) + 100);
  }
  sub_218982B28(a1 + v7, (uint64_t)v17);
LABEL_7:
  uint64_t v8 = type metadata accessor for AllActivityView.Model(0);
  sub_218982B28(a1 + *(int *)(v8 + 100), (uint64_t)v15);
  uint64_t v9 = sub_21892066C(a3);
  sub_2189BD70C(a1, type metadata accessor for AllActivityView.Model);
  sub_2189BD698((uint64_t)v17);
  long long v10 = v15[3];
  *(_OWORD *)(a4 + 32) = v15[2];
  *(_OWORD *)(a4 + 48) = v10;
  *(_OWORD *)(a4 + 64) = v15[4];
  *(void *)(a4 + 80) = v16;
  long long v11 = v15[1];
  *(_OWORD *)a4 = v15[0];
  *(_OWORD *)(a4 + 16) = v11;
  *(double *)(a4 + 88) = (double)v9;
  uint64_t v12 = a4 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  uint64_t v13 = sub_2189CD3A8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12, a3, v13);
}

uint64_t ScreenTimeNotificationsAppIntentView.init(model:mode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  long long v11 = (char *)v16 - v10;
  sub_2189BD78C(a1, (uint64_t)v16 - v10, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  sub_2189BD78C((uint64_t)v11, (uint64_t)v8, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  sub_2189CE628();
  sub_2189BD70C((uint64_t)v11, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  uint64_t v12 = (void *)(a3 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView(0) + 20));
  v16[1] = a2;
  type metadata accessor for STActivityMode(0);
  sub_2189CE628();
  uint64_t v13 = v16[2];
  uint64_t v14 = v16[3];
  uint64_t result = sub_2189BD70C(a1, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  *uint64_t v12 = v13;
  v12[1] = v14;
  return result;
}

uint64_t ScreenTimeNotificationsAppIntentView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ScreenTimeNotificationsAppIntentView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a1 = sub_2189CE168();
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  sub_2189CE638();
  uint64_t v10 = sub_2189BC7A0();
  sub_2189BD70C((uint64_t)v9, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  v14[1] = v10;
  sub_2189BD78C(v2, (uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ScreenTimeNotificationsAppIntentView);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_2189BD7F8((uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35F8);
  sub_218901074(&qword_267BE3600, &qword_267BE35F0);
  sub_218901074(&qword_267BE3608, &qword_267BE35F8);
  sub_21899F848();
  return sub_2189CE788();
}

uint64_t sub_2189BCF58@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3648);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v61 = (uint64_t)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v50 - v6;
  uint64_t v8 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v50 - v12;
  uint64_t v14 = *a1;
  uint64_t v15 = a1[1];
  uint64_t v16 = a1[2];
  uint64_t v17 = a1[3];
  uint64_t v18 = a1[4];
  uint64_t v19 = a1[5];
  int v58 = *((unsigned __int8 *)a1 + 48);
  int v20 = *((unsigned __int8 *)a1 + 49);
  int v63 = *((unsigned __int8 *)a1 + 50);
  int v64 = v20;
  uint64_t v59 = v18;
  *(void *)&long long v60 = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  *((void *)&v60 + 1) = v17;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  sub_2189CE638();
  uint64_t v62 = *((void *)v13 + 11);
  sub_2189BD70C((uint64_t)v13, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  type metadata accessor for CGSize(0);
  v65[0] = 0uLL;
  sub_2189CE628();
  uint64_t v21 = v72;
  uint64_t v22 = v73;
  uint64_t v56 = v74;
  v65[0] = 0uLL;
  sub_2189CE628();
  uint64_t v23 = v72;
  uint64_t v24 = v73;
  uint64_t v55 = v74;
  unsigned __int8 v96 = 0;
  swift_bridgeObjectRetain();
  sub_2189CE638();
  uint64_t v25 = sub_2189BC7A0();
  sub_2189BD70C((uint64_t)v10, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  uint64_t v26 = *(void *)(v25 + 16);
  if (v26)
  {
    uint64_t v27 = v25 + 56 * v26;
    uint64_t v29 = *(void *)(v27 - 24);
    uint64_t v28 = *(void *)(v27 - 16);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
    if (v14 == v29 && v15 == v28)
    {
      swift_bridgeObjectRelease_n();
LABEL_11:
      uint64_t v33 = sub_2189CE748();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v7, 1, 1, v33);
      goto LABEL_12;
    }
    char v31 = sub_2189CEC88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_11;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_2189CE738();
  uint64_t v32 = sub_2189CE748();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v7, 0, 1, v32);
LABEL_12:
  uint64_t v51 = v14;
  unsigned __int8 v34 = v96;
  int v53 = v96;
  uint64_t v35 = v61;
  sub_2189BED64((uint64_t)v7, v61);
  *(void *)&v65[0] = v14;
  *((void *)&v65[0] + 1) = v15;
  uint64_t v54 = v15;
  uint64_t v52 = v7;
  long long v36 = v60;
  v65[1] = v60;
  uint64_t v37 = v59;
  *(void *)&long long v66 = v59;
  *((void *)&v66 + 1) = v19;
  char v38 = v58;
  LOBYTE(v67) = v58;
  BYTE1(v67) = v64;
  BYTE2(v67) = v63;
  *(_DWORD *)((char *)&v67 + 3) = v97;
  BYTE7(v67) = v98;
  *((void *)&v67 + 1) = v62;
  LOBYTE(v68) = v34;
  BYTE1(v68) = 2;
  WORD3(v68) = v95;
  *(_DWORD *)((char *)&v68 + 2) = v94;
  *((void *)&v68 + 1) = 0x4010000000000000;
  *(void *)&long long v69 = v21;
  *((void *)&v69 + 1) = v22;
  uint64_t v40 = v55;
  uint64_t v39 = v56;
  *(void *)&long long v70 = v56;
  *((void *)&v70 + 1) = v23;
  *(void *)&long long v71 = v24;
  *((void *)&v71 + 1) = v55;
  long long v41 = v65[0];
  long long v42 = v60;
  long long v43 = v67;
  uint64_t v44 = v57;
  v57[2] = v66;
  v44[3] = v43;
  *uint64_t v44 = v41;
  v44[1] = v42;
  long long v45 = v68;
  long long v46 = v69;
  long long v47 = v71;
  v44[6] = v70;
  v44[7] = v47;
  v44[4] = v45;
  v44[5] = v46;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3650);
  sub_2189BED64(v35, (uint64_t)v44 + *(int *)(v48 + 48));
  sub_2189BEDCC((uint64_t)v65);
  sub_2189BEE34((uint64_t)v52);
  sub_2189BEE34(v35);
  uint64_t v72 = v51;
  uint64_t v73 = v54;
  long long v74 = v36;
  uint64_t v75 = v37;
  uint64_t v76 = v19;
  char v77 = v38;
  char v78 = v64;
  char v79 = v63;
  int v80 = v97;
  char v81 = v98;
  uint64_t v82 = v62;
  char v83 = v53;
  char v84 = 2;
  __int16 v86 = v95;
  int v85 = v94;
  uint64_t v87 = 0x4010000000000000;
  uint64_t v88 = v21;
  uint64_t v89 = v22;
  uint64_t v90 = v39;
  uint64_t v91 = v23;
  uint64_t v92 = v24;
  uint64_t v93 = v40;
  return sub_2189BEE94((uint64_t)&v72);
}

uint64_t sub_2189BD434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  uint64_t v7 = type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a2 = sub_2189CE168();
  *(void *)(a2 + 8) = 0x4024000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  sub_2189CE638();
  uint64_t v10 = sub_2189BC7A0();
  sub_2189BD70C((uint64_t)v9, type metadata accessor for ScreenTimeNotificationsAppIntentView.Model);
  v14[1] = v10;
  sub_2189BD78C(v3, (uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ScreenTimeNotificationsAppIntentView);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_2189BD7F8((uint64_t)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35F8);
  sub_218901074(&qword_267BE3600, &qword_267BE35F0);
  sub_218901074(&qword_267BE3608, &qword_267BE35F8);
  sub_21899F848();
  return sub_2189CE788();
}

uint64_t sub_2189BD698(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3628);
}

uint64_t sub_2189BD70C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ScreenTimeNotificationsAppIntentView(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3610);
}

uint64_t sub_2189BD78C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189BD7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScreenTimeNotificationsAppIntentView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2189BD860()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a1 + 8;
    uint64_t v9 = a2 + 1;
    long long v10 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v10;
    uint64_t v11 = v10;
    uint64_t v12 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v10 - 8);
    swift_bridgeObjectRetain();
    v12(v8, v9, v11);
    long long v13 = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(v7 + 72) = v13;
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(v7 + 48, (uint64_t)(a2 + 6));
    *(void *)(v7 + 88) = a2[11];
    uint64_t v14 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
    uint64_t v15 = v7 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_2189CD3A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
    *(void *)(v7 + *(int *)(v18 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v18 + 28));
    uint64_t v19 = *(int *)(a3 + 20);
    int v20 = (void *)(v7 + v19);
    uint64_t v21 = (uint64_t *)((char *)a2 + v19);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t destroy for ScreenTimeNotificationsAppIntentView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  uint64_t v2 = a1 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  uint64_t v3 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a2 + 8;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  v9(a1 + 8, v6, v8);
  long long v10 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 48, a2 + 48);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v11 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  *(void *)(a1 + *(int *)(v15 + 28)) = *(void *)(a2 + *(int *)(v15 + 28));
  uint64_t v16 = *(int *)(a3 + 20);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ScreenTimeNotificationsAppIntentView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  a1[11] = a2[11];
  uint64_t v6 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  long long v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  *(void *)((char *)a1 + *(int *)(v10 + 28)) = *(void *)((char *)a2 + *(int *)(v10 + 28));
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  uint64_t v9 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  *(void *)(a1 + *(int *)(v13 + 28)) = *(void *)(a2 + *(int *)(v13 + 28));
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v7 = *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  *(void *)(a1 + *(int *)(v11 + 28)) = *(void *)(a2 + *(int *)(v11 + 28));
  swift_release();
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189BDF90);
}

uint64_t sub_2189BDF90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
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

uint64_t storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189BE078);
}

uint64_t sub_2189BE078(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

void sub_2189BE13C()
{
  sub_2189BE1D0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2189BE1D0()
{
  if (!qword_267BE3620)
  {
    type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(255);
    unint64_t v0 = sub_2189CE668();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BE3620);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2 + 1;
    long long v9 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 32) = v9;
    uint64_t v10 = v9;
    int v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    v11(a1 + 8, v8, v10);
    long long v12 = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 72) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 48, (uint64_t)(a2 + 6));
    *(void *)(a1 + 88) = a2[11];
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_2189CD3A8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 48;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  __swift_destroy_boxed_opaque_existential_1(v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_2189CD3A8();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = a2 + 8;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  long long v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_bridgeObjectRetain();
  v9(a1 + 8, v6, v8);
  long long v10 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 48, a2 + 48);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

void *assignWithCopy for ScreenTimeNotificationsAppIntentView.Model(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  a1[11] = a2[11];
  uint64_t v6 = *(int *)(a3 + 24);
  long long v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 88);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a2 + v7;
  uint64_t v9 = a1 + v7;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  uint64_t v10 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, v8, v10);
  return a1;
}

uint64_t assignWithTake for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189BE79C);
}

uint64_t sub_2189BE79C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2189CD3A8();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189BE860);
}

void *sub_2189BE860(void *result, uint64_t a2, int a3, uint64_t a4)
{
  long long v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2189CD3A8();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2189BE908()
{
  uint64_t result = sub_2189CD3A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeWithCopy for ScreenTimeNotificationsAppIntentView.Model.App(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ScreenTimeNotificationsAppIntentView.Model.App(void *a1, void *a2)
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
  return a1;
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

void *assignWithTake for ScreenTimeNotificationsAppIntentView.Model.App(void *a1, void *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model.App(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeNotificationsAppIntentView.Model.App(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeNotificationsAppIntentView.Model.App()
{
  return &type metadata for ScreenTimeNotificationsAppIntentView.Model.App;
}

uint64_t sub_2189BEB70()
{
  return sub_218901074(&qword_267BE3638, &qword_267BE3640);
}

uint64_t objectdestroyTm_6()
{
  uint64_t v1 = *(void *)(type metadata accessor for ScreenTimeNotificationsAppIntentView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v6 + 8);
  __swift_destroy_boxed_opaque_existential_1(v6 + 48);
  uint64_t v7 = v6 + *(int *)(type metadata accessor for ScreenTimeNotificationsAppIntentView.Model(0) + 24);
  uint64_t v8 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE35E8);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2189BECE4@<X0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  type metadata accessor for ScreenTimeNotificationsAppIntentView(0);

  return sub_2189BCF58(a1, a2);
}

uint64_t sub_2189BED64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2189BEDCC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2189BEE34(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3648);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2189BEE94(uint64_t a1)
{
  return a1;
}

uint64_t UsageHeaderView.body.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE34E0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189BF084(v1, (uint64_t)v4);
  uint64_t v5 = (int *)type metadata accessor for UsageHeaderView(0);
  uint64_t v6 = *(void *)(v1 + v5[5]);
  uint64_t v7 = v1 + v5[6];
  uint64_t v8 = &v4[v2[10]];
  uint64_t v9 = sub_2189CD3A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, v7, v9);
  uint64_t v10 = *(void *)(v1 + v5[7]);
  *(void *)&v4[v2[9]] = v6;
  uint64_t v11 = &v4[v2[11]];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v4[v2[12]] = v10;
  uint64_t v12 = &v4[v2[13]];
  *(void *)uint64_t v12 = sub_218991468;
  *((void *)v12 + 1) = 0;
  sub_2189B2D38();
  swift_bridgeObjectRetain();
  sub_2189CE4C8();
  return sub_2189BF10C((uint64_t)v4);
}

uint64_t sub_2189BF084(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UsageHeaderView(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3658);
}

uint64_t sub_2189BF10C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE34E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2189BF16C()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for UsageHeaderView(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2189CD6B8();
    uint64_t v23 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v23(a1, a2, v7);
    uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)((char *)a1 + v8[9]) = *(void *)((char *)a2 + v8[9]);
    *((unsigned char *)a1 + v8[10]) = *((unsigned char *)a2 + v8[10]);
    uint64_t v9 = v8[11];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_2189CD528();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = type metadata accessor for UsageHeaderView.Model(0);
    v23((void *)((char *)a1 + *(int *)(v16 + 20)), (void *)((char *)a2 + *(int *)(v16 + 20)), v7);
    uint64_t v17 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t type metadata accessor for UsageHeaderView.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3668);
}

uint64_t destroy for UsageHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD6B8();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(v6 + 44);
  uint64_t v8 = sub_2189CD528();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v10 = type metadata accessor for UsageHeaderView.Model(0);
  v5(a1 + *(int *)(v10 + 20), v4);
  uint64_t v11 = a1 + *(int *)(a2 + 24);
  uint64_t v12 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  v20(a1, a2, v5);
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v7 = v6[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2189CD528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = type metadata accessor for UsageHeaderView.Model(0);
  v20(a1 + *(int *)(v14 + 20), a2 + *(int *)(v14 + 20), v5);
  uint64_t v15 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24);
  v22(a1, a2, v5);
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v7 = v6[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2189CD528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = type metadata accessor for UsageHeaderView.Model(0);
  v22(a1 + *(int *)(v16 + 20), a2 + *(int *)(v16 + 20), v5);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v17 = a3[6];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD6B8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v8[9]) = *(void *)(a2 + v8[9]);
  *(unsigned char *)(a1 + v8[10]) = *(unsigned char *)(a2 + v8[10]);
  uint64_t v9 = v8[11];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_2189CD528();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = type metadata accessor for UsageHeaderView.Model(0);
  v7(a1 + *(int *)(v15 + 20), a2 + *(int *)(v15 + 20), v6);
  uint64_t v16 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for UsageHeaderView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  v22(a1, a2, v5);
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v7 = v6[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2189CD528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = type metadata accessor for UsageHeaderView.Model(0);
  v22(a1 + *(int *)(v16 + 20), a2 + *(int *)(v16 + 20), v5);
  uint64_t v17 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageHeaderView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189BFF20);
}

uint64_t sub_2189BFF20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UsageHeaderView.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_2189CD3A8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageHeaderView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189C0054);
}

uint64_t sub_2189C0054(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UsageHeaderView.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_2189CD3A8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_2189C0164()
{
  uint64_t result = type metadata accessor for UsageHeaderView.Model(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2189CD3A8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for UsageHeaderView.Model(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2189CD6B8();
    uint64_t v18 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v18(a1, a2, v7);
    uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)((char *)a1 + v8[9]) = *(void *)((char *)a2 + v8[9]);
    *((unsigned char *)a1 + v8[10]) = *((unsigned char *)a2 + v8[10]);
    uint64_t v9 = v8[11];
    __dst = (char *)a1 + v9;
    uint64_t v10 = (char *)a2 + v9;
    uint64_t v11 = sub_2189CD528();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    v18((void *)((char *)a1 + *(int *)(a3 + 20)), (void *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for UsageHeaderView.Model(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD6B8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v11(a1, v4);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(v5 + 44);
  uint64_t v7 = sub_2189CD528();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v9 = a1 + *(int *)(a2 + 20);

  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v9, v4);
}

uint64_t initializeWithCopy for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  v15(a1, a2, v5);
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v7 = v6[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2189CD528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v15(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v5);
  return a1;
}

uint64_t assignWithCopy for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24);
  v17(a1, a2, v5);
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v7 = v6[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2189CD528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v17(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v5);
  return a1;
}

uint64_t initializeWithTake for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD6B8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v8[9]) = *(void *)(a2 + v8[9]);
  *(unsigned char *)(a1 + v8[10]) = *(unsigned char *)(a2 + v8[10]);
  uint64_t v9 = v8[11];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_2189CD528();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2189CD6B8();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  v17(a1, a2, v5);
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(a1 + v6[9]) = *(void *)(a2 + v6[9]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v6[10]) = *(unsigned char *)(a2 + v6[10]);
  uint64_t v7 = v6[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2189CD528();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v17(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189C0D50);
}

uint64_t sub_2189C0D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_2189CD6B8();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for UsageHeaderView.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189C0E60);
}

uint64_t sub_2189C0E60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_2189CD6B8();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_2189C0F68()
{
  sub_2189B3CF8();
  if (v0 <= 0x3F)
  {
    sub_2189CD6B8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for AccessibilityLabelIfNotNil(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for AccessibilityLabelIfNotNil(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityLabelIfNotNil()
{
  return &type metadata for AccessibilityLabelIfNotNil;
}

uint64_t sub_2189C10F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189C110C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a1;
  v4[1] = a2;
  return MEMORY[0x21D4771A0](v4, a3, &type metadata for AccessibilityLabelIfNotNil);
}

uint64_t sub_2189C1144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v20[1] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3678);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3680);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3688);
  __n128 v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v20[2] = a2;
    v20[3] = a3;
    sub_2189C143C();
    sub_2189096A8();
    sub_2189CE4A8();
    sub_2189C1498((uint64_t)v17, (uint64_t)v13);
    swift_storeEnumTagMultiPayload();
    sub_2189C13C0();
    sub_2189CE188();
    return sub_2189C1500((uint64_t)v17);
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v8 + 16);
    v19(v10, a1, v7, v15);
    ((void (*)(char *, char *, uint64_t))v19)(v13, v10, v7);
    swift_storeEnumTagMultiPayload();
    sub_2189C13C0();
    sub_2189C143C();
    sub_2189CE188();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_2189C13B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2189C1144(a1, *v2, v2[1], a2);
}

unint64_t sub_2189C13C0()
{
  unint64_t result = qword_267BE3690;
  if (!qword_267BE3690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3688);
    sub_2189C143C();
    sub_21892E6E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3690);
  }
  return result;
}

unint64_t sub_2189C143C()
{
  unint64_t result = qword_267BE3698;
  if (!qword_267BE3698)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3698);
  }
  return result;
}

uint64_t sub_2189C1498(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2189C1500(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3688);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2189C1564()
{
  unint64_t result = qword_267BE36A0;
  if (!qword_267BE36A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE36A8);
    sub_2189C13C0();
    sub_2189C143C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE36A0);
  }
  return result;
}

uint64_t sub_2189C15E0@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v37 = a3;
  uint64_t v32 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v35 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2189CD6B8();
  uint64_t v36 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2189CD528();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v15 = (int *)type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v30 = (uint64_t)&v30 - v19;
  uint64_t v20 = *(int *)(type metadata accessor for PickupsOverviewChart.Model(0) + 20);
  uint64_t v34 = a4;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v21(a4 + v20, (uint64_t)a1, v11);
  uint64_t v33 = a1;
  v21((uint64_t)v14, (uint64_t)a1, v11);
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
  uint64_t v31 = v8;
  v22(v10, v37, v8);
  uint64_t v23 = sub_2189CE538();
  uint64_t v24 = v35;
  Calendar.startOfWeek(containing:)((uint64_t)v14, v35);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v24, 1, v11);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
    v26(v14, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v17, v24, v11);
    uint64_t v27 = v31;
    *(void *)&v17[v15[5]] = v32;
    uint64_t v28 = v36;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(&v17[v15[6]], v10, v27);
    *(void *)&v17[v15[7]] = v23;
    v17[v15[8]] = 1;
    uint64_t v29 = v30;
    sub_218987D30((uint64_t)v17, v30);
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v37, v27);
    v26(v33, v11);
    return sub_218987D30(v29, v34);
  }
  return result;
}

uint64_t PickupsOverviewChart.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v26);
  unint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (int *)type metadata accessor for OverviewChart(0);
  MEMORY[0x270FA5388](v13);
  __n128 v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218987C4C(v1, (uint64_t)v12);
  uint64_t v16 = type metadata accessor for PickupsOverviewChart(0);
  sub_2189CE708();
  uint64_t v17 = *(void *)(v1 + *(int *)(v16 + 24));
  uint64_t v18 = sub_2189CD528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_218916808((uint64_t)v6, (uint64_t)v3);
  swift_bridgeObjectRetain();
  sub_2189CE628();
  sub_218987CD0((uint64_t)v6);
  uint64_t v19 = v13[7];
  uint64_t v20 = &v15[v13[8]];
  uint64_t v28 = 0x4024000000000000;
  sub_2189CE628();
  uint64_t v21 = v30;
  *(void *)uint64_t v20 = v29;
  *((void *)v20 + 1) = v21;
  uint64_t v22 = &v15[v13[9]];
  uint64_t v28 = 0;
  sub_2189CE628();
  uint64_t v23 = v30;
  *(void *)uint64_t v22 = v29;
  *((void *)v22 + 1) = v23;
  sub_218987D30((uint64_t)v12, (uint64_t)v15);
  sub_218987D94((uint64_t)v9, (uint64_t)&v15[v13[6]]);
  v15[v13[10]] = 1;
  *(void *)&v15[v19] = v17;
  sub_218989FF4(&qword_267BE2C40, (void (*)(uint64_t))type metadata accessor for OverviewChart);
  sub_2189CE4C8();
  return sub_218987DFC((uint64_t)v15);
}

uint64_t type metadata accessor for PickupsOverviewChart(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE36B0);
}

uint64_t sub_2189C1CC0()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for PickupsOverviewChart(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_2189CD528();
    uint64_t v33 = *(void *)(v7 - 8);
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
    v36(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(void *)&a1[v8[5]] = *(void *)&a2[v8[5]];
    uint64_t v9 = v8[6];
    uint64_t v35 = &a1[v9];
    uint64_t v10 = &a2[v9];
    uint64_t v11 = sub_2189CD6B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    uint64_t v34 = v12;
    v12(v35, v10, v11);
    uint64_t v13 = v7;
    *(void *)&a1[v8[7]] = *(void *)&a2[v8[7]];
    a1[v8[8]] = a2[v8[8]];
    uint64_t v14 = *(int *)(type metadata accessor for PickupsOverviewChart.Model(0) + 20);
    __n128 v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    swift_retain();
    v36(v15, v16, v13);
    uint64_t v17 = a3[5];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    uint64_t v20 = *(void *)&a2[v17 + 8];
    *(void *)uint64_t v18 = *(void *)&a2[v17];
    *((void *)v18 + 1) = v20;
    swift_retain();
    swift_retain();
    uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0) + 32);
    uint64_t v22 = &v18[v21];
    uint64_t v23 = &v19[v21];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(&v19[v21], 1, v13))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      v36(v22, v23, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v22, 0, 1, v13);
    }
    uint64_t v26 = a3[7];
    *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
    uint64_t v27 = &a1[v26];
    uint64_t v28 = &a2[v26];
    swift_bridgeObjectRetain();
    v36(v27, v28, v13);
    *(void *)&v27[v8[5]] = *(void *)&v28[v8[5]];
    uint64_t v29 = v8[6];
    uint64_t v30 = &v27[v29];
    uint64_t v31 = &v28[v29];
    swift_bridgeObjectRetain();
    v34(v30, v31, v11);
    *(void *)&v27[v8[7]] = *(void *)&v28[v8[7]];
    v27[v8[8]] = v28[v8[8]];
  }
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for PickupsOverviewChart.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE36C0);
}

uint64_t destroy for PickupsOverviewChart(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2189CD528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = type metadata accessor for OverviewChart.Model(0);
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(v7 + 24);
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v10 = (void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  uint64_t v16 = *v10;
  (*v10)(v8, v9);
  swift_release();
  uint64_t v11 = type metadata accessor for PickupsOverviewChart.Model(0);
  v6(a1 + *(int *)(v11 + 20), v4);
  uint64_t v12 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v13 = v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0) + 32);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4)) {
    v6(v13, v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = a1 + *(int *)(a2 + 28);
  v6(v14, v4);
  swift_bridgeObjectRelease();
  v16(v14 + *(int *)(v7 + 24), v9);

  return swift_release();
}

uint64_t initializeWithCopy for PickupsOverviewChart(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = sub_2189CD528();
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16);
  v6(a1, a2, v5);
  uint64_t v7 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  uint64_t v8 = v7[6];
  uint64_t v35 = a1 + v8;
  uint64_t v9 = a2 + v8;
  uint64_t v10 = sub_2189CD6B8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  uint64_t v12 = v35;
  uint64_t v34 = v11;
  uint64_t v36 = v10;
  v11(v12, v9, v10);
  uint64_t v13 = v5;
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v14 = *(int *)(type metadata accessor for PickupsOverviewChart.Model(0) + 20);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  swift_retain();
  v6(v15, v16, v13);
  uint64_t v17 = a3[5];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a2 + v17 + 8);
  *uint64_t v18 = *(void *)(a2 + v17);
  v18[1] = v20;
  swift_retain();
  swift_retain();
  uint64_t v21 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0) + 32);
  uint64_t v22 = (char *)v18 + v21;
  uint64_t v23 = (const void *)(v19 + v21);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v19 + v21, 1, v13))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v6((uint64_t)v22, (uint64_t)v23, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v22, 0, 1, v13);
  }
  uint64_t v25 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  swift_bridgeObjectRetain();
  v6(v26, v27, v13);
  *(void *)(v26 + v7[5]) = *(void *)(v27 + v7[5]);
  uint64_t v28 = v7[6];
  uint64_t v29 = v26 + v28;
  uint64_t v30 = v27 + v28;
  swift_bridgeObjectRetain();
  v34(v29, v30, v36);
  *(void *)(v26 + v7[7]) = *(void *)(v27 + v7[7]);
  *(unsigned char *)(v26 + v7[8]) = *(unsigned char *)(v27 + v7[8]);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PickupsOverviewChart(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD528();
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)(a1 + v8[5]) = *(void *)(a2 + v8[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = v8[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_2189CD6B8();
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 24);
  uint64_t v30 = v12;
  v29(v10, v11);
  *(void *)(a1 + v8[7]) = *(void *)(a2 + v8[7]);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + v8[8]) = *(unsigned char *)(a2 + v8[8]);
  uint64_t v13 = type metadata accessor for PickupsOverviewChart.Model(0);
  uint64_t v31 = v7;
  v7(a1 + *(int *)(v13 + 20), a2 + *(int *)(v13 + 20), v6);
  uint64_t v14 = a3[5];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_retain();
  swift_release();
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_retain();
  swift_release();
  uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0) + 32);
  uint64_t v18 = (void *)(v15 + v17);
  uint64_t v19 = (void *)(v16 + v17);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  LODWORD(v16) = v20(v18, 1, v6);
  int v21 = v20(v19, 1, v6);
  if (!v16)
  {
    if (!v21)
    {
      uint64_t v23 = v31;
      v31((uint64_t)v18, (uint64_t)v19, v6);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v18, v6);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 16))(v18, v19, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v18, 0, 1, v6);
LABEL_7:
  uint64_t v23 = v31;
LABEL_8:
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[7];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  v23(a1 + v24, v26, v6);
  *(void *)(v25 + v8[5]) = *(void *)(v26 + v8[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, uint64_t, uint64_t))v29)(v25 + v8[6], v26 + v8[6], v30);
  *(void *)(v25 + v8[7]) = *(void *)(v26 + v8[7]);
  swift_retain();
  swift_release();
  *(unsigned char *)(v25 + v8[8]) = *(unsigned char *)(v26 + v8[8]);
  return a1;
}

uint64_t initializeWithTake for PickupsOverviewChart(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD528();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)(a1 + v8[5]) = *(void *)(a2 + v8[5]);
  uint64_t v9 = v8[6];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_2189CD6B8();
  uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32);
  v27(v10, v11, v12);
  *(void *)(a1 + v8[7]) = *(void *)(a2 + v8[7]);
  *(unsigned char *)(a1 + v8[8]) = *(unsigned char *)(a2 + v8[8]);
  uint64_t v13 = type metadata accessor for PickupsOverviewChart.Model(0);
  v7(a1 + *(int *)(v13 + 20), a2 + *(int *)(v13 + 20), v6);
  uint64_t v14 = a3[5];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)(a2 + v14 + 8);
  *uint64_t v15 = *(void *)(a2 + v14);
  v15[1] = v17;
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0) + 32);
  uint64_t v19 = (char *)v15 + v18;
  uint64_t v20 = (const void *)(v16 + v18);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v26 + 48))(v20, 1, v6))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v19, (uint64_t)v20, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v19, 0, 1, v6);
  }
  uint64_t v22 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  v7(a1 + v22, v24, v6);
  *(void *)(v23 + v8[5]) = *(void *)(v24 + v8[5]);
  v27(v23 + v8[6], v24 + v8[6], v12);
  *(void *)(v23 + v8[7]) = *(void *)(v24 + v8[7]);
  *(unsigned char *)(v23 + v8[8]) = *(unsigned char *)(v24 + v8[8]);
  return a1;
}

uint64_t assignWithTake for PickupsOverviewChart(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2189CD528();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)(a1 + v9[5]) = *(void *)(a2 + v9[5]);
  swift_bridgeObjectRelease();
  uint64_t v10 = v9[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_2189CD6B8();
  uint64_t v30 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 40);
  uint64_t v31 = v13;
  v30(v11, v12);
  *(void *)(a1 + v9[7]) = *(void *)(a2 + v9[7]);
  swift_release();
  *(unsigned char *)(a1 + v9[8]) = *(unsigned char *)(a2 + v9[8]);
  uint64_t v14 = type metadata accessor for PickupsOverviewChart.Model(0);
  uint64_t v32 = v8;
  v8(a1 + *(int *)(v14 + 20), a2 + *(int *)(v14 + 20), v6);
  uint64_t v15 = a3[5];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  swift_release();
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  swift_release();
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0) + 32);
  uint64_t v19 = (void *)(v16 + v18);
  uint64_t v20 = (void *)(v17 + v18);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v22 = v21(v19, 1, v6);
  int v23 = v21(v20, 1, v6);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v25 = v32;
      v32((uint64_t)v19, (uint64_t)v20, v6);
      goto LABEL_8;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v19, v6);
    goto LABEL_6;
  }
  if (v23)
  {
LABEL_6:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v19, v20, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v19, 0, 1, v6);
LABEL_7:
  uint64_t v25 = v32;
LABEL_8:
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[7];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  v25(a1 + v26, v28, v6);
  *(void *)(v27 + v9[5]) = *(void *)(v28 + v9[5]);
  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, uint64_t, uint64_t))v30)(v27 + v9[6], v28 + v9[6], v31);
  *(void *)(v27 + v9[7]) = *(void *)(v28 + v9[7]);
  swift_release();
  *(unsigned char *)(v27 + v9[8]) = *(unsigned char *)(v28 + v9[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for PickupsOverviewChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189C2E90);
}

uint64_t sub_2189C2E90(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for PickupsOverviewChart.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 2147483646)
  {
    unint64_t v14 = *(void *)(a1 + a3[6]);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    int v15 = v14 - 1;
    if (v15 < 0) {
      int v15 = -1;
    }
    return (v15 + 1);
  }
  else
  {
    uint64_t v16 = type metadata accessor for OverviewChart.Model(0);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[7];
    return v17(v19, a2, v18);
  }
}

uint64_t storeEnumTagSinglePayload for PickupsOverviewChart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189C3034);
}

uint64_t sub_2189C3034(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for PickupsOverviewChart.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[6]) = a2;
  }
  else
  {
    uint64_t v15 = type metadata accessor for OverviewChart.Model(0);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_2189C31B8()
{
  type metadata accessor for PickupsOverviewChart.Model(319);
  if (v0 <= 0x3F)
  {
    sub_21891C270();
    if (v1 <= 0x3F)
    {
      type metadata accessor for OverviewChart.Model(319);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_2189C32C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189C32DC);
}

uint64_t sub_2189C32DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OverviewChart.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_2189CD528();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_2189C33D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189C33E8);
}

uint64_t sub_2189C33E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for OverviewChart.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_2189CD528();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_2189C34EC(uint64_t a1, uint64_t a2)
{
  if ((sub_2189CD4F8() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for OverviewChart.Model(0);
  if (!sub_21890350C(*(void *)(a1 + v4[5]), *(void *)(a2 + v4[5]))
    || (MEMORY[0x21D476300](a1 + v4[6], a2 + v4[6]) & 1) == 0
    || (sub_2189CE508() & 1) == 0
    || *(unsigned __int8 *)(a1 + v4[8]) != *(unsigned __int8 *)(a2 + v4[8]))
  {
    return 0;
  }
  type metadata accessor for PickupsOverviewChart.Model(0);

  return sub_2189CD4F8();
}

void sub_2189C35B4()
{
  qword_267BE6A38 = 0x7070416C6C415F5FLL;
  unk_267BE6A40 = 0xEB000000005F5F73;
}

unsigned char *storeEnumTagSinglePayload for MostUsedListType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2189C36ACLL);
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

ValueMetadata *type metadata accessor for MostUsedListType()
{
  return &type metadata for MostUsedListType;
}

unint64_t sub_2189C36E8()
{
  unint64_t result = qword_267BE36D0;
  if (!qword_267BE36D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE36D0);
  }
  return result;
}

uint64_t SummaryView.Model.init(dateState:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v92 = a2;
  uint64_t v72 = a1;
  uint64_t v91 = a3;
  uint64_t v81 = sub_2189CD528();
  uint64_t v76 = *(void *)(v81 - 8);
  uint64_t v3 = v76;
  MEMORY[0x270FA5388](v81);
  uint64_t v89 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x270FA5388](v71);
  long long v70 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v69 = (uint64_t)&v68 - v7;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50) - 8;
  MEMORY[0x270FA5388](v83);
  uint64_t v93 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UsageHeaderView.Model(0);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2189CD6B8();
  int v94 = *(void **)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  long long v74 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v68 - v16;
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v68 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v73 = (uint64_t)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v88 = (uint64_t)&v68 - v24;
  MEMORY[0x270FA5388](v25);
  uint64_t v77 = (uint64_t)&v68 - v26;
  MEMORY[0x270FA5388](v27);
  int v85 = (char *)&v68 - v28;
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v68 - v30;
  __n128 v33 = MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v68 - v34;
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v3 + 56);
  uint64_t v37 = v81;
  v36((char *)&v68 - v34, 1, 1, v81, v33);
  unint64_t v75 = sub_21896CA2C(MEMORY[0x263F8EE78]);
  sub_2189CD678();
  uint64_t v38 = *(int *)(v10 + 28);
  uint64_t v87 = v12;
  uint64_t v39 = &v12[v38];
  uint64_t v40 = (void (*)(char *, char *, uint64_t))v94[2];
  v40(v39, v20, v13);
  __int16 v86 = v20;
  v40(v17, v20, v13);
  char v84 = v35;
  sub_218900A60((uint64_t)v35, (uint64_t)v31, &qword_267BE1AE0);
  uint64_t v41 = (uint64_t)v93;
  char v79 = v17;
  uint64_t v90 = v13;
  v40(v93, v17, v13);
  uint64_t v42 = v83;
  uint64_t v43 = *(int *)(v83 + 44);
  sub_21896CA2C(MEMORY[0x263F8EE78]);
  uint64_t v78 = v41 + *(int *)(v42 + 52);
  uint64_t v82 = v3 + 56;
  int v80 = v36;
  ((void (*)(void))v36)();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v41 + *(int *)(v42 + 48)) = 0;
  *(void *)(v41 + v43) = v75;
  uint64_t v45 = v76;
  uint64_t v44 = v77;
  sub_218900A60((uint64_t)v31, v77, &qword_267BE1AE0);
  long long v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48);
  if (v46(v44, 1, v37) == 1)
  {
    uint64_t v47 = (uint64_t)v85;
    sub_2189CD518();
    sub_218900AE4((uint64_t)v31, &qword_267BE1AE0);
    uint64_t v48 = (void (*)(char *, uint64_t))v94[1];
    uint64_t v49 = v90;
    v48(v79, v90);
    sub_218900AE4(v44, &qword_267BE1AE0);
  }
  else
  {
    sub_218900AE4((uint64_t)v31, &qword_267BE1AE0);
    uint64_t v48 = (void (*)(char *, uint64_t))v94[1];
    uint64_t v49 = v90;
    v48(v79, v90);
    uint64_t v47 = (uint64_t)v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v85, v44, v37);
  }
  int v85 = (char *)type metadata accessor for SummaryView.Model(0);
  uint64_t v50 = v91 + *((int *)v85 + 5);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v80)(v47, 0, 1, v37);
  sub_21896DFD0(v47, v78);
  sub_218900AE4((uint64_t)v84, &qword_267BE1AE0);
  v48(v86, v49);
  uint64_t v51 = (uint64_t)v87;
  sub_218912B98((uint64_t)v93, (uint64_t)v87, &qword_267BE1F50);
  sub_2189C3F80(v51, v50, type metadata accessor for UsageHeaderView.Model);
  uint64_t v52 = (uint64_t)v89;
  sub_2189CD518();
  uint64_t v53 = v88;
  Calendar.startOfWeek(containing:)(v52, v88);
  uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
  v54(v52, v37);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v46)(v53, 1, v37);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v56 = v45;
    uint64_t v93 = (char *)sub_2189CE538();
    uint64_t v57 = v74;
    sub_2189CD678();
    uint64_t v58 = v73;
    Calendar.startOfWeek(containing:)(v53, v73);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v46)(v58, 1, v37);
    if (result != 1)
    {
      v54(v53, v37);
      uint64_t v59 = (uint64_t)v70;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v70, v58, v37);
      long long v60 = (int *)v71;
      *(void *)(v59 + *(int *)(v71 + 20)) = MEMORY[0x263F8EE78];
      uint64_t v61 = (void (*)(uint64_t, char *, uint64_t))v94[4];
      uint64_t v62 = v57;
      uint64_t v63 = v90;
      v61(v59 + v60[6], v62, v90);
      *(void *)(v59 + v60[7]) = v93;
      *(unsigned char *)(v59 + v60[8]) = 0;
      uint64_t v64 = v69;
      sub_2189C3F80(v59, v69, type metadata accessor for OverviewChart.Model);
      uint64_t v65 = v64;
      uint64_t v66 = v91;
      sub_2189C3F80(v65, v91, type metadata accessor for OverviewChart.Model);
      long long v67 = v85;
      sub_2189C3F80(v72, v66 + *((int *)v85 + 6), type metadata accessor for ActivityNavigationState);
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v61)(v66 + *((int *)v67 + 7), v92, v63);
    }
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SummaryView.Model(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3750);
}

uint64_t sub_2189C3F80(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t SummaryView.Model.init(usageThisWeek:headerModel:totalUsageLastWeek:dateState:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v64 = a5;
  uint64_t v65 = a4;
  uint64_t v62 = a2;
  uint64_t v63 = a3;
  uint64_t v61 = a1;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50) - 8;
  MEMORY[0x270FA5388](v53);
  uint64_t v66 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UsageHeaderView.Model(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2189CD6B8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v50 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v47 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v51 = (uint64_t)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v57 = (char *)&v47 - v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v47 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v47 - v24;
  uint64_t v26 = sub_2189CD528();
  uint64_t v49 = *(void *)(v26 - 8);
  uint64_t v27 = v49 + 56;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56);
  v28(v25, 1, 1, v26);
  unint64_t v48 = sub_21896CA2C(MEMORY[0x263F8EE78]);
  sub_2189CD678();
  uint64_t v29 = *(int *)(v7 + 28);
  uint64_t v59 = v9;
  uint64_t v30 = &v9[v29];
  uint64_t v67 = v11;
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v31(v30, v15, v10);
  uint64_t v32 = v50;
  uint64_t v58 = v15;
  v31(v50, v15, v10);
  uint64_t v56 = v25;
  sub_218900A60((uint64_t)v25, (uint64_t)v22, &qword_267BE1AE0);
  uint64_t v33 = (uint64_t)v66;
  uint64_t v60 = v10;
  v31(v66, v32, v10);
  uint64_t v34 = v53;
  uint64_t v35 = *(int *)(v53 + 44);
  sub_21896CA2C(MEMORY[0x263F8EE78]);
  uint64_t v52 = v33 + *(int *)(v34 + 52);
  uint64_t v54 = v28;
  uint64_t v55 = v27;
  ((void (*)(void))v28)();
  uint64_t v36 = (uint64_t)v22;
  uint64_t v37 = v49;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v33 + *(int *)(v34 + 48)) = 0;
  *(void *)(v33 + v35) = v48;
  uint64_t v38 = v51;
  sub_218900A60(v36, v51, &qword_267BE1AE0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v38, 1, v26) == 1)
  {
    uint64_t v39 = (uint64_t)v57;
    sub_2189CD518();
    sub_218900AE4(v36, &qword_267BE1AE0);
    uint64_t v40 = *(void (**)(char *, uint64_t))(v67 + 8);
    uint64_t v41 = v60;
    v40(v32, v60);
    sub_218900AE4(v38, &qword_267BE1AE0);
  }
  else
  {
    sub_218900AE4(v36, &qword_267BE1AE0);
    uint64_t v40 = *(void (**)(char *, uint64_t))(v67 + 8);
    uint64_t v41 = v60;
    v40(v32, v60);
    uint64_t v39 = (uint64_t)v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v57, v38, v26);
  }
  uint64_t v42 = (int *)type metadata accessor for SummaryView.Model(0);
  uint64_t v43 = v64;
  uint64_t v44 = v64 + v42[5];
  v54((char *)v39, 0, 1, v26);
  sub_21896DFD0(v39, v52);
  sub_218900AE4((uint64_t)v56, &qword_267BE1AE0);
  v40(v58, v41);
  uint64_t v45 = (uint64_t)v59;
  sub_218912B98((uint64_t)v66, (uint64_t)v59, &qword_267BE1F50);
  sub_2189C3F80(v45, v44, type metadata accessor for UsageHeaderView.Model);
  sub_2189C3F80(v61, v43, type metadata accessor for OverviewChart.Model);
  sub_2189C4570(v62, v44);
  sub_2189C3F80(v63, v43 + v42[6], type metadata accessor for ActivityNavigationState);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v43 + v42[7], v65, v41);
}

uint64_t sub_2189C4570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UsageHeaderView.Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t SummaryView.init(bridge:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v22 - v13;
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = (int *)type metadata accessor for SummaryView(0);
  uint64_t v16 = (char *)a2 + v15[5];
  char v23 = 0;
  sub_2189CE628();
  uint64_t v17 = v25;
  *uint64_t v16 = v24;
  *((void *)v16 + 1) = v17;
  uint64_t v18 = type metadata accessor for SummaryView.Model(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 1, 1, v18);
  sub_218900A60((uint64_t)v14, (uint64_t)v11, &qword_267BE36D8);
  sub_2189CE628();
  sub_218900AE4((uint64_t)v14, &qword_267BE36D8);
  uint64_t v19 = sub_2189CD528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 1, 1, v19);
  sub_218900A60((uint64_t)v8, (uint64_t)v5, &qword_267BE1AE0);
  sub_2189CE628();
  sub_218900AE4((uint64_t)v8, &qword_267BE1AE0);
  *(uint64_t *)((char *)a2 + v15[6]) = v22;
  uint64_t v20 = (uint64_t *)((char *)a2 + v15[7]);
  v20[3] = type metadata accessor for ModelProvider();
  void v20[4] = (uint64_t)&protocol witness table for ModelProvider;
  __swift_allocate_boxed_opaque_existential_1(v20);
  return _s16ScreenTimeUICore13ModelProviderVACycfC_0();
}

uint64_t SummaryView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v2 = type metadata accessor for SummaryView(0);
  uint64_t v18 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v18 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E8);
  uint64_t v4 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36F8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2189C4C04((uint64_t)v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  sub_2189CDCD8();
  swift_endAccess();
  sub_2189CC1C8(v1, (uint64_t)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SummaryView);
  unint64_t v13 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v14 = swift_allocObject();
  sub_2189C3F80((uint64_t)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13, type metadata accessor for SummaryView);
  sub_218900A60((uint64_t)v9, (uint64_t)v12, &qword_267BE36F0);
  uint64_t v15 = v19;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v12[*(int *)(v10 + 52)], v6, v19);
  uint64_t v16 = (uint64_t (**)(uint64_t *))&v12[*(int *)(v10 + 56)];
  *uint64_t v16 = sub_2189C7118;
  v16[1] = (uint64_t (*)(uint64_t *))v14;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  sub_218900AE4((uint64_t)v9, &qword_267BE36F0);
  sub_218901074(&qword_267BE3718, &qword_267BE36F8);
  sub_2189CE4C8();
  return sub_218900AE4((uint64_t)v12, &qword_267BE36F8);
}

uint64_t sub_2189C4C04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v79 = a1;
  uint64_t v80 = type metadata accessor for NoActivityView();
  MEMORY[0x270FA5388](v80);
  uint64_t v3 = (uint64_t *)((char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3788);
  MEMORY[0x270FA5388](v77);
  uint64_t v78 = (uint64_t)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2189CDD98();
  uint64_t v73 = *(void *)(v5 - 8);
  uint64_t v74 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v71 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v70 = (uint64_t)&v65 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3790);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3798);
  MEMORY[0x270FA5388](v66);
  unint64_t v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE37A0);
  MEMORY[0x270FA5388](v68);
  uint64_t v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE37A8);
  MEMORY[0x270FA5388](v67);
  uint64_t v72 = (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE37B0);
  MEMORY[0x270FA5388](v76);
  uint64_t v69 = (uint64_t)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v75 = (uint64_t)&v65 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for SummaryView.Model(0);
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SummaryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  sub_2189CE638();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    sub_218900AE4((uint64_t)v22, &qword_267BE36D8);
    uint64_t v27 = sub_2189CE2C8();
    id v28 = objc_msgSend(self, sel_systemBackgroundColor);
    uint64_t v29 = v80;
    uint64_t v30 = (char *)v3 + *(int *)(v80 + 24);
    uint64_t v31 = sub_2189CD918();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v30, 1, 1, v31);
    uint64_t v32 = (char *)v3 + *(int *)(v29 + 28);
    char v81 = 1;
    sub_2189CE628();
    uint64_t v33 = v83;
    *uint64_t v32 = v82;
    *((void *)v32 + 1) = v33;
    *(uint64_t *)((char *)v3 + *(int *)(v29 + 32)) = 0x4000000000000000;
    *uint64_t v3 = v27;
    v3[1] = (uint64_t)v28;
    sub_2189CC1C8((uint64_t)v3, v78, (uint64_t (*)(void))type metadata accessor for NoActivityView);
    swift_storeEnumTagMultiPayload();
    sub_2189CC258(&qword_267BE37B8, &qword_267BE37B0, (void (*)(void))sub_2189CC230);
    sub_2189CC418(&qword_267BE37F0, (void (*)(uint64_t))type metadata accessor for NoActivityView);
    sub_2189CE188();
    uint64_t v34 = (uint64_t (*)(void))type metadata accessor for NoActivityView;
    uint64_t v35 = (uint64_t)v3;
  }
  else
  {
    uint64_t v36 = v26;
    sub_2189C3F80((uint64_t)v22, (uint64_t)v26, type metadata accessor for SummaryView.Model);
    *(void *)uint64_t v11 = sub_2189CE168();
    *((void *)v11 + 1) = 0x4024000000000000;
    v11[16] = 0;
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE37F8);
    sub_2189C5BCC((uint64_t)v26, v1, (uint64_t)&v11[*(int *)(v37 + 44)]);
    char v38 = sub_2189CE278();
    sub_2189CDD78();
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    sub_218900A60((uint64_t)v11, (uint64_t)v13, &qword_267BE3790);
    uint64_t v47 = &v13[*(int *)(v66 + 36)];
    *uint64_t v47 = v38;
    *((void *)v47 + 1) = v40;
    *((void *)v47 + 2) = v42;
    *((void *)v47 + 3) = v44;
    *((void *)v47 + 4) = v46;
    v47[40] = 0;
    sub_218900AE4((uint64_t)v11, &qword_267BE3790);
    uint64_t v48 = v70;
    sub_2189CBF0C(v70);
    uint64_t v50 = v73;
    uint64_t v49 = v74;
    uint64_t v51 = v71;
    (*(void (**)(char *, void, uint64_t))(v73 + 104))(v71, *MEMORY[0x263F184F8], v74);
    char v52 = sub_2189CDD88();
    uint64_t v53 = *(void (**)(char *, uint64_t))(v50 + 8);
    v53(v51, v49);
    v53((char *)v48, v49);
    uint64_t v54 = self;
    uint64_t v55 = &selRef_secondarySystemBackgroundColor;
    if ((v52 & 1) == 0) {
      uint64_t v55 = &selRef_clearColor;
    }
    uint64_t v56 = MEMORY[0x21D4771C0]([v54 *v55]);
    char v57 = sub_2189CE288();
    sub_218900A60((uint64_t)v13, (uint64_t)v15, &qword_267BE3798);
    uint64_t v58 = &v15[*(int *)(v68 + 36)];
    *(void *)uint64_t v58 = v56;
    v58[8] = v57;
    sub_218900AE4((uint64_t)v13, &qword_267BE3798);
    uint64_t v59 = v72;
    sub_218900A60((uint64_t)v15, v72, &qword_267BE37A0);
    uint64_t v60 = (void *)(v59 + *(int *)(v67 + 36));
    *uint64_t v60 = nullsub_1;
    v60[1] = 0;
    v60[2] = 0;
    v60[3] = 0;
    sub_218900AE4((uint64_t)v15, &qword_267BE37A0);
    uint64_t v61 = v69;
    sub_218900A60(v59, v69, &qword_267BE37A8);
    uint64_t v62 = (void *)(v61 + *(int *)(v76 + 36));
    void *v62 = 0;
    v62[1] = 0;
    v62[2] = nullsub_1;
    v62[3] = 0;
    sub_218900AE4(v59, &qword_267BE37A8);
    uint64_t v63 = v75;
    sub_218912B98(v61, v75, &qword_267BE37B0);
    sub_218900A60(v63, v78, &qword_267BE37B0);
    swift_storeEnumTagMultiPayload();
    sub_2189CC258(&qword_267BE37B8, &qword_267BE37B0, (void (*)(void))sub_2189CC230);
    sub_2189CC418(&qword_267BE37F0, (void (*)(uint64_t))type metadata accessor for NoActivityView);
    sub_2189CE188();
    sub_218900AE4(v63, &qword_267BE37B0);
    uint64_t v34 = type metadata accessor for SummaryView.Model;
    uint64_t v35 = (uint64_t)v36;
  }
  return sub_2189CC460(v35, v34);
}

uint64_t sub_2189C5520(uint64_t *a1, uint64_t a2)
{
  uint64_t v49 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v42 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v47 = (uint64_t)&v38 - v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v38 - v8;
  uint64_t v10 = sub_2189CD998();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v38 - v15;
  uint64_t v17 = *a1;
  unint64_t v18 = a1[1];
  if (qword_267BE1910 != -1) {
    swift_once();
  }
  uint64_t v48 = v17;
  uint64_t v46 = v9;
  uint64_t v19 = __swift_project_value_buffer(v10, (uint64_t)qword_267BE69B0);
  uint64_t v20 = *(void (**)(void))(v11 + 16);
  uint64_t v44 = v19;
  uint64_t v45 = v11 + 16;
  uint64_t v43 = v20;
  v20(v16);
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_2189CD978();
  os_log_type_t v22 = sub_2189CEAE8();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v41 = v11;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v39 = (void (*)(void, void))swift_slowAlloc();
    uint64_t v51 = v39;
    *(_DWORD *)uint64_t v24 = 136315138;
    uint64_t v25 = v10;
    if (v18) {
      uint64_t v26 = v48;
    }
    else {
      uint64_t v26 = 7104878;
    }
    uint64_t v40 = v13;
    if (v18) {
      unint64_t v27 = v18;
    }
    else {
      unint64_t v27 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_21897A8DC(v26, v27, (uint64_t *)&v51);
    sub_2189CEB78();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2188FB000, v21, v22, "SummaryView received userAltDSID %s; fetching model", v24, 0xCu);
    id v28 = v39;
    swift_arrayDestroy();
    MEMORY[0x21D477F30](v28, -1, -1);
    uint64_t v29 = v24;
    uint64_t v30 = v41;
    MEMORY[0x21D477F30](v29, -1, -1);

    uint64_t v31 = v48;
    uint64_t v39 = *(void (**)(void, void))(v30 + 8);
    v39(v16, v25);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v39 = *(void (**)(void, void))(v11 + 8);
    v39(v16, v10);
    uint64_t v31 = v48;
  }
  uint64_t v32 = (void *)(v49 + *(int *)(type metadata accessor for SummaryView(0) + 28));
  uint64_t v33 = v32[3];
  uint64_t v34 = v32[4];
  __swift_project_boxed_opaque_existential_1(v32, v33);
  uint64_t v35 = (uint64_t)v46;
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v34 + 24))(v31, v18, v33, v34);
  uint64_t v36 = type metadata accessor for SummaryView.Model(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
  sub_218900A60(v35, v47, &qword_267BE36D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  sub_2189CE648();
  return sub_218900AE4(v35, &qword_267BE36D8);
}

uint64_t sub_2189C5BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v45 = a3;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v44);
  uint64_t v42 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v39 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AF0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v40 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OverviewChart.Model(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for OverviewChart(0);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v43 = (uint64_t)&v39 - v18;
  uint64_t v19 = type metadata accessor for UsageHeaderView(0);
  uint64_t v20 = (int *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  os_log_type_t v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v39 - v24;
  uint64_t v26 = type metadata accessor for SummaryView.Model(0);
  sub_2189CC1C8(a1 + *(int *)(v26 + 20), (uint64_t)v25, type metadata accessor for UsageHeaderView.Model);
  uint64_t v27 = *(void *)(a1 + *(int *)(v26 + 24));
  sub_2189141D8((uint64_t)&v25[v20[8]]);
  *(void *)&v25[v20[7]] = v27;
  *(void *)&v25[v20[9]] = 0;
  sub_2189CC1C8(a1, (uint64_t)v12, type metadata accessor for OverviewChart.Model);
  type metadata accessor for SummaryView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
  uint64_t v28 = (uint64_t)v40;
  sub_2189CE658();
  uint64_t v29 = sub_2189CD528();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v7, 1, 1, v29);
  sub_218900A60((uint64_t)v7, v42, &qword_267BE1AE0);
  sub_2189CE628();
  sub_218900AE4((uint64_t)v7, &qword_267BE1AE0);
  uint64_t v30 = v14[9];
  uint64_t v31 = &v16[v14[10]];
  uint64_t v46 = 0x4024000000000000;
  sub_2189CE628();
  uint64_t v32 = v48;
  *(void *)uint64_t v31 = v47;
  *((void *)v31 + 1) = v32;
  uint64_t v33 = &v16[v14[11]];
  uint64_t v46 = 0;
  sub_2189CE628();
  uint64_t v34 = v48;
  *(void *)uint64_t v33 = v47;
  *((void *)v33 + 1) = v34;
  sub_2189C3F80((uint64_t)v12, (uint64_t)v16, type metadata accessor for OverviewChart.Model);
  sub_218912B98(v28, (uint64_t)&v16[v14[8]], &qword_267BE1AF0);
  v16[v14[12]] = 0;
  *(void *)&v16[v30] = 0;
  uint64_t v35 = v43;
  sub_2189C3F80((uint64_t)v16, v43, type metadata accessor for OverviewChart);
  sub_2189CC1C8((uint64_t)v25, (uint64_t)v22, type metadata accessor for UsageHeaderView);
  sub_2189CC1C8(v35, (uint64_t)v16, type metadata accessor for OverviewChart);
  uint64_t v36 = v45;
  sub_2189CC1C8((uint64_t)v22, v45, type metadata accessor for UsageHeaderView);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3800);
  sub_2189CC1C8((uint64_t)v16, v36 + *(int *)(v37 + 48), type metadata accessor for OverviewChart);
  sub_2189CC460(v35, type metadata accessor for OverviewChart);
  sub_2189CC460((uint64_t)v25, type metadata accessor for UsageHeaderView);
  sub_2189CC460((uint64_t)v16, type metadata accessor for OverviewChart);
  return sub_2189CC460((uint64_t)v22, type metadata accessor for UsageHeaderView);
}

double sub_2189C60BC@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2189CDD08();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2189C613C()
{
  return sub_2189CDD18();
}

uint64_t sub_2189C61C0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2189CDD08();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2189C6234()
{
  return sub_2189CDD18();
}

void (*sub_2189C62B0(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2189CDCF8();
  return sub_218975A78;
}

uint64_t sub_2189C633C()
{
  return swift_endAccess();
}

uint64_t sub_2189C63A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16);
  v10((char *)&v12 - v8, a1, v2, v7);
  ((void (*)(char *, char *, uint64_t))v10)(v5, v9, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  sub_2189CDCE8();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
}

uint64_t sub_2189C6518()
{
  return swift_endAccess();
}

uint64_t sub_2189C657C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E8);
  uint64_t v3 = *(void *)(v2 - 8);
  __n128 v4 = MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2, v4);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  sub_2189CDCE8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_2189C66A8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  sub_2189CDCD8();
  swift_endAccess();
  return sub_218975F5C;
}

uint64_t SummaryView.Bridge.__allocating_init(userAltDSID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v8 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3720);
  sub_2189CDCC8();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9, v7, v4);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  swift_retain();
  sub_2189CDD18();
  return v8;
}

uint64_t SummaryView.Bridge.init(userAltDSID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3720);
  sub_2189CDCC8();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  swift_retain();
  sub_2189CDD18();
  return v2;
}

uint64_t SummaryView.Bridge.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SummaryView.Bridge.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV16ScreenTimeUICore11SummaryView6Bridge__userAltDSID;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2189C6B74()
{
  return sub_2189CDF58();
}

uint64_t sub_2189C6B98(uint64_t a1)
{
  uint64_t v2 = sub_2189CDD98();
  __n128 v3 = MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_2189CDF68();
}

uint64_t type metadata accessor for SummaryView(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3730);
}

uint64_t sub_2189C6C84()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for SummaryView(0);
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  uint64_t v6 = v0 + v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2189CDD98();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v4, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v6 + v2[7]);
  uint64_t v8 = v6 + v2[8];
  uint64_t v9 = (int *)type metadata accessor for SummaryView.Model(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v9 - 1) + 48))(v8, 1, v9))
  {
    uint64_t v31 = v5;
    uint64_t v32 = (v3 + 16) & ~v3;
    uint64_t v33 = v3;
    uint64_t v34 = v0;
    uint64_t v10 = sub_2189CD528();
    uint64_t v29 = *(void *)(v10 - 8);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
    v35(v8, v10);
    uint64_t v11 = type metadata accessor for OverviewChart.Model(0);
    swift_bridgeObjectRelease();
    uint64_t v12 = v8 + *(int *)(v11 + 24);
    uint64_t v13 = sub_2189CD6B8();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
    v14(v12, v13);
    swift_release();
    uint64_t v15 = v8 + v9[5];
    uint64_t v30 = v14;
    v14(v15, v13);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    swift_bridgeObjectRelease();
    uint64_t v17 = v15 + *(int *)(v16 + 44);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v17, 1, v10)) {
      v35(v17, v10);
    }
    uint64_t v18 = type metadata accessor for UsageHeaderView.Model(0);
    v14(v15 + *(int *)(v18 + 20), v13);
    uint64_t v19 = v10;
    uint64_t v20 = v8 + v9[6];
    uint64_t v21 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v22 = v20 + *(int *)(v21 + 20);
    v35(v22, v19);
    uint64_t v23 = v22 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v24 = sub_2189CD3A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
    v30(v20 + *(int *)(v21 + 24), v13);
    v30(v8 + v9[7], v13);
    uint64_t v3 = v33;
    uint64_t v1 = v34;
    uint64_t v5 = v31;
    uint64_t v4 = v32;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  swift_release();
  uint64_t v25 = v6 + v2[9];
  uint64_t v26 = sub_2189CD528();
  uint64_t v27 = *(void *)(v26 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26)) {
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
  swift_release();

  return MEMORY[0x270FA0238](v1, v4 + v5, v3 | 7);
}

uint64_t sub_2189C7118(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for SummaryView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_2189C5520(a1, v4);
}

uint64_t sub_2189C7190()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SummaryView(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v6 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_2189CDD98();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = v6[5];
    uint64_t v10 = v6[6];
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    *uint64_t v11 = *v12;
    *((void *)v11 + 1) = *((void *)v12 + 1);
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    uint64_t v13 = v6[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    long long v16 = *(_OWORD *)((char *)a2 + v13 + 24);
    *(_OWORD *)((char *)a1 + v13 + 24) = v16;
    uint64_t v17 = v16;
    uint64_t v18 = **(void (***)(char *, char *, uint64_t))(v16 - 8);
    swift_retain();
    swift_retain();
    v18(v14, v15, v17);
    uint64_t v19 = v6[8];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = type metadata accessor for SummaryView.Model(0);
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
      memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v64 = v6;
      uint64_t v66 = v23;
      uint64_t v72 = sub_2189CD528();
      uint64_t v63 = *(void *)(v72 - 8);
      uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
      v68(v20, v21, v72);
      uint64_t v25 = (int *)type metadata accessor for OverviewChart.Model(0);
      *(void *)&v20[v25[5]] = *(void *)&v21[v25[5]];
      uint64_t v26 = v25[6];
      uint64_t v69 = &v21[v26];
      uint64_t v70 = &v20[v26];
      uint64_t v27 = sub_2189CD6B8();
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
      swift_bridgeObjectRetain();
      v28(v70, v69, v27);
      *(void *)&v20[v25[7]] = *(void *)&v21[v25[7]];
      v20[v25[8]] = v21[v25[8]];
      uint64_t v67 = v22;
      uint64_t v29 = *(int *)(v22 + 20);
      uint64_t v65 = v20;
      uint64_t v30 = &v20[v29];
      uint64_t v31 = &v21[v29];
      swift_retain();
      uint64_t v71 = v27;
      uint64_t v32 = v27;
      uint64_t v33 = v28;
      v28(v30, v31, v32);
      uint64_t v34 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
      *(void *)&v30[v34[9]] = *(void *)&v31[v34[9]];
      v30[v34[10]] = v31[v34[10]];
      uint64_t v35 = v34[11];
      uint64_t v36 = &v30[v35];
      uint64_t v37 = &v31[v35];
      uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v63 + 48);
      swift_bridgeObjectRetain();
      if (v38(v37, 1, v72))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
        memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        v68(v36, v37, v72);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v63 + 56))(v36, 0, 1, v72);
      }
      uint64_t v40 = type metadata accessor for UsageHeaderView.Model(0);
      uint64_t v62 = v33;
      v33(&v30[*(int *)(v40 + 20)], &v31[*(int *)(v40 + 20)], v71);
      uint64_t v41 = *(int *)(v67 + 24);
      uint64_t v20 = v65;
      uint64_t v42 = &v65[v41];
      uint64_t v43 = &v21[v41];
      *(void *)&v65[v41] = *(void *)&v21[v41];
      uint64_t v44 = type metadata accessor for ActivityNavigationState(0);
      uint64_t v45 = *(int *)(v44 + 20);
      uint64_t v46 = &v42[v45];
      uint64_t v47 = &v43[v45];
      v68(&v42[v45], &v43[v45], v72);
      uint64_t v48 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
      uint64_t v49 = &v46[v48];
      uint64_t v50 = &v47[v48];
      uint64_t v51 = sub_2189CD3A8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
      v62(&v42[*(int *)(v44 + 24)], &v43[*(int *)(v44 + 24)], v71);
      v62(&v65[*(int *)(v67 + 28)], &v21[*(int *)(v67 + 28)], v71);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v65, 0, 1, v67);
      uint64_t v6 = v64;
    }
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
    *(void *)&v20[*(int *)(v52 + 28)] = *(void *)&v21[*(int *)(v52 + 28)];
    uint64_t v53 = v6[9];
    uint64_t v54 = (char *)a1 + v53;
    uint64_t v55 = (char *)a2 + v53;
    uint64_t v56 = sub_2189CD528();
    uint64_t v57 = *(void *)(v56 - 8);
    uint64_t v58 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48);
    swift_retain();
    if (v58(v55, 1, v56))
    {
      uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v54, v55, *(void *)(*(void *)(v59 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v54, v55, v56);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(v54, 0, 1, v56);
    }
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
    *(void *)&v54[*(int *)(v60 + 28)] = *(void *)&v55[*(int *)(v60 + 28)];
  }
  swift_retain();
  return a1;
}

uint64_t destroy for SummaryView(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_2189CDD98();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  uint64_t v5 = a1 + a2[8];
  uint64_t v6 = (int *)type metadata accessor for SummaryView.Model(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v6 - 1) + 48))(v5, 1, v6))
  {
    uint64_t v7 = sub_2189CD528();
    uint64_t v26 = *(void *)(v7 - 8);
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v28(v5, v7);
    uint64_t v8 = type metadata accessor for OverviewChart.Model(0);
    swift_bridgeObjectRelease();
    uint64_t v9 = v5 + *(int *)(v8 + 24);
    uint64_t v10 = sub_2189CD6B8();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    v11(v9, v10);
    swift_release();
    uint64_t v12 = v5 + v6[5];
    uint64_t v27 = v11;
    v11(v12, v10);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    swift_bridgeObjectRelease();
    uint64_t v14 = v12 + *(int *)(v13 + 44);
    uint64_t v15 = v7;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v14, 1, v7)) {
      v28(v14, v7);
    }
    uint64_t v16 = type metadata accessor for UsageHeaderView.Model(0);
    v27(v12 + *(int *)(v16 + 20), v10);
    uint64_t v17 = v5 + v6[6];
    uint64_t v18 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v19 = v17 + *(int *)(v18 + 20);
    v28(v19, v15);
    uint64_t v20 = v19 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v21 = sub_2189CD3A8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
    v27(v17 + *(int *)(v18 + 24), v10);
    v27(v5 + v6[7], v10);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  swift_release();
  uint64_t v22 = a1 + a2[9];
  uint64_t v23 = sub_2189CD528();
  uint64_t v24 = *(void *)(v23 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23)) {
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);

  return swift_release();
}

void *initializeWithCopy for SummaryView(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_2189CDD98();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  *uint64_t v9 = *v10;
  *((void *)v9 + 1) = *((void *)v10 + 1);
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  long long v14 = *(_OWORD *)((char *)a2 + v11 + 24);
  *(_OWORD *)((char *)a1 + v11 + 24) = v14;
  uint64_t v15 = v14;
  uint64_t v16 = **(void (***)(char *, char *, uint64_t))(v14 - 8);
  swift_retain();
  swift_retain();
  v16(v12, v13, v15);
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = type metadata accessor for SummaryView.Model(0);
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
    memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    uint64_t v62 = a2;
    uint64_t v63 = a1;
    uint64_t v65 = v21;
    uint64_t v66 = a3;
    uint64_t v68 = sub_2189CD528();
    uint64_t v61 = *(void *)(v68 - 8);
    uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
    v67(v18, v19, v68);
    uint64_t v23 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(void *)&v18[v23[5]] = *(void *)&v19[v23[5]];
    uint64_t v24 = v23[6];
    uint64_t v25 = &v18[v24];
    uint64_t v26 = &v19[v24];
    uint64_t v27 = sub_2189CD6B8();
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
    swift_bridgeObjectRetain();
    v28(v25, v26, v27);
    *(void *)&v18[v23[7]] = *(void *)&v19[v23[7]];
    v18[v23[8]] = v19[v23[8]];
    uint64_t v64 = v20;
    uint64_t v29 = *(int *)(v20 + 20);
    uint64_t v30 = &v18[v29];
    uint64_t v31 = &v19[v29];
    swift_retain();
    uint64_t v32 = v27;
    v28(v30, v31, v27);
    uint64_t v33 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)&v30[v33[9]] = *(void *)&v31[v33[9]];
    v30[v33[10]] = v31[v33[10]];
    uint64_t v34 = v33[11];
    uint64_t v35 = &v30[v34];
    uint64_t v36 = &v31[v34];
    uint64_t v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
    swift_bridgeObjectRetain();
    if (v37(v36, 1, v68))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      v67(v35, v36, v68);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v61 + 56))(v35, 0, 1, v68);
    }
    uint64_t v39 = type metadata accessor for UsageHeaderView.Model(0);
    v28(&v30[*(int *)(v39 + 20)], &v31[*(int *)(v39 + 20)], v32);
    uint64_t v40 = *(int *)(v64 + 24);
    uint64_t v41 = &v18[v40];
    uint64_t v42 = &v19[v40];
    *(void *)&v18[v40] = *(void *)&v19[v40];
    uint64_t v43 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v44 = *(int *)(v43 + 20);
    uint64_t v45 = &v41[v44];
    uint64_t v46 = &v42[v44];
    v67(&v41[v44], &v42[v44], v68);
    uint64_t v47 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v48 = &v45[v47];
    uint64_t v49 = &v46[v47];
    uint64_t v50 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
    v28(&v41[*(int *)(v43 + 24)], &v42[*(int *)(v43 + 24)], v32);
    v28(&v18[*(int *)(v64 + 28)], &v19[*(int *)(v64 + 28)], v32);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v65 + 56))(v18, 0, 1, v64);
    a3 = v66;
    a1 = v63;
    a2 = v62;
  }
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  *(void *)&v18[*(int *)(v51 + 28)] = *(void *)&v19[*(int *)(v51 + 28)];
  uint64_t v52 = a3[9];
  uint64_t v53 = (char *)a1 + v52;
  uint64_t v54 = (char *)a2 + v52;
  uint64_t v55 = sub_2189CD528();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48);
  swift_retain();
  if (v57(v54, 1, v55))
  {
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v53, v54, *(void *)(*(void *)(v58 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v53, v54, v55);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, v55);
  }
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
  *(void *)&v53[*(int *)(v59 + 28)] = *(void *)&v54[*(int *)(v59 + 28)];
  swift_retain();
  return a1;
}

void *assignWithCopy for SummaryView(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a2;
  if (a1 != a2)
  {
    sub_218900AE4((uint64_t)a1, &qword_267BE36E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2189CDD98();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, v4, v6);
    }
    else
    {
      *a1 = *v4;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)v4 + v7;
  *uint64_t v8 = *v9;
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)v4 + a3[6]);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((void *)((char *)a1 + a3[7]), (void *)((char *)v4 + a3[7]));
  uint64_t v10 = a3[8];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)v4 + v10;
  uint64_t v13 = type metadata accessor for SummaryView.Model(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (v17)
    {
      sub_2189CC460((uint64_t)v11, type metadata accessor for SummaryView.Model);
      goto LABEL_12;
    }
    uint64_t v99 = a3;
    uint64_t v102 = v13;
    uint64_t v97 = sub_2189CD528();
    uint64_t v92 = *(void *)(v97 - 8);
    uint64_t v91 = *(void (**)(char *, char *, uint64_t))(v92 + 24);
    v91(v11, v12, v97);
    uint64_t v33 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(void *)&v11[v33[5]] = *(void *)&v12[v33[5]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v34 = v33[6];
    uint64_t v35 = &v11[v34];
    uint64_t v36 = &v12[v34];
    uint64_t v37 = sub_2189CD6B8();
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 24);
    v38(v35, v36, v37);
    *(void *)&v11[v33[7]] = *(void *)&v12[v33[7]];
    swift_retain();
    swift_release();
    v11[v33[8]] = v12[v33[8]];
    uint64_t v39 = *(int *)(v13 + 20);
    uint64_t v40 = &v11[v39];
    uint64_t v41 = &v12[v39];
    int v94 = v38;
    uint64_t v96 = v37;
    v38(&v11[v39], &v12[v39], v37);
    uint64_t v42 = v41;
    uint64_t v43 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)&v40[v43[9]] = *(void *)&v42[v43[9]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v40[v43[10]] = v42[v43[10]];
    uint64_t v44 = v43[11];
    uint64_t v87 = &v40[v44];
    uint64_t v45 = &v42[v44];
    uint64_t v46 = *(uint64_t (**)(void))(v92 + 48);
    LODWORD(v35) = v46();
    int v47 = ((uint64_t (*)(char *, uint64_t, uint64_t))v46)(v45, 1, v97);
    if (v35)
    {
      if (!v47)
      {
        (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v87, v45, v97);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v92 + 56))(v87, 0, 1, v97);
        goto LABEL_23;
      }
      size_t v48 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0) - 8) + 64);
      uint64_t v49 = v87;
    }
    else
    {
      if (!v47)
      {
        v91(v87, v45, v97);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v92 + 8))(v87, v97);
      size_t v48 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0) - 8) + 64);
      uint64_t v49 = v87;
    }
    memcpy(v49, v45, v48);
LABEL_23:
    uint64_t v62 = type metadata accessor for UsageHeaderView.Model(0);
    v38(&v40[*(int *)(v62 + 20)], &v42[*(int *)(v62 + 20)], v96);
    uint64_t v63 = *(int *)(v102 + 24);
    uint64_t v64 = &v11[v63];
    uint64_t v65 = &v12[v63];
    *(void *)&v11[v63] = *(void *)&v12[v63];
    uint64_t v66 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v67 = *(int *)(v66 + 20);
    uint64_t v68 = &v64[v67];
    uint64_t v69 = &v65[v67];
    v91(&v64[v67], &v65[v67], v97);
    uint64_t v70 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v71 = &v68[v70];
    uint64_t v72 = &v69[v70];
    uint64_t v73 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 24))(v71, v72, v73);
    v94(&v64[*(int *)(v66 + 24)], &v65[*(int *)(v66 + 24)], v96);
    v94(&v11[*(int *)(v102 + 28)], &v12[*(int *)(v102 + 28)], v96);
    a3 = v99;
    goto LABEL_24;
  }
  if (v17)
  {
LABEL_12:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
    memcpy(v11, v12, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_24;
  }
  uint64_t v88 = v4;
  uint64_t v90 = v14;
  char v98 = a3;
  uint64_t v95 = sub_2189CD528();
  __src = *(void **)(v95 - 8);
  uint64_t v93 = (void (*)(char *, char *, uint64_t))__src[2];
  v93(v11, v12, v95);
  uint64_t v18 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)&v11[v18[5]] = *(void *)&v12[v18[5]];
  uint64_t v19 = v18[6];
  uint64_t v100 = &v11[v19];
  uint64_t v20 = &v12[v19];
  uint64_t v21 = sub_2189CD6B8();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  v22(v100, v20, v21);
  *(void *)&v11[v18[7]] = *(void *)&v12[v18[7]];
  v11[v18[8]] = v12[v18[8]];
  uint64_t v101 = v13;
  uint64_t v23 = *(int *)(v13 + 20);
  uint64_t v24 = &v11[v23];
  uint64_t v25 = &v12[v23];
  swift_retain();
  uint64_t v89 = v22;
  v22(v24, v25, v21);
  uint64_t v26 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)&v24[v26[9]] = *(void *)&v25[v26[9]];
  v24[v26[10]] = v25[v26[10]];
  uint64_t v27 = v26[11];
  uint64_t v28 = &v24[v27];
  uint64_t v29 = &v25[v27];
  uint64_t v30 = (unsigned int (*)(char *, uint64_t, uint64_t))__src[6];
  swift_bridgeObjectRetain();
  if (v30(v29, 1, v95))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v28, v29, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    v93(v28, v29, v95);
    ((void (*)(char *, void, uint64_t, uint64_t))__src[7])(v28, 0, 1, v95);
  }
  uint64_t v50 = type metadata accessor for UsageHeaderView.Model(0);
  v89(&v24[*(int *)(v50 + 20)], &v25[*(int *)(v50 + 20)], v21);
  uint64_t v51 = *(int *)(v101 + 24);
  uint64_t v52 = &v11[v51];
  uint64_t v53 = &v12[v51];
  *(void *)&v11[v51] = *(void *)&v12[v51];
  uint64_t v54 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v55 = *(int *)(v54 + 20);
  uint64_t v56 = &v52[v55];
  uint64_t v57 = &v53[v55];
  v93(&v52[v55], &v53[v55], v95);
  uint64_t v58 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v59 = &v56[v58];
  uint64_t v60 = &v57[v58];
  uint64_t v61 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
  v89(&v52[*(int *)(v54 + 24)], &v53[*(int *)(v54 + 24)], v21);
  v89(&v11[*(int *)(v101 + 28)], &v12[*(int *)(v101 + 28)], v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v90 + 56))(v11, 0, 1, v101);
  a3 = v98;
  uint64_t v4 = v88;
LABEL_24:
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  *(void *)&v11[*(int *)(v74 + 28)] = *(void *)&v12[*(int *)(v74 + 28)];
  swift_retain();
  swift_release();
  uint64_t v75 = a3[9];
  uint64_t v76 = (char *)a1 + v75;
  uint64_t v77 = (char *)v4 + v75;
  uint64_t v78 = sub_2189CD528();
  uint64_t v79 = *(void *)(v78 - 8);
  uint64_t v80 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v79 + 48);
  int v81 = v80(v76, 1, v78);
  int v82 = v80(v77, 1, v78);
  if (!v81)
  {
    if (!v82)
    {
      (*(void (**)(char *, char *, uint64_t))(v79 + 24))(v76, v77, v78);
      goto LABEL_30;
    }
    (*(void (**)(char *, uint64_t))(v79 + 8))(v76, v78);
    goto LABEL_29;
  }
  if (v82)
  {
LABEL_29:
    uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v76, v77, *(void *)(*(void *)(v83 - 8) + 64));
    goto LABEL_30;
  }
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v76, v77, v78);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v79 + 56))(v76, 0, 1, v78);
LABEL_30:
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
  *(void *)&v76[*(int *)(v84 + 28)] = *(void *)&v77[*(int *)(v84 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for SummaryView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2189CDD98();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = a3[8];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  long long v13 = *(_OWORD *)v12;
  long long v14 = *((_OWORD *)v12 + 1);
  *((void *)v11 + 4) = *((void *)v12 + 4);
  *(_OWORD *)uint64_t v11 = v13;
  *((_OWORD *)v11 + 1) = v14;
  uint64_t v15 = &a1[v10];
  int v16 = &a2[v10];
  uint64_t v17 = type metadata accessor for SummaryView.Model(0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    uint64_t v56 = v18;
    uint64_t v61 = sub_2189CD528();
    uint64_t v54 = *(void *)(v61 - 8);
    uint64_t v58 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
    v58(v15, v16, v61);
    uint64_t v20 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(void *)&v15[v20[5]] = *(void *)&v16[v20[5]];
    uint64_t v21 = v20[6];
    uint64_t v60 = &v15[v21];
    uint64_t v22 = &v16[v21];
    uint64_t v23 = sub_2189CD6B8();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32);
    v24(v60, v22, v23);
    *(void *)&v15[v20[7]] = *(void *)&v16[v20[7]];
    v15[v20[8]] = v16[v20[8]];
    uint64_t v55 = v17;
    uint64_t v25 = *(int *)(v17 + 20);
    uint64_t v26 = &v15[v25];
    uint64_t v27 = &v16[v25];
    uint64_t v59 = v24;
    v24(&v15[v25], &v16[v25], v23);
    uint64_t v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)&v26[v28[9]] = *(void *)&v27[v28[9]];
    v26[v28[10]] = v27[v28[10]];
    uint64_t v29 = v28[11];
    uint64_t v30 = &v26[v29];
    uint64_t v31 = &v27[v29];
    uint64_t v57 = a3;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(&v27[v29], 1, v61))
    {
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      v58(v30, v31, v61);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v30, 0, 1, v61);
    }
    uint64_t v33 = type metadata accessor for UsageHeaderView.Model(0);
    v59(&v26[*(int *)(v33 + 20)], &v27[*(int *)(v33 + 20)], v23);
    uint64_t v34 = *(int *)(v55 + 24);
    uint64_t v35 = &v15[v34];
    uint64_t v36 = &v16[v34];
    *(void *)&v15[v34] = *(void *)&v16[v34];
    uint64_t v37 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v38 = *(int *)(v37 + 20);
    uint64_t v39 = &v35[v38];
    uint64_t v40 = &v36[v38];
    v58(&v35[v38], &v36[v38], v61);
    uint64_t v41 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v42 = &v39[v41];
    uint64_t v43 = &v40[v41];
    uint64_t v44 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(v42, v43, v44);
    v59(&v35[*(int *)(v37 + 24)], &v36[*(int *)(v37 + 24)], v23);
    v59(&v15[*(int *)(v55 + 28)], &v16[*(int *)(v55 + 28)], v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v15, 0, 1, v55);
    a3 = v57;
  }
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  *(void *)&v15[*(int *)(v45 + 28)] = *(void *)&v16[*(int *)(v45 + 28)];
  uint64_t v46 = a3[9];
  int v47 = &a1[v46];
  size_t v48 = &a2[v46];
  uint64_t v49 = sub_2189CD528();
  uint64_t v50 = *(void *)(v49 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49))
  {
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v47, v48, *(void *)(*(void *)(v51 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v47, v48, v49);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
  }
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
  *(void *)&v47[*(int *)(v52 + 28)] = *(void *)&v48[*(int *)(v52 + 28)];
  return a1;
}

char *assignWithTake for SummaryView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_218900AE4((uint64_t)a1, &qword_267BE36E0);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_2189CDD98();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
    }
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  *uint64_t v8 = *v9;
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_release();
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_release();
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[v10]);
  long long v13 = *((_OWORD *)v12 + 1);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *((_OWORD *)v11 + 1) = v13;
  *((void *)v11 + 4) = *((void *)v12 + 4);
  uint64_t v14 = a3[8];
  uint64_t v15 = &a1[v14];
  int v16 = &a2[v14];
  uint64_t v17 = type metadata accessor for SummaryView.Model(0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v11) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!v11)
  {
    if (v20)
    {
      sub_2189CC460((uint64_t)v15, type metadata accessor for SummaryView.Model);
      goto LABEL_11;
    }
    uint64_t v95 = sub_2189CD528();
    uint64_t v89 = *(void *)(v95 - 8);
    uint64_t v93 = *(void (**)(char *, char *, uint64_t))(v89 + 40);
    v93(v15, v16, v95);
    uint64_t v36 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(void *)&v15[v36[5]] = *(void *)&v16[v36[5]];
    swift_bridgeObjectRelease();
    uint64_t v37 = v36[6];
    uint64_t v38 = &v15[v37];
    uint64_t v99 = &v16[v37];
    uint64_t v39 = sub_2189CD6B8();
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 40);
    v40(v38, v99, v39);
    *(void *)&v15[v36[7]] = *(void *)&v16[v36[7]];
    swift_release();
    v15[v36[8]] = v16[v36[8]];
    uint64_t v97 = v40;
    uint64_t v100 = v17;
    uint64_t v41 = *(int *)(v17 + 20);
    uint64_t v42 = &v15[v41];
    uint64_t v43 = &v16[v41];
    uint64_t v91 = v39;
    v40(&v15[v41], &v16[v41], v39);
    uint64_t v44 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)&v42[v44[9]] = *(void *)&v43[v44[9]];
    swift_bridgeObjectRelease();
    v42[v44[10]] = v43[v44[10]];
    uint64_t v45 = v44[11];
    uint64_t v46 = &v43[v45];
    int v47 = *(uint64_t (**)(void))(v89 + 48);
    uint64_t v87 = &v42[v45];
    LODWORD(v44) = v47();
    int v48 = ((uint64_t (*)(char *, uint64_t, uint64_t))v47)(v46, 1, v95);
    if (v44)
    {
      if (!v48)
      {
        (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v87, v46, v95);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v89 + 56))(v87, 0, 1, v95);
        goto LABEL_22;
      }
      size_t v49 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0) - 8) + 64);
      uint64_t v50 = v87;
    }
    else
    {
      if (!v48)
      {
        v93(v87, v46, v95);
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v89 + 8))(v87, v95);
      size_t v49 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0) - 8) + 64);
      uint64_t v50 = v87;
    }
    memcpy(v50, v46, v49);
LABEL_22:
    uint64_t v63 = type metadata accessor for UsageHeaderView.Model(0);
    v40(&v42[*(int *)(v63 + 20)], &v43[*(int *)(v63 + 20)], v91);
    uint64_t v64 = *(int *)(v100 + 24);
    uint64_t v65 = &v15[v64];
    uint64_t v66 = &v16[v64];
    *(void *)&v15[v64] = *(void *)&v16[v64];
    uint64_t v67 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v68 = *(int *)(v67 + 20);
    uint64_t v69 = &v65[v68];
    uint64_t v70 = &v66[v68];
    v93(&v65[v68], &v66[v68], v95);
    uint64_t v71 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v72 = &v69[v71];
    uint64_t v73 = &v70[v71];
    uint64_t v74 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 40))(v72, v73, v74);
    v97(&v65[*(int *)(v67 + 24)], &v66[*(int *)(v67 + 24)], v91);
    v97(&v15[*(int *)(v100 + 28)], &v16[*(int *)(v100 + 28)], v91);
    goto LABEL_23;
  }
  if (v20)
  {
LABEL_11:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36D8);
    memcpy(v15, v16, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_23;
  }
  uint64_t v90 = v18;
  uint64_t v94 = sub_2189CD528();
  uint64_t v88 = *(void *)(v94 - 8);
  uint64_t v92 = *(void (**)(char *, char *, uint64_t))(v88 + 32);
  v92(v15, v16, v94);
  uint64_t v21 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)&v15[v21[5]] = *(void *)&v16[v21[5]];
  uint64_t v22 = v21[6];
  uint64_t v23 = &v15[v22];
  uint64_t v24 = &v16[v22];
  uint64_t v25 = sub_2189CD6B8();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32);
  v26(v23, v24, v25);
  *(void *)&v15[v21[7]] = *(void *)&v16[v21[7]];
  v15[v21[8]] = v16[v21[8]];
  uint64_t v98 = v17;
  uint64_t v27 = *(int *)(v17 + 20);
  uint64_t v28 = &v15[v27];
  uint64_t v29 = &v16[v27];
  uint64_t v96 = v26;
  v26(&v15[v27], &v16[v27], v25);
  uint64_t v30 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)&v28[v30[9]] = *(void *)&v29[v30[9]];
  v28[v30[10]] = v29[v30[10]];
  uint64_t v31 = v30[11];
  uint64_t v32 = &v28[v31];
  uint64_t v33 = &v29[v31];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v88 + 48))(&v29[v31], 1, v94))
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    v92(v32, v33, v94);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v88 + 56))(v32, 0, 1, v94);
  }
  uint64_t v51 = type metadata accessor for UsageHeaderView.Model(0);
  v26(&v28[*(int *)(v51 + 20)], &v29[*(int *)(v51 + 20)], v25);
  uint64_t v52 = *(int *)(v98 + 24);
  uint64_t v53 = &v15[v52];
  uint64_t v54 = &v16[v52];
  *(void *)&v15[v52] = *(void *)&v16[v52];
  uint64_t v55 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v56 = *(int *)(v55 + 20);
  uint64_t v57 = &v53[v56];
  uint64_t v58 = &v54[v56];
  v92(&v53[v56], &v54[v56], v94);
  uint64_t v59 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v60 = &v57[v59];
  uint64_t v61 = &v58[v59];
  uint64_t v62 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32))(v60, v61, v62);
  v96(&v53[*(int *)(v55 + 24)], &v54[*(int *)(v55 + 24)], v25);
  v96(&v15[*(int *)(v98 + 28)], &v16[*(int *)(v98 + 28)], v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v90 + 56))(v15, 0, 1, v98);
LABEL_23:
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  *(void *)&v15[*(int *)(v75 + 28)] = *(void *)&v16[*(int *)(v75 + 28)];
  swift_release();
  uint64_t v76 = a3[9];
  uint64_t v77 = &a1[v76];
  uint64_t v78 = &a2[v76];
  uint64_t v79 = sub_2189CD528();
  uint64_t v80 = *(void *)(v79 - 8);
  int v81 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v80 + 48);
  int v82 = v81(v77, 1, v79);
  int v83 = v81(v78, 1, v79);
  if (!v82)
  {
    if (!v83)
    {
      (*(void (**)(char *, char *, uint64_t))(v80 + 40))(v77, v78, v79);
      goto LABEL_29;
    }
    (*(void (**)(char *, uint64_t))(v80 + 8))(v77, v79);
    goto LABEL_28;
  }
  if (v83)
  {
LABEL_28:
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v77, v78, *(void *)(*(void *)(v84 - 8) + 64));
    goto LABEL_29;
  }
  (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v77, v78, v79);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v80 + 56))(v77, 0, 1, v79);
LABEL_29:
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
  *(void *)&v77[*(int *)(v85 + 28)] = *(void *)&v78[*(int *)(v85 + 28)];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SummaryView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189C9DA4);
}

uint64_t sub_2189C9DA4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3728);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[6]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[8];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
    int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[9];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for SummaryView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189C9F44);
}

uint64_t sub_2189C9F44(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3728);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3710);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[8];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1BD0);
  int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[9];

  return v16(v18, a2, a2, v17);
}

void sub_2189CA0D0()
{
  sub_2189CA23C();
  if (v0 <= 0x3F)
  {
    sub_2189CBDD8(319, &qword_267BE3748, &qword_267BE36D8, MEMORY[0x263F1B5D0]);
    if (v1 <= 0x3F)
    {
      sub_2189CBDD8(319, &qword_267BE1C68, &qword_267BE1AE0, MEMORY[0x263F1B5D0]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_2189CA23C()
{
  if (!qword_267BE3740)
  {
    sub_2189CDD98();
    unint64_t v0 = sub_2189CDDD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267BE3740);
    }
  }
}

char *initializeBufferWithCopyOfBuffer for SummaryView.Model(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v36 = sub_2189CD528();
    uint64_t v37 = *(void *)(v36 - 8);
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
    v39(a1, a2, v36);
    uint64_t v7 = (int *)type metadata accessor for OverviewChart.Model(0);
    *(void *)&a1[v7[5]] = *(void *)&a2[v7[5]];
    uint64_t v8 = v7[6];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = sub_2189CD6B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
    a1[v7[8]] = a2[v7[8]];
    uint64_t v38 = a3;
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    swift_retain();
    v12(v14, v15, v11);
    int v16 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
    *(void *)&v14[v16[9]] = *(void *)&v15[v16[9]];
    v14[v16[10]] = v15[v16[10]];
    uint64_t v17 = v16[11];
    uint64_t v18 = &v14[v17];
    uint64_t v19 = &v15[v17];
    int v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
    swift_bridgeObjectRetain();
    if (v20(v19, 1, v36))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      v39(v18, v19, v36);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v18, 0, 1, v36);
    }
    uint64_t v23 = type metadata accessor for UsageHeaderView.Model(0);
    v12(&v14[*(int *)(v23 + 20)], &v15[*(int *)(v23 + 20)], v11);
    uint64_t v24 = *(int *)(a3 + 24);
    uint64_t v25 = &a1[v24];
    uint64_t v26 = &a2[v24];
    *(void *)&a1[v24] = *(void *)&a2[v24];
    uint64_t v27 = type metadata accessor for ActivityNavigationState(0);
    uint64_t v28 = *(int *)(v27 + 20);
    uint64_t v29 = &v25[v28];
    uint64_t v30 = &v26[v28];
    v39(&v25[v28], &v26[v28], v36);
    uint64_t v31 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
    uint64_t v32 = &v29[v31];
    uint64_t v33 = &v30[v31];
    uint64_t v34 = sub_2189CD3A8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
    v12(&v25[*(int *)(v27 + 24)], &v26[*(int *)(v27 + 24)], v11);
    v12(&a1[*(int *)(v38 + 28)], &a2[*(int *)(v38 + 28)], v11);
  }
  return a1;
}

uint64_t destroy for SummaryView.Model(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2189CD528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  uint64_t v7 = type metadata accessor for OverviewChart.Model(0);
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(v7 + 24);
  uint64_t v9 = sub_2189CD6B8();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v21)((void *)(v9 - 8), v8, v9);
  swift_release();
  uint64_t v10 = a1 + a2[5];
  v21(v10, v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  swift_bridgeObjectRelease();
  uint64_t v12 = v10 + *(int *)(v11 + 44);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4)) {
    v6(v12, v4);
  }
  uint64_t v13 = type metadata accessor for UsageHeaderView.Model(0);
  v21(v10 + *(int *)(v13 + 20), v9);
  uint64_t v14 = a1 + a2[6];
  uint64_t v15 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v16 = v14 + *(int *)(v15 + 20);
  v6(v16, v4);
  uint64_t v17 = v16 + *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v18 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  v21(v14 + *(int *)(v15 + 24), v9);
  uint64_t v19 = a1 + a2[7];

  return ((uint64_t (*)(uint64_t, uint64_t))v21)(v19, v9);
}

char *initializeWithCopy for SummaryView.Model(char *a1, char *a2, int *a3)
{
  uint64_t v5 = sub_2189CD528();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v36 = *(void (**)(void *, const void *, uint64_t))(v34 + 16);
  v36(a1, a2, v5);
  uint64_t v6 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)&a1[v6[5]] = *(void *)&a2[v6[5]];
  uint64_t v7 = v6[6];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2189CD6B8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(void *)&a1[v6[7]] = *(void *)&a2[v6[7]];
  a1[v6[8]] = a2[v6[8]];
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v35 = a2;
  uint64_t v14 = &a2[v12];
  swift_retain();
  uint64_t v37 = v11;
  v11(v13, v14, v10);
  uint64_t v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)&v13[v15[9]] = *(void *)&v14[v15[9]];
  v13[v15[10]] = v14[v15[10]];
  uint64_t v16 = v15[11];
  uint64_t v17 = &v13[v16];
  uint64_t v18 = &v14[v16];
  uint64_t v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v34 + 48);
  swift_bridgeObjectRetain();
  if (v19(v18, 1, v5))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    v36(v17, v18, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v17, 0, 1, v5);
  }
  uint64_t v21 = type metadata accessor for UsageHeaderView.Model(0);
  v11(&v13[*(int *)(v21 + 20)], &v14[*(int *)(v21 + 20)], v10);
  uint64_t v22 = a3[6];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &v35[v22];
  *(void *)&a1[v22] = *(void *)&v35[v22];
  uint64_t v25 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v26 = *(int *)(v25 + 20);
  uint64_t v27 = &v23[v26];
  uint64_t v28 = &v24[v26];
  v36(&v23[v26], &v24[v26], v5);
  uint64_t v29 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v30 = &v27[v29];
  uint64_t v31 = &v28[v29];
  uint64_t v32 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
  v37(&v23[*(int *)(v25 + 24)], &v24[*(int *)(v25 + 24)], v10);
  v37(&a1[a3[7]], &v35[a3[7]], v10);
  return a1;
}

uint64_t assignWithCopy for SummaryView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 24);
  v41(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = v7[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD6B8();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24);
  v12(v9, v10, v11);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v40 = a1;
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  v12(a1 + v13, a2 + v13, v11);
  uint64_t v16 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(v14 + v16[9]) = *(void *)(v15 + v16[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v14 + v16[10]) = *(unsigned char *)(v15 + v16[10]);
  uint64_t v17 = v16[11];
  uint64_t v18 = (void *)(v14 + v17);
  uint64_t v19 = (const void *)(v15 + v17);
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
  int v21 = v20(v14 + v17, 1, v6);
  int v22 = v20((uint64_t)v19, 1, v6);
  if (v21)
  {
    if (v22)
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
      uint64_t v24 = v6;
    }
    else
    {
      uint64_t v24 = v6;
      (*(void (**)(void *, const void *, uint64_t))(v39 + 16))(v18, v19, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v39 + 56))(v18, 0, 1, v6);
    }
  }
  else
  {
    uint64_t v24 = v6;
    if (v22)
    {
      (*(void (**)(void *, uint64_t))(v39 + 8))(v18, v6);
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      v41((uint64_t)v18, (uint64_t)v19, v6);
    }
  }
  uint64_t v26 = type metadata accessor for UsageHeaderView.Model(0);
  v12(v14 + *(int *)(v26 + 20), v15 + *(int *)(v26 + 20), v11);
  uint64_t v27 = *(int *)(a3 + 24);
  uint64_t v28 = v40 + v27;
  uint64_t v29 = v42 + v27;
  *(void *)(v40 + v27) = *(void *)(v42 + v27);
  uint64_t v30 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v31 = *(int *)(v30 + 20);
  uint64_t v32 = v28 + v31;
  uint64_t v33 = v29 + v31;
  v41(v28 + v31, v29 + v31, v24);
  uint64_t v34 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v35 = v32 + v34;
  uint64_t v36 = v33 + v34;
  uint64_t v37 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
  v12(v28 + *(int *)(v30 + 24), v29 + *(int *)(v30 + 24), v11);
  v12(v40 + *(int *)(v43 + 28), v42 + *(int *)(v43 + 28), v11);
  return v40;
}

char *initializeWithTake for SummaryView.Model(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = *(void (**)(void *, const void *, uint64_t))(v34 + 32);
  v35(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)&a1[v7[5]] = *(void *)&a2[v7[5]];
  uint64_t v8 = v7[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_2189CD6B8();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
  a1[v7[8]] = a2[v7[8]];
  uint64_t v36 = a3;
  uint64_t v37 = a2;
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  v12(&a1[v13], &a2[v13], v11);
  uint64_t v16 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)&v14[v16[9]] = *(void *)&v15[v16[9]];
  v14[v16[10]] = v15[v16[10]];
  uint64_t v17 = v16[11];
  uint64_t v18 = &v14[v17];
  uint64_t v19 = &v15[v17];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(&v15[v17], 1, v6))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    v35(v18, v19, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v18, 0, 1, v6);
  }
  uint64_t v21 = type metadata accessor for UsageHeaderView.Model(0);
  v12(&v14[*(int *)(v21 + 20)], &v15[*(int *)(v21 + 20)], v11);
  uint64_t v22 = *(int *)(a3 + 24);
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &v37[v22];
  *(void *)&a1[v22] = *(void *)&v37[v22];
  uint64_t v25 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v26 = *(int *)(v25 + 20);
  uint64_t v27 = &v23[v26];
  uint64_t v28 = &v24[v26];
  v35(&v23[v26], &v24[v26], v6);
  uint64_t v29 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v30 = &v27[v29];
  uint64_t v31 = &v28[v29];
  uint64_t v32 = sub_2189CD3A8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  v12(&v23[*(int *)(v25 + 24)], &v24[*(int *)(v25 + 24)], v11);
  v12(&a1[*(int *)(v36 + 28)], &v37[*(int *)(v36 + 28)], v11);
  return a1;
}

uint64_t assignWithTake for SummaryView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2189CD528();
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 40);
  v41(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for OverviewChart.Model(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  swift_bridgeObjectRelease();
  uint64_t v8 = v7[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2189CD6B8();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  swift_release();
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v40 = v11;
  v12(a1 + v13, a2 + v13, v11);
  uint64_t v16 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1F50);
  *(void *)(v14 + v16[9]) = *(void *)(v15 + v16[9]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(v14 + v16[10]) = *(unsigned char *)(v15 + v16[10]);
  uint64_t v17 = v16[11];
  uint64_t v18 = (void *)(v14 + v17);
  uint64_t v19 = (const void *)(v15 + v17);
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
  int v21 = v20(v14 + v17, 1, v6);
  int v22 = v20((uint64_t)v19, 1, v6);
  if (v21)
  {
    if (v22)
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
      uint64_t v24 = v6;
    }
    else
    {
      uint64_t v24 = v6;
      (*(void (**)(void *, const void *, uint64_t))(v39 + 32))(v18, v19, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v39 + 56))(v18, 0, 1, v6);
    }
  }
  else
  {
    uint64_t v24 = v6;
    if (v22)
    {
      (*(void (**)(void *, uint64_t))(v39 + 8))(v18, v6);
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
      memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      v41((uint64_t)v18, (uint64_t)v19, v6);
    }
  }
  uint64_t v26 = type metadata accessor for UsageHeaderView.Model(0);
  v12(v14 + *(int *)(v26 + 20), v15 + *(int *)(v26 + 20), v40);
  uint64_t v27 = *(int *)(a3 + 24);
  uint64_t v28 = a1 + v27;
  uint64_t v29 = v42 + v27;
  *(void *)(a1 + v27) = *(void *)(v42 + v27);
  uint64_t v30 = type metadata accessor for ActivityNavigationState(0);
  uint64_t v31 = *(int *)(v30 + 20);
  uint64_t v32 = v28 + v31;
  uint64_t v33 = v29 + v31;
  v41(v28 + v31, v29 + v31, v24);
  uint64_t v34 = *(int *)(type metadata accessor for ActivityNavigationState.DateAndBounds(0) + 20);
  uint64_t v35 = v32 + v34;
  uint64_t v36 = v33 + v34;
  uint64_t v37 = sub_2189CD3A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 40))(v35, v36, v37);
  v12(v28 + *(int *)(v30 + 24), v29 + *(int *)(v30 + 24), v40);
  v12(a1 + *(int *)(v43 + 28), v42 + *(int *)(v43 + 28), v40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SummaryView.Model(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189CB768);
}

uint64_t sub_2189CB768(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for OverviewChart.Model(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for UsageHeaderView.Model(0);
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
  uint64_t v14 = type metadata accessor for ActivityNavigationState(0);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  uint64_t v16 = sub_2189CD6B8();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + a3[7];

  return v17(v19, a2, v18);
}

uint64_t storeEnumTagSinglePayload for SummaryView.Model(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189CB914);
}

uint64_t sub_2189CB914(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for OverviewChart.Model(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = type metadata accessor for UsageHeaderView.Model(0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  uint64_t v16 = type metadata accessor for ActivityNavigationState(0);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[6];
    goto LABEL_7;
  }
  uint64_t v18 = sub_2189CD6B8();
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[7];

  return v19(v21, a2, a2, v20);
}

uint64_t sub_2189CBAB8()
{
  uint64_t result = type metadata accessor for OverviewChart.Model(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for UsageHeaderView.Model(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for ActivityNavigationState(319);
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_2189CD6B8();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2189CBBF8()
{
  return type metadata accessor for SummaryView.Bridge(0);
}

uint64_t type metadata accessor for SummaryView.Bridge(uint64_t a1)
{
  return sub_218904498(a1, (uint64_t *)&unk_267BE3760);
}

void sub_2189CBC20()
{
  sub_2189CBDD8(319, &qword_267BE3770, &qword_267BE3720, MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SummaryView.Bridge(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SummaryView.Bridge);
}

uint64_t dispatch thunk of SummaryView.Bridge.userAltDSID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of SummaryView.Bridge.userAltDSID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of SummaryView.Bridge.userAltDSID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of SummaryView.Bridge.$userAltDSID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of SummaryView.Bridge.$userAltDSID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SummaryView.Bridge.$userAltDSID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of SummaryView.Bridge.__allocating_init(userAltDSID:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

void sub_2189CBDD8(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_2189CBE3C()
{
  unint64_t result = qword_267BE3778;
  if (!qword_267BE3778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3780);
    sub_218901074(&qword_267BE3718, &qword_267BE36F8);
    sub_2189CC418((unint64_t *)&qword_267BE1D68, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE3778);
  }
  return result;
}

uint64_t sub_2189CBF0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2189CE088();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE36E0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218900A60(v2, (uint64_t)v10, &qword_267BE36E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_2189CDD98();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_2189CEB08();
    uint64_t v14 = sub_2189CE268();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_21897A8DC(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_2189CEB78();
      _os_log_impl(&dword_2188FB000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D477F30](v18, -1, -1);
      MEMORY[0x21D477F30](v16, -1, -1);
    }

    sub_2189CE078();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2189CC1C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2189CC230()
{
  return sub_2189CC258(&qword_267BE37C0, &qword_267BE37A8, (void (*)(void))sub_2189CC2D8);
}

uint64_t sub_2189CC258(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2189CC2D8()
{
  unint64_t result = qword_267BE37C8;
  if (!qword_267BE37C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE37A0);
    sub_2189CC378();
    sub_218901074(&qword_267BE37E0, &qword_267BE37E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE37C8);
  }
  return result;
}

unint64_t sub_2189CC378()
{
  unint64_t result = qword_267BE37D0;
  if (!qword_267BE37D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BE3798);
    sub_218901074(&qword_267BE37D8, &qword_267BE3790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BE37D0);
  }
  return result;
}

uint64_t sub_2189CC418(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2189CC460(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t LastUpdatedView.init(date:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2189CC4C8(a1, a2);
}

uint64_t sub_2189CC4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t LastUpdatedView.body.getter@<X0>(uint64_t a1@<X8>)
{
  sub_2189CC588();
  sub_2189096A8();
  uint64_t result = sub_2189CE3C8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2189CC588()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE3818);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2189CD528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218916808(v1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_218900AE4((uint64_t)v7, &qword_267BE1AE0);
    id v12 = objc_msgSend(self, sel_bundle);
    uint64_t v13 = sub_2189CD3F8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    objc_msgSend(v14, sel_setTimeStyle_, 1);
    objc_msgSend(v14, sel_setDateStyle_, 2);
    objc_msgSend(v14, sel_setDoesRelativeDateFormatting_, 1);
    objc_msgSend(v14, sel_setFormattingContext_, 5);
    id v15 = objc_msgSend(self, sel_bundle);
    v26[1] = sub_2189CD3F8();

    id v16 = objc_msgSend(self, sel_currentLocale);
    sub_2189CD538();

    uint64_t v17 = sub_2189CD558();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 0, 1, v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BE2778);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_2189CF710;
    uint64_t v19 = (uint64_t)v4;
    uint64_t v20 = (void *)sub_2189CD4B8();
    id v21 = objc_msgSend(v14, sel_stringFromDate_, v20);

    uint64_t v22 = sub_2189CE988();
    uint64_t v24 = v23;

    *(void *)(v18 + 56) = MEMORY[0x263F8D310];
    *(void *)(v18 + 64) = sub_21896A310();
    *(void *)(v18 + 32) = v22;
    *(void *)(v18 + 40) = v24;
    uint64_t v13 = sub_2189CE998();
    swift_bridgeObjectRelease();

    sub_218900AE4(v19, &qword_267BE3818);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v13;
}

uint64_t sub_2189CCA00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2189CCA1C@<X0>(uint64_t a1@<X8>)
{
  sub_2189CC588();
  sub_2189096A8();
  uint64_t result = sub_2189CE3C8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LastUpdatedView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_2189CD528();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

void *initializeWithCopy for LastUpdatedView(void *a1, const void *a2)
{
  uint64_t v4 = sub_2189CD528();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for LastUpdatedView(void *a1, void *a2)
{
  uint64_t v4 = sub_2189CD528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *initializeWithTake for LastUpdatedView(void *a1, const void *a2)
{
  uint64_t v4 = sub_2189CD528();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for LastUpdatedView(void *a1, void *a2)
{
  uint64_t v4 = sub_2189CD528();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for LastUpdatedView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2189CD0F8);
}

uint64_t sub_2189CD0F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LastUpdatedView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2189CD17C);
}

uint64_t sub_2189CD17C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BE1AE0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for LastUpdatedView()
{
  uint64_t result = qword_267BE3808;
  if (!qword_267BE3808) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2189CD23C()
{
  sub_218969EA4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_2189CD2C8()
{
  return MEMORY[0x263F1A820];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_2189CD308()
{
  return MEMORY[0x270EEB368]();
}

uint64_t sub_2189CD318()
{
  return MEMORY[0x270EEB370]();
}

uint64_t sub_2189CD328()
{
  return MEMORY[0x270EEE2C8]();
}

uint64_t sub_2189CD338()
{
  return MEMORY[0x270EEE2D8]();
}

uint64_t sub_2189CD348()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_2189CD358()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_2189CD368()
{
  return MEMORY[0x270EEE300]();
}

uint64_t _s16ScreenTimeUICore11DetailChartV4HourV2id10Foundation4DateVvg_0()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_2189CD388()
{
  return MEMORY[0x270EEE318]();
}

uint64_t sub_2189CD398()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_2189CD3A8()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_2189CD3B8()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_2189CD3C8()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_2189CD3D8()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_2189CD3E8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2189CD3F8()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2189CD408()
{
  return MEMORY[0x270EF0430]();
}

uint64_t sub_2189CD418()
{
  return MEMORY[0x270EF04D0]();
}

uint64_t sub_2189CD428()
{
  return MEMORY[0x270EF04E8]();
}

uint64_t sub_2189CD438()
{
  return MEMORY[0x270EF0508]();
}

uint64_t sub_2189CD448()
{
  return MEMORY[0x270EF0518]();
}

uint64_t sub_2189CD458()
{
  return MEMORY[0x270EF0610]();
}

uint64_t sub_2189CD468()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_2189CD478()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_2189CD488()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_2189CD498()
{
  return MEMORY[0x270EF07C0]();
}

uint64_t sub_2189CD4A8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2189CD4B8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2189CD4C8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2189CD4D8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2189CD4E8()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_2189CD4F8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2189CD508()
{
  return MEMORY[0x270EF0B98]();
}

uint64_t sub_2189CD518()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2189CD528()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2189CD538()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_2189CD548()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2189CD558()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2189CD568()
{
  return MEMORY[0x270EF10F0]();
}

uint64_t sub_2189CD578()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_2189CD588()
{
  return MEMORY[0x270EF1110]();
}

uint64_t sub_2189CD598()
{
  return MEMORY[0x270EF1120]();
}

uint64_t sub_2189CD5A8()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_2189CD5B8()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_2189CD5C8()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_2189CD5D8()
{
  return MEMORY[0x270EF1260]();
}

uint64_t sub_2189CD5E8()
{
  return MEMORY[0x270EF1268]();
}

uint64_t sub_2189CD5F8()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_2189CD608()
{
  return MEMORY[0x270EF12A8]();
}

uint64_t sub_2189CD618()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_2189CD628()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_2189CD638()
{
  return MEMORY[0x270EF1330]();
}

uint64_t sub_2189CD648()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2189CD658()
{
  return MEMORY[0x270EF13A8]();
}

uint64_t sub_2189CD668()
{
  return MEMORY[0x270EF13B8]();
}

uint64_t sub_2189CD678()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2189CD688()
{
  return MEMORY[0x270EF13F0]();
}

uint64_t sub_2189CD698()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2189CD6A8()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_2189CD6B8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2189CD6C8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2189CD6D8()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_2189CD6E8()
{
  return MEMORY[0x270EEB378]();
}

uint64_t sub_2189CD6F8()
{
  return MEMORY[0x270EEB380]();
}

uint64_t sub_2189CD708()
{
  return MEMORY[0x270EEB388]();
}

uint64_t sub_2189CD718()
{
  return MEMORY[0x270EEB390]();
}

uint64_t sub_2189CD728()
{
  return MEMORY[0x270EEB398]();
}

uint64_t sub_2189CD738()
{
  return MEMORY[0x270EEB3A0]();
}

uint64_t sub_2189CD748()
{
  return MEMORY[0x270EEB3A8]();
}

uint64_t sub_2189CD758()
{
  return MEMORY[0x270EEB3B0]();
}

uint64_t sub_2189CD768()
{
  return MEMORY[0x270EEB3B8]();
}

uint64_t sub_2189CD778()
{
  return MEMORY[0x270EEB3C0]();
}

uint64_t sub_2189CD788()
{
  return MEMORY[0x270EEB3C8]();
}

uint64_t sub_2189CD798()
{
  return MEMORY[0x270EEB3D0]();
}

uint64_t sub_2189CD7A8()
{
  return MEMORY[0x270EEB3D8]();
}

uint64_t sub_2189CD7B8()
{
  return MEMORY[0x270EEB3E0]();
}

uint64_t sub_2189CD7C8()
{
  return MEMORY[0x270EEB3E8]();
}

uint64_t sub_2189CD7D8()
{
  return MEMORY[0x270EEB3F0]();
}

uint64_t sub_2189CD7E8()
{
  return MEMORY[0x270EEB420]();
}

uint64_t sub_2189CD7F8()
{
  return MEMORY[0x270EEB428]();
}

uint64_t sub_2189CD808()
{
  return MEMORY[0x270EEB430]();
}

uint64_t sub_2189CD818()
{
  return MEMORY[0x270EEB438]();
}

uint64_t sub_2189CD828()
{
  return MEMORY[0x270EEB440]();
}

uint64_t sub_2189CD838()
{
  return MEMORY[0x270EEB448]();
}

uint64_t sub_2189CD848()
{
  return MEMORY[0x270EEB450]();
}

uint64_t sub_2189CD858()
{
  return MEMORY[0x270EEB470]();
}

uint64_t sub_2189CD868()
{
  return MEMORY[0x270EEB478]();
}

uint64_t sub_2189CD878()
{
  return MEMORY[0x270EEB480]();
}

uint64_t sub_2189CD888()
{
  return MEMORY[0x270EEB488]();
}

uint64_t sub_2189CD898()
{
  return MEMORY[0x270EEB490]();
}

uint64_t sub_2189CD8C8()
{
  return MEMORY[0x270EEB4A8]();
}

uint64_t sub_2189CD8D8()
{
  return MEMORY[0x270EEB4B0]();
}

uint64_t sub_2189CD8E8()
{
  return MEMORY[0x270EEB4B8]();
}

uint64_t _s16ScreenTimeUICore13ModelProviderVACycfC_0()
{
  return MEMORY[0x270EEB4C0]();
}

uint64_t sub_2189CD908()
{
  return MEMORY[0x270EEB4C8]();
}

uint64_t sub_2189CD918()
{
  return MEMORY[0x270EEB4E8]();
}

uint64_t sub_2189CD928()
{
  return MEMORY[0x270EEB588]();
}

uint64_t sub_2189CD938()
{
  return MEMORY[0x270EEB5F8]();
}

uint64_t sub_2189CD948()
{
  return MEMORY[0x270EEB610]();
}

uint64_t sub_2189CD958()
{
  return MEMORY[0x270EEB640]();
}

uint64_t sub_2189CD968()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2189CD978()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2189CD988()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2189CD998()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2189CD9A8()
{
  return MEMORY[0x270EE2AE8]();
}

uint64_t sub_2189CD9B8()
{
  return MEMORY[0x270EE2B18]();
}

uint64_t sub_2189CD9C8()
{
  return MEMORY[0x270EE2B40]();
}

uint64_t sub_2189CD9D8()
{
  return MEMORY[0x270EE2B48]();
}

uint64_t sub_2189CD9E8()
{
  return MEMORY[0x270EE2B80]();
}

uint64_t sub_2189CD9F8()
{
  return MEMORY[0x270EE2B90]();
}

uint64_t sub_2189CDA08()
{
  return MEMORY[0x270EE2BB8]();
}

uint64_t sub_2189CDA18()
{
  return MEMORY[0x270EE2BD0]();
}

uint64_t sub_2189CDA28()
{
  return MEMORY[0x270EE2BE8]();
}

uint64_t sub_2189CDA38()
{
  return MEMORY[0x270EE2C00]();
}

uint64_t sub_2189CDA48()
{
  return MEMORY[0x270EE2C58]();
}

uint64_t sub_2189CDA58()
{
  return MEMORY[0x270EE2C98]();
}

uint64_t sub_2189CDA68()
{
  return MEMORY[0x270EE2CA0]();
}

uint64_t sub_2189CDA78()
{
  return MEMORY[0x270EE2CB0]();
}

uint64_t sub_2189CDA88()
{
  return MEMORY[0x270EE2CC8]();
}

uint64_t sub_2189CDA98()
{
  return MEMORY[0x270EE2CD0]();
}

uint64_t sub_2189CDAA8()
{
  return MEMORY[0x270EE2CD8]();
}

uint64_t sub_2189CDAB8()
{
  return MEMORY[0x270EE2D08]();
}

uint64_t sub_2189CDAC8()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_2189CDAD8()
{
  return MEMORY[0x270EE2D88]();
}

uint64_t sub_2189CDAE8()
{
  return MEMORY[0x270EE2D90]();
}

uint64_t sub_2189CDAF8()
{
  return MEMORY[0x270EE2DB8]();
}

uint64_t sub_2189CDB08()
{
  return MEMORY[0x270EE2DD0]();
}

uint64_t sub_2189CDB18()
{
  return MEMORY[0x270EE2DE0]();
}

uint64_t sub_2189CDB28()
{
  return MEMORY[0x270EE2E50]();
}

uint64_t sub_2189CDB38()
{
  return MEMORY[0x270EE2E58]();
}

uint64_t sub_2189CDB48()
{
  return MEMORY[0x270EE2E98]();
}

uint64_t sub_2189CDB58()
{
  return MEMORY[0x270EE2EA0]();
}

uint64_t sub_2189CDB68()
{
  return MEMORY[0x270EE2EB8]();
}

uint64_t sub_2189CDB78()
{
  return MEMORY[0x270EE2EC8]();
}

uint64_t sub_2189CDB88()
{
  return MEMORY[0x270EE2ED0]();
}

uint64_t sub_2189CDB98()
{
  return MEMORY[0x270EE2EE8]();
}

uint64_t sub_2189CDBA8()
{
  return MEMORY[0x270EE2F00]();
}

uint64_t sub_2189CDBB8()
{
  return MEMORY[0x270EE2F08]();
}

uint64_t sub_2189CDBC8()
{
  return MEMORY[0x270EE2F20]();
}

uint64_t sub_2189CDBD8()
{
  return MEMORY[0x270EE2F48]();
}

uint64_t sub_2189CDBE8()
{
  return MEMORY[0x270EE2F50]();
}

uint64_t sub_2189CDBF8()
{
  return MEMORY[0x270EE2F70]();
}

uint64_t sub_2189CDC08()
{
  return MEMORY[0x270EE2F78]();
}

uint64_t sub_2189CDC18()
{
  return MEMORY[0x270EE2F80]();
}

uint64_t sub_2189CDC28()
{
  return MEMORY[0x270EE2F88]();
}

uint64_t sub_2189CDC38()
{
  return MEMORY[0x270EE2F90]();
}

uint64_t sub_2189CDC48()
{
  return MEMORY[0x270EE2FC8]();
}

uint64_t sub_2189CDC58()
{
  return MEMORY[0x270EE2FD8]();
}

uint64_t sub_2189CDC68()
{
  return MEMORY[0x270EE3000]();
}

uint64_t sub_2189CDC78()
{
  return MEMORY[0x270EE3008]();
}

uint64_t sub_2189CDC88()
{
  return MEMORY[0x270EE3010]();
}

uint64_t sub_2189CDC98()
{
  return MEMORY[0x270EE3020]();
}

uint64_t sub_2189CDCA8()
{
  return MEMORY[0x270EE3058]();
}

uint64_t sub_2189CDCB8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2189CDCC8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2189CDCD8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2189CDCE8()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2189CDCF8()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_2189CDD08()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2189CDD18()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2189CDD28()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2189CDD38()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_2189CDD48()
{
  return MEMORY[0x270EE3FB0]();
}

uint64_t sub_2189CDD58()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_2189CDD68()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2189CDD78()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2189CDD88()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_2189CDD98()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2189CDDA8()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_2189CDDB8()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_2189CDDC8()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_2189CDDD8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2189CDDE8()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_2189CDDF8()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_2189CDE08()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_2189CDE18()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2189CDE28()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2189CDE38()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2189CDE48()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2189CDE58()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2189CDE68()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2189CDE78()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_2189CDE88()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_2189CDE98()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2189CDEA8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_2189CDEB8()
{
  return MEMORY[0x270F004A0]();
}

uint64_t sub_2189CDEC8()
{
  return MEMORY[0x270F004A8]();
}

uint64_t sub_2189CDED8()
{
  return MEMORY[0x270F004B0]();
}

uint64_t sub_2189CDEE8()
{
  return MEMORY[0x270F004B8]();
}

uint64_t sub_2189CDEF8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2189CDF08()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2189CDF18()
{
  return MEMORY[0x270F00768]();
}

uint64_t sub_2189CDF28()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_2189CDF38()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_2189CDF48()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_2189CDF58()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2189CDF68()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_2189CDF78()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_2189CDF88()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_2189CDF98()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2189CDFA8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2189CDFB8()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_2189CDFC8()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_2189CDFD8()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_2189CDFE8()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_2189CDFF8()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_2189CE008()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_2189CE018()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_2189CE028()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_2189CE038()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2189CE048()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2189CE058()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_2189CE068()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_2189CE078()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2189CE088()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2189CE098()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_2189CE0A8()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_2189CE0B8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2189CE0C8()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_2189CE0D8()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2189CE0E8()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_2189CE0F8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_2189CE108()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_2189CE118()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2189CE128()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_2189CE138()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2189CE148()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_2189CE158()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2189CE168()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2189CE178()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_2189CE188()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2189CE198()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_2189CE1A8()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_2189CE1B8()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_2189CE1C8()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_2189CE1D8()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_2189CE1E8()
{
  return MEMORY[0x270F01D10]();
}

uint64_t sub_2189CE1F8()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_2189CE208()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_2189CE218()
{
  return MEMORY[0x270F01FF8]();
}

uint64_t sub_2189CE228()
{
  return MEMORY[0x270F02000]();
}

uint64_t sub_2189CE238()
{
  return MEMORY[0x270F02008]();
}

uint64_t sub_2189CE248()
{
  return MEMORY[0x270F02010]();
}

uint64_t sub_2189CE258()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_2189CE268()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2189CE278()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_2189CE288()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2189CE298()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2189CE2A8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2189CE2B8()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_2189CE2C8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2189CE2D8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_2189CE2E8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_2189CE2F8()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_2189CE308()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_2189CE318()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_2189CE328()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_2189CE338()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_2189CE348()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_2189CE358()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_2189CE368()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_2189CE378()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_2189CE388()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2189CE398()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2189CE3A8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2189CE3B8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2189CE3C8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2189CE3D8()
{
  return MEMORY[0x270EE3070]();
}

uint64_t sub_2189CE3E8()
{
  return MEMORY[0x270EE3080]();
}

uint64_t sub_2189CE3F8()
{
  return MEMORY[0x270EE3090]();
}

uint64_t sub_2189CE408()
{
  return MEMORY[0x270EE3098]();
}

uint64_t sub_2189CE418()
{
  return MEMORY[0x270EE30B0]();
}

uint64_t sub_2189CE428()
{
  return MEMORY[0x270EE30C0]();
}

uint64_t sub_2189CE438()
{
  return MEMORY[0x270F032B0]();
}

uint64_t sub_2189CE448()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2189CE458()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2189CE468()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_2189CE478()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_2189CE488()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_2189CE498()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2189CE4A8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2189CE4B8()
{
  return MEMORY[0x270F039D0]();
}

uint64_t sub_2189CE4C8()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_2189CE4D8()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2189CE4E8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2189CE4F8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_2189CE508()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_2189CE518()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2189CE528()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2189CE538()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_2189CE548()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2189CE558()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_2189CE568()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2189CE578()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_2189CE588()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2189CE598()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_2189CE5A8()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_2189CE5B8()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2189CE5C8()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2189CE5D8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2189CE5E8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_2189CE5F8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2189CE608()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2189CE618()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_2189CE628()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2189CE638()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2189CE648()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2189CE658()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2189CE668()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_2189CE678()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2189CE688()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_2189CE698()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_2189CE6A8()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_2189CE6B8()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_2189CE6C8()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_2189CE6D8()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2189CE6E8()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2189CE6F8()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_2189CE708()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_2189CE718()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_2189CE728()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2189CE738()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_2189CE748()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_2189CE758()
{
  return MEMORY[0x270EE3100]();
}

uint64_t sub_2189CE768()
{
  return MEMORY[0x270EE3108]();
}

uint64_t sub_2189CE778()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2189CE788()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2189CE798()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_2189CE7A8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_2189CE7B8()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_2189CE7C8()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_2189CE7D8()
{
  return MEMORY[0x270F04DB8]();
}

uint64_t sub_2189CE7E8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2189CE7F8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_2189CE808()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_2189CE818()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_2189CE828()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_2189CE838()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_2189CE848()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_2189CE858()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2189CE868()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2189CE878()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2189CE888()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2189CE898()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2189CE8A8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2189CE8B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2189CE8C8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2189CE8D8()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_2189CE8E8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2189CE8F8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2189CE908()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_2189CE918()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_2189CE928()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_2189CE938()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_2189CE948()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_2189CE958()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2189CE968()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2189CE978()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_2189CE988()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2189CE998()
{
  return MEMORY[0x270EF1A30]();
}

uint64_t sub_2189CE9A8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2189CE9B8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2189CE9C8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2189CE9D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2189CE9E8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2189CE9F8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2189CEA08()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2189CEA18()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2189CEA28()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2189CEA38()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_2189CEA48()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2189CEA58()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2189CEA68()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2189CEA78()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2189CEA88()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2189CEA98()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2189CEAA8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2189CEAB8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2189CEAC8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2189CEAD8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2189CEAE8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2189CEAF8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2189CEB08()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2189CEB18()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_2189CEB28()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_2189CEB38()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2189CEB48()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2189CEB58()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_2189CEB68()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_2189CEB78()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2189CEB88()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2189CEB98()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2189CEBA8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2189CEBB8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2189CEBC8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2189CEBD8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2189CEBE8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2189CEBF8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2189CEC08()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2189CEC18()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2189CEC28()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2189CEC38()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2189CEC48()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2189CEC58()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2189CEC68()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2189CEC78()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2189CEC88()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2189CEC98()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2189CECA8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2189CECB8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2189CECC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2189CECD8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2189CECE8()
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

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}