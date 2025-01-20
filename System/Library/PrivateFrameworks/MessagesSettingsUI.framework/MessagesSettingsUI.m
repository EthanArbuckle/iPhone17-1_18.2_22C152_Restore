id MessagesSettingsLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v1 = a1;
  v2 = CommunicationsSetupUIBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"Messages"];

  return v3;
}

void sub_2561E103C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_2561E1F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E20AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E2214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E2368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E2488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E2724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E29D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E2C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E2F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E316C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E3418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E36C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2561E4420(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_2561E5064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2561E7B1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2561E87CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2561EC38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Block_object_dispose((const void *)(v23 - 112), 8);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2561EC7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__getICQCurrentInAppMessageChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  result = dlsym(v2, "ICQCurrentInAppMessageChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQCurrentInAppMessageChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t iCloudQuotaUILibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __iCloudQuotaUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2653F54D0;
    uint64_t v5 = 0;
    iCloudQuotaUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = iCloudQuotaUILibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!iCloudQuotaUILibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __iCloudQuotaUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudQuotaUILibraryCore_frameworkLibrary = result;
  return result;
}

void *__getICQInAppMessageKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  uint64_t result = dlsym(v2, "ICQInAppMessageKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQInAppMessageKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getICQInAppMessagingClass_block_invoke(uint64_t a1)
{
  iCloudQuotaUILibrary();
  Class result = objc_getClass("ICQInAppMessaging");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getICQInAppMessagingClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getICQInAppMessagingClass_block_invoke_cold_1();
    return (Class)__getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  Class result = dlsym(v2, "ICQUIMessagePlacementInSettingsAppDetail");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQUIMessagePlacementInSettingsAppDetailSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getICQUIInAppMessageReasonServerUnreachableSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  Class result = dlsym(v2, "ICQUIInAppMessageReasonServerUnreachable");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQUIInAppMessageReasonServerUnreachableSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  Class result = dlsym(v2, "ICQUIInAppMessageReasonAirplaneModeOn");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQUIInAppMessageReasonAirplaneModeOnSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getICQUIInAppMessageReasonCellularDataOffSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  Class result = dlsym(v2, "ICQUIInAppMessageReasonCellularDataOff");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQUIInAppMessageReasonCellularDataOffSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  Class result = dlsym(v2, "ICQUIInAppMessageReasoniCloudAlmostFull");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQUIInAppMessageReasoniCloudAlmostFullSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getICQUIInAppMessageReasoniCloudFullSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)iCloudQuotaUILibrary();
  Class result = dlsym(v2, "ICQUIInAppMessageReasoniCloudFull");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getICQUIInAppMessageReasoniCloudFullSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _SMSRelayActiveDevicesChanged(uint64_t a1, void *a2)
{
  return [a2 reload];
}

void sub_2561F0C60(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2561F0C00);
  }
  _Unwind_Resume(a1);
}

void sub_2561F1270(void *a1@<X8>)
{
  *a1 = *v1;
}

ValueMetadata *type metadata accessor for IMessageAppsView()
{
  return &type metadata for IMessageAppsView;
}

unint64_t sub_2561F1290()
{
  unint64_t result = qword_269F51150;
  if (!qword_269F51150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51150);
  }
  return result;
}

id sub_2561F12E4()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_iMessageAppsViewController);

  return v1;
}

uint64_t sub_2561F1354()
{
  return sub_25620EF58();
}

uint64_t sub_2561F1390()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_2561F139C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2561F14A8();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2561F1400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2561F14A8();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_2561F1464()
{
  return sub_25620F138();
}

void sub_2561F1480()
{
}

unint64_t sub_2561F14A8()
{
  unint64_t result = qword_269F51158;
  if (!qword_269F51158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51158);
  }
  return result;
}

ValueMetadata *type metadata accessor for CKWrappedSpecifierView()
{
  return &type metadata for CKWrappedSpecifierView;
}

uint64_t sub_2561F150C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561F1528(char *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51160);
  MEMORY[0x270FA5388](v2);
  long long v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51168);
  MEMORY[0x270FA5388](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51170);
  MEMORY[0x270FA5388](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier], sel_cellType);
  uint64_t v12 = sub_25620EEA8();
  if (v11 == (id)6)
  {
    *(void *)v10 = v12;
    *((void *)v10 + 1) = 0;
    v10[16] = 1;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51190);
    sub_2561F1800(a1, (uint64_t)&v10[*(int *)(v13 + 44)]);
    sub_2561F2418((uint64_t)v10, (uint64_t)v7, &qword_269F51170);
    swift_storeEnumTagMultiPayload();
    sub_2561F26BC(&qword_269F51180, &qword_269F51170);
    sub_2561F26BC(&qword_269F51188, &qword_269F51160);
    sub_25620EEF8();
    uint64_t v14 = (uint64_t)v10;
    v15 = &qword_269F51170;
  }
  else
  {
    *(void *)long long v4 = v12;
    *((void *)v4 + 1) = 0;
    v4[16] = 1;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51178);
    sub_2561F1C94(a1, (uint64_t)&v4[*(int *)(v16 + 44)]);
    sub_2561F2418((uint64_t)v4, (uint64_t)v7, &qword_269F51160);
    swift_storeEnumTagMultiPayload();
    sub_2561F26BC(&qword_269F51180, &qword_269F51170);
    sub_2561F26BC(&qword_269F51188, &qword_269F51160);
    sub_25620EEF8();
    uint64_t v14 = (uint64_t)v4;
    v15 = &qword_269F51160;
  }
  return sub_2561F247C(v14, v15);
}

void sub_2561F1800(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25620EE98();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = &v43[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51198);
  uint64_t v46 = *(void *)(v7 - 8);
  uint64_t v47 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = &v43[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511A0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v48 = &v43[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = &v43[-v15];
  MEMORY[0x270FA5388](v14);
  v45 = &v43[-v17];
  uint64_t v18 = a1;
  int v44 = sub_25620EFE8();
  sub_25620ED58();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  id v27 = objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier], sel_name);
  if (v27)
  {
    v28 = v27;
    uint64_t v29 = sub_25620F3C8();
    unint64_t v31 = v30;
  }
  else
  {
    uint64_t v29 = 0;
    unint64_t v31 = 0xE000000000000000;
  }
  uint64_t v51 = v29;
  unint64_t v52 = v31;
  v32 = (void *)swift_allocObject();
  v32[2] = 0;
  v32[3] = 0;
  v32[4] = v18;
  v33 = (void *)swift_allocObject();
  v33[2] = 0;
  v33[3] = 0;
  v33[4] = v18;
  v34 = v18;
  sub_25620F338();
  sub_2561F2538();
  sub_25620F2D8();
  sub_25620EE88();
  sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
  sub_2561F258C();
  uint64_t v35 = v47;
  uint64_t v36 = v50;
  sub_25620F128();
  (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v6, v36);
  (*(void (**)(unsigned char *, uint64_t))(v46 + 8))(v9, v35);
  v37 = v45;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 32))(v45, v16, v10);
  v38 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
  v39 = v48;
  v38(v48, v37, v10);
  *(void *)a2 = v34;
  *(unsigned char *)(a2 + 8) = v44;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v22;
  *(void *)(a2 + 32) = v24;
  *(void *)(a2 + 40) = v26;
  *(unsigned char *)(a2 + 48) = 0;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511C0);
  v38((unsigned char *)(a2 + *(int *)(v40 + 48)), v39, v10);
  v41 = *(void (**)(unsigned char *, uint64_t))(v11 + 8);
  v42 = v34;
  v41(v37, v10);
  v41(v39, v10);
}

void sub_2561F1C94(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511C8);
  MEMORY[0x270FA5388](v45);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511D0);
  uint64_t v43 = *(void *)(v47 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v47);
  uint64_t v46 = &v40[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v42 = &v40[-v7];
  MEMORY[0x270FA5388](v6);
  int v44 = &v40[-v8];
  id v9 = a1;
  int v41 = sub_25620EFE8();
  sub_25620ED58();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = (char *)v9;
  uint64_t v19 = sub_25620EDD8();
  char v20 = sub_25620EFD8();
  v48 = v18;
  uint64_t v49 = v19;
  LOBYTE(v50) = v20;
  id v21 = objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier], sel_name);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = sub_25620F3C8();
    unint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v25 = 0xE000000000000000;
  }
  uint64_t v52 = v23;
  unint64_t v53 = v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511D8);
  unint64_t v27 = sub_2561F25E4();
  unint64_t v28 = sub_2561F2538();
  sub_25620F158();

  uint64_t v29 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v29);
  *(void *)&v40[-16] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F511F0);
  sub_2561F26BC(&qword_269F511F8, &qword_269F511F0);
  v48 = (char *)v26;
  uint64_t v49 = MEMORY[0x263F8D310];
  unint64_t v50 = v27;
  unint64_t v51 = v28;
  swift_getOpaqueTypeConformance2();
  unint64_t v30 = v42;
  sub_25620EDA8();
  uint64_t v31 = v43;
  v32 = v44;
  v33 = v30;
  uint64_t v34 = v47;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v43 + 32))(v44, v33, v47);
  uint64_t v35 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v31 + 16);
  uint64_t v36 = v46;
  v35(v46, v32, v34);
  *(void *)a2 = v18;
  *(unsigned char *)(a2 + 8) = v41;
  *(void *)(a2 + 16) = v11;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v15;
  *(void *)(a2 + 40) = v17;
  *(unsigned char *)(a2 + 48) = 0;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51200);
  v35((unsigned char *)(a2 + *(int *)(v37 + 48)), v36, v34);
  v38 = *(void (**)(unsigned char *, uint64_t))(v31 + 8);
  v39 = v18;
  v38(v32, v34);
  v38(v36, v34);
}

__n128 sub_2561F207C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25620EEA8();
  uint64_t v5 = sub_25620EED8();
  sub_2561F2100(a1, (uint64_t)&v11);
  char v6 = v12;
  uint64_t v7 = v13;
  __n128 result = v11;
  long long v9 = v14;
  long long v10 = v15;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(__n128 *)(a2 + 48) = result;
  *(unsigned char *)(a2 + 64) = v6;
  *(void *)(a2 + 72) = v7;
  *(_OWORD *)(a2 + 80) = v9;
  *(_OWORD *)(a2 + 96) = v10;
  return result;
}

uint64_t sub_2561F2100@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_name);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_25620F3C8();
  }
  sub_2561F2538();
  uint64_t v5 = sub_25620F0D8();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_25620F198();
  uint64_t v10 = sub_25620F088();
  uint64_t v37 = v11;
  char v36 = v12;
  uint64_t v14 = v13;
  swift_release();
  sub_2561F2700(v5, v7, v9);
  swift_bridgeObjectRelease();
  sub_2561F9458();
  if (v15)
  {
    uint64_t v16 = sub_25620F0D8();
    uint64_t v18 = v17;
    char v20 = v19 & 1;
    sub_25620F028();
    uint64_t v35 = sub_25620F0B8();
    uint64_t v22 = v21;
    char v24 = v23;
    swift_release();
    char v34 = v24 & 1;
    sub_2561F2700(v16, v18, v20);
    swift_bridgeObjectRelease();
    sub_25620F1A8();
    uint64_t v25 = sub_25620F088();
    uint64_t v27 = v26;
    char v29 = v28;
    uint64_t v31 = v30;
    swift_release();
    uint64_t v32 = v29 & 1;
    sub_2561F2700(v35, v22, v34);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v27 = 0;
    uint64_t v32 = 0;
    uint64_t v31 = 0;
  }
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v37;
  *(unsigned char *)(a2 + 16) = v36 & 1;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v25;
  *(void *)(a2 + 40) = v27;
  *(void *)(a2 + 48) = v32;
  *(void *)(a2 + 56) = v31;
  sub_2561F2710(v10, v37, v36 & 1);
  swift_bridgeObjectRetain();
  sub_2561F2720(v25, v27, v32, v31);
  sub_2561F2764(v25, v27, v32, v31);
  sub_2561F2700(v10, v37, v36 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2561F2384()
{
  return sub_2561F1528(*v0);
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

uint64_t sub_2561F2418(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2561F247C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2561F24DC@<X0>(unsigned char *a1@<X8>)
{
  return sub_2561F9244(*(void *)(v1 + 32), a1);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2561F252C(uint64_t a1)
{
  sub_2561F9308(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_2561F2538()
{
  unint64_t result = qword_269F511A8;
  if (!qword_269F511A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F511A8);
  }
  return result;
}

unint64_t sub_2561F258C()
{
  unint64_t result = qword_269F511B8;
  if (!qword_269F511B8)
  {
    sub_25620EE98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F511B8);
  }
  return result;
}

unint64_t sub_2561F25E4()
{
  unint64_t result = qword_269F511E0;
  if (!qword_269F511E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F511D8);
    sub_2561F2660();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F511E0);
  }
  return result;
}

unint64_t sub_2561F2660()
{
  unint64_t result = qword_269F511E8;
  if (!qword_269F511E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F511E8);
  }
  return result;
}

double sub_2561F26B4@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_2561F207C(*(void *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_2561F26BC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2561F2700(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2561F2710(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2561F2720(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2561F2710(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2561F2764(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2561F2700(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_2561F27AC()
{
  unint64_t result = qword_269F51208;
  if (!qword_269F51208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51210);
    sub_2561F26BC(&qword_269F51180, &qword_269F51170);
    sub_2561F26BC(&qword_269F51188, &qword_269F51160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51208);
  }
  return result;
}

uint64_t sub_2561F286C(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    char v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *uint64_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        uint64_t v16 = &v8[8 * v9];
        uint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)uint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  char v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_25620F3A8();
}

uint64_t sub_2561F2A30()
{
  swift_getKeyPath();
  sub_2561F6564(&qword_269F51230, (void (*)(uint64_t))type metadata accessor for CheckInDataView.Model);
  sub_25620ECF8();
  swift_release();
  uint64_t v0 = self;
  if (objc_msgSend(v0, sel_hasUserCompletedOnboarding)) {
    return objc_msgSend(v0, sel_shareAllLocations) ^ 1;
  }
  else {
    return 2;
  }
}

id sub_2561F2B08@<X0>(char *a1@<X8>)
{
  swift_getKeyPath();
  sub_2561F6564(&qword_269F51230, (void (*)(uint64_t))type metadata accessor for CheckInDataView.Model);
  sub_25620ECF8();
  swift_release();
  uint64_t v2 = self;
  id result = objc_msgSend(v2, sel_hasUserCompletedOnboarding);
  if (result)
  {
    id result = objc_msgSend(v2, sel_shareAllLocations);
    char v4 = result ^ 1;
  }
  else
  {
    char v4 = 2;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_2561F2BE8()
{
  return swift_release();
}

id sub_2561F2CB4(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t v2 = self;
  id result = objc_msgSend(v2, sel_setHasUserCompletedOnboarding_, v1 != 2);
  if (v1 != 2) {
    return objc_msgSend(v2, sel_setShareAllLocations_, (v1 & 1) == 0);
  }
  return result;
}

uint64_t sub_2561F2D28()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCV18MessagesSettingsUI15CheckInDataView5Model___observationRegistrar;
  uint64_t v2 = sub_25620ED18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2561F2DC8()
{
  return type metadata accessor for CheckInDataView.Model();
}

uint64_t type metadata accessor for CheckInDataView.Model()
{
  uint64_t result = qword_269F51220;
  if (!qword_269F51220) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2561F2E1C()
{
  uint64_t result = sub_25620ED18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_2561F2EB4()
{
  return sub_2561F2CB4(*(unsigned char *)(v0 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for CheckInDataView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CheckInDataView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *initializeWithCopy for CheckInDataView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CheckInDataView(void *a1, void *a2)
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
  a1[3] = a2[3];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for CheckInDataView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CheckInDataView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CheckInDataView(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CheckInDataView()
{
  return &type metadata for CheckInDataView;
}

uint64_t sub_2561F318C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561F31A8@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  v70 = a2;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51258);
  uint64_t v59 = *(void *)(v60 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v60);
  v65 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v63 = (char *)&v55 - v5;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51260);
  uint64_t v57 = *(void *)(v58 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v58);
  v62 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v55 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51268);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  v61 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v69 = (uint64_t)&v55 - v13;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51270);
  uint64_t v64 = *(void *)(v66 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v66);
  v68 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v55 - v16;
  v71 = a1;
  sub_2561F42E8(a1, v76);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51278);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51280);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51288);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51290);
  uint64_t v20 = sub_25620EE78();
  uint64_t v21 = sub_2561F26BC(&qword_269F51298, &qword_269F51290);
  uint64_t v72 = v19;
  v73 = (ValueMetadata *)v20;
  uint64_t v74 = v21;
  unint64_t v75 = MEMORY[0x263F19670];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v23 = sub_2561F61F8();
  uint64_t v72 = v18;
  v73 = &type metadata for SettingsModel.CheckInData;
  uint64_t v74 = OpaqueTypeConformance2;
  unint64_t v75 = v23;
  swift_getOpaqueTypeConformance2();
  sub_2561F624C();
  v67 = v17;
  sub_25620F388();
  *(_OWORD *)v76 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F512B0);
  sub_25620F248();
  uint64_t v24 = v72;
  swift_getKeyPath();
  v76[0] = v24;
  sub_2561F6564(&qword_269F51230, (void (*)(uint64_t))type metadata accessor for CheckInDataView.Model);
  sub_25620ECF8();
  swift_release();
  uint64_t v25 = self;
  if (objc_msgSend(v25, sel_hasUserCompletedOnboarding))
  {
    unsigned __int8 v26 = objc_msgSend(v25, sel_shareAllLocations);
    uint64_t v27 = swift_release();
    MEMORY[0x270FA5388](v27);
    *((unsigned char *)&v55 - 16) = v26 ^ 1;
    sub_2561F4784((uint64_t)v76);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F512C8);
    sub_2561F62C0();
    uint64_t v28 = v9;
    v56 = v9;
    uint64_t v29 = sub_25620F358();
    MEMORY[0x270FA5388](v29);
    *((unsigned char *)&v55 - 16) = v26 ^ 1;
    sub_2561F5024((uint64_t)v76);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F51318);
    sub_2561F26BC(&qword_269F51320, &qword_269F51318);
    uint64_t v30 = v63;
    sub_25620F388();
    uint64_t v31 = v57;
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
    v33 = v62;
    uint64_t v34 = v58;
    v32(v62, v28, v58);
    uint64_t v35 = v59;
    char v36 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
    uint64_t v37 = v60;
    v36(v65, v30, v60);
    uint64_t v38 = (uint64_t)v61;
    v32(v61, v33, v34);
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51328);
    uint64_t v40 = v65;
    v36((char *)(v38 + *(int *)(v39 + 48)), v65, v37);
    int v41 = *(void (**)(char *, uint64_t))(v35 + 8);
    v41(v63, v37);
    v42 = *(void (**)(char *, uint64_t))(v31 + 8);
    v42(v56, v34);
    v41(v40, v37);
    v42(v62, v34);
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F512B8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v38, 0, 1, v43);
    uint64_t v44 = v69;
    sub_2561F65AC(v38, v69, &qword_269F51268);
  }
  else
  {
    swift_release();
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F512B8);
    uint64_t v44 = v69;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v69, 1, 1, v45);
    uint64_t v38 = (uint64_t)v61;
  }
  uint64_t v46 = v64;
  uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  v48 = v67;
  uint64_t v49 = v68;
  uint64_t v50 = v66;
  v47(v68, v67, v66);
  sub_2561F2418(v44, v38, &qword_269F51268);
  unint64_t v51 = v70;
  v47(v70, v49, v50);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F512C0);
  sub_2561F2418(v38, (uint64_t)&v51[*(int *)(v52 + 48)], &qword_269F51268);
  sub_2561F247C(v44, &qword_269F51268);
  unint64_t v53 = *(void (**)(char *, uint64_t))(v46 + 8);
  v53(v48, v50);
  sub_2561F247C(v38, &qword_269F51268);
  return ((uint64_t (*)(char *, uint64_t))v53)(v49, v50);
}

uint64_t sub_2561F3A2C@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v37 = sub_25620EE78();
  uint64_t v33 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51290);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  uint64_t v32 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51288);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v34 = v9;
  uint64_t v35 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = *((void *)a1 + 2);
  uint64_t v12 = *((void *)a1 + 3);
  uint64_t v28 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v12;
  uint64_t v30 = *((void *)a1 + 4);
  uint64_t v45 = v13;
  *(void *)&long long v42 = v13;
  *((void *)&v42 + 1) = v12;
  uint64_t v43 = v30;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  long long v15 = v38;
  uint64_t v16 = v39;
  swift_getKeyPath();
  long long v38 = v15;
  uint64_t v39 = v16;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v38 = v42;
  LOBYTE(v39) = v43;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51358);
  sub_2561F6510();
  sub_2561F26BC(&qword_269F51368, &qword_269F51358);
  sub_25620F2A8();
  swift_release();
  swift_release();
  sub_25620EE68();
  uint64_t v17 = sub_2561F26BC(&qword_269F51298, &qword_269F51290);
  uint64_t v18 = v28;
  uint64_t v19 = v31;
  uint64_t v20 = v37;
  sub_25620F118();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v19);
  *(void *)&long long v38 = v13;
  *((void *)&v38 + 1) = v29;
  uint64_t v39 = v30;
  MEMORY[0x25A2A2F60](&v42, v14);
  uint64_t v21 = v42;
  swift_getKeyPath();
  *(void *)&long long v38 = v21;
  sub_2561F6564((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  char v22 = *(unsigned char *)(v21 + 35);
  swift_release();
  char v41 = v22;
  long long v42 = *a1;
  sub_2561F65AC((uint64_t)&v42 + 8, (uint64_t)v44, &qword_269F51378);
  uint64_t v23 = swift_allocObject();
  long long v24 = a1[1];
  *(_OWORD *)(v23 + 16) = *a1;
  *(_OWORD *)(v23 + 32) = v24;
  *(void *)(v23 + 48) = *((void *)a1 + 4);
  swift_retain();
  sub_2561F6670((uint64_t)v44);
  sub_2561F6670((uint64_t)&v45);
  swift_retain();
  swift_retain();
  *(void *)&long long v38 = v19;
  *((void *)&v38 + 1) = v37;
  uint64_t v39 = v17;
  uint64_t v40 = MEMORY[0x263F19670];
  swift_getOpaqueTypeConformance2();
  sub_2561F61F8();
  uint64_t v25 = v34;
  sub_25620F178();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v18, v25);
}

uint64_t sub_2561F3F7C@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v5 = (void *)sub_25620F3B8();
  uint64_t v6 = (void *)sub_25620F3B8();
  id v7 = objc_msgSend(v4, sel_localizedStringForKey_value_table_, v5, 0, v6);

  uint64_t v8 = sub_25620F3C8();
  uint64_t v10 = v9;

  uint64_t v28 = v8;
  uint64_t v29 = v10;
  sub_2561F2538();
  uint64_t v11 = sub_25620F0D8();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  LOBYTE(v7) = v16 & 1;
  id v17 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, v28, v29);
  uint64_t v18 = (void *)sub_25620F3B8();
  uint64_t v19 = (void *)sub_25620F3B8();
  id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

  sub_25620F3C8();
  uint64_t v21 = sub_25620F0D8();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v13;
  *(unsigned char *)(a1 + 16) = (_BYTE)v7;
  *(void *)(a1 + 24) = v15;
  *(_WORD *)(a1 + 32) = 257;
  *(void *)(a1 + 40) = v21;
  *(void *)(a1 + 48) = v22;
  *(unsigned char *)(a1 + 56) = v24 & 1;
  *(void *)(a1 + 64) = v26;
  *(_WORD *)(a1 + 72) = 0;
  sub_2561F2710(v11, v13, (char)v7);
  swift_bridgeObjectRetain();
  sub_2561F2710(v21, v23, v25);
  swift_bridgeObjectRetain();
  sub_2561F2700(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_2561F2700(v11, v13, (char)v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2561F41F4()
{
  return swift_release();
}

uint64_t sub_2561F42E8@<X0>(long long *a1@<X0>, uint64_t *a2@<X8>)
{
  long long v14 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F512B0);
  sub_25620F248();
  swift_getKeyPath();
  sub_2561F6564(&qword_269F51230, (void (*)(uint64_t))type metadata accessor for CheckInDataView.Model);
  sub_25620ECF8();
  swift_release();
  uint64_t v3 = self;
  if (objc_msgSend(v3, sel_hasUserCompletedOnboarding, v15, *((void *)&v14 + 1)))
  {
    objc_msgSend(v3, sel_shareAllLocations);
    swift_release();
    type metadata accessor for MessagesSettingsUtilities();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v6 = (void *)sub_25620F3B8();
    id v7 = (void *)sub_25620F3B8();
    id v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, 0, v7);

    sub_25620F3C8();
    sub_2561F2538();
    uint64_t result = sub_25620F0D8();
    uint64_t v13 = v12 & 1;
  }
  else
  {
    swift_release();
    uint64_t result = 0;
    uint64_t v10 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
  }
  *a2 = result;
  a2[1] = v10;
  a2[2] = v13;
  a2[3] = v11;
  return result;
}

double sub_2561F4504@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25620F1F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25620ED38();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (qword_269F51148 != -1) {
      swift_once();
    }
    char v12 = qword_269F53AD0;
  }
  else
  {
    if (qword_269F51140 != -1) {
      swift_once();
    }
    char v12 = qword_269F53AB8;
  }
  uint64_t v13 = __swift_project_value_buffer(v8, (uint64_t)v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v8);
  sub_25620F228();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B4B8], v4);
  uint64_t v14 = sub_25620F218();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v17[1] = sub_25620F188();
  uint64_t v15 = sub_25620F2E8();
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v15;
  double result = 0.0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(unsigned char *)(a2 + 64) = 0;
  return result;
}

uint64_t sub_2561F4784@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_2561F48AC@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51330);
  uint64_t v3 = MEMORY[0x270FA5388](v71);
  uint64_t v73 = (uint64_t)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v65 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v72 = (uint64_t)&v65 - v8;
  uint64_t v77 = sub_25620F038();
  uint64_t v79 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  v68 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269F51338);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v70 = (uint64_t)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v65 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v78 = (uint64_t)&v65 - v16;
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v75 = self;
  uint64_t v76 = ObjCClassFromMetadata;
  id v18 = objc_msgSend(v75, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v19 = (void *)sub_25620F3B8();
  v65 = "MPLE_DATA_FOOTER";
  id v20 = (void *)sub_25620F3B8();
  id v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, v20);

  uint64_t v22 = sub_25620F3C8();
  uint64_t v66 = v23;

  uint64_t v24 = 0;
  uint64_t v25 = 0;
  int v69 = a1;
  if ((a1 & 1) == 0)
  {
    id v26 = objc_msgSend(v75, sel_bundleForClass_, v76);
    uint64_t v27 = (void *)sub_25620F3B8();
    uint64_t v28 = (void *)sub_25620F3B8();
    uint64_t v29 = v22;
    id v30 = objc_msgSend(v26, sel_localizedStringForKey_value_table_, v27, 0, v28);

    uint64_t v24 = sub_25620F3C8();
    uint64_t v25 = v31;

    uint64_t v22 = v29;
  }
  uint64_t v80 = 0x4000000000000000;
  uint64_t v32 = *MEMORY[0x263F1A6C8];
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v79 + 104);
  uint64_t v34 = v68;
  v79 += 104;
  v67 = v33;
  v33(v68, v32, v77);
  sub_2561F647C();
  sub_25620ED68();
  uint64_t v35 = &v15[v10[7]];
  *(void *)uint64_t v35 = 0x656E6F687069;
  *((void *)v35 + 1) = 0xE600000000000000;
  uint64_t v36 = (uint64_t *)&v15[v10[8]];
  uint64_t v37 = v66;
  *uint64_t v36 = v22;
  v36[1] = v37;
  long long v38 = (uint64_t *)&v15[v10[9]];
  *long long v38 = v24;
  v38[1] = v25;
  sub_2561F4F90((uint64_t *)&v15[v10[10]]);
  sub_2561F65AC((uint64_t)v15, v78, &qword_269F51338);
  id v39 = objc_msgSend(v75, sel_bundleForClass_, v76);
  uint64_t v40 = (void *)sub_25620F3B8();
  char v41 = (void *)sub_25620F3B8();
  id v42 = objc_msgSend(v39, sel_localizedStringForKey_value_table_, v40, 0, v41);

  uint64_t v43 = sub_25620F3C8();
  uint64_t v45 = v44;

  uint64_t v46 = 0;
  uint64_t v47 = 0;
  if ((v69 & 1) == 0)
  {
    id v48 = objc_msgSend(v75, sel_bundleForClass_, v76);
    uint64_t v49 = (void *)sub_25620F3B8();
    uint64_t v50 = (void *)sub_25620F3B8();
    id v51 = objc_msgSend(v48, sel_localizedStringForKey_value_table_, v49, 0, v50);

    uint64_t v46 = sub_25620F3C8();
    uint64_t v47 = v52;
  }
  uint64_t v80 = 0x4000000000000000;
  v67(v34, v32, v77);
  sub_25620ED68();
  unint64_t v53 = (int *)v71;
  v54 = &v7[*(int *)(v71 + 28)];
  *(void *)v54 = 0x746177656C707061;
  *((void *)v54 + 1) = 0xEA00000000006863;
  uint64_t v55 = (uint64_t *)&v7[v53[8]];
  *uint64_t v55 = v43;
  v55[1] = v45;
  v56 = (uint64_t *)&v7[v53[9]];
  uint64_t *v56 = v46;
  v56[1] = v47;
  uint64_t v57 = v53[10];
  *(void *)&v7[v57] = sub_25620F1E8();
  uint64_t v58 = v72;
  sub_2561F65AC((uint64_t)v7, v72, &qword_269F51330);
  uint64_t v59 = v78;
  uint64_t v60 = v70;
  sub_2561F2418(v78, v70, &qword_269F51338);
  uint64_t v61 = v73;
  sub_2561F2418(v58, v73, &qword_269F51330);
  uint64_t v62 = v74;
  sub_2561F2418(v60, v74, &qword_269F51338);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51348);
  sub_2561F2418(v61, v62 + *(int *)(v63 + 48), &qword_269F51330);
  sub_2561F247C(v58, &qword_269F51330);
  sub_2561F247C(v59, &qword_269F51338);
  sub_2561F247C(v61, &qword_269F51330);
  return sub_2561F247C(v60, &qword_269F51338);
}

uint64_t sub_2561F4F90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25620F1E8();
  uint64_t v3 = sub_25620F1D8();
  uint64_t result = sub_25620F1E8();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = result;
  return result;
}

uint64_t sub_2561F5024@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_2561F514C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51410);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51418);
  uint64_t v5 = *(void *)(a1 + 16);
  sub_25620F398();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51420);
  sub_25620EDC8();
  swift_getTupleTypeMetadata2();
  sub_25620F398();
  swift_getWitnessTable();
  sub_25620F298();
  sub_25620EDC8();
  swift_getTupleTypeMetadata3();
  sub_25620F398();
  swift_getWitnessTable();
  uint64_t v6 = sub_25620F298();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v16[-v11];
  uint64_t v17 = v5;
  uint64_t v18 = v2;
  sub_25620EEA8();
  sub_25620F288();
  swift_getWitnessTable();
  uint64_t v13 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16);
  v13(v12, v10, v6);
  uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  v13(a2, v12, v6);
  return ((uint64_t (*)(unsigned char *, uint64_t))v14)(v12, v6);
}

uint64_t sub_2561F53EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a3;
  sub_25620F398();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51420);
  sub_25620EDC8();
  swift_getTupleTypeMetadata2();
  sub_25620F398();
  swift_getWitnessTable();
  uint64_t v5 = sub_25620F298();
  uint64_t v46 = *(void (***)(char *, uint64_t))(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v34 - v6;
  uint64_t v8 = sub_25620EDC8();
  uint64_t v55 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v51 = (char *)&v34 - v12;
  type metadata accessor for CheckInDataView.DeviceRow();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_25620F1E8();
  uint64_t v50 = sub_25620F018();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v42 = sub_25620EED8();
  sub_2561F5AB4(a1, (uint64_t)&v62);
  uint64_t v14 = v62;
  uint64_t v36 = v62;
  uint64_t v53 = v63;
  int v52 = v64;
  uint64_t v38 = v65;
  uint64_t v40 = v66;
  uint64_t v39 = v67;
  uint64_t v54 = v68;
  uint64_t v48 = v69;
  int v41 = v70;
  uint64_t v56 = a2;
  uint64_t v57 = a1;
  sub_25620EEA8();
  sub_25620F288();
  sub_25620EFF8();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25620F168();
  v46[1](v7, v5);
  v75[3] = WitnessTable;
  v75[4] = MEMORY[0x263F18C10];
  uint64_t v16 = v8;
  uint64_t v35 = v8;
  uint64_t v43 = swift_getWitnessTable();
  uint64_t v17 = v55;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  uint64_t v18 = v51;
  v37(v51, v11, v16);
  uint64_t v19 = *(void (***)(char *, uint64_t))(v17 + 8);
  uint64_t v55 = v17 + 8;
  uint64_t v46 = v19;
  ((void (*)(char *, uint64_t))v19)(v11, v16);
  uint64_t v44 = v13;
  v74[0] = v13;
  v74[1] = KeyPath;
  v74[2] = v50;
  uint64_t v62 = v42;
  uint64_t v63 = 0;
  unsigned __int8 v64 = 1;
  uint64_t v65 = v14;
  uint64_t v66 = v53;
  LOBYTE(v67) = v52;
  uint64_t v20 = v40;
  uint64_t v68 = v38;
  uint64_t v69 = v40;
  uint64_t v21 = v39;
  uint64_t v70 = v39;
  uint64_t v71 = v54;
  uint64_t v22 = v48;
  uint64_t v72 = v48;
  int v73 = v41;
  v75[0] = v74;
  v75[1] = &v62;
  uint64_t v45 = v11;
  uint64_t v23 = v18;
  uint64_t v24 = v35;
  v37(v11, v23, v35);
  v75[2] = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v25 = v36;
  uint64_t v26 = v53;
  char v27 = v52;
  sub_2561F2710(v36, v53, v52);
  swift_bridgeObjectRetain();
  sub_2561F2720(v20, v21, v54, v22);
  v61[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51410);
  v61[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51418);
  v61[2] = v24;
  unint64_t v58 = sub_2561F76E4();
  uint64_t v59 = sub_2561F26BC(&qword_269F51440, &qword_269F51418);
  uint64_t v60 = v43;
  sub_2561F286C((uint64_t)v75, 3uLL, (uint64_t)v61);
  uint64_t v28 = v46;
  ((void (*)(char *, uint64_t))v46)(v51, v24);
  sub_2561F2700(v25, v26, v27);
  swift_bridgeObjectRelease();
  sub_2561F2764(v20, v21, v54, v48);
  swift_release();
  swift_release();
  swift_release();
  ((void (*)(char *, uint64_t))v28)(v45, v24);
  uint64_t v29 = v69;
  uint64_t v30 = v70;
  char v31 = v71;
  uint64_t v32 = v72;
  sub_2561F2700(v65, v66, v67);
  swift_bridgeObjectRelease();
  sub_2561F2764(v29, v30, v31, v32);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2561F5AB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(type metadata accessor for CheckInDataView.DeviceRow() + 32));
  uint64_t v5 = v4[1];
  uint64_t v19 = *v4;
  uint64_t v20 = v5;
  sub_2561F2538();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25620F0D8();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_2561F5BDC(a1, &v19);
  uint64_t v13 = v19;
  uint64_t v14 = v20;
  uint64_t v15 = v21;
  uint64_t v16 = v22;
  int v17 = sub_25620EF08();
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v14;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v16;
  *(_DWORD *)(a2 + 64) = v17;
  sub_2561F2710(v6, v8, v12);
  swift_bridgeObjectRetain();
  sub_2561F2720(v13, v14, v15, v16);
  sub_2561F2764(v13, v14, v15, v16);
  sub_2561F2700(v6, v8, v12);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2561F5BDC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = type metadata accessor for CheckInDataView.DeviceRow();
  uint64_t v5 = *(void *)(a1 + *(int *)(result + 36) + 8);
  if (v5)
  {
    sub_2561F2538();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25620F0D8();
    uint64_t v8 = v7;
    char v10 = v9 & 1;
    sub_25620F048();
    uint64_t v5 = sub_25620F0B8();
    uint64_t v12 = v11;
    char v14 = v13;
    uint64_t v16 = v15;
    swift_release();
    uint64_t v17 = v14 & 1;
    sub_2561F2700(v6, v8, v10);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v17 = 0;
    uint64_t v16 = 0;
  }
  *a2 = v5;
  a2[1] = v12;
  a2[2] = v17;
  a2[3] = v16;
  return result;
}

uint64_t sub_2561F5CE4@<X0>(uint64_t a1@<X8>)
{
  v18[1] = a1;
  uint64_t v1 = sub_25620F208();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25620F398();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51420);
  uint64_t v5 = sub_25620EDC8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v18 - v10;
  type metadata accessor for CheckInDataView.DeviceRow();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F1B538], v1);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25620F108();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v13 = sub_2561F26BC(&qword_269F51448, &qword_269F51420);
  v22[2] = WitnessTable;
  v22[3] = v13;
  uint64_t v14 = swift_getWitnessTable();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v15(v11, v9, v5);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  uint64_t v20 = 0;
  char v21 = 1;
  v22[0] = &v20;
  v15(v9, v11, v5);
  v22[1] = v9;
  v19[0] = MEMORY[0x263F1B6B0];
  v19[1] = v5;
  v18[2] = MEMORY[0x263F1B698];
  v18[3] = v14;
  sub_2561F286C((uint64_t)v22, 2uLL, (uint64_t)v19);
  v16(v11, v5);
  return ((uint64_t (*)(char *, uint64_t))v16)(v9, v5);
}

uint64_t sub_2561F6004()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51238);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v5 = *(_OWORD *)(v0 + 16);
  v9[0] = *(_OWORD *)v0;
  v9[1] = v5;
  uint64_t v10 = *(void *)(v0 + 32);
  uint64_t v8 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51240);
  sub_2561F26BC(&qword_269F51248, &qword_269F51240);
  sub_25620F078();
  sub_25620EEB8();
  sub_2561F26BC(&qword_269F51250, &qword_269F51238);
  sub_25620F148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_2561F61E8@<X0>(char *a1@<X8>)
{
  return sub_2561F31A8(*(long long **)(v1 + 16), a1);
}

uint64_t sub_2561F61F0@<X0>(uint64_t a1@<X8>)
{
  return sub_2561F3A2C(*(long long **)(v1 + 16), a1);
}

unint64_t sub_2561F61F8()
{
  unint64_t result = qword_269F512A0;
  if (!qword_269F512A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F512A0);
  }
  return result;
}

unint64_t sub_2561F624C()
{
  unint64_t result = qword_269F512A8;
  if (!qword_269F512A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51280);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F512A8);
  }
  return result;
}

double sub_2561F62B8@<D0>(uint64_t a1@<X8>)
{
  return sub_2561F4504(*(unsigned char *)(v1 + 16), a1);
}

unint64_t sub_2561F62C0()
{
  unint64_t result = qword_269F512D0;
  if (!qword_269F512D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F512C8);
    sub_2561F6360();
    sub_2561F26BC(&qword_269F51308, &qword_269F51310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F512D0);
  }
  return result;
}

unint64_t sub_2561F6360()
{
  unint64_t result = qword_269F512D8;
  if (!qword_269F512D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F512E0);
    sub_2561F6400();
    sub_2561F26BC(&qword_269F512F8, &qword_269F51300);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F512D8);
  }
  return result;
}

unint64_t sub_2561F6400()
{
  unint64_t result = qword_269F512E8;
  if (!qword_269F512E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F512F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F512E8);
  }
  return result;
}

uint64_t sub_2561F6474@<X0>(uint64_t a1@<X8>)
{
  return sub_2561F48AC(*(unsigned __int8 *)(v1 + 16), a1);
}

unint64_t sub_2561F647C()
{
  unint64_t result = qword_269F51340;
  if (!qword_269F51340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51340);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_2561F6510()
{
  unint64_t result = qword_269F51360;
  if (!qword_269F51360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51360);
  }
  return result;
}

uint64_t sub_2561F6564(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2561F65AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2561F6610()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2561F6668()
{
  return sub_2561F41F4();
}

uint64_t sub_2561F6670(uint64_t a1)
{
  return a1;
}

uint64_t sub_2561F669C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

void sub_2561F66A4()
{
  sub_2561F75AC();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_2561F6784(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80);
  unsigned int v12 = v11 | *(_DWORD *)(v7 + 80) & 0xF8;
  if (v12 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v10 + 80)) & 0x100000) != 0
    || ((v11 + ((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v11)
     + *(void *)(*(void *)(v9 - 8) + 64) > 0x18)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + (((v12 | 7) + 16) & ~(unint64_t)(v12 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v16 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    uint64_t v17 = (void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v18 = (void *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v17 = *v18;
    v17[1] = v18[1];
    uint64_t v19 = (void *)(((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v20 = (void *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v19 = *v20;
    v19[1] = v20[1];
    char v21 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v22 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
    void *v21 = *v22;
    v21[1] = v22[1];
    uint64_t v23 = (char *)v22 + v11;
    uint64_t v24 = ((unint64_t)v21 + v11 + 16) & ~v11;
    uint64_t v25 = (unint64_t)(v23 + 16) & v16;
    uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v26(v24, v25, v9);
  }
  return a1;
}

uint64_t sub_2561F69A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v5 = *(void *)(v4 - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v5)(a1, v4);
  unint64_t v6 = (a1 + *(void *)(v5 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v8 = *(uint64_t (**)(unint64_t))(v7 + 8);
  unint64_t v9 = (((((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return v8(v9);
}

uint64_t sub_2561F6A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v7 = *(void *)(v6 - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(v7 + 48) + 7;
  unint64_t v9 = (void *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v9 = *v10;
  v9[1] = v10[1];
  uint64_t v11 = (void *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v12 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  uint64_t v13 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  uint64_t v15 = *(void *)(a3 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = ((unint64_t)v13 + v18 + 16) & ~v18;
  uint64_t v20 = ((unint64_t)v14 + v18 + 16) & ~v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v19, v20, v15);
  return a1;
}

uint64_t sub_2561F6BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v7 = *(void *)(v6 - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(v7 + 40) + 7;
  unint64_t v9 = (void *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v12 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 24))(((unint64_t)v13 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), ((unint64_t)v14 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_2561F6D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v7 = *(void *)(v6 - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(v7 + 32) + 7;
  unint64_t v9 = (_OWORD *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (_OWORD *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v9 = *v10;
  uint64_t v11 = (_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v12 = (_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  uint64_t v13 = (_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (_OWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  uint64_t v15 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 32))(((unint64_t)v13 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), ((unint64_t)v14 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_2561F6E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v7 = *(void *)(v6 - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v7)(a1, a2, v6);
  uint64_t v8 = *(void *)(v7 + 24) + 7;
  unint64_t v9 = (void *)((v8 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void *)((v8 + a2) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v12 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 40))(((unint64_t)v13 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), ((unint64_t)v14 + *(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_2561F6F64(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = *(void *)(v7 + 64);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v8 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v7 + 84);
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v13 = 0x7FFFFFFF;
  }
  else {
    unsigned int v13 = v12;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v14 = v11 + 16;
  if (a2 <= v13) {
    goto LABEL_28;
  }
  unint64_t v15 = ((v14 + ((((((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v11)
      + *(void *)(v9 + 64);
  char v16 = 8 * v15;
  if (v15 <= 3)
  {
    unsigned int v19 = ((a2 - v13 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      int v17 = *(_DWORD *)((char *)a1 + v15);
      if (!v17) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      int v17 = *(unsigned __int16 *)((char *)a1 + v15);
      if (!*(unsigned __int16 *)((char *)a1 + v15)) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_28:
      if (v8 == v13)
      {
        uint64_t v23 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v7 + 48);
        return v23(a1, v8, v6);
      }
      else
      {
        unint64_t v24 = ((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
        if ((v12 & 0x80000000) != 0)
        {
          uint64_t v26 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v26((v14 + ((((v24 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v11);
        }
        else
        {
          unint64_t v25 = *(void *)(v24 + 8);
          if (v25 >= 0xFFFFFFFF) {
            LODWORD(v25) = -1;
          }
          return (v25 + 1);
        }
      }
    }
  }
  int v17 = *((unsigned __int8 *)a1 + v15);
  if (!*((unsigned char *)a1 + v15)) {
    goto LABEL_28;
  }
LABEL_18:
  int v20 = (v17 - 1) << v16;
  if (v15 > 3) {
    int v20 = 0;
  }
  if (v15)
  {
    if (v15 <= 3) {
      int v21 = ((v14 + ((((((v10 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)) & ~v11)
    }
          + *(_DWORD *)(v9 + 64);
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v13 + (v22 | v20) + 1;
}

void sub_2561F7224(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_269F51380);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  uint64_t v11 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v12 = *(void *)(v9 + 64);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  if (v10 <= *(_DWORD *)(v11 + 84)) {
    unsigned int v14 = *(_DWORD *)(v11 + 84);
  }
  else {
    unsigned int v14 = *(_DWORD *)(v9 + 84);
  }
  if (v14 <= 0x7FFFFFFF) {
    unsigned int v15 = 0x7FFFFFFF;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = v13 + 16;
  size_t v17 = ((v13 + 16 + ((((((v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & ~v13)
      + *(void *)(v11 + 64);
  if (a3 <= v15)
  {
    int v18 = 0;
  }
  else if (v17 <= 3)
  {
    unsigned int v22 = ((a3 - v15 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
    if (HIWORD(v22))
    {
      int v18 = 4;
    }
    else if (v22 >= 0x100)
    {
      int v18 = 2;
    }
    else
    {
      int v18 = v22 > 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  if (v15 < a2)
  {
    unsigned int v19 = ~v15 + a2;
    if (v17 < 4)
    {
      int v20 = (v19 >> (8 * v17)) + 1;
      if (v17)
      {
        int v23 = v19 & ~(-1 << (8 * v17));
        bzero(a1, v17);
        if (v17 == 3)
        {
          *(_WORD *)a1 = v23;
          a1[2] = BYTE2(v23);
        }
        else if (v17 == 2)
        {
          *(_WORD *)a1 = v23;
        }
        else
        {
          *a1 = v23;
        }
      }
    }
    else
    {
      bzero(a1, v17);
      *(_DWORD *)a1 = v19;
      int v20 = 1;
    }
    switch(v18)
    {
      case 1:
        a1[v17] = v20;
        return;
      case 2:
        *(_WORD *)&a1[v17] = v20;
        return;
      case 3:
        goto LABEL_48;
      case 4:
        *(_DWORD *)&a1[v17] = v20;
        return;
      default:
        return;
    }
  }
  uint64_t v21 = ~v13;
  switch(v18)
  {
    case 1:
      a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v17] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_48:
      __break(1u);
      JUMPOUT(0x2561F756CLL);
    case 4:
      *(_DWORD *)&a1[v17] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v10 == v15)
        {
          unint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
          v24(a1, a2, v10, v8);
        }
        else
        {
          unint64_t v25 = (void *)((unint64_t)&a1[v12 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((v14 & 0x80000000) != 0)
          {
            uint64_t v26 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
            v26((v16 + (((((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)) & v21, a2);
          }
          else if ((a2 & 0x80000000) != 0)
          {
            *unint64_t v25 = a2 ^ 0x80000000;
            v25[1] = 0;
          }
          else
          {
            v25[1] = (a2 - 1);
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for CheckInDataView.DeviceRow()
{
  return __swift_instantiateGenericMetadata();
}

void sub_2561F75AC()
{
  if (!qword_269F51408)
  {
    sub_2561F647C();
    unint64_t v0 = sub_25620ED78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F51408);
    }
  }
}

uint64_t sub_2561F7608()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561F7688()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561F76CC@<X0>(uint64_t a1@<X8>)
{
  return sub_2561F53EC(*(void *)(v1 + 24), *(void *)(v1 + 16), a1);
}

uint64_t sub_2561F76DC@<X0>(uint64_t a1@<X8>)
{
  return sub_2561F5CE4(a1);
}

unint64_t sub_2561F76E4()
{
  unint64_t result = qword_269F51428;
  if (!qword_269F51428)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51410);
    sub_2561F26BC(&qword_269F51430, &qword_269F51438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51428);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2561F77B4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51410);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51418);
  sub_25620F398();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51420);
  sub_25620EDC8();
  swift_getTupleTypeMetadata2();
  sub_25620F398();
  swift_getWitnessTable();
  sub_25620F298();
  sub_25620EDC8();
  swift_getTupleTypeMetadata3();
  sub_25620F398();
  swift_getWitnessTable();
  sub_25620F298();
  return swift_getWitnessTable();
}

id sub_2561F7908()
{
  return sub_2561F2EB4();
}

uint64_t sub_2561F7924()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for MessagesSettingsUtilities()
{
  return self;
}

ValueMetadata *type metadata accessor for IconSettingsView()
{
  return &type metadata for IconSettingsView;
}

uint64_t sub_2561F7968()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561F7984@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51450);
  MEMORY[0x270FA5388](v42);
  uint64_t v43 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51458);
  MEMORY[0x270FA5388](v45);
  uint64_t v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51460);
  uint64_t v44 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51468);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51470);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51478);
  MEMORY[0x270FA5388](v13);
  unsigned int v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (void *)sub_2561F8F74();
  if (v16)
  {
    id v17 = v16;
    *uint64_t v12 = sub_25620F1C8();
    swift_storeEnumTagMultiPayload();
    sub_2561F8058();
    swift_retain();
    sub_25620EEF8();
    sub_2561F2418((uint64_t)v15, (uint64_t)v9, &qword_269F51478);
    swift_storeEnumTagMultiPayload();
    sub_2561F80B4();
    sub_2561F8130();
    sub_25620EEF8();

    sub_2561F247C((uint64_t)v15, &qword_269F51478);
    return swift_release();
  }
  else
  {
    uint64_t v37 = v3;
    uint64_t v38 = v6;
    uint64_t v39 = v7;
    uint64_t v40 = v13;
    uint64_t v41 = v4;
    sub_2561F956C();
    if (v19)
    {
      id v20 = objc_allocWithZone(MEMORY[0x263F4B540]);
      uint64_t v21 = (void *)sub_25620F3B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_initWithType_, v21);

      unsigned int v22 = v38;
      if (qword_269F51128 != -1) {
        swift_once();
      }
      id v23 = (id)qword_269F53AA8;
      sub_25620ED48();
      uint64_t v24 = v44;
      uint64_t v25 = v41;
      (*(void (**)(uint64_t *, char *, uint64_t))(v44 + 16))(v12, v22, v41);
      swift_storeEnumTagMultiPayload();
      sub_2561F8058();
      sub_25620EEF8();
      sub_2561F2418((uint64_t)v15, (uint64_t)v9, &qword_269F51478);
      swift_storeEnumTagMultiPayload();
      sub_2561F80B4();
      sub_2561F8130();
      sub_25620EEF8();
      sub_2561F247C((uint64_t)v15, &qword_269F51478);
      return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v22, v25);
    }
    else
    {
      sub_2561F9560();
      if (v26)
      {
        id v27 = objc_allocWithZone(MEMORY[0x263F4B540]);
        uint64_t v28 = (void *)sub_25620F3B8();
        swift_bridgeObjectRelease();
        objc_msgSend(v27, sel_initWithBundleIdentifier_, v28);

        uint64_t v29 = v41;
        uint64_t v30 = (uint64_t)v9;
        uint64_t v31 = (uint64_t)v37;
        uint64_t v32 = v43;
        if (qword_269F51128 != -1) {
          swift_once();
        }
        id v33 = (id)qword_269F53AA8;
        uint64_t v34 = v38;
        sub_25620ED48();
        uint64_t v35 = v44;
        (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v32, v34, v29);
        swift_storeEnumTagMultiPayload();
        sub_2561F8058();
        sub_25620EEF8();
        sub_2561F2418(v31, v30, &qword_269F51458);
        swift_storeEnumTagMultiPayload();
        sub_2561F80B4();
        sub_2561F8130();
        sub_25620EEF8();
        sub_2561F247C(v31, &qword_269F51458);
        return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v34, v29);
      }
      else
      {
        swift_storeEnumTagMultiPayload();
        sub_2561F8058();
        uint64_t v36 = (uint64_t)v37;
        sub_25620EEF8();
        sub_2561F2418(v36, (uint64_t)v9, &qword_269F51458);
        swift_storeEnumTagMultiPayload();
        sub_2561F80B4();
        sub_2561F8130();
        sub_25620EEF8();
        return sub_2561F247C(v36, &qword_269F51458);
      }
    }
  }
}

uint64_t sub_2561F8050@<X0>(uint64_t a1@<X8>)
{
  return sub_2561F7984(a1);
}

unint64_t sub_2561F8058()
{
  unint64_t result = qword_269F51480;
  if (!qword_269F51480)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51480);
  }
  return result;
}

unint64_t sub_2561F80B4()
{
  unint64_t result = qword_269F51488;
  if (!qword_269F51488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51478);
    sub_2561F8058();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51488);
  }
  return result;
}

unint64_t sub_2561F8130()
{
  unint64_t result = qword_269F51490;
  if (!qword_269F51490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51458);
    sub_2561F8058();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51490);
  }
  return result;
}

unint64_t sub_2561F81B0()
{
  unint64_t result = qword_269F51498;
  if (!qword_269F51498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F514A0);
    sub_2561F80B4();
    sub_2561F8130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51498);
  }
  return result;
}

uint64_t destroy for SendRecieveView()
{
  swift_release();
  return swift_release();
}

uint64_t _s18MessagesSettingsUI15SendRecieveViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SendRecieveView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SendRecieveView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SendRecieveView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SendRecieveView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SendRecieveView()
{
  return &type metadata for SendRecieveView;
}

uint64_t sub_2561F8408()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561F8424(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F514A8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_25620EEC8();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F514B0);
  sub_2561F85FC(a1, a2, a3, (uint64_t)&v8[*(int *)(v9 + 44)]);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v12 = (void *)sub_25620F3B8();
  uint64_t v13 = (void *)sub_25620F3B8();
  id v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, v13);

  uint64_t v15 = sub_25620F3C8();
  uint64_t v17 = v16;

  v19[0] = v15;
  v19[1] = v17;
  sub_2561F88B4();
  sub_2561F2538();
  sub_25620F158();
  swift_bridgeObjectRelease();
  return sub_2561F8910((uint64_t)v8);
}

uint64_t sub_2561F85FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v31 = a3;
  uint64_t v29 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F514C0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v24 - v10;
  sub_25620EEB8();
  uint64_t v12 = sub_25620F0C8();
  uint64_t v26 = v13;
  uint64_t v27 = v12;
  uint64_t v28 = v14;
  int v25 = v15 & 1;
  sub_25620EEB8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = v29;
  *(unsigned char *)(v16 + 32) = v31;
  swift_retain();
  swift_retain();
  uint64_t v24 = v11;
  sub_25620F268();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  int v18 = v30;
  v17(v30, v11, v6);
  uint64_t v19 = v26;
  uint64_t v20 = v27;
  *(void *)a4 = v27;
  *(void *)(a4 + 8) = v19;
  LOBYTE(a1) = v25;
  *(unsigned char *)(a4 + 16) = v25;
  *(void *)(a4 + 24) = v28;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F514C8);
  v17((char *)(a4 + *(int *)(v21 + 48)), v18, v6);
  sub_2561F2710(v20, v19, a1);
  unsigned int v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  swift_bridgeObjectRetain();
  v22(v24, v6);
  v22(v18, v6);
  sub_2561F2700(v20, v19, a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2561F88A8()
{
  return sub_2561F8424(*(void *)v0, *(void *)(v0 + 8), *(unsigned __int8 *)(v0 + 16));
}

unint64_t sub_2561F88B4()
{
  unint64_t result = qword_269F514B8;
  if (!qword_269F514B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F514A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F514B8);
  }
  return result;
}

uint64_t sub_2561F8910(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F514A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2561F8970()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_2561F89B0()
{
  return sub_25620F308();
}

uint64_t sub_2561F8A08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561F8A78()
{
  uint64_t v1 = sub_25620ECD8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_name);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_25620F3C8();

    return v7;
  }
  else
  {
    sub_25620ECC8();
    uint64_t v9 = sub_25620ECB8();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return v9;
  }
}

id sub_2561F8B9C()
{
  id v0 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B5A0]);
  id v1 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v1, sel_scale);
  double v3 = v2;

  objc_msgSend(v0, sel_setScale_, v3);
  id result = objc_msgSend(v0, sel_setDrawBorder_, 1);
  qword_269F53AA8 = (uint64_t)v0;
  return result;
}

BOOL CKWrappedPreferencesSpecifier.SpecifierDisplayType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_2561F8C80(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2561F8C94()
{
  return sub_25620F4D8();
}

uint64_t sub_2561F8CDC()
{
  return sub_25620F4C8();
}

uint64_t sub_2561F8D08()
{
  return sub_25620F4D8();
}

void *sub_2561F8D4C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

id CKWrappedPreferencesSpecifier.__allocating_init(specifier:)(void *a1)
{
  double v3 = (char *)objc_allocWithZone(v1);
  sub_25620ED08();
  *(void *)&v3[OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier] = a1;
  id v4 = a1;

  v7.receiver = v3;
  v7.super_class = v1;
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

id CKWrappedPreferencesSpecifier.init(specifier:)(void *a1)
{
  double v3 = v1;
  sub_25620ED08();
  *(void *)&v3[OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier] = a1;
  id v4 = a1;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for CKWrappedPreferencesSpecifier();
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

uint64_t type metadata accessor for CKWrappedPreferencesSpecifier()
{
  uint64_t result = qword_269F51508;
  if (!qword_269F51508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2561F8F74()
{
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_propertyForKey_, *MEMORY[0x263F60140]))
  {
    sub_25620F478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_2561F9050((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_2561F9958(0, &qword_269F514F0);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_2561F90B8((uint64_t)v4);
    return 0;
  }
}

uint64_t sub_2561F9050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F514E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2561F90B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F514E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2561F9118()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_name);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_25620F3C8();

  return v3;
}

uint64_t sub_2561F9188()
{
  id v1 = (void *)swift_allocObject();
  v1[2] = 0;
  v1[3] = 0;
  v1[4] = v0;
  uint64_t v2 = (void *)swift_allocObject();
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = v0;
  id v3 = v0;
  sub_25620F338();
  return v5;
}

uint64_t sub_2561F9244@<X0>(uint64_t a1@<X2>, unsigned char *a2@<X8>)
{
  if (objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_performGetter))
  {
    sub_25620F478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_2561F9050((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    uint64_t result = sub_2561F90B8((uint64_t)v7);
    goto LABEL_8;
  }
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
LABEL_8:
    char v4 = 0;
    goto LABEL_9;
  }
  char v4 = v5;
LABEL_9:
  *a2 = v4;
  return result;
}

void sub_2561F9308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4 = *(void **)(a4 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier);
  id v5 = (id)sub_25620F408();
  objc_msgSend(v4, sel_performSetterWithValue_, v5);
}

void sub_2561F9370()
{
  id v1 = *(void **)(*(void *)(v0 + 32) + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier);
  id v2 = (id)sub_25620F408();
  objc_msgSend(v1, sel_performSetterWithValue_, v2);
}

id sub_2561F93D8()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_cellType);
}

BOOL sub_2561F9424()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_cellType) != (id)6;
}

id sub_2561F9458()
{
  id result = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_name);
  if (result)
  {
    id v2 = result;
    uint64_t v3 = sub_25620F3C8();
    uint64_t v5 = v4;

    if (v3 == 0x6163696669746F4ELL && v5 == 0xED0000736E6F6974)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v7 = sub_25620F4A8();
      swift_bridgeObjectRelease();
      if ((v7 & 1) == 0) {
        return 0;
      }
    }
    return (id)0xD000000000000019;
  }
  return result;
}

uint64_t sub_2561F9560()
{
  return sub_2561F9578(MEMORY[0x263F60188]);
}

uint64_t sub_2561F956C()
{
  return sub_2561F9578(MEMORY[0x263F60158]);
}

uint64_t sub_2561F9578(void *a1)
{
  if (objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_propertyForKey_, *a1))
  {
    sub_25620F478();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_2561F9050((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_2561F90B8((uint64_t)v5);
    return 0;
  }
}

id sub_2561F9644()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier);
  if (!objc_msgSend(v1, sel_detailControllerClass)) {
    return 0;
  }
  swift_getObjCClassMetadata();
  sub_2561F9958(0, (unint64_t *)&qword_269F514F8);
  if (!swift_dynamicCastMetatype()) {
    return 0;
  }
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v2, sel_setSpecifier_, v1);
  return v2;
}

id CKWrappedPreferencesSpecifier.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CKWrappedPreferencesSpecifier.init()()
{
}

id CKWrappedPreferencesSpecifier.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKWrappedPreferencesSpecifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2561F9830(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_25620ECD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(*(id *)(*v1 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier), sel_name);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_25620F3C8();
    uint64_t v11 = v10;
  }
  else
  {
    sub_25620ECC8();
    uint64_t v9 = sub_25620ECB8();
    uint64_t v11 = v12;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  *a1 = v9;
  a1[1] = v11;
}

uint64_t sub_2561F9958(uint64_t a1, unint64_t *a2)
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

unint64_t sub_2561F9998()
{
  unint64_t result = qword_269F51500;
  if (!qword_269F51500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51500);
  }
  return result;
}

uint64_t sub_2561F99EC()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_2561F99F8()
{
  return type metadata accessor for CKWrappedPreferencesSpecifier();
}

uint64_t sub_2561F9A00()
{
  uint64_t result = sub_25620ED18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CKWrappedPreferencesSpecifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CKWrappedPreferencesSpecifier);
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.id.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.__allocating_init(specifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.icon.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.title.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.isOn.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.cellType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.displayType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CKWrappedPreferencesSpecifier.detailViewController()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

ValueMetadata *type metadata accessor for CKWrappedPreferencesSpecifier.SpecifierDisplayType()
{
  return &type metadata for CKWrappedPreferencesSpecifier.SpecifierDisplayType;
}

Swift::Void __swiftcall CKSettingsHostingViewController.viewDidLoad()()
{
  unint64_t v1 = v0;
  v16.super_class = (Class)CKSettingsHostingViewController;
  objc_msgSendSuper2(&v16, sel_viewDidLoad);
  type metadata accessor for SettingsContext();
  swift_allocObject();
  objc_super v2 = sub_2561FA4F4();
  type metadata accessor for SettingsModel();
  swift_allocObject();
  swift_retain();
  uint64_t v15 = sub_2561FFAAC(1, 0, 1, (uint64_t)&unk_2704C3528, 1, 0, 1, (uint64_t)&v12, 0, 1, 1, 0, 1, 1, 1, 0, 1);
  sub_25620F238();
  uint64_t v3 = v12;
  uint64_t v4 = v13;
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  uint64_t v14 = v4;
  id v5 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269F51518));
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v6 = (void *)sub_25620EEE8();
  objc_msgSend(v1, sel_addChildViewController_, v6);
  id v7 = objc_msgSend(v1, sel_view);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v6, sel_view);
    if (v9)
    {
      uint64_t v10 = v9;
      objc_msgSend(v8, sel_addSubview_, v9);

      objc_msgSend(v6, sel_didMoveToParentViewController_, v1);
      swift_release();
      swift_release();
      swift_release_n();
      uint64_t v11 = *(void **)&v1[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController];
      *(void *)&v1[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController] = v6;

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

Swift::Void __swiftcall CKSettingsHostingViewController.viewDidLayoutSubviews()()
{
  v14.super_class = (Class)CKSettingsHostingViewController;
  objc_msgSendSuper2(&v14, sel_viewDidLayoutSubviews);
  unint64_t v1 = *(void **)&v0[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController];
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_view);
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = objc_msgSend(v0, sel_view);
      if (v4)
      {
        id v5 = v4;
        objc_msgSend(v4, sel_bounds);
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;

        objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void __swiftcall CKSettingsHostingViewController.init(nibName:bundle:)(CKSettingsHostingViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    id v4 = (void *)sub_25620F3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

id CKSettingsHostingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR___CKSettingsHostingViewController_hostedViewController] = 0;
  if (a2)
  {
    id v5 = (void *)sub_25620F3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)CKSettingsHostingViewController;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

void __swiftcall CKSettingsHostingViewController.init(coder:)(CKSettingsHostingViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

id CKSettingsHostingViewController.init(coder:)(void *a1)
{
  *(void *)(v1 + OBJC_IVAR___CKSettingsHostingViewController_hostedViewController) = 0;
  v5.super_class = (Class)CKSettingsHostingViewController;
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

unint64_t type metadata accessor for CKSettingsHostingViewController()
{
  unint64_t result = qword_269F51528;
  if (!qword_269F51528)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F51528);
  }
  return result;
}

uint64_t sub_2561FA2C4()
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
  uint64_t v1 = v0 + OBJC_IVAR____TtC18MessagesSettingsUI15SettingsContext___observationRegistrar;
  uint64_t v2 = sub_25620ED18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_2561FA390()
{
  sub_2561FA2C4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2561FA3E8()
{
  return type metadata accessor for SettingsContext();
}

uint64_t type metadata accessor for SettingsContext()
{
  uint64_t result = qword_269F51538;
  if (!qword_269F51538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2561FA43C()
{
  uint64_t result = sub_25620ED18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_2561FA4F4()
{
  type metadata accessor for SummarizationManager();
  v0[2] = swift_allocObject();
  type metadata accessor for ReadReceiptsManager();
  v0[3] = swift_allocObject();
  type metadata accessor for FilterSendersManager();
  v0[4] = swift_allocObject();
  type metadata accessor for RaiseToListenManager();
  v0[5] = swift_allocObject();
  type metadata accessor for SubjectFieldManager();
  v0[6] = swift_allocObject();
  type metadata accessor for KeepMessagesManager();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = objc_msgSend(objc_allocWithZone((Class)CKKeepMessagesPreferenceManager), sel_init);
  v0[7] = v1;
  type metadata accessor for AudioExpirationManager();
  v0[8] = swift_allocObject();
  type metadata accessor for MMSManager();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = objc_msgSend(objc_allocWithZone((Class)CKMMSSettingsHelper), sel_init);
  v0[9] = v2;
  type metadata accessor for CharacterCountManager();
  v0[10] = swift_allocObject();
  type metadata accessor for LowQualityImagesManager();
  v0[11] = swift_allocObject();
  type metadata accessor for ShowContactPhotosManager();
  v0[12] = swift_allocObject();
  type metadata accessor for SendAsTextMessageManager();
  v0[13] = swift_allocObject();
  type metadata accessor for BusinessUpdatesManager();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = objc_msgSend(objc_allocWithZone((Class)BusinessSettingsHelper), sel_init);
  v0[14] = v3;
  sub_25620ED08();
  return v0;
}

void *sub_2561FA6BC()
{
  type metadata accessor for SettingsContext();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_2561FA4F4();
  qword_269F53AB0 = v0;
  return result;
}

uint64_t sub_2561FA6FC@<X0>(void *a1@<X8>)
{
  if (qword_269F51130 != -1) {
    swift_once();
  }
  *a1 = qword_269F53AB0;
  return swift_retain();
}

uint64_t sub_2561FA76C()
{
  sub_2561FA7A8();
  sub_25620EE48();
  return v1;
}

unint64_t sub_2561FA7A8()
{
  unint64_t result = qword_269F51548;
  if (!qword_269F51548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51548);
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsContextKey()
{
  return &type metadata for SettingsContextKey;
}

void sub_2561FA80C()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = (id)sub_25620F438();
  objc_msgSend(v0, sel_setAudioMessageAutoKeep_, v1);
}

ValueMetadata *type metadata accessor for SettingsDetailViewControllerRepresentable()
{
  return &type metadata for SettingsDetailViewControllerRepresentable;
}

id sub_2561FA8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + OBJC_IVAR____TtC18MessagesSettingsUI29CKWrappedPreferencesSpecifier_specifier);
  if (objc_msgSend(v2, sel_detailControllerClass)
    && (swift_getObjCClassMetadata(), sub_2561FAAB0(), swift_dynamicCastMetatype()))
  {
    id v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    objc_msgSend(v3, sel_setSpecifier_, v2);
    return v3;
  }
  else
  {
    id v5 = objc_allocWithZone(MEMORY[0x263F1CB68]);
    return objc_msgSend(v5, sel_init);
  }
}

id sub_2561FA964(uint64_t a1)
{
  return sub_2561FA8AC(a1, *v1);
}

uint64_t sub_2561FA96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2561FAA5C();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2561FA9D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2561FAA5C();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_2561FAA34()
{
}

unint64_t sub_2561FAA5C()
{
  unint64_t result = qword_269F51550;
  if (!qword_269F51550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51550);
  }
  return result;
}

unint64_t sub_2561FAAB0()
{
  unint64_t result = qword_269F514F8;
  if (!qword_269F514F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F514F8);
  }
  return result;
}

void KeepMessagesPreference.id.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

BOOL static KeepMessagesPreference.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t KeepMessagesPreference.rawValue.getter()
{
  return *v0;
}

uint64_t KeepMessagesPreference.description.getter()
{
  uint64_t v1 = 1918985593;
  if (*v0 != 1) {
    uint64_t v1 = 0x72657665726F66;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x68746E6F6DLL;
  }
}

uint64_t sub_2561FAB68()
{
  type metadata accessor for CloudSettingsSwiftUtils();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  id v3 = (void *)sub_25620F3B8();
  id v4 = (void *)sub_25620F3B8();
  id v5 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, v3, v4);

  uint64_t v6 = sub_25620F3C8();
  return v6;
}

MessagesSettingsUI::KeepMessagesPreference_optional __swiftcall KeepMessagesPreference.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *id v1 = v2;
  return (MessagesSettingsUI::KeepMessagesPreference_optional)rawValue;
}

void *static KeepMessagesPreference.allCases.getter()
{
  return &unk_2704C3560;
}

BOOL sub_2561FAD40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_2561FAD58()
{
  unint64_t result = qword_269F51558;
  if (!qword_269F51558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51558);
  }
  return result;
}

uint64_t sub_2561FADAC()
{
  return sub_25620F4D8();
}

uint64_t sub_2561FADF4()
{
  return sub_25620F4C8();
}

uint64_t sub_2561FAE20()
{
  return sub_25620F4D8();
}

MessagesSettingsUI::KeepMessagesPreference_optional sub_2561FAE64(Swift::Int *a1)
{
  return KeepMessagesPreference.init(rawValue:)(*a1);
}

void sub_2561FAE6C(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_2561FAE7C()
{
  unint64_t result = qword_269F51560;
  if (!qword_269F51560)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51568);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51560);
  }
  return result;
}

void sub_2561FAED8(void *a1@<X8>)
{
  *a1 = &unk_2704C3588;
}

unint64_t sub_2561FAEEC()
{
  unint64_t result = qword_269F51570;
  if (!qword_269F51570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51570);
  }
  return result;
}

void sub_2561FAF40(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_2561FAF4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_2561FAF60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_2561FAF74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_2561FAF88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_2561FAF9C()
{
  uint64_t v1 = 1918985593;
  if (*v0 != 1) {
    uint64_t v1 = 0x72657665726F66;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x68746E6F6DLL;
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KeepMessagesPreference(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for KeepMessagesPreference(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x2561FB158);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_2561FB180(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2561FB188(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KeepMessagesPreference()
{
  return &type metadata for KeepMessagesPreference;
}

ValueMetadata *type metadata accessor for TextMessageForwardingView()
{
  return &type metadata for TextMessageForwardingView;
}

unint64_t sub_2561FB1B4()
{
  unint64_t result = qword_269F51578;
  if (!qword_269F51578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51578);
  }
  return result;
}

id sub_2561FB208()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_smsRelayDevicesController);

  return v1;
}

uint64_t sub_2561FB268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2561FB358();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2561FB2CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2561FB358();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_2561FB330()
{
}

unint64_t sub_2561FB358()
{
  unint64_t result = qword_269F51580;
  if (!qword_269F51580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51580);
  }
  return result;
}

uint64_t destroy for SettingsContentView()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s18MessagesSettingsUI19SettingsContentViewVwCP_0(void *a1, void *a2)
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

void *assignWithCopy for SettingsContentView(void *a1, void *a2)
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

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SettingsContentView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsContentView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsContentView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SettingsContentView()
{
  return &type metadata for SettingsContentView;
}

uint64_t sub_2561FB5B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2561FB5D4()
{
  return sub_25620EE58();
}

uint64_t sub_2561FB634@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51588);
  sub_25620F258();
  uint64_t KeyPath = swift_getKeyPath();
  sub_25620F238();
  sub_25620F238();
  uint64_t v5 = swift_getKeyPath();
  *(void *)a1 = KeyPath;
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v5;
  *(void *)(a1 + 80) = v3;
  return swift_retain();
}

uint64_t sub_2561FB738@<X0>(void *a1@<X8>)
{
  sub_2561FA7A8();
  uint64_t result = sub_25620EE48();
  *a1 = v3;
  return result;
}

unint64_t sub_2561FB790()
{
  unint64_t result = qword_269F51590;
  if (!qword_269F51590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51598);
    sub_2561FB80C();
    sub_2561FB860();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51590);
  }
  return result;
}

unint64_t sub_2561FB80C()
{
  unint64_t result = qword_269F515A0;
  if (!qword_269F515A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F515A0);
  }
  return result;
}

unint64_t sub_2561FB860()
{
  unint64_t result = qword_269F515A8;
  if (!qword_269F515A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F515B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F515A8);
  }
  return result;
}

unint64_t sub_2561FB8BC(char a1)
{
  if (!a1) {
    return 0xD000000000000013;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0xD000000000000012;
}

uint64_t type metadata accessor for AppIntentsHelper()
{
  return self;
}

uint64_t sub_2561FB93C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v5 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  unint64_t v6 = (void *)sub_25620F3B8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithSuiteName_, v6);

  if (v7)
  {
    long long v8 = (void *)sub_25620F3B8();
    id v9 = objc_msgSend(v7, sel_objectForKey_, v8);

    if (v9)
    {
      sub_25620F478();

      swift_unknownObjectRelease();
      sub_2561FBABC(v12, v13);
      sub_2561FBABC(v13, v12);
      if (swift_dynamicCast()) {
        a4 = v11;
      }
    }
    else
    {
    }
  }
  return a4 & 1;
}

_OWORD *sub_2561FBABC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_2561FBACC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  id v8 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v9 = (void *)sub_25620F3B8();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithSuiteName_, v9);

  if (v10)
  {
    char v11 = (void *)sub_25620F3B8();
    objc_msgSend(v10, sel_setBool_forKey_, a4 & 1, v11);

    objc_msgSend(v10, sel_synchronize);
    center = CFNotificationCenterGetDarwinNotifyCenter();
    double v12 = (__CFString *)sub_25620F3B8();
    CFNotificationCenterPostNotification(center, v12, 0, 0, 1u);

    if (a6)
    {
      double v13 = (__CFString *)sub_25620F3B8();
      CFNotificationCenterPostNotification(center, v13, 0, 0, 1u);
    }
  }
}

uint64_t SettingsItem.deinit()
{
  return v0;
}

uint64_t SettingsItem.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SettingsItem()
{
  return self;
}

uint64_t method lookup function for SettingsItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SettingsItem);
}

uint64_t sub_2561FBD04@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 35);
  return result;
}

uint64_t sub_2561FBDAC()
{
  return swift_release();
}

uint64_t sub_2561FBE7C()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2561FBF1C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_2561FBFC4()
{
  return swift_release();
}

uint64_t sub_2561FC094()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_2561FC134@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 17);
  return result;
}

uint64_t sub_2561FC1DC()
{
  return swift_release();
}

uint64_t sub_2561FC2AC()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 19);
}

uint64_t sub_2561FC34C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 19);
  return result;
}

uint64_t sub_2561FC3F4()
{
  return swift_release();
}

uint64_t sub_2561FC4C4()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 20);
}

uint64_t sub_2561FC564@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 20);
  return result;
}

uint64_t sub_2561FC60C()
{
  return swift_release();
}

uint64_t sub_2561FC6DC()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_2561FC77C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 32);
  return result;
}

uint64_t sub_2561FC824()
{
  return swift_release();
}

uint64_t sub_2561FC8F4()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t sub_2561FC994@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 33);
  return result;
}

uint64_t sub_2561FCA3C()
{
  return swift_release();
}

uint64_t sub_2561FCB0C()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 34);
}

uint64_t sub_2561FCBAC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 34);
  return result;
}

uint64_t sub_2561FCC54()
{
  return swift_release();
}

uint64_t sub_2561FCD24()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 35);
}

uint64_t sub_2561FCDC4()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 37);
}

uint64_t sub_2561FCE64@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 37);
  return result;
}

uint64_t sub_2561FCF0C()
{
  return swift_release();
}

uint64_t sub_2561FCFDC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 37) = a2;
  return result;
}

uint64_t sub_2561FCFE4()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 38);
}

uint64_t sub_2561FD084@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 38);
  return result;
}

uint64_t sub_2561FD12C()
{
  return swift_release();
}

uint64_t sub_2561FD1FC()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 39);
}

uint64_t sub_2561FD29C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 39);
  return result;
}

uint64_t sub_2561FD344()
{
  return swift_release();
}

uint64_t sub_2561FD414()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_2561FD4B4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 40);
  return result;
}

uint64_t sub_2561FD55C()
{
  return swift_release();
}

uint64_t sub_2561FD62C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a1 = *(unsigned char *)(v1 + 42);
  return result;
}

uint64_t sub_2561FD6D4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 42);
  return result;
}

uint64_t sub_2561FD77C()
{
  return swift_release();
}

uint64_t sub_2561FD84C()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 43);
}

uint64_t sub_2561FD8EC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 43);
  return result;
}

uint64_t sub_2561FD994()
{
  return swift_release();
}

uint64_t sub_2561FDA64()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 44);
}

uint64_t sub_2561FDB04@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 44);
  return result;
}

uint64_t sub_2561FDBAC()
{
  return swift_release();
}

uint64_t sub_2561FDC7C()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 45);
}

uint64_t sub_2561FDD1C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 45);
  return result;
}

uint64_t sub_2561FDDC4()
{
  return swift_release();
}

uint64_t sub_2561FDE94()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 46);
}

uint64_t sub_2561FDF34@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 46);
  return result;
}

uint64_t sub_2561FDFDC()
{
  return swift_release();
}

uint64_t sub_2561FE0AC()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 47);
}

uint64_t sub_2561FE14C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 47);
  return result;
}

uint64_t sub_2561FE1F4()
{
  return swift_release();
}

uint64_t sub_2561FE2C4()
{
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t sub_2561FE364@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_256200028((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 50);
  return result;
}

uint64_t sub_2561FE40C()
{
  return swift_release();
}

uint64_t SettingsModel.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC18MessagesSettingsUI13SettingsModel___observationRegistrar;
  uint64_t v2 = sub_25620ED18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SettingsModel.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC18MessagesSettingsUI13SettingsModel___observationRegistrar;
  uint64_t v2 = sub_25620ED18();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2561FE5F0()
{
  return type metadata accessor for SettingsModel();
}

uint64_t type metadata accessor for SettingsModel()
{
  uint64_t result = qword_269F515C0;
  if (!qword_269F515C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2561FE644()
{
  uint64_t result = sub_25620ED18();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for SettingsModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SettingsModel);
}

unsigned char *storeEnumTagSinglePayload for SettingsModel.MessageReceivedSound(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x2561FE81CLL);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsModel.MessageReceivedSound()
{
  return &type metadata for SettingsModel.MessageReceivedSound;
}

ValueMetadata *type metadata accessor for SettingsModel.ShareNamePhoto()
{
  return &type metadata for SettingsModel.ShareNamePhoto;
}

ValueMetadata *type metadata accessor for SettingsModel.CheckInData()
{
  return &type metadata for SettingsModel.CheckInData;
}

ValueMetadata *type metadata accessor for SettingsModel.AudioExpiration()
{
  return &type metadata for SettingsModel.AudioExpiration;
}

uint64_t _s18MessagesSettingsUI13SettingsModelC18SettingsEnablementOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s18MessagesSettingsUI13SettingsModelC18SettingsEnablementOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x2561FE9E8);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_2561FEA10(unsigned char *result, char a2)
{
  void *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsModel.SettingsEnablement()
{
  return &type metadata for SettingsModel.SettingsEnablement;
}

uint64_t sub_2561FEA2C()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  int v2 = (void *)sub_25620F3B8();
  int v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  return v5;
}

BOOL sub_2561FEB34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2561FEB4C()
{
  return sub_25620F4D8();
}

uint64_t sub_2561FEB9C()
{
  return sub_25620F4C8();
}

uint64_t sub_2561FEBD4()
{
  return sub_25620F4D8();
}

void *sub_2561FEC20@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 3) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_2561FEC40(uint64_t *a1@<X8>)
{
  uint64_t v2 = 3;
  if (!*v1) {
    uint64_t v2 = 0;
  }
  *a1 = v2;
}

void sub_2561FEC58(void *a1@<X8>)
{
  *a1 = &unk_2704C35B0;
}

uint64_t sub_2561FEC68()
{
  return sub_2561FEA2C();
}

uint64_t sub_2561FEC70()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  char v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  return v5;
}

void sub_2561FED74(void *a1@<X8>)
{
  *a1 = &unk_2704C35D8;
}

uint64_t sub_2561FED84()
{
  return sub_2561FEC70();
}

void sub_2561FED8C(void *a1@<X8>)
{
  *a1 = &unk_2704C3600;
}

uint64_t sub_2561FED9C()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  char v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  return v5;
}

void sub_2561FEE98(void *a1@<X8>)
{
  *a1 = &unk_2704C3628;
}

uint64_t sub_2561FEEA8()
{
  return sub_2561FED9C();
}

uint64_t sub_2561FEEB0()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  char v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  return v5;
}

void sub_2561FEFA0(void *a1@<X8>)
{
  *a1 = &unk_2704C3650;
}

uint64_t sub_2561FEFB0()
{
  return sub_2561FEEB0();
}

unint64_t sub_2561FEFBC()
{
  unint64_t result = qword_269F515D0;
  if (!qword_269F515D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F515D0);
  }
  return result;
}

uint64_t sub_2561FF010()
{
  return sub_2561FF894(&qword_269F515D8, &qword_269F515E0);
}

uint64_t sub_2561FF038(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2561FF65C(a1, a2, a3, (uint64_t (*)(void))sub_2561FF08C, (uint64_t (*)(void))sub_2561FF0E0, (uint64_t (*)(void))sub_2561FEFBC, (uint64_t (*)(void))sub_2561FF134);
}

unint64_t sub_2561FF08C()
{
  unint64_t result = qword_269F515E8;
  if (!qword_269F515E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F515E8);
  }
  return result;
}

unint64_t sub_2561FF0E0()
{
  unint64_t result = qword_269F515F0;
  if (!qword_269F515F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F515F0);
  }
  return result;
}

unint64_t sub_2561FF134()
{
  unint64_t result = qword_269F515F8;
  if (!qword_269F515F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F515F8);
  }
  return result;
}

unint64_t sub_2561FF18C()
{
  unint64_t result = qword_269F51600;
  if (!qword_269F51600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51600);
  }
  return result;
}

unint64_t sub_2561FF1E4()
{
  unint64_t result = qword_269F51608;
  if (!qword_269F51608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51608);
  }
  return result;
}

uint64_t sub_2561FF238()
{
  return sub_2561FF894(&qword_269F51610, &qword_269F51618);
}

uint64_t sub_2561FF260(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2561FF65C(a1, a2, a3, (uint64_t (*)(void))sub_2561FF2B4, (uint64_t (*)(void))sub_2561FF308, (uint64_t (*)(void))sub_2561FF1E4, (uint64_t (*)(void))sub_2561FF35C);
}

unint64_t sub_2561FF2B4()
{
  unint64_t result = qword_269F51620;
  if (!qword_269F51620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51620);
  }
  return result;
}

unint64_t sub_2561FF308()
{
  unint64_t result = qword_269F51628;
  if (!qword_269F51628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51628);
  }
  return result;
}

unint64_t sub_2561FF35C()
{
  unint64_t result = qword_269F51630;
  if (!qword_269F51630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51630);
  }
  return result;
}

unint64_t sub_2561FF3B4()
{
  unint64_t result = qword_269F51638;
  if (!qword_269F51638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51638);
  }
  return result;
}

uint64_t sub_2561FF40C()
{
  return sub_2561FF894(&qword_269F51640, &qword_269F51648);
}

uint64_t sub_2561FF434(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2561FF65C(a1, a2, a3, (uint64_t (*)(void))sub_2561FF488, (uint64_t (*)(void))sub_2561FF4DC, (uint64_t (*)(void))sub_2561F6510, (uint64_t (*)(void))sub_2561FF530);
}

unint64_t sub_2561FF488()
{
  unint64_t result = qword_269F51650;
  if (!qword_269F51650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51650);
  }
  return result;
}

unint64_t sub_2561FF4DC()
{
  unint64_t result = qword_269F51658;
  if (!qword_269F51658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51658);
  }
  return result;
}

unint64_t sub_2561FF530()
{
  unint64_t result = qword_269F51660;
  if (!qword_269F51660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51660);
  }
  return result;
}

unint64_t sub_2561FF58C()
{
  unint64_t result = qword_269F51668;
  if (!qword_269F51668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51668);
  }
  return result;
}

uint64_t sub_2561FF5E0()
{
  return sub_2561FF894(&qword_269F51670, &qword_269F51678);
}

uint64_t sub_2561FF608(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2561FF65C(a1, a2, a3, (uint64_t (*)(void))sub_2561FF6C0, (uint64_t (*)(void))sub_2561FF714, (uint64_t (*)(void))sub_2561FF58C, (uint64_t (*)(void))sub_2561FF768);
}

uint64_t sub_2561FF65C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  a1[3] = a6();
  uint64_t result = a7();
  a1[4] = result;
  return result;
}

unint64_t sub_2561FF6C0()
{
  unint64_t result = qword_269F51680;
  if (!qword_269F51680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51680);
  }
  return result;
}

unint64_t sub_2561FF714()
{
  unint64_t result = qword_269F51688;
  if (!qword_269F51688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51688);
  }
  return result;
}

unint64_t sub_2561FF768()
{
  unint64_t result = qword_269F51690;
  if (!qword_269F51690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51690);
  }
  return result;
}

unint64_t sub_2561FF7C0()
{
  unint64_t result = qword_269F51698;
  if (!qword_269F51698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51698);
  }
  return result;
}

unint64_t sub_2561FF818()
{
  unint64_t result = qword_269F516A0;
  if (!qword_269F516A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F516A0);
  }
  return result;
}

uint64_t sub_2561FF86C()
{
  return sub_2561FF894(&qword_269F516A8, &qword_269F516B0);
}

uint64_t sub_2561FF894(unint64_t *a1, uint64_t *a2)
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

void sub_2561FF8EC()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 50) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF904()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 47) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF91C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 46) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF934()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 45) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF94C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 44) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF964()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 43) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF97C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 42) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF994()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 40) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF9AC()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 39) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF9C4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 38) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF9DC()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 37) = *(unsigned char *)(v0 + 24);
}

void sub_2561FF9F4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 35) = *(unsigned char *)(v0 + 24);
}

void sub_2561FFA0C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 34) = *(unsigned char *)(v0 + 24);
}

void sub_2561FFA24()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 33) = *(unsigned char *)(v0 + 24);
}

void sub_2561FFA3C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 32) = *(unsigned char *)(v0 + 24);
}

void sub_2561FFA54()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 20) = *(unsigned char *)(v0 + 24);
}

void sub_2561FFA6C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 19) = *(unsigned char *)(v0 + 24);
}

void sub_2561FFA84()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 17) = *(unsigned char *)(v0 + 24);
}

void sub_2561FFA9C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 16) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2561FFAAC(char a1, char a2, char a3, uint64_t a4, char a5, char a6, char a7, uint64_t a8, char a9, char a10, char a11, uint64_t a12, char a13, char a14, char a15, char a16, char a17)
{
  uint64_t v18 = v17;
  char v24 = a2 & 1;
  char v25 = a6 & 1;
  sub_25620ED08();
  *(unsigned char *)(v18 + 16) = a1;
  *(unsigned char *)(v18 + 17) = v24;
  *(unsigned char *)(v18 + 18) = a3;
  uint64_t v26 = self;
  id v27 = objc_msgSend(v26, sel_sharedInstance);
  unsigned __int8 v28 = objc_msgSend(v27, sel_areReadReceiptsEnabled);

  *(unsigned char *)(v18 + 19) = v28;
  *(unsigned char *)(v18 + 20) = objc_msgSend(self, sel_messageSummarizationEnabled);
  *(void *)(v18 + 24) = a4;
  id v29 = objc_msgSend(v26, sel_sharedInstance);
  id v30 = objc_msgSend(v29, sel_getAudioMessageAutoKeep);

  uint64_t v31 = sub_25620F428();
  *(unsigned char *)(v18 + 32) = v31 == 3;
  *(unsigned char *)(v18 + 33) = sub_2561FB93C(0, 0xD000000000000014, 0x8000000256214CD0, 1) & 1;
  *(unsigned char *)(v18 + 34) = sub_2561FB93C(2, 0xD000000000000019, 0x8000000256214CF0, 0) & 1;
  type metadata accessor for CheckInDataView.Model();
  uint64_t v32 = swift_allocObject();
  sub_25620ED08();
  swift_getKeyPath();
  uint64_t v50 = v32;
  sub_256200028(&qword_269F51230, (void (*)(uint64_t))type metadata accessor for CheckInDataView.Model);
  sub_25620ECF8();
  swift_release();
  id v33 = self;
  if (objc_msgSend(v33, sel_hasUserCompletedOnboarding))
  {
    unsigned __int8 v34 = objc_msgSend(v33, sel_shareAllLocations);
    swift_release();
    char v35 = v34 ^ 1;
  }
  else
  {
    swift_release();
    char v35 = 1;
  }
  *(unsigned char *)(v18 + 35) = v35;
  *(unsigned char *)(v18 + 36) = a5 & 1;
  LODWORD(v49) = a9 & 1;
  id v36 = objc_msgSend(v26, sel_sharedInstance, v49, v50);
  unsigned __int8 v37 = objc_msgSend(v36, sel__sharedWithYouEnabled);

  *(unsigned char *)(v18 + 37) = v37;
  *(unsigned char *)(v18 + 38) = v25;
  *(unsigned char *)(v18 + 39) = sub_2561FB93C(0, 0xD000000000000011, 0x8000000256214D10, 1) & 1;
  *(unsigned char *)(v18 + 40) = sub_2561FB93C(0, 0xD00000000000001ELL, 0x8000000256214D30, 0) & 1;
  *(unsigned char *)(v18 + 41) = a7 & 1;
  id v38 = objc_msgSend(self, sel_keepMessagesPreference);
  sub_2561F9958(0, &qword_269F516B8);
  sub_2561F9958(0, (unint64_t *)&qword_269F516C0);
  uint64_t v39 = (void *)sub_25620F458();
  LOBYTE(v36) = sub_25620F468();

  if (v36)
  {

    char v40 = 0;
  }
  else
  {
    uint64_t v41 = (void *)sub_25620F458();
    char v42 = sub_25620F468();

    if (v42) {
      char v40 = 1;
    }
    else {
      char v40 = 2;
    }
  }
  *(unsigned char *)(v18 + 42) = v40;
  *(unsigned char *)(v18 + 43) = v49;
  id v43 = objc_msgSend(objc_allocWithZone((Class)CKMMSSettingsHelper), sel_init);
  id v44 = objc_msgSend(v43, sel_isMMSEnabled);

  HIBYTE(v49) = 2;
  uint64_t result = MEMORY[0x25A2A3080](v44, (char *)&v49 + 7);
  char v46 = HIBYTE(v49);
  if (HIBYTE(v49) == 2)
  {
    __break(1u);
  }
  else
  {

    *(unsigned char *)(v18 + 44) = v46 & 1;
    *(unsigned char *)(v18 + 45) = sub_2561FB93C(0, 0x53776F6853534D4DLL, 0xEE007463656A6275, 0) & 1;
    *(unsigned char *)(v18 + 46) = sub_2561FB93C(0, 0xD000000000000015, 0x8000000256214D50, 0) & 1;
    *(unsigned char *)(v18 + 47) = sub_2561FB93C(0, 0x4D537341646E6553, 0xE900000000000053, 0) & 1;
    *(unsigned char *)(v18 + 48) = a10 & 1;
    *(unsigned char *)(v18 + 49) = a11 & 1;
    id v47 = objc_msgSend(objc_allocWithZone((Class)BusinessSettingsHelper), sel_init);
    unsigned __int8 v48 = objc_msgSend(v47, sel_areBusinessUpdatesEnabled);

    *(unsigned char *)(v18 + 50) = v48;
    *(void *)(v18 + 56) = a12;
    *(unsigned char *)(v18 + 64) = a13 & 1;
    *(unsigned char *)(v18 + 65) = a14 & 1;
    *(unsigned char *)(v18 + 66) = a15 & 1;
    *(unsigned char *)(v18 + 67) = a16;
    *(unsigned char *)(v18 + 68) = a17 & 1;
    return v18;
  }
  return result;
}

uint64_t sub_256200028(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for CloudSettingsSwiftUtils()
{
  return self;
}

uint64_t type metadata accessor for SummarizationManager()
{
  return self;
}

uint64_t type metadata accessor for ReadReceiptsManager()
{
  return self;
}

uint64_t type metadata accessor for FilterSendersManager()
{
  return self;
}

uint64_t type metadata accessor for RaiseToListenManager()
{
  return self;
}

uint64_t sub_256200138()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for KeepMessagesManager()
{
  return self;
}

uint64_t type metadata accessor for AudioExpirationManager()
{
  return self;
}

uint64_t type metadata accessor for MMSManager()
{
  return self;
}

uint64_t type metadata accessor for SubjectFieldManager()
{
  return self;
}

uint64_t type metadata accessor for CharacterCountManager()
{
  return self;
}

uint64_t type metadata accessor for LowQualityImagesManager()
{
  return self;
}

uint64_t type metadata accessor for ShowContactPhotosManager()
{
  return self;
}

uint64_t type metadata accessor for SendAsTextMessageManager()
{
  return self;
}

uint64_t type metadata accessor for BusinessUpdatesManager()
{
  return self;
}

void sub_2562002B4(char a1)
{
  id v2 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  char v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  if (v4)
  {
    uint64_t v5 = (void *)sub_25620F3B8();
    objc_msgSend(v4, sel_setBool_forKey_, a1 & 1, v5);

    objc_msgSend(v4, sel_synchronize);
    unsigned int v6 = CFNotificationCenterGetDarwinNotifyCenter();
    BOOL v7 = (__CFString *)sub_25620F3B8();
    CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);
  }
}

void sub_256200404(char a1)
{
  id v2 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  char v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  if (v4)
  {
    uint64_t v5 = (void *)sub_25620F3B8();
    objc_msgSend(v4, sel_setBool_forKey_, a1 & 1, v5);

    objc_msgSend(v4, sel_synchronize);
    unsigned int v6 = CFNotificationCenterGetDarwinNotifyCenter();
    BOOL v7 = (__CFString *)sub_25620F3B8();
    CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);
  }
  id v8 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v9 = (void *)sub_25620F3B8();
  id v10 = objc_msgSend(v8, sel_initWithSuiteName_, v9);

  if (v10)
  {
    char v11 = (void *)sub_25620F3B8();
    objc_msgSend(v10, sel_setBool_forKey_, 1, v11);

    objc_msgSend(v10, sel_synchronize);
    double v12 = CFNotificationCenterGetDarwinNotifyCenter();
    double v13 = (__CFString *)sub_25620F3B8();
    CFNotificationCenterPostNotification(v12, v13, 0, 0, 1u);
  }
}

uint64_t destroy for IOSSettingsView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for IOSSettingsView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IOSSettingsView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for IOSSettingsView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IOSSettingsView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IOSSettingsView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IOSSettingsView()
{
  return &type metadata for IOSSettingsView;
}

uint64_t sub_256200974()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_256200990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v115 = a2;
  v112 = (void (*)(char *, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_269F516D8);
  MEMORY[0x270FA5388](v112);
  v110 = (void (*)(char *, char *, uint64_t))((char *)&v106 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v114 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_269F516E0);
  uint64_t v113 = *(v114 - 1);
  MEMORY[0x270FA5388](v114);
  v111 = (char *)&v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F516E8);
  uint64_t v5 = MEMORY[0x270FA5388](v109);
  uint64_t v142 = (uint64_t)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v136 = (uint64_t)&v106 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F516F0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v141 = (uint64_t)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v134 = (uint64_t)&v106 - v11;
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F516F8);
  uint64_t v149 = *(void *)(v140 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v140);
  v139 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v131 = (char *)&v106 - v14;
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51700);
  uint64_t v148 = *(void *)(v138 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v138);
  v137 = (char *)&v106 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v129 = (char *)&v106 - v17;
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51708);
  uint64_t v147 = *(void *)(v135 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v135);
  v133 = (char *)&v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v127 = (char *)&v106 - v20;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51710);
  uint64_t v146 = *(void *)(v132 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v132);
  v130 = (char *)&v106 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v125 = (char *)&v106 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51718);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v128 = (uint64_t)&v106 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  unsigned __int8 v28 = (char *)&v106 - v27;
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51720);
  uint64_t v144 = *(void *)(v145 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v145);
  v126 = (char *)&v106 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v106 - v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51728);
  MEMORY[0x270FA5388](v33);
  char v35 = (char *)&v106 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51730);
  uint64_t v143 = *(void *)(v124 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v124);
  v123 = (char *)&v106 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v39 = (char *)&v106 - v38;
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51738);
  uint64_t v120 = *(void *)(v121 - 8);
  uint64_t v40 = MEMORY[0x270FA5388](v121);
  v118 = (char *)&v106 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v40);
  id v43 = (char *)&v106 - v42;
  uint64_t v152 = a1;
  sub_2562023F8((uint64_t)&v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51740);
  sub_25620E040(&qword_269F51748, &qword_269F51740, (void (*)(void))sub_25620CE58);
  v116 = v43;
  sub_25620F358();
  uint64_t v151 = a1;
  sub_256203044((uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51758);
  sub_2561F26BC(&qword_269F51760, &qword_269F51758);
  sub_25620CEB4();
  v117 = v39;
  sub_25620F388();
  uint64_t v150 = a1;
  sub_256203BF4((uint64_t *)&v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51780);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51280);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F511A0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51198);
  uint64_t v46 = sub_25620EE98();
  uint64_t v47 = sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
  uint64_t v48 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  uint64_t v153 = v45;
  v154 = (void (*)(void, void, void))v46;
  v108 = (void (*)(void, void, void))v46;
  uint64_t v155 = v47;
  uint64_t v156 = v48;
  uint64_t v107 = v48;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v153 = v44;
  v154 = (void (*)(void, void, void))MEMORY[0x263F8D4F8];
  uint64_t v155 = OpaqueTypeConformance2;
  uint64_t v156 = MEMORY[0x263F8D510];
  swift_getOpaqueTypeConformance2();
  sub_25620E37C((unint64_t *)&qword_269F512A8, &qword_269F51280);
  v119 = v32;
  sub_25620F388();
  long long v160 = *(_OWORD *)(a1 + 16);
  uint64_t v161 = *(void *)(a1 + 32);
  long long v157 = *(_OWORD *)(a1 + 16);
  uint64_t v158 = *(void *)(a1 + 32);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](&v153);
  id v51 = objc_msgSend(self, sel_sharedFeatureFlags);
  LODWORD(v32) = objc_msgSend(v51, sel_generativeModelsAvailable);
  swift_release();

  v122 = v28;
  if (v32)
  {
    MEMORY[0x270FA5388](v52);
    sub_25620F378();
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51788);
    uint64_t v54 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v28, 0, 1, v53);
  }
  else
  {
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51788);
    uint64_t v54 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v28, 1, 1, v55);
  }
  MEMORY[0x270FA5388](v54);
  sub_256206E6C((uint64_t *)&v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51790);
  sub_2561F26BC(&qword_269F51798, &qword_269F51790);
  uint64_t v56 = sub_25620F388();
  MEMORY[0x270FA5388](v56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F517A0);
  sub_2561F26BC(&qword_269F517A8, &qword_269F517A0);
  uint64_t v57 = sub_25620F378();
  MEMORY[0x270FA5388](v57);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F517B0);
  sub_2561F26BC(&qword_269F517B8, &qword_269F517B0);
  uint64_t v58 = sub_25620F378();
  MEMORY[0x270FA5388](v58);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v60 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v61 = (void *)sub_25620F3B8();
  uint64_t v62 = (void *)sub_25620F3B8();
  id v63 = objc_msgSend(v60, sel_localizedStringForKey_value_table_, v61, 0, v62);

  uint64_t v64 = sub_25620F3C8();
  uint64_t v66 = v65;

  *(void *)&long long v157 = v64;
  *((void *)&v157 + 1) = v66;
  sub_2561F2538();
  *(void *)&long long v157 = sub_25620F0D8();
  *((void *)&v157 + 1) = v67;
  LOBYTE(v158) = v68 & 1;
  uint64_t v159 = v69;
  sub_25620BAF8((uint64_t)&v153);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F517C0);
  sub_2561F26BC(&qword_269F517C8, &qword_269F517C0);
  sub_25620F368();
  long long v157 = v160;
  uint64_t v158 = v161;
  MEMORY[0x25A2A2F60](&v153, v50);
  id v70 = objc_msgSend(self, sel_sharedInstance);
  unsigned int v71 = objc_msgSend(v70, sel_shouldShowSatelliteDemoModeButton);
  swift_release();

  if (v71)
  {
    sub_25620BDB4((uint64_t)&v157);
    sub_25620BEDC((uint64_t)&v153);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F514C0);
    sub_2561F26BC(&qword_269F51808, &qword_269F514C0);
    uint64_t v72 = v134;
    sub_25620F368();
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517D0);
    uint64_t v74 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v72, 0, 1, v73);
  }
  else
  {
    uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517D0);
    uint64_t v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v134, 1, 1, v75);
  }
  uint64_t v76 = (uint64_t)v122;
  MEMORY[0x270FA5388](v74);
  sub_25620C9D0((uint64_t)&v157);
  sub_25620CAFC((uint64_t)v110);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F517D8);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F517E0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F517E8);
  uint64_t v79 = sub_2561F26BC(&qword_269F517F0, &qword_269F517E8);
  uint64_t v153 = v78;
  v154 = v108;
  uint64_t v155 = v79;
  uint64_t v156 = v107;
  uint64_t v80 = swift_getOpaqueTypeConformance2();
  uint64_t v153 = v77;
  v154 = (void (*)(void, void, void))MEMORY[0x263F8D4F8];
  uint64_t v155 = v80;
  uint64_t v156 = MEMORY[0x263F8D510];
  swift_getOpaqueTypeConformance2();
  sub_2561F26BC(&qword_269F517F8, &qword_269F516D8);
  v81 = v111;
  sub_25620F368();
  uint64_t v82 = sub_25620F028();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v84 = v113;
  uint64_t v85 = v142;
  v86 = v114;
  (*(void (**)(uint64_t, char *, void *))(v113 + 16))(v142, v81, v114);
  v87 = (uint64_t *)(v85 + *(int *)(v109 + 36));
  uint64_t *v87 = KeyPath;
  v87[1] = v82;
  (*(void (**)(char *, void *))(v84 + 8))(v81, v86);
  sub_2561F65AC(v85, v136, &qword_269F516E8);
  v108 = *(void (**)(void, void, void))(v120 + 16);
  v88 = v118;
  uint64_t v89 = v121;
  v108(v118, v116, v121);
  v110 = *(void (**)(char *, char *, uint64_t))(v143 + 16);
  v110(v123, v117, v124);
  uint64_t v109 = *(void *)(v144 + 16);
  ((void (*)(char *, char *, uint64_t))v109)(v126, v119, v145);
  sub_2561F2418(v76, v128, &qword_269F51718);
  v114 = *(void **)(v146 + 16);
  ((void (*)(char *, char *, uint64_t))v114)(v130, v125, v132);
  uint64_t v113 = *(void *)(v147 + 16);
  ((void (*)(char *, char *, uint64_t))v113)(v133, v127, v135);
  v112 = *(void (**)(char *, char *, uint64_t))(v148 + 16);
  v112(v137, v129, v138);
  v111 = *(char **)(v149 + 16);
  ((void (*)(char *, char *, uint64_t))v111)(v139, v131, v140);
  sub_2561F2418(v134, v141, &qword_269F516F0);
  sub_2561F2418(v136, v85, &qword_269F516E8);
  uint64_t v90 = v115;
  v108(v115, v88, v89);
  v91 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269F51800);
  v110((char *)(v90 + v91[12]), v123, v124);
  ((void (*)(uint64_t, char *, uint64_t))v109)(v90 + v91[16], v126, v145);
  sub_2561F2418(v128, v90 + v91[20], &qword_269F51718);
  uint64_t v92 = v132;
  ((void (*)(uint64_t, char *, uint64_t))v114)(v90 + v91[24], v130, v132);
  uint64_t v93 = v135;
  ((void (*)(uint64_t, char *, uint64_t))v113)(v90 + v91[28], v133, v135);
  uint64_t v94 = v138;
  v112((char *)(v90 + v91[32]), v137, v138);
  uint64_t v95 = v140;
  ((void (*)(uint64_t, char *, uint64_t))v111)(v90 + v91[36], v139, v140);
  sub_2561F2418(v141, v90 + v91[40], &qword_269F516F0);
  sub_2561F2418(v142, v90 + v91[44], &qword_269F516E8);
  sub_2561F247C(v136, &qword_269F516E8);
  sub_2561F247C(v134, &qword_269F516F0);
  v96 = *(void (**)(char *, uint64_t))(v149 + 8);
  v149 += 8;
  v96(v131, v95);
  v97 = *(void (**)(char *, uint64_t))(v148 + 8);
  v148 += 8;
  v97(v129, v94);
  v98 = *(void (**)(char *, uint64_t))(v147 + 8);
  v147 += 8;
  v98(v127, v93);
  v99 = *(void (**)(char *, uint64_t))(v146 + 8);
  v146 += 8;
  v99(v125, v92);
  sub_2561F247C((uint64_t)v122, &qword_269F51718);
  v100 = *(void (**)(char *, uint64_t))(v144 + 8);
  v144 += 8;
  v100(v119, v145);
  v101 = *(void (**)(char *, uint64_t))(v143 + 8);
  v143 += 8;
  uint64_t v102 = v124;
  v101(v117, v124);
  v103 = *(void (**)(char *, uint64_t))(v120 + 8);
  uint64_t v104 = v121;
  v103(v116, v121);
  sub_2561F247C(v142, &qword_269F516E8);
  sub_2561F247C(v141, &qword_269F516F0);
  v96(v139, v140);
  v97(v137, v138);
  v98(v133, v135);
  v99(v130, v132);
  sub_2561F247C(v128, &qword_269F51718);
  v100(v126, v145);
  v101(v123, v102);
  return ((uint64_t (*)(char *, uint64_t))v103)(v118, v104);
}

uint64_t sub_25620226C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](&v4, v0);
  id v1 = objc_msgSend(self, sel_sharedInstance);
  id v2 = objc_msgSend(v1, sel_systemPolicySpecifiers);

  type metadata accessor for CKWrappedPreferencesSpecifier();
  sub_25620F3F8();
  swift_release();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51AA8);
  sub_2561F26BC(&qword_269F51AB0, &qword_269F51AA8);
  sub_25620CE58();
  sub_25620E444(&qword_269F51AB8, (void (*)(uint64_t))type metadata accessor for CKWrappedPreferencesSpecifier);
  return sub_25620F348();
}

id sub_2562023EC@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  id v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_2562023F8@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_256202520@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518A0);
  uint64_t v74 = *(void *)(v65 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v65);
  uint64_t v64 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v73 = (char *)&v56 - v5;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51850);
  uint64_t v72 = *(void *)(v63 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v63);
  unsigned int v71 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v70 = (char *)&v56 - v8;
  uint64_t v61 = (void *)sub_25620EE98();
  uint64_t v62 = *(v61 - 1);
  MEMORY[0x270FA5388](v61);
  uint64_t v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51198);
  uint64_t v57 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511A0);
  uint64_t v69 = *(void *)(v75 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v75);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  char v68 = (char *)&v56 - v16;
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v60 = (void (*)(char *, char *, uint64_t))ObjCClassFromMetadata;
  id v59 = self;
  id v18 = objc_msgSend(v59, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v19 = (void *)sub_25620F3B8();
  unint64_t v58 = 0x80000002562142B0;
  uint64_t v20 = (void *)sub_25620F3B8();
  id v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, v20);

  uint64_t v22 = sub_25620F3C8();
  uint64_t v24 = v23;

  *(void *)&long long v83 = v22;
  *((void *)&v83 + 1) = v24;
  long long v78 = *(_OWORD *)(a1 + 16);
  uint64_t v79 = *(void *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  uint64_t v25 = v80;
  uint64_t v26 = v81;
  uint64_t v27 = v82;
  swift_getKeyPath();
  uint64_t v80 = v25;
  uint64_t v81 = v26;
  uint64_t v82 = v27;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2561F2538();
  sub_25620F2D8();
  sub_25620EE88();
  sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
  sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  uint64_t v67 = v15;
  uint64_t v28 = v56;
  uint64_t v29 = v61;
  sub_25620F128();
  (*(void (**)(char *, void *))(v62 + 8))(v10, v29);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v12, v28);
  uint64_t v30 = v69;
  uint64_t v31 = v68;
  (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v68, v15, v75);
  long long v78 = *(_OWORD *)(a1 + 40);
  long long v83 = *(_OWORD *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51878);
  sub_25620F258();
  uint64_t v76 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51880);
  sub_25620D8CC();
  sub_25620D938();
  uint64_t v32 = v70;
  sub_25620EDA8();
  id v33 = objc_msgSend(v59, sel_bundleForClass_, v60);
  uint64_t v34 = (void *)sub_25620F3B8();
  char v35 = (void *)sub_25620F3B8();
  id v36 = objc_msgSend(v33, sel_localizedStringForKey_value_table_, v34, 0, v35);

  uint64_t v37 = sub_25620F3C8();
  uint64_t v39 = v38;

  *(void *)&long long v83 = v37;
  *((void *)&v83 + 1) = v39;
  long long v77 = v78;
  sub_25620F258();
  uint64_t v40 = v73;
  sub_25620EDB8();
  id v60 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
  uint64_t v41 = v67;
  uint64_t v42 = v75;
  v60(v67, v31, v75);
  uint64_t v62 = *(void *)(v72 + 16);
  id v43 = v71;
  uint64_t v44 = v32;
  uint64_t v45 = v63;
  ((void (*)(char *, char *, uint64_t))v62)(v71, v44, v63);
  uint64_t v61 = *(void **)(v74 + 16);
  uint64_t v46 = v64;
  uint64_t v47 = v40;
  uint64_t v48 = v65;
  ((void (*)(char *, char *, uint64_t))v61)(v64, v47, v65);
  uint64_t v49 = v66;
  v60(v66, v41, v42);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51AA0);
  ((void (*)(char *, char *, uint64_t))v62)(&v49[*(int *)(v50 + 48)], v43, v45);
  ((void (*)(char *, char *, uint64_t))v61)(&v49[*(int *)(v50 + 64)], v46, v48);
  id v51 = *(void (**)(char *, uint64_t))(v74 + 8);
  v51(v73, v48);
  uint64_t v52 = *(void (**)(char *, uint64_t))(v72 + 8);
  v52(v70, v45);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v69 + 8);
  uint64_t v54 = v75;
  v53(v68, v75);
  v51(v46, v48);
  v52(v71, v45);
  return ((uint64_t (*)(char *, uint64_t))v53)(v67, v54);
}

uint64_t sub_256202E68()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v2 = (void *)sub_25620F3B8();
  uint64_t v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  uint64_t v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](v10, v8);
  swift_getKeyPath();
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  swift_release();
  sub_2561FEEB0();
  sub_2561F2538();
  return sub_25620ED98();
}

uint64_t sub_256203044@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51778);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = (void *)sub_25620F3B8();
  uint64_t v9 = (void *)sub_25620F3B8();
  id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

  uint64_t v11 = sub_25620F3C8();
  uint64_t v13 = v12;

  *(void *)uint64_t v5 = sub_25620EEC8();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51A68);
  uint64_t v16 = v11;
  uint64_t v17 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51A70);
  sub_25620E2B8();
  sub_25620EDA8();
  swift_bridgeObjectRelease();
  sub_2561F65AC((uint64_t)v5, a1, &qword_269F51778);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(a1, 0, 1, v2);
}

uint64_t sub_25620327C@<X0>(uint64_t a1@<X8>)
{
  sub_2562032E4((uint64_t)v7);
  uint64_t v2 = v7[0];
  uint64_t v3 = v7[1];
  char v4 = v8;
  uint64_t v5 = v9;
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_2562032E4@<X0>(uint64_t a1@<X8>)
{
  sub_2561F2538();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_25620F0D8();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_25620F028();
  uint64_t v6 = sub_25620F0B8();
  uint64_t v8 = v7;
  char v10 = v9;
  swift_release();
  sub_2561F2700(v1, v3, v5);
  swift_bridgeObjectRelease();
  uint64_t v11 = self;
  MEMORY[0x25A2A2E20](objc_msgSend(v11, sel_systemGrayColor));
  uint64_t v12 = sub_25620F098();
  uint64_t v41 = v13;
  uint64_t v42 = v12;
  char v40 = v14 & 1;
  sub_2561F2700(v6, v8, v10 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v17 = (void *)sub_25620F3B8();
  id v18 = (void *)sub_25620F3B8();
  id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_25620F3C8();
  uint64_t v20 = sub_25620F0D8();
  uint64_t v22 = v21;
  LOBYTE(v8) = v23 & 1;
  sub_25620F028();
  uint64_t v24 = sub_25620F0B8();
  uint64_t v26 = v25;
  char v28 = v27;
  swift_release();
  sub_2561F2700(v20, v22, v8);
  swift_bridgeObjectRelease();
  MEMORY[0x25A2A2E20](objc_msgSend(v11, sel_systemBlueColor));
  uint64_t v29 = sub_25620F098();
  uint64_t v31 = v30;
  LOBYTE(v8) = v32 & 1;
  sub_2561F2700(v24, v26, v28 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_25620F0A8();
  uint64_t v39 = v33;
  uint64_t v35 = v34;
  LOBYTE(v24) = v36;
  sub_2561F2700(v29, v31, v8);
  swift_bridgeObjectRelease();
  sub_2561F2700(v42, v41, v40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v35;
  *(unsigned char *)(a1 + 16) = v24 & 1;
  *(void *)(a1 + 24) = v39;
  return result;
}

uint64_t sub_256203680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = sub_25620EE98();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51198);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v37 = v7;
  uint64_t v38 = v8;
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511A0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  MEMORY[0x270FA5388](v11);
  char v36 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v16 = (void *)sub_25620F3B8();
  uint64_t v17 = (void *)sub_25620F3B8();
  id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  uint64_t v19 = sub_25620F3C8();
  uint64_t v21 = v20;

  uint64_t v49 = v19;
  uint64_t v50 = v21;
  long long v51 = *(_OWORD *)(a1 + 16);
  uint64_t v52 = *(void *)(a1 + 32);
  long long v47 = *(_OWORD *)(a1 + 16);
  uint64_t v48 = *(void *)(a1 + 32);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  long long v23 = v44;
  uint64_t v24 = v45;
  swift_getKeyPath();
  long long v44 = v23;
  uint64_t v45 = v24;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2561F2538();
  sub_25620F2D8();
  sub_25620EE88();
  uint64_t v25 = sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
  uint64_t v26 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  uint64_t v27 = v37;
  uint64_t v28 = v39;
  sub_25620F128();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v28);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v27);
  long long v44 = v51;
  uint64_t v45 = v52;
  MEMORY[0x25A2A2F60](&v47, v22);
  uint64_t v29 = v47;
  swift_getKeyPath();
  *(void *)&long long v44 = v29;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  LOBYTE(v19) = *(unsigned char *)(v29 + 19);
  swift_release();
  LOBYTE(v47) = v19;
  uint64_t v30 = swift_allocObject();
  long long v31 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v30 + 64) = v31;
  *(void *)(v30 + 80) = *(void *)(a1 + 64);
  long long v32 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v30 + 32) = v32;
  sub_25620D22C(a1);
  *(void *)&long long v44 = v27;
  *((void *)&v44 + 1) = v28;
  uint64_t v45 = v25;
  uint64_t v46 = v26;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v41;
  uint64_t v34 = v36;
  sub_25620F178();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v34, v33);
}

uint64_t sub_256203BF4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *a1 = result;
  a1[1] = v8;
  a1[2] = v9 & 1;
  a1[3] = v10;
  return result;
}

uint64_t sub_256203D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = sub_25620EE98();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51198);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v37 = v7;
  uint64_t v38 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511A0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v41 = v11;
  uint64_t v42 = v12;
  MEMORY[0x270FA5388](v11);
  char v36 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v16 = (void *)sub_25620F3B8();
  uint64_t v17 = (void *)sub_25620F3B8();
  id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  uint64_t v19 = sub_25620F3C8();
  uint64_t v21 = v20;

  uint64_t v49 = v19;
  uint64_t v50 = v21;
  long long v51 = *(_OWORD *)(a1 + 16);
  uint64_t v52 = *(void *)(a1 + 32);
  long long v47 = *(_OWORD *)(a1 + 16);
  uint64_t v48 = *(void *)(a1 + 32);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  long long v23 = v44;
  uint64_t v24 = v45;
  swift_getKeyPath();
  long long v44 = v23;
  uint64_t v45 = v24;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2561F2538();
  sub_25620F2D8();
  sub_25620EE88();
  uint64_t v25 = sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
  uint64_t v26 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  uint64_t v27 = v37;
  uint64_t v28 = v39;
  sub_25620F128();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v28);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v27);
  long long v44 = v51;
  uint64_t v45 = v52;
  MEMORY[0x25A2A2F60](&v47, v22);
  uint64_t v29 = v47;
  swift_getKeyPath();
  *(void *)&long long v44 = v29;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  LOBYTE(v19) = *(unsigned char *)(v29 + 20);
  swift_release();
  LOBYTE(v47) = v19;
  uint64_t v30 = swift_allocObject();
  long long v31 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v30 + 64) = v31;
  *(void *)(v30 + 80) = *(void *)(a1 + 64);
  long long v32 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v30 + 32) = v32;
  sub_25620D22C(a1);
  *(void *)&long long v44 = v27;
  *((void *)&v44 + 1) = v28;
  uint64_t v45 = v25;
  uint64_t v46 = v26;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v41;
  uint64_t v34 = v36;
  sub_25620F178();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v34, v33);
}

uint64_t sub_256204290(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  char v4 = *(unsigned char *)(a3 + 8);
  uint64_t v5 = swift_retain();
  sub_25620CF7C(v5, v4);
  swift_release();
  objc_msgSend(self, sel_setMessageSummarizationUserPreference_, v3);
  return swift_release();
}

uint64_t sub_25620430C@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v153 = a1;
  v162 = a2;
  uint64_t v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51960);
  MEMORY[0x270FA5388](v152);
  uint64_t v151 = (char *)&v143 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51968);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v181 = (uint64_t)&v143 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v179 = (uint64_t)&v143 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51970);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v180 = (uint64_t)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v185 = (uint64_t)&v143 - v10;
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51198);
  uint64_t v157 = *(void *)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  uint64_t v156 = (char *)&v143 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511A0);
  uint64_t v160 = *(void *)(v161 - 8);
  MEMORY[0x270FA5388](v161);
  uint64_t v158 = (char *)&v143 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51780);
  uint64_t v178 = *(void *)(v188 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v188);
  v187 = (char *)&v143 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v184 = (char *)&v143 - v15;
  *(void *)&long long v167 = sub_25620EE98();
  uint64_t v166 = *(void *)(v167 - 8);
  MEMORY[0x270FA5388](v167);
  v165 = (char *)&v143 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517E8);
  uint64_t v144 = *(void *)(v146 - 8);
  MEMORY[0x270FA5388](v146);
  uint64_t v143 = (char *)&v143 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517E0);
  uint64_t v148 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  uint64_t v147 = (char *)&v143 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517D8);
  uint64_t v163 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  uint64_t v145 = (char *)&v143 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51978);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v177 = (uint64_t)&v143 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v186 = (uint64_t)&v143 - v23;
  uint64_t v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51980);
  uint64_t v175 = *(void *)(v176 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v176);
  v183 = (char *)&v143 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v182 = (char *)&v143 - v26;
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51988);
  MEMORY[0x270FA5388](v168);
  uint64_t v155 = (char *)&v143 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51990);
  uint64_t v173 = *(void *)(v174 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v174);
  v172 = (char *)&v143 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  long long v31 = (char *)&v143 - v30;
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v33 = self;
  id v34 = objc_msgSend(v33, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v35 = (void *)sub_25620F3B8();
  uint64_t v150 = "MPLE_DATA_FOOTER";
  char v36 = (void *)sub_25620F3B8();
  id v37 = objc_msgSend(v34, sel_localizedStringForKey_value_table_, v35, 0, v36);

  uint64_t v38 = sub_25620F3C8();
  uint64_t v40 = v39;

  *(void *)&long long v196 = v38;
  *((void *)&v196 + 1) = v40;
  uint64_t v41 = sub_25620EDD8();
  char v42 = sub_25620EFD8();
  *(void *)&long long v192 = v41;
  BYTE8(v192) = v42;
  id v169 = v33;
  uint64_t v43 = v33;
  uint64_t v44 = v153;
  v170 = (void (*)(char *, char *, uint64_t))ObjCClassFromMetadata;
  id v45 = objc_msgSend(v43, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v46 = (void *)sub_25620F3B8();
  unint64_t v154 = 0x80000002562142B0;
  long long v47 = (void *)sub_25620F3B8();
  id v48 = objc_msgSend(v45, sel_localizedStringForKey_value_table_, v46, 0, v47);

  uint64_t v49 = sub_25620F3C8();
  uint64_t v51 = v50;

  *(void *)v190 = v49;
  *(void *)&v190[8] = v51;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51998);
  uint64_t v53 = sub_25620DEC0(&qword_269F519A0, &qword_269F51998, (void (*)(void))sub_2561F1290);
  unint64_t v54 = sub_2561F2538();
  uint64_t v55 = MEMORY[0x263F8D310];
  sub_25620F158();
  swift_bridgeObjectRelease();
  *(void *)v190 = v52;
  *(void *)&v190[8] = v55;
  *(void *)&v190[16] = v53;
  *(void *)&long long v191 = v54;
  uint64_t v56 = 1;
  swift_getOpaqueTypeConformance2();
  v171 = v31;
  uint64_t v168 = v54;
  sub_25620EDB8();
  uint64_t v189 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F519A8);
  sub_25620DD40();
  sub_25620F078();
  long long v196 = *(_OWORD *)(v44 + 16);
  uint64_t v197 = *(void *)(v44 + 32);
  *(_OWORD *)v190 = *(_OWORD *)(v44 + 16);
  *(void *)&v190[16] = *(void *)(v44 + 32);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](&v192);
  uint64_t v155 = (char *)self;
  id v58 = objc_msgSend(v155, sel_sharedInstance);
  LODWORD(v52) = objc_msgSend(v58, sel_isRaiseGestureSupported);
  swift_release();

  if (v52)
  {
    long long v192 = v196;
    uint64_t v193 = v197;
    sub_25620F328();
    long long v59 = *(_OWORD *)v190;
    uint64_t v60 = *(void *)&v190[16];
    swift_getKeyPath();
    *(_OWORD *)v190 = v59;
    *(void *)&v190[16] = v60;
    sub_25620F318();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F51820);
    sub_2561F26BC(&qword_269F51828, &qword_269F51820);
    uint64_t v61 = v143;
    sub_25620F2C8();
    uint64_t v62 = v165;
    sub_25620EE88();
    uint64_t v63 = sub_2561F26BC(&qword_269F517F0, &qword_269F517E8);
    uint64_t v64 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
    uint64_t v65 = v147;
    uint64_t v66 = v146;
    uint64_t v67 = v167;
    sub_25620F128();
    (*(void (**)(char *, uint64_t))(v166 + 8))(v62, v67);
    (*(void (**)(char *, uint64_t))(v144 + 8))(v61, v66);
    *(_OWORD *)v190 = v196;
    *(void *)&v190[16] = v197;
    MEMORY[0x25A2A2F60](&v192, v57);
    uint64_t v68 = v192;
    swift_getKeyPath();
    *(void *)v190 = v68;
    sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
    sub_25620ECF8();
    swift_release();
    LOBYTE(v61) = *(unsigned char *)(v68 + 33);
    swift_release();
    LOBYTE(v192) = (_BYTE)v61;
    uint64_t v69 = swift_allocObject();
    long long v70 = *(_OWORD *)(v44 + 48);
    *(_OWORD *)(v69 + 48) = *(_OWORD *)(v44 + 32);
    *(_OWORD *)(v69 + 64) = v70;
    *(void *)(v69 + 80) = *(void *)(v44 + 64);
    long long v71 = *(_OWORD *)(v44 + 16);
    *(_OWORD *)(v69 + 16) = *(_OWORD *)v44;
    *(_OWORD *)(v69 + 32) = v71;
    sub_25620D22C(v44);
    *(void *)v190 = v66;
    *(void *)&v190[8] = v67;
    *(void *)&v190[16] = v63;
    *(void *)&long long v191 = v64;
    swift_getOpaqueTypeConformance2();
    uint64_t v72 = v145;
    uint64_t v73 = v149;
    sub_25620F178();
    swift_release();
    (*(void (**)(char *, uint64_t))(v148 + 8))(v65, v73);
    (*(void (**)(uint64_t, char *, uint64_t))(v163 + 32))(v186, v72, v164);
    uint64_t v56 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v163 + 56))(v186, v56, 1, v164);
  id v74 = objc_msgSend(v169, sel_bundleForClass_, v170);
  uint64_t v75 = (void *)sub_25620F3B8();
  uint64_t v76 = (void *)sub_25620F3B8();
  id v77 = objc_msgSend(v74, sel_localizedStringForKey_value_table_, v75, 0, v76);

  uint64_t v78 = sub_25620F3C8();
  uint64_t v80 = v79;

  uint64_t v194 = v78;
  uint64_t v195 = v80;
  long long v192 = v196;
  uint64_t v193 = v197;
  sub_25620F328();
  long long v81 = *(_OWORD *)v190;
  uint64_t v82 = *(void *)&v190[16];
  swift_getKeyPath();
  *(_OWORD *)v190 = v81;
  *(void *)&v190[16] = v82;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v83 = v156;
  sub_25620F2D8();
  uint64_t v84 = v165;
  sub_25620EE88();
  uint64_t v85 = sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
  uint64_t v86 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  v87 = v158;
  uint64_t v88 = v159;
  uint64_t v89 = v57;
  uint64_t v90 = v167;
  sub_25620F128();
  (*(void (**)(char *, uint64_t))(v166 + 8))(v84, v90);
  (*(void (**)(char *, uint64_t))(v157 + 8))(v83, v88);
  *(_OWORD *)v190 = v196;
  *(void *)&v190[16] = v197;
  MEMORY[0x25A2A2F60](&v192, v89);
  uint64_t v91 = v192;
  swift_getKeyPath();
  *(void *)v190 = v91;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  LOBYTE(v83) = *(unsigned char *)(v91 + 34);
  swift_release();
  LOBYTE(v192) = (_BYTE)v83;
  uint64_t v92 = swift_allocObject();
  long long v93 = *(_OWORD *)(v44 + 48);
  *(_OWORD *)(v92 + 48) = *(_OWORD *)(v44 + 32);
  *(_OWORD *)(v92 + 64) = v93;
  *(void *)(v92 + 80) = *(void *)(v44 + 64);
  long long v94 = *(_OWORD *)(v44 + 16);
  *(_OWORD *)(v92 + 16) = *(_OWORD *)v44;
  *(_OWORD *)(v92 + 32) = v94;
  sub_25620D22C(v44);
  *(void *)v190 = v88;
  *(void *)&v190[8] = v90;
  uint64_t v95 = v89;
  *(void *)&v190[16] = v85;
  *(void *)&long long v191 = v86;
  swift_getOpaqueTypeConformance2();
  v96 = v187;
  uint64_t v97 = v161;
  sub_25620F178();
  swift_release();
  (*(void (**)(char *, uint64_t))(v160 + 8))(v87, v97);
  (*(void (**)(char *, char *, uint64_t))(v178 + 32))(v184, v96, v188);
  *(_OWORD *)v190 = v196;
  *(void *)&v190[16] = v197;
  MEMORY[0x25A2A2F60](&v192, v89);
  id v98 = v155;
  id v99 = objc_msgSend(v155, sel_sharedInstance);
  LODWORD(v96) = objc_msgSend(v99, sel_shouldShowCheckInLocationHistorySettings);
  swift_release();

  if (v96)
  {
    long long v192 = v196;
    uint64_t v193 = v197;
    sub_25620F328();
    uint64_t v100 = *(void *)v190;
    type metadata accessor for CheckInDataView.Model();
    long long v167 = *(_OWORD *)&v190[8];
    uint64_t v101 = swift_allocObject();
    sub_25620ED08();
    *(void *)&long long v192 = v101;
    uint64_t v102 = sub_25620F238();
    *(void *)&v190[16] = v100;
    long long v191 = v167;
    MEMORY[0x270FA5388](v102);
    *(&v143 - 2) = (char *)v44;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F51880);
    sub_25620D8CC();
    sub_25620DFA4();
    uint64_t v103 = v185;
    sub_25620EDA8();
    uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F519D0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56))(v103, 0, 1, v104);
  }
  else
  {
    uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F519D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v185, 1, 1, v105);
  }
  *(_OWORD *)v190 = v196;
  *(void *)&v190[16] = v197;
  MEMORY[0x25A2A2F60](&v192, v95);
  id v106 = objc_msgSend(v98, sel_sharedInstance);
  unsigned int v107 = objc_msgSend(v106, sel_shouldShowSharedWithYouSettings);
  swift_release();

  if (v107)
  {
    long long v192 = v196;
    uint64_t v193 = v197;
    sub_25620F328();
    long long v108 = *(_OWORD *)v190;
    uint64_t v109 = *(void *)&v190[16];
    uint64_t v110 = sub_25620EDD8();
    char v111 = sub_25620EFD8();
    *(_OWORD *)v190 = v108;
    *(void *)&v190[16] = v109;
    *(void *)&long long v191 = v110;
    BYTE8(v191) = v111;
    id v112 = objc_msgSend(v169, sel_bundleForClass_, v170);
    uint64_t v113 = (void *)sub_25620F3B8();
    v114 = (void *)sub_25620F3B8();
    id v115 = objc_msgSend(v112, sel_localizedStringForKey_value_table_, v113, 0, v114);

    uint64_t v116 = sub_25620F3C8();
    uint64_t v118 = v117;

    *(void *)&long long v192 = v116;
    *((void *)&v192 + 1) = v118;
    uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F519E8);
    uint64_t v120 = sub_25620DEC0(&qword_269F519F0, &qword_269F519E8, (void (*)(void))sub_25620DF40);
    uint64_t v121 = v168;
    sub_25620F158();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v122 = swift_release();
    MEMORY[0x270FA5388](v122);
    *(&v143 - 2) = (char *)v44;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F51880);
    sub_25620D8CC();
    *(void *)v190 = v119;
    *(void *)&v190[8] = MEMORY[0x263F8D310];
    *(void *)&v190[16] = v120;
    *(void *)&long long v191 = v121;
    swift_getOpaqueTypeConformance2();
    uint64_t v123 = v179;
    sub_25620EDA8();
    uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F519D8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56))(v123, 0, 1, v124);
  }
  else
  {
    uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F519D8);
    uint64_t v123 = v179;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v125 - 8) + 56))(v179, 1, 1, v125);
  }
  uint64_t v126 = v186;
  v127 = *(void (**)(char *, char *, uint64_t))(v173 + 16);
  uint64_t v128 = v172;
  uint64_t v129 = v174;
  v127(v172, v171, v174);
  id v169 = *(id *)(v175 + 16);
  ((void (*)(char *, char *, uint64_t))v169)(v183, v182, v176);
  uint64_t v130 = v177;
  sub_2561F2418(v126, v177, &qword_269F51978);
  uint64_t v131 = v178;
  v170 = *(void (**)(char *, char *, uint64_t))(v178 + 16);
  v170(v187, v184, v188);
  sub_2561F2418(v185, v180, &qword_269F51970);
  sub_2561F2418(v123, v181, &qword_269F51968);
  uint64_t v132 = v162;
  v127(v162, v128, v129);
  v133 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269F519E0);
  uint64_t v134 = v176;
  ((void (*)(char *, char *, uint64_t))v169)(&v132[v133[12]], v183, v176);
  sub_2561F2418(v130, (uint64_t)&v132[v133[16]], &qword_269F51978);
  uint64_t v135 = v188;
  v170(&v132[v133[20]], v187, v188);
  uint64_t v136 = v180;
  sub_2561F2418(v180, (uint64_t)&v132[v133[24]], &qword_269F51970);
  uint64_t v137 = v181;
  sub_2561F2418(v181, (uint64_t)&v132[v133[28]], &qword_269F51968);
  sub_2561F247C(v179, &qword_269F51968);
  sub_2561F247C(v185, &qword_269F51970);
  uint64_t v138 = *(void (**)(char *, uint64_t))(v131 + 8);
  v138(v184, v135);
  sub_2561F247C(v186, &qword_269F51978);
  v139 = *(void (**)(char *, uint64_t))(v175 + 8);
  v139(v182, v134);
  uint64_t v140 = *(void (**)(char *, uint64_t))(v173 + 8);
  uint64_t v141 = v174;
  v140(v171, v174);
  sub_2561F247C(v137, &qword_269F51968);
  sub_2561F247C(v136, &qword_269F51970);
  v138(v187, v188);
  sub_2561F247C(v177, &qword_269F51978);
  v139(v183, v134);
  return ((uint64_t (*)(char *, uint64_t))v140)(v172, v141);
}

uint64_t sub_256205DB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = sub_25620EF28();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v47 = v3;
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v3);
  id v45 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F519C0);
  uint64_t v41 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F519B8);
  uint64_t v46 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v39 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51A08);
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v40 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v13 = (void *)sub_25620F3B8();
  uint64_t v14 = (void *)sub_25620F3B8();
  id v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, 0, v14);

  uint64_t v16 = sub_25620F3C8();
  uint64_t v18 = v17;

  *(void *)&long long v50 = v16;
  *((void *)&v50 + 1) = v18;
  uint64_t v55 = sub_25620F3E8();
  uint64_t v56 = v19;
  long long v57 = *(_OWORD *)(a1 + 16);
  uint64_t v58 = *(void *)(a1 + 32);
  long long v53 = *(_OWORD *)(a1 + 16);
  uint64_t v54 = *(void *)(a1 + 32);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  long long v21 = v50;
  uint64_t v22 = v51;
  swift_getKeyPath();
  long long v50 = v21;
  uint64_t v51 = v22;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v50 = v53;
  LOBYTE(v51) = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51A10);
  sub_2561FF1E4();
  sub_25620E040(&qword_269F51A18, &qword_269F51A10, (void (*)(void))sub_25620E0B8);
  sub_2561F2538();
  sub_25620F2B8();
  long long v50 = v57;
  uint64_t v51 = v58;
  MEMORY[0x25A2A2F60](&v53, v20);
  uint64_t v23 = v53;
  swift_getKeyPath();
  *(void *)&long long v50 = v23;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  LOBYTE(v12) = *(unsigned char *)(v23 + 32);
  swift_release();
  LOBYTE(v50) = (_BYTE)v12;
  uint64_t v24 = swift_allocObject();
  long long v25 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 64) = v25;
  *(void *)(v24 + 80) = *(void *)(a1 + 64);
  long long v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 32) = v26;
  sub_25620D22C(a1);
  uint64_t v27 = sub_2561F26BC(&qword_269F519C8, &qword_269F519C0);
  unint64_t v28 = sub_2561FF3B4();
  uint64_t v29 = v39;
  sub_25620F178();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v6);
  uint64_t v30 = v45;
  sub_25620EF18();
  *(void *)&long long v50 = v6;
  *((void *)&v50 + 1) = &type metadata for SettingsModel.AudioExpiration;
  uint64_t v51 = v27;
  unint64_t v52 = v28;
  swift_getOpaqueTypeConformance2();
  long long v31 = v40;
  uint64_t v32 = v43;
  uint64_t v33 = v47;
  sub_25620F118();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v30, v33);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v29, v32);
  uint64_t v34 = v42;
  uint64_t v35 = v49;
  uint64_t v36 = v44;
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v49, v31, v44);
  *(unsigned char *)(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269F519A8) + 36)) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v31, v36);
}

uint64_t sub_25620649C()
{
  return sub_25620F348();
}

uint64_t sub_256206578@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  sub_2561FEA2C();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v3;
  *(unsigned char *)(a2 + 33) = v3;
  return result;
}

uint64_t sub_2562065E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(unsigned char *)(a3 + 8);
  uint64_t v4 = swift_retain();
  sub_25620CF7C(v4, v3);
  swift_release();
  sub_2561FA80C();
  return swift_release();
}

double sub_256206648@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25620C508((void (*)(__n128 *__return_ptr))sub_256206660, a1).n128_u64[0];
  return result;
}

uint64_t sub_256206660@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t v7 = sub_25620F0D8();
  uint64_t v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_25620F198();
  uint64_t v11 = sub_25620F088();
  uint64_t v37 = v12;
  uint64_t v38 = v11;
  char v14 = v13;
  uint64_t v39 = v15;
  swift_release();
  char v36 = v14 & 1;
  sub_2561F2700(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v17 = (void *)sub_25620F3B8();
  uint64_t v18 = (void *)sub_25620F3B8();
  id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_25620F3C8();
  uint64_t v20 = sub_25620F0D8();
  uint64_t v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_25620F028();
  uint64_t v24 = sub_25620F0B8();
  uint64_t v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_2561F2700(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_25620F1A8();
  uint64_t v28 = sub_25620F088();
  uint64_t v30 = v29;
  LOBYTE(v19) = v31;
  uint64_t v33 = v32;
  swift_release();
  sub_2561F2700(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v37;
  *(unsigned char *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v39;
  *(void *)(a1 + 32) = v28;
  *(void *)(a1 + 40) = v30;
  *(unsigned char *)(a1 + 48) = v19 & 1;
  *(void *)(a1 + 56) = v33;
  sub_2561F2710(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_2561F2710(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_2561F2700(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_2561F2700(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2562069EC()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  id v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  uint64_t v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](v10, v8);
  swift_getKeyPath();
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  swift_release();
  sub_2561FEC70();
  sub_2561F2538();
  return sub_25620ED98();
}

uint64_t sub_256206BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51880);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  char v10 = (void *)sub_25620F3B8();
  uint64_t v11 = (void *)sub_25620F3B8();
  id v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, v11);

  uint64_t v13 = sub_25620F3C8();
  uint64_t v15 = v14;

  v24[1] = v13;
  v24[2] = v15;
  long long v22 = *(_OWORD *)(a1 + 16);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](v24, v16);
  uint64_t v17 = v24[0];
  swift_getKeyPath();
  *(void *)&long long v22 = v17;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  int v18 = *(unsigned __int8 *)(v17 + 37);
  swift_release();
  uint64_t v19 = 6710863;
  if (v18) {
    uint64_t v19 = 28239;
  }
  unint64_t v20 = 0xE300000000000000;
  if (v18) {
    unint64_t v20 = 0xE200000000000000;
  }
  *(void *)&long long v22 = v19;
  *((void *)&v22 + 1) = v20;
  sub_2561F2538();
  sub_25620ED98();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

uint64_t sub_256206E6C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *a1 = result;
  a1[1] = v8;
  a1[2] = v9 & 1;
  a1[3] = v10;
  return result;
}

uint64_t sub_256206F94@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v3 = sub_25620EE98();
  uint64_t v67 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v66 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51198);
  uint64_t v65 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v64 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511A0);
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v69 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51780);
  uint64_t v76 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v68 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51840);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v72 = (uint64_t)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v73 = (char *)&v58 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51850);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  id v77 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v58 - v18;
  unsigned long long v86 = *(_OWORD *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51878);
  sub_25620F258();
  uint64_t v78 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51880);
  sub_25620D8CC();
  sub_25620D938();
  id v74 = v19;
  sub_25620EDA8();
  unsigned long long v86 = *(_OWORD *)(a1 + 16);
  uint64_t v87 = *(void *)(a1 + 32);
  unsigned long long v79 = *(_OWORD *)(a1 + 16);
  uint64_t v80 = *(void *)(a1 + 32);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](&v82);
  id v21 = objc_msgSend(self, sel_sharedInstance);
  LODWORD(v19) = objc_msgSend(v21, sel_shouldShowContactPhotoSettings);
  swift_release();

  if (v19)
  {
    type metadata accessor for MessagesSettingsUtilities();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v23 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v24 = (void *)sub_25620F3B8();
    uint64_t v25 = (void *)sub_25620F3B8();
    id v26 = objc_msgSend(v23, sel_localizedStringForKey_value_table_, v24, 0, v25);
    uint64_t v63 = v8;
    id v27 = v26;

    uint64_t v28 = sub_25620F3C8();
    uint64_t v30 = v29;

    uint64_t v84 = v28;
    uint64_t v85 = v30;
    unsigned long long v82 = v86;
    uint64_t v83 = v87;
    sub_25620F328();
    unint64_t v32 = *((void *)&v79 + 1);
    unint64_t v31 = v79;
    uint64_t v33 = v80;
    swift_getKeyPath();
    uint64_t v60 = v3;
    uint64_t v59 = v5;
    unsigned long long v79 = __PAIR128__(v32, v31);
    uint64_t v80 = v33;
    sub_25620F318();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_2561F2538();
    uint64_t v34 = v64;
    sub_25620F2D8();
    uint64_t v35 = v66;
    sub_25620EE88();
    uint64_t v62 = sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
    uint64_t v61 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
    char v36 = v69;
    uint64_t v37 = v59;
    uint64_t v38 = v60;
    sub_25620F128();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v35, v38);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v34, v37);
    unsigned long long v79 = v86;
    uint64_t v80 = v87;
    MEMORY[0x25A2A2F60](&v82, v20);
    uint64_t v39 = v82;
    swift_getKeyPath();
    *(void *)&unsigned long long v79 = v39;
    sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
    sub_25620ECF8();
    swift_release();
    LOBYTE(v28) = *(unsigned char *)(v39 + 39);
    swift_release();
    LOBYTE(v82) = v28;
    uint64_t v40 = swift_allocObject();
    long long v41 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v40 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v40 + 64) = v41;
    *(void *)(v40 + 80) = *(void *)(a1 + 64);
    long long v42 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v40 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v40 + 32) = v42;
    sub_25620D22C(a1);
    *(void *)&unsigned long long v79 = v37;
    *((void *)&v79 + 1) = v38;
    uint64_t v80 = v62;
    uint64_t v81 = v61;
    swift_getOpaqueTypeConformance2();
    uint64_t v43 = v68;
    uint64_t v44 = v71;
    sub_25620F178();
    uint64_t v8 = v63;
    swift_release();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v36, v44);
    uint64_t v45 = v76;
    uint64_t v46 = v73;
    (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v73, v43, v8);
    uint64_t v47 = 0;
    uint64_t v48 = (uint64_t)v46;
    uint64_t v49 = v45;
  }
  else
  {
    uint64_t v47 = 1;
    uint64_t v48 = (uint64_t)v73;
    uint64_t v49 = v76;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v48, v47, 1, v8);
  long long v50 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v51 = v77;
  unint64_t v52 = v74;
  v50(v77, v74, v14);
  uint64_t v53 = v72;
  sub_2561F2418(v48, v72, &qword_269F51840);
  uint64_t v54 = v75;
  v50(v75, v51, v14);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51958);
  sub_2561F2418(v53, (uint64_t)&v54[*(int *)(v55 + 48)], &qword_269F51840);
  sub_2561F247C(v48, &qword_269F51840);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v15 + 8);
  v56(v52, v14);
  sub_2561F247C(v53, &qword_269F51840);
  return ((uint64_t (*)(char *, uint64_t))v56)(v51, v14);
}

uint64_t sub_25620796C()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  uint64_t v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  uint64_t v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](v10, v8);
  swift_getKeyPath();
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  swift_release();
  sub_2561FED9C();
  sub_2561F2538();
  return sub_25620ED98();
}

uint64_t sub_256207B48@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51898);
  uint64_t v77 = *(void *)(v75 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v75);
  uint64_t v67 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  id v74 = (char *)&v59 - v5;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518A0);
  uint64_t v76 = *(void *)(v66 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v66);
  uint64_t v73 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v72 = (char *)&v59 - v8;
  uint64_t v64 = (void *)sub_25620EE98();
  uint64_t v65 = *(v64 - 1);
  MEMORY[0x270FA5388](v64);
  uint64_t v61 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517E8);
  uint64_t v60 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518A8);
  uint64_t v63 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518B0);
  uint64_t v71 = *(void *)(v78 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v78);
  uint64_t v69 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v70 = (char *)&v59 - v17;
  long long v86 = *(_OWORD *)(a1 + 16);
  uint64_t v87 = *(void *)(a1 + 32);
  long long v84 = *(_OWORD *)(a1 + 16);
  uint64_t v85 = *(void *)(a1 + 32);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  long long v19 = v81;
  uint64_t v20 = v82;
  swift_getKeyPath();
  long long v81 = v19;
  uint64_t v82 = v20;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51820);
  sub_2561F26BC(&qword_269F51828, &qword_269F51820);
  sub_25620F2C8();
  long long v81 = v86;
  uint64_t v82 = v87;
  MEMORY[0x25A2A2F60](&v84, v18);
  uint64_t v21 = v84;
  swift_getKeyPath();
  *(void *)&long long v81 = v21;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  char v22 = *(unsigned char *)(v21 + 40);
  swift_release();
  LOBYTE(v81) = v22;
  uint64_t v23 = swift_allocObject();
  long long v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v24;
  *(void *)(v23 + 80) = *(void *)(a1 + 64);
  long long v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  sub_25620D22C(a1);
  uint64_t v26 = sub_2561F26BC(&qword_269F517F0, &qword_269F517E8);
  uint64_t v27 = MEMORY[0x263F8D4F8];
  uint64_t v28 = MEMORY[0x263F8D510];
  sub_25620F178();
  swift_release();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v12, v10);
  uint64_t v29 = v61;
  sub_25620EE88();
  *(void *)&long long v81 = v10;
  *((void *)&v81 + 1) = v27;
  uint64_t v82 = v26;
  uint64_t v83 = v28;
  swift_getOpaqueTypeConformance2();
  sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  uint64_t v30 = v69;
  unint64_t v31 = v29;
  uint64_t v32 = v62;
  uint64_t v33 = v64;
  sub_25620F128();
  (*(void (**)(char *, void *))(v65 + 8))(v31, v33);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v32);
  uint64_t v34 = v71;
  uint64_t v35 = v70;
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v70, v30, v78);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v37 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v38 = (void *)sub_25620F3B8();
  uint64_t v39 = (void *)sub_25620F3B8();
  id v40 = objc_msgSend(v37, sel_localizedStringForKey_value_table_, v38, 0, v39);

  uint64_t v41 = sub_25620F3C8();
  uint64_t v43 = v42;

  *(void *)&long long v84 = v41;
  *((void *)&v84 + 1) = v43;
  long long v80 = *(_OWORD *)(a1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51878);
  sub_25620F258();
  sub_25620D938();
  sub_2561F2538();
  uint64_t v44 = v72;
  sub_25620EDB8();
  uint64_t v79 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F518B8);
  sub_25620D9CC();
  uint64_t v45 = v74;
  sub_25620F078();
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  uint64_t v47 = v78;
  v46(v30, v35, v78);
  uint64_t v65 = *(void *)(v76 + 16);
  uint64_t v48 = v73;
  uint64_t v49 = v66;
  ((void (*)(char *, char *, uint64_t))v65)(v73, v44, v66);
  uint64_t v64 = *(void **)(v77 + 16);
  long long v50 = v67;
  ((void (*)(char *, char *, uint64_t))v64)(v67, v45, v75);
  uint64_t v51 = v68;
  v46(v68, v30, v47);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518E8);
  ((void (*)(char *, char *, uint64_t))v65)(&v51[*(int *)(v52 + 48)], v48, v49);
  uint64_t v53 = v75;
  ((void (*)(char *, char *, uint64_t))v64)(&v51[*(int *)(v52 + 64)], v50, v75);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v77 + 8);
  v54(v74, v53);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v76 + 8);
  v55(v72, v49);
  uint64_t v56 = *(void (**)(char *, uint64_t))(v71 + 8);
  uint64_t v57 = v78;
  v56(v70, v78);
  v54(v50, v53);
  v55(v73, v49);
  return ((uint64_t (*)(char *, uint64_t))v56)(v69, v57);
}

double sub_2562085F8@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25620C508((void (*)(__n128 *__return_ptr))sub_256208610, a1).n128_u64[0];
  return result;
}

uint64_t sub_256208610@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t v7 = sub_25620F0D8();
  uint64_t v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_25620F198();
  uint64_t v11 = sub_25620F088();
  uint64_t v37 = v12;
  uint64_t v38 = v11;
  char v14 = v13;
  uint64_t v39 = v15;
  swift_release();
  char v36 = v14 & 1;
  sub_2561F2700(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v17 = (void *)sub_25620F3B8();
  uint64_t v18 = (void *)sub_25620F3B8();
  id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_25620F3C8();
  uint64_t v20 = sub_25620F0D8();
  uint64_t v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_25620F028();
  uint64_t v24 = sub_25620F0B8();
  uint64_t v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_2561F2700(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_25620F1A8();
  uint64_t v28 = sub_25620F088();
  uint64_t v30 = v29;
  LOBYTE(v19) = v31;
  uint64_t v33 = v32;
  swift_release();
  sub_2561F2700(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v37;
  *(unsigned char *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v39;
  *(void *)(a1 + 32) = v28;
  *(void *)(a1 + 40) = v30;
  *(unsigned char *)(a1 + 48) = v19 & 1;
  *(void *)(a1 + 56) = v33;
  sub_2561F2710(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_2561F2710(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_2561F2700(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_2561F2700(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

void sub_256208994(uint64_t a1, unsigned __int8 *a2, uint64_t a3, SEL *a4)
{
  uint64_t v5 = *a2;
  char v6 = *(unsigned char *)(a3 + 8);
  uint64_t v7 = swift_retain();
  sub_25620CF7C(v7, v6);
  swift_release();
  id v8 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v8, *a4, v5);
  swift_release();
}

uint64_t sub_256208A38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = sub_25620EF28();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v46 = v3;
  uint64_t v47 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v44 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518D0);
  uint64_t v40 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518C8);
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v38 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F518F0);
  uint64_t v41 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v39 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  char v13 = (void *)sub_25620F3B8();
  char v14 = (void *)sub_25620F3B8();
  id v15 = objc_msgSend(v12, sel_localizedStringForKey_value_table_, v13, 0, v14);

  uint64_t v16 = sub_25620F3C8();
  uint64_t v18 = v17;

  uint64_t v54 = v16;
  uint64_t v55 = v18;
  long long v56 = *(_OWORD *)(a1 + 16);
  uint64_t v57 = *(void *)(a1 + 32);
  long long v52 = *(_OWORD *)(a1 + 16);
  uint64_t v53 = *(void *)(a1 + 32);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  long long v20 = v49;
  uint64_t v21 = v50;
  swift_getKeyPath();
  long long v49 = v20;
  uint64_t v50 = v21;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v49 = v52;
  LOBYTE(v50) = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F518F8);
  sub_2561FAEEC();
  sub_25620E040(&qword_269F51900, &qword_269F518F8, (void (*)(void))sub_25620DB6C);
  sub_2561F2538();
  sub_25620F2B8();
  long long v49 = v56;
  uint64_t v50 = v57;
  MEMORY[0x25A2A2F60](&v52, v19);
  uint64_t v22 = v52;
  swift_getKeyPath();
  *(void *)&long long v49 = v22;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  LOBYTE(v12) = *(unsigned char *)(v22 + 42);
  swift_release();
  LOBYTE(v49) = (_BYTE)v12;
  uint64_t v23 = swift_allocObject();
  long long v24 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v23 + 64) = v24;
  *(void *)(v23 + 80) = *(void *)(a1 + 64);
  long long v25 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v23 + 32) = v25;
  sub_25620D22C(a1);
  uint64_t v26 = sub_2561F26BC(&qword_269F518D8, &qword_269F518D0);
  unint64_t v27 = sub_2561FAD58();
  uint64_t v28 = v38;
  sub_25620F178();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v6);
  uint64_t v29 = v44;
  sub_25620EF18();
  *(void *)&long long v49 = v6;
  *((void *)&v49 + 1) = &type metadata for KeepMessagesPreference;
  uint64_t v50 = v26;
  unint64_t v51 = v27;
  swift_getOpaqueTypeConformance2();
  uint64_t v30 = v39;
  uint64_t v31 = v42;
  uint64_t v32 = v46;
  sub_25620F118();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v29, v32);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v31);
  uint64_t v33 = v41;
  uint64_t v34 = v48;
  uint64_t v35 = v43;
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 16))(v48, v30, v43);
  *(unsigned char *)(v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269F518B8) + 36)) = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v30, v35);
}

uint64_t sub_2562090F8()
{
  return sub_25620F348();
}

uint64_t sub_2562091D4@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  sub_2561FAB68();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v3;
  *(unsigned char *)(a2 + 33) = v3;
  return result;
}

void sub_256209248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(unsigned char *)(a3 + 8);
  uint64_t v4 = swift_retain();
  uint64_t v5 = sub_25620CF7C(v4, v3);
  swift_release();
  uint64_t v6 = *(void *)(v5 + 56);
  sub_25620DC38();
  id v7 = (id)sub_25620F458();
  objc_msgSend(*(id *)(v6 + 16), sel_updateKeepMessagesPreference_, v7);
  swift_release();
}

uint64_t sub_2562092FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v204 = a2;
  uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51830);
  MEMORY[0x270FA5388](v192);
  long long v191 = (char *)v186 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51838);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v220 = (uint64_t)v186 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v219 = (uint64_t)v186 - v7;
  uint64_t v200 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517E8);
  uint64_t v199 = *(void *)(v200 - 8);
  MEMORY[0x270FA5388](v200);
  v198 = (char *)v186 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517E0);
  uint64_t v202 = *(void *)(v203 - 8);
  MEMORY[0x270FA5388](v203);
  v201 = (char *)v186 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v218 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517D8);
  uint64_t v217 = *(void *)(v218 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v218);
  v230 = (char *)v186 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v229 = (char *)v186 - v12;
  uint64_t v13 = sub_25620EE98();
  uint64_t v232 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  v225 = (char *)v186 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51198);
  uint64_t v223 = *(void *)(v209 - 8);
  MEMORY[0x270FA5388](v209);
  v208 = (char *)v186 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v212 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F511A0);
  uint64_t v16 = *(void *)(v212 - 8);
  MEMORY[0x270FA5388](v212);
  v211 = (char *)v186 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51780);
  uint64_t v18 = *(void *)(v233 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v233);
  v227 = (char *)v186 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v186 - v21;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51840);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v216 = (uint64_t)v186 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v228 = (uint64_t)v186 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v231 = (uint64_t)v186 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)v186 - v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51848);
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  uint64_t v215 = (uint64_t)v186 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  char v36 = (char *)v186 - v35;
  unsigned long long v242 = *(_OWORD *)(a1 + 16);
  uint64_t v243 = *(void *)(a1 + 32);
  unsigned long long v235 = *(_OWORD *)(a1 + 16);
  uint64_t v236 = *(void *)(a1 + 32);
  uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](&v238);
  id v37 = objc_msgSend(self, sel_sharedFeatureFlags);
  unsigned int v38 = objc_msgSend(v37, sel_isLazuliEnabled);
  swift_release();

  v214 = v36;
  uint64_t v226 = v13;
  uint64_t v224 = v16;
  if (v38)
  {
    unsigned long long v238 = *(_OWORD *)(a1 + 40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F51878);
    uint64_t v39 = sub_25620F258();
    MEMORY[0x270FA5388](v39);
    v186[-2] = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F51880);
    sub_25620D8CC();
    sub_25620D938();
    sub_25620EDA8();
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51850);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v36, 0, 1, v40);
  }
  else
  {
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51850);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v36, 1, 1, v41);
  }
  unsigned long long v235 = v242;
  uint64_t v236 = v243;
  uint64_t v42 = v213;
  MEMORY[0x25A2A2F60](&v238, v213);
  id v210 = self;
  id v43 = objc_msgSend(v210, sel_sharedInstance);
  unsigned int v44 = objc_msgSend(v43, sel_shouldShowMMS);
  swift_release();

  uint64_t v45 = &off_2653F5000;
  uint64_t v46 = &off_2653F5000;
  uint64_t v222 = v18;
  v221 = v31;
  v234 = v22;
  if (v44)
  {
    type metadata accessor for MessagesSettingsUtilities();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v48 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    long long v49 = (void *)sub_25620F3B8();
    uint64_t v50 = (void *)sub_25620F3B8();
    id v51 = objc_msgSend(v48, sel_localizedStringForKey_value_table_, v49, 0, v50);

    uint64_t v52 = sub_25620F3C8();
    uint64_t v54 = v53;

    uint64_t v240 = v52;
    uint64_t v241 = v54;
    unsigned long long v238 = v242;
    uint64_t v239 = v243;
    sub_25620F328();
    unint64_t v56 = *((void *)&v235 + 1);
    unint64_t v55 = v235;
    uint64_t v57 = v236;
    swift_getKeyPath();
    unsigned long long v235 = __PAIR128__(v56, v55);
    uint64_t v236 = v57;
    sub_25620F318();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_2561F2538();
    uint64_t v58 = v208;
    sub_25620F2D8();
    uint64_t v59 = v225;
    sub_25620EE88();
    uint64_t v60 = sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
    uint64_t v61 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
    uint64_t v62 = v211;
    uint64_t v63 = v42;
    uint64_t v64 = v209;
    uint64_t v65 = v226;
    sub_25620F128();
    (*(void (**)(char *, uint64_t))(v232 + 8))(v59, v65);
    (*(void (**)(char *, uint64_t))(v223 + 8))(v58, v64);
    unsigned long long v235 = v242;
    uint64_t v236 = v243;
    MEMORY[0x25A2A2F60](&v238, v63);
    uint64_t v66 = v238;
    swift_getKeyPath();
    *(void *)&unsigned long long v235 = v66;
    sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
    sub_25620ECF8();
    uint64_t v18 = v222;
    swift_release();
    LOBYTE(v48) = *(unsigned char *)(v66 + 44);
    swift_release();
    LOBYTE(v238) = (_BYTE)v48;
    uint64_t v67 = swift_allocObject();
    long long v68 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v67 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v67 + 64) = v68;
    *(void *)(v67 + 80) = *(void *)(a1 + 64);
    long long v69 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v67 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v67 + 32) = v69;
    sub_25620D22C(a1);
    *(void *)&unsigned long long v235 = v64;
    *((void *)&v235 + 1) = v65;
    uint64_t v42 = v63;
    uint64_t v236 = v60;
    uint64_t v237 = v61;
    uint64_t v31 = v221;
    swift_getOpaqueTypeConformance2();
    uint64_t v70 = v234;
    uint64_t v71 = v212;
    sub_25620F178();
    uint64_t v45 = &off_2653F5000;
    swift_release();
    uint64_t v72 = v62;
    uint64_t v46 = &off_2653F5000;
    (*(void (**)(char *, uint64_t))(v224 + 8))(v72, v71);
    uint64_t v73 = v233;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v31, v70, v233);
    uint64_t v74 = 0;
  }
  else
  {
    uint64_t v74 = 1;
    uint64_t v73 = v233;
  }
  uint64_t v75 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
  uint64_t v194 = v18 + 56;
  uint64_t v193 = v75;
  v75((uint64_t)v31, v74, 1, v73);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t v76 = swift_getObjCClassFromMetadata();
  uint64_t v77 = self;
  uint64_t v78 = (const char *)v45[355];
  id v196 = v77;
  uint64_t v197 = v76;
  id v79 = objc_msgSend(v77, v78, v76);
  long long v80 = (void *)sub_25620F3B8();
  v190 = "MPLE_DATA_FOOTER";
  unint64_t v189 = 0x80000002562142B0;
  long long v81 = (void *)sub_25620F3B8();
  id v82 = objc_msgSend(v79, (SEL)v46[491], v80, 0, v81);

  uint64_t v83 = sub_25620F3C8();
  uint64_t v85 = v84;

  uint64_t v240 = v83;
  uint64_t v241 = v85;
  unsigned long long v238 = v242;
  uint64_t v239 = v243;
  sub_25620F328();
  unsigned long long v86 = v235;
  uint64_t v87 = v236;
  swift_getKeyPath();
  unsigned long long v235 = v86;
  uint64_t v236 = v87;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  unint64_t v88 = sub_2561F2538();
  uint64_t v89 = v208;
  unint64_t v195 = v88;
  sub_25620F2D8();
  uint64_t v90 = v225;
  sub_25620EE88();
  uint64_t v91 = sub_2561F26BC(&qword_269F511B0, &qword_269F51198);
  uint64_t v92 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  long long v93 = v211;
  uint64_t v94 = v42;
  uint64_t v95 = v209;
  uint64_t v96 = v226;
  sub_25620F128();
  uint64_t v97 = *(void (**)(char *, uint64_t))(v232 + 8);
  v232 += 8;
  v206 = v97;
  v97(v90, v96);
  id v98 = *(void (**)(char *, uint64_t))(v223 + 8);
  v223 += 8;
  v187 = v98;
  v98(v89, v95);
  unsigned long long v235 = v242;
  uint64_t v236 = v243;
  MEMORY[0x25A2A2F60](&v238, v94);
  uint64_t v99 = v238;
  swift_getKeyPath();
  *(void *)&unsigned long long v235 = v99;
  uint64_t v205 = sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  LOBYTE(v79) = *(unsigned char *)(v99 + 45);
  swift_release();
  LOBYTE(v238) = (_BYTE)v79;
  uint64_t v100 = swift_allocObject();
  long long v101 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v100 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v100 + 64) = v101;
  *(void *)(v100 + 80) = *(void *)(a1 + 64);
  long long v102 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v100 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v100 + 32) = v102;
  sub_25620D22C(a1);
  *(void *)&unsigned long long v235 = v95;
  *((void *)&v235 + 1) = v96;
  uint64_t v188 = v91;
  uint64_t v236 = v91;
  uint64_t v237 = v92;
  uint64_t v207 = v92;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v104 = v234;
  uint64_t v105 = v212;
  v186[1] = OpaqueTypeConformance2;
  sub_25620F178();
  swift_release();
  id v106 = *(void (**)(char *, uint64_t))(v224 + 8);
  v224 += 8;
  v186[0] = v106;
  v106(v93, v105);
  uint64_t v107 = v233;
  long long v108 = *(void (**)(char *, char *, uint64_t))(v222 + 32);
  v108(v227, v104, v233);
  unsigned long long v235 = v242;
  uint64_t v236 = v243;
  MEMORY[0x25A2A2F60](&v238, v94);
  id v109 = objc_msgSend(v210, sel_sharedInstance);
  LODWORD(v104) = objc_msgSend(v109, sel_shouldShowCharacterCount);
  swift_release();

  uint64_t v110 = 1;
  if (v104)
  {
    id v111 = objc_msgSend(v196, sel_bundleForClass_, v197);
    id v112 = (void *)sub_25620F3B8();
    uint64_t v113 = (void *)sub_25620F3B8();
    id v114 = objc_msgSend(v111, sel_localizedStringForKey_value_table_, v112, 0, v113);

    uint64_t v115 = sub_25620F3C8();
    uint64_t v117 = v116;

    uint64_t v240 = v115;
    uint64_t v241 = v117;
    unsigned long long v238 = v242;
    uint64_t v239 = v243;
    sub_25620F328();
    unsigned long long v118 = v235;
    uint64_t v119 = v236;
    swift_getKeyPath();
    unsigned long long v235 = v118;
    uint64_t v236 = v119;
    sub_25620F318();
    swift_release();
    swift_release();
    uint64_t v94 = v213;
    swift_release();
    swift_release();
    uint64_t v120 = v208;
    sub_25620F2D8();
    uint64_t v121 = v225;
    sub_25620EE88();
    uint64_t v122 = v211;
    uint64_t v123 = (void (*)(uint64_t, char *, uint64_t))v108;
    uint64_t v124 = v209;
    uint64_t v125 = v226;
    sub_25620F128();
    v206(v121, v125);
    v187(v120, v124);
    unsigned long long v235 = v242;
    uint64_t v236 = v243;
    MEMORY[0x25A2A2F60](&v238, v94);
    uint64_t v126 = v238;
    swift_getKeyPath();
    *(void *)&unsigned long long v235 = v126;
    sub_25620ECF8();
    swift_release();
    LOBYTE(v120) = *(unsigned char *)(v126 + 46);
    swift_release();
    LOBYTE(v235) = (_BYTE)v120;
    uint64_t v127 = swift_allocObject();
    long long v128 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v127 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v127 + 64) = v128;
    *(void *)(v127 + 80) = *(void *)(a1 + 64);
    long long v129 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v127 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v127 + 32) = v129;
    sub_25620D22C(a1);
    uint64_t v130 = v234;
    uint64_t v131 = v212;
    sub_25620F178();
    swift_release();
    ((void (*)(char *, uint64_t))v186[0])(v122, v131);
    v123(v231, v130, v107);
    uint64_t v110 = 0;
  }
  v193(v231, v110, 1, v107);
  unsigned long long v238 = v242;
  uint64_t v239 = v243;
  sub_25620F328();
  unsigned long long v132 = v235;
  uint64_t v133 = v94;
  uint64_t v134 = v236;
  swift_getKeyPath();
  unsigned long long v235 = v132;
  uint64_t v236 = v134;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51820);
  uint64_t v136 = sub_2561F26BC(&qword_269F51828, &qword_269F51820);
  uint64_t v137 = v198;
  uint64_t v224 = v135;
  uint64_t v223 = v136;
  sub_25620F2C8();
  uint64_t v138 = v225;
  sub_25620EE88();
  uint64_t v139 = sub_2561F26BC(&qword_269F517F0, &qword_269F517E8);
  uint64_t v140 = v201;
  uint64_t v141 = v200;
  uint64_t v142 = v226;
  uint64_t v143 = v207;
  sub_25620F128();
  v206(v138, v142);
  (*(void (**)(char *, uint64_t))(v199 + 8))(v137, v141);
  unsigned long long v235 = v242;
  uint64_t v236 = v243;
  MEMORY[0x25A2A2F60](&v238, v133);
  uint64_t v144 = v238;
  swift_getKeyPath();
  *(void *)&unsigned long long v235 = v144;
  sub_25620ECF8();
  swift_release();
  char v145 = *(unsigned char *)(v144 + 47);
  swift_release();
  LOBYTE(v238) = v145;
  uint64_t v146 = swift_allocObject();
  long long v147 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v146 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v146 + 64) = v147;
  *(void *)(v146 + 80) = *(void *)(a1 + 64);
  long long v148 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v146 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v146 + 32) = v148;
  sub_25620D22C(a1);
  *(void *)&unsigned long long v235 = v141;
  *((void *)&v235 + 1) = v142;
  uint64_t v236 = v139;
  uint64_t v237 = v143;
  swift_getOpaqueTypeConformance2();
  uint64_t v149 = v230;
  uint64_t v150 = v203;
  sub_25620F178();
  swift_release();
  (*(void (**)(char *, uint64_t))(v202 + 8))(v140, v150);
  (*(void (**)(char *, char *, uint64_t))(v217 + 32))(v229, v149, v218);
  unsigned long long v235 = v242;
  uint64_t v236 = v243;
  MEMORY[0x25A2A2F60](&v238, v133);
  id v151 = objc_msgSend(v210, sel_sharedInstance);
  LODWORD(v149) = objc_msgSend(v151, sel_shouldShowSMSRelaySettings);
  swift_release();

  if (v149)
  {
    uint64_t v152 = sub_25620EDD8();
    char v153 = sub_25620EFD8();
    *(void *)&unsigned long long v238 = v152;
    BYTE8(v238) = v153;
    id v154 = objc_msgSend(v196, sel_bundleForClass_, v197);
    uint64_t v155 = (void *)sub_25620F3B8();
    uint64_t v156 = (void *)sub_25620F3B8();
    id v157 = objc_msgSend(v154, sel_localizedStringForKey_value_table_, v155, 0, v156);

    uint64_t v158 = sub_25620F3C8();
    uint64_t v160 = v159;

    *(void *)&unsigned long long v235 = v158;
    *((void *)&v235 + 1) = v160;
    uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51868);
    uint64_t v162 = sub_25620DEC0(&qword_269F51870, &qword_269F51868, (void (*)(void))sub_2561FB1B4);
    uint64_t v163 = MEMORY[0x263F8D310];
    unint64_t v164 = v195;
    sub_25620F158();
    swift_bridgeObjectRelease();
    *(void *)&unsigned long long v235 = v161;
    *((void *)&v235 + 1) = v163;
    uint64_t v236 = v162;
    uint64_t v237 = v164;
    swift_getOpaqueTypeConformance2();
    uint64_t v165 = v219;
    sub_25620EDA8();
    uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51858);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v166 - 8) + 56))(v165, 0, 1, v166);
  }
  else
  {
    uint64_t v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51858);
    uint64_t v165 = v219;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v167 - 8) + 56))(v219, 1, 1, v167);
  }
  uint64_t v168 = v222;
  uint64_t v169 = (uint64_t)v221;
  uint64_t v170 = v215;
  sub_2561F2418((uint64_t)v214, v215, &qword_269F51848);
  sub_2561F2418(v169, v228, &qword_269F51840);
  v171 = *(void (**)(char *, char *, uint64_t))(v168 + 16);
  uint64_t v172 = v233;
  v171(v234, v227, v233);
  sub_2561F2418(v231, v216, &qword_269F51840);
  uint64_t v173 = v217;
  uint64_t v232 = *(void *)(v217 + 16);
  uint64_t v174 = v218;
  ((void (*)(char *, char *, uint64_t))v232)(v230, v229, v218);
  sub_2561F2418(v165, v220, &qword_269F51838);
  uint64_t v175 = v168;
  uint64_t v176 = v204;
  sub_2561F2418(v170, v204, &qword_269F51848);
  uint64_t v177 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269F51860);
  sub_2561F2418(v228, v176 + v177[12], &qword_269F51840);
  v171((char *)(v176 + v177[16]), v234, v172);
  uint64_t v178 = v216;
  sub_2561F2418(v216, v176 + v177[20], &qword_269F51840);
  uint64_t v179 = v230;
  ((void (*)(uint64_t, char *, uint64_t))v232)(v176 + v177[24], v230, v174);
  uint64_t v180 = v176 + v177[28];
  uint64_t v181 = v220;
  sub_2561F2418(v220, v180, &qword_269F51838);
  sub_2561F247C(v219, &qword_269F51838);
  v182 = *(void (**)(char *, uint64_t))(v173 + 8);
  v182(v229, v174);
  sub_2561F247C(v231, &qword_269F51840);
  v183 = *(void (**)(char *, uint64_t))(v175 + 8);
  uint64_t v184 = v233;
  v183(v227, v233);
  sub_2561F247C((uint64_t)v221, &qword_269F51840);
  sub_2561F247C((uint64_t)v214, &qword_269F51848);
  sub_2561F247C(v181, &qword_269F51838);
  v182(v179, v174);
  sub_2561F247C(v178, &qword_269F51840);
  v183(v234, v184);
  sub_2561F247C(v228, &qword_269F51840);
  return sub_2561F247C(v215, &qword_269F51848);
}

uint64_t sub_25620B05C()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  uint64_t v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_25620F3C8();
  uint64_t v7 = v6;

  v10[1] = v5;
  v10[2] = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](v10, v8);
  swift_getKeyPath();
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  swift_release();
  sub_2561FEEB0();
  sub_2561F2538();
  return sub_25620ED98();
}

uint64_t sub_25620B23C(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  char v4 = *(unsigned char *)(a3 + 8);
  uint64_t v5 = swift_retain();
  uint64_t v6 = sub_25620CF7C(v5, v4);
  swift_release();
  objc_msgSend(*(id *)(*(void *)(v6 + 72) + 16), sel_setMMSEnabled_, v3);
  return swift_release();
}

uint64_t sub_25620B2B4(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = *a2;
  char v6 = *(unsigned char *)(a3 + 8);
  uint64_t v7 = swift_retain();
  sub_25620CF7C(v7, v6);
  swift_release();
  a4(v5);
  return swift_release();
}

double sub_25620B324@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25620C508((void (*)(__n128 *__return_ptr))sub_25620B33C, a1).n128_u64[0];
  return result;
}

uint64_t sub_25620B33C@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  char v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t v7 = sub_25620F0D8();
  uint64_t v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_25620F198();
  uint64_t v11 = sub_25620F088();
  uint64_t v37 = v12;
  uint64_t v38 = v11;
  char v14 = v13;
  uint64_t v39 = v15;
  swift_release();
  char v36 = v14 & 1;
  sub_2561F2700(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v17 = (void *)sub_25620F3B8();
  uint64_t v18 = (void *)sub_25620F3B8();
  id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_25620F3C8();
  uint64_t v20 = sub_25620F0D8();
  uint64_t v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_25620F028();
  uint64_t v24 = sub_25620F0B8();
  uint64_t v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_2561F2700(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_25620F1A8();
  uint64_t v28 = sub_25620F088();
  uint64_t v30 = v29;
  LOBYTE(v19) = v31;
  uint64_t v33 = v32;
  swift_release();
  sub_2561F2700(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v37;
  *(unsigned char *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v39;
  *(void *)(a1 + 32) = v28;
  *(void *)(a1 + 40) = v30;
  *(unsigned char *)(a1 + 48) = v19 & 1;
  *(void *)(a1 + 56) = v33;
  sub_2561F2710(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_2561F2710(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_2561F2700(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_2561F2700(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25620B6C0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v11 = *a2;
  char v12 = *(unsigned char *)(a3 + 8);
  uint64_t v13 = swift_retain();
  sub_25620CF7C(v13, v12);
  swift_release();
  sub_2561FBACC(0, a4, a5, v11, a6, a7);
  return swift_release();
}

double sub_25620B75C@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25620C508((void (*)(__n128 *__return_ptr))sub_25620B774, a1).n128_u64[0];
  return result;
}

uint64_t sub_25620B774@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  char v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t v7 = sub_25620F0D8();
  uint64_t v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_25620F198();
  uint64_t v11 = sub_25620F088();
  uint64_t v37 = v12;
  uint64_t v38 = v11;
  char v14 = v13;
  uint64_t v39 = v15;
  swift_release();
  char v36 = v14 & 1;
  sub_2561F2700(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v17 = (void *)sub_25620F3B8();
  uint64_t v18 = (void *)sub_25620F3B8();
  id v19 = objc_msgSend(v16, sel_localizedStringForKey_value_table_, v17, 0, v18);

  sub_25620F3C8();
  uint64_t v20 = sub_25620F0D8();
  uint64_t v22 = v21;
  LOBYTE(v19) = v23 & 1;
  sub_25620F028();
  uint64_t v24 = sub_25620F0B8();
  uint64_t v26 = v25;
  LOBYTE(v7) = v27;
  swift_release();
  LOBYTE(v2) = v7 & 1;
  sub_2561F2700(v20, v22, (char)v19);
  swift_bridgeObjectRelease();
  sub_25620F1A8();
  uint64_t v28 = sub_25620F088();
  uint64_t v30 = v29;
  LOBYTE(v19) = v31;
  uint64_t v33 = v32;
  swift_release();
  sub_2561F2700(v24, v26, (char)v2);
  swift_bridgeObjectRelease();
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = v37;
  *(unsigned char *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v39;
  *(void *)(a1 + 32) = v28;
  *(void *)(a1 + 40) = v30;
  *(unsigned char *)(a1 + 48) = v19 & 1;
  *(void *)(a1 + 56) = v33;
  sub_2561F2710(v38, v37, v36);
  swift_bridgeObjectRetain();
  sub_2561F2710(v28, v30, v19 & 1);
  swift_bridgeObjectRetain();
  sub_2561F2700(v28, v30, v19 & 1);
  swift_bridgeObjectRelease();
  sub_2561F2700(v38, v37, v36);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25620BAF8@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  char v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_25620BC24()
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_25620F3B8();
  id v3 = (void *)sub_25620F3B8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  sub_25620F3C8();
  sub_2561F2538();
  return sub_25620F278();
}

void sub_25620BD5C()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)CKSharedSettingsHelper), sel_init);
  objc_msgSend(v0, sel_satelliteDemoModeTapped);
}

uint64_t sub_25620BDB4@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_25620BEDC@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_25620C004@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = sub_25620EE98();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v32 = v3;
  uint64_t v33 = v4;
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517E8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v30 = v7;
  uint64_t v31 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F517E0);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v34 = v11;
  uint64_t v35 = v12;
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v42 = *(_OWORD *)(a1 + 16);
  uint64_t v43 = *(void *)(a1 + 32);
  long long v40 = *(_OWORD *)(a1 + 16);
  uint64_t v41 = *(void *)(a1 + 32);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  sub_25620F328();
  long long v16 = v37;
  uint64_t v17 = v38;
  swift_getKeyPath();
  long long v37 = v16;
  uint64_t v38 = v17;
  sub_25620F318();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51820);
  sub_2561F26BC(&qword_269F51828, &qword_269F51820);
  sub_25620F2C8();
  sub_25620EE88();
  uint64_t v18 = sub_2561F26BC(&qword_269F517F0, &qword_269F517E8);
  uint64_t v19 = sub_25620E444((unint64_t *)&qword_269F511B8, MEMORY[0x263F19708]);
  uint64_t v20 = v30;
  uint64_t v21 = v32;
  sub_25620F128();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v21);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v20);
  long long v37 = v42;
  uint64_t v38 = v43;
  MEMORY[0x25A2A2F60](&v40, v15);
  uint64_t v22 = v40;
  swift_getKeyPath();
  *(void *)&long long v37 = v22;
  sub_25620E444((unint64_t *)&qword_269F51370, (void (*)(uint64_t))type metadata accessor for SettingsModel);
  sub_25620ECF8();
  swift_release();
  char v23 = *(unsigned char *)(v22 + 50);
  swift_release();
  LOBYTE(v40) = v23;
  uint64_t v24 = swift_allocObject();
  long long v25 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 64) = v25;
  *(void *)(v24 + 80) = *(void *)(a1 + 64);
  long long v26 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 32) = v26;
  sub_25620D22C(a1);
  *(void *)&long long v37 = v20;
  *((void *)&v37 + 1) = v21;
  uint64_t v38 = v18;
  uint64_t v39 = v19;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v34;
  sub_25620F178();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v27);
}

double sub_25620C4F0@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_25620C508((void (*)(__n128 *__return_ptr))sub_25620C58C, a1).n128_u64[0];
  return result;
}

__n128 sub_25620C508@<Q0>(void (*a1)(__n128 *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25620EED8();
  a1(&v11);
  char v5 = v12;
  uint64_t v6 = v13;
  char v7 = v15;
  uint64_t v8 = v16;
  __n128 result = v11;
  long long v10 = v14;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(unsigned char *)(a2 + 40) = v5;
  *(void *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 56) = v10;
  *(unsigned char *)(a2 + 72) = v7;
  *(void *)(a2 + 80) = v8;
  return result;
}

uint64_t sub_25620C58C@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v39 = self;
  id v2 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v3 = (void *)sub_25620F3B8();
  uint64_t v4 = sub_25620F3B8();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, v4);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t v6 = sub_25620F0D8();
  uint64_t v8 = v7;
  LOBYTE(v5) = v9 & 1;
  sub_25620F008();
  uint64_t v10 = sub_25620F0B8();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_release();
  sub_2561F2700(v6, v8, (char)v5);
  swift_bridgeObjectRelease();
  sub_25620F198();
  uint64_t v15 = sub_25620F088();
  uint64_t v42 = v16;
  uint64_t v43 = v15;
  char v18 = v17;
  uint64_t v44 = v19;
  swift_release();
  char v41 = v18 & 1;
  sub_2561F2700(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v21 = (void *)sub_25620F3B8();
  uint64_t v22 = (void *)sub_25620F3B8();
  id v23 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, 0, v22);

  sub_25620F3C8();
  uint64_t v24 = sub_25620F0D8();
  uint64_t v26 = v25;
  LOBYTE(v23) = v27 & 1;
  sub_25620F028();
  uint64_t v28 = sub_25620F0B8();
  uint64_t v30 = v29;
  LOBYTE(v4) = v31;
  swift_release();
  sub_2561F2700(v24, v26, (char)v23);
  swift_bridgeObjectRelease();
  sub_25620F1A8();
  uint64_t v32 = sub_25620F088();
  uint64_t v34 = v33;
  LOBYTE(v23) = v35;
  uint64_t v37 = v36;
  swift_release();
  sub_2561F2700(v28, v30, v4 & 1);
  swift_bridgeObjectRelease();
  *(void *)a1 = v43;
  *(void *)(a1 + 8) = v42;
  *(unsigned char *)(a1 + 16) = v41;
  *(void *)(a1 + 24) = v44;
  *(void *)(a1 + 32) = v32;
  *(void *)(a1 + 40) = v34;
  *(unsigned char *)(a1 + 48) = v23 & 1;
  *(void *)(a1 + 56) = v37;
  sub_2561F2710(v43, v42, v41);
  swift_bridgeObjectRetain();
  sub_2561F2710(v32, v34, v23 & 1);
  swift_bridgeObjectRetain();
  sub_2561F2700(v32, v34, v23 & 1);
  swift_bridgeObjectRelease();
  sub_2561F2700(v43, v42, v41);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25620C958(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  char v4 = *(unsigned char *)(a3 + 8);
  uint64_t v5 = swift_retain();
  uint64_t v6 = sub_25620CF7C(v5, v4);
  swift_release();
  objc_msgSend(*(id *)(*(void *)(v6 + 112) + 16), sel_setRCSBusinessMessagesEnabled_, v3);
  return swift_release();
}

uint64_t sub_25620C9D0@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  char v4 = (void *)sub_25620F3B8();
  uint64_t v5 = (void *)sub_25620F3B8();
  id v6 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, v5);

  sub_25620F3C8();
  sub_2561F2538();
  uint64_t result = sub_25620F0D8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_25620CAFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51818);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F516D8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MessagesSettingsUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v11 = (void *)sub_25620F3B8();
  uint64_t v12 = (void *)sub_25620F3B8();
  id v13 = objc_msgSend(v10, sel_localizedStringForKey_value_table_, v11, 0, v12);

  uint64_t v14 = sub_25620F3C8();
  uint64_t v16 = v15;

  uint64_t v20 = v14;
  uint64_t v21 = v16;
  uint64_t v20 = sub_25620F3E8();
  uint64_t v21 = v17;
  sub_25620EC98();
  uint64_t v18 = sub_25620ECA8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v4, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_2561F2538();
    sub_25620F068();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v8, v5);
  }
  return result;
}

uint64_t sub_25620CD98()
{
  return sub_25620F058();
}

uint64_t sub_25620CE48@<X0>(uint64_t a1@<X8>)
{
  return sub_256200990(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620CE50()
{
  return sub_25620226C();
}

unint64_t sub_25620CE58()
{
  unint64_t result = qword_269F51750;
  if (!qword_269F51750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51750);
  }
  return result;
}

uint64_t sub_25620CEAC@<X0>(char *a1@<X8>)
{
  return sub_256202520(*(void *)(v1 + 16), a1);
}

unint64_t sub_25620CEB4()
{
  unint64_t result = qword_269F51768;
  if (!qword_269F51768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51728);
    sub_2561F26BC(&qword_269F51770, &qword_269F51778);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51768);
  }
  return result;
}

uint64_t sub_25620CF4C@<X0>(uint64_t a1@<X8>)
{
  return sub_256203680(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620CF54@<X0>(char *a1@<X8>)
{
  return sub_25620430C(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620CF5C@<X0>(char *a1@<X8>)
{
  return sub_256206F94(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620CF64@<X0>(char *a1@<X8>)
{
  return sub_256207B48(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620CF6C@<X0>(uint64_t a1@<X8>)
{
  return sub_2562092FC(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620CF74@<X0>(uint64_t a1@<X8>)
{
  return sub_25620C004(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620CF7C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_25620EE38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_25620F448();
    char v9 = sub_25620EFC8();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_25620D2A0(0x73676E6974746553, 0xEF747865746E6F43, &v14);
      _os_log_impl(&dword_2561DD000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2A3AB0](v11, -1, -1);
      MEMORY[0x25A2A3AB0](v10, -1, -1);
    }

    sub_25620EE28();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_25620D160@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25620EE08();
  *a1 = result;
  return result;
}

uint64_t sub_25620D18C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25620EE08();
  *a1 = result;
  return result;
}

uint64_t sub_25620D1B8()
{
  return sub_25620EE18();
}

uint64_t sub_25620D1E4()
{
  return sub_25620EE18();
}

uint64_t sub_25620D210@<X0>(uint64_t a1@<X8>)
{
  return sub_256203D1C(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620D224(uint64_t a1, unsigned __int8 *a2)
{
  return sub_256204290(a1, a2, v2 + 16);
}

uint64_t sub_25620D22C(uint64_t a1)
{
  return a1;
}

unint64_t sub_25620D2A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_25620D374(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25620D4C4((uint64_t)v12, *a3);
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
      sub_25620D4C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_25620D374(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_25620D520(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_25620F498();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
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

uint64_t sub_25620D4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25620D520(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25620D5B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25620D6BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25620D6BC((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25620D5B8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_25620D654(v2, 0);
      uint64_t result = sub_25620F488();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_25620F3D8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25620D654(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269F51810);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25620D6BC(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269F51810);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25620D7B8(uint64_t a1, unsigned __int8 *a2)
{
  return sub_25620C958(a1, a2, v2 + 16);
}

uint64_t sub_25620D7CC(uint64_t a1, unsigned __int8 *a2)
{
  return sub_25620B2B4(a1, a2, v2 + 16, (void (*)(uint64_t))sub_2562002B4);
}

uint64_t sub_25620D808(uint64_t a1, char *a2)
{
  return sub_25620B6C0(a1, a2, v2 + 16, 0x4D537341646E6553, 0xE900000000000053, 0xD00000000000002CLL, 0x8000000256215310);
}

uint64_t sub_25620D860(uint64_t a1, char *a2)
{
  return sub_25620B6C0(a1, a2, v2 + 16, 0xD000000000000015, 0x8000000256214D50, 0xD000000000000031, 0x80000002562152A0);
}

uint64_t sub_25620D8BC(uint64_t a1, unsigned __int8 *a2)
{
  return sub_25620B23C(a1, a2, v2 + 16);
}

uint64_t sub_25620D8C4()
{
  return sub_25620B05C();
}

unint64_t sub_25620D8CC()
{
  unint64_t result = qword_269F51888;
  if (!qword_269F51888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51888);
  }
  return result;
}

unint64_t sub_25620D938()
{
  unint64_t result = qword_269F51890;
  if (!qword_269F51890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51890);
  }
  return result;
}

void sub_25620D9A0(uint64_t a1, unsigned __int8 *a2)
{
  sub_256208994(a1, a2, v2 + 16, (SEL *)&selRef_setConversationListFilteringEnabled_);
}

uint64_t sub_25620D9C4@<X0>(uint64_t a1@<X8>)
{
  return sub_256208A38(*(void *)(v1 + 16), a1);
}

unint64_t sub_25620D9CC()
{
  unint64_t result = qword_269F518C0;
  if (!qword_269F518C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F518B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F518C8);
    sub_25620EF28();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F518D0);
    sub_2561F26BC(&qword_269F518D8, &qword_269F518D0);
    sub_2561FAD58();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_25620DB10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F518C0);
  }
  return result;
}

unint64_t sub_25620DB10()
{
  unint64_t result = qword_269F518E0;
  if (!qword_269F518E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F518E0);
  }
  return result;
}

unint64_t sub_25620DB6C()
{
  unint64_t result = qword_269F51908;
  if (!qword_269F51908)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51910);
    sub_25620E178(&qword_269F51918, &qword_269F51920, &qword_269F51928, &qword_269F51930);
    sub_2561F26BC(&qword_269F51938, &qword_269F51940);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51908);
  }
  return result;
}

void sub_25620DC30(uint64_t a1, uint64_t a2)
{
  sub_256209248(a1, a2, v2 + 16);
}

unint64_t sub_25620DC38()
{
  unint64_t result = qword_269F516C0;
  if (!qword_269F516C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F516C0);
  }
  return result;
}

unint64_t sub_25620DC78()
{
  unint64_t result = qword_269F51950;
  if (!qword_269F51950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51950);
  }
  return result;
}

uint64_t sub_25620DCCC()
{
  return sub_25620796C();
}

uint64_t sub_25620DCE0(uint64_t a1, char *a2)
{
  return sub_25620B6C0(a1, a2, v2 + 16, 0xD000000000000011, 0x8000000256214D10, 0xD00000000000002DLL, 0x8000000256215420);
}

uint64_t sub_25620DD38@<X0>(uint64_t a1@<X8>)
{
  return sub_256205DB8(*(void *)(v1 + 16), a1);
}

unint64_t sub_25620DD40()
{
  unint64_t result = qword_269F519B0;
  if (!qword_269F519B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F519A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F519B8);
    sub_25620EF28();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F519C0);
    sub_2561F26BC(&qword_269F519C8, &qword_269F519C0);
    sub_2561FF3B4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_25620DB10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F519B0);
  }
  return result;
}

uint64_t sub_25620DE90(uint64_t a1, unsigned __int8 *a2)
{
  return sub_25620B2B4(a1, a2, v2 + 16, (void (*)(uint64_t))sub_256200404);
}

uint64_t sub_25620DEC0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25620DF40()
{
  unint64_t result = qword_269F519F8;
  if (!qword_269F519F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F519F8);
  }
  return result;
}

uint64_t sub_25620DF94@<X0>(uint64_t a1@<X8>)
{
  return sub_256206BCC(*(void *)(v1 + 16), a1);
}

uint64_t sub_25620DF9C()
{
  return sub_2562069EC();
}

unint64_t sub_25620DFA4()
{
  unint64_t result = qword_269F51A00;
  if (!qword_269F51A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51A00);
  }
  return result;
}

void sub_25620E004(uint64_t a1, unsigned __int8 *a2)
{
  sub_256208994(a1, a2, v2 + 16, (SEL *)&selRef_setRaiseToListenEnabled_);
}

uint64_t sub_25620E040(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25620E0B8()
{
  unint64_t result = qword_269F51A20;
  if (!qword_269F51A20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51A28);
    sub_25620E178(&qword_269F51A30, &qword_269F51A38, &qword_269F51A40, &qword_269F51A48);
    sub_2561F26BC(&qword_269F51A50, &qword_269F51A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51A20);
  }
  return result;
}

uint64_t sub_25620E178(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_2561F26BC(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25620E218(uint64_t a1, uint64_t a2)
{
  return sub_2562065E0(a1, a2, v2 + 16);
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

void sub_25620E28C(uint64_t a1, unsigned __int8 *a2)
{
  sub_256208994(a1, a2, v2 + 16, (SEL *)&selRef_setReadReceiptsEnabled_);
}

uint64_t sub_25620E2B0@<X0>(uint64_t a1@<X8>)
{
  return sub_25620327C(a1);
}

unint64_t sub_25620E2B8()
{
  unint64_t result = qword_269F51A78;
  if (!qword_269F51A78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269F51A70);
    sub_25620E37C(&qword_269F51A80, &qword_269F51A88);
    sub_2561F26BC(&qword_269F51A90, &qword_269F51A98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51A78);
  }
  return result;
}

uint64_t sub_25620E37C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25620E3D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25620EDE8();
  *a1 = result;
  return result;
}

uint64_t sub_25620E404()
{
  return sub_25620EDF8();
}

uint64_t sub_25620E434()
{
  return sub_256202E68();
}

uint64_t sub_25620E444(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25620E48C()
{
  return sub_2561F26BC(&qword_269F51AC0, &qword_269F51AC8);
}

void *assignWithCopy for SharedWithYouView(void *a1, void *a2)
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

uint64_t assignWithTake for SharedWithYouView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharedWithYouView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SharedWithYouView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for SharedWithYouView()
{
  return &type metadata for SharedWithYouView;
}

id sub_25620E62C()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_sharedWithYouViewController);

  return v1;
}

uint64_t sub_25620E68C()
{
  return sub_25620E7E0();
}

uint64_t sub_25620E69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25620E78C();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_25620E700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_25620E78C();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_25620E764()
{
}

unint64_t sub_25620E78C()
{
  unint64_t result = qword_269F51AD0;
  if (!qword_269F51AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51AD0);
  }
  return result;
}

uint64_t sub_25620E7E0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269F51350);
  MEMORY[0x25A2A2F60](&v3, v0);
  id v1 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v1, sel__sharedWithYouEnabled);

  swift_getKeyPath();
  sub_25620E904();
  sub_25620ECE8();
  swift_release();
  return swift_release();
}

uint64_t sub_25620E8E4()
{
  return sub_2561FCFDC(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_25620E904()
{
  unint64_t result = qword_269F51370;
  if (!qword_269F51370)
  {
    type metadata accessor for SettingsModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F51370);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_25620E980()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269F51AD8 = (uint64_t)result;
  return result;
}

uint64_t sub_25620E9D8(uint64_t a1)
{
  return sub_25620EA20(a1, qword_269F53AB8);
}

uint64_t sub_25620E9FC(uint64_t a1)
{
  return sub_25620EA20(a1, qword_269F53AD0);
}

uint64_t sub_25620EA20(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_25620ED38();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269F51138 != -1) {
    swift_once();
  }
  id v4 = (id)qword_269F51AD8;
  return sub_25620ED28();
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

uint64_t __getICQInAppMessagingClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __49__CKSharedSettingsHelper_satelliteDemoModeTapped__block_invoke_cold_1(v0);
}

uint64_t sub_25620EC98()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25620ECA8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25620ECB8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25620ECC8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25620ECD8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25620ECE8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_25620ECF8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_25620ED08()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_25620ED18()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_25620ED28()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_25620ED38()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_25620ED48()
{
  return MEMORY[0x270F87508]();
}

uint64_t sub_25620ED58()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_25620ED68()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_25620ED78()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_25620ED88()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_25620ED98()
{
  return MEMORY[0x270EFFA40]();
}

uint64_t sub_25620EDA8()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_25620EDB8()
{
  return MEMORY[0x270EFFAE8]();
}

uint64_t sub_25620EDC8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_25620EDD8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_25620EDE8()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_25620EDF8()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_25620EE08()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25620EE18()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25620EE28()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25620EE38()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25620EE48()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_25620EE58()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_25620EE68()
{
  return MEMORY[0x270F00F50]();
}

uint64_t sub_25620EE78()
{
  return MEMORY[0x270F00F68]();
}

uint64_t sub_25620EE88()
{
  return MEMORY[0x270F00FE8]();
}

uint64_t sub_25620EE98()
{
  return MEMORY[0x270F00FF8]();
}

uint64_t sub_25620EEA8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_25620EEB8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_25620EEC8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25620EED8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_25620EEE8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_25620EEF8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_25620EF08()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_25620EF18()
{
  return MEMORY[0x270F02300]();
}

uint64_t sub_25620EF28()
{
  return MEMORY[0x270F02308]();
}

uint64_t sub_25620EF38()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25620EF48()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25620EF58()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25620EF78()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25620EF88()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25620EF98()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25620EFB8()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_25620EFC8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25620EFD8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25620EFE8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_25620EFF8()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_25620F008()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_25620F018()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_25620F028()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_25620F038()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_25620F048()
{
  return MEMORY[0x270F02D38]();
}

uint64_t sub_25620F058()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_25620F068()
{
  return MEMORY[0x270F02DA8]();
}

uint64_t sub_25620F078()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_25620F088()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_25620F098()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_25620F0A8()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_25620F0B8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25620F0C8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_25620F0D8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25620F0E8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25620F0F8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25620F108()
{
  return MEMORY[0x270F03378]();
}

uint64_t sub_25620F118()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_25620F128()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_25620F138()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25620F148()
{
  return MEMORY[0x270F037F0]();
}

uint64_t sub_25620F158()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_25620F168()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_25620F178()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_25620F188()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_25620F198()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_25620F1A8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_25620F1B8()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_25620F1C8()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_25620F1D8()
{
  return MEMORY[0x270F04648]();
}

uint64_t sub_25620F1E8()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25620F1F8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25620F208()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_25620F218()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25620F228()
{
  return MEMORY[0x270F04740]();
}

uint64_t sub_25620F238()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_25620F248()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_25620F258()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_25620F268()
{
  return MEMORY[0x270F048E0]();
}

uint64_t sub_25620F278()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_25620F288()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_25620F298()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_25620F2A8()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_25620F2B8()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_25620F2C8()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_25620F2D8()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_25620F2E8()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_25620F2F8()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25620F308()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25620F318()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_25620F328()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_25620F338()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_25620F348()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25620F358()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_25620F368()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_25620F378()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_25620F388()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_25620F398()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_25620F3A8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_25620F3B8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25620F3C8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25620F3D8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25620F3E8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25620F3F8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25620F408()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_25620F418()
{
  return MEMORY[0x270EF1BE0]();
}

uint64_t sub_25620F428()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_25620F438()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25620F448()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25620F458()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25620F468()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25620F478()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25620F488()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25620F498()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25620F4A8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25620F4B8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25620F4C8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25620F4D8()
{
  return MEMORY[0x270F9FC90]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F1B710]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x270F1B718]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CommunicationsSetupUIBundle()
{
  return MEMORY[0x270F18408]();
}

uint64_t IMCloudKitGetSyncStateDictionary()
{
  return MEMORY[0x270F3D038]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x270F3CD38]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x270F3D080]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

uint64_t IMPreferredAccountForService()
{
  return MEMORY[0x270F3CB20]();
}

uint64_t IMSharedHelperDeviceHasMultipleActiveSubscriptions()
{
  return MEMORY[0x270F3D0D8]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x270F3D0E0]();
}

uint64_t IMStringFromIMCloudKitSyncJobState()
{
  return MEMORY[0x270F3D108]();
}

uint64_t IMStringFromIMCloudKitSyncType()
{
  return MEMORY[0x270F3D110]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x270F3CEB0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x270EF2B10]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

uint64_t PSIsNanoMirroringDomain()
{
  return MEMORY[0x270F55240]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x270F3CF18]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CFB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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