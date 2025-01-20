void sub_22E7A473C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;
  void *v10;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    v10 = [v9 description];
    NSLog(&cfstr_UnableToCopyPa.isa);

    objc_end_catch();
    JUMPOUT(0x22E7A471CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_22E7A538C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E7A55D8(uint64_t a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + *MEMORY[0x263F624C8]);
  if (v3 == 1)
  {
    uint64_t v4 = type metadata accessor for PASUIProgressViewProxCardAdapter();
    v5 = (void *)swift_allocObject();
    v5[4] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
    swift_allocObject();
    v5[2] = sub_22E7F3050();
    swift_retain();
    if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
      unint64_t v6 = sub_22E7B7F44(MEMORY[0x263F8EE78]);
    }
    else {
      unint64_t v6 = MEMORY[0x263F8EE88];
    }
    v5[3] = v6;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = &off_26E2337B8;
    *(void *)a1 = v5;
  }
  else
  {
    *(unsigned char *)a1 = 0;
  }
  *(unsigned char *)(a1 + 40) = v3 ^ 1;
}

uint64_t PASFlowStepManateeRepair.buildView()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610680);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v7 = (char *)&v14 - v6;
  char v8 = *((unsigned char *)&v0->Kind + *MEMORY[0x263F624C8]);
  uint64_t v9 = type metadata accessor for PASUIManateeRepairHelperProvider();
  uint64_t v10 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  *(void *)(v10 + 16) = sub_22E7F3050();
  *(unsigned char *)(v10 + 24) = v8;
  uint64_t v16 = v9;
  v17 = &protocol witness table for PASUIManateeRepairHelperProvider;
  v14 = v0;
  unint64_t v15 = v10;
  unint64_t v11 = sub_22E7A5904();
  swift_retain();
  sub_22E7F3C00();
  sub_22E7A5958((uint64_t)&v14);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v14 = &type metadata for PASUIManateeRepairView;
  unint64_t v15 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v12;
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

unint64_t sub_22E7A5904()
{
  unint64_t result = qword_268610690;
  if (!qword_268610690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610690);
  }
  return result;
}

uint64_t sub_22E7A5958(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v2);
  return a1;
}

void sub_22E7A5990(uint64_t a1@<X8>)
{
}

uint64_t sub_22E7A59B4()
{
  return PASFlowStepManateeRepair.buildView()();
}

uint64_t sub_22E7A59D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C8);
  uint64_t v2 = MEMORY[0x270FA5388](v31);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v26 = (char *)&v26 - v5;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106D0);
  MEMORY[0x270FA5388](v28);
  uint64_t v29 = (uint64_t)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E7F3760();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22E7F3FB0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106D8);
  uint64_t v14 = MEMORY[0x270FA5388](v27);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v18 = (char *)&v26 - v17;
  uint64_t v19 = *v1;
  if (*(unsigned char *)(*v1 + *MEMORY[0x263F624C8]) == 1)
  {
    sub_22E7A6BDC((uint64_t)v1, (uint64_t)&v32);
    v20 = (_OWORD *)swift_allocObject();
    long long v21 = v33;
    v20[1] = v32;
    v20[2] = v21;
    v20[3] = v34;
    sub_22E7F3F90();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v9[*(int *)(v7 + 20)], v13, v10);
    *(void *)uint64_t v9 = &unk_268610720;
    *((void *)v9 + 1) = v20;
    sub_22E7A6DF4((uint64_t)v9, (uint64_t)v16);
    sub_22E7A6E70((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v22 = &qword_2686106D8;
    sub_22E7A715C((uint64_t)v16, (uint64_t)v18, &qword_2686106D8);
    sub_22E7A71C0((uint64_t)v18, v29, &qword_2686106D8);
  }
  else
  {
    sub_22E7A6BDC((uint64_t)v1, (uint64_t)&v32);
    v23 = (_OWORD *)swift_allocObject();
    long long v24 = v33;
    v23[1] = v32;
    v23[2] = v24;
    v23[3] = v34;
    swift_retain();
    sub_22E7F3F90();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v9[*(int *)(v7 + 20)], v13, v10);
    *(void *)uint64_t v9 = &unk_2686106E8;
    *((void *)v9 + 1) = v23;
    sub_22E7A6DF4((uint64_t)v9, (uint64_t)&v4[*(int *)(v31 + 36)]);
    *(void *)uint64_t v4 = sub_22E7A6BD4;
    *((void *)v4 + 1) = v19;
    v4[16] = 0;
    *((void *)v4 + 3) = sub_22E7A64F0;
    *((void *)v4 + 4) = 0;
    *((void *)v4 + 5) = sub_22E7A6524;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    v4[80] = 1;
    *((void *)v4 + 11) = MEMORY[0x263F8EE78];
    sub_22E7A6E58();
    sub_22E7A6E60((uint64_t)sub_22E7A64F0);
    sub_22E7A6E60((uint64_t)sub_22E7A6524);
    swift_bridgeObjectRetain();
    sub_22E7A6E70((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    sub_22E7A6ECC();
    sub_22E7A6ED4((uint64_t)sub_22E7A64F0);
    sub_22E7A6ED4((uint64_t)sub_22E7A6524);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = &qword_2686106C8;
    v18 = v26;
    sub_22E7A715C((uint64_t)v4, (uint64_t)v26, &qword_2686106C8);
    sub_22E7A71C0((uint64_t)v18, v29, &qword_2686106C8);
  }
  swift_storeEnumTagMultiPayload();
  sub_22E7A6F80(&qword_2686106F0, &qword_2686106D8, (void (*)(void))sub_22E7A6F2C);
  sub_22E7A6F80((unint64_t *)&qword_268610708, &qword_2686106C8, (void (*)(void))sub_22E7A7030);
  sub_22E7F3930();
  return sub_22E7A7224((uint64_t)v18, v22);
}

uint64_t sub_22E7A5F90(uint64_t a1)
{
  v1[2] = a1;
  sub_22E7F3F80();
  v1[3] = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  v1[4] = v3;
  v1[5] = v2;
  return MEMORY[0x270FA2498](sub_22E7A6028, v3, v2);
}

uint64_t sub_22E7A6028()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *MEMORY[0x263F29090];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7A60DC;
  return MEMORY[0x270F58AA0](v2, v1 + 8);
}

uint64_t sub_22E7A60DC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_22E7A7F04, v3, v2);
}

uint64_t sub_22E7A61FC(uint64_t a1)
{
  v1[2] = a1;
  sub_22E7F3F80();
  v1[3] = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  v1[4] = v3;
  v1[5] = v2;
  return MEMORY[0x270FA2498](sub_22E7A6294, v3, v2);
}

uint64_t sub_22E7A6294()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *MEMORY[0x263F29090];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7A6348;
  return MEMORY[0x270F58AA0](v2, v1 + 8);
}

uint64_t sub_22E7A6348()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_22E7A6468, v3, v2);
}

uint64_t sub_22E7A6468()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7A64D0()
{
  return sub_22E7F3B80();
}

uint64_t sub_22E7A64F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a3;
  v6[1] = a4;
  sub_22E7A8054(v6, &v5);
  return v5;
}

uint64_t sub_22E7A6524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[0] = a1;
  v7[1] = a2;
  v6[0] = a3;
  v6[1] = a4;
  sub_22E7A80FC((uint64_t)v7, (uint64_t)v6, &v5);
  return v5;
}

uint64_t variable initialization expression of PASUITargetViewPresenter.delegate()
{
  return 0;
}

double variable initialization expression of PASUITargetViewPresenter.navigationController@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of PASUITargetViewPresenter.flowTimer()
{
  return 0;
}

uint64_t variable initialization expression of PASUITargetViewPresenter._messageSessionProvider()
{
  return sub_22E7A66A0(&qword_268610698);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._authenticator()
{
  return sub_22E7A66A0(&qword_2686106A0);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._deviceProvider()
{
  return sub_22E7A66A0(&qword_2686106A8);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._targetAppleIDExchanger()
{
  return sub_22E7A66A0(&qword_2686106B0);
}

uint64_t variable initialization expression of PASUITargetViewPresenter._analyticsProvider()
{
  return sub_22E7A66A0(&qword_2686106B8);
}

uint64_t variable initialization expression of PASUITargetViewPresenter.$__lazy_storage_$_analytics()
{
  return 0;
}

uint64_t variable initialization expression of PASUITargetViewPresenter._featureFlagsProvider()
{
  return sub_22E7A66A0(&qword_2686106C0);
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.connection()
{
  return 0;
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.$__lazy_storage_$_operationQueue()
{
  return 0;
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.$__lazy_storage_$_dispatchQueue()
{
  return 0;
}

uint64_t variable initialization expression of PASUIExtensionHostProxy.$__lazy_storage_$_infoProvider()
{
  return 0;
}

uint64_t variable initialization expression of PASUISourceViewPresenter.delegate()
{
  return 0;
}

uint64_t variable initialization expression of PASUISourceViewPresenter.cardContentView()
{
  return 0;
}

double variable initialization expression of PASUISourceViewPresenter.cardAdapter@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of PASUISourceViewPresenter.flowTimer()
{
  return 0;
}

uint64_t variable initialization expression of PASUISourceViewPresenter._messageSessionProvider()
{
  return sub_22E7A66A0(&qword_268610698);
}

uint64_t variable initialization expression of PASUISourceViewPresenter._authenticator()
{
  return sub_22E7A66A0(&qword_2686106A0);
}

uint64_t variable initialization expression of PASUISourceViewPresenter._viewControllerProvider()
{
  return sub_22E7A66A0((uint64_t *)&unk_268610D30);
}

uint64_t variable initialization expression of PASUISourceViewPresenter._analyticsProvider()
{
  return sub_22E7A66A0(&qword_2686106B8);
}

uint64_t variable initialization expression of PASUISourceViewPresenter.$__lazy_storage_$_analytics()
{
  return 0;
}

uint64_t variable initialization expression of PASUISignInViewModel._viewControllerProvider()
{
  return sub_22E7A66A0((uint64_t *)&unk_268610D30);
}

uint64_t variable initialization expression of PASUISignInViewModel.continueSignInAction()
{
  return 0;
}

uint64_t variable initialization expression of PASUIManateeRepairHelperProvider._viewControllerProvider()
{
  return sub_22E7A66A0((uint64_t *)&unk_268610D30);
}

uint64_t sub_22E7A66A0(uint64_t *a1)
{
  return sub_22E7F3050();
}

uint64_t initializeBufferWithCopyOfBuffer for PASUIManateeRepairView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PASUIManateeRepairView(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for PASUIManateeRepairView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = a2 + 8;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = v4;
  uint64_t v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  swift_retain();
  v6(a1 + 8, v3, v5);
  return a1;
}

void *assignWithCopy for PASUIManateeRepairView(void *a1, void *a2)
{
  uint64_t v3 = a2 + 1;
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, v3);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        double result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *double result = *a2;
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
          *uint64_t v3 = *a2;
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

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PASUIManateeRepairView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIManateeRepairView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIManateeRepairView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIManateeRepairView()
{
  return &type metadata for PASUIManateeRepairView;
}

uint64_t sub_22E7A6BB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7A6BD4()
{
  return j__swift_retain(v0);
}

uint64_t sub_22E7A6BDC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)a1;
  uint64_t v3 = a2 + 8;
  uint64_t v4 = a1 + 8;
  long long v5 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 32) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(v3, v4, v6);
  return a2;
}

uint64_t sub_22E7A6C6C()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A6D00;
  return sub_22E7A61FC(v0 + 16);
}

uint64_t sub_22E7A6D00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22E7A6DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22E7F3760();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E7A6E58()
{
  return swift_retain();
}

uint64_t sub_22E7A6E60(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_22E7A6E70(uint64_t a1)
{
  uint64_t v2 = sub_22E7F3760();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22E7A6ECC()
{
  return swift_release();
}

uint64_t sub_22E7A6ED4(uint64_t result)
{
  if (result) {
    return swift_release();
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

unint64_t sub_22E7A6F2C()
{
  unint64_t result = qword_2686106F8;
  if (!qword_2686106F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686106F8);
  }
  return result;
}

uint64_t sub_22E7A6F80(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_22E7A7B98((unint64_t *)&qword_268610700, MEMORY[0x263F189F8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22E7A7030()
{
  unint64_t result = qword_268610710;
  if (!qword_268610710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268610710);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_22E7A70C8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A7F00;
  return sub_22E7A5F90(v0 + 16);
}

uint64_t sub_22E7A715C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E7A71C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E7A7224(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22E7A7280(uint64_t a1, uint64_t a2)
{
  return sub_22E7A77EC(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_22E7A72A4(uint64_t a1, uint64_t a2)
{
  return sub_22E7A77EC(a1, a2, MEMORY[0x263F8D308]);
}

void sub_22E7A72C4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_22E7A72CC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_22E7A72E0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_22E7A7310(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_22E7A7324(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_22E7A7338(uint64_t a1, id *a2)
{
  uint64_t result = sub_22E7F3E70();
  *a2 = 0;
  return result;
}

uint64_t sub_22E7A73B0(uint64_t a1, id *a2)
{
  char v3 = sub_22E7F3E80();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22E7A7430@<X0>(uint64_t *a1@<X8>)
{
  sub_22E7F3E90();
  uint64_t v2 = sub_22E7F3E60();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_22E7A7478@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_22E7A7488@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E7F3E90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22E7A74B4(uint64_t a1)
{
  uint64_t v2 = sub_22E7A7B98(&qword_2686107D0, type metadata accessor for AATermsEntry);
  uint64_t v3 = sub_22E7A7B98(&qword_2686107D8, type metadata accessor for AATermsEntry);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22E7A7570(uint64_t a1)
{
  uint64_t v2 = sub_22E7A7B98(&qword_2686107E0, type metadata accessor for AKAppleIDAuthenticationAppProvidedContext);
  uint64_t v3 = sub_22E7A7B98(&qword_2686107E8, type metadata accessor for AKAppleIDAuthenticationAppProvidedContext);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22E7A762C(uint64_t a1)
{
  uint64_t v2 = sub_22E7A7B98(&qword_2686107F0, type metadata accessor for AIDAServiceType);
  uint64_t v3 = sub_22E7A7B98(&qword_2686107F8, type metadata accessor for AIDAServiceType);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22E7A76E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_22E7F3E60();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22E7A7730(uint64_t a1)
{
  uint64_t v2 = sub_22E7A7B98((unint64_t *)&qword_2686107C0, type metadata accessor for Key);
  uint64_t v3 = sub_22E7A7B98(&qword_2686107C8, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22E7A77EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_22E7F3E90();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22E7A7830()
{
  sub_22E7F3E90();
  sub_22E7F3EE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7A7884()
{
  sub_22E7F3E90();
  sub_22E7F42A0();
  sub_22E7F3EE0();
  uint64_t v0 = sub_22E7F42C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E7A78F8()
{
  uint64_t v0 = sub_22E7F3E90();
  uint64_t v2 = v1;
  if (v0 == sub_22E7F3E90() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_22E7F4210();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for Key(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22E7A79A8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22E7A79C8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for AATermsEntry(uint64_t a1)
{
}

void type metadata accessor for AKAppleIDAuthenticationAppProvidedContext(uint64_t a1)
{
}

void type metadata accessor for AIDAServiceType(uint64_t a1)
{
}

void sub_22E7A7A40(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_22E7A7A8C()
{
  unint64_t result = qword_268610750;
  if (!qword_268610750)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610758);
    sub_22E7A6F80(&qword_2686106F0, &qword_2686106D8, (void (*)(void))sub_22E7A6F2C);
    sub_22E7A6F80((unint64_t *)&qword_268610708, &qword_2686106C8, (void (*)(void))sub_22E7A7030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610750);
  }
  return result;
}

uint64_t sub_22E7A7B50()
{
  return sub_22E7A7B98(&qword_268610760, type metadata accessor for AIDAServiceType);
}

uint64_t sub_22E7A7B98(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22E7A7BE0()
{
  return sub_22E7A7B98(&qword_268610768, type metadata accessor for AIDAServiceType);
}

uint64_t sub_22E7A7C28()
{
  return sub_22E7A7B98(&qword_268610770, type metadata accessor for AKAppleIDAuthenticationAppProvidedContext);
}

uint64_t sub_22E7A7C70()
{
  return sub_22E7A7B98(&qword_268610778, type metadata accessor for AKAppleIDAuthenticationAppProvidedContext);
}

uint64_t sub_22E7A7CB8()
{
  return sub_22E7A7B98(&qword_268610780, type metadata accessor for AKAppleIDAuthenticationAppProvidedContext);
}

uint64_t sub_22E7A7D00()
{
  return sub_22E7A7B98(&qword_268610788, type metadata accessor for AATermsEntry);
}

uint64_t sub_22E7A7D48()
{
  return sub_22E7A7B98(&qword_268610790, type metadata accessor for AATermsEntry);
}

uint64_t sub_22E7A7D90()
{
  return sub_22E7A7B98(&qword_268610798, type metadata accessor for Key);
}

uint64_t sub_22E7A7DD8()
{
  return sub_22E7A7B98(&qword_2686107A0, type metadata accessor for Key);
}

uint64_t sub_22E7A7E20()
{
  return sub_22E7A7B98(&qword_2686107A8, type metadata accessor for Key);
}

uint64_t sub_22E7A7E68()
{
  return sub_22E7A7B98(&qword_2686107B0, type metadata accessor for AATermsEntry);
}

uint64_t sub_22E7A7EB0()
{
  return sub_22E7A7B98(&qword_2686107B8, type metadata accessor for AIDAServiceType);
}

uint64_t sub_22E7A7F08()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for PASUIMonogramMaker()
{
  return self;
}

id sub_22E7A7F40(void *a1)
{
  id result = objc_msgSend(a1, sel_aa_firstName);
  if (result)
  {
    char v3 = result;
    id result = objc_msgSend(a1, sel_aa_lastName);
    if (result)
    {
      uint64_t v4 = result;
      char v5 = self;
      id v6 = objc_msgSend(self, sel_mainScreen);
      objc_msgSend(v6, sel_scale);
      double v8 = v7;

      id v9 = objc_msgSend(v5, sel_monogramWithFirstName_lastName_diameter_scale_, v3, v4, 40.0, v8);
      uint64_t v10 = sub_22E7F2F80();

      return (id)v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_22E7A8054(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  if (a1[1])
  {
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    uint64_t v3 = sub_22E7F3ED0();
    uint64_t v5 = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  *a2 = v3;
  a2[1] = v5;
}

uint64_t sub_22E7A80FC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (*(void *)(result + 8)) {
    BOOL v4 = *(void *)(a2 + 8) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    sub_22E7F3EF0();
    sub_22E7F3EF0();
    uint64_t v5 = sub_22E7F3ED0();
    uint64_t v7 = v6;
    id result = swift_bridgeObjectRelease();
  }
  *a3 = v5;
  a3[1] = v7;
  return result;
}

uint64_t destroy for PASUISourceBaseView(uint64_t a1)
{
  sub_22E7A6ECC();
  if (*(void *)(a1 + 24)) {
    swift_release();
  }
  if (*(void *)(a1 + 40)) {
    swift_release();
  }

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PASUISourceBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_22E7A6E58();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[3];
  if (v7)
  {
    uint64_t v8 = a2[4];
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
  }
  uint64_t v9 = a2[5];
  if (v9)
  {
    uint64_t v10 = a2[6];
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  }
  uint64_t v11 = (void *)a2[7];
  uint64_t v12 = a2[8];
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = a2[9];
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  *(void *)(a1 + 88) = a2[11];
  id v13 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASUISourceBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_22E7A6E58();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_22E7A6ECC();
  uint64_t v7 = a2[3];
  if (*(void *)(a1 + 24))
  {
    if (v7)
    {
      uint64_t v8 = a2[4];
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[4];
    *(void *)(a1 + 24) = v7;
    *(void *)(a1 + 32) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
LABEL_8:
  uint64_t v10 = a2[5];
  if (!*(void *)(a1 + 40))
  {
    if (v10)
    {
      uint64_t v12 = a2[6];
      *(void *)(a1 + 40) = v10;
      *(void *)(a1 + 48) = v12;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    goto LABEL_15;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v11 = a2[6];
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  swift_retain();
  swift_release();
LABEL_15:
  id v13 = *(void **)(a1 + 56);
  uint64_t v14 = (void *)a2[7];
  *(void *)(a1 + 56) = v14;
  id v15 = v14;

  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  *(void *)(a1 + 88) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for PASUISourceBaseView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_22E7A6ECC();
  uint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24))
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v7;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v8;
      *(void *)(a1 + 48) = v10;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    goto LABEL_15;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  swift_release();
LABEL_15:
  uint64_t v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);

  uint64_t v12 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUISourceBaseView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUISourceBaseView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUISourceBaseView()
{
  return &type metadata for PASUISourceBaseView;
}

uint64_t sub_22E7A8688()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7A86A4@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  uint64_t v31 = a1;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610860);
  uint64_t v32 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  v25 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v4 = (ValueMetadata *)v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  unint64_t v8 = v2[9];
  uint64_t v9 = v2[11];
  LOBYTE(v3) = *((unsigned char *)v2 + 80);
  v37 = v4;
  uint64_t v38 = v5;
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  long long v29 = *(_OWORD *)(v2 + 7);
  long long v41 = v29;
  unint64_t v42 = v8;
  uint64_t v43 = v9;
  char v44 = v3;
  sub_22E7A6E60((uint64_t)v4);
  sub_22E7A6E60(v6);
  uint64_t v10 = (void *)v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v10;
  uint64_t v35 = sub_22E7F3ED0();
  uint64_t v36 = v12;
  uint64_t v13 = v2[1];
  *(void *)&long long v29 = *v2;
  uint64_t v28 = v13;
  int v27 = *((unsigned __int8 *)v2 + 16);
  uint64_t v26 = sub_22E7F31A0();
  sub_22E7A9B74();
  sub_22E7F36C0();
  swift_getKeyPath();
  sub_22E7F37C0();
  swift_release();
  swift_release();
  long long v34 = v2;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610870);
  unint64_t v24 = sub_22E7A9C7C();
  unint64_t v15 = sub_22E7A9CD0();
  unint64_t v16 = sub_22E7A9D24();
  sub_22E7F3C20();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v17 = v39;
  v18 = (void *)v41;
  sub_22E7A6ED4((uint64_t)v37);
  sub_22E7A6ED4(v17);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v35 = sub_22E7F3ED0();
  uint64_t v36 = v19;
  sub_22E7F36C0();
  swift_getKeyPath();
  sub_22E7F37C0();
  swift_release();
  swift_release();
  long long v33 = v2;
  v37 = &type metadata for PASUIWelcomeControllerWrapper;
  uint64_t v38 = MEMORY[0x263F8D310];
  uint64_t v39 = v14;
  uint64_t v40 = MEMORY[0x263F1A830];
  *(void *)&long long v41 = v24;
  *((void *)&v41 + 1) = v15;
  unint64_t v42 = v16;
  uint64_t v43 = MEMORY[0x263F1A820];
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v30;
  long long v21 = v25;
  sub_22E7F3C20();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v21, v20);
}

uint64_t sub_22E7A8B30@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610890);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610898);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v35 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  long long v34 = (char *)&v32 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  long long v33 = (char *)&v32 - v13;
  MEMORY[0x270FA5388](v12);
  v37 = (char *)&v32 - v14;
  uint64_t v38 = sub_22E7F3ED0();
  uint64_t v39 = v15;
  sub_22E7F3660();
  uint64_t v16 = sub_22E7F3670();
  uint64_t v32 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v32(v5, 0, 1, v16);
  sub_22E7F31A0();
  sub_22E7A9B74();
  sub_22E7F36B0();
  sub_22E7A9CD0();
  sub_22E7F3D50();
  uint64_t v38 = sub_22E7F3ED0();
  uint64_t v39 = v17;
  sub_22E7F3650();
  v32(v5, 0, 1, v16);
  v18 = (_OWORD *)swift_allocObject();
  long long v19 = *(_OWORD *)(a1 + 48);
  v18[3] = *(_OWORD *)(a1 + 32);
  v18[4] = v19;
  long long v20 = *(_OWORD *)(a1 + 80);
  v18[5] = *(_OWORD *)(a1 + 64);
  v18[6] = v20;
  long long v21 = *(_OWORD *)(a1 + 16);
  v18[1] = *(_OWORD *)a1;
  v18[2] = v21;
  sub_22E7A9E98((void *)a1);
  v22 = v33;
  sub_22E7F3D50();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  unint64_t v24 = v34;
  v25 = v37;
  v23(v34, v37, v6);
  uint64_t v26 = v35;
  int v27 = v22;
  v23(v35, v22, v6);
  uint64_t v28 = v36;
  v23(v36, v24, v6);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686108A0);
  v23(&v28[*(int *)(v29 + 48)], v26, v6);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  v30(v27, v6);
  v30(v25, v6);
  v30(v26, v6);
  return ((uint64_t (*)(char *, uint64_t))v30)(v24, v6);
}

uint64_t sub_22E7A8F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_22E7F3F80();
  v4[3] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  v4[4] = v6;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_22E7A8FC4, v6, v5);
}

uint64_t sub_22E7A8FC4()
{
  sub_22E7F31A0();
  sub_22E7A9B74();
  uint64_t v1 = sub_22E7F36B0();
  *(void *)(v0 + 48) = v1;
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v1 + 504) + **(int **)(*(void *)v1 + 504));
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *unint64_t v2 = v0;
  v2[1] = sub_22E7A9110;
  return v4();
}

uint64_t sub_22E7A9110()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_22E7A7F04, v3, v2);
}

uint64_t sub_22E7A9254@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7A9AD8(a1);
}

uint64_t sub_22E7A9270@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610890);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610898);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v35 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  long long v34 = (char *)&v32 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  long long v33 = (char *)&v32 - v13;
  MEMORY[0x270FA5388](v12);
  v37 = (char *)&v32 - v14;
  uint64_t v38 = sub_22E7F3ED0();
  uint64_t v39 = v15;
  sub_22E7F3660();
  uint64_t v16 = sub_22E7F3670();
  uint64_t v32 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v32(v5, 0, 1, v16);
  sub_22E7F31A0();
  sub_22E7A9B74();
  sub_22E7F36B0();
  sub_22E7A9CD0();
  sub_22E7F3D50();
  uint64_t v38 = sub_22E7F3ED0();
  uint64_t v39 = v17;
  sub_22E7F3650();
  v32(v5, 0, 1, v16);
  v18 = (_OWORD *)swift_allocObject();
  long long v19 = *(_OWORD *)(a1 + 48);
  v18[3] = *(_OWORD *)(a1 + 32);
  v18[4] = v19;
  long long v20 = *(_OWORD *)(a1 + 80);
  v18[5] = *(_OWORD *)(a1 + 64);
  v18[6] = v20;
  long long v21 = *(_OWORD *)(a1 + 16);
  v18[1] = *(_OWORD *)a1;
  v18[2] = v21;
  sub_22E7A9E98((void *)a1);
  v22 = v33;
  sub_22E7F3D50();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  unint64_t v24 = v34;
  v25 = v37;
  v23(v34, v37, v6);
  uint64_t v26 = v35;
  int v27 = v22;
  v23(v35, v22, v6);
  uint64_t v28 = v36;
  v23(v36, v24, v6);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686108A0);
  v23(&v28[*(int *)(v29 + 48)], v26, v6);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  v30(v27, v6);
  v30(v25, v6);
  v30(v26, v6);
  return ((uint64_t (*)(char *, uint64_t))v30)(v24, v6);
}

uint64_t sub_22E7A966C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_22E7F3F80();
  sub_22E7A9E98((void *)a1);
  uint64_t v9 = sub_22E7F3F70();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v11;
  long long v12 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v10 + 64) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v10 + 80) = v12;
  long long v13 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v10 + 96) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v10 + 112) = v13;
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v10 + 48) = v14;
  sub_22E7AA784((uint64_t)v7, a3, v10);
  return swift_release();
}

uint64_t sub_22E7A9794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_22E7F3F80();
  v4[3] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  v4[4] = v6;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_22E7A982C, v6, v5);
}

uint64_t sub_22E7A982C()
{
  sub_22E7F31A0();
  sub_22E7A9B74();
  uint64_t v1 = sub_22E7F36B0();
  *(void *)(v0 + 48) = v1;
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v1 + 528) + **(int **)(*(void *)v1 + 528));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22E7A9978;
  return v4();
}

uint64_t sub_22E7A9978()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_22E7A6468, v3, v2);
}

uint64_t sub_22E7A9ABC@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7A9AD8(a1);
}

uint64_t sub_22E7A9AD8@<X0>(uint64_t a1@<X8>)
{
  sub_22E7F3ED0();
  sub_22E7A9CD0();
  uint64_t result = sub_22E7F3B10();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22E7A9B30@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7A86A4(a1);
}

unint64_t sub_22E7A9B74()
{
  unint64_t result = qword_268610868;
  if (!qword_268610868)
  {
    sub_22E7F31A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610868);
  }
  return result;
}

uint64_t sub_22E7A9BCC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 384))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_22E7A9C24(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 392))(*a1);
}

uint64_t sub_22E7A9C74@<X0>(char *a1@<X8>)
{
  return sub_22E7A8B30(*(void *)(v1 + 16), a1);
}

unint64_t sub_22E7A9C7C()
{
  unint64_t result = qword_268610878;
  if (!qword_268610878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610878);
  }
  return result;
}

unint64_t sub_22E7A9CD0()
{
  unint64_t result = qword_268610880;
  if (!qword_268610880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610880);
  }
  return result;
}

unint64_t sub_22E7A9D24()
{
  unint64_t result = qword_268610888;
  if (!qword_268610888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610870);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610888);
  }
  return result;
}

uint64_t sub_22E7A9D80@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 432))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_22E7A9DD8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 440))(*a1);
}

uint64_t sub_22E7A9E28@<X0>(char *a1@<X8>)
{
  return sub_22E7A9270(*(void *)(v1 + 16), a1);
}

uint64_t sub_22E7A9E30()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t sub_22E7A9E60()
{
  return sub_22E7A966C(v0 + 16, (uint64_t)&unk_26E2310F0, (uint64_t)&unk_2686108B0);
}

void *sub_22E7A9E98(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[5];
  char v4 = (void *)a1[7];
  sub_22E7A6E58();
  sub_22E7A6E60(v2);
  sub_22E7A6E60(v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t sub_22E7A9F28(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_22E7A6D00;
  return sub_22E7A9794(a1, v4, v5, v1 + 32);
}

uint64_t sub_22E7A9FDC()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t objectdestroyTm_0()
{
  sub_22E7A6ECC();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  if (*(void *)(v0 + 56)) {
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t sub_22E7AA080()
{
  return sub_22E7A966C(v0 + 16, (uint64_t)&unk_26E231140, (uint64_t)&unk_2686108C0);
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  sub_22E7A6ECC();
  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  if (*(void *)(v0 + 72)) {
    swift_release();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_22E7AA138(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_22E7A7F00;
  return sub_22E7A8F2C(a1, v4, v5, v1 + 32);
}

uint64_t sub_22E7AA1EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASUIExtensionMain(_:)(uint64_t (*a1)(void))
{
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PASUIExtensionHostProxy();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  uint64_t v7 = a1();
  uint64_t v8 = qword_268614C28;
  qword_268614C28 = v7;
  qword_268614C30 = v9;
  qword_268614C38 = v10;
  unk_268614C40 = v6;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  sub_22E7AA4F8(v8);
  uint64_t v11 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  long long v12 = sub_22E7F3570();
  os_log_type_t v13 = sub_22E7F3FD0();
  if (os_log_type_enabled(v12, v13))
  {
    long long v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v14 = 0;
    _os_log_impl(&dword_22E7A0000, v12, v13, "PASUIExtensionMain extension is starting", v14, 2u);
    MEMORY[0x230FA4830](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for PASUIAppExtension();
  sub_22E7AA544();
  sub_22E7F3030();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_22E7AA4F8(uint64_t result)
{
  if (result)
  {
    swift_unknownObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_22E7AA544()
{
  unint64_t result = qword_2686108C8;
  if (!qword_2686108C8)
  {
    type metadata accessor for PASUIAppExtension();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686108C8);
  }
  return result;
}

uint64_t sub_22E7AA59C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t destroy for PASUIExtensionParameters()
{
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUIExtensionParametersVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIExtensionParameters(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PASUIExtensionParameters(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIExtensionParameters(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIExtensionParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIExtensionParameters()
{
  return &type metadata for PASUIExtensionParameters;
}

uint64_t sub_22E7AA784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22E7F3FB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22E7F3FA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22E7A7224(a1, &qword_268610CF0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22E7F3F50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22E7AA930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22E7F3FB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22E7F3FA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22E7A7224(a1, &qword_268610CF0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22E7F3F50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610A60);
  return swift_task_create();
}

unint64_t PASUITargetViewPresenterError.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4179646165726C61;
      break;
    case 2:
      unint64_t result = 0x7669746341746F6ELL;
      break;
    case 3:
      unint64_t result = 0x636E614372657375;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22E7AAB9C(unsigned __int8 *a1, char *a2)
{
  return sub_22E7CF234(*a1, *a2);
}

uint64_t sub_22E7AABA8()
{
  return sub_22E7CF654();
}

uint64_t sub_22E7AABB0()
{
  return sub_22E7CF8CC();
}

uint64_t sub_22E7AABB8()
{
  return sub_22E7CFC10();
}

uint64_t sub_22E7AABC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s23ProximityAppleIDSetupUI29PASUITargetViewPresenterErrorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22E7AABF0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PASUITargetViewPresenterError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22E7AAC1C(uint64_t a1)
{
  unint64_t v2 = sub_22E7B5004();
  return MEMORY[0x270F58B48](a1, v2);
}

uint64_t sub_22E7AAC58()
{
  return *v0 + 1100;
}

uint64_t sub_22E7AAC64(uint64_t a1)
{
  unint64_t v2 = sub_22E7B5004();
  return MEMORY[0x270F58B50](a1, v2);
}

uint64_t sub_22E7AACA0()
{
  return sub_22E7F41F0();
}

uint64_t sub_22E7AACF0(uint64_t a1)
{
  unint64_t v2 = sub_22E7B5004();
  unint64_t v3 = sub_22E7B5058();
  return MEMORY[0x270F58B58](a1, v2, v3);
}

uint64_t sub_22E7AAD40(uint64_t a1)
{
  unint64_t v2 = sub_22E7B46F4();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_22E7AAD7C(uint64_t a1)
{
  unint64_t v2 = sub_22E7B46F4();
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t PASUITargetViewPresenter.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  return MEMORY[0x230FA4900](v1);
}

uint64_t PASUITargetViewPresenter.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*PASUITargetViewPresenter.delegate.modify(void *a1))(void **a1, char a2)
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x230FA4900](v5);
  return sub_22E7AAF9C;
}

void sub_22E7AAF9C(void **a1, char a2)
{
  unint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t PASUITargetViewPresenter.shouldSignInForSelf.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(ObjectType, v1) & 1;
}

uint64_t PASUITargetViewPresenter.shouldSignInForSelf.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, ObjectType, v3);
}

uint64_t (*PASUITargetViewPresenter.shouldSignInForSelf.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  *(void *)a1 = *(void *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = swift_getObjectType();
  *(unsigned char *)(a1 + 24) = (*(uint64_t (**)(void))(v3 + 40))() & 1;
  return sub_22E7AB26C;
}

uint64_t sub_22E7AB26C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 8) + 48))(*(unsigned __int8 *)(a1 + 24), *(void *)(a1 + 16));
}

uint64_t sub_22E7AB2A8()
{
  uint64_t v1 = OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics;
  if (*(void *)(v0 + OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics);
  }
  else
  {
    uint64_t v2 = sub_22E7AB310(v0);
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_22E7AB310(uint64_t a1)
{
  void (*v6)(uint64_t *__return_ptr, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t, unint64_t);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  uint64_t v2 = sub_22E7F2FD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(uint64_t *__return_ptr, uint64_t))(**(void **)(a1
                                                                           + OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider)
                                                             + 128);
  uint64_t v7 = swift_retain();
  v6(&v20, v7);
  swift_release();
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  __swift_project_boxed_opaque_existential_1(&v20, v22);
  uint64_t v10 = (*(uint64_t (**)(ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t))(v9 + 8))(&type metadata for PASUITargetViewPresenter.AnalyticsEvent, &off_26E2313F8, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  sub_22E7F2FC0();
  uint64_t v11 = sub_22E7F2FB0();
  os_log_type_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  long long v14 = MEMORY[0x263F8D310];
  uint64_t v15 = MEMORY[0x263F62548];
  v22 = MEMORY[0x263F8D310];
  uint64_t v23 = MEMORY[0x263F62548];
  long long v20 = v11;
  long long v21 = v13;
  uint64_t v16 = *(void (**)(uint64_t *, uint64_t, unint64_t))(*(void *)v10 + 192);
  v16(&v20, 0x6973736553534150, 0xED000079654B6E6FLL);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  v22 = v14;
  uint64_t v23 = v15;
  long long v20 = 0x746567726174;
  long long v21 = 0xE600000000000000;
  v16(&v20, 0xD000000000000014, 0x800000022E7F9C40);
  uint64_t v17 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  (*(void (**)(uint64_t))(*(void *)v10 + 272))(v17);
  return v10;
}

id PASUITargetViewPresenter.__allocating_init(navigationController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_22E7B3D7C(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

id PASUITargetViewPresenter.init(navigationController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = sub_22E7B3D7C(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

id PASUITargetViewPresenter.__allocating_init(navigationController:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return PASUITargetViewPresenter.init(navigationController:)(a1);
}

id PASUITargetViewPresenter.init(navigationController:)(uint64_t a1)
{
  uint64_t v37 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v34 - v7;
  swift_unknownObjectWeakInit();
  uint64_t v9 = &v1[OBJC_IVAR___PASUIDependentViewPresenter_navigationController];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  uint64_t v35 = (uint64_t)v9;
  *((void *)v9 + 4) = 0;
  *(void *)&v1[OBJC_IVAR___PASUIDependentViewPresenter_flowTimer] = 0;
  uint64_t v10 = OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610698);
  swift_allocObject();
  *(void *)&v1[v10] = sub_22E7F3050();
  uint64_t v11 = OBJC_IVAR___PASUIDependentViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A0);
  swift_allocObject();
  *(void *)&v1[v11] = sub_22E7F3050();
  uint64_t v12 = OBJC_IVAR___PASUIDependentViewPresenter__deviceProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  *(void *)&v1[v12] = sub_22E7F3050();
  uint64_t v13 = OBJC_IVAR___PASUIDependentViewPresenter__targetAppleIDExchanger;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B0);
  swift_allocObject();
  *(void *)&v1[v13] = sub_22E7F3050();
  uint64_t v14 = OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B8);
  swift_allocObject();
  *(void *)&v1[v14] = sub_22E7F3050();
  *(void *)&v1[OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics] = 0;
  uint64_t v15 = OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C0);
  swift_allocObject();
  *(void *)&v1[v15] = sub_22E7F3050();
  long long v34 = v1;
  uint64_t v16 = sub_22E7F3560();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v17(v8, v16, v2);
  v18 = sub_22E7F3570();
  os_log_type_t v19 = sub_22E7F4010();
  if (os_log_type_enabled(v18, v19))
  {
    long long v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v20 = 0;
    _os_log_impl(&dword_22E7A0000, v18, v19, "PAS=== Welcome to ProximityAppleIDSetup - Target ===PAS", v20, 2u);
    MEMORY[0x230FA4830](v20, -1, -1);
  }

  long long v21 = *(void (**)(char *, uint64_t))(v3 + 8);
  v21(v8, v2);
  v17(v6, v16, v2);
  v22 = sub_22E7F3570();
  os_log_type_t v23 = sub_22E7F4010();
  if (os_log_type_enabled(v22, v23))
  {
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v24 = 0;
    _os_log_impl(&dword_22E7A0000, v22, v23, "PASUITargetViewPresenter init with nav controller", v24, 2u);
    MEMORY[0x230FA4830](v24, -1, -1);
  }

  v21(v6, v2);
  sub_22E7F3090();
  swift_retain();
  sub_22E7F3080();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(void *)(swift_allocObject() + 16) = 0;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610928);
  v39[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268610930);
  v39[0] = v25;
  swift_retain();
  sub_22E7F30A0();
  swift_release();
  sub_22E7A7224((uint64_t)v39, &qword_268610938);
  swift_release();
  uint64_t v26 = v37;
  sub_22E7B4230(v37, (uint64_t)v39);
  uint64_t v27 = v35;
  swift_beginAccess();
  sub_22E7B4294((uint64_t)v39, v27);
  swift_endAccess();
  sub_22E7F3350();
  swift_allocObject();
  uint64_t v28 = sub_22E7F3340();
  uint64_t v29 = MEMORY[0x263F62488];
  uint64_t v30 = v34;
  uint64_t v31 = (uint64_t *)&v34[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  *uint64_t v31 = v28;
  v31[1] = v29;

  v38.receiver = v30;
  v38.super_class = ObjectType;
  id v32 = objc_msgSendSuper2(&v38, sel_init);
  __swift_destroy_boxed_opaque_existential_1(v26);
  return v32;
}

id PASUITargetViewPresenter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PASUITargetViewPresenter.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v38 - v7;
  swift_unknownObjectWeakInit();
  uint64_t v9 = &v0[OBJC_IVAR___PASUIDependentViewPresenter_navigationController];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  uint64_t v40 = (uint64_t)v9;
  *((void *)v9 + 4) = 0;
  *(void *)&v0[OBJC_IVAR___PASUIDependentViewPresenter_flowTimer] = 0;
  uint64_t v10 = OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610698);
  swift_allocObject();
  *(void *)&v0[v10] = sub_22E7F3050();
  uint64_t v11 = OBJC_IVAR___PASUIDependentViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A0);
  swift_allocObject();
  *(void *)&v0[v11] = sub_22E7F3050();
  uint64_t v12 = OBJC_IVAR___PASUIDependentViewPresenter__deviceProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  *(void *)&v0[v12] = sub_22E7F3050();
  uint64_t v13 = OBJC_IVAR___PASUIDependentViewPresenter__targetAppleIDExchanger;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B0);
  swift_allocObject();
  *(void *)&v0[v13] = sub_22E7F3050();
  uint64_t v14 = OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B8);
  swift_allocObject();
  *(void *)&v0[v14] = sub_22E7F3050();
  *(void *)&v0[OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics] = 0;
  uint64_t v15 = OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C0);
  swift_allocObject();
  *(void *)&v0[v15] = sub_22E7F3050();
  uint64_t v39 = v0;
  uint64_t v16 = sub_22E7F3560();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v17(v8, v16, v2);
  v18 = sub_22E7F3570();
  os_log_type_t v19 = sub_22E7F4010();
  if (os_log_type_enabled(v18, v19))
  {
    long long v20 = (uint8_t *)swift_slowAlloc();
    objc_super v38 = v8;
    uint64_t v21 = v3;
    uint64_t v22 = v2;
    os_log_type_t v23 = v6;
    unint64_t v24 = ObjectType;
    uint64_t v25 = v20;
    *(_WORD *)long long v20 = 0;
    _os_log_impl(&dword_22E7A0000, v18, v19, "PAS=== Welcome to ProximityAppleIDSetup - Target ===PAS", v20, 2u);
    uint64_t v26 = v25;
    uint64_t ObjectType = v24;
    uint64_t v6 = v23;
    uint64_t v2 = v22;
    uint64_t v3 = v21;
    id v8 = v38;
    MEMORY[0x230FA4830](v26, -1, -1);
  }

  uint64_t v27 = *(void (**)(char *, uint64_t))(v3 + 8);
  v27(v8, v2);
  v17(v6, v16, v2);
  uint64_t v28 = sub_22E7F3570();
  os_log_type_t v29 = sub_22E7F4010();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_22E7A0000, v28, v29, "PASUITargetViewPresenter init", v30, 2u);
    MEMORY[0x230FA4830](v30, -1, -1);
  }

  v27(v6, v2);
  sub_22E7F3090();
  swift_retain();
  sub_22E7F3080();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(void *)(swift_allocObject() + 16) = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610928);
  *((void *)&v43 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268610930);
  *(void *)&long long v42 = v31;
  swift_retain();
  sub_22E7F30A0();
  swift_release();
  sub_22E7A7224((uint64_t)&v42, &qword_268610938);
  swift_release();
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v32 = v40;
  swift_beginAccess();
  sub_22E7B4294((uint64_t)&v42, v32);
  swift_endAccess();
  sub_22E7F3350();
  swift_allocObject();
  uint64_t v33 = sub_22E7F3340();
  uint64_t v34 = MEMORY[0x263F62488];
  uint64_t v35 = v39;
  uint64_t v36 = (uint64_t *)&v39[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  *uint64_t v36 = v33;
  v36[1] = v34;

  v41.receiver = v35;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

id PASUITargetViewPresenter.__deallocating_deinit()
{
  id v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_22E7F3560();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  uint64_t v11 = sub_22E7F3570();
  os_log_type_t v12 = sub_22E7F4010();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = v1;
    uint64_t v14 = v13;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22E7A0000, v11, v12, "PASUITargetViewPresenter deinit", v13, 2u);
    uint64_t v15 = v14;
    id v1 = v21;
    MEMORY[0x230FA4830](v15, -1, -1);
  }

  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v8, v2);
  sub_22E7F3090();
  swift_retain();
  sub_22E7F3060();
  swift_release();
  v10(v6, v9, v2);
  uint64_t v17 = sub_22E7F3570();
  os_log_type_t v18 = sub_22E7F4010();
  if (os_log_type_enabled(v17, v18))
  {
    os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v19 = 0;
    _os_log_impl(&dword_22E7A0000, v17, v18, "PAS=== Goodbye ===PAS", v19, 2u);
    MEMORY[0x230FA4830](v19, -1, -1);
  }

  v16(v6, v2);
  v23.receiver = v1;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, sel_dealloc);
}

uint64_t PASUITargetViewPresenter.activateAndPresentInitialStep(withTemplate:)(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_22E7F3580();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = sub_22E7F3F80();
  v2[20] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[21] = v5;
  v2[22] = v4;
  return MEMORY[0x270FA2498](sub_22E7AC4AC, v5, v4);
}

uint64_t sub_22E7AC4AC()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = *(void (**)(uint64_t))(**(void **)(v0[15]
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider)
                                      + 128);
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  unint64_t v6 = sub_22E7B4340();
  uint64_t v7 = MEMORY[0x263F62558];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  uint64_t v11 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v5 + 24) + **(int **)(v5 + 24));
  id v8 = v1;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[23] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22E7AC630;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_22E7AC630()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 168);
    uint64_t v4 = *(void *)(v2 + 176);
    uint64_t v5 = sub_22E7ACA84;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
    uint64_t v3 = *(void *)(v2 + 168);
    uint64_t v4 = *(void *)(v2 + 176);
    uint64_t v5 = sub_22E7AC74C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_22E7AC74C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  *(void *)(v0 + 200) = sub_22E7F3F70();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7AC7F0;
  return sub_22E7AD9B4();
}

uint64_t sub_22E7AC7F0()
{
  swift_task_dealloc();
  uint64_t v1 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7AC92C, v1, v0);
}

uint64_t sub_22E7AC92C()
{
  uint64_t v1 = v0[15];
  swift_release();
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v2 + 88))(ObjectType, v2);
  (*(void (**)(void))(v2 + 80))();
  swift_unknownObjectRelease();
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[22];
  return MEMORY[0x270FA2498](sub_22E7AC9F8, v4, v5);
}

uint64_t sub_22E7AC9F8()
{
  swift_release();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_22E7ACA84()
{
  uint64_t v26 = v0;
  id v1 = (void *)v0[24];
  uint64_t v3 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[16];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v5 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  id v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F3FF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[24];
    uint64_t v11 = v0[17];
    uint64_t v23 = v0[16];
    uint64_t v24 = v0[18];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v25 = v13;
    v0[12] = v10;
    id v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v15 = sub_22E7F3EA0();
    v0[13] = sub_22E7B3114(v15, v16, &v25);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v8, v9, "Failed to activate PASUITargetViewPresenter with message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v13, -1, -1);
    MEMORY[0x230FA4830](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    uint64_t v17 = (void *)v0[24];
    uint64_t v19 = v0[17];
    uint64_t v18 = v0[18];
    uint64_t v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  v0[25] = sub_22E7F3F70();
  uint64_t v21 = (void *)swift_task_alloc();
  v0[26] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_22E7AC7F0;
  return sub_22E7AD9B4();
}

uint64_t sub_22E7ACEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22E7F3F80();
  v3[5] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7ACF40, v5, v4);
}

uint64_t sub_22E7ACF40()
{
  id v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  id v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *id v6 = v0;
  v6[1] = sub_22E7AD004;
  uint64_t v7 = v0[2];
  return PASUITargetViewPresenter.activateAndPresentInitialStep(withTemplate:)(v7);
}

uint64_t sub_22E7AD004(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 48);
  id v4 = *(void **)(*v1 + 32);
  id v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  id v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t PASUITargetViewPresenter.activate(withTemplate:)(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_22E7F3580();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_22E7F3F80();
  v2[19] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[20] = v5;
  v2[21] = v4;
  return MEMORY[0x270FA2498](sub_22E7AD25C, v5, v4);
}

uint64_t sub_22E7AD25C()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = *(void (**)(uint64_t))(**(void **)(v0[15]
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider)
                                      + 128);
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  unint64_t v6 = sub_22E7B4340();
  uint64_t v7 = MEMORY[0x263F62558];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  uint64_t v11 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v5 + 24) + **(int **)(v5 + 24));
  id v8 = v1;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22E7AD3E0;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_22E7AD3E0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7AD71C;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7AD4FC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_22E7AD4FC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7AD594;
  return sub_22E7AD9B4();
}

uint64_t sub_22E7AD594()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 168);
  uint64_t v3 = *(void *)(v1 + 160);
  return MEMORY[0x270FA2498](sub_22E7AD6B4, v3, v2);
}

uint64_t sub_22E7AD6B4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7AD71C()
{
  uint64_t v26 = v0;
  uint64_t v1 = (void *)v0[23];
  uint64_t v3 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[16];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v5 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  id v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F3FF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[23];
    uint64_t v11 = v0[17];
    uint64_t v23 = v0[16];
    uint64_t v24 = v0[18];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v25 = v13;
    v0[12] = v10;
    id v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v15 = sub_22E7F3EA0();
    v0[13] = sub_22E7B3114(v15, v16, &v25);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v8, v9, "Failed to activate PASUITargetViewPresenter with message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v13, -1, -1);
    MEMORY[0x230FA4830](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    uint64_t v17 = (void *)v0[23];
    uint64_t v19 = v0[17];
    uint64_t v18 = v0[18];
    uint64_t v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  uint64_t v21 = (void *)swift_task_alloc();
  v0[24] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_22E7AD594;
  return sub_22E7AD9B4();
}

uint64_t sub_22E7AD9B4()
{
  v1[9] = v0;
  uint64_t v2 = sub_22E7F3580();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  sub_22E7F3F80();
  v1[14] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v1[15] = v4;
  v1[16] = v3;
  return MEMORY[0x270FA2498](sub_22E7ADAB8, v4, v3);
}

uint64_t sub_22E7ADAB8()
{
  uint64_t v1 = sub_22E7AB2A8();
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 48) = 1;
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 232) + **(int **)(*(void *)v1 + 232));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22E7ADBD8;
  return v4(v0 + 40);
}

uint64_t sub_22E7ADBD8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = *(void *)(v1 + 120);
  return MEMORY[0x270FA2498](sub_22E7ADD1C, v3, v2);
}

uint64_t sub_22E7ADD1C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = sub_22E7AB2A8();
  *(void *)(v0 + 56) = 1;
  *(unsigned char *)(v0 + 64) = 1;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v2 + 264))();
  swift_release();
  *(void *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowTimer) = v3;
  swift_release();
  uint64_t v4 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x230FA4900](v4);
  swift_unknownObjectRelease();
  if (!v5)
  {
    uint64_t v6 = *(void *)(v0 + 104);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v8 = *(void *)(v0 + 88);
    uint64_t v9 = sub_22E7F3560();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
    uint64_t v10 = sub_22E7F3570();
    os_log_type_t v11 = sub_22E7F4000();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_22E7A0000, v10, v11, "PASUITargetViewPresenter delegate is nil in activate", v12, 2u);
      MEMORY[0x230FA4830](v12, -1, -1);
    }
    uint64_t v13 = *(void *)(v0 + 104);
    uint64_t v14 = *(void *)(v0 + 80);
    uint64_t v15 = *(void *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  uint64_t v16 = *(void *)(*(void *)(v0 + 72) + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v18 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v16 + 24);
  uint64_t v19 = swift_unknownObjectRetain();
  v18(v19, &protocol witness table for PASUITargetViewPresenter, ObjectType, v16);
  uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v16 + 64) + **(int **)(v16 + 64));
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v20;
  void *v20 = v0;
  v20[1] = sub_22E7ADFC8;
  return v22(ObjectType, v16);
}

uint64_t sub_22E7ADFC8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = *(void *)(v1 + 120);
  return MEMORY[0x270FA2498](sub_22E7AE0E8, v3, v2);
}

uint64_t sub_22E7AE0E8()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  swift_release();
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F4010();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUITargetViewPresenter activated", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[11];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_22E7AE398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22E7F3F80();
  v3[5] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7AE434, v5, v4);
}

uint64_t sub_22E7AE434()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_22E7B5290;
  uint64_t v7 = v0[2];
  return PASUITargetViewPresenter.activate(withTemplate:)(v7);
}

uint64_t PASUITargetViewPresenter.startFlow(withNavigationController:)(uint64_t a1)
{
  type metadata accessor for PASViewControllerPresentationHandler();
  *(void *)(swift_allocObject() + 16) = a1;
  swift_unknownObjectRetain();
  uint64_t v3 = swift_retain();
  sub_22E7B3820(v3, v1);
  return swift_release_n();
}

uint64_t PASUITargetViewPresenter.startFlow(withFlowStepsHandler:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  id v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return sub_22E7B3A24((uint64_t)v4, v1, v2, v3);
}

Swift::Void __swiftcall PASUITargetViewPresenter.startFlow(withContainerViewController:)(UIViewController *withContainerViewController)
{
  uint64_t v3 = type metadata accessor for PASDefaultFlowStepsPresentationHandler();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = withContainerViewController;
  v9[3] = v3;
  v9[4] = &protocol witness table for PASDefaultFlowStepsPresentationHandler;
  v9[0] = v4;
  uint64_t v5 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  os_log_type_t v6 = withContainerViewController;
  swift_retain();
  sub_22E7B4294((uint64_t)v9, v5);
  swift_endAccess();
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v7 + 88))(ObjectType, v7);
  (*(void (**)(void))(v7 + 80))();
  swift_release();
  swift_unknownObjectRelease();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC19stepDidRequestResetyy0abC011PASFlowStep_pF_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_type_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v29 - v7;
  uint64_t v9 = sub_22E7F3560();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  os_log_type_t v11 = sub_22E7F3570();
  os_log_type_t v12 = sub_22E7F4010();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = v2;
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v6;
    uint64_t v17 = v1;
    uint64_t v18 = v13;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22E7A0000, v11, v12, "PASUITargetViewPresenter reset", v13, 2u);
    uint64_t v19 = v18;
    uint64_t v1 = v17;
    os_log_type_t v6 = v16;
    uint64_t v10 = v15;
    uint64_t v9 = v14;
    uint64_t v2 = v29;
    MEMORY[0x230FA4830](v19, -1, -1);
  }

  uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v8, v2);
  uint64_t v21 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x230FA4900](v21);
  swift_unknownObjectRelease();
  if (!v22)
  {
    v10(v6, v9, v2);
    uint64_t v23 = sub_22E7F3570();
    os_log_type_t v24 = sub_22E7F4000();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_22E7A0000, v23, v24, "PASUITargetViewPresenter delegate is nil in reset", v25, 2u);
      MEMORY[0x230FA4830](v25, -1, -1);
    }

    v20(v6, v2);
  }
  uint64_t v26 = *(void *)(v1 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v26 + 88))(ObjectType, v26);
  (*(void (**)(void))(v26 + 80))();
  return swift_unknownObjectRelease();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC12handleCancelyyF_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_type_t v6 = &v34[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v34[-v7 - 8];
  uint64_t v9 = sub_22E7F3560();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  os_log_type_t v11 = sub_22E7F3570();
  os_log_type_t v12 = sub_22E7F4010();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = v2;
    uint64_t v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = v1;
    uint64_t v17 = v6;
    uint64_t v18 = v13;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22E7A0000, v11, v12, "PASUITargetViewPresenter flowDidCancel", v13, 2u);
    uint64_t v19 = v18;
    os_log_type_t v6 = v17;
    uint64_t v1 = v16;
    uint64_t v10 = v15;
    uint64_t v9 = v14;
    uint64_t v2 = v33;
    MEMORY[0x230FA4830](v19, -1, -1);
  }

  uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v8, v2);
  uint64_t v21 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x230FA4900](v21);
  swift_unknownObjectRelease();
  if (!v22)
  {
    v10(v6, v9, v2);
    uint64_t v23 = sub_22E7F3570();
    os_log_type_t v24 = sub_22E7F4000();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_22E7A0000, v23, v24, "PASUITargetViewPresenter delegate is nil in reset", v25, 2u);
      MEMORY[0x230FA4830](v25, -1, -1);
    }

    v20(v6, v2);
  }
  sub_22E7B47F4();
  uint64_t v26 = swift_allocError();
  *uint64_t v27 = 3;
  v35[0] = v26;
  char v36 = 1;
  uint64_t v28 = MEMORY[0x230FA4900](v21);
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    sub_22E7A71C0((uint64_t)v35, (uint64_t)v34, &qword_2686109B8);
    id v30 = objc_allocWithZone((Class)sub_22E7F3380());
    uint64_t v31 = (void *)sub_22E7F3370();
    objc_msgSend(v29, sel_proximitySetupCompletedWithResult_, v31);
    swift_unknownObjectRelease();
  }
  return sub_22E7A7224((uint64_t)v35, &qword_2686109B8);
}

uint64_t PASUITargetViewPresenter.setTemplate(_:)(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_22E7F3580();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_22E7F3F80();
  v2[19] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[20] = v5;
  v2[21] = v4;
  return MEMORY[0x270FA2498](sub_22E7AEE9C, v5, v4);
}

uint64_t sub_22E7AEE9C()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = *(void (**)(uint64_t))(**(void **)(v0[15]
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider)
                                      + 128);
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  unint64_t v6 = sub_22E7B4340();
  uint64_t v7 = MEMORY[0x263F62558];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  os_log_type_t v11 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v5 + 24) + **(int **)(v5 + 24));
  id v8 = v1;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22E7AF020;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_22E7AF020()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7AF1B0;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7AF13C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_22E7AF13C()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7AF1B0()
{
  uint64_t v26 = v0;
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[17];
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v5 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  id v6 = v1;
  id v7 = v1;
  id v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F3FF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[23];
    uint64_t v11 = v0[17];
    uint64_t v23 = v0[16];
    uint64_t v24 = v0[18];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v25 = v13;
    v0[12] = v10;
    id v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v15 = sub_22E7F3EA0();
    v0[13] = sub_22E7B3114(v15, v16, &v25);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v8, v9, "Failed to set template message session in PASUITargetViewPresenter: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v13, -1, -1);
    MEMORY[0x230FA4830](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    uint64_t v17 = (void *)v0[23];
    uint64_t v19 = v0[17];
    uint64_t v18 = v0[18];
    uint64_t v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_22E7AF59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22E7F3F80();
  v3[5] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7AF638, v5, v4);
}

uint64_t sub_22E7AF638()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  id v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *id v6 = v0;
  v6[1] = sub_22E7AF6FC;
  uint64_t v7 = v0[2];
  return PASUITargetViewPresenter.setTemplate(_:)(v7);
}

uint64_t sub_22E7AF6FC()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 48);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t PASUITargetViewPresenter.proximitySetupSelectedAccountType(_:)(uint64_t a1)
{
  v2[27] = a1;
  v2[28] = v1;
  uint64_t v3 = sub_22E7F3580();
  v2[29] = v3;
  v2[30] = *(void *)(v3 - 8);
  v2[31] = swift_task_alloc();
  sub_22E7F3F80();
  v2[32] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[33] = v5;
  v2[34] = v4;
  return MEMORY[0x270FA2498](sub_22E7AF948, v5, v4);
}

uint64_t sub_22E7AF948()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = sub_22E7AB2A8();
  *(void *)(v0 + 200) = v1;
  *(void *)(v0 + 280) = v2;
  *(unsigned char *)(v0 + 208) = 0;
  uint64_t v5 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v2 + 232) + **(int **)(*(void *)v2 + 232));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7AFA64;
  return v5(v0 + 200);
}

uint64_t sub_22E7AFA64()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 272);
  uint64_t v3 = *(void *)(v1 + 264);
  return MEMORY[0x270FA2498](sub_22E7AFBA8, v3, v2);
}

uint64_t sub_22E7AFBA8()
{
  uint64_t v1 = *(void (**)(uint64_t))(**(void **)(v0[28]
                                                    + OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider)
                                      + 128);
  uint64_t v2 = swift_retain();
  v1(v2);
  swift_release();
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[19];
  __swift_project_boxed_opaque_existential_1(v0 + 15, v3);
  char v5 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v4 + 8))(0, v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 15));
  if ((v5 & 1) != 0
    && (uint64_t v6 = *(void *)(v0[28] + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8),
        uint64_t ObjectType = swift_getObjectType(),
        ((*(uint64_t (**)(uint64_t, uint64_t))(v6 + 40))(ObjectType, v6) & 1) != 0))
  {
    uint64_t v9 = v0[30];
    uint64_t v8 = v0[31];
    uint64_t v10 = v0[29];
    uint64_t v11 = sub_22E7F3560();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
    uint64_t v12 = sub_22E7F3570();
    os_log_type_t v13 = sub_22E7F4010();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_22E7A0000, v12, v13, "PASUITargetViewPresenter proximitySetupSelectedAccountType and signInForSelf is enabled. We'll take it from here", v14, 2u);
      MEMORY[0x230FA4830](v14, -1, -1);
    }
    uint64_t v16 = v0[30];
    uint64_t v15 = v0[31];
    uint64_t v17 = v0[29];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = v0[27];
  }
  uint64_t v19 = v0[28] + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x230FA4900](v19);
  v0[37] = v20;
  if (v20)
  {
    v0[23] = &unk_26E23A580;
    v0[24] = &unk_26E254FD0;
    uint64_t v21 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v21)
    {
      uint64_t v22 = v21;
      if (objc_msgSend(v21, sel_respondsToSelector_, sel_proximitySetupSelectedAccount_completion_))
      {
        v0[2] = v0;
        v0[7] = (char *)v0 + 209;
        v0[3] = sub_22E7AFF2C;
        uint64_t v23 = swift_continuation_init();
        v0[10] = MEMORY[0x263EF8330];
        v0[11] = 0x40000000;
        v0[12] = sub_22E7B00B0;
        v0[13] = &block_descriptor;
        v0[14] = v23;
        objc_msgSend(v22, sel_proximitySetupSelectedAccount_completion_, v18, v0 + 10);
        return MEMORY[0x270FA23F0](v0 + 2);
      }
      swift_release();
      objc_msgSend(v22, sel_proximitySetupSelectedAccountType_, v18);
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(uint64_t))v0[1];
  return v24(1);
}

uint64_t sub_22E7AFF2C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 272);
  uint64_t v2 = *(void *)(*(void *)v0 + 264);
  return MEMORY[0x270FA2498](sub_22E7B0034, v2, v1);
}

uint64_t sub_22E7B0034()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 209);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_22E7B00B0(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return MEMORY[0x270FA2400]();
}

uint64_t PASUITargetViewPresenter.setupPasscodeAndBiometric()()
{
  v1[20] = v0;
  sub_22E7F3F80();
  v1[21] = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  v1[22] = v3;
  v1[23] = v2;
  return MEMORY[0x270FA2498](sub_22E7B016C, v3, v2);
}

uint64_t sub_22E7B016C()
{
  uint64_t v1 = sub_22E7AB2A8();
  *(void *)(v0 + 192) = v1;
  *(void *)(v0 + 144) = 2;
  *(unsigned char *)(v0 + 152) = 1;
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 232) + **(int **)(*(void *)v1 + 232));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22E7B0290;
  return v4(v0 + 144);
}

uint64_t sub_22E7B0290()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 184);
  uint64_t v3 = *(void *)(v1 + 176);
  return MEMORY[0x270FA2498](sub_22E7B03D4, v3, v2);
}

uint64_t sub_22E7B03D4()
{
  uint64_t v1 = v0[20] + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x230FA4900](v1);
  v0[26] = v2;
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    v0[2] = v0;
    v0[7] = (char *)v0 + 153;
    v0[3] = sub_22E7B0544;
    uint64_t v4 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_22E7B00B0;
    v0[13] = &block_descriptor_7;
    v0[14] = v4;
    objc_msgSend(v3, sel_setupPasscodeAndBiometricWithCompletion_, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    swift_release();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5(0);
  }
}

uint64_t sub_22E7B0544()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  uint64_t v2 = *(void *)(*(void *)v0 + 176);
  return MEMORY[0x270FA2498](sub_22E7B064C, v2, v1);
}

uint64_t sub_22E7B064C()
{
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 153);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t PASUITargetViewPresenter.performAIDASignIn(with:)(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  uint64_t v3 = sub_22E7F3580();
  v2[21] = v3;
  v2[22] = *(void *)(v3 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  sub_22E7F3F80();
  v2[26] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[27] = v5;
  v2[28] = v4;
  return MEMORY[0x270FA2498](sub_22E7B07D0, v5, v4);
}

uint64_t sub_22E7B07D0()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 176);
  uint64_t v4 = sub_22E7F3560();
  *(void *)(v0 + 232) = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 240) = v5;
  *(void *)(v0 + 248) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_22E7F3570();
  os_log_type_t v7 = sub_22E7F3FE0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_22E7A0000, v6, v7, "PASUITargetViewPresenter performAIDASignIn", v8, 2u);
    MEMORY[0x230FA4830](v8, -1, -1);
  }
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 168);
  uint64_t v11 = *(void *)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 160);

  os_log_type_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(void *)(v0 + 256) = v13;
  *(void *)(v0 + 264) = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v14 = v12 + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v15 = MEMORY[0x230FA4900](v14);
  swift_unknownObjectRelease();
  if (!v15)
  {
    v5(*(void *)(v0 + 192), v4, *(void *)(v0 + 168));
    uint64_t v16 = sub_22E7F3570();
    os_log_type_t v17 = sub_22E7F4000();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_22E7A0000, v16, v17, "PASUITargetViewPresenter delegate is nil in performAIDASignIn", v18, 2u);
      MEMORY[0x230FA4830](v18, -1, -1);
    }
    uint64_t v19 = *(void *)(v0 + 192);
    uint64_t v20 = *(void *)(v0 + 168);

    v13(v19, v20);
  }
  uint64_t v21 = MEMORY[0x230FA4900](v14);
  *(void *)(v0 + 272) = v21;
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    uint64_t v23 = sub_22E7F30C0();
    *(void *)(v0 + 280) = v23;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 288;
    *(void *)(v0 + 24) = sub_22E7B0C8C;
    uint64_t v24 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_22E7B00B0;
    *(void *)(v0 + 104) = &block_descriptor_9;
    *(void *)(v0 + 112) = v24;
    objc_msgSend(v22, sel_setupPerformAIDASignInWith_completion_, v23, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    swift_release();
    (*(void (**)(void, void, void))(v0 + 240))(*(void *)(v0 + 184), *(void *)(v0 + 232), *(void *)(v0 + 168));
    uint64_t v25 = sub_22E7F3570();
    os_log_type_t v26 = sub_22E7F3FE0();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
    uint64_t v29 = *(void *)(v0 + 184);
    uint64_t v30 = *(void *)(v0 + 168);
    if (v27)
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = v28;
      uint64_t v32 = swift_slowAlloc();
      uint64_t v38 = v32;
      *(_DWORD *)uint64_t v31 = 136446210;
      *(unsigned char *)(v0 + 289) = 2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268610990);
      uint64_t v33 = sub_22E7F3EA0();
      *(void *)(v0 + 144) = sub_22E7B3114(v33, v34, &v38);
      sub_22E7F40C0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22E7A0000, v25, v26, "PASUITargetViewPresenter performAIDASignIn result: %{public}s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v32, -1, -1);
      MEMORY[0x230FA4830](v31, -1, -1);

      v37(v29, v30);
    }
    else
    {

      v28(v29, v30);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
    return v35(0);
  }
}

uint64_t sub_22E7B0C8C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 224);
  uint64_t v2 = *(void *)(*(void *)v0 + 216);
  return MEMORY[0x270FA2498](sub_22E7B0D94, v2, v1);
}

uint64_t sub_22E7B0D94()
{
  uint64_t v18 = v0;
  uint64_t v1 = *(void **)(v0 + 280);
  swift_release();
  uint64_t v2 = *(unsigned __int8 *)(v0 + 288);
  swift_unknownObjectRelease();

  (*(void (**)(void, void, void))(v0 + 240))(*(void *)(v0 + 184), *(void *)(v0 + 232), *(void *)(v0 + 168));
  uint64_t v3 = sub_22E7F3570();
  os_log_type_t v4 = sub_22E7F3FE0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
    uint64_t v15 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v17 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    *(unsigned char *)(v0 + 289) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610990);
    uint64_t v8 = sub_22E7F3EA0();
    *(void *)(v0 + 144) = sub_22E7B3114(v8, v9, &v17);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22E7A0000, v3, v4, "PASUITargetViewPresenter performAIDASignIn result: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v7, -1, -1);
    MEMORY[0x230FA4830](v6, -1, -1);

    v16(v15, v5);
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
    uint64_t v11 = *(void *)(v0 + 184);
    uint64_t v12 = *(void *)(v0 + 168);

    v10(v11, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v13(v2);
}

uint64_t PASUITargetViewPresenter.present(step:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22E7F3580();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  swift_unknownObjectRetain_n();
  uint64_t v14 = sub_22E7F3570();
  os_log_type_t v15 = sub_22E7F4010();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v31 = a2;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v30 = v8;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v29 = v3;
    *(_DWORD *)uint64_t v17 = 136446210;
    v28[1] = v17 + 4;
    uint64_t v32 = a1;
    uint64_t v33 = v31;
    uint64_t v34 = v18;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
    uint64_t v19 = sub_22E7F3EA0();
    uint64_t v32 = sub_22E7B3114(v19, v20, &v34);
    uint64_t v3 = v29;
    sub_22E7F40C0();
    a2 = v31;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_22E7A0000, v14, v15, "PASUITargetViewPresenter present step %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v18, -1, -1);
    uint64_t v21 = v17;
    uint64_t v8 = v30;
    MEMORY[0x230FA4830](v21, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 1, 1, v22);
  sub_22E7F3F80();
  swift_unknownObjectRetain();
  id v23 = v3;
  uint64_t v24 = sub_22E7F3F70();
  uint64_t v25 = (void *)swift_allocObject();
  uint64_t v26 = MEMORY[0x263F8F500];
  v25[2] = v24;
  v25[3] = v26;
  v25[4] = v23;
  v25[5] = a1;
  v25[6] = a2;
  sub_22E7AA784((uint64_t)v8, (uint64_t)&unk_2686109A0, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_22E7B1304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[16] = a5;
  v6[17] = a6;
  v6[15] = a4;
  uint64_t v7 = sub_22E7F3580();
  v6[18] = v7;
  v6[19] = *(void *)(v7 - 8);
  v6[20] = swift_task_alloc();
  sub_22E7F3F80();
  v6[21] = sub_22E7F3F70();
  uint64_t v9 = sub_22E7F3F50();
  v6[22] = v9;
  v6[23] = v8;
  return MEMORY[0x270FA2498](sub_22E7B13FC, v9, v8);
}

uint64_t sub_22E7B13FC()
{
  uint64_t v1 = *(void *)(v0[15] + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v1 + 72) + **(int **)(v1 + 72));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[24] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7B1510;
  uint64_t v5 = v0[16];
  uint64_t v4 = v0[17];
  return v7(v5, v4, ObjectType, v1);
}

uint64_t sub_22E7B1510()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 184);
  uint64_t v4 = *(void *)(v2 + 176);
  if (v0) {
    uint64_t v5 = sub_22E7B1748;
  }
  else {
    uint64_t v5 = sub_22E7B164C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22E7B164C()
{
  uint64_t v1 = v0[15];
  swift_release();
  uint64_t v2 = v1 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  if (*(void *)(v2 + 24))
  {
    uint64_t v4 = v0[16];
    uint64_t v3 = v0[17];
    sub_22E7B4230(v2, (uint64_t)(v0 + 2));
    uint64_t v5 = v0[5];
    uint64_t v6 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8))(v4, v3, v5, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  }
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_22E7B1748()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 152);
  swift_release();
  uint64_t v5 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  swift_unknownObjectRetain();
  id v6 = v1;
  swift_unknownObjectRetain();
  id v7 = v1;
  uint64_t v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F3FF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 200);
    uint64_t v25 = *(void *)(v0 + 152);
    uint64_t v26 = *(void *)(v0 + 144);
    uint64_t v27 = *(void *)(v0 + 160);
    long long v24 = *(_OWORD *)(v0 + 128);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v28 = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    *(_OWORD *)(v0 + 80) = v24;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
    uint64_t v13 = sub_22E7F3EA0();
    *(void *)(v0 + 96) = sub_22E7B3114(v13, v14, &v28);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2082;
    *(void *)(v0 + 104) = v10;
    id v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v16 = sub_22E7F3EA0();
    *(void *)(v0 + 112) = sub_22E7B3114(v16, v17, &v28);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v8, v9, "PASUITargetViewPresenter did not present step %{public}s.\n%{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v12, -1, -1);
    MEMORY[0x230FA4830](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    uint64_t v18 = *(void **)(v0 + 200);
    uint64_t v20 = *(void *)(v0 + 152);
    uint64_t v19 = *(void *)(v0 + 160);
    uint64_t v21 = *(void *)(v0 + 144);

    swift_unknownObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t PASUITargetViewPresenter.flowDidComplete(with:)(uint64_t a1)
{
  v2[30] = a1;
  v2[31] = v1;
  uint64_t v3 = sub_22E7F2FA0();
  v2[32] = v3;
  v2[33] = *(void *)(v3 - 8);
  v2[34] = swift_task_alloc();
  uint64_t v4 = sub_22E7F3580();
  v2[35] = v4;
  v2[36] = *(void *)(v4 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  sub_22E7F3F80();
  v2[39] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  v2[40] = v6;
  v2[41] = v5;
  return MEMORY[0x270FA2498](sub_22E7B1BA8, v6, v5);
}

uint64_t sub_22E7B1BA8()
{
  v48 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 30;
  uint64_t v3 = v0[30];
  uint64_t v4 = (uint64_t)(v0 + 2);
  uint64_t v5 = (uint64_t)(v0 + 9);
  uint64_t v6 = v0[38];
  uint64_t v8 = v0[35];
  uint64_t v7 = v0[36];
  uint64_t v9 = sub_22E7F3560();
  v2[12] = v9;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v2[13] = v10;
  v2[14] = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v6, v9, v8);
  sub_22E7A71C0(v3, v4, &qword_2686109B8);
  uint64_t v11 = sub_22E7F3570();
  os_log_type_t v12 = sub_22E7F4010();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v43 = v1[36];
    uint64_t v44 = v1[35];
    uint64_t v45 = v1[38];
    uint64_t v46 = v5;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    v1[28] = 1752392040;
    uint64_t v47 = v42;
    *(_DWORD *)uint64_t v13 = 141558274;
    sub_22E7F40C0();
    *(_WORD *)(v13 + 12) = 2080;
    sub_22E7A71C0(v4, (uint64_t)(v1 + 16), &qword_2686109B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686109B8);
    uint64_t v14 = sub_22E7F3EA0();
    v1[29] = sub_22E7B3114(v14, v15, &v47);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();
    sub_22E7A7224(v4, &qword_2686109B8);
    _os_log_impl(&dword_22E7A0000, v11, v12, "PASUITargetViewPresenter flowDidComplete with %{mask.hash}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v42, -1, -1);
    uint64_t v16 = v13;
    uint64_t v5 = v46;
    MEMORY[0x230FA4830](v16, -1, -1);

    unint64_t v17 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v17(v45, v44);
  }
  else
  {
    uint64_t v18 = v1[38];
    uint64_t v19 = v1[35];
    uint64_t v20 = v1[36];
    sub_22E7A7224(v4, &qword_2686109B8);

    unint64_t v17 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v17(v18, v19);
  }
  v1[45] = v17;
  uint64_t v21 = v1[31];
  sub_22E7A71C0(v1[30], v5, &qword_2686109B8);
  id v22 = objc_allocWithZone((Class)sub_22E7F3380());
  uint64_t v23 = sub_22E7F3370();
  v1[46] = v23;
  uint64_t v24 = *(void *)(v21 + OBJC_IVAR___PASUIDependentViewPresenter_flowTimer);
  v1[47] = v24;
  if (v24)
  {
    uint64_t v25 = (void *)v23;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v25;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = &unk_2686109C8;
    *(void *)(v27 + 24) = v26;
    v1[26] = &unk_2686109D8;
    v1[27] = v27;
    swift_retain();
    id v28 = v25;
    sub_22E7F2F90();
    uint64_t v29 = (void *)swift_task_alloc();
    v1[48] = v29;
    *uint64_t v29 = v1;
    v29[1] = sub_22E7B20C8;
    uint64_t v30 = v1[34];
    return MEMORY[0x270F58B60](v1 + 26, v30);
  }
  else
  {
    swift_release();
    uint64_t v31 = v1[31] + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
    swift_beginAccess();
    uint64_t v32 = MEMORY[0x230FA4900](v31);
    swift_unknownObjectRelease();
    if (!v32)
    {
      ((void (*)(void, void, void))v1[43])(v1[37], v1[42], v1[35]);
      uint64_t v33 = sub_22E7F3570();
      os_log_type_t v34 = sub_22E7F4000();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_22E7A0000, v33, v34, "PASUITargetViewPresenter delegate is nil in flowDidComplete", v35, 2u);
        MEMORY[0x230FA4830](v35, -1, -1);
      }
      char v36 = (void (*)(uint64_t, uint64_t))v1[45];
      uint64_t v37 = v1[37];
      uint64_t v38 = v1[35];

      v36(v37, v38);
    }
    uint64_t v39 = (void *)MEMORY[0x230FA4900](v31);
    if (v39)
    {
      objc_msgSend(v39, sel_proximitySetupCompletedWithResult_, v1[46]);
      swift_unknownObjectRelease();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v40 = (uint64_t (*)(void))v1[1];
    return v40();
  }
}

uint64_t sub_22E7B20C8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (*v0)[34];
  uint64_t v3 = (*v0)[33];
  uint64_t v4 = (*v0)[32];
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_22E7A6ED4(v1[26]);
  uint64_t v5 = v1[41];
  uint64_t v6 = v1[40];
  return MEMORY[0x270FA2498](sub_22E7B2294, v6, v5);
}

uint64_t sub_22E7B2294()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 248) + OBJC_IVAR___PASUIDependentViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x230FA4900](v1);
  swift_unknownObjectRelease();
  if (!v2)
  {
    (*(void (**)(void, void, void))(v0 + 344))(*(void *)(v0 + 296), *(void *)(v0 + 336), *(void *)(v0 + 280));
    uint64_t v3 = sub_22E7F3570();
    os_log_type_t v4 = sub_22E7F4000();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_22E7A0000, v3, v4, "PASUITargetViewPresenter delegate is nil in flowDidComplete", v5, 2u);
      MEMORY[0x230FA4830](v5, -1, -1);
    }
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
    uint64_t v7 = *(void *)(v0 + 296);
    uint64_t v8 = *(void *)(v0 + 280);

    v6(v7, v8);
  }
  uint64_t v9 = (void *)MEMORY[0x230FA4900](v1);
  if (v9)
  {
    objc_msgSend(v9, sel_proximitySetupCompletedWithResult_, *(void *)(v0 + 368));
    swift_unknownObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_22E7B2438(uint64_t a1)
{
  *(void *)(v1 + 296) = a1;
  return MEMORY[0x270FA2498](sub_22E7B2458, 0, 0);
}

uint64_t sub_22E7B2458()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610A48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22E7F5B70;
  *(void *)(inited + 32) = 0xD00000000000001ALL;
  *(void *)(inited + 40) = 0x800000022E7F9AB0;
  unint64_t v2 = sub_22E7F3360();
  if (v2 >= 3)
  {
    *(void *)(v0 + 280) = v2;
    return sub_22E7F4220();
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 296);
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8D310];
    uint64_t v5 = MEMORY[0x263F62548];
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 80) = v5;
    *(void *)(inited + 48) = 0;
    *(void *)(inited + 56) = 0xE000000000000000;
    sub_22E7C2F0C(inited);
    sub_22E7A71C0(v3 + *MEMORY[0x263F62490], v0 + 104, &qword_2686109B8);
    if (*(unsigned char *)(v0 + 152))
    {
      uint64_t v6 = *(void **)(v0 + 104);
      swift_getErrorValue();
      uint64_t v7 = sub_22E7F4250();
      uint64_t v9 = v8;
      *(void *)(v0 + 224) = v4;
      *(void *)(v0 + 232) = v5;

      *(void *)(v0 + 200) = v7;
      *(void *)(v0 + 208) = v9;
    }
    else
    {
      sub_22E7A7224(v0 + 104, &qword_2686109B8);
      *(_OWORD *)(v0 + 200) = 0u;
      *(_OWORD *)(v0 + 216) = 0u;
      *(void *)(v0 + 232) = 0;
    }
    *(void *)(v0 + 264) = 0xD00000000000001ALL;
    *(void *)(v0 + 272) = 0x800000022E7F9C20;
    *(void *)(v0 + 184) = v4;
    *(void *)(v0 + 192) = v5;
    *(void *)(v0 + 160) = 0;
    *(void *)(v0 + 168) = 0xE000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610AD8);
    uint64_t v11 = sub_22E7F3E30();
    swift_bridgeObjectRelease();
    sub_22E7A7224(v0 + 160, &qword_268610AE0);
    sub_22E7A7224(v0 + 200, &qword_268610AE0);
    uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v12(v11);
  }
}

uint64_t sub_22E7B26E8(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_22E7B27B8;
  return v5();
}

uint64_t sub_22E7B27B8(uint64_t a1)
{
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t PASUITargetViewPresenter.stepDidRequestCancel(_:)()
{
  *(void *)(v1 + 16) = v0;
  sub_22E7F3F80();
  *(void *)(v1 + 24) = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7B2968, v3, v2);
}

uint64_t sub_22E7B2968()
{
  swift_release();
  _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC12handleCancelyyF_0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7B29D4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7B2A68;
  return PASUITargetViewPresenter.performAIDASignIn(with:)(a1);
}

uint64_t sub_22E7B2A68(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_22E7B2B64(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7B5294;
  return PASUITargetViewPresenter.proximitySetupSelectedAccountType(_:)(a1);
}

uint64_t sub_22E7B2BF8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7B5294;
  return PASUITargetViewPresenter.setupPasscodeAndBiometric()();
}

uint64_t sub_22E7B2C84(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7A6D00;
  return PASUITargetViewPresenter.flowDidComplete(with:)(a1);
}

uint64_t sub_22E7B2D1C()
{
  *(void *)(v1 + 16) = v0;
  sub_22E7F3F80();
  *(void *)(v1 + 24) = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7B2DB4, v3, v2);
}

uint64_t sub_22E7B2DB4()
{
  swift_release();
  _s23ProximityAppleIDSetupUI24PASUITargetViewPresenterC19stepDidRequestResetyy0abC011PASFlowStep_pF_0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7B2E18()
{
  *(void *)(v1 + 16) = v0;
  sub_22E7F3F80();
  *(void *)(v1 + 24) = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7B2968, v3, v2);
}

unint64_t sub_22E7B2EB4(uint64_t a1, char a2)
{
  unint64_t v2 = 0xD000000000000024;
  unint64_t v3 = 0xD000000000000033;
  if (a1 == 1) {
    unint64_t v3 = 0xD000000000000024;
  }
  if (a1) {
    unint64_t v2 = v3;
  }
  if (a2) {
    return v2;
  }
  else {
    return 0xD00000000000002ALL;
  }
}

uint64_t sub_22E7B2F2C(unint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    return sub_22E7C2F0C(v8);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610A48);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22E7F5B70;
    *(void *)(inited + 32) = 0xD00000000000001ALL;
    *(void *)(inited + 40) = 0x800000022E7F9AB0;
    if (a1 >= 3)
    {
      uint64_t result = sub_22E7F4220();
      __break(1u);
    }
    else
    {
      uint64_t v4 = *(void *)&aDependenperson[8 * a1];
      uint64_t v5 = *(void *)&aT[8 * a1];
      uint64_t v6 = MEMORY[0x263F62548];
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 80) = v6;
      *(void *)(inited + 48) = v4;
      *(void *)(inited + 56) = v5;
      return sub_22E7C2F0C(inited);
    }
  }
  return result;
}

unint64_t sub_22E7B3020()
{
  return sub_22E7B2EB4(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_22E7B302C()
{
  return sub_22E7B2F2C(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_22E7B3038(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_22E7B3074(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22E7B309C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_22E7B3114(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_22E7F40C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_22E7B3114(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22E7B31E8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22E7B51C8((uint64_t)v12, *a3);
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
      sub_22E7B51C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22E7B31E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22E7F40D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22E7B33A4(a5, a6);
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
  uint64_t v8 = sub_22E7F4170();
  if (!v8)
  {
    sub_22E7F4180();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22E7F41C0();
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

uint64_t sub_22E7B33A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22E7B343C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22E7B361C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22E7B361C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22E7B343C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22E7B35B4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22E7F4140();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22E7F4180();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22E7F3F00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22E7F41C0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22E7F4180();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22E7B35B4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610AF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22E7B361C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610AF0);
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
  uint64_t result = sub_22E7F41C0();
  __break(1u);
  return result;
}

unsigned char **sub_22E7B376C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_22E7B377C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_22E7F41C0();
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

uint64_t sub_22E7B3820(uint64_t a1, uint64_t a2)
{
  v9[3] = type metadata accessor for PASViewControllerPresentationHandler();
  v9[4] = &off_26E231808;
  v9[0] = a1;
  sub_22E7B4230((uint64_t)v9, (uint64_t)v8);
  uint64_t v4 = a2 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  swift_retain();
  sub_22E7B4294((uint64_t)v8, v4);
  swift_endAccess();
  uint64_t v5 = *(void *)(a2 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 88))(ObjectType, v5);
  (*(void (**)(void))(v5 + 80))();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t sub_22E7B3918(uint64_t a1, uint64_t a2)
{
  v10[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268610AD0);
  v10[4] = (uint64_t)&protocol witness table for <A> Binding<A>;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  sub_22E7A71C0(a1, (uint64_t)boxed_opaque_existential_1, &qword_268610AD0);
  sub_22E7B4230((uint64_t)v10, (uint64_t)v9);
  uint64_t v5 = a2 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  sub_22E7B4294((uint64_t)v9, v5);
  swift_endAccess();
  uint64_t v6 = *(void *)(a2 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v6 + 88))(ObjectType, v6);
  (*(void (**)(void))(v6 + 80))();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t sub_22E7B3A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[3] = a3;
  v13[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  sub_22E7B4230((uint64_t)v13, (uint64_t)v12);
  uint64_t v8 = a2 + OBJC_IVAR___PASUIDependentViewPresenter_navigationController;
  swift_beginAccess();
  sub_22E7B4294((uint64_t)v12, v8);
  swift_endAccess();
  uint64_t v9 = *(void *)(a2 + OBJC_IVAR___PASUIDependentViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v9 + 88))(ObjectType, v9);
  (*(void (**)(void))(v9 + 80))();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_22E7B3B3C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_22E7B3C1C;
  return v5(v2 + 32);
}

uint64_t sub_22E7B3C1C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t _s23ProximityAppleIDSetupUI29PASUITargetViewPresenterErrorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22E7F41E0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

id sub_22E7B3D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a3;
  uint64_t v38 = a2;
  uint64_t v40 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v35 - v9;
  swift_unknownObjectWeakInit();
  size_t v11 = &v3[OBJC_IVAR___PASUIDependentViewPresenter_navigationController];
  *(_OWORD *)size_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  uint64_t v36 = (uint64_t)v11;
  *((void *)v11 + 4) = 0;
  *(void *)&v3[OBJC_IVAR___PASUIDependentViewPresenter_flowTimer] = 0;
  uint64_t v12 = OBJC_IVAR___PASUIDependentViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610698);
  swift_allocObject();
  *(void *)&v3[v12] = sub_22E7F3050();
  uint64_t v13 = OBJC_IVAR___PASUIDependentViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A0);
  swift_allocObject();
  *(void *)&v3[v13] = sub_22E7F3050();
  uint64_t v14 = OBJC_IVAR___PASUIDependentViewPresenter__deviceProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  *(void *)&v3[v14] = sub_22E7F3050();
  uint64_t v15 = OBJC_IVAR___PASUIDependentViewPresenter__targetAppleIDExchanger;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B0);
  swift_allocObject();
  *(void *)&v3[v15] = sub_22E7F3050();
  uint64_t v16 = OBJC_IVAR___PASUIDependentViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B8);
  swift_allocObject();
  *(void *)&v3[v16] = sub_22E7F3050();
  *(void *)&v3[OBJC_IVAR___PASUIDependentViewPresenter____lazy_storage___analytics] = 0;
  uint64_t v17 = OBJC_IVAR___PASUIDependentViewPresenter__featureFlagsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C0);
  swift_allocObject();
  *(void *)&v3[v17] = sub_22E7F3050();
  uint64_t v35 = v3;
  uint64_t v18 = sub_22E7F3560();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v19(v10, v18, v4);
  uint64_t v20 = sub_22E7F3570();
  os_log_type_t v21 = sub_22E7F4010();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v22 = 0;
    _os_log_impl(&dword_22E7A0000, v20, v21, "PAS=== Welcome to ProximityAppleIDSetup - Target ===PAS", v22, 2u);
    MEMORY[0x230FA4830](v22, -1, -1);
  }

  uint64_t v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v10, v4);
  v19(v8, v18, v4);
  uint64_t v24 = sub_22E7F3570();
  os_log_type_t v25 = sub_22E7F4010();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_22E7A0000, v24, v25, "PASUITargetViewPresenter init with nav and flow controller", v26, 2u);
    MEMORY[0x230FA4830](v26, -1, -1);
  }

  v23(v8, v4);
  sub_22E7F3090();
  swift_retain();
  sub_22E7F3080();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(void *)(swift_allocObject() + 16) = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610928);
  v42[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268610930);
  v42[0] = v27;
  swift_retain();
  sub_22E7F30A0();
  swift_release();
  sub_22E7A7224((uint64_t)v42, &qword_268610938);
  swift_release();
  uint64_t v28 = v36;
  swift_beginAccess();
  uint64_t v29 = v40;
  sub_22E7B5228(v40, v28);
  swift_endAccess();
  uint64_t v30 = v35;
  uint64_t v31 = &v35[OBJC_IVAR___PASUIDependentViewPresenter_flowController];
  uint64_t v32 = v37;
  *(void *)uint64_t v31 = v38;
  *((void *)v31 + 1) = v32;
  swift_unknownObjectRetain();

  v41.receiver = v30;
  v41.super_class = ObjectType;
  id v33 = objc_msgSendSuper2(&v41, sel_init);
  sub_22E7A7224(v29, &qword_268610940);
  return v33;
}

uint64_t sub_22E7B4230(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22E7B4294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
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

unint64_t sub_22E7B4340()
{
  unint64_t result = qword_268610950;
  if (!qword_268610950)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_268610950);
  }
  return result;
}

uint64_t sub_22E7B4380()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22E7B43C8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_22E7A7F00;
  return sub_22E7B1304(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_22E7B4490()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7B44C8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7B2A68;
  v3[37] = v2;
  return MEMORY[0x270FA2498](sub_22E7B2458, 0, 0);
}

uint64_t sub_22E7B4574()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7B45AC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22E7A6D00;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2686109D0 + dword_2686109D0);
  return v6(a1, v4);
}

unint64_t sub_22E7B4668()
{
  unint64_t result = qword_2686109E8;
  if (!qword_2686109E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686109E8);
  }
  return result;
}

unint64_t sub_22E7B46BC(void *a1)
{
  a1[1] = sub_22E7B46F4();
  a1[2] = sub_22E7B4748();
  unint64_t result = sub_22E7B479C();
  a1[3] = result;
  return result;
}

unint64_t sub_22E7B46F4()
{
  unint64_t result = qword_2686109F0;
  if (!qword_2686109F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686109F0);
  }
  return result;
}

unint64_t sub_22E7B4748()
{
  unint64_t result = qword_2686109F8;
  if (!qword_2686109F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686109F8);
  }
  return result;
}

unint64_t sub_22E7B479C()
{
  unint64_t result = qword_268610A00;
  if (!qword_268610A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610A00);
  }
  return result;
}

unint64_t sub_22E7B47F4()
{
  unint64_t result = qword_268610A08;
  if (!qword_268610A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610A08);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PASUITargetViewPresenterError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PASUITargetViewPresenterError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E7B49B0);
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

uint64_t sub_22E7B49D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22E7B49E4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PASUITargetViewPresenterError()
{
  return &type metadata for PASUITargetViewPresenterError;
}

uint64_t type metadata accessor for PASUITargetViewPresenter()
{
  return self;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PASUITargetViewPresenter.AnalyticsEvent(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PASUITargetViewPresenter.AnalyticsEvent(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_22E7B4A84(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_22E7B4AA0(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUITargetViewPresenter.AnalyticsEvent()
{
  return &type metadata for PASUITargetViewPresenter.AnalyticsEvent;
}

uint64_t sub_22E7B4AD0(uint64_t a1)
{
  unsigned int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268610A50 + dword_268610A50);
  return v6(a1, v4);
}

uint64_t sub_22E7B4B8C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268610A68 + dword_268610A68);
  return v6(v2, v3, v4);
}

uint64_t sub_22E7B4C44()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268611648 + dword_268611648);
  return v6(v2, v3, v4);
}

uint64_t sub_22E7B4D08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unsigned int v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A7F00;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268611650 + dword_268611650);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_22E7B4DD8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268610A80 + dword_268610A80);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_36Tm()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7B4EE0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268610AA0 + dword_268610AA0);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_40Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22E7B4FDC(uint64_t a1)
{
  return a1;
}

unint64_t sub_22E7B5004()
{
  unint64_t result = qword_268610AC0;
  if (!qword_268610AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610AC0);
  }
  return result;
}

unint64_t sub_22E7B5058()
{
  unint64_t result = qword_268610AC8;
  if (!qword_268610AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610AC8);
  }
  return result;
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

uint64_t sub_22E7B5110(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2686119E0 + dword_2686119E0);
  return v6(a1, v4);
}

uint64_t sub_22E7B51C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22E7B5228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_22E7B52A0(void *a1, void *a2)
{
  objc_msgSend(v2, sel_addChildViewController_, a1);
  id v5 = objc_msgSend(a1, sel_view);
  if (!v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  unsigned int v6 = v5;
  objc_msgSend(a2, sel_addSubview_, v5);

  objc_msgSend(a1, sel_didMoveToParentViewController_, v2);
  id v7 = objc_msgSend(a1, sel_view);
  if (!v7)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_268611E10);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_22E7F5E10;
  id v10 = objc_msgSend(a1, sel_view);
  if (!v10)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_topAnchor);

  id v13 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
  id v14 = objc_msgSend(v13, sel_topAnchor);

  id v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(void *)(v9 + 32) = v15;
  id v16 = objc_msgSend(a1, sel_view);
  if (!v16)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v17 = v16;
  id v18 = objc_msgSend(v16, sel_bottomAnchor);

  id v19 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
  id v20 = objc_msgSend(v19, sel_bottomAnchor);

  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(void *)(v9 + 40) = v21;
  id v22 = objc_msgSend(a1, sel_view);
  if (!v22)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v23 = v22;
  id v24 = objc_msgSend(v22, sel_leadingAnchor);

  id v25 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
  id v26 = objc_msgSend(v25, sel_leadingAnchor);

  id v27 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v26);
  *(void *)(v9 + 48) = v27;
  id v28 = objc_msgSend(a1, sel_view);
  if (!v28)
  {
LABEL_15:
    __break(1u);
    return;
  }
  uint64_t v29 = v28;
  uint64_t v30 = self;
  id v31 = objc_msgSend(v29, sel_trailingAnchor);

  id v32 = objc_msgSend(a2, sel_safeAreaLayoutGuide);
  id v33 = objc_msgSend(v32, sel_trailingAnchor);

  id v34 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v33);
  *(void *)(v9 + 56) = v34;
  sub_22E7F3F40();
  sub_22E7B5670();
  id v35 = (id)sub_22E7F3F10();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v35);
}

unint64_t sub_22E7B5670()
{
  unint64_t result = qword_268610AF8;
  if (!qword_268610AF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268610AF8);
  }
  return result;
}

uint64_t sub_22E7B56B0(uint64_t a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  uint64_t result = swift_bridgeObjectRelease();
  if (v2[2])
  {
    uint64_t v4 = v2[3];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = v2[5];
    uint64_t v6 = v2[6];
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v8(v7, v6, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7B5774(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t result = swift_bridgeObjectRelease();
  if (v2[2])
  {
    uint64_t v4 = v2[3];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = v2[7];
    uint64_t v6 = v2[8];
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 40);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v8(v7, v6, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7B5838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v22)(id *__return_ptr, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t ObjectType;
  void (*v26)(id *__return_ptr, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;

  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B00);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v44 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B08);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B10);
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v43 = v14;
  MEMORY[0x270FA5388](v14);
  id v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B18);
  uint64_t v45 = *(void *)(v17 - 8);
  uint64_t v46 = v17;
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  uint64_t v49 = a1;
  v50 = a2;
  uint64_t v47 = a3;
  v48 = a4;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t v20 = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v20 = MEMORY[0x263F8EE88];
  }
  *(void *)(v5 + 32) = v20;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  uint64_t v21 = sub_22E7F3050();
  *(void *)(v5 + 72) = v21;
  id v22 = *(void (**)(id *__return_ptr, uint64_t))(*(void *)v21 + 128);
  uint64_t v23 = swift_retain();
  v22(&v51, v23);
  swift_release();
  id v24 = v52;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v24 + 56))(ObjectType, v24);
  swift_unknownObjectRelease();
  id v26 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v5 + 72) + 128);
  id v27 = swift_retain();
  v26(&v51, v27);
  swift_release();
  id v28 = v52;
  uint64_t v29 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v28 + 40))(v29, v28);
  swift_unknownObjectRelease();
  sub_22E7B6540(&qword_268610B20, &qword_268610B08);
  sub_22E7F3590();
  sub_22E7B63A4();
  v51 = (id)sub_22E7F4050();
  uint64_t v30 = sub_22E7F4030();
  id v31 = (uint64_t)v44;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v44, 1, 1, v30);
  sub_22E7B6540(&qword_268610B28, &qword_268610B10);
  sub_22E7B63E4();
  id v32 = v43;
  sub_22E7F3620();
  sub_22E7A7224(v31, &qword_268610B00);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v32);
  id v33 = swift_allocObject();
  swift_weakInit();
  id v34 = (void *)swift_allocObject();
  uint64_t v36 = v49;
  id v35 = v50;
  v34[2] = v49;
  v34[3] = v35;
  uint64_t v38 = v47;
  uint64_t v37 = v48;
  v34[4] = v33;
  v34[5] = v38;
  v34[6] = v37;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = sub_22E7B64CC;
  *(void *)(v39 + 24) = v34;
  sub_22E7A6E60(v36);
  sub_22E7A6E60(v38);
  sub_22E7B6540(&qword_268610B38, &qword_268610B18);
  uint64_t v40 = v46;
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v19, v40);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  sub_22E7A6ED4(v38);
  sub_22E7A6ED4(v36);
  swift_release();
  return v5;
}

uint64_t sub_22E7B5E14(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t (*a6)(void, void, void, void))
{
  void (*v13)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(void, void, void, void);
  void (*v34)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t ObjectType;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t, uint64_t, uint64_t);
  void v61[3];
  uint64_t v62;
  uint64_t v63;
  void v64[3];
  uint64_t v65;
  uint64_t v66;

  uint64_t v8 = result;
  if (a3)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v10 = (void *)result;
      v60 = a3;
      sub_22E7B6584(v8, (uint64_t)v64);
      uint64_t v11 = v65;
      if (v65)
      {
        uint64_t v12 = v66;
        __swift_project_boxed_opaque_existential_1(v64, v65);
        uint64_t v13 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v12 + 8);
        swift_retain();
        v13(v61, v11, v12);
        uint64_t v14 = v62;
        uint64_t v15 = v63;
        __swift_project_boxed_opaque_existential_1(v61, v62);
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
        uint64_t v17 = v16;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
      }
      else
      {
        swift_retain();
        sub_22E7A7224((uint64_t)v64, (uint64_t *)&unk_268610B40);
        uint64_t v17 = 0;
      }
      sub_22E7B6584(a2, (uint64_t)v64);
      uint64_t v18 = v65;
      if (v65)
      {
        id v19 = v66;
        __swift_project_boxed_opaque_existential_1(v64, v65);
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v19 + 8))(v61, v18, v19);
        unint64_t v20 = v62;
        uint64_t v21 = v63;
        __swift_project_boxed_opaque_existential_1(v61, v62);
        id v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
        uint64_t v18 = v23;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
      }
      else
      {
        sub_22E7A7224((uint64_t)v64, (uint64_t *)&unk_268610B40);
        id v22 = 0;
      }
      id v24 = v60(v11, v17, v22, v18);
      id v26 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v26) {
        id v27 = v24;
      }
      else {
        id v27 = 0;
      }
      id v28 = 0xE000000000000000;
      if (v26) {
        id v28 = v26;
      }
      uint64_t v10[5] = v27;
      v10[6] = v28;
      swift_bridgeObjectRelease();
      if (v10[2])
      {
        v59 = v8;
        uint64_t v29 = v10[3];
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v30 = v10[5];
        id v31 = v10[6];
        id v32 = a2;
        id v33 = a6;
        id v34 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 16);
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        id v35 = v29;
        uint64_t v8 = v59;
        v34(v30, v31, ObjectType, v35);
        a6 = v33;
        a2 = v32;
        swift_unknownObjectRelease();
      }
      sub_22E7A6ED4((uint64_t)v60);
      uint64_t result = swift_release();
    }
  }
  if (a6)
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      uint64_t v36 = (void *)result;
      sub_22E7B6584(v8, (uint64_t)v64);
      uint64_t v37 = v65;
      if (v65)
      {
        uint64_t v38 = v66;
        __swift_project_boxed_opaque_existential_1(v64, v65);
        uint64_t v39 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v38 + 8);
        swift_retain();
        v39(v61, v37, v38);
        uint64_t v40 = v62;
        objc_super v41 = v63;
        __swift_project_boxed_opaque_existential_1(v61, v62);
        uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v40, v41);
        uint64_t v43 = v42;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
      }
      else
      {
        swift_retain();
        sub_22E7A7224((uint64_t)v64, (uint64_t *)&unk_268610B40);
        uint64_t v43 = 0;
      }
      sub_22E7B6584(a2, (uint64_t)v64);
      uint64_t v44 = v65;
      if (v65)
      {
        uint64_t v45 = v66;
        __swift_project_boxed_opaque_existential_1(v64, v65);
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v45 + 8))(v61, v44, v45);
        uint64_t v46 = v62;
        uint64_t v47 = v63;
        __swift_project_boxed_opaque_existential_1(v61, v62);
        v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8))(v46, v47);
        uint64_t v44 = v49;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
      }
      else
      {
        sub_22E7A7224((uint64_t)v64, (uint64_t *)&unk_268610B40);
        v48 = 0;
      }
      v50 = a6(v37, v43, v48, v44);
      v52 = v51;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v36[7] = v50;
      v36[8] = v52;
      swift_bridgeObjectRelease();
      if (v36[2])
      {
        v53 = v36[3];
        v54 = swift_getObjectType();
        v55 = v36[7];
        v56 = v36[8];
        v57 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 40);
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        v57(v55, v56, v54, v53);
        swift_unknownObjectRelease();
      }
      sub_22E7A6ED4((uint64_t)a6);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22E7B6320()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t type metadata accessor for PASUIDeviceStringController()
{
  return self;
}

unint64_t sub_22E7B63A4()
{
  unint64_t result = qword_268611970;
  if (!qword_268611970)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268611970);
  }
  return result;
}

unint64_t sub_22E7B63E4()
{
  unint64_t result = qword_268610B30;
  if (!qword_268610B30)
  {
    sub_22E7B63A4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610B30);
  }
  return result;
}

uint64_t sub_22E7B643C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7B6474()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();
  if (*(void *)(v0 + 40)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22E7B64CC(uint64_t a1, uint64_t a2)
{
  return sub_22E7B5E14(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(uint64_t (**)(void, void, void, void))(v2 + 40));
}

uint64_t sub_22E7B64DC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7B6514(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(a1, a1 + 40);
}

uint64_t sub_22E7B6540(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22E7B6584(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E7B65EC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  swift_unknownObjectRetain();
  uint64_t result = swift_unknownObjectRelease();
  if (v2[2])
  {
    uint64_t v4 = v2[3];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = v2[5];
    uint64_t v7 = v2[6];
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v8(v6, v7, ObjectType, v4);
    uint64_t result = swift_unknownObjectRelease();
    if (v2[2])
    {
      uint64_t v9 = v2[3];
      uint64_t v10 = swift_getObjectType();
      uint64_t v12 = v2[7];
      uint64_t v11 = v2[8];
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 40);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      v13(v12, v11, v10, v9);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

id sub_22E7B670C(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedTermsRemoteUI];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo;
  uint64_t v8 = v1;
  *(void *)&v1[v7] = sub_22E7C2DC8(MEMORY[0x263F8EE78]);
  v8[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept] = 0;
  uint64_t v9 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  *(void *)&v8[v9] = sub_22E7F3050();
  *(void *)&v8[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_authResults] = a1;

  v11.receiver = v8;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_22E7B6808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[16] = a7;
  v8[17] = v7;
  v8[14] = a5;
  v8[15] = a6;
  v8[12] = a3;
  v8[13] = a4;
  v8[10] = a1;
  v8[11] = a2;
  return MEMORY[0x270FA2498](sub_22E7B6834, 0, 0);
}

uint64_t sub_22E7B6834()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v26 = v0[11];
  uint64_t v2 = (void *)v0[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610C08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22E7F5EC0;
  uint64_t v4 = (void *)*MEMORY[0x263F25738];
  *(void *)(inited + 32) = *MEMORY[0x263F25738];
  uint64_t v5 = (void *)*MEMORY[0x263F25720];
  uint64_t v6 = (void *)*MEMORY[0x263F25730];
  *(void *)(inited + 40) = *MEMORY[0x263F25720];
  *(void *)(inited + 48) = v6;
  uint64_t v7 = (void *)*MEMORY[0x263F25728];
  *(void *)(inited + 56) = *MEMORY[0x263F25728];
  swift_bridgeObjectRetain();
  id v27 = v2;
  id v8 = v1;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  sub_22E7B81F8(inited);
  swift_setDeallocating();
  type metadata accessor for AATermsEntry(0);
  swift_arrayDestroy();
  id v13 = objc_allocWithZone(MEMORY[0x263F25D18]);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610CD0);
  uint64_t v14 = (void *)sub_22E7F3E00();
  swift_bridgeObjectRelease();
  sub_22E7B8A4C(&qword_2686107D0, type metadata accessor for AATermsEntry);
  uint64_t v15 = (void *)sub_22E7F3FC0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_initWithAuthResults_proxiedDevice_anisetteDataProvider_appProvidedContext_termsEntries_, v14, v27, v26, v8, v15);
  v0[18] = v16;

  swift_unknownObjectRelease();
  id v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268610CE0
                                                                                              + dword_268610CE0);
  id v17 = v16;
  uint64_t v18 = (void *)swift_task_alloc();
  v0[19] = v18;
  void *v18 = v0;
  v18[1] = sub_22E7B6ADC;
  uint64_t v19 = v0[16];
  uint64_t v20 = v0[17];
  uint64_t v21 = v0[14];
  uint64_t v22 = v0[15];
  uint64_t v23 = v0[13];
  uint64_t v24 = v0[10];
  return v28(v24, (uint64_t)v17, v23, v21, v22, v19, v20);
}

uint64_t sub_22E7B6ADC()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 144);
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_22E7B6BF0, 0, 0);
}

uint64_t sub_22E7B6BF0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7B6C50(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo;
  if (*(void *)(*(void *)(v2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo)
                 + 16))
  {
    uint64_t v9 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
    id v10 = sub_22E7F3570();
    os_log_type_t v11 = sub_22E7F3FF0();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_22E7A0000, v10, v11, "PASUIProxiedTermsHandler setAcceptedTermsInfo is not empty", v12, 2u);
      MEMORY[0x230FA4830](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(void *)(v2 + v8) = a1;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept) == 1) {
    return sub_22E7B6E00();
  }
  return result;
}

uint64_t sub_22E7B6E00()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v47 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v46 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v45 = (char *)&v43 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v43 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v43 - v13;
  uint64_t v15 = sub_22E7F3560();
  id v16 = *(void (**)(char *))(v5 + 16);
  uint64_t v48 = v15;
  v16(v14);
  id v17 = sub_22E7F3570();
  os_log_type_t v18 = sub_22E7F3FE0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = v16;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_22E7A0000, v17, v18, "PASUIProxiedTermsHandler handleAccept", v20, 2u);
    uint64_t v21 = v20;
    id v16 = v19;
    MEMORY[0x230FA4830](v21, -1, -1);
  }

  uint64_t v22 = *(void (**)(char *, uint64_t))(v5 + 8);
  v22(v14, v4);
  uint64_t v23 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept;
  if (v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_didAccept] == 1)
  {
    ((void (*)(char *, uint64_t, uint64_t))v16)(v12, v48, v4);
    uint64_t v24 = sub_22E7F3570();
    os_log_type_t v25 = sub_22E7F3FF0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = v16;
      id v27 = v26;
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_22E7A0000, v24, v25, "PASUIProxiedTermsHandler handleAccept entered multiple times", v26, 2u);
      id v28 = v27;
      id v16 = v44;
      MEMORY[0x230FA4830](v28, -1, -1);
    }

    v22(v12, v4);
  }
  v1[v23] = 1;
  if (*(void *)(*(void *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo]
                 + 16))
  {
    uint64_t v29 = *(void *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction];
    if (v29)
    {
      uint64_t v30 = *(void *)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction + 8];
      uint64_t v31 = sub_22E7F3FB0();
      uint64_t v32 = (uint64_t)v47;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v47, 1, 1, v31);
      sub_22E7F3F80();
      sub_22E7A6E60(v29);
      sub_22E7A6E60(v29);
      id v33 = v1;
      uint64_t v34 = sub_22E7F3F70();
      id v35 = (void *)swift_allocObject();
      uint64_t v36 = MEMORY[0x263F8F500];
      v35[2] = v34;
      v35[3] = v36;
      v35[4] = v29;
      v35[5] = v30;
      void v35[6] = v33;
      sub_22E7AA784(v32, (uint64_t)&unk_268610D00, (uint64_t)v35);
      sub_22E7A6ED4(v29);
      return swift_release();
    }
    uint64_t v38 = v45;
    ((void (*)(char *, uint64_t, uint64_t))v16)(v45, v48, v4);
    uint64_t v39 = sub_22E7F3570();
    os_log_type_t v40 = sub_22E7F3FF0();
    if (os_log_type_enabled(v39, v40))
    {
      objc_super v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v41 = 0;
      uint64_t v42 = "PASUIProxiedTermsHandler handleAccept acceptAction is nil";
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v38 = v46;
    ((void (*)(char *, uint64_t, uint64_t))v16)(v46, v48, v4);
    uint64_t v39 = sub_22E7F3570();
    os_log_type_t v40 = sub_22E7F3FF0();
    if (os_log_type_enabled(v39, v40))
    {
      objc_super v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v41 = 0;
      uint64_t v42 = "PASUIProxiedTermsHandler handleAccept acceptedTermsInfo isEmpty";
LABEL_14:
      _os_log_impl(&dword_22E7A0000, v39, v40, v42, v41, 2u);
      MEMORY[0x230FA4830](v41, -1, -1);
    }
  }

  return ((uint64_t (*)(char *, uint64_t))v22)(v38, v4);
}

uint64_t sub_22E7B72F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  void v6[2] = a4;
  sub_22E7F3F80();
  v6[5] = sub_22E7F3F70();
  uint64_t v8 = sub_22E7F3F50();
  v6[6] = v8;
  v6[7] = v7;
  return MEMORY[0x270FA2498](sub_22E7B7394, v8, v7);
}

uint64_t sub_22E7B7394()
{
  uint64_t v1 = *(void *)(v0[4] + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptedTermsInfo);
  uint64_t v2 = (int *)v0[2];
  v0[8] = v1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7B748C;
  return v5(v1);
}

uint64_t sub_22E7B748C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_22E7B75D0, v3, v2);
}

uint64_t sub_22E7B75D0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7B7630()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22E7F3580();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v35 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = sub_22E7F3560();
  id v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v10, v11, v5);
  uint64_t v13 = sub_22E7F3570();
  os_log_type_t v14 = sub_22E7F3FE0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = v11;
    id v16 = v12;
    uint64_t v17 = v1;
    os_log_type_t v18 = v4;
    uint64_t v19 = v15;
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_22E7A0000, v13, v14, "PASUIProxiedTermsHandler handleDecline", v15, 2u);
    uint64_t v20 = v19;
    uint64_t v4 = v18;
    uint64_t v1 = v17;
    id v12 = v16;
    uint64_t v11 = v34;
    MEMORY[0x230FA4830](v20, -1, -1);
  }

  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v10, v5);
  uint64_t v22 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction;
  uint64_t v23 = *(void *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction);
  if (v23)
  {
    uint64_t v24 = *(void *)(v22 + 8);
    uint64_t v25 = sub_22E7F3FB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v4, 1, 1, v25);
    sub_22E7F3F80();
    swift_retain_n();
    uint64_t v26 = sub_22E7F3F70();
    id v27 = (void *)swift_allocObject();
    uint64_t v28 = MEMORY[0x263F8F500];
    v27[2] = v26;
    v27[3] = v28;
    v27[4] = v23;
    v27[5] = v24;
    sub_22E7AA784((uint64_t)v4, (uint64_t)&unk_268610D10, (uint64_t)v27);
    sub_22E7A6ED4(v23);
    return swift_release();
  }
  else
  {
    uint64_t v30 = v35;
    v12(v35, v11, v5);
    uint64_t v31 = sub_22E7F3570();
    os_log_type_t v32 = sub_22E7F3FF0();
    if (os_log_type_enabled(v31, v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v33 = 0;
      _os_log_impl(&dword_22E7A0000, v31, v32, "PASUIProxiedTermsHandler handleDecline declineAction is nil", v33, 2u);
      MEMORY[0x230FA4830](v33, -1, -1);
    }

    return ((uint64_t (*)(char *, uint64_t))v21)(v30, v5);
  }
}

uint64_t sub_22E7B79A0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[2] = sub_22E7F3F80();
  v4[3] = sub_22E7F3F70();
  uint64_t v8 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_22E7B7A94;
  return v8();
}

uint64_t sub_22E7B7A94()
{
  swift_task_dealloc();
  uint64_t v1 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7A6468, v1, v0);
}

id sub_22E7B7C00()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PASUIProxiedTermsHandler()
{
  return self;
}

uint64_t sub_22E7B7D00@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_22E7F35C0();
  *a1 = result;
  return result;
}

uint64_t sub_22E7B7D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v16 = *v7;
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = sub_22E7A6D00;
  v17[16] = a7;
  v17[17] = v16;
  v17[14] = a5;
  v17[15] = a6;
  v17[12] = a3;
  v17[13] = a4;
  v17[10] = a1;
  v17[11] = a2;
  return MEMORY[0x270FA2498](sub_22E7B6834, 0, 0);
}

uint64_t sub_22E7B7F38()
{
  return MEMORY[0x263EFDDD8];
}

unint64_t sub_22E7B7F44(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_22E7F41A0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_268610D18);
      uint64_t result = sub_22E7F4120();
      unint64_t v3 = result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_22E7F41A0();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  unint64_t v8 = v3 + 56;
  unint64_t v22 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v21 = v1;
  while (v22)
  {
    uint64_t result = MEMORY[0x230FA3F60](v7, v1);
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_26;
    }
LABEL_18:
    sub_22E7F35B0();
    sub_22E7B8A4C(&qword_268610D20, MEMORY[0x263EFDD18]);
    uint64_t result = sub_22E7F3E40();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)(v8 + 8 * (v12 >> 6));
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_22E7B8A4C(&qword_268610D28, MEMORY[0x263EFDD18]);
      do
      {
        uint64_t result = sub_22E7F3E50();
        if (result)
        {
          uint64_t result = swift_release();
          unint64_t v1 = v21;
          goto LABEL_11;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)(v8 + 8 * (v12 >> 6));
        uint64_t v15 = 1 << v12;
      }
      while ((v14 & (1 << v12)) != 0);
      unint64_t v1 = v21;
    }
    *(void *)(v8 + 8 * v13) = v15 | v14;
    *(void *)(*(void *)(v3 + 48) + 8 * v12) = v9;
    uint64_t v17 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v17, 1);
    uint64_t v18 = v17 + 1;
    if (v10) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v18;
LABEL_11:
    if (v7 == v5) {
      return v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_28;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_22E7B81F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610CE8);
    uint64_t v3 = sub_22E7F4120();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_22E7F3E90();
      sub_22E7F42A0();
      id v7 = v6;
      sub_22E7F3EE0();
      uint64_t v8 = sub_22E7F42C0();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_22E7F3E90();
        uint64_t v17 = v16;
        if (v15 == sub_22E7F3E90() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_22E7F4210();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_22E7F3E90();
          uint64_t v24 = v23;
          if (v22 == sub_22E7F3E90() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_22E7F4210();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_22E7B8428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  v7[8] = a2;
  v7[9] = a3;
  v7[7] = a1;
  uint64_t v8 = sub_22E7F3580();
  v7[14] = v8;
  v7[15] = *(void *)(v8 - 8);
  v7[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22E7B84F4, 0, 0);
}

uint64_t sub_22E7B84F4()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F4010();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUIProxiedTermsHandler loadProxiedTerms", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }
  uint64_t v9 = v0[15];
  uint64_t v8 = v0[16];
  uint64_t v10 = v0[13];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[10];
  uint64_t v26 = v0[11];
  uint64_t v27 = v0[12];
  uint64_t v13 = (void *)v0[8];
  uint64_t v14 = v0[9];
  uint64_t v15 = (void *)v0[7];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
  objc_msgSend(v13, sel_setDelegate_, v10);
  uint64_t v16 = *(void **)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice);
  *(void *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice) = v15;

  uint64_t v17 = (void *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction);
  uint64_t v18 = *(void *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction);
  *uint64_t v17 = v14;
  v17[1] = v12;
  id v19 = v15;
  sub_22E7A6ED4(v18);
  char v20 = (void *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction);
  uint64_t v21 = *(void *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction);
  void *v20 = v26;
  v20[1] = v27;
  swift_retain();
  sub_22E7A6ED4(v21);
  uint64_t v22 = (void *)(v10 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedTermsRemoteUI);
  void *v22 = v13;
  v22[1] = &off_26E231678;
  swift_retain();
  swift_unknownObjectRelease();
  sub_22E7F3F80();
  swift_unknownObjectRetain();
  v0[17] = sub_22E7F3F70();
  uint64_t v24 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7B871C, v24, v23);
}

uint64_t sub_22E7B871C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = (void *)v0[8];
  swift_release();
  uint64_t v3 = *(void (**)(uint64_t))(**(void **)(v1
                                                    + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler__viewControllerProvider)
                                      + 128);
  uint64_t v4 = swift_retain();
  v3(v4);
  swift_release();
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v5);
  id v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  objc_msgSend(v2, sel_presentFromViewController_modal_, v7, 1);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_22E7B883C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22E7B8884(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_22E7A7F00;
  return sub_22E7B72F8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_22E7B894C()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22E7B898C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A7F00;
  return sub_22E7B79A0(a1, v4, v5, v6);
}

uint64_t sub_22E7B8A4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t PASFlowStepPasscodeBiometricsRequest.buildView()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610D40);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - v5;
  sub_22E7B9F30(&qword_268610D48, MEMORY[0x263F62538]);
  swift_retain();
  uint64_t v7 = sub_22E7F37A0();
  unint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  uint64_t v10 = sub_22E7F3050();
  uint64_t v15 = (ValueMetadata *)v7;
  unint64_t v16 = v9;
  uint64_t v17 = v10;
  unint64_t v11 = sub_22E7B8CC8();
  sub_22E7F3C00();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  uint64_t v15 = &type metadata for PASUIPasscodeBiometricsRequestView;
  unint64_t v16 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_22E7B8CC8()
{
  unint64_t result = qword_268610D50;
  if (!qword_268610D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268610D50);
  }
  return result;
}

void sub_22E7B8D1C(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[40] = 1;
}

uint64_t sub_22E7B8D2C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610D40);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - v5;
  sub_22E7B9F30(&qword_268610D48, MEMORY[0x263F62538]);
  swift_retain();
  uint64_t v7 = sub_22E7F37A0();
  unint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  uint64_t v10 = sub_22E7F3050();
  uint64_t v15 = (ValueMetadata *)v7;
  unint64_t v16 = v9;
  uint64_t v17 = v10;
  unint64_t v11 = sub_22E7B8CC8();
  sub_22E7F3C00();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  uint64_t v15 = &type metadata for PASUIPasscodeBiometricsRequestView;
  unint64_t v16 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

uint64_t destroy for PASUIPasscodeBiometricsRequestView()
{
  swift_release();
  return swift_release();
}

void *_s23ProximityAppleIDSetupUI34PASUIPasscodeBiometricsRequestViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIPasscodeBiometricsRequestView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PASUIPasscodeBiometricsRequestView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIPasscodeBiometricsRequestView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIPasscodeBiometricsRequestView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIPasscodeBiometricsRequestView()
{
  return &type metadata for PASUIPasscodeBiometricsRequestView;
}

uint64_t sub_22E7B9108()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7B9124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_22E7F3760();
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22E7F3FB0();
  uint64_t v26 = *(void *)(v12 - 8);
  uint64_t v13 = v26;
  uint64_t v27 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = (void *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a1;
  v17[3] = a2;
  v17[4] = a3;
  swift_retain_n();
  uint64_t v18 = swift_retain_n();
  uint64_t v25 = sub_22E7B9528(v18);
  uint64_t v20 = v19;
  swift_retain_n();
  sub_22E7F3F90();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(&v11[*(int *)(v9 + 28)], v15, v27);
  *(void *)unint64_t v11 = &unk_268610D60;
  *((void *)v11 + 1) = a2;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C8);
  sub_22E7A6DF4((uint64_t)v11, a4 + *(int *)(v21 + 36));
  *(void *)a4 = sub_22E7A6BD4;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = sub_22E7B94C8;
  *(void *)(a4 + 32) = v16;
  *(void *)(a4 + 40) = sub_22E7B9514;
  *(void *)(a4 + 48) = v17;
  uint64_t v22 = v25;
  *(void *)(a4 + 56) = 0;
  *(void *)(a4 + 64) = v22;
  *(void *)(a4 + 72) = v20;
  *(unsigned char *)(a4 + 80) = 1;
  *(void *)(a4 + 88) = MEMORY[0x263F8EE78];
  sub_22E7A6E58();
  sub_22E7A6E60((uint64_t)sub_22E7B94C8);
  sub_22E7A6E60((uint64_t)sub_22E7B9514);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22E7A6E70((uint64_t)v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v27);
  sub_22E7A6ECC();
  sub_22E7A6ED4((uint64_t)sub_22E7B94C8);
  sub_22E7A6ED4((uint64_t)sub_22E7B9514);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7B9408()
{
  v0[2] = sub_22E7F3F80();
  v0[3] = sub_22E7F3F70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7B7A94;
  return MEMORY[0x270F58B30]();
}

uint64_t sub_22E7B94B8@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7B9124(*v1, v1[1], v1[2], a1);
}

uint64_t sub_22E7B94C8()
{
  return sub_22E7B97F8(*(void *)(v0 + 32));
}

uint64_t objectdestroyTm_1()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7B9514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22E7B9B3C(a3, a4, v4[2], v4[3], v4[4]);
}

uint64_t sub_22E7B9528(uint64_t a1)
{
  void (*v1)(uint64_t *__return_ptr);
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void v21[3];
  uint64_t v22;
  uint64_t v23;

  uint64_t v1 = *(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 128);
  v1(&v17);
  unint64_t v2 = v18;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v2 + 8))(v21, ObjectType, v2);
  swift_unknownObjectRelease();
  uint64_t v4 = v22;
  if (v22)
  {
    uint64_t v5 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
    uint64_t v8 = v7;
    uint64_t v9 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    if (v8) {
      return v6;
    }
  }
  else
  {
    uint64_t v9 = sub_22E7B9798((uint64_t)v21);
  }
  ((void (*)(uint64_t *__return_ptr, uint64_t))v1)(&v17, v9);
  uint64_t v10 = v18;
  unint64_t v11 = swift_getObjectType();
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v21, v11, v10);
  swift_unknownObjectRelease();
  uint64_t v12 = v22;
  if (v22)
  {
    uint64_t v13 = v23;
    __swift_project_boxed_opaque_existential_1(v21, v22);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 8))(&v17, v12, v13);
    uint64_t v14 = v19;
    uint64_t v15 = v20;
    __swift_project_boxed_opaque_existential_1(&v17, v19);
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22E7B9798((uint64_t)v21);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v6;
}

uint64_t sub_22E7B9708()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7A6D00;
  return sub_22E7B9408();
}

uint64_t sub_22E7B9798(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610B40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22E7B97F8(uint64_t a1)
{
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)a1 + 128))(&v22, v4);
  uint64_t v7 = *((void *)&v22 + 1);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v7 + 8))(&v22, ObjectType, v7);
  swift_unknownObjectRelease();
  if (v23)
  {
    sub_22E7B9E68(&v22, (uint64_t)v25);
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    v21[0] = 0x45444F4353534150;
    v21[1] = 0xE90000000000005FLL;
    uint64_t v9 = v26;
    uint64_t v10 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    uint64_t v11 = v26;
    uint64_t v12 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v12 + 8))(&v22, v11, v12);
    uint64_t v13 = v23;
    uint64_t v14 = v24;
    __swift_project_boxed_opaque_existential_1(&v22, v23);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    uint64_t v15 = sub_22E7F3ED0();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  else
  {
    sub_22E7B9798((uint64_t)&v22);
    uint64_t v16 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v16, v2);
    uint64_t v17 = sub_22E7F3570();
    os_log_type_t v18 = sub_22E7F3FF0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_22E7A0000, v17, v18, "PASUIPasscodeBiometricsRequestView title targetDevice is nil", v19, 2u);
      MEMORY[0x230FA4830](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return sub_22E7F3ED0();
  }
  return v15;
}

uint64_t sub_22E7B9B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v5)(void *__return_ptr, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void v17[2];
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  uint64_t v5 = *(void (**)(void *__return_ptr, uint64_t))(*(void *)a5 + 128);
  uint64_t v6 = swift_bridgeObjectRetain();
  v5(v17, v6);
  uint64_t v7 = v17[1];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(unint64_t *__return_ptr, uint64_t, uint64_t))(v7 + 8))(&v18, ObjectType, v7);
  swift_unknownObjectRelease();
  uint64_t v9 = v20;
  if (v20)
  {
    uint64_t v10 = v21;
    __swift_project_boxed_opaque_existential_1(&v18, v20);
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  }
  else
  {
    sub_22E7B9798((uint64_t)&v18);
  }
  swift_retain();
  uint64_t v11 = sub_22E7F3500();
  uint64_t v13 = v12;
  swift_release();
  os_log_type_t v18 = 0;
  uint64_t v19 = 0xE000000000000000;
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  if (v13)
  {
    os_log_type_t v18 = 0xD00000000000001BLL;
    uint64_t v19 = 0x800000022E7FA090;
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610D68);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_22E7F5B70;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 64) = sub_22E7B9E14();
    *(void *)(v14 + 32) = v11;
    *(void *)(v14 + 40) = v13;
    uint64_t v15 = sub_22E7F3EB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_type_t v18 = 0xD00000000000001ELL;
    uint64_t v19 = 0x800000022E7FA070;
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_22E7F3ED0();
  }
  swift_bridgeObjectRelease();
  return v15;
}

unint64_t sub_22E7B9E14()
{
  unint64_t result = qword_268611810;
  if (!qword_268611810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611810);
  }
  return result;
}

uint64_t sub_22E7B9E68(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_22E7B9E84()
{
  unint64_t result = qword_268610708;
  if (!qword_268610708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2686106C8);
    sub_22E7A7030();
    sub_22E7B9F30((unint64_t *)&qword_268610700, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610708);
  }
  return result;
}

uint64_t sub_22E7B9F30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22E7B9F78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610D70);
  if (swift_dynamicCast())
  {
    sub_22E7B9E68(v9, (uint64_t)v13);
    uint64_t v4 = v14;
    uint64_t v5 = v15;
    __swift_project_boxed_opaque_existential_1(v13, v14);
    *(void *)&v9[0] = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    id v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268610D80));
    uint64_t v7 = (void *)sub_22E7F3910();
    objc_msgSend(*(id *)(v3 + 16), sel_pushViewController_animated_, v7, 0);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    return sub_22E7BA1DC((uint64_t)v9);
  }
}

uint64_t sub_22E7BA084()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_22E7BA0BC(uint64_t a1, uint64_t a2)
{
  return sub_22E7B9F78(a1, a2);
}

uint64_t PASDefaultFlowStepsPresentationHandler.present(step:)(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610D70);
  if (swift_dynamicCast())
  {
    sub_22E7B9E68(v7, (uint64_t)v11);
    uint64_t v2 = v12;
    uint64_t v3 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    *(void *)&v7[0] = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    id v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268610D80));
    uint64_t v5 = (void *)sub_22E7F3910();
    _s23ProximityAppleIDSetupUI38PASDefaultFlowStepsPresentationHandlerC18pushViewController_8animatedySo06UIViewL0C_SbtF_0(v5);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
    return sub_22E7BA1DC((uint64_t)v7);
  }
}

uint64_t sub_22E7BA1DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610D78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PASDefaultFlowStepsPresentationHandler.deinit()
{
  return v0;
}

uint64_t PASDefaultFlowStepsPresentationHandler.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_22E7BA298(uint64_t a1, uint64_t a2)
{
  return PASDefaultFlowStepsPresentationHandler.present(step:)(a1, a2);
}

void _s23ProximityAppleIDSetupUI38PASDefaultFlowStepsPresentationHandlerC18pushViewController_8animatedySo06UIViewL0C_SbtF_0(void *a1)
{
  uint64_t v3 = sub_22E7F3580();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v1 + 16);
  uint64_t v8 = (uint8_t *)objc_msgSend(v7, sel_view);
  if (!v8)
  {
    uint64_t v19 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v19, v3);
    swift_retain_n();
    uint64_t v20 = sub_22E7F3570();
    os_log_type_t v21 = sub_22E7F3FF0();
    if (os_log_type_enabled(v20, v21))
    {
      long long v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      BOOL v29 = v22;
      uint64_t v30 = v7;
      *(_DWORD *)long long v22 = 138543362;
      uint64_t v23 = v7;
      id v24 = v7;
      sub_22E7F40C0();
      uint64_t v25 = v27;
      *uint64_t v27 = v23;
      swift_release_n();
      uint64_t v26 = v29;
      _os_log_impl(&dword_22E7A0000, v20, v21, "PASUITargetViewPresenter addHostingController failed - no view on %{public}@", v29, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v25, -1, -1);
      MEMORY[0x230FA4830](v26, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return;
  }
  BOOL v29 = v8;
  id v9 = objc_msgSend(v7, sel_childViewControllers);
  sub_22E7BA6A0();
  unint64_t v10 = sub_22E7F3F20();

  uint64_t v27 = a1;
  uint64_t v28 = v7;
  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_4;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    sub_22E7B52A0(v27, v29);
    os_log_type_t v18 = v29;

    return;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_22E7F41A0();
  if (!v11) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v12 = 4;
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x230FA3F60](v12 - 4, v10);
    }
    else {
      id v13 = *(id *)(v10 + 8 * v12);
    }
    uint64_t v14 = v13;
    uint64_t v15 = v12 - 3;
    if (__OFADD__(v12 - 4, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    id v16 = objc_msgSend(v13, sel_view, v27, v28);
    if (!v16) {
      break;
    }
    uint64_t v17 = v16;
    objc_msgSend(v16, sel_removeFromSuperview);

    objc_msgSend(v14, sel_removeFromParentViewController);
    ++v12;
    if (v15 == v11) {
      goto LABEL_11;
    }
  }
  __break(1u);
}

uint64_t type metadata accessor for PASViewControllerPresentationHandler()
{
  return self;
}

uint64_t type metadata accessor for PASDefaultFlowStepsPresentationHandler()
{
  return self;
}

unint64_t sub_22E7BA6A0()
{
  unint64_t result = qword_268610D88;
  if (!qword_268610D88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268610D88);
  }
  return result;
}

uint64_t sub_22E7BA6E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E7BA7B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id sub_22E7BA710@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v8 = *(void *)(v1 + 64);
  *(void *)a1 = *(void *)v1;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(_OWORD *)unint64_t v10 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v10;
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 64) = v6;
  sub_22E7A6E60(v2);
  sub_22E7A6E60(v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v10[0];
}

uint64_t sub_22E7BA7B0()
{
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E7BA880()
{
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  sub_22E7F3EF0();
  swift_bridgeObjectRetain();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t destroy for PASUITargetBaseView(uint64_t a1)
{
  if (*(void *)a1) {
    swift_release();
  }
  if (*(void *)(a1 + 16)) {
    swift_release();
  }

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PASUITargetBaseView(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = *(void *)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = *(void **)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v9;
  id v11 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASUITargetBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*(void *)a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v9;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  swift_retain();
  swift_release();
LABEL_15:
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = (void *)a2[5];
  *(void *)(a1 + 40) = v11;
  id v12 = v11;

  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PASUITargetBaseView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*(void *)a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v9;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  swift_release();
LABEL_15:
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = a2[5];

  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUITargetBaseView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUITargetBaseView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 64) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUITargetBaseView()
{
  return &type metadata for PASUITargetBaseView;
}

uint64_t sub_22E7BAD9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASFlowStepCheckInternet.buildView()()
{
  return sub_22E7F3D60();
}

unint64_t sub_22E7BAE48()
{
  unint64_t result = qword_268610D90;
  if (!qword_268610D90)
  {
    sub_22E7F33C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610D90);
  }
  return result;
}

unint64_t sub_22E7BAEA0()
{
  unint64_t result = qword_268610D98;
  if (!qword_268610D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610D98);
  }
  return result;
}

uint64_t sub_22E7BAEF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PASUICheckInternetViewProxCardAdapter();
  swift_allocObject();
  uint64_t v3 = swift_retain();
  uint64_t v4 = sub_22E7BC9F0(v3);
  uint64_t result = swift_release();
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = &off_26E2337B8;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_22E7BAF64()
{
  return sub_22E7F3D60();
}

uint64_t sub_22E7BAFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_22E7F3F80();
  swift_retain();
  uint64_t v7 = sub_22E7F3F70();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = a2;
  sub_22E7AA784((uint64_t)v5, (uint64_t)&unk_268610E40, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_22E7BB0E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  sub_22E7F3F80();
  v4[10] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  v4[11] = v6;
  v4[12] = v5;
  return MEMORY[0x270FA2498](sub_22E7BB180, v6, v5);
}

uint64_t sub_22E7BB180()
{
  uint64_t v1 = type metadata accessor for PASUIMonogramMaker();
  uint64_t inited = swift_initStackObject();
  v0[13] = inited;
  v0[5] = v1;
  v0[6] = &off_26E231010;
  v0[2] = inited;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7BB248;
  return MEMORY[0x270F58A80](v0 + 2);
}

uint64_t sub_22E7BB248()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 16;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v2);
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v4 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_22E7BB37C, v4, v3);
}

uint64_t sub_22E7BB37C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_22E7BB3DC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610E00);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7E237C(a1);
  objc_msgSend(*(id *)(v1 + 40), sel_setEnabled_, 0);
  sub_22E7F33B0();
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = a1;
  sub_22E7B6540(&qword_268610E08, &qword_268610E00);
  swift_unknownObjectRetain();
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  *(void *)(v11 + 24) = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_22E7BC854;
  *(void *)(v12 + 24) = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  id v13 = (void *)sub_22E7F3E60();
  aBlock[4] = sub_22E7BC894;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22E7E2F00;
  aBlock[3] = &block_descriptor_1;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v13, 0, v14);

  _Block_release(v14);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(a1, sel_setDismissButtonAction_, v15);
}

uint64_t sub_22E7BB750(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    if ((v8 & 1) == 0)
    {
      uint64_t v11 = sub_22E7F3FB0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
      sub_22E7F3F80();
      swift_unknownObjectRetain();
      swift_retain();
      uint64_t v12 = sub_22E7F3F70();
      id v13 = (void *)swift_allocObject();
      uint64_t v14 = MEMORY[0x263F8F500];
      v13[2] = v12;
      void v13[3] = v14;
      v13[4] = a3;
      uint64_t v13[5] = v10;
      sub_22E7AA784((uint64_t)v7, (uint64_t)&unk_268610E30, (uint64_t)v13);
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_22E7BB8BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_22E7F3F80();
  v5[4] = sub_22E7F3F70();
  uint64_t v7 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7BB954, v7, v6);
}

uint64_t sub_22E7BB954()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (void *)v0[2];
  swift_release();
  sub_22E7F3ED0();
  uint64_t v3 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setTitle_, v3);

  sub_22E7F3ED0();
  uint64_t v4 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSubtitle_, v4);

  uint64_t v5 = *(void **)(v1 + 40);
  objc_msgSend(v5, sel_setEnabled_, 1);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_22E7BBA94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    swift_beginAccess();
    uint64_t v6 = (void *)MEMORY[0x230FA4900](a3 + 16);
    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_viewController);
      uint64_t v8 = *(void *)(v5 + 32);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_22E7A9E30;
      *(void *)(v9 + 24) = v8;
      swift_retain_n();
      sub_22E7E324C(v7, (uint64_t)&unk_268610E18, v8, (uint64_t)&unk_268610E20, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_22E7BBBD4(uint64_t a1)
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)a1 + 528) + **(int **)(*(void *)a1 + 528));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A7F00;
  return v4();
}

void sub_22E7BBCD4()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 40);
}

uint64_t sub_22E7BBD04()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for PASUICheckInternetViewProxCardAdapter()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for PASUICheckInternetView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PASUICheckInternetView()
{
  return swift_release();
}

void *assignWithCopy for PASUICheckInternetView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for PASUICheckInternetView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUICheckInternetView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUICheckInternetView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUICheckInternetView()
{
  return &type metadata for PASUICheckInternetView;
}

uint64_t sub_22E7BBEBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7BBED8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DA0);
  MEMORY[0x270FA5388](v39);
  uint64_t v40 = (uint64_t)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DA8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22E7F37E0();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DB0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DB8);
  uint64_t v11 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  id v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DC0);
  MEMORY[0x270FA5388](v34);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DC8);
  uint64_t v16 = MEMORY[0x270FA5388](v38);
  os_log_type_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v33 - v19;
  swift_retain();
  char v21 = sub_22E7F33A0();
  swift_release();
  if (v21)
  {
    swift_storeEnumTagMultiPayload();
    sub_22E7BC5EC();
    sub_22E7A6F2C();
    return sub_22E7F3930();
  }
  else
  {
    sub_22E7F3CC0();
    sub_22E7F38E0();
    uint64_t v23 = sub_22E7F38F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 0, 1, v23);
    uint64_t v24 = sub_22E7F3CE0();
    swift_release();
    sub_22E7A7224((uint64_t)v10, &qword_268610DB0);
    uint64_t v42 = v24;
    sub_22E7F37D0();
    sub_22E7F3B70();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v36);
    swift_release();
    uint64_t v25 = sub_22E7F3A90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v4, 1, 1, v25);
    uint64_t v26 = sub_22E7F3AA0();
    sub_22E7A7224((uint64_t)v4, &qword_268610DA8);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v28 = v37;
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v13, v37);
    BOOL v29 = (uint64_t *)&v15[*(int *)(v34 + 36)];
    *BOOL v29 = KeyPath;
    v29[1] = v26;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
    uint64_t v30 = sub_22E7F3C60();
    uint64_t v31 = swift_getKeyPath();
    sub_22E7A71C0((uint64_t)v15, (uint64_t)v18, &qword_268610DC0);
    uint64_t v32 = (uint64_t *)&v18[*(int *)(v38 + 36)];
    *uint64_t v32 = v31;
    v32[1] = v30;
    sub_22E7A7224((uint64_t)v15, &qword_268610DC0);
    sub_22E7BC584((uint64_t)v18, (uint64_t)v20);
    sub_22E7A71C0((uint64_t)v20, v40, &qword_268610DC8);
    swift_storeEnumTagMultiPayload();
    sub_22E7BC5EC();
    sub_22E7A6F2C();
    sub_22E7F3930();
    return sub_22E7A7224((uint64_t)v20, &qword_268610DC8);
  }
}

uint64_t sub_22E7BC474@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7BBED8(a1);
}

uint64_t sub_22E7BC47C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E7F3860();
  *a1 = result;
  return result;
}

uint64_t sub_22E7BC4A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E7F3860();
  *a1 = result;
  return result;
}

uint64_t sub_22E7BC4D4()
{
  return sub_22E7F3870();
}

uint64_t sub_22E7BC500()
{
  return sub_22E7F3870();
}

uint64_t sub_22E7BC52C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22E7F3840();
  *a1 = result;
  return result;
}

uint64_t sub_22E7BC558()
{
  return sub_22E7F3850();
}

uint64_t sub_22E7BC584(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22E7BC5EC()
{
  unint64_t result = qword_268610DD0;
  if (!qword_268610DD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610DC8);
    sub_22E7BC68C();
    sub_22E7B6540(&qword_268610DF0, &qword_268610DF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610DD0);
  }
  return result;
}

unint64_t sub_22E7BC68C()
{
  unint64_t result = qword_268610DD8;
  if (!qword_268610DD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610DC0);
    swift_getOpaqueTypeConformance2();
    sub_22E7B6540(&qword_268610DE0, &qword_268610DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610DD8);
  }
  return result;
}

uint64_t sub_22E7BC75C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7BC794()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EEE8]);
}

uint64_t sub_22E7BC7AC(char *a1)
{
  return sub_22E7BB750(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22E7BC7B4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7BC7EC()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EED8]);
}

uint64_t objectdestroy_16Tm(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 24));
  return MEMORY[0x270FA0238](v1, 32, 7);
}

uint64_t sub_22E7BC854(uint64_t a1)
{
  return sub_22E7BBA94(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22E7BC85C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7BC894(uint64_t a1)
{
  return sub_22E7E2ED8(a1, *(uint64_t (**)(void))(v1 + 16));
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

uint64_t sub_22E7BC8B4()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A7F00;
  return sub_22E7BBBD4(v0);
}

uint64_t sub_22E7BC944()
{
  uint64_t v2 = *(void (**)(void))(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7A7F00;
  uint64_t v4 = (uint64_t (*)(void (*)(void)))((char *)&dword_268611E58 + dword_268611E58);
  return v4(v2);
}

void *sub_22E7BC9F0(uint64_t a1)
{
  uint64_t v2 = v1;
  v1[4] = a1;
  swift_retain();
  swift_retain();
  sub_22E7F3ED0();
  swift_retain();
  uint64_t v4 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  v9[4] = sub_22E7BCC9C;
  void v9[5] = a1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  long long v9[2] = sub_22E7E2F00;
  v9[3] = &block_descriptor_40;
  uint64_t v5 = _Block_copy(v9);
  id v6 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v4, 1, v5);

  _Block_release(v5);
  swift_release();
  v2[5] = v6;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  v2[2] = sub_22E7F3050();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t v7 = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v7 = MEMORY[0x263F8EE88];
  }
  v2[3] = v7;
  return v2;
}

uint64_t sub_22E7BCB94()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22E7BCBDC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22E7A7F00;
  return sub_22E7BB8BC(a1, v4, v5, v7, v6);
}

uint64_t sub_22E7BCC9C(uint64_t a1)
{
  return sub_22E7BAFD0(a1, v1);
}

uint64_t sub_22E7BCCA4()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7BCCE4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A6D00;
  return sub_22E7BB0E8(a1, v4, v5, v6);
}

unint64_t sub_22E7BCD9C()
{
  unint64_t result = qword_268610E48;
  if (!qword_268610E48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610E50);
    sub_22E7BC5EC();
    sub_22E7A6F2C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610E48);
  }
  return result;
}

uint64_t type metadata accessor for PASUINonUIExtensionConfiguration()
{
  return self;
}

uint64_t sub_22E7BCE4C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_22E7F3570();
  os_log_type_t v10 = sub_22E7F3FD0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_22E7A0000, v9, v10, "PASUINonUIExtensionConfiguration accept extension is accepting a new non-UI connection", v11, 2u);
    MEMORY[0x230FA4830](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = (void *)sub_22E7F34E0();
  objc_msgSend(a1, sel_setExportedInterface_, v12);

  objc_msgSend(a1, sel_setExportedObject_, *(void *)(v2 + 16));
  objc_msgSend(a1, sel_activate);
  return 1;
}

uint64_t sub_22E7BCFF4(void *a1)
{
  return 1;
}

void sub_22E7BD130(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_22E7BD2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_22E7F2F50();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_22E7BD350(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610CD0);
    uint64_t v4 = sub_22E7F3E10();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_22E7BD538(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610CD0);
    uint64_t v5 = (void *)sub_22E7F3E00();
  }
  if (a2) {
    uint64_t v6 = sub_22E7F2F50();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

void sub_22E7BD734(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_22E7BD8BC(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_22E7F2F50();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t type metadata accessor for InfoProviderDecoratorBase()
{
  return self;
}

void sub_22E7BDA60(uint64_t a1, id a2, void (*a3)(void, id), uint64_t a4, id a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    id v10 = a2;
    a3(0, a2);
  }
  else
  {
    objc_msgSend(a5, sel_setAnisetteDataProvider_, a1);
    uint64_t v14 = *(void **)(a6 + 16);
    v16[4] = a3;
    v16[5] = a4;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1107296256;
    v16[2] = sub_22E7BD350;
    v16[3] = &block_descriptor_33;
    uint64_t v15 = _Block_copy(v16);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_authenticateWithAccount_with_completion_, a7, a5, v15);
    _Block_release(v15);
  }
}

uint64_t sub_22E7BDB9C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for AuthenticateProxyObjectFetchingDecorator()
{
  return self;
}

uint64_t sub_22E7BDCD8(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)sub_22E7F3510();
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v6);

  objc_msgSend(a1, sel_activate);
  aBlock[4] = a2;
  aBlock[5] = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22E7C7ED8;
  aBlock[3] = &block_descriptor_36;
  id v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v8 = objc_msgSend(a1, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_22E7F40E0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610E68);
  swift_dynamicCast();
  return v10;
}

uint64_t sub_22E7BDE14(void *a1, void *a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  uint64_t v9 = self;
  _Block_copy(a4);
  id v10 = objc_msgSend(v9, sel_currentConnection);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_22E7BE0C0;
    *(void *)(v12 + 24) = v8;
    swift_retain();
    id v13 = (void *)sub_22E7BDCD8(v11, (uint64_t)sub_22E7BE154, v12);
    swift_release();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = sub_22E7BE0C0;
    v14[3] = v8;
    v14[4] = a2;
    v14[5] = a3;
    v14[6] = a1;
    v22[4] = sub_22E7BE1D4;
    v22[5] = v14;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 1107296256;
    v22[2] = sub_22E7BDB9C;
    v22[3] = &block_descriptor_2;
    uint64_t v15 = _Block_copy(v22);
    swift_retain();
    id v16 = a2;
    swift_retain();
    id v17 = a1;
    swift_release();
    objc_msgSend(v13, sel_fetchExtrasWithCompletion_, v15);
    _Block_release(v15);
    swift_release();

    return swift_unknownObjectRelease();
  }
  else
  {
    sub_22E7BE0C8();
    uint64_t v19 = (void *)swift_allocError();
    void *v20 = 0xD00000000000004CLL;
    v20[1] = 0x800000022E7FA420;
    char v21 = (void *)sub_22E7F2F50();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v21);

    return swift_release();
  }
}

uint64_t sub_22E7BE088()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22E7BE0C0(void *a1, uint64_t a2)
{
  sub_22E7BD538(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_22E7BE0C8()
{
  unint64_t result = qword_268610E58;
  if (!qword_268610E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610E58);
  }
  return result;
}

uint64_t sub_22E7BE11C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7BE154(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(v1 + 16))(0, a1);
}

uint64_t sub_22E7BE184()
{
  swift_release();

  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_22E7BE1D4(uint64_t a1, void *a2)
{
  sub_22E7BDA60(a1, a2, *(void (**)(void, id))(v2 + 16), *(void *)(v2 + 24), *(id *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
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

void sub_22E7BE1FC(uint64_t a1)
{
  sub_22E7DEFA8(a1, *(void *)(v1 + 16));
}

void sub_22E7BE204(char a1, uint64_t a2)
{
  sub_22E7BD8BC(a1, a2, *(void *)(v2 + 16));
}

void sub_22E7BE20C(uint64_t a1, uint64_t a2)
{
  sub_22E7BD2E0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_22E7BE28C@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v10 = *a1;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610D70);
  if (swift_dynamicCast())
  {
    sub_22E7B9E68(v8, (uint64_t)&v11);
    uint64_t v3 = v13;
    uint64_t v4 = v14;
    __swift_project_boxed_opaque_existential_1(&v11, v13);
    *(void *)&long long v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    BYTE8(v10) = 0;
    sub_22E7F3930();
    uint64_t v5 = *(void *)&v8[0];
    char v6 = BYTE8(v8[0]);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  }
  else
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_22E7A7224((uint64_t)v8, &qword_268610D78);
    *(void *)&v8[0] = 0;
    BYTE8(v8[0]) = 1;
    uint64_t result = sub_22E7F3930();
    uint64_t v5 = v11;
    char v6 = v12;
  }
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v6;
  return result;
}

uint64_t sub_22E7BE3F4()
{
  return sub_22E7F3710();
}

uint64_t sub_22E7BE410()
{
  return sub_22E7F3BE0();
}

uint64_t View.targetDeviceSetupPresenter(with:presenterDelegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610AD0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7BE5B4(a1, (uint64_t)v9);
  swift_unknownObjectRetain();
  id v10 = sub_22E7BE914((uint64_t)v9);
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  v14[0] = v10;
  v14[1] = v12;
  MEMORY[0x230FA3A50](v14, a3, &type metadata for PASTargetDeviceSetupPresenterModifier, a4);

  return swift_release();
}

uint64_t sub_22E7BE5B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610AD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Binding<A>.present(step:)()
{
  uint64_t v0 = sub_22E7F3790();
  MEMORY[0x270FA5388](v0 - 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610AD0);
  MEMORY[0x230FA3B70]();
  sub_22E7BEA40();
  sub_22E7F3780();
  swift_unknownObjectRelease();
  return sub_22E7F3D80();
}

uint64_t sub_22E7BE6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22E7F3D80();
}

uint64_t sub_22E7BE7C4()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7BE81C()
{
  return sub_22E7F42B0();
}

uint64_t sub_22E7BE864()
{
  return sub_22E7F42C0();
}

BOOL sub_22E7BE8B8()
{
  swift_getObjectType();
  uint64_t v0 = sub_22E7F4150();
  swift_getObjectType();
  return v0 == sub_22E7F4150();
}

id sub_22E7BE914(uint64_t a1)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PASUITargetViewPresenter()), sel_init);
  sub_22E7F3D00();
  swift_retain();
  id v2 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610EA8);
  sub_22E7F3D10();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  sub_22E7F3D10();
  sub_22E7B3918(a1, (uint64_t)v5);

  swift_release();
  sub_22E7A7224(a1, &qword_268610AD0);
  return v2;
}

unint64_t sub_22E7BEA40()
{
  unint64_t result = qword_268610E70;
  if (!qword_268610E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610E70);
  }
  return result;
}

uint64_t sub_22E7BEA94()
{
  return swift_getWitnessTable();
}

unint64_t sub_22E7BEAF8()
{
  unint64_t result = qword_268610E78;
  if (!qword_268610E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610E78);
  }
  return result;
}

_OWORD *initializeBufferWithCopyOfBuffer for PASFlowStepNavigationPathItem(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for PASFlowStepNavigationPathItem()
{
  return swift_unknownObjectRelease();
}

void *assignWithCopy for PASFlowStepNavigationPathItem(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v3;
  return a1;
}

_OWORD *assignWithTake for PASFlowStepNavigationPathItem(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  return a1;
}

ValueMetadata *type metadata accessor for PASFlowStepNavigationPathItem()
{
  return &type metadata for PASFlowStepNavigationPathItem;
}

void *initializeBufferWithCopyOfBuffer for PASTargetDeviceSetupPresenterModifier(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PASTargetDeviceSetupPresenterModifier(id *a1)
{
  return swift_release();
}

uint64_t assignWithCopy for PASTargetDeviceSetupPresenterModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

id *assignWithTake for PASTargetDeviceSetupPresenterModifier(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AAUISignInViewControllerWrapper(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AAUISignInViewControllerWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASTargetDeviceSetupPresenterModifier()
{
  return &type metadata for PASTargetDeviceSetupPresenterModifier;
}

uint64_t sub_22E7BEDC4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22E7BEDE4()
{
  unint64_t result = qword_268610E80;
  if (!qword_268610E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610E80);
  }
  return result;
}

unint64_t sub_22E7BEE38()
{
  unint64_t result = qword_268610E98;
  if (!qword_268610E98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610E88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610E98);
  }
  return result;
}

unint64_t sub_22E7BEE94()
{
  unint64_t result = qword_268610EA0;
  if (!qword_268610EA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610EA0);
  }
  return result;
}

uint64_t sub_22E7BEF08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASFlowStepProxiedTerms.buildView()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610EB0);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v16 - v5;
  sub_22E7BFC58(&qword_268610EB8, MEMORY[0x263F62468]);
  swift_retain_n();
  uint64_t v7 = sub_22E7F37A0();
  unint64_t v9 = v8;
  objc_allocWithZone((Class)type metadata accessor for PASUIProxiedTermsHandler());
  uint64_t v10 = swift_bridgeObjectRetain();
  id v11 = sub_22E7B670C(v10);
  swift_release();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v17 = (ValueMetadata *)v7;
  unint64_t v18 = v9;
  uint64_t v19 = sub_22E7BF284;
  uint64_t v20 = v12;
  char v21 = 0;
  unint64_t v13 = sub_22E7BF28C();
  sub_22E7F3C00();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  id v17 = &type metadata for PASUIProxiedTermsView;
  unint64_t v18 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v14;
}

uint64_t sub_22E7BF228()
{
  return PASFlowStepProxiedTerms.buildView()();
}

uint64_t sub_22E7BF24C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_22E7BF284()
{
  return *(id *)(v0 + 16);
}

unint64_t sub_22E7BF28C()
{
  unint64_t result = qword_268610EC0;
  if (!qword_268610EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268610EC0);
  }
  return result;
}

id sub_22E7BF2E0(uint64_t a1, void *a2, char a3)
{
  if (a3) {
    return a2;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t destroy for PASUIProxiedTermsView(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);
  return sub_22E7BF330(v2, v3, v4);
}

uint64_t sub_22E7BF330(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return MEMORY[0x270F9A758]();
  }
  else {
    return swift_release();
  }
}

uint64_t initializeWithCopy for PASUIProxiedTermsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_22E7BF2E0(v4, v5, v6);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for PASUIProxiedTermsView(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = v2[2];
  uint64_t v5 = (void *)v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_22E7BF2E0(v4, v5, (char)v2);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_22E7BF330(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PASUIProxiedTermsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = v5;
  sub_22E7BF330(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIProxiedTermsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIProxiedTermsView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIProxiedTermsView()
{
  return &type metadata for PASUIProxiedTermsView;
}

uint64_t sub_22E7BF518()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7BF534@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22E7F3760();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E7F3FB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = v1[1];
  long long v19 = *v1;
  uint64_t v12 = *((void *)&v19 + 1);
  long long v17 = v11;
  char v18 = *((unsigned char *)v1 + 32);
  uint64_t v13 = swift_allocObject();
  long long v14 = v1[1];
  *(_OWORD *)(v13 + 16) = *v1;
  *(_OWORD *)(v13 + 32) = v14;
  *(unsigned char *)(v13 + 48) = *((unsigned char *)v1 + 32);
  swift_retain();
  sub_22E7BFBC8((uint64_t)&v19);
  sub_22E7BFBF4((uint64_t)&v17);
  sub_22E7F3F90();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v6[*(int *)(v4 + 28)], v10, v7);
  *(void *)uint64_t v6 = &unk_268610ED0;
  *((void *)v6 + 1) = v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C8);
  sub_22E7A6DF4((uint64_t)v6, a1 + *(int *)(v15 + 36));
  *(void *)a1 = sub_22E7A6BD4;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = sub_22E7A64F0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = sub_22E7A6524;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)(a1 + 88) = MEMORY[0x263F8EE78];
  sub_22E7A6E58();
  sub_22E7A6E60((uint64_t)sub_22E7A64F0);
  sub_22E7A6E60((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRetain();
  sub_22E7A6E70((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_22E7A6ECC();
  sub_22E7A6ED4((uint64_t)sub_22E7A64F0);
  sub_22E7A6ED4((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7BF7E0(uint64_t a1)
{
  v1[9] = a1;
  sub_22E7F3F80();
  v1[10] = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  v1[11] = v3;
  v1[12] = v2;
  return MEMORY[0x270FA2498](sub_22E7BF878, v3, v2);
}

uint64_t sub_22E7BF878()
{
  *(_OWORD *)(v0 + 56) = *(_OWORD *)*(void *)(v0 + 72);
  uint64_t v1 = type metadata accessor for PASUIProxiedTermsHandler();
  sub_22E7BFC58(&qword_268610ED8, (void (*)(uint64_t))type metadata accessor for PASUIProxiedTermsHandler);
  swift_retain();
  uint64_t v2 = sub_22E7F36B0();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = &off_26E2316A0;
  *(void *)(v0 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7BF9AC;
  return MEMORY[0x270F58A10](v0 + 16);
}

uint64_t sub_22E7BF9AC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 16;
  uint64_t v3 = *v0 + 56;
  swift_task_dealloc();
  sub_22E7BFC28(v3);
  __swift_destroy_boxed_opaque_existential_1(v2);
  uint64_t v4 = *(void *)(v1 + 96);
  uint64_t v5 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_22E7BB37C, v5, v4);
}

uint64_t sub_22E7BFAF0()
{
  swift_release();
  sub_22E7BF330(*(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));
  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t sub_22E7BFB34()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A6D00;
  return sub_22E7BF7E0(v0 + 16);
}

uint64_t sub_22E7BFBC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_22E7BFBF4(uint64_t a1)
{
  return a1;
}

uint64_t sub_22E7BFC28(uint64_t a1)
{
  return a1;
}

uint64_t sub_22E7BFC58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t PASFlowStepPersonalSignIn.buildView()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610EE0);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - v5;
  uint64_t v7 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  id v8 = objc_allocWithZone(v7);
  swift_retain();
  id v9 = objc_msgSend(v8, sel_init);
  long long v17 = v7;
  char v18 = &off_26E232D68;
  id v16 = v9;
  sub_22E7BFEC4();
  long long v14 = (ValueMetadata *)sub_22E7F37A0();
  unint64_t v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610EF0);
  swift_allocObject();
  uint64_t v19 = sub_22E7F3050();
  unint64_t v11 = sub_22E7BFF1C();
  sub_22E7F3C00();
  sub_22E7BFF70((uint64_t)&v14);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  long long v14 = &type metadata for PASUIPersonalSignInView;
  unint64_t v15 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_22E7BFEC4()
{
  unint64_t result = qword_268610EE8;
  if (!qword_268610EE8)
  {
    sub_22E7F3410();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610EE8);
  }
  return result;
}

unint64_t sub_22E7BFF1C()
{
  unint64_t result = qword_268610EF8;
  if (!qword_268610EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268610EF8);
  }
  return result;
}

uint64_t sub_22E7BFF70(uint64_t a1)
{
  return a1;
}

uint64_t sub_22E7BFFA0()
{
  return PASFlowStepPersonalSignIn.buildView()();
}

uint64_t destroy for PASUIPersonalSignInView(uint64_t a1)
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return swift_release();
}

uint64_t initializeWithCopy for PASUIPersonalSignInView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 16;
  long long v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  uint64_t v7 = v6;
  id v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_retain();
  v8(a1 + 16, v5, v7);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIPersonalSignInView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PASUIPersonalSignInView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIPersonalSignInView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIPersonalSignInView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIPersonalSignInView()
{
  return &type metadata for PASUIPersonalSignInView;
}

uint64_t sub_22E7C0230()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7C024C@<X0>(uint64_t a1@<X8>)
{
  sub_22E7B4230(v1 + 16, (uint64_t)v10);
  sub_22E7C0680(v1, (uint64_t)v9);
  long long v3 = (_OWORD *)swift_allocObject();
  long long v4 = v9[1];
  v3[1] = v9[0];
  v3[2] = v4;
  long long v5 = v9[3];
  v3[3] = v9[2];
  v3[4] = v5;
  sub_22E7B4230((uint64_t)v10, (uint64_t)v8);
  v8[5] = &unk_268610F08;
  v8[6] = v3;
  sub_22E7C079C((uint64_t)v8, a1 + 72);
  *(void *)a1 = sub_22E7BFCA0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = sub_22E7BFCA4;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v6;
  sub_22E7A6E60((uint64_t)sub_22E7BFCA0);
  sub_22E7A6E60((uint64_t)sub_22E7BFCA4);
  swift_bridgeObjectRetain();
  sub_22E7C07F8((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  sub_22E7A6ED4((uint64_t)sub_22E7BFCA0);
  sub_22E7A6ED4((uint64_t)sub_22E7BFCA4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7C0390(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_22E7F3F80();
  v2[4] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v2[5] = v4;
  v2[6] = v3;
  return MEMORY[0x270FA2498](sub_22E7C0428, v4, v3);
}

uint64_t sub_22E7C0428()
{
  v0[7] = *(void *)(v0[3] + 8);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7C04D8;
  uint64_t v2 = v0[2];
  return MEMORY[0x270F58AB8](v2);
}

uint64_t sub_22E7C04D8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](sub_22E7C061C, v3, v2);
}

uint64_t sub_22E7C061C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7C0680(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22E7C06B8()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_22E7C0700(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22E7A6D00;
  return sub_22E7C0390(a1, v1 + 16);
}

uint64_t sub_22E7C079C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22E7C07F8(uint64_t a1)
{
  return a1;
}

unint64_t sub_22E7C0850()
{
  unint64_t result = qword_268610F10;
  if (!qword_268610F10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268610F18);
    sub_22E7C08CC();
    sub_22E7C0920();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610F10);
  }
  return result;
}

unint64_t sub_22E7C08CC()
{
  unint64_t result = qword_268610F20;
  if (!qword_268610F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610F20);
  }
  return result;
}

unint64_t sub_22E7C0920()
{
  unint64_t result = qword_268610F28[0];
  if (!qword_268610F28[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268610F28);
  }
  return result;
}

uint64_t type metadata accessor for PASBundleForSharedAssets()
{
  return self;
}

uint64_t sub_22E7C099C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22E7C09E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_22E7C0A1C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for WeakBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22E7C0A6C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22E7C0AB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v34 = a6;
  uint64_t v29 = a4;
  uint64_t v30 = a3;
  uint64_t v37 = a7;
  uint64_t v36 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v38 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v10;
  type metadata accessor for NavigationControllerReader.ReaderRepresentable();
  uint64_t v31 = sub_22E7F37F0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v49 = WitnessTable;
  uint64_t v50 = MEMORY[0x263F18BF0];
  uint64_t v35 = MEMORY[0x263F18E48];
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v33 = sub_22E7F3920();
  uint64_t v11 = sub_22E7F37F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  long long v17 = (char *)&v26 - v16;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  __swift_instantiateConcreteTypeFromMangledName(qword_2686110C8);
  sub_22E7F3D10();
  char v18 = (void *)MEMORY[0x230FA4900](v41 + 16);
  swift_release();
  v30(v18);

  uint64_t v41 = a1;
  uint64_t v42 = a2;
  sub_22E7F3D30();
  uint64_t v41 = v45;
  uint64_t v42 = v46;
  uint64_t v43 = v47;
  sub_22E7F3C30();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v41 = v45;
  uint64_t v42 = v46;
  uint64_t v43 = v47;
  uint64_t v44 = v48;
  sub_22E7F3DB0();
  uint64_t v19 = v28;
  uint64_t v20 = v34;
  char v21 = v38;
  sub_22E7F3B40();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v21, v19);
  uint64_t v22 = swift_getWitnessTable();
  uint64_t v39 = v20;
  uint64_t v40 = v22;
  swift_getWitnessTable();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v23(v17, v15, v11);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v12 + 8);
  v24(v15, v11);
  v23(v37, v17, v11);
  return ((uint64_t (*)(char *, uint64_t))v24)(v17, v11);
}

uint64_t sub_22E7C0E94@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_22E7C0AB0(*(void *)v2, *(void *)(v2 + 8), *(void (**)(void *))(v2 + 16), *(void *)(v2 + 24), *(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

id sub_22E7C0EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return sub_22E7C0EF4(a1, a2, a3);
}

id sub_22E7C0EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = &v3[qword_268610FB0];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = a2;
  *((void *)v4 + 2) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for NavigationControllerReader.Reader();
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

void sub_22E7C0F84()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for NavigationControllerReader.Reader();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  id v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);
  }
  else
  {
    __break(1u);
  }
}

void sub_22E7C1064(void *a1)
{
  id v1 = a1;
  sub_22E7C0F84();
}

void sub_22E7C10AC()
{
}

uint64_t sub_22E7C1104(uint64_t a1)
{
  id v3 = v1;
  return a1;
}

uint64_t sub_22E7C111C(uint64_t a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for NavigationControllerReader.Reader();
  objc_msgSendSuper2(&v5, sel_didMoveToParentViewController_, a1);
  swift_retain();
  swift_retain();
  swift_retain();
  id v3 = objc_msgSend(v1, sel_navigationController);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611038);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();

  __swift_instantiateConcreteTypeFromMangledName(qword_268611040);
  sub_22E7F3D80();
  swift_release();
  swift_release();
  return swift_release();
}

void sub_22E7C1260(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_22E7C111C((uint64_t)a3);
}

id sub_22E7C12CC(uint64_t a1, char a2)
{
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for NavigationControllerReader.Reader();
  objc_msgSendSuper2(&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a1, a2 & 1);
  swift_retain();
  swift_retain();
  swift_retain();
  id result = objc_msgSend(v2, sel_view);
  if (result)
  {
    id v6 = result;
    id v7 = sub_22E7C155C(result);

    __swift_instantiateConcreteTypeFromMangledName(&qword_268611038);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();

    __swift_instantiateConcreteTypeFromMangledName(qword_268611040);
    sub_22E7F3D80();
    swift_release();
    swift_release();
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_22E7C1430(void *a1, uint64_t a2, void *a3, char a4)
{
  id v7 = a3;
  id v8 = a1;
  sub_22E7C12CC((uint64_t)a3, a4);
}

id sub_22E7C14A4(void *a1)
{
  id v2 = objc_msgSend(a1, sel_nextResponder);
  if (v2)
  {
    id v3 = v2;
    self;
    id result = (id)swift_dynamicCastObjCClass();
    if (result) {
      return result;
    }
  }
  id result = objc_msgSend(a1, sel_nextResponder);
  if (result)
  {
    id v5 = result;
    self;
    if (swift_dynamicCastObjCClass())
    {
      uint64_t v6 = sub_22E7C14A4();

      return (id)v6;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

id sub_22E7C155C(void *a1)
{
  id v1 = a1;
  while (1)
  {
    id v2 = v1;
    id v3 = sub_22E7C14A4(v2);
    if (v3) {
      break;
    }

LABEL_3:
    id v1 = objc_msgSend(v2, sel_superview);

    if (!v1) {
      return v1;
    }
  }
  objc_super v4 = v3;
  id v1 = objc_msgSend(v3, sel_navigationController);

  if (!v1) {
    goto LABEL_3;
  }

  return v1;
}

void sub_22E7C1614(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = a4;
  sub_22E7C19A0();
}

id sub_22E7C1688()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NavigationControllerReader.Reader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22E7C16FC()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for NavigationControllerReader.Reader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22E7C1764()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_268611040);
  sub_22E7F3D90();
  return v1;
}

id sub_22E7C17B0()
{
  return sub_22E7C1F04();
}

uint64_t sub_22E7C17D0()
{
  return sub_22E7F39B0();
}

uint64_t sub_22E7C180C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_22E7C1888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_22E7C1904()
{
}

void sub_22E7C1944()
{
}

void sub_22E7C19A0()
{
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22E7C1A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_22E7C1A08()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_22E7C1A4C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_22E7C1AAC(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *sub_22E7C1B30(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_22E7C1B80(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22E7C1BC8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for NavigationControllerReader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22E7C1C20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for NavigationControllerReader.ReaderRepresentable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22E7C1C80()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_22E7C1CC4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_22E7C1D14(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22E7C1D8C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t sub_22E7C1DDC()
{
  return swift_getWitnessTable();
}

uint64_t sub_22E7C1EDC()
{
  return swift_getWitnessTable();
}

uint64_t sub_22E7C1EF8()
{
  return MEMORY[0x263F1BB58];
}

id sub_22E7C1F04()
{
  uint64_t v0 = (objc_class *)type metadata accessor for NavigationControllerReader.Reader();
  uint64_t v1 = sub_22E7C1764();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  id v6 = objc_allocWithZone(v0);
  return sub_22E7C0EF4(v1, v3, v5);
}

uint64_t sub_22E7C1FA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611150);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v16 - v7;
  uint64_t v9 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  id v10 = objc_allocWithZone(v9);
  swift_retain();
  id v11 = objc_msgSend(v10, sel_init);
  uint64_t v19 = v9;
  uint64_t v20 = &off_26E232D68;
  unint64_t v18 = (unint64_t)v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  uint64_t v12 = sub_22E7F3050();
  long long v17 = v1;
  uint64_t v21 = v12;
  unint64_t v13 = sub_22E7C21A8();
  sub_22E7F3C00();
  sub_22E7C21FC((uint64_t)&v17);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  long long v17 = &type metadata for PASUISourceAuthView;
  unint64_t v18 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return v14;
}

uint64_t sub_22E7C2184()
{
  return sub_22E7C1FA0();
}

unint64_t sub_22E7C21A8()
{
  unint64_t result = qword_268611158;
  if (!qword_268611158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268611158);
  }
  return result;
}

uint64_t sub_22E7C21FC(uint64_t a1)
{
  return a1;
}

uint64_t destroy for PASUISourceAuthView(uint64_t a1)
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  return swift_release();
}

uint64_t initializeWithCopy for PASUISourceAuthView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a2 + 8;
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 8, v4, v6);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUISourceAuthView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  a1[6] = a2[6];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for PASUISourceAuthView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUISourceAuthView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUISourceAuthView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUISourceAuthView()
{
  return &type metadata for PASUISourceAuthView;
}

uint64_t sub_22E7C249C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7C24B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3760();
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3FB0();
  uint64_t v19 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v2;
  sub_22E7C2C44((uint64_t)v2, (uint64_t)&v20);
  uint64_t v13 = swift_allocObject();
  long long v14 = v21;
  *(_OWORD *)(v13 + 16) = v20;
  *(_OWORD *)(v13 + 32) = v14;
  *(_OWORD *)(v13 + 48) = v22;
  *(void *)(v13 + 64) = v23;
  sub_22E7C2C44((uint64_t)v2, (uint64_t)&v20);
  uint64_t v15 = swift_allocObject();
  long long v16 = v21;
  *(_OWORD *)(v15 + 16) = v20;
  *(_OWORD *)(v15 + 32) = v16;
  *(_OWORD *)(v15 + 48) = v22;
  *(void *)(v15 + 64) = v23;
  swift_retain();
  sub_22E7F3F90();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(&v7[*(int *)(v5 + 28)], v11, v8);
  *(void *)uint64_t v7 = &unk_268611168;
  *((void *)v7 + 1) = v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C8);
  sub_22E7A6DF4((uint64_t)v7, a1 + *(int *)(v17 + 36));
  *(void *)a1 = sub_22E7A6BD4;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = sub_22E7C2C80;
  *(void *)(a1 + 32) = v13;
  *(void *)(a1 + 40) = sub_22E7A6524;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)(a1 + 88) = MEMORY[0x263F8EE78];
  sub_22E7A6E58();
  sub_22E7A6E60((uint64_t)sub_22E7C2C80);
  sub_22E7A6E60((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRetain();
  sub_22E7A6E70((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  sub_22E7A6ECC();
  sub_22E7A6ED4((uint64_t)sub_22E7C2C80);
  sub_22E7A6ED4((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7C27A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(void))(**(void **)a5 + 672))();
  uint64_t v5 = sub_22E7F3EC0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22E7C2834(uint64_t a1)
{
  v1[2] = a1;
  sub_22E7F3F80();
  v1[3] = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  v1[4] = v3;
  v1[5] = v2;
  return MEMORY[0x270FA2498](sub_22E7C28CC, v3, v2);
}

uint64_t sub_22E7C28CC()
{
  uint64_t v1 = (uint64_t *)v0[2];
  uint64_t v2 = *v1;
  uint64_t v3 = swift_task_alloc();
  v0[6] = v3;
  *(void *)(v3 + 16) = v1;
  uint64_t v6 = (uint64_t (*)(id (*)(), uint64_t))(*(void *)(*(void *)v2 + 688) + **(int **)(*(void *)v2 + 688));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_22E7C2A08;
  return v6(sub_22E7C2D68, v3);
}

uint64_t sub_22E7C2A08()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_22E7A6468, v3, v2);
}

id sub_22E7C2B4C(uint64_t a1)
{
  uint64_t v2 = __swift_project_boxed_opaque_existential_1((void *)(a1 + 8), *(void *)(a1 + 32));
  (*(void (**)(void *__return_ptr))(**(void **)(a1 + 48) + 128))(v9);
  uint64_t v3 = v10;
  uint64_t v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  uint64_t v6 = *v2;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F292A8]), sel_init);
  objc_msgSend(v7, sel_setPresentingViewController_, v5);
  objc_msgSend(v7, sel_setDelegate_, v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

uint64_t sub_22E7C2C44(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22E7C2C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22E7C27A0(a1, a2, a3, a4, v4 + 16);
}

uint64_t objectdestroyTm_2()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_22E7C2CD4()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A6D00;
  return sub_22E7C2834(v0 + 16);
}

id sub_22E7C2D68()
{
  return sub_22E7C2B4C(*(void *)(v0 + 16));
}

unint64_t sub_22E7C2D70()
{
  unint64_t result = qword_268610700;
  if (!qword_268610700)
  {
    sub_22E7F3760();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268610700);
  }
  return result;
}

unint64_t sub_22E7C2DC8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611820);
  uint64_t v2 = sub_22E7F41B0();
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
    sub_22E7A71C0(v6, (uint64_t)v15, &qword_268611200);
    unint64_t result = sub_22E7C4084((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_22E7C4EBC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_22E7C2F0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686111D8);
  uint64_t v2 = sub_22E7F41B0();
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
    sub_22E7A71C0(v6, (uint64_t)&v15, &qword_2686111E0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22E7C40C8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_22E7B9E68(&v17, v3[7] + 40 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 56;
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

unint64_t sub_22E7C3050(uint64_t a1)
{
  return sub_22E7C3064(a1, &qword_2686111E8, &qword_2686111F0);
}

unint64_t sub_22E7C3064(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v6 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_22E7F41B0();
  uint64_t v6 = (void *)v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v6;
  }
  uint64_t v8 = v5 + 64;
  uint64_t v9 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22E7A71C0(v9, (uint64_t)&v16, a3);
    uint64_t v10 = v16;
    unint64_t result = sub_22E7C4140(v16);
    if (v12) {
      break;
    }
    *(void *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v6[6] + 8 * result) = v10;
    unint64_t result = (unint64_t)sub_22E7C4EBC(&v17, (_OWORD *)(v6[7] + 32 * result));
    uint64_t v13 = v6[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v6[2] = v15;
    v9 += 40;
    if (!--v7)
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

unint64_t sub_22E7C318C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686111C8);
  uint64_t v2 = sub_22E7F41B0();
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
    sub_22E7A71C0(v6, (uint64_t)&v15, &qword_2686111D0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22E7C40C8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_22E7C4EBC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t PASFlowStepAIDASignIn.buildView()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611170);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v18 - v5;
  uint64_t v7 = self;
  swift_retain();
  id v8 = objc_msgSend(v7, sel_defaultCenter);
  uint64_t v9 = (objc_class *)type metadata accessor for PASUICDPEnrollmentObserver();
  char v10 = objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_observers] = MEMORY[0x263F8EE78];
  *(void *)&v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate + 8] = 0;
  uint64_t v11 = swift_unknownObjectWeakInit();
  v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_lastStatus] = 4;
  *(void *)(v11 + 8) = MEMORY[0x263F62410];
  swift_unknownObjectWeakAssign();
  *(void *)&v10[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter] = v8;
  v19.receiver = v10;
  v19.super_class = v9;
  swift_retain();
  id v12 = v8;
  id v13 = objc_msgSendSuper2(&v19, sel_init);
  sub_22E7EE1D4();

  swift_release();
  sub_22E7C44F4(v13, (uint64_t *)v20);
  uint64_t v14 = (void *)v21;
  long long v22 = v20[0];
  v18[0] = v20[0];
  v18[1] = v20[1];
  v18[2] = v21;
  unint64_t v15 = sub_22E7C4638();
  sub_22E7F3C00();
  sub_22E7BFC28((uint64_t)&v22);
  swift_release();

  swift_unknownObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  *(void *)&v18[0] = &type metadata for PASUIAIDASignInView;
  *((void *)&v18[0] + 1) = v15;
  swift_getOpaqueTypeConformance2();
  uint64_t v16 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v16;
}

uint64_t sub_22E7C3574()
{
  return PASFlowStepAIDASignIn.buildView()();
}

uint64_t sub_22E7C3598@<X0>(void *a1@<X8>)
{
  long long v10 = *v1;
  uint64_t v3 = (void *)*((void *)v1 + 4);
  uint64_t v4 = (_OWORD *)swift_allocObject();
  long long v5 = v1[1];
  v4[1] = *v1;
  v4[2] = v5;
  v4[3] = v1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611038);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  sub_22E7BFBC8((uint64_t)&v10);
  swift_unknownObjectRetain();
  id v6 = v3;
  swift_retain();
  uint64_t result = sub_22E7F3D00();
  *a1 = v8;
  a1[1] = v9;
  a1[2] = sub_22E7C4908;
  a1[3] = v4;
  return result;
}

uint64_t sub_22E7C3690@<X0>(void *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_22E7F3760();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22E7F3FB0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611180);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  if (a1)
  {
    uint64_t v63 = (uint64_t)&v59 - v19;
    uint64_t v66 = v18;
    uint64_t v67 = a3;
    uint64_t v68 = v17;
    long long v70 = *a2;
    long long v20 = (void *)(*((void *)&v70 + 1) + *MEMORY[0x263F62408]);
    sub_22E7B4230((uint64_t)v20, (uint64_t)v69);
    id v61 = a1;
    sub_22E7BFBC8((uint64_t)&v70);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268611188);
    sub_22E7F30F0();
    int v21 = swift_dynamicCast();
    uint64_t v64 = v10;
    uint64_t v65 = v9;
    v62 = v8;
    v60 = v12;
    if (v21)
    {
      swift_release();
      sub_22E7BFC28((uint64_t)&v70);
      long long v22 = (_OWORD *)swift_allocObject();
      long long v23 = a2[1];
      v22[1] = *a2;
      v22[2] = v23;
      v22[3] = a2[2];
      uint64_t v24 = (void *)*((void *)a2 + 4);
      sub_22E7BFBC8((uint64_t)&v70);
      swift_unknownObjectRetain();
      id v25 = v24;
      swift_retain();
      uint64_t v26 = sub_22E7C4BEC;
    }
    else
    {
      sub_22E7BFC28((uint64_t)&v70);
      uint64_t v26 = 0;
      long long v22 = 0;
    }
    uint64_t v29 = v20[3];
    uint64_t v30 = v20[4];
    __swift_project_boxed_opaque_existential_1(v20, v29);
    uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 80))(v29, v30);
    if (v32 >> 60 == 15)
    {
      id v33 = 0;
      if (!v21)
      {
LABEL_10:
        uint64_t v34 = sub_22E7BA6E0;
        uint64_t v35 = v6;
        uint64_t v36 = 0;
LABEL_13:
        uint64_t v43 = swift_allocObject();
        *(void *)(v43 + 16) = v34;
        *(void *)(v43 + 24) = v36;
        uint64_t v44 = (void *)*((void *)a2 + 4);
        uint64_t v45 = swift_allocObject();
        long long v46 = a2[1];
        *(_OWORD *)(v45 + 16) = *a2;
        *(_OWORD *)(v45 + 32) = v46;
        *(_OWORD *)(v45 + 48) = a2[2];
        id v47 = v61;
        *(void *)(v45 + 64) = v61;
        id v61 = v47;
        sub_22E7BFBC8((uint64_t)&v70);
        swift_unknownObjectRetain();
        id v48 = v44;
        swift_retain();
        uint64_t v49 = v60;
        sub_22E7F3F90();
        uint64_t v50 = v62;
        v51 = (char *)v62 + *(int *)(v35 + 20);
        uint64_t v52 = v64;
        uint64_t v53 = v65;
        (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v51, v49, v65);
        *uint64_t v50 = &unk_268611198;
        v50[1] = v45;
        sub_22E7A6DF4((uint64_t)v50, (uint64_t)&v16[*(int *)(v68 + 36)]);
        *(void *)uint64_t v16 = sub_22E7C4910;
        *((void *)v16 + 1) = v43;
        *((void *)v16 + 2) = sub_22E7BFCA4;
        *((void *)v16 + 3) = 0;
        v16[32] = 1;
        *((void *)v16 + 5) = v33;
        *((void *)v16 + 6) = 0;
        uint64_t v54 = MEMORY[0x263F8EE78];
        *((void *)v16 + 7) = 0;
        *((void *)v16 + 8) = v54;
        sub_22E7A6E60((uint64_t)sub_22E7C4910);
        sub_22E7A6E60((uint64_t)sub_22E7BFCA4);
        id v55 = v33;
        swift_bridgeObjectRetain();
        sub_22E7A6E70((uint64_t)v50);

        (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v53);
        sub_22E7A6ED4((uint64_t)sub_22E7C4910);
        sub_22E7A6ED4((uint64_t)sub_22E7BFCA4);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        uint64_t v56 = v63;
        sub_22E7C4A4C((uint64_t)v16, v63);
        uint64_t v57 = v56;
        uint64_t v58 = v67;
        sub_22E7C4A4C(v57, v67);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v66 + 56))(v58, 0, 1, v68);
      }
    }
    else
    {
      uint64_t v37 = v31;
      unint64_t v38 = v32;
      id v39 = objc_allocWithZone(MEMORY[0x263F827E8]);
      uint64_t v40 = v6;
      uint64_t v41 = v26;
      uint64_t v42 = (void *)sub_22E7F2F70();
      id v33 = objc_msgSend(v39, sel_initWithData_, v42);
      sub_22E7C4B2C(v37, v38);

      uint64_t v26 = v41;
      uint64_t v6 = v40;
      if (!v21) {
        goto LABEL_10;
      }
    }
    uint64_t v35 = v6;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v26;
    *(void *)(v36 + 24) = v22;
    uint64_t v34 = sub_22E7C4AEC;
    goto LABEL_13;
  }
  uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 56);
  return v27(a3, 1, 1);
}

uint64_t sub_22E7C3C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  long long v5 = (void *)(*(void *)(a5 + 8) + *MEMORY[0x263F62408]);
  uint64_t v6 = v5[3];
  uint64_t v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
  uint64_t v8 = sub_22E7F3EC0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_22E7C3D28(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  sub_22E7F3F80();
  v2[6] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v2[7] = v4;
  v2[8] = v3;
  return MEMORY[0x270FA2498](sub_22E7C3DC0, v4, v3);
}

uint64_t sub_22E7C3DC0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void **)(v2 + 32);
  objc_msgSend(v3, sel_setForceInlinePresentation_, 0);
  objc_msgSend(v3, sel_setPresentingViewController_, v1);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v2;
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  swift_retain();
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v5;
  void *v5 = v0;
  v5[1] = sub_22E7C3ED0;
  return MEMORY[0x270F58950](sub_22E7C4BF4, v4);
}

uint64_t sub_22E7C3ED0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 16;
  swift_task_dealloc();
  sub_22E7BFC28(v2);
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_22E7C4020, v4, v3);
}

uint64_t sub_22E7C4020()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_22E7C4084(uint64_t a1)
{
  uint64_t v2 = sub_22E7F4100();
  return sub_22E7C41D0(a1, v2);
}

unint64_t sub_22E7C40C8(uint64_t a1, uint64_t a2)
{
  sub_22E7F42A0();
  sub_22E7F3EE0();
  uint64_t v4 = sub_22E7F42C0();
  return sub_22E7C4298(a1, a2, v4);
}

unint64_t sub_22E7C4140(uint64_t a1)
{
  sub_22E7F3E90();
  sub_22E7F42A0();
  sub_22E7F3EE0();
  uint64_t v2 = sub_22E7F42C0();
  swift_bridgeObjectRelease();
  return sub_22E7C437C(a1, v2);
}

unint64_t sub_22E7C41D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_22E7C4F14(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x230FA3F10](v9, a1);
      sub_22E7C4F70((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_22E7C4298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22E7F4210() & 1) == 0)
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
      while (!v14 && (sub_22E7F4210() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22E7C437C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_22E7F3E90();
    uint64_t v8 = v7;
    if (v6 == sub_22E7F3E90() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_22E7F4210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_22E7F3E90();
          uint64_t v15 = v14;
          if (v13 == sub_22E7F3E90() && v15 == v16) {
            break;
          }
          char v18 = sub_22E7F4210();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

id sub_22E7C44F4@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610EF0);
  swift_allocObject();
  uint64_t v4 = sub_22E7F3050();
  sub_22E7F3140();
  sub_22E7C4ECC(&qword_2686111F8, MEMORY[0x263F62418]);
  swift_retain();
  uint64_t v5 = sub_22E7F37A0();
  uint64_t v7 = v6;
  id v8 = objc_allocWithZone(MEMORY[0x263F34A10]);
  swift_unknownObjectRetain();
  id result = objc_msgSend(v8, sel_initWithPresentingViewController_, 0);
  if (result)
  {
    uint64_t v10 = result;
    id v11 = a1;
    id v12 = v10;
    objc_msgSend(v12, sel_setDelegate_, v11);

    id result = (id)swift_release();
    *a2 = v5;
    a2[1] = v7;
    a2[2] = (uint64_t)v11;
    a2[3] = (uint64_t)&off_26E234040;
    a2[4] = (uint64_t)v12;
    a2[5] = v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_22E7C4638()
{
  unint64_t result = qword_268611178;
  if (!qword_268611178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611178);
  }
  return result;
}

uint64_t destroy for PASUIAIDASignInView(uint64_t a1)
{
  swift_release();
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for PASUIAIDASignInView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v4;
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = v5;
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIAIDASignInView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = v4;
  uint64_t v5 = (void *)a2[4];
  id v6 = (void *)a1[4];
  a1[4] = v5;
  id v7 = v5;

  a1[5] = a2[5];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PASUIAIDASignInView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  uint64_t v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIAIDASignInView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIAIDASignInView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIAIDASignInView()
{
  return &type metadata for PASUIAIDASignInView;
}

uint64_t sub_22E7C48E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7C4908@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22E7C3690(a1, (_OWORD *)(v2 + 16), a2);
}

uint64_t sub_22E7C4910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v5)(uint64_t *__return_ptr, void *, void *);
  uint64_t v7;
  void v8[2];
  void v9[2];

  uint64_t v5 = *(void (**)(uint64_t *__return_ptr, void *, void *))(v4 + 16);
  v9[0] = a1;
  v9[1] = a2;
  v8[0] = a3;
  v8[1] = a4;
  v5(&v7, v9, v8);
  return v7;
}

uint64_t sub_22E7C4958()
{
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_22E7C49B0()
{
  uint64_t v2 = v0 + 16;
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_22E7A6D00;
  return sub_22E7C3D28(v2, v3);
}

uint64_t sub_22E7C4A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E7C4AB4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7C4AEC@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void, void, void))(v3 + 16))(*a1, a1[1], *a2, a2[1]);
  *a3 = result;
  a3[1] = v6;
  return result;
}

uint64_t sub_22E7C4B2C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_22E7C4B40(a1, a2);
  }
  return a1;
}

uint64_t sub_22E7C4B40(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t objectdestroyTm_3()
{
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_22E7C4BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22E7C3C84(a1, a2, a3, a4, v4 + 16);
}

id sub_22E7C4BF4(uint64_t a1)
{
  return sub_22E7C4C00(a1, *(void *)(v1 + 24), *(void *)(*(void *)(v1 + 16) + 32));
}

id sub_22E7C4C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25D48]), sel_initWithPresentingViewController_, a2);
  objc_msgSend(v6, sel_setBackgroundDataclassEnablement_, 1);
  objc_msgSend(v6, sel_setCdpContext_, a1);
  objc_msgSend(v6, sel_setFindMyActivationAction_, 0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F27E88]), sel_init);
  objc_msgSend(v7, sel_setIgnoreAccountConversion_, 1);
  id v8 = (void *)sub_22E7F3E60();
  objc_msgSend(v7, sel_setDebugReason_, v8);

  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F26D78]), sel_init);
  objc_msgSend(v9, sel_setCdpUiProvider_, a3);
  objc_msgSend(v9, sel_setViewController_, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686111A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22E7F6A30;
  id v11 = (void *)*MEMORY[0x263F26D28];
  *(void *)(inited + 32) = *MEMORY[0x263F26D28];
  uint64_t v12 = sub_22E7C4E80(0, &qword_2686111A8);
  *(void *)(inited + 40) = v6;
  uint64_t v13 = (void *)*MEMORY[0x263F26D48];
  *(void *)(inited + 64) = v12;
  *(void *)(inited + 72) = v13;
  *(void *)(inited + 104) = sub_22E7C4E80(0, &qword_2686111B0);
  *(void *)(inited + 80) = v7;
  id v14 = v11;
  id v15 = v6;
  id v16 = v13;
  id v17 = v7;
  sub_22E7C3064(inited, &qword_2686111B8, &qword_2686111C0);
  type metadata accessor for AIDAServiceType(0);
  sub_22E7C4ECC(&qword_2686107F0, type metadata accessor for AIDAServiceType);
  char v18 = (void *)sub_22E7F3E00();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setSignInContexts_, v18);

  return v9;
}

uint64_t sub_22E7C4E80(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_22E7C4EBC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22E7C4ECC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22E7C4F14(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22E7C4F70(uint64_t a1)
{
  return a1;
}

unint64_t sub_22E7C4FC8()
{
  unint64_t result = qword_268611208;
  if (!qword_268611208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611208);
  }
  return result;
}

id PASUITargetViewPresenter.__allocating_init(parentViewController:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithParentViewController_, a1);

  return v3;
}

id PASUITargetViewPresenter.init(parentViewController:)(void *a1)
{
  long long v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v5 = v2;
  id v6 = objc_msgSend(a1, sel_navigationController);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = type metadata accessor for PASViewControllerPresentationHandler();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    uint64_t v10 = &off_26E231808;
  }
  else
  {
    uint64_t v8 = type metadata accessor for PASDefaultFlowStepsPresentationHandler();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a1;
    id v11 = a1;
    uint64_t v10 = &protocol witness table for PASDefaultFlowStepsPresentationHandler;
  }

  v16[3] = v8;
  v16[4] = v10;
  v16[0] = v9;
  sub_22E7B4230((uint64_t)v16, (uint64_t)v15);
  id v12 = objc_allocWithZone(ObjectType);
  id v13 = PASUITargetViewPresenter.init(navigationController:)((uint64_t)v15);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

uint64_t PASFlowStepExtensionProvidedPicker.buildView()()
{
  return sub_22E7F3D60();
}

unint64_t sub_22E7C5240()
{
  unint64_t result = qword_268611218;
  if (!qword_268611218)
  {
    sub_22E7F34D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611218);
  }
  return result;
}

unint64_t sub_22E7C5298()
{
  unint64_t result = qword_268611220;
  if (!qword_268611220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611220);
  }
  return result;
}

uint64_t sub_22E7C52EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  long long v22 = a3;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611228);
  uint64_t v5 = *(void *)(v21 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v21);
  long long v20 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v35 = a2;
  swift_retain();
  uint64_t v33 = sub_22E7F3ED0();
  uint64_t v34 = v10;
  sub_22E7F34D0();
  sub_22E7C5240();
  sub_22E7F37B0();
  swift_getKeyPath();
  sub_22E7F37C0();
  swift_release();
  swift_release();
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610870);
  unint64_t v12 = sub_22E7C63A0();
  unint64_t v13 = sub_22E7A9CD0();
  unint64_t v18 = sub_22E7A9D24();
  sub_22E7F3C20();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v14 = v21;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v20, v9, v21);
  id v25 = &_s30ExtensionViewControllerWrapperVN;
  uint64_t v26 = MEMORY[0x263F8D310];
  uint64_t v27 = v11;
  uint64_t v28 = MEMORY[0x263F1A830];
  unint64_t v29 = v12;
  unint64_t v30 = v13;
  unint64_t v31 = v18;
  uint64_t v32 = MEMORY[0x263F1A820];
  swift_getOpaqueTypeConformance2();
  uint64_t v15 = v14;
  uint64_t v16 = sub_22E7F3D60();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v15);
  uint64_t *v22 = v16;
  return result;
}

uint64_t sub_22E7C55EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v34 = a1;
  unint64_t v38 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610890);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610898);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v37 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v36 = (char *)&v33 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v35 = (char *)&v33 - v15;
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v33 - v16;
  uint64_t v39 = sub_22E7F3ED0();
  uint64_t v40 = v18;
  sub_22E7F3660();
  uint64_t v19 = sub_22E7F3670();
  long long v20 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v7, 0, 1, v19);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a1;
  *(void *)(v21 + 24) = a2;
  sub_22E7A9CD0();
  swift_retain();
  sub_22E7F3D50();
  uint64_t v39 = sub_22E7F3ED0();
  uint64_t v40 = v22;
  sub_22E7F3650();
  v20(v7, 0, 1, v19);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v34;
  *(void *)(v23 + 24) = a2;
  swift_retain();
  uint64_t v24 = v35;
  sub_22E7F3D50();
  id v25 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  uint64_t v26 = v36;
  v25(v36, v17, v8);
  uint64_t v27 = v37;
  uint64_t v28 = v24;
  v25(v37, v24, v8);
  unint64_t v29 = v38;
  v25(v38, v26, v8);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686108A0);
  v25(&v29[*(int *)(v30 + 48)], v27, v8);
  unint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
  v31(v28, v8);
  v31(v17, v8);
  v31(v27, v8);
  return ((uint64_t (*)(char *, uint64_t))v31)(v26, v8);
}

uint64_t sub_22E7C59C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a5;
  sub_22E7F3F80();
  *(void *)(v5 + 24) = sub_22E7F3F70();
  uint64_t v7 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7C5A58, v7, v6);
}

uint64_t sub_22E7C5A58()
{
  swift_release();
  swift_retain();
  sub_22E7F3170();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7C5ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_22E7F3F80();
  swift_retain();
  uint64_t v11 = sub_22E7F3F70();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  uint64_t v12[3] = v13;
  v12[4] = a1;
  v12[5] = a2;
  sub_22E7AA784((uint64_t)v9, a4, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_22E7C5BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a5;
  sub_22E7F3F80();
  v5[3] = sub_22E7F3F70();
  uint64_t v7 = sub_22E7F3F50();
  v5[4] = v7;
  v5[5] = v6;
  return MEMORY[0x270FA2498](sub_22E7C5C7C, v7, v6);
}

uint64_t sub_22E7C5C7C()
{
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7C5D1C;
  return MEMORY[0x270F58960]();
}

uint64_t sub_22E7C5D1C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_22E7A6468, v3, v2);
}

uint64_t sub_22E7C5E60@<X0>(uint64_t a1@<X8>)
{
  sub_22E7F3ED0();
  sub_22E7A9CD0();
  uint64_t result = sub_22E7F3B10();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22E7C5ED0@<X0>(uint64_t *a1@<X8>)
{
  return sub_22E7C52EC(*v1, v1[1], a1);
}

char *sub_22E7C5ED8()
{
  uint64_t v0 = sub_22E7F3040();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7F3100();
  swift_retain();
  swift_dynamicCast();
  if (qword_268610668 != -1) {
    swift_once();
  }
  uint64_t v3 = static PASUIConstants.extensionDefaultSceneID;
  uint64_t v4 = unk_268614C20;
  swift_bridgeObjectRetain();
  uint64_t v5 = (char *)sub_22E7E0E98((uint64_t)v2, v3, v4);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611260);
  sub_22E7F3A40();
  *(void *)&v5[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate + 8] = &off_26E2325B0;
  swift_unknownObjectWeakAssign();
  swift_release();
  return v5;
}

uint64_t sub_22E7C604C()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

char *sub_22E7C6084()
{
  return sub_22E7C5ED8();
}

uint64_t sub_22E7C608C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  _s30ExtensionViewControllerWrapperV11CoordinatorCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *a1 = v4;
  return swift_retain();
}

uint64_t sub_22E7C60E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22E7C6D34();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_22E7C6144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22E7C6D34();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_22E7C61A8()
{
}

void sub_22E7C61D0(uint64_t a1@<X8>)
{
  int v3 = *(unsigned __int8 *)(*(void *)(*v1 + *MEMORY[0x263F62528] + 8) + *MEMORY[0x263F623E8]);
  if (v3 == 1)
  {
    *(unsigned char *)a1 = 1;
  }
  else
  {
    uint64_t v4 = _s20EmptyProxCardAdapterCMa();
    uint64_t v5 = swift_allocObject();
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = &off_26E2325A0;
    *(void *)a1 = v5;
  }
  *(unsigned char *)(a1 + 40) = v3;
}

uint64_t sub_22E7C6260()
{
  return sub_22E7F3D60();
}

uint64_t _s30ExtensionViewControllerWrapperV11CoordinatorCMa()
{
  return self;
}

uint64_t _s20EmptyProxCardAdapterCMa()
{
  return self;
}

ValueMetadata *_s27ExtensionProvidedPickerViewVMa()
{
  return &_s27ExtensionProvidedPickerViewVN;
}

uint64_t sub_22E7C6324()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7C6340@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22E7F3180();
  *a1 = result & 1;
  return result;
}

uint64_t sub_22E7C6370()
{
  return sub_22E7F3190();
}

uint64_t sub_22E7C6398@<X0>(char *a1@<X8>)
{
  return sub_22E7C55EC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_22E7C63A0()
{
  unint64_t result = qword_268611230;
  if (!qword_268611230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268611230);
  }
  return result;
}

uint64_t sub_22E7C63F4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7C642C()
{
  return sub_22E7C5ACC(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_26E232658, (uint64_t)&unk_268611250);
}

uint64_t sub_22E7C6464()
{
  return sub_22E7C5ACC(*(void *)(v0 + 16), *(void *)(v0 + 24), (uint64_t)&unk_26E232630, (uint64_t)&unk_268611240);
}

uint64_t sub_22E7C64A0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22E7A6D00;
  return sub_22E7C5BE4(a1, v4, v5, v7, v6);
}

uint64_t sub_22E7C6564(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22E7A7F00;
  return sub_22E7C59C0(a1, v4, v5, v7, v6);
}

uint64_t sub_22E7C6624(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_22E7F3580();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  id v11 = a1;
  id v12 = a2;
  uint64_t v13 = v11;
  id v14 = v12;
  uint64_t v15 = sub_22E7F3570();
  int v16 = sub_22E7F3FD0();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    int v26 = v16;
    uint64_t v29 = v6;
    uint64_t v30 = v3;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 141558530;
    uint64_t v31 = 1752392040;
    sub_22E7F40C0();
    *(_WORD *)(v17 + 12) = 2112;
    uint64_t v18 = (uint64_t *)((char *)v13 + *MEMORY[0x263F624D8]);
    uint64_t v19 = v18[1];
    uint64_t v27 = v7;
    if (v19)
    {
      uint64_t v20 = *v18;
      sub_22E7BE0C8();
      swift_allocError();
      *uint64_t v21 = v20;
      v21[1] = v19;
      swift_bridgeObjectRetain();
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v31 = v19;
    }
    else
    {
      uint64_t v31 = 0;
    }
    sub_22E7F40C0();
    uint64_t v22 = v28;
    *uint64_t v28 = v19;

    *(_WORD *)(v17 + 22) = 2114;
    uint64_t v31 = (uint64_t)v14;
    id v23 = v14;
    sub_22E7F40C0();
    v22[1] = v14;

    _os_log_impl(&dword_22E7A0000, v15, (os_log_type_t)v26, "ExtensionViewControllerWrapper.Coordinator hostViewController didPick account: %{mask.hash}@, context: %{public}@", (uint8_t *)v17, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v22, -1, -1);
    MEMORY[0x230FA4830](v17, -1, -1);
    uint64_t v6 = v29;
    uint64_t v7 = v27;
  }
  else
  {

    uint64_t v15 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_22E7F34B0();
}

uint64_t sub_22E7C6970(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  id v11 = sub_22E7F3570();
  os_log_type_t v12 = sub_22E7F3FF0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v22 = v2;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = v4;
    id v14 = (uint8_t *)v13;
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)id v14 = 138543362;
    id v16 = a1;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v23 = v17;
    sub_22E7F40C0();
    *uint64_t v15 = v17;

    _os_log_impl(&dword_22E7A0000, v11, v12, "ExtensionViewControllerWrapper.Coordinator hostViewController didFailWith %{public}@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v15, -1, -1);
    uint64_t v18 = v14;
    uint64_t v4 = v21;
    MEMORY[0x230FA4830](v18, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_22E7F34C0();
}

uint64_t sub_22E7C6BB0()
{
  uint64_t v0 = sub_22E7F3580();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F3FD0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "ExtensionViewControllerWrapper.Coordinator hostViewControllerWantsToPromptForFlowCancel", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_22E7F3160();
}

ValueMetadata *_s30ExtensionViewControllerWrapperVMa()
{
  return &_s30ExtensionViewControllerWrapperVN;
}

uint64_t sub_22E7C6D24()
{
  return MEMORY[0x263F1B718];
}

unint64_t sub_22E7C6D34()
{
  unint64_t result = qword_268611258;
  if (!qword_268611258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611258);
  }
  return result;
}

unint64_t sub_22E7C6D8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PASUIProgressViewProxCardAdapter();
  uint64_t v4 = (void *)swift_allocObject();
  v4[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  v4[2] = sub_22E7F3050();
  swift_retain();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t result = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t result = MEMORY[0x263F8EE88];
  }
  v4[3] = result;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = &off_26E2337B8;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepSendSelectedAccount.buildView()()
{
  sub_22E7A6F2C();
  return sub_22E7F3D60();
}

unint64_t sub_22E7C6E90@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7C6D8C(a1);
}

uint64_t sub_22E7C6EB4()
{
  sub_22E7A6F2C();
  return sub_22E7F3D60();
}

uint64_t PASFlowStepLocalAuth.buildView()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611268);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v6 = (char *)&v14 - v5;
  uint64_t v7 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  id v8 = objc_allocWithZone(v7);
  swift_retain();
  id v9 = objc_msgSend(v8, sel_init);
  uint64_t v17 = v7;
  uint64_t v18 = &off_26E232D68;
  id v16 = v9;
  sub_22E7C7104();
  id v14 = (ValueMetadata *)sub_22E7F37A0();
  unint64_t v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610EF0);
  swift_allocObject();
  uint64_t v19 = sub_22E7F3050();
  unint64_t v11 = sub_22E7C715C();
  sub_22E7F3C00();
  sub_22E7C71B0((uint64_t)&v14);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  id v14 = &type metadata for PASUILocalAuthView;
  unint64_t v15 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_22E7C7104()
{
  unint64_t result = qword_268611270;
  if (!qword_268611270)
  {
    sub_22E7F3120();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611270);
  }
  return result;
}

unint64_t sub_22E7C715C()
{
  unint64_t result = qword_268611278;
  if (!qword_268611278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268611278);
  }
  return result;
}

uint64_t sub_22E7C71B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_22E7C71E0()
{
  return PASFlowStepLocalAuth.buildView()();
}

ValueMetadata *type metadata accessor for PASUILocalAuthView()
{
  return &type metadata for PASUILocalAuthView;
}

uint64_t sub_22E7C7214()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22E7C7230@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  sub_22E7C765C(v1, (uint64_t)&v25);
  uint64_t v4 = (_OWORD *)swift_allocObject();
  long long v5 = v26;
  v4[1] = v25;
  v4[2] = v5;
  long long v6 = v28;
  v4[3] = v27;
  v4[4] = v6;
  uint64_t v7 = *(void *)(*(void *)(v2 + 8) + *MEMORY[0x263F623F8]);
  unint64_t v8 = *(void *)(v7 + 32);
  if (v8 >> 60 == 15)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(v7 + 24);
    id v11 = objc_allocWithZone(MEMORY[0x263F827E8]);
    sub_22E7C7788(v10, v8);
    uint64_t v12 = (void *)sub_22E7F2F70();
    id v9 = objc_msgSend(v11, sel_initWithData_, v12);
    sub_22E7C4B2C(v10, v8);
  }
  sub_22E7B4230(v2 + 16, (uint64_t)v24);
  sub_22E7C765C(v2, (uint64_t)v23);
  uint64_t v13 = (_OWORD *)swift_allocObject();
  long long v14 = v23[1];
  v13[1] = v23[0];
  v13[2] = v14;
  long long v15 = v23[3];
  void v13[3] = v23[2];
  v13[4] = v15;
  sub_22E7B4230((uint64_t)v24, (uint64_t)v22);
  v22[5] = &unk_268611288;
  void v22[6] = v13;
  sub_22E7C079C((uint64_t)v22, (uint64_t)v29 + 8);
  *(void *)&long long v25 = sub_22E7C7698;
  *((void *)&v25 + 1) = v4;
  *(void *)&long long v26 = sub_22E7BFCA4;
  *((void *)&v26 + 1) = 0;
  LOBYTE(v27) = 1;
  *((void *)&v27 + 1) = v9;
  long long v28 = 0uLL;
  *(void *)&v29[0] = MEMORY[0x263F8EE78];
  sub_22E7A6E60((uint64_t)sub_22E7C7698);
  sub_22E7A6E60((uint64_t)sub_22E7BFCA4);
  id v16 = v9;
  swift_bridgeObjectRetain();
  sub_22E7C07F8((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  sub_22E7A6ED4((uint64_t)sub_22E7C7698);
  sub_22E7A6ED4((uint64_t)sub_22E7BFCA4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  long long v17 = v29[1];
  a1[4] = v29[0];
  a1[5] = v17;
  long long v18 = v29[3];
  a1[6] = v29[2];
  a1[7] = v18;
  long long v19 = v26;
  *a1 = v25;
  a1[1] = v19;
  double result = *(double *)&v27;
  long long v21 = v28;
  a1[2] = v27;
  a1[3] = v21;
  return result;
}

uint64_t sub_22E7C7478()
{
  swift_retain();
  sub_22E7F30E0();
  swift_release();
  uint64_t v0 = sub_22E7F3EC0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E7C7510(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_22E7F3F80();
  v2[4] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v2[5] = v4;
  v2[6] = v3;
  return MEMORY[0x270FA2498](sub_22E7C75A8, v4, v3);
}

uint64_t sub_22E7C75A8()
{
  v0[7] = *(void *)(v0[3] + 8);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7C04D8;
  uint64_t v2 = v0[2];
  return MEMORY[0x270F58940](v2);
}

uint64_t sub_22E7C765C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22E7C7698()
{
  return sub_22E7C7478();
}

uint64_t objectdestroyTm_4()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_22E7C76EC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22E7A6D00;
  return sub_22E7C7510(a1, v1 + 16);
}

uint64_t sub_22E7C7788(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_22E7C77E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22E7F3FB0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  long long v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_22E7C7D88((uint64_t)v4);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_22E7F3FA0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_22E7F3F50();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_268611298;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    void v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_22E7C7A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_22E7C7A40, 0, 0);
}

uint64_t sub_22E7C7A40()
{
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(*(void *)(v0 + 16) + 24) + **(int **)(*(void *)(v0 + 16) + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7C7B0C;
  return v3();
}

uint64_t sub_22E7C7B0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22E7C7C3C()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for PASUIButtonActionHandler()
{
  return self;
}

uint64_t sub_22E7C7CA0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7C7CE0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7A6D00;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_22E7C7A40, 0, 0);
}

uint64_t sub_22E7C7D88(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22E7C7DE8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7C7E20(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22E7A6D00;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2686119E0 + dword_2686119E0);
  return v6(a1, v4);
}

void sub_22E7C7ED8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22E7C7F40()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v2, sel_setInterruptionHandler_, 0);
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    objc_msgSend(v2, sel_invalidate);

    uint64_t v1 = *(void **)(v0 + 16);
  }

  swift_unknownObjectRelease();
  sub_22E7B4FDC(v0 + 32);
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for PASUIExtensionProxy()
{
  return self;
}

uint64_t sub_22E7C7FFC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26E247A60);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v8);

  objc_msgSend(a1, sel_setExportedObject_, *(void *)(v2 + 24));
  id v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_26E249780);
  objc_msgSend(a1, sel_setExportedInterface_, v9);

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_22E7C9264;
  *(void *)(v10 + 24) = v6;
  void v14[4] = sub_22E7C92A4;
  v14[5] = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  void v14[2] = sub_22E7CC0A8;
  v14[3] = &block_descriptor_3;
  uint64_t v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v11);
  _Block_release(v11);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_22E7C9264;
  *(void *)(v12 + 24) = v6;
  swift_retain();
  sub_22E7C8A98((uint64_t (*)())sub_22E7C92C4, v12);
  swift_release();
  return swift_release();
}

uint64_t sub_22E7C8244(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22E7F3DD0();
  uint64_t v18 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_22E7F3DF0();
  uint64_t v9 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7C4E80(0, (unint64_t *)&qword_268611970);
  uint64_t v12 = (void *)sub_22E7F4050();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a2;
  void v13[3] = a3;
  v13[4] = a1;
  aBlock[4] = sub_22E7C933C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22E7CC0A8;
  aBlock[3] = &block_descriptor_37;
  long long v14 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  id v15 = a1;
  swift_release();
  sub_22E7F3DE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22E7C9348();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611980);
  sub_22E7C93A0();
  sub_22E7F40F0();
  MEMORY[0x230FA3E60](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v17);
}

void sub_22E7C84F4(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    swift_beginAccess();
    uint64_t v7 = MEMORY[0x230FA4900](a2 + 16);
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = *(void **)(v6 + 16);
      if (v9)
      {
        sub_22E7C4E80(0, &qword_2686112B8);
        id v10 = v8;
        id v11 = v9;
        char v12 = sub_22E7F40B0();

        if ((v12 & 1) != 0 && (sub_22E7C8C74(), MEMORY[0x230FA4900](v6 + 32)))
        {
          if (objc_msgSend(self, sel_isMainThread))
          {
            sub_22E7DF4A0(a3, 0, 1);
            swift_release();

            swift_unknownObjectRelease();
          }
          else
          {
            __break(1u);
          }
        }
        else
        {
          swift_release();
        }
      }
      else
      {
        swift_release();
      }
    }
    else
    {
      swift_release();
    }
  }
}

void sub_22E7C8658(void (*a1)(void))
{
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F3FF0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIExtensionProxy configure.interruptionHandler host's XPC connection to extension scene interrupted", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_22E7F3E90();
  id v10 = objc_allocWithZone(MEMORY[0x263F087E8]);
  id v11 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, 4097, 0);

  id v13 = v12;
  a1();
}

void sub_22E7C8838(void *a1, void (*a2)(void *))
{
  long long v19 = a2;
  uint64_t v3 = sub_22E7F3580();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v7 = a1;
    uint64_t v8 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
    id v9 = a1;
    id v10 = a1;
    id v11 = sub_22E7F3570();
    os_log_type_t v12 = sub_22E7F3FF0();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)id v13 = 138543362;
      uint64_t v17 = v13 + 4;
      id v14 = a1;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v20 = v15;
      sub_22E7F40C0();
      id v16 = v18;
      void *v18 = v15;

      _os_log_impl(&dword_22E7A0000, v11, v12, "PASUIExtensionProxy configure.hello.completion hello message from host to extension scene failed: %{public}@", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v16, -1, -1);
      MEMORY[0x230FA4830](v13, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v19(a1);
  }
}

uint64_t sub_22E7C8A98(uint64_t (*a1)(), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  id v16 = sub_22E7C92CC;
  uint64_t v17 = v6;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  id v14 = sub_22E7C7ED8;
  uint64_t v15 = &block_descriptor_28;
  id v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  id v8 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_22E7F40E0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686112A0);
  swift_dynamicCast();
  swift_release();
  id v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  id v14 = sub_22E7DEF3C;
  uint64_t v15 = &block_descriptor_31;
  id v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_helloWithCompletion_, v9);
  _Block_release(v9);
  return swift_unknownObjectRelease();
}

void sub_22E7C8C74()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(self, sel_isMainThread))
  {
    uint64_t v6 = *(void **)(v1 + 16);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = sub_22E7F3560();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
      id v9 = sub_22E7F3570();
      os_log_type_t v10 = sub_22E7F3FD0();
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_22E7A0000, v9, v10, "PASUIExtensionProxy tearDownConnection invalidating host's XPC connection to extension scene", v11, 2u);
        MEMORY[0x230FA4830](v11, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      os_log_type_t v12 = *(void **)(v1 + 16);
      *(void *)(v1 + 16) = 0;

      objc_msgSend(v7, sel_setInterruptionHandler_, 0);
      objc_msgSend(v7, sel_setInvalidationHandler_, 0);
      objc_msgSend(v7, sel_invalidate);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22E7C8E48(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_22E7C8E70(uint64_t a1)
{
  uint64_t v2 = sub_22E7F3580();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = self;
  if (!objc_msgSend(v3, sel_isMainThread))
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = sub_22E7DFFCC();
  if (!objc_msgSend(v3, sel_isMainThread))
  {
LABEL_7:
    __break(1u);
    __break(1u);
    return;
  }
  sub_22E7C8C74();
  sub_22E7C7FFC(v4);
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  objc_msgSend(v6, sel_activate);
}

uint64_t sub_22E7C91B4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7C91EC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7C9224()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7C9264(void *a1)
{
  return sub_22E7C8244(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22E7C926C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22E7C92A4()
{
  sub_22E7C8658(*(void (**)(void))(v0 + 16));
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

void sub_22E7C92C4(void *a1)
{
  sub_22E7C8838(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_22E7C92CC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22E7C92F4()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_22E7C933C()
{
  sub_22E7C84F4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

unint64_t sub_22E7C9348()
{
  unint64_t result = qword_2686112A8;
  if (!qword_2686112A8)
  {
    sub_22E7F3DD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686112A8);
  }
  return result;
}

unint64_t sub_22E7C93A0()
{
  unint64_t result = qword_2686112B0;
  if (!qword_2686112B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268611980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686112B0);
  }
  return result;
}

void sub_22E7C9534()
{
  id v1 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v1, sel_scale);
  double v3 = v2;

  id v4 = objc_allocWithZone((Class)PASUIMicaPlayer);
  uint64_t v5 = (void *)sub_22E7F3E60();
  id v6 = objc_msgSend(v4, sel_initWithFileName_retinaScale_, v5, v3);

  uint64_t v7 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer;
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer];
  *(void *)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer] = v6;

  id v9 = *(void **)&v0[v7];
  if (!v9)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v10 = v9;
  id v11 = objc_msgSend(v0, sel_layer);
  sub_22E7F3E90();
  os_log_type_t v12 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_addToLayer_onTop_gravity_, v11, 1, v12);

  uint64_t v13 = *(void **)&v0[v7];
  if (!v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(v13, sel_pause);
  id v14 = *(void **)&v0[v7];
  if (!v14)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v15 = objc_msgSend(v14, sel_rootLayer);
  if (!v15)
  {
LABEL_11:
    __break(1u);
    return;
  }
  id v16 = v15;
  id v17 = objc_msgSend(self, sel_systemBlueColor);
  id v18 = objc_msgSend(v17, sel_CGColor);

  objc_msgSend(v16, sel_mp_setFillOfAllShapeLayersToColor_, v18);
}

void sub_22E7C9740()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for PASUIMicaView();
  objc_msgSendSuper2(&v5, sel_layoutSubviews);
  id v1 = *(void **)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI13PASUIMicaView_micaPlayer];
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(v0, sel_layer);
    sub_22E7F3E90();
    id v4 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_moveAndResizeWithinParentLayer_usingGravity_animate_, v3, v4, 0);
  }
  else
  {
    __break(1u);
  }
}

id sub_22E7C9850()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUIMicaView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PASUIMicaView()
{
  return self;
}

uint64_t sub_22E7C98B8(id *a1)
{
  swift_release();
  return swift_release();
}

uint64_t sub_22E7C98FC(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  id v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_22E7C995C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22E7C99D0(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release();
  return a1;
}

uint64_t type metadata accessor for PASPresentationControllerView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22E7C9A38()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7C9A7C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void (*a3)(void *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v37 = a6;
  uint64_t v33 = a4;
  uint64_t v34 = a3;
  uint64_t v40 = a7;
  uint64_t v39 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  id v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for PASPresentationControllerView.ViewControllerRepresentable();
  uint64_t v31 = sub_22E7F37F0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v47 = WitnessTable;
  uint64_t v48 = MEMORY[0x263F18BF0];
  uint64_t v38 = MEMORY[0x263F18E48];
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v35 = sub_22E7F3920();
  uint64_t v12 = sub_22E7F37F0();
  uint64_t v36 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v28 - v16;
  id v18 = a1;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v19 = a2;
  __swift_instantiateConcreteTypeFromMangledName(qword_268611348);
  sub_22E7F3D10();
  uint64_t v20 = v43;
  v34(v43);

  uint64_t v45 = v18;
  uint64_t v46 = v19;
  sub_22E7F3D10();
  long long v21 = v43;
  sub_22E7F3C30();

  uint64_t v22 = v45;
  uint64_t v43 = v45;
  uint64_t v44 = v46;
  sub_22E7F3DB0();
  uint64_t v23 = v37;
  sub_22E7F3B40();

  (*(void (**)(char *, uint64_t))(v39 + 8))(v11, a5);
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v41 = v23;
  uint64_t v42 = v24;
  uint64_t v25 = swift_getWitnessTable();
  sub_22E7C09E0(v15, v12, v25);
  long long v26 = *(void (**)(char *, uint64_t))(v36 + 8);
  v26(v15, v12);
  sub_22E7C09E0(v17, v12, v25);
  return ((uint64_t (*)(char *, uint64_t))v26)(v17, v12);
}

uint64_t sub_22E7C9DE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22E7C9A7C(*(void **)v2, *(void *)(v2 + 8), *(void (**)(void *))(v2 + 16), *(void *)(v2 + 24), *(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

uint64_t type metadata accessor for PASPresentationControllerView.ViewControllerRepresentable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22E7C9E14()
{
  return swift_getWitnessTable();
}

uint64_t sub_22E7C9F14()
{
  return swift_getWitnessTable();
}

id sub_22E7C9F30(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)nullsub_1(*v2, *(void *)(a2 + 16), *(void *)(a2 + 24));
  return v3;
}

uint64_t sub_22E7C9F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_22E7C9FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_22E7CA05C()
{
}

uint64_t PASFlowStepSendAuthResults.buildView()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686113D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v11 - v6;
  v11[0] = v0;
  unint64_t v8 = sub_22E7CA214();
  sub_22E7F3C00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUISendAuthResultsView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

unint64_t sub_22E7CA214()
{
  unint64_t result = qword_2686113D8;
  if (!qword_2686113D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2686113D8);
  }
  return result;
}

uint64_t sub_22E7CA268()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686113D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v11 - v6;
  v11[0] = *v0;
  unint64_t v8 = sub_22E7CA214();
  sub_22E7F3C00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUISendAuthResultsView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

ValueMetadata *type metadata accessor for PASUISendAuthResultsView()
{
  return &type metadata for PASUISendAuthResultsView;
}

uint64_t sub_22E7CA3F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7CA410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_22E7F3760();
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3FB0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain_n();
  sub_22E7F3F90();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(&v7[*(int *)(v5 + 28)], v11, v8);
  *(void *)uint64_t v7 = &unk_2686113E8;
  *((void *)v7 + 1) = a1;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C8);
  sub_22E7A6DF4((uint64_t)v7, a2 + *(int *)(v12 + 36));
  *(void *)a2 = sub_22E7A6BD4;
  *(void *)(a2 + 8) = a1;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = sub_22E7A64F0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = sub_22E7A6524;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(unsigned char *)(a2 + 80) = 1;
  *(void *)(a2 + 88) = MEMORY[0x263F8EE78];
  sub_22E7A6E58();
  sub_22E7A6E60((uint64_t)sub_22E7A64F0);
  sub_22E7A6E60((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRetain();
  sub_22E7A6E70((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_22E7A6ECC();
  sub_22E7A6ED4((uint64_t)sub_22E7A64F0);
  sub_22E7A6ED4((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7CA670()
{
  v0[2] = sub_22E7F3F80();
  v0[3] = sub_22E7F3F70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7B7A94;
  return MEMORY[0x270F58B00]();
}

uint64_t sub_22E7CA720@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7CA410(*v1, a1);
}

uint64_t sub_22E7CA728()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7A6D00;
  return sub_22E7CA670();
}

id sub_22E7CA7BC()
{
  uint64_t v1 = *(void **)(v0 + 24);
  if (v1)
  {
    id v2 = *(id *)(v0 + 24);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
    objc_msgSend(v3, sel_setSuspended_, 1);
    id v4 = sub_22E7CA85C();
    objc_msgSend(v3, sel_setUnderlyingQueue_, v4);

    uint64_t v5 = *(void **)(v0 + 24);
    *(void *)(v0 + 24) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v6 = v1;
  return v2;
}

id sub_22E7CA85C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    id v2 = *(id *)(v0 + 32);
  }
  else
  {
    id v3 = (void *)sub_22E7CA8B8();
    id v4 = *(void **)(v0 + 32);
    *(void *)(v0 + 32) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

uint64_t sub_22E7CA8B8()
{
  uint64_t v9 = sub_22E7F4040();
  uint64_t v0 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v2 = (char *)v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_22E7F4020();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = sub_22E7F3DF0();
  MEMORY[0x270FA5388](v4 - 8);
  sub_22E7C4E80(0, (unint64_t *)&qword_268611970);
  uint64_t v5 = sub_22E7F42D0();
  v8[0] = v6;
  v8[1] = v5;
  sub_22E7F4050();
  sub_22E7F3DE0();
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_22E7CCAA0(&qword_2686113F0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686113F8);
  sub_22E7CCAE8(&qword_268611400, &qword_2686113F8);
  sub_22E7F40F0();
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, *MEMORY[0x263F8F130], v9);
  return sub_22E7F4070();
}

uint64_t sub_22E7CAB34()
{
  if (*(void *)(v0 + 40))
  {
    uint64_t v1 = *(void *)(v0 + 40);
  }
  else
  {
    type metadata accessor for PASUIExtensionHostProxy.InfoProvider();
    uint64_t v1 = swift_allocObject();
    *(void *)(v0 + 40) = v1;
    swift_retain();
  }
  swift_unknownObjectRetain();
  return v1;
}

uint64_t PASUIExtensionHostProxy.deinit()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v2, sel_setInterruptionHandler_, 0);
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    objc_msgSend(v2, sel_invalidate);

    uint64_t v1 = *(void **)(v0 + 16);
  }

  swift_unknownObjectRelease();
  return v0;
}

uint64_t PASUIExtensionHostProxy.__deallocating_deinit()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v2, sel_setInterruptionHandler_, 0);
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    objc_msgSend(v2, sel_invalidate);

    uint64_t v1 = *(void **)(v0 + 16);
  }

  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

void sub_22E7CACB0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v26 - v9;
  if (objc_msgSend(self, sel_isMainThread))
  {
    uint64_t v11 = sub_22E7F3560();
    long long v27 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v27(v10, v11, v4);
    uint64_t v12 = sub_22E7F3570();
    os_log_type_t v13 = sub_22E7F3FD0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      long long v26 = a1;
      uint64_t v15 = v11;
      uint64_t v16 = v8;
      id v17 = v14;
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_22E7A0000, v12, v13, "PASUIExtensionHostProxy connectToHost extension is accepting new connection from the host", v14, 2u);
      id v18 = v17;
      uint64_t v8 = v16;
      uint64_t v11 = v15;
      a1 = v26;
      MEMORY[0x230FA4830](v18, -1, -1);
    }

    uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19(v10, v4);
    sub_22E7CB6DC();
    sub_22E7CAF70(a1);
    uint64_t v20 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = a1;
    id v21 = a1;

    objc_msgSend(v21, sel_activate);
    v27(v8, v11, v4);
    uint64_t v22 = sub_22E7F3570();
    os_log_type_t v23 = sub_22E7F3FD0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_22E7A0000, v22, v23, "PASUIExtensionHostProxy connectToHost resuming queue for sending messages back to extension host", v24, 2u);
      MEMORY[0x230FA4830](v24, -1, -1);
    }

    v19(v8, v4);
    id v25 = sub_22E7CA7BC();
    objc_msgSend(v25, sel_setSuspended_, 0);
  }
  else
  {
    __break(1u);
  }
}

void sub_22E7CAF70(void *a1)
{
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_interfaceWithProtocol_, &unk_26E247A60);
  objc_msgSend(a1, sel_setExportedInterface_, v3);

  objc_msgSend(a1, sel_setExportedObject_, sub_22E7CAB34());
  swift_unknownObjectRelease();
  id v4 = objc_msgSend(v2, sel_interfaceWithProtocol_, &unk_26E249780);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v4);

  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  _OWORD v9[4] = sub_22E7CCA4C;
  void v9[5] = v7;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  long long v9[2] = sub_22E7CC0A8;
  void v9[3] = &block_descriptor_34;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v8);
  _Block_release(v8);
}

uint64_t sub_22E7CB138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_22E7F3DD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_22E7F3DF0();
  uint64_t v7 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2 + 16;
  sub_22E7C4E80(0, (unint64_t *)&qword_268611970);
  uint64_t v11 = (void *)sub_22E7F4050();
  uint64_t v12 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  uint64_t v13 = swift_allocObject();
  swift_beginAccess();
  uint64_t v14 = (void *)MEMORY[0x230FA4900](v10);
  swift_unknownObjectWeakInit();

  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  *(void *)(v15 + 24) = v13;
  aBlock[4] = sub_22E7CCA98;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22E7CC0A8;
  aBlock[3] = &block_descriptor_42_0;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  sub_22E7F3DE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22E7CCAA0((unint64_t *)&qword_2686112A8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611980);
  sub_22E7CCAE8((unint64_t *)&qword_2686112B0, (uint64_t *)&unk_268611980);
  sub_22E7F40F0();
  MEMORY[0x230FA3E60](0, v9, v6, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v19);
}

void sub_22E7CB4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_22E7F3580();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    swift_beginAccess();
    uint64_t v9 = MEMORY[0x230FA4900](a2 + 16);
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = *(void **)(v8 + 16);
      if (v11)
      {
        sub_22E7C4E80(0, &qword_2686112B8);
        id v12 = v10;
        id v13 = v11;
        char v14 = sub_22E7F40B0();

        if (v14)
        {
          uint64_t v15 = sub_22E7F3560();
          (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
          uint64_t v16 = sub_22E7F3570();
          os_log_type_t v17 = sub_22E7F3FF0();
          if (os_log_type_enabled(v16, v17))
          {
            uint64_t v18 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v18 = 0;
            _os_log_impl(&dword_22E7A0000, v16, v17, "PASUIExtensionHostProxy configure.interruptionHandler connection from extension to host interrupted. Invalidating it.", v18, 2u);
            MEMORY[0x230FA4830](v18, -1, -1);
          }

          (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
          sub_22E7CB6DC();
        }
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    else
    {
      swift_release();
    }
  }
}

void sub_22E7CB6DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v25 - v7;
  if (objc_msgSend(self, sel_isMainThread))
  {
    uint64_t v9 = *(void **)(v1 + 16);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = sub_22E7F3560();
      long long v26 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      v26(v8, v11, v2);
      id v12 = sub_22E7F3570();
      os_log_type_t v13 = sub_22E7F3FF0();
      if (os_log_type_enabled(v12, v13))
      {
        char v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = v1;
        uint64_t v15 = v11;
        id v16 = v10;
        os_log_type_t v17 = v14;
        *(_WORD *)char v14 = 0;
        _os_log_impl(&dword_22E7A0000, v12, v13, "PASUIExtensionHostProxy tearDownConnection extension received another host connection. Invalidating the first connection.", v14, 2u);
        uint64_t v18 = v17;
        id v10 = v16;
        uint64_t v11 = v15;
        uint64_t v1 = v25;
        MEMORY[0x230FA4830](v18, -1, -1);
      }

      uint64_t v19 = *(void (**)(char *, uint64_t))(v3 + 8);
      v19(v8, v2);
      uint64_t v20 = *(void **)(v1 + 16);
      *(void *)(v1 + 16) = 0;

      objc_msgSend(v10, sel_setInterruptionHandler_, 0);
      objc_msgSend(v10, sel_setInvalidationHandler_, 0);
      objc_msgSend(v10, sel_invalidate);
      v26(v6, v11, v2);
      id v21 = sub_22E7F3570();
      os_log_type_t v22 = sub_22E7F3FD0();
      if (os_log_type_enabled(v21, v22))
      {
        os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v23 = 0;
        _os_log_impl(&dword_22E7A0000, v21, v22, "PASUIExtensionHostProxy tearDownConnection suspending queue for sending messages back to extension host", v23, 2u);
        MEMORY[0x230FA4830](v23, -1, -1);
      }

      v19(v6, v2);
      id v24 = sub_22E7CA7BC();
      objc_msgSend(v24, sel_setSuspended_, 1);
    }
  }
  else
  {
    __break(1u);
  }
}

void PASUIExtensionHostProxy.didPick(account:context:)(void *a1, void *a2)
{
  id v4 = sub_22E7CA7BC();
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = (void *)swift_allocObject();
  void v6[2] = v5;
  v6[3] = a1;
  v6[4] = a2;
  v10[4] = sub_22E7CBE9C;
  uint64_t v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  id v10[2] = sub_22E7CC0A8;
  v10[3] = &block_descriptor_4;
  uint64_t v7 = _Block_copy(v10);
  id v8 = a1;
  id v9 = a2;
  swift_release();
  objc_msgSend(v4, sel_addOperationWithBlock_, v7);
  _Block_release(v7);
}

uint64_t sub_22E7CBAD8()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22E7CBB10(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v9 = *(void **)(Strong + 16);
    if (v9)
    {
      id v25 = v9;
      uint64_t v10 = sub_22E7F3560();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
      uint64_t v11 = a2;
      id v12 = sub_22E7F3570();
      int v13 = sub_22E7F3FD0();
      if (os_log_type_enabled(v12, (os_log_type_t)v13))
      {
        int v23 = v13;
        uint64_t v14 = swift_slowAlloc();
        id v24 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 141558274;
        uint64_t v27 = 1752392040;
        sub_22E7F40C0();
        *(_WORD *)(v14 + 12) = 2112;
        uint64_t v15 = (uint64_t *)((char *)v11 + *MEMORY[0x263F624D0]);
        uint64_t v16 = v15[1];
        if (v16)
        {
          uint64_t v21 = *v15;
          uint64_t v22 = v14 + 14;
          sub_22E7BE0C8();
          swift_allocError();
          *os_log_type_t v17 = v21;
          v17[1] = v16;
          swift_bridgeObjectRetain();
          uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v27 = v16;
        }
        else
        {
          uint64_t v27 = 0;
        }
        sub_22E7F40C0();
        uint64_t v18 = v24;
        *id v24 = v16;

        _os_log_impl(&dword_22E7A0000, v12, (os_log_type_t)v23, "PASUIExtensionHostProxy didPick informing host about picked account %{mask.hash}@", (uint8_t *)v14, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
        swift_arrayDestroy();
        MEMORY[0x230FA4830](v18, -1, -1);
        MEMORY[0x230FA4830](v14, -1, -1);
      }
      else
      {

        id v12 = v11;
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v19 = v25;
      sub_22E7CBEB4((uint64_t)v11, v26, (uint64_t (*)())sub_22E7CBEA8, 0);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_22E7CBE54()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_22E7CBE9C()
{
  sub_22E7CBB10(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_22E7CBEA8(void *a1)
{
  return sub_22E7CC3F0(a1, "PASUIExtensionHostProxy didPick failed to inform host of picked account: %{public}@");
}

uint64_t sub_22E7CBEB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  uint64_t v20 = sub_22E7CCBB4;
  uint64_t v21 = v10;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_22E7C7ED8;
  uint64_t v19 = &block_descriptor_58;
  uint64_t v11 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  id v12 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v11);
  _Block_release(v11);
  sub_22E7F40E0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611408);
  swift_dynamicCast();
  swift_release();
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_22E7DEF3C;
  uint64_t v19 = &block_descriptor_61;
  int v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_extensionDidFinishWith_context_completion_, a1, a2, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_22E7CC0A8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

Swift::Void __swiftcall PASUIExtensionHostProxy.promptForFlowCancel()()
{
  id v0 = sub_22E7CA7BC();
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  v3[4] = sub_22E7CC3B8;
  v3[5] = v1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1107296256;
  v3[2] = sub_22E7CC0A8;
  v3[3] = &block_descriptor_7_0;
  uint64_t v2 = _Block_copy(v3);
  swift_release();
  objc_msgSend(v0, sel_addOperationWithBlock_, v2);
  _Block_release(v2);
}

void sub_22E7CC1E8()
{
  uint64_t v0 = sub_22E7F3580();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = *(void **)(Strong + 16);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = sub_22E7F3560();
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v7, v0);
      id v8 = sub_22E7F3570();
      os_log_type_t v9 = sub_22E7F3FD0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_22E7A0000, v8, v9, "PASUIExtensionHostProxy promptForFlowCancel", v10, 2u);
        MEMORY[0x230FA4830](v10, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      sub_22E7CC63C((uint64_t (*)(uint64_t))sub_22E7CC3E4, 0);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

void sub_22E7CC3B8()
{
}

uint64_t type metadata accessor for PASUIExtensionHostProxy()
{
  return self;
}

uint64_t sub_22E7CC3E4(void *a1)
{
  return sub_22E7CC3F0(a1, "PASUIExtensionHostProxy promptForFlowCancel failed: %{public}@");
}

uint64_t sub_22E7CC3F0(void *a1, const char *a2)
{
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v9 = a1;
    uint64_t v10 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
    id v11 = a1;
    id v12 = a1;
    int v13 = sub_22E7F3570();
    os_log_type_t v14 = sub_22E7F3FF0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v21 = a2;
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 138543362;
      id v16 = a1;
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v22 = v17;
      sub_22E7F40C0();
      uint64_t v18 = v20;
      void *v20 = v17;

      _os_log_impl(&dword_22E7A0000, v13, v14, v21, v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v18, -1, -1);
      MEMORY[0x230FA4830](v15, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_22E7CC63C(uint64_t (*a1)(uint64_t a1), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  id v16 = sub_22E7CCB70;
  uint64_t v17 = v6;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  os_log_type_t v14 = sub_22E7C7ED8;
  uint64_t v15 = &block_descriptor_48_0;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  id v8 = objc_msgSend(v3, sel_remoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_22E7F40E0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611408);
  swift_dynamicCast();
  swift_release();
  id v16 = a1;
  uint64_t v17 = a2;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v13 = 1107296256;
  os_log_type_t v14 = sub_22E7DEF3C;
  uint64_t v15 = &block_descriptor_51;
  id v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_promptForFlowCancelWithCompletion_, v9);
  _Block_release(v9);
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for PASUIExtensionHostProxy.InfoProvider()
{
  return self;
}

uint64_t sub_22E7CC8A0(uint64_t a1)
{
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F3FD0();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIExtensionHostProxy hello received hello from host", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t, void))(a1 + 16))(a1, 0);
}

uint64_t sub_22E7CCA10()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7CCA4C()
{
  return sub_22E7CB138(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t objectdestroy_30Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22E7CCA98()
{
  sub_22E7CB4A4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22E7CCAA0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22E7CCAE8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22E7CCB38()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7CCB70(uint64_t a1)
{
  return sub_22E7C8E48(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t PASFlowStepSendSignInResults.buildView()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611410);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - v5;
  sub_22E7CCDBC();
  swift_retain();
  uint64_t v7 = sub_22E7F37A0();
  unint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610EF0);
  swift_allocObject();
  uint64_t v10 = sub_22E7F3050();
  uint64_t v15 = (ValueMetadata *)v7;
  unint64_t v16 = v9;
  uint64_t v17 = v10;
  unint64_t v11 = sub_22E7CCE14();
  sub_22E7F3C00();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  uint64_t v15 = &type metadata for PASUISendSignInResultsView;
  unint64_t v16 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

unint64_t sub_22E7CCDBC()
{
  unint64_t result = qword_268611418;
  if (!qword_268611418)
  {
    sub_22E7F34A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611418);
  }
  return result;
}

unint64_t sub_22E7CCE14()
{
  unint64_t result = qword_268611420;
  if (!qword_268611420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611420);
  }
  return result;
}

uint64_t sub_22E7CCE68()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611410);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - v5;
  sub_22E7CCDBC();
  swift_retain();
  uint64_t v7 = sub_22E7F37A0();
  unint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610EF0);
  swift_allocObject();
  uint64_t v10 = sub_22E7F3050();
  uint64_t v15 = (ValueMetadata *)v7;
  unint64_t v16 = v9;
  uint64_t v17 = v10;
  unint64_t v11 = sub_22E7CCE14();
  sub_22E7F3C00();
  swift_release();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  uint64_t v15 = &type metadata for PASUISendSignInResultsView;
  unint64_t v16 = v11;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

ValueMetadata *type metadata accessor for PASUISendSignInResultsView()
{
  return &type metadata for PASUISendSignInResultsView;
}

uint64_t sub_22E7CD05C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22E7CD078(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8 = (void *)swift_allocObject();
  void v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  unint64_t v9 = (void *)(a2 + *MEMORY[0x263F62518]);
  uint64_t v10 = v9[3];
  uint64_t v11 = v9[4];
  __swift_project_boxed_opaque_existential_1(v9, v10);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 80);
  swift_retain();
  swift_retain();
  uint64_t v13 = v12(v10, v11);
  if (v14 >> 60 == 15)
  {
    id v15 = 0;
  }
  else
  {
    uint64_t v16 = v13;
    unint64_t v17 = v14;
    id v18 = objc_allocWithZone(MEMORY[0x263F827E8]);
    uint64_t v19 = (void *)sub_22E7F2F70();
    id v15 = objc_msgSend(v18, sel_initWithData_, v19);
    sub_22E7C4B2C(v16, v17);
  }
  *(void *)a4 = sub_22E7CD2C4;
  *(void *)(a4 + 8) = v8;
  *(void *)(a4 + 16) = sub_22E7BFCA4;
  *(void *)(a4 + 24) = 0;
  *(unsigned char *)(a4 + 32) = 1;
  *(void *)(a4 + 40) = v15;
  *(void *)(a4 + 48) = 0;
  uint64_t v20 = MEMORY[0x263F8EE78];
  *(void *)(a4 + 56) = 0;
  *(void *)(a4 + 64) = v20;
}

uint64_t sub_22E7CD1D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = (void *)(a6 + *MEMORY[0x263F62518]);
  uint64_t v7 = v6[3];
  uint64_t v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v7, v8);
  uint64_t v9 = sub_22E7F3EC0();
  swift_bridgeObjectRelease();
  return v9;
}

void sub_22E7CD278(uint64_t a1@<X8>)
{
  sub_22E7CD078(*v1, v1[1], v1[2], a1);
}

uint64_t sub_22E7CD284()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7CD2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22E7CD1D8(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_22E7CD2D4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_22E7F3FB0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7C079C(a3, (uint64_t)v20);
  uint64_t v12 = swift_allocObject();
  long long v13 = v20[1];
  *(_OWORD *)(v12 + 16) = v20[0];
  *(_OWORD *)(v12 + 32) = v13;
  *(_OWORD *)(v12 + 48) = v20[2];
  *(void *)(v12 + 64) = v21;
  *(void *)(v12 + 72) = a1;
  id v14 = a1;
  sub_22E7F3F90();
  id v15 = (char *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686114F0) + 36));
  uint64_t v16 = sub_22E7F3760();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(&v15[*(int *)(v16 + 20)], v11, v8);
  *(void *)id v15 = &unk_2686114E8;
  *((void *)v15 + 1) = v12;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686114D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(a4, a2, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_22E7CD490(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_22E7F3F80();
  v2[4] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v2[5] = v4;
  v2[6] = v3;
  return MEMORY[0x270FA2498](sub_22E7CD528, v4, v3);
}

uint64_t sub_22E7CD528()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v1[5];
  uint64_t v4 = *__swift_project_boxed_opaque_existential_1(v1, v1[3]);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F292A8]), sel_init);
  v0[7] = v5;
  objc_msgSend(v5, sel_setPresentingViewController_, v2);
  objc_msgSend(v5, sel_setDelegate_, v4);
  uint64_t v8 = (uint64_t (*)(id))((char *)v3 + *v3);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[8] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_22E7CD65C;
  return v8(v5);
}

uint64_t sub_22E7CD65C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 56);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](sub_22E7C061C, v4, v3);
}

uint64_t sub_22E7CD79C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686114D0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  sub_22E7C079C(v2, (uint64_t)v15);
  unint64_t v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v9 + v8, (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  unint64_t v10 = v9 + ((v7 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v11 = v15[1];
  *(_OWORD *)unint64_t v10 = v15[0];
  *(_OWORD *)(v10 + 16) = v11;
  *(_OWORD *)(v10 + 32) = v15[2];
  *(void *)(v10 + 48) = v16;
  v14[0] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  sub_22E7BA6A0();
  uint64_t result = sub_22E7F3D00();
  uint64_t v13 = v14[2];
  *a2 = v14[1];
  a2[1] = v13;
  a2[2] = sub_22E7CF040;
  a2[3] = v9;
  return result;
}

uint64_t type metadata accessor for PASUIAppleIDAuthContextProvider()
{
  return self;
}

uint64_t sub_22E7CDDB8(int a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  uint64_t v5 = (uint64_t (__cdecl *)())((char *)&dword_2686114C8 + dword_2686114C8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_22E7CDE64;
  return v5();
}

uint64_t sub_22E7CDE64(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();
  if (v4)
  {
    uint64_t v6 = *(void (***)(void, void))(v3 + 16);
    ((void (**)(void, void *))v6)[2](v6, a1);

    _Block_release(v6);
  }
  else
  {
  }
  uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
  return v7();
}

uint64_t sub_22E7CDFA8()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7CDFF0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_22E7A7F00;
  uint64_t v5 = (uint64_t (*)(int, void *))((char *)&dword_2686114A8 + dword_2686114A8);
  return v5(v2, v3);
}

uint64_t sub_22E7CE0AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIAppleIDAuthContextProvider contextDidPresentLoginAlertController", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  uint64_t result = MEMORY[0x230FA4900](v10);
  if (result)
  {
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7CE24C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIAppleIDAuthContextProvider contextWillDismissLoginAlertController", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  uint64_t result = MEMORY[0x230FA4900](v10);
  if (result)
  {
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7CE3EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIAppleIDAuthContextProvider contextDidDismissLoginAlertController", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  uint64_t result = MEMORY[0x230FA4900](v10);
  if (result)
  {
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 24))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7CE58C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIAppleIDAuthContextProvider contextWillBeginPresentingSecondaryUI", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  uint64_t result = MEMORY[0x230FA4900](v10);
  if (result)
  {
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 32))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7CE72C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIAppleIDAuthContextProvider contextDidEndPresentingSecondaryUI", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  uint64_t result = MEMORY[0x230FA4900](v10);
  if (result)
  {
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 40))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7CE8CC()
{
  uint64_t v0 = sub_22E7F3580();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F4010();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUIAppleIDAuthContextProvider remoteUIStyle", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t sub_22E7CEA20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUIAppleIDAuthContextProvider willPresentModalNavigationController", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI31PASUIAppleIDAuthContextProvider_delegate;
  uint64_t result = MEMORY[0x230FA4900](v10);
  if (result)
  {
    uint64_t v12 = *(void *)(v10 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v12 + 48))(ObjectType, v12);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22E7CEBC0()
{
  uint64_t v1 = sub_22E7F3580();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22E7CEC7C, 0, 0);
}

uint64_t sub_22E7CEC7C()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F4010();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUIAppleIDAuthContextProvider signAdditionalHeaders", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }
  uint64_t v9 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v10 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  long long v11 = (uint64_t (*)(void))v0[1];
  return v11(0);
}

uint64_t destroy for AppleIDAuthContextViewModifier(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t initializeWithCopy for AppleIDAuthContextViewModifier(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for AppleIDAuthContextViewModifier(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AppleIDAuthContextViewModifier(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleIDAuthContextViewModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleIDAuthContextViewModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleIDAuthContextViewModifier()
{
  return &type metadata for AppleIDAuthContextViewModifier;
}

uint64_t sub_22E7CEF70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7CEF8C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686114D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + v6);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6 + 56, v5);
}

uint64_t sub_22E7CF040@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2686114D0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_22E7CD2D4(a1, v2 + v6, v7, a2);
}

uint64_t sub_22E7CF0F0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_22E7CF138()
{
  uint64_t v2 = v0 + 16;
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_22E7A6D00;
  return sub_22E7CD490(v2, v3);
}

unint64_t sub_22E7CF1D8()
{
  unint64_t result = qword_2686114F8;
  if (!qword_2686114F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268611500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686114F8);
  }
  return result;
}

uint64_t sub_22E7CF234(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000022E7F8CC0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xED00006576697463;
      unint64_t v5 = 0x4179646165726C61;
      break;
    case 2:
      unint64_t v3 = 0xE900000000000065;
      unint64_t v5 = 0x7669746341746F6ELL;
      break;
    case 3:
      unint64_t v3 = 0xED000064656C6C65;
      unint64_t v5 = 0x636E614372657375;
      break;
    default:
      break;
  }
  unint64_t v6 = 0x800000022E7F8CC0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xED00006576697463;
      if (v5 == 0x4179646165726C61) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE900000000000065;
      unint64_t v2 = 0x7669746341746F6ELL;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xED000064656C6C65;
      if (v5 == 0x636E614372657375) {
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
        char v7 = sub_22E7F4210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22E7CF3F4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000016;
  unint64_t v3 = 0x800000022E7F8D00;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000016;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE900000000000065;
      unint64_t v5 = 0x7669746341746F6ELL;
      break;
    case 2:
      break;
    case 3:
      unint64_t v3 = 0xED000064656C6C65;
      unint64_t v5 = 0x636E614372657375;
      break;
    default:
      unint64_t v3 = 0xED00006576697463;
      unint64_t v5 = 0x4179646165726C61;
      break;
  }
  unint64_t v6 = 0x800000022E7F8D00;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE900000000000065;
      unint64_t v2 = 0x7669746341746F6ELL;
      goto LABEL_9;
    case 2:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xED000064656C6C65;
      if (v5 == 0x636E614372657375) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xED00006576697463;
      if (v5 != 0x4179646165726C61) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_22E7F4210();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22E7CF5B4(char a1, char a2)
{
  if (a1) {
    unint64_t v2 = 0x800000022E7F8D50;
  }
  else {
    unint64_t v2 = 0x800000022E7F8D20;
  }
  if (a2) {
    unint64_t v3 = 0x800000022E7F8D50;
  }
  else {
    unint64_t v3 = 0x800000022E7F8D20;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_22E7F4210();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_22E7CF654()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7CF750()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7CF84C()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7CF8CC()
{
  sub_22E7F3EE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7CF9B4()
{
  sub_22E7F3EE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7CFA9C()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7CFB18()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7CFC10()
{
  return sub_22E7F42C0();
}

unint64_t PASUISourceViewPresenterError.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7669746341746F6ELL;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x636E614372657375;
      break;
    default:
      unint64_t result = 0x4179646165726C61;
      break;
  }
  return result;
}

uint64_t sub_22E7CFDC0(unsigned __int8 *a1, char *a2)
{
  return sub_22E7CF3F4(*a1, *a2);
}

uint64_t sub_22E7CFDCC()
{
  return sub_22E7CF750();
}

uint64_t sub_22E7CFDD4()
{
  return sub_22E7CF9B4();
}

uint64_t sub_22E7CFDDC()
{
  return sub_22E7CFB18();
}

uint64_t sub_22E7CFDE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s23ProximityAppleIDSetupUI29PASUISourceViewPresenterErrorO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_22E7CFE14@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PASUISourceViewPresenterError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22E7CFE40(uint64_t a1)
{
  unint64_t v2 = sub_22E7D9638();
  return MEMORY[0x270F58B48](a1, v2);
}

uint64_t sub_22E7CFE7C()
{
  return *v0 + 1200;
}

uint64_t sub_22E7CFE88(uint64_t a1)
{
  unint64_t v2 = sub_22E7D9638();
  return MEMORY[0x270F58B50](a1, v2);
}

uint64_t sub_22E7CFEC4()
{
  return sub_22E7F41F0();
}

uint64_t sub_22E7CFF08(uint64_t a1)
{
  unint64_t v2 = sub_22E7D9638();
  unint64_t v3 = sub_22E7D968C();
  return MEMORY[0x270F58B58](a1, v2, v3);
}

uint64_t sub_22E7CFF58(uint64_t a1)
{
  unint64_t v2 = sub_22E7D8F38();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_22E7CFF94(uint64_t a1)
{
  unint64_t v2 = sub_22E7D8F38();
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t PASUISourceViewPresenter.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  return MEMORY[0x230FA4900](v1);
}

uint64_t PASUISourceViewPresenter.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*PASUISourceViewPresenter.delegate.modify(void *a1))(void **a1, char a2)
{
  unint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x230FA4900](v5);
  return sub_22E7AAF9C;
}

uint64_t sub_22E7D01AC()
{
  uint64_t v1 = OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics;
  if (*(void *)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics);
  }
  else
  {
    uint64_t v2 = sub_22E7D0214(v0);
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_22E7D0214(uint64_t a1)
{
  void (*v6)(uint64_t *__return_ptr, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t, unint64_t);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  uint64_t v2 = sub_22E7F2FD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = *(void (**)(uint64_t *__return_ptr, uint64_t))(**(void **)(a1
                                                                           + OBJC_IVAR___PASUIGuardianViewPresenter__analyticsProvider)
                                                             + 128);
  char v7 = swift_retain();
  v6(&v20, v7);
  swift_release();
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  __swift_project_boxed_opaque_existential_1(&v20, v22);
  uint64_t v10 = (*(uint64_t (**)(ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t))(v9 + 8))(&type metadata for PASUISourceViewPresenter.AnalyticsEvent, &off_26E233108, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  sub_22E7F2FC0();
  long long v11 = sub_22E7F2FB0();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = MEMORY[0x263F8D310];
  id v15 = MEMORY[0x263F62548];
  uint64_t v22 = MEMORY[0x263F8D310];
  int v23 = MEMORY[0x263F62548];
  uint64_t v20 = v11;
  uint64_t v21 = v13;
  uint64_t v16 = *(void (**)(uint64_t *, uint64_t, unint64_t))(*(void *)v10 + 192);
  v16(&v20, 0x6973736553534150, 0xED000079654B6E6FLL);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  uint64_t v22 = v14;
  int v23 = v15;
  uint64_t v20 = 0x656372756F73;
  uint64_t v21 = 0xE600000000000000;
  v16(&v20, 0xD000000000000014, 0x800000022E7F9C40);
  uint64_t v17 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  (*(void (**)(uint64_t))(*(void *)v10 + 272))(v17);
  return v10;
}

id PASUISourceViewPresenter.__allocating_init(sharingViewController:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_22E7D8278(a1);

  return v4;
}

id PASUISourceViewPresenter.init(sharingViewController:)(void *a1)
{
  id v2 = sub_22E7D8278(a1);

  return v2;
}

id PASUISourceViewPresenter.__allocating_init(parentViewController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_22E7D86CC(a1, a2, a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v8;
}

id PASUISourceViewPresenter.init(parentViewController:flowController:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = sub_22E7D86CC(a1, a2, a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v3;
}

id PASUISourceViewPresenter.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v21 - v7;
  uint64_t v9 = sub_22E7F3560();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  long long v11 = sub_22E7F3570();
  os_log_type_t v12 = sub_22E7F4010();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = v1;
    uint64_t v14 = v13;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22E7A0000, v11, v12, "PASUISourceViewPresenter deinit", v13, 2u);
    id v15 = v14;
    uint64_t v1 = v21;
    MEMORY[0x230FA4830](v15, -1, -1);
  }

  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v8, v2);
  sub_22E7F3090();
  swift_retain();
  sub_22E7F3060();
  swift_release();
  v10(v6, v9, v2);
  uint64_t v17 = sub_22E7F3570();
  os_log_type_t v18 = sub_22E7F4010();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_22E7A0000, v17, v18, "PAS=== Goodbye ===PAS", v19, 2u);
    MEMORY[0x230FA4830](v19, -1, -1);
  }

  v16(v6, v2);
  v23.receiver = v1;
  v23.super_class = ObjectType;
  return objc_msgSendSuper2(&v23, sel_dealloc);
}

uint64_t PASUISourceViewPresenter.activate(withTemplate:)(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_22E7F3580();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_22E7F3F80();
  v2[19] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[20] = v5;
  v2[21] = v4;
  return MEMORY[0x270FA2498](sub_22E7D0A38, v5, v4);
}

uint64_t sub_22E7D0A38()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = *(void (**)(uint64_t))(**(void **)(v0[15]
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider)
                                      + 128);
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  uint64_t v6 = sub_22E7C4E80(0, &qword_268610950);
  uint64_t v7 = MEMORY[0x263F62558];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  long long v11 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v5 + 24) + **(int **)(v5 + 24));
  id v8 = v1;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22E7D0BCC;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_22E7D0BCC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7D0F14;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7D0CE8;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_22E7D0CE8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7D0D80;
  return sub_22E7D11AC();
}

uint64_t sub_22E7D0D80(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 200) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 168);
  uint64_t v4 = *(void *)(v2 + 160);
  return MEMORY[0x270FA2498](sub_22E7D0EA8, v4, v3);
}

uint64_t sub_22E7D0EA8()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 200);
  return v1(v2);
}

uint64_t sub_22E7D0F14()
{
  uint64_t v26 = v0;
  uint64_t v1 = (void *)v0[23];
  uint64_t v3 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v4 = v0[16];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v5 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  id v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F3FF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[23];
    uint64_t v11 = v0[17];
    uint64_t v23 = v0[16];
    uint64_t v24 = v0[18];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v25 = v13;
    v0[12] = v10;
    id v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v15 = sub_22E7F3EA0();
    v0[13] = sub_22E7B3114(v15, v16, &v25);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v8, v9, "Failed to activate PASUISourceViewPresenter with message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v13, -1, -1);
    MEMORY[0x230FA4830](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    uint64_t v17 = (void *)v0[23];
    uint64_t v19 = v0[17];
    uint64_t v18 = v0[18];
    uint64_t v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  uint64_t v21 = (void *)swift_task_alloc();
  v0[24] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_22E7D0D80;
  return sub_22E7D11AC();
}

uint64_t sub_22E7D11AC()
{
  v1[10] = v0;
  uint64_t v2 = sub_22E7F3580();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  sub_22E7F3F80();
  v1[15] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v1[16] = v4;
  v1[17] = v3;
  return MEMORY[0x270FA2498](sub_22E7D12B0, v4, v3);
}

uint64_t sub_22E7D12B0()
{
  uint64_t v1 = sub_22E7D01AC();
  *(void *)(v0 + 144) = v1;
  *(unsigned char *)(v0 + 200) = 0;
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 232) + **(int **)(*(void *)v1 + 232));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22E7D13C8;
  return v4(v0 + 200);
}

uint64_t sub_22E7D13C8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return MEMORY[0x270FA2498](sub_22E7D150C, v3, v2);
}

uint64_t sub_22E7D150C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = sub_22E7D01AC();
  *(unsigned char *)(v0 + 201) = 1;
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v2 + 264))();
  swift_release();
  *(void *)(v1 + OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer) = v3;
  swift_release();
  uint64_t v4 = v1 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x230FA4900](v4);
  swift_unknownObjectRelease();
  if (!v5)
  {
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v7 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v9 = sub_22E7F3560();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
    uint64_t v10 = sub_22E7F3570();
    os_log_type_t v11 = sub_22E7F4000();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_22E7A0000, v10, v11, "PASUISourceViewPresenter delegate is nil in activate", v12, 2u);
      MEMORY[0x230FA4830](v12, -1, -1);
    }
    uint64_t v13 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 96);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  uint64_t v16 = *(void *)(v0 + 80);
  uint64_t v17 = v16 + OBJC_IVAR___PASUIGuardianViewPresenter_flowController;
  *(void *)(v0 + 160) = *(void *)(v16 + OBJC_IVAR___PASUIGuardianViewPresenter_flowController);
  uint64_t v18 = *(void *)(v17 + 8);
  *(void *)(v0 + 168) = v18;
  uint64_t ObjectType = swift_getObjectType();
  *(void *)(v0 + 176) = ObjectType;
  uint64_t v20 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v18 + 24);
  uint64_t v21 = swift_unknownObjectRetain();
  v20(v21, &protocol witness table for PASUISourceViewPresenter, ObjectType, v18);
  id v22 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v16
                                                              + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController), sel_viewController));
  *(void *)(v0 + 184) = v22;
  uint64_t v23 = *(void (**)(uint64_t))(**(void **)(v16
                                                     + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                       + 128);
  uint64_t v24 = swift_retain();
  v23(v24);
  swift_release();
  uint64_t v25 = *(void *)(v0 + 40);
  uint64_t v26 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v25);
  (*(void (**)(id, uint64_t, uint64_t))(v26 + 24))(v22, v25, v26);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v29 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v18 + 40) + **(int **)(v18 + 40));
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_22E7D1874;
  return v29(ObjectType, v18);
}

uint64_t sub_22E7D1874()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return MEMORY[0x270FA2498](sub_22E7D1994, v3, v2);
}

uint64_t sub_22E7D1994()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v4 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v5 = v0[11];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 64))(v1, v2);
  (*(void (**)(void))(v2 + 56))();
  swift_unknownObjectRelease();
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUISourceViewPresenter activated", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }
  uint64_t v10 = v0[13];
  uint64_t v11 = v0[11];
  uint64_t v12 = v0[12];

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v14 = v0[23];
  return v13(v14);
}

uint64_t sub_22E7D1CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22E7F3F80();
  v3[5] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7D1D3C, v5, v4);
}

uint64_t sub_22E7D1D3C()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_22E7AD004;
  uint64_t v7 = v0[2];
  return PASUISourceViewPresenter.activate(withTemplate:)(v7);
}

uint64_t sub_22E7D1E00()
{
  v1[5] = v0;
  uint64_t v2 = sub_22E7F3580();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  sub_22E7F3F80();
  v1[10] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v1[11] = v4;
  v1[12] = v3;
  return MEMORY[0x270FA2498](sub_22E7D1F04, v4, v3);
}

uint64_t sub_22E7D1F04()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v4 = sub_22E7F3560();
  id v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  uint64_t v6 = sub_22E7F3570();
  os_log_type_t v7 = sub_22E7F4010();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v8 = 0;
    _os_log_impl(&dword_22E7A0000, v6, v7, "PASUISourceViewPresenter flowDidReset", v8, 2u);
    MEMORY[0x230FA4830](v8, -1, -1);
  }
  uint64_t v9 = v0[9];
  uint64_t v10 = v0[6];
  uint64_t v11 = v0[7];
  uint64_t v12 = v0[5];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v13(v9, v10);
  uint64_t v14 = v12 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v15 = MEMORY[0x230FA4900](v14);
  swift_unknownObjectRelease();
  if (!v15)
  {
    v5(v0[8], v4, v0[6]);
    uint64_t v16 = sub_22E7F3570();
    os_log_type_t v17 = sub_22E7F4000();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_22E7A0000, v16, v17, "PASUISourceViewPresenter delegate is nil in flowDidReset", v18, 2u);
      MEMORY[0x230FA4830](v18, -1, -1);
    }
    uint64_t v19 = v0[8];
    uint64_t v20 = v0[6];

    v13(v19, v20);
  }
  uint64_t v21 = (void *)swift_task_alloc();
  v0[13] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_22E7D2150;
  return sub_22E7D2354();
}

uint64_t sub_22E7D2150()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_22E7D2270, v3, v2);
}

uint64_t sub_22E7D2270()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___PASUIGuardianViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v2 + 64))(ObjectType, v2);
  (*(void (**)(void))(v2 + 56))();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_22E7D2354()
{
  v1[7] = v0;
  uint64_t v2 = sub_22E7F3580();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v1[12] = sub_22E7F3F80();
  v1[13] = sub_22E7F3F70();
  uint64_t v4 = sub_22E7F3F50();
  v1[14] = v4;
  v1[15] = v3;
  return MEMORY[0x270FA2498](sub_22E7D245C, v4, v3);
}

uint64_t sub_22E7D245C()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_22E7F3560();
  v0[16] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[17] = v5;
  v0[18] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_22E7F3570();
  os_log_type_t v7 = sub_22E7F3FE0();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v8 = 0;
    _os_log_impl(&dword_22E7A0000, v6, v7, "PASUISourceViewPresenter dismissPresentedViewController if exists", v8, 2u);
    MEMORY[0x230FA4830](v8, -1, -1);
  }
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[9];
  uint64_t v12 = v0[7];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[19] = v13;
  v0[20] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v14 = *(void **)(v12 + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
  v0[21] = v14;
  id v15 = objc_msgSend(v14, sel_viewController);
  id v16 = objc_msgSend(v15, sel_presentedViewController);
  v0[22] = v16;

  if (v16)
  {
    v0[23] = sub_22E7F3F70();
    uint64_t v17 = swift_task_alloc();
    v0[24] = v17;
    *(void *)(v17 + 16) = v16;
    uint64_t v18 = (void *)swift_task_alloc();
    v0[25] = v18;
    void *v18 = v0;
    v18[1] = sub_22E7D278C;
    return MEMORY[0x270FA2318]();
  }
  else
  {
    swift_release();
    uint64_t v19 = (void *)v0[21];
    uint64_t v20 = *(void (**)(uint64_t))(**(void **)(v0[7]
                                                       + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                         + 128);
    uint64_t v21 = swift_retain();
    v20(v21);
    swift_release();
    uint64_t v22 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    id v23 = objc_msgSend(v19, sel_viewController);
    (*(void (**)(void))(v22 + 24))();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = (uint64_t (*)(void))v0[1];
    return v24();
  }
}

uint64_t sub_22E7D278C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 120);
  uint64_t v3 = *(void *)(v1 + 112);
  return MEMORY[0x270FA2498](sub_22E7D28EC, v3, v2);
}

uint64_t sub_22E7D28EC()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 64);
  swift_release();
  v1(v3, v2, v4);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F3FE0();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUISourceViewPresenter dismissed presentedViewController for card", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }
  os_log_type_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 64);

  v8(v9, v10);
  uint64_t v11 = *(void **)(v0 + 168);
  uint64_t v12 = *(void (**)(uint64_t))(**(void **)(*(void *)(v0 + 56)
                                                     + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                       + 128);
  uint64_t v13 = swift_retain();
  v12(v13);
  swift_release();
  uint64_t v14 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  id v15 = objc_msgSend(v11, sel_viewController);
  (*(void (**)(void))(v14 + 24))();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  id v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t _s23ProximityAppleIDSetupUI24PASUISourceViewPresenterC12handleCancelyyF_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_type_t v6 = &v34[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = &v34[-v7 - 8];
  uint64_t v9 = sub_22E7F3560();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  uint64_t v11 = sub_22E7F3570();
  os_log_type_t v12 = sub_22E7F4010();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = v2;
    uint64_t v14 = v9;
    id v15 = v10;
    uint64_t v16 = v1;
    uint64_t v17 = v6;
    uint64_t v18 = v13;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_22E7A0000, v11, v12, "PASUISourceViewPresenter flowDidCancel", v13, 2u);
    uint64_t v19 = v18;
    os_log_type_t v6 = v17;
    uint64_t v1 = v16;
    uint64_t v10 = v15;
    uint64_t v9 = v14;
    uint64_t v2 = v33;
    MEMORY[0x230FA4830](v19, -1, -1);
  }

  uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v8, v2);
  uint64_t v21 = v1 + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x230FA4900](v21);
  swift_unknownObjectRelease();
  if (!v22)
  {
    v10(v6, v9, v2);
    id v23 = sub_22E7F3570();
    os_log_type_t v24 = sub_22E7F4000();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_22E7A0000, v23, v24, "PASUISourceViewPresenter delegate is nil in flowDidCancel", v25, 2u);
      MEMORY[0x230FA4830](v25, -1, -1);
    }

    v20(v6, v2);
  }
  sub_22E7B47F4();
  uint64_t v26 = swift_allocError();
  *uint64_t v27 = 3;
  v35[0] = v26;
  char v36 = 1;
  uint64_t v28 = MEMORY[0x230FA4900](v21);
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    sub_22E7D8C1C((uint64_t)v35, (uint64_t)v34);
    id v30 = objc_allocWithZone((Class)sub_22E7F3330());
    uint64_t v31 = (void *)sub_22E7F3320();
    objc_msgSend(v29, sel_proximitySetupCompletedWithResult_, v31);
    swift_unknownObjectRelease();
  }
  return sub_22E7A7224((uint64_t)v35, &qword_268611550);
}

uint64_t PASUISourceViewPresenter.setTemplate(_:)(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_22E7F3580();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  sub_22E7F3F80();
  v2[19] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[20] = v5;
  v2[21] = v4;
  return MEMORY[0x270FA2498](sub_22E7D2EE0, v5, v4);
}

uint64_t sub_22E7D2EE0()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = *(void (**)(uint64_t))(**(void **)(v0[15]
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider)
                                      + 128);
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  uint64_t v6 = sub_22E7C4E80(0, &qword_268610950);
  uint64_t v7 = MEMORY[0x263F62558];
  v0[10] = v6;
  v0[11] = v7;
  v0[7] = v1;
  uint64_t v11 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v5 + 24) + **(int **)(v5 + 24));
  id v8 = v1;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[22] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_22E7D3074;
  return v11(v0 + 7, v4, v5);
}

uint64_t sub_22E7D3074()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7D3190;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = *(void *)(v2 + 168);
    uint64_t v5 = sub_22E7AF13C;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_22E7D3190()
{
  uint64_t v26 = v0;
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[17];
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v5 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
  id v6 = v1;
  id v7 = v1;
  id v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F3FF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[23];
    uint64_t v11 = v0[17];
    uint64_t v23 = v0[16];
    uint64_t v24 = v0[18];
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v25 = v13;
    v0[12] = v10;
    id v14 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v15 = sub_22E7F3EA0();
    v0[13] = sub_22E7B3114(v15, v16, &v25);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v8, v9, "Failed to set PASUISourceViewPresenter message session: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v13, -1, -1);
    MEMORY[0x230FA4830](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v24, v23);
  }
  else
  {
    uint64_t v17 = (void *)v0[23];
    uint64_t v19 = v0[17];
    uint64_t v18 = v0[18];
    uint64_t v20 = v0[16];

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_22E7D357C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22E7F3F80();
  v3[5] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7D3618, v5, v4);
}

uint64_t sub_22E7D3618()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  id v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *id v6 = v0;
  v6[1] = sub_22E7AF6FC;
  uint64_t v7 = v0[2];
  return PASUISourceViewPresenter.setTemplate(_:)(v7);
}

void sub_22E7D36DC()
{
  uint64_t v1 = sub_22E7F3A30();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v43 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
  id v3 = objc_msgSend(v2, sel_mainView);
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    id v5 = (void *)v4;
    swift_unknownObjectRetain();
    id v6 = objc_msgSend(v5, sel_subviews);
    sub_22E7C4E80(0, &qword_2686116E8);
    unint64_t v7 = sub_22E7F3F20();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_22E7F41A0();
      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_4:
        if (v8 < 1)
        {
          __break(1u);
LABEL_19:
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v8; ++i)
        {
          if ((v7 & 0xC000000000000001) != 0) {
            id v10 = (id)MEMORY[0x230FA3F60](i, v7);
          }
          else {
            id v10 = *(id *)(v7 + 8 * i + 32);
          }
          uint64_t v11 = v10;
          objc_msgSend(v10, sel_removeFromSuperview);
        }
      }
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView;
  uint64_t v13 = *(void **)(v0 + OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView);
  if (v13) {
    objc_msgSend(v13, sel_removeFromSuperview);
  }
  id v14 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268610D80));
  swift_retain();
  uint64_t v15 = (void *)sub_22E7F3910();
  sub_22E7F3A20();
  sub_22E7F3900();
  id v16 = objc_msgSend(v15, sel_view);
  if (!v16) {
    goto LABEL_19;
  }
  uint64_t v17 = v16;
  objc_msgSend(v2, sel_addChildViewController_, v15);
  objc_msgSend(v3, sel_addSubview_, v17);
  self;
  uint64_t v18 = swift_dynamicCastObjCClass();
  if (v18) {
    objc_msgSend(v15, sel_didMoveToParentViewController_, v18);
  }
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v42 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611E10);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_22E7F73C0;
  id v20 = objc_msgSend(v17, sel_topAnchor);
  id v21 = objc_msgSend(v3, sel_mainContentGuide);
  id v22 = objc_msgSend(v21, sel_topAnchor);

  id v23 = objc_msgSend(v20, sel_constraintGreaterThanOrEqualToAnchor_, v22);
  *(void *)(v19 + 32) = v23;
  id v24 = objc_msgSend(v17, sel_bottomAnchor);
  id v25 = objc_msgSend(v3, sel_mainContentGuide);
  id v26 = objc_msgSend(v25, sel_bottomAnchor);

  id v27 = objc_msgSend(v24, sel_constraintLessThanOrEqualToAnchor_, v26);
  *(void *)(v19 + 40) = v27;
  id v28 = objc_msgSend(v17, sel_leadingAnchor);
  id v29 = objc_msgSend(v3, sel_mainContentGuide);
  id v30 = objc_msgSend(v29, sel_leadingAnchor);

  id v31 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v30);
  *(void *)(v19 + 48) = v31;
  id v32 = objc_msgSend(v17, sel_trailingAnchor);
  id v33 = objc_msgSend(v3, sel_mainContentGuide);
  id v34 = objc_msgSend(v33, sel_trailingAnchor);

  id v35 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v34);
  *(void *)(v19 + 56) = v35;
  id v36 = objc_msgSend(v17, sel_centerYAnchor);
  id v37 = objc_msgSend(v3, sel_mainContentGuide);
  id v38 = objc_msgSend(v37, sel_centerYAnchor);

  id v39 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v38);
  *(void *)(v19 + 64) = v39;
  sub_22E7F3F40();
  sub_22E7C4E80(0, (unint64_t *)&qword_268610AF8);
  uint64_t v40 = (void *)sub_22E7F3F10();
  swift_bridgeObjectRelease();
  objc_msgSend(v42, sel_activateConstraints_, v40);

  swift_unknownObjectRelease();
  uint64_t v41 = *(void **)(v43 + v12);
  *(void *)(v43 + v12) = v17;
}

id PASUISourceViewPresenter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PASUISourceViewPresenter.init()()
{
}

uint64_t PASUISourceViewPresenter.present(step:)(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22E7F3580();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  swift_unknownObjectRetain_n();
  id v14 = sub_22E7F3570();
  os_log_type_t v15 = sub_22E7F4010();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v31 = a2;
    uint64_t v16 = swift_slowAlloc();
    id v30 = v8;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    id v29 = v3;
    *(_DWORD *)uint64_t v17 = 136446210;
    v28[1] = v17 + 4;
    uint64_t v32 = a1;
    uint64_t v33 = v31;
    uint64_t v34 = v18;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
    uint64_t v19 = sub_22E7F3EA0();
    uint64_t v32 = sub_22E7B3114(v19, v20, &v34);
    id v3 = v29;
    sub_22E7F40C0();
    a2 = v31;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_22E7A0000, v14, v15, "PASUISourceViewPresenter present step %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v18, -1, -1);
    id v21 = v17;
    uint64_t v8 = v30;
    MEMORY[0x230FA4830](v21, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v22 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v8, 1, 1, v22);
  sub_22E7F3F80();
  swift_unknownObjectRetain();
  id v23 = v3;
  uint64_t v24 = sub_22E7F3F70();
  id v25 = (void *)swift_allocObject();
  uint64_t v26 = MEMORY[0x263F8F500];
  v25[2] = v24;
  void v25[3] = v26;
  v25[4] = v23;
  v25[5] = a1;
  v25[6] = a2;
  sub_22E7AA784((uint64_t)v8, (uint64_t)&unk_268611540, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_22E7D4090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[62] = a5;
  v6[63] = a6;
  v6[61] = a4;
  uint64_t v7 = sub_22E7F3580();
  v6[64] = v7;
  v6[65] = *(void *)(v7 - 8);
  v6[66] = swift_task_alloc();
  v6[67] = swift_task_alloc();
  v6[68] = swift_task_alloc();
  sub_22E7F3F80();
  v6[69] = sub_22E7F3F70();
  uint64_t v9 = sub_22E7F3F50();
  v6[70] = v9;
  v6[71] = v8;
  return MEMORY[0x270FA2498](sub_22E7D41A8, v9, v8);
}

uint64_t sub_22E7D41A8()
{
  uint64_t v1 = *(void *)(v0[61] + OBJC_IVAR___PASUIGuardianViewPresenter_flowController + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v1 + 48) + **(int **)(v1 + 48));
  id v3 = (void *)swift_task_alloc();
  v0[72] = v3;
  *id v3 = v0;
  v3[1] = sub_22E7D42BC;
  uint64_t v5 = v0[62];
  uint64_t v4 = v0[63];
  return v7(v5, v4, ObjectType, v1);
}

uint64_t sub_22E7D42BC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 584) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 568);
  uint64_t v4 = *(void *)(v2 + 560);
  if (v0) {
    uint64_t v5 = sub_22E7D4FEC;
  }
  else {
    uint64_t v5 = sub_22E7D43F8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_22E7D43F8()
{
  uint64_t v43 = v0;
  *(_OWORD *)(v0 + 424) = *(_OWORD *)(v0 + 496);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686116C0);
  if (swift_dynamicCast())
  {
    uint64_t v1 = (long long *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 544);
    uint64_t v3 = *(void *)(v0 + 520);
    sub_22E7B9E68((long long *)(v0 + 264), v0 + 184);
    uint64_t v4 = sub_22E7F3560();
    id v39 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v40 = v4;
    v39(v2);
    sub_22E7B4230(v0 + 184, v0 + 304);
    uint64_t v5 = sub_22E7F3570();
    os_log_type_t v6 = sub_22E7F3FE0();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void *)(v0 + 544);
    uint64_t v9 = *(void *)(v0 + 520);
    uint64_t v10 = *(void *)(v0 + 512);
    if (v7)
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = v10;
      uint64_t v12 = swift_slowAlloc();
      uint64_t v42 = v12;
      *(_DWORD *)uint64_t v11 = 136446210;
      sub_22E7B4230(v0 + 304, v0 + 64);
      uint64_t v13 = sub_22E7F3EA0();
      *(void *)(v0 + 480) = sub_22E7B3114(v13, v14, &v42);
      sub_22E7F40C0();
      uint64_t v1 = (long long *)(v0 + 16);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 304);
      _os_log_impl(&dword_22E7A0000, v5, v6, "PASUISourceViewPresenter has viewBuilder: %{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v12, -1, -1);
      MEMORY[0x230FA4830](v11, -1, -1);

      os_log_type_t v15 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v15(v8, v38);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1(v0 + 304);

      os_log_type_t v15 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v15(v8, v10);
    }
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v19 = *(void *)(v0 + 216);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 184), v18);
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
    if (*(unsigned char *)(v0 + 56) == 1)
    {
      char v20 = *(unsigned char *)(v0 + 16);
      uint64_t v22 = *(void *)(v0 + 208);
      uint64_t v21 = *(void *)(v0 + 216);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 184), v22);
      *(void *)(v0 + 464) = (*(uint64_t (**)(uint64_t))(*(void *)(v21 + 8) + 8))(v22);
      id v23 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268610D80));
      uint64_t v24 = sub_22E7F3910();
      *(void *)(v0 + 592) = v24;
      id v25 = (void *)swift_task_alloc();
      *(void *)(v0 + 600) = v25;
      void *v25 = v0;
      v25[1] = sub_22E7D4A24;
      return sub_22E7D5318(v24, v20);
    }
    else
    {
      uint64_t v26 = *(void *)(v0 + 536);
      uint64_t v27 = *(void *)(v0 + 512);
      sub_22E7B9E68(v1, v0 + 344);
      ((void (*)(uint64_t, uint64_t, uint64_t))v39)(v26, v40, v27);
      sub_22E7B4230(v0 + 344, v0 + 144);
      id v28 = sub_22E7F3570();
      os_log_type_t v29 = sub_22E7F3FE0();
      BOOL v30 = os_log_type_enabled(v28, v29);
      uint64_t v31 = *(void *)(v0 + 536);
      uint64_t v32 = *(void *)(v0 + 512);
      if (v30)
      {
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = v15;
        uint64_t v34 = swift_slowAlloc();
        uint64_t v42 = v34;
        *(_DWORD *)uint64_t v33 = 136446210;
        sub_22E7B4230(v0 + 144, v0 + 104);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2686116D8);
        uint64_t v35 = sub_22E7F3EA0();
        *(void *)(v0 + 456) = sub_22E7B3114(v35, v36, &v42);
        sub_22E7F40C0();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v0 + 144);
        _os_log_impl(&dword_22E7A0000, v28, v29, "PASUISourceViewPresenter viewBuilder presents card %{public}s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x230FA4830](v34, -1, -1);
        MEMORY[0x230FA4830](v33, -1, -1);

        v41(v31, v32);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1(v0 + 144);

        v15(v31, v32);
      }
      id v37 = (void *)swift_task_alloc();
      *(void *)(v0 + 608) = v37;
      void *v37 = v0;
      v37[1] = sub_22E7D4BF0;
      return sub_22E7D2354();
    }
  }
  else
  {
    *(_OWORD *)(v0 + 264) = 0u;
    *(_OWORD *)(v0 + 280) = 0u;
    *(void *)(v0 + 296) = 0;
    swift_release();
    sub_22E7A7224(v0 + 264, &qword_2686116C8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
}

uint64_t sub_22E7D4A24()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 592);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 568);
  uint64_t v4 = *(void *)(v1 + 560);
  return MEMORY[0x270FA2498](sub_22E7D4B64, v4, v3);
}

uint64_t sub_22E7D4B64()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7D4BF0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 568);
  uint64_t v3 = *(void *)(v1 + 560);
  return MEMORY[0x270FA2498](sub_22E7D4D10, v3, v2);
}

void sub_22E7D4D10()
{
  uint64_t v1 = v0[61];
  swift_release();
  uint64_t v3 = v0[26];
  uint64_t v2 = v0[27];
  __swift_project_boxed_opaque_existential_1(v0 + 23, v3);
  (*(void (**)(uint64_t))(*(void *)(v2 + 8) + 8))(v3);
  sub_22E7D36DC();
  swift_release();
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
  objc_msgSend(v4, sel_setTitle_, 0);
  objc_msgSend(v4, sel_setSubtitle_, 0);
  objc_msgSend(v4, sel_setAttributedSubtitle_, 0);
  objc_msgSend(v4, sel_setDismissalType_, 1);
  objc_msgSend(v4, sel_setActivityStatusWithText_, 0);
  id v5 = objc_msgSend(v4, sel_actions);
  sub_22E7C4E80(0, &qword_2686116D0);
  unint64_t v6 = sub_22E7F3F20();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22E7F41A0();
    swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      goto LABEL_10;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v7; ++i)
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x230FA3F60](i, v6);
    }
    else {
      id v9 = *(id *)(v6 + 8 * i + 32);
    }
    uint64_t v10 = v9;
    objc_msgSend(v4, sel_removeAction_, v9);
  }
LABEL_10:
  uint64_t v11 = v0[61];
  swift_bridgeObjectRelease();
  uint64_t v12 = v0[46];
  uint64_t v13 = v0[47];
  __swift_project_boxed_opaque_existential_1(v0 + 43, v12);
  (*(void (**)(void *, uint64_t, uint64_t))(v13 + 8))(v4, v12, v13);
  sub_22E7B4230((uint64_t)(v0 + 43), (uint64_t)(v0 + 28));
  uint64_t v14 = v11 + OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter;
  swift_beginAccess();
  sub_22E7D99D4((uint64_t)(v0 + 28), v14);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 43));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 23));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v15 = (void (*)(void))v0[1];
  v15();
}

uint64_t sub_22E7D4FEC()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void **)(v0 + 584);
  uint64_t v2 = *(void *)(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 512);
  swift_release();
  uint64_t v5 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_unknownObjectRetain();
  id v6 = v1;
  swift_unknownObjectRetain();
  id v7 = v1;
  uint64_t v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F4010();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(void **)(v0 + 584);
    uint64_t v25 = *(void *)(v0 + 520);
    uint64_t v26 = *(void *)(v0 + 512);
    uint64_t v27 = *(void *)(v0 + 528);
    long long v24 = *(_OWORD *)(v0 + 496);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v28 = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    *(_OWORD *)(v0 + 408) = v24;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2686109A8);
    uint64_t v13 = sub_22E7F3EA0();
    *(void *)(v0 + 472) = sub_22E7B3114(v13, v14, &v28);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2082;
    *(void *)(v0 + 448) = v10;
    id v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v16 = sub_22E7F3EA0();
    *(void *)(v0 + 440) = sub_22E7B3114(v16, v17, &v28);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v8, v9, "PASUISourceViewPresenter did not present %{public}s.\n%{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v12, -1, -1);
    MEMORY[0x230FA4830](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    uint64_t v18 = *(void **)(v0 + 584);
    uint64_t v19 = *(void *)(v0 + 528);
    uint64_t v20 = *(void *)(v0 + 520);
    uint64_t v21 = *(void *)(v0 + 512);

    swift_unknownObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_22E7D5318(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 168) = a2;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v2;
  uint64_t v4 = sub_22E7F3580();
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = *(void *)(v4 - 8);
  *(void *)(v3 + 88) = swift_task_alloc();
  *(void *)(v3 + 96) = swift_task_alloc();
  *(void *)(v3 + 104) = swift_task_alloc();
  *(void *)(v3 + 112) = swift_task_alloc();
  sub_22E7F3F80();
  *(void *)(v3 + 120) = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  *(void *)(v3 + 128) = v6;
  *(void *)(v3 + 136) = v5;
  return MEMORY[0x270FA2498](sub_22E7D5438, v6, v5);
}

uint64_t sub_22E7D5438()
{
  if (*(unsigned char *)(v0 + 168) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 112);
    uint64_t v2 = *(void *)(v0 + 72);
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v4 = sub_22E7F3560();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
    uint64_t v5 = sub_22E7F3570();
    os_log_type_t v6 = sub_22E7F3FE0();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22E7A0000, v5, v6, "PASUISourceViewPresenter is presenting a modal view controller without a nav controller", v7, 2u);
      MEMORY[0x230FA4830](v7, -1, -1);
    }
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v9 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 80);
    uint64_t v11 = *(void **)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    objc_msgSend(v11, sel_setModalInPresentation_, 1);
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v12;
    *uint64_t v12 = v0;
    uint64_t v13 = sub_22E7D5A2C;
LABEL_23:
    v12[1] = v13;
    return sub_22E7D2354();
  }
  unint64_t v14 = *(void **)(*(void *)(v0 + 64) + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController);
  *(void *)(v0 + 152) = v14;
  id v15 = objc_msgSend(v14, sel_viewController);
  id v16 = objc_msgSend(v15, sel_presentedViewController);

  if (!v16)
  {
LABEL_11:
    id v30 = objc_msgSend(v14, sel_viewController);
    id v16 = objc_msgSend(v30, sel_presentedViewController);

    if (v16)
    {
      id v31 = objc_msgSend(v16, sel_navigationController);
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)(v0 + 96);
        uint64_t v34 = *(void *)(v0 + 72);
        uint64_t v35 = *(void *)(v0 + 80);
        swift_release();
        uint64_t v36 = sub_22E7F3560();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v33, v36, v34);
        id v37 = sub_22E7F3570();
        os_log_type_t v38 = sub_22E7F4010();
        if (os_log_type_enabled(v37, v38))
        {
          id v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v39 = 0;
          _os_log_impl(&dword_22E7A0000, v37, v38, "PASUISourceViewPresenter is already presenting a view controller, but should be presenting a nav controller.", v39, 2u);
          MEMORY[0x230FA4830](v39, -1, -1);
        }
        uint64_t v40 = *(void *)(v0 + 96);
        uint64_t v41 = *(void *)(v0 + 72);
        uint64_t v42 = *(void *)(v0 + 80);
        uint64_t v43 = *(void *)(v0 + 56);

        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v40, v41);
        objc_msgSend(v32, sel_pushViewController_animated_, v43, 0);

        goto LABEL_16;
      }
    }
    uint64_t v52 = *(void *)(v0 + 80);
    uint64_t v51 = *(void *)(v0 + 88);
    uint64_t v53 = *(void *)(v0 + 72);
    uint64_t v54 = sub_22E7F3560();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v51, v54, v53);
    id v55 = sub_22E7F3570();
    os_log_type_t v56 = sub_22E7F3FE0();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl(&dword_22E7A0000, v55, v56, "PASUISourceViewPresenter presenting modal nav controller", v57, 2u);
      MEMORY[0x230FA4830](v57, -1, -1);
    }
    uint64_t v59 = *(void *)(v0 + 80);
    uint64_t v58 = *(void *)(v0 + 88);
    uint64_t v60 = *(void *)(v0 + 72);

    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v12;
    *uint64_t v12 = v0;
    uint64_t v13 = sub_22E7D5CC0;
    goto LABEL_23;
  }
  self;
  uint64_t v17 = swift_dynamicCastObjCClass();
  if (!v17)
  {

    goto LABEL_11;
  }
  uint64_t v18 = (void *)v17;
  uint64_t v19 = *(void *)(v0 + 104);
  uint64_t v20 = *(void *)(v0 + 72);
  uint64_t v21 = *(void *)(v0 + 80);
  swift_release();
  uint64_t v22 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v22, v20);
  id v23 = sub_22E7F3570();
  os_log_type_t v24 = sub_22E7F3FE0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_22E7A0000, v23, v24, "PASUISourceViewPresenter reusing modal nav controller", v25, 2u);
    MEMORY[0x230FA4830](v25, -1, -1);
  }
  uint64_t v26 = *(void *)(v0 + 104);
  uint64_t v27 = *(void *)(v0 + 72);
  uint64_t v28 = *(void *)(v0 + 80);
  uint64_t v29 = *(void *)(v0 + 56);

  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
  objc_msgSend(v18, sel_pushViewController_animated_, v29, 0);
LABEL_16:

  uint64_t v44 = *(void *)(v0 + 56);
  uint64_t v45 = *(void (**)(uint64_t))(**(void **)(*(void *)(v0 + 64)
                                                     + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                       + 128);
  uint64_t v46 = swift_retain();
  v45(v46);
  swift_release();
  uint64_t v47 = *(void *)(v0 + 40);
  uint64_t v48 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v47);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 24))(v44, v47, v48);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_22E7D5A2C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return MEMORY[0x270FA2498](sub_22E7D5B4C, v3, v2);
}

uint64_t sub_22E7D5B4C()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  swift_release();
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                             + OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController), sel_viewController));
  objc_msgSend(v3, sel_presentViewController_animated_completion_, v1, 1, 0);

  uint64_t v4 = v0[7];
  uint64_t v5 = *(void (**)(uint64_t))(**(void **)(v0[8]
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                      + 128);
  uint64_t v6 = swift_retain();
  v5(v6);
  swift_release();
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v4, v7, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_22E7D5CC0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return MEMORY[0x270FA2498](sub_22E7D5DE0, v3, v2);
}

uint64_t sub_22E7D5DE0()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v0[7];
  swift_release();
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v2);
  objc_msgSend(v3, sel_setModalInPresentation_, 1);
  id v4 = objc_msgSend(v1, sel_viewController);
  objc_msgSend(v4, sel_presentViewController_animated_completion_, v3, 1, 0);

  uint64_t v5 = v0[7];
  uint64_t v6 = *(void (**)(uint64_t))(**(void **)(v0[8]
                                                    + OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider)
                                      + 128);
  uint64_t v7 = swift_retain();
  v6(v7);
  swift_release();
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v5, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_22E7D5F84(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116A8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_22E7F3F80();
  id v12 = a2;
  uint64_t v13 = sub_22E7F3F70();
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  id v15 = (char *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  *((void *)v15 + 2) = v13;
  *((void *)v15 + 3) = v16;
  *((void *)v15 + 4) = v12;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v15[v14], v7, v4);
  sub_22E7AA784((uint64_t)v10, (uint64_t)&unk_2686116B8, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_22E7D617C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116A8);
  v5[10] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[11] = v7;
  v5[12] = *(void *)(v7 + 64);
  v5[13] = swift_task_alloc();
  sub_22E7F3F80();
  v5[14] = sub_22E7F3F70();
  uint64_t v9 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7D627C, v9, v8);
}

uint64_t sub_22E7D627C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v5 = (void *)v0[8];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  v0[6] = sub_22E7D9954;
  v0[7] = v7;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_22E7CC0A8;
  v0[5] = &block_descriptor_5;
  uint64_t v8 = _Block_copy(v0 + 2);
  swift_release();
  objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, 1, v8);
  _Block_release(v8);
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t PASUISourceViewPresenter.flowDidComplete(with:)(uint64_t a1)
{
  v2[26] = a1;
  v2[27] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  v2[28] = swift_task_alloc();
  uint64_t v3 = sub_22E7F2FA0();
  v2[29] = v3;
  v2[30] = *(void *)(v3 - 8);
  v2[31] = swift_task_alloc();
  uint64_t v4 = sub_22E7F3580();
  v2[32] = v4;
  v2[33] = *(void *)(v4 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = sub_22E7F3F80();
  v2[36] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  v2[37] = v6;
  v2[38] = v5;
  return MEMORY[0x270FA2498](sub_22E7D6578, v6, v5);
}

uint64_t sub_22E7D6578()
{
  uint64_t v41 = v0;
  uint64_t v1 = v0[26];
  uint64_t v2 = (uint64_t)(v0 + 9);
  uint64_t v3 = v0[33];
  uint64_t v4 = v0[34];
  uint64_t v5 = v0[32];
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v6, v5);
  sub_22E7D8C1C(v1, (uint64_t)(v0 + 2));
  uint64_t v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v37 = v0[33];
    uint64_t v38 = v0[32];
    uint64_t v39 = v0[34];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v40 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    sub_22E7D8C1C((uint64_t)(v0 + 2), (uint64_t)(v0 + 16));
    __swift_instantiateConcreteTypeFromMangledName(&qword_268611550);
    uint64_t v11 = sub_22E7F3EA0();
    v0[25] = sub_22E7B3114(v11, v12, &v40);
    uint64_t v2 = (uint64_t)(v0 + 9);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();
    sub_22E7A7224((uint64_t)(v0 + 2), &qword_268611550);
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUISourceViewPresenter flowDidComplete with result %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v10, -1, -1);
    MEMORY[0x230FA4830](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
  }
  else
  {
    uint64_t v14 = v0[33];
    uint64_t v13 = v0[34];
    uint64_t v15 = v0[32];
    sub_22E7A7224((uint64_t)(v0 + 2), &qword_268611550);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  uint64_t v16 = v0[27];
  sub_22E7D8C1C(v0[26], v2);
  id v17 = objc_allocWithZone((Class)sub_22E7F3330());
  uint64_t v18 = sub_22E7F3320();
  v0[39] = v18;
  uint64_t v19 = *(void *)(v16 + OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer);
  v0[40] = v19;
  if (v19)
  {
    uint64_t v20 = (void *)v18;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = &unk_268611568;
    *(void *)(v22 + 24) = v21;
    v0[23] = &unk_2686109D8;
    v0[24] = v22;
    swift_retain();
    id v23 = v20;
    sub_22E7F2F90();
    os_log_type_t v24 = (void *)swift_task_alloc();
    v0[41] = v24;
    *os_log_type_t v24 = v0;
    v24[1] = sub_22E7D69D0;
    uint64_t v25 = v0[31];
    return MEMORY[0x270F58B60](v0 + 23, v25);
  }
  else
  {
    swift_release();
    uint64_t v26 = (void *)v0[39];
    uint64_t v28 = (void *)v0[27];
    uint64_t v27 = v0[28];
    uint64_t v29 = sub_22E7F3FB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v27, 1, 1, v29);
    id v30 = v26;
    id v31 = v28;
    uint64_t v32 = sub_22E7F3F70();
    uint64_t v33 = (void *)swift_allocObject();
    uint64_t v34 = MEMORY[0x263F8F500];
    v33[2] = v32;
    v33[3] = v34;
    v33[4] = v31;
    v33[5] = v30;
    sub_22E7AA784(v27, (uint64_t)&unk_268611578, (uint64_t)v33);
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v35 = (uint64_t (*)(void))v0[1];
    return v35();
  }
}

uint64_t sub_22E7D69D0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (*v0)[31];
  uint64_t v3 = (*v0)[30];
  uint64_t v4 = (*v0)[29];
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_22E7A6ED4(v1[23]);
  uint64_t v5 = v1[38];
  uint64_t v6 = v1[37];
  return MEMORY[0x270FA2498](sub_22E7D6B9C, v6, v5);
}

uint64_t sub_22E7D6B9C()
{
  swift_release();
  uint64_t v1 = (void *)v0[39];
  uint64_t v3 = (void *)v0[27];
  uint64_t v2 = v0[28];
  uint64_t v4 = sub_22E7F3FB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 1, 1, v4);
  id v5 = v1;
  id v6 = v3;
  uint64_t v7 = sub_22E7F3F70();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  void v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  v8[5] = v5;
  sub_22E7AA784(v2, (uint64_t)&unk_268611578, (uint64_t)v8);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_22E7D6CD8(uint64_t a1)
{
  *(void *)(v1 + 296) = a1;
  return MEMORY[0x270FA2498](sub_22E7D6CF8, 0, 0);
}

uint64_t sub_22E7D6CF8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610A48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22E7F5B70;
  *(void *)(inited + 32) = 0xD00000000000001ALL;
  *(void *)(inited + 40) = 0x800000022E7F9AB0;
  unint64_t v2 = sub_22E7F3310();
  if (v2 >= 3)
  {
    *(void *)(v0 + 280) = v2;
    return sub_22E7F4220();
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 296);
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8D310];
    uint64_t v5 = MEMORY[0x263F62548];
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 80) = v5;
    *(void *)(inited + 48) = 0;
    *(void *)(inited + 56) = 0xE000000000000000;
    sub_22E7C2F0C(inited);
    sub_22E7D8C1C(v3 + *MEMORY[0x263F62480], v0 + 104);
    if (*(unsigned char *)(v0 + 152))
    {
      id v6 = *(void **)(v0 + 104);
      swift_getErrorValue();
      uint64_t v7 = sub_22E7F4250();
      uint64_t v9 = v8;
      *(void *)(v0 + 224) = v4;
      *(void *)(v0 + 232) = v5;

      *(void *)(v0 + 200) = v7;
      *(void *)(v0 + 208) = v9;
    }
    else
    {
      sub_22E7A7224(v0 + 104, &qword_268611550);
      *(_OWORD *)(v0 + 200) = 0u;
      *(_OWORD *)(v0 + 216) = 0u;
      *(void *)(v0 + 232) = 0;
    }
    *(void *)(v0 + 264) = 0xD00000000000001ALL;
    *(void *)(v0 + 272) = 0x800000022E7F9C20;
    *(void *)(v0 + 184) = v4;
    *(void *)(v0 + 192) = v5;
    *(void *)(v0 + 160) = 0;
    *(void *)(v0 + 168) = 0xE000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610AD8);
    uint64_t v11 = sub_22E7F3E30();
    swift_bridgeObjectRelease();
    sub_22E7A7224(v0 + 160, &qword_268610AE0);
    sub_22E7A7224(v0 + 200, &qword_268610AE0);
    uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v12(v11);
  }
}

uint64_t sub_22E7D6F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = sub_22E7F3580();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  sub_22E7F3F80();
  v5[10] = sub_22E7F3F70();
  uint64_t v8 = sub_22E7F3F50();
  v5[11] = v8;
  v5[12] = v7;
  return MEMORY[0x270FA2498](sub_22E7D7074, v8, v7);
}

uint64_t sub_22E7D7074()
{
  uint64_t v1 = v0[5] + OBJC_IVAR___PASUIGuardianViewPresenter_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x230FA4900](v1);
  swift_unknownObjectRelease();
  if (!v2)
  {
    uint64_t v4 = v0[8];
    uint64_t v3 = v0[9];
    uint64_t v5 = v0[7];
    uint64_t v6 = sub_22E7F3560();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    uint64_t v7 = sub_22E7F3570();
    os_log_type_t v8 = sub_22E7F4000();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_22E7A0000, v7, v8, "PASUISourceViewPresenter delegate is nil", v9, 2u);
      MEMORY[0x230FA4830](v9, -1, -1);
    }
    uint64_t v11 = v0[8];
    uint64_t v10 = v0[9];
    uint64_t v12 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  uint64_t v13 = (void *)MEMORY[0x230FA4900](v1);
  if (v13)
  {
    objc_msgSend(v13, sel_proximitySetupCompletedWithResult_, v0[6]);
    swift_unknownObjectRelease();
  }
  uint64_t v14 = (void *)swift_task_alloc();
  v0[13] = v14;
  void *v14 = v0;
  v14[1] = sub_22E7D7228;
  return sub_22E7D2354();
}

uint64_t sub_22E7D7228()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_22E7D7348, v3, v2);
}

uint64_t sub_22E7D7348()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PASUISourceViewPresenter.stepDidRequestCancel(_:)()
{
  *(void *)(v1 + 16) = v0;
  sub_22E7F3F80();
  *(void *)(v1 + 24) = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7D7448, v3, v2);
}

uint64_t sub_22E7D7448()
{
  swift_release();
  _s23ProximityAppleIDSetupUI24PASUISourceViewPresenterC12handleCancelyyF_0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PASUISourceViewPresenter.stepDidRequestReset(_:)()
{
  v0[2] = sub_22E7F3F80();
  v0[3] = sub_22E7F3F70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7D755C;
  return sub_22E7D1E00();
}

uint64_t sub_22E7D755C()
{
  swift_task_dealloc();
  uint64_t v1 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7A7F04, v1, v0);
}

uint64_t PASUISourceViewPresenter.handleReset()()
{
  v0[2] = sub_22E7F3F80();
  v0[3] = sub_22E7F3F70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7D755C;
  return sub_22E7D1E00();
}

uint64_t sub_22E7D7744(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7A7F00;
  return PASUISourceViewPresenter.flowDidComplete(with:)(a1);
}

uint64_t sub_22E7D77DC()
{
  v0[2] = sub_22E7F3F80();
  v0[3] = sub_22E7F3F70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7D755C;
  return sub_22E7D1E00();
}

uint64_t sub_22E7D7888()
{
  *(void *)(v1 + 16) = v0;
  sub_22E7F3F80();
  *(void *)(v1 + 24) = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7D7448, v3, v2);
}

uint64_t sub_22E7D7920()
{
  v0[2] = sub_22E7F3F80();
  v0[3] = sub_22E7F3F70();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7B7A94;
  return sub_22E7D1E00();
}

uint64_t sub_22E7D79D0(char *a1, char *a2)
{
  return sub_22E7CF5B4(*a1, *a2);
}

uint64_t sub_22E7D79DC()
{
  return sub_22E7CF84C();
}

uint64_t sub_22E7D79E4()
{
  sub_22E7F3EE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7D7A50()
{
  return sub_22E7CFA9C();
}

uint64_t sub_22E7D7A58@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_22E7F41E0();
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

void sub_22E7D7AB8(void *a1@<X8>)
{
  unint64_t v2 = 0x800000022E7F8D20;
  if (*v1) {
    unint64_t v2 = 0x800000022E7F8D50;
  }
  *a1 = 0xD000000000000021;
  a1[1] = v2;
}

uint64_t sub_22E7D7AF4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_22E7D93AC();
  return MEMORY[0x270F58AB0](a1, a2, v4);
}

id PRXCardContentViewController.viewController.getter()
{
  return v0;
}

id sub_22E7D7B50(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_contentView);

  return v2;
}

id PRXCardContentViewController.mainView.getter()
{
  id v1 = objc_msgSend(v0, sel_contentView);
  return v1;
}

Swift::Void __swiftcall PRXCardContentViewController.setActivityStatus(text:)(Swift::String_optional text)
{
  if (text.value._object)
  {
    id v2 = (id)sub_22E7F3E60();
    objc_msgSend(v1, sel_showActivityIndicatorWithStatus_, v2);
  }
  else
  {
    objc_msgSend(v1, sel_hideActivityIndicator);
  }
}

void sub_22E7D7C54(id a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    sub_22E7F3E90();
    id v4 = a1;
    id v5 = (id)sub_22E7F3E60();
    objc_msgSend(v4, sel_showActivityIndicatorWithStatus_, v5);

    swift_bridgeObjectRelease();
  }
  else
  {
    objc_msgSend(a1, sel_hideActivityIndicator);
  }
}

uint64_t sub_22E7D7D14(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_22E7A7F00;
  return v6();
}

uint64_t sub_22E7D7DE0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_22E7A7F00;
  return v7();
}

uint64_t sub_22E7D7EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22E7F3FB0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22E7F3FA0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22E7A7224(a1, &qword_268610CF0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22E7F3F50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22E7D8058(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_22E7D8134;
  return v6(a1);
}

uint64_t sub_22E7D8134()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s23ProximityAppleIDSetupUI29PASUISourceViewPresenterErrorO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_22E7F41E0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

id sub_22E7D8278(void *a1)
{
  uint64_t v37 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_22E7F3580();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v36 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v34 - v7;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView] = 0;
  uint64_t v9 = &v1[OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  *(void *)&v1[OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer] = 0;
  uint64_t v10 = OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610698);
  swift_allocObject();
  *(void *)&v1[v10] = sub_22E7F3050();
  uint64_t v11 = OBJC_IVAR___PASUIGuardianViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A0);
  swift_allocObject();
  *(void *)&v1[v11] = sub_22E7F3050();
  uint64_t v12 = OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  *(void *)&v1[v12] = sub_22E7F3050();
  uint64_t v13 = OBJC_IVAR___PASUIGuardianViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B8);
  swift_allocObject();
  *(void *)&v1[v13] = sub_22E7F3050();
  *(void *)&v1[OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics] = 0;
  uint64_t v35 = v1;
  uint64_t v14 = sub_22E7F3560();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v15(v8, v14, v3);
  uint64_t v16 = sub_22E7F3570();
  os_log_type_t v17 = sub_22E7F4010();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = ObjectType;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_22E7A0000, v16, v17, "PAS=== Welcome to ProximityAppleIDSetup - Source ===PAS", v19, 2u);
    uint64_t v20 = v19;
    uint64_t ObjectType = v18;
    MEMORY[0x230FA4830](v20, -1, -1);
  }

  uint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
  v21(v8, v3);
  uint64_t v22 = v36;
  v15(v36, v14, v3);
  id v23 = sub_22E7F3570();
  os_log_type_t v24 = sub_22E7F4010();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_22E7A0000, v23, v24, "PASUISourceViewPresenter initWithSharingViewController", v25, 2u);
    MEMORY[0x230FA4830](v25, -1, -1);
  }

  v21(v22, v3);
  sub_22E7F3090();
  swift_retain();
  sub_22E7F3070();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(void *)(swift_allocObject() + 16) = 0;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610928);
  v39[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268610930);
  v39[0] = v26;
  swift_retain();
  sub_22E7F30A0();
  swift_release();
  sub_22E7A7224((uint64_t)v39, &qword_268610938);
  swift_release();
  uint64_t v27 = v37;
  uint64_t v28 = v35;
  *(void *)&v35[OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController] = v37;
  sub_22E7F3300();
  swift_allocObject();
  id v29 = v27;
  uint64_t v30 = sub_22E7F32F0();
  uint64_t v31 = MEMORY[0x263F62478];
  uint64_t v32 = (uint64_t *)&v28[OBJC_IVAR___PASUIGuardianViewPresenter_flowController];
  *uint64_t v32 = v30;
  v32[1] = v31;

  v38.receiver = v28;
  v38.super_class = ObjectType;
  return objc_msgSendSuper2(&v38, sel_init);
}

id sub_22E7D86CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a3;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v35 - v9;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR___PASUIGuardianViewPresenter_cardContentView] = 0;
  uint64_t v11 = &v3[OBJC_IVAR___PASUIGuardianViewPresenter_cardAdapter];
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((void *)v11 + 4) = 0;
  *(void *)&v3[OBJC_IVAR___PASUIGuardianViewPresenter_flowTimer] = 0;
  uint64_t v12 = OBJC_IVAR___PASUIGuardianViewPresenter__messageSessionProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610698);
  swift_allocObject();
  *(void *)&v3[v12] = sub_22E7F3050();
  uint64_t v13 = OBJC_IVAR___PASUIGuardianViewPresenter__authenticator;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A0);
  swift_allocObject();
  *(void *)&v3[v13] = sub_22E7F3050();
  uint64_t v14 = OBJC_IVAR___PASUIGuardianViewPresenter__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  *(void *)&v3[v14] = sub_22E7F3050();
  uint64_t v15 = OBJC_IVAR___PASUIGuardianViewPresenter__analyticsProvider;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106B8);
  swift_allocObject();
  *(void *)&v3[v15] = sub_22E7F3050();
  *(void *)&v3[OBJC_IVAR___PASUIGuardianViewPresenter____lazy_storage___analytics] = 0;
  uint64_t v36 = v3;
  uint64_t v16 = sub_22E7F3560();
  os_log_type_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v17(v10, v16, v4);
  uint64_t v18 = sub_22E7F3570();
  os_log_type_t v19 = sub_22E7F4010();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = v8;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_22E7A0000, v18, v19, "PAS=== Welcome to ProximityAppleIDSetup - Source ===PAS", v21, 2u);
    uint64_t v22 = v21;
    uint64_t v8 = v20;
    MEMORY[0x230FA4830](v22, -1, -1);
  }

  id v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v10, v4);
  v17(v8, v16, v4);
  os_log_type_t v24 = sub_22E7F3570();
  os_log_type_t v25 = sub_22E7F4010();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = v8;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_22E7A0000, v24, v25, "PASUISourceViewPresenter parentVC and flow controller", v27, 2u);
    uint64_t v28 = v27;
    uint64_t v8 = v26;
    MEMORY[0x230FA4830](v28, -1, -1);
  }

  v23(v8, v4);
  sub_22E7F3090();
  swift_retain();
  sub_22E7F3070();
  swift_release();
  type metadata accessor for PASUIViewControllerProvider();
  *(void *)(swift_allocObject() + 16) = 0;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610928);
  v42[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268610930);
  v42[0] = v29;
  swift_retain();
  sub_22E7F30A0();
  swift_release();
  sub_22E7A7224((uint64_t)v42, &qword_268610938);
  swift_release();
  uint64_t v30 = v39;
  uint64_t v32 = v36;
  uint64_t v31 = v37;
  *(void *)&v36[OBJC_IVAR___PASUIGuardianViewPresenter_parentViewController] = v38;
  uint64_t v33 = &v32[OBJC_IVAR___PASUIGuardianViewPresenter_flowController];
  *(void *)uint64_t v33 = v30;
  *((void *)v33 + 1) = v31;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  v41.receiver = v32;
  v41.super_class = ObjectType;
  return objc_msgSendSuper2(&v41, sel_init);
}

uint64_t sub_22E7D8B0C()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22E7D8B54(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_22E7A7F00;
  return sub_22E7D4090(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_22E7D8C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E7D8C84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7D8CBC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7B2A68;
  v3[37] = v2;
  return MEMORY[0x270FA2498](sub_22E7D6CF8, 0, 0);
}

uint64_t sub_22E7D8D68()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7D8DA0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22E7D8DE8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22E7A7F00;
  return sub_22E7D6F80(a1, v4, v5, v7, v6);
}

unint64_t sub_22E7D8EAC()
{
  unint64_t result = qword_2686115A0;
  if (!qword_2686115A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686115A0);
  }
  return result;
}

unint64_t sub_22E7D8F00(void *a1)
{
  a1[1] = sub_22E7D8F38();
  a1[2] = sub_22E7D8F8C();
  unint64_t result = sub_22E7D8FE0();
  a1[3] = result;
  return result;
}

unint64_t sub_22E7D8F38()
{
  unint64_t result = qword_2686115A8;
  if (!qword_2686115A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686115A8);
  }
  return result;
}

unint64_t sub_22E7D8F8C()
{
  unint64_t result = qword_2686115B0;
  if (!qword_2686115B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686115B0);
  }
  return result;
}

unint64_t sub_22E7D8FE0()
{
  unint64_t result = qword_2686115B8;
  if (!qword_2686115B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686115B8);
  }
  return result;
}

unint64_t sub_22E7D9038()
{
  unint64_t result = qword_2686115C0;
  if (!qword_2686115C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686115C0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PASUISourceViewPresenterError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E7D9158);
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

ValueMetadata *type metadata accessor for PASUISourceViewPresenterError()
{
  return &type metadata for PASUISourceViewPresenterError;
}

uint64_t type metadata accessor for PASUISourceViewPresenter()
{
  return self;
}

uint64_t getEnumTagSinglePayload for PASUISourceViewPresenter.AnalyticsEvent(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PASUISourceViewPresenter.AnalyticsEvent(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22E7D9310);
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

unsigned char *sub_22E7D9338(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PASUISourceViewPresenter.AnalyticsEvent()
{
  return &type metadata for PASUISourceViewPresenter.AnalyticsEvent;
}

unint64_t sub_22E7D9358()
{
  unint64_t result = qword_268611628;
  if (!qword_268611628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611628);
  }
  return result;
}

unint64_t sub_22E7D93AC()
{
  unint64_t result = qword_268611630;
  if (!qword_268611630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611630);
  }
  return result;
}

uint64_t sub_22E7D9404()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268611638 + dword_268611638);
  return v6(v2, v3, v4);
}

uint64_t sub_22E7D94C0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268611658 + dword_268611658);
  return v6(a1, v4);
}

uint64_t sub_22E7D957C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_22E7A7F00;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268611668 + dword_268611668);
  return v6(v2, v3, v4);
}

unint64_t sub_22E7D9638()
{
  unint64_t result = qword_268611690;
  if (!qword_268611690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611690);
  }
  return result;
}

unint64_t sub_22E7D968C()
{
  unint64_t result = qword_268611698;
  if (!qword_268611698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268611698);
  }
  return result;
}

uint64_t sub_22E7D96E0(uint64_t a1)
{
  return sub_22E7D5F84(a1, *(void **)(v1 + 16));
}

uint64_t sub_22E7D96E8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116A8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22E7D97C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2686116A8) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_22E7A6D00;
  return sub_22E7D617C(a1, v5, v6, v7, v8);
}

uint64_t sub_22E7D98C0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116A8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22E7D9954()
{
  return sub_22E7F3F60();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_22E7D99D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for PASUIProgressView()
{
  return &type metadata for PASUIProgressView;
}

uint64_t sub_22E7D9A50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7D9A6C@<X0>(uint64_t a1@<X8>)
{
  sub_22E7F3ED0();
  sub_22E7A9CD0();
  uint64_t result = sub_22E7F3B10();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22E7D9ADC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22E7F36A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116F0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116F8);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a1 = sub_22E7F38D0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v14 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268611700) + 44);
  sub_22E7F36E0();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
  *(_WORD *)&v13[*(int *)(v11 + 44)] = 257;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F18558], v2);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = (uint64_t *)(v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268611708) + 36));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611710);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v16 + *(int *)(v17 + 28), v5, v2);
  *uint64_t v16 = KeyPath;
  sub_22E7D9E94((uint64_t)v13, v14);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_22E7D9EFC((uint64_t)v13);
}

uint64_t sub_22E7D9DA4()
{
  return sub_22E7F3820();
}

uint64_t sub_22E7D9DC8(uint64_t a1)
{
  uint64_t v2 = sub_22E7F36A0();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x230FA3630](v4);
}

uint64_t sub_22E7D9E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E7D9EFC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686116F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22E7D9F60()
{
  unint64_t result = qword_268611718;
  if (!qword_268611718)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268611720);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611718);
  }
  return result;
}

uint64_t PASFlowStepProxiedAuth.buildView()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611730);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v23[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v23[-1] - v6;
  uint64_t v8 = (objc_class *)type metadata accessor for PASUIAppleIDAuthContextProvider();
  id v9 = objc_allocWithZone(v8);
  swift_retain();
  id v10 = objc_msgSend(v9, sel_init);
  v23[3] = v8;
  _OWORD v23[4] = &off_26E232D68;
  v23[0] = v10;
  uint64_t v11 = (char *)objc_allocWithZone((Class)type metadata accessor for PASUISignInViewModel());
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, (uint64_t)v8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (void *)((char *)&v23[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  uint64_t v16 = *v14;
  id v17 = v10;
  id v18 = sub_22E7DBCC0(v0, v16, v11);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);

  v23[0] = v18;
  unint64_t v19 = sub_22E7DBEDC();
  sub_22E7F3C00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v23[0] = &type metadata for PASUISignInView;
  v23[1] = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = sub_22E7F3D60();

  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v20;
}

uint64_t type metadata accessor for PASUISignInViewModel()
{
  return self;
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

uint64_t sub_22E7DA2C8()
{
  return PASFlowStepProxiedAuth.buildView()();
}

id sub_22E7DA330()
{
  uint64_t v0 = sub_22E7F31E0();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    sub_22E7F31C0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610D68);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_22E7F5B70;
    *(void *)(v4 + 56) = MEMORY[0x263F8D310];
    *(void *)(v4 + 64) = sub_22E7B9E14();
    *(void *)(v4 + 32) = v2;
    *(void *)(v4 + 40) = v3;
    sub_22E7F3EB0();
    swift_bridgeObjectRelease();
  }
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
  objc_msgSend(v5, sel_setMinimumLineHeight_, 41.0);
  objc_msgSend(v5, sel_setAlignment_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611800);
  uint64_t inited = swift_initStackObject();
  uint64_t v7 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_22E7F6A30;
  uint64_t v8 = *v7;
  *(void *)(inited + 32) = *v7;
  id v9 = self;
  double v10 = *MEMORY[0x263F81800];
  id v11 = v8;
  id v12 = objc_msgSend(v9, sel_systemFontOfSize_weight_, 34.0, v10);
  uint64_t v13 = sub_22E7C4E80(0, &qword_268611808);
  *(void *)(inited + 40) = v12;
  uint64_t v14 = (void *)*MEMORY[0x263F81540];
  *(void *)(inited + 64) = v13;
  *(void *)(inited + 72) = v14;
  *(void *)(inited + 104) = sub_22E7C4E80(0, &qword_268611818);
  *(void *)(inited + 80) = v5;
  id v15 = v14;
  id v16 = v5;
  sub_22E7C3050(inited);
  id v17 = objc_allocWithZone(MEMORY[0x263F086A0]);
  id v18 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_22E7DCB50();
  unint64_t v19 = (void *)sub_22E7F3E00();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v17, sel_initWithString_attributes_, v18, v19);

  return v20;
}

id sub_22E7DA640()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611800);
  uint64_t inited = swift_initStackObject();
  uint64_t v1 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_22E7F5B70;
  uint64_t v2 = *v1;
  *(void *)(inited + 32) = *v1;
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  id v4 = v2;
  id v38 = v3;
  id v5 = objc_msgSend(v3, sel_systemFontOfSize_, 17.0);
  uint64_t v6 = sub_22E7C4E80(0, &qword_268611808);
  *(void *)(inited + 64) = v6;
  *(void *)(inited + 40) = v5;
  sub_22E7C3050(inited);
  uint64_t v7 = sub_22E7F31E0();
  if (!v8)
  {
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    sub_22E7F3ED0();
    swift_bridgeObjectRelease();
    id v23 = objc_allocWithZone(MEMORY[0x263F089B8]);
    os_log_type_t v24 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_22E7DCB50();
    os_log_type_t v25 = (void *)sub_22E7F3E00();
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend(v23, sel_initWithString_attributes_, v24, v25);

LABEL_11:
    return v26;
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
  uint64_t v37 = v4;
  if (sub_22E7F31C0())
  {
    uint64_t v11 = sub_22E7F31D0();
    if (v12)
    {
      uint64_t v13 = v11;
      uint64_t v14 = v12;
      sub_22E7F4130();
      swift_bridgeObjectRelease();
      sub_22E7F3EF0();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268610D68);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_22E7F6A30;
      uint64_t v16 = MEMORY[0x263F8D310];
      *(void *)(v15 + 56) = MEMORY[0x263F8D310];
      unint64_t v17 = sub_22E7B9E14();
      *(void *)(v15 + 32) = v9;
      *(void *)(v15 + 40) = v10;
      *(void *)(v15 + 96) = v16;
      *(void *)(v15 + 104) = v17;
      *(void *)(v15 + 64) = v17;
      *(void *)(v15 + 72) = v13;
      *(void *)(v15 + 80) = v14;
      swift_bridgeObjectRetain();
      sub_22E7F3EB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v18 = (void *)sub_22E7F3E60();
      unint64_t v19 = (void *)sub_22E7F3E60();
      swift_bridgeObjectRelease();
      id v36 = objc_msgSend(v18, sel_rangeOfString_, v19);
      uint64_t v21 = v20;

      char v22 = 0;
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    sub_22E7F3ED0();
  }
  else
  {
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610D68);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_22E7F5B70;
    *(void *)(v27 + 56) = MEMORY[0x263F8D310];
    *(void *)(v27 + 64) = sub_22E7B9E14();
    *(void *)(v27 + 32) = v9;
    *(void *)(v27 + 40) = v10;
    sub_22E7F3EB0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v36 = 0;
  uint64_t v21 = 0;
  char v22 = 1;
LABEL_9:
  id v28 = objc_allocWithZone(MEMORY[0x263F089B8]);
  uint64_t v29 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_22E7DCB50();
  uint64_t v30 = (void *)sub_22E7F3E00();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(v28, sel_initWithString_attributes_, v29, v30);

  if ((v22 & 1) == 0)
  {
    uint64_t v31 = swift_initStackObject();
    *(_OWORD *)(v31 + 16) = xmmword_22E7F5B70;
    *(void *)(v31 + 32) = v37;
    double v32 = *MEMORY[0x263F81800];
    id v33 = v37;
    id v34 = objc_msgSend(v38, sel_systemFontOfSize_weight_, 17.0, v32);
    *(void *)(v31 + 64) = v6;
    *(void *)(v31 + 40) = v34;
    sub_22E7C3050(v31);
    os_log_type_t v25 = (void *)sub_22E7F3E00();
    swift_bridgeObjectRelease();
    objc_msgSend(v26, sel_addAttributes_range_, v25, v36, v21);
    goto LABEL_11;
  }
  return v26;
}

id PASUISignInViewModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PASUISignInViewModel.init()()
{
}

id PASUISignInViewModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUISignInViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22E7DADCC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v16[1] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686117D0);
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686117D8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone(MEMORY[0x263F25D58]);
  uint64_t v11 = a1;
  id v12 = objc_msgSend(v10, sel_initWithNibName_bundle_, 0, 0);
  unint64_t v17 = v11;
  unint64_t v18 = (unint64_t)v12;
  unint64_t v13 = sub_22E7DCA00();
  sub_22E7F3C00();

  *(void *)id v5 = sub_22E7F3880();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686117E8);
  *(void *)(swift_allocObject() + 16) = v11;
  uint64_t v14 = v11;
  sub_22E7F3D40();
  unint64_t v17 = &type metadata for AAUISignInViewControllerWrapper;
  unint64_t v18 = v13;
  swift_getOpaqueTypeConformance2();
  sub_22E7DCA94();
  sub_22E7F3BC0();
  sub_22E7DCAF0((uint64_t)v5);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22E7DB048(uint64_t result)
{
  id v1 = *(void (**)(uint64_t))(result
                                      + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    return sub_22E7A6ED4((uint64_t)v1);
  }
  return result;
}

uint64_t sub_22E7DB0B0@<X0>(uint64_t a1@<X8>)
{
  sub_22E7F3ED0();
  sub_22E7A9CD0();
  uint64_t result = sub_22E7F3B10();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_22E7DB120@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7DADCC(*v1, a1);
}

void sub_22E7DB128(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x230FA4900](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    objc_msgSend(v2, sel_nextButtonTapped);
  }
}

id sub_22E7DB184(uint64_t a1)
{
  uint64_t v2 = sub_22E7DC05C(a1, *(void *)v1, *(void **)(v1 + 8));
  return v2;
}

uint64_t sub_22E7DB1B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22E7DCD78();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_22E7DB218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22E7DCD78();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_22E7DB27C()
{
}

uint64_t PASUISignInViewModel.signInViewController(_:didCompleteWithAuthenticationResults:)(uint64_t a1, uint64_t a2)
{
  return sub_22E7DC4A8(a2);
}

uint64_t sub_22E7DB2B4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611820);
    uint64_t v2 = sub_22E7F41B0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    unint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_22E7B51C8(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_22E7C4EBC(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_22E7C4EBC(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_22E7C4EBC(v36, v37);
    sub_22E7C4EBC(v37, &v33);
    uint64_t result = sub_22E7F4100();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_22E7C4EBC(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_22E7DCBA8();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id PASUISignInViewModel.authenticationContext()()
{
  void (*v13)(void *__return_ptr, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  void v30[3];
  uint64_t v31;
  uint64_t v32;

  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  long long v29 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - v6;
  uint64_t v8 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v8, v2);
  unint64_t v9 = sub_22E7F3570();
  os_log_type_t v10 = sub_22E7F3FE0();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl(&dword_22E7A0000, v9, v10, "PASUISignInViewModel authenticationContext", v11, 2u);
    MEMORY[0x230FA4830](v11, -1, -1);
  }

  uint64_t v28 = *(void (**)(char *, uint64_t))(v3 + 8);
  v28(v7, v2);
  unint64_t v12 = __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider), *(void *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider + 24));
  int64_t v13 = *(void (**)(void *__return_ptr, uint64_t))(**(void **)(v1
                                                                           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel__viewControllerProvider)
                                                             + 128);
  unint64_t v14 = swift_retain();
  v13(v30, v14);
  swift_release();
  int64_t v15 = v31;
  int64_t v16 = v32;
  __swift_project_boxed_opaque_existential_1(v30, v31);
  unint64_t v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
  uint64_t v18 = *v12;
  uint64_t v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F292A8]), sel_init);
  objc_msgSend(v19, sel_setPresentingViewController_, v17);
  objc_msgSend(v19, sel_setDelegate_, v18);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  uint64_t v20 = v19;
  unint64_t v21 = sub_22E7DA330();
  unint64_t v22 = objc_msgSend(v21, sel_string);

  if (!v22)
  {
    sub_22E7F3E90();
    unint64_t v22 = (id)sub_22E7F3E60();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v20, sel_setTitle_, v22);

  char v23 = v20;
  unint64_t v24 = sub_22E7DA640();
  BOOL v25 = objc_msgSend(v24, sel_string);

  if (!v25)
  {
    sub_22E7F3E90();
    BOOL v25 = (id)sub_22E7F3E60();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v23, sel_setReason_, v25);

  sub_22E7F31F0();
  objc_msgSend(v23, sel_setAuthenticationType_, 2, v27);
  return v23;
}

id sub_22E7DBCC0(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_22E7F3580();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[3] = type metadata accessor for PASUIAppleIDAuthContextProvider();
  v22[4] = &off_26E232D68;
  v22[0] = a2;
  uint64_t v10 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel__viewControllerProvider;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  *(void *)&a3[v10] = sub_22E7F3050();
  unint64_t v11 = &a3[OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction];
  *(void *)unint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  unint64_t v12 = a3;
  uint64_t v13 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  unint64_t v14 = sub_22E7F3570();
  os_log_type_t v15 = sub_22E7F3FE0();
  if (os_log_type_enabled(v14, v15))
  {
    int64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v16 = 0;
    _os_log_impl(&dword_22E7A0000, v14, v15, "PASUISignInViewModel init", v16, 2u);
    MEMORY[0x230FA4830](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(void *)&v12[OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_step] = a1;
  sub_22E7B4230((uint64_t)v22, (uint64_t)&v12[OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider]);
  swift_retain();

  unint64_t v17 = (objc_class *)type metadata accessor for PASUISignInViewModel();
  v21.receiver = v12;
  v21.super_class = v17;
  id v18 = objc_msgSendSuper2(&v21, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return v18;
}

unint64_t sub_22E7DBEDC()
{
  unint64_t result = qword_268611738;
  if (!qword_268611738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611738);
  }
  return result;
}

id sub_22E7DBF30()
{
  id v0 = objc_msgSend(self, sel_tintColor);
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_configurationWithHierarchicalColor_, v0);

  id v3 = objc_msgSend(v1, sel_configurationWithPointSize_, 72.0);
  id v4 = objc_msgSend(v2, sel_configurationByApplyingConfiguration_, v3);
  uint64_t v5 = (void *)sub_22E7F3E60();
  id v6 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v5, v4);

  return v6;
}

void *sub_22E7DC05C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_22E7F3580();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_22E7F3570();
  os_log_type_t v11 = sub_22E7F4010();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v12 = 0;
    _os_log_impl(&dword_22E7A0000, v10, v11, "PASUISignInView makeUIViewController", v12, 2u);
    MEMORY[0x230FA4830](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  objc_msgSend(a3, sel_setAllowsAccountCreation_, 0);
  objc_msgSend(a3, sel_setShowServiceIcons_, 0);
  objc_msgSend(a3, sel_setCanEditUsername_, 0);
  sub_22E7F31D0();
  if (v13)
  {
    unint64_t v14 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v14 = 0;
  }
  objc_msgSend(a3, sel_setUsername_, v14);

  objc_msgSend(a3, sel_setDelegate_, a2);
  os_log_type_t v15 = (void *)sub_22E7F3F10();
  objc_msgSend(a3, sel_setPrivacyLinkIdentifiers_, v15);

  id v16 = sub_22E7DBF30();
  objc_msgSend(a3, sel_setHeaderImage_, v16);

  objc_msgSend(a3, sel_setFooterText_, 0);
  objc_msgSend(a3, sel_setTableViewStyle_, 2);
  id v17 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  objc_msgSend(a3, sel_setCellBackgroundColor_, v17);

  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = (void (**)())(a2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction);
  uint64_t v20 = *(void *)(a2 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction);
  *uint64_t v19 = sub_22E7DCE04;
  v19[1] = (void (*)())v18;
  sub_22E7A6ED4(v20);
  return a3;
}

uint64_t _s23ProximityAppleIDSetupUI20PASUISignInViewModelC04signfG19ControllerDidCancelyySo08AAUISignfgJ0CF_0()
{
  uint64_t v0 = sub_22E7F3580();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F4010();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUISignInViewModel signInViewControllerDidCancel", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22E7DC4A8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_22E7F3570();
  os_log_type_t v10 = sub_22E7F4010();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v2;
    uint64_t v12 = v11;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = v13;
    *(_DWORD *)uint64_t v12 = 141558274;
    uint64_t v23 = 1752392040;
    uint64_t v24 = v13;
    sub_22E7F40C0();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v19 = v12 + 14;
    swift_bridgeObjectRetain();
    uint64_t v20 = v4;
    uint64_t v14 = sub_22E7F3E20();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_22E7B3114(v14, v16, &v24);
    sub_22E7F40C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22E7A0000, v9, v10, "PASUISignInViewModel signInViewController didCompleteWithAuthenticationResults\n%{mask.hash}s", (uint8_t *)v12, 0x16u);
    uint64_t v17 = v21;
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v17, -1, -1);
    MEMORY[0x230FA4830](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_22E7DB2B4(a1);
  sub_22E7F30D0();
  sub_22E7F31B0();
  return swift_bridgeObjectRelease();
}

uint64_t _s23ProximityAppleIDSetupUI20PASUISignInViewModelC27willAuthenticateWithContextyySo023AKAppleIDAuthenticationL0CF_0(void *a1)
{
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  uint64_t v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F3FE0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v2;
    uint64_t v11 = v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v12;
    *(_DWORD *)uint64_t v11 = 141558274;
    uint64_t v22 = 1752392040;
    uint64_t v23 = v12;
    sub_22E7F40C0();
    *(_WORD *)(v11 + 12) = 2080;
    v19[1] = v11 + 14;
    id v13 = objc_msgSend(v7, sel_debugDescription);
    uint64_t v14 = sub_22E7F3E90();
    unint64_t v16 = v15;

    uint64_t v22 = sub_22E7B3114(v14, v16, &v23);
    sub_22E7F40C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22E7A0000, v8, v9, "PASUISignInViewModel willAuthenticateWithContext\n%{mask.hash}s", (uint8_t *)v11, 0x16u);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v17, -1, -1);
    MEMORY[0x230FA4830](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v21);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

ValueMetadata *type metadata accessor for PASUISignInView()
{
  return &type metadata for PASUISignInView;
}

uint64_t sub_22E7DC9E4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22E7DCA00()
{
  unint64_t result = qword_2686117E0;
  if (!qword_2686117E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686117E0);
  }
  return result;
}

uint64_t sub_22E7DCA54()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7DCA8C()
{
  return sub_22E7DB048(*(void *)(v0 + 16));
}

unint64_t sub_22E7DCA94()
{
  unint64_t result = qword_2686117F0;
  if (!qword_2686117F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2686117D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686117F0);
  }
  return result;
}

uint64_t sub_22E7DCAF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686117D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22E7DCB50()
{
  unint64_t result = qword_2686107C0;
  if (!qword_2686107C0)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686107C0);
  }
  return result;
}

uint64_t sub_22E7DCBA8()
{
  return swift_release();
}

void *initializeBufferWithCopyOfBuffer for AAUISignInViewControllerWrapper(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for AAUISignInViewControllerWrapper(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for AAUISignInViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for AAUISignInViewControllerWrapper(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for AAUISignInViewControllerWrapper()
{
  return &type metadata for AAUISignInViewControllerWrapper;
}

uint64_t sub_22E7DCCC8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22E7DCD78()
{
  unint64_t result = qword_268611830;
  if (!qword_268611830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611830);
  }
  return result;
}

uint64_t sub_22E7DCDCC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22E7DCE04()
{
  sub_22E7DB128(v0);
}

uint64_t PASFlowStepTargetStart.buildView()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611840);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)v11 - v6;
  v11[0] = v0;
  unint64_t v8 = sub_22E7DCF88();
  sub_22E7F3C00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetStartView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

unint64_t sub_22E7DCF88()
{
  unint64_t result = qword_268611848;
  if (!qword_268611848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611848);
  }
  return result;
}

uint64_t sub_22E7DCFDC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611840);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)v11 - v6;
  v11[0] = *v0;
  unint64_t v8 = sub_22E7DCF88();
  sub_22E7F3C00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetStartView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

ValueMetadata *type metadata accessor for PASUITargetStartView()
{
  return &type metadata for PASUITargetStartView;
}

uint64_t sub_22E7DD168()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7DD184(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return sub_22E7BA7B0();
  }
  return result;
}

uint64_t sub_22E7DD1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0;
  if (a2)
  {
    if (a4) {
      return sub_22E7BA880();
    }
  }
  return result;
}

void sub_22E7DD1E8(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_22E7DD184;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = sub_22E7DD1A4;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v1;
}

uint64_t PASFlowStepRepairFamily.buildView()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611880);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v12 - v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  uint64_t v8 = sub_22E7F3050();
  uint64_t v12 = v0;
  unint64_t v13 = v8;
  unint64_t v9 = sub_22E7DD3D8();
  sub_22E7F3C00();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  uint64_t v12 = &type metadata for PASUIRepairFamilyView;
  unint64_t v13 = v9;
  swift_getOpaqueTypeConformance2();
  uint64_t v10 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v10;
}

unint64_t sub_22E7DD3D8()
{
  unint64_t result = qword_268611888;
  if (!qword_268611888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268611888);
  }
  return result;
}

uint64_t sub_22E7DD42C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611880);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v13 - v6;
  uint64_t v8 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610D30);
  swift_allocObject();
  uint64_t v9 = sub_22E7F3050();
  unint64_t v13 = v8;
  unint64_t v14 = v9;
  unint64_t v10 = sub_22E7DD3D8();
  sub_22E7F3C00();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  unint64_t v13 = &type metadata for PASUIRepairFamilyView;
  unint64_t v14 = v10;
  swift_getOpaqueTypeConformance2();
  uint64_t v11 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v11;
}

uint64_t destroy for PASUIRepairFamilyView()
{
  swift_release();
  return swift_release();
}

void *_s23ProximityAppleIDSetupUI21PASUIRepairFamilyViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIRepairFamilyView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for PASUIRepairFamilyView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PASUIRepairFamilyView()
{
  return &type metadata for PASUIRepairFamilyView;
}

uint64_t sub_22E7DD6FC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22E7DD718()
{
  qword_268611850 = 0x64497265626D656DLL;
  *(void *)algn_268611858 = 0xE800000000000000;
}

void sub_22E7DD73C()
{
  qword_268611860 = 0x44495344746C61;
  *(void *)algn_268611868 = 0xE700000000000000;
}

void sub_22E7DD760()
{
  qword_268611870 = 0x6574736575716572;
  *(void *)algn_268611878 = 0xE900000000000072;
}

uint64_t sub_22E7DD788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_22E7F3760();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22E7F3FB0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  swift_retain_n();
  swift_retain();
  sub_22E7F3F90();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v9[*(int *)(v7 + 28)], v13, v10);
  *(void *)uint64_t v9 = &unk_268611898;
  *((void *)v9 + 1) = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686106C8);
  sub_22E7A6DF4((uint64_t)v9, a3 + *(int *)(v15 + 36));
  *(void *)a3 = sub_22E7A6BD4;
  *(void *)(a3 + 8) = a1;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = sub_22E7A64F0;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = sub_22E7A6524;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(unsigned char *)(a3 + 80) = 1;
  *(void *)(a3 + 88) = MEMORY[0x263F8EE78];
  sub_22E7A6E58();
  sub_22E7A6E60((uint64_t)sub_22E7A64F0);
  sub_22E7A6E60((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRetain();
  sub_22E7A6E70((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_22E7A6ECC();
  sub_22E7A6ED4((uint64_t)sub_22E7A64F0);
  sub_22E7A6ED4((uint64_t)sub_22E7A6524);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7DDA10(uint64_t a1, uint64_t a2)
{
  v2[2] = sub_22E7F3F80();
  v2[3] = sub_22E7F3F70();
  id v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_22E7B7A94;
  return sub_22E7DDACC(a1, a2);
}

uint64_t sub_22E7DDACC(uint64_t a1, uint64_t a2)
{
  v2[53] = a1;
  v2[54] = a2;
  uint64_t v3 = sub_22E7F3580();
  v2[55] = v3;
  v2[56] = *(void *)(v3 - 8);
  v2[57] = swift_task_alloc();
  v2[58] = swift_task_alloc();
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  sub_22E7F3F80();
  v2[61] = sub_22E7F3F70();
  uint64_t v5 = sub_22E7F3F50();
  v2[62] = v5;
  v2[63] = v4;
  return MEMORY[0x270FA2498](sub_22E7DDBE8, v5, v4);
}

uint64_t sub_22E7DDBE8()
{
  uint64_t v61 = v0;
  uint64_t v1 = v0[60];
  uint64_t v2 = v0[55];
  uint64_t v3 = v0[56];
  uint64_t v4 = sub_22E7F3560();
  v0[64] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[65] = v5;
  v0[66] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_22E7F3570();
  os_log_type_t v7 = sub_22E7F4010();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_22E7A0000, v6, v7, "PASUIRepairFamilyView repairFamilyForServicesSetup", v8, 2u);
    MEMORY[0x230FA4830](v8, -1, -1);
  }
  uint64_t v9 = v0[60];
  uint64_t v10 = v0[55];
  uint64_t v11 = v0[56];

  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[67] = v12;
  v0[68] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v9, v10);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3C050]), sel_initWithEventType_, *MEMORY[0x263F3C040]);
  v0[69] = v13;
  uint64_t v14 = sub_22E7F32D0();
  v0[70] = v14;
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = sub_22E7F32E0();
    if (v17)
    {
      uint64_t v18 = v16;
      uint64_t v19 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686118B0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_22E7F7A20;
      if (qword_268610650 != -1) {
        swift_once();
      }
      uint64_t v21 = *(void *)algn_268611858;
      *(void *)(inited + 32) = qword_268611850;
      *(void *)(inited + 40) = v21;
      *(void *)(inited + 72) = sub_22E7DEDF4();
      *(void *)(inited + 48) = v15;
      uint64_t v22 = qword_268610658;
      swift_bridgeObjectRetain();
      id v23 = v15;
      if (v22 != -1) {
        swift_once();
      }
      uint64_t v24 = *(void *)algn_268611868;
      uint64_t v25 = MEMORY[0x263F8D310];
      *(void *)(inited + 80) = qword_268611860;
      *(void *)(inited + 88) = v24;
      *(void *)(inited + 120) = v25;
      *(void *)(inited + 96) = v18;
      *(void *)(inited + 104) = v19;
      uint64_t v26 = qword_268610660;
      swift_bridgeObjectRetain();
      if (v26 != -1) {
        swift_once();
      }
      uint64_t v28 = v0[53];
      uint64_t v27 = v0[54];
      uint64_t v29 = *(void *)algn_268611878;
      *(void *)(inited + 128) = qword_268611870;
      *(void *)(inited + 136) = v29;
      swift_bridgeObjectRetain();
      long long v30 = *(void **)sub_22E7F30B0();
      type metadata accessor for AKAppleIDAuthenticationAppProvidedContext(0);
      *(void *)(inited + 168) = v31;
      *(void *)(inited + 144) = v30;
      id v32 = v30;
      sub_22E7C318C(inited);
      long long v33 = (void *)sub_22E7F3E00();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setAdditionalParameters_, v33);

      (*(void (**)(void))(*(void *)v27 + 128))();
      uint64_t v35 = v0[46];
      uint64_t v34 = v0[47];
      __swift_project_boxed_opaque_existential_1(v0 + 43, v35);
      id v36 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 16))(v35, v34);
      id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3C058]), sel_initWithPresenter_, v36);
      v0[71] = v37;

      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 43));
      objc_msgSend(v37, sel_setPresentationType_, 1);
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = v28;
      *(void *)(v38 + 24) = v27;
      v0[36] = sub_22E7DEE38;
      v0[37] = v38;
      v0[32] = MEMORY[0x263EF8330];
      v0[33] = 1107296256;
      v0[34] = sub_22E7CC0A8;
      v0[35] = &block_descriptor_6;
      long long v39 = _Block_copy(v0 + 32);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v37, sel_setPresentationHandler_, v39);
      _Block_release(v39);
      v0[2] = v0;
      v0[7] = v0 + 48;
      v0[3] = sub_22E7DE384;
      uint64_t v40 = swift_continuation_init();
      v0[38] = MEMORY[0x263EF8330];
      v0[39] = 0x40000000;
      v0[40] = sub_22E7DECA8;
      v0[41] = &block_descriptor_8;
      v0[42] = v40;
      objc_msgSend(v37, sel_performWithContext_completion_, v13);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
  }
  sub_22E7DEDA0();
  objc_super v41 = (void *)swift_allocError();
  *uint64_t v42 = 1;
  swift_willThrow();

  ((void (*)(void, void, void))v0[65])(v0[57], v0[64], v0[55]);
  id v43 = v41;
  id v44 = v41;
  uint64_t v45 = sub_22E7F3570();
  os_log_type_t v46 = sub_22E7F3FF0();
  BOOL v47 = os_log_type_enabled(v45, v46);
  uint64_t v48 = (void (*)(uint64_t, uint64_t))v0[67];
  uint64_t v49 = v0[57];
  uint64_t v50 = v0[55];
  if (v47)
  {
    uint64_t v59 = (void (*)(uint64_t, uint64_t))v0[67];
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = v50;
    uint64_t v52 = swift_slowAlloc();
    uint64_t v60 = v52;
    *(_DWORD *)uint64_t v51 = 136446210;
    v0[50] = v41;
    id v53 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v54 = sub_22E7F3EA0();
    v0[49] = sub_22E7B3114(v54, v55, &v60);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22E7A0000, v45, v46, "PASUIRepairFamilyView repairFamilyForServicesSetup failed: %{public}s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v52, -1, -1);
    MEMORY[0x230FA4830](v51, -1, -1);

    v59(v49, v58);
  }
  else
  {

    v48(v49, v50);
  }
  os_log_type_t v56 = (void *)swift_task_alloc();
  v0[72] = v56;
  *os_log_type_t v56 = v0;
  v56[1] = sub_22E7DE9A8;
  return MEMORY[0x270F58A18]();
}

uint64_t sub_22E7DE384()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 504);
  uint64_t v2 = *(void *)(*(void *)v0 + 496);
  return MEMORY[0x270FA2498](sub_22E7DE48C, v2, v1);
}

uint64_t sub_22E7DE48C()
{
  uint64_t v44 = v0;
  uint64_t v1 = *(void **)(v0 + 384);
  (*(void (**)(void, void, void))(v0 + 520))(*(void *)(v0 + 472), *(void *)(v0 + 512), *(void *)(v0 + 440));
  uint64_t v2 = v1;
  uint64_t v3 = sub_22E7F3570();
  os_log_type_t v4 = sub_22E7F4010();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    objc_super v41 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 141558274;
    *(void *)(v0 + 408) = 1752392040;
    sub_22E7F40C0();
    *(_WORD *)(v5 + 12) = 2112;
    *(void *)(v0 + 416) = v2;
    uint64_t v6 = v2;
    sub_22E7F40C0();
    *objc_super v41 = v2;

    _os_log_impl(&dword_22E7A0000, v3, v4, "PASUIRepairFamilyView repairFamilyForServicesSetup got response %{mask.hash}@", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v41, -1, -1);
    MEMORY[0x230FA4830](v5, -1, -1);
  }
  else
  {

    uint64_t v3 = v2;
  }
  os_log_type_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
  uint64_t v8 = *(void *)(v0 + 472);
  uint64_t v9 = *(void *)(v0 + 440);

  v7(v8, v9);
  if ([v2 loadSuccess])
  {
    uint64_t v10 = *(void **)(v0 + 568);
    uint64_t v11 = *(void **)(v0 + 560);
    uint64_t v12 = *(void **)(v0 + 552);
  }
  else
  {
    (*(void (**)(void, void, void))(v0 + 520))(*(void *)(v0 + 464), *(void *)(v0 + 512), *(void *)(v0 + 440));
    id v13 = sub_22E7F3570();
    os_log_type_t v14 = sub_22E7F3FF0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_22E7A0000, v13, v14, "PASUIRepairFamilyView repairFamilyForServicesSetup response: load fail", v15, 2u);
      MEMORY[0x230FA4830](v15, -1, -1);
    }
    uint64_t v16 = *(void **)(v0 + 568);
    uint64_t v17 = *(void **)(v0 + 560);
    uint64_t v18 = *(void **)(v0 + 552);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v20 = *(void *)(v0 + 464);
    uint64_t v21 = *(void *)(v0 + 440);

    v19(v20, v21);
    id v22 = [v2 error];
    sub_22E7DEDA0();
    id v23 = (void *)swift_allocError();
    *uint64_t v24 = v22;
    swift_willThrow();

    (*(void (**)(void, void, void))(v0 + 520))(*(void *)(v0 + 456), *(void *)(v0 + 512), *(void *)(v0 + 440));
    id v25 = v23;
    id v26 = v23;
    uint64_t v27 = sub_22E7F3570();
    os_log_type_t v28 = sub_22E7F3FF0();
    BOOL v29 = os_log_type_enabled(v27, v28);
    long long v30 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
    uint64_t v31 = *(void *)(v0 + 456);
    uint64_t v32 = *(void *)(v0 + 440);
    if (v29)
    {
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v0 + 536);
      long long v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = v32;
      uint64_t v34 = swift_slowAlloc();
      uint64_t v43 = v34;
      *(_DWORD *)long long v33 = 136446210;
      *(void *)(v0 + 400) = v23;
      id v35 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
      uint64_t v36 = sub_22E7F3EA0();
      *(void *)(v0 + 392) = sub_22E7B3114(v36, v37, &v43);
      sub_22E7F40C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22E7A0000, v27, v28, "PASUIRepairFamilyView repairFamilyForServicesSetup failed: %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v34, -1, -1);
      MEMORY[0x230FA4830](v33, -1, -1);

      v42(v31, v40);
    }
    else
    {

      v30(v31, v32);
    }
  }
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v0 + 576) = v38;
  *uint64_t v38 = v0;
  v38[1] = sub_22E7DE9A8;
  return MEMORY[0x270F58A18]();
}

uint64_t sub_22E7DE9A8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 504);
  uint64_t v3 = *(void *)(v1 + 496);
  return MEMORY[0x270FA2498](sub_22E7DEAC8, v3, v2);
}

uint64_t sub_22E7DEAC8()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22E7DEB58()
{
  uint64_t v0 = sub_22E7F3580();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_22E7F3570();
  os_log_type_t v6 = sub_22E7F4010();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_22E7A0000, v5, v6, "PASUIRepairFamilyView familyCirclePresentationHandler", v7, 2u);
    MEMORY[0x230FA4830](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22E7DECA8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;
  return MEMORY[0x270FA2400](v2);
}

uint64_t sub_22E7DECFC@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7DD788(*v1, v1[1], a1);
}

uint64_t sub_22E7DED08()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_22E7A6D00;
  return sub_22E7DDA10(v2, v3);
}

unint64_t sub_22E7DEDA0()
{
  unint64_t result = qword_2686118A8;
  if (!qword_2686118A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686118A8);
  }
  return result;
}

unint64_t sub_22E7DEDF4()
{
  unint64_t result = qword_2686118B8;
  if (!qword_2686118B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2686118B8);
  }
  return result;
}

uint64_t sub_22E7DEE38()
{
  return sub_22E7DEB58();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_22E7DEE58(uint64_t (*a1)(void))
{
  return a1();
}

void sub_22E7DEE80(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_22E7F40C0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void sub_22E7DEF3C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_22E7DEFA8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_22E7F2F50();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id sub_22E7DF154()
{
  uint64_t v1 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController);
  }
  else
  {
    id v4 = sub_22E7DF1B8(v0);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_22E7DF1B8(uint64_t a1)
{
  uint64_t v2 = sub_22E7F3010();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_22E7F3040();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686119A8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E68]), sel_init);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_identity, v3);
  swift_bridgeObjectRetain();
  sub_22E7F3020();
  sub_22E7F4080();
  uint64_t v11 = sub_22E7F4090();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  sub_22E7F40A0();
  objc_msgSend(v10, sel_setDelegate_, a1);
  return v10;
}

void *sub_22E7DF3D4()
{
  uint64_t v1 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy))
  {
    uint64_t v2 = *(void **)(v0
                    + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy);
  }
  else
  {
    type metadata accessor for WeakHostWrapper();
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    type metadata accessor for PASUIExtensionProxy();
    uint64_t v2 = (void *)swift_allocObject();
    v2[2] = 0;
    v2[5] = 0;
    swift_unknownObjectWeakInit();
    v2[3] = v3;
    v2[5] = &off_26E233548;
    swift_unknownObjectWeakAssign();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

void sub_22E7DF4A0(void *a1, void *a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_22E7F3580();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v14 = (char *)v39 - v13;
  uint64_t v15 = OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished;
  int v16 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished);
  uint64_t v17 = sub_22E7F3560();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  if (v16 == 1)
  {
    v18(v14, v17, v8);
    char v19 = a3 & 1;
    sub_22E7E17D0(a1, a2, a3 & 1);
    sub_22E7E17D0(a1, a2, a3 & 1);
    uint64_t v20 = sub_22E7F3570();
    os_log_type_t v21 = sub_22E7F3FF0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v47 = v43;
      *(_DWORD *)uint64_t v22 = 141558274;
      uint64_t v44 = 1752392040;
      sub_22E7F40C0();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v44 = (uint64_t)a1;
      uint64_t v45 = a2;
      char v46 = v19;
      sub_22E7E17D0(a1, a2, v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686119A0);
      uint64_t v23 = sub_22E7F3EA0();
      uint64_t v42 = v8;
      uint64_t v44 = sub_22E7B3114(v23, v24, &v47);
      sub_22E7F40C0();
      swift_bridgeObjectRelease();
      sub_22E7E181C(a1, a2, v19);
      sub_22E7E181C(a1, a2, v19);
      _os_log_impl(&dword_22E7A0000, v20, v21, "PASUIHostViewController finish with result is discarding result %{mask.hash}s", (uint8_t *)v22, 0x16u);
      uint64_t v25 = v43;
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v25, -1, -1);
      MEMORY[0x230FA4830](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v42);
    }
    else
    {
      sub_22E7E181C(a1, a2, v19);
      sub_22E7E181C(a1, a2, v19);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }
  else
  {
    v18(v12, v17, v8);
    LODWORD(v43) = a3;
    char v26 = a3 & 1;
    sub_22E7E17D0(a1, a2, v26);
    sub_22E7E17D0(a1, a2, v26);
    uint64_t v27 = sub_22E7F3570();
    os_log_type_t v28 = sub_22E7F3FD0();
    int v29 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v42 = v8;
      uint64_t v31 = v30;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v47 = v41;
      *(_DWORD *)uint64_t v31 = 141558274;
      uint64_t v44 = 1752392040;
      sub_22E7F40C0();
      *(_WORD *)(v31 + 12) = 2080;
      v39[1] = v31 + 14;
      uint64_t v44 = (uint64_t)a1;
      uint64_t v45 = a2;
      char v46 = v26;
      sub_22E7E17D0(a1, a2, v26);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2686119A0);
      uint64_t v32 = sub_22E7F3EA0();
      int v40 = v29;
      uint64_t v44 = sub_22E7B3114(v32, v33, &v47);
      sub_22E7F40C0();
      swift_bridgeObjectRelease();
      sub_22E7E181C(a1, a2, v26);
      sub_22E7E181C(a1, a2, v26);
      _os_log_impl(&dword_22E7A0000, v27, (os_log_type_t)v40, "PASUIHostViewController finish with result: %{mask.hash}s", (uint8_t *)v31, 0x16u);
      uint64_t v34 = v41;
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v34, -1, -1);
      MEMORY[0x230FA4830](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v42);
    }
    else
    {
      sub_22E7E181C(a1, a2, v26);
      sub_22E7E181C(a1, a2, v26);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    char v35 = v43;
    *(unsigned char *)(v4 + v15) = 1;
    uint64_t v36 = MEMORY[0x230FA4900](v4 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate);
    if (v35)
    {
      if (v36)
      {
        sub_22E7E17D0(a1, a2, 1);
        sub_22E7C6970(a1);
        swift_unknownObjectRelease();
        sub_22E7E181C(a1, a2, 1);
      }
    }
    else if (v36)
    {
      id v37 = a1;
      id v38 = a2;
      sub_22E7C6624(v37, v38);

      swift_unknownObjectRelease();
    }
  }
}

id sub_22E7DFA68()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUIExtensionHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22E7DFB54()
{
  return type metadata accessor for PASUIExtensionHostViewController();
}

uint64_t type metadata accessor for PASUIExtensionHostViewController()
{
  uint64_t result = qword_2686118F0;
  if (!qword_2686118F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22E7DFBA8()
{
  uint64_t result = sub_22E7F3040();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_22E7DFC60(void *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  uint64_t v9 = &selRef_hostViewControllerWillDeactivate_error_;
  id result = objc_msgSend(v8, sel_isMainThread);
  if (result)
  {
    uint64_t v11 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
    uint64_t v12 = a1;
    uint64_t v13 = sub_22E7F3570();
    os_log_type_t v14 = sub_22E7F3FD0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v27 = v2;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v25 = v8;
      int v16 = (uint8_t *)v15;
      unint64_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)int v16 = 138543362;
      os_log_type_t v28 = v12;
      uint64_t v17 = v12;
      uint64_t v26 = v4;
      uint64_t v18 = v17;
      uint64_t v9 = &selRef_hostViewControllerWillDeactivate_error_;
      objc_super v2 = v27;
      sub_22E7F40C0();
      char v19 = v24;
      *unint64_t v24 = v12;

      uint64_t v4 = v26;
      _os_log_impl(&dword_22E7A0000, v13, v14, "PASUIExtensionHostViewController hostViewControllerDidActivate: %{public}@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v19, -1, -1);
      uint64_t v20 = v16;
      uint64_t v8 = v25;
      MEMORY[0x230FA4830](v20, -1, -1);
    }
    else
    {

      uint64_t v13 = v12;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    id result = [v8 v9[92]];
    if (result)
    {
      id v21 = v2;
      uint64_t v22 = sub_22E7DF3D4();
      sub_22E7C8E70((uint64_t)v22);

      return (id)swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_22E7DFFCC()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = sub_22E7DF154();
  v5[0] = 0;
  id v1 = objc_msgSend(v0, sel_makeXPCConnectionWithError_, v5);

  if (v1)
  {
    id v2 = v5[0];
  }
  else
  {
    id v3 = v5[0];
    sub_22E7F2F60();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_22E7E0090(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_22E7F3DD0();
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_22E7F3DF0();
  uint64_t v11 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7B63A4();
  uint64_t v23 = sub_22E7F4050();
  os_log_type_t v14 = (void *)swift_allocObject();
  void v14[2] = a1;
  void v14[3] = a2;
  void v14[4] = a3;
  v14[5] = a4;
  uint64_t v15 = v22;
  void v14[6] = v22;
  aBlock[4] = sub_22E7E17C0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22E7CC0A8;
  aBlock[3] = &block_descriptor_49;
  int v16 = _Block_copy(aBlock);
  id v17 = a1;
  id v18 = a2;
  swift_retain();
  id v19 = v15;
  swift_release();
  sub_22E7F3DE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22E7C9348();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611980);
  sub_22E7C93A0();
  sub_22E7F40F0();
  uint64_t v20 = (void *)v23;
  MEMORY[0x230FA3E60](0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v24);
}

void sub_22E7E033C(void *a1, void *a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v10 = sub_22E7F3580();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_22E7F3560();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v37 = v10;
  v15(v13, v14, v10);
  id v16 = a1;
  id v17 = a2;
  id v18 = (char *)v16;
  id v19 = v17;
  uint64_t v20 = sub_22E7F3570();
  int v21 = sub_22E7F3FD0();
  if (os_log_type_enabled(v20, (os_log_type_t)v21))
  {
    int v31 = v21;
    os_log_t v32 = v20;
    uint64_t v34 = a4;
    char v35 = a3;
    uint64_t v36 = a5;
    uint64_t v22 = swift_slowAlloc();
    unint64_t v33 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 141558530;
    uint64_t v38 = 1752392040;
    sub_22E7F40C0();
    *(_WORD *)(v22 + 12) = 2112;
    uint64_t v23 = &v18[*MEMORY[0x263F624D0]];
    uint64_t v24 = *((void *)v23 + 1);
    if (v24)
    {
      uint64_t v25 = *(void *)v23;
      sub_22E7BE0C8();
      swift_allocError();
      void *v26 = v25;
      v26[1] = v24;
      swift_bridgeObjectRetain();
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v38 = v24;
    }
    else
    {
      uint64_t v38 = 0;
    }
    sub_22E7F40C0();
    uint64_t v27 = v33;
    *unint64_t v33 = v24;

    *(_WORD *)(v22 + 22) = 2114;
    uint64_t v38 = (uint64_t)v19;
    id v28 = v19;
    sub_22E7F40C0();
    v27[1] = v19;

    os_log_t v29 = v32;
    _os_log_impl(&dword_22E7A0000, v32, (os_log_type_t)v31, "PASUIExtensionHostViewController extensionDidFinish with account: %{mask.hash}@, context: %{public}@", (uint8_t *)v22, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v27, -1, -1);
    MEMORY[0x230FA4830](v22, -1, -1);

    a3 = v35;
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v37);
  a3(0);
  sub_22E7DF4A0(v18, v19, 0);
}

uint64_t sub_22E7E0760(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_22E7F3DD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_22E7F3DF0();
  uint64_t v9 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7B63A4();
  uint64_t v12 = (void *)sub_22E7F4050();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v2;
  void v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_22E7E1764;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22E7CC0A8;
  aBlock[3] = &block_descriptor_39;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v2;
  swift_retain();
  swift_release();
  sub_22E7F3DE0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22E7C9348();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611980);
  sub_22E7C93A0();
  sub_22E7F40F0();
  MEMORY[0x230FA3E60](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_22E7E09F0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_22E7F3570();
  os_log_type_t v10 = sub_22E7F3FD0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_22E7A0000, v9, v10, "PASUIExtensionHostViewController promptForFlowCancel", v11, 2u);
    MEMORY[0x230FA4830](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (MEMORY[0x230FA4900](a1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate))
  {
    sub_22E7C6BB0();
    swift_unknownObjectRelease();
  }
  return a2(0);
}

uint64_t sub_22E7E0C1C()
{
  return 1;
}

uint64_t sub_22E7E0C24()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7E0C68()
{
  return sub_22E7F42B0();
}

uint64_t sub_22E7E0C90()
{
  return sub_22E7F42C0();
}

uint64_t sub_22E7E0DD4()
{
  sub_22E7B4FDC(v0 + 16);
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for WeakHostWrapper()
{
  return self;
}

uint64_t sub_22E7E0E30(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

uint64_t sub_22E7E0E60(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

id sub_22E7E0E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (objc_class *)type metadata accessor for PASUIExtensionHostViewController();
  uint64_t v7 = objc_allocWithZone(v6);
  v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished] = 0;
  *(void *)&v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController] = 0;
  *(void *)&v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy] = 0;
  uint64_t v8 = &v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_identity];
  uint64_t v9 = sub_22E7F3040();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  uint64_t v11 = &v7[OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_sceneID];
  *uint64_t v11 = a2;
  v11[1] = a3;
  v14.receiver = v7;
  v14.super_class = v6;
  id v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, 0, 0);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v12;
}

void sub_22E7E0FE0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v28 - v9;
  if (objc_msgSend(self, sel_isMainThread))
  {
    if (a1)
    {
      id v11 = a1;
      uint64_t v12 = sub_22E7F3560();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v12, v4);
      id v13 = a1;
      id v14 = a1;
      id v15 = sub_22E7F3570();
      os_log_type_t v16 = sub_22E7F3FF0();
      if (os_log_type_enabled(v15, v16))
      {
        v28[1] = v2;
        uint64_t v17 = swift_slowAlloc();
        uint64_t v29 = v4;
        uint64_t v18 = (uint8_t *)v17;
        id v19 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 138543362;
        id v20 = a1;
        uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v30 = v21;
        sub_22E7F40C0();
        *id v19 = v21;

        _os_log_impl(&dword_22E7A0000, v15, v16, "PASUIExtensionHostViewController hostViewControllerWillDeactivate error: %{public}@", v18, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
        swift_arrayDestroy();
        MEMORY[0x230FA4830](v19, -1, -1);
        uint64_t v22 = v18;
        uint64_t v4 = v29;
        MEMORY[0x230FA4830](v22, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      id v27 = a1;
      sub_22E7DF4A0(a1, 0, 1);
    }
    else
    {
      uint64_t v23 = sub_22E7F3560();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v23, v4);
      uint64_t v24 = sub_22E7F3570();
      uint64_t v25 = sub_22E7F3FD0();
      if (os_log_type_enabled(v24, (os_log_type_t)v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl(&dword_22E7A0000, v24, (os_log_type_t)v25, "PASUIExtensionHostViewController hostViewControllerWillDeactivate", v26, 2u);
        MEMORY[0x230FA4830](v26, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22E7E133C(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  uint64_t v9 = MEMORY[0x230FA4900](a3 + 16);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    v15[4] = sub_22E7BE230;
    v15[5] = v8;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 1107296256;
    _OWORD v15[2] = sub_22E7DEF3C;
    _OWORD v15[3] = &block_descriptor_29;
    id v11 = _Block_copy(v15);
    _Block_copy(a4);
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_extensionDidFinishWith_context_completion_, a1, a2, v11);
    _Block_release(v11);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_22E7E16B8();
    id v13 = (void *)swift_allocError();
    _Block_copy(a4);
    id v14 = (void *)sub_22E7F2F50();
    ((void (**)(void, void *))a4)[2](a4, v14);

    return swift_release();
  }
}

uint64_t sub_22E7E14EC(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  uint64_t v5 = MEMORY[0x230FA4900](a1 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v11[4] = sub_22E7BE1FC;
    v11[5] = v4;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    void v11[2] = sub_22E7DEF3C;
    void v11[3] = &block_descriptor_7;
    uint64_t v7 = _Block_copy(v11);
    _Block_copy(a2);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_promptForFlowCancelWithCompletion_, v7);
    _Block_release(v7);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_22E7E16B8();
    uint64_t v9 = (void *)swift_allocError();
    _Block_copy(a2);
    uint64_t v10 = (void *)sub_22E7F2F50();
    ((void (**)(void, void *))a2)[2](a2, v10);

    return swift_release();
  }
}

uint64_t sub_22E7E1680()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_22E7E16B8()
{
  unint64_t result = qword_268611968;
  if (!qword_268611968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611968);
  }
  return result;
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_22E7E1724()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7E1764()
{
  return sub_22E7E09F0(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24));
}

uint64_t sub_22E7E1770()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_22E7E17C0()
{
  sub_22E7E033C(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

id sub_22E7E17D0(void *a1, void *a2, char a3)
{
  if (a3)
  {
  }
  else
  {
    id v5 = a1;
    a1 = a2;
  }
  return a1;
}

void sub_22E7E181C(void *a1, void *a2, char a3)
{
  if (a3)
  {
  }
  else
  {

    a1 = a2;
  }
}

uint64_t getEnumTagSinglePayload for WeakHostWrapper.WeakHostWrapperError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for WeakHostWrapper.WeakHostWrapperError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x22E7E1958);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22E7E1980()
{
  return 0;
}

ValueMetadata *type metadata accessor for WeakHostWrapper.WeakHostWrapperError()
{
  return &type metadata for WeakHostWrapper.WeakHostWrapperError;
}

unint64_t sub_22E7E199C()
{
  unint64_t result = qword_2686119B0;
  if (!qword_2686119B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2686119B0);
  }
  return result;
}

uint64_t *PASUIConstants.extensionDefaultSceneID.unsafeMutableAddressor()
{
  if (qword_268610668 != -1) {
    swift_once();
  }
  return &static PASUIConstants.extensionDefaultSceneID;
}

void sub_22E7E1A60()
{
  static PASUIConstants.extensionDefaultSceneID = 0x746C7561666564;
  unk_268614C20 = 0xE700000000000000;
}

uint64_t static PASUIConstants.extensionDefaultSceneID.getter()
{
  if (qword_268610668 != -1) {
    swift_once();
  }
  uint64_t v0 = static PASUIConstants.extensionDefaultSceneID;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for PASUIConstants()
{
  return &type metadata for PASUIConstants;
}

id sub_22E7E1AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v20)(void *__return_ptr, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  void (*v31)(void *__return_ptr, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t *v37;
  uint8_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void v44[3];
  uint64_t v45;
  uint64_t v46;

  uint64_t v5 = v4;
  uint64_t v8 = sub_22E7F3580();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F34A18]), sel_initWithCDPContext_, a3);
  id v13 = (void *)sub_22E7F3E60();
  objc_msgSend(v12, sel_setFeatureName_, v13);

  if (*(unsigned char *)(v4 + 24)) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 0;
  }
  objc_msgSend(v12, sel_setDeviceToDeviceEncryptionUpgradeUIStyle_, v14);
  objc_msgSend(v12, sel_setDeviceToDeviceEncryptionUpgradeType_, 0);
  uint64_t v15 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v15, v8);
  swift_retain_n();
  os_log_type_t v16 = sub_22E7F3570();
  os_log_type_t v17 = sub_22E7F3FE0();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    int v40 = v18;
    id v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v43 = v39;
    uint64_t v41 = v8;
    *(_DWORD *)id v19 = 136446210;
    uint64_t v37 = v19 + 4;
    uint64_t v38 = v19;
    id v20 = *(void (**)(void *__return_ptr, uint64_t))(**(void **)(v5 + 16) + 128);
    uint64_t v42 = a4;
    uint64_t v21 = swift_retain();
    v20(v44, v21);
    swift_release();
    uint64_t v22 = v45;
    uint64_t v23 = v46;
    __swift_project_boxed_opaque_existential_1(v44, v45);
    uint64_t v24 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23);
    uint64_t v25 = objc_msgSend(v24, sel_description);
    uint64_t v26 = sub_22E7F3E90();
    id v28 = v27;

    a4 = v42;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    v44[0] = sub_22E7B3114(v26, v28, &v43);
    sub_22E7F40C0();
    swift_release_n();
    swift_bridgeObjectRelease();
    uint64_t v29 = v38;
    _os_log_impl(&dword_22E7A0000, v16, (os_log_type_t)v40, "Passing view controller from PASUIManateeRepairHelperProvider: %{public}s", v38, 0xCu);
    uint64_t v30 = v39;
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v30, -1, -1);
    MEMORY[0x230FA4830](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v41);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  int v31 = *(void (**)(void *__return_ptr, uint64_t))(**(void **)(v5 + 16) + 128);
  os_log_t v32 = swift_retain();
  v31(v44, v32);
  swift_release();
  unint64_t v33 = v45;
  uint64_t v34 = v46;
  __swift_project_boxed_opaque_existential_1(v44, v45);
  char v35 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34);
  objc_msgSend(v12, sel_setPresentingViewController_, v35);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  objc_msgSend(v12, sel_setSecurityUpgradeContext_, a4);
  return v12;
}

void PASUIManateeRepairHelperProvider.helper(withFeatureName:cdpContext:securityUpgradeContext:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  id v6 = sub_22E7E1AFC(a1, a2, a3, a4);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F34A20]), sel_initWithContext_, v6);
  a5[3] = sub_22E7E1F84();
  a5[4] = &protocol witness table for CDPUIDeviceToDeviceEncryptionHelper;

  *a5 = v7;
}

unint64_t sub_22E7E1F84()
{
  unint64_t result = qword_2686119C0;
  if (!qword_2686119C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2686119C0);
  }
  return result;
}

uint64_t PASUIManateeRepairHelperProvider.deinit()
{
  swift_release();
  return v0;
}

uint64_t PASUIManateeRepairHelperProvider.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 25, 7);
}

void sub_22E7E201C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  id v6 = sub_22E7E1AFC(a1, a2, a3, a4);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F34A20]), sel_initWithContext_, v6);
  a5[3] = sub_22E7E1F84();
  a5[4] = &protocol witness table for CDPUIDeviceToDeviceEncryptionHelper;

  *a5 = v7;
}

uint64_t sub_22E7E208C()
{
  int v2 = *v0;
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_22E7E2188;
  uint64_t v3 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_22E7E22C8;
  v1[13] = &block_descriptor_0;
  v1[14] = v3;
  objc_msgSend(v2, sel_performDeviceToDeviceEncryptionStateRepairWithCompletion_, v1 + 10);
  return MEMORY[0x270FA23F0](v1 + 2);
}

uint64_t sub_22E7E2188()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48))
  {
    swift_willThrow();
    int v2 = *(uint64_t (**)(uint64_t))(v1 + 8);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = *(unsigned __int8 *)(*v0 + 120);
    int v2 = *(uint64_t (**)(uint64_t))(v1 + 8);
  }
  return v2(v3);
}

uint64_t type metadata accessor for PASUIManateeRepairHelperProvider()
{
  return self;
}

uint64_t sub_22E7E22C8(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268610960);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

void sub_22E7E237C(void *a1)
{
  void (*v20)(id *__return_ptr, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t ObjectType;
  void (*v24)(id *__return_ptr, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  char *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;

  uint64_t v41 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B00);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B08);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B10);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  uint64_t v43 = v9;
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B18);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v44 = v12;
  uint64_t v45 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A00);
  uint64_t v17 = *(void *)(v16 - 8);
  char v46 = v16;
  uint64_t v47 = v17;
  MEMORY[0x270FA5388](v16);
  int v40 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7F3ED0();
  id v19 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setTitle_, v19);

  id v20 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v1 + 16) + 128);
  uint64_t v21 = swift_retain();
  v20(&v48, v21);
  swift_release();
  uint64_t v22 = v49;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v22 + 40))(ObjectType, v22);
  swift_unknownObjectRelease();
  uint64_t v24 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v1 + 16) + 128);
  uint64_t v25 = swift_retain();
  v24(&v48, v25);
  swift_release();
  uint64_t v26 = v49;
  id v27 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v26 + 56))(v27, v26);
  swift_unknownObjectRelease();
  sub_22E7B6540(&qword_268610B20, &qword_268610B08);
  sub_22E7F3590();
  sub_22E7C4E80(0, (unint64_t *)&qword_268611970);
  uint64_t v48 = (id)sub_22E7F4050();
  id v28 = sub_22E7F4030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v5, 1, 1, v28);
  sub_22E7B6540(&qword_268610B28, &qword_268610B10);
  sub_22E7B63E4();
  uint64_t v29 = v42;
  sub_22E7F3620();
  sub_22E7A7224((uint64_t)v5, &qword_268610B00);

  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v29);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611A08);
  sub_22E7B6540(&qword_268610B38, &qword_268610B18);
  uint64_t v30 = v40;
  int v31 = v44;
  sub_22E7F3610();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v31);
  swift_getKeyPath();
  os_log_t v32 = v41;
  uint64_t v48 = v41;
  sub_22E7B6540(&qword_268611A10, &qword_268611A00);
  unint64_t v33 = v46;
  sub_22E7F3640();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v33);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  sub_22E7F3ED0();
  uint64_t v34 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  sub_22E7F3ED0();
  char v35 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  sub_22E7F3ED0();
  uint64_t v36 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  sub_22E7F3ED0();
  uint64_t v37 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  uint64_t v38 = objc_msgSend(v32, sel_dismissalConfirmationActionWithTitle_message_confirmButtonTitle_cancelButtonTitle_, v34, v35, v36, v37);

  objc_msgSend(v32, sel_setDismissButtonAction_, v38);
}

uint64_t sub_22E7E2AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0;
  if (a4 && a2)
  {
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    sub_22E7F3EF0();
    sub_22E7F3EF0();
    uint64_t v4 = sub_22E7F3ED0();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_22E7E2B94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = a1 + 40;
  sub_22E7B6584(a1, (uint64_t)v26);
  sub_22E7B6584(v6, (uint64_t)v27);
  sub_22E7E3C5C((uint64_t)v26, (uint64_t)v28);
  uint64_t v7 = v29;
  if (v29)
  {
    uint64_t v8 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v8 + 8))(v23, v7, v8);
    uint64_t v9 = v24;
    uint64_t v10 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    uint64_t v7 = v12;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    sub_22E7A7224((uint64_t)v27, (uint64_t *)&unk_268610B40);
  }
  else
  {
    sub_22E7A7224((uint64_t)v27, (uint64_t *)&unk_268610B40);
    sub_22E7A7224((uint64_t)v28, (uint64_t *)&unk_268610B40);
    uint64_t v11 = 0;
  }
  sub_22E7B6584(a1, (uint64_t)v26);
  sub_22E7B6584(v6, (uint64_t)v27);
  sub_22E7E3C5C((uint64_t)v27, (uint64_t)v28);
  uint64_t v13 = v29;
  if (v29)
  {
    uint64_t v14 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v14 + 8))(v23, v13, v14);
    uint64_t v15 = v24;
    uint64_t v16 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    uint64_t v13 = v18;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    sub_22E7A7224((uint64_t)v26, (uint64_t *)&unk_268610B40);
  }
  else
  {
    sub_22E7A7224((uint64_t)v26, (uint64_t *)&unk_268610B40);
    sub_22E7A7224((uint64_t)v28, (uint64_t *)&unk_268610B40);
    uint64_t v17 = 0;
  }
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a2 + 152))(v11, v7, v17, v13);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v19;
  a3[1] = v21;
  return result;
}

void sub_22E7E2E00(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_subtitle);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_22E7F3E90();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_22E7E2E68(uint64_t a1, void **a2)
{
  int v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_22E7F3E60();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setSubtitle_);
}

uint64_t sub_22E7E2ED8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_22E7E2F00(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22E7E2F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22E7F3FB0();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = 0;
  void v14[3] = 0;
  void v14[4] = a2;
  v14[5] = a3;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  swift_retain();
  if (a2 == 1)
  {
    sub_22E7A7224((uint64_t)v11, &qword_268610CF0);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    sub_22E7F3FA0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
    if (v14[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v15 = sub_22E7F3F50();
      uint64_t v16 = v17;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
    }
  }
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a6;
  *(void *)(v18 + 24) = v14;
  if (v16 | v15)
  {
    v20[0] = 0;
    v20[1] = 0;
    _OWORD v20[2] = v15;
    _OWORD v20[3] = v16;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_22E7E31A4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for PASUIProxCardAdapterBase()
{
  return self;
}

uint64_t sub_22E7E3208()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

void sub_22E7E324C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_22E7F3ED0();
  sub_22E7F3ED0();
  uint64_t v8 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v8, v9, 1);

  sub_22E7F3ED0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  swift_retain();
  uint64_t v12 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_22E7E35D8;
  uint64_t v27 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  uint64_t v24 = sub_22E7E2F00;
  uint64_t v25 = &block_descriptor_8;
  uint64_t v13 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v14 = self;
  id v15 = objc_msgSend(v14, sel_actionWithTitle_style_handler_, v12, 1, v13);
  _Block_release(v13);

  objc_msgSend(v10, sel_addAction_, v15);
  sub_22E7F3ED0();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  swift_retain();
  uint64_t v17 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_22E7E3644;
  uint64_t v27 = v16;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  uint64_t v24 = sub_22E7E2F00;
  uint64_t v25 = &block_descriptor_15;
  uint64_t v18 = _Block_copy(&aBlock);
  swift_release();
  id v19 = objc_msgSend(v14, sel_actionWithTitle_style_handler_, v17, 2, v18);
  _Block_release(v18);

  objc_msgSend(v10, sel_addAction_, v19);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v10, 1, 0);
}

uint64_t sub_22E7E35A0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7E35D8(uint64_t a1)
{
  return sub_22E7E2F68(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_26E2338C8, (uint64_t)&unk_26E2338F0, (uint64_t)&unk_2686119F0);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_22E7E3644(uint64_t a1)
{
  return sub_22E7E2F68(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)&unk_26E233878, (uint64_t)&unk_26E2338A0, (uint64_t)&unk_2686119D8);
}

uint64_t sub_22E7E369C()
{
  uint64_t v2 = *(int **)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7A6D00;
  uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  id v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *id v4 = v3;
  v4[1] = sub_22E7A7F00;
  return v6();
}

uint64_t sub_22E7E37B8()
{
  uint64_t v2 = *(int **)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22E7A7F00;
  uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  id v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *id v4 = v3;
  v4[1] = sub_22E7A7F00;
  return v6();
}

void sub_22E7E38D0(void *a1, uint64_t a2, void *a3)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, a2);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v5, sel_setContentMode_, 1);
  if (a3) {
    id v6 = a3;
  }
  else {
    id v6 = objc_msgSend(self, sel_systemBlueColor);
  }
  id v7 = a3;
  objc_msgSend(v5, sel_setTintColor_, v6);

  objc_msgSend(objc_msgSend(a1, sel_mainView), sel_addSubview_, v5);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(objc_msgSend(a1, sel_mainView), sel_mainContentGuide);
  swift_unknownObjectRelease();
  uint64_t v9 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611E10);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_22E7F5E10;
  id v11 = objc_msgSend(v5, sel_topAnchor);
  id v12 = objc_msgSend(v8, sel_topAnchor);
  id v13 = objc_msgSend(v11, sel_constraintGreaterThanOrEqualToAnchor_, v12);

  *(void *)(v10 + 32) = v13;
  id v14 = objc_msgSend(v5, sel_bottomAnchor);
  id v15 = objc_msgSend(v8, sel_bottomAnchor);
  id v16 = objc_msgSend(v14, sel_constraintLessThanOrEqualToAnchor_, v15);

  *(void *)(v10 + 40) = v16;
  id v17 = objc_msgSend(v5, sel_centerXAnchor);
  id v18 = objc_msgSend(v8, sel_centerXAnchor);
  id v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v18);

  *(void *)(v10 + 48) = v19;
  id v20 = objc_msgSend(v5, sel_centerYAnchor);
  id v21 = objc_msgSend(v8, sel_centerYAnchor);
  id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

  *(void *)(v10 + 56) = v22;
  sub_22E7F3F40();
  sub_22E7C4E80(0, (unint64_t *)&qword_268610AF8);
  id v23 = (id)sub_22E7F3F10();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_activateConstraints_, v23);
}

uint64_t sub_22E7E3C40@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22E7E2B94(a1, v2, a2);
}

char *keypath_get_selector_subtitle()
{
  return sel_subtitle;
}

uint64_t sub_22E7E3C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E7E3CD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PASUIFamilyPickerProxCardAdapter();
  swift_allocObject();
  uint64_t v3 = swift_retain();
  uint64_t v4 = sub_22E7E8DBC(v3);
  uint64_t result = swift_release();
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = &off_26E2337B8;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_22E7E3D48()
{
  return sub_22E7F3D60();
}

void sub_22E7E3E18(void *a1)
{
  void (*v29)(id *__return_ptr, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t ObjectType;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint8_t *v52;
  char *v53;
  uint64_t v54;
  void *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id aBlock;
  uint64_t v74;
  void (*v75)(uint64_t, void *);
  void *v76;
  uint64_t (*v77)(uint64_t);
  uint64_t v78;

  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610E00);
  v69 = *(void *)(v2 - 8);
  long long v70 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v68 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A48);
  uint64_t v66 = *(void *)(v4 - 8);
  uint64_t v67 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v65 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B00);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A50);
  MEMORY[0x270FA5388](v59);
  uint64_t v58 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B08);
  MEMORY[0x270FA5388](v57);
  os_log_type_t v56 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A58);
  uint64_t v61 = *(void *)(v11 - 8);
  uint64_t v62 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v60 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A60);
  uint64_t v64 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v63 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22E7F3580();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v19, v15);
  swift_unknownObjectRetain_n();
  id v20 = sub_22E7F3570();
  os_log_type_t v21 = sub_22E7F3FE0();
  if (os_log_type_enabled(v20, v21))
  {
    id v53 = v8;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v54 = v13;
    id v23 = (uint8_t *)v22;
    uint64_t v24 = (void *)swift_slowAlloc();
    v72 = (uint64_t)a1;
    uint64_t aBlock = v24;
    *(_DWORD *)id v23 = 136446210;
    uint64_t v52 = v23 + 4;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268611A88);
    uint64_t v25 = sub_22E7F3EA0();
    v72 = sub_22E7B3114(v25, v26, (uint64_t *)&aBlock);
    sub_22E7F40C0();
    swift_unknownObjectRelease_n();
    id v8 = v53;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22E7A0000, v20, v21, "PASUIFamilyPickerProxCardAdapter attach to presenter: %{public}s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v24, -1, -1);
    uint64_t v27 = v23;
    uint64_t v13 = v54;
    MEMORY[0x230FA4830](v27, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  unint64_t v55 = a1;
  uint64_t v28 = v71;
  sub_22E7E237C(a1);
  uint64_t v29 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v28 + 16) + 128);
  uint64_t v30 = swift_retain();
  v29(&aBlock, v30);
  swift_release();
  int v31 = v74;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v31 + 40))(ObjectType, v31);
  swift_unknownObjectRelease();
  sub_22E7F3250();
  sub_22E7B6540(&qword_268610B20, &qword_268610B08);
  sub_22E7B6540(&qword_268611A68, &qword_268611A50);
  unint64_t v33 = v60;
  sub_22E7F3590();
  sub_22E7B63A4();
  uint64_t aBlock = (id)sub_22E7F4050();
  uint64_t v34 = sub_22E7F4030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v8, 1, 1, v34);
  sub_22E7B6540(&qword_268611A70, &qword_268611A58);
  sub_22E7EA62C((unint64_t *)&qword_268610B30, (void (*)(uint64_t))sub_22E7B63A4);
  uint64_t v36 = v62;
  char v35 = v63;
  sub_22E7F3620();
  sub_22E7A7224((uint64_t)v8, &qword_268610B00);

  (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v36);
  uint64_t v37 = swift_allocObject();
  swift_weakInit();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v37;
  uint64_t v39 = v55;
  *(void *)(v38 + 24) = v55;
  int v40 = swift_allocObject();
  *(void *)(v40 + 16) = sub_22E7E8C40;
  *(void *)(v40 + 24) = v38;
  sub_22E7B6540(&qword_268611A78, &qword_268611A60);
  swift_unknownObjectRetain();
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v35, v13);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  uint64_t v41 = v65;
  sub_22E7F3270();
  swift_allocObject();
  swift_weakInit();
  sub_22E7B6540(&qword_268611A80, &qword_268611A48);
  uint64_t v42 = v67;
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v41, v42);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  uint64_t v43 = v68;
  sub_22E7F3240();
  swift_allocObject();
  swift_weakInit();
  sub_22E7B6540(&qword_268610E08, &qword_268610E00);
  uint64_t v44 = v70;
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v43, v44);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  uint64_t v45 = swift_allocObject();
  swift_weakInit();
  char v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = v45;
  *(void *)(v47 + 24) = v46;
  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = sub_22E7E8D0C;
  *(void *)(v48 + 24) = v47;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v49 = (void *)sub_22E7F3E60();
  v77 = sub_22E7BC894;
  v78 = v48;
  uint64_t aBlock = (id)MEMORY[0x263EF8330];
  v74 = 1107296256;
  v75 = sub_22E7E2F00;
  v76 = &block_descriptor_9;
  uint64_t v50 = _Block_copy(&aBlock);
  uint64_t v51 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v49, 0, v50);

  _Block_release(v50);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(v39, sel_setDismissButtonAction_, v51);
}

void sub_22E7E49D8(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_22E7F3580();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v60[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v60[-v12];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v15 = Strong;
  unint64_t v69 = a2 >> 62;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v59 = sub_22E7F41A0();
    swift_bridgeObjectRelease();
    if (v59) {
      goto LABEL_4;
    }
LABEL_24:
    swift_release();
    return;
  }
  if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_24;
  }
LABEL_4:
  id v70 = a4;
  uint64_t v16 = sub_22E7F3560();
  uint64_t v17 = *(void (**)(void))(v8 + 16);
  uint64_t v67 = v16;
  uint64_t v66 = (void (*)(unsigned char *, uint64_t, uint64_t))v17;
  v17(v13);
  uint64_t v68 = a1;
  sub_22E7A71C0(a1, (uint64_t)&aBlock, (uint64_t *)&unk_268610B40);
  swift_bridgeObjectRetain_n();
  id v18 = sub_22E7F3570();
  os_log_type_t v19 = sub_22E7F3FE0();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    os_log_t v62 = v18;
    uint64_t v22 = v21;
    uint64_t v63 = swift_slowAlloc();
    uint64_t v72 = v63;
    *(_DWORD *)uint64_t v22 = 136446466;
    int v61 = v20;
    uint64_t v64 = v8 + 16;
    sub_22E7A71C0((uint64_t)&aBlock, (uint64_t)v71, (uint64_t *)&unk_268610B40);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268610B40);
    uint64_t v23 = sub_22E7F3EA0();
    uint64_t v65 = v8;
    v71[0] = sub_22E7B3114(v23, v24, &v72);
    sub_22E7F40C0();
    swift_bridgeObjectRelease();
    sub_22E7A7224((uint64_t)&aBlock, (uint64_t *)&unk_268610B40);
    *(_WORD *)(v22 + 12) = 2082;
    uint64_t v25 = sub_22E7F3480();
    uint64_t v26 = swift_bridgeObjectRetain();
    uint64_t v27 = MEMORY[0x230FA3D30](v26, v25);
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v30 = v27;
    uint64_t v8 = v65;
    v71[0] = sub_22E7B3114(v30, v29, &v72);
    sub_22E7F40C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v31 = v62;
    _os_log_impl(&dword_22E7A0000, v62, (os_log_type_t)v61, "PASUIFamilyPickerProxCardAdapter publishers updating.\ndevice:%{public}s\nmembers:%{public}s", (uint8_t *)v22, 0x16u);
    os_log_t v32 = v11;
    uint64_t v33 = v63;
    swift_arrayDestroy();
    uint64_t v34 = v33;
    uint64_t v11 = v32;
    MEMORY[0x230FA4830](v34, -1, -1);
    MEMORY[0x230FA4830](v22, -1, -1);
  }
  else
  {
    sub_22E7A7224((uint64_t)&aBlock, (uint64_t *)&unk_268610B40);

    swift_bridgeObjectRelease_n();
  }
  char v35 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
  v35(v13, v7);
  if (v69)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_22E7F41A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v36 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v66(v11, v67, v7);
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_22E7F3570();
  os_log_type_t v38 = sub_22E7F4010();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 134349056;
    uint64_t aBlock = v36;
    sub_22E7F40C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22E7A0000, v37, v38, "The member count is :%{public}ld", v39, 0xCu);
    MEMORY[0x230FA4830](v39, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v35(v11, v7);
  uint64_t v40 = v68;
  sub_22E7E8E5C(v68, v36 == 1);
  uint64_t v41 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  id v42 = v70;
  objc_msgSend(v70, sel_setTitle_, v41);

  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    MEMORY[0x230FA3F60](0, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    swift_retain();
  }
  uint64_t v43 = sub_22E7F3440();
  uint64_t v45 = v44;
  swift_release();
  sub_22E7E8FF4(v40, v36 == 1, v43, v45);
  swift_bridgeObjectRelease();
  char v46 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  objc_msgSend(v42, sel_setSubtitle_, v46);

  sub_22E7F3ED0();
  swift_retain();
  uint64_t v47 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  v77 = sub_22E7E9260;
  uint64_t v78 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v74 = 1107296256;
  v75 = sub_22E7E2F00;
  v76 = &block_descriptor_64;
  uint64_t v48 = _Block_copy(&aBlock);
  uint64_t v49 = self;
  id v50 = objc_msgSend(v49, sel_actionWithTitle_style_handler_, v47, 0, v48);

  _Block_release(v48);
  swift_release();
  swift_retain();
  uint64_t v51 = sub_22E7F3260();
  swift_release();
  if (v51) {
    swift_release();
  }
  objc_msgSend(v50, sel_setEnabled_, v51 != 0);
  id v52 = v70;
  if (*(void *)(v15 + 40)) {
    objc_msgSend(v70, sel_removeAction_);
  }

  id v53 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v50;
  id v54 = v50;

  sub_22E7F3ED0();
  swift_retain();
  unint64_t v55 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  v77 = sub_22E7E9298;
  uint64_t v78 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v74 = 1107296256;
  v75 = sub_22E7E2F00;
  v76 = &block_descriptor_67;
  os_log_type_t v56 = _Block_copy(&aBlock);
  id v57 = objc_msgSend(v49, sel_actionWithTitle_style_handler_, v55, 1, v56);

  _Block_release(v56);
  swift_release();
  objc_msgSend(v57, sel_setEnabled_, sub_22E7F3220() & 1);
  if (*(void *)(v15 + 48)) {
    objc_msgSend(v52, sel_removeAction_);
  }

  uint64_t v58 = *(void **)(v15 + 48);
  *(void *)(v15 + 48) = v57;
  swift_release();
}

uint64_t sub_22E7E52D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a1;
  v4[6] = a4;
  sub_22E7F3F80();
  v4[7] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7E5370, v6, v5);
}

uint64_t sub_22E7E5370()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    swift_retain();
    swift_release();
    sub_22E7F32A0();
    swift_release();
  }
  **(unsigned char **)(v0 + 40) = Strong == 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_22E7E542C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  sub_22E7F3F80();
  swift_retain();
  uint64_t v10 = sub_22E7F3F70();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  void v11[2] = v10;
  void v11[3] = v12;
  v11[4] = v9;
  swift_release();
  sub_22E7AA930((uint64_t)v7, a4, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_22E7E5570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a1;
  v4[6] = a4;
  sub_22E7F3F80();
  v4[7] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  v4[8] = v6;
  v4[9] = v5;
  return MEMORY[0x270FA2498](sub_22E7E5608, v6, v5);
}

uint64_t sub_22E7E5608()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 80) = Strong;
  if (Strong)
  {
    *(void *)(v0 + 88) = *(void *)(Strong + 32);
    swift_retain();
    swift_release();
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_22E7E5730;
    return MEMORY[0x270F589F8]();
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 40) = *(void *)(v0 + 80) == 0;
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_22E7E5730()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_22E7E5874, v3, v2);
}

uint64_t sub_22E7E5874()
{
  swift_release();
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 80) == 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_22E7E58E8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = *(void **)(Strong + 40);
    id v4 = v3;
    swift_release();
    if (v3)
    {
      if (v1 && (sub_22E7F3430(), v5))
      {
        swift_bridgeObjectRelease();
        uint64_t v6 = 1;
      }
      else
      {
        uint64_t v6 = 0;
      }
      objc_msgSend(v4, sel_setEnabled_, v6);
    }
  }
}

void sub_22E7E598C(unsigned __int8 *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v3 = *(id *)(Strong + 48);
    swift_release();
    objc_msgSend(v3, sel_setEnabled_, v1);
  }
}

uint64_t sub_22E7E5A10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    swift_beginAccess();
    uint64_t v6 = (void *)MEMORY[0x230FA4900](a3 + 16);
    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_viewController);
      uint64_t v8 = *(void *)(v5 + 32);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_22E7A9E30;
      *(void *)(v9 + 24) = v8;
      swift_retain_n();
      sub_22E7E324C(v7, (uint64_t)&unk_268611A98, v8, (uint64_t)&unk_268610E20, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

void sub_22E7E5B50()
{
  swift_release();

  uint64_t v1 = *(void **)(v0 + 48);
}

uint64_t sub_22E7E5B88()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for PASUIFamilyPickerProxCardAdapter()
{
  return self;
}

uint64_t sub_22E7E5C04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22E7F3760();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_22E7F3FB0();
  uint64_t v27 = *(void *)(v35 - 8);
  uint64_t v7 = v27;
  MEMORY[0x270FA5388](v35);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7E5EB4((long long *)v1, (uint64_t)&v36);
  long long v10 = *(_OWORD *)(v1 + 16);
  long long v45 = *(_OWORD *)v1;
  long long v11 = v36;
  uint64_t v12 = v37;
  uint64_t v28 = v38;
  uint64_t v29 = v39;
  uint64_t v30 = v40;
  uint64_t v31 = v41;
  uint64_t v32 = v42;
  int v33 = v43;
  int v34 = v44;
  long long v36 = v10;
  uint64_t v37 = *(void *)(v1 + 32);
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v13 + 32) = v14;
  *(void *)(v13 + 48) = *(void *)(v1 + 32);
  sub_22E7BFBC8((uint64_t)&v45);
  sub_22E7E9788((uint64_t)&v36);
  uint64_t v26 = v9;
  sub_22E7F3F90();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(&v6[*(int *)(v4 + 28)], v9, v35);
  *(void *)uint64_t v6 = &unk_268611AD8;
  *((void *)v6 + 1) = v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611AE0);
  sub_22E7A6DF4((uint64_t)v6, a1 + *(int *)(v15 + 36));
  *(_OWORD *)a1 = v11;
  uint64_t v17 = v28;
  uint64_t v16 = v29;
  *(void *)(a1 + 16) = v12;
  *(void *)(a1 + 24) = v17;
  uint64_t v19 = v30;
  uint64_t v18 = v31;
  *(void *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = v19;
  uint64_t v20 = v32;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v20;
  char v22 = v33;
  char v21 = v34;
  *(unsigned char *)(a1 + 64) = v33;
  *(unsigned char *)(a1 + 65) = v21;
  uint64_t v23 = v20;
  sub_22E7E97B4(v11, *((uint64_t *)&v11 + 1), v12, v17, v16, v19, v18, v20, v22, v21);
  sub_22E7A6E70((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v35);
  return sub_22E7E97E0(v11, *((uint64_t *)&v11 + 1), v12, v17, v16, v19, v18, v23, v22, v34);
}

uint64_t sub_22E7E5EB4@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v21 = *a1;
  swift_retain();
  unint64_t v4 = sub_22E7F3230();
  sub_22E7BFC28((uint64_t)&v21);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_22E7F41A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v5 != 1)
  {
LABEL_13:
    swift_retain();
    unint64_t v9 = sub_22E7F3230();
    sub_22E7BFC28((uint64_t)&v21);
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_22E7F41A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v10 < 2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268611AE8);
      sub_22E7E980C();
      sub_22E7A6F2C();
      uint64_t result = sub_22E7F3930();
    }
    else
    {
      long long v19 = a1[1];
      uint64_t v20 = *((void *)a1 + 4);
      uint64_t v11 = swift_allocObject();
      long long v12 = a1[1];
      *(_OWORD *)(v11 + 16) = *a1;
      *(_OWORD *)(v11 + 32) = v12;
      *(void *)(v11 + 48) = *((void *)a1 + 4);
      long long v13 = a1[1];
      *(void *)&long long v14 = *((void *)a1 + 4);
      sub_22E7BFBC8((uint64_t)&v21);
      sub_22E7E9788((uint64_t)&v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268611B20);
      sub_22E7F3D10();
      sub_22E7F3DB0();
      sub_22E7F3720();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268611B08);
      sub_22E7E9848();
      sub_22E7E989C();
      sub_22E7F3930();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268611AE8);
      sub_22E7E980C();
      sub_22E7A6F2C();
      sub_22E7F3930();
      uint64_t result = swift_release();
    }
    goto LABEL_18;
  }
  swift_retain();
  unint64_t v6 = sub_22E7F3230();
  uint64_t result = sub_22E7BFC28((uint64_t)&v21);
  if (!(v6 >> 62))
  {
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_22E7F41A0();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v8)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_6:
  if ((v6 & 0xC000000000000001) != 0)
  {
    MEMORY[0x230FA3F60](0, v6);
    goto LABEL_9;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268611B08);
    sub_22E7E9848();
    sub_22E7E989C();
    sub_22E7F3930();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268611AE8);
    sub_22E7E980C();
    sub_22E7A6F2C();
    sub_22E7F3930();
    uint64_t result = swift_release();
LABEL_18:
    *(_OWORD *)a2 = v13;
    *(_OWORD *)(a2 + 16) = v14;
    *(_OWORD *)(a2 + 32) = v15;
    *(_OWORD *)(a2 + 48) = v16;
    *(unsigned char *)(a2 + 64) = v17;
    *(unsigned char *)(a2 + 65) = v18;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_22E7E6320@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v47 = a3;
  uint64_t v4 = sub_22E7F3960();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v48 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611B28);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611B30);
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611B38);
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v39 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611B40);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611B48);
  MEMORY[0x270FA5388](v36);
  char v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7F3A50();
  uint64_t v49 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611B50);
  sub_22E7E9950();
  sub_22E7F3690();
  long long v52 = *(_OWORD *)(a2 + 16);
  *(void *)&long long v53 = *(void *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611B20);
  sub_22E7F3D10();
  double v18 = v51;
  sub_22E7F3730();
  double v20 = v19;
  sub_22E7F3DB0();
  sub_22E7F3720();
  uint64_t v37 = v13;
  long long v21 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v38 = v12;
  v21(v8, v15, v12);
  char v22 = &v8[*(int *)(v6 + 36)];
  long long v23 = v53;
  *(_OWORD *)char v22 = v52;
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v54;
  unint64_t v24 = sub_22E7E9AB4();
  uint64_t v40 = v10;
  sub_22E7F3B90();
  sub_22E7A7224((uint64_t)v8, &qword_268611B28);
  sub_22E7F3950();
  unsigned __int8 v25 = sub_22E7F3A70();
  unsigned __int8 v26 = sub_22E7F3A50();
  sub_22E7F3A60();
  sub_22E7F3A60();
  if (sub_22E7F3A60() != v25) {
    sub_22E7F3A60();
  }
  sub_22E7F3A60();
  if (sub_22E7F3A60() != v26) {
    sub_22E7F3A60();
  }
  uint64_t v50 = v6;
  double v51 = *(double *)&v24;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v39;
  uint64_t v28 = v48;
  uint64_t v29 = v44;
  uint64_t v30 = v40;
  sub_22E7F3BA0();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v46);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v30, v29);
  uint64_t v31 = v41;
  uint64_t v32 = v43;
  (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v17, v27, v43);
  int v33 = (double *)&v17[*(int *)(v36 + 36)];
  *int v33 = v20 * 0.5;
  v33[1] = v18 * 0.5;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v32);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v15, v38);
  return sub_22E7A715C((uint64_t)v17, v47, &qword_268611B48);
}

uint64_t sub_22E7E6910@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  v24[0] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611B68);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611B78);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_22E7F3880();
  *((void *)v9 + 1) = 0x402C000000000000;
  v9[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611BB0);
  long long v27 = *a1;
  swift_retain();
  uint64_t v10 = sub_22E7F3230();
  sub_22E7BFC28((uint64_t)&v27);
  v24[3] = v10;
  long long v25 = a1[1];
  uint64_t v26 = *((void *)a1 + 4);
  uint64_t v11 = swift_allocObject();
  long long v12 = a1[1];
  *(_OWORD *)(v11 + 16) = *a1;
  *(_OWORD *)(v11 + 32) = v12;
  *(void *)(v11 + 48) = *((void *)a1 + 4);
  sub_22E7BFBC8((uint64_t)&v27);
  sub_22E7E9788((uint64_t)&v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611BB8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611BC0);
  sub_22E7B6540(&qword_268611BC8, &qword_268611BB8);
  unint64_t v13 = sub_22E7E9B60();
  v24[1] = (uint64_t)&type metadata for PASUIFamilyMemberView;
  v24[2] = v13;
  swift_getOpaqueTypeConformance2();
  sub_22E7EA62C(&qword_268611BD8, MEMORY[0x263F624E8]);
  sub_22E7F3DA0();
  uint64_t v14 = swift_allocObject();
  long long v15 = a1[1];
  *(_OWORD *)(v14 + 16) = *a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(void *)(v14 + 48) = *((void *)a1 + 4);
  sub_22E7BFBC8((uint64_t)&v27);
  sub_22E7E9788((uint64_t)&v25);
  uint64_t v16 = sub_22E7F3DB0();
  double v18 = v17;
  sub_22E7A71C0((uint64_t)v9, (uint64_t)v6, &qword_268611B78);
  double v19 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v6[*(int *)(v4 + 44)];
  *double v19 = sub_22E7F0928;
  v19[1] = 0;
  void v19[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v16;
  v19[3] = v18;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_22E7E9BF8;
  *(void *)(v20 + 24) = v14;
  uint64_t v21 = v24[0];
  sub_22E7A71C0((uint64_t)v6, v24[0], &qword_268611B68);
  char v22 = (uint64_t (**)(double *))(v21
                                          + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268611B50)
                                                   + 36));
  char *v22 = sub_22E7E9C4C;
  v22[1] = (uint64_t (*)(double *))v20;
  sub_22E7A7224((uint64_t)v6, &qword_268611B68);
  return sub_22E7A7224((uint64_t)v9, &qword_268611B78);
}

uint64_t sub_22E7E6C80(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  long long v9 = *a2;
  type metadata accessor for PASUIFamilyMemberViewModel();
  swift_allocObject();
  swift_retain();
  sub_22E7BFBC8((uint64_t)&v9);
  sub_22E7E72B0(v3);
  sub_22E7EA62C(&qword_268611BE0, (void (*)(uint64_t))type metadata accessor for PASUIFamilyMemberViewModel);
  swift_retain();
  sub_22E7F37A0();
  long long v7 = a2[1];
  uint64_t v8 = *((void *)a2 + 4);
  uint64_t v4 = swift_allocObject();
  long long v5 = a2[1];
  *(_OWORD *)(v4 + 16) = *a2;
  *(_OWORD *)(v4 + 32) = v5;
  *(void *)(v4 + 48) = *((void *)a2 + 4);
  *(void *)(v4 + 56) = v3;
  swift_retain();
  sub_22E7BFBC8((uint64_t)&v9);
  sub_22E7E9788((uint64_t)&v7);
  sub_22E7E9B60();
  sub_22E7F3B60();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_22E7E6E04(long long *a1)
{
  long long v2 = *a1;
  swift_retain();
  sub_22E7F3290();
  return sub_22E7BFC28((uint64_t)&v2);
}

uint64_t sub_22E7E6E50(uint64_t a1)
{
  v1[9] = a1;
  sub_22E7F3F80();
  v1[10] = sub_22E7F3F70();
  uint64_t v3 = sub_22E7F3F50();
  v1[11] = v3;
  v1[12] = v2;
  return MEMORY[0x270FA2498](sub_22E7E6EE8, v3, v2);
}

uint64_t sub_22E7E6EE8()
{
  *(_OWORD *)(v0 + 56) = *(_OWORD *)*(void *)(v0 + 72);
  uint64_t v1 = type metadata accessor for PASUIMonogramMaker();
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = &off_26E231010;
  *(void *)(v0 + 16) = v2;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_22E7BF9AC;
  return MEMORY[0x270F589C0](v0 + 16);
}

uint64_t sub_22E7E6FCC@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7E5C04(a1);
}

double sub_22E7E7008@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22E7F3CD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3470();
  if (v7 >> 60 == 15) {
    goto LABEL_5;
  }
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  id v10 = objc_allocWithZone(MEMORY[0x263F827E8]);
  uint64_t v11 = (void *)sub_22E7F2F70();
  id v12 = objc_msgSend(v10, sel_initWithData_, v11);

  if (!v12)
  {
    sub_22E7C4B2C(v8, v9);
LABEL_5:
    sub_22E7F3CC0();
    goto LABEL_6;
  }
  sub_22E7F3CB0();
  sub_22E7C4B2C(v8, v9);
LABEL_6:
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v13 = sub_22E7F3CF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_22E7F3DB0();
  sub_22E7F3720();
  uint64_t v14 = v19;
  char v15 = v20;
  uint64_t v16 = v21;
  char v17 = v22;
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v15;
  *(void *)(a1 + 24) = v16;
  *(unsigned char *)(a1 + 32) = v17;
  double result = *(double *)&v23;
  *(_OWORD *)(a1 + 40) = v23;
  *(_WORD *)(a1 + 56) = 256;
  return result;
}

double sub_22E7E7230@<D0>(uint64_t a1@<X8>)
{
  return sub_22E7E7008(a1);
}

uint64_t sub_22E7E723C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22E7F35E0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22E7E72B0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A48);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A40);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)(v2 + 24) = 0x4056000000000000;
  uint64_t v12 = v2
      + OBJC_IVAR____TtC23ProximityAppleIDSetupUIP33_D640019A9A6E13F9BEA4F540051EE91226PASUIFamilyMemberViewModel__isSelected;
  v15[8] = 0;
  sub_22E7F35D0();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v9 + 32))(v12, v11, v8);
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t v13 = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v13 = MEMORY[0x263F8EE88];
  }
  *(void *)(v2
            + OBJC_IVAR____TtC23ProximityAppleIDSetupUIP33_D640019A9A6E13F9BEA4F540051EE91226PASUIFamilyMemberViewModel_cancellables) = v13;
  *(void *)(v2 + 16) = a1;
  swift_retain();
  sub_22E7F3270();
  sub_22E7B6540(&qword_268611A80, &qword_268611A48);
  swift_retain();
  sub_22E7F3630();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_22E7E7564(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *a1;
  uint64_t v8 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_22E7F3F80();
  swift_retain();
  swift_retain();
  uint64_t v9 = sub_22E7F3F70();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  id v10[2] = v9;
  v10[3] = v11;
  v10[4] = v7;
  uint64_t v10[5] = a2;
  sub_22E7AA784((uint64_t)v6, (uint64_t)&unk_268611BF0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_22E7E768C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  id v5[2] = a1;
  sub_22E7F3F80();
  v5[5] = sub_22E7F3F70();
  uint64_t v7 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7E7728, v7, v6);
}

uint64_t sub_22E7E7728()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[3];
  swift_release();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  sub_22E7F3DC0();
  sub_22E7F3770();
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_22E7E77F4(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = sub_22E7F3430();
    uint64_t v3 = v2;
    uint64_t v4 = sub_22E7F3430();
    uint64_t v6 = v5;
    if (v3)
    {
      if (v5)
      {
        if (v1 == v4 && v3 == v5)
        {
          swift_bridgeObjectRelease();
          char v8 = 1;
        }
        else
        {
          char v8 = sub_22E7F4210();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        char v8 = 0;
      }
      goto LABEL_15;
    }
  }
  else
  {
    sub_22E7F3430();
    uint64_t v6 = v9;
  }
  if (!v6)
  {
    char v8 = 1;
    goto LABEL_16;
  }
  char v8 = 0;
LABEL_15:
  swift_bridgeObjectRelease();
LABEL_16:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22E7F35E0();
  swift_release();
  uint64_t result = swift_release();
  if ((v8 & 1) != v11)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_22E7F35F0();
  }
  return result;
}

uint64_t sub_22E7E7964()
{
  swift_release();
  uint64_t v1 = v0
     + OBJC_IVAR____TtC23ProximityAppleIDSetupUIP33_D640019A9A6E13F9BEA4F540051EE91226PASUIFamilyMemberViewModel__isSelected;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611A40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22E7E7A20()
{
  return type metadata accessor for PASUIFamilyMemberViewModel();
}

uint64_t type metadata accessor for PASUIFamilyMemberViewModel()
{
  uint64_t result = qword_268611A28;
  if (!qword_268611A28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22E7E7A74()
{
  sub_22E7E7B2C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_22E7E7B2C()
{
  if (!qword_268611A38)
  {
    unint64_t v0 = sub_22E7F3600();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268611A38);
    }
  }
}

uint64_t sub_22E7E7B84@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PASUIFamilyMemberViewModel();
  uint64_t result = sub_22E7F35C0();
  *a1 = result;
  return result;
}

uint64_t sub_22E7E7BC4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v28 = a2;
  uint64_t v5 = sub_22E7F38C0();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_22E7F3980();
  uint64_t v8 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611C20);
  uint64_t v24 = *(void *)(v11 - 8);
  uint64_t v25 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611C28);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_22E7F38D0();
  sub_22E7E7FB4(a1, (uint64_t)v30, a3);
  v31[304] = 1;
  memcpy(&v31[7], v30, 0x128uLL);
  v29[0] = v17;
  v29[1] = 0;
  LOBYTE(v29[2]) = 1;
  memcpy((char *)&v29[2] + 1, v31, 0x12FuLL);
  sub_22E7F3970();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611C30);
  uint64_t v19 = sub_22E7B6540(&qword_268611C38, &qword_268611C30);
  sub_22E7F3BD0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v23);
  memcpy(v32, v29, 0x140uLL);
  sub_22E7EA25C((uint64_t)v32);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22E7F35E0();
  swift_release();
  swift_release();
  swift_release();
  if (LOBYTE(v29[0]) == 1) {
    sub_22E7F38A0();
  }
  else {
    sub_22E7F38B0();
  }
  v29[0] = v18;
  v29[1] = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v25;
  sub_22E7F3BF0();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v27);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v20);
  return sub_22E7A715C((uint64_t)v16, v28, &qword_268611C28);
}

uint64_t sub_22E7E7FB4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610DA8);
  MEMORY[0x270FA5388](v6 - 8);
  v82 = (char *)v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3AD0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_22E7F3DB0();
  uint64_t v104 = v12;
  type metadata accessor for PASUIFamilyMemberViewModel();
  sub_22E7EA62C(&qword_268611BE0, (void (*)(uint64_t))type metadata accessor for PASUIFamilyMemberViewModel);
  swift_retain();
  uint64_t v103 = sub_22E7F37A0();
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = *(void *)(a1 + 24);
  swift_retain();
  swift_retain();
  uint64_t v106 = v14;
  swift_release();
  int v102 = sub_22E7F3A80();
  sub_22E7F3680();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_22E7F3DB0();
  sub_22E7F3720();
  uint64_t v101 = v129;
  int v97 = v130;
  uint64_t v100 = v131;
  int v96 = v132;
  uint64_t v99 = v133;
  uint64_t v98 = v134;
  swift_retain();
  uint64_t v25 = sub_22E7F3460();
  uint64_t v107 = v15;
  uint64_t v85 = a1;
  if (v26)
  {
    uint64_t v27 = v25;
    unint64_t v28 = v26;
    swift_release();
  }
  else
  {
    uint64_t v27 = sub_22E7F3450();
    unint64_t v28 = v29;
    swift_release();
    if (!v28)
    {
      uint64_t v27 = 0;
      unint64_t v28 = 0xE000000000000000;
    }
  }
  uint64_t v135 = v27;
  unint64_t v136 = v28;
  unint64_t v84 = sub_22E7A9CD0();
  uint64_t v30 = sub_22E7F3B10();
  uint64_t v32 = v31;
  char v34 = v33 & 1;
  uint64_t v35 = *MEMORY[0x263F1A6C8];
  uint64_t v36 = *(void (**)(char *, void, uint64_t))(v9 + 104);
  v76[2] = v9 + 104;
  v83 = v36;
  v36(v11, v35, v8);
  uint64_t v37 = sub_22E7F3A90();
  uint64_t v77 = v8;
  uint64_t v80 = v37;
  uint64_t v38 = *(void *)(v37 - 8);
  v79 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56);
  uint64_t v81 = v38 + 56;
  uint64_t v39 = (uint64_t)v82;
  v79(v82, 1, 1, v37);
  sub_22E7F3AB0();
  sub_22E7A7224(v39, &qword_268610DA8);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v9 + 8);
  v76[1] = v9 + 8;
  uint64_t v78 = v40;
  v40(v11, v8);
  uint64_t v95 = sub_22E7F3AF0();
  uint64_t v94 = v41;
  uint64_t v42 = v39;
  char v44 = v43;
  uint64_t v93 = v45;
  swift_release();
  int v92 = v44 & 1;
  sub_22E7EA300(v30, v32, v34);
  swift_bridgeObjectRelease();
  sub_22E7F3DB0();
  sub_22E7F3720();
  uint64_t v91 = v135;
  int v87 = v136;
  uint64_t v90 = v137;
  int v86 = v138;
  uint64_t v89 = v139;
  uint64_t v88 = v140;
  swift_retain();
  uint64_t v46 = sub_22E7F3420();
  uint64_t v48 = v47;
  swift_release();
  uint64_t v109 = v46;
  uint64_t v110 = v48;
  uint64_t v49 = sub_22E7F3B10();
  uint64_t v51 = v50;
  char v53 = v52 & 1;
  uint64_t v54 = v77;
  v83(v11, *MEMORY[0x263F1A728], v77);
  v79((char *)v42, 1, 1, v80);
  sub_22E7F3AB0();
  sub_22E7A7224(v42, &qword_268610DA8);
  v78(v11, v54);
  uint64_t v55 = sub_22E7F3AF0();
  uint64_t v57 = v56;
  char v59 = v58;
  swift_release();
  LOBYTE(v32) = v59 & 1;
  sub_22E7EA300(v49, v51, v53);
  swift_bridgeObjectRelease();
  sub_22E7F3C90();
  uint64_t v60 = sub_22E7F3AE0();
  uint64_t v62 = v61;
  char v64 = v63;
  uint64_t v66 = v65;
  swift_release();
  LOBYTE(v49) = v64 & 1;
  sub_22E7EA300(v55, v57, v32);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a2 + 284) = *(_DWORD *)&v111[3];
  *(_DWORD *)(a2 + 281) = *(_DWORD *)v111;
  char v124 = v97;
  char v122 = v96;
  char v126 = 1;
  char v118 = 1;
  char v116 = v87;
  char v114 = v86;
  *(_DWORD *)(a2 + 57) = v109;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)((char *)&v109 + 3);
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v127;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v127[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v125;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v125[3];
  *(_DWORD *)(a2 + 129) = *(_DWORD *)v123;
  *(_DWORD *)(a2 + 132) = *(_DWORD *)&v123[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v121;
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v121[3];
  *(_DWORD *)(a2 + 188) = *(_DWORD *)&v119[3];
  *(_DWORD *)(a2 + 185) = *(_DWORD *)v119;
  *(_DWORD *)(a2 + 212) = *(_DWORD *)&v117[3];
  *(_DWORD *)(a2 + 209) = *(_DWORD *)v117;
  *(_DWORD *)(a2 + 228) = *(_DWORD *)&v115[3];
  *(_DWORD *)(a2 + 225) = *(_DWORD *)v115;
  *(_DWORD *)(a2 + 241) = *(_DWORD *)v113;
  *(_DWORD *)(a2 + 244) = *(_DWORD *)&v113[3];
  uint64_t v67 = v104;
  *(void *)a2 = v105;
  *(void *)(a2 + 8) = v67;
  *(unsigned char *)(a2 + 56) = v102;
  *(unsigned char *)(a2 + 112) = v126;
  *(void *)(a2 + 120) = v101;
  *(unsigned char *)(a2 + 128) = v124;
  *(void *)(a2 + 136) = v100;
  *(unsigned char *)(a2 + 144) = v122;
  char v68 = v92;
  char v120 = v92;
  uint64_t v69 = v98;
  *(void *)(a2 + 152) = v99;
  *(void *)(a2 + 160) = v69;
  *(unsigned char *)(a2 + 184) = v120;
  *(unsigned char *)(a2 + 208) = v118;
  *(void *)(a2 + 216) = v91;
  *(unsigned char *)(a2 + 224) = v116;
  *(void *)(a2 + 232) = v90;
  *(unsigned char *)(a2 + 240) = v114;
  char v112 = v64 & 1;
  uint64_t v70 = v88;
  *(void *)(a2 + 248) = v89;
  *(void *)(a2 + 256) = v70;
  *(unsigned char *)(a2 + 280) = v112;
  uint64_t v71 = v106;
  *(void *)(a2 + 16) = v103;
  *(void *)(a2 + 24) = v71;
  *(double *)(a2 + 32) = a3;
  *(void *)(a2 + 40) = v107;
  *(void *)(a2 + 48) = v16;
  *(void *)(a2 + 64) = v18;
  *(void *)(a2 + 72) = v20;
  *(void *)(a2 + 80) = v22;
  *(void *)(a2 + 88) = v24;
  *(unsigned char *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = 0;
  uint64_t v72 = v95;
  uint64_t v73 = v94;
  *(void *)(a2 + 168) = v95;
  *(void *)(a2 + 176) = v73;
  *(void *)(a2 + 192) = v93;
  *(void *)(a2 + 200) = 0;
  *(void *)(a2 + 264) = v60;
  *(void *)(a2 + 272) = v62;
  *(void *)(a2 + 288) = v66;
  char v74 = v68;
  char v108 = v68;
  char v128 = 0;
  swift_retain();
  swift_retain();
  sub_22E7EA310(v72, v73, v74);
  swift_bridgeObjectRetain();
  sub_22E7EA310(v60, v62, v49);
  swift_bridgeObjectRetain();
  sub_22E7EA300(v60, v62, v49);
  swift_bridgeObjectRelease();
  sub_22E7EA300(v72, v73, v108);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_22E7E8960@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22E7F35E0();
  swift_release();
  swift_release();
  swift_release();
  if (v13 == 1) {
    uint64_t v2 = sub_22E7F3C70();
  }
  else {
    uint64_t v2 = sub_22E7F3C80();
  }
  uint64_t v3 = v2;
  sub_22E7F36D0();
  uint64_t v4 = sub_22E7F3DB0();
  uint64_t v6 = v5;
  sub_22E7F3DB0();
  sub_22E7F3720();
  *(void *)a1 = v8;
  *(void *)(a1 + 8) = v9;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v3;
  *(_WORD *)(a1 + 48) = 256;
  *(void *)(a1 + 56) = v4;
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(unsigned char *)(a1 + 96) = v16;
  double result = *(double *)&v17;
  *(_OWORD *)(a1 + 104) = v17;
  return result;
}

double sub_22E7E8ADC@<D0>(uint64_t a1@<X8>)
{
  return sub_22E7E8960(a1);
}

uint64_t sub_22E7E8AE8@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7E7BC4(*(void *)(v1 + 8), a1, *(double *)(v1 + 24));
}

uint64_t sub_22E7E8AF4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22E7F35E0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22E7E8B78()
{
  return sub_22E7F35F0();
}

uint64_t sub_22E7E8BF0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7E8C28()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EEE8]);
}

void sub_22E7E8C40(uint64_t a1, unint64_t a2)
{
  sub_22E7E49D8(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_22E7E8C48()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7E8C80(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(a1, *(void *)(a1 + 40));
}

void sub_22E7E8CAC(uint64_t *a1)
{
}

void sub_22E7E8CB4(unsigned __int8 *a1)
{
}

uint64_t sub_22E7E8CBC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7E8CF4()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_22E7E8D0C(uint64_t a1)
{
  return sub_22E7E5A10(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_22E7E8D2C()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A7F00;
  return sub_22E7BBBD4(v0);
}

void *sub_22E7E8DBC(uint64_t a1)
{
  v1[5] = 0;
  v1[6] = 0;
  v1[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  v1[2] = sub_22E7F3050();
  swift_retain();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t v2 = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v2 = MEMORY[0x263F8EE88];
  }
  v1[3] = v2;
  return v1;
}

uint64_t sub_22E7E8E5C(uint64_t a1, char a2)
{
  sub_22E7A71C0(a1, (uint64_t)&v14, (uint64_t *)&unk_268610B40);
  uint64_t v3 = v16;
  if (!v16)
  {
    sub_22E7A7224((uint64_t)&v14, (uint64_t *)&unk_268610B40);
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    unint64_t v7 = 0xD000000000000019;
    uint64_t v8 = "FAMILY_PICKER_VIEW_TITLE_";
    goto LABEL_6;
  }
  uint64_t v4 = v17;
  __swift_project_boxed_opaque_existential_1(&v14, v16);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 8))(v11, v3, v4);
  uint64_t v5 = v12;
  uint64_t v6 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  if ((a2 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  unint64_t v7 = 0xD000000000000021;
  uint64_t v8 = "FAMILY_PICKER_VIEW_TITLE_JUST_ME_";
LABEL_6:
  unint64_t v14 = v7;
  unint64_t v15 = (unint64_t)(v8 - 32) | 0x8000000000000000;
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_22E7E8FF4(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_22E7A71C0(a1, (uint64_t)&v17, (uint64_t *)&unk_268610B40);
  uint64_t v7 = v19;
  if (v19)
  {
    uint64_t v8 = v20;
    __swift_project_boxed_opaque_existential_1(&v17, v19);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v8 + 8))(v14, v7, v8);
    uint64_t v9 = v15;
    uint64_t v10 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
  }
  else
  {
    sub_22E7A7224((uint64_t)&v17, (uint64_t *)&unk_268610B40);
  }
  if ((a2 & 1) == 0)
  {
    unint64_t v17 = 0;
    unint64_t v18 = 0xE000000000000000;
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    unint64_t v17 = 0xD00000000000001CLL;
    unint64_t v18 = 0x800000022E7FB360;
LABEL_9:
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_22E7F3ED0();
    goto LABEL_10;
  }
  if (!a4)
  {
    unint64_t v17 = 0;
    unint64_t v18 = 0xE000000000000000;
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    unint64_t v17 = 0xD00000000000002ALL;
    unint64_t v18 = 0x800000022E7FB380;
    goto LABEL_9;
  }
  unint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  unint64_t v17 = 0xD000000000000024;
  unint64_t v18 = 0x800000022E7FB3B0;
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268610D68);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22E7F5B70;
  *(void *)(v11 + 56) = MEMORY[0x263F8D310];
  *(void *)(v11 + 64) = sub_22E7B9E14();
  *(void *)(v11 + 32) = a3;
  *(void *)(v11 + 40) = a4;
  uint64_t v12 = sub_22E7F3EB0();
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_22E7E9260(uint64_t a1)
{
  return sub_22E7E542C(a1, v1, (uint64_t)&unk_26E233AF8, (uint64_t)&unk_268611AB8);
}

uint64_t sub_22E7E9298(uint64_t a1)
{
  return sub_22E7E542C(a1, v1, (uint64_t)&unk_26E233AD0, (uint64_t)&unk_268611AA8);
}

uint64_t sub_22E7E92D4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A7F00;
  return sub_22E7E5570(a1, v4, v5, v6);
}

uint64_t objectdestroy_70Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7E93CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A7F00;
  return sub_22E7E52D8(a1, v4, v5, v6);
}

unint64_t sub_22E7E9480()
{
  unint64_t result = qword_268611AC8;
  if (!qword_268611AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268611AC8);
  }
  return result;
}

uint64_t destroy for PASUIFamilyPickerView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PASUIFamilyPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIFamilyPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for PASUIFamilyPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIFamilyPickerView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PASUIFamilyPickerView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PASUIFamilyPickerView()
{
  return &type metadata for PASUIFamilyPickerView;
}

uint64_t sub_22E7E96D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7E96F4()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_22E7A6D00;
  return sub_22E7E6E50(v0 + 16);
}

uint64_t sub_22E7E9788(uint64_t a1)
{
  return a1;
}

uint64_t sub_22E7E97B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10)
{
  if ((a10 & 1) == 0) {
    return sub_22E7E97D0();
  }
  return result;
}

uint64_t sub_22E7E97D0()
{
  return swift_retain();
}

uint64_t sub_22E7E97E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10)
{
  if ((a10 & 1) == 0) {
    return sub_22E7E97FC();
  }
  return result;
}

uint64_t sub_22E7E97FC()
{
  return swift_release();
}

uint64_t sub_22E7E980C()
{
  return sub_22E7EA19C(&qword_268611AF0, &qword_268611AE8, (void (*)(void))sub_22E7E9848, (void (*)(void))sub_22E7E989C);
}

unint64_t sub_22E7E9848()
{
  unint64_t result = qword_268611AF8;
  if (!qword_268611AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611AF8);
  }
  return result;
}

unint64_t sub_22E7E989C()
{
  unint64_t result = qword_268611B00;
  if (!qword_268611B00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611B08);
    sub_22E7B6540(&qword_268611B10, &qword_268611B18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611B00);
  }
  return result;
}

uint64_t sub_22E7E9940@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22E7E6320(a1, v2 + 16, a2);
}

uint64_t sub_22E7E9948@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7E6910(*(long long **)(v1 + 16), a1);
}

unint64_t sub_22E7E9950()
{
  unint64_t result = qword_268611B58;
  if (!qword_268611B58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611B50);
    sub_22E7E99F0();
    sub_22E7B6540(&qword_268611B90, &qword_268611B98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611B58);
  }
  return result;
}

unint64_t sub_22E7E99F0()
{
  unint64_t result = qword_268611B60;
  if (!qword_268611B60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611B68);
    sub_22E7B6540(&qword_268611B70, &qword_268611B78);
    sub_22E7B6540(&qword_268611B80, &qword_268611B88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611B60);
  }
  return result;
}

unint64_t sub_22E7E9AB4()
{
  unint64_t result = qword_268611BA0;
  if (!qword_268611BA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611B28);
    sub_22E7B6540(&qword_268611BA8, &qword_268611B40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611BA0);
  }
  return result;
}

uint64_t sub_22E7E9B58(uint64_t *a1)
{
  return sub_22E7E6C80(a1, (long long *)(v1 + 16));
}

unint64_t sub_22E7E9B60()
{
  unint64_t result = qword_268611BD0;
  if (!qword_268611BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611BD0);
  }
  return result;
}

uint64_t objectdestroy_80Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22E7E9BF8()
{
  return sub_22E7F3D20();
}

uint64_t sub_22E7E9C4C(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_22E7E9C78()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_22E7E9CC0()
{
  return sub_22E7E6E04((long long *)(v0 + 16));
}

uint64_t sub_22E7E9CCC(uint64_t *a1)
{
  return sub_22E7E7564(a1, v1);
}

uint64_t sub_22E7E9CD4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22E7E9D1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22E7A7F00;
  return sub_22E7E768C(a1, v4, v5, v7, v6);
}

uint64_t sub_22E7E9DDC()
{
  return sub_22E7E77F4(*(void *)(v0 + 16));
}

uint64_t initializeWithCopy for PASUIFamilyMemberView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIFamilyMemberView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for PASUIFamilyMemberView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIFamilyMemberView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIFamilyMemberView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIFamilyMemberView()
{
  return &type metadata for PASUIFamilyMemberView;
}

void *initializeBufferWithCopyOfBuffer for PASUIMemberImageView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for PASUIMemberImageView()
{
  return swift_release();
}

void *assignWithCopy for PASUIMemberImageView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for PASUIMemberImageView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for PASUIMemberImageView()
{
  return &type metadata for PASUIMemberImageView;
}

unint64_t sub_22E7EA044()
{
  unint64_t result = qword_268611BF8;
  if (!qword_268611BF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611AE0);
    sub_22E7EA0F0();
    sub_22E7EA62C((unint64_t *)&qword_268610700, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611BF8);
  }
  return result;
}

unint64_t sub_22E7EA0F0()
{
  unint64_t result = qword_268611C00;
  if (!qword_268611C00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611C08);
    sub_22E7EA19C(&qword_268611C10, &qword_268611C18, (void (*)(void))sub_22E7E980C, (void (*)(void))sub_22E7A6F2C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611C00);
  }
  return result;
}

uint64_t sub_22E7EA19C(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22E7EA224()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7EA240()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7EA25C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 192);
  uint64_t v3 = *(void *)(a1 + 200);
  char v4 = *(unsigned char *)(a1 + 208);
  uint64_t v5 = *(void *)(a1 + 288);
  uint64_t v6 = *(void *)(a1 + 296);
  char v7 = *(unsigned char *)(a1 + 304);
  swift_release();
  swift_release();
  sub_22E7EA300(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_22E7EA300(v5, v6, v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22E7EA300(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_22E7EA310(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

void *sub_22E7EA324(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  return a1;
}

void *assignWithCopy for PASUIFamilyMemberView.SelectionView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for PASUIFamilyMemberView.SelectionView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

ValueMetadata *type metadata accessor for PASUIFamilyMemberView.SelectionView()
{
  return &type metadata for PASUIFamilyMemberView.SelectionView;
}

unint64_t sub_22E7EA408()
{
  unint64_t result = qword_268611C40;
  if (!qword_268611C40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611C48);
    sub_22E7EA4A8();
    sub_22E7B6540(&qword_268611C60, &qword_268611C68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611C40);
  }
  return result;
}

unint64_t sub_22E7EA4A8()
{
  unint64_t result = qword_268611C50;
  if (!qword_268611C50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611C58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611C50);
  }
  return result;
}

unint64_t sub_22E7EA520()
{
  unint64_t result = qword_268611C70;
  if (!qword_268611C70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611C28);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611C30);
    sub_22E7B6540(&qword_268611C38, &qword_268611C30);
    swift_getOpaqueTypeConformance2();
    sub_22E7EA62C(&qword_268611C78, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611C70);
  }
  return result;
}

uint64_t sub_22E7EA62C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22E7EA674()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22E7EA694()
{
  unint64_t result = qword_268611C80;
  if (!qword_268611C80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611C88);
    sub_22E7B6540(&qword_268611C90, &qword_268611C98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611C80);
  }
  return result;
}

void sub_22E7EA75C(void *a1)
{
  void (*v15)(id *__return_ptr, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  void (*v19)(id *__return_ptr, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id aBlock;
  uint64_t v43;
  void (*v44)(uint64_t, void *);
  void *v45;
  uint64_t (*v46)(uint64_t);
  uint64_t v47;

  uint64_t v2 = v1;
  uint64_t v38 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B00);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B08);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B10);
  uint64_t v39 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B18);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v40 = v11;
  uint64_t v41 = v12;
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7E237C(a1);
  uint64_t v15 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v2 + 16) + 128);
  uint64_t v16 = swift_retain();
  v15(&aBlock, v16);
  swift_release();
  unint64_t v17 = v43;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v17 + 40))(ObjectType, v17);
  swift_unknownObjectRelease();
  uint64_t v19 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v2 + 16) + 128);
  uint64_t v20 = swift_retain();
  v19(&aBlock, v20);
  swift_release();
  uint64_t v21 = v43;
  uint64_t v22 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v21 + 56))(v22, v21);
  swift_unknownObjectRelease();
  sub_22E7B6540(&qword_268610B20, &qword_268610B08);
  sub_22E7F3590();
  sub_22E7B63A4();
  uint64_t aBlock = (id)sub_22E7F4050();
  uint64_t v23 = sub_22E7F4030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v6, 1, 1, v23);
  sub_22E7B6540(&qword_268610B28, &qword_268610B10);
  sub_22E7B63E4();
  uint64_t v24 = v37;
  sub_22E7F3620();
  sub_22E7A7224((uint64_t)v6, &qword_268610B00);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v24);
  uint64_t v25 = swift_allocObject();
  swift_weakInit();
  unint64_t v26 = swift_allocObject();
  uint64_t v27 = v38;
  *(void *)(v26 + 16) = v25;
  *(void *)(v26 + 24) = v27;
  sub_22E7B6540(&qword_268610B38, &qword_268610B18);
  swift_unknownObjectRetain();
  unint64_t v28 = v40;
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v28);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  unint64_t v29 = swift_allocObject();
  swift_weakInit();
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v29;
  *(void *)(v31 + 24) = v30;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_22E7EB630;
  *(void *)(v32 + 24) = v31;
  swift_retain();
  swift_retain();
  swift_retain();
  char v33 = (void *)sub_22E7F3E60();
  uint64_t v46 = sub_22E7BC894;
  uint64_t v47 = v32;
  uint64_t aBlock = (id)MEMORY[0x263EF8330];
  char v43 = 1107296256;
  char v44 = sub_22E7E2F00;
  uint64_t v45 = &block_descriptor_10;
  char v34 = _Block_copy(&aBlock);
  uint64_t v35 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v33, 0, v34);

  _Block_release(v34);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(v27, sel_setDismissButtonAction_, v35);
}

void sub_22E7EADF4(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_22E7B6584(a1, (uint64_t)v26);
    sub_22E7B6584(a1 + 40, (uint64_t)v27);
    sub_22E7E3C5C((uint64_t)v26, (uint64_t)v28);
    uint64_t v5 = v29;
    if (v29)
    {
      uint64_t v6 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v6 + 8))(v23, v5, v6);
      uint64_t v7 = v24;
      uint64_t v8 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_22E7A7224((uint64_t)v27, (uint64_t *)&unk_268610B40);
    }
    else
    {
      sub_22E7A7224((uint64_t)v27, (uint64_t *)&unk_268610B40);
      sub_22E7A7224((uint64_t)v28, (uint64_t *)&unk_268610B40);
    }
    sub_22E7B6584(a1, (uint64_t)v26);
    sub_22E7B6584(a1 + 40, (uint64_t)v27);
    sub_22E7E3C5C((uint64_t)v27, (uint64_t)v28);
    uint64_t v9 = v29;
    if (v29)
    {
      uint64_t v10 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v10 + 8))(v23, v9, v10);
      uint64_t v11 = v24;
      uint64_t v12 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_22E7A7224((uint64_t)v26, (uint64_t *)&unk_268610B40);
    }
    else
    {
      sub_22E7A7224((uint64_t)v26, (uint64_t *)&unk_268610B40);
      sub_22E7A7224((uint64_t)v28, (uint64_t *)&unk_268610B40);
    }
    sub_22E7EB718();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setTitle_, v13);

    sub_22E7B6584(a1, (uint64_t)v26);
    sub_22E7B6584(a1 + 40, (uint64_t)v27);
    sub_22E7E3C5C((uint64_t)v26, (uint64_t)v28);
    uint64_t v14 = v29;
    if (v29)
    {
      uint64_t v15 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v15 + 8))(v23, v14, v15);
      uint64_t v16 = v24;
      uint64_t v17 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_22E7A7224((uint64_t)v27, (uint64_t *)&unk_268610B40);
    }
    else
    {
      sub_22E7A7224((uint64_t)v27, (uint64_t *)&unk_268610B40);
      sub_22E7A7224((uint64_t)v28, (uint64_t *)&unk_268610B40);
    }
    sub_22E7B6584(a1, (uint64_t)v26);
    sub_22E7B6584(a1 + 40, (uint64_t)v27);
    sub_22E7E3C5C((uint64_t)v27, (uint64_t)v28);
    uint64_t v18 = v29;
    if (v29)
    {
      uint64_t v19 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v19 + 8))(v23, v18, v19);
      uint64_t v20 = v24;
      uint64_t v21 = v25;
      __swift_project_boxed_opaque_existential_1(v23, v24);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v21);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_22E7A7224((uint64_t)v26, (uint64_t *)&unk_268610B40);
    }
    else
    {
      sub_22E7A7224((uint64_t)v26, (uint64_t *)&unk_268610B40);
      sub_22E7A7224((uint64_t)v28, (uint64_t *)&unk_268610B40);
    }
    sub_22E7EB478();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setSubtitle_, v22);
    swift_release();
  }
}

uint64_t sub_22E7EB2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    swift_beginAccess();
    uint64_t v6 = (void *)MEMORY[0x230FA4900](a3 + 16);
    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_viewController);
      uint64_t v8 = *(void *)(v5 + 32);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_22E7A9E30;
      *(void *)(v9 + 24) = v8;
      swift_retain_n();
      sub_22E7E324C(v7, (uint64_t)&unk_268611CA8, v8, (uint64_t)&unk_268610E20, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_22E7EB404()
{
  return swift_release();
}

uint64_t sub_22E7EB40C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for PASUIProgressViewProxCardAdapter()
{
  return self;
}

uint64_t sub_22E7EB478()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  sub_22E7F3EF0();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E7EB588()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7EB5C0()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EEE8]);
}

void sub_22E7EB5D8(uint64_t a1)
{
  sub_22E7EADF4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_22E7EB5E0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7EB618()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_22E7EB630(uint64_t a1)
{
  return sub_22E7EB2C0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22E7EB638()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

uint64_t sub_22E7EB688()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A6D00;
  return sub_22E7BBBD4(v0);
}

uint64_t sub_22E7EB718()
{
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PASFlowStepTargetError.buildView()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611CB0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)v11 - v6;
  v11[0] = v0;
  unint64_t v8 = sub_22E7EB964();
  sub_22E7F3C00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetErrorView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

unint64_t sub_22E7EB964()
{
  unint64_t result = qword_268611CB8;
  if (!qword_268611CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611CB8);
  }
  return result;
}

uint64_t sub_22E7EB9B8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611CB0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v7 = (char *)v11 - v6;
  v11[0] = *v0;
  unint64_t v8 = sub_22E7EB964();
  sub_22E7F3C00();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v11[0] = &type metadata for PASUITargetErrorView;
  v11[1] = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v9 = sub_22E7F3D60();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  return v9;
}

ValueMetadata *type metadata accessor for PASUITargetErrorView()
{
  return &type metadata for PASUITargetErrorView;
}

uint64_t sub_22E7EBB44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22E7EBB60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611CC0);
  uint64_t v1 = *(void *)(v16 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v16);
  uint64_t v15 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - v4;
  uint64_t v18 = sub_22E7EBDA0;
  uint64_t v19 = 0;
  uint64_t v20 = sub_22E7EBDBC;
  unint64_t v21 = 0;
  char v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611CC8);
  unint64_t v7 = sub_22E7C08CC();
  unint64_t v8 = sub_22E7EC804();
  sub_22E7F3C40();
  uint64_t v9 = (uint64_t)v20;
  uint64_t v10 = v23;
  sub_22E7A6ED4((uint64_t)v18);
  sub_22E7A6ED4(v9);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v11 = v16;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v15, v5, v16);
  uint64_t v18 = (uint64_t (*)())&type metadata for PASUITargetBaseView;
  uint64_t v19 = v6;
  uint64_t v20 = (uint64_t (*)())v7;
  unint64_t v21 = v8;
  swift_getOpaqueTypeConformance2();
  uint64_t v12 = v11;
  uint64_t v13 = sub_22E7F3D60();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v5, v12);
  *uint64_t v17 = v13;
  return result;
}

uint64_t sub_22E7EBDA0()
{
  return sub_22E7F3ED0();
}

uint64_t sub_22E7EBDBC()
{
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E7EBE8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  uint64_t v1 = sub_22E7F3810();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611CD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611CF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v22 = v9;
  uint64_t v23 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611CF8);
  sub_22E7EC9A8();
  sub_22E7F3D40();
  sub_22E7F3800();
  uint64_t v13 = sub_22E7B6540(&qword_268611CE0, &qword_268611CD8);
  uint64_t v14 = sub_22E7EC958(&qword_268611CE8, MEMORY[0x263F18FD0]);
  sub_22E7F3B50();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_22E7F3890();
  uint64_t v15 = sub_22E7F3B00();
  uint64_t v17 = v16;
  uint64_t v25 = v5;
  uint64_t v26 = v1;
  LOBYTE(v1) = v18 & 1;
  uint64_t v27 = v13;
  uint64_t v28 = v14;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v22;
  sub_22E7F3BB0();
  sub_22E7EA300(v15, v17, v1);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v12, v19);
}

uint64_t sub_22E7EC22C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_22E7F3F80();
  swift_retain();
  uint64_t v6 = sub_22E7F3F70();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  long long v7[2] = v6;
  v7[3] = v8;
  v7[4] = a1;
  sub_22E7AA784((uint64_t)v4, (uint64_t)&unk_268611D78, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_22E7EC344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = sub_22E7F3F80();
  v4[3] = sub_22E7F3F70();
  uint64_t v8 = (uint64_t (*)(void))(*(void *)(*(void *)a4 + 352) + **(int **)(*(void *)a4 + 352));
  uint64_t v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_22E7B7A94;
  return v8();
}

uint64_t sub_22E7EC46C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611D68);
  uint64_t v33 = *(void *)(v1 - 8);
  uint64_t v34 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611D30);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611D20);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611D10) - 8;
  MEMORY[0x270FA5388](v36);
  uint64_t v35 = (uint64_t)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22E7F3CC0();
  uint64_t v14 = sub_22E7F3AC0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = v13;
  uint64_t v39 = KeyPath;
  uint64_t v40 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611D38);
  sub_22E7ECC38();
  sub_22E7F3C10();
  swift_release();
  swift_release();
  swift_release();
  LODWORD(v13) = sub_22E7F3940();
  uint64_t v17 = v33;
  uint64_t v16 = v34;
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v7, v3, v34);
  *(_DWORD *)&v7[*(int *)(v5 + 44)] = v13;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v16);
  LOBYTE(v13) = sub_22E7F3A80();
  sub_22E7F3680();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  sub_22E7A71C0((uint64_t)v7, (uint64_t)v11, &qword_268611D30);
  uint64_t v26 = &v11[*(int *)(v9 + 44)];
  char *v26 = v13;
  *((void *)v26 + 1) = v19;
  *((void *)v26 + 2) = v21;
  *((void *)v26 + 3) = v23;
  *((void *)v26 + 4) = v25;
  unsigned char v26[40] = 0;
  sub_22E7A7224((uint64_t)v7, &qword_268611D30);
  id v27 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  uint64_t v28 = MEMORY[0x230FA3AA0](v27);
  LOBYTE(v16) = sub_22E7F3A80();
  uint64_t v29 = v35;
  sub_22E7A71C0((uint64_t)v11, v35, &qword_268611D20);
  uint64_t v30 = v29 + *(int *)(v36 + 44);
  *(void *)uint64_t v30 = v28;
  *(unsigned char *)(v30 + 8) = v16;
  sub_22E7A7224((uint64_t)v11, &qword_268611D20);
  uint64_t v31 = v37;
  sub_22E7A71C0(v29, v37, &qword_268611D10);
  *(_WORD *)(v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268611CF8) + 36)) = 256;
  return sub_22E7A7224(v29, &qword_268611D10);
}

uint64_t sub_22E7EC7F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_22E7EBB60(a1);
}

uint64_t sub_22E7EC7FC@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7EBE8C(a1);
}

unint64_t sub_22E7EC804()
{
  unint64_t result = qword_268611CD0;
  if (!qword_268611CD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611CC8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611CD8);
    sub_22E7F3810();
    sub_22E7B6540(&qword_268611CE0, &qword_268611CD8);
    sub_22E7EC958(&qword_268611CE8, MEMORY[0x263F18FD0]);
    swift_getOpaqueTypeConformance2();
    sub_22E7EC958(&qword_268611C78, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611CD0);
  }
  return result;
}

uint64_t sub_22E7EC958(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22E7EC9A0()
{
  return sub_22E7EC22C(v0);
}

unint64_t sub_22E7EC9A8()
{
  unint64_t result = qword_268611D00;
  if (!qword_268611D00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611CF8);
    sub_22E7ECA48();
    sub_22E7B6540(&qword_268611C60, &qword_268611C68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611D00);
  }
  return result;
}

unint64_t sub_22E7ECA48()
{
  unint64_t result = qword_268611D08;
  if (!qword_268611D08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611D10);
    sub_22E7ECAE8();
    sub_22E7B6540(&qword_268611D58, &qword_268611D60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611D08);
  }
  return result;
}

unint64_t sub_22E7ECAE8()
{
  unint64_t result = qword_268611D18;
  if (!qword_268611D18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611D20);
    sub_22E7ECB64();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611D18);
  }
  return result;
}

unint64_t sub_22E7ECB64()
{
  unint64_t result = qword_268611D28;
  if (!qword_268611D28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611D30);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611D38);
    sub_22E7ECC38();
    swift_getOpaqueTypeConformance2();
    sub_22E7B6540(&qword_268611D48, &qword_268611D50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611D28);
  }
  return result;
}

unint64_t sub_22E7ECC38()
{
  unint64_t result = qword_268611D40;
  if (!qword_268611D40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268611D38);
    sub_22E7B6540(&qword_268610DE0, &qword_268610DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611D40);
  }
  return result;
}

uint64_t sub_22E7ECCE0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7ECD20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A6D00;
  return sub_22E7EC344(a1, v4, v5, v6);
}

uint64_t sub_22E7ECDD4()
{
  return MEMORY[0x263F1B718];
}

void sub_22E7ECDE0(uint64_t *a1@<X8>)
{
  if (qword_268614C28)
  {
    uint64_t v2 = (uint64_t (*)(uint64_t))qword_268614C30;
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v3 = swift_unknownObjectRelease();
    uint64_t v4 = v2(v3);
    swift_release();
    *a1 = v4;
  }
  else
  {
    __break(1u);
  }
}

BOOL sub_22E7ECE58(void *a1)
{
  uint64_t v2 = sub_22E7F3DD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3DF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    sub_22E7B63A4();
    uint64_t v11 = sub_22E7F4050();
    uint64_t v18 = v6;
    uint64_t v12 = (void *)v11;
    uint64_t v13 = swift_allocObject();
    swift_weakInit();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    *(void *)(v14 + 24) = a1;
    aBlock[4] = sub_22E7ED588;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22E7CC0A8;
    aBlock[3] = &block_descriptor_11;
    uint64_t v15 = _Block_copy(aBlock);
    id v16 = a1;
    swift_release();
    sub_22E7F3DE0();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_22E7ED5A8((unint64_t *)&qword_2686112A8, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611980);
    sub_22E7C93A0();
    sub_22E7F40F0();
    MEMORY[0x230FA3E60](0, v9, v5, v15);
    _Block_release(v15);
    swift_release();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  }
  return Strong != 0;
}

uint64_t sub_22E7ED168(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_268614C28)
    {
      swift_unknownObjectRetain();
      swift_retain();
      swift_retain();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
      sub_22E7CACB0(a2);
      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_22E7ED228()
{
  uint64_t v0 = qword_268614C28;
  if (qword_268614C28)
  {
    swift_retain();
    swift_unknownObjectRetain();
    type metadata accessor for PASUINonUIExtensionConfiguration();
    uint64_t v1 = swift_allocObject();
    type metadata accessor for AuthenticateProxyObjectFetchingDecorator();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = v0;
    *(void *)(v1 + 16) = v2;
    sub_22E7F2FF0();
    sub_22E7ED5A8(&qword_268611D88, (void (*)(uint64_t))type metadata accessor for PASUINonUIExtensionConfiguration);
    sub_22E7F3000();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22E7ED334(uint64_t a1)
{
  if (qword_268610668 != -1) {
    swift_once();
  }
  uint64_t v2 = static PASUIConstants.extensionDefaultSceneID;
  uint64_t v3 = unk_268614C20;
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v5 = MEMORY[0x263F1B720];
  uint64_t v6 = MEMORY[0x263F1B718];
  return MEMORY[0x270EEB958](v2, v3, sub_22E7ED500, a1, sub_22E7ED540, v4, v5, v6);
}

uint64_t type metadata accessor for PASUIAppExtension()
{
  return self;
}

uint64_t sub_22E7ED458()
{
  return sub_22E7ED5A8(&qword_268611D80, MEMORY[0x263F04E40]);
}

void sub_22E7ED4A0()
{
}

uint64_t sub_22E7ED4C4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PASUIAppExtension();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_22E7ED4F8()
{
  return sub_22E7ED334(v0);
}

void sub_22E7ED500(uint64_t *a1@<X8>)
{
}

uint64_t sub_22E7ED508()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

BOOL sub_22E7ED540(void *a1)
{
  return sub_22E7ECE58(a1);
}

uint64_t sub_22E7ED548()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22E7ED588()
{
  return sub_22E7ED168(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_22E7ED5A8(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_22E7ED5F0()
{
  uint64_t v1 = sub_22E7F3580();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)(v0 + 16);
  if (v5)
  {
    id v6 = *(id *)(v0 + 16);
  }
  else
  {
    uint64_t v7 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
    uint64_t v8 = sub_22E7F3570();
    os_log_type_t v9 = sub_22E7F4000();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_22E7A0000, v8, v9, "PASUIViewControllerProvider has no viewController", v10, 2u);
      MEMORY[0x230FA4830](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
    uint64_t v5 = 0;
  }
  id v11 = v5;
  return v6;
}

id sub_22E7ED77C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v29 - v7;
  os_log_type_t v9 = *(void **)(v1 + 16);
  if (!v9 || (id v10 = objc_msgSend(v9, sel_navigationController)) == 0)
  {
    uint64_t v11 = sub_22E7F3560();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v12(v8, v11, v2);
    uint64_t v13 = sub_22E7F3570();
    os_log_type_t v14 = sub_22E7F4000();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = v11;
      id v16 = v12;
      uint64_t v17 = v6;
      uint64_t v18 = v15;
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_22E7A0000, v13, v14, "PASUIViewControllerProvider has no navigationController", v15, 2u);
      uint64_t v19 = v18;
      id v6 = v17;
      uint64_t v12 = v16;
      uint64_t v11 = v30;
      MEMORY[0x230FA4830](v19, -1, -1);
    }

    uint64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
    v20(v8, v2);
    uint64_t v21 = *(void **)(v1 + 16);
    if (v21)
    {
      id v22 = v21;
    }
    else
    {
      v12(v6, v11, v2);
      uint64_t v23 = sub_22E7F3570();
      uint64_t v24 = sub_22E7F4000();
      if (os_log_type_enabled(v23, (os_log_type_t)v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_22E7A0000, v23, (os_log_type_t)v24, "PASUIViewControllerProvider has no viewController", v25, 2u);
        MEMORY[0x230FA4830](v25, -1, -1);
      }

      v20(v6, v2);
      id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
      uint64_t v21 = 0;
    }
    id v26 = objc_allocWithZone(MEMORY[0x263F829B8]);
    id v27 = v21;
    id v10 = objc_msgSend(v26, sel_initWithRootViewController_, v22);
  }
  return v10;
}

id sub_22E7EDA44(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22E7F3580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v21 = a1;
  os_log_type_t v9 = sub_22E7F3570();
  os_log_type_t v10 = sub_22E7F4010();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v20 = v2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = v4;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138543362;
    id v22 = v21;
    id v14 = v21;
    sub_22E7F40C0();
    void *v13 = v21;

    uint64_t v2 = v20;
    _os_log_impl(&dword_22E7A0000, v9, v10, "PASUIViewControllerProvider setViewController %{public}@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268611990);
    swift_arrayDestroy();
    MEMORY[0x230FA4830](v13, -1, -1);
    uint64_t v15 = v12;
    uint64_t v4 = v19;
    MEMORY[0x230FA4830](v15, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v16 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = v21;

  id v17 = v21;
  return v17;
}

uint64_t sub_22E7EDC98()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PASUIViewControllerProvider()
{
  return self;
}

id sub_22E7EDCF4()
{
  return sub_22E7ED5F0();
}

id sub_22E7EDD18()
{
  return sub_22E7ED77C();
}

id sub_22E7EDD3C(void *a1)
{
  return sub_22E7EDA44(a1);
}

id sub_22E7EDD60()
{
  sub_22E7EE7D4();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUICDPEnrollmentObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22E7EDE3C(uint64_t a1)
{
  uint64_t v3 = sub_22E7F3580();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v7 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_lastStatus);
  if (v7 == 4 || v7 <= a1)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_lastStatus) = a1;
    uint64_t v17 = v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate;
    uint64_t result = MEMORY[0x230FA4900](v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_delegate);
    if (result)
    {
      uint64_t v18 = *(void *)(v17 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 8))(a1, ObjectType, v18);
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v22 = 0;
    unint64_t v23 = 0xE000000000000000;
    sub_22E7F4130();
    swift_bridgeObjectRelease();
    uint64_t v22 = 544175136;
    unint64_t v23 = 0xE400000000000000;
    LOBYTE(v21) = a1;
    sub_22E7F3EA0();
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    sub_22E7F3EF0();
    LOBYTE(v21) = v7;
    sub_22E7F3EA0();
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    uint64_t v22 = 0xD000000000000030;
    unint64_t v23 = 0x800000022E7FB610;
    sub_22E7F3EF0();
    swift_bridgeObjectRelease();
    uint64_t v9 = v22;
    unint64_t v8 = v23;
    uint64_t v10 = sub_22E7F3560();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v10, v3);
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_22E7F3570();
    os_log_type_t v12 = sub_22E7F3FF0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v4;
      uint64_t v15 = v14;
      uint64_t v22 = v14;
      *(_DWORD *)uint64_t v13 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_22E7B3114(v9, v8, &v22);
      sub_22E7F40C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22E7A0000, v11, v12, "%{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x230FA4830](v15, -1, -1);
      MEMORY[0x230FA4830](v13, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v6, v3);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  return result;
}

uint64_t sub_22E7EE1D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  unsigned int v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUICDPEnrollmentObserver registerObservers", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611E10);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_22E7F5E10;
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter];
  os_log_type_t v12 = (void *)*MEMORY[0x263F349F0];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v1;
  uint64_t v41 = sub_22E7EEFD4;
  uint64_t v42 = v13;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v38 = 1107296256;
  uint64_t v39 = sub_22E7EE6E0;
  uint64_t v40 = &block_descriptor_12;
  uint64_t v14 = _Block_copy(&aBlock);
  id v15 = v12;
  id v16 = v1;
  swift_release();
  id v17 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v15, 0, 0, v14);
  _Block_release(v14);

  *(void *)(v10 + 32) = v17;
  uint64_t v18 = (void *)*MEMORY[0x263F349E8];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v41 = sub_22E7EF014;
  uint64_t v42 = v19;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v38 = 1107296256;
  uint64_t v39 = sub_22E7EE6E0;
  uint64_t v40 = &block_descriptor_16;
  uint64_t v20 = _Block_copy(&aBlock);
  uint64_t v21 = v16;
  id v22 = v18;
  swift_release();
  id v23 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v22, 0, 0, v20);
  _Block_release(v20);

  *(void *)(v10 + 40) = v23;
  uint64_t v24 = (void *)*MEMORY[0x263F349D8];
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v21;
  uint64_t v41 = sub_22E7EF03C;
  uint64_t v42 = v25;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v38 = 1107296256;
  uint64_t v39 = sub_22E7EE6E0;
  uint64_t v40 = &block_descriptor_22;
  id v26 = _Block_copy(&aBlock);
  id v27 = v21;
  id v28 = v24;
  swift_release();
  id v29 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v28, 0, 0, v26);
  _Block_release(v26);

  *(void *)(v10 + 48) = v29;
  uint64_t v30 = (void *)*MEMORY[0x263F349E0];
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v27;
  uint64_t v41 = sub_22E7EF064;
  uint64_t v42 = v31;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v38 = 1107296256;
  uint64_t v39 = sub_22E7EE6E0;
  uint64_t v40 = &block_descriptor_28_0;
  uint64_t v32 = _Block_copy(&aBlock);
  uint64_t v33 = v27;
  id v34 = v30;
  swift_release();
  id v35 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v34, 0, 0, v32);
  _Block_release(v32);

  *(void *)(v10 + 56) = v35;
  uint64_t aBlock = v10;
  sub_22E7F3F40();
  *(void *)&v33[OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_observers] = aBlock;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E7EE6E0(uint64_t a1)
{
  uint64_t v2 = sub_22E7F2F10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_22E7F2F00();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_22E7EE7D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  unsigned int v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUICDPEnrollmentObserver deregisterObservers", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_observers);
  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v11) {
      goto LABEL_5;
    }
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_22E7F41A0();
  uint64_t v11 = result;
  if (!result) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_5:
  if (v11 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void **)(v1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI26PASUICDPEnrollmentObserver_notificationCenter);
    do
    {
      if ((v10 & 0xC000000000000001) != 0)
      {
        uint64_t v15 = MEMORY[0x230FA3F60](v13, v10);
      }
      else
      {
        uint64_t v15 = *(void *)(v10 + 8 * v13 + 32);
        swift_unknownObjectRetain();
      }
      ++v13;
      objc_msgSend(v14, sel_removeObserver_, v15);
      swift_unknownObjectRelease();
    }
    while (v11 != v13);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PASUICDPEnrollmentObserver()
{
  return self;
}

uint64_t sub_22E7EECB4(uint64_t a1)
{
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  unsigned int v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "PASUICDPEnrollmentObserver uiController(_:prepareAlertContext:)", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))(a1 + 16))(a1);
}

uint64_t sub_22E7EEE20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_22E7F3580();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  os_log_type_t v8 = sub_22E7F3570();
  os_log_type_t v9 = sub_22E7F4010();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl(&dword_22E7A0000, v8, v9, "PASUICDPEnrollmentObserver uiController(_:preparePresentationContext:)", v10, 2u);
    MEMORY[0x230FA4830](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_22E7EDE3C(0);
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_22E7EEF9C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7EEFD4()
{
  return sub_22E7EDE3C(0);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_22E7EF014()
{
  return sub_22E7EDE3C(1);
}

uint64_t sub_22E7EF03C()
{
  return sub_22E7EDE3C(2);
}

uint64_t sub_22E7EF064()
{
  return sub_22E7EDE3C(3);
}

uint64_t sub_22E7EF0B0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268611E28);
  sub_22E7F3A40();
  swift_bridgeObjectRetain();
  swift_release();
  sub_22E7F3A40();
  uint64_t v2 = *(void *)(v26 + 64);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v3 = *(void **)(v0 + 32);
  if (v3)
  {
    id v4 = *(id *)(v0 + 32);
  }
  else
  {
    id v4 = *(id *)(v0 + 48);
    if (v4)
    {
      uint64_t v5 = self;
      swift_bridgeObjectRetain();
      id v6 = objc_msgSend(v5, sel_tintColor);
      uint64_t v7 = self;
      id v8 = objc_msgSend(v7, sel_configurationWithHierarchicalColor_, v6);

      id v9 = objc_msgSend(v7, sel_configurationWithPointSize_, 100.0);
      id v10 = objc_msgSend(v8, sel_configurationByApplyingConfiguration_, v9);
      uint64_t v11 = (void *)sub_22E7F3E60();
      swift_bridgeObjectRelease();
      id v4 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v11, v10);

      uint64_t v1 = v0;
    }
  }
  id v12 = v3;
  uint64_t v13 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v14 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PASUIWelcomeController()), sel_initWithTitle_detailText_icon_, v13, v14, v4);

  sub_22E7F3A40();
  id v16 = v15;
  sub_22E7B65EC((uint64_t)v15, (uint64_t)&off_26E234188);
  swift_release();

  unint64_t v17 = *(void *)(v1 + 56);
  unint64_t v26 = v17;
  if (!(v17 >> 62))
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v18) {
      goto LABEL_10;
    }
LABEL_16:
    sub_22E7F0888((uint64_t)&v26);
    return (uint64_t)v16;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_22E7F41A0();
  uint64_t v18 = result;
  if (!result) {
    goto LABEL_16;
  }
LABEL_10:
  if (v18 >= 1)
  {
    unint64_t v20 = v17 + 32;
    do
    {
      uint64_t v21 = *(void **)(*(void *)v20 + 16);
      self;
      uint64_t v22 = swift_dynamicCastObjCClass();
      if (v22)
      {
        uint64_t v23 = v22;
        swift_retain();
        id v24 = v21;
        id v25 = objc_msgSend(v16, sel_buttonTray);
        objc_msgSend(v25, sel_addButton_, v23);

        swift_release();
      }
      v20 += 8;
      --v18;
    }
    while (v18);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

id sub_22E7EF42C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView);
  uint64_t v3 = &selRef_startAnimating;
  if (!*(unsigned char *)(v1 + 64)) {
    uint64_t v3 = &selRef_stopAnimating;
  }
  return [v2 *v3];
}

uint64_t sub_22E7EF45C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  type metadata accessor for PASUIDeviceStringController();
  swift_allocObject();
  sub_22E7A6E60(v3);
  sub_22E7A6E60(v6);
  uint64_t result = sub_22E7B5838(v3, v4, v6, v5);
  *a1 = result;
  return result;
}

uint64_t sub_22E7EF4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22E7F0834();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_22E7EF544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22E7F0834();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_22E7EF5A8()
{
}

void sub_22E7EF5D0()
{
  qword_268614C48 = 0x4077500000000000;
}

id sub_22E7EF5E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = objc_allocWithZone(MEMORY[0x263F823E8]);
  id v9 = v5;
  id v10 = objc_msgSend(v8, sel_initWithActivityIndicatorStyle_, 100);
  *(void *)&v9[OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView] = v10;

  uint64_t v11 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  if (a4)
  {
    id v12 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = 0;
  }
  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for PASUIWelcomeController();
  id v13 = objc_msgSendSuper2(&v15, sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, 2);

  return v13;
}

void sub_22E7EF864()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC23ProximityAppleIDSetupUI22PASUIWelcomeController_activityIndicatorView];
  objc_msgSend(v1, sel_removeFromSuperview);
  id v2 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v2, sel_addSubview_, v1);

  if (objc_msgSend(v0, sel_isContentCenterAligned)) {
    uint64_t v3 = 100;
  }
  else {
    uint64_t v3 = 101;
  }
  objc_msgSend(v1, sel_setActivityIndicatorViewStyle_, v3);
  id v4 = objc_msgSend(v0, sel_view);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_centerYAnchor);

    id v7 = objc_msgSend(v1, sel_centerYAnchor);
    id v27 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

    LODWORD(v8) = 1132068864;
    objc_msgSend(v27, sel_setPriority_, v8);
    unsigned int v9 = objc_msgSend(v0, sel_isContentCenterAligned);
    id v10 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268611E10);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_22E7F5E10;
    id v12 = objc_msgSend(v0, sel_contentView);
    id v13 = v12;
    if (v9)
    {
      id v14 = objc_msgSend(v12, sel_centerXAnchor);

      id v15 = objc_msgSend(v1, sel_centerXAnchor);
    }
    else
    {
      id v14 = objc_msgSend(v12, sel_leadingAnchor);

      id v15 = objc_msgSend(v1, sel_leadingAnchor);
    }
    id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

    *(void *)(v11 + 32) = v16;
    *(void *)(v11 + 40) = v27;
    id v17 = v27;
    id v18 = objc_msgSend(v1, sel_topAnchor);
    id v19 = objc_msgSend(v0, sel_contentView);
    id v20 = objc_msgSend(v19, sel_topAnchor);

    id v21 = objc_msgSend(v18, sel_constraintGreaterThanOrEqualToAnchor_, v20);
    *(void *)(v11 + 48) = v21;
    id v22 = objc_msgSend(v0, sel_contentView);
    id v23 = objc_msgSend(v22, sel_bottomAnchor);

    id v24 = objc_msgSend(v1, sel_bottomAnchor);
    id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

    *(void *)(v11 + 56) = v25;
    sub_22E7F3F40();
    sub_22E7B5670();
    unint64_t v26 = (void *)sub_22E7F3F10();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_activateConstraints_, v26);
  }
  else
  {
    __break(1u);
  }
}

void sub_22E7EFD10()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22E7F3580();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3560();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = sub_22E7F3570();
  os_log_type_t v8 = sub_22E7F4010();
  if (os_log_type_enabled(v7, v8))
  {
    unsigned int v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl(&dword_22E7A0000, v7, v8, "Adding header animation view", v9, 2u);
    MEMORY[0x230FA4830](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  type metadata accessor for PASUIMicaView();
  id v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v10, sel_addSubview_, v11);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v12 = objc_msgSend(v1, sel_headerView);
  id v13 = objc_msgSend(v12, sel_animationView);

  if (v13)
  {
    objc_msgSend(v13, sel_addSubview_, v10);
    id v14 = self;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268611E10);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_22E7F8420;
    id v16 = objc_msgSend(v10, sel_centerXAnchor);
    id v17 = objc_msgSend(v13, sel_centerXAnchor);
    id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

    *(void *)(v15 + 32) = v18;
    id v19 = objc_msgSend(v10, sel_centerYAnchor);
    id v20 = objc_msgSend(v13, sel_centerYAnchor);
    id v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

    *(void *)(v15 + 40) = v21;
    id v22 = objc_msgSend(v10, sel_heightAnchor);
    if (qword_268610670 != -1) {
      swift_once();
    }
    id v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, *(double *)&qword_268614C48);

    *(void *)(v15 + 48) = v23;
    id v24 = objc_msgSend(v10, sel_widthAnchor);
    id v25 = objc_msgSend(v24, sel_constraintEqualToConstant_, *(double *)&qword_268614C48);

    *(void *)(v15 + 56) = v25;
    id v26 = objc_msgSend(v11, sel_topAnchor);
    id v27 = objc_msgSend(v10, sel_topAnchor);
    id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v27);

    *(void *)(v15 + 64) = v28;
    id v29 = objc_msgSend(v11, sel_bottomAnchor);
    id v30 = objc_msgSend(v10, sel_bottomAnchor);
    id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

    *(void *)(v15 + 72) = v31;
    id v32 = objc_msgSend(v11, sel_leadingAnchor);
    id v33 = objc_msgSend(v10, sel_leadingAnchor);
    id v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);

    *(void *)(v15 + 80) = v34;
    id v35 = objc_msgSend(v11, sel_trailingAnchor);
    id v36 = objc_msgSend(v10, sel_trailingAnchor);
    id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

    *(void *)(v15 + 88) = v37;
    v39[1] = v15;
    sub_22E7F3F40();
    sub_22E7B5670();
    uint64_t v38 = (void *)sub_22E7F3F10();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_activateConstraints_, v38);
  }
}

id sub_22E7F0314()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PASUIWelcomeController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PASUIWelcomeController()
{
  return self;
}

void sub_22E7F037C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_22E7F0388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_22E7F0394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v7 = objc_msgSend(v5, sel_headerView);
  id v8 = (id)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, *a5, v8);
}

uint64_t destroy for PASUIWelcomeControllerWrapper(uint64_t a1)
{
  if (*(void *)a1) {
    swift_release();
  }
  if (*(void *)(a1 + 16)) {
    swift_release();
  }

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PASUIWelcomeControllerWrapper(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = *(void *)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  id v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  id v10 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PASUIWelcomeControllerWrapper(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*(void *)a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v9;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  swift_retain();
  swift_release();
LABEL_15:
  id v10 = *(void **)(a1 + 32);
  id v11 = (void *)a2[4];
  *(void *)(a1 + 32) = v11;
  id v12 = v11;

  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PASUIWelcomeControllerWrapper(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*(void *)a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v9;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_15;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  swift_release();
LABEL_15:
  id v10 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = a2[4];

  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for PASUIWelcomeControllerWrapper(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PASUIWelcomeControllerWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PASUIWelcomeControllerWrapper()
{
  return &type metadata for PASUIWelcomeControllerWrapper;
}

unint64_t sub_22E7F0834()
{
  unint64_t result = qword_268611E20;
  if (!qword_268611E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611E20);
  }
  return result;
}

uint64_t sub_22E7F0888(uint64_t a1)
{
  return a1;
}

void sub_22E7F08B4()
{
  xmmword_268614C50 = 0uLL;
}

double sub_22E7F08C4@<D0>(_OWORD *a1@<X8>)
{
  if (qword_268610678 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_268614C50;
  *a1 = xmmword_268614C50;
  return result;
}

uint64_t sub_22E7F0928@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_22E7F3C80();
  uint64_t result = sub_22E7F3730();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

unint64_t sub_22E7F0978@<X0>(uint64_t a1@<X8>)
{
  uint64_t started = type metadata accessor for PASUISourceStartViewProxCardAdapter();
  uint64_t v3 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  *(void *)(v3 + 16) = sub_22E7F3050();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t result = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t result = MEMORY[0x263F8EE88];
  }
  *(void *)(v3 + 24) = result;
  *(void *)(a1 + 24) = started;
  *(void *)(a1 + 32) = &off_26E2337B8;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepSourceStart.buildView()()
{
  sub_22E7F0A60();
  return sub_22E7F3D60();
}

unint64_t sub_22E7F0A60()
{
  unint64_t result = qword_268611E30;
  if (!qword_268611E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268611E30);
  }
  return result;
}

unint64_t sub_22E7F0AB4@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7F0978(a1);
}

uint64_t sub_22E7F0ACC()
{
  sub_22E7F0A60();
  return sub_22E7F3D60();
}

uint64_t type metadata accessor for PASUISourceStartViewProxCardAdapter()
{
  return self;
}

ValueMetadata *type metadata accessor for PASUISourceStartView()
{
  return &type metadata for PASUISourceStartView;
}

uint64_t sub_22E7F0B34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PASFlowStepSignInResult.buildView()()
{
  sub_22E7A6F2C();
  return sub_22E7F3D60();
}

uint64_t sub_22E7F0B88(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return sub_22E7F1F00(v2);
}

unint64_t sub_22E7F0C0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PASUIAllSetProxCardAdapter();
  uint64_t v4 = (void *)swift_allocObject();
  v4[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  v4[2] = sub_22E7F3050();
  swift_retain();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t result = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t result = MEMORY[0x263F8EE88];
  }
  v4[3] = result;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = &off_26E2337B8;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepAllSet.buildView()()
{
  return sub_22E7F3D60();
}

unint64_t sub_22E7F0CEC@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7F0C0C(a1);
}

uint64_t sub_22E7F0D10()
{
  return sub_22E7F3D60();
}

void sub_22E7F0D24(void *a1)
{
  void (*v14)(id *__return_ptr, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id aBlock;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  uint64_t (*v36)(uint64_t);
  uint64_t v37;

  uint64_t v2 = v1;
  id v30 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B00);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B08);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611E38);
  uint64_t v11 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  id v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7E237C(a1);
  id v14 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v2 + 16) + 128);
  uint64_t v15 = swift_retain();
  v14(&aBlock, v15);
  swift_release();
  id v16 = v33;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v16 + 40))(ObjectType, v16);
  swift_unknownObjectRelease();
  sub_22E7B63A4();
  uint64_t aBlock = (id)sub_22E7F4050();
  id v18 = sub_22E7F4030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_22E7B6540(&qword_268610B20, &qword_268610B08);
  sub_22E7B63E4();
  sub_22E7F3620();
  sub_22E7A7224((uint64_t)v6, &qword_268610B00);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v19 = swift_allocObject();
  swift_weakInit();
  id v20 = swift_allocObject();
  id v21 = v30;
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v21;
  sub_22E7B6540(&qword_268611E40, &qword_268611E38);
  swift_unknownObjectRetain();
  id v22 = v31;
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  id v23 = swift_allocObject();
  swift_weakInit();
  id v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v25 = swift_allocObject();
  *(void *)(v25 + 16) = v23;
  *(void *)(v25 + 24) = v24;
  id v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_22E7F1E18;
  *(void *)(v26 + 24) = v25;
  swift_retain();
  swift_retain();
  swift_retain();
  id v27 = (void *)sub_22E7F3E60();
  id v36 = sub_22E7BC894;
  id v37 = v26;
  uint64_t aBlock = (id)MEMORY[0x263EF8330];
  id v33 = 1107296256;
  id v34 = sub_22E7E2F00;
  id v35 = &block_descriptor_13;
  id v28 = _Block_copy(&aBlock);
  id v29 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v27, 0, v28);

  _Block_release(v28);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_msgSend(v21, sel_setDismissButtonAction_, v29);
}

void sub_22E7F1290(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v33)(void *__return_ptr);
  id v34;
  void *v35;
  uint64_t (*v36)(uint64_t);
  char *v37;
  char *v38;
  uint64_t v39;
  char v40;
  id v41;
  void v42[3];
  uint64_t v43;
  uint64_t v44;
  void aBlock[3];
  void *v46;
  uint64_t (*v47)(uint64_t);
  uint64_t v48;
  unsigned char v49[40];

  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v6 = Strong;
  (*(void (**)(void *__return_ptr))(**(void **)(Strong + 32) + 640))(aBlock);
  uint64_t v7 = v46;
  if (v46)
  {
    uint64_t v8 = v47;
    __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
    uint64_t v9 = (*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v8 + 6))(v7, v8);
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = *(void *)(v9 + *MEMORY[0x263F624A8] + 8);
      swift_bridgeObjectRetain();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
      sub_22E7B6584(a1, (uint64_t)v49);
      if (v11) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  }
  else
  {
    sub_22E7A7224((uint64_t)aBlock, &qword_268611E60);
  }
  sub_22E7B6584(a1, (uint64_t)v49);
LABEL_9:
  sub_22E7B6584((uint64_t)v49, (uint64_t)aBlock);
  uint64_t v12 = v46;
  if (v46)
  {
    id v13 = v47;
    __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
    (*((void (**)(void *__return_ptr, void *, uint64_t (*)(uint64_t)))v13 + 1))(v42, v12, v13);
    uint64_t v14 = v43;
    uint64_t v15 = v44;
    __swift_project_boxed_opaque_existential_1(v42, v43);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  }
  else
  {
    sub_22E7A7224((uint64_t)aBlock, (uint64_t *)&unk_268610B40);
  }
  sub_22E7F1F08();
  swift_bridgeObjectRelease();
LABEL_13:
  sub_22E7A7224((uint64_t)v49, (uint64_t *)&unk_268610B40);
  id v16 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setTitle_, v16);

  (*(void (**)(void *__return_ptr))(**(void **)(v6 + 32) + 640))(aBlock);
  id v17 = v46;
  if (v46)
  {
    id v18 = v47;
    __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
    uint64_t v19 = (*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v18 + 6))(v17, v18);
    if (v19)
    {
      id v20 = (void *)v19;
      uint64_t v21 = *(void *)(v19 + *MEMORY[0x263F624B0] + 8);
      swift_bridgeObjectRetain();

      __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
      if (v21)
      {
        id v17 = (void *)sub_22E7F3E60();
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
    }
    id v17 = 0;
  }
  else
  {
    sub_22E7A7224((uint64_t)aBlock, &qword_268611E60);
  }
LABEL_20:
  objc_msgSend(a3, sel_setSubtitle_, v17);

  sub_22E7F3ED0();
  swift_retain();
  id v22 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
  uint64_t v47 = sub_22E7F1FD8;
  uint64_t v48 = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22E7E2F00;
  uint64_t v46 = &block_descriptor_32;
  id v23 = _Block_copy(aBlock);
  id v24 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v22, 0, v23);

  _Block_release(v23);
  swift_release();

  (*(void (**)(void *__return_ptr))(**(void **)(v6 + 32) + 640))(aBlock);
  id v25 = v46;
  if (!v46)
  {
    sub_22E7A7224((uint64_t)aBlock, &qword_268611E60);
    goto LABEL_26;
  }
  id v26 = v47;
  __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
  uint64_t v27 = (*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v26 + 6))(v25, v26);
  if (!v27)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
    goto LABEL_26;
  }
  id v28 = (void *)v27;
  uint64_t v29 = *(void *)(v27 + *MEMORY[0x263F624A0] + 8);
  swift_bridgeObjectRetain();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  if (!v29)
  {
LABEL_26:
    id v30 = objc_msgSend(self, sel_configurationWithPointSize_, 72.0);
    id v31 = (void *)sub_22E7F3E60();
    goto LABEL_27;
  }
  id v30 = objc_msgSend(self, sel_configurationWithPointSize_weight_, 3, 80.0);
  id v31 = (void *)sub_22E7F3E60();
  swift_bridgeObjectRelease();
LABEL_27:
  id v32 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v31, v30);

  if (v32)
  {
    id v33 = *(void (**)(void *__return_ptr))(**(void **)(v6 + 32) + 640);
    id v34 = v32;
    v33(aBlock);
    id v35 = v46;
    if (v46)
    {
      id v36 = v47;
      __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v46);
      id v37 = (char *)(*((uint64_t (**)(void *, uint64_t (*)(uint64_t)))v36 + 6))(v35, v36);
      if (v37
        && (uint64_t v38 = &v37[*MEMORY[0x263F62498]], v39 = *(void *)v38, v40 = v38[8], v37, (v40 & 1) == 0))
      {
        if (v39 != 1)
        {
          v42[0] = v39;
          sub_22E7F4220();
          __break(1u);
          return;
        }
        uint64_t v41 = objc_msgSend(self, sel_systemGreenColor);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
        uint64_t v41 = 0;
      }
    }
    else
    {
      sub_22E7A7224((uint64_t)aBlock, &qword_268611E60);
      uint64_t v41 = 0;
    }
    sub_22E7E38D0(a3, (uint64_t)v34, v41);
    swift_release();

    id v24 = v41;
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_22E7F19CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22E7F3FB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_22E7F3F80();
  swift_retain();
  uint64_t v7 = sub_22E7F3F70();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  void v8[2] = v7;
  v8[3] = v9;
  v8[4] = a2;
  sub_22E7AA784((uint64_t)v5, (uint64_t)&unk_268611E70, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_22E7F1AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_22E7F3F80();
  *(void *)(v4 + 24) = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  return MEMORY[0x270FA2498](sub_22E7F1B7C, v6, v5);
}

uint64_t sub_22E7F1B7C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_release();
  (*(void (**)(uint64_t))(**(void **)(v1 + 32) + 656))(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_22E7F1C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v5 = result;
    swift_beginAccess();
    uint64_t v6 = (void *)MEMORY[0x230FA4900](a3 + 16);
    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_viewController);
      uint64_t v8 = *(void *)(v5 + 32);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_22E7A9E30;
      *(void *)(v9 + 24) = v8;
      swift_retain_n();
      sub_22E7E324C(v7, (uint64_t)&unk_268611E50, v8, (uint64_t)&unk_268610E20, v9);
      swift_release();
      swift_unknownObjectRelease();

      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for PASUIAllSetProxCardAdapter()
{
  return self;
}

uint64_t sub_22E7F1D70()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7F1DA8()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EEE8]);
}

void sub_22E7F1DC0(uint64_t a1)
{
  sub_22E7F1290(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_22E7F1DC8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7F1E00()
{
  return objectdestroy_16Tm(MEMORY[0x263F8EED8]);
}

uint64_t sub_22E7F1E18(uint64_t a1)
{
  return sub_22E7F1C0C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22E7F1E20()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_22E7F1E70()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_22E7A7F00;
  return sub_22E7BBBD4(v0);
}

uint64_t sub_22E7F1F00(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22E7F1F08()
{
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E7F1FD8(uint64_t a1)
{
  return sub_22E7F19CC(a1, v1);
}

uint64_t sub_22E7F1FE0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7F2020(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A6D00;
  return sub_22E7F1AE4(a1, v4, v5, v6);
}

unint64_t sub_22E7F20E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PASUISourceErrorProxCardAdapter();
  uint64_t v4 = (void *)swift_allocObject();
  v4[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686106A8);
  swift_allocObject();
  v4[2] = sub_22E7F3050();
  swift_retain();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_22E7F41A0()) {
    unint64_t result = sub_22E7B7F44(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t result = MEMORY[0x263F8EE88];
  }
  v4[3] = result;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = &off_26E2337B8;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t PASFlowStepSourceError.buildView()()
{
  return sub_22E7F3D60();
}

unint64_t sub_22E7F21C0@<X0>(uint64_t a1@<X8>)
{
  return sub_22E7F20E0(a1);
}

void sub_22E7F21E4(void *a1)
{
  void (*v14)(id *__return_ptr, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id aBlock;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  uint64_t (*v34)(uint64_t);
  uint64_t v35;

  uint64_t v2 = v1;
  id v28 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B00);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610B08);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268611E38);
  uint64_t v11 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  id v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E7E237C(a1);
  uint64_t v14 = *(void (**)(id *__return_ptr, uint64_t))(**(void **)(v2 + 16) + 128);
  uint64_t v15 = swift_retain();
  v14(&aBlock, v15);
  swift_release();
  id v16 = v31;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v16 + 40))(ObjectType, v16);
  swift_unknownObjectRelease();
  sub_22E7B63A4();
  uint64_t aBlock = (id)sub_22E7F4050();
  id v18 = sub_22E7F4030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_22E7B6540(&qword_268610B20, &qword_268610B08);
  sub_22E7B63E4();
  sub_22E7F3620();
  sub_22E7A7224((uint64_t)v6, &qword_268610B00);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  id v20 = swift_allocObject();
  uint64_t v21 = v28;
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v21;
  sub_22E7B6540(&qword_268611E40, &qword_268611E38);
  swift_unknownObjectRetain();
  id v22 = v29;
  sub_22E7F3630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  swift_beginAccess();
  sub_22E7F35A0();
  swift_endAccess();
  swift_release();
  id v23 = swift_allocObject();
  swift_weakInit();
  id v24 = swift_allocObject();
  *(void *)(v24 + 16) = sub_22E7F2CB0;
  *(void *)(v24 + 24) = v23;
  swift_retain_n();
  id v25 = (void *)sub_22E7F3E60();
  id v34 = sub_22E7BC894;
  id v35 = v24;
  uint64_t aBlock = (id)MEMORY[0x263EF8330];
  id v31 = 1107296256;
  id v32 = sub_22E7E2F00;
  id v33 = &block_descriptor_14;
  id v26 = _Block_copy(&aBlock);
  uint64_t v27 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v25, 0, v26);

  _Block_release(v26);
  swift_release_n();
  swift_release();
  objc_msgSend(v21, sel_setDismissButtonAction_, v27);
}

void sub_22E7F26F8(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_22E7B6584(a1, (uint64_t)v18);
    uint64_t v5 = v19;
    if (v19)
    {
      uint64_t v6 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v6 + 8))(v15, v5, v6);
      uint64_t v7 = v16;
      uint64_t v8 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
    else
    {
      sub_22E7A7224((uint64_t)v18, (uint64_t *)&unk_268610B40);
    }
    sub_22E7F2DFC();
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setTitle_, v9);

    sub_22E7B6584(a1, (uint64_t)v18);
    uint64_t v10 = v19;
    if (v19)
    {
      uint64_t v11 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v11 + 8))(v15, v10, v11);
      uint64_t v12 = v16;
      uint64_t v13 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
    else
    {
      sub_22E7A7224((uint64_t)v18, (uint64_t *)&unk_268610B40);
    }
    sub_22E7F2DFC();
    swift_bridgeObjectRelease();
    uint64_t v14 = (void *)sub_22E7F3E60();
    swift_bridgeObjectRelease();
    objc_msgSend(a3, sel_setSubtitle_, v14);
    swift_release();
  }
}

uint64_t sub_22E7F2990()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268610CF0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = sub_22E7F3FB0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    sub_22E7F3F80();
    swift_retain();
    uint64_t v6 = sub_22E7F3F70();
    uint64_t v7 = (void *)swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8F500];
    long long v7[2] = v6;
    v7[3] = v8;
    v7[4] = v4;
    sub_22E7AA784((uint64_t)v2, (uint64_t)&unk_268611E80, (uint64_t)v7);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_22E7F2ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_22E7F3F80();
  v4[3] = sub_22E7F3F70();
  uint64_t v6 = sub_22E7F3F50();
  v4[4] = v6;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_22E7F2B74, v6, v5);
}

uint64_t sub_22E7F2B74()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22E7A6348;
  return MEMORY[0x270F589B8]();
}

uint64_t type metadata accessor for PASUISourceErrorProxCardAdapter()
{
  return self;
}

uint64_t sub_22E7F2C30()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22E7F2C68()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22E7F2CA8(uint64_t a1)
{
  sub_22E7F26F8(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_22E7F2CB0()
{
  return sub_22E7F2990();
}

uint64_t sub_22E7F2CB8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_22E7F2D08()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22E7F2D48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_22E7A6D00;
  return sub_22E7F2ADC(a1, v4, v5, v6);
}

uint64_t sub_22E7F2DFC()
{
  sub_22E7F4130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22E7F3EF0();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_22E7F3ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PASUITargetViewPresenterError.code.getter(unsigned __int8 a1)
{
  return a1 + 1100;
}

uint64_t PASUISourceViewPresenterError.code.getter(unsigned __int8 a1)
{
  return a1 + 1200;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_22E7F2F00()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_22E7F2F10()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_22E7F2F20()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_22E7F2F30()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_22E7F2F40()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_22E7F2F50()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22E7F2F60()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22E7F2F70()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22E7F2F80()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22E7F2F90()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22E7F2FA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22E7F2FB0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22E7F2FC0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22E7F2FD0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22E7F2FF0()
{
  return MEMORY[0x270EEB960]();
}

uint64_t sub_22E7F3000()
{
  return MEMORY[0x270EEB968]();
}

uint64_t sub_22E7F3010()
{
  return MEMORY[0x270EEB9A8]();
}

uint64_t sub_22E7F3020()
{
  return MEMORY[0x270EEB9B0]();
}

uint64_t sub_22E7F3030()
{
  return MEMORY[0x270EEB9B8]();
}

uint64_t sub_22E7F3040()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_22E7F3050()
{
  return MEMORY[0x270F588E0]();
}

uint64_t sub_22E7F3060()
{
  return MEMORY[0x270F588E8]();
}

uint64_t sub_22E7F3070()
{
  return MEMORY[0x270F588F0]();
}

uint64_t sub_22E7F3080()
{
  return MEMORY[0x270F588F8]();
}

uint64_t sub_22E7F3090()
{
  return MEMORY[0x270F58900]();
}

uint64_t sub_22E7F30A0()
{
  return MEMORY[0x270F58908]();
}

uint64_t sub_22E7F30B0()
{
  return MEMORY[0x270F58910]();
}

uint64_t sub_22E7F30C0()
{
  return MEMORY[0x270F58918]();
}

uint64_t sub_22E7F30D0()
{
  return MEMORY[0x270F58920]();
}

uint64_t sub_22E7F30E0()
{
  return MEMORY[0x270F58928]();
}

uint64_t sub_22E7F30F0()
{
  return MEMORY[0x270F58930]();
}

uint64_t sub_22E7F3100()
{
  return MEMORY[0x270F58938]();
}

uint64_t sub_22E7F3120()
{
  return MEMORY[0x270F58948]();
}

uint64_t sub_22E7F3140()
{
  return MEMORY[0x270F58958]();
}

uint64_t sub_22E7F3160()
{
  return MEMORY[0x270F58968]();
}

uint64_t sub_22E7F3170()
{
  return MEMORY[0x270F58970]();
}

uint64_t sub_22E7F3180()
{
  return MEMORY[0x270F58978]();
}

uint64_t sub_22E7F3190()
{
  return MEMORY[0x270F58980]();
}

uint64_t sub_22E7F31A0()
{
  return MEMORY[0x270F58988]();
}

uint64_t sub_22E7F31B0()
{
  return MEMORY[0x270F58990]();
}

uint64_t sub_22E7F31C0()
{
  return MEMORY[0x270F58998]();
}

uint64_t sub_22E7F31D0()
{
  return MEMORY[0x270F589A0]();
}

uint64_t sub_22E7F31E0()
{
  return MEMORY[0x270F589A8]();
}

uint64_t sub_22E7F31F0()
{
  return MEMORY[0x270F589B0]();
}

uint64_t sub_22E7F3220()
{
  return MEMORY[0x270F589C8]();
}

uint64_t sub_22E7F3230()
{
  return MEMORY[0x270F589D0]();
}

uint64_t sub_22E7F3240()
{
  return MEMORY[0x270F589D8]();
}

uint64_t sub_22E7F3250()
{
  return MEMORY[0x270F589E0]();
}

uint64_t sub_22E7F3260()
{
  return MEMORY[0x270F589E8]();
}

uint64_t sub_22E7F3270()
{
  return MEMORY[0x270F589F0]();
}

uint64_t sub_22E7F3290()
{
  return MEMORY[0x270F58A00]();
}

uint64_t sub_22E7F32A0()
{
  return MEMORY[0x270F58A08]();
}

uint64_t sub_22E7F32D0()
{
  return MEMORY[0x270F58A20]();
}

uint64_t sub_22E7F32E0()
{
  return MEMORY[0x270F58A28]();
}

uint64_t sub_22E7F32F0()
{
  return MEMORY[0x270F58A30]();
}

uint64_t sub_22E7F3300()
{
  return MEMORY[0x270F58A38]();
}

uint64_t sub_22E7F3310()
{
  return MEMORY[0x270F58A40]();
}

uint64_t sub_22E7F3320()
{
  return MEMORY[0x270F58A48]();
}

uint64_t sub_22E7F3330()
{
  return MEMORY[0x270F58A50]();
}

uint64_t sub_22E7F3340()
{
  return MEMORY[0x270F58A58]();
}

uint64_t sub_22E7F3350()
{
  return MEMORY[0x270F58A60]();
}

uint64_t sub_22E7F3360()
{
  return MEMORY[0x270F58A68]();
}

uint64_t sub_22E7F3370()
{
  return MEMORY[0x270F58A70]();
}

uint64_t sub_22E7F3380()
{
  return MEMORY[0x270F58A78]();
}

uint64_t sub_22E7F33A0()
{
  return MEMORY[0x270F58A88]();
}

uint64_t sub_22E7F33B0()
{
  return MEMORY[0x270F58A90]();
}

uint64_t sub_22E7F33C0()
{
  return MEMORY[0x270F58A98]();
}

uint64_t sub_22E7F33E0()
{
  return MEMORY[0x270F58AA8]();
}

uint64_t sub_22E7F3410()
{
  return MEMORY[0x270F58AC0]();
}

uint64_t sub_22E7F3420()
{
  return MEMORY[0x270F58AC8]();
}

uint64_t sub_22E7F3430()
{
  return MEMORY[0x270F58AD0]();
}

uint64_t sub_22E7F3440()
{
  return MEMORY[0x270F58AD8]();
}

uint64_t sub_22E7F3450()
{
  return MEMORY[0x270F58AE0]();
}

uint64_t sub_22E7F3460()
{
  return MEMORY[0x270F58AE8]();
}

uint64_t sub_22E7F3470()
{
  return MEMORY[0x270F58AF0]();
}

uint64_t sub_22E7F3480()
{
  return MEMORY[0x270F58AF8]();
}

uint64_t sub_22E7F34A0()
{
  return MEMORY[0x270F58B08]();
}

uint64_t sub_22E7F34B0()
{
  return MEMORY[0x270F58B10]();
}

uint64_t sub_22E7F34C0()
{
  return MEMORY[0x270F58B18]();
}

uint64_t sub_22E7F34D0()
{
  return MEMORY[0x270F58B20]();
}

uint64_t sub_22E7F34E0()
{
  return MEMORY[0x270F58B28]();
}

uint64_t sub_22E7F3500()
{
  return MEMORY[0x270F58B38]();
}

uint64_t sub_22E7F3510()
{
  return MEMORY[0x270F58B40]();
}

uint64_t sub_22E7F3560()
{
  return MEMORY[0x270F58B68]();
}

uint64_t sub_22E7F3570()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22E7F3580()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22E7F3590()
{
  return MEMORY[0x270EE3848]();
}

uint64_t sub_22E7F35A0()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_22E7F35B0()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_22E7F35C0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_22E7F35D0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_22E7F35E0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_22E7F35F0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_22E7F3600()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_22E7F3610()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_22E7F3620()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_22E7F3630()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_22E7F3640()
{
  return MEMORY[0x270EE4010]();
}

uint64_t sub_22E7F3650()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_22E7F3660()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_22E7F3670()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_22E7F3680()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_22E7F3690()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_22E7F36A0()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_22E7F36B0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_22E7F36C0()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_22E7F36D0()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_22E7F36E0()
{
  return MEMORY[0x270EFF3A8]();
}

uint64_t sub_22E7F36F0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_22E7F3700()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_22E7F3710()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_22E7F3720()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_22E7F3730()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_22E7F3740()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_22E7F3750()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_22E7F3760()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_22E7F3770()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_22E7F3780()
{
  return MEMORY[0x270EFFB38]();
}

uint64_t sub_22E7F3790()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_22E7F37A0()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_22E7F37B0()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_22E7F37C0()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_22E7F37D0()
{
  return MEMORY[0x270EFFCD8]();
}

uint64_t sub_22E7F37E0()
{
  return MEMORY[0x270EFFCF8]();
}

uint64_t sub_22E7F37F0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_22E7F3800()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_22E7F3810()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_22E7F3820()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_22E7F3830()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_22E7F3840()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_22E7F3850()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_22E7F3860()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_22E7F3870()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_22E7F3880()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_22E7F3890()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_22E7F38A0()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_22E7F38B0()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_22E7F38C0()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_22E7F38D0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_22E7F38E0()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_22E7F38F0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_22E7F3900()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_22E7F3910()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_22E7F3920()
{
  return MEMORY[0x270F017E8]();
}

uint64_t sub_22E7F3930()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_22E7F3940()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_22E7F3950()
{
  return MEMORY[0x270F02310]();
}

uint64_t sub_22E7F3960()
{
  return MEMORY[0x270F02330]();
}

uint64_t sub_22E7F3970()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_22E7F3980()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_22E7F3990()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_22E7F39A0()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_22E7F39B0()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_22E7F39D0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_22E7F39E0()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_22E7F39F0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_22E7F3A10()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_22E7F3A20()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_22E7F3A30()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_22E7F3A40()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_22E7F3A50()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_22E7F3A60()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_22E7F3A70()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_22E7F3A80()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_22E7F3A90()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_22E7F3AA0()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_22E7F3AB0()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_22E7F3AC0()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_22E7F3AD0()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_22E7F3AE0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_22E7F3AF0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_22E7F3B00()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_22E7F3B10()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_22E7F3B20()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22E7F3B30()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22E7F3B40()
{
  return MEMORY[0x270F03340]();
}

uint64_t sub_22E7F3B50()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_22E7F3B60()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_22E7F3B70()
{
  return MEMORY[0x270F036A8]();
}

uint64_t sub_22E7F3B80()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22E7F3B90()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_22E7F3BA0()
{
  return MEMORY[0x270F038D0]();
}

uint64_t sub_22E7F3BB0()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_22E7F3BC0()
{
  return MEMORY[0x270F03A58]();
}

uint64_t sub_22E7F3BD0()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_22E7F3BE0()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_22E7F3BF0()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_22E7F3C00()
{
  return MEMORY[0x270F03E58]();
}

uint64_t sub_22E7F3C10()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_22E7F3C20()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_22E7F3C30()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_22E7F3C40()
{
  return MEMORY[0x270F04140]();
}

uint64_t sub_22E7F3C50()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_22E7F3C60()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_22E7F3C70()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_22E7F3C80()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_22E7F3C90()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_22E7F3CA0()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_22E7F3CB0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_22E7F3CC0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_22E7F3CD0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_22E7F3CE0()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_22E7F3CF0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_22E7F3D00()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_22E7F3D10()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_22E7F3D20()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_22E7F3D30()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_22E7F3D40()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_22E7F3D50()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_22E7F3D60()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_22E7F3D70()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_22E7F3D80()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_22E7F3D90()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_22E7F3DA0()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_22E7F3DB0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_22E7F3DC0()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_22E7F3DD0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22E7F3DE0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22E7F3DF0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22E7F3E00()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22E7F3E10()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22E7F3E20()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_22E7F3E30()
{
  return MEMORY[0x270F58B70]();
}

uint64_t sub_22E7F3E40()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22E7F3E50()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22E7F3E60()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22E7F3E70()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22E7F3E80()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22E7F3E90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22E7F3EA0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22E7F3EB0()
{
  return MEMORY[0x270F58B78]();
}

uint64_t sub_22E7F3EC0()
{
  return MEMORY[0x270F58B80]();
}

uint64_t sub_22E7F3ED0()
{
  return MEMORY[0x270F58B88]();
}

uint64_t sub_22E7F3EE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22E7F3EF0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22E7F3F00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22E7F3F10()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22E7F3F20()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22E7F3F30()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22E7F3F40()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22E7F3F50()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22E7F3F60()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_22E7F3F70()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22E7F3F80()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22E7F3F90()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_22E7F3FA0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22E7F3FB0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22E7F3FC0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_22E7F3FD0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22E7F3FE0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22E7F3FF0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22E7F4000()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22E7F4010()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22E7F4020()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22E7F4030()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_22E7F4040()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22E7F4050()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22E7F4060()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22E7F4070()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22E7F4080()
{
  return MEMORY[0x270EEB9E0]();
}

uint64_t sub_22E7F4090()
{
  return MEMORY[0x270EEB9F8]();
}

uint64_t sub_22E7F40A0()
{
  return MEMORY[0x270EEBA08]();
}

uint64_t sub_22E7F40B0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22E7F40C0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22E7F40D0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22E7F40E0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22E7F40F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22E7F4100()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22E7F4110()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22E7F4120()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22E7F4130()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22E7F4140()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22E7F4150()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_22E7F4160()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22E7F4170()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22E7F4180()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22E7F4190()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22E7F41A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22E7F41B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22E7F41C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22E7F41E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22E7F41F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22E7F4210()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22E7F4220()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22E7F4250()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22E7F4260()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22E7F4270()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22E7F4280()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22E7F4290()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22E7F42A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22E7F42B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22E7F42C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22E7F42D0()
{
  return MEMORY[0x270FA0128]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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